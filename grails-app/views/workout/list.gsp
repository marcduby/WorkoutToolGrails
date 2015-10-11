
<%@ page import="com.doobs.workout.Workout" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'workout.label', default: 'Workout')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-workout" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list" params="[periodId: workoutWeekInstance?.period?.id]" controller="workoutWeek">Back to week list</g:link></li>
			</ul>
		</div>
		<div id="list-workout" class="content scaffold-list" role="main">
			<h1>Workout List for <g:link controller="workoutWeek" action="list" params="[periodId: workoutWeekInstance?.period?.id]"> Week ${fieldValue(bean: workoutWeekInstance, field: "name")}</g:link> with ${workoutDayCommandList?.size()} workouts</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<th><g:message code="workout.day.label" default="Day/Time" /></th>

						<th>Overdistance</th>
						
						<th>Endurance</th>
						
						<th>Strength</th>
						
						<th>Intensity</th>
						
						<th>Vertical</th>
						
						<th>AT</th>
						
						<th>Speed</th>
						
						<th>Race</th>
						
						<th>Total</th>
					
						<th>Percent</th>
					</tr>
				</thead>
				<tbody>
				<g:render template="dayWorkoutView" collection="${workoutDayCommandList}" var="workoutDayCommandInstance"/>
				
					<tr class="totalYellow">
					
						<td><strong>Total</strong></td>
					
						<td>${fieldValue(bean: workoutWeekInstance, field: "overdistance")}</td>
						
						<td>${fieldValue(bean: workoutWeekInstance, field: "endurance")}</td>
						
						<td>${fieldValue(bean: workoutWeekInstance, field: "strength")}</td>
						
						<td>${fieldValue(bean: workoutWeekInstance, field: "intensity")}</td>
						
						<td>${fieldValue(bean: workoutWeekInstance, field: "vertical")}</td>
						
						<td>${fieldValue(bean: workoutWeekInstance, field: "anaerobicThreshold")}</td>
						
						<td>${fieldValue(bean: workoutWeekInstance, field: "speed")}</td>
						
						<td>${fieldValue(bean: workoutWeekInstance, field: "race")}</td>
						
						<td>${fieldValue(bean: workoutWeekInstance, field: "total")}</td>
						
						<td>&nbsp;</td>
						
					</tr>
					
					<g:if test="${(workoutWeekInstance?.total > 0)}">
					<tr class="totalGrey">
						<td><strong>&nbsp;</strong></td>
						<td><g:formatNumber number="${(100 * workoutWeekInstance?.overdistance)/workoutWeekInstance?.total}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutWeekInstance?.endurance)/workoutWeekInstance?.total}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutWeekInstance?.strength)/workoutWeekInstance?.total}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutWeekInstance?.intensity)/workoutWeekInstance?.total}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutWeekInstance?.vertical)/workoutWeekInstance?.total}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutWeekInstance?.anaerobicThreshold)/workoutWeekInstance?.total}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutWeekInstance?.speed)/workoutWeekInstance?.total}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutWeekInstance?.race)/workoutWeekInstance?.total}" type="number" maxFractionDigits="0"/>%</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					</g:if>
					<g:else>
					<tr class="totalGrey">
						<td>&nbsp;</td>
					  <g:each var="i" in="${ (0..<8) }">
						<td>0%</td>
					  </g:each>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					</g:else>
				</tbody>
			</table>
		</div>
	</body>
</html>
