

insert into wkt_year(name, name_text, insert_date, version) values(1990, '2022 gap -8/23/2021', sysdate(), 0);
update wkt_period set year_id = 30 where period_id = 339;


insert into wkt_period (name, name_text, year_id, version, insert_date) values(1, "2022 gap 08/23/2021", 0, 0, sysdate());

-- mysql> select * from wkt_period where name_text like '%gap%';
-- +-----------+------+---------------------+---------+--------+-------+-------------+---------------------+---------+
-- | period_id | name | name_text           | year_id | rating | notes | insert_date | last_update         | version |
-- +-----------+------+---------------------+---------+--------+-------+-------------+---------------------+---------+
-- |       339 | 1    | 2022 gap 08/23/2021 |       0 |      5 | NULL  | 2021-08-24  | 2021-08-24 22:32:28 |       0 |
-- +-----------+------+---------------------+---------+--------+-------+-------------+---------------------+---------+
-- 1 row in set (0.00 sec)


insert into wkt_week (name, name_text, period_id, version, insert_date) values(1, "2022 gap 08/23/2021", 0, 0, sysdate());
update wkt_week set period_id = 339 where week_id = 1353;


-- mysql> select * from wkt_week where name_text like '%gap%';
-- +---------+------+---------------------+-----------+--------+-------+-------------+---------------------+---------+
-- | week_id | name | name_text           | period_id | rating | notes | insert_date | last_update         | version |
-- +---------+------+---------------------+-----------+--------+-------+-------------+---------------------+---------+
-- |    1353 | 1    | 2022 gap 08/23/2021 |         0 |      5 | NULL  | 2021-08-24  | 2021-08-24 22:21:24 |       0 |
-- +---------+------+---------------------+-----------+--------+-------+-------------+---------------------+---------+
-- 1 row in set (0.00 sec)


insert into wkt_day (week_id, date, version, insert_date) values(1353, date_add('2021-08/23', interval 0 day), 0, sysdate());

-- mysql> select * from wkt_day where week_id = 1353;
-- +--------+---------+------------+------------+------+--------------+--------+-------------+---------------------+---------+
-- | day_id | week_id | date       | heart_rate | feel | sleep_amount | weight | insert_date | last_update         | version |
-- +--------+---------+------------+------------+------+--------------+--------+-------------+---------------------+---------+
-- |   9465 |    1353 | 2021-08-23 |       NULL | NULL |         NULL |   NULL | 2021-08-24  | 2021-08-24 22:24:50 |       0 |
-- +--------+---------+------------+------------+------+--------------+--------+-------------+---------------------+---------+
-- 1 row in set (0.00 sec)

-- mysql>

insert into wkt_workout (day_id, version, insert_date) values(9465, 0, sysdate());

-- mysql> select * from wkt_workout where day_id = 9465;
-- +------------+--------+-------------+--------+----------+---------------------+-------------+-----------------+---------+
-- | workout_id | day_id | description | rating | time     | last_update         | insert_date | workout_type_id | version |
-- +------------+--------+-------------+--------+----------+---------------------+-------------+-----------------+---------+
-- |      13878 |   9465 | OFF         |      5 | 08:00:00 | 2021-08-24 22:28:33 | 2021-08-24  |               1 |       0 |
-- +------------+--------+-------------+--------+----------+---------------------+-------------+-----------------+---------+
-- 1 row in set (0.00 sec)

-- mysql> 

insert into wkt_intensity (workout_id, version, insert_date) values(13878, 0, sysdate());
insert into wkt_activity (workout_id, version, insert_date) values(13878, 0, sysdate());


