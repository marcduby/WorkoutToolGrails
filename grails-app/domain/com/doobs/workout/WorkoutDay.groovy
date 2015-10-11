package com.doobs.workout

import java.util.Date;

class WorkoutDay {
	Long id
	Date date
	Integer heartRate
	Integer feelRating
	Integer sleepAmount
	Integer weight
	WorkoutWeek week
	Date dateCreated
	Date lastUpdated

    static constraints = {
		heartRate nullable: true
		weight nullable: true
		feelRating nullable: true
		sleepAmount nullable: true
    }
	
	static namedQueries = {
		getAllByWeekIdOrderByDate { Long weekId ->
			week {
				eq("id", weekId)
			}
			order ("date", "asc")
		}
	}

	static mapping = {
		table 'wkt_day'
		id 					column: 'day_id'
		date				column: 'date'
		heartRate			column: 'heart_rate'
		feelRating			column: 'feel'
		sleepAmount			column: 'sleep_amount'
		weight				column: 'weight'
		week 				column: 'week_id', fetch: 'join'
		dateCreated			column: 'insert_date'
		lastUpdated			column: 'last_update'
	}
}
