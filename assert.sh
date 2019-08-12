#!/bin/bash


function addStats {
    if [[ "$1" == "error" ]]; then
        echo "${@:2}" >> .shunit/error
        destroyTest
    else
        echo "${@:2}" >> .shunit/pass
    fi
}

# $1 and $2 should be the same
function AssertEquals {
        if [[ "$1" != "$2" ]]; then
                echo -e "${RED}ERROR${NC}: expected $1, but got $2 instead"
                addStats "error" "Error: expected $1, but got $2 instead"
                exit 1
        else
                echo -e "${GREEN}PASS${NC}: $1 and $2 are equal"
                addStats "pass" "Pass: $1 and $2 are equal"
        fi
}

function AssertFileEquals {
    success=0
    diff "$1" "$2" 1>/dev/null && success="1"
    if [[ "$success" == "0" ]]; then
                echo -e "${RED}ERROR${NC}: File $1 and File $2 are not equal"
                addStats "error" "Error: $1 and $2 are not equal"
                exit 1
    else
                echo -e "${GREEN}PASS${NC}: Files are equal"
                addStats "pass" "Pass: Files are equal"
    fi
}

function AssertContains {
        if [[ "$1" == *"$2"* ]]; then
                echo -e "${GREEN}PASS${NC}: Substring $2 found"
                addStats "pass" "Pass: Substring $2 found"
        else
                echo -e "${RED}ERROR${NC}: Substring $2 not found in $1 "
                addStats "error" "Error: Substring not found"
                exit 1
        fi
}

function AssertFileContains {
    success=0
    grep -E "$2" "$1" 1>/dev/null && success="1"
    if [[ "$success" == "0" ]]; then
                echo -e "${RED}ERROR${NC}: Could not find $2 in $1"
                addStats "error" "Error: could not find string in file"
                exit 1
    else
                echo -e "${GREEN}PASS${NC}: Substring found in $1"
                addStats "pass" "Pass: Substring $1 found"
    fi
}

function AssertExists {
    if [[ ! -f "$1" ]] && [[ ! -d "$1" ]]; then
        echo -e "${RED}ERROR${NC}: $1 is not a file/directory"
        addStats "error" "Error: $1 is not a file/directory"
        exit 1
    else
        echo -e "${GREEN}PASS${NC}: $1 exists"
        addStats "pass" "Pass: $1 exists"
    fi
}

function AssertTrue {
    success=0
    eval $@ && success=1
    if [[ "$success" == "1" ]]; then
        echo -e "${GREEN}PASS${NC}: $@ evaluated to true"
        addStats "pass" "Pass: $@ evaluated to true"
    else
        echo -e "${RED}ERROR${NC}: $@ evaluated to false"
        addStats "error" "Error: $@ evaluated to false"
        exit 1
    fi
}

function Assert {
    if [[ "$1" == "1" ]]; then
        echo -e "${RED}ERROR${NC}: $2"
        addStats "error" "Error: $2"
        exit 1
    else
        echo -e "${GREEN}PASS${NC}: $2"
        addStats "pass" "Pass: $2"
    fi
}
