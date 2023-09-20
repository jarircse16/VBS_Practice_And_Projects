' Prompt the user to enter the first number
num1 = InputBox("Enter the first number:")

' Prompt the user to enter the second number
num2 = InputBox("Enter the second number:")

' Convert the input values to numbers (VBScript treats all InputBox results as strings)
num1 = CDbl(num1)
num2 = CDbl(num2)

' Calculate the sum
sum = num1 + num2

' Display the result
WScript.Echo "The sum of " & num1 & " and " & num2 & " is: " & sum
