package com.example.groupweb2.security.jwt.secret;
import com.example.groupweb2.security.jwt.algorithm.IAlgorithmProvider;

import javax.crypto.spec.SecretKeySpec;
import java.security.Key;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.List;

public class HS256Provider extends BaseSecretProvider{
    private final String JWT = "HS256_jwt_secretKey:";

    public HS256Provider(String path, IAlgorithmProvider provider) {
        this.provider = provider;
        this.path=path;
    }
    @Override
    public List<Key> getKey() {
        var result = getKeys();
        List<Key> keys = new ArrayList<>();
        for (String i : result) {
            if (i.startsWith(JWT)) {
                i=i.substring(JWT.length());
                byte[] decoded = Base64.getDecoder().decode(i);
                keys.add(new SecretKeySpec(
                        decoded,
                        0,
                        decoded.length,
                        provider.getAlgorithm().name())
                );
                break;
            }
        }
        return keys;
    }

    @Override
    List<String> generateJWTSecretKey() {
        Key secretKey = provider.generate().getFirst();
        String encoded = Base64.getEncoder().encodeToString(secretKey.getEncoded());
        List<String> result = new ArrayList<>();
        if (encoded != null) {
            String content = JWT + encoded;
            printFile(Collections.singletonList(content));
            result.add(content);
        }
        return result;
    }
}
