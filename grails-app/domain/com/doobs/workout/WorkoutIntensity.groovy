package com.doobs.workout

import java.util.Date;

class WorkoutIntensity {
	Long id
	Integer overdistanceAmount = 0
	Integer enduranceAmount = 0
	Integer strengthAmount = 0
	Integer intensityAmount = 0
	Integer verticalAmount = 0
	Integer anaerobicThresholdAmount = 0
	Integer speedAmount = 0
	Integer raceAmount = 0
	Integer total
	Workout workout
	Date dateCreated
	Date lastUpdated

	public Integer getTotal() {
		return this.overdistanceAmount + this.enduranceAmount + this.strengthAmount + this.intensityAmount + this.verticalAmount + this.anaerobicThresholdAmount + this.speedAmount + this.raceAmount;
	}
	
	static transients = ['total']
	
    static constraints = {
		overdistanceAmount 			nullable: true
		enduranceAmount				nullable: true
		strengthAmount				nullable: true
		intensityAmount 			nullable: true
		verticalAmount				nullable: true
		anaerobicThresholdAmount	nullable: true
		speedAmount					nullable: true
		raceAmount					nullable: true
    }
	
	static namedQueries = {
		getAllByWeekIdOrderByWorkoutDate { Long weekId ->
			workout {
				getAllByWeekIdOrderDateTime(weekId)
			}
		}
	}

	static mapping = {
		table 'wkt_intensity'
		id 					column: 'intensity_id'
		overdistanceAmount			column: 'overdistance'
		enduranceAmount				column: 'endurance'
		strengthAmount				column: 'strength'
		intensityAmount				column: 'intensity'
		verticalAmount				column: 'up_vertical'
		speedAmount					column: 'speed'
		raceAmount					column: 'race'
		anaerobicThresholdAmount	column: 'anaerobic_threshold', defaultValue: '0'
		workout						column: 'workout_id', fetch: 'join'
		dateCreated					column: 'insert_date'
		lastUpdated					column: 'last_update'
	}
}
