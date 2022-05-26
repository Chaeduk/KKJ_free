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
      <div class="list borrow-container">
      	<c:forEach var="notebook" varStatus="status" items="${notebooks}">
      		<div class="notebook mr-13">
          		<div class="ranking-container">
            		<div class="ranking">
              			<p class="num">${status.count}</p>
            		</div>
          		</div>
          		<div class="info-container">
	            	<div class="img-container">
	              		<img src="${notebook.notebook_url}" class="img" />
	            	</div>
	            	<div class="info column">
	              		<p class="name">${notebook.notebook_name}</p>
	              	<button class="borrow-btn" data-seq="${notebook.notebook_seq}">대여</button>
	            	</div>
          		</div>
        	</div>
      	</c:forEach>
      </div>
    </div>
  </body>
  <script>
  	const borrow_btn = document.querySelectorAll('.borrow-btn')
  	borrow_btn.forEach((value)=>{
  		value.addEventListener('click', async ()=>{
  			const user_seq = "${seq}"
  			if(user_seq === ''){
  				alert('로그인 후 시도해주세요!')
  				return;
  			} else {
  				const notebook_seq = value.getAttribute('data-seq')
  	  			const response = await fetch(`./notebook/borrow/\${notebook_seq}`)
  	  			const result = await response.json()
  	  			if(result){
  	  				alert('대여하였습니다!')
  	  				location.href="./"
  	  			} else {
  	  				alert('대여에 실패하였습니다.')
  	  			}
  			}
		
  		})
  	})

  </script>
</html>
