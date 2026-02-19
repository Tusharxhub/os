# ! wap in shell to solve the problem .


#!      Process                   B.Time       A.T   
#!        A                        5           0
#!        B                        4           2
#!        C                        2           4
#!        D                        6           6

#! Calculate  the  Avg W.T
#! Calculate the Avg T.A


rocesses=(A B C D)
burst_times=(5 4 2 6)
arrival_times=(0 2 4 6)

current_time=0
total_wait=0
total_turnaround=0
count=${#processes[@]}

printf "%-8s %-8s %-8s %-8s %-8s\n" "Process" "B.Time" "A.T" "W.T" "T.A"

for i in "${!processes[@]}"; do
	p=${processes[$i]}
	bt=${burst_times[$i]}
	at=${arrival_times[$i]}

	if (( current_time < at )); then
		current_time=$at
	fi

	wait_time=$(( current_time - at ))
	turnaround_time=$(( wait_time + bt ))
	current_time=$(( current_time + bt ))

	total_wait=$(( total_wait + wait_time ))
	total_turnaround=$(( total_turnaround + turnaround_time ))

	printf "%-8s %-8d %-8d %-8d %-8d\n" "$p" "$bt" "$at" "$wait_time" "$turnaround_time"
done

avg_wait=$(awk -v tw="$total_wait" -v n="$count" 'BEGIN { printf "%.2f", tw/n }')
avg_turnaround=$(awk -v tt="$total_turnaround" -v n="$count" 'BEGIN { printf "%.2f", tt/n }')

printf "\nAvg W.T = %s\n" "$avg_wait"
printf "Avg T.A = %s\n" "$avg_turnaround"


# ?    How to compile and run the code
# *    1. Open your terminal.
# *    2. Navigate to the directory where the 2.sh file is located.
# *    3. Make sure the script has execute permissions. You can set the permissions
# *       using the command:
# *       chmod +x "Day 4/2.sh"
# *    4. Run the script using the command:
# *       "Day 4/2.sh"
# *    5. The output will display the scheduling results, including the average waiting time and average turnaround time for the given processes based on their burst times and arrival times.
# ?    Example Output
# *    =========================================
# *            Process   B.Time   A.T   W.T   T.A
# *    =========================================
# *       A       5       0      0     5    
# *       B       4       2      3     7    
# *       C       2       4      5     7    
# *       D       6       6      7     13   
# *    -----------------------------------------
# *    Avg W.T = 3.75
# *    Avg T.A = 8.00  

