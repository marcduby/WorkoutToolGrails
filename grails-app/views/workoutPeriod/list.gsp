
<%@ page import="com.doobs.workout.WorkoutPeriod" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'workoutPeriod.label', default: 'WorkoutPeriod')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-workoutPeriod" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list" controller="workoutYear">Back to year list</g:link></li>
			</ul>
		</div>
		<div id="list-workoutPeriod" class="content scaffold-list" role="main">
			<h1>Periods for Year ${fieldValue(bean: workoutYearInstance, field: "name")}</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="description" title="${message(code: 'workoutPeriod.description.label', default: 'Description')}" />

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
				<g:each in="${workoutPeriodInstanceList}" status="i" var="workoutPeriodInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><strong><g:link action="list" params="[periodId:workoutPeriodInstance?.id]" controller="workoutWeek">Period ${fieldValue(bean: workoutPeriodInstance, field: "name")}</g:link></strong></td>
					
						<td>${fieldValue(bean: workoutPeriodInstance, field: "overdistance")}</td>
						
						<td>${fieldValue(bean: workoutPeriodInstance, field: "endurance")}</td>
						
						<td>${fieldValue(bean: workoutPeriodInstance, field: "strength")}</td>
						
						<td>${fieldValue(bean: workoutPeriodInstance, field: "intensity")}</td>
						
						<td>${fieldValue(bean: workoutPeriodInstance, field: "vertical")}</td>
						
						<td>${fieldValue(bean: workoutPeriodInstance, field: "anaerobicThreshold")}</td>
						
						<td>${fieldValue(bean: workoutPeriodInstance, field: "speed")}</td>
						
						<td>${fieldValue(bean: workoutPeriodInstance, field: "race")}</td>
						
						<td>${fieldValue(bean: workoutPeriodInstance, field: "total")}</td>
						
						<g:if test="${(workoutPeriodInstance?.total > 0)}">
						<td><g:formatNumber number="${(100 * workoutPeriodInstance?.total)/workoutYearInstance?.total}" type="number" maxFractionDigits="0"/>%</td>
						</g:if>
						<g:else>
						<td>0%</td>
						</g:else>
						
					</tr>
				</g:each>
					
					<tr class="totalYellow">
					
						<td><strong>Total</strong></td>
					
						<td>${fieldValue(bean: workoutYearInstance, field: "overdistance")}</td>
						
						<td>${fieldValue(bean: workoutYearInstance, field: "endurance")}</td>
						
						<td>${fieldValue(bean: workoutYearInstance, field: "strength")}</td>
						
						<td>${fieldValue(bean: workoutYearInstance, field: "intensity")}</td>
						
						<td>${fieldValue(bean: workoutYearInstance, field: "vertical")}</td>
						
						<td>${fieldValue(bean: workoutYearInstance, field: "anaerobicThreshold")}</td>
						
						<td>${fieldValue(bean: workoutYearInstance, field: "speed")}</td>
						
						<td>${fieldValue(bean: workoutYearInstance, field: "race")}</td>
						
						<td>${fieldValue(bean: workoutYearInstance, field: "total")}</td>
						
						<td>&nbsp;</td>
						
					</tr>
					
					<g:if test="${(workoutYearInstance?.total > 0)}">
					<tr class="totalGrey">
						<td><strong>&nbsp;</strong></td>
						<td><g:formatNumber number="${(100 * workoutYearInstance?.overdistance)/workoutYearInstance?.total}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutYearInstance?.endurance)/workoutYearInstance?.total}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutYearInstance?.strength)/workoutYearInstance?.total}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutYearInstance?.intensity)/workoutYearInstance?.total}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutYearInstance?.vertical)/workoutYearInstance?.total}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutYearInstance?.anaerobicThreshold)/workoutYearInstance?.total}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutYearInstance?.speed)/workoutYearInstance?.total}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutYearInstance?.race)/workoutYearInstance?.total}" type="number" maxFractionDigits="0"/>%</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
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

		<div id="list-workoutActivityPeriod" class="content scaffold-list" role="main">
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
				<g:each in="${workoutPeriodInstanceList}" status="i" var="workoutPeriodInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><strong><g:link action="list" params="[periodId:workoutPeriodInstance?.id]" controller="workoutWeek">Period ${fieldValue(bean: workoutPeriodInstance, field: "name")}</g:link></strong></td>
					
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

						<g:if test="${(workoutPeriodInstance?.activityTotal > 0)}">
						<td><g:formatNumber number="${(100 * workoutPeriodInstance?.activityTotal)/workoutYearInstance?.activityTotal}" type="number" maxFractionDigits="0"/>%</td>
						</g:if>
						<g:else>
						<td>0%</td>
						</g:else>
						
					</tr>
				</g:each>
					
					<tr class="totalYellow">
					
						<td><strong>Total</strong></td>
					
						<td>${fieldValue(bean: workoutYearInstance, field: "row")}</td>
						
						<td>${fieldValue(bean: workoutYearInstance, field: "erg")}</td>
						
						<td>${fieldValue(bean: workoutYearInstance, field: "bike")}</td>
						
						<td>${fieldValue(bean: workoutYearInstance, field: "run")}</td>
						
						<td>${fieldValue(bean: workoutYearInstance, field: "lift")}</td>
						
						<td>${fieldValue(bean: workoutYearInstance, field: "skate")}</td>
						
						<td>${fieldValue(bean: workoutYearInstance, field: "swim")}</td>
						
						<td>${fieldValue(bean: workoutYearInstance, field: "crossCountrySki")}</td>
						
						<td>${fieldValue(bean: workoutYearInstance, field: "basketball")}</td>
						
						<td>${fieldValue(bean: workoutYearInstance, field: "stairs")}</td>
						
						<td>${fieldValue(bean: workoutYearInstance, field: "jumpRope")}</td>
						
						<td>${fieldValue(bean: workoutYearInstance, field: "other")}</td>
						
						<td>${fieldValue(bean: workoutYearInstance, field: "activityTotal")}</td>
						
						<td>&nbsp;</td>
						
					</tr>
					
					<g:if test="${(workoutYearInstance?.activityTotal > 0)}">
					<tr class="totalGrey">
						<td><strong>&nbsp;</strong></td>
						<td><g:formatNumber number="${(100 * workoutYearInstance?.row)/workoutYearInstance?.activityTotal}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutYearInstance?.erg)/workoutYearInstance?.activityTotal}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutYearInstance?.bike)/workoutYearInstance?.activityTotal}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutYearInstance?.run)/workoutYearInstance?.activityTotal}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutYearInstance?.lift)/workoutYearInstance?.activityTotal}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutYearInstance?.skate)/workoutYearInstance?.activityTotal}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutYearInstance?.swim)/workoutYearInstance?.activityTotal}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutYearInstance?.crossCountrySki)/workoutYearInstance?.activityTotal}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutYearInstance?.basketball)/workoutYearInstance?.activityTotal}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutYearInstance?.stairs)/workoutYearInstance?.activityTotal}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutYearInstance?.jumpRope)/workoutYearInstance?.activityTotal}" type="number" maxFractionDigits="0"/>%</td>
						<td><g:formatNumber number="${(100 * workoutYearInstance?.other)/workoutYearInstance?.activityTotal}" type="number" maxFractionDigits="0"/>%</td>
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
