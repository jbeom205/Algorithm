import java.util.Scanner;
import java.util.regex.*;

class Solution
{
	public static void main(String args[]) throws Exception
	{
		
		/*
		   표준입력 System.in 으로부터 스캐너를 만들어 데이터를 읽어옵니다.
		 */
		Scanner sc = new Scanner(System.in);
		int T;
		T=sc.nextInt();
		/*
		   여러 개의 테스트 케이스가 주어지므로, 각각을 처리합니다.
		*/
		int N = T+1;
        String dash = "-";
        
         String pattern369 = "[369]";
         String notDashPattern = "[^-]";
         Pattern p = Pattern.compile(pattern369);
        
		for(int i=1; i<N; i++){
            String result = "";
            String numStr = Integer.toString(i);
            Matcher m = p.matcher(numStr);
            
            if(m.find()){
                result = numStr.replaceAll(pattern369,"-").replaceAll(notDashPattern,"");
            }else{
                result = numStr;
            }
            System.out.print(result+" ");
            
         
        }
	}
}