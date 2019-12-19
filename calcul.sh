#!/bin/bash

result=0
operator="+"


echo "1er nombre"
read nb1
echo "opérations (+,-,*,=)"
read operator
echo "2eme nombre"
read nb2


if [ $operator == "+" ]
then
  result=$(($nb1+$nb2)) 
fi
if [ $operator == "-" ]
then
  result=$(($nb1-$nb2))
fi
if [ $operator == "*" ]
then
  result=$(($nb1*$nb2))
fi
if [ $operator == "=" ]
then
  echo $result
  exit
fi
  
while [ "$operator" != "=" ]
do
  echo "opérations (+,-,*,=)"
  read operator

  if [ $operator == "=" ]
  then
    echo $result
    exit
  fi

  echo "nombre"
  read nb1
  if [ $operator == "+" ]
  then
    result=$(($result+$nb1)) 
  fi
  if [ $operator == "-" ]
  then
    result=$(($result-$nb1))
  fi
  if [ $operator == "*" ]
  then
    result=$(($result*$nb1))
  fi
done
