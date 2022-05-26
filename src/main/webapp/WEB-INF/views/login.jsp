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
      <div class="input-form-container">
        <div class="input-form">
          <h1 class="mb-8">로그인</h1>
          <input class="blank mb-6" placeholder="아이디를 입력해주세요." id="user_id"/>
          <input
            class="blank mb-8"
            placeholder="비밀번호를 입력해주세요."
            type="password"
            id="user_password"
          />
          <button class="submit-btn mb-5" id="login_btn">로그인</button>
          <button class="submit-btn" onclick="location.href='./signup'">회원가입</button>
        </div>
      </div>
    </div>
  </body>
  <script>
  function addEventListeners() {
	  const btn = document.getElementById("login_btn");
	  btn.addEventListener("click", async (e) => {
	    e.preventDefault();
	    const user_id = document.getElementById("user_id").value;
	    const user_password = document.getElementById("user_password").value;
	    if (user_id === '') {
	      alert("아이디를 입력해주세요!");
	    } else if (user_password === '') {
	      alert("비밀번호를 입력해주세요!");
	    } else {
	      const data = { user_id, user_password };
	      const response = await fetch("./user/signin", {
	        method: "POST",
	        headers: {
	          "Content-Type": "application/json",
	        },
	        body: JSON.stringify(data),
	      });
	      const result = await response.json()
	      if(result){
	    	  location.href="./"
	      } else{
	    	  alert("로그인에 실패하였습니다.")
	      }
	    }
	  });
	}

	document.addEventListener("DOMContentLoaded", () => {
	  addEventListeners();
	});
  </script>
  
</html>
