<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.ItemDetailDAO"%>
<%@page import="vo.ItemVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MainDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html >
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=News+Cycle:400,700" />
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=News+Cycle:400,700" />
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.tableTh1 {
	border: 2px solid;
	border-color: #dddddd;
	background-color: white;
	text-align: center;
	margin : auto;
}
.tableTh2 {
	border: 2px solid;
	border-color: #dddddd;
	background-color: white;
	text-align: left;
}
.rating-wrapper {
  overflow: hidden;
  display: inline-block;
}

.rating-input {
  position: absolute;
  left: 0;
  top: -50px;
}

.rating-star:hover,
.rating-star:hover ~ .rating-star {
  background-position: 0 0;
}

.rating-wrapper:hover .rating-star:hover,
.rating-wrapper:hover .rating-star:hover ~ .rating-star,
.rating-input:checked ~ .rating-star {
  background-position: 0 0;
}

.rating-star,
.rating-wrapper:hover .rating-star {
  float: left;
  display: block;
  width: 16px;
  height: 16px;
  background: url('http://css-stars.com/wp-content/uploads/2013/12/stars.png') 0 -16px;
}

.button {
    background-color: #e7e7e7;
    border: none;
    color: black;
    padding: 10px 13px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
}
.button:hover {
	background-color: #282828;
	color: white;
}

.button:active {
  background-color: #555555;
  box-shadow: 0 5px #e7e7e7;
  transform: translateY(4px);
}
</style>
<%
	int no = Integer.parseInt(request.getParameter("ino"));
	int pageNo = Integer.parseInt(request.getParameter("pno"));
	int groupNo = Integer.parseInt(request.getParameter("groupno"));
	
