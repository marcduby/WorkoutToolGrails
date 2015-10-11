package com.doobs.workout

import groovy.sql.GroovyRowResult
import groovy.sql.Sql

class ReportService {
	def dataSource
	
    def serviceMethod() {

    }

	/**
	 * create an aggregate workout bean for a week
	 * 	
	 * @param weekId			the week to create the bean for
	 * @return					the aggregate bean
	 */
	WorkoutAggregateBean getAggregateBeanForWeek(Long weekId) {
		def sql = new Sql(this.dataSource)
		
		String sqlString = """
			select b.week_id as id, b.name_text as name,
			sum(e.overdistance) as overdistance, sum(e.endurance) as endurance,
			sum(e.strength) as strength, sum(e.intensity) as intensity, sum(e.up_vertical) as vertical,
			sum(e.anaerobic_threshold) as at, sum(e.race) as race, sum(e.speed) as speed,
			sum(f.row) as row, sum(f.erg) as erg, sum(f.bike) as bike, sum(f.stairs) as stairs,
			sum(f.swim) as swim, sum(f.skate) as skate, sum(f.b_ball) as b_ball, sum(f.run) as run,
			sum(f.lift) as lift, sum(f.other) as other, sum(f.jump_rope) as jump_rope,
			sum(x_ski) as x_ski
			from wkt_week b, wkt_day c, wkt_workout d, wkt_intensity e, wkt_activity f
			where b.week_id = c.week_id
			and c.day_id = d.day_id
			and d.workout_id = e.workout_id
			and d.workout_id = f.workout_id
			and b.week_id = ${weekId}
			group by b.week_id
			order by b.name 
		"""

		List<GroovyRowResult> results = sql.rows(sqlString)
		log.info("got aggregate result list of size: " + results?.size() + " for week: " + weekId)
		
		return this.buildBeanFromSqlResult(results)
	}
	
	/**
	 * build the bean from the sql row result
	 * 
	 * @param results				the sql row results
	 * @return						the aggregate workout bean
	 */
	WorkoutAggregateBean buildBeanFromSqlResult(List<GroovyRowResult> results) {
		WorkoutAggregateBean bean = new WorkoutAggregateBean()
		results.each {
			// intensity totals
			bean.overdistance = (it.overdistance == null ? 0 : it.overdistance)
			bean.endurance = (it.endurance == null ? 0 : it.endurance)
			bean.strength = (it.strength == null ? 0 : it.strength)
			bean.intensity = (it.intensity == null ? 0 : it.intensity)
			bean.vertical = (it.vertical == null ? 0 : it.vertical)
			bean.anaerobicThreshold = (it.at == null ? 0 : it.at)
			bean.speed = (it.speed == null ? 0 : it.speed)
			bean.race = (it.race == null ? 0 : it.race)
			
			// activity totals
			bean.row = (it.row == null ? 0 : it.row)
			bean.erg = (it.erg == null ? 0 : it.erg)
			bean.bike = (it.bike == null ? 0 : it.bike)
			bean.run = (it.run == null ? 0 : it.run)
			bean.stairs = (it.stairs == null ? 0 : it.stairs)
			bean.basketball = (it.b_ball == null ? 0 : it.b_ball)
			bean.swim = (it.swim == null ? 0 : it.swim)
			bean.lift = (it.lift == null ? 0 : it.lift)
			bean.skate = (it.skate == null ? 0 : it.skate)
			bean.crossCountrySki = (it.x_ski == null ? 0 : it.x_ski)
			bean.jumpRope = (it.jump_rope == null ? 0 : it.jump_rope)
			bean.other = (it.other == null ? 0 : it.other)
		}
		return bean
	}
	
	/**
	 * create an aggregate workout bean for a period
	 * 
	 * @param periodId		the period to build the bean for
	 * @return				the aggregate bean
	 */
	WorkoutAggregateBean getAggregateBeanForPeriod(Long periodId) {
		def sql = new Sql(this.dataSource)
		
		String sqlString = """
			select b.week_id as id, b.name_text as name,
			sum(e.overdistance) as overdistance, sum(e.endurance) as endurance,
			sum(e.strength) as strength, sum(e.intensity) as intensity, sum(e.up_vertical) as vertical,
			sum(e.anaerobic_threshold) as at, sum(e.race) as race, sum(e.speed) as speed,
			sum(f.row) as row, sum(f.erg) as erg, sum(f.bike) as bike, sum(f.stairs) as stairs,
			sum(f.swim) as swim, sum(f.skate) as skate, sum(f.b_ball) as b_ball, sum(f.run) as run,
			sum(f.lift) as lift, sum(f.other) as other, sum(f.jump_rope) as jump_rope,
			sum(x_ski) as x_ski
			from wkt_period a, wkt_week b, wkt_day c, wkt_workout d, wkt_intensity e, wkt_activity f
			where b.week_id = c.week_id
			and c.day_id = d.day_id
			and d.workout_id = e.workout_id
			and d.workout_id = f.workout_id
			and b.period_id = a.period_id
			and a.period_id = ${periodId}
			group by a.period_id
			order by a.name 
		"""

		List<GroovyRowResult> results = sql.rows(sqlString)
		log.info("got aggregate result list of size: " + results?.size() + " for period: " + periodId)
		
		return this.buildBeanFromSqlResult(results)
	}
	
	/**
	 * create an aggregate workout bean for a year
	 * 
	 * @param yearId		the year to build the bean for
	 * @return				the aggregate bean
	 */
	WorkoutAggregateBean getAggregateBeanForYear(Long yearId) {
		def sql = new Sql(this.dataSource)
		
		String sqlString = """
			select b.week_id as id, b.name_text as name,
			sum(e.overdistance) as overdistance, sum(e.endurance) as endurance,
			sum(e.strength) as strength, sum(e.intensity) as intensity, sum(e.up_vertical) as vertical,
			sum(e.anaerobic_threshold) as at, sum(e.race) as race, sum(e.speed) as speed,
			sum(f.row) as row, sum(f.erg) as erg, sum(f.bike) as bike, sum(f.stairs) as stairs,
			sum(f.swim) as swim, sum(f.skate) as skate, sum(f.b_ball) as b_ball, sum(f.run) as run,
			sum(f.lift) as lift, sum(f.other) as other, sum(f.jump_rope) as jump_rope,
			sum(x_ski) as x_ski
			from wkt_year z, wkt_period a, wkt_week b, wkt_day c, wkt_workout d, wkt_intensity e, wkt_activity f
			where b.week_id = c.week_id
			and c.day_id = d.day_id
			and d.workout_id = e.workout_id
			and d.workout_id = f.workout_id
			and b.period_id = a.period_id
			and a.year_id = z.year_id
			and z.year_id = ${yearId}
			group by z.year_id
			order by z.name 
		"""

		List<GroovyRowResult> results = sql.rows(sqlString)
		log.info("got aggregate result list of size: " + results?.size() + " for year: " + yearId)
		
		return this.buildBeanFromSqlResult(results)
	}
	
}
