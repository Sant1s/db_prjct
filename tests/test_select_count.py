import sqlite3

conn = sqlite3.connect('pg_db.db')
cursor = conn.cursor()


def test_clients_with_more_than_1_orders():
    query = """
        select id_клиента, count(*) as количество from shop.заказ
        group by id_клиента
        having count(*) >= 1;
    """
    cursor.execute(query)
    result = cursor.fetchall()
    assert len(result) == 2  # Предположим, что у нас правильным ответом будет два клиента


def test_products_sold_more_than_2_times():
    query = """
        select id_товара, count(*) as количество_продаж from shop.заказ
        group by id_товара
        having sum(количество) > 2;
    """
    cursor.execute(query)
    result = cursor.fetchall()
    assert len(result) == 3  # Предпологаем, что у нас правильным ответом будет 3 товара


def test_most_popular_product():
    query = """
        select id_товара, sum(количество) as количество_продаж from shop.заказ
        group by id_товара
        order by количество_продаж desc;
    """
    cursor.execute(query)
    result = cursor.fetchall()
    assert len(result) == 3  # Предпологаем, что у нас правильным ответом будет 3 товара
    assert result[0][0] == 2  # Предпологаем, что у нас правильным ответом будет 2


def test_clients_in_alphabet_order():
    query = """
        select * from shop.клиент
        order by имя;
    """
    cursor.execute(query)
    result = cursor.fetchall()
    assert len(result) == 4  # Предпологаем, что у нас правильным ответом будет 4 клиента
    assert result[0][1] == 'Юлия'  # Предпологаем, что у нас первый клиент имеет имя 'Юлия'


conn.close()
