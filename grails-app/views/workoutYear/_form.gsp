<%@ page import="com.doobs.workout.WorkoutYear" %>



<div class="fieldcontain ${hasErrors(bean: workoutYearInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="workoutYear.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${workoutYearInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workoutYearInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="workoutYear.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${workoutYearInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workoutYearInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="workoutYear.notes.label" default="Notes" />
		
	</label>
	<g:textField name="notes" value="${workoutYearInstance?.notes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workoutYearInstance, field: 'rating', 'error')} required">
	<label for="rating">
		<g:message code="workoutYear.rating.label" default="Rating" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="rating" required="" value="${workoutYearInstance.rating}"/>
</div>

