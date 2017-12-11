USE codeup_test_db;

DROP TABLE IF EXISTS pizza_orders;

CREATE TABLE pizza_orders (
  id                   INT UNSIGNED NOT NULL AUTO_INCREMENT,
  orderer_name         VARCHAR(100) NOT NULL,
  orderer_phone_number CHAR(10)              DEFAULT 'NONE',
  orderer_email        CHAR(30)              DEFAULT 'NONE',
  delivery_address     VARCHAR(1000)         DEFAULT 'NONe',
  pizza_size           CHAR(10)     NOT NULL,
  order_cost           DECIMAL(13, 2)        DEFAULT 0,
  order_description    CHAR(100),
  delivered            TINYINT               DEFAULT '0',
  time_of_order        DATETIME,
  time_of_delivery     DATETIME,
  PRIMARY KEY (id)
);