#!/bin/bash

./stop.sh


#find all the projects
rm -Rf ./rules/prj_*
#cp -rp ../prj_genny/rules/rulesCurrent ./rules/
#mkdir rules
for i in ` find .. -mindepth 1 -maxdepth 1 -type d | grep prj  | awk -F "/" '{ print $2 }'`;do
   mkdir ./rules/$i
   cp -rp ../$i/rules ./rules/$i/
  echo $i
done

customercode=${1}
mode=${2}
SEC1=`date +%s`
./run-setup.sh -p ${customercode} -r ${customercode} -n 10.123.123.123 ${mode}
SEC2=`date +%s`
DIFFSEC=`expr ${SEC2} - ${SEC1}`
echo Took ${DIFFSEC} seconds.
