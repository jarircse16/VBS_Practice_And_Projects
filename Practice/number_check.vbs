' Prompt the user to enter a number
number = InputBox("Enter a number:")

' Convert the input value to a number (VBScript treats all InputBox results as strings)
number = CDbl(number)

' Check if the number is zero, negative, or positive and display the result
If number = 0 Then
    WScript.Echo "The number is zero."
ElseIf number < 0 Then
    WScript.Echo "The number is negative."
Else
    WScript.Echo "The number is positive."
End If
