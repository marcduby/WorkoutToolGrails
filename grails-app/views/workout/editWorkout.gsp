<%@ page import="com.doobs.workout.Workout" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'workout.label', default: 'Workout')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
<script type="text/javascript">
  	$(document).ready(function() {
//  	  	alert("777");
  	  	calcIntensity();
  	  	calcActivity();
  	  	
  		$(".int").change(function() {
//  			alert("test int");
  	  	  	calcIntensity();
  		});
  		$(".act").change(function() {
//			alert("test int");
	  	  	calcActivity();
		});

  		$("#modify_form").submit(function() {
  	  		return verify();
  		});
	});

  	function verify() {
  	  	var intTotal = parseInt($("#int_total").val(), 10);
  	  	var actTotal = parseInt($("#act_total").val(), 10);

  	  	if (intTotal != actTotal) {
  	  	  	alert("Intensity total: " + intTotal + " does not match the activity total: " + actTotal);
  	  	  	return false;
  	  	} else {
  	  	  	return true;
  	  	}
  	}

	function calcIntensity() {
		var intTotal = 0;
		
		$(".int").each(function() {
		    intTotal += parseInt(this.value, 10);
		});
//		alert("int: " + intTotal);
		$("#int_total").val(intTotal);
	}

	function calcActivity() {
		var actTotal = 0;
		
		$(".act").each(function() {
		    actTotal += parseInt(this.value, 10);
		});
//		alert("act: " + actTotal);
		$("#act_total").val(actTotal);
	}
	
</script>
<div class="nav" role="navigation">
	<ul>
		<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
		<li><g:link controller="workout" class="list" action="list" params="[weekId: workoutBean?.day?.week?.id]">Back to workout list</g:link></li>
	</ul>
</div>
<div id="modify-workout" class="content scaffold-list" role="main">

<h1>Modify Workout ${workoutBean?.name } (${workoutBean?.id}) from 
<g:link controller="workout" class="list" action="list" params="[weekId: workoutBean?.day?.week?.id]">Week ${workoutBean?.day?.week?.name}</g:link> </h1>
			<g:hasErrors bean="${workoutBean}">
			<ul class="errors" role="alert">
				<g:eachError bean="${workoutBean}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
