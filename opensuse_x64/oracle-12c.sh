
#------------ Oracle Database -------------------------
sudo apt-get install binutils gcc gcc-c++ glibc glibc-devel glibc-32bit ksh \
libaio1 libaio-devel libcap1 libstdc++-devel-32bit \
libstdc++48-devel libstdc++48-devel-32bit \
libstdc++6 libstdc++6-32bit  libstdc++6-devel-gcc5 \
libstdc++6-devel-gcc5-32bit libgcc_s1 libgcc_s1-32bit \
make sysstat xorg-x11-libs xorg-x11-libX11-ccache \
xdpyinfo xorg-x11-libXau xorg-x11-libxcb xorg-x11-libXext \
unixODBC-32bit unixODBC unixODBC-devel unixODBC-devel-32bit


apt-get install libstdc++5 libelf1 libelf-dev libaio1 libaio-dev sysstat elfutils lesstif2 libmotif4 libmotif-dev libtool numactl expat make unixodbc unixodbc-dev make gcc

#Permisos de grupo

sudo groupadd -g 54321 oinstall
sudo groupadd -g 54322 dba
sudo groupadd -g 54323 oper
sudo groupadd -g 54324 backupdba
sudo groupadd -g 54325 dgdba
sudo groupadd -g 54326 kmdba
sudo groupadd -g 54327 asmdba
sudo groupadd -g 54328 asmoper
sudo groupadd -g 54329 asmadmin
sudo useradd -u 54321 -g oinstall -G dba,asmdba,backupdba,dgdba,kmdba -m oracle
sudo passwd oracle
#escribir contraseña
#bases123
sudo mkdir -p /home/u01/app/oracle/product/12.2.0/dbhome_1
sudo chown -R oracle:oinstall /home/u01/
sudo chmod -R 775 /home/u01/

#Añadir a /etc/sysctl.conf

### menos de 4GB de RAM
fs.suid_dumpable = 1
fs.aio-max-nr = 1048576
fs.file-max = 6815744
kernel.shmall = 2097152
kernel.shmmax = 536870912
kernel.shmmni = 4096
kernel.sem = 250 32000 100 128
net.ipv4.ip_local_port_range = 9000 65500
net.core.rmem_default=4194304
net.core.rmem_max=4194304
net.core.wmem_default=262144
net.core.wmem_max=1048586

### mas de 4GB de RAM
fs.suid_dumpable = 1
fs.aio-max-nr = 1048576
fs.file-max = 6815744
kernel.shmall = 1073741824
kernel.shmmax = 4398046511104
kernel.shmmni = 4096 
kernel.sem = 250 32000 100 128
net.ipv4.ip_local_port_range = 9000 65500
net.core.rmem_default=4194304
net.core.rmem_max=4194304
net.core.wmem_default=262144
net.core.wmem_max=1048586


#aplicar cambios
/sbin/sysctl -p

#anadir a /etc/security/limits.conf
oracle              soft    nproc   2047
oracle              hard    nproc   16384
oracle              soft    nofile  1024
oracle              hard    nofile  65536
oracle              soft    stack   10240

#Hay logiarse como "su oracle" y seguir escribir esto
#añadir a /home/oracle/.bashrc


#oracle 12c 12.2.0
TMP=/tmp; export TMP
TMPDIR=$TMP; export TMPDIR
export TMPDIR ORACLE_HOSTNAME=linux-0ec6;
export ORACLE_HOSTNAME
ORACLE_UNQNAME=orcl;
export ORACLE_UNQNAME
ORACLE_BASE=/home/u01/app/oracle;
export ORACLE_BASE
ORACLE_HOME=$ORACLE_BASE/product/12.2.0/dbhome_1;
export ORACLE_HOME
ORACLE_SID=orcl;
export ORACLE_SID
PATH=/usr/sbin:$PATH;
export PATH
PATH=$ORACLE_HOME/bin:$PATH;
export PATH
LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/lib:/usr/lib64;
export LD_LIBRARY_PATH
CLASSPATH=$ORACLE_HOME/jlib:$ORACLE_HOME/rdbms/jlib;
export CLASSPATH
export TNS_ADMIN=$ORACLE_HOME/network/admin/;

#oracle 12c 12.1.0
TMP=/tmp; export TMP
TMPDIR=$TMP; export TMPDIR
export TMPDIR ORACLE_HOSTNAME=linux-0ec6;
export ORACLE_HOSTNAME
ORACLE_UNQNAME=orcl;
export ORACLE_UNQNAME
ORACLE_BASE=/home/u01/app/oracle;
export ORACLE_BASE
ORACLE_HOME=$ORACLE_BASE/product/12.1.0/dbhome_1;
export ORACLE_HOME
ORACLE_SID=orcl;
export ORACLE_SID
PATH=/usr/sbin:$PATH;
export PATH
PATH=$ORACLE_HOME/bin:$PATH;
export PATH
LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/lib:/usr/lib64;
export LD_LIBRARY_PATH
CLASSPATH=$ORACLE_HOME/jlib:$ORACLE_HOME/rdbms/jlib;
export CLASSPATH
export TNS_ADMIN=$ORACLE_HOME/network/admin/;


#oracle 11g
TMP=/tmp; export TMP
TMPDIR=$TMP; export TMPDIR
export TMPDIR ORACLE_HOSTNAME=linux-0ec6;
export ORACLE_HOSTNAME
ORACLE_UNQNAME=orcl;
export ORACLE_UNQNAME
ORACLE_BASE=/home/u01/app/oracle;
export ORACLE_BASE
ORACLE_HOME=$ORACLE_BASE/product/11.2.0/dbhome_1;
export ORACLE_HOME
ORACLE_SID=orcl;
export ORACLE_SID
PATH=/usr/sbin:$PATH;
export PATH
PATH=$ORACLE_HOME/bin:$PATH;
export PATH
LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/lib:/usr/lib;
export LD_LIBRARY_PATH
CLASSPATH=$ORACLE_HOME/jlib:$ORACLE_HOME/rdbms/jlib;
export CLASSPATH


#editar hostname /etc/hostname

#añadir a /etc/hosts
#127.0.1.1	linux-sywz


#sh /home/u01/app/oraInventory/orainstRoot.sh
#sh /home/u01/app/oracle/product/12.2.0/dbhome_1/root.sh


#Iniciar Oracle
#Escribe el comando "sqlplus username/password@database" para iniciar SQL Plus.
sqlplus sys/oracle@orcl as sysdba

#sqlplus myusername/mypassword@localhost
#sqlplus sys/oracle@orcl[linux-sywz]
#sqlplus sys/oracle@linux-sywz
sqlplus sys/oracle@orcl[linux-sywz] as sysdba


binutils glibc libgcc libstdc++ gcc gcc-c++ glibc glibc-devel ksh-93r libaio libaio-devel libelf make sysstat unixODBC unixODBC-devel openmotif openmotif-libs 