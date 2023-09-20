' Function to perform addition
Function Add(num1, num2)
    Add = num1 + num2
End Function

' Function to perform subtraction
Function Subtract(num1, num2)
    Subtract = num1 - num2
End Function

' Function to perform multiplication
Function Multiply(num1, num2)
    Multiply = num1 * num2
End Function

' Function to perform division
Function Divide(num1, num2)
    If num2 = 0 Then
        Divide = "Cannot divide by zero"
    Else
        Divide = num1 / num2
    End If
End Function

' Main program
WScript.Echo "Simple Calculator in VBScript"
WScript.Echo "Enter two numbers:"

' Input the first number
num1 = InputBox("Enter the first number:")
If Not IsNumeric(num1) Then
    WScript.Echo "Invalid input. Please enter a numeric value."
    WScript.Quit
End If

' Input the second number
num2 = InputBox("Enter the second number:")
If Not IsNumeric(num2) Then
    WScript.Echo "Invalid input. Please enter a numeric value."
    WScript.Quit
End If

' Display the menu of operations
WScript.Echo "Choose an operation:"
WScript.Echo "1. Addition"
WScript.Echo "2. Subtraction"
WScript.Echo "3. Multiplication"
WScript.Echo "4. Division"

' Input the operation choice
choice = InputBox("Enter the operation number (1/2/3/4):")
Select Case choice
    Case "1"
        result = Add(CDbl(num1), CDbl(num2))
        operation = "Addition"
    Case "2"
        result = Subtract(CDbl(num1), CDbl(num2))
        operation = "Subtraction"
    Case "3"
        result = Multiply(CDbl(num1), CDbl(num2))
        operation = "Multiplication"
    Case "4"
        result = Divide(CDbl(num1), CDbl(num2))
        operation = "Division"
    Case Else
        WScript.Echo "Invalid operation choice. Please select 1, 2, 3, or 4."
        WScript.Quit
End Select

' Display the result
WScript.Echo "Result of " & operation & ": " & result
