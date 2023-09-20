' Initialize variables to store the sums
sum1 = 0
sum2 = 0

' Loop from 51 to 100 and add the numbers
For i = 51 To 100
    sum1 = sum1 + i
Next

' Loop from 50 to 1 and add the numbers
For i = 50 To 1 Step -1
    sum2 = sum2 + i
Next

' Calculate the total sum
totalSum = sum1 + sum2

' Display the individual sums and the total sum
WScript.Echo "Sum of numbers from 51 to 100: " & sum1
WScript.Echo "Sum of numbers from 50 to 1: " & sum2
WScript.Echo "Total sum: " & totalSum
