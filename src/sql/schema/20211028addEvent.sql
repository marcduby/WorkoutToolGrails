

drop table if exists wkt_event_type;
create table comb_lookup_type (
  event_type_id             int not null primary key,
  event_name                varchar(1000) not null,
  date_created              datetime DEFAULT CURRENT_TIMESTAMP
);

-- insert data
insert into wkt_event_type (event_name) values('Head of the Charles 1x');
insert into wkt_event_type (event_name) values('Head of the Charles 2x');
insert into wkt_event_type (event_name) values('Head of the Textile 1x');
insert into wkt_event_type (event_name) values('Head of the Housatonic 1x');
insert into wkt_event_type (event_name) values('Head of the Riverfront 1x');


drop table if exists wkt_event_rating;
create table comb_lookup_type (
  event_id                  int not null primary key,
  event_type_id             int not null,
  event_year                int not null,
  event_date                date,
  description               varchar(1000),
  rating                    enum((1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
  date_created              datetime DEFAULT CURRENT_TIMESTAMP
);


