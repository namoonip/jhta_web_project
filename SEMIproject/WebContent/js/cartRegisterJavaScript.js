// 배송지 선택시 배송지 정보 자동입력
document.getElementById('isCheck').addEventListener('click', function() {
	
	var checkbox = document.getElementById('isCheck');
	
	if (checkbox.checked) {
		
		var userName = document.getElementById('userName').value;
		document.getElementById('deliberyName').value = userName;
		var userAdd = document.getElementById('userAdd').value;
		document.getElementById('deliveryAdd').value = userAdd;
		
		var userPhone = document.getElementById('userPhone').value;
		document.getElementById('deliveryPhone').value = userPhone;
		
	}else{
		
		document.getElementById('deliveryAdd').value = "";
		document.getElementById('deliveryPhone').value = "";
		document.getElementById('deliberyName').value = "";
		
	}
});

// 결제버튼 클릭시 체크
function check() {
	var userName = document.getElementById('userName').value.trim();
	
	if (userName == "") {
		
		alert("이름은 필수 입력값입니다.");
		document.getElementById('userName').focus();
		return false;
		
	}
	
	var pointCheck = document.getElementById('pointCheck');
	
	if (pointCheck) {
		var usePointcheck = document.getElementById('overPoint').value.trim();
		
		if (usePointcheck == "N") {
			alert("포인트 사용범위를 초과하셨습니다.");
			document.getElementById('usePoint').focus();
			document.getElementById('usePoint').value = "";
			return false;
		}
		
		var usePointPriceCheck = document.getElementById('deletePoint').value.trim();
		if (usePointPriceCheck == "N") {
			alert("포인트가 금액을 넘었습니다.");
			document.getElementById('usePoint').focus();
			document.getElementById('usePoint').value = "";
			return false;
		}
		
	}
	
	var pattern = /^[가-힣]{2,}$/;
	if (!pattern.test(userName)) {
		
		alert("이름을 정확히 입력해주세요.");
		document.getElementById('userName').focus();
		return false;
		
	}
	var userAdd = document.getElementById('userAdd').value.trim();
	if (userAdd == "") {
		
		alert("주소는 필수 입력값입니다.");
		document.getElementById('userAdd').focus();
		return false;
		
	}
	
	var userPhone = document.getElementById('userPhone').value.trim();
	if(userPhone == ""){
		
		alert("전화번호는 필수 입력값입니다.");
		document.getElementById('userPhone').focus();
		return false;
		
	}
	
	var pattern2 = /^[0-9]{2,}$/;
	if (!pattern2.test(userPhone)) {
		
		alert("전화번호는 숫자만 입력해주세요.");
		document.getElementById('userPhone').focus();
		return false;
		
	}
	
	var deliberyName = document.getElementById('deliberyName').value.trim();
	if(deliberyName == ""){
		
		alert("받으시는분은 필수 입력값입니다.");
		document.getElementById('deliberyName').focus();
		return false;
	}
	
	var pattern3 = /^[가-힣]{2,}$/;
	if (!pattern3.test(deliberyName)) {
		
		alert("이름을 정확히 입력해주세요.");
		document.getElementById('userName').focus();
		return false;
		
	}
	
	var deliveryAdd = document.getElementById('deliveryAdd').value.trim();
	if(deliveryAdd == ""){
		
		alert("받는주소는 필수 입력값입니다.");
		document.getElementById('deliveryAdd').focus();
		return false;
		
	}
	
	var deliveryPhone = document.getElementById('deliveryPhone').value.trim();
	if(deliveryPhone == ""){
		
		alert("전화번호는 필수 입력값입니다.");
		document.getElementById('deliveryPhone').focus();
		return false;
		
	}
	var pattern4 = /^[0-9]{2,}$/;
	if (!pattern4.test(deliveryPhone)) {
		
		alert("전화번호는 숫자만 입력해주세요.");
		document.getElementById('deliveryPhone').focus();
		return false;
		
	}
	
	
	nextForm();
	
	return true;
}


function nextForm() {
	
	var form = document.getElementById('nextForm');
	var html = "";
	var trCount = document.getElementsByClassName('trCount');
	var userId = document.getElementById('userId').textContent;
	var checkBox = document.getElementById('cardCheck');
	var pointCheckBox = document.getElementById('pointCheck');
	var size = document.getElementById('size');
	var color = document.getElementById('color');
	
	for (var i=0; i<trCount.length; i++) {
		
		var itemNo = document.getElementsByClassName('itemNo');
		var count = document.getElementsByClassName('count');
		var productCount = document.getElementsByClassName('counts');
		html += '<input type="hidden" name="userId" value="'+userId+'">';
		html += '<input type="hidden" name="itemNo" value="'+itemNo[i].textContent+'">';
		html += '<input type="hidden" name="count" value="'+count[i].textContent.trim()+'">';
		html += '<input type="hidden" name="productCounts" value="'+productCount[i].textContent.trim()+'">';
		html += '<input type="hidden" name="size" value="'+size.textContent+'">';
		html += '<input type="hidden" name="color" value="'+color.textContent+'">';
		
	}
	if (checkBox.checked) {
		
		var cardRate = parseFloat(document.getElementById("item-rate").value);
		html += '<input type="hidden" name="disCount" value="'+ cardRate +'">';
		
	}else {
		
		html += '<input type="hidden" name="disCount" value="'+ 1.0 +'">';
		
	}
	if (pointCheckBox.checked) {
		
		var usePoint = parseInt(document.getElementById("usePoint").value);
		html += '<input id="use-point" type="hidden" name="usepoint" class="form-control" value="'+usePoint+'">';
		
	}else {
		
		html += '<input type="hidden" name="usepoint" class="form-control" value="'+0+'">';
	}
	
	form.innerHTML += html;
	form.submit();
}

