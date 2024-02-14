sshDir="/persistent/home/wktl/.ssh"

read -r -p "请输入域名:" domain
mkdir -p $sshDir
scp -r root@$domain:~/ssh-backup/* $sshDir

sudo chown wktl:users $sshDir/*

chmod 400 $sshDir/id_isa

sudo chown -R wktl:users /home/wktl/Coding