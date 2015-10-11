package com.doobs.workout

import org.springframework.dao.DataIntegrityViolationException

class WorkoutYearController {
	WorkoutService workoutService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

	/**
	 * list all the workout years
	 * 
	 * @return
	 */
    def list() {
    	List<WorkoutYear> yearList = this.workoutService?.getAllWorkoutYears()
//        params.max = Math.min(params.max ? params.int('max') : 10, 100)
		log.info("got year list of size: " + yearList?.size())
        [workoutYearInstanceList: yearList, workoutYearInstanceTotal: yearList?.size()]
    }

    def create() {
        [workoutYearInstance: new WorkoutYear(params)]
    }

    def save() {
        def workoutYearInstance = new WorkoutYear(params)
        if (!workoutYearInstance.save(flush: true)) {
            render(view: "create", model: [workoutYearInstance: workoutYearInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'workoutYear.label', default: 'WorkoutYear'), workoutYearInstance.id])
        redirect(action: "show", id: workoutYearInstance.id)
    }

	/**
	 * show the workout year's periods
	 * <br/>
	 * forwards to the workout period controler
	 * 
	 * @return			nothing
	 */
    def show() {
        def workoutYearInstance = WorkoutYear.get(params.id)
		log.info("showing workout year: " + workoutYearInstance?.id)
        if (!workoutYearInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'workoutYear.label', default: 'WorkoutYear'), params.id])
            redirect(action: "list")
            return
        }

//        chain(controller: "workoutPeriod", action: "list", model: [year: workoutYearInstance])
        [workoutYearInstance: new WorkoutYear(params)]
    }

    def edit() {
        def workoutYearInstance = WorkoutYear.get(params.id)
        if (!workoutYearInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'workoutYear.label', default: 'WorkoutYear'), params.id])
            redirect(action: "list")
            return
        }

        [workoutYearInstance: workoutYearInstance]
    }

    def update() {
        def workoutYearInstance = WorkoutYear.get(params.id)
        if (!workoutYearInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'workoutYear.label', default: 'WorkoutYear'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (workoutYearInstance.version > version) {
                workoutYearInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'workoutYear.label', default: 'WorkoutYear')] as Object[],
                          "Another user has updated this WorkoutYear while you were editing")
                render(view: "edit", model: [workoutYearInstance: workoutYearInstance])
                return
            }
        }

        workoutYearInstance.properties = params

        if (!workoutYearInstance.save(flush: true)) {
            render(view: "edit", model: [workoutYearInstance: workoutYearInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'workoutYear.label', default: 'WorkoutYear'), workoutYearInstance.id])
        redirect(action: "show", id: workoutYearInstance.id)
    }

    def delete() {
        def workoutYearInstance = WorkoutYear.get(params.id)
        if (!workoutYearInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'workoutYear.label', default: 'WorkoutYear'), params.id])
            redirect(action: "list")
            return
        }

        try {
            workoutYearInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'workoutYear.label', default: 'WorkoutYear'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'workoutYear.label', default: 'WorkoutYear'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
