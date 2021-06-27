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

usr=$(cat user.txt)
data=$(curl -s "https://www.cnblogs.com/$usr/ajax/sidecolumn.aspx" | grep 'liScore' -A 6 | sed -n -e 3p -e 7p)
score=$(echo $data | sed -n 1p)
rank=$(echo $data | sed -n 2p)
echo "$day $score $rank" >> score.txt
git add score.txt

## force to calculate fit params
#./plot.sh "update_fit_data"
#git add fit.data

git commit -m "udpate score"
if [ $has_expect -ne 0 ]; then 
    # expect not installed
    git push origin master
else
    ./gpush.sh
fi
