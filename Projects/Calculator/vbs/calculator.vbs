Sub calculate(operation)
    Dim num1, num2, result
    num1 = CDbl(document.getElementById("num1").value)
    num2 = CDbl(document.getElementById("num2").value)

    Select Case operation
        Case "add"
            result = num1 + num2
        Case "subtract"
            result = num1 - num2
        Case "multiply"
            result = num1 * num2
        Case "divide"
            If num2 = 0 Then
                result = "Cannot divide by zero"
            Else
                result = num1 / num2
            End If
    End Select

    document.getElementById("result").innerText = "Result: " & result
End Sub
