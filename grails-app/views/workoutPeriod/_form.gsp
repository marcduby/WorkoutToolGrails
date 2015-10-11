<%@ page import="com.doobs.workout.WorkoutPeriod" %>



<div class="fieldcontain ${hasErrors(bean: workoutPeriodInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="workoutPeriod.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${workoutPeriodInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workoutPeriodInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="workoutPeriod.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${workoutPeriodInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workoutPeriodInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="workoutPeriod.notes.label" default="Notes" />
		
	</label>
	<g:textField name="notes" value="${workoutPeriodInstance?.notes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workoutPeriodInstance, field: 'rating', 'error')} required">
	<label for="rating">
		<g:message code="workoutPeriod.rating.label" default="Rating" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="rating" required="" value="${workoutPeriodInstance.rating}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workoutPeriodInstance, field: 'year', 'error')} required">
	<label for="year">
		<g:message code="workoutPeriod.year.label" default="Year" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="year" name="year.id" from="${com.doobs.workout.WorkoutYear.list()}" optionKey="id" required="" value="${workoutPeriodInstance?.year?.id}" class="many-to-one"/>
</div>

