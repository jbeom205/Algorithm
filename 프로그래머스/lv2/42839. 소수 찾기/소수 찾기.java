import java.util.HashSet;
import java.util.Set;
import java.util.Iterator;


class Solution {
    
    
    private boolean isPrime(int n){
        if(n <= 1) return false;
        
        int limit = (int)Math.sqrt(n);
        
        for(int i=2;i<=limit; i++){
            if(n%i == 0) return false;
        }
        return true;
    }
    
    
    public void recursive(String comb, String others, Set<Integer> primes){
        //현재 조합을 set에 추가
        if(!comb.equals("")){
            primes.add(Integer.valueOf(comb));
        }
        //남은 숫자 중 한 개를 더해 새로운 조합을 만든다.
        for(int i=0; i<others.length(); i++){
            recursive(comb + others.charAt(i), others.substring(0,i) + others.substring(i+1), primes);
        }
    }
    
    
    public int solution(String numbers) {
        Set<Integer> primes = new HashSet<>();
        // 모든 조합의 숫자를 만듬
        recursive("",numbers,primes);
        
        // 소수의 개수 세기
        int cnt = 0;
        Iterator<Integer> it = primes.iterator();
        while(it.hasNext()){
            int n = it.next();
            if(isPrime(n)) cnt++;
        }
        //개수 반환
        return cnt;
    }
}