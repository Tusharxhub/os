# !     Process                   B.Time          FCFS/SJF
# !      A                          5
# !      B                          4
# !      C                          2
# !      D                          6

# ! calculate the Avg W.T
# ! calculate the Avg T.A.T

proc=(A B C D); bt=(5 4 2 6); n=${#proc[@]}

calc() {
  local -n b=$2 p=$3
  echo "=== $1 ==="; echo "Proc  BT  WT  TAT"
  local w=0 tw=0 tt=0
  for ((i=0;i<n;i++)); do
    t=$((w+b[i]))
    printf " %s    %d   %d   %d\n" "${p[i]}" "${b[i]}" $w $t
    tw=$((tw+w)); tt=$((tt+t)); w=$((w+b[i]))
  done
  echo "Avg WT = $(echo "scale=2;$tw/$n"|bc) | Avg TAT = $(echo "scale=2;$tt/$n"|bc)"
}

# FCFS
calc "FCFS" bt proc

# SJF - sort by burst time
sp=("${proc[@]}"); sb=("${bt[@]}")
for ((i=0;i<n-1;i++)); do
  m=$i
  for ((j=i+1;j<n;j++)); do ((sb[j]<sb[m]))&&m=$j; done
  t=${sb[i]};sb[i]=${sb[m]};sb[m]=$t
  t=${sp[i]};sp[i]=${sp[m]};sp[m]=$t
done
echo ""
calc "SJF" sb sp


# ?    How to compile and run the code
# *    1. Open your terminal.
# *    2. Navigate to the directory where the 1.sh file is located.
# *    3. Make sure the script has execute permissions. You can set the permissions
# *       using the command:
# *       chmod +x "Day 4/SVJ.sh"
# *    4. Run the script using the command:
# *       "Day 4/SVJ.sh"
# *    5. The output will display the scheduling results for both FCFS and SJF algorithms, including the average waiting time and average turnaround time for each scheduling method.
# ?    Example Output
# *    =========================================
# *            FCFS (First Come First Served)
# *    =========================================
# *    Process   B.T   W.T   T.A.T
# *    ---------+-----+-----+------
# *       A       5     0     5
# *       B       4     5     9
# *       C       2     9     11 
# *       D       6     11    17
# *    ---------+-----+-----+------
# *    Avg W.T  = 25 / 4 = 6.25 
# *    Avg T.A.T= 42 / 4 = 10.50
# *    =========================================
# *            SJF (Shortest Job First)
# *    =========================================
# *    Process   B.T   W.T   T.A.T
# *    ---------+-----+-----+------
# *       C       2     0     2
# *       B       4     2     6
# *       A       5     6     11
# *       D       6     11    17
# *    ---------+-----+-----+------
# *    Avg W.T  = 19 / 4 = 4.75
# *    Avg T.A.T= 36 / 4 = 9.00