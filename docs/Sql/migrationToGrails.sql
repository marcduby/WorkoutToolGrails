


alter table wkt_activity add version bigint(20) not null default 0;
alter table wkt_activity add insert_date timestamp not null default '0000-00-00 00:00:00';
update wkt_activity set insert_date = sysdate();

alter table wkt_intensity add version bigint(20) not null default 0;
alter table wkt_intensity add insert_date timestamp not null;
update wkt_intensity set insert_date = sysdate();

alter table wkt_workout add version bigint(20) not null default 0;
alter table wkt_workout modify insert_date timestamp not null;
update wkt_workout set insert_date = sysdate();

alter table wkt_day add version bigint(20) not null default 0;
alter table wkt_day modify insert_date timestamp not null default '0000-00-00 00:00:00';
update wkt_day set insert_date = sysdate();

alter table wkt_week add version bigint(20) not null default 0;
alter table wkt_week modify insert_date timestamp not null default '0000-00-00 00:00:00';
update wkt_week set insert_date = sysdate();

alter table wkt_period add version bigint(20) not null default 0;
alter table wkt_period modify insert_date timestamp not null default '0000-00-00 00:00:00';
update wkt_period set insert_date = sysdate();

alter table wkt_year add version bigint(20) not null default 0;
alter table wkt_year modify insert_date timestamp not null default '0000-00-00 00:00:00';
update wkt_year set insert_date = sysdate();

alter table wkt_activity_plan add version bigint(20) not null default 0;
alter table wkt_activity_plan add last_update timestamp not null default current_timestamp on update current_timestamp;
alter table wkt_activity_plan add insert_date timestamp not null default '0000-00-00 00:00:00';
update wkt_activity_plan set insert_date = sysdate();

alter table wkt_day_flag add version bigint(20) not null default 0;
alter table wkt_day_flag add last_update timestamp not null default current_timestamp on update current_timestamp;
alter table wkt_day_flag add insert_date timestamp not null default '0000-00-00 00:00:00';
update wkt_day_flag set insert_date = sysdate();

alter table wkt_distance add version bigint(20) not null default 0;
alter table wkt_distance add last_update timestamp not null default current_timestamp on update current_timestamp;
alter table wkt_distance modify insert_date timestamp not null default '0000-00-00 00:00:00';
update wkt_day_flag set insert_date = sysdate();

alter table wkt_distance_type add version bigint(20) not null default 0;
alter table wkt_distance_type add last_update timestamp not null default current_timestamp on update current_timestamp;
alter table wkt_distance_type modify insert_date timestamp not null default '0000-00-00 00:00:00';
update wkt_day_flag_type set insert_date = sysdate();

alter table wkt_flag_type add version bigint(20) not null default 0;
alter table wkt_flag_type add last_update timestamp not null default current_timestamp on update current_timestamp;
alter table wkt_flag_type add insert_date timestamp not null default '0000-00-00 00:00:00';
update wkt_flag_type set insert_date = sysdate();

alter table wkt_injury add version bigint(20) not null default 0;
alter table wkt_injury modify insert_date timestamp not null default '0000-00-00 00:00:00';
update wkt_injury set insert_date = sysdate();

alter table wkt_injury_workout add version bigint(20) not null default 0;
alter table wkt_injury_workout add last_update timestamp not null default current_timestamp on update current_timestamp;
alter table wkt_injury_workout add insert_date timestamp not null default '0000-00-00 00:00:00';
update wkt_injury_workout set insert_date = sysdate();

alter table wkt_intensity_plan add version bigint(20) not null default 0;
alter table wkt_intensity_plan add last_update timestamp not null default current_timestamp on update current_timestamp;
alter table wkt_intensity_plan add insert_date timestamp not null default '0000-00-00 00:00:00';
update wkt_intensity_plan set insert_date = sysdate();

alter table wkt_sickness add version bigint(20) not null default 0;
alter table wkt_sickness modify insert_date timestamp not null default '0000-00-00 00:00:00';
update wkt_sickness set insert_date = sysdate();

alter table wkt_workout_flag add version bigint(20) not null default 0;
alter table wkt_workout_flag add last_update timestamp not null default current_timestamp on update current_timestamp;
alter table wkt_workout_flag add insert_date timestamp not null default '0000-00-00 00:00:00';
update wkt_workout_flag set insert_date = sysdate();

alter table wkt_workout_type add version bigint(20) not null default 0;
alter table wkt_workout_type add last_update timestamp not null default current_timestamp on update current_timestamp;
alter table wkt_workout_type modify insert_date timestamp not null default '0000-00-00 00:00:00';
update wkt_workout_type set insert_date = sysdate();


-- workout_test


-- changes from mediumint to bigint
alter table wkt_activity modify activity_id bigint(20) not null auto_increment;
alter table wkt_activity modify workout_id bigint(20);

alter table wkt_day modify day_id bigint(20) not null auto_increment;
alter table wkt_day modify week_id bigint(20);

alter table wkt_intensity modify intensity_id bigint(20) not null auto_increment;
alter table wkt_intensity modify workout_id bigint(20);

alter table wkt_workout modify workout_id bigint(20) not null auto_increment;
alter table wkt_workout modify day_id bigint(20);
alter table wkt_workout modify workout_type_id bigint(20);

alter table wkt_week modify week_id bigint(20) not null auto_increment;
alter table wkt_week modify period_id bigint(20);

alter table wkt_period modify period_id bigint(20) not null auto_increment;
alter table wkt_period modify year_id bigint(20);

alter table wkt_year modify year_id bigint(20) not null auto_increment;

alter table wkt_workout_type modify workout_type_id bigint(20) not null auto_increment;



