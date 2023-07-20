create view v_статистика_продаж as
select
    t.id as id_товара,
    t.название as название_товара,
    sum(z.количество) as общее_количество_продаж,
    sum(z.количество * t.цена) as общая_сумма_продаж
from shop.товар t
join shop.заказ z on z.id_товара = t.id
group by t.id, t.название;

create view v_статистика_поставок as
select
    t.id as id_товара,
    t.название as название_товара,
    sum(p.количество) as общее_количество_поставок,
    sum(p.количество * p.цена) as общая_сумма_поставок
from shop.товар t
join shop.поставки p on p.id_товара = t.id
group by t.id, t.название;


create view v_статистика_клиентов as 
select
    k.id as id_клиента,
    k.имя as имя_клиента,
    count(z.id) as общее_количество_заказов,
    sum(z.количество) as общее_количество_товаров,
    sum(z.количество * t.цена) as общая_сумма_заказов
from shop.клиент k
join shop.заказ z on z.id_клиента = k.id
join shop.товар t on t.id = z.id_товара
group by k.id, k.имя;
