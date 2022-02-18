package com.sist.controller;

import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

@Retention(RUNTIME)
// 저장 기간 (컴파일된 파일 언제까지 유지)
// CLASS , SOURCE (컴파일후에 사라지는 파일), RUNTIME(프로그램 종료시까지)
@Target(METHOD) // 구분 => 어노테이션은 직접 제작하는 프로그램은 없다
// 어노테이션을 이용하는 라이브러리가 많다 (MyBatis,Spring)
// Spring에서 메소드명을 지정 (X) => 프로그래머가 제작 => 구분
/*
 *     TYPE : 클래스 구분 
 *     METHOD : 메소드 구분
 *     FIELD : 멤버변수 구분 
 *     PARAMETER : 매개변수 
 *     => TYPE
 *     @
 *     public class className{
 *         => FIELD
 *         @어노테이션명
 *         BoardDAO dao;
 *         
 *         => Constructor
 *         @어노테이션명 
 *         public className()
 *         {
 *         }
 *         
 *         => METHOD
 *         @어노테이션명
 *         @RequestMapping("display1")
 *         public void display1()
 *         {
 *         }
 *         @RequestMapping("board/list.do")
 *                         =========== url주소 
 *         public void display2()
 *         {
 *         }
 *         @RequestMapping("display3")
 *         public void display3()
 *         {
 *         }
 *         => PARAMETER
 *         public void aaa(@어노테이션명 BoardDAO dao)
 *         {
 *         }
 *         어노테이션은 => 위에 있거나 , 옆에 있다 
 *     }
 *     
 */
public @interface RequestMapping {
   public String value();
}




