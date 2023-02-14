#!/bin/zsh
echo

if [ -n $AWS_PROFILE ]
  then
    echo "Your current AWS profile is set to:  $AWS_PROFILE"
  else
    echo "You currently do not have an AWS profile set."
fi

echo

PROFILES_ARRAY=("${(@f)$(cat ~/.aws/config |grep profile|cut -d " " -f2|cut -d "]" -f1)}")
PROFILES_ARRAY_LENGTH=${#PROFILES_ARRAY[@]}

echo "Available profiles are:"
for ((i=1;i<$PROFILES_ARRAY_LENGTH+1;i+=1)); do echo "${i} - ${PROFILES_ARRAY[$i]}" ; done
echo
echo -n "Select which profile above that you want to use:  "
read PROFILE_SELECTION

export AWS_PROFILE=${PROFILES_ARRAY[$PROFILE_SELECTION]}

echo
echo "Your AWS profile has been set to ${PROFILES_ARRAY[$PROFILE_SELECTION]}.  "
echo
