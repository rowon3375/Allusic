<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="ko">
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<link href="../resources/css/Allusic.css" rel="stylesheet" />

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>




<title>홈 화면</title>

</head>
<body style="background-color: #f8f8f8;">



	<!--      메인 -->
	<main class="배경" id="리스트배경">

		<div class="container" id="konomibanner">
			<!-- <div id="프로필베너"> -->
			<div >
				<a href="/mylife">
	                <img src="../resources/img/곡용.png" id="코노미로고" >
				</a>
            </div>
        <div id="코노미배너프로필">
        	<span id="코노미프로필">
					<img src="../resources/img/profile/basic_profile.jpg" width="37px;" style="border-radius: 50%; margin-right: 10px;">
					
					<span id="코노미닉">${user_id }</span>
				
			</span>
		</div>
		</div>
			<!--          
margin-top: 100px;
    width: 638px;
    height: 244.75px;
        background-color: white;
    border: 1px solid;
    border-color: lightgray;
    border-radius: 6px;
    padding: 0px;
    overflow: hidden;
-->
<!-- 		</div> -->
		<div class="container" id="평가박스">
			<div id="평가">
				<div id="평가수" style="margin-top: 10px;">
					<div class="fw-bold" id="평가수텍" >평가수</div>

				</div>

				<!--                평가 칸-->
				<div class="row" id="평가수내용">
					<div class="col-3" id="평가한칸">
								<div class="fw-bold" id="평가숫자">${userGradeList.allStarCount }</div>
						<div id="평가내용">총 별점 수</div>

					</div>
					<div class="col-3" id="평가한칸">
						<div class="fw-bold" id="평가숫자">
							<fmt:formatNumber type="number" maxFractionDigits="0"
								value="${userGradeList.listLikeNum}">
							</fmt:formatNumber>
						</div>
						<div id="평가내용">리스트 좋아요 수</div>

					</div>
					<div class="col-3" id="평가한칸">
						<div class="fw-bold" id="평가숫자">
							<fmt:formatNumber type="number" maxFractionDigits="0"
								value="${userGradeList.listCommentNum}">
							</fmt:formatNumber>
						</div>
						<div id="평가내용">리스트 댓글 수</div>

					</div>
					<div class="col-3" id="평가한칸">
						<div class="fw-bold" id="평가숫자">
							<fmt:formatNumber type="number" maxFractionDigits="0"
								value="${userGradeList.listCount}">
							</fmt:formatNumber>
						</div>
						<div id="평가내용">리스트 수</div>
					</div>
				</div>
				<div id="분포큰칸">

					</div>
					<div id="분포작은칸">

						<div id="분포내용란" style="margin: 0 atuo;">
							<div id="분포내용">
								<div id="평가숫자">
									<fmt:formatNumber type="number" maxFractionDigits="1"
										value="${userGradeList.allStarSum}">
									</fmt:formatNumber>
								</div>
								<div id="평가내용">별점 평균</div>
							</div>
							<div id="분포내용">
								<div id="평가숫자">
											<fmt:formatNumber type="number" maxFractionDigits="0"
												value="${userGradeList.allsongCount}">
											</fmt:formatNumber>
								</div>
								<div id="평가내용">곡 평가 개수</div>
							</div>
							<div id="분포내용">
								<div id="평가숫자">${userGradeList.topStar}</div>
								<div id="평가내용">많이 준 별점</div>
							</div>
						</div>
					</div>

				</div>


			</div>

		</div>


		<div class="container" id="분석큰칸">
			<div id="태그큰칸">
				<div id="평가수">
					<div class="fw-bold" id="평가수텍">선호태그</div>
				</div>
				<div id="태그큰칸2">
					<div id="태그칸">
						<c:forEach var="tagName" items="${tagNameList }"
							varStatus="status">
							<c:choose>
								<c:when test="${status.count <= 3}">
									<span id="큰태그${status.count}">${tagName}</span>
								</c:when>
								<c:when test="${status.count > 3}">
									<span id="작은태그${status.count-3 }">${tagName}
										</span>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>

						</c:forEach>
					</div>

				</div>


				<!--
                <div id="겨울" class="carousel slide" data-bs-ride="carousel" data-bs-interval="false">
    <div class="carousel-item active" >
