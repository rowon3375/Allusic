<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인, 회원가입 모달 및 유효성</title>
   <script type="text/javascript">
    //로그인 유효성
    function formLogin(){
		//유효성 검사
		var user_id = document.getElementById("user_id").value;
		var user_pw = document.getElementById("user_pw").value;
	
		//1. id, pw 유무 검사
		if(user_id.length == "" && user_pw.length == ""){
			document.getElementById("loginCheck").innerHTML='아이디, 비밀번호를 입력해주세요';
		return false;
		}
		
		if(user_id.length == ""){
			document.getElementById("loginCheck").innerHTML='아이디를 입력해주세요';
		return false;
		}
		
		if(user_pw.length == ""){
			document.getElementById("loginCheck").innerHTML='비밀번호를 입력해주세요';
		return false;
		}
		
		//2. id, pw 둘다 잘못 입력 되었을 경우
		if((user_id.length < 4 || user_pw.length > 10) &&
				(user_pw.length < 4 || user_pw.length > 10)){
		document.getElementById("loginCheck").innerHTML='아이디, 비밀번호를 올바르게 입력하세요';
		return false;
		}
		
		
		//3. id 유효성 검사
		if(user_id.length < 4 || user_pw.length > 10){
			document.getElementById("loginCheck").innerHTML='아이디를 올바르게 입력하세요';
		return false;
		}
		
		//4. pw 유효성 검사
		if(user_pw.length < 4 || user_pw.length > 10){
			document.getElementById("loginCheck").innerHTML='비밀번호를 올바르게 입력하세요';
		return false;
		}
		
	return true;
	}
    
    //회원가입 유효성
    function formJoin(){
	//유효성 검사
	var join_name = document.getElementById("join_name").value;
	var join_id = document.getElementById("join_id").value;
	var join_pw = document.getElementById("join_pw").value;
	
	//1. 이름, id, pw 입력 안되었을 경우
	if(join_name.length == "" && join_id.length == "" && join_pw.length == ""){
		document.getElementById("joinCheck").innerHTML='이름, 아이디, 비밀번호를 입력해주세요';
		return false;
	}
	
	if(join_name.length == ""){
		document.getElementById("joinCheck").innerHTML='이름을 입력해주세요';
		return false;
	}
	
	if(join_id.length == ""){
		document.getElementById("joinCheck").innerHTML='아이디를 입력해주세요';
		return false;
	}
	
	if(join_pw.length == ""){
		document.getElementById("joinCheck").innerHTML='비밀번호를 입력해주세요';
		return false;
	}
	
	
	//2. id, pw 둘다 잘못 입력 되었을 경우
	if((join_id.length < 4 || join_pw.length > 10) &&
			(user_pw.length < 4 || user_pw.length > 10)){
	document.getElementById("joinCheck").innerHTML='아이디, 비밀번호를 올바르게 입력하세요';
	return false;
	}
	
	
	//3. id 유효성 검사
	if(join_id.length < 4 || join_pw.length > 10){
		document.getElementById("joinCheck").innerHTML='아이디를 올바르게 입력하세요';
	return false;
	}
	
	//4. pw 유효성 검사
	if(join_pw.length < 4 || join_pw.length > 10){
		document.getElementById("joinCheck").innerHTML='비밀번호를 올바르게 입력하세요';
	return false;
	}
	
		return true;
	}

	function searchCheck(){
		if($("#searchText").val().length < 1){
			alert("글자 수는 1자 이상 입력하셔야 합니다!!")
			return false;
		}

		return true;
			
	} 
    
    </script>
      <style>
         @import url(//fonts.googleapis.com/earlyaccess/jejuhallasan.css);
    
      
      </style>
  </head>
  <body>
     <!-- 로그인모달  -->
    <div class="modal fade" id="로그인모달" tabindex="-1" aria-labelledby="exampleModalCenterTitle" style="display: none; font-family: 'Noto Sans KR', sans-serif;" aria-hidden="true" >
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content" style="display: flex; justify-content: center; align-items: center; padding: 32px 0px 48px; width: 375px; height: 545px; border-radius: 3%">
        <header>
        	<img src="./resources/img/mainLogo.png" width="150px" class="logoImg" >
        </header>
        
        <h2 class="로그인">로그인</h2>
         
        
        <section class="center-block;" style="width: 375px; height: 456px; margin: 0; align-content: center;">



<!--  아이디 -->
<form action="login" method="post" onsubmit="return formLogin()">
    <input type="hidden" name="song_id" value="${song_id }">
    <input type="hidden" name="singer_id" value="${singer_id }">
    
    <div class="form-floating" style=
         "width: 100%;
          height: 44px;
          padding: 0px 12px;
          margin-bottom: 20px;
          ">
      <input type="text" class="form-control" id="user_id" name="user_id" control-id="ControlID-1" 
             style="background: rgb(245, 245, 245);
                    border: none;">
      <label for="floatingInput" style="color: rgb(160, 160, 160); padding-left: 20px">아이디</label>
      
      
   
    </div>
<!-- 비밀번호 -->
<div class="form-floating" style=
        "width: 100%;
         height: 44px;
         padding: 0px 12px;">
      <input type="password" class="form-control" id="user_pw" name="user_pw" control-id="ControlID-2"
             style="background: rgb(245, 245, 245);
                    border: none;">
      <label for="floatingPassword" style="color: rgb(160, 160, 160); padding-left: 20px">비밀번호</label>
      
      <div style="color:red" id="loginCheck"></div>
      
    </div>
    
        <div class="로그인버튼" style="width: 375px; align-content: center; align-items: center;">
        
            <button type="submit" class="로그인b" 
                    style="width: 355px;
                           height: 44px;
                           background: rgb(255, 47, 110);
                           color: rgb(255, 255, 255);
                           text-align: center;
                           font-size: 17px;
                           font-weight: 400;
                           border-radius: 10px;
                           margin-top: 40px;
                           margin-left: 10px;
                           box-shadow: none;
                           border: none;">
                로그인
            </button>
            </div>
            
            <div class="비밀번호" style="
                                    margin-top: 20px;
                                    margin-bottom: 14px;
                                    text-align: center;
                                    width: 355px;
                                    height: 21px;">
            
            </div>
            
            <div class="회원가입" style="text-align: center;
                                    width: 355px;
                                    height: 21px;">
            <span>계정이 없으신가요?</span>
            <a style="color: red; text-decoration:none;" data-bs-toggle="modal" data-bs-target="#회원가입모달">회원가입</a>
            </div>
</form>
        </section>
      
    </div>
  </div>
</div>
    
    
    
    
        
        <!-- 회원가입모달  -->
    <div class="modal fade" id="회원가입모달" tabindex="-1" aria-labelledby="exampleModalCenterTitle" style="display: none; font-family: 'Noto Sans KR', sans-serif;" aria-hidden="true" >
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content" style="display: flex; justify-content: center; align-items: center; padding: 32px 0px 48px; width: 375px; height: 580px; border-radius: 3%">
        <header>
        <img src="./resources/img/mainLogo.png" width="150px" class="logoImg" >
        </header>
        
        <div class="회원가입란" style="margin: 30px 0px 0px;">
            <p class="회원가입 fw-bold">회원가입</p>
         </div>
        
        <section class="center-block;" style="width: 375px; height: 350px; margin: 0; align-content: center;">
        
        
<!--  이름  -->
<form action="join" method="post" onsubmit="return formJoin()">
	<input type="hidden" name="song_id" value="${song_id }">
    <input type="hidden" name="singer_id" value="${singer_id }">
    <div class="form-floating" style=
         "width: 100%;
          height: 44px;
          padding: 0px 12px;
          margin-bottom: 20px;
          ">
          
      <input type="text" class="form-control" id="join_name" name="user_name" control-id="ControlID-1" 
             style="background: rgb(245, 245, 245);
                    border: none;
                    ">
      <label for="floatingInput" style="color: rgb(160, 160, 160); padding-left: 20px">
          이름</label>
          
    </div>
           
            
<!-- 아이디 -->
<div class="form-floating" style=
        "width: 100%;
         height: 44px;
         padding: 0px 12px;
         margin-bottom: 20px;">
      <input type="text" class="form-control" id="join_id" name="user_id" control-id="ControlID-2"
             style="background: rgb(245, 245, 245);
                    border: none;">
      <label for="floatingPassword" style="color: rgb(160, 160, 160); padding-left: 20px">아이디</label>
      
      
    </div>
            
 <!-- 비밀번호 -->
<div class="form-floating" style=
        "width: 100%;
         height: 44px;
         padding: 0px 12px;">
      <input type="password" class="form-control" id="join_pw" name="user_pw" control-id="ControlID-2"
             style="background: rgb(245, 245, 245);
                    border: none;">
      <label for="floatingPassword" style="color: rgb(160, 160, 160); padding-left: 20px">비밀번호</label>
      
      
      <div style="color:red" id="joinCheck"></div>
    </div>
            
<!--          로그인 버튼 -->
        <div class="로그인버튼" style="width: 375px; align-content: center; align-items: center;">
            <button type="submit" class="로그인b" 
                    style="width: 355px;
                           height: 44px;
                           background: rgb(255, 47, 110);
                           color: rgb(255, 255, 255);
                           text-align: center;
                           font-size: 17px;
                           font-weight: 400;
                           border-radius: 10px;
                           margin-top: 40px;
                           margin-left: 10px;
                           box-shadow: none;
                           border: none;">
                회원가입
            </button>
            </div>
            
            <div class="비밀번호" style="
                                    margin-top: 20px;
                                    margin-bottom: 14px;
                                    text-align: center;
                                    width: 355px;
                                    height: 21px;">
            <span>이미 가입하셨나요? </span>
                <a style="color: red; text-decoration:none;" data-bs-toggle="modal" data-bs-target="#로그인모달">로그인</a>
            
            </div>
            
</form> 
        </section>
      
    </div>
  </div>
</div>

