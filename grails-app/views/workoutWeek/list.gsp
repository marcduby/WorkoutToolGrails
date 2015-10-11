
<%@ page import="com.doobs.workout.WorkoutWeek" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'workoutWeek.label', default: 'WorkoutWeek')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-workoutWeek" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list" params="[yearId: workoutPeriodInstance?.year?.id]" controller="workoutPeriod">Back to period list</g:link></li>
			</ul>
		</div>
		<div id="list-workoutWeek" class="content scaffold-list" role="main">
			<h1>Week List for Period ${workoutPeriodInstance?.name} of Year ${workoutPeriodInstance?.year?.name}</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="name" title="${message(code: 'workoutWeek.name.label', default: 'Name')}" />
						
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
				<g:each in="${workoutWeekInstanceList}" status="i" var="workoutWeekInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><strong><g:link action="list" params="[weekId: workoutWeekInstance.id]" controller="workout">Week ${fieldValue(bean: workoutWeekInstance, field: "name")}</g:link></strong></td>
					
						<td>${fieldValue(bean: workoutWeekInstance, field: "overdistance")}</td>
						
						<td>${fieldValue(bean: workoutWeekInstance, field: "endurance")}</td>
						
						<td>${fieldValue(bean: workoutWeekInstance, field: "strength")}</td>
						
						<td>${fieldValue(bean: workoutWeekInstance, field: "intensity")}</td>
						
						<td>${fieldValue(bean: workoutWeekInstance, field: "vertical")}</td>
						
						<td>${fieldValue(bean: workoutWeekInstance, field: "anaerobicThreshold")}</td>
						
						<td>${fieldValue(bean: workoutWeekInstance, field: "speed")}</td>
						
						<td>${fieldValue(bean: workoutWeekInstance, field: "race")}</td>
						
						<td>${fieldValue(bean: workoutWeekInstance, field: "total")}</td>

						<g:if test="${(workoutWeekInstance?.total > 0)}">
						<td><g:formatNumber number="${(100 * workoutWeekInstance?.total)/workoutPeriodInstance?.total}" type="number" maxFractionDigits="0"/>%</td>
						</g:if>
						<g:else>
						<td>0%</td>
						</g:else>
						
					</tr>
				</g:each>
					
					<tr class="totalYellow">
					
						<td><strong>Total</strong></td>
					
						<td>${fieldValue(bean: workoutPeriodInstance, field: "overdistance")}</td>
						
						<td>${fieldValue(bean: workoutPeriodInstance, field: "endurance")}</td>
						
						<td>${fieldValue(bean: workoutPeriodInstance, field: "strength")}</td>
						
						<td>${fieldValue(bean: workoutPeriodInstance, field: "intensity")}</td>
						
						<td>${fieldValue(bean: workoutPeriodInstance, field: "vertical")}</td>
						
						<td>${fieldValue(bean: workoutPeriodInstance, field: "anaerobicThreshold")}</td>
						
						<td>${fieldValue(bean: workoutPeriodInstance, field: "speed")}</td>
						
						<td>${fieldValue(bean: workoutPeriodInstance, field: "race")}</td>
						
						<td>${fieldValue(bean: workoutPeriodInstance, field: "total")}</td>
						
						<td>&nbsp;</td>
						
					</tr>
					
					<g:if test="${(workoutPeriodInstance?.total > 0)}">
					<tr class="totalGrey">
						<td><strong>&nbsp;</strong></td>
						<td><g:formatNumber number="${(100 * workoutPeriodInstance?.overdistance)/workoutPeriodInstance?.total}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutPeriodInstance?.endurance)/workoutPeriodInstance?.total}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutPeriodInstance?.strength)/workoutPeriodInstance?.total}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutPeriodInstance?.intensity)/workoutPeriodInstance?.total}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutPeriodInstance?.vertical)/workoutPeriodInstance?.total}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutPeriodInstance?.anaerobicThreshold)/workoutPeriodInstance?.total}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutPeriodInstance?.speed)/workoutPeriodInstance?.total}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutPeriodInstance?.race)/workoutPeriodInstance?.total}" type="number" maxFractionDigits="0"/>%</td>
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
		
		
		<div id="list-workoutActivityWeek" class="content scaffold-list" role="main">
			<h1>Week List for Period ${workoutPeriodInstance?.name} of Year ${workoutPeriodInstance?.year?.name}</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="name" title="${message(code: 'workoutWeek.name.label', default: 'Name')}" />
						
						<th>Row</th>
						
						<th>Erg</th>
						
						<th>Bike</th>
						
						<th>Run</th>
						
						<th>Lift</th>
						
						<th>Skate</th>
						
						<th>Swim</th>
						
						<th>Xski</th>
						
						<th>Bball</th>
						
						<th>Stairs</th>
						
						<th>Jrope</th>
						
						<th>Other</th>
						
						<th>Total</th>
						
						<th>Percent</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${workoutWeekInstanceList}" status="i" var="workoutWeekInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><strong><g:link action="list" params="[weekId: workoutWeekInstance.id]" controller="workout">Week ${fieldValue(bean: workoutWeekInstance, field: "name")}</g:link></strong></td>
					
						<td>${fieldValue(bean: workoutWeekInstance, field: "row")}</td>
						
						<td>${fieldValue(bean: workoutWeekInstance, field: "erg")}</td>
						
						<td>${fieldValue(bean: workoutWeekInstance, field: "bike")}</td>
						
						<td>${fieldValue(bean: workoutWeekInstance, field: "run")}</td>
						
						<td>${fieldValue(bean: workoutWeekInstance, field: "lift")}</td>
						
						<td>${fieldValue(bean: workoutWeekInstance, field: "skate")}</td>
						
						<td>${fieldValue(bean: workoutWeekInstance, field: "swim")}</td>
						
						<td>${fieldValue(bean: workoutWeekInstance, field: "crossCountrySki")}</td>
						
						<td>${fieldValue(bean: workoutWeekInstance, field: "basketball")}</td>
						
						<td>${fieldValue(bean: workoutWeekInstance, field: "stairs")}</td>
						
						<td>${fieldValue(bean: workoutWeekInstance, field: "jumpRope")}</td>
						
						<td>${fieldValue(bean: workoutWeekInstance, field: "other")}</td>
						
						<td>${fieldValue(bean: workoutWeekInstance, field: "activityTotal")}</td>

						<g:if test="${(workoutWeekInstance?.activityTotal > 0)}">
						<td><g:formatNumber number="${(100 * workoutWeekInstance?.activityTotal)/workoutPeriodInstance?.activityTotal}" type="number" maxFractionDigits="0"/>%</td>
						</g:if>
						<g:else>
						<td>0%</td>
						</g:else>
						
					</tr>
				</g:each>
					
					<tr class="totalYellow">
					
						<td><strong>Total</strong></td>
					
						<td>${fieldValue(bean: workoutPeriodInstance, field: "row")}</td>
						
						<td>${fieldValue(bean: workoutPeriodInstance, field: "erg")}</td>
						
						<td>${fieldValue(bean: workoutPeriodInstance, field: "bike")}</td>
						
						<td>${fieldValue(bean: workoutPeriodInstance, field: "run")}</td>
						
						<td>${fieldValue(bean: workoutPeriodInstance, field: "lift")}</td>
						
						<td>${fieldValue(bean: workoutPeriodInstance, field: "skate")}</td>
						
						<td>${fieldValue(bean: workoutPeriodInstance, field: "swim")}</td>
						
						<td>${fieldValue(bean: workoutPeriodInstance, field: "crossCountrySki")}</td>
						
						<td>${fieldValue(bean: workoutPeriodInstance, field: "basketball")}</td>
						
						<td>${fieldValue(bean: workoutPeriodInstance, field: "stairs")}</td>
						
						<td>${fieldValue(bean: workoutPeriodInstance, field: "jumpRope")}</td>
						
						<td>${fieldValue(bean: workoutPeriodInstance, field: "other")}</td>
						
						<td>${fieldValue(bean: workoutPeriodInstance, field: "activityTotal")}</td>
						
						<td>&nbsp;</td>
						
					</tr>
					
					<g:if test="${(workoutPeriodInstance?.activityTotal > 0)}">
					<tr class="totalGrey">
						<td><strong>&nbsp;</strong></td>
						<td><g:formatNumber number="${(100 * workoutPeriodInstance?.row)/workoutPeriodInstance?.activityTotal}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutPeriodInstance?.erg)/workoutPeriodInstance?.activityTotal}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutPeriodInstance?.bike)/workoutPeriodInstance?.activityTotal}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutPeriodInstance?.run)/workoutPeriodInstance?.activityTotal}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutPeriodInstance?.lift)/workoutPeriodInstance?.activityTotal}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutPeriodInstance?.skate)/workoutPeriodInstance?.activityTotal}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutPeriodInstance?.swim)/workoutPeriodInstance?.activityTotal}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutPeriodInstance?.crossCountrySki)/workoutPeriodInstance?.activityTotal}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutPeriodInstance?.basketball)/workoutPeriodInstance?.activityTotal}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutPeriodInstance?.stairs)/workoutPeriodInstance?.activityTotal}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutPeriodInstance?.jumpRope)/workoutPeriodInstance?.activityTotal}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutPeriodInstance?.other)/workoutPeriodInstance?.activityTotal}" type="number" maxFractionDigits="0"/>%</td>
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
