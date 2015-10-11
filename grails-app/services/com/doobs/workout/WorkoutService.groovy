package com.doobs.workout

class WorkoutService {

    def serviceMethod() {

    }
	
	/**
	 * returns the workout year
	 * 
	 * @param yearId				the year to look for
	 * @return						the year found
	 */
	WorkoutYear getWorkoutYear(Long yearId) {
		return WorkoutYear.get(yearId)
	}
	
	/**
	 * returns a list of all workout types
	 * 
	 * @return						a list of all workout types
	 */
	List<WorkoutType> getAllWorkoutTypesList() {
		return WorkoutType.list(sort: "displayOrder")
	}
	
	/**
	 * returns the 24 hours in a day in a list
	 * 
	 * @return						a list with the 24 hours in a day
	 */
	List<String> getDayHoursString() {
		List<String> hourList = new ArrayList<String>();
		hourList.add("12AM");
		
		for (int i = 1; i <= 11; i++) {
			hourList.add(i + "AM");
		}
		
		hourList.add("12PM");
		
		for (int i = 1; i <= 11; i++) {
			hourList.add(i + "PM");
		}
		
		return hourList;
	}
	
	Workout createWorkout(Long dayId) {
		log.info("creating workout dfor day: " + dayId)
		
		// get day
		WorkoutDay workoutDay = WorkoutDay.get(dayId)
		if (workoutDay == null) {
			log.error("could not retrieve day with id: " + dayId)
			return null
		}
		
		// create workout
		Workout workoutInstance = new Workout(day: workoutDay)
		workoutInstance.hour = 8
		workoutInstance?.description = "OFF"
		workoutInstance?.type = WorkoutType.get(1)
		workoutInstance?.rating = 5
		if (!workoutInstance.save(flush: true)) {
			log.error "in create workout, got error saving workout: " + workoutInstance?.id
			log.error("errors are: " + workoutInstance?.errors)
			return null
		}

		// create intensity and activity
		WorkoutIntensity intensity = new WorkoutIntensity(workout: workoutInstance)
		if (!intensity.save(flush: true)) {
			log.error "in create workout, got error saving workout intensity: " + intensity?.id
			log.error("errors are: " + intensity?.errors)
			return null
		}

		WorkoutActivity activity = new WorkoutActivity(workout: workoutInstance)
		if (!activity.save(flush: true)) {
			log.error "in create workout, got error saving workout activity: " + activity?.id
			log.error("errors are: " + activity?.errors)
			return null
		}

		return workoutInstance
	}
	
	/**
	 * returns the 24 hours in a day in a list
	 * 
	 * @return						a list with the 24 hours in a day
	 */
	List<Integer> getDayHours() {
		return null;
	}
	
	/**
	 * returns the workout period
	 * 
	 * @param periodId				the period to look for
	 * @return						the period found
	 */
	WorkoutPeriod getWorkoutPeriod(Long periodId) {
		return WorkoutPeriod.get(periodId)
	}
	
	/**
	 * returns the workout week
	 * 
	 * @param weekId				the workout week to look for
	 * @return						the workout week found
	 */
	WorkoutWeek getWorkoutWeek(Long weekId) {
		return WorkoutWeek.get(weekId)
	}
	
	/**
	 * returns the workout
	 * 
	 * @param workoutId				the workout to look for
	 * @return						the workout found
	 */
	Workout getWorkout(Long workoutId) {
		return Workout.get(workoutId)
	}
	
	/**
	 * returns the workout intensity
	 * 
	 * @param intensityId			the workout intensity to look for
	 * @return						the workout intensity found
	 */
	WorkoutIntensity getWorkoutIntensity(Long intensityId) {
		return WorkoutIntensity.get(intensityId)
	}
	
	/**
	 * returns the workout activity
	 * 
	 * @param activityId			the workout activity to look for
	 * @return						the workout activity found
	 */
	WorkoutActivity getWorkoutActivity(Long activityId) {
		return WorkoutActivity.get(activityId)
	}
	
	/**
	 * get all workout years for the user
	 * 
	 * @return			list of all workout years for the user
	 */
	List<WorkoutYear> getAllWorkoutYears() {
		List<WorkoutYear> yearList = WorkoutYear.getAllOrderByYear.list()
		log.info("returning workout year list of size: " + yearList?.size())
		return yearList
	}
	
	/**
	 * get all workout periods for a year
	 * 
	 * @param yearId		the year to retrieve the periods for
	 * @return				the list of periods for that year
	 */
	List<WorkoutPeriod> getAllWorkoutPeriodsForYear(Long yearId) {
		List<WorkoutPeriod> periodList = WorkoutPeriod.getAllByYearIdOrderByPeriod(yearId).list()
		log.info("returning workout period list of size: " + periodList?.size() + " for year: " + yearId)
		return periodList
	}
	
