package com.example.groupweb2.security.jwt.algorithm;

import java.security.Key;
import java.util.List;

public interface IAlgorithmProvider {
    List<Key> generate() ;
    SecretAlgorithm getAlgorithm();
}
