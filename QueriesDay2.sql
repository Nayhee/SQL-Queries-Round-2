select Name
from Grade;

select Name
from Emotion;

select Count(Id) as NumPoemsInDB
from Poem;

--4, 5, 6
select Top 76 a.Name as AuthorName, g.Name as Grade, ge.Name as Gender
from Author a
join Grade g on g.id=a.GradeId
join Gender ge on ge.Id=a.GenderId
order by a.Name asc;

--7
select Sum(WordCount) as TotalWordCount
from Poem;

--8
select Top 1 p.Title, p.CharCount
from Poem p
order by p.CharCount asc;

--9
select Count(a.Id) as NumThirdGradeAuthors
from Author a
join Grade g on g.Id=a.GradeId
where g.Name='3rd Grade';

--10
select Count(a.Id) as NumAuthorsgradesOneToThree
from Author a
join Grade g on g.Id=a.GradeId
where g.Name='3rd Grade' or g.Name='2nd Grade' or g.Name='1st Grade';

--11
select Count(p.Id) as NumPoemsByFourthGraders
from Poem p
join Author a on a.Id=p.AuthorId
join Grade g on g.Id=a.GradeId
where g.Name='4th Grade';

--12
select g.Name as Grade, Count(p.Id) as NumPoems
from Poem p
join Author a on a.Id=p.AuthorId
join Grade g on g.Id=a.GradeId
group by g.Name;

--13
select Count(a.Id) as NumAuthors, g.Name as Grade
from Author a
join Grade g on g.Id=A.GradeId
group by g.Name
order by g.Name asc;

--14
Select Top 1 p.Title, p.WordCount
from Poem p
order by P.WordCount desc;

--15
select Top 1 Count(p.Id) as NumPoems, a.Name as AuthorName, a.Id as AuthorId
from Poem p
join Author a on a.Id=p.AuthorId
group by a.Id, a.Name
order by NumPoems desc;

--16
select Count(p.Id) as NumPoems
from Poem p
join PoemEmotion pe on pe.PoemId=p.Id
join Emotion e on e.Id=pe.EmotionId
where e.Name='sadness';

--17
select Count(p.Id) as NumPoemsWithNoEmotion
from Poem p
left join PoemEmotion pe on pe.PoemId=p.Id
left join Emotion e on e.Id=pe.EmotionId
where pe.Id is null;

--18
select Top 1 Count(p.Id) as NumPoems, e.Name
from Poem p
join PoemEmotion pe on pe.PoemId=p.Id
join Emotion e on e.Id=pe.EmotionId
group by e.Id, e.Name
order by NumPoems asc;

--19
select Top 1 g.Name, Count(p.Id) as NumPoems
from Poem p
join PoemEmotion pe on pe.PoemId=p.Id
join Emotion e on e.Id=pe.EmotionId
join Author a on a.Id=p.AuthorId
join Grade g on g.Id=a.GradeId
where e.Name='Joy'
group by g.Name
order by NumPoems desc;

--20
select Top 1 ge.Name, Count(p.Id) as NumPoems
from Poem p
join PoemEmotion pe on pe.PoemId=p.Id
join Emotion e on e.Id=pe.EmotionId
join Author a on a.Id=p.AuthorId
join Gender ge on ge.Id=a.GenderId
where e.Name='Fear'
group by ge.Name
order by NumPoems asc;


--21 Extra Challenge
select Count(a.Id) as NumOfAlices
from Author a
where a.Name='Alice';

--22 Extra Challenge. The like keywords lets you search for a specific pattern. 
select Count(Title)
from Poem 
where Text like '%Horse%';
