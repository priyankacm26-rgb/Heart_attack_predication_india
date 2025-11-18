create database heart_attack_prediction_india;
use  heart_attack_prediction_india;
select * from heart_attack_prediction_india;

-- Average of patients
select round(avg(patient_id)) 
as average_patients 
from heart_attack_prediction_india ;

-- Average of age
select round(avg(age)) as avg_age 
from heart_attack_prediction_india;

-- male vs female distribution
select gender,count(*) as total_patients 
from  heart_attack_prediction_india
group by gender;

-- all the patients having cholesteral >240 with patient id
select patient_id,cholesterol_level as high_cholesterol
from heart_attack_prediction_india 
where cholesterol_level>240;

SELECT 
    CASE 
        WHEN age < 30 THEN 'Below 30'
        WHEN age BETWEEN 30 AND 45 THEN '30-45'
        WHEN age BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN heart_attack_risk = TRUE THEN 1 ELSE 0 END) AS risky_patients
FROM heart_attack_prediction_india
GROUP BY age_group;


-- Top 5 risk factors contributing to heart attack
select 'cholesterol_level'as high_cholesterol,count(*)
from heart_attack_prediction_india 
where cholesterol_level>240 and heart_attack_risk=true 
union
select 'physical_activity' as low_physical_activity,count(*)
from heart_attack_prediction_india 
where physical_activity=true and heart_attack_risk=true 
union
select 'alcohol_consumption'as high_alcohol_consumption,count(*)
from heart_attack_prediction_india 
where alcohol_consumption=true and heart_attack_risk=true
union
select 'systolic_bp'as high_bp,count(*)
from heart_attack_prediction_india 
where systolic_bp>160 and heart_attack_risk=true
 union
select 'stress_level' as high_stress,count(*)
from heart_attack_prediction_india 
where stress_level>8 and heart_attack_risk=true;

