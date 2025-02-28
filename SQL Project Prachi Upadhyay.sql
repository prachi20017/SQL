use wakad122;

select * from athletes;

select count(*) from athletes;

/* SQL Olymics project */
-- Q1. Show how many medal counts present for entire data.

select count(Medal) from athletes
where Medal <> "NoMedal";

select count(Medal) from athletes
where not Medal = "NoMedal";

-- answer
select Medal, count(Medal) as total_medals from athletes
group by Medal
order by total_medals;


-- Q2. Show count of unique Sports are present in olympics.
select sport from athletes;
select count(sport) from athletes;
select distinct(sport) from athletes;

-- answer
select count(distinct(sport)) as unique_sports from athletes;


-- Q3. Show how many different medals won by Team India in data.
select count(Medal) from athletes
where (Team = "India") and (Medal <> "NoMedal");

-- answer
select Team,Medal,count(Medal) as Total_Medals from athletes
where (Team = "India") and (Medal <> "NoMedal")
group by Team,Medal
order by Total_Medals;

-- Q3. Alternate solution
select Team,Medal, sum(Medal) from athletes
where (Team = "India") and (Medal in ("Gold","Silver","Bronze"))
group by Team,Medal;


/* Q4. Show event wise medals won by india show from highest to 
lowest medals won in order. */
select Team,Event,Medal,count(Medal) as total_medals from athletes
where (Team = "India") and (Medal <> "NoMedal")
group by Team,Event,Medal;

-- answer
select Team,Event,Medal,count(Medal) as total_medals from athletes
where (Team = "India") and (Medal <> "NoMedal")
group by Team,Event,Medal
order by total_medals desc;


-- Q5. Show event and yearwise medals won by india in order of year.
select Team,Event,Year,count(Medal) as Total_Medal from athletes
where (Team = "India") and (Medal <> "NoMedal")
group by Team,Event,Year;

-- answer
select Team,Event,Year,count(Medal) as Total_Medal from athletes
where (Team = "India") and (Medal <> "NoMedal")
group by Team,Event,Year
order by Year;


select Team,Event,Year,count(Medal) as Total_Medal from athletes
where (Team = "India") and (Medal <> "NoMedal")
group by Team,Event,Year
order by Year desc;


-- Q6. Show the country with maximum medals won gold, silver, bronze
select Team,Medal, count(Medal) as total_medals from athletes
where (Medal in ("Gold","Silver","Bronze"))
group by Team,Medal
order by total_medals desc;


-- doubt
select Team,Medal, count(Medal) as total_Gold_medals from athletes
where (Medal = ("Gold"))
group by Team,Medal
order by total_Gold_medals desc
limit 1;

select Team,Medal, count(Medal) as total_Silver_medal from athletes
where medal = "Silver"
group by Team,Medal
order by total_Silver_medal desc
limit 1;

select Team,Medal, count(Medal) as total_Bronze_medal from athletes
where medal = "Bronze"
group by Team,Medal
order by total_Bronze_medal desc
limit 1;

-- answer
select Team, count(Medal) as total_medals from athletes
where Medal <> "NoMedal"
group by Team
order by total_medals desc
limit 1;



-- Q7. Show the top 10 countries with respect to gold medals
select Team,Medal, count(Medal) as Total_Gold_Medals from athletes
where Medal ="Gold"
group by Team,Medal
order by Total_Gold_Medals desc
limit 10;

-- or
select Team, count(Medal) as Total_Gold_Medals from athletes
where Medal ="Gold"
group by Team
order by Total_Gold_Medals desc
limit 10;


-- Q8. Show in which year did United States won most medals
select * from athletes;

-- answer

select Year, count(Medal) as total_medals from athletes
where Team = "United States" and Medal <> "NoMedal"
group by Year
order by total_medals desc
limit 1;


-- Q9. In which sports United States has most medals

-- answer
Select Team,Sport, count(Medal) as total_medals from athletes
where Team = "United States" and Medal <> "NoMedal"
group by Team,Sport
order by total_medals desc
limit 1;

Select Sport, count(Medal) as total_medals from athletes
where Team = "United States" and Medal <> "NoMedal"
group by Sport
order by total_medals desc
limit 1;


-- Q10. Find top 3 players who have won most medals along with their sports and country
select * from athletes;

-- answer
select Name,Sport,Team, count(Medal) as total_medals_won from athletes
where Medal <> "NoMedal"
group by Name,Sport,Team
order by total_medals_won desc
limit 3;


-- Q11. Find player with most gold medals in cycling along with his country.
select * from athletes;

-- answer
select Name,Team, count(Medal) as total_Gold_Medals from athletes
where Medal = "Gold" and Sport = "Cycling"
group by Name,Sport,Team
order by total_Gold_Medals desc
limit 1;


-- Q12. Find player with most medals (Gold + Silver + Bronze) in Basketball also show his country.

-- answer
Select Name,Team, count(Medal) as total_medals from athletes
where Sport = "Basketball" and Medal <> "NoMedal"
group by Name,Team,Sport
order by total_medals desc
limit 1;


-- Q13. Find out the count of different medals of the top basketball player.

-- doubt
select Name,Medal, count(Medal) as Medals from athletes
where Sport = "Basketball" and Medal <> "NoMedal"
group by Name,Sport,Medal
order by Medals desc;



-- Q14. Find out medals won by male, female each year.
select * from athletes;

-- answer
select Sex,Year, count(Medal) as Medal_Count from athletes
group by sex,year
order by Medal_Count desc;


select Sex,Year, count(Medal) as Medal_Count from athletes
where Medal <> "NoMedal"
group by sex,year
order by Medal_Count desc;