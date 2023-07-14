#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# no args
if [[ -z $1 ]]
then echo "Please provide an element as an argument."
# have args
else 
  # if arg1 is atomic number
  if [[ $1 =~ ^[0-9]+$ ]]
  then ELEMENT=$($PSQL "SELECT * FROM elements WHERE atomic_number=$1")
  else
    # if arg1 is element symbol
    ELEMENT=$($PSQL "SELECT * FROM elements WHERE symbol='$1'")
    if [[ -z $ELEMENT ]]
    then
      # if arg1 is element name
      ELEMENT=$($PSQL "SELECT * FROM elements WHERE name='$1'")
    fi
  fi

  # if element is null
  if [[ -z $ELEMENT ]]
  then echo "I could not find that element in the database."
  # if element is not null
  else
    echo "$ELEMENT" | while IFS="|" read ATOMIC_NUMBER SYMBOL NAME
    do 
      ELEMENT_INFO=$($PSQL "SELECT t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius FROM properties p LEFT JOIN types t USING(type_id) WHERE p.atomic_number=$ATOMIC_NUMBER")
      echo "$ELEMENT_INFO" | while  IFS="|" read TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT
      do echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
      done
    done
  fi
fi
