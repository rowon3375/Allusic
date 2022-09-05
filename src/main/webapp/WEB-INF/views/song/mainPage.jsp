<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
      
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
      
    <link href="../resources/css/Allusic.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
      
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
      
      <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous">
      </script>
      
      
       <script type="text/javascript">

//스크롤을 내려도 헤더 유지    
  $(window).scroll(function() {
      
      if($(this).scrollTop() > 200) {
        $("#AllusicH2").show();
        $("#AllusicH2").css('visibility','visible');
        $("#AllusicH").hide();
		$("#AllusicH2").css('background','#FFFFFF');
        
        
	}
      
	else {
        $("#AllusicH").show();
		$("#AllusicH2").hide();

	}
});


      
      
$(document).ready(function(){
	//로고 사진 경로 맞춰줌
	//여기서 로고 사진 경로를 맞춰줘서 그런가 이유를 모르게 밑의 에러가 뜨지만 로고 사진은 정상적으로 불러옵니다...
	//No mapping found for HTTP request with URI [/mylife/song/resources/img/mainLogo.png] 에러가 뜨지만
		$(".logoImg").attr("src", "../resources/img/mainLogo.png");

		//별점을 클릭할 시 starForm을 submit시켜서 별점 관련 정보를 컨트롤러에 넘겨줌
	  $(":radio[name='starpoint']").on('click', function(){
		  var user_id = $("#ui").val()
		  var star = $(":radio[name='starpoint']:checked").val();

		if(user_id ==  ''){
			  alert("로그인이 필요한 서비스 입니다");

		}else{
			$("#star").val(star);
			$("#starForm").submit();
			
		}
			
	  });
	
	   
});

//검색 글자 수 체크(함수가 2개인 이유는 헤더가 두개기 때문)
function searchCheck(){
	
	if($("#searchText").val().length < 1){
		alert("글자 수는 1자 이상 입력하셔야 합니다!!")
		return false;
	}

	return true;
		
} 
function searchCheck2(){
	
	if($("#searchText1").val().length < 1){
		alert("글자 수는 1자 이상 입력하셔야 합니다!!")
		return false;
	}

	return true;
		
} 

