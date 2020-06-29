#! /bin/sh
git pull origin master
day=$(date +"%Y-%m-%d")
last=$(cat ./score.txt | tail -1 | awk '{ print $1 }')
if [[ "$day" < "$last" ]] || [[ "$day" = "$last" ]]; then
    echo "has updated, skip"
    exit 0
fi

data=$(curl -s 'https://www.cnblogs.com/goodcitizen/ajax/sidecolumn.aspx' | grep 'liScore' -A 6 | sed -n -e 3p -e 7p)
score=$(echo $data | sed -n 1p)
rank=$(echo $data | sed -n 2p)
echo "$day $score $rank" >> score.txt
git add score.txt
git commit -m "udpate score"
git push origin master
