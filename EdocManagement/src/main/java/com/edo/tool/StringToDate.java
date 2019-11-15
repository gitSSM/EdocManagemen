package com.edo.tool;

import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * **
 *  * 自定义日期转换类
 *  * @author Administrator
 *  *
 *  */

public class StringToDate implements Converter<String, Date> {
    //日期格式
    private String dateparam;
    public StringToDate(){

    }
    //提供构造方法注入日期格式
    public StringToDate(String dateparam){

        this.dateparam=dateparam;
    }
    //重写convert方法进行字符串对日期类型的转换
    @Override
    public Date convert(String s) {
        Date date=null;
        try {
             date = new SimpleDateFormat(dateparam).parse(s);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return date;
    }




}
