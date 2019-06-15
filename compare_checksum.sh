#!/bin/bash


# Getting checksum type to use

read -p "Please insert 1, 256 or 512 according to the sha___sum you wish to use: " sha_type

sha_type_ns="${sha_type// /}"

if [ $sha_type_ns -eq 1 ]; then
    checksum_type="1"
elif [ $sha_type_ns -eq 256 ]; then
    checksum_type="256"
elif [ $sha_type_ns -eq 512 ]; then
    checksum_type="512"
else
    read -p "Please insert either 1, 256 or 512" sha_type
fi


# Getting filepath+name and generating it's checksum

read -p "Please enter filepath and name: " file

file_ns=" ${file// /} "

str1=`sha"$checksum_type"sum $file_ns | awk 'BEGIN {FS=" "}{print $1}'`
echo $str1

# Getting sha___sum confirmation value from user

read -p "Please enter confirmation sha"$checksum_type"sum: " str2


# Changing strings to lowercase

str1_l=` echo $str1 | tr A-Z a-z `

str2_l=` echo $str2 | tr A-Z a-z `


# Stripping strings = removing whitespaces

str1_l_ns=" ${str1_l// /} "

str2_l_ns=" ${str2_l// /} "


#Comparing strings

if [ " $str1_l_ns " == " $str2_l_ns " ]; then
    echo " Match "
else
    echo " No match "
fi


