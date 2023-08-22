package com.xyz.bd.webmaster.utility;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class Converter<T> {

    public T getObjectFromJson(String req) {
        return new Gson().fromJson(req, new TypeToken<T>() {
        }.getType());
    }

}
