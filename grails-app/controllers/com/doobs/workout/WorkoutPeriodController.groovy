package com.doobs.workout

import org.springframework.dao.DataIntegrityViolationException

class WorkoutPeriodController {
	WorkoutService workoutService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

	/**
	 * list the workout periods for a given year
	 * 
	 * @return
	 */
    def list() {
		Long yearId = Long.valueOf(params.yearId)
		log.info("got year id: " + yearId)
		if (!yearId) {
			log.error("got list action for periods with year id: " + yearId)
			redirect controller: "workoutYear", action: "list"
		}

		List<WorkoutPeriod> periodList = workoutService?.getAllWorkoutPeriodsForYear(yearId)
		WorkoutYear year = workoutService?.getWorkoutYear(yearId)
		
        [workoutPeriodInstanceList: periodList, workoutPeriodInstanceTotal: periodList?.size(), workoutYearInstance: year]
    }

    def create() {
        [workoutPeriodInstance: new WorkoutPeriod(params)]
    }

    def save() {
        def workoutPeriodInstance = new WorkoutPeriod(params)
        if (!workoutPeriodInstance.save(flush: true)) {
            render(view: "create", model: [workoutPeriodInstance: workoutPeriodInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'workoutPeriod.label', default: 'WorkoutPeriod'), workoutPeriodInstance.id])
        redirect(action: "show", id: workoutPeriodInstance.id)
    }

	/**
	 * show all the weeks for a period
	 * <br/>
	 * will chain to workout week controller
	 * 
	 * @return
	 */
    def show() {
        def workoutPeriodInstance = WorkoutPeriod.get(params.id)
		log.info("showing workout period: " + workoutPeriodInstance?.id)
        if (!workoutPeriodInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'workoutPeriod.label', default: 'WorkoutPeriod'), params.id])
            redirect(controller="workoutYear", action: "list")
            return
        }

        chain(controller: "workoutWeek", action: "list", model: [period: workoutPeriodInstance])
    }

    def edit() {
        def workoutPeriodInstance = WorkoutPeriod.get(params.id)
        if (!workoutPeriodInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'workoutPeriod.label', default: 'WorkoutPeriod'), params.id])
            redirect(action: "list")
            return
        }

        [workoutPeriodInstance: workoutPeriodInstance]
    }

    def update() {
        def workoutPeriodInstance = WorkoutPeriod.get(params.id)
        if (!workoutPeriodInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'workoutPeriod.label', default: 'WorkoutPeriod'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (workoutPeriodInstance.version > version) {
                workoutPeriodInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'workoutPeriod.label', default: 'WorkoutPeriod')] as Object[],
                          "Another user has updated this WorkoutPeriod while you were editing")
                render(view: "edit", model: [workoutPeriodInstance: workoutPeriodInstance])
                return
            }
        }

        workoutPeriodInstance.properties = params

        if (!workoutPeriodInstance.save(flush: true)) {
            render(view: "edit", model: [workoutPeriodInstance: workoutPeriodInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'workoutPeriod.label', default: 'WorkoutPeriod'), workoutPeriodInstance.id])
        redirect(action: "show", id: workoutPeriodInstance.id)
    }

    def delete() {
        def workoutPeriodInstance = WorkoutPeriod.get(params.id)
        if (!workoutPeriodInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'workoutPeriod.label', default: 'WorkoutPeriod'), params.id])
            redirect(action: "list")
            return
        }

        try {
            workoutPeriodInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'workoutPeriod.label', default: 'WorkoutPeriod'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'workoutPeriod.label', default: 'WorkoutPeriod'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
