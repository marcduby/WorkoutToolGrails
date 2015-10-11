package com.doobs.workout

import java.text.SimpleDateFormat
import java.util.Date;
import java.sql.Time;

class Workout {
	Long id
	String description
	WorkoutDay day
	Integer rating
	Date time
	WorkoutType type
	Date dateCreated
	Date lastUpdated

	// transients
	WorkoutIntensity intensity
	WorkoutActivity activity
	Integer hour
	String name
	
	WorkoutIntensity getIntensity() {
		return WorkoutIntensity.findByWorkout(this);
	}
 
	WorkoutActivity getActivity() {
		return WorkoutActivity.findByWorkout(this);
	}
 
	Integer getHour() {
		return Integer.valueOf(new SimpleDateFormat("k").format(this.time));
	}

	void setHour(Integer hourNumber) {
		this.time = Time.valueOf(hourNumber + ":00:00")
	}	

	String getName() {	
		return (new SimpleDateFormat("MMMM dd yyyy").format(this.day?.date) + " - " + 
			(new SimpleDateFormat("ha").format(this.time)));
	}
	
	static transients = ['activity', 'intensity', 'hour', 'name']
	
    static constraints = {
    }
	
	static namedQueries = {
		getAllByDayIdOrderByTime { Long dayId ->
			day {
				eq("id", dayId)
			}
			order ("time", "asc")
		}
		
		getAllByWeekIdOrderDateTime { Long weekId ->
			day {
				week {
					eq("id", weekId)
				}
				order ("date", "asc")
			}
			order ("time", "asc")
		}
	}

	static mapping = {
		table 'wkt_workout'
		id 					column: 'workout_id'
		description			column: 'description'
		day					column: 'day_id', fetch: 'join'
		type				column: 'workout_type_id', fetch: 'join'
		rating 				column: 'rating'
		time				column: 'time', sqlType: "time"
		dateCreated			column: 'insert_date'
		lastUpdated			column: 'last_update'
	}
}
