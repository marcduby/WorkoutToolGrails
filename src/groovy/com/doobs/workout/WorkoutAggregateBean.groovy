package com.doobs.workout

class WorkoutAggregateBean {
	Integer overdistance = 0
	Integer endurance = 0
	Integer strength = 0
	Integer intensity = 0
	Integer vertical = 0
	Integer anaerobicThreshold = 0
	Integer speed = 0
	Integer race = 0
	
	// activity variables
	Integer row = 0
	Integer erg = 0
	Integer bike = 0
	Integer stairs = 0
	Integer jumpRope = 0
	Integer swim = 0
	Integer skate = 0
	Integer basketball = 0
	Integer run = 0
	Integer lift = 0
	Integer other = 0
	Integer crossCountrySki = 0
	
	Integer getActivityTotal() {
		return (this.row + this.erg + this.bike + this.stairs + this.jumpRope + this.swim + this.skate + this.basketball + this.run + this.lift + this.other + this.crossCountrySki)
	}
}
