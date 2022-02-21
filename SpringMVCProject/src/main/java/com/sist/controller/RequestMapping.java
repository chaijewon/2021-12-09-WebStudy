package com.sist.controller;

import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

@Retention(RUNTIME)
@Target(METHOD) //메소드 찾기 
public @interface RequestMapping {
   // 구분자 (찾기를 쉽게) => if을 대체 
   public String value();
}
