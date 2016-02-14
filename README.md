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

Test it works by running msfconsole: 

