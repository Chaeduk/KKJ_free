<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
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
    <div class="contents list-container">
      <c:forEach var="history" items="${historys}">
	      <div class="list-item-container">
	        <div class="item-info-container">
	          <img src="${history.notebook_url }" class="item-img" />
	          <div class="item-info-txt-container">
	            <p class="item-info-txt">${history.notebook_name }</p>
	            <p class="item-info-txt">๋์ฌ์ผ : ${history.date }</p>
	          </div>
	        </div>
	        <c:if test="${history.status == 'B'}">
	        	<button class="return-btn" data-seq="${history.history_seq}">๋ฐ๋ฉ</button>
	        </c:if>
	      </div>
      </c:forEach>
    </div>
  </body>
  <script>
  	const return_btn = document.querySelectorAll('.return-btn')
  	return_btn.forEach((value)=>{
  		value.addEventListener('click', async ()=>{
  			const history_seq = value.getAttribute('data-seq')
  			location.href = `./history/return/\${history_seq}`
  		})
  	})
  </script>
</html>
