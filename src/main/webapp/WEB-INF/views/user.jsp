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
      <div class="my-info-container">
        <button class="my-info-btn mb-6 logout-btn" id="logout_btn">๋ก๊ทธ์์</button>
        <button class="my-info-btn" id="delete_user_btn">ํ์ ํํด</button>
      </div>
    </div>
    <div class="modal">
      <div class="modal-content">
        <div class="close-container">
          <span class="close">&times;</span>
        </div>
        <h2 class="text-center" style="margin: 0">ํ์ ํํด</h2>
        <div class="delete-form-container">
          <div class="delete-form">
            <input   	
              placeholder="๋น๋ฐ๋ฒํธ๋ฅผ ์๋ ฅํด์ฃผ์ธ์"
              class="blank delete-input"
              type="password"
            />
            <button class="delete-btn" id="modal_btn" >ํ์ ํํด</button>
          </div>
        </div>
      </div>
    </div>
  </body>
  <script>
  	function addEventListeners(){
  		const delete_user_btn = document.querySelector('#delete_user_btn')
  		const close = document.querySelector('.close')
  		const modal = document.querySelector('.modal')
  		const logout_btn = document.getElementById('logout_btn')
  		const modal_btn = document.getElementById('modal_btn')
  		const user_password_input = document.querySelector('.delete-input')
  		
  		delete_user_btn.addEventListener('click', ()=>{
  			
  			modal.style.display = 'block'
  		})
  		
  		close.addEventListener('click', ()=>{
  			modal.style.display = "none";
  		})
  		
  		window.onclick = function(event){
  			if(event.target == modal){
  				modal.style.display = "none"
  			}
  		}
  		
  		logout_btn.addEventListener('click', ()=>{
  			location.href="./logout"
  		})
  		
  		modal_btn.addEventListener('click', async ()=>{
  	  		const user_password = user_password_input.value
  			if(user_password === ''){
  				alert('๋น๋ฐ๋ฒํธ๋ฅผ ์๋ ฅํด์ฃผ์ธ์!')
  			} else {
  				const response = await fetch(`./user/delete`, {
  					method: "POST",
  					headers: {
  						"Content-Type": "application/json"
  					},
  					body: JSON.stringify({user_password})
  				})
  				const result = await response.json()
  				if(result){
  					alert('ํํด๋ฅผ ์๋ฃํ์์ต๋๋ค.')
  					location.href="./"
  				} else {
  					alert('ํ์ํํด์ ์คํจํ์์ต๋๋ค.')
  				}
  			}
  		})
  		
  		
  		
  		
  	}
  	document.addEventListener("DOMContentLoaded", () => {
  	  addEventListeners();
  	});
  </script>
</html>
