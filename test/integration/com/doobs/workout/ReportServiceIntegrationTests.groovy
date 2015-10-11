package com.doobs.workout

import static org.junit.Assert.*
import org.junit.*

class ReportServiceIntegrationTests {
	ReportService reportService
	
    @Before
    void setUp() {
        // Setup logic here
    }

    @After
    void tearDown() {
        // Tear down logic here
    }

    @Test
    void testGetWorkoutAggregateForWeek() {
		Integer weekId = 3
		WorkoutAggregateBean bean = this.reportService?.getAggregateBeanForWeek(weekId)
		assertNotNull bean
		assertEquals 582, bean.overdistance
    }
	
    @Test
    void testGetWorkoutActivityAggregateForWeek() {
		Integer weekId = 3
		WorkoutAggregateBean bean = this.reportService?.getAggregateBeanForWeek(weekId)
		assertNotNull bean
		assertEquals 548, bean.row
    }
	
    @Test
    void testGetWorkoutAggregateForPeriod() {
		Integer periodId = 3
		WorkoutAggregateBean bean = this.reportService?.getAggregateBeanForPeriod(periodId)
		assertNotNull bean
		assertEquals 258, bean.overdistance
    }
	
    @Test
    void testGetWorkoutAggregateForYear() {
		Integer yearId = 1
		WorkoutAggregateBean bean = this.reportService?.getAggregateBeanForYear(yearId)
		assertNotNull bean
		assertEquals 17243, bean.overdistance
    }
	
}
