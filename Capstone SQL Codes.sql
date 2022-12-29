-- Union All To Merge Tables
select *
from CapstoneDB..[202101-divvy-tripdata]
union all
select *
from CapstoneDB..[202102-divvy-tripdata]
union all
select *
from CapstoneDB..[202103-divvy-tripdata]
union all
select *
from CapstoneDB..[202104-divvy-tripdata]
union all
select *
from CapstoneDB..[202105-divvy-tripdata]
union all
select *
from CapstoneDB..[202106-divvy-tripdata]
union all
select *
from CapstoneDB..[202107-divvy-tripdata]
union all
select *
from CapstoneDB..[202108-divvy-tripdata]
union all
select *
from CapstoneDB..[202109-divvy-tripdata]
union all
select *
from CapstoneDB..[202110-divvy-tripdata]
union all
select *
from CapstoneDB..[202111-divvy-tripdata]
union all
select *
from CapstoneDB..[202112-divvy-tripdata]

-- Create Single Capstone Table
create table Capstone2 (
ride_id	varchar(50),
rideable_type varchar(50),
Started_Date varchar(50),
Ended_Date varchar(50),
Day_of_week_started	varchar(50),
Day_of_week_ended varchar(50),
Started_Time varchar(50),
Ended_Time varchar(50),
Time_Of_Day varchar(50),
Ride_Length	varchar(50),
Ride_Length2 real,
start_station_name nvarchar(250),
end_station_name nvarchar(250),
member_casual varchar(50)
)

insert into Capstone2
select *
from CapstoneDB..[202101-divvy-tripdata]
union all
select *
from CapstoneDB..[202102-divvy-tripdata]
union all
select *
from CapstoneDB..[202103-divvy-tripdata]
union all
select *
from CapstoneDB..[202104-divvy-tripdata]
union all
select *
from CapstoneDB..[202105-divvy-tripdata]
union all
select *
from CapstoneDB..[202106-divvy-tripdata]
union all
select *
from CapstoneDB..[202107-divvy-tripdata]
union all
select *
from CapstoneDB..[202108-divvy-tripdata]
union all
select *
from CapstoneDB..[202109-divvy-tripdata]
union all
select *
from CapstoneDB..[202110-divvy-tripdata]
union all
select *
from CapstoneDB..[202111-divvy-tripdata]
union all
select *
from CapstoneDB..[202112-divvy-tripdata]

-- (1) Difference in Type of bikes used by Casual Riders and Annual Members

select rideable_type, member_casual, count(rideable_type) as NoOfUsers_PerBike
from MangoDB..Capstone2
group by member_casual, rideable_type
order by member_casual

-- (2) Difference in Daily Rides Between Casual Riders and Annual Members

 select Day_of_week_started, member_casual, count(Day_of_week_started) as No_Of_DailyRides
from MangoDB..Capstone2
group by member_casual, Day_of_week_started
order by member_casual

-- (3) Difference in time of day between Casual Riders and Annual Members

select Time_Of_Day, member_casual, count(Time_Of_Day) as No_Of_Rides
from MangoDB..Capstone2
group by member_casual, Time_Of_Day
order by member_casual

-- (4) Difference in average ride length between Casual Riders and Annual Members

select avg(Ride_Length2) as AvgRideTime
from MangoDB..Capstone2
where member_casual = 'casual'

declare @t decimal(10,2) = 32.71;
select convert(char(8), 
dateadd(second, @t%1 * 60, 
dateadd(minute, @t, 0)), 114); 

select avg(Ride_Length2) as AvgRideTime
from MangoDB..Capstone2
where member_casual = 'member'

declare @tt decimal(10,2) = 14.59;
select convert(char(8), 
dateadd(second, @tt%1 * 60, 
dateadd(minute, @tt, 0)), 114);

-- (5) Total Rides

select member_casual, count(member_casual) as No_Of_Riders
from MangoDB..Capstone2
group by member_casual
