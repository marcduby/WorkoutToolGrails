
<%@ page import="com.doobs.workout.Workout" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'workout.label', default: 'Workout')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-workout" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-workout" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list workout">
			
				<g:if test="${workoutInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="workout.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${workoutInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${workoutInstance?.day}">
				<li class="fieldcontain">
					<span id="day-label" class="property-label"><g:message code="workout.day.label" default="Day" /></span>
					
						<span class="property-value" aria-labelledby="day-label"><g:link controller="workoutDay" action="show" id="${workoutInstance?.day?.id}">${workoutInstance?.day?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${workoutInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="workout.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${workoutInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${workoutInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="workout.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${workoutInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${workoutInstance?.rating}">
				<li class="fieldcontain">
					<span id="rating-label" class="property-label"><g:message code="workout.rating.label" default="Rating" /></span>
					
						<span class="property-value" aria-labelledby="rating-label"><g:fieldValue bean="${workoutInstance}" field="rating"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${workoutInstance?.time}">
				<li class="fieldcontain">
					<span id="time-label" class="property-label"><g:message code="workout.time.label" default="Time" /></span>
					
						<span class="property-value" aria-labelledby="time-label"><g:formatDate date="${workoutInstance?.time}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${workoutInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="workout.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:link controller="workoutType" action="show" id="${workoutInstance?.type?.id}">${workoutInstance?.type?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${workoutInstance?.id}" />
					<g:link class="edit" action="edit" id="${workoutInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
