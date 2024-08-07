package com.bit.springboard.service.impl;

import com.bit.springboard.service.MailService;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;
import java.util.Random;

@Service
public class MailServiceImpl implements MailService {
    private final JavaMailSender javaMailSender;
    private static final Logger logger = LoggerFactory.getLogger(MailServiceImpl.class);

    @Autowired
    public MailServiceImpl(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }

    @Override
    public MimeMessage createMessage(String to, String ePw) throws MessagingException, UnsupportedEncodingException {

        MimeMessage message = javaMailSender.createMimeMessage();
        message.addRecipients(Message.RecipientType.TO, to);
        message.setSubject("[The Door Project] 비밀번호 변경을 위한 이메일 인증코드입니다."); // 이메일 제목

        // Email content
        String msgg = "";
        msgg += "<h1>안녕하세요</h1>";
        msgg += "<h1>The Door Project의 안용현입니다.</h1>";
        msgg += "<br>";
        msgg += "<p>아래 인증코드를 암호변경 페이지에 입력해주세요</p>";
        msgg += "<br><br>";
        msgg += "<div align='center' style='border:1px solid black'>";
        msgg += "<h3 style='color:blue'>비밀번호 변경 인증코드입니다</h3>";
        msgg += "<div style='font-size:130%'>";
        msgg += "<strong>" + ePw + "</strong></div><br/>";
        msgg += "</div>";

        message.setText(msgg, "utf-8", "html"); // 메일 내용, charset 타입, subtype
        message.setFrom(new InternetAddress("forbitmcamp12@naver.com", "TheDoorProject_Admin"));

        return message;
    }

    @Override
    public String createKey() {
        int leftLimit = 48; // numeral '0'
        int rightLimit = 122; // letter 'z'
        int targetStringLength = 10;
        Random random = new Random();
        String key = random.ints(leftLimit, rightLimit + 1)
                .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
                .limit(targetStringLength)
                .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
                .toString();
//        logger.debug(() -> "생성된 랜덤 인증코드: " + key);
        return key;
    }

    @Override
    public String sendSimpleMessage(String to) throws Exception {
        String ePw = createKey(); // 랜덤 인증코드 생성
        MimeMessage message = createMessage(to, ePw); // "to" 로 메일 발송

        try {
            javaMailSender.send(message);
        } catch (Exception e) {
            logger.error(() -> "메일 전송 실패", e);
            throw new IllegalArgumentException("메일 전송 실패", e);
        }

        return ePw; // 메일로 사용자에게 보낸 인증코드를 서버로 반환! 인증코드 일치여부를 확인하기 위함
    }
}
