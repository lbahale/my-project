<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %> <!-- Import the List class -->
<!DOCTYPE html>
<html>
<head>
    <title>Add New Employee</title>
    <!-- Bootstrap CSS from CDN -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .form-control-sm {
            height: calc(1.5em + .75rem + 2px); /* Adjust height for smaller size */
            padding: .25rem .5rem; /* Adjust padding */
            font-size: .875rem; /* Adjust font size */
        }
        .error-message {
            margin-bottom: 1rem;
        }
    </style>
    <script>
        function validateForm() {
            var firstname = document.getElementById("firstname").value.trim();
            var lastname = document.getElementById("lastname").value.trim();
            var dob = new Date(document.getElementById("dob").value);
            var email = document.getElementById("email").value.trim();
            var today = new Date();
            var age = today.getFullYear() - dob.getFullYear();
            var month = today.getMonth() - dob.getMonth();
            if (month < 0 || (month === 0 && today.getDate() < dob.getDate())) {
                age--;
            }

            var errors = [];
            var errorMessages = document.getElementById("errorMessages");

            // Clear previous error messages
            errorMessages.innerHTML = "";

            if (!firstname) {
                errors.push("First Name is required.");
            }
            if (!lastname) {
                errors.push("Last Name is required.");
            }
            if (!email) {
                errors.push("Email is required.");
            } else if (!/^\S+@\S+\.\S+$/.test(email)) {
                errors.push("Email format is invalid.");
            }
            if (isNaN(dob.getTime())) {
                errors.push("Date of Birth is required.");
            } else if (age < 18 || age > 60) {
                errors.push("Age should be between 18 and 60.");
            }

            if (errors.length > 0) {
                errors.forEach(function(message) {
                    var div = document.createElement("div");
                    div.className = "alert alert-danger error-message";
                    div.role = "alert";
                    div.textContent = message;
                    errorMessages.appendChild(div);

                    // Remove the error message after 2 seconds
                    setTimeout(function() {
                        div.remove();
                    }, 2000);
                });
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <div class="container mt-4">
        <h2 class="mb-4">Add Employee</h2>
        <form action="/employee/add" method="post" onsubmit="return validateForm()">
            <div id="errorMessages"></div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="firstname">First Name:</label>
                    <input type="text" class="form-control form-control-sm" id="firstname" name="firstname">
                </div>
                <div class="form-group col-md-6">
                    <label for="lastname">Last Name:</label>
                    <input type="text" class="form-control form-control-sm" id="lastname" name="lastname">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control form-control-sm" id="email" name="email">
                </div>
                <div class="form-group col-md-6">
                    <label for="designation">Designation:</label>
                    <select class="form-control form-control-sm" id="designation" name="designation">
                        <%
                            // Retrieve the list of designations from the model
                            List<String> designations = (List<String>) request.getAttribute("designations");
                            if (designations != null) {
                                for (String designation : designations) {
                        %>
                            <option value="<%= designation %>"><%= designation %></option>
                        <%
                                }
                            }
                        %>
                    </select>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="dob">DOB:</label>
                    <input type="date" class="form-control form-control-sm" id="dob" name="dob">
                </div>
                <div class="form-group col-md-6">
                    <label for="gender">Gender:</label>
                    <select class="form-control form-control-sm" id="gender" name="gender">
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="startDate">Start Date:</label>
                <input type="date" class="form-control form-control-sm" id="startDate" name="startDate">
            </div>
            <button type="submit" class="btn btn-primary">Add Employee</button>
        </form>
        <a href="/employees" class="btn btn-secondary mt-3">Back to Employee List</a>
    </div>

    <!-- Bootstrap JS and dependencies from CDN -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>