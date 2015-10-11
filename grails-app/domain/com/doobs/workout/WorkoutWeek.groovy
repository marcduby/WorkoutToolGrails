package com.doobs.workout

import java.util.Date;

class WorkoutWeek extends AbstractWorkoutAggregate {
	def reportService
	
	Long id
	String name
	String description
	Integer rating
	WorkoutPeriod period
	String notes
	Date dateCreated
	Date lastUpdated
	WorkoutAggregateBean aggregateBean 
	
//	Integer getOverdistance() {
//		if (this.aggregateBean == null) {
//			this.aggregateBean = this.reportService?.getAggregateBeanForWeek(this.id)
//		}
//		return this.loadAggregateBean().overdistance
//	}
	
	public WorkoutAggregateBean loadAggregateBean() {
		if (this.aggregateBean == null) {
			this.aggregateBean = this.reportService?.getAggregateBeanForWeek(this.id)
		}
		return this.aggregateBean
	}
	
	static transients = ['aggregateBean']
	
    static constraints = {
    }
	
	
	static namedQueries = {
		getAllByPeriodIdOrderByWeek { Long periodId ->
			period {
				eq("id", periodId)
			}
			order ("name", "asc")
		}
	}
	
	static mapping = {
		table 'wkt_week'
		id 					column: 'week_id'
		name				column: 'name', sqlType: 'enum'
		description			column: 'name_text'
		rating 				column: 'rating'
		notes				column: 'notes', sqlType: 'text'
		period 				column: 'period_id', fetch: 'join'
		dateCreated			column: 'insert_date'
		lastUpdated			column: 'last_update'
	}
}
