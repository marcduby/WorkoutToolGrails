
<%@ page import="com.doobs.workout.WorkoutYear" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'workoutYear.label', default: 'WorkoutYear')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-workoutYear" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-workoutYear" class="content scaffold-list" role="main">
			<h1>Year List</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="name" title="${message(code: 'workoutYear.name.label', default: 'Name')}" />
					
						<th>Overdistance</th>
						
						<th>Endurance</th>
						
						<th>Strength</th>
						
						<th>Intensity</th>
						
						<th>Vertical</th>
						
						<th>AT</th>
						
						<th>Speed</th>
						
						<th>Race</th>
						
						<th>Total</th>
						
						<g:sortableColumn property="rating" title="${message(code: 'workoutYear.rating.label', default: 'Rating')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${workoutYearInstanceList}" status="i" var="workoutYearInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="list" params="[yearId:workoutYearInstance.id]" controller="workoutPeriod">${fieldValue(bean: workoutYearInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: workoutYearInstance, field: "overdistance")}</td>
						
						<td>${fieldValue(bean: workoutYearInstance, field: "endurance")}</td>
						
						<td>${fieldValue(bean: workoutYearInstance, field: "strength")}</td>
						
						<td>${fieldValue(bean: workoutYearInstance, field: "intensity")}</td>
						
						<td>${fieldValue(bean: workoutYearInstance, field: "vertical")}</td>
						
						<td>${fieldValue(bean: workoutYearInstance, field: "anaerobicThreshold")}</td>
						
						<td>${fieldValue(bean: workoutYearInstance, field: "speed")}</td>
						
						<td>${fieldValue(bean: workoutYearInstance, field: "race")}</td>
						
						<td>${fieldValue(bean: workoutYearInstance, field: "total")}</td>
						
						<td>${fieldValue(bean: workoutYearInstance, field: "rating")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
	</body>
</html>
