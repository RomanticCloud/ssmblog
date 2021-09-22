package com.wang.utils;

import net.sf.json.JSONObject;

import java.util.HashMap;
import java.util.List;

public class LayuiUtil extends HashMap<String, Object> {

    public static LayuiUtil data(Long count, List<?> data){
        LayuiUtil r = new LayuiUtil();
        r.put("code", 0);
        r.put("msg", "");
        r.put("count", count);
        r.put("data", data);
        return r;
    }
}
