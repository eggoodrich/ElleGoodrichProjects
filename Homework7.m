% Name: Elle Goodrich
% Date: 12.8.21
% Homework 7
%This code takes in data from several text files and uses it to calculate a
%total grade for the class. It acheives level 4 or 5.

%Taking in text file
preClassData = load('preClassScores.txt');
[preClassRows, preClassCols] = size(preClassData);

%Finding baseline sum
totalPreClass = sum(preClassData);

% Finding number of ungraded assignments
[x,y] = find(preClassData == -500);
[x,y] = size(x);

%Subtracting ungraded assignments from total
totalPreClass(1,2) = totalPreClass(1,2) + (x * 500);
totalPreClass(1,1) = totalPreClass(1,1) - (x * preClassData(2,1));

 %Finding 4 lowest assignment scores
 for num = 10:-1:1
     x = find(preClassData < num & preClassData >= 0 & preClassData ~= 5);
    [x, y] = size(x);
    if x == 4
        [t,s] = find(preClassData < num & preClassData >= 0 & preClassData ~= 5);
    end
 end

[x, y] = size([t,s]);

%Calculating how much needs to be subtracted 
subtract = sum(preClassData(t,2));

%Subtracting 4 lowest
totalPreClass(1,2) = totalPreClass(1,2) - subtract;
totalPreClass(1,1) = totalPreClass(1,1) - (x * preClassData(2,1));

%Calculating percent
preClassPercent = totalPreClass(1,2)/totalPreClass(1,1);

%Displaying Pre Class Score
disp("Pre Class Score = " + preClassPercent + " and Pre Class Weight = 0.1 ")

%Taking in text file
inClassData = load('inClassScores (1).txt');
[inClassRows, inClassCols] = size(inClassData);

%Finding baseline sum
totalInClass = sum(inClassData);

% Finding number of ungraded assignments
[x,y] = find(inClassData == -500);
[x,y] = size(x);

%Subtracting ungraded assignments from total
totalInClass(1,2) = totalInClass(1,2) + (x * 500);
totalInClass(1,1) = totalInClass(1,1) - (x * inClassData(1,1));

%Finding 4 lowest assignment scores
 x = find(inClassData < 5);
 [x, y]= size(x);

 %Finding 4 lowest assignment scores
if x > 4
    [t,s] = find(inClassData < 4 & inClassData >= 0);
end

[x, y]= size([t,s]);

%Calculating how much needs to be subtracted 
subtract = sum(inClassData(t,2));

%Subtracting 4 lowest
totalInClass(1,2) = totalInClass(1,2) - subtract;
totalInClass(1,1) = totalInClass(1,1) - (x * inClassData(1,1));

%Calculating percent
inClassPercent = totalInClass(1,2)/totalInClass(1,1);

%Displaying In Class Score
disp("In Class Scores = " + inClassPercent + " and In Class Weight = 0.1")

%Taking in text file
homeworkData = load('homeworkScores (1).txt');
[homeworkRows, homeworkCols] = size(homeworkData);

%Finding baseline sum
totalHomework = sum(homeworkData);

% Finding number of ungraded assignments
[x,y] = find(homeworkData == -500);
[x,y] = size(x);

%Subtracting Homework ungraded assignments
totalHomework(1,2) = totalHomework(1,2) + (x * 500);
totalHomework(1,1) = totalHomework(1,1) - (x * homeworkData(2,1));

%Calculating percent
homeworkPercent = totalHomework(1,2)/totalHomework(1,1);

%Displaying Homework Score
disp("Homework Score = " + homeworkPercent + " and Homework Weight = 0.3 ")

%Taking in text file
midtermData = load('midtermScores (1).txt');
[midtermRows, midtermCols] = size(midtermData);

%Finding baseline sum
totalMidterm = sum(midtermData);

% Finding number of ungraded assignments
[x,y] = find(midtermData == -500);
[x,y] = size(x);

%Subtracting ungraded assignments
totalMidterm(1,2) = totalMidterm(1,2) + (x * 500);
totalMidterm(1,1) = totalMidterm(1,1) - (x * midtermData(2,1));

%Calculating percent
midtermPercent = totalMidterm(1,2)/totalMidterm(1,1);

%Displaying Midterm Score
disp("Midterm Score = " + midtermPercent + " and Midterm Weight = 0.3 ")

%Taking in text file
finalData = load('finalScore (1).txt');
[finalRows, finalCols] = size(finalData);

% Finding if the final is graded or not
x = find(finalData == -500);

%Calculating percent
finalPercent = finalData(1,2)/finalData(1,1);

%Calculating total grade
if x > 0
    totalGrade = (.1*preClassPercent + .1*inClassPercent + .3*homeworkPercent + .3*midtermPercent)/(.1+.1+.3+.3);
    disp("Current Total Grade = " + totalGrade)
else
    totalGrade = .1*preClassPercent + .1*inClassPercent + .3*homeworkPercent + .3*midtermPercent + .2*finalPercent;
    disp("Current Total Grade = " + totalGrade)
end

