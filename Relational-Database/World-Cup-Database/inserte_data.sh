#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE TABLE games, teams")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS

do
  if [[ $YEAR != "year" ]]
  then

    WINNER_ID=$($PSQL "SELECT team_id FROM TEAMS WHERE name='$WINNER'")

    if [[ -z $WINNER_ID ]]
    then echo $($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
    fi

    WINNER_ID=$($PSQL "SELECT team_id FROM TEAMS WHERE name='$WINNER'")

    OPPONENT_ID=$($PSQL "SELECT team_id FROM TEAMS WHERE name='$OPPONENT'")

    if [[ -z $OPPONENT_ID ]]
    then echo $($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
    fi

    OPPONENT_ID=$($PSQL "SELECT team_id FROM TEAMS WHERE name='$OPPONENT'")

    echo $($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
  fi
done