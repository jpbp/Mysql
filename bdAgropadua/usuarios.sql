-- primeiro usuario

CREATE USER 'Joao'@'localhost' IDENTIFIED BY '0000';

grant update,select on  Agropadua.cliente to 'Joao' @'localhost';
grant update,select on  Agropadua.`Serviço` to 'Joao' @'localhost';
grant update,select on  Agropadua.fornecedor  to 'Joao' @'localhost';
revoke update on Agropadua.cliente from 'Joao' @'localhost';

revoke delete on  Agropadua.`Serviço` from 'Joao' @'localhost';

revoke select on  Agropadua.fornecedor from 'Joao' @'localhost';

FLUSH PRIVILEGES;

-- segundo usuario

CREATE USER 'Rafael'@'localhost' IDENTIFIED BY '0000';

GRANT ALL PRIVILEGES ON Agropadua.* TO 'Rafael'@'localhost';
GRANT ALL PRIVILEGES ON Agropadua TO 'Rafael'@'localhost';

REVOKE create ON Agropadua.* FROM 'Rafael'@'localhost';

REVOKE drop ON Agropadua.* FROM 'Rafael'@'localhost';

REVOKE insert ON Agropadua.cliente FROM 'Rafael'@'localhost';

FLUSH PRIVILEGES;


