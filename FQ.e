#!/usr/bin/expect -f
set timeout 60
while {1} {
    spawn ssh -g -D 7070 root@104.128.84.106 -p26920
    #spawn ssh -g -D 7070 root@138.128.218.113 -p26920
    #spawn ssh -g -D 7070 root@23.252.108.145 -p26920
    #spawn ssh -g -D 7070 root@138.128.215.130 -p26920
    expect { 
        "password:" { send "###############\r" }
    }
    interact {
        timeout 60 { send "" }
        eof { exp_continue }
    }
}
