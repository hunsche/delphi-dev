#!/bin/bash

if [ "$DB_MIGRATE_ENABLE" == "true" ]; then
  migrate -path $DB_MIGRATE_PATH -database "$DB_DRIVER://$DB_HOST:$DB_PORT/$DB_DATABASE?sslmode=disable&password=$DB_PASSWORD&user=$DB_USER" up
fi

cp /etc/ems/objrepos/emsserver.ini /etc/ems/
sed -i 's/\[!DBINSTANCENAME\]/'"$RAD_SERVER_DB_INSTANCENAME"'/' /etc/ems/emsserver.ini
sed -i 's@\[!DBPATH\]@'"$RAD_SERVER_DB_PATH"'@' /etc/ems/emsserver.ini
sed -i 's/\[!DBUSERNAME\]/'"$RAD_SERVER_DB_USERNAME"'/' /etc/ems/emsserver.ini
sed -i 's/\[!DBPASSWORD\]/'"$RAD_SERVER_DB_PASSWORD"'/' /etc/ems/emsserver.ini
sed -i 's/\[!MASTERSECRET\]/'"$RAD_SERVER_MASTER_SECRET"'/' /etc/ems/emsserver.ini
sed -i 's/\[!APPSECRET\]/'"$RAD_SERVER_APP_SECRET"'/' /etc/ems/emsserver.ini
sed -i 's/\[!APPLICATIONID\]/'"$RAD_SERVER_APPLICATION_ID"'/' /etc/ems/emsserver.ini
sed -i 's/\[!SERVERPORT\]/'"$RAD_SERVER_SERVER_PORT"'/' /etc/ems/emsserver.ini
sed -i 's/\[!CONSOLEUSER\]/'"$RAD_SERVER_CONSOLE_USER"'/' /etc/ems/emsserver.ini
sed -i 's/\[!CONSOLEPASS\]/'"$RAD_SERVER_CONSOLE_PASS"'/' /etc/ems/emsserver.ini
sed -i 's/\[!CONSOLEPORT\]/'"$RAD_SERVER_CONSOLE_PORT"'/' /etc/ems/emsserver.ini
sed -i 's@\[!RESOURCESFILES\]@'"$RAD_SERVER_RESOURCES_FILES"'@' /etc/ems/emsserver.ini

if [ "$RAD_SERVER_CONSOLE" == "true" ]; then
  echo 'start' | ems-console 1> /dev/null & echo Rad Server Console Started!
fi

~/PAServer/paserver -password=$PA_SERVER_PASSWORD