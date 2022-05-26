<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>💻 노트북 대여 서비스</title>
    <link rel="stylesheet" href="./resources/css/index.css" />
  </head>
  <body>
    <div class="nav-bar">
      <a href="./" class="logo">💻 노트북 대여 서비스</a>
      <div class="d-flex">
        <a href="./list" class="nav mr-9">조회</a>
        <a href="./borrow" class="nav mr-9">대여</a>
        <c:if test="${seq == null }">
       		<a href="./signin" class="nav">로그인</a>
       	</c:if>
       	<c:if test="${seq != null }">
       		<a href="./myinfo" class="nav">나의정보</a>
       	</c:if>
      </div>
    </div>
    <div class="contents">
      <div class="title">
        <h1>✨한국공학대학교 노트북 대여 서비스입니다✨</h1>
      </div>
      <div class="list">
      	<c:forEach var="notebook" varStatus="status" items="${notebooks}">
	      	<div class="notebook mr-13">
	          <div class="ranking-container">
	            <div class="ranking">
	              <p class="num">${status.count }</p>
	            </div>
	          </div>
	          <div class="info-container">
	            <div class="img-container">
	              <img src="${notebook.notebook_url}" class="img" />
	            </div>
	            <div class="info">
	              <p class="name">${notebook.notebook_name}</p>
	            </div>
	          </div>
	        </div>
      	</c:forEach>
      </div>
    </div>
  </body>
</html>
