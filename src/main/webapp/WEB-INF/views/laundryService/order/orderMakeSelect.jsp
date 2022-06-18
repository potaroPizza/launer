<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



			<div class="orderInfo-order">
				<div class="order-select-wrap">
				
				
				
					<select class="mulit-select" name="order-item" id="order-item">
						<option value="" ></option>
						<c:forEach var = "vo" items ="${list }">
						<option value="${vo.no} ">${vo.categoryName} </option>
						</c:forEach>
					</select> 
					
					
					<select class="mulit-select" name="order-num" id="order-num">
						<option value="" ></option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
					</select>
					<button class="addBtn" id="orderAddBtn">추가</button>
				</div>
			</div>
			
			

</body>
</html>