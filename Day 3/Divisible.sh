# ! wap in shell to print all numbers divisible by 5 and 7 form 50 to 100.

for (( i=50; i<=100; i++ )); do
    (( i%5==0 && i%7==0 )) && echo "$i"
done


#?    How to compile and run the code
#*    1. Open your terminal.
#*    2. Navigate to the directory where the Divisible.sh file is located.
#*    3. Make sure the script has execute permissions. You can set the permissions 
#*       using the command:
#*       chmod +x "Day 3/Divisible.sh"
#*    4. Run the script using the command:
#*       "Day 3/Divisible.sh"
#*    5. The script will print all numbers divisible by 5 and 7 from 50 to 100.
#?    Example Output
#*    70
#*    85
#*    90
#*    100