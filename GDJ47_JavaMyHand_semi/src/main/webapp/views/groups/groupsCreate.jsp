<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bf6a19ff42424627bc81b1b27852d206&libraries=services"></script>
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
				    	<input type="text" id="sample5_address" placeholder="주소">
						<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
						<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
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
var mapContainer = document.getElementById('map'), // 지도를 표시할 div
mapOption = {
    center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
    level: 5 // 지도의 확대 레벨
};

//지도를 미리 생성
var map = new daum.maps.Map(mapContainer, mapOption);
//주소-좌표 변환 객체를 생성
var geocoder = new daum.maps.services.Geocoder();
//마커를 미리 생성
var marker = new daum.maps.Marker({
position: new daum.maps.LatLng(37.537187, 127.005476),
map: map
});


function sample5_execDaumPostcode() {
new daum.Postcode({
    oncomplete: function(data) {
        var addr = data.address; // 최종 주소 변수

        // 주소 정보를 해당 필드에 넣는다.
        document.getElementById("sample5_address").value = addr;
        // 주소로 상세 정보를 검색
        geocoder.addressSearch(data.address, function(results, status) {
            // 정상적으로 검색이 완료됐으면
            if (status === daum.maps.services.Status.OK) {

                var result = results[0]; //첫번째 결과의 값을 활용

                // 해당 주소에 대한 좌표를 받아서
                var coords = new daum.maps.LatLng(result.y, result.x);
                // 지도를 보여준다.
                mapContainer.style.display = "block";
                map.relayout();
                // 지도 중심을 변경한다.
                map.setCenter(coords);
                // 마커를 결과값으로 받은 위치로 옮긴다.
                marker.setPosition(coords)
            }
        });
    }
}).open();
}
</script>