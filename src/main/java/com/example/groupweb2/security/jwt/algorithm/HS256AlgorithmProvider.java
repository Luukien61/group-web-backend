package com.example.groupweb2.security.jwt.algorithm;

import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import lombok.Getter;

import javax.crypto.SecretKey;
import java.security.Key;
import java.util.ArrayList;
import java.util.List;
@Getter
public class HS256AlgorithmProvider implements IAlgorithmProvider{

    private final SecretAlgorithm algorithm =SecretAlgorithm.HmacSHA256;
    @Override
    public List<Key> generate() {
        SecretKey secretKey = Keys.secretKeyFor(SignatureAlgorithm.HS256);
        List<Key> keys = new ArrayList<>();
        keys.add(secretKey);
        return keys;
    }

}
