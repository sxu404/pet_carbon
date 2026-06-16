package cn.kmbeast.utils;


import io.jsonwebtoken.*;

import java.util.Date;
import java.util.UUID;

/**
 * jwt token 工具类
 */
public class JwtUtil {
    /**
     * 密钥
     */
    private static final String privateKey = "d8c986df-8512-42b5-906f-eeea9b3acf86";
 /**
     * 有效期一周 --> 时间戳
     */
    private static final long time = 1000L * 60 * 60 * 24 * 7;

    /**
     * 生成 token
     *
     * @param id 用户ID
     * @return String
     */
    public static String toToken(Integer id, String role) {
        return Jwts.builder()
                .setHeaderParam("typ", "JWT")
                .setHeaderParam("alg", "HS256")
                .claim("id", id)
                .claim("role", role)
                .setSubject("用户认证")
                .setExpiration(new Date(System.currentTimeMillis() + time))
                .setId(UUID.randomUUID().toString())
                .signWith(SignatureAlgorithm.HS256, privateKey)
                .compact();
    }

    /**
     * 解密TOKEN
     *
     * @param token token信息
     */
    public static Claims fromToken(String token) {
        try {
            return Jwts
                    .parser()
                    .setSigningKey(privateKey)
                    .parseClaimsJws(token)
                    .getBody();
        } catch (Exception e) {
            System.out.println("=== JWT 解析失败 ===");
            System.out.println("Token: " + token);
            System.out.println("异常类型: " + e.getClass().getName());
            System.out.println("异常消息: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

}