-->
				<!-- 좌, 우 슬라이드 감쌈 -->
				<div id="가수큰칸">

					<button class="carousel-control-prev" style="" type="button"
						data-bs-target="#선호가수캐러셀" data-bs-slide="prev" id="좌버튼취향">
						<img src="../resources/img/왼2.png" width="15px"> <span
							class="visually-hidden">Previous</span>
					</button>
					<div id="평가수">
						<div class="fw-bold" id="평가수텍">선호가수</div>
					</div>





					<div id="가수큰칸2">

						<div id="선호가수캐러셀" class="carousel slide" data-bs-ride="carousel"
							data-bs-interval="false">
							<c:forEach var="nomean" items="${singerList }" step="3"
								varStatus="status">

								<c:choose>
									<c:when test="${status.index == 0 }">
										<div class="carousel-item active">
									</c:when>

									<c:when test="${status.index != 0 }">
										<div class="carousel-item">
											<!--          row-cols-1  row-cols-sm-2 row-cols-md-3 g-3 -->
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>

								<div id="캐러셀한칸">
									<c:forEach var="singer" items="${singerList }"
										begin="${status.index }" end="${status.index + 2 }">
										<div id="가수한칸">

											<span id="가수프로필칸"> 
												<img src="../resources/img/profile/basic_profile.jpg" id="선호가수프로필" width="80px" style="border-radius: 50%">
											</span>

											<div id="가수정보란">
												<div id="선호가수명">
													${singer.singer_name } 
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
						</div>
						</c:forEach>
						<!-- slide 닫는 태그 -->
					</div>
					<button class="carousel-control-next" type="button"
						data-bs-target="#선호가수캐러셀" data-bs-slide="next" id="우버튼취향">
						<img src="../resources/img/오2.png" width="15px"> <span
							class="visually-hidden">Next</span>
					</button>
				</div>
			</div>


			<div id="국가큰칸">
				<div id="평가수">
					<div class="fw-bold" id="평가수텍">선호국가</div>
				</div>
				<div id="국가큰칸2">
					<div id="국가칸">
						<div id="국가탑">
							<c:forEach var="countryLog" items="${countryLogList}" begin="0"
								end="2">
								<div id="국가탑1">
									<div id="국가탑나라">${countryLog.country }</div>
									
									<div id="국가탑정보">
										<fmt:formatNumber type="number" maxFractionDigits="2"
											value="${countryLog.star_avg }">
										</fmt:formatNumber>
										점•
										${countryLog.grade_count }곡
									</div>
								</div>

							</c:forEach>

						</div>
						<ul id="국가밑큰">
							<c:forEach var="countryLog" items="${countryLogList}" begin="3"
								end="5">
								<li id="국가밑작">${countryLog.country }<span id="국밑내용">
										${countryLog.all_star }점 • ${countryLog.grade_count }곡 </span>
								</li>

							</c:forEach>

						</ul>


					</div>


				</div>

			</div>


			<div id="장르큰칸">
				<div id="평가수">
					<div class="fw-bold" id="평가수텍">선호장르</div>
				</div>
				<div id="장르큰칸2">
					<!--  
							<div id="장르코멘트">발라드충이군요</div>
						
						-->
					<div id="장르칸">
						<div id="국가탑">
							<c:forEach var="genreLog" items="${genreLogList}" begin="0"
								end="2">
								<div id="국가탑1">
									<div id="국가탑나라">${genreLog.genre }</div>
									<div id="국가탑정보">
										<fmt:formatNumber type="number" maxFractionDigits="2"
											value="${genreLog.star_avg }">
										</fmt:formatNumber>
										점•
										${genreLog.grade_count}곡</div>
								</div>
							</c:forEach>

						</div>
						<ul id="국가밑큰">
							<c:forEach var="genreLog" items="${genreLogList}" begin="3"
								end="5">
								<li id="국가밑작">${genreLog.genre }
									<span id="국밑내용">
										<fmt:formatNumber type="number" maxFractionDigits="2"
											value="${genreLog.star_avg }">
										</fmt:formatNumber>
										점 • 
										${genreLog.grade_count}곡 </span>
								</li>
							</c:forEach>
						</ul>


					</div>


				</div>

			</div>
		</div>
		</div>

	</main>
</body>
</html>
