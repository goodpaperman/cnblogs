#! /bin/sh
type expect >/dev/null 2>&1
has_expect=$?

if [ $has_expect -ne 0 ]; then
    # expect not installed
    git pull origin master
else
    ./gpull.sh
fi

day=$(date +"%Y-%m-%d")
last=$(cat ./score.txt | tail -1 | awk '{ print $1 }')
if [ "$day" \< "$last" -o "$day" = "$last" ]; then
    echo "has updated, skip"
    exit 0
fi

n=1
data=""
usr=$(cat user.txt)
while [ -z "${data}"  -a $n -lt 1000 ]; do
    now=$(date +"%H-%M-%S")
    echo "${now} [$n]: start query data at ${now}"
    data=$(curl -s "https://www.cnblogs.com/$usr/ajax/sidecolumn.aspx" | grep 'liScore' -A 6 | sed -n -e 3p -e 7p)
    now=$(date +"%H-%M-%S")
    echo "${now} [$n]: ${data}"
    n=$((n+1))
done

if [ $n -ge 1000 ]; then 
    echo "fatal error!"
    exit 1
fi

score=$(echo $data | sed -n 1p)
rank=$(echo $data | sed -n 2p)
echo "$day $score $rank" >> score.txt
git add score.txt

# force to calculate fit params & predicating values
./plot.sh "update_predicating_data"

# to prevent adding predicate_merge.data intermedia file
# git add predicate_*.data
git add predicate_binomial.data 
git add predicate_logarithm.data
git add predicate_reciprocal.data

git commit -m "udpate score"
if [ $has_expect -ne 0 ]; then 
    # expect not installed
    git push origin master
else
    ./gpush.sh
fi

echo "============================================================"
