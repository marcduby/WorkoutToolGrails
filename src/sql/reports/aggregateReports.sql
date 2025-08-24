

-- total xski workouts and time ortdererd by time
select min(day.date), max(day.date), count(activity.x_ski) as count_workouts, 
	count(distinct day.date) as count_days, sum(activity.x_ski) as total_time, 
	truncate(sum(activity.x_ski)/count(activity.x_ski), 2) as avg_per_workout, 
	truncate(sum(activity.x_ski)/count(distinct day.date), 2) as avg_per_day, 
	year.name, year.year_id
from wkt_activity activity, wkt_day day, wkt_workout workout, 
	wkt_week week, wkt_period period, wkt_year year
where year.year_id = period.year_id
	and period.period_id = week.period_id
	and week.week_id = day.week_id
	and day.day_id = workout.day_id
	and workout.workout_id = activity.workout_id
	and activity.x_ski > 0
group by year.name, year.year_id
order by total_time;

-- total xski workouts and time ordered by year
select min(day.date), max(day.date), count(activity.x_ski) as count_workouts, 
	count(distinct day.date) as count_days, sum(activity.x_ski) as total_time, 
	truncate(sum(activity.x_ski)/count(activity.x_ski), 2) as avg_per_workout, 
	truncate(sum(activity.x_ski)/count(distinct day.date), 2) as avg_per_day, 
	year.name, year.year_id
from wkt_activity activity, wkt_day day, wkt_workout workout, 
	wkt_week week, wkt_period period, wkt_year year
where year.year_id = period.year_id
	and period.period_id = week.period_id
	and week.week_id = day.week_id
	and day.day_id = workout.day_id
	and workout.workout_id = activity.workout_id
	and activity.x_ski > 0
group by year.name, year.year_id
order by year.name;

select min(day.date), max(day.date), count(activity.x_ski) as count_workouts, 
	count(distinct day.date) as count_days, sum(activity.x_ski) as total_time, 
	truncate(sum(activity.x_ski)/count(activity.x_ski), 2) as avg_per_workout, 
	truncate(sum(activity.x_ski)/count(distinct day.date), 2) as avg_per_day, 
	year.name, year.year_id
from wkt_activity activity, wkt_day day, wkt_workout workout, 
	wkt_week week, wkt_period period, wkt_year year
where year.year_id = period.year_id
	and period.period_id = week.period_id
	and week.week_id = day.week_id
	and day.day_id = workout.day_id
	and workout.workout_id = activity.workout_id
	and activity.x_ski > 0
	and month(day.date) in (11, 12)
group by year.name, year.year_id
order by year.name;

	and cast(period.name as CHAR) in ('4', '5')

order by total_time;

-- total rowing workouts per training year
select min(day.date), max(day.date), count(activity.rowing) as count_workouts, 
	count(distinct day.date) as count_days, sum(activity.rowing) as total_time, 
	truncate(sum(activity.rowing)/count(activity.rowing), 2) as avg_per_workout, 
	truncate(sum(activity.rowing)/count(distinct day.date), 2) as avg_per_day, 
	year.name, year.year_id
from wkt_activity activity, wkt_day day, wkt_workout workout, 
	wkt_week week, wkt_period period, wkt_year year
where year.year_id = period.year_id
	and period.period_id = week.period_id
	and week.week_id = day.week_id
	and day.day_id = workout.day_id
	and workout.workout_id = activity.workout_id
	and activity.rowing > 0
group by year.name, year.year_id
order by total_time;

-- total rowing workouts per calendar year
select min(day.date), max(day.date), count(activity.rowing) as count_workouts, 
	count(distinct day.date) as count_days, sum(activity.rowing) as total_time, 
	truncate(sum(activity.rowing)/count(activity.rowing), 2) as avg_per_workout, 
	truncate(sum(activity.rowing)/count(distinct day.date), 2) as avg_per_day, 
	year(day.date) as year
from wkt_activity activity, wkt_day day, wkt_workout workout
where day.day_id = workout.day_id
	and workout.workout_id = activity.workout_id
	and activity.rowing > 0
group by year
order by year;

-- total rowing workouts per calendar year up to current day of year of query
select min(day.date), max(day.date), count(activity.rowing) as count_workouts, 
	count(distinct day.date) as count_days, sum(activity.rowing) as total_time, 
	truncate(sum(activity.rowing)/count(activity.rowing), 2) as avg_per_workout, 
	truncate(sum(activity.rowing)/count(distinct day.date), 2) as avg_per_day, 
	year(day.date) as year
from wkt_activity activity, wkt_day day, wkt_workout workout
where day.day_id = workout.day_id
	and workout.workout_id = activity.workout_id
	and activity.rowing > 0
	and dayofyear(day.date) <= dayofyear(sysdate())
group by year
order by year;

select avg(weight), year(date) as year_report
from wkt_day 
where weight > 1 and weight < 300
group by year(date)
order by year(date);


-- total rowing workouts per calendar year, month
select min(day.date), max(day.date), count(activity.rowing) as count_workouts, 
	count(distinct day.date) as count_days, sum(activity.rowing) as total_time, 
	truncate(sum(activity.rowing)/count(activity.rowing), 2) as avg_per_workout, 
	truncate(sum(activity.rowing)/count(distinct day.date), 2) as avg_per_day, 
	month(day.date) as month, year(day.date) as year
from wkt_activity activity, wkt_day day, wkt_workout workout
where day.day_id = workout.day_id
	and workout.workout_id = activity.workout_id
	and activity.rowing > 0
	and year(day.date) in (2022, 2021, 2012)
group by month, year
order by year, month;

