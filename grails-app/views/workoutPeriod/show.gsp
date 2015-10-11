
<%@ page import="com.doobs.workout.WorkoutPeriod" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'workoutPeriod.label', default: 'WorkoutPeriod')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-workoutPeriod" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-workoutPeriod" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list workoutPeriod">
			
				<g:if test="${workoutPeriodInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="workoutPeriod.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${workoutPeriodInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${workoutPeriodInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="workoutPeriod.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${workoutPeriodInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${workoutPeriodInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="workoutPeriod.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${workoutPeriodInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${workoutPeriodInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="workoutPeriod.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${workoutPeriodInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${workoutPeriodInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="workoutPeriod.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${workoutPeriodInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${workoutPeriodInstance?.rating}">
				<li class="fieldcontain">
					<span id="rating-label" class="property-label"><g:message code="workoutPeriod.rating.label" default="Rating" /></span>
					
						<span class="property-value" aria-labelledby="rating-label"><g:fieldValue bean="${workoutPeriodInstance}" field="rating"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${workoutPeriodInstance?.year}">
				<li class="fieldcontain">
					<span id="year-label" class="property-label"><g:message code="workoutPeriod.year.label" default="Year" /></span>
					
						<span class="property-value" aria-labelledby="year-label"><g:link controller="workoutYear" action="show" id="${workoutPeriodInstance?.year?.id}">${workoutPeriodInstance?.year?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${workoutPeriodInstance?.id}" />
					<g:link class="edit" action="edit" id="${workoutPeriodInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
