package com.example.groupweb2.service.implement;

import com.example.groupweb2.service.IRedisService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

@Service
@RequiredArgsConstructor
public class RedisService implements IRedisService {
    private final StringRedisTemplate stringRedisTemplate;
    private static final String LOGOUT_KEY= "logout:";
    private static final String DEFAULT_KEY ="key:";

    @Override
    public void setItem(String key, String value) {
        String hashKey = getDefaultKey(key);
        stringRedisTemplate.opsForValue().set(hashKey, value, 1, TimeUnit.HOURS);
    }

    @Override
    public String getItemByKey(String key){
        key=getDefaultKey(key);
        return stringRedisTemplate.opsForValue().get(key);
    }

    @Override
    public boolean isItemSet(String key){
        return Boolean.TRUE.equals(stringRedisTemplate.hasKey(getDefaultKey(key)));
    }
    private String getDefaultKey(String key){
        return DEFAULT_KEY+key.hashCode();
    }
}
