<tr bgcolor="#ffffcc">
  <td>
    <center>
    <g:link controller="workout" class="list" action="createWorkout" params="[dayId: workoutDayCommandInstance?.workoutDay?.id]"><g:formatDate format="EEE, MMM d" date="${workoutDayCommandInstance?.workoutDay?.date}"/></g:link>
    </center>
  </td>
  <td colspan="9">
    <center>&nbsp;</center>
  </td>
  <td>
	Notes
  </td>
</tr>
<g:each in="${workoutDayCommandInstance?.workoutIntensityList}" status="i" var="workoutIntensityInstance">
	<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
	
		<td><g:link action="editWorkout" id="${workoutIntensityInstance.id}"><g:formatDate format="h:mm a" date="${workoutIntensityInstance?.workout?.time}"/></g:link></td>
	
		<td>${fieldValue(bean: workoutIntensityInstance, field: "overdistanceAmount")}</td>
		
		<td>${fieldValue(bean: workoutIntensityInstance, field: "enduranceAmount")}</td>
		
		<td>${fieldValue(bean: workoutIntensityInstance, field: "strengthAmount")}</td>
		
		<td>${fieldValue(bean: workoutIntensityInstance, field: "intensityAmount")}</td>
		
		<td>${fieldValue(bean: workoutIntensityInstance, field: "verticalAmount")}</td>
		
		<td>${fieldValue(bean: workoutIntensityInstance, field: "anaerobicThresholdAmount")}</td>
		
		<td>${fieldValue(bean: workoutIntensityInstance, field: "speedAmount")}</td>
		
		<td>${fieldValue(bean: workoutIntensityInstance, field: "raceAmount")}</td>
		
		<td>${fieldValue(bean: workoutIntensityInstance, field: "total")}</td>
		
		<g:if test="${(workoutIntensityInstance?.workout?.day?.week?.total > 0)}">
		<td><g:formatNumber number="${(100 * workoutIntensityInstance?.total)/workoutIntensityInstance?.workout?.day?.week?.total}" type="number" maxFractionDigits="0"/>%</td>
		</g:if>
		<g:else>
		<td>0%</td>
		</g:else>
		
	</tr>
</g:each>
		