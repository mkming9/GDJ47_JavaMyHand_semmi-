<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f2186691f6e3eb864c7d611c96937b93&libraries=services"></script>
  <link href="<%=request.getContextPath() %>/css/location.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<form action="<%=request.getContextPath()%>/groups/groupsCreateEnd.do" method="post">
		<table id="groupsFrm">
			<table class="tg">		
				<thead>
				  <tr>
				    <th class="tg-0lax" colspan="9" ><input type="text" name="groupTitle"  size="40" placeholder="그 룹 명"></th>
				  </tr>
				</thead>
				<tbody>
				  <tr>
				    <td class="tg-0lax" colspan="5" rowspan="9">
				    
				    <img src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927">
				  <!--  <input type="file" name="file"> -->
				    </td>
				    <td class="tg-0lax" colspan="4" rowspan="2">소모임테마 
					<select name="gCode">
						<option value="G1">환경</option>
						<option value="G2">지역사회</option>
						<option value="G3">금,물품</option>
						<option value="G4">헌혈</option>
						<option value="G5">기타</option>
					</select></td>
				  </tr>
				  <tr>
				  </tr>
				  <tr>
				    <!-- <td class="tg-0lax" colspan="4" rowspan="3"><input type="text" name="groupLocation" size="40" placeholder="위치정보"></td> -->
				    <td>
				    	<input type="button" name="groupLocation" class="location" id="locationMap" value="위치등록하기">
				
				    	<div id="modal">
				    		<div id="content">
				    			<div class="map_wrap" style="width:410px;height:438px;">
				    				<div id="map" style="width:700px;height:570px;position:relative;overflow:hidden;"></div>
				    				
				    				<div id="menu_wrap" class="bg_white">
				    					<div class="option">
				    						<div>
				    							<!-- <form onsubmit="searchPlaces(); return false;"> -->
								                    키워드 : <input type="text" value="구디아카데미" id="keyword" size="15"> 
								                    <button type="button" onclick="searchPlaces();">검색하기</button> 
								                    <input type="button" id="registration" value="등록">
								                    <input type="button" id="cancel" value="취소">
								                <!-- </form> -->
				    						</div>
				    					</div>
				    					<hr>
								        <ul id="placesList"></ul>
								        <div id="pagination"></div>
				    				</div>
				    			</div>
				    		</div>
				    	</div>
				    </td>
				  </tr>
				  <tr>
				  </tr>
				  <tr>
				  </tr>
				  <tr>
				    <td class="tg-0lax" colspan="4" rowspan="2">제한인원수 
					<select name="groupLimit">
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="30">30</option>
					</select></td>
				  </tr>
				  <tr>
				  </tr>
				  <tr>
				    <td class="tg-0lax" colspan="4" rowspan="2">성별제한
					<select name="groupGender">
						<option value="남자만">남자만</option>
						<option value="여자만">여자만</option>
						<option value="성별무관">성별무관</option>
					</select></td>
				  </tr>
				  <tr>
				  </tr>
				</tbody>
				<tr>
				<th colspan="9">
				<textarea style="resize:none;" name="groupContent" cols="50" rows="5" placeholder="내용입력"></textarea>
				</th>
				</tr>
				<tr>
					<th id="tg-0lax" colspan="9">
					<input type="submit" value="등록">
					<input type="reset" value="취소"></th>
				</tr>
		</table>		
	</form>
