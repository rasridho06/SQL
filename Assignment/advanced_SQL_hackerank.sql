# Tugas 1 The Report

with student_grade as (
select
    s.ID as student_id,
    s.Name as student_name,
    s.Marks as student_marks,
    g.Grade as student_grade,
    g.Min_Mark as min_student_grade,
    g.Max_Mark as max_student_grade
from students s
left join grades g on s.marks between g.Min_Mark and g.Max_Mark
)

# show the data with the rules of name and order
SELECT
    case 
        when student_grade < 8 then null
        else student_name
        end as name,
    student_grade,
    student_marks
from
student_grade
order by
    student_grade desc,
    case when student_grade >= 8 then student_name end asc,
    case when student_grade <8 then student_marks end asc
;

# Tugas 2 . Weather Observation Station 18
SELECT
round((max(lat_n)- min(lat_n)) + (max(long_w)- min(long_w)),4)
from
station
;SELECT
round((max(lat_n)- min(lat_n)) + (max(long_w)- min(long_w)),4)
from
station
;

# Soal 3 : Top Competitors
SELECT
h.hacker_id,
h.name
from
Submissions as s
join Challenges as c on s.challenge_id = c.challenge_id
join Difficulty as d on c.difficulty_level = d.difficulty_level
join Hackers as h on s.hacker_id = h.hacker_id
WHERE
s.score = d.score
group BY
h.hacker_id, h.name
having count(s.challenge_id) > 1
ORDER BY
    count(s.challenge_id) desc,
    h.hacker_id asc;

    