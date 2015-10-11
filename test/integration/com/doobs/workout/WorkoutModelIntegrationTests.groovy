package com.doobs.workout

import static org.junit.Assert.*
import org.junit.*

class WorkoutModelIntegrationTests {

    @Before
    void setUp() {
        // Setup logic here
    }

    @After
    void tearDown() {
        // Tear down logic here
    }

    @Test
    void testWorkoutYearModel() {
		List<WorkoutYear> yearList = WorkoutYear.findAll()
        assertEquals 21, yearList?.size()
    }

    @Test
    void testWorkoutYearModelOrderYear() {
		List<WorkoutYear> yearList = WorkoutYear.getAllOrderByYear.list()
        assertEquals 21, yearList?.size()
    }

    @Test
    void testWorkoutPeriodModelByYearOrderPeriod() {
		List<WorkoutPeriod> periodList = WorkoutPeriod.getAllByYearIdOrderByPeriod(1l).list()
        assertEquals 13, periodList?.size()
    }

    @Test
    void testWorkoutWeekModelByPeriodOrderWeek() {
		List<WorkoutWeek> weekList = WorkoutWeek.getAllByPeriodIdOrderByWeek(1l).list()
        assertEquals 4, weekList?.size()
    }

    @Test
    void testWorkoutWeekModelOverdistance() {
		WorkoutWeek week = WorkoutWeek.get(3l)
        assertEquals 582, week?.overdistance
    }

    @Test
    void testWorkoutWeekModelStrength() {
		WorkoutWeek week = WorkoutWeek.get(3l)
        assertEquals 0, week?.strength
    }

    @Test
    void testWorkoutDayModelByWeekOrderDate() {
		List<WorkoutDay> dayList = WorkoutDay.getAllByWeekIdOrderByDate(10l).list()
        assertEquals 7, dayList?.size()
    }

    @Test
    void testWorkoutModelByDayOrderTime() {
		List<Workout> workoutList = Workout.getAllByDayIdOrderByTime(10l).list()
        assertEquals 1, workoutList?.size()
    }

    @Test
    void testWorkoutActivityModelByWeekOrderDateTime() {
		List<WorkoutActivity> workoutActivityList = WorkoutActivity.getAllByWeekIdOrderByWorkoutDate(10l).list()
        assertEquals 7, workoutActivityList?.size()
    }

    @Test
    void testWorkoutIntensityModelByWeekOrderDateTime() {
		List<WorkoutIntensity> workoutIntensityList = WorkoutIntensity.getAllByWeekIdOrderByWorkoutDate(10l).list()
        assertEquals 7, workoutIntensityList?.size()
    }

    @Test
    void testWorkoutPeriodModel() {
		List<WorkoutPeriod> periodList = WorkoutPeriod.findAll()
        assertEquals 234, periodList?.size()
    }
	
    @Test
    void testWorkoutWeekModel() {
		List<WorkoutWeek> weekList = WorkoutWeek.findAll()
        assertEquals 936, weekList?.size()
    }
	
    @Test
    void testWorkoutDayModel() {
		List<WorkoutDay> dayList = WorkoutDay.findAll()
        assertEquals 6552, dayList?.size()
    }
	
    @Test
    void testWorkoutModel() {
		List<Workout> workoutList = Workout.findAll()
        assertEquals 9077, workoutList?.size()
    }
	
    @Test
    void testWorkoutTypeModel() {
		List<WorkoutType> workoutTypeList = WorkoutType.findAll()
        assertEquals 30, workoutTypeList?.size()
    }
	
    @Test
    void testActivityModel() {
		List<WorkoutActivity> workoutActivityList = WorkoutActivity.findAll()
        assertEquals 9077, workoutActivityList?.size()
    }
	
    @Test
    void testIntensityModel() {
		List<WorkoutIntensity> workoutIntensityList = WorkoutIntensity.findAll()
        assertEquals 9077, workoutIntensityList?.size()
    }
}
