package com.goktech.olala.server.pojo.customer;

import org.springframework.stereotype.Service;

public class CtmCheck {
    private String dataWord;

    private String dataMatch;

    public String getDataWord() {
        return dataWord;
    }

    public void setDataWord(String dataWord) {
        this.dataWord = dataWord == null ? null : dataWord.trim();
    }

    public String getDataMatch() {
        return dataMatch;
    }

    public void setDataMatch(String dataMatch) {
        this.dataMatch = dataMatch == null ? null : dataMatch.trim();
    }
}