package com.doobs.workout

import org.springframework.dao.DataIntegrityViolationException

class WorkoutWeekController {
	WorkoutService workoutService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

	/**
	 * get a list of all weeks for a period
	 * 
	 * @return
	 */
    def list() {
		Long periodId = Long.valueOf(params.periodId)
		log.info("got period id: " + periodId)
//		def period = chainModel.period

//		log.info("got period : " + period + " with id: " + period?.id)
 //       def periodId = period?.id
		if (!periodId) {
			log.error("got list action for periods with period id: " + periodId)
			redirect controller: "workoutYear", action: "list"
		}
		
		WorkoutPeriod period = workoutService?.getWorkoutPeriod(periodId)
		List<WorkoutWeek> weekList = workoutService?.getAllWorkoutWeeksForPeriod(periodId)
		
        [workoutWeekInstanceList: weekList, workoutWeekInstanceTotal: weekList?.size(), workoutPeriodInstance: period]
    }

    def create() {
        [workoutWeekInstance: new WorkoutWeek(params)]
    }

    def save() {
        def workoutWeekInstance = new WorkoutWeek(params)
        if (!workoutWeekInstance.save(flush: true)) {
            render(view: "create", model: [workoutWeekInstance: workoutWeekInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'workoutWeek.label', default: 'WorkoutWeek'), workoutWeekInstance.id])
        redirect(action: "show", id: workoutWeekInstance.id)
    }

	/**
	 * show the day list for the week
	 * <br/>
	 * will chain with the workout day list action
	 * 
	 * @return
	 */
    def show() {
        def workoutWeekInstance = WorkoutWeek.get(params.id)
		log.info("showing workout week: " + workoutWeekInstance?.id)
        if (!workoutWeekInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'workoutWeek.label', default: 'WorkoutWeek'), params.id])
            redirect(controller="workoutYear", action: "list")
            return
        }

        chain(controller: "workout", action: "list", model: [week: workoutWeekInstance])
    }

    def edit() {
        def workoutWeekInstance = WorkoutWeek.get(params.id)
        if (!workoutWeekInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'workoutWeek.label', default: 'WorkoutWeek'), params.id])
            redirect(action: "list")
            return
        }

        [workoutWeekInstance: workoutWeekInstance]
    }

    def update() {
        def workoutWeekInstance = WorkoutWeek.get(params.id)
        if (!workoutWeekInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'workoutWeek.label', default: 'WorkoutWeek'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (workoutWeekInstance.version > version) {
                workoutWeekInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'workoutWeek.label', default: 'WorkoutWeek')] as Object[],
                          "Another user has updated this WorkoutWeek while you were editing")
                render(view: "edit", model: [workoutWeekInstance: workoutWeekInstance])
                return
            }
        }

        workoutWeekInstance.properties = params

        if (!workoutWeekInstance.save(flush: true)) {
            render(view: "edit", model: [workoutWeekInstance: workoutWeekInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'workoutWeek.label', default: 'WorkoutWeek'), workoutWeekInstance.id])
        redirect(action: "show", id: workoutWeekInstance.id)
    }

    def delete() {
        def workoutWeekInstance = WorkoutWeek.get(params.id)
        if (!workoutWeekInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'workoutWeek.label', default: 'WorkoutWeek'), params.id])
            redirect(action: "list")
            return
        }

        try {
            workoutWeekInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'workoutWeek.label', default: 'WorkoutWeek'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'workoutWeek.label', default: 'WorkoutWeek'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
