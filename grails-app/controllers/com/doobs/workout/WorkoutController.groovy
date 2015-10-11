package com.doobs.workout

import org.springframework.dao.DataIntegrityViolationException

class WorkoutController {
	WorkoutService workoutService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

	/**
	 * list the workouts for a particular week
	 * 
	 * @return
	 */
    def list() {
		Long weekId = Long.valueOf(params.weekId)
		log.info("got week id: " + weekId)
		if (!weekId) {
			log.error("got list action for weeks with week id: " + weekId)
			redirect controller: "workoutYear", action: "list"
		}

		List<DayWorkoutCommand> workoutList = workoutService?.getAllDayWorkoutForWeek(weekId)
		WorkoutWeek week = workoutService?.getWorkoutWeek(weekId)
		
        [workoutWeekInstance: week, workoutDayCommandList: workoutList]
    }

    def editWorkout() {
        def workoutInstance = Workout.get(params.id)
        if (!workoutInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'workout.label', default: 'Workout'), params.id])
            redirect(action: "list")
            return
        }

		List<WorkoutType> workoutTypeList = this.workoutService.getAllWorkoutTypesList()
		List<Integer> hourList = this.workoutService.getDayHours()
		
		log.info "got hour of: " + workoutInstance.hour
		
        [workoutBean: workoutInstance, workoutTypeList: workoutTypeList, hourList: hourList]
    }

    def create() {
        [workoutInstance: new Workout(params)]
    }

    def save() {
        def workoutInstance = new Workout(params)
        if (!workoutInstance.save(flush: true)) {
            render(view: "create", model: [workoutInstance: workoutInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'workout.label', default: 'Workout'), workoutInstance.id])
        redirect(action: "show", id: workoutInstance.id)
    }

    def show() {
        def workoutInstance = Workout.get(params.id)
        if (!workoutInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'workout.label', default: 'Workout'), params.id])
            redirect(action: "list")
            return
        }

        [workoutInstance: workoutInstance]
    }

    def edit() {
        def workoutInstance = Workout.get(params.id)
        if (!workoutInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'workout.label', default: 'Workout'), params.id])
            redirect(action: "list")
            return
        }

        [workoutInstance: workoutInstance]
    }

	def createWorkout() {
		String dayIdString = params.dayId
		
		Long dayId = Long.valueOf(dayIdString)
		Workout workout = this.workoutService.createWorkout(dayId)
		Long weekId = workout?.day?.week?.id
		
		log.info("created workout: " + workout?.id + " for week: " + weekId)
		
		redirect(action: "list", params: [weekId: weekId])
	}
	
    def saveWorkout() {
		log.info "in save workout method with id: " + params.id
        Workout workoutInstance = Workout.get(Long.valueOf(params.id))
        if (!workoutInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'workout.label', default: 'Workout'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (workoutInstance.version > version) {
                workoutInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'workout.label', default: 'Workout')] as Object[],
                          "Another user has updated this Workout while you were editing")
                render(view: "edit", model: [workoutInstance: workoutInstance])
                return
            }
        }

        workoutInstance.properties = params

        if (!workoutInstance.save(flush: true)) {
			log.error "got error saving workout: " + workoutInstance?.id
            render(view: "editWorkout", model: [workoutBean: workoutInstance])
            return
        }
		
		// save the workout intensity
		WorkoutIntensity intensity = workoutInstance?.intensity
//		intensity.dateCreated = new Date();
		bindData(intensity, params.intensity)
//		workoutInstance.intensity.properties = params.'intensity'
		
		// fix empty insert date
		if (intensity?.dateCreated == null) {
			intensity?.dateCreated = new Date()
		}
		
		if (!intensity.save(flush: true)) {
			log.error "got error saving workout intensity: " + intensity?.id
			render(view: "editWorkout", model: [workoutBean: workoutInstance])
			return
		}

		// save the workout activity		
		WorkoutActivity activity = workoutInstance?.activity
//		intensity.dateCreated = new Date();
		bindData(activity, params.activity)
//		workoutInstance.intensity.properties = params.'intensity'
		
		// fix empty insert date
		if (activity?.dateCreated == null) {
			activity?.dateCreated = new Date()
		}
		
		if (!activity.save(flush: true)) {
			log.error "got error saving workout activity: " + activity?.id
			render(view: "editWorkout", model: [workoutBean: workoutInstance])
			return
		}
		
		// save the day 
		bindData(workoutInstance?.day, params.day)
				
				// fix empty insert date
				if (workoutInstance?.day?.dateCreated == null) {
					workoutInstance?.day?.dateCreated = new Date()
				}
				
				if (!workoutInstance?.day.save(flush: true)) {
					log.error "got error saving workout day: " + workoutInstance?.day?.id
					log.error workoutInstance?.day?.errors
					render(view: "editWorkout", model: [workoutBean: workoutInstance])
					return
				}
		
		// redirect
		flash.message = message(code: 'default.updated.message', args: [message(code: 'workout.label', default: 'Workout'), workoutInstance.id])
        redirect(action: "editWorkout", id: workoutInstance?.id)
    }

    def delete() {
        def workoutInstance = Workout.get(params.id)
        if (!workoutInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'workout.label', default: 'Workout'), params.id])
            redirect(action: "list")
            return
        }

        try {
            workoutInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'workout.label', default: 'Workout'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'workout.label', default: 'Workout'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
