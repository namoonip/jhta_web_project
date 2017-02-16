	
	function generateForm() {
		
		var form = document.getElementById("my-form");
		
		var html = "";
		var checkbox = document.getElementsByName('isCheck');
		var deliveryPrice = document.getElementById('delivery').textContent;
		
		var unChecked=0;
		for (var i=0; i<checkbox.length; i++) {
			if(!checkbox[i].checked){
				unChecked ++;
			}
		}
		if (unChecked == checkbox.length){
			alert('상품을 한가지 이상 고르셔야 됩니다.');
			return false;
		}
		
		for (var i=0; i<checkbox.length; i++) {
			
			if (checkbox[i].checked) {
				
				var counts = document.getElementsByClassName('counts');
				var itemCounts = document.getElementsByClassName('itemCount');
				var itemNames = document.getElementsByClassName('itemName');
				
				var itemName = itemNames[i].textContent.trim();
				var qty = counts[i].textContent.trim();
				var itemCount = itemCounts[i].textContent.trim();
				html += '<input type="hidden" name="no" value="'+checkbox[i].value+'">';
				html += '<input type="hidden" name="qty" value="'+qty+'">';
				html += '<input type="hidden" name="deliveryPrice" value="'+deliveryPrice+'">';
				
				if (qty > itemCount) {
					alert('주문 하신 '+itemName+'의 수량이 부족합니다.\n제품의 현재 수량은 '+itemCount+'개 입니다.');
					return false;
				}
				
			}
			
		}
		
		form.innerHTML += html;
		form.submit();
		
	}
	
	// 바디태그 초기화
	var bodyLoad = document.getElementsByTagName('body');
	for (var a=0; a<bodyLoad.length; a++) {
		
	
		var allPrice = document.getElementsByClassName('price');

		var allProductPrice = 0;
		var counts = document.getElementsByClassName('counts');
		for (var a=0; a<allPrice.length; a++) {

			allProductPrice += parseInt(allPrice[a].textContent)* parseInt(counts[a].textContent.trim());
			document.getElementById('productPrice').textContent = allProductPrice;
			
			if (allProductPrice < 50000) {

				document.getElementById('delivery').textContent = '2500';
				bookPrice = allProductPrice + parseInt(document.getElementById('delivery').textContent);
				document.getElementById('totalPrice').innerHTML = bookPrice;
				
			}else {

				document.getElementById('delivery').textContent = '0';
				bookPrice = allProductPrice + parseInt(document.getElementById('delivery').textContent);
				document.getElementById('totalPrice').textContent = bookPrice;
				
			}
		}
	}
	
	//제일 상단 체크박스 클릭 이벤트 (가격 초기화)
	document.getElementById("checkbox").addEventListener('click', 
		function() {
			var inputs = document.getElementsByTagName("input");
			
			var productPrice = 0;
			
			var price = document.getElementsByClassName('price');
			var counts = document.getElementsByClassName('counts');
			var test = 0;
			for (var a=0; a<checkbox.length; a++) {
					ProductPrice = price[a].textContent;
					test = ProductPrice;
					productPrice += parseInt(test)* parseInt(counts[a].textContent.trim());
			}
			
			for(var i=1; i<inputs.length; i++){

				var input = inputs[i];
				var checked = input.getAttribute('checked');
				
				// 만약에 부른 속성이 true면
				if (checked) {
					input.removeAttribute('checked');
					input.checked = false;
					
					document.getElementById('delivery').textContent = '2500';
					document.getElementById('productPrice').innerHTML = '0';
					document.getElementById('totalPrice').innerHTML = '0';
					
					// 만약 부른속성이 true이 아니라 false면
				}else {
					input.setAttribute('checked', 'checked');
					input.checked = true;
					
					
					document.getElementById('productPrice').innerHTML = productPrice;
					document.getElementById('totalPrice').innerHTML = productPrice;
					
					// productPrice가 50000원보다 미만이면 실행됨
					if (productPrice < 50000) {
						
						var deliveryPrice = document.getElementById('delivery').textContent = '2500';
						document.getElementById('totalPrice').innerHTML = productPrice + parseInt(deliveryPrice);
						
						// productPrice가 50000원보다 초과하면 실행된다.
					}else {
						
						document.getElementById('delivery').textContent = '0';
						
					}
				}
			}
	});
	
	// 체크박스 클릭이벤트
	var checkbox = document.getElementsByName('isCheck');
	
	
	for (var a=0; a<checkbox.length; a++) {
		
		checkbox[a].addEventListener('click', function() {
			
			// 클릭 이벤트 함수 시작시 사용변수값 초기화
			var totalPrice = 0;
			var test = 0;
			var productPrice = 0;
			var bookPrice = 0;
			var price = document.getElementsByClassName('price');
			var counts = document.getElementsByClassName('counts');
			for (var b=0; b<checkbox.length; b++) {
				if (checkbox[b].checked) {
					
					ProductPrice = price[b].textContent;
					test = ProductPrice;
					productPrice += parseInt(test) * parseInt(counts[b].textContent.trim());
					
					
				}
			}
			
			if (productPrice < 50000) {
				
				document.getElementById('productPrice').innerHTML = productPrice;
				document.getElementById('delivery').textContent = '2500';
				bookPrice = productPrice + parseInt(document.getElementById('delivery').textContent);
				document.getElementById('totalPrice').innerHTML = bookPrice;
				
			}else {
				
				document.getElementById('productPrice').innerHTML = productPrice;
				document.getElementById('delivery').textContent = '0';
				document.getElementById('totalPrice').innerHTML = productPrice;
				
			}
			
			
		});
	}
	