/*
 * File		LoadDay.java
 * Package	com.neigesoft.workout
 * Created 	June 18, 2005
 * Author	Marc Duby
 *
 * CVS		$Id: LoadDay.java,v 1.2 2005/06/20 01:35:16 javaprog Exp $
 */
package com.neigesoft.workout;

import java.sql.*;

/**
 * Class to load new years into the workout database
 *
 * @author 	Marc Duby
 * @version $Revision: 1.2 $
 */
public class LoadDay {

  private Connection connection;
  private PreparedStatement listYearStmt;
  private PreparedStatement insertPeriodStmt;
  private PreparedStatement insertWeekStmt;
  private PreparedStatement insertDayStmt;
  private PreparedStatement insertWorkoutStmt;
  private PreparedStatement insertIntensityStmt;
  private PreparedStatement insertActivityStmt;
  private PreparedStatement insertActivityPlanStmt;
  private PreparedStatement insertIntensityPlanStmt;

  public LoadDay() {
    String listYear = "select year_id, name_text from wkt_year";
    String insertPeriod = "insert into wkt_period (name, name_text, year_id, version, insert_date) values(?, ?, ?, 0, sysdate())"; 
    String insertWeek = "insert into wkt_week (name, name_text, period_id, version, insert_date) values(?, ?, ?, 0, sysdate())";
    String insertDay = "insert into wkt_day (week_id, date, version, insert_date) values(?, date_add(?, interval ? day), 0, sysdate())";
    String insertWorkout = "insert into wkt_workout (day_id, version, insert_date) values(?, 0, sysdate())";
    String insertIntensity = "insert into wkt_intensity (workout_id, version, insert_date) values(?, 0, sysdate())";
    String insertActivity = "insert into wkt_activity (workout_id, version, insert_date) values(?, 0, sysdate())";
    String insertIntensityPlan = "insert into wkt_intensity_plan (week_id, version, insert_date) values(?, 0, sysdate())";
    String insertActivityPlan = "insert into wkt_activity_plan (week_id, version, insert_date) values(?, 0, sysdate())";

    try {            // The newInstance() call is a work around for some
                    // broken Java implementations
//      Class.forName("org.gjt.mm.mysql.Driver").newInstance();
      Class.forName("com.mysql.jdbc.Driver").newInstance();
    } catch (Exception E) {
      System.err.println("Unable to load driver.");
      E.printStackTrace();
    }

    try {
//      connection = DriverManager.getConnection(
  //      "jdbc:mysql://10.1.135.188:3306/workout","bob","action");
      connection = DriverManager.getConnection(
              	// "jdbc:mysql://localhost:3306/workout","root","new_password");
              	// "jdbc:mysql://localhost:3306/workout?useSSL=false","root","new_password");
              	"jdbc:mysql://localhost:3306/workout?useSSL=false","root","yoyoma");
    } catch (Exception E) {
      E.printStackTrace();
      System.exit(0);

    }

    try {
      listYearStmt = connection.prepareStatement(listYear);
      insertPeriodStmt = connection.prepareStatement(insertPeriod);
      insertWeekStmt = connection.prepareStatement(insertWeek);
      insertDayStmt = connection.prepareStatement(insertDay);
      insertWorkoutStmt = connection.prepareStatement(insertWorkout);
      insertIntensityStmt = connection.prepareStatement(insertIntensity);
      insertActivityStmt = connection.prepareStatement(insertActivity);
      insertIntensityPlanStmt = connection.prepareStatement(insertIntensityPlan);
      insertActivityPlanStmt = connection.prepareStatement(insertActivityPlan);

    } catch (Exception E) {
      System.err.println("Unable to load prepare statements.");
      E.printStackTrace();
    }
  }

  public void listYear() {
    try {
      ResultSet result = listYearStmt.executeQuery();

      System.out.println("Got Results:\n");

      while(result.next()) {
        String name = result.getString(2);
        int id = result.getInt(1);

        System.out.println("Year: " + name + ", id: " + id + "\n");
      }

    } catch (Exception E) {
      System.out.println("YoYo Exception thrown: " + E.getMessage() + "\n\n");
      E.printStackTrace();
    }
  }

  public int insertPeriod(int periodNumber, int yearID, String yearName) {
    String periodName = yearName + " - " + periodNumber;
    int periodID = 0;

    try {
      insertPeriodStmt.clearParameters();
      insertPeriodStmt.setInt(1, periodNumber);
      insertPeriodStmt.setString(2, periodName);
      insertPeriodStmt.setInt(3, yearID);
      insertPeriodStmt.executeUpdate();

      Statement select = connection.createStatement();
      ResultSet result = select.executeQuery("select max(period_id) from wkt_period");
      while (result.next()) {
        periodID = result.getInt(1);
      }
      select.close();

    } catch (Exception E) {
      E.printStackTrace();
    }

    System.out.println("Period " + periodID + " - " + periodName);
    return periodID;
  }

  public int insertWeek(int weekNumber, int periodName, int periodID, String yearName) {
    String weekName = yearName + " - Week " +  periodName + ", " + weekNumber;
    int weekID = 0;

    try {
      insertWeekStmt.clearParameters();
      insertWeekStmt.setInt(1, weekNumber);
      insertWeekStmt.setString(2, weekName);
      insertWeekStmt.setInt(3, periodID);
      insertWeekStmt.executeUpdate();

      Statement select = connection.createStatement();
      ResultSet result = select.executeQuery("select max(week_id) from wkt_week");
      while (result.next()) {
        weekID = result.getInt(1);
      }
      select.close();

    } catch (Exception E) {
      E.printStackTrace();
    }

    System.out.println("--Week " + weekID + " - " + weekName);
    return weekID;
  }

