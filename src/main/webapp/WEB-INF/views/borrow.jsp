<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>๐ป ๋ธํธ๋ถ ๋์ฌ ์๋น์ค</title>
    <link rel="stylesheet" href="./resources/css/index.css" />
  </head>
  <body>
    <div class="nav-bar">
      <a href="./" class="logo">๐ป ๋ธํธ๋ถ ๋์ฌ ์๋น์ค</a>
      <div class="d-flex">
        <a href="./list" class="nav mr-9">์กฐํ</a>
        <a href="./borrow" class="nav mr-9">๋์ฌ</a>
        <c:if test="${seq == null }">
       		<a href="./signin" class="nav">๋ก๊ทธ์ธ</a>
       	</c:if>
       	<c:if test="${seq != null }">
       		<a href="./myinfo" class="nav">๋์์ ๋ณด</a>
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
	              	<button class="borrow-btn" data-seq="${notebook.notebook_seq}">๋์ฌ</button>
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
  				alert('๋ก๊ทธ์ธ ํ ์๋ํด์ฃผ์ธ์!')
  				return;
  			} else {
  				const notebook_seq = value.getAttribute('data-seq')
  	  			const response = await fetch(`./notebook/borrow/\${notebook_seq}`)
  	  			const result = await response.json()
  	  			if(result){
  	  				alert('๋์ฌํ์์ต๋๋ค!')
  	  				location.href="./"
  	  			} else {
  	  				alert('๋์ฌ์ ์คํจํ์์ต๋๋ค.')
  	  			}
  			}
		
  		})
  	})

  </script>
</html>
