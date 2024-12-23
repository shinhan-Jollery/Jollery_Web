package com.shinhan.pay;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/pcpay")
public class WidgetController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    // 환경 변수 또는 외부 설정 파일에서 시크릿 키를 가져옵니다.
    private final String widgetSecretKey = System.getenv("TOSS_SECRET_KEY");

    /**
     * 결제 승인 처리
     */
    @RequestMapping(value = "/pcpay", method = RequestMethod.POST)
    public ResponseEntity<JSONObject> confirmPayment(@RequestBody String jsonBody) throws Exception {
        JSONParser parser = new JSONParser();
        String orderId, amount, paymentKey;
        System.out.println(2);
        try {
            // 클라이언트에서 받은 JSON 요청 바디 파싱
            JSONObject requestData = (JSONObject) parser.parse(jsonBody);
            System.out.println(requestData.toJSONString());
            paymentKey = (String) requestData.get("paymentKey");
            orderId = (String) requestData.get("orderId");
            amount = (String) requestData.get("amount");
        } catch (ParseException e) {
            throw new RuntimeException("JSON 파싱 오류", e);
        }

        JSONObject obj = new JSONObject();
        obj.put("orderId", orderId);
        obj.put("amount", amount);
        obj.put("paymentKey", paymentKey);

        // Authorization 헤더 생성
        Base64.Encoder encoder = Base64.getEncoder();
        byte[] encodedBytes = encoder.encode((widgetSecretKey + ":").getBytes(StandardCharsets.UTF_8));
        String authorizations = "Basic " + new String(encodedBytes);

        // 결제 승인 API 호출
        URL url = new URL("https://api.tosspayments.com/v1/payments/confirm");
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestProperty("Authorization", authorizations);
        connection.setRequestProperty("Content-Type", "application/json");
        connection.setRequestMethod("POST");
        connection.setDoOutput(true);

        OutputStream outputStream = connection.getOutputStream();
        outputStream.write(obj.toString().getBytes(StandardCharsets.UTF_8));

        int code = connection.getResponseCode();
        boolean isSuccess = code == 200;

        InputStream responseStream = isSuccess ? connection.getInputStream() : connection.getErrorStream();

        // 응답 데이터 읽기
        Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8);
        JSONObject jsonObject = (JSONObject) parser.parse(reader);
        responseStream.close();

        return ResponseEntity.status(code).body(jsonObject);
    }

    /**
     * 선택된 결제 수단 확인
     */
    @RequestMapping(value = "/getSelectedPaymentMethod", method = RequestMethod.POST)
    public ResponseEntity<JSONObject> getSelectedPaymentMethod(@RequestBody String jsonBody) {
        JSONParser parser = new JSONParser();
        
        try {
            JSONObject requestData = (JSONObject) parser.parse(jsonBody);
            String selectedMethod = (String) requestData.get("selectedMethod");

            logger.info("선택된 결제 수단: {}", selectedMethod);

            JSONObject response = new JSONObject();
            response.put("status", "success");
            response.put("selectedMethod", selectedMethod);

            return ResponseEntity.ok(response);
        } catch (ParseException e) {
            logger.error("결제 수단 파싱 오류", e);
            JSONObject errorResponse = new JSONObject();
            errorResponse.put("status", "error");
            errorResponse.put("message", "결제 수단 정보를 처리할 수 없습니다.");
            return ResponseEntity.badRequest().body(errorResponse);
        }
    }

    /**
     * 인증 성공 처리
     */
    @RequestMapping(value = "/success", method = RequestMethod.GET)
    public String paymentSuccess(HttpServletRequest request, Model model) {
        Map<String, Object> modelData = model.asMap();
        System.out.println("Model 내부 데이터: " + modelData);
    	System.out.println("인증 성공 처리");
        // 요청 파라미터 확인
        Enumeration<String> parameterNames = request.getParameterNames();
        System.out.println("[요청 파라미터]");
        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            String paramValue = request.getParameter(paramName);
            System.out.println(paramName + " = " + paramValue);
        }
        return "pay/success";
    }

    /**
     * 인증 실패 처리
     */
    @RequestMapping(value = "/fail", method = RequestMethod.GET)
    public String failPayment(HttpServletRequest request, Model model) {
        String failCode = request.getParameter("code");
        String failMessage = request.getParameter("message");

        model.addAttribute("code", failCode);
        model.addAttribute("message", failMessage);

        return "/fail";
    }
}
