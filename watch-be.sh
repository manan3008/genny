#!/bin/bash
becode=$1
watch -n 1 "mysql  -P 3310 -h 127.0.0.1 --user=genny  --password=password --table gennydb -e \"select code,created,IF(updated IS NULL,' ',updated) as Updated,IF(name IS NULL,' ',name) as vName,ELT( status+1,'ACTIVE','TEMPORARY','TEST','PENDING','DISABLED','ARCHIVED','PENDING_DELETE','DELETED')  as Status   from baseentity where code = '${becode}';\";mysql  -P 3310 -h 127.0.0.1 --user=genny  --password=password --table gennydb -e \"select attributecode,ATTRIBUTE_ID,created,IF(updated IS NULL,' ',updated) as Updated,IF(valueBoolean = 0,'FALSE',IF(valueBoolean IS NULL,' ','TRUE')) as vBool,IF(valueDouble IS NULL,' ',valueDouble) as vDouble,IF (valueInteger IS NULL,' ',valueInteger) as vInteger ,IF(valueDate IS NULL,' ',valueDate) as vDate ,IF(valueDateTime IS NULL,' ',valueDateTime) as vDateTime,CONCAT('(',SUBSTRING(valueString,1,75),')') as vString  from baseentity_attribute where baseentitycode = '${becode}';\"" 
