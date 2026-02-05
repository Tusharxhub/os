# !  wap in shell to find factorial of a number.


read -r -p "Enter a number: " num
[[ $num =~ ^[0-9]+$ ]] || { echo "Invalid input."; exit 1; }
factorial=1
for (( i=1; i<=num; i++ )); do
    factorial=$((factorial * i))
done
echo "Factorial of $num is $factorial."


#?    How to compile and run the code
#*    1. Open your terminal.
#*    2. Navigate to the directory where the Factorial.sh file is located.
#*    3. Make sure the script has execute permissions. You can set the permissions
#*       using the command:
#*       chmod +x "Day 3/Factorial.sh"
#*    4. Run the script using the command:
#*       "Day 3/Factorial.sh"
#*    5. Follow the on-screen prompt to enter a number and see its factorial.
#?    Example Output
#*    Enter a number: 5
#*    Factorial of 5 is 120.
#*    Enter a number: -3
#*    Invalid input.
#*    Enter a number: 0
#*    Factorial of 0 is 1.