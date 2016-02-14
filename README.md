# Metasploit Oracle Client Install Script

Metasploit Framework client install script.

Download the [Oracle Client](http://www.oracle.com/technetwork/database/features/instant-client/index-097480.html) zip files and place the download zip files within the "oracle-packages" dir in the script root directory. 

        instantclient-basic-linux-*.zip
        instantclient-sqlplus-linux-*.zip
        instantclient-sdk-linux-*.zip

Run: 

```
./msf-oracle-client-installer.sh 
```

![Metasploit Oracle Install Script](https://i.imgur.com/BXw5VYC.gif)


## Test it works! 

``` 
msf > use auxiliary/admin/oracle/oracle_login 
msf auxiliary(oracle_login) > set rhost 127.0.0.1
rhost => 127.0.0.1
msf auxiliary(oracle_login) > run

[*] Starting brute force on 127.0.0.1:1521...
[*] Auxiliary module execution completed
msf auxiliary(oracle_login) > exit
``` 

### Metasploit Framework Oracle Working 

![Oracle Metasploit Working](https://i.imgur.com/z2FaqAi.png)

### Metasploit Framework Oracle Not Working 

![Oracle Metasploit Not Working](https://i.imgur.com/AfKWry1.png)

Enjoy ! 
