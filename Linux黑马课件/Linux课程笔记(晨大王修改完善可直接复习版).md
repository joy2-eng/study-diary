# Linux基础命令



## Linux的目录结构

![image-20221027214128453](https://image-set.oss-cn-zhangjiakou.aliyuncs.com/img-out/2022/10/27/20221027214128.png)

- `/`，根目录是最顶级的目录了
- Linux只有一个顶级目录：`/`
- 路径描述的层次关系同样适用`/`来表示
- /home/itheima/a.txt，表示根目录下的home文件夹内有itheima文件夹，内有a.txt

- . 当前、.. 上一级、~ 家、/ 根、- 上一次



## ls命令

功能：列出文件夹信息

语法：`ls [-l -h -a] [参数]`

- 参数：被查看的文件夹，不提供参数，表示查看当前工作目录
- -l，以列表形式查看
- -h，配合-l，以更加人性化的方式显示文件大小
- -a，显示隐藏文件



### 隐藏文件、文件夹

在Linux中以`.`开头的，均是隐藏的。

默认不显示出来，需要`-a`选项才可查看到。



## pwd命令

功能：展示当前工作目录

语法：`pwd`



## cd命令

功能：切换工作目录

语法：`cd [目标目录]`

参数：目标目录，要切换去的地方，不提供默认切换到`当前登录用户HOME目录`



## HOME目录

每一个用户在Linux系统中都有自己的专属工作目录，称之为HOME目录。

- 普通用户的HOME目录，默认在：`/home/用户名`

- root用户的HOME目录，在：`/root`



FinalShell登陆终端后，默认的工作目录就是用户的HOME目录



## 相对路径、绝对路径

- 相对路径，==非==`/`开头的称之为相对路径

  相对路径表示以`当前目录`作为起点，去描述路径，如`test/a.txt`，表示当前工作目录内的test文件夹内的a.txt文件

- 绝对路径，==以==`/`开头的称之为绝对路径

  绝对路径从`根`开始描述路径



## 特殊路径符

- `.`，表示当前，比如./a.txt，表示当前文件夹内的`a.txt`文件
- `..`，表示上级目录，比如`../`表示上级目录，`../../`表示上级的上级目录
- `~`，表示用户的HOME目录，比如`cd ~`，即可切回用户HOME目录



## mkdir命令

功能：创建文件夹

语法：`mkdir [-p] 参数`

- 参数：被创建文件夹的路径
- 选项：-p，可选，表示创建前置路径



## touch命令

功能：创建文件

语法：`touch 参数`

- 参数：被创建的文件路径



## cat命令

功能：查看文件内容

语法：`cat 参数`

- 参数：被查看的文件路径



## more命令

功能：查看文件，可以支持翻页查看

语法：`more 参数`

- 参数：被查看的文件路径
- 在查看过程中：
  - `空格`键翻页
  - `q`退出查看



## cp命令

功能：复制文件、文件夹

语法：`cp [-r] 参数1 参数2`

- 参数1，被复制的
- 参数2，要复制去的地方
- 选项：-r，可选，复制文件夹使用

示例：

- cp a.txt b.txt，复制当前目录下a.txt为b.txt
- cp a.txt test/，复制当前目录a.txt到test文件夹内
- cp -r test test2，复制文件夹test到当前文件夹内为test2存在



## mv命令

功能：移动文件、文件夹

语法：`mv 参数1 参数2`

- 参数1：被移动的
- 参数2：要移动去的地方，参数2如果不存在，则会进行改名（所以可以在不改变位置下进行重命名）



## rm命令

功能：删除文件、文件夹

语法：`rm [-r -f] 参数...参数`

- 参数：支持多个，每一个表示被删除的，空格进行分隔
- 选项：-r，删除文件夹使用
- 选项：-f，强制删除，不会给出确认提示，一般root用户会用到
rm命令支持通配符*，用来做模糊匹配
*text 以text结尾的所用内容  text*以text开头 *text*包含text的内容



> rm命令很危险，一定要注意，特别是切换到root用户的时候。
可以通过su - root并输入密码临时切换到root用户，通过输入exit命令，退回普通用户



## which命令

功能：查看命令的程序本体文件路径

语法：`which 参数`

- 参数：被查看的命令



## find命令

功能：搜索文件

语法1按文件名搜索：`find 起始路径  -name  “参数”`  参数需要加双引号

- 路径，搜索的起始路径
- 参数，搜索的关键字，支持通配符*， 比如：`*`test表示搜索任意以test结尾的文件

语法2按文件大小搜索：`find 起始路径  -size  +|-n（k|M|G）` 

查找小于10kB的文件 find / -size -10k
查找大于100MB的文件 find / -size +100M



## grep命令（globle regular expression print）

功能：过滤关键字

语法：`grep [-n] “关键字” 文件路径`

- 选项-n，可选，表示在结果中显示匹配的行的行号。
- 参数，关键字，必填，表示过滤的关键字，带有空格或其它特殊符号，建议使用””将关键字包围起来
- 参数，文件路径，必填，表示要过滤内容的文件路径，可作为内容输入端口



> 参数文件路径，可以作为管道符的输入



## wc命令(word count)

功能：统计

语法：`wc [-c -m -l -w] 文件路径`

- 选项，-c，统计bytes数量
- 选项，-m，统计字符数量
- 选项，-l，统计行数
- 选项，-w，统计单词数量
- 参数，文件路径，被统计的文件，可作为内容输入端口
不加选项的话，出现的是行数，单词数，字节数

> 参数文件路径，可作为管道符的输入



## 管道符|

写法：`|`

功能：将符号左边的结果，作为符号右边的输入

示例：

`cat a.txt | grep itheima`，将cat a.txt的结果，作为grep命令的输入，用来过滤`itheima`关键字



可以支持嵌套：

`cat a.txt | grep itheima | grep itcast`



## echo命令 类似于printf

功能：输出内容

语法：`echo 输出的内容`

- 参数：被输出的内容



## `反引号

功能：被两个反引号包围的内容，会作为命令执行

示例：

- echo `pwd`，会输出当前工作目录



## tail命令

功能：查看文件尾部内容

语法：``tail [-f] [-n num] 文件路径`

- 参数：被查看的文件
- 选项：-f，持续跟踪文件修改
- 选项：-n num 表示查查看尾部多少行，不写则默认十行


## 重定向符

功能：将符号左边的结果，输出到右边指定的文件中去

- `>`，表示覆盖输出
- `>>`，表示追加输出



## head命令

功能：查看文件头部内容

语法：`head [-n] 参数`

- 参数：被查看的文件
- 选项：-n，查看的行数







## vi编辑器

进入（vi+filename）————>命令模式————>退出（wq）
命令模式————>输入模式（i a o）————>命令模式（ESC）
命令模式————>底线命令模式（：）————>命令模式（命令以回车结束运行）

vim 文件路径
·如果文件路径表示的文件不存在，拿了此命令会用于编辑新文件
·如果文件表示的文件存在，那么此命令用于编辑已有的文件

vim的多个快捷键见ppt或下面的网址

### 命令模式快捷键

![image-20221027215841573](https://image-set.oss-cn-zhangjiakou.aliyuncs.com/img-out/2022/10/27/20221027215841.png)

![image-20221027215846581](https://image-set.oss-cn-zhangjiakou.aliyuncs.com/img-out/2022/10/27/20221027215846.png)

![image-20221027215849668](https://image-set.oss-cn-zhangjiakou.aliyuncs.com/img-out/2022/10/27/20221027215849.png)

### 底线命令快捷键

![image-20221027215858967](https://image-set.oss-cn-zhangjiakou.aliyuncs.com/img-out/2022/10/27/20221027215858.png)




### 查看命令的帮助

可以通过：`命令 --help`查看命令的帮助手册

![image-20221027220005610](https://image-set.oss-cn-zhangjiakou.aliyuncs.com/img-out/2022/10/27/20221027220005.png)

### 查看命令的详细手册

可以通过：`man 命令`查看某命令的详细手册

![image-20221027220009949](https://image-set.oss-cn-zhangjiakou.aliyuncs.com/img-out/2022/10/27/20221027220010.png)



## 用户和用户组

linux系统中可以：
·配置多个用户
·配置多个用户组
·用户可以加入多个用户组
方便对用户和用户组的权限控制

### 以下命令都需要在root用户下执行
用户组：
1.创建用户组
`groupadd 用户组名`
2.删除用户组
`groupdel 用户组名`
用户：
1.创建用户`useradd [-m -g -d ] 用户名`
`-m创建HOME目录，加上-m才可以在/home目录中找到新创建的用户名
·-g制定用户加入的组，不指定-g，自动创建同名组并加入
·-d制定用户HOME路径，不指定HOME路径默认在：/home/用户名
2.删除用户`userdel [-r] 用户名`
·-r彻底删除用户和其中的数据，不使用-r，删除用户，HOME目录及数据保留
3.查看用户 `id [用户名]`
查看某用户信息，默认为当前用户
4.用户移动` usermod -aG 用户组 用户名`
将指定用户名迁移到指定用户组
系统中用户/用户组信息
1.`getent passwd` 查看系统中全部用户信息
每个用户包含七个信息：用户名：密码：用户ID：组ID：描述信息（无用）：HOME目录/执行终端（默认bash）
2.`getent group` 查看系统全部组的信息


## 权限控制信息
第三章ppt第24页

## chmod命令(change mod)
使用chmod修改文件，文件夹的权限信息
注意，只有文件，文件夹的所属用户或root用户可以修改
语法，`chmod [-R] 权限 文件或文件夹`
·选项-R ，对文件夹内的全部内容应用相同的操作
例如:
··chmod u=rwx,g=wx,o=x test.txt  将文件权限改为rwx_wx__x
u=user,g=group,o=other
··chmod -R u=rwx,g=wx,o=x test 将文件和文件夹内全部内容权限设置为rwx_wx__x

此外，权限部分可以简写为二进制”chmod u=rwx,g=rx,o=x test.txt“==”chmod 751 test.txt“


## chown命令（change owner）
修改文件/文件夹的用户和用户组，只适用root用户
语法，`chown [-R] [用户][:][用户组] 文件或文件夹`
··-R，同上chmod
··用户，修改为此用户
··用户组，修改为所属用户组
··：用于分隔用户和用户组 
 



## 各类快捷键
1.ctrl+c 强制停止、
2.ctrl+d 退出账户登录（exit）或是退出某些特定程序的专属页面
3.history 查看历史输入过的命令
4.！+history中某个命令的序号，直接执行此命令
5.ctrl+r 输入内容去匹配历史命令（还有一种是加管道符history |grep group //这样就能显示所有使用过且带group的命令）
6.ctrl+a|e 光标移动到命令开始或结尾
7.ctrl+<-|->  左右跳单词
8.ctrl+l 清空终端窗口




# Linux常用操作

## 软件安装/卸载/搜索

- CentOS系统使用：（软件安装包格式.rpm）
  -` yum [install remove search] [-y] 软件名称`
    - install 安装
    - remove 卸载
    - search 搜索
    - -y，自动确认
- Ubuntu系统使用:(格式.deb)
  - `apt [install remove search] [-y] 软件名称`
    - install 安装
    - remove 卸载
    - search 搜索
    - -y，自动确认

> yum 和 apt 均需要root权限



## systemctl(system control)

功能：控制系统服务的启动关闭等
系统内置服务均可以被systemctl控制，第三方软件去过自动注册了系统服务就可以被systemctl控制，如果没有自动注册，可以手动注册（后续学习）

语法：`systemctl start | stop | restart | disable | enable | status 服务名`

- start，启动
- stop，停止
- status，查看状态
- disable，关闭开机自启
- enable，开启开机自启
- restart，重启



## 软链接ln（link）

功能：创建文件、文件夹软链接（快捷方式）

语法：`ln -s 参数1 参数2`

- 参数1：被链接的
- 参数2：要链接去的地方（快捷方式的名称和存放位置）

例如，ls -s /etc/yum.conf ~/yum.conf，会在~/中创建一个名为yum.conf的软连接



## 日期

通过date命令在命令行中查看系统的时间
语法：`date [-d] [+格式化字符串]`

- -d 按照给定的字符串显示日期，一般用于日期计算

- 格式化字符串：通过特定的字符串标记，来控制显示的日期格式
  - %Y   年%y   年份后两位数字 (00..99)
  - %m   月份 (01..12)
  - %d   日 (01..31)
  - %H   小时 (00..23)
  - %M   分钟 (00..59)
  - %S   秒 (00..60)
  - %s   自 1970-01-01 00:00:00 UTC 到现在的秒数



示例：

- 按照2022-01-01的格式显示日期

  ![image-20221027220514640](https://image-set.oss-cn-zhangjiakou.aliyuncs.com/img-out/2022/10/27/20221027220514.png)

- 按照2022-01-01 10:00:00的格式显示日期

  ![image-20221027220525625](https://image-set.oss-cn-zhangjiakou.aliyuncs.com/img-out/2022/10/27/20221027220525.png)

- -d选项日期计算

  ![image-20221027220429831](https://image-set.oss-cn-zhangjiakou.aliyuncs.com/img-out/2022/10/27/20221027220429.png)

  - 支持的时间标记为：

    ![image-20221027220449312](https://image-set.oss-cn-zhangjiakou.aliyuncs.com/img-out/2022/10/27/20221027220449.png)





## 时区

修改时区为中国时区

![image-20221027220554654](https://image-set.oss-cn-zhangjiakou.aliyuncs.com/img-out/2022/10/27/20221027220554.png)



## ntp

功能：同步时间

安装：`yum install -y ntp`

启动管理：`systemctl start | stop | restart | status | disable | enable ntpd`



手动校准时间：`ntpdate -u ntp.aliyun.com`



## ip地址

格式：a.b.c.d

- abcd为0~255的数字



特殊IP：

- 127.0.0.1，表示本机
- 0.0.0.0
  - 可以表示本机
  - 可以在端口绑定中用来确定绑定关系
  - 也可以表示任意IP（看使用场景），如放行规则设置为0.0.0.0，表示允许任何IP访问



查看ip：`ifconfig`



## 主机名

功能：Linux系统的名称

查看主机名：`hostname`

设置主机名：`hostnamectl set-hostname 主机名`

## 域名解析
可以通过主机名找到对应计算机的IP地址，这就是主机名映射（域名解析）
通过先查看本机的记录（私人地址本）（这样就可以自己去配置），没有找到再联网去DNS服务器询问




## 配置VMware固定IP

1. 修改VMware网络，参阅PPT，图太多

2. 设置Linux内部固定IP

   修改文件：`/etc/sysconfig/network-scripts/ifcfg-ens33`

   示例文件内容：

   ```shell
   TYPE="Ethernet"
   PROXY_METHOD="none"
   BROWSER_ONLY="no"
   BOOTPROTO="static"			# 改为static，固定IP
   DEFROUTE="yes"
   IPV4_FAILURE_FATAL="no"
   IPV6INIT="yes"
   IPV6_AUTOCONF="yes"
   IPV6_DEFROUTE="yes"
   IPV6_FAILURE_FATAL="no"
   IPV6_ADDR_GEN_MODE="stable-privacy"
   NAME="ens33"
   UUID="1b0011cb-0d2e-4eaa-8a11-af7d50ebc876"
   DEVICE="ens33"
   ONBOOT="yes"
   IPADDR="192.168.88.131"		# IP地址，自己设置，要匹配网络范围
   NETMASK="255.255.255.0"		# 子网掩码，固定写法255.255.255.0
   GATEWAY="192.168.88.2"		# 网关，要和VMware中配置的一致
   DNS1="192.168.88.2"			# DNS1服务器，和网关一致即可
   ```



## ping命令

可以通过ping命令，检查指定的网络服务器是否是可联通的

语法：`ping [-c num] 参数`

![image-20221027221129782](https://image-set.oss-cn-zhangjiakou.aliyuncs.com/img-out/2022/10/27/20221027221129.png)




## wget命令
非交互式的文件下载器，可以在命令行内下载网络文件

语法：`wget [-b] 下载链接（URL）`
选项，-b，后台下载，会将日志写入到当前工作目录的wget-log文件
URL，表示同一资源定位符



## curl命令(client URL)
可以用于发送http网络请求，可用于：下载文件，获取信息等

语法：`curl [-O] url`
·选项：-O，用于文件下载，保存文件，就相当于wget命令了。

![image-20221027221201079](https://image-set.oss-cn-zhangjiakou.aliyuncs.com/img-out/2022/10/27/20221027221201.png)

![image-20221027221210518](https://image-set.oss-cn-zhangjiakou.aliyuncs.com/img-out/2022/10/27/20221027221210.png)




## 端口
是设备与外界通讯交流的出入口。可以分为物理端口和虚拟端口两类。
·物理端口就是各种接口
·虚拟端口：是指计算机内部的端口，用来操作系统和外部进行交互使用
想连接一台计算机的某个程序，不仅需要计算机的ip地址（小区），还需要这个程序的端口（门牌号）。

Linux系统可以支持65535个端口，分三类进行使用：
·公认端口：1~1023，通常用于一些系统内置或知名程序的预留使用，如SSH服务的22端口
··注册端口：1024~49151，可以随意使用，松散的绑定一些程序/服务
···动态端口：49152~65535，通常不会固定绑定，程序向外发送连接时也需要一个端口，这是就会临时使用一个

可以通过nmap命令查看端口占用情况
语法：`nmap ip地址`



## netstat命令（netwok statistics）

功能：查看端口占用

用法：`netstat -anp | grep xxx`  anp（all numeric process）






## ps命令（process status）

功能：查看进程信息

语法：`ps -ef`，查看全部进程信息，可以搭配grep做过滤：`ps -ef | grep xxx`

UID 进程所属的用户ID
PID 进程的进程号
PPID 父ID（启动此进程的其他程序）
C 此进程的CPU占用率
STIME 进程启动时间
TTY 启动此进程的终端信号，如显示？表示非终端启动
TIME 进程占用CPU的时间
CMD 启动路径/启动命令



## kill命令
通过kill命令关闭进程

语法：`kill [-9] 进程ID`
·选项-9表示强制关闭
![image-20221027221303037](https://image-set.oss-cn-zhangjiakou.aliyuncs.com/img-out/2022/10/27/20221027221303.png)




# 主机状态监控
·top 看cpu 内存 进程实时占用资源，看谁吃的多
··df 看磁盘容量，已用，剩余
···iostaat 看磁盘现在读写忙不忙，读写快不快
····sar 历史统计，看过去的系统情况
## top命令（table of processes）

功能：查看CPU，内存使用情况，默认5秒刷新一次

语法：`top`，查看基础信息，有很多选项和交互式运行按键，需要时搜索

可用选项：
![image-20221027221340729](https://image-set.oss-cn-zhangjiakou.aliyuncs.com/img-out/2022/10/27/20221027221340.png)



交互式模式中，可用快捷键： 
![image-20221027221354137](https://image-set.oss-cn-zhangjiakou.aliyuncs.com/img-out/2022/10/27/20221027221354.png)



## df命令（disk free）

查看磁盘占用情况
语法：`df [-h]`
 ··选项-h以更加人性化的单位显示

![image-20221027221413787](https://image-set.oss-cn-zhangjiakou.aliyuncs.com/img-out/2022/10/27/20221027221413.png)



## iostat命令(input/output statistics)

查看CPU、磁盘的相关信息
语法：`iostat [-x] [nums1] [nums2]`
·选项-x显示更多信息
··nums1 刷新间隔
···nums2 刷新几次

几个常用数据：rkb/s 每秒发送到设备的读取请求数
             wkb/s 每秒发送到设备的写入请求数
             %util 磁盘利用率

![image-20221027221439990](https://image-set.oss-cn-zhangjiakou.aliyuncs.com/img-out/2022/10/27/20221027221440.png)

![image-20221027221514237](https://image-set.oss-cn-zhangjiakou.aliyuncs.com/img-out/2022/10/27/20221027221514.png)



## sar命令(system activity reporter)

查看网络统计
固定语法：sar -n DEV nums1 nums2
重点关注的信息有两个：rxKB/s 每秒钟接收的数据包大小，单位KB
                    txKB/s 每秒钟发送的数据包大小，单位KB

![image-20221027221545822](https://image-set.oss-cn-zhangjiakou.aliyuncs.com/img-out/2022/10/27/20221027221545.png)



## 环境变量
 环境变量是一组信息记录，类型是KeyValue（名称=值），用于操作系统运行时记录关键信息

- 临时配置 ：`export 变量名=变量值`
- 永久设置：
  - 针对当前用户生效，配置在当前用户的 `~/.bashrc`文件中
  - 针对全局所有用户生效，配置在系统的  `/etc/profile`文件中
  - 最后通过语法：`source 配置文件`立刻生效，或重新登录FinalShell生效(重新打开终端)

  语法：`env` 查看环境变量

## $符号
可以取出指定的环境变量的值

语法：`$变量名`

示例：

`echo $PATH`，输出PATH环境变量的值

`echo ${PATH}ABC`，输出PATH环境变量的值以及ABC

如果变量名和其它内容混淆在一起，可以使用${}

### PATH变量
查看PATH：`env | grep PATH `或`echo $PATH`

记录了执行程序的搜索路径

可以将自定义路径加入PATH内，实现自定义命令在任意地方均可执行的效果，例如想加入文件/root/myenv，`vim /etc/profile --> export PATH=$PATH:/root/myenv`  我在ubuntu的sc001账号中做了一个now命令，可以去查看复习



## rz sz命令（linux和Windows互传文件）
语法：`rz` 弹出文件，选择上传
      `sz 文件` 进行文件下载



## tar命令 压缩解压（tape archive）
常见的两个压缩格式：
- .tar，称为tarball，只是对文件进行简单的封装，没有太多的体积减小
- .gz，也常见为.tar.gz，利用gzip压缩算法将文件压缩到一个文件内，体积大幅减小。

tar命令可以通过不同的选项组合，将文件压缩成任一格式，同时可以解压

语法：`tar [-c -v -x -f -z -C] 参数1 参数2 ... 参数N`

- -c, 创建压缩文件，用于封装文件
- -v, 显示压缩、解压过程，用于查看进度
- -x, 解压模式
- -f, 要创建的文件，或要解压的文件，-f选项必须在所有选项中位置处于最后一个
- -z, gzip模式，不使用-z就是普通的tarball格式
- -C, 选择解压的目的地，用于解压模式

### 压缩
常用tar压缩的组合：
-- 将1.txt 2.txt 3.txt压缩到test.tar文件内
·· `tar -cvf test.tar 1.txt 2.txt 3.txt`

-- 将1.txt 2.txt 3.txt压缩到test.tar.gz文件内,使用gzip模式
·· `tar -zcvf test.tar.gz 1.txt 2.txt 3.txt`

注意：-z选项如果使用，放在选项第一位
      -f选项`必须`在选项位最后一个

### 解压
常用的tar解压组合：
-- 解压test.tar到当前工作目录
·· tar -xvf test.tar
-- 解压test.tar到指定目录（/home/sc001/桌面）
·· tar -xvf test.tar -C /home/sc001/桌面
-- 以gzip模式解压test.gz到指定目录（/home/sc001/桌面）
·· tar -zxvf test.gz -C /home/sc001/桌面

-f 必须在选项最后一位
-z 在选项第一位
-C 必须单独使用，和解压所需的其他参数分开


## zip unzip命令
可以使用zip命令，压缩文件为zip压缩包
语法 ： `zip [-r] 参数1 参数2 ...`
·· 选项-r 被压缩的包含文件夹时需要，tar命令没有
例如， zip -r test.zip test.txt hello.txt test

unzip命令用于解压zip压缩包
语法：`unzip 压缩包 [-d] [目标地址]`
·· 选项-d 指定要解压去的位置，同tar的-C选项
例如，unzip test.zip -d /home/sc001



## su命令

切换用户

语法：`su [-] [用户]`

![image-20221027222021619](https://image-set.oss-cn-zhangjiakou.aliyuncs.com/img-out/2022/10/27/20221027222021.png)



## sudo命令

![image-20221027222035337](https://image-set.oss-cn-zhangjiakou.aliyuncs.com/img-out/2022/10/27/20221027222035.png)



比如：

```shell
itheima ALL=(ALL)       NOPASSWD: ALL
```

在visudo内配置如上内容，可以让itheima用户，无需密码直接使用`sudo`



## chmod命令

修改文件、文件夹权限



语法：`chmod [-R] 权限 参数`

- 权限，要设置的权限，比如755，表示：`rwxr-xr-x`

  ![image-20221027222157276](https://image-set.oss-cn-zhangjiakou.aliyuncs.com/img-out/2022/10/27/20221027222157.png)

- 参数，被修改的文件、文件夹

- 选项-R，设置文件夹和其内部全部内容一样生效



## chown命令

修改文件、文件夹所属用户、组



语法：`chown [-R] [用户][:][用户组] 文件或文件夹`

![image-20221027222326192](https://image-set.oss-cn-zhangjiakou.aliyuncs.com/img-out/2022/10/27/20221027222326.png)



## 用户组管理

![image-20221027222354498](https://image-set.oss-cn-zhangjiakou.aliyuncs.com/img-out/2022/10/27/20221027222354.png)



## 用户管理

![image-20221027222407618](https://image-set.oss-cn-zhangjiakou.aliyuncs.com/img-out/2022/10/27/20221027222407.png)


