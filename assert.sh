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

function AssertFileEquals {
    diff "$1" "$2" || success="0" && success="1"
    if [[ "$success" == "0" ]]; then
                echo -e "${RED}ERROR${NC}: File $1 and File $2 are not equal"
                addStats "error" "Error: $1 and $2 are not equal"
                exit 1
    else
                echo -e "${GREEN}PASS${NC}: Files are equal"
    fi
}

function AssertContains {
        if [[ "$1" == *"$2"* ]]; then
                echo -e "${GREEN}PASS${NC}: Substring $2 found"
        else
                echo -e "${RED}ERROR${NC}: Substring $2 not found in $1 "
                addStats "error" "Error: Substring not found"
                exit 1
        fi
}

function AssertFileContains {
    grep -E "$2" "$1" || success="0" && success="1"
    if [[ "$success" == "0" ]]; then
                echo -e "${RED}ERROR${NC}: Could not find $2 in $1"
                addStats "error" "Error: could not find string in file"
                exit 1
    else
                echo -e "${GREEN}PASS${NC}: Substring found in $1"
    fi
}

function AssertExists {
    if [[ "$1" == "" || ! -f "$1" || ! -d "$1" ]]; then
        echo -e "${RED}ERROR${NC}: $1 is not a file/directory or an empty var"
        addStats "error" "Error: $1 is not a file/directory or variable"
        exit 1
    else
        echo -e "${GREEN}PASS${NC}: $1 exists"
    fi
}

function AssertTrue {
    if "$1"; then
        echo -e "${RED}ERROR${NC}: $2"
        addStats "error" "Error: $2"
        exit 1
    else
        echo -e "${GREEN}PASS${NC}: $2"
    fi
}

function Assert {
    if [[ "$1" == "1" ]]; then
        echo -e "${RED}ERROR${NC}: $2"
        addStats "error" "Error: $2"
        exit 1
    else
        echo -e "${GREEN}PASS${NC}: $2"
    fi
}
