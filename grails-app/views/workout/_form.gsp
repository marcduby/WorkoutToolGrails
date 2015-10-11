<%@ page import="com.doobs.workout.Workout" %>



<div class="fieldcontain ${hasErrors(bean: workoutInstance, field: 'day', 'error')} required">
	<label for="day">
		<g:message code="workout.day.label" default="Day" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="day" name="day.id" from="${com.doobs.workout.WorkoutDay.list()}" optionKey="id" required="" value="${workoutInstance?.day?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workoutInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="workout.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${workoutInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workoutInstance, field: 'rating', 'error')} required">
	<label for="rating">
		<g:message code="workout.rating.label" default="Rating" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="rating" required="" value="${workoutInstance.rating}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workoutInstance, field: 'time', 'error')} required">
	<label for="time">
		<g:message code="workout.time.label" default="Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="time" precision="day"  value="${workoutInstance?.time}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: workoutInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="workout.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="type" name="type.id" from="${com.doobs.workout.WorkoutType.list()}" optionKey="id" required="" value="${workoutInstance?.type?.id}" class="many-to-one"/>
</div>