-- total rowing workouts per calendar year up to current day of year
select min(day.date), max(day.date), count(activity.rowing) as count_workouts, 
	count(distinct day.date) as count_days, sum(activity.rowing) as total_time, 
	truncate(sum(activity.rowing)/count(activity.rowing), 2) as avg_per_workout, 
	truncate(sum(activity.rowing)/count(distinct day.date), 2) as avg_per_day, 
	year(day.date) as year
from wkt_activity activity, wkt_day day, wkt_workout workout
where day.day_id = workout.day_id
	and workout.workout_id = activity.workout_id
	and activity.rowing > 0
	and dayofyear(day.date) <= dayofyear(curdate())
group by year
order by year;

--	and month(day.date) < 11

-- total erg workouts per calendar year
select min(day.date), max(day.date), count(activity.erg) as count_workouts, 
	count(distinct day.date) as count_days, sum(activity.erg) as total_time, 
	truncate(sum(activity.erg)/count(activity.erg), 2) as avg_per_workout, 
	truncate(sum(activity.erg)/count(distinct day.date), 2) as avg_per_day, 
	year(day.date) as year
from wkt_activity activity, wkt_day day, wkt_workout workout
where day.day_id = workout.day_id
	and workout.workout_id = activity.workout_id
	and activity.erg > 0
group by year
order by year;

-- all rowing workouts for year
select day.date, activity.rowing, year(day.date) as year
from wkt_activity activity, wkt_day day, wkt_workout workout
where day.day_id = workout.day_id
	and workout.workout_id = activity.workout_id
	and activity.rowing > 0
	and year(day.date) = 2021
order by day.date;

-- all swimming workouts for year and month after september
select day.date, workout.description
from wkt_activity activity, wkt_day day, wkt_workout workout
where day.day_id = workout.day_id
	and workout.workout_id = activity.workout_id
	and activity.swim > 0
	and month(day.date) >= 9
order by day.date;

-- total swimming workouts per calendar year
select min(day.date), max(day.date), count(activity.swim) as count_workouts, 
	count(distinct day.date) as count_days, sum(activity.swim) as total_time, 
	truncate(sum(activity.swim)/count(activity.swim), 2) as avg_per_workout, 
	truncate(sum(activity.swim)/count(distinct day.date), 2) as avg_per_day, 
	year(day.date) as year
from wkt_activity activity, wkt_day day, wkt_workout workout
where day.day_id = workout.day_id
	and workout.workout_id = activity.workout_id
	and activity.swim > 0
group by year
order by year;


--	and lower(workout.description) like '%bantam%'
order by total_time;

select min(day.date), max(day.date), count(activity.activity_id) as count, 
	sum(activity.row) + sum(activity.erg) as total, 
	format((sum(activity.row) + sum(activity.erg))/count(activity.activity_id), 2) as avg, 
	year.name, year.year_id
from wkt_activity activity, wkt_day day, wkt_workout workout, 
	wkt_week week, wkt_period period, wkt_year year
where year.year_id = period.year_id
	and period.period_id = week.period_id
	and week.week_id = day.week_id
	and day.day_id = workout.day_id
	and workout.workout_id = activity.workout_id
	and (activity.row > 0 or activity.erg > 0)
group by year.name, year.year_id;



-- total down hill ski by year up to current day of year
select min(day.date), max(day.date), count(activity.activity_id) as total_ski, year.name as year
from wkt_activity activity, wkt_day day, wkt_workout workout, 
	wkt_week week, wkt_period period, wkt_year year
where year.year_id = period.year_id
	and period.period_id = week.period_id
	and week.week_id = day.week_id
	and day.day_id = workout.day_id
	and workout.workout_id = activity.workout_id
    and workout.workout_type_id = 31
	and month(day.date) in (11, 12)
group by year.name;

	and cast(period.name as CHAR) in ('4', '5')


-- total yoga by year
select count(activity.activity_id) as total_yoga, year.name as year
from wkt_activity activity, wkt_day day, wkt_workout workout, 
	wkt_week week, wkt_period period, wkt_year year
where year.year_id = period.year_id
	and period.period_id = week.period_id
	and week.week_id = day.week_id
	and day.day_id = workout.day_id
	and workout.workout_id = activity.workout_id
    and workout.workout_type_id = 29
group by year.name;


-- count of weeks with no entries per year
select count(week.week_id) as empty_weeks, year.name as year
from wkt_activity activity, wkt_day day, wkt_workout workout, 
	wkt_week week, wkt_period period, wkt_year year
where year.year_id = period.year_id
	and period.period_id = week.period_id
	and week.week_id = day.week_id
	and day.day_id = workout.day_id
	and workout.workout_id = activity.workout_id
	and (activity.rowing + activity.erg + activity.swim + activity.bike + activity.x_ski) = 0
group by year.name
order by year.name;


-- get kevin rate workouts
select w.workout_id, d.date, w.description
from wkt_workout w, wkt_day d 
where w.day_id = d.day_id 
and w.workout_type_id = 3 
order by d.date desc;

-- all 40' erg workout
select w.workout_id, d.date, w.description
from wkt_workout w, wkt_day d 
where w.day_id = d.day_id 
and w.workout_type_id = 4
and year(d.date) = 2004
order by d.date desc;





-- winter reports (xski, downhill)
-- total down hill ski by year
select min(day.date), max(day.date), count(activity.activity_id) as total_ski, year.name as year
from wkt_activity activity, wkt_day day, wkt_workout workout, 
	wkt_week week, wkt_period period, wkt_year year
where year.year_id = period.year_id
	and period.period_id = week.period_id
	and week.week_id = day.week_id
	and day.day_id = workout.day_id
	and workout.workout_id = activity.workout_id
    and workout.workout_type_id = 31
group by year.name;

