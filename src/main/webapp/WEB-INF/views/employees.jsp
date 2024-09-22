<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.employee.modal.Employee" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employees List</title>
    <!-- Bootstrap CSS from CDN -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2 class="mb-4">Employees</h2>
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Designation</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    // Retrieve the list of employees from the request
                    List<Employee> employees = (List<Employee>) request.getAttribute("employees");
                    if (employees != null) {
                        for (Employee employee : employees) {
                %>
                    <tr>
                        <td><%= employee.getFirstname() %></td>
                        <td><%= employee.getLastname() %></td>
                        <td><%= employee.getEmail() %></td>
                        <td><%= employee.getDesignation() %></td>
                        <td>
                            <a href="employee/edit/<%= employee.getId() %>" class="btn btn-warning btn-sm">Edit</a>
                            <a href="employee/delete/<%= employee.getId() %>" class="btn btn-danger btn-sm">Delete</a>
                        </td>
                    </tr>
                <% 
                        }
                    }
                %>
            </tbody>
        </table>
        <a href="employee/new" class="btn btn-primary">Add New Employee</a>
    </div>

    <!-- Bootstrap JS and dependencies from CDN -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>