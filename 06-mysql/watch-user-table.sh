echo "> select Host,User,password_last_changed,authentication_string from user where User like 'v-%';"

mysql -uadmin -p$MYSQLPASS -D mysql -t -e "select Host,User,Password from user where User like 'v-%';" 2>/dev/null

