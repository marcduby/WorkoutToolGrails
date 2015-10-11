package com.doobs.workout

import java.util.Date;

class WorkoutActivity {
	Long id
	Integer rowAmount = 0
	Integer ergAmount = 0
	Integer bikeAmount = 0
	Integer stairsAmount = 0
	Integer jumpRopeAmount = 0
	Integer swimAmount = 0
	Integer skateAmount = 0
	Integer bBallAmount = 0
	Integer runAmount = 0
	Integer liftAmount = 0
	Integer otherAmount = 0
	Integer xSkiAmount = 0
	Workout workout
	Date dateCreated
	Date lastUpdated

    static constraints = {
		lastUpdated nullable: true
    }
	
	static namedQueries = {
		getAllByWeekIdOrderByWorkoutDate { Long weekId ->
			workout {
				getAllByWeekIdOrderDateTime(weekId)
			}
		}
	}

	static mapping = {
		table 'wkt_activity'
		id 					column: 'activity_id'
		rowAmount			column: 'row'
		ergAmount			column: 'erg'
		bikeAmount			column: 'bike'
		stairsAmount		column: 'stairs'
		jumpRopeAmount		column: 'jump_rope'
		swimAmount			column: 'swim'
		skateAmount			column: 'skate'
		bBallAmount			column: 'b_ball'
		runAmount			column: 'run'
		liftAmount			column: 'lift'
		otherAmount			column: 'other'
		xSkiAmount			column: 'x_ski'
		workout				column: 'workout_id', fetch: 'join'
		dateCreated			column: 'insert_date'
		lastUpdated			column: 'last_update'
	}
}