%>
</head>
<body onload="priceCommaCheck()">
<%@include file="/nav.jsp"%>
<div class="container">
	  <%
	  	MainDAO dao = new MainDAO();
	    ItemVO item = dao.getItemListDetail(no);
	   %>
	  <div class="row">
	  <div class="col-md-1">
	  </div>
	   <div class="col-md-4">
	  		<img src="/itemImage/<%=item.getSrc() %>" style="width:100% " />
	  </div>
	   <div class="col-md-1">
	  </div>
	  <div class="col-md-6">
	  <form action="thumbnailprosess.jsp" onsubmit="return formCheck()">
	  	<input type="hidden" name="gubun" id="gubun-field" />
	  	<table class="w3-table">
	  	<thead>
	  		<tr>
	  		<th style="font-size: 30px"><%=item.getName() %></th>
	  		</tr>
	  	</thead>
		  	<tbody>
		  		<tr>
		  			<td>
		  				Price:<strong id="item-Price"> <%=item.getDecimalPrice() %></strong>원
		  				<input type="checkbox" id="cardCheck" />카드결제 
		  				<div id="checkcard">
		  					
		  				</div>
		  			</td>
		  		</tr>
		  		<tr>
		  			<td>
		  				<p class="text-right">
		  					<small style="color:#B70000;">
		  						무이자 최대 3개월 (단, 일시불 할인 및 법인카드 불가)
		  					</small>
		  				</p>
		  				<p class="text-right">
		  					<small style="color:#B70000;">
		  						배송비 무료배송 배송예정일 결제완료 후 3일내 배송가능 (토,일,공휴일 제외)
		  					</small>
		  				</p>
		  			</td>
		  		</tr>
		  		<tr>
		  			<td>
			  			<p>Color :
								<select class="select" name="itemColor" id="item-color">
			  						<option value="" disabled selected>--[필수]옵션을 선택하세요.--</option>
				  					<%
					  					ItemDetailDAO group = new ItemDetailDAO();
					  				  	ArrayList<ItemVO> groupList = group.getItemGroupNo(groupNo);
					  				  	
					  				  	for(ItemVO groupItem : groupList){  				  		
									%>
				  							<option value="<%=groupItem.getItemNo()%>-<%=groupItem.getColor()%>-<%=pageNo%>-<%=groupNo%>"><%=groupItem.getColor() %></option>
									<%
				  				  		}
				  					%>
			  					</select>
			  			</p>	
		  			</td>
		  		</tr>
		  		<tr>
		  			<td>
		  				<p>Size :
			  				<select class="select" name="itemSize" id="item-size">
				  				<option value="" disabled selected>--[필수]옵션을 선택하세요.--</option>
		  				<%
			  					ItemDetailDAO gropSize = new ItemDetailDAO();
			  				  	ArrayList<ItemVO> groupSizeList = group.getItemGroupNo(groupNo);
			  				  	for(ItemVO groupItem : groupSizeList){  				  		
								%>
				  				<option value="<%=groupItem.getSize()%>"><%=groupItem.getSize()%></option>
		  				<%
			  				  	}
			  					%>
			  				</select>
		  				</p>
		  			</td>
		  		</tr>
		  		<tr>
		  			<td>
		  				<p>Count :
		  				<select class="select"  name="itemCount" id="item-count" onchange="displayTotalPrice()">
		  				<option value="" disabled selected value="0">--[필수]수량을 선택하세요.--</option>
		  				<option value="1">1</option>
		  				<option value="2">2</option>
		  				<option value="3">3</option>
		  				<option value="4">4</option>
		  				</select></p>
		  			</td>
		  		</tr>
		  		<tr>
		  			<td>
		  			Purchase Price: <label id="itemPrice"> 0</label> - Reduced Price:<label id="price-rate"> 0</label> = Total Price:<span id="price-box"> 0</span>won
		  			</td>
		  		</tr>
		  	</tbody>
	  	</table>
	  	<%
	  		if(item.getCount() <= 0) {
	  	%>
		  	<p><button  class="w3-btn w3-disabled" style="width:48%" onmouseenter="setGubun('buy')" disabled="disabled"><strong>Sold out</strong></button><button name="addcart" class="w3-btn w3-disabled pull-right"style="width:48%" onmouseenter="setGubun('cart')" disabled="disabled"><strong>Sold out</strong></button></p> 
	  	<%	
	  		} else {
	  	%>
		  	<p><button  class="w3-btn w3-black" style="width:48%" onmouseenter="setGubun('buy')" id="add-buy"> B U Y </button><button name="addcart" id="add-cart" class="w3-btn w3-black pull-right"style="width:48%" onmouseenter="setGubun('cart')" > ADD CART </button></p> 
	  	<%	
	  		}
	  	%>
	  </form>
	  </div>
	  </div>
	  <br />
	  <br />
	  <div class="row">
	  				    <ul id="myTab" class="nav nav-tabs" role="tablist">
					      <li role="presentation" class="active" style="width: 33%"><a href="#itemdetail" id="item-detail" role="tab" data-toggle="tab" aria-controls="itemContents" aria-expanded="true"><font size="3">Item Information</font></a></li>
					      <li role="presentation" style="width: 33%"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profileitem" ><font size="3">Item Comment</font></a></li>
					      <li role="presentation" style="width: 34%"><a href="#return" role="tab" id="return-tab" data-toggle="tab" aria-controls="itemreturn" ><font size="3">Return</font></a></li>
					    </ul>
					    <div id="myTabContent" class="tab-content">
					      <div role="tabpanel" class="tab-pane fade in active" id="itemdetail" aria-labelledBy="item-tab">
					      <br />
					      <br />
					        <p align="center"><img src="/itemImage/<%=item.getViewSrc()%>" /></p>
					        <div class="row">
								<div class="col-md-2">
								</div>
								<div class="col-md-8">
									<h2>사이즈 정보</h2>
										<table class="table table-striped">
											<thead>
										      <tr>
										        <th></th>
										        <th>어깨</th>
										        <th>가슴길이</th>
										        <th>소매</th>
										        <th>총길이</th>
										      </tr>
										    </thead>
										    <tbody>
										      <tr>
										        <td>44</td>
										        <td>54</td>
										        <td>60</td>
										        <td>74</td>
										        <td>69</td>
										      </tr>
										      <tr>
										        <td>46</td>
										        <td>55</td>
										        <td>62</td>
										        <td>75</td>
										        <td>70</td>
										      </tr>
										      <tr>
										        <td>48</td>
										        <td>56</td>
										        <td>64</td>
										        <td>76</td>
										        <td>73</td>
										      </tr>
										    </tbody>
										</table>
								</div>
								<div class="col-md-2">
								</div>
							</div>
							<div class="row">
								<div class="col-md-3">
								</div>
								<div class="col-md-6">
								<h2>contents</h2>
								<ul>
									<li><%=item.getEtc() %></li>
								</ul>
								</div>
								<div class="col-md-3">
								</div>	
							</div>
					      </div>
					      <div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledBy="profile-tab">    
					      <br />
					      <br />  		
							<table class="w3-table w3-bordered" style="margin: auto;">
									<colgroup>
										<col width="70px;"/>
										<col width="135px;" />
										<col width="135px;" />
										<col width="*;" />
										<col width="100px;" />
										<col width="84px;" />
										<col width="100px;" />
										<col width="55px;" />
									</colgroup>
									<thead>
									<% 
									int tno = 6;
									BoardDAO boardDAO = new BoardDAO();
									ArrayList<BoardVO> boardList = boardDAO.getAllBoardByItemNo(no);
									for (BoardVO vo : boardList) { %> 
										<tr>
											<th scope="col" id="no">No</th>
											<th scope="col" id="category">Category</th>
											<th scope="col" id="category">Item Info</th>
											<th scope="col" id="title">Title</th>
											<th scope="col" id="title">Grade</th>						
											<th scope="col" id="writer">Writer</th>
											<th scope="col" id="regdate">Date</th>
											<th scope="col" id="readcount">Hits</th>
										</tr>
									</thead>
									<tbody style="height: 40px;">
										<tr>
											<td style="text-align: center;"><%=vo.getBoardNo() %></td>
											<td style="text-align: center;"><%=vo.getBoardCategory() %></td>
											<%int nullCount = 0;
											  String hasFile = "";
												boolean isAllFileNull = false;
												if (vo.getBoardFileName1() == null) { nullCount++;} else {hasFile = vo.getBoardFileName1();}
												if (vo.getBoardFileName2() == null) { nullCount++;} else {hasFile = vo.getBoardFileName2();}
												if (vo.getBoardFileName3() == null) { nullCount++;} else {hasFile = vo.getBoardFileName3();}
												if (vo.getBoardFileName4() == null) { nullCount++;} else {hasFile = vo.getBoardFileName4();}
												if (vo.getBoardFileName5() == null) { nullCount++;} else {hasFile = vo.getBoardFileName5();}
												if (nullCount == 5) {isAllFileNull = true;}											
												if(!isAllFileNull && hasFile != null) { %>
													<td style="text-align: center;">
														<div class="w3-dropdown-hover">
															<img border="0" alt="img" src="/itemImage/upload/<%=hasFile%>" width="90px;" height="65px;">
															<div class="w3-dropdown-content" style="width:300px">
														   	 <img src="/itemImage/upload/<%=hasFile%>" alt="img" style="width:100%">
															</div>
														</div>
													</td>
												<%} else { %>
													<td style="text-align: center;"><img alt="img" src="/itemImage/upload/cameraImg.png" width="30px;" height="30px;"></td>												
												<%}%>		
											<td><a href="/board/boardDetail.jsp?bno=<%=vo.getBoardNo()%>&tno=<%=vo.getBoardType() %>&pno=<%=pageNo%>"><%=vo.getBoardTitle() %>
												</a>
											</td>
											<td style="text-align: center;">
												<%if(vo.getBoardSatis() == 5.0) // 아래는 평점(별표) 출력문입니다.
												{%> 
													  <input type="radio" class="rating-input" id="rating-input-1-5" checked disabled/>
													  <label for="rating-input-1-5" class="rating-star"></label>
													  <input type="radio" class="rating-input" id="rating-input-1-4" disabled/>
													  <label for="rating-input-1-4" class="rating-star"></label>
													  <input type="radio" class="rating-input" id="rating-input-1-3" disabled/>
													  <label for="rating-input-1-3" class="rating-star"></label>
													  <input type="radio" class="rating-input" id="rating-input-1-2" disabled/>
													  <label for="rating-input-1-2" class="rating-star"></label>
													  <input type="radio" class="rating-input" id="rating-input-1-1" disabled/>
													  <label for="rating-input-1-1" class="rating-star"></label>
												<%} else if(vo.getBoardSatis() == 4.0) {%> 
													  <input type="radio" class="rating-input" id="rating-input-1-4" checked disabled/>
													  <label for="rating-input-1-4" class="rating-star"></label>
													  <input type="radio" class="rating-input" id="rating-input-1-3" disabled/>
													  <label for="rating-input-1-3" class="rating-star"></label>
													  <input type="radio" class="rating-input" id="rating-input-1-2" disabled/>
													  <label for="rating-input-1-2" class="rating-star"></label>
													  <input type="radio" class="rating-input" id="rating-input-1-1" disabled/>
													  <label for="rating-input-1-1" class="rating-star"></label>
												<%} else if(vo.getBoardSatis() == 3.0) {%> 
													  <input type="radio" class="rating-input" id="rating-input-1-3" checked disabled/>
													  <label for="rating-input-1-3" class="rating-star"></label>
													  <input type="radio" class="rating-input" id="rating-input-1-2" disabled/>
													  <label for="rating-input-1-2" class="rating-star"></label>
													  <input type="radio" class="rating-input" id="rating-input-1-1" disabled/>
													  <label for="rating-input-1-1" class="rating-star"></label>
												<%} else if(vo.getBoardSatis() == 2.0) {%> 
													  <input type="radio" class="rating-input" id="rating-input-1-2" checked disabled/>
													  <label for="rating-input-1-2" class="rating-star"></label>
													  <input type="radio" class="rating-input" id="rating-input-1-1" disabled/>
													  <label for="rating-input-1-1" class="rating-star"></label>
												<%} else if(vo.getBoardSatis() == 1.0) {%> 
													  <input type="radio" class="rating-input" id="rating-input-1-1" checked disabled/>
													  <label for="rating-input-1-1" class="rating-star"></label>
												<%}%>
											</td>
											<td style="text-align: center;"><%=vo.getUserName() %></td>
											<td style="text-align: center;"><%=vo.getSimpleDate() %></td>
											<td style="text-align: center;"><%=vo.getBoardReadCount() %></td>
										</tr>
									<%}%>
									</tbody>
								</table>
			<div class="pull-right" style="padding-top: 10px;">
				<a href="/board/addBoardForm.jsp?tno=6&pno=<%=pageNo %>&ino=<%=no %>" class="button w3-white" ><i class="material-icons">border_color</i></a>
			</div>	
		</div>				      			
					      
					      <div role="tabpanel" class="tab-pane fade" id="return" aria-labelledBy="dropdown1-tab">
					      	<div class="row">
					      	<br></br>
					      	<h2><strong>배송/반품/교환 문의정보</strong></h2>
					      	<br></br>
					      	<table class="w3-table">
						      	<tr>
						      		<td>
						      			<strong>판매자 반품 택배사</strong>
						      		</td>
						      	</tr>
					      	</table>
					      	<p>1. 소화물 택배의 배송은 발송일로부터 1~2 영업일이 소요되나, 지역/대형 화물/설치/예약/발송지체 등의 특이사항에 따라 배송기간은 달라질 수 있습니다.</p>
		        			<p>2. 상품의 특성과 거래조건에 따라 청약철회(변심반품/취소)가 일부 제한되거나 청약철회에 소요되는 비용이 다르게 책정될 수 있습니다. </p>
		        			<p>3. 청약철회는 상품 수령일로부터 7일 이내에 신청하실 수 있으며, 판매자는 ‘전자상거래등에서의소비자보호에관한법률’이 정하는 바에 따른 지연이자 지급의 책임이 있습니다.</p>
		        			
		        			<p>4. 제품 사용 상 불만과 피해보상에 관하여는 제조사, 수입원, 판매자 등에게 문의하여주시기 바라며, 당사의 고객센터로 문의 주시면 관계법령과 규정에 부합하는 기준에 따라 문제 해결에 도움을 드리겠습니다. </p>
		        			<p>5. 거래에 관한 약관은 판매자의 상품 상세설명 화면과 당사 이용약관(링크)에서 확인하실 수 있습니다.</p>
		        			<br />
					      	</div>
					      	<div class="row">
					      		<div class="col-md-6">
					      		<h5><strong>주의 사항</strong></h5>
					        			<p>전자상거래 등에서의 소비자보호법에 관한 법률에 의거하여 미성년자가 체결한 계약은 법정대리인이 동의하지 않은 경우 본인 또는 법정대리인이 취소할 수 있습니다. 지마켓에 등록된 판매상품과 상품의 내용은 판매자가 등록한 것으로 ㈜이베이코리아에서는 그 등록내역에 대하여 일체의 책임을 지지 않습니다. </p>
					      		</div>
					      		<div class="col-md-6">
					      		<h5><strong>SARA C 신고센터</strong></h5>
					      		<p>SARA C는 소비자의 보호와 사이트 안전거래를 위해 신고센터를 운영하고 있습니다. 불법상품 및 부적격 상품의 판매 또는 부적절한 광고내용이나 안전거래를 저해하는 경우 신고하여 주시기 바랍니다.</p>
					      		</div>
					      	</div>
					      </div>
					    </div>
					</div>
				</div>
	<%@include file="/footer.jsp"%>