</body>
</html>
<script>
	var locationMap = document.getElementById("locationMap"); 
	
	// modal 창을 감춤
	var closeRtn = function(){
	  var modal = document.getElementById('modal');
	  modal.style.display = 'none';
	}
	// 마커를 담을 배열입니다
	var markers = [];
	var curlat, curlong;
	// modal 창을 보여줌
	locationMap.onclick = function(){
	  var modal = document.getElementById('modal');
	  modal.style.display = 'block';
	
		
		navigator.geolocation.getCurrentPosition(po=>{
				curlat=po.coords.latitude;
				curlong=po.coords.longitude;
				createMap();
			});
	}
	var ps,map,inforwindow;
	function createMap(){
		console.log(curlat,curlong);
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(curlat, curlong), // 지도의 중심좌표
	        level: 3// 지도의 확대 레벨
	    };  
	
		// 지도를 생성합니다    
		map = new kakao.maps.Map(mapContainer, mapOption); 
	
		// 장소 검색 객체를 생성합니다
		ps = new kakao.maps.services.Places();  
	
		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
		// 키워드로 장소를 검색합니다
		searchPlaces();

	}
	/* // 마커를 담을 배열입니다
	var markers = [];

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();  

	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});

	// 키워드로 장소를 검색합니다
	searchPlaces(); */

	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {

	    var keyword = document.getElementById('keyword').value;

	    if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        alert('키워드를 입력해주세요!');
	        return false;
	    }

	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	    ps.keywordSearch( keyword, placesSearchCB); 
	}

	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {

	        // 정상적으로 검색이 완료됐으면
	        // 검색 목록과 마커를 표출합니다
	        displayPlaces(data);

	        // 페이지 번호를 표출합니다
	        displayPagination(pagination);

	    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

	        alert('검색 결과가 존재하지 않습니다.');
	        return;

	    } else if (status === kakao.maps.services.Status.ERROR) {
	        alert('검색 결과 중 오류가 발생했습니다.');
	        return;

	    }
	}

	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {

	    var listEl = document.getElementById('placesList'), 
	    menuEl = document.getElementById('menu_wrap'),
	    fragment = document.createDocumentFragment(), 
	    bounds = new kakao.maps.LatLngBounds(), 
	    listStr = '';
	    
	    // 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNods(listEl);

	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    for ( var i=0; i<places.length; i++ ) {

	        // 마커를 생성하고 지도에 표시합니다
	        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
	            marker = addMarker(placePosition, i), 
	            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        bounds.extend(placePosition);

	        // 마커와 검색결과 항목에 mouseover 했을때
	        // 해당 장소에 인포윈도우에 장소명을 표시합니다
	        // mouseout 했을 때는 인포윈도우를 닫습니다
	        (function(marker, title) {
	            kakao.maps.event.addListener(marker, 'mouseover', function() {
	                displayInfowindow(marker, title);
	            });

	            kakao.maps.event.addListener(marker, 'mouseout', function() {
	                infowindow.close();
	            });

	            itemEl.onmouseover =  function () {
	                displayInfowindow(marker, title);
	            };

	            itemEl.onmouseout =  function () {
	                infowindow.close();
	            };
	        })(marker, places[i].place_name);

	        fragment.appendChild(itemEl);
	    }

	    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
	    listEl.appendChild(fragment);
	    menuEl.scrollTop = 0;

	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	    map.setBounds(bounds);
	}

	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {

	    var el = document.createElement('li'),
	    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                '<div class="info">' +
	                '   <h5>' + places.place_name + '</h5>';

	    if (places.road_address_name) {
	        itemStr += '    <span>' + places.road_address_name + '</span>' +
	                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
	    } else {
	        itemStr += '    <span>' +  places.address_name  + '</span>'; 
	    }
	                 
	      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
	                '</div>';           

	    el.innerHTML = itemStr;
	    el.className = 'item';

	    return el;
	}

	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
	    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
	            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new kakao.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });

	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

	    return marker;
	}

	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}

	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination) {
	    var paginationEl = document.getElementById('pagination'),
	        fragment = document.createDocumentFragment(),
	        i; 

	    // 기존에 추가된 페이지번호를 삭제합니다
	    while (paginationEl.hasChildNodes()) {
	        paginationEl.removeChild (paginationEl.lastChild);
	    }

	    for (i=1; i<=pagination.last; i++) {
	        var el = document.createElement('a');
	        el.href = "#";
	        el.innerHTML = i;

	        if (i===pagination.current) {
	            el.className = 'on';
	        } else {
	            el.onclick = (function(i) {
	                return function() {
	                    pagination.gotoPage(i);
	                }
	            })(i);
	        }

	        fragment.appendChild(el);
	    }
	    paginationEl.appendChild(fragment);
	}

	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
	    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}

	 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}
</script>