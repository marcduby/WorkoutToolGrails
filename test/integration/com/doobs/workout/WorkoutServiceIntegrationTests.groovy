package com.doobs.workout

import static org.junit.Assert.*
import org.junit.*

class WorkoutServiceIntegrationTests {
	WorkoutService workoutService
	
    @Before
    void setUp() {
        // Setup logic here
    }

    @After
    void tearDown() {
        // Tear down logic here
    }

	@Test
	void testUpdateWorkout() {
		Long workoutId = new Long(9056);
		
		
	}
	
	@Test
	void testGetAllWorkoutTypesList() {
		List<WorkoutType> typeList = this.workoutService.getAllWorkoutTypesList()
		assertNotNull typeList
		assertEquals 30, typeList?.size()

	}
	
	@Test
	void testGetDayHours() {
		List<Integer> hourList = this.workoutService.getDayHours();
		assertNotNull hourList
		assertEquals 24, hourList?.size()
	}
	
	@Test
	void testGetWorkout() {
		Long workoutId = new Long(9056);
		Workout workout = this.workoutService.getWorkout(workoutId)
		assertNotNull workout
		assertNotNull workout.intensity
		assertNotNull workout.activity
	}

	@Test
	void testGetWorkoutIntensity() {
		Long intensityId = new Long(9056);
		WorkoutIntensity intensity = this.workoutService.getWorkoutIntensity(intensityId)
		assertNotNull intensity
	}

	@Test
	void testGetWorkoutActivity() {
		Long activityId = new Long(9056);
		WorkoutActivity activity = this.workoutService.getWorkoutActivity(activityId)
		assertNotNull activity
	}
	
    @Test
    void testGetAllWorkoutYears() {
		List<WorkoutYear> yearList = this.workoutService?.getAllWorkoutYears()
        assertEquals 21, yearList?.size()
    }

    @Test
    void testGetAllWorkoutPeriodsForYear() {
		List<WorkoutPeriod> periodList = this.workoutService?.getAllWorkoutPeriodsForYear(1)
        assertEquals 13, periodList?.size()
    }
	
    @Test
    void testGetAllWorkoutWeeksForPeriod() {
		List<WorkoutWeek> weekList = this.workoutService?.getAllWorkoutWeeksForPeriod(3)
        assertEquals 4, weekList?.size()
    }
	
    @Test
    void testGetAllWorkoutDaysForWeek() {
		List<WorkoutDay> dayList = this.workoutService?.getAllWorkoutDaysForWeek(3)
        assertEquals 7, dayList?.size()
    }
	
    @Test
    void testGetAllDayWorkoutCommandsForWeek() {
		List<DayWorkoutCommand> commandList = this.workoutService?.getAllDayWorkoutForWeek(3l)
        assertEquals 7, commandList?.size()
    }
	
	@Test
	void testCreateWorkout() {
		Long dayId = 5179
		Workout workout
		
		// create the workout
		workout = this.workoutService.createWorkout(dayId)
		
		// test the workout
		log.info("created workout: " + workout?.id)
		assertNotNull workout
		
		// test the intensity and activity of the workout
		assertNotNull workout?.intensity
		assertNotNull workout?.activity
		
	}
}
