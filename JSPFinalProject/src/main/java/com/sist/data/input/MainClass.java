package com.sist.data.input;
import java.util.Arrays;

import com.sist.vo.*;
public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        /*for(int i=1;i<=31;i++)
        {
        	DaysVO vo=new DaysVO();
        	vo.setRno(i);
        	vo.setRday(i);
        	vo.setRtime(dayTimeInput());
        	DataInputDAO.daysInsert(vo);
        }
        System.out.println("데이터 추가 완료!!");
		//String s=dayTimeInput();
        //System.out.println(s);*/
		
		//String s=foodDayInput();
		//System.out.println(s);
		for(int i=1;i<=283;i++)
		{
			FoodVO vo=new FoodVO();
			vo.setNo(i);
			vo.setReserve_days(foodDayInput());
			DataInputDAO.foodHouseUpdate(vo);
		}
		System.out.println("저장 완료!!");
	}
	
	public static String dayTimeInput()
	{
		String result="";
		int[] com=new int[(int)(Math.random()*5)+5];
		int su=0;
		boolean bCheck=false;
		for(int i=0;i<com.length;i++)
		{
			bCheck=true;
			while(bCheck)
			{
				su=(int)(Math.random()*14)+1;
				bCheck=false;
				for(int j=0;j<i;j++)
				{
					if(com[j]==su)
					{
						bCheck=true;
						break;
					}
				}
			}
			com[i]=su;
		}
		Arrays.sort(com);
		for(int i=0;i<com.length;i++)
		{
			result+=com[i]+",";
		}
		result=result.substring(0,result.lastIndexOf(","));
		return result;
	}
	public static String foodDayInput()
	{
		String result="";
		int[] com=new int[(int)(Math.random()*10)+11];
		int su=0; // 난수 저장 
		boolean bCheck=false;// 중복여부 확인 
		for(int i=0;i<com.length;i++)
		{
			bCheck=true;
			while(bCheck)
			{
				su=(int)(Math.random()*31)+1;
				bCheck=false;
				for(int j=0;j<i;j++)
				{
					if(com[j]==su)
					{
						bCheck=true; //while조건 
						break;
					}
				}
			}
			com[i]=su;
		}
		Arrays.sort(com);
		for(int i=0;i<com.length;i++)
		{
			result+=com[i]+",";
		}
		result=result.substring(0,result.lastIndexOf(","));
		return result;
	}

}












