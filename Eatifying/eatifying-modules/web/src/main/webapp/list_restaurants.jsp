<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="x-ua-compatible" content="IE=8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Mealz 'n' Dealz | Order Food Online &amp; Get it delivered at your doorstep</title>
<meta name="keywords" content="food delivery, delivery food, restaurants, delivery restaurants, restaurant delivery, delivery restaurants, food delivery service, food, order food online, online ordering, local food delivery, takeout, take out, Mealz 'n' Dealz">
<meta name="description" content="Order food online from food delivery restaurants in your area. Ordering food online from delivery food restaurants is fast and get discounts for ordering food online or via mobile at Mealz 'n' Dealz in Hyderabad">
<link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/jquery-ui-1.8.17.custom.css" type="text/css" media="screen"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" type="text/javascript"></script>
<script src="http://widgets.twimg.com/j/2/widget.js"></script>
<script type="text/javascript" src="<s:url value="/js/jquery.nivo.slider.pack.js" includeParams="none"/>"></script>
<script type="text/javascript" src="<s:url value="/js/eatifying-main.js" includeParams="none"/>"></script>
<script type="text/javascript" src="<s:url value="/js/jquery.blockUI.js" includeParams="none"/>"></script>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script type="text/javascript" src="<s:url value="/js/modernizr-latest.js" includeParams="none"/>"></script>
<script type="text/javascript" src="<s:url value="/js/jquery-easing.1.2.pack.js" includeParams="none"/>"></script>
<script type="text/javascript" src="<s:url value="/js/jquery.colorbox-min.js" includeParams="none"/>"></script>
<script type="text/javascript" src="<s:url value="/js/jquery-easing-compatibility.1.2.pack.js" includeParams="none"/>"></script>
<script type="text/javascript" src="<s:url value="/js/coda-slider.1.1.1.pack.js" includeParams="none"/>"></script>
<script type="text/javascript" src="<s:url value="/js/jquery-ui-1.8.14.all.min.js" includeParams="none"/>"></script>
<script type="text/javascript" src="http://fineforce.happytables.com/wp-content/themes/fineforce/js/jquery.backstretch.min.js?ver=3.2.3"></script>
		

<script type="text/javascript">
	$(window).load(function() {
		$('#slider').nivoSlider();
		$("#slider1").codaSlider();
	});
</script>
<script type="text/javascript">
			jQuery.backstretch("http://fineforce.happytables.com/files/2012/03/fine_bg24.jpg")
			
</script>
</head>

<body>
	<jsp:include page="/header.jsp" />
	<div id="main_content">
	<div id="images_div" style="display:none">
		<img alt="Back" src="<s:url value="/images/back.png"/>" 
		onclick="goToMenu(this);return false;"
		style="position:absolute;top:300px;left:-70px">
		</img>
	</div>
	<div id="slider1" class="csw">
		<div class="panelContainer">
			<div class="panel" title="Listing">
				<div class="wrapper">
					<div id="listrestaurants">
						<div id="filter" class="filter">
							<h2>Filter search</h2>
							<div>
								<input type="text" id="restaurantNameFilter"
									placeholder="Restaurant name" /> <input id="foodNameFilter"
									type="text" placeholder="Food name" /> <input type="button"
									onclick="filterRestaurants();">
							</div>
							<form class="form">
								<div id="filterCusine">
									<h3>Cusine</h3>
									<s:iterator value="cusineList">
										<input id="cusine-<s:property value="cusineId"/>" type="checkbox"
											value="<s:property value="cusineId"/>"
											title=<s:property value="cusineDesc"/>
											onclick="filterRestaurants();">
										<label> <s:property value="cusineName" /> </label>
										<br>
									</s:iterator>
								</div>
								<hr>
								<div id="filterCost">
									<h3>Cost type:</h3>
									<input id="cost-1" type="checkbox" value="1"
										onclick="filterRestaurants();"> <label>$</label> <br>
									<input id="cost-2" type="checkbox" value="2"
										onclick="filterRestaurants();"> <label>$$</label> <br>
									<input id="cost-3" type="checkbox" value="3"
										onclick="filterRestaurants();"> <label>$$$</label> <br>
									<br>
								</div>
								<hr>
								<div id="filterRating">
									<h3>Rating</h3>
									<input id="rating-1" type="checkbox" value="1"
										onclick="filterRestaurants();"> <img
										src="images/star_x_orange.gif" /> <br> <input id="rating-2"
										type="checkbox" value="2" onclick="filterRestaurants();">
									<img src="images/star_x_orange.gif" /><img
										src="images/star_x_orange.gif" /> <br> <input id="rating-3"
										type="checkbox" value="3" onclick="filterRestaurants();">
									<img src="images/star_x_orange.gif" /><img
										src="images/star_x_orange.gif" /><img
										src="images/star_x_orange.gif" /> <br>
								</div>
							</form>
						</div>
						<div id="restaurantsTableDiv" class="restaurantsTable">
							<table id="restListTable" class="table">
								<colgroup width="30%" />
								<colgroup width="15%" />
								<colgroup width="15%" />
								<colgroup width="20%" />
								<colgroup width="20%" />
								<thead>
									<tr>
										<th>Restaurant Name</th>
										<th>Price</th>
										<th>Rating</th>
										<th>Distance</th>
										<th>Delivery time</th>
									</tr>
								</thead>
								<s:iterator value="restaurantList">
									<tr>
										<td><a href="#"
											onclick="getRestaurantById('<s:property value="restaurantId"/>');return false;">
												<s:property value="restaurantName" /> </a> <br> <s:property
												value="restaurantAddress.addressLine1" /> , <s:property
												value="restaurantPhone" />
										</td>
										<td><s:iterator value="restaurantDetails.costType.costTypeId" >
											$
											</s:iterator>
										</td>
										<td><s:iterator value="restaurantDetails.rating.ratingId" >
											<img src="images/star_x_orange.gif" />
											</s:iterator>
										</td>
										<td><s:property value="restaurantDetails.distance" />
										</td>
										<td><s:property value="restaurantDetails.deliveryTime" />
										</td>
									</tr>
								</s:iterator>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="panel" title="Menu">
				<div class="wrapper">
					<div id=menuselection></div>
				</div>
			</div>
			<div class="panel" title="Checkout">
				<div class="wrapper">
					<div id=checkout></div>
				</div>
			</div>	
		</div>
		</div>	
		
	</div>
	<jsp:include page="/footer.jsp" />
</body>
</html>