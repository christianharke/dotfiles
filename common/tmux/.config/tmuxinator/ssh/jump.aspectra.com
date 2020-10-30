Host jump.aspectra.com
  User blcchha
  PubkeyAuthentication no
  ControlMaster auto
  ControlPath ~/.ssh/sockets/%r@%h-%p
  ControlPersist 600
