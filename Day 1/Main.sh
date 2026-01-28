
# ! wap in shell to see the number is even or odd.



read -p "Enter an integer: " num
if (( num % 2 == 0 )); then
    echo "$num is even."
else
    echo "$num is odd."
fi



#?    How run the code
#*    1. Open your terminal.
#*    2. Navigate to the directory where the Main.sh file is located.
#*    3. Make sure the script has execute permissions. You can set the permissions using the command:
#*       chmod +x Main.sh
#*    4. Run the script using the command:
#*       bash "Day 1/Main.sh"
#*    5. Follow the on-screen prompt to enter an integer and see if it is even or odd.
#?    Example Output
#*    Enter an integer: 7
#*    7 is odd.
#*    Enter an integer: 10
#*    10 is even.