/* 리스트에 곡 추가 */
function addSongtoList(){
		var check = $(":radio[name='list']:checked");
		var result = false;
		
	   check.each(function(){
		   //한개라도 리스트가 체크 되었다면 true 리턴(폼 보냄)
			if(check.is(":checked") == true){
				var p_id = check.val();

				result = true;
				$("#playlist_id").val(p_id);
			}
		   
		});

		//리스트를 한개라도 선택하지 않았을 경우 알림 띄움
		if(result == false){
			alert("리스트를 하나 이상 선택해주세요!!");
		}
	   
	   return result;
	 } 
	 
	 
	 /*
	 	플레이리스트 추가
	 */
	function addPlayListCheck(){
			 var list_name = document.getElementById("list_name").value;
			//3. pw 유효성 검사
			var list_explain = document.getElementById("list_explain").value;
			
			if( list_name == '' || list_explain == ''){
				alert("리스트의 이름, 리스트의 설명은 반드시 입력해주셔야 합니다.");
				alert("리스트 생성 실패!");
				return false;
			}
			
		return true;
	 }



      </script>
   <!-- CSS , JS -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
      
    <title>곡 화면</title>
    
    <c:import url="../menu/menu.jsp"></c:import>
   
    
  <style>
     @import url(//fonts.googleapis.com/earlyaccess/jejuhallasan.css);
      
  </style>
 <!-- 필요 없지 않나
 
</head>
    <body>
  --> 
         
         
<!--헤더A-->
    <header class="p-2 mb-3 fixed-top align-items-center" id="AllusicH" style="font-family: 'Noto Sans KR', sans-serif; ">
    <div class="container-fluid" style="width: 93%">
      <div class="d-flex flex-wrap align-items-center justify-content-start ">
<!--          justify-content-lg-start-->
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
        </a>

        <ul class="nav col-12 col-lg-auto me-lg-auto mlmb-2 justify-content-center mb-md-0 text-white">
          <li><a href="/mylife" ><div  class="nav-link px-2 w-100" ><img src="../resources/img/곡용.png" alt="img" width="" height="40" style="margin-right: 30px"> </div></a></li>
        
        </ul>

        <form action="/mylife/search/searchResult" method="get" onsubmit="return searchCheck2();" class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
          <input type="search" id="searchText1" name="searchText" class="form-control" placeholder="검색어를 입력하세요"  aria-label="Search" control-id="ControlID-2" 
                 style="background: transparent;" >
        </form>

              
        <!-- 로그인 안 되어있을때 -->
       	  <c:if test="${user_id == null }">
            <button id="로그인보탄" style="opacity: 0.6" data-bs-toggle="modal" data-bs-target="#로그인모달">
                        <div id="좋아요1"  >
                                로그인
                        </div>
                </button>
           </c:if>
            
            <!-- 로긘 되어있을때 -->
      <c:if test="${user_id != null }">      
        <div class="dropdown text-end">

          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="../resources/img/profile2.jpg" alt="mdo" width="32" height="32" class="rounded-circle">
          </a>
            
          <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
            <li><a class="dropdown-item" id="openModalBtn" href="/mylife/analysis/main">취향분석</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="logout?song_id=${Song.song_id }&singer_id=${Song.singer_id}">Sign out</a></li>
           
          </ul>
        </div>
         </c:if>
      </div>
    </div>
  </header>
  
  
<!--헤더B-->
    
    <header class="p-2 mb-3 fixed-top align-items-center border-bottom border-info" id="AllusicH2" 
            style="font-family: 'Noto Sans KR', sans-serif; visibility: hidden; 
                   z-index: 20;">
    <div class="container-fluid" style="width: 93%">
      <div class="d-flex flex-wrap align-items-center justify-content-start ">
          
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
        </a>

        <ul class="nav col-12 col-lg-auto me-lg-auto mlmb-2 justify-content-center mb-md-0">
          <li><a href="/mylife/main" ><div class="nav-link px-2 w-100" ><img src="../resources/img/초안2.png" alt="img" width="" height="40" style="margin-right: 30px"> </div></a></li>

        </ul>

        <form action="/mylife/search/searchResult" method="get" onsubmit="return searchCheck();" class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
          <input type="search" id="searchText" name="searchText" class="form-control" placeholder="검색어를 입력하세요"  aria-label="Search" control-id="ControlID-2" 
                 style="background: transparent;">
        </form>

          
        <!-- 로그인 안 되어있을때 -->
       	  <c:if test="${user_id == null }">
            <button id="로그인보탄" data-bs-toggle="modal" data-bs-target="#로그인모달">
                        <div id="좋아요1" >
                                로그인
                        </div>
                </button>
            </c:if>
            
            <!-- 로긘 되어있을때 -->
      <c:if test="${user_id != null }">      
        <div class="dropdown text-end">

          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="../resources/img/profile2.jpg" alt="mdo" width="32" height="32" class="rounded-circle">
          </a>
            
          <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
            <li><a class="dropdown-item" id="openModalBtn" href="/mylife/analysis/main">취향분석</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="logout?song_id=${song.song_id }&singer_id=${song.singer_id}">Sign out</a></li>
           
          </ul>
        </div>
       </c:if>
        
      </div>
    </div>
  </header>


    
<div class="전체화면 text-center overflow-hidden" style="background-color: rgba(248,248,248); height: auto;">
		
		 <div class="banner1" id="송배너">
			<div id="송배너칸">
			            <img src="${Song.album_img }" style="position:relative;"  id="송배너이미지1">
			
			            <img src="${Song.album_img }" id="송배너이미지2">
			                 
			</div>
        

   		 </div>


        <%-- <div class="banner1" id="송배너">
			<div id="송배너칸">
			    <img src="../resources/img/banner/${Song.song_banner }" style="margin: 0 auto;" height="420px;">
			</div>
    	</div> --%>
    
  <div class="곡정보 자리 w-100 border" style="height: 232px;  padding: 13px 16px 22px; background-color: white; position: relative; z-index: 10;">
<!--      background-color: rgba(199,221,253);-->
    <div class="정보 자리잡기용 m-auto" style="width:  960px">
    <img src="${Song.album_img }" width="250px" style="float: left; margin-left: -70px; margin-top: -52px; vertical-align: top; border:3px solid #eaeaea; border-radius: 2%;" >
        
     <div class="곡정보 주황" style="width: 745px; height: 197px; border-radius: 10px;  float: right; font-family: 'Noto Sans KR', sans-serif; text-align: left; margin-top: 5px;">
<!--         background-color: rgba(255,229,208);-->
         
        <div class="곡 제목 fw-bold" style="width: 520px; height: 41px; text-align: left; font-size: 33px;
            text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;">
            ${Song.song_name }
        </div>
         
        <div class="제목 바로 밑" style="color: darkgray; margin-top: 5px; height: 22px">
            <span class="연도" style="">
                ${Song.album_date } ・
            </span>
            <span>
                ${Song.genre } ・
            </span>
            <span>
                ${Song.country }
            </span>
         </div>
       <div class="예상" id="예상" >
       		★ 평균 
       		<fmt:formatNumber type="number" maxFractionDigits="1"
				value="${Song.avg }">
			</fmt:formatNumber>
            
         </div>
         <div class="row" style="width: 730px; height: 58px; margin-top: 8px; align-content: center; ">

             <div class="col-4" style="align-content: center; margin-left: ">
                 <div id="별점큰박스">
                     <span id="별점기록" >
                     	<c:choose>
                     		<c:when test="${user_id == null }">
		                        <span class="fw-bold" id="별점평균" > 0.0  </span>/  5
                     		</c:when>
                     		<c:otherwise>
		                        <span class="fw-bold" id="별점평균" > ${starPoint}  </span>/  5
                     		</c:otherwise>
                     	</c:choose>
                     </span>
     <div class="starpoint_wrap" id="별점박스">
          <div class="starpoint_box">
            <label for="starpoint_1" class="label_star" title="0.5"><span class="blind">0.5점</span></label>
            <label for="starpoint_2" class="label_star" title="1"><span class="blind">1점</span></label>
            <label for="starpoint_3" class="label_star" title="1.5"><span class="blind">1.5점</span></label>
            <label for="starpoint_4" class="label_star" title="2"><span class="blind">2점</span></label>
            <label for="starpoint_5" class="label_star" title="2.5"><span class="blind">2.5점</span></label>
            <label for="starpoint_6" class="label_star" title="3"><span class="blind">3점</span></label>
            <label for="starpoint_7" class="label_star" title="3.5"><span class="blind">3.5점</span></label>
            <label for="starpoint_8" class="label_star" title="4"><span class="blind">4점</span></label>
            <label for="starpoint_9" class="label_star" title="4.5"><span class="blind">4.5점</span></label>
            <label for="starpoint_10" class="label_star" title="5"><span class="blind">5점</span></label>
            <input type="radio" name="starpoint" id="starpoint_1" class="star_radio" value="0.5">
            <input type="radio" name="starpoint" id="starpoint_2" class="star_radio" value="1.0">
            <input type="radio" name="starpoint" id="starpoint_3" class="star_radio" value="1.5">
            <input type="radio" name="starpoint" id="starpoint_4" class="star_radio" value="2.0">
            <input type="radio" name="starpoint" id="starpoint_5" class="star_radio" value="2.5">
            <input type="radio" name="starpoint" id="starpoint_6" class="star_radio" value="3.0">
            <input type="radio" name="starpoint" id="starpoint_7" class="star_radio" value="3.5">
            <input type="radio" name="starpoint" id="starpoint_8" class="star_radio" value="4.0">
            <input type="radio" name="starpoint" id="starpoint_9" class="star_radio" value="4.5">
            <input type="radio" name="starpoint" id="starpoint_10" class="star_radio" value="5.0">
            <span class="starpoint_bg"></span>
          </div>
        </div>
    </div>        
    
   				

             </div>
	  
             
               <!-- 리스트 버튼. target에 지정한 id가 "리스트추가"인 쪽으로 이동(밑 참조) -->
             <div class="col-2" >
                 <div type="button" id="송리스트버튼" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#리스트추가"  >
             		<img src="../resources/img/plus.png" width="20px">
                 	
                 	<span> 리스트 </span>
                 </div>
             </div>
                
             
            
        
        </div>
        </div>
        
    </div>        
 </div>    

        	<input type="hidden" id="ui"value="${user_id }">
        <form action="starLog" method="post" id="starForm">
        	<input type="hidden" name="star" id="star" value="">
        	<input type="hidden" name="song_id" value="${song_id }"> 
        	<input type="hidden" name="singer_id" value="${singer_id }"> 
        	<input type="hidden" name="country" value="${Song.country }">
        	<input type="hidden" name="genre" value="${Song.genre }">
        </form>




	
	<c:if test="${user_id != null }">
			<!--    리스트 추가 모달-->
		    <div class="modal fade" id="리스트추가" tabindex="-1" aria-labelledby="exampleModalCenterTitle" style="display: none;" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content" id="리모달창">
		      <div class="modal-header" id="리모달헤더">
		        <h5 class="modal-title" id="exampleModalCenterTitle">리스트 추가</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		     
		      <div class="modal-body" id="리모달바디">
		      
		      	<c:forEach var="plist" items="${playlist }" varStatus="status">
					<div id="리스트한칸 ">
					<input type="radio" value="${plist.playlist_id }" id= "리스트체크"  name="list">
						${plist.list_name}</div>
				</c:forEach> 
		    
		        </div>
		        
		        <!-- 리스트에 곡 추가시 보내질 데이터  -->
		        <form action="addSongList" method="post" id="addSongListForm" onsubmit="return addSongtoList()" >
		        	<input type="hidden" id ="song_id" name="song_id" value="${Song.song_id}"
		        	style="margin-bottom: 15px;">
		        	<input type="hidden" id ="singer_id" name="singer_id" value="${singer_id}">
		        	<input type="hidden" id= "playlist_id" name="playlist_id" >
		        	
			      <div class="modal-footer" id="리모달푸터">
			          <button type="submit" id="곡추가" class="btn">추가</button>
			        <button type="button" id="새리스트버튼" class="btn" data-bs-toggle="modal" data-bs-target="#리스트추가2">
			            + 새 리스트</button>
			      </div>
		        </form>
				
		    </div>
		  </div>
		</div>
		    
		
		<!--    리스트 추가 모달2-->
		    <div class="modal fade" id="리스트추가2" tabindex="-1" aria-labelledby="exampleModalCenterTitle" style="display: none;" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content" id="리모달창2"
		    style="
		    width: 280px;
    		height: 270px;">
		      <div class="modal-header" id="리모달헤더">
		        <h5 class="modal-title" id="exampleModalCenterTitle">리스트 추가</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body" id="리모달바디">
		      <!-- 리스트 추가 부분 -->
		      <form action="addPlayList" method="post" id="addPlayListForm" onsubmit="return addPlayListCheck()"
		      style="margin-top: 10px;">
		        	<input type="text" placeholder="리스트 이름 입력.." name= "list_name" id="list_name"
		        	style="   
		        	margin-bottom: 15px;
				    border: 0;
				    border-bottom: 1px solid;">
		        	<input type="text" placeholder="리스트 설명 입력.." name= "list_explain" id ="list_explain"
		        	style="   
		        	margin-bottom: 15px;
				    border: 0;
				    border-bottom: 1px solid;">
		        	<input type="hidden" id ="song_id" name="song_id" value="${Song.song_id}">
		        	<input type="hidden" id ="singer_id" name="singer_id" value="${singer_id}">
		        
		        </div>
		     
		        
		    <div class="modal-footer" id="리모달푸터">
		          <button type="submit" id="곡추가2" class="btn">추가</button>
		
		    </div>
		    </form>
		  </div>
		</div>
		    </div>
		  
	
	
	</c:if>
	






  





    
    
    <div class="main1 mt-3 m-auto" style="width: 960px; height: 1000px; background-color: rgba(248,248,248); ">

        <div class="컨텐츠 핑크 border" 
        style="width: 900px; height: auto; border-radius: 10px; float: left; 
        background-color:  white; font-family: 'Noto Sans KR', sans-serif; font-size: 0px; padding-bottom: 40px;">
            
<!--            가수 -->
            <div class="가수" id="가수정보칸">
                
                <div class="가수 fw-bold"  id="송칸타이틀">
                    가수
                </div>
                <div class="row 가수 프로필 mt-2" style="height: 150px">
                    <div class="col-2 text-center">
                        <div class="프로필 카드" style="margin-right: auto; margin-left: auto; margin-top: 5px">
                        <img src="../resources/img/profile/basic_profile.jpg" width="60px" style="border-radius: 50%
                        ">
                        <div class="가수명" id="아티스트이름"
                        style="    font-size: 15px;   margin-top: 15px;">
                            ${Song.singer_name }
                        </div>
                    </div>
                    </div>
                
                </div>
            
            </div>
            
<!--           작사  -->
           <div class="작사" 
                id="가수정보칸">
                
                <div class="작사 fw-bold" id="송칸타이틀">
                    작사
                </div>
                <div class="row 작사 프로필" style="height: 150px">
                    <div class="col-2 text-center">
                        <div class="프로필 카드" style="margin-right: auto; margin-left: auto; margin-top: 5px">
                        <img src="../resources/img/profile/basic_profile.jpg" width="60px" style="border-radius: 50%">
                        <div class="작사가명" id="아티스트이름"
                        style="    font-size: 15px;   margin-top: 15px;">
                            ${Song.writer }
                        </div>
                    </div>
                    </div>
                
                </div>
            
            </div>
            
<!--           작곡 -->
            <div class="작곡" 
            id="가수정보칸" >
                
                <div class="작곡 fw-bold" id="송칸타이틀">
                    작곡
                </div>
                <div class="row 작사 프로필 mt-2" style="height: 150px">
                    <div class="col-2 text-center">
                        <div class="프로필 카드" style="margin-right: auto; margin-left: auto; margin-top: 5px">
                        <img src="../resources/img/profile/basic_profile.jpg" width="60px" style="border-radius: 50%">
                        <div class="작곡가명" id="아티스트이름"
                        style="    font-size: 15px;   margin-top: 15px;">
                            ${Song.composer }
                        </div>
                            
                    </div>
                    </div>
                    
                   
                
                </div>
            
            </div>
<!--            가사 -->
            <div class="가사 text-left" id="가수정보칸" style="height: auto; border-bottom: none;">
               
                <div class="가사 fw-bold" style="margin-top: 5px; font-size: 22px; height: 100px; ">
                    가사
                    <span >
                        <a class="더보기" data-bs-toggle="collapse" data-bs-target="#가사란" aria-expanded="false" aria-controls="collapseExample" 
                        style="background-color: white; 
                               border-color: white;
                               text-decoration:none;
                               color: dodgerblue;
                               font-size: 15px;
                               float: right;
                               margin-top: 15px;
                               cursor : pointer;">

                            더보기

                        </a>
                    </span>
                </div>
                <div class="collapse" id="가사란">
                 <div class="가사 card" style="margin-top: 5px; font-size: 18px; height: auto; white-space: pre; padding-left: 8px; background-color: rgb(245,245,245);">
${Song.lyrics }
                </div>
                </div>
            </div>
            

        
  <!--           태그 -->
            <div id="태그큰창">
                
                <div class="태 fw-bold" style="margin-left: margin-top: 5px; font-size: 22px; height: 40px; ">
                태그
                   
                </div>
                <div id="태그큰칸3">
                    <div id="태그칸">
                    	<c:forEach var="Tags" items="${Tag }"  varStatus="status">
                    		
                    		<c:choose>
                    			<c:when test="${status.count <=3 && status.count > 0}"><span id="큰태그${status.count }">${Tags.tag_name }</span></c:when>
                    			<c:when test="${status.count > 3}"><span id="작은태그${status.count - 3 }">${Tags.tag_name }</span></c:when>
                    			
                    			<c:otherwise></c:otherwise>
                    		</c:choose>
                    		
                    		
                    	</c:forEach>
                 
					                      
                       
                    </div>
                
                </div>
            
            </div>

<!--            리스트 목록 -->
         <div class="송리스트목록" id="가수정보칸" style="height: 300px; border-bottom: none;">
             <div class="태그 fw-bold" style="margin-top: 5px; font-size: 22px; height: 50px; ">
                리스트
                 
             </div>
              <div class="row" id="리스트작칸">
                  
<!--                  리스트 한칸-->
				<c:forEach var="list" items="${listId }" begin="0" end="3">
				
                <div class="col-3" >
                <a href="/mylife/list/listPage?playlist_id=${list.playlist_id}">
                    <div id="송리스트한칸" style="overflow: hidden;">
 							
                        <span>
                        <c:forEach var="bannerimg" items="${banner }" varStatus="status">
                        	<c:forEach var="img" items="${bannerimg }" begin="0" end="3" >
                        	<img src="${img.album_img }" id="곡커버${status.count }" width="86px" height="86px" style="margin: 2px; border-radius: 6px;">
                        	</c:forEach>
                        </c:forEach>
                        </span>
                    
                    </div>
                    </a>
                    <div id="송리스트타이틀">
                    <a href="/mylife/list/listPage?playlist_id=${list.playlist_id}"
                    style="text-decoration:none;
	                        color: rgb(41, 42, 50);
						    font-size: 15px;
						    font-weight: 400;
						    letter-spacing: -0.2px;
						    white-space: nowrap;">
                    	${list.list_name}
                    </a>
                    </div>
                     <div id="송리스트좋아요">
                   		${list.user_id }
                  </div>
                     
                  </div>
                 
                  </c:forEach>
              </div>
            
            
          </div>



        </div>
        
     </div>
 </div>
        
        
      
        
</body>
</html>
