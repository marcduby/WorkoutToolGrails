package com.doobs.workout

class WorkoutYear extends AbstractWorkoutAggregate {
	def reportService
	
	Long id
	String name
	String description
	Integer rating
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
			this.aggregateBean = this.reportService?.getAggregateBeanForYear(this.id)
		}
		return this.aggregateBean
	}

	static transients = ['aggregateBean']
	
    static constraints = {
    }
	
	static namedQueries = {
		getAllOrderByYear {
			order("name", "asc")
		}
	}
	
	static mapping = {
		table 'wkt_year'
		id 					column: 'year_id'
		name				column: 'name', sqlType: 'mediumint'
		description			column: 'name_text'
		rating 				column: 'rating'
		notes				column: 'notes', sqlType: 'text'
		dateCreated			column: 'insert_date'
		lastUpdated			column: 'last_update'
	}
}
