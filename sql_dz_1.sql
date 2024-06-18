Базовые возможности SQL. ДЗ.

Задание 1
-- Написать запрос по шаблону, к демонстрационной базе данных, использовать любую таблицу на ваше усмотрение, главный критерий код запроса должен быть рабочим 
и возвращать строки, код запроса приложить в качестве результата выполненого ДЗ, самостоятельно код запроса выполнить и проанализировать результат.  




1. demo=> select flight_no, arrival_airport from flights;

 flight_no | arrival_airport 
-----------+-----------------
 PG0405    | LED
 PG0404    | LED
 PG0405    | LED
 PG0402    | LED
 PG0405    | LED
 PG0404    | LED
 PG0403    | LED
 PG0402    | LED
 PG0405    | LED
....

2. demo=> select distinct model, range from aircrafts;

        model        | range 
---------------------+-------
 Airbus A319-100     |  6700
 Airbus A320-200     |  5700
 Cessna 208 Caravan  |  1200
 Sukhoi SuperJet-100 |  3000
 Boeing 777-300      | 11100
 Bombardier CRJ-200  |  2700
 Airbus A321-200     |  5600
 Boeing 737-300      |  4200
 Boeing 767-300      |  7900
(9 rows)

3. demo=> select airport_code, airport_name, city
from bookings.airports
where timezone = 'Europe/Moscow';

 airport_code |   airport_name   |       city       
--------------+------------------+------------------
 NBC          | Бегишево         | Нижнекамск
 NAL          | Нальчик          | Нальчик
 OGZ          | Беслан           | Владикавказ
 CSY          | Чебоксары        | Чебоксары
 URS          | Курск-Восточный  | Курск
 SKX          | Саранск          | Саранск
...

4. select airport_code, airport_name, city from bookings.airports where (timezone = 'Europe/Moscow' AND latitude > 50) OR city = 'Нягань';

 airport_code |  airport_name   |      city       
--------------+-----------------+-----------------
 NBC          | Бегишево        | Нижнекамск
 CSY          | Чебоксары       | Чебоксары
 NYA          | Нягань          | Нягань
...

5. demo=> select airport_code, airport_name, city from airports where city in ('Воркута', 'Воронеж');

 airport_code | airport_name |  city   
--------------+--------------+---------
 VKT          | Воркута      | Воркута
 VOZ          | Воронеж      | Воронеж

6. demo=> select ticket_no, passenger_id, passenger_name from tickets where ticket_no between '0005432000988' and '0005432000996';

   ticket_no   | passenger_id |   passenger_name    
---------------+--------------+---------------------
 0005432000988 | 8499 420203  | EVGENIYA ALEKSEEVA
 0005432000989 | 1011 752484  | ARTUR GERASIMOV
 0005432000990 | 4849 400049  | ALINA VOLKOVA
 0005432000991 | 6615 976589  | MAKSIM ZHUKOV
 0005432000992 | 2021 652719  | NIKOLAY EGOROV
 0005432000993 | 0817 363231  | TATYANA KUZNECOVA
 0005432000994 | 2883 989356  | IRINA ANTONOVA
 0005432000995 | 3097 995546  | VALENTINA KUZNECOVA
 0005432000996 | 6866 920231  | POLINA ZHURAVLEVA
(9 rows)

7. select passenger_name from tickets where passenger_name like '%KUZNECOV%';

    passenger_name    
----------------------
 TATYANA KUZNECOVA
 VALENTINA KUZNECOVA
 ALEKSANDR KUZNECOV
 DENIS KUZNECOV
 ...

8. select ticket_no, flight_id, boarding_no from boarding_passes where seat_no = '2F' order by flight_id ASC, boarding_no DESC; 

   ticket_no   | flight_id | boarding_no 
---------------+-----------+-------------
 0005432261133 |         1 |           2
 0005432817560 |         3 |           4
 0005432261254 |        21 |           5
...

9. demo=> select SUM(total_amount) from bookings where book_date between '2016-09-02 02:12:00+03' and ' 2016-09-26 05:30:00+03' group by total_amount;
     sum      
--------------
    437700.00
   5785200.00
....

10. demo=> select COUNT(city) from airports where city = 'Мирный';
 count 
-------
     1

11. select SUM(total_amount)
 from bookings 
 where book_date between '2016-09-02 02:12:00+03' and ' 2016-09-26 05:30:00+03' 
 group by total_amount 
 having SUM(total_amount) > 2340000.00;

     sum      
--------------
   5785200.00
  18547200.00
   7438600.00
  10784400.00
   4899200.00
...

Задание 2
Аналогично предыдущему заданию, по шаблонам написать рабочие запросы к демонстрационной базе данных.

1. demo=> CREATE TABLE myNewtable (
    col1 INT,              
    col2 VARCHAR(100) NOT NULL,  
    col3 DATE,             
    col4 BOOLEAN,         
    PRIMARY KEY (col1)    
);
CREATE TABLE


2. demo=> create unique index myIndex on myNewTable (col1,col2, col3, col4);
CREATE INDEX


3. demo=> drop index myIndex;
DROP INDEX

4. demo=> \d myNewTable;
                    Table "public.mynewtable"
 Column |          Type          | Collation | Nullable | Default 
--------+------------------------+-----------+----------+---------
 col1   | integer                |           | not null | 
 col2   | character varying(100) |           | not null | 
 col3   | date                   |           |          | 
 col4   | boolean                |           |          | 
Indexes:
    "mynewtable_pkey" PRIMARY KEY, btree (col1)

5. demo=> truncate table myNewTable;
TRUNCATE TABLE

6. demo=> ALTER TABLE myNewTable ADD COLUMN newCol INT;
ALTER TABLE

7. demo=> ALTER TABLE myNewTable RENAME TO newTable;
ALTER TABLE

8. demo=> INSERT INTO newTable (col1, col2, col3, col4) 
VALUES (1, 'Value1', '2024-06-20', true),
       (2, 'Value2', '2024-06-21', false),
       (3, 'Value3', null, true);
INSERT 0 3

9. demo=> UPDATE newTable
SET col1 = 100, 
    col2 = 'UpdatedValue', 
    col4 = true
WHERE col1 = 1;
UPDATE 1

10. demo=> DELETE FROM newTable
WHERE col1 = 1;
DELETE 0

11. demo=> drop table newTable;
DROP TABLE
