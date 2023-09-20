Dim taskList
Set taskList = CreateObject("Scripting.Dictionary")

' Load tasks from a file when the script starts
LoadTasksFromFile

Function getCurrentDateTime()
    Dim dt
    dt = Now
    getCurrentDateTime = FormatDateTime(dt, vbGeneralDate)
End Function

Sub LoadTasksFromFile()
    Dim objFSO, objFile
    Set objFSO = CreateObject("Scripting.FileSystemObject")

    ' Specify the path to the tasks file
    Dim filePath
    filePath = "E:\Users\Jarir Ahmed\OneDrive\Documents\VBS_Practice\Projects\ToDOLIST\tasks\tasks.txt" ' Change this to your desired file path

    If objFSO.FileExists(filePath) Then
        Set objFile = objFSO.OpenTextFile(filePath, 1, False)
        Do Until objFile.AtEndOfStream
            Dim taskLine
            taskLine = objFile.ReadLine
            ' Parse the task line to extract task and timestamp (e.g., "Task1 (Timestamp)")
            Dim task, timestamp
            task = Left(taskLine, InStr(taskLine, " (") - 1)
            timestamp = Mid(taskLine, InStr(taskLine, "(") + 2, Len(taskLine) - InStr(taskLine, "(") - 3)
            taskList(task) = CStr(timestamp) ' Convert timestamp to a string
        Loop
        objFile.Close
    End If
End Sub

Sub SaveTasksToFile()
    Dim objFSO, objFile
    Set objFSO = CreateObject("Scripting.FileSystemObject")

    ' Specify the path to the tasks file
    Dim filePath
    filePath = "E:\Users\Jarir Ahmed\OneDrive\Documents\VBS_Practice\Projects\ToDOLIST\tasks\tasks.txt" ' Change this to your desired file path

    Set objFile = objFSO.CreateTextFile(filePath, True)

    For Each task In taskList.Keys
        objFile.WriteLine task & " (" & taskList(task) & ")"
    Next

    objFile.Close
End Sub

Sub addTask()
    Dim task, listItem, taskDateTime
    task = Trim(document.getElementById("taskInput").value)

    If task = "" Then
        MsgBox "Please enter a task.", vbExclamation, "Error"
    Else
        taskDateTime = getCurrentDateTime()
        taskList(task) = FormatDateTime(taskDateTime, vbGeneralDate) ' Format date and time as a string
        document.getElementById("taskInput").value = ""
        refreshTaskList()
        SaveTasksToFile ' Save tasks after adding a new one
    End If
End Sub

Sub refreshTaskList()
    Dim tasks, task, taskDateTime, i
    tasks = ""
    i = 1

    For Each task In taskList.Keys
        taskDateTime = taskList(task)
        tasks = tasks & "<li>" & task & " (" & taskDateTime & ") <button class='edit-button' onclick='editTask(""" & task & """)'>Edit</button> <button class='delete-button' onclick='deleteTask(""" & task & """)'>Delete</button></li>"
        i = i + 1
    Next

    document.getElementById("taskList").innerHTML = tasks
End Sub

Sub editTask(task)
    Dim newTask, taskDateTime
    newTask = InputBox("Edit task:", "Edit Task", task)

    If newTask <> "" Then
        taskDateTime = getCurrentDateTime()
        taskList.Remove task
        taskList(CStr(newTask)) = taskDateTime ' Convert newTask to a string
        refreshTaskList()
        SaveTasksToFile ' Save tasks after editing
    End If
End Sub

Sub deleteTask(task)
    If MsgBox("Are you sure you want to delete this task?", vbQuestion + vbYesNo, "Delete Task") = vbYes Then
        taskList.Remove task
        refreshTaskList()
        SaveTasksToFile ' Save tasks after deleting
    End If
End Sub

refreshTaskList()
