# Test-Score-Evaluation-MASM615


This is one of the question of my semester project. This program is using Irvine64 as the library and MASM615 as the compiler.

The purpose of this program is to

1. Read input from user of score between 0 - 100
2. If user entered -1 or more than 100, it will reject and output out-of-range.
3. Input will stop if user typed -1 or it reached the maximum of 100 scores.
4. Sort the score using the bubble sort algorithm.
5. Calculate the amount of Grades A, B, C, D, and F from the range of A = 90 - 100, B = 80 - 89, C = 70 - 79, D = 60 - 69, and F = 0 - 59.
6. Output sorted scores, Amount of students on getting grade A, B, C, D, and F.


Problems that ive encountered while doing this project

1. Had to do a lot of procedures to count on how many people get grade A, B, C, D, and F.
2. Ignoring the procedures inside CalcGradeA - CalcGradeF e.g ignoring next1,next2,next3,next4,next5 (Hardcoded imo).


Output:
![image](https://user-images.githubusercontent.com/86523411/123796363-a45d8680-d917-11eb-96c6-1dfc0f5b065e.png)
