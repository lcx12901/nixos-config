{
  time.timeZone = "Asia/Shanghai";
  networking.timeServers = ["ntp.tuna.tsinghua.edu.cn" "cn.ntp.org.cn" "cn.pool.ntp.org"];
  services.chrony.enable = true;
}
