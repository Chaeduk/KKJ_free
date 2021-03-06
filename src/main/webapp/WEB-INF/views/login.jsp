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
          <h1 class="mb-8">๋ก๊ทธ์ธ</h1>
          <input class="blank mb-6" placeholder="์์ด๋๋ฅผ ์๋ ฅํด์ฃผ์ธ์." id="user_id"/>
          <input
            class="blank mb-8"
            placeholder="๋น๋ฐ๋ฒํธ๋ฅผ ์๋ ฅํด์ฃผ์ธ์."
            type="password"
            id="user_password"
          />
          <button class="submit-btn mb-5" id="login_btn">๋ก๊ทธ์ธ</button>
          <button class="submit-btn" onclick="location.href='./signup'">ํ์๊ฐ์</button>
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
	      alert("์์ด๋๋ฅผ ์๋ ฅํด์ฃผ์ธ์!");
	    } else if (user_password === '') {
	      alert("๋น๋ฐ๋ฒํธ๋ฅผ ์๋ ฅํด์ฃผ์ธ์!");
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
	    	  alert("๋ก๊ทธ์ธ์ ์คํจํ์์ต๋๋ค.")
	      }
	    }
	  });
	}

	document.addEventListener("DOMContentLoaded", () => {
	  addEventListeners();
	});
  </script>
  
</html>
