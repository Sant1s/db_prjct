delimiter //
create trigger trg_after_insert_order
after insert on shop.заказ for each row
begin
    update shop.товар
    set количество_на_складе = количество_на_складе - new.количество
    where id = new.id_товара;
end;
//
delimiter;

delimiter //
create trigger trg_after_insert_supply
after insert on shop.поставки for each row
begin
    update shop.товар
    set количество_на_складе = количество_на_складе + new.количество
    where id = new.id_товара;
end;
//
delimiter;