</body>
<script>


function priceCommaCheck() {
	var itemPrice = document.getElementById('item-Price').textContent;
	console.log(itemPrice); 
	var commaItemPrice = itemPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	document.getElementById('item-Price').textContent = commaItemPrice;
	document.getElementById("itemPrice").textContent = commaItemPrice;
	document.getElementById("price-box").textContent = commaItemPrice;
}
	

document.getElementById("cardCheck").addEventListener("click", function() {
	
	var cardCheck = document.getElementById("cardCheck");
	var checkCard = document.getElementById("checkcard");
	var html = "";
	
	if (cardCheck.checked) {
		
		html += '<select class="select" name="item-rate" id="item-rate" onchange="rateCalurate()">';
		html +='<option value="0">--신용카드를 선택하세요--</option>';
		html +='<option value="0.07">KB국민 7%</option>';
		html +='<option value="0.08">신한카드 8%</option>';
		html +='<option value="0.09">삼성카드 9%</option>';
		html +='</select>';
		
		checkCard.innerHTML = html;
		
	}else{
		checkCard.innerHTML = "";
		
		var itemSumText = document.getElementById("item-count").value;
		
		if (itemSumText == 0) {
			
			document.getElementById("itemPrice").textContent = onePriceText.toLocaleString();
			document.getElementById("price-rate").textContent = 0;
			document.getElementById("price-box").textContent = onePriceText.toLocaleString();
			
		}else {
			
			var priceNumber = parseInt(onePriceText) * parseInt(itemSumText);
			document.getElementById("itemPrice").textContent = priceNumber.toLocaleString();
			document.getElementById("price-rate").textContent = 0;
			document.getElementById("price-box").textContent = priceNumber.toLocaleString();
		}
	}
});

	function setGubun(text) {
		document.getElementById('gubun-field').value = text;
	}

	var onePriceText = document.getElementById("item-Price").textContent;
	
	function rateCalurate(){
		var itemSumText = document.getElementById("item-count").value;
		var cardRateText = document.getElementById("item-rate").value;
		console.log(cardRateText);
		var onePrice = parseInt(onePriceText);
		console.log(onePrice);
		if (itemSumText== 0) {
			var rate = (onePriceText*(Math.round(cardRateText*100)))/100;
			document.getElementById("itemPrice").textContent = onePriceText.toLocaleString();
			document.getElementById("price-rate").textContent = rate.toLocaleString();
			var finalPrice = onePriceText - rate;
			document.getElementById("price-box").textContent = finalPrice.toLocaleString();
		}else {
			var totalPrice = onePrice * parseInt(itemSumText);
			var rate = (totalPrice*(Math.round(cardRateText*100)))/100;
			var totalRate = new Number(rate).toLocaleString();
			
			document.getElementById("itemPrice").textContent = totalPrice.toLocaleString();
			document.getElementById("price-rate").textContent = totalRate;
			var finalPrice2 = totalPrice - rate;
			document.getElementById("price-box").textContent = finalPrice2.toLocaleString();
		}
		
	}
	
	function displayTotalPrice(){
		
		var checkBox = document.getElementById('cardCheck');
		var itemSumText = document.getElementById("item-count").value;
		
		if (checkBox.checked) {
			
			var itemRateText = document.getElementById("item-rate").value;
			
			var onePrice = parseInt(onePriceText);
			
			var Price = new Number(onePriceText).toLocaleString();
			var rate = parseFloat(itemRateText);
			var selectRate = (rate*100)/100;
			var Sum = parseInt(itemSumText);
			var pricesum = onePrice*Sum;
			var priceSum = new Number(pricesum).toLocaleString();
			var rateSum = pricesum*selectRate;
			var totalRate = new Number(rateSum).toLocaleString();
			
			
			var totalprice = pricesum - rateSum;
			var totalPrice = new Number(totalprice).toLocaleString();
			
			document.getElementById("itemPrice").textContent = priceSum;
			document.getElementById("price-rate").textContent = totalRate;
			document.getElementById("price-box").textContent = totalPrice;
			
		}else {
			var testPrice = parseInt(onePriceText) * parseInt(itemSumText);
			
			document.getElementById("itemPrice").textContent = testPrice.toLocaleString();
			document.getElementById("price-rate").textContent = 0;
			var finalPrice3 = onePriceText * parseInt(itemSumText);
			document.getElementById("price-box").textContent = finalPrice3.toLocaleString();
			
		}	
	}
	
function formCheck(){
	
	var itemColorEL = document.getElementById("item-color");
	var itemColor = itemColorEL.value.trim();
	
	if(itemColor == ""){
		alert("Color는 필수 입력값입니다.");
		itemColorEL.focus();
		return false;
	}
	
	var itemSizeEL = document.getElementById("item-size");
	var itemSize = itemSizeEL.value.trim();
	
	if(itemSize == ""){
		alert("Size는 필수 입력값입니다.");
		itemSizeEL.focus();
		return false;
	}
	
	var itemCountEL = document.getElementById("item-count");
	var itemCount = itemCountEL.value.trim();
	
	if(itemCount == ""){
		alert("Count는 필수 입력값입니다.");
		itemCountEL.focus();
		return false;
	}
	
	var inputValueEL = document.getElementById("gubun-field");
	var value = inputValueEL.value.trim();
	
	<%
	if(session == null){
	%>
	alert("로그인이 필요합니다.");
	<%
	}else{
	%>
	if("cart" == value){
		alert("장바구니에 담았습니다.");
	}
	<%
	}
	%>
	return true;
}
</script>
</html>