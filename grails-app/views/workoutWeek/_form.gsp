<%@ page import="com.doobs.workout.WorkoutWeek" %>



<div class="fieldcontain ${hasErrors(bean: workoutWeekInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="workoutWeek.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${workoutWeekInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workoutWeekInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="workoutWeek.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${workoutWeekInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workoutWeekInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="workoutWeek.notes.label" default="Notes" />
		
	</label>
	<g:textField name="notes" value="${workoutWeekInstance?.notes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workoutWeekInstance, field: 'period', 'error')} required">
	<label for="period">
		<g:message code="workoutWeek.period.label" default="Period" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="period" name="period.id" from="${com.doobs.workout.WorkoutPeriod.list()}" optionKey="id" required="" value="${workoutWeekInstance?.period?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workoutWeekInstance, field: 'rating', 'error')} required">
	<label for="rating">
		<g:message code="workoutWeek.rating.label" default="Rating" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="rating" required="" value="${workoutWeekInstance.rating}"/>
</div>

