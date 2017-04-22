#!/usr/bin/env bash

# Author: Pavel Hrebicek (xhrebi04)
# Tests for PRL - 3 Project

RED='\033[0;31m'
GREEN='\033[0;32m'
YEL='\033[0;33m'
NC='\033[0m' # No Color
total=0
ok=0

chmod u+x test.sh

echo "Starting testing..."
echo "***********************************************"

for (( i=1; i<=16; i++ ))
do
	((total++))
	cp tests/mat1_$i ./mat1
	cp tests/mat2_$i ./mat2
 
	./test.sh > tests/test$i.temp
	diff tests/test$i.temp tests/test$i.out
	if [ "$?" == "0" ]
		then
			echo -e "[TEST $i] ${GREEN}OK${NC}"
			((ok++))
			rm tests/test$i.temp
		else
			echo -e "[TEST $i] ${RED}BAD${NC}"
		fi
		echo -e "\033[0m-----------"
done

echo "***********************************************"
echo -e "FINISHED TESTING:"
echo -e "OK/TOTAL: ${ok}/${total}"

if [ "$ok" == "$total" ]
  then
    echo -e "[${GREEN}SUCCESSFUL${NC}]"
   else
    echo -e "[${RED}FAILED${NC}]"
fi

rm -f mm
rm -f mat1
rm -f mat2