<g:form name="modify_form" id="${workoutBean?.id }" action="saveWorkout">
<input type="hidden" name="id" value="${workoutBean?.id}">
<table border="0" width="100%">
  <tr>
    <td bgcolor="#ffffcc">
      <table width="100%">
        <tr>
          <td colspan="2">
	    <center><b>Intensity Numbers</b></center>
          </td>
        </tr>
        <tr>
          <td>
		Overdistance
          </td>
          <td>
            <input type="text" class="int" id="overdistance" name="intensity.overdistanceAmount" value="${workoutBean?.intensity?.overdistanceAmount}" size="5" onFocus="select()" onChange="add_intensity()">
          </td>
        </tr>
        <tr>
          <td>
		Endurance
          </td>
          <td>
            <input type="text" class="int" id="endurance" name="intensity.enduranceAmount" value="${workoutBean?.intensity?.enduranceAmount}" size="5" onFocus="select()" onChange="add_intensity()">
          </td>
        </tr>
        <tr>
          <td>
		Strength
          </td>
          <td>
            <input type="text" class="int" id="strength" name="intensity.strengthAmount" value="${workoutBean?.intensity?.strengthAmount}" size="5" onFocus="select()" onChange="add_intensity()">
          </td>
        </tr>
        <tr>
          <td>
		Intensity
          </td>
          <td>
            <input type="text" class="int" id="intensity" name="intensity.intensityAmount" value="${workoutBean?.intensity?.intensityAmount}" size="5" onFocus="select()" onChange="add_intensity()">
          </td>
        </tr>
        <tr>
          <td>
		Vertical
          </td>
          <td>
            <input type="text" class="int" id="vertical" name="intensity.verticalAmount" value="${workoutBean?.intensity?.verticalAmount}" size="5" onFocus="select()" onChange="add_intensity()">
          </td>
        </tr>
        <tr>
          <td>
		Anaerobic Threshold
          </td>
          <td>
            <input type="text" class="int" id="at" name="intensity.anaerobicThresholdAmount" value="${workoutBean?.intensity?.anaerobicThresholdAmount}" size="5" onFocus="select()" onChange="add_intensity()">
          </td>
        </tr>
        <tr>
          <td>
		Speed
          </td>
          <td>
	    <input type="text" class="int" id="speed" name="intensity.speedAmount" value="${workoutBean?.intensity?.speedAmount}" size="5" onFocus="select()" onChange="add_intensity()">
          </td>
        </tr>
        <tr>
          <td>
		Race
          </td>
          <td>
            <input type="text" class="int" id="race" name="intensity.raceAmount" value="${workoutBean?.intensity?.raceAmount}" size="5" onFocus="select()" onChange="add_intensity()">
          </td>
        </tr>
        <tr>
          <td>
                <b>Total</b>
          </td>
          <td>
            <input type="text" name="intensity_total" id="int_total" value="" size="5">
          </td>
        </tr>
      </table>
    </td>
    <td bgcolor="ccff99">
      <table width="100%">
        <tr>
          <td colspan="2">
            <center><b>Activity Numbers</b></center>
          </td>
        </tr>
        <tr>
          <td>
                Row
          </td>
          <td>
            <input type="text" class="act" id="row" name="activity.rowAmount" value="${workoutBean?.activity?.rowAmount}" size="5" onFocus="select()" onChange="add_activity()">
          </td>
        </tr>
        <tr>
          <td>
		Erg
          </td>
          <td>
            <input type="text" class="act" id="erg" name="activity.ergAmount" value="${workoutBean?.activity?.ergAmount}" size="5" onFocus="select()" onChange="add_activity()">
          </td>
        </tr>
        <tr>
          <td>
		Bike
          </td>
          <td>
            <input type="text" class="act" id="bike" name="activity.bikeAmount" value="${workoutBean?.activity?.bikeAmount}" size="5" onFocus="select()" onChange="add_activity()">
          </td>
        </tr>
        <tr>
          <td>
		Skate
          </td>
          <td>
            <input type="text" class="act" id="skate" name="activity.skateAmount" value="${workoutBean?.activity?.skateAmount}" size="5" onFocus="select()" onChange="add_activity()">
          </td>
        </tr>
        <tr>
          <td>
		Run
          </td>
          <td>
            <input type="text" class="act" id="run" name="activity.runAmount" value="${workoutBean?.activity?.runAmount}" size="5" onFocus="select()" onChange="add_activity()">
          </td>
        </tr>
        <tr>
          <td>
		Swim
          </td>
          <td>
            <input type="text" class="act" id="swim" name="activity.swimAmount" value="${workoutBean?.activity?.swimAmount}" size="5" onFocus="select()" onChange="add_activity()">
          </td>
        </tr>
        <tr>
          <td>
		Stairs
          </td>
          <td>
            <input type="text" class="act" id="stairs" name="activity.stairsAmount" value="${workoutBean?.activity?.stairsAmount}" size="5" onFocus="select()" onChange="add_activity()">
          </td>
        </tr>
        <tr>
          <td>
		B_ball
          </td>
          <td>
            <input type="text" class="act" id="b_ball" name="activity.bBallAmount" value="${workoutBean?.activity?.bBallAmount}" size="5" onFocus="select()" onChange="add_activity()">
          </td>
        </tr>
        <tr>
          <td>
		Jump Rope
          </td>
          <td>
            <input type="text" class="act" id="jump_rope" name="activity.jumpRopeAmount" value="${workoutBean?.activity?.jumpRopeAmount}" size="5" onFocus="select()" onChange="add_activity()">
          </td>
        </tr>
        <tr>
          <td>
		Lift
          </td>
          <td>
            <input type="text" class="act" id="lift" name="activity.liftAmount" value="${workoutBean?.activity?.liftAmount}" size="5" onFocus="select()" onChange="add_activity()">
          </td>
        </tr>
        <tr>
          <td>
		X-country Ski
          </td>
          <td>
            <input type="text" class="act" id="xski" name="activity.xSkiAmount" value="${workoutBean?.activity?.xSkiAmount}" size="5" onFocus="select()" onChange="add_activity()">
          </td>
        </tr>
        <tr>
          <td>
		Other
          </td>
          <td>
            <input type="text" class="act" id="other" name="activity.otherAmount" value="${workoutBean?.activity?.otherAmount}" size="5" onFocus="select()" onChange="add_activity()">
          </td>
        </tr>
        <tr>
          <td>
		<b>Total</b>
          </td>
          <td>
            <input type="text" class="act_total" id="act_total" name="activity_total" value="" size="5">
          </td>
        </tr>
      </table>
    </td>
    <td bgcolor="#ffffcc">
      <table width="100%">
        <tr>
          <td colspan="4">
		<center><b>Day Attributes</b></center>
          </td>
        </tr>

        <tr>
          <td>
		<b>Heart Rate</b>
          </td>
          <td>
		<input type="text" class="day" id="heart_rate" name="day.heartRate" value="${workoutBean?.day?.heartRate}" size="5" onFocus="select()">
          </td>
          <td>
		<b>Muscle Soreness</b>
          </td>
          <td>
		<input type="text" class="day" id="muscle_soreness" name="day.heartRate" value="${workoutBean?.day?.heartRate}" size="5" onFocus="select()">
          </td>
        </tr>
        <tr>
          <td>  
                <b>Sleep</b>
          </td>
          <td>  
                <input type="text" class="day" id="sleep_amount" name="day.sleepAmount" value="${workoutBean?.day?.sleepAmount}" size="5" onFocus="select()" >
          </td>
          <td>  
                <b>Quality Sleep</b>
          </td>
          <td>  
                <input type="text" class="day" id="sleep_quality" name="day.sleepAmount" value="${workoutBean?.day?.sleepAmount}" size="5" onFocus="select()" >
          </td>
        </tr> 
        <tr>
          <td>  
                <b>Feel</b>
          </td>
          <td>  
                <input type="text" class="day" id="feel" name="day.feelRating" value="${workoutBean?.day?.feelRating}" size="5" onFocus="select()" >
          </td>
          <td>  
                <b>Motivation</b>
          </td>
          <td>  
                <input type="text" class="day" id="motivation" name="day.feelRating" value="${workoutBean?.day?.feelRating}" size="5" onFocus="select()" >
          </td>
        </tr> 
        <tr>
          <td>  
                <b>Weight</b>
          </td>
          <td>  
                <input type="text" class="day" id="weight" name="day.weight" value="${workoutBean?.day?.weight}" size="5" onFocus="select()" >
          </td>
          <td>  
                <b>Joints</b>
          </td>
          <td>  
                <input type="text" class="day" id="joints" name="day.weight" value="${workoutBean?.day?.weight}" size="5" onFocus="select()" >
          </td>
        </tr> 
        <tr>
          <td colspan="2">
		<center><b>Workout Attributes</b></center>
          </td>
        </tr>
        <tr>
          <td>
                <b>Time</b>
          </td>
          <td>
            <g:select id="time" from="${0..23}" optionValue="${{(it%12 == 0 ? 12 : it%12) + (it < 12 ? "AM" : "PM")} }" name="hour" value="${workoutBean?.hour}"/>
          </td>
        </tr>
        <tr>
          <td>
                <b>Rating</b>
          </td>
          <td>
            <g:select id="rating" from="${1..10}" name="rating" value="${workoutBean?.rating}"/>
          </td>
        </tr>
        <tr>
          <td>
                <b>Description</b>
          </td>
          <td>
	    <textarea name="description" cols="60" rows="5" onFocus="select()">${workoutBean?.description}</textarea>
          </td>
        </tr>
        <tr>
          <td>
                <b>Type</b>
          </td>
          <td>
		<g:select id="workoutTypeId" name="type.id" from="${workoutTypeList}" optionKey="id" optionValue="name" value="${workoutBean?.type?.id}"/>
          </td>
        </tr>
        <tr>
          <td colspan="2">
		&nbsp;<br>
                <center><input type="submit" name="enter" value="Submit Changes"></center>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</g:form>
</div>
</body>
