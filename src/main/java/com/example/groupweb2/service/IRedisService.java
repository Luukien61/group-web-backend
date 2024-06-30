package com.example.groupweb2.service;

public interface IRedisService {
    void setItem(String key, String value);
    String getItemByKey(String key);
    boolean isItemSet(String key);
}
