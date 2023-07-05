#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"
# --tuples-only: Turn off printing of column names and result row count footers.

echo -e "\n~~~~~ MY SALON ~~~~~\n"

SERVICE_MENU() {
  if [[ $1 ]]
  then echo -e "$1"
  fi

  SERVICE_LIST=$($PSQL "SELECT service_id, name FROM services")

  echo "$SERVICE_LIST" | while IFS=" | " read SERVICE_ID NAME
  do echo "$SERVICE_ID) $NAME"
  done

  read SERVICE_ID_SELECTED

  SERVICE_NAME_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_NAME_SELECTED ]]
  then SERVICE_MENU "\nI could not find that service. What would you like today?"
  else CUSTOMER_INFORMATION
  fi
}

CUSTOMER_INFORMATION() {
  echo "What's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo "I don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
  fi
  INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")


  echo "What time would you like your $SERVICE_NAME_SELECTED, $CUSTOMER_NAME?"
  read SERVICE_TIME
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME'")
  INSERT_APPOINTMENTS_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  echo "I have put you down for a $SERVICE_NAME_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."
}

echo -e "Welcome to My Salon, how can I help you?\n"

SERVICE_MENU