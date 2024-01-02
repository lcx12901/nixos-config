{ config, ... }: {
  security.acme = {
    acceptTerms = true;
    defaults.email = "wktl1991504424@gmail.com";
    certs."nezuko.linx.top" = {
      domain = "*.nezuko.linx.top";
      dnsProvider = "cloudflare";
      credentialsFile = config.age.secrets."cloudflareGlobalApiKey.age".path;
    };
  };
}