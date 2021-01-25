-- create database moviedatabase;
use moviedatabase;

create table actor(
  act_ID INT not NULL,
  act_fname CHAR(20) NULL,
  act_lname CHAR(20) NULL,
  act_gender CHAR(1) NULL,
  PRIMARY KEY (act_ID));


create table movie_cast(
  act_ID INT NOT NULL,
  mov_ID INT not NULL,
  role CHAR(30) NULL,
   PRIMARY KEY (act_ID, mov_ID),
  constraint movie_cast_fk1 foreign key(act_ID)
						references actor (act_ID),
   constraint movie_cast_fk2 foreign key(mov_ID)
						references movie(mov_ID)
 );
  
  
create TABLE movie (
  mov_ID INT NOT NULL,
  mov_title CHAR(50) NULL,
  mov_year INT NULL,
  mov_time INT NULL,
  mov_lang CHAR(50) NULL,
  mov_dt_rel DATE NULL,
  mov_rel_country CHAR(5) NULL,
  PRIMARY KEY (mov_ID));
  
  
  CREATE TABLE movie_direction (
  dir_ID INT NULL,
  mov_ID INT NULL,
  
CONSTRAINT movie_direction_fk1 FOREIGN KEY (dir_ID)
							REFERENCES director (dir_ID),
   
  CONSTRAINT movie_direction_fk2 FOREIGN KEY (mov_ID)
						REFERENCES movie (mov_ID));
                 
                 
 CREATE TABLE director(
dir_ID INT NOT NULL,
dir_fname CHAR(20) NULL,
dir_lname CHAR(20) NULL,
PRIMARY KEY (dir_ID));    


CREATE TABLE reviewer (
  rev_ID INT NOT NULL,
  rev_name CHAR(30) NULL,
  PRIMARY KEY (rev_ID));


CREATE TABLE rating(
  mov_ID INT,   
  rev_ID INT,
  rev_stars INT NULL,
  num_o_ratings INT NULL,
constraint rating_pk primary key (mov_ID, rev_ID),
  CONSTRAINT rating_fk1 FOREIGN KEY (rev_ID)
				REFERENCES reviewer(rev_ID),
   
  CONSTRAINT rating_fk2 FOREIGN KEY (mov_ID)
    REFERENCES movie (mov_ID)
    );
-- 		
CREATE TABLE movie_genre(
  mov_ID INT not NULL,
  gen_ID INT not NULL,
  CONSTRAINT movie_genres_fk1 FOREIGN KEY (gen_ID)
						REFERENCES genres (gen_ID),
    
  CONSTRAINT movie_genres_fk2 FOREIGN KEY (mov_ID)
    REFERENCES movie(mov_ID));
    
 CREATE TABLE genres (
  gen_ID INT not NULL,
  gen_title CHAR(20) NULL,
  PRIMARY KEY (gen_ID));
  
select * from actor;
 select * from director;
select * from genres;
select * from movie;
select * from movie_cast;
select * from movie_direction;
select * from movie_genre;
select * from rating; 
select * from reviewer;

select mov_title,mov_year
from movie;

select mov_year
from movie 
where mov_title = 'American Beauty';

select mov_title
from movie
where mov_year = '1999';

select mov_title 
from movie 
where mov_year <1998; 

select movie.mov_title , reviewer.rev_name
from movie join reviewer;



select *  from reviewer; 
select * from rating;
select rev_name from reviewer join rating 
on reviewer.rev_ID = rating.rev_ID
where rev_stars >= 7;

select * from movie;
select * from rating;
select mov_title from movie join rating 
on rating.mov_ID = movie.mov_ID
where num_o_ratings is null;

select * from movie;
select * from director;
select * from movie_direction;
select mov_title, director.dir_fname, director.dir_lname 
from movie join movie_direction
on movie.mov_ID = movie_direction.mov_ID
join director on director.dir_ID = movie_direction.dir_ID
where mov_title = 'Eyes wide shut';



