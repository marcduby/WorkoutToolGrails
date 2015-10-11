package com.doobs.workout

import java.util.Date;

class WorkoutType {
	Long id
	String name
	String description
	Date dateCreated
	Integer displayOrder

    static constraints = {
    }
	
	static mapping = {
		table 'wkt_workout_type'
		id 					column: 'workout_type_id'
		name				column: 'name'
		description			column: 'description'
		dateCreated			column: 'insert_date'
		displayOrder		column: 'display_order'
	}
}
