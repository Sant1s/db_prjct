create schema if not exists shop

create table if not exists shop.клиент (
id INTEGER primary key,
имя VARCHAR(50),
адрес VARCHAR(100),
телефон VARCHAR(40),
электронная_почта VARCHAR(100)
);

create table if not exists shop.товар (
id INTEGER primary key,
название VARCHAR(50),
описание TEXT,
цена DECIMAL(10, 2),
количество_на_складе INTEGER
);

create table if not exists shop.заказ (
id INTEGER primary key,
id_клиента INTEGER,
id_товара INTEGER,
количество INTEGER,
дата_заказа DATE,
foreign key (id_клиента) references shop.клиент(id),
foreign key (id_товара) references shop.товар(id)
);

create table if not exists shop.поставки (
id INTEGER primary key,
id_товара INTEGER,
дата_поставки DATE,
количество INTEGER,
цена DECIMAL(10, 2),
foreign key (id_товара) references shop.товар(id)
);
