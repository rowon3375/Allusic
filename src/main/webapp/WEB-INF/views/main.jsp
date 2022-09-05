<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
      
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>  
    
    <link href="./resources/css/Allusic.css" rel="stylesheet"/>  
      
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>  
      


      
    <title>홈 화면</title>
	<c:import url="./menu/menu.jsp"></c:import>
	
	<main style="margin-top: 130px">
	 
	 <header class="p-2 mb-3 fixed-top align-items-center border-bottom border-info" id="AllusicH" style="font-family: 'Noto Sans KR', sans-serif; background-color: white;">
    <div class="container-fluid" style="width: 93%">
      <div class="d-flex flex-wrap align-items-center justify-content-start " >
<!--          justify-content-lg-start-->
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
        </a>

        <ul class="nav col-12 col-lg-auto me-lg-auto mlmb-2 justify-content-center mb-md-0">
          <li><div  class="nav-link px-2 w-100" >
          
          <a href="/mylife">
          <img src="./resources/img/mainLogo.png" alt="img" width="" height="40" style="margin-right: 30px">
          </a>
          </div></li>
          

        </ul>

        <form action="/mylife/search/searchResult" method="get" onsubmit="return searchCheck();" 
        			class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
          <input type="search" id="searchText" name="searchText" class="form-control" placeholder="검색어를 입력하세요"  aria-label="Search" control-id="ControlID-2" style="background: #F2F2F2">
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
            <img src="./resources/img/profile2.jpg" alt="mdo" width="32" height="32" class="rounded-circle">
          </a>
            
          <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
            <li><a class="dropdown-item" id="openModalBtn" href="/mylife/analysis/main">취향분석</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="logout">Sign out</a></li>
           
          </ul>
        </div>
         </c:if>
         
         
         
      </div>
    </div>
        
 
        
  </header>
	
	<!-- 메인 페이지 -->
	    
	<!--  <div class="album py-5 bg-white" style="font-family: 'Noto Sans KR', sans-serif; margin-top: 80px"></div>-->
	      
	<!-- 위쪽 슬라이드(1번째 슬라이드) 영역
		*** 좌버튼 target, 우버튼 target, 카로셀 id 가 같아야됨. 밑 참조 ex)아무거나1
	 -->
	    <div class="container" id="메인컨테이너">
	        
	        <!-- 좌버튼 -->
	         <button class="carousel-control-prev" type="button" data-bs-target="#아무거나1" data-bs-slide="prev"  id="좌버튼메인">

	        <img src="./resources/img/left.png" width="30px">

	    <span class="visually-hidden">Previous</span>
	  </button>
	  
	        
	        
	    <div class="titles fw-bold mb-4" style="font-size: 25px;">
	        TOP 10 SONG
	        </div>
	        
	  
	        
	<!-- 곡 화면. **** 이쪽 데이터만 손대면 되긴 함--> 
	<div id="아무거나1" class="carousel slide" data-bs-ride="carousel" data-bs-interval="false">
		
		<!-- 간단 요약 : active 슬라이드는 한개만 만들고 나머지는 carousel-item으로 슬라이드 만듬  -->
		<c:forEach var="nomean" items="${songList }" step="5"  varStatus="status">
						<c:choose>
							<c:when test="${status.index == 0 }">
								<div class="carousel-item active">
								<div class="row row-cols-sm-3 row-cols-lg-5">
							</c:when>
							
							<c:when test="${status.index != 0 }">
								<div class="carousel-item">
								<div class="row row-cols-sm-3 row-cols-lg-5">
										<!--          row-cols-1  row-cols-sm-2 row-cols-md-3 g-3 -->
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
						
						<!-- 곡 프로필  begin : 현재 인덱스 위치(각 슬라이드의 첫번째 곡의 인덱스), end : 각 슬라이드의 마지막 곡의 인덱스
							각 슬라이드의 1,2,3,4,5번째 곡이 들어감
						 -->
								<c:forEach var="song" items="${songList }" begin="${status.index }" end="${status.index + 4 }">
									<div class="col">
										<div class="card border border-white">
										<a href="/mylife/song/songPage?song_id=${song.song_id }&singer_id=${song.singer_id}">
											<img src="${song.album_img} " alt="img" width="100%"
												height="225"></a>
	
											<div class="card1 " style="text-overflow: ellipsis;
												    overflow: hidden;
												    white-space: nowrap;
												    margin-top: 12px;">
												<a href="/mylife/song/songPage?song_id=${song.song_id }&singer_id=${song.singer_id}" 
												class="card-text mb-1 fw-bold" id="메인곡명">${song.song_name}</a>
												<p class="card-text mb-0" style="font-size: 15px;" id="메인가수명">${song.singer_name }</p>
												<span class="card-text mb-0"
													style="font-size: 13px; margin-left: 1px; color: #74747b;">
													${song.album_date } </span> <span class="card-text mb-0 fw-bold"
													style="font-size: 13px; margin-left: 2px; color: #74747b;"> • </span> <span
													class="card-text mb-0"
													style="font-size: 13px; margin-left: 2px;
													text-overflow: ellipsis;
												    overflow: hidden;
												    white-space: nowrap;
												    color: #74747b;">
													${song.album_name } </span>
												<div
													class="d-flex justify-content-between align-items-center">
	
													<small class="text-muted"></small>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
								
								<!-- <div class="row row-cols-sm-3 row-cols-lg-5"> 닫는 태그 -->
							</div>
							<!-- <div class="carousel-item active / item 닫는 태그"> -->
						</div>
		<!-- 큰 forEach문 닫는 태그 -->
		</c:forEach>	
		<!-- carousel slide닫는 태그. 이 다음 우버튼 -->
		</div>
	        
	        <button class="carousel-control-next" type="button" data-bs-target="#아무거나1" data-bs-slide="next"  
	        id="우버튼메인">
	<!--    <span class="오른쪽" aria-hidden="true" style="position: absolute; left: 200px; top: 130px">-->
	        <img src="./resources/img/right.png" width="30px">
	<!--    
	style="position: absolute; left: 100px; top: 130px"-->
	<!--      </span>-->
	    <span class="visually-hidden">Next</span>
	  </button>
	       
	       <!-- 메인페이지  닫는 태그 --> 
	</div>
	
	
	<!-- 두번째 슬라이드 영역(밑에 슬라이드) -->
	    <div class="container" id="메인컨테이너">
	        
	        <!-- 좌버튼 -->
	         <button class="carousel-control-prev" type="button" data-bs-target="#아무거나2" data-bs-slide="prev"  id="좌버튼메인">
	<!--    <span class="왼쪽" aria-hidden="true" style="position: absolute; top: 130px" >-->
	        <img src="./resources/img/left.png" width="30px">
	<!--        </span>-->
	    <span class="visually-hidden">Previous</span>
	  </button>
	        
	        
	    <div class="titles fw-bold mb-4" style="font-size: 25px;">
	        발라드 인기곡
	    </div>
	        
	  
	        
	<!-- 곡 화면--> 
	<div id="아무거나2" class="carousel slide" data-bs-ride="carousel" data-bs-interval="false">
		
		<!-- searchResult 첫번째 창 곡 리스트 -->
		<c:forEach var="nomean" items="${songList2 }" step="5"  varStatus="status">
						<c:choose>
							<c:when test="${status.index == 0 }">
								<div class="carousel-item active">
								<div class="row row-cols-sm-3 row-cols-lg-5">
							</c:when>
							
							<c:when test="${status.index != 0 }">
								<div class="carousel-item">
								<div class="row row-cols-sm-3 row-cols-lg-5">
										<!--          row-cols-1  row-cols-sm-2 row-cols-md-3 g-3 -->
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
						
						<!-- 곡 프로필  begin : 현재 인덱스 위치(각 슬라이드의 첫번째 곡의 인덱스), end : 각 슬라이드의 마지막 곡의 인덱스 -->
								<c:forEach var="song" items="${songList2 }" begin="${status.index }" end="${status.index + 4 }">
									<div class="col">
										<div class="card border border-white">
											<a href="/mylife/song/songPage?song_id=${song.song_id }&singer_id=${song.singer_id}">
												<img src="${song.album_img} " alt="img" width="100%"
													height="225"></a>
		
												<div class="card1 " style="text-overflow: ellipsis;
													    overflow: hidden;
													    white-space: nowrap;
													    margin-top: 12px;">
													<a href="/mylife/song/songPage?song_id=${song.song_id }&singer_id=${song.singer_id}" 
													class="card-text mb-1 fw-bold" id="메인곡명">${song.song_name}</a>
													<p class="card-text mb-0" style="font-size: 15px;">${song.singer_name }</p>
													<span class="card-text mb-0"
														style="font-size: 13px; margin-left: 1px; color: #74747b;">
														${song.album_date } </span> <span class="card-text mb-0 fw-bold"
														style="font-size: 13px; margin-left: 2px; color: #74747b;"> • </span> <span
														class="card-text mb-0"
														style="font-size: 13px; margin-left: 2px;
														text-overflow: ellipsis;
													    overflow: hidden;
													    white-space: nowrap;
													    color: #74747b;">
														${song.album_name } </span>
													<div
														class="d-flex justify-content-between align-items-center">
		
														<small class="text-muted"></small>
													</div>
												</div>
											</div>
										<%-- <div class="card border border-white">
											<img src="./resources/img/album/${song.album_img} " alt="img" width="100%"
												height="225">
	
											<div class="card1 mt-3 " style="
													text-overflow: ellipsis;
												    overflow: hidden;
												    white-space: nowrap;">
												<a href="/mylife/song/songPage?song_id=${song.song_id }&singer_id=${song.singer_id}" class="card-text mb-1 fw-bold" style="font-size: 23px;">${song.song_name}</a>
												<p class="card-text mb-0" style="font-size: 15px;">${song.singer_name }</p>
												
												
												<span class="card-text mb-0"
													style="font-size: 13px; margin-left: 1px">
													${song.album_date } </span> <span class="card-text mb-0 fw-bold"
													style="font-size: 13px; margin-left: 2px"> • </span> 
													<span
													class="card-text mb-0"
													style="font-size: 13px; 
													margin-left: 2px;
													text-overflow: ellipsis;
												    overflow: hidden;
												    white-space: nowrap; 
													">
													${song.album_name } </span>

												<div
													class="d-flex justify-content-between align-items-center">
	
													<small class="text-muted"></small>
												</div>
											</div>
										</div> --%>
									</div>
								</c:forEach>
								
								<!-- <div class="row row-cols-sm-3 row-cols-lg-5"> 닫는 태그 -->
							</div>
							<!-- <div class="carousel-item active / item 닫는 태그"> -->
						</div>
		<!-- 큰 forEach문 닫는 태그 -->
		</c:forEach>	
		<!-- carousel slide닫는 태그. 이 다음 우버튼 -->
		</div>
	        
	        <button class="carousel-control-next" type="button" data-bs-target="#아무거나2" data-bs-slide="next"  
	        id="우버튼메인">
	<!--    <span class="오른쪽" aria-hidden="true" style="position: absolute; left: 200px; top: 130px">-->
	        <img src="./resources/img/right.png" width="30px">
	<!--    
	style="position: absolute; left: 100px; top: 130px"-->
	<!--      </span>-->
	    <span class="visually-hidden">Next</span>
	  </button>
	       
	       <!-- 두번째 슬라이드 영역 닫는 태그 --> 
	</div>
	
	
	</main>

  </body>
</html>