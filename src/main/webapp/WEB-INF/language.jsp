<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                <p><a href="/languages" class="link-primary">Dashboard</a></p>
            </div>
            
                <div class="row mb-3">
                    <p class="col-sm-2 ">Creator:</p>
                    <p class="col-sm-10"><c:out value="${lan.creator}" /></p>
                </div>
                <div class="row mb-3">
                    <p class="col-sm-2 ">Current Version:</p>
                    <p class="col-sm-10"><c:out value="${lan.currentVersion}" /></p>
                </div>

                <p><a href="/languages/edit/${lan.id}" class="link-primary">Edit</a> |  <a href="/languages/remove/${lan.id}" class="link-secondary">Remove</a></p>
            
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	</body>
</html>