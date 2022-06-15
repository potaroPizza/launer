<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<style type="text/css">
.sb-sidenav-footer {
	position: absolute;
	bottom: 0;
	width: 225px;
}
#orders th, #orders td{
	text-align: center;
}
</style>

<<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">주문관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">서비스에 입력된 주문들 관리</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                주문 현황
                            </div>
                            <div class="card-body">
								<table class="table table-striped" id="orders">
									<colgroup>
										<col style="width: 15%">
										<col style="width: 20%">
										<col style="width: 15%">
										<col style="width: 15%">
										<col style="width: 20%">
										<col style="width: 15%">
									</colgroup>
									<thead>
							<tr>
								<th>주문번호</th>
								<th>주문자</th>
								<th>담당지점</th>
								<th>주문상태</th>
								<th>날짜</th>
								<th>상세보기</th>

							</tr>
						</thead>
						<tbody>
							<tr>
								<td>172</td>
								<td>jihuo1004@gmail.com</td>
								<td>영등포점</td>
								<td>배송대기</td>
								<td>2022-06-15 19:46</td>
								<td><a href="#">상세보기</a></td>
							</tr>

						</tbody>
					</table>
				</div>
                        </div>
                    </div>
                </main>

<%@ include file="bottom.jsp"%>