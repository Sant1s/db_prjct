create index idx_client_id on shop.клиент (id);

create index idx_product_name on shop.товар (название);

create index idx_product_price on shop.товар (цена);

create index idx_order_client_id on shop.заказ (id_клиента);

create index idx_order_client_id_status on shop.заказ (id_клиента, дата_заказа);

create index idx_supply_product_id on shop.поставки (id_товара);
