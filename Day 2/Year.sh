# ! wap in shell to check whether the year is leap year or not.

read -r -p "Enter a year: " year
if [[ -z "$year" ]]; then
    echo "Please enter a valid year."
    exit 1
fi 
if ! [[ $year =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a valid year."
    exit 1
fi
if (( (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0) )); then
    echo "$year is a leap year."
else
    echo "$year is not a leap year."
fi


#?    How to compile and run the code
#*    1. Open your terminal.
#*    2. Navigate to the directory where the year.sh file is located.
#*    3. Make sure the script has execute permissions. You can set the permissions
#*       using the command:
#*       chmod +x "Day 2/Year.sh"
#*    4. Run the script using the command:
#*       "Day 2/Year.sh"
#*    5. Follow the on-screen prompt to enter a year and see whether it 
#*       is a leap year or not.
#?    Example Output
#*    Enter a year: 2020
#*    2020 is a leap year.

#*    Enter a year: 2021
#*    2021 is not a leap year