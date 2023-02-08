PASSWORD := letmein
IMAGE := gvenzl/oracle-xe:full-faststart

initdb:
	docker run --rm --name oracle -p 1521:1521 -e ORACLE_PASSWORD=$(PASSWORD) -v $(PWD)/dump:/tmp/dump -v $(PWD)/sample-data:/container-entrypoint-initdb.d $(IMAGE) | tee initdb.txt
	# https://github.com/gvenzl/oci-oracle-xe#startup-scripts goes further

connect:
	sqlplus SYSTEM/$(PASSWORD)@localhost:1521/XE

testconnect:
	docker exec -it oracle sqlplus test/test@localhost:1521/XEPDB1

sqlplus:
	docker run -it --entrypoint sqlplus gvenzl/oracle-xe:21-slim-faststart

resetpassword:
	docker exec oracle resetPassword $(PASSWORD)

exportdata:
	chmod 777 dump
	docker exec -it oracle bash -c "sqlplus -S SYSTEM/letmein@localhost/XEPDB1 @/tmp/dump/setup.sql"
	docker exec oracle expdp test/test@XEPDB1 dumpfile=export.dmp directory=DUMP_DIR logfile=export.log CONTENT=ALL

dmp2sql: clean exportdata
	docker exec oracle impdp test/test@XEPDB1 dumpfile=export.dmp directory=DUMP_DIR sqlfile=ddl.sql

sqlcl: # based on sample-data
	docker run --rm --link oracle -it container-registry.oracle.com/database/sqlcl:latest test/test@oracle:1521/XEPDB1

shell:
	docker exec -it oracle /bin/sh

clean:
	rm -f dump/*.log dump/*.dmp dump/ddl.sql
