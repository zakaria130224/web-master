package com.xyz.bd.webmaster.models.common.DTOs;


import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SMS {
    String text, type = "single";
    String phone;

    public SMS(String phone, String text) {
        this.phone = phone;
        this.text = text;
    }
}
