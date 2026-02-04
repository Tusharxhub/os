# ! Wap in shell to find Simple interest.

read -r -p "Enter the principal amount: " p
read -r -p "Enter the rate of interest: " r
read -r -p "Enter the time period: " t

[[ -n $p && -n $r && -n $t && $p =~ ^-?[0-9]+(\.[0-9]+)?$ && $r =~ ^-?[0-9]+(\.[0-9]+)?$ && $t =~ ^-?[0-9]+(\.[0-9]+)?$ ]] || {
    echo "Invalid input. Please enter valid numbers for principal, rate and time."
    exit 1
}

si=$(printf '%s\n' "scale=4; ($p * $r * $t) / 100" | bc)
echo "Simple Interest for principal amount $p, rate of interest $r% and time period $t years is $si"


#?    How to compile and run the code
#*    1. Open your terminal.
#*    2. Navigate to the directory where the Interest.sh file is located.
#*    3. Make sure the script has execute permissions. You can set the permissions using the command:
#*       chmod +x "Day 2/Interest.sh"
#*    4. Run the script using the command:
#*       "Day 2/Interest.sh"
#*    5. Follow the on-screen prompt to enter principal amount, rate of interest and time period to see the simple interest.
#?    Example Output
#*    Enter the principal amount: 1000
#*    Enter the rate of interest: 5
#*    Enter the time period: 3
#*    Simple Interest for principal amount 1000, rate of interest 5% and time period 3 years is 150.0000
