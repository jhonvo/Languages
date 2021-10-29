<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ page isErrorPage="true" %>  


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	</head>
	<body class="bg bg-dark">
		
        <div class="mt-5 mx-auto container bg-white p-4 rounded">
            <div class="d-flex mb-3 flex-row align-items-center justify-content-between">
                <p class="display-6"><b>< </b><c:out value="${lan.name}" /><b>/></b></p>
                <p><a href="/languages" class="link-primary">Dashboard</a> |  <a href="/languages/remove/${lan.id}" class="link-secondary">Remove</a></p>
            </div>
            
            
             <form:form action="/languages/${lan.id}" method="post" modelAttribute="language">
                <input type="hidden" name="_method" value="put">
                <div class="row mb-3">
                    <form:label path="name" class="col-sm-2 col-form-label">Name:</form:label>
                    <div class="col-sm-10">
                    <form:input path="name" value="${lan.name}"/>
                    <form:errors path="name"/>
                    </div>
                </div>
                <div class="row mb-3">
                    <form:label path="creator" class="col-sm-2 col-form-label">Creator:</form:label>
                    <div class="col-sm-10">
                    <form:input path="creator" value="${lan.creator}"/>
                    <form:errors path="creator"/>
                    </div>
                </div>
                <div class="row mb-3">
                    <form:label path="currentVersion" class="col-sm-2 col-form-label">Current Version:</form:label>
                    <div class="col-sm-10">
                    <form:input path="currentVersion" value="${lan.currentVersion}"/>
                    <form:errors path="currentVersion"/>
                    </div>
                </div>
                <div class="text-secondary ts-6 mb-3">
					<c:out value="${errorMessage}"></c:out>
				</div>
                <button type="submit" class="btn btn-success">Update</button>
            </form:form>
           

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	</body>
</html>