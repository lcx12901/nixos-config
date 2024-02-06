{
  security.pki.certificates = [(builtins.readFile ./unblockServer.cert)];
}