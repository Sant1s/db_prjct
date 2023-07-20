create or replace function shop.добавить_клиента (
  in p_имя varchar(50),
  in p_адрес varchar(100),
  in p_телефон varchar(40),
  in p_электронная_почта varchar(100)
)
returns void as $$
begin
  insert into shop.клиент (имя, адрес, телефон, электронная_почта)
  values (p_имя, p_адрес, p_телефон, p_электронная_почта);
end;
$$ language plpgsql;


create or replace function shop.обновить_информацию_о_товаре (
  in p_id integer,
  in p_название varchar(50),
  in p_описание text,
  in p_цена decimal(10, 2),
  in p_количество_на_складе integer
)
returns void as $$
begin
  update shop.товар
  set название = p_название,
      описание = p_описание,
      цена = p_цена,
      количество_на_складе = p_количество_на_складе
  where id = p_id;
end;
$$ language plpgsql;