	/**
	 * get all workout weeks for a period
	 * 
	 * @param periodId		the workout period to get all the weeks for
	 * @return				the list of all the workout weeks for that period
	 */
	List<WorkoutWeek> getAllWorkoutWeeksForPeriod(Long periodId) {
		List<WorkoutWeek> weekList = WorkoutWeek.getAllByPeriodIdOrderByWeek(periodId).list()
		log.info("returning workout week list of size: " + weekList?.size() + " for period: " + periodId)
		return weekList
	}

	/**
	 * get all the workout days for a week
	 * 	
	 * @param weekdId		the workout week to search for
	 * @return				the list of workout days for that week
	 */
	List<WorkoutDay> getAllWorkoutDaysForWeek(Long weekId) {
		List<WorkoutDay> dayList = WorkoutDay.getAllByWeekIdOrderByDate(weekId).list()
		log.info("returning workout day list of size: " + dayList?.size() + " for week: " + weekId)
		return dayList
	}
	
	/**
	 * get all the workouts for a week
	 * 	
	 * @param weekdId		the workout week to search for
	 * @return				the list of workouts for that week
	 */
	List<Workout> getAllWorkoutsForWeek(Long weekId) {
		List<Workout> workoutList = Workout.getAllByWeekIdOrderDateTime(weekId).list()
		log.info("returning workout list of size: " + workoutList?.size() + " for week: " + weekId)
		return workoutList
	}

	/**
	 * get all the workout intensities for a week
	 * 	
	 * @param weekdId		the workout week to search for
	 * @return				the list of workout intensties for that week
	 */
	List<WorkoutIntensity> getAllWorkoutIntensityForWeek(Long weekId) {
		List<WorkoutIntensity> workoutIntensityList = WorkoutIntensity.getAllByWeekIdOrderByWorkoutDate(weekId).list()
		log.info("returning workout intensity list of size: " + workoutIntensityList?.size() + " for week: " + weekId)
		return workoutIntensityList
	}

	/**
	 * save the workout object based on properties map
	 * 
	 * @param workoutId			the workout id
	 * @param propertiesMap		the map of workout properties
	 * @return					the workout object
	 */
	Workout updateWorkoutFromMap(String workoutId, Map propertiesMap) {
		Workout workout = this.getWorkout(workoutId);
		
		if (workout != null) {
			workout.properties = propertiesMap;
		}
		
		// save the workout
		workout.save();
		
		return workout;
	}
	
	WorkoutIntensity updateWorkoutIntensityFromMap(Long intensityId, Map propertiesMap) {
		WorkoutIntensity intensity = this.getWorkoutIntensity(intensityId);
		
		if (workout != null) {
			workout.properties = propertiesMap;
		}
		
		return workout;

	} 
	
	/**
	 * get al the workout day commands for a week
	 * 
	 * @param weekId		the workout week to search for
	 * @return				the list of day workout command objectss
	 */
/*	List<DayWorkoutCommand> getAllDayWorkoutForWeek(Long weekId) {
		List<Workout> workoutList = this.getAllWorkoutsForWeek(weekId)
		List<DayWorkoutCommand> commandList = new ArrayList<DayWorkoutCommand>()
		DayWorkoutCommand tempCommand 
		
		workoutList?.each { Workout workout ->
			if (!workout?.day?.date?.equals(tempCommand?.workoutDay?.date)) {
				tempCommand = new DayWorkoutCommand()
				tempCommand?.workoutDay = workout?.day
				commandList?.add(tempCommand)
			}
			tempCommand?.workoutList?.add(workout)
		}
		
		log.info("returning day workout command list of size: " + commandList?.size() + " for week: " + weekId)
		return commandList
	}
	*/
	
	/**
	 * get all the workout intensity day commands for a week
	 * 
	 * @param weekId		the workout week to search for
	 * @return				the list of intensity workout command objects
	 */
	List<DayWorkoutCommand> getAllDayWorkoutForWeek(Long weekId) {
		List<WorkoutIntensity> workoutIntensityList = this.getAllWorkoutIntensityForWeek(weekId)
		List<DayWorkoutCommand> commandList = new ArrayList<DayWorkoutCommand>()
		DayWorkoutCommand tempCommand 
		
		workoutIntensityList?.each { WorkoutIntensity workoutIntensity ->
			if (!workoutIntensity?.workout?.day?.date?.equals(tempCommand?.workoutDay?.date)) {
				tempCommand = new DayWorkoutCommand()
				tempCommand?.workoutDay = workoutIntensity?.workout?.day
				commandList?.add(tempCommand)
			}
			tempCommand?.workoutIntensityList?.add(workoutIntensity)
		}
		
		log.info("returning day workout command list of size: " + commandList?.size() + " for week: " + weekId)
		return commandList
	}
	
}
