package com.codeup.adlister.controllers;

import com.codeup.adlister.util.Password;

public class tester {
    public static void main(String[] args) {
        String hash = "$2a$12$Bn6hlBzpvIo9e7304I56mOggzhrJgfLf9hJVdJzUxIp3h3V89k/LW";
        System.out.println(hash);

        System.out.println(Password.check("codeup", hash));
    }
}
