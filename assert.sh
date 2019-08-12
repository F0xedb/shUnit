#!/bin/bash


function addStats {
    if [[ "$1" == "error" ]]; then
        echo "$2" >> .shunit/error
    else
        echo "$2" >> .shunit/pass
    fi
}

# $1 and $2 should be the same
function AssertEquals {
        if [[ "$1" != "$2" ]]; then
                echo -e "${RED}ERROR${NC}: expected $1, but got $2 instead"
                addStats "error" "Error: expected $1, but got $2 instead"
                exit 1
        else
                echo -e "${GREEN}PASS${NC}: $3"
                addStats "pass" "$1 and $2 are equal"
        fi
}
