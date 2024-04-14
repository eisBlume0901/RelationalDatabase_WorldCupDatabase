#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
 if [[ $YEAR != "year" ]]
 then
  WINNING_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER' ")
  if [[ -z $WINNING_ID ]]
  then
    INSERT_WINNING_TEAMS=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER') ")
  fi 

  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT' ")
  if [[ -z  $OPPOSING_ID ]] 
  then
    INSERT_OPPOSING_TEAMS=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT') ")
  fi


  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER' ")
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT' ")
  INSERT_WINNER_IDS_GAMES=$($PSQL "INSERT INTO games(year, round, winner_id, winner_goals, opponent_id, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $WINNER_GOALS, $OPPONENT_ID, $OPPONENT_GOALS)")
 fi
done
