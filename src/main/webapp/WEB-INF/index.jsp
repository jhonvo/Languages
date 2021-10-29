<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Languages</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	</head>
	<body class="bg bg-dark">
		
        <div class="mt-5 mx-auto container bg-white p-4 rounded">
            <p class="display-6 mb-3"><b>< </b>Languages <b>/></b></p>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
	                    <th>
	                        Name
	                    </th>
	                    <th>
	                        Creator
	                    </th>
	                    <th>
	                        Version
	                    </th>
	                    <th>
	                        Action
	                    </th>
                    </tr>
                </thead>
                <tbody>
					<c:forEach var="lan" items="${languages}">
                    <tr>
                        <td>
                            <a href="/languages/<c:out value="${lan.id}"/>" class="link-primary"><c:out value="${lan.name}" /></a>
                        </td>
                        <td>
                            <c:out value="${lan.creator}" />
                        </td>
                        <td>
                            <c:out value="${lan.currentVersion}" />
                        </td>
                        <td>
                            <a href="/languages/edit/${lan.id}" class="link-primary">Edit</a> |  <a href="/languages/remove/${lan.id}" class="link-secondary">Remove</a>
                        </td>
                    </tr>
                   </c:forEach>
                    
                </tbody>
            </table>
            <p class="my-3"><b>Add new language:</b></p>

            <form:form action="/languages/save" method="post" modelAttribute="language">
                <div class="row mb-3">
                    <form:label path="name" class="col-sm-2 col-form-label">Name:</form:label>
                    <div class="col-sm-10">
                    <form:input path="name"/>
                    <form:errors path="name"/>
                    </div>
                </div>
                <div class="row mb-3">
                    <form:label path="creator" class="col-sm-2 col-form-label">Creator:</form:label>
                    <div class="col-sm-10">
                    <form:input path="creator"/>
                    <form:errors path="creator"/>
                    </div>
                </div>
                <div class="row mb-3">
                    <form:label path="currentVersion" class="col-sm-2 col-form-label">Current Version:</form:label>
                    <div class="col-sm-10">
                    <form:input path="currentVersion"/>
                    <form:errors path="currentVersion"/>
                    </div>
                </div>
                <div class="text-secondary ts-6 mb-3">
					<c:out value="${errorMessage}"></c:out>
				</div>
                <button type="submit" class="btn btn-success">Submit</button>
            </form:form>

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	</body>
</html>