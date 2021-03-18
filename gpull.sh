#! /usr/bin/expect -f
set timeout 30
for {set i 0} {$i<=10} {incr i} {
    puts "start pulling git "
    spawn git pull origin master
    #Already up-to-date.
    #Already up to date.
    expect "Already up*to*date." { puts "pulling ok"; exit }
}