  public int insertDay(int dayNumber, String dayDate, int dayInterval, int weekID) {
    int dayID = 0;

    try {
      insertDayStmt.clearParameters();
      insertDayStmt.setInt(1, weekID);
      insertDayStmt.setString(2, dayDate);
      insertDayStmt.setInt(3, dayInterval);
      insertDayStmt.executeUpdate();

      Statement select = connection.createStatement();
      ResultSet result = select.executeQuery("select max(day_id) from wkt_day");
      while (result.next()) {
        dayID = result.getInt(1);
      }
      select.close();

    } catch (Exception E) {
      E.printStackTrace();
    }

    System.out.println("----Day " + weekID + " - " + dayNumber + " => " + dayID);
    return dayID;
  }

  public int insertWorkout(int dayID) {
    int workoutID = 0;

    try {
      insertWorkoutStmt.clearParameters();
      insertWorkoutStmt.setInt(1, dayID);
      insertWorkoutStmt.executeUpdate();

      Statement select = connection.createStatement();
      ResultSet result = select.executeQuery("select max(workout_id) from wkt_workout");
      while (result.next()) {
        workoutID = result.getInt(1);
      }
      select.close();

    } catch (Exception E) {
      E.printStackTrace();
    }

    System.out.println("------Workout " + dayID + " => " + workoutID);
    return workoutID;
  }

  public void insertIntensity(int workoutID) {
    int intensityID = 0;

    try {
      insertIntensityStmt.clearParameters();
      insertIntensityStmt.setInt(1, workoutID);
      insertIntensityStmt.executeUpdate();

      Statement select = connection.createStatement();
      ResultSet result = select.executeQuery("select max(intensity_id) from wkt_intensity");
      while (result.next()) {
        intensityID = result.getInt(1);
      }
      select.close();

    } catch (Exception E) {
      E.printStackTrace();
    }

    System.out.println("------Intensity " + workoutID + " => " + intensityID);
  }

  public void insertActivity(int workoutID) {
    int activityID = 0;

    try {
      insertActivityStmt.clearParameters();
      insertActivityStmt.setInt(1, workoutID);
      insertActivityStmt.executeUpdate();

      Statement select = connection.createStatement();
      ResultSet result = select.executeQuery("select max(activity_id) from wkt_activity");
      while (result.next()) {
        activityID = result.getInt(1);
      }
      select.close();

    } catch (Exception E) {
      E.printStackTrace();
    }

    System.out.println("------Activity " + workoutID + " => " + activityID);
  }

  public void insertActivityPlan(int weekID) {
    int activityPlanID = 0;

    try {
      insertActivityPlanStmt.clearParameters();
      insertActivityPlanStmt.setInt(1, weekID);
      insertActivityPlanStmt.executeUpdate();

      Statement select = connection.createStatement();
      ResultSet result = select.executeQuery("select max(activity_plan_id) from wkt_activity_plan");
      while (result.next()) {
        activityPlanID = result.getInt(1);
      }
      select.close();

    } catch (Exception E) {
      E.printStackTrace();
    }

    System.out.println("----Activity Plan " + weekID + " => " + activityPlanID);
  }

  public void insertIntensityPlan(int weekID) {
    int intensityPlanID = 0;

    try {
      insertIntensityPlanStmt.clearParameters();
      insertIntensityPlanStmt.setInt(1, weekID);
      insertIntensityPlanStmt.executeUpdate();

      Statement select = connection.createStatement();
      ResultSet result = select.executeQuery("select max(intensity_plan_id) from wkt_intensity_plan");
      while (result.next()) {
        intensityPlanID = result.getInt(1);
      }
      select.close();

    } catch (Exception E) {
      E.printStackTrace();
    }

    System.out.println("----Intensity Plan " + weekID + " => " + intensityPlanID);
  }

//  public static class Load {
    public static void main(String[] args) {
      // first insert new year
      // insert into wkt_year (name, name_text, insert_date, version) values('2023', 'Year 2022 to 2023', sysdate(), 0);
      // insert into wkt_year (name, name_text, insert_date, version) values('2025', 'Year 2024 to 2025', sysdate(), 0);
      //
      // final String yearName = "2015 to 2016";
      // final String shortYearName = "2016";
      // final int yearId = 23;
      // final String startDate = "2015-08-24";
      // int dayInterval = 0;
      // final String yearName = "2021 to 2022";
      // final String shortYearName = "2022";
      // final int yearId = 29;
      // final String startDate = "2021-08-30";
      // final String yearName = "2023 to 2024";
      // final String shortYearName = "2024";
      // final int yearId = 31;
      // final String startDate = "2023-08-28";

      final String yearName = "2024 to 2025";
      final String shortYearName = "2025";
      final int yearId = 32;
      final String startDate = "2024-08-26";

      int dayInterval = 0;

      LoadDay load = new LoadDay();
      load.listYear();

      for (int i=1; i <= 13; i++) {
        int periodID = load.insertPeriod(i, yearId, yearName);

        for (int j = 1; j <= 4; j++) {
          int weekID = load.insertWeek(j, i, periodID, shortYearName);
	  load.insertIntensityPlan(weekID);
	  load.insertActivityPlan(weekID);

          for (int k = 1; k <= 7; k++) {
            int dayID = load.insertDay(k, startDate, dayInterval, weekID);
            dayInterval++;
            int workoutID = load.insertWorkout(dayID);
            load.insertIntensity(workoutID);
            load.insertActivity(workoutID);
          }
        }
      }
    }
//  }
}

