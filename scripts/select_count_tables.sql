select * from shop.клиент;

select id, имя, электронная_почта from shop.клиент where телефон like '%55%';

select * from shop.клиент order by имя asc;

select count(*) from shop.клиент;

select id, имя from shop.клиент where электронная_почта like '%@mail.ru'

select * from shop.товар where цена between 10000 and 50000;

select id, название, round(цена * 0.8, 2) as скидка from shop.товар where id in (3, 6, 10);

select * from shop.товар order by название desc;

select avg(цена) from shop.товар;

select min(цена) from shop.товар;

select * from shop.заказ where id_клиента = 4;

select * from shop.заказ where дата_заказа between '2022-03-15' and '2022-03-21';

select id_клиента, count(*) as количество_заказов from shop.заказ group by id_клиента;

select count(*) from shop.заказ join shop.клиент on shop.заказ.id_клиента = shop.клиент.id
where shop.клиент.имя = 'Иванов Иван Иванович';

select * from shop.заказ where количество > 2 and (id_товара = 8 or id_товара = 3);
select * from shop.поставки where количество < 10;

select id_товара, sum(количество) as количество_поставок from shop.поставки group by id_товара;

select * from shop.поставки where дата_поставки < '2023-03-27' order by дата_поставки asc;

select count(distinct id_товара) from shop.поставки;

select avg(количество) from shop.поставки;

select id_клиента, count(*) as количество from shop.заказ
group by id_клиента
having count(*) >= 1;

select id_товара, sum(количество) as количество_продаж from shop.заказ
group by id_товара
having sum(количество) > 2;

select id_товара, sum(количество) as количество_продаж from shop.заказ
group by id_товара
order by количество_продаж desc;

select * from shop.клиент
order by имя;

select id, sum(количество) over (partition by id) as финальное_количество,
sum(количество) over () as общее_количество
from shop.заказ;

select id, count(*) over (partition by id) as число_позиций
from shop.заказ
order by число_позиций desc;

select id_товара, count(*) over (partition by id_товара) as запас,
sum(count(*)) over (partition by null) as общий_запас,
100 * count(*) over (partition by id_товара) / sum(count(*)) over (partition by null) as процент
from shop.поставки
group by id_товара;
