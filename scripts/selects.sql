
select * from covid_tracker.symptom;
select * from covid_tracker.symptom_response;
select * from covid_tracker.symptom_response where dbid in(4,6,11);
select * from covid_tracker.symptom where dbid in (2,5,6);
select * from covid_tracker.diagnostic order by dbid desc;
select * from covid_tracker.observations;
select * from covid_tracker.diagnostic_detail;
select * from covid_tracker.patient_condition;
select * from covid_tracker.value_list;
select * from covid_tracker.city where ;

   select 
    d.dbid as diagnosticDbid, CONCAT_WS(' ', p.name, p.last_name) as name, p.age, gender.dbid as genderDbid, gender.description as genderDescription,
    city.dbid as cityDbid, city.name as cityName, city.latitude, city.longitude,
    ( 
        select IFNULL(sum(sr.weighing),0) as weighing from covid_tracker.diagnostic diag 
        inner join covid_tracker.diagnostic_detail diagd on diagd.diagnostic = diag.dbid
        inner join covid_tracker.symptom_response sr on sr.dbid = diagd.symptom_response
        where diag.dbid = d.dbid 
     ) as weighing,
     d.creation_date 
    from covid_tracker.diagnostic d 
        inner join covid_tracker.person p on p.dbid = d.person
        inner join covid_tracker.value_list gender on gender.dbid = p.gender
        inner join covid_tracker.city city on city.dbid = d.city order by d.dbid desc;
select sum(sr.weighing) as weighing from covid_tracker.diagnostic diag 
    inner join covid_tracker.diagnostic_detail diagd on diagd.diagnostic = diag.dbid
    inner join covid_tracker.symptom_response sr on sr.dbid = diagd.symptom_response
    where diag.dbid = 23;
   
   
   
select 
city.dbid as cityDbid, city.name as cityName, city.latitude, city.longitude,
count(*) as cases
from covid_tracker.diagnostic d 
	inner join covid_tracker.person p on p.dbid = d.person
	inner join covid_tracker.value_list gender on gender.dbid = p.gender
	inner join covid_tracker.city city on city.dbid = d.city
group by city.dbid order by cases desc;
   
	
select dd.*
from covid_tracker.diagnostic d 
   inner join covid_tracker.diagnostic_detail dd on dd.diagnostic = d.dbid
   inner join covid_tracker.symptom_response sr on sr.dbid = dd.symptom_response; 	
	
/*
21	Category	disease	1. Enfermedades
22	Category	principal_symptom	2. Síntomas
23	Category	other_symptom	3. Otros síntomas 
33	Category	condition	4. Condicion del paciente 
*/


select o.*, cat.description as categoryName from covid_tracker.observations o 
inner join covid_tracker.value_list cat on cat.dbid = o.category
where cat.name in('principal_symptom','other_symptom')
and 81 BETWEEN o.initial_probability and o.final_probability_range;

select * from covid_tracker.observations;

select * from 

-- query ponderaciones
select cat.description as categoryDescription, s.name as symptomName,  CONCAT_WS(' ', sr.name,resp.description, sr.description) as responseDescription,
sr.weighing as weighingResponse, s.weighing as weighingTotal
from covid_tracker.symptom s 
inner join covid_tracker.value_list cat on cat.dbid = s.category
inner join covid_tracker.symptom_response sr on sr.symptom = s.dbid
inner join covid_tracker.value_list resp on resp.dbid = sr.response;


SELECT * FROM mysql.user;
-- ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'admin1234'
-- flush privileges;


