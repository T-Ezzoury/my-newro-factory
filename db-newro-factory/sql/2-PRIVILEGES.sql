  #-----------------------------------
  #USER RIGHTS MANAGEMENT
  #-----------------------------------
  CREATE USER 'adminnewro'@'127.0.0.1' IDENTIFIED BY 'Qwerty1234';

  GRANT ALL PRIVILEGES ON `newro-factory-db`.* TO 'adminnewro'@'127.0.0.1' WITH GRANT OPTION;

  FLUSH PRIVILEGES;
