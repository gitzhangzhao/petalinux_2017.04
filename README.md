# petalinux_2017.04
该Docker环境针对 petalinux 2017.04，所需要的其他软件安装包已安装好，只需要添加用户并稍作配置即可安装petalinux

# usage
1. build docker 镜像
    ```dockerfile
    docker build -t name
    ```
2. 运行 docker ，用 root 用户身份
    ```bash
    docker run -it --name <name> -v <dir:dir> --user root image /bin/bash
    ```
2. 使用 docker exec 命令启动 docker
    ```bash
    docker start name
    docker exec --user root -it name /bin/bash
    ```
4. 添加普通用户，推荐使用 adduser 命令
    ```bash
    adduser name
    ```
5. 修改 /etc/sudoers 文件，添加 sudo 权限

6. 退出 docker
8. 用普通用户身份启动 docker
    ```bash
    docker exec --user user -it name /bin/bash
    ```
5. 配置安装 locales， 均选择 en_US.UTF-8
    ```bash
    sudo dpkg-reconfigure locales
    ```
6. export LANG 环境变量为 en_US.UTF-8
    ```bash
    export LANG="en_US.UTF-8"
    ```
4. copy petalinux 安装程序: petalinux-v2017.4-final-installer.run
5. 执行 petalinux 的安装
    ```bash
    ./petalinux-v2017.4-final-installer.run dir
    ```
6. 添加 .bashrc ，例如：
    ```bash
    echo 'cd $HOME \n\
    export LANG=en_US.UTF-8 \n\
    source /home/zhangzh/petalinux/settings.sh \n\
    alias h="history|grep petalinux" \n\
    alias c="history|grep petalinux-creat" \n\
    alias p="history|grep petalinux-pa" \n\
    alias ..="cd .." \n\
    alias ...="cd .. && cd .." \n\
    alias cd..="cd .." \n\
    function creat(){ \n\
        petalinux-create --type project --template zynq --name $1 \n\
    } \n\
    function config(){ \n\
        petalinux-config --get-hw-description /mnt/vivado/test$1/test$1.sdk \n\
    } \n\
    function configk(){ \n\
        petalinux-config -c kernel \n\
    } \n\
    function configr(){ \n\
        petalinux-config  -c rootfs \n\
    } \n\
    function build(){ \n\
        petalinux-build \n\
    } \n\
    function package(){ \n\
        petalinux-package --boot --fsbl ./images/linux/zynq_fsbl.elf --fpga --u-boot --force \n\
    }' >> .bashrc
    ```

# 注意
1. 安装需要用普通用户安装，推荐 docker exec 启动
2. 注意 .bashrc 里 setting.sh 的位置是 petalinux 的安装目录
3. LANG=en_US.UTF-8，该环境变量必须每次登陆 export
4. 不要用除 bash 外的其他 shell
5. openjdk-8-jdk 必须安装，否则在 petalinux config 的时候会出现奇怪错误，经过验证，安装后正常
6. 建议使用 adduser 添加用户，不要使用 useradd

# BUGS
~~1. docker 运行2个月后会出现未知问题，表现是找不到 fsbl，配置会报错。目前无解决办法，重新安装。（近期未出现）~~

# enjoy it.
