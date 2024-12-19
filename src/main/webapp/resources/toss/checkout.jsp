<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="utf-8" />
<link rel="icon"
    href="https://static.toss.im/icons/png/4x/icon-toss-logo.png" />
<link rel="stylesheet" type="text/css"
    href="<c:url value='/resources/toss/css/style.css' />" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>토스페이먼츠 샘플 프로젝트</title>
<!-- 토스페이먼츠 SDK 추가 -->
<script src="https://js.tosspayments.com/v2/standard"></script>
</head>

<body>
    <!-- 주문서 영역 -->
    <div class="wrapper">
        <div class="box_section"
            style="padding: 40px 30px 50px 30px; margin-top: 30px; margin-bottom: 50px">
            <!-- 결제 UI -->
            <div id="payment-method"></div>
            <!-- 이용약관 UI -->
            <div id="agreement"></div>
            <!-- 결제하기 버튼 -->
            <div class="result wrapper">
                <button class="button" id="payment-button" style="margin-top: 30px">
                    결제하기
                </button>
            </div>
        </div>

        <script>
        main();

        async function main() {
            const button = document.getElementById("payment-button");
            const amount = {
                currency: "KRW",
                value: 100,
            };

            // ------  결제위젯 초기화 ------
            const clientKey = "test_gck_docs_Ovk5rk1EwkEbP0W43n07xlzm";
            const customerKey = generateRandomString(); // 랜덤 문자열 생성 함수
            const tossPayments = TossPayments(clientKey);

            // 회원 결제
            const widgets = tossPayments.widgets({
                customerKey,
            });

            // ------  주문서의 결제 금액 설정 ------
            await widgets.setAmount(amount);

            // ------  결제 UI 렌더링 ------
            const paymentMethodWidget = await widgets.renderPaymentMethods({
                selector: "#payment-method",
                variantKey: "DEFAULT",
            });



            // ------ 이용약관 UI 렌더링 ------
            await widgets.renderAgreement({ selector: "#agreement", variantKey: "AGREEMENT" });

            // ------ '결제하기' 버튼 누르면 결제창 띄우기 ------
            button.addEventListener("click", async function () {
            	const paymentMethod = await paymentMethodWidget.getSelectedPaymentMethod();
                console.log("결제를 진행할 수단:", paymentMethod);

                try {
                    await widgets.requestPayment({
                        orderId: generateRandomString(),
                        orderName: "구매 상품 이름",
                        successUrl: window.location.origin + "/jollery/pcpay/success",
                        failUrl: window.location.origin + "/jollery/pcpay/fail",
                        customerEmail: "customer123@gmail.com",
                        customerName: "홍길동",
                        customerMobilePhone: "01012341234",
                    });
                } catch (error) {
                    console.error("결제 요청 중 오류 발생:", error);
                }
            });
        }

        function generateRandomString() {
            return Math.random().toString(36).substring(2, 12);
        }
        </script>
    </div>
</body>
</html>
