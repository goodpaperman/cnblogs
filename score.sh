#! /bin/sh
day=$(date +"%Y-%m-%d")
data=$(curl -s 'https://www.cnblogs.com/goodcitizen/ajax/sidecolumn.aspx' | grep 'liScore' -A 6 | sed -n -e 3p -e 7p)
score=$(echo $data | sed -n 1p)
rank=$(echo $data | sed -n 2p)
echo "$day $score $rank" >> score.txt
git add score.txt
git commit -m "udpate score"
git push
