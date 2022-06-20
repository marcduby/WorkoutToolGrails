
-- get all the workout periods with at least one null workout description
select distinct wyear.name, wperiod.name, wweek.name
from wkt_day wday, wkt_workout wworkout, 
	wkt_week wweek, wkt_period wperiod, wkt_year wyear
where wyear.year_id = wperiod.year_id
	and wperiod.period_id = wweek.period_id
	and wweek.week_id = wday.week_id
	and wday.day_id = wworkout.day_id
	and wworkout.description = 'OFF'
order by wyear.name desc, wperiod.name, wweek.name;


select distinct wyear.name as year, wperiod.name as period, wweek.name as week
from wkt_day wday, wkt_workout wworkout, 
	wkt_week wweek, wkt_period wperiod, wkt_year wyear
where wyear.year_id = wperiod.year_id
	and wperiod.period_id = wweek.period_id
	and wweek.week_id = wday.week_id
	and wday.day_id = wworkout.day_id
	and wworkout.description = 'OFF'
    and wyear.name = 2004
order by wyear.name desc, wperiod.name, wweek.name;
