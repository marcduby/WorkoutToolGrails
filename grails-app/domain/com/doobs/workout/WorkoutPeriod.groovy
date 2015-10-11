package com.doobs.workout

import java.util.Date;

class WorkoutPeriod extends AbstractWorkoutAggregate {
	def reportService 
	
	Long id
	String name
	String description
	Integer rating
	WorkoutYear year
	String notes
	Date dateCreated
	Date lastUpdated
	WorkoutAggregateBean aggregateBean
	
	/**
	 * load the workout aggregate bean
	 * 
	 * @return			the bean
	 */
	public WorkoutAggregateBean loadAggregateBean() {
		if (this.aggregateBean == null) {
			this.aggregateBean = this.reportService?.getAggregateBeanForPeriod(this.id)
		}
		return this.aggregateBean
	}
	
	static transients = ['aggregateBean']

    static constraints = {
    }
	
	static namedQueries = {
		getAllByYearIdOrderByPeriod { Long yearId ->
			year {
				eq("id", yearId)
			}
			order ("name", "asc")
		}
	}
	
	static mapping = {
		table 'wkt_period'
		id 					column: 'period_id'
		name				column: 'name', sqlType: 'enum'
		description			column: 'name_text'
		rating 				column: 'rating'
		notes				column: 'notes', sqlType: 'text'
		year 				column: 'year_id', fetch: 'join'
		dateCreated			column: 'insert_date'
		lastUpdated			column: 'last_update'
	}
}
