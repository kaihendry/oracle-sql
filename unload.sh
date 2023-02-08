# script to unload a table to insert statements

table=$1
test $table || exit 1


# create SQL file
sqlfile=dump/$table.sql

cat <<EOF > $sqlfile
set sqlformat insert;
select * from $table;
exit;
EOF

docker run --rm --link oracle -it \
	-v $PWD/dump:/tmp/ \
	container-registry.oracle.com/database/sqlcl:latest -S test/test@oracle:1521/XEPDB1 @/tmp/$table.sql | tee $table.sql

# if the line doesn't begin with Insert, remove it
sed -i '/^Insert/!d' $table.sql
