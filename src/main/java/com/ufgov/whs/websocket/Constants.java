package com.ufgov.whs.websocket;

public enum Constants {
    SESSION_USERNAME("USERNAME");
    private String username;
    Constants(String username) {
        this.username=username;
    }
    public String value(){
        return this.username;
    }
}
