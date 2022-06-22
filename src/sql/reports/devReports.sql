

-- total rowing workouts by calendar year
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



select min(day.date), max(day.date), count(activity.rowing) as count_workouts, 
	count(distinct day.date) as count_days, sum(activity.rowing) as total_time, 
	truncate(sum(activity.rowing)/count(activity.rowing), 2) as avg_per_workout, 
	truncate(sum(activity.rowing)/count(distinct day.date), 2) as avg_per_day, 
	month(day.date) as month, year(day.date) as year
from wkt_activity activity, wkt_day day, wkt_workout workout
where day.day_id = workout.day_id
	and workout.workout_id = activity.workout_id
	and activity.rowing > 0
    and year(day.date) in (1994, 2002)
group by month, year
order by year, month;


    and year(day.date) in (2012, 2021, 2022)
    and year(day.date) in (1994, 2002)





