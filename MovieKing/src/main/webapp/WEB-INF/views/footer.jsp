

<section id="contact" style="background-color: #5858FA;">
	<div class="container">
		<div class="row">
			<div class="col-md-6">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes
</div>
			<div class="col-md-6 col-md-offset-6">
				<div id="map" style="width:600px;height:600px;"></div>
			</div>

		</div>
	</div>

</section>

<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3563eb87889701f4bab3b419b70c1471"></script>
<script>
var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
mapOption = { 
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };


var map = new daum.maps.Map(container, mapOption); //지도 생성 및 객체 리턴

//마커가 표시될 위치입니다 
var markerPosition  = new daum.maps.LatLng(33.450701, 126.570667); 

// 마커를 생성합니다
var marker = new daum.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);
	
</script>

</body>
</html>