#! /usr/bin/expect -f
set timeout 30
for {set i 0} {$i<=10} {incr i} {
    puts "start pushing git "
    spawn git push origin master
    expect "Everything up-to-date" { puts "pushing ok"; exit }
}
