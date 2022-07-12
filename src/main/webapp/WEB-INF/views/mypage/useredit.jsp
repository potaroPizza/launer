<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/user"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<t:wrapper>
	<script type="text/javascript"
		src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/useredit.js'/>"></script>
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<div style="background-color: #fff">
		<div id="useredit_wrapper">
			<!-- 일반 회원 사용자 폼 -->
			<c:if
				test="${map['USER_CODE']=='1' && map['SOCIAL_LOGIN_KEY']==null}">
				<div id="useredit_top"></div>
				<div id="useredit_sub">
					<p>내 정보 수정</p>
				</div>
				<!-- content-->
				<form method="post" name="usereditfrm"
					action="<c:url value='/mypage/useredit'/>">
					<div id="useredit_content">

						<!-- ID -->
						<div>
							<h3 class="useredit_title">
								<label for="id">아이디(이메일)</label>
							</h3>
							<span class="box int_id" style="background-color: #e9e9e9;">
								<input type="text" id="userid" name="id" class="int"
								value="${map['EMAIL']}" maxlength="20" readonly="readonly"
								disabled style="background-color: #e9e9e9;">
							</span> <span class="error_next_box"></span>
						</div>

						<div>
							<h3 class="useredit_title">
								<label for="pwd">비밀번호</label>
							</h3>
							<span class="box int_pass"> <input type="password"
								id="pwd" name="pwd" class="int" maxlength="16"> <span
								id="alertTxt">사용불가</span> <img src="../images/m_icon_pass.png"
								id="pwd_img1" class="pswdImg"></span> <span
								class="error_next_box"></span>
						</div>


						<!-- NAME -->
						<div>
							<h3 class="useredit_title">
								<label for="name">이름</label>
							</h3>
							<span class="box int_name" style="background-color: #e9e9e9;">
								<input type="text" id="name" class="int" name="name"
								value="${map['NAME']}" readonly="readonly" disabled
								style="background-color: #e9e9e9;">
							</span> <span class="error_next_box"></span>
						</div>

						<!-- hp -->
						<div>
							<h3 class="useredit_title">
								<label for="phoneNo">휴대전화</label>
							</h3>
							<span class="box int_hp"> <input type="tel" id="hp"
								name="hp" class="int" value="${map['HP']}" maxlength="11"
								placeholder=" ' - ' 없이 전화번호를 입력해주세요">
							</span> <span class="error_next_box"></span>
						</div>

						<div>
							<h3 class="useredit_title">
								<label for="zipcode">우편번호 <input type="button"
									onclick="execZipcode()" id="btnZipcode" value="우편번호 찾기"
									name="btnZipcode"></label>
							</h3>
							<span class="box int_zipcode"> <input type="text"
								id="zipcode" name="zipcode" class="int" maxlength="20"
								value="${map['ZIPCODE']}" onclick="execZipcode()"
								placeholder="우편번호 수정하기" readonly="readonly">
							</span> <span class="error_next_box"></span>
						</div>

						<div>
							<h3 class="useredit_title">
								<label for="address">주소</label>
							</h3>
							<span class="box int_address"> <input type="text"
								id="address" name="address" class="int" maxlength="20"
								value="${map['ADDRESS']}" onclick="execZipcode()"
								readonly="readonly">
							</span> <span class="error_next_box" id="serviceError"></span>
						</div>

						<div>
							<h3 class="useredit_title">
								<label for="addressDetail">상세주소</label>
							</h3>
							<span class="box int_addressDetail"> <input type="text"
								id="addressDetail" name="addressDetail" class="int"
								maxlength="30" value="${map['ADDRESS_DETAIL']}">
							</span> <span class="error_next_box"></span>
						</div>

						<input type="hidden" name="lonX" value="${map['LON_X']}">
						<input type="hidden" name="latY" value="${map['LAT_Y']}">
						<input type="hidden" name="officeNo"
							value="${map['OFFICE_NO'] == null ? 0 : map['OFFICE_NO']}">

						<div>
							<h3 class="useredit_title">
								<label for="enterMethod">공동현관 출입방법</label>
							</h3>
							<span class="box int_entermethod"> <input type="text"
								id="entermethod" name="entermethod" class="int" maxlength="30"
								value="${map['ENTERMETHOD']== null? '없음' : map['ENTERMETHOD']}"
								placeholder="입력하지 않을시 '없음'으로 입력됩니다">
							</span> <span class="error_next_box"></span>

						</div>

						<!-- useredit BTN-->
						<div class="useredit_btn_area">
							<button type="submit" id="btnuseredit">
								<span>수정하기</span>
							</button>
						</div>
					</div>
				</form>
			</c:if>

			<!--소셜 로그인 사용자 폼(네이버,카카오)  -->
			<c:if
				test="${map['USER_CODE']=='1' && map['SOCIAL_LOGIN_KEY']!=null}">
				<div id="useredit_top"></div>
				<div id="useredit_sub">
					<p>내 정보 수정</p>
				</div>
				<!-- content-->
				<form method="post" name="usereditfrmSocial"
					action="<c:url value='/mypage/usereditSocial'/>">
					<div id="useredit_content">

						<!-- ID -->
						<div>
							<h3 class="useredit_title">
								<label for="id">아이디(이메일)</label>
							</h3>
							<span class="box int_id" style="background-color: #e9e9e9;">
								<input type="text" id="userid" name="id" class="int"
								value="${map['EMAIL']}" maxlength="20" readonly="readonly"
								disabled style="background-color: #e9e9e9;">
							</span> <span class="error_next_box"></span>
						</div>
						<!-- NAME -->
						<div>
							<h3 class="useredit_title">
								<label for="name">이름</label>
							</h3>
							<span class="box int_name" style="background-color: #e9e9e9;">
								<input type="text" id="name" class="int" name="name"
								value="${map['NAME']}" readonly="readonly" disabled
								style="background-color: #e9e9e9;">
							</span> <span class="error_next_box"></span>
						</div>

						<!-- hp -->
						<div>
							<h3 class="useredit_title">
								<label for="phoneNo">휴대전화</label>
							</h3>
							<span class="box int_hp"> <input type="tel" id="hp"
								name="hp" class="int" value="${map['HP']}" maxlength="11"
								placeholder=" ' - ' 없이 전화번호를 입력해주세요">
							</span> <span class="error_next_box"></span>
						</div>

						<div>
							<h3 class="useredit_title">
								<label for="zipcode">우편번호 <input type="button"
									onclick="execZipcode()" id="btnZipcode" value="우편번호 찾기"
									name="btnZipcode"></label>
							</h3>
							<span class="box int_zipcode"> <input type="text"
								id="zipcode" name="zipcode" class="int" maxlength="20"
								value="${map['ZIPCODE']}" onclick="execZipcode()"
								placeholder="우편번호 수정하기" readonly="readonly">
							</span> <span class="error_next_box"></span>
						</div>

						<div>
							<h3 class="useredit_title">
								<label for="address">주소</label>
							</h3>
							<span class="box int_address"> <input type="text"
								id="address" name="address" class="int" maxlength="20"
								value="${map['ADDRESS']}" onclick="execZipcode()"
								readonly="readonly">
							</span> <span class="error_next_box" id="serviceError"></span>
						</div>

						<div>
							<h3 class="useredit_title">
								<label for="addressDetail">상세주소</label>
							</h3>
							<span class="box int_addressDetail"> <input type="text"
								id="addressDetail" name="addressDetail" class="int"
								maxlength="30" value="${map['ADDRESS_DETAIL']}">
							</span> <span class="error_next_box"></span> <input type="hidden"
								name="lonX" value="${map['LON_X']}"> <input
								type="hidden" name="latY" value="${map['LAT_Y']}"> <input
								type="hidden" name="officeNo"
								value="${map['OFFICE_NO'] == null ? 0 : map['OFFICE_NO']}">
						</div>
						<div>
							<h3 class="useredit_title">
								<label for="enterMethod">공동현관 출입방법</label>
							</h3>
							<span class="box int_entermethod"> <input type="text"
								id="entermethod" name="entermethod" class="int" maxlength="30"
								value="${map['ENTERMETHOD']== null? '없음' : map['ENTERMETHOD']}"
								placeholder="입력하지 않을시 '없음'으로 입력됩니다">
							</span> <span class="error_next_box"></span>
						</div>

						<!-- useredit BTN-->
						<div class="useredit_btn_area">
							<button type="submit" id="btnuseredit">
								<span>수정하기</span>
							</button>
						</div>
					</div>
				</form>
			</c:if>

			<!-- 배송기사 폼 -->
			<c:if test="${map['USERS_CLASS_NO']==2}">
				<div id="useredit_top"></div>
				<div id="useredit_sub">
					<p>내 정보 수정</p>
				</div>
				<!-- content-->
				<form method="post" name="deliveryeditfrm"
					action="<c:url value='/delivery/useredit'/>">
					<div id="useredit_content">

						<!-- ID -->
						<div>
							<h3 class="useredit_title">
								<label for="id">아이디(이메일)</label>
							</h3>
							<span class="box int_id" style="background-color: #e9e9e9;">
								<input type="text" id="userid" name="id" class="int"
								value="${map['EMAIL']}" maxlength="20" readonly="readonly"
								disabled style="background-color: #e9e9e9;">
							</span> <span class="error_next_box"></span>
						</div>
						<div>
							<h3 class="useredit_title">
								<label for="pwd">비밀번호</label>
							</h3>
							<span class="box int_pass"> <input type="password"
								id="pwd" name="pwd" class="int" maxlength="16"
								placeholder="비밀번호를 입력해주세요."> <span id="alertTxt">사용불가</span>
								<img src="../images/m_icon_pass.png" id="pwd_img1"
								class="pswdImg">
							</span> <span class="error_next_box"></span>
						</div>
						<!-- NAME -->
						<div>
							<h3 class="useredit_title">
								<label for="name">이름</label>
							</h3>
							<span class="box int_name" style="background-color: #e9e9e9;">
								<input type="text" id="name" class="int" name="name"
								value="${map['NAME']}" readonly="readonly" disabled
								style="background-color: #e9e9e9;">
							</span> <span class="error_next_box"></span>
						</div>

						<!-- hp -->
						<div>
							<h3 class="useredit_title">
								<label for="phoneNo">휴대전화</label>
							</h3>
							<span class="box int_hp"> <input type="tel" id="hp"
								name="hp" class="int" value="${map['HP']}" maxlength="11"
								placeholder=" ' - ' 없이 전화번호를 입력해주세요">
							</span> <span class="error_next_box"></span>
						</div>

						<div>
							<h3 class="useredit_title">
								<label for="officeNo">지점</label>
							</h3>

							<div class="officeBtnArea">
								<button id="officeBtn" type="button" class="btn btn-dark">지점 선택</button>
							</div>
							<input type="hidden" id="officeNo" name="officeNo">
							<span class="box int_office"
								style="width: 75%; display: inline-block; background-color: #e9e9e9;">
								<input type="text" id="office" name="office" class="int"
								value="${map['OFFICE_NAME'] }" readonly="readonly" disabled
								style="background-color: #e9e9e9;">
							</span> <span class="error_next_box"></span>
						</div>
						<div>
							<h3 class="useredit_title">
								<label for="accountHolder">계좌주</label>
							</h3>
							<span class="box int_accHolder"> <input type="text"
								id="accountHolder" name="accountHolder" class="int"
								maxlength="10" value="${map['ACCOUNT_HOLDER'] }">
							</span> <span class="error_next_box"></span>
						</div>
						<div>
							<h3 class="useredit_title">
								<label for="accountinfo">계좌번호 <span
									class="accountNumber_sub">(${map['BANK']}&nbsp;${map['ACCOUNT_NUMBER'] })</span></label>
							</h3>
							<select name="bank" id="bank">
								<option value="국민은행">국민은행</option>
								<option value="기업은행">기업은행</option>
								<option value="NH농협은행">NH농협은행</option>
								<option value="NH농협은행">NH농협은행</option>
								<option value="신한은행">신한은행</option>
								<option value="우리은행">우리은행</option>
								<option value="카카오뱅크">카카오뱅크</option>
								<option value="토스뱅크">토스뱅크</option>
								<option value="하나은행">하나은행</option>
								<option value="한국씨티은행">한국씨티은행</option>
								<option value="SC제일은행">SC제일은행</option>
							</select> <span class="box int_accNum"
								style="width: 72%; display: inline-block;"> <input
								type="text" id="accountNumber" name="accountNumber" class="int"
								maxlength="20" value="${map['ACCOUNT_NUMBER'] }"
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
								placeholder="숫자이외에는 입력이 불가능합니다." />
							</span> <span class="error_next_box"></span>
						</div>

						<!-- useredit BTN-->
						<div class="useredit_btn_area">
							<button type="submit" id="btnuseredit">
								<span>수정하기</span>
							</button>
						</div>

						<div id="modal-wrap">
							<div class="office-modal">
								<div class="modalhead">
									<h2 class="head-title">Launer</h2>
								</div>
								<div class="modal-body">
									<div class="body-content">
										<div class="body-titlebox">
											<span class="body-title">지점 선택</span>
										</div>
										<div class="officelist">
											<ul>
												<c:forEach var="list" items="${list}">
													<li><a href="#" class="officeListNo" data-value="${list.no}">${list.officeName}</a></li>
												</c:forEach>
											</ul>
										</div>
									</div>
								</div>
								<div class="modal-foot">
									<span id="confirmBtn">확인</span>
								</div>
							</div>
						</div>

					</div>
				</form>
			</c:if>

		</div>
	</div>

</t:wrapper>