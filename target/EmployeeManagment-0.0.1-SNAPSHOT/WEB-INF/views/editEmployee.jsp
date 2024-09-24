<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Employee</title>
</head>
<body>
<h2>Edit Employee</h2>
<form action="/employee/update" method="post">
    <input type="hidden" name="id" value="${employee.id}"/>
    First Name: <input type="text" name="firstname" value="${employee.firstname}"/><br/>
    Last Name: <input type="text" name="lastname" value="${employee.lastname}"/><br/>
    Email: <input type="text" name="email" value="${employee.email}"/><br/>
    Designation: <input type="text" name="designation" value="${employee.designation}"/><br/>
    DOB: <input type="date" name="dob" value="${employee.dob}"/><br/>
    Gender: 
    <select name="gender">
        <option value="Male" ${employee.gender == 'Male' ? 'selected' : ''}>Male</option>
        <option value="Female" ${employee.gender == 'Female' ? 'selected' : ''}>Female</option>
    </select><br/>
    Start Date: <input type="date" name="startDate" value="${employee.startDate}"/><br/>
    <input type="submit" value="Update Employee"/>
</form>
<a href="/employees">Back to Employee List</a>
</body>
</html>
