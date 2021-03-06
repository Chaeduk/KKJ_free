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
      <div class="input-form-container">
        <div class="input-form">
          <h1 class="mb-8">ํ์๊ฐ์</h1>
          <div class="id-container mb-6">
            <input class="id-input" placeholder="์์ด๋๋ฅผ ์๋ ฅํด์ฃผ์ธ์." id="user_id"/>
            <button class="id-btn" id="validation_btn">ํ์ธ</button>
          </div>
          <input
            class="blank mb-6"
            placeholder="๋น๋ฐ๋ฒํธ๋ฅผ ์๋ ฅํด์ฃผ์ธ์."
            type="password"
            id="user_password"
          />
          <input
            class="blank mb-6"
            placeholder="๋น๋ฐ๋ฒํธ๋ฅผ ๋ค์ ์๋ ฅํด์ฃผ์ธ์."
            type="password"
            id="user_password_confirm"
          />
          <button class="submit-btn mt-4" id="signup_btn">ํ์๊ฐ์</button>
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
			 alert("์์ด๋๋ฅผ ์๋ ฅํด์ฃผ์ธ์!");
		  } else {
			  const response = await fetch(`./user/validation/\${user_id}`)
			  const result = await response.json()
			  if(result){
				  alert('์ฌ์ฉ๊ฐ๋ฅํ ์์ด๋์๋๋ค.')
			  } else {
				  alert('์์ด๋๊ฐ ์ค๋ณต๋ฉ๋๋ค.')
			  }
		  }  
		  
	  })
	  
	  signup_btn.addEventListener('click', async ()=>{
		  const user_id = document.getElementById('user_id').value;
		  const user_password = document.getElementById('user_password').value;
		  const user_password_confirm = document.getElementById('user_password_confirm').value
		  
		  if(user_id === ''){
			  alert("์์ด๋๋ฅผ ์๋ ฅํด์ฃผ์ธ์!");
		  } else if( user_password === ''){
			  alert('๋น๋ฐ๋ฒํธ๋ฅผ ์๋ ฅํด์ฃผ์ธ์!');
		  } else if(user_password !== user_password_confirm){
			  alert("๋น๋ฐ๋ฒํธ๊ฐ ๋ค๋ฆ๋๋ค!")
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
				  alert("์ค๋ณต๋ ์์ด๋๊ฐ ์กด์ฌํฉ๋๋ค!")
			  }
		  }
		  
		  
	  })
  }
  document.addEventListener("DOMContentLoaded", () => {
	  addEventListeners();
	});
  </script>
</html>
