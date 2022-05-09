--- 1) Find all the matches from 2017

--SELECT season FROM public.matches WHERE season = 2017;

-- 2) Find all the matches featuring Barcelona.

SELECT * FROM public.matches WHERE hometeam = 'Barcelona';

-- 3) What are the names of the Scottish divisions included?

SELECT name FROM public.divisions WHERE country = 'Scotland';

-- 4) Find the division code for the Bundesliga. Use that code to find out how many matches Freiburg have played in the Bundesliga since the data started being collected.

SET @Bundesliga_Code = SELECT code FROM public.divisions WHERE name = 'Bundesliga';
SELECT hometeam FROM public.matches WHERE (hometeam, division_code) = ('Freiburg', 'D1')  GROUP BY(hometeam) ;

-- 5) Find the unique names of the teams which include the word "City" in their name (as entered in the database)
SELECT hometeam FROM public.matches WHERE hometeam LIKE '%City%';

-- 6) How many different teams have played in matches recorded in a French division?
SELECT code FROM public.divisions WHERE country = 'France';
SELECT (hometeam, awayteam) FROM public.matches Where division_code = 'F1';

-- 7) Have Huddersfield played Swansea in the period covered?
SELECT hometeam, awayteam FROM public.matches WHERE (hometeam,awayteam) = ('Huddersfield', 'Swansea');

-- 8) How many draws were there in the Eredivisie between 2010 and 2015?
SELECT (fthg, ftag) FROM public.matches WHERE (fthg == ftag);

-- 9)  Select the matches played in the Premier League in order of total goals scored from highest to lowest. Where there is a tie the match with more home goals should come first.
SELECT (fthg, ftag) FROM public.matches ORDER BY (fthg,ftag) DESC ; 
-------------------------------------------------------------------------------------
SELECT (fthg, ftag) FROM public.matches WHERE (fthg = ftag)  ORDER BY (fthg) DESC;

-- 10) In which division and which season were the most goals scored?
SELECT (division_code, season) FROM public.matches GROUP BY (division_code, season) ORDER BY COUNT(fthg);
