{ config, ... }: {
  security.acme = {
    acceptTerms = true;
    defaults.email = "wktl1991504424@gmail.com";
    certs."nezuko.lincx.top" = {
      domain = "*.nezuko.lincx.top";
      dnsProvider = "cloudflare";
      credentialsFile = config.age.secrets."cloudflareGlobalAPIKey.age".path;
    };
  };
}