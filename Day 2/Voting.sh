# ! wap in shell to check whether a person is eligible for Voting.

read -r -p "Enter your age: " age
[[ $age =~ ^[0-9]+$ ]] || { echo "Invalid input. Please enter a valid age."; exit 1; }
(( age >= 18 )) && echo "You are eligible to vote." || echo "You are not eligible to vote."


#?    How to compile and run the code
#*    1. Open your terminal.
#*    2. Navigate to the directory where the Voting.sh file is located.
#*    3. Make sure the script has execute permissions. You can set the permissions using the command:
#*       chmod +x "Day 2/Voting.sh"
#*    4. Run the script using the command:
#*       "Day 2/Voting.sh"
#*    5. Follow the on-screen prompt to enter your age and see whether you
#*       are eligible to vote or not.
#?    Example Output
#*    Enter your age: 20
#*    You are eligible to vote.
#*    Enter your age: 16
#*    You are not eligible to vote.
