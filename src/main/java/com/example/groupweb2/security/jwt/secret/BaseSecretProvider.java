package com.example.groupweb2.security.jwt.secret;

import com.example.groupweb2.security.jwt.algorithm.IAlgorithmProvider;
import lombok.Getter;

import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import java.io.*;
import java.security.Key;
import java.util.ArrayList;
import java.util.List;

@Getter
public abstract class BaseSecretProvider {
    protected String path;
    IAlgorithmProvider provider;


    abstract public List<Key> getKey();

    abstract List<String> generateJWTSecretKey();

    List<String> getKeys() {
        try {
            var fileReader = new FileReader(path);
            var reader = new BufferedReader(fileReader);
            String line;
            List<String> result = new ArrayList<>();
            while ((line = reader.readLine()) != null) {
                result.add(line);
            }
            reader.close();
            fileReader.close();
            return result;
        } catch (FileNotFoundException e) {
            return generateJWTSecretKey();
        } catch (IOException e) {
            throw new RuntimeException("Unable to read the file");
        }
    }

    void printFile(List<String> contents) {
        try {
            var fileWriter = new FileWriter(path, false);
            var printer = new PrintWriter(fileWriter);
            for (String content : contents) {
                printer.println(content);
            }
            printer.close();
            fileWriter.close();
        } catch (IOException e) {
            throw new RuntimeException("Unable to write to file");
        }
    }


}
