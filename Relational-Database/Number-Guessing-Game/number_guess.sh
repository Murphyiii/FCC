#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

secret_number=$(($RANDOM % 1000 + 1))
# echo $secret_number

echo "Enter your username:"
read username
username_check=$($PSQL "select username from user_info where username='$username'")

if [[ -z $username_check ]]
then 
echo "Welcome, $username! It looks like this is your first time here."
insert_result=$($PSQL "insert into user_info(username, games_played, best_game_played) VALUES('$username', 0, 0)")
games_played=0
best_game=0
else
if [[ $username_check ]]
then
games_played=$($PSQL "select games_played from user_info where username='$username'")
best_game=$($PSQL "select best_game_played from user_info where username='$username'")
echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
fi
fi

echo "Guess the secret number between 1 and 1000:"
number_of_guesses=0

while read guess_attempt
do
  if [[ $guess_attempt =~ ^[0-9]+$ ]] && [[ ! -z $guess_attempt  ]] && (( $guess_attempt <= 1000 ))
  then
    num_of_guesses=$((number_of_guesses+=1))
    if [[ $guess_attempt = $secret_number ]]
    then
      echo "You guessed it in $number_of_guesses tries. The secret number was $secret_number. Nice job!"
      games_played=$((games_played+=1))
      update_result=$($PSQL "update user_info set games_played=$games_played where username='$username'")
      if [[ 0 = $best_game ]] || [[ $best_game>$num_of_guesses ]]
      then update_result=$($PSQL "update user_info set best_game_played=$num_of_guesses where username='$username'")
      fi
      break
    else
      if [[ $guess_attempt < $secret_number ]]
      then echo "It's higher than that, guess again:"
      else
      if [[ $guess_attempt > $secret_number ]]
      then echo "It's lower than that, guess again:"
      fi 
    fi
  fi
  else echo "That is not an integer, guess again:"
  fi
done
