
<%@ page import="com.doobs.workout.WorkoutWeek" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'workoutWeek.label', default: 'WorkoutWeek')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-workoutWeek" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-workoutWeek" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list workoutWeek">
			
				<g:if test="${workoutWeekInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="workoutWeek.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${workoutWeekInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${workoutWeekInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="workoutWeek.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${workoutWeekInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${workoutWeekInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="workoutWeek.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${workoutWeekInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${workoutWeekInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="workoutWeek.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${workoutWeekInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${workoutWeekInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="workoutWeek.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${workoutWeekInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${workoutWeekInstance?.period}">
				<li class="fieldcontain">
					<span id="period-label" class="property-label"><g:message code="workoutWeek.period.label" default="Period" /></span>
					
						<span class="property-value" aria-labelledby="period-label"><g:link controller="workoutPeriod" action="show" id="${workoutWeekInstance?.period?.id}">${workoutWeekInstance?.period?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${workoutWeekInstance?.rating}">
				<li class="fieldcontain">
					<span id="rating-label" class="property-label"><g:message code="workoutWeek.rating.label" default="Rating" /></span>
					
						<span class="property-value" aria-labelledby="rating-label"><g:fieldValue bean="${workoutWeekInstance}" field="rating"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${workoutWeekInstance?.id}" />
					<g:link class="edit" action="edit" id="${workoutWeekInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
