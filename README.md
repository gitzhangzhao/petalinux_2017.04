# petalinux_2017.04
该Docker环境可以直接安装petalinux 2017.04，所需要的其他软件安装包以及环境变量都已安装配置好。

# usage
1. build
    ```dockerfile
    docker build -t name
    ```
2. docker run -it --name <name> -v <dir:dir> image /bin/bash
2. docker exec --user root -it name /bin/bash
2. 添加普通用户，推荐使用adduser命令
3. exit
4. docker exec --user user -it name /bin/bash
5. sudo dpkg-reconfigure locales
6. export LANG="en_US.UTF-8"
4. copy petalinux安装程序: petalinux-v2017.4-final-installer.run
5. install
    ```bash
    ./petalinux-v2017.4-final-installer.run dir
    ```
# 注意
1. 安装需要用普通用户安装，推荐 docker exec 启动
2. 注意 .bashrc 里 setting.sh 的位置是 petalinux 的安装目录
3. 不要用除bash外的其他shell

# enjoy it.