document.getElementById('cardCheck').addEventListener('click', function() {
	
	var cardCheck = document.getElementById('cardCheck');
	var cardContent = document.getElementById('cardContent');
	var html="";
	
	if (cardCheck.checked) {
		
		html += '<select class="pull-right input-sm" id="item-rate" onchange="rateCalurate()">';
		html += '<option value="0">신용카드를 선택하세요</option>';
		html += '<option value="0.07">국민 카드</option>';
		html += '<option value="0.08">신한 카드</option>';
		html += '<option value="0.09">삼성 카드</option>';
		html += '</select>';
		cardContent.innerHTML = html;
		
	}else {
		
		var total = document.getElementById('totalPrice');
		var sale = document.getElementById('salePrice');
		var final = document.getElementById('finalPrice');
		
		var totalPrice = total.textContent;
		sale.textContent = 0;
		cardContent.innerHTML = "";
		final.textContent = totalPrice;
		
	}
});

function rateCalurate(){
	
	var total = document.getElementById('totalPrice');
	var sale = document.getElementById('salePrice');
	var final = document.getElementById('finalPrice');
	
	var totalPrice = parseInt(total.textContent);
	var salePrice = parseInt(sale.textContent);
	var finalPrice = parseInt(final.textContent);
	
	var cardRate = parseFloat(document.getElementById("item-rate").value);
	
	var rate = (totalPrice*(Math.round(cardRate*100)))/100;
	
	sale.textContent = rate;
	final.textContent = totalPrice - rate;
	
}

document.getElementById('pointCheck').addEventListener('click', function() {
	
	var check = document.getElementById('pointCheck');
	var pointForm = document.getElementById('pointForm');
	var html = "";
	
	if (check.checked) {
		
		html += '<input type="text" onkeyup="comparePoint()" id="usePoint" name="use-point" class="form-control">';
		pointForm.innerHTML = html;
		
	}else {
		
		var total = document.getElementById('totalPrice');
		var sale = document.getElementById('salePrice');
		var final = document.getElementById('finalPrice');
		
		sale.textContent = 0;
		final.textContent = total.textContent;
		
		html += '';
		pointForm.innerHTML = html;
		
	}
});

function comparePoint() {
	
	var html = "";
	var userPoint = parseInt(document.getElementById('userPoint').textContent);
	var usePoint = parseInt(document.getElementById('usePoint').value);
	var textForm = document.getElementById('alertText');
	
	var pricePointCheck = document.getElementById('pricePointCheck');
	var priceCheck = parseInt(pricePointCheck.textContent);
	if (usePoint > priceCheck) {
		document.getElementById('deletePoint').value = 'N';
	}else {
		document.getElementById('deletePoint').value = 'Y';
	}
	
	if (userPoint < usePoint) {
		
		html += '<p>사용할 수 있는 포인트를 초과하였습니다.</p>';
		textForm.innerHTML = html;
		document.getElementById('overPoint').value = 'N';
		
	}else {
		document.getElementById('overPoint').value = 'Y';
		var total = document.getElementById('totalPrice');
		var sale = document.getElementById('salePrice');
		var final = document.getElementById('finalPrice');
		var totalPrice = parseInt(total.textContent);
		var salePrice = parseInt(sale.textContent);
		var finalPrice = parseInt(final.textContent);
		
		var checkCard = document.getElementById('cardCheck');
		
		if (checkCard.checked) {
			
			var cardRate = parseFloat(document.getElementById("item-rate").value);
			var rate = (totalPrice*(Math.round(cardRate*100)))/100;
			
			if (usePoint) {
				
				sale.textContent = rate + usePoint;
				var priceSale = rate + usePoint;
				final.textContent = totalPrice - priceSale;
				
			}else {
				
				sale.textContent = rate;
				final.textContent = totalPrice - rate;
				
			}
			
		}else {
			
			if (usePoint) {
				
				sale.textContent = usePoint;
				final.textContent = totalPrice - usePoint;
				
			}else {
				
				sale.textContent = 0;
				final.textContent = totalPrice;
			}
		}
		
		html += "";
		textForm.innerHTML = html;
	}
}

