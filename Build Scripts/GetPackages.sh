#!/bin/bash
#
# The script downloads all the required packages one by one.
# Downloaded packages are found in ../Packages




if [ ! -d "../Packages" ]; then
mkdir ../Packages
fi

START=0
END="$(wc -l < wget-list)"
#Get the arguments
while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -s|--start)
    START="$2"
    shift # past argument
    ;;
    -e|--end)
    END="$2"
    shift # past argument
    ;;
    --default)
    DEFAULT=YES
    ;;
    *)
            # unknown option
    ;;
esac
shift # past argument or value
done

awk "NR>=${START}&&NR<=${END}" wget-list  >  req-wget
wget -i req-wget -P ../Packages

rm req-wget