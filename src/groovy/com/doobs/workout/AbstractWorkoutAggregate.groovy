package com.doobs.workout

abstract class AbstractWorkoutAggregate {
	
//	WorkoutAggregateBean aggregateBean 
	
	public Integer getOverdistance() {
		return loadAggregateBean().overdistance
	}
	
	public Integer getEndurance() {
		return loadAggregateBean().endurance
	}
	
	public Integer getStrength() {
		return loadAggregateBean().strength
	}
	
	public Integer getIntensity() {
		return loadAggregateBean().intensity
	}
	
	public Integer getVertical() {
		return loadAggregateBean().vertical
	}
	
	public Integer getAnaerobicThreshold() {
		return loadAggregateBean().anaerobicThreshold
	}
	
	public Integer getSpeed() {
		return loadAggregateBean().speed
	}
	
	public Integer getRace() {
		return loadAggregateBean().race
	}
	
	public Integer getTotal() {
		Integer total = 0
		total = total + this.getOverdistance() + this.getEndurance() + this.getStrength()
		total = total + this.getIntensity() + this.getVertical() + this.getAnaerobicThreshold()
		total = total + this.getSpeed() + this.getRace()
		return total
	}

	public Integer getRow() {
		return loadAggregateBean().row
	}
	
	public Integer getErg() {
		return loadAggregateBean().erg
	}
	
	public Integer getBike() {
		return loadAggregateBean().bike
	}
	
	public Integer getRun() {
		return loadAggregateBean().run
	}
	
	public Integer getLift() {
		return loadAggregateBean().lift
	}
	
	public Integer getSkate() {
		return loadAggregateBean().skate
	}
	
	public Integer getSwim() {
		return loadAggregateBean().swim
	}
	
	public Integer getCrossCountrySki() {
		return loadAggregateBean().crossCountrySki
	}
	
	public Integer getBasketball() {
		return loadAggregateBean().basketball
	}
	
	public Integer getStairs() {
		return loadAggregateBean().stairs
	}
	
	public Integer getJumpRope() {
		return loadAggregateBean().jumpRope
	}
	
	public Integer getOther() {
		return loadAggregateBean().other
	}
	
	public Integer getActivityTotal() {
		return loadAggregateBean().activityTotal
	}

//	static transients = ['aggregateBean']

	public abstract WorkoutAggregateBean loadAggregateBean()
}
