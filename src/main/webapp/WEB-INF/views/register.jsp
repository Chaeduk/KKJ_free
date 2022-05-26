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
          <h1 class="mb-8">회원가입</h1>
          <div class="id-container mb-6">
            <input class="id-input" placeholder="아이디를 입력해주세요." id="user_id"/>
            <button class="id-btn" id="validation_btn">확인</button>
          </div>
          <input
            class="blank mb-6"
            placeholder="비밀번호를 입력해주세요."
            type="password"
            id="user_password"
          />
          <input
            class="blank mb-6"
            placeholder="비밀번호를 다시 입력해주세요."
            type="password"
            id="user_password_confirm"
          />
          <button class="submit-btn mt-4" id="signup_btn">회원가입</button>
        </div>
      </div>
    </div>
  </body>
  <script>
  function addEventListeners(){
	 
	  const validation_btn = document.getElementById('validation_btn')
	  const signup_btn = document.getElementById('signup_btn')
	  
	  validation_btn.addEventListener('click', async ()=>{
		  const user_id = document.getElementById('user_id').value;
		  if(user_id === ''){
			 alert("아이디를 입력해주세요!");
		  } else {
			  const response = await fetch(`./user/validation/\${user_id}`)
			  const result = await response.json()
			  if(result){
				  alert('사용가능한 아이디입니다.')
			  } else {
				  alert('아이디가 중복됩니다.')
			  }
		  }  
		  
	  })
	  
	  signup_btn.addEventListener('click', async ()=>{
		  const user_id = document.getElementById('user_id').value;
		  const user_password = document.getElementById('user_password').value;
		  const user_password_confirm = document.getElementById('user_password_confirm').value
		  
		  if(user_id === ''){
			  alert("아이디를 입력해주세요!");
		  } else if( user_password === ''){
			  alert('비밀번호를 입력해주세요!');
		  } else if(user_password !== user_password_confirm){
			  alert("비밀번호가 다릅니다!")
		  } else{
			  const data = {user_id, user_password}
			  const response = await fetch('./user/signup/', {
				  method: "POST",
				  headers: {
					  "Content-Type": "application/json"
				  },
				  body: JSON.stringify(data),
			  })
			  const result = await response.json()
			  if(result){
				  location.href="./signin"
			  } else {
				  alert("중복된 아이디가 존재합니다!")
			  }
		  }
		  
		  
	  })
  }
  document.addEventListener("DOMContentLoaded", () => {
	  addEventListeners();
	});
  </script>
</html>
