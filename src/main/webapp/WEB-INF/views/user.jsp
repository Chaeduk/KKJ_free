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
      <div class="my-info-container">
        <button class="my-info-btn mb-6 logout-btn" id="logout_btn">로그아웃</button>
        <button class="my-info-btn" id="delete_user_btn">회원 탈퇴</button>
      </div>
    </div>
    <div class="modal">
      <div class="modal-content">
        <div class="close-container">
          <span class="close">&times;</span>
        </div>
        <h2 class="text-center" style="margin: 0">회원 탈퇴</h2>
        <div class="delete-form-container">
          <div class="delete-form">
            <input   	
              placeholder="비밀번호를 입력해주세요"
              class="blank delete-input"
              type="password"
            />
            <button class="delete-btn" id="modal_btn" >회원 탈퇴</button>
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
  				alert('비밀번호를 입력해주세요!')
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
  					alert('탈퇴를 완료하였습니다.')
  					location.href="./"
  				} else {
  					alert('회원탈퇴에 실패하였습니다.')
  				}
  			}
  		})
  		
  		
  		
  		
  	}
  	document.addEventListener("DOMContentLoaded", () => {
  	  addEventListeners();
  	});
  </script>
</html>
