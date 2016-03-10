#!/bin/bash

# Author: Arr0way 
# Metasploit Oracle 12.1 Client Installer 

##### (Cosmetic) Colour output
red=$(tput setaf 1)      # Issues/Errors
green=$(tput setaf 2)    # Success
yellow=$(tput setaf 3)   # Warnings/Information
blue=$(tput setaf 4)     # Heading
bold=$(tput bold  setaf 7)     # Highlight
reset=$(tput setaf 7)       # Normal

instdir=/opt/oracle/instantclient_12_1

mkdir -p /opt/oracle/
echo -e "${green}[*]${reset} Extracting instant-basic-linux to /opt/oracle/"
unzip -qq ./oracle-packages/instantclient-basic-linux.*.zip -d /opt/oracle/ || echo -e ' '${red}'[!] Error extracting instantclient-basic-linux'${reset} 1>&2

echo -e "${green}[*]${reset} Extracting instantclient-sdk-linux to /opt/oracle/"
unzip -qq ./oracle-packages/instantclient-sdk-linux.*.zip -d /opt/oracle/ || echo -e ' '${red}'[!] Error extracting instantclient-sdk-linux'${reset} 1>&2

echo -e "${green}[*]${reset} Extracting instantclient-basic-linux to /opt/oracle/"
unzip -qq ./oracle-packages/instantclient-sqlplus-linux.*.zip -d /opt/oracle/ || echo -e ' '${red}'[!] Error extracting instantclient-sqlplus-linux'${reset} 1>&2

if [ ! -f $instdir/libclntsh.so ]; then
    ln -sf $instdir/libclntsh.so.12.1 $instdir/libclntsh.so || echo -e ' '${red}'[!] Error creating symlink '${reset}
fi
# Configure environment variables in ~/.bashrc 
# If they don't already exist add them... 

echo -e "${green}[*]${reset} Configuring environment variables in ~/.bashrc"

grep -q -e '# ORACLE Stuff' ~/.bashrc || echo -e "# ORACLE Stuff" >> ~/.bashrc
grep -q -e 'PATH=$PATH:/opt/oracle/instantclient_12_1' ~/.bashrc || echo -e 'PATH=$PATH:/opt/oracle/instantclient_12_1' >> ~/.bashrc
grep -q -e 'SQLPATH=/opt/oracle/instantclient_12_1' ~/.bashrc || echo -e "SQLPATH=/opt/oracle/instantclient_12_1" >> ~/.bashrc
grep -q -e 'TNS_ADMIN=/opt/oracle/instantclient_12_1' ~/.bashrc || echo -e "TNS_ADMIN=/opt/oracle/instantclient_12_1" >> ~/.bashrc
grep -q -e 'LD_LIBRARY_PATH=/opt/oracle/instantclient_12_1' ~/.bashrc || echo -e "LD_LIBRARY_PATH=/opt/oracle/instantclient_12_1" >> ~/.bashrc
grep -q -e 'ORACLE_HOME=/opt/oracle/instantclient_12_1' ~/.bashrc || echo -e "ORACLE_HOME=/opt/oracle/instantclient_12_1" >> ~/.bashrc
grep -q -e '# Set path to correct version of ruby for metasploit' ~/.bashrc || echo -e "# Set path to correct version of ruby for metasploit" >> ~/.bashrc
grep -q -e 'PATH=/opt/metasploit/ruby/bin:$PATH' ~/.bashrc || echo -e 'PATH=/opt/metasploit/ruby/bin:$PATH'>> ~/.bashrc

# Set environment variables for current shell session 
echo -e "${green}[*]${reset} Setting ORACLE environment variables for current shell session"

# ORACLE
export PATH=$PATH:/opt/oracle/instantclient_12_1
export SQLPATH=/opt/oracle/instantclient_12_1
export TNS_ADMIN=/opt/oracle/instantclient_12_1
export LD_LIBRARY_PATH=/opt/oracle/instantclient_12_1
export ORACLE_HOME=/opt/oracle/instantclient_12_1
# Set path to correct version of ruby for metasploit
export PATH=/opt/metasploit/ruby/bin:$PATH

# Call ~/.bashrc
source ~/.bashrc

# Download ruby gem for ORACLE
echo -e "${green}[*]${reset} Downloading ruby-oci8-2.1.8.zip"
wget --progress=bar https://github.com/kubo/ruby-oci8/archive/ruby-oci8-2.1.8.zip -O /tmp/ruby-oci8-2.1.8.zip 

# Extract ruby gem for ORACLE in /opt/oracle/ 
echo -e "${green}[*]${reset} Extracting ruby-oci8-2.1.8.zip ~ /opt/oracle"
unzip -qq /tmp/ruby-oci8-2.1.8.zip -d /opt/oracle/

# Install build dependencies with apt-get 

echo -e "${green}[*]${reset} Extracting ruby-oci8-2.1.8.zip ~ /opt/oracle"
apt-get install libgmp-dev ruby-dev

# Set path to correct version of Ruby that MSF uses
echo -e "${green}[*]${reset} Build ruby-oci8-2.1.8"
cd /opt/oracle/ruby-oci8-ruby-oci8-2.1.8
make clean && make && make install

# Done
echo -e "

${green}[*]Install finished, test metasploit-framework${reset}"
