update shop.клиент set телефон = '+7 (777) 777-77-77' where id = 10;

update shop.клиент set электронная_почта = 'petrov@gmail.com' where id = 5;

update shop.товар set цена = цена * 1.1 where id in (1, 4, 7);

update shop.товар set название = 'Монитор Samsung 24' where id = 8;

update shop.заказ set количество = 3 where id = 1;

update shop.заказ set дата_заказа = '2022-03-30' where id in (6, 7, 8);

update shop.поставки set количество = 20 where id_товара = 9;

update shop.поставки set дата_поставки = '2022-03-31' where дата_поставки < '2022-03-28';

delete from shop.клиент where id = 5;

delete from shop.клиент where имя = 'Козлова%';

delete from shop.товар where id = 5;

delete from shop.товар where цена < 27000;
