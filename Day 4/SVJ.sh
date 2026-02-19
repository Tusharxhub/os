
# !     Process                   B.Time          FCFS/SJF
# !      A                          5
# !      B                          4
# !      C                          2
# !      D                          6

# ! calculate the Avg W.T
# ! calculate the Avg T.A.T



# ---------- Process Data ----------
processes=("A" "B" "C" "D")
burst_time=(5 4 2 6)
n=${#processes[@]}

# ===================================
#        FCFS Scheduling
# ===================================
echo "========================================="
echo "        FCFS (First Come First Served)"
echo "========================================="
echo "Process   B.T   W.T   T.A.T"
echo "---------+-----+-----+------"

fcfs_wt=0
fcfs_tat=0
wait=0

for ((i=0; i<n; i++)); do
    tat=$((wait + burst_time[i]))
    printf "   %s       %d     %d     %d\n" "${processes[i]}" "${burst_time[i]}" "$wait" "$tat"
    fcfs_wt=$((fcfs_wt + wait))
    fcfs_tat=$((fcfs_tat + tat))
    wait=$((wait + burst_time[i]))
done

echo "---------+-----+-----+------"
echo "Avg W.T  = $fcfs_wt / $n = $(echo "scale=2; $fcfs_wt / $n" | bc)"
echo "Avg T.A.T= $fcfs_tat / $n = $(echo "scale=2; $fcfs_tat / $n" | bc)"

# ===================================
#        SJF Scheduling
# ===================================
echo ""
echo "========================================="
echo "        SJF (Shortest Job First)"
echo "========================================="

# Copy arrays and sort by burst time (selection sort)
sjf_proc=("${processes[@]}")
sjf_bt=("${burst_time[@]}")

for ((i=0; i<n-1; i++)); do
    min=$i
    for ((j=i+1; j<n; j++)); do
        if [ ${sjf_bt[j]} -lt ${sjf_bt[min]} ]; then
            min=$j
        fi
    done
    # Swap burst times
    temp=${sjf_bt[i]}
    sjf_bt[i]=${sjf_bt[min]}
    sjf_bt[min]=$temp
    # Swap process names
    temp=${sjf_proc[i]}
    sjf_proc[i]=${sjf_proc[min]}
    sjf_proc[min]=$temp
done

echo "Process   B.T   W.T   T.A.T"
echo "---------+-----+-----+------"

sjf_wt=0
sjf_tat=0
wait=0

for ((i=0; i<n; i++)); do
    tat=$((wait + sjf_bt[i]))
    printf "   %s       %d     %d     %d\n" "${sjf_proc[i]}" "${sjf_bt[i]}" "$wait" "$tat"
    sjf_wt=$((sjf_wt + wait))
    sjf_tat=$((sjf_tat + tat))
    wait=$((wait + sjf_bt[i]))
done

echo "---------+-----+-----+------"
echo "Avg W.T  = $sjf_wt / $n = $(echo "scale=2; $sjf_wt / $n" | bc)"
echo "Avg T.A.T= $sjf_tat / $n = $(echo "scale=2; $sjf_tat / $n" | bc)"
