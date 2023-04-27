class Solution {
    public int[] solution(int brown, int yellow) {
        
        for(int x=3; x<=2502; x++ ){ // x: width
            for(int y=3; y<=x; y++){ // y:height
                int boundary = 2*x + 2*y -4;
                int center = (x-2)*(y-2);
                
                if(brown == boundary && yellow == center){
                    return new int[] {x, y};
                }
            }
        }
        return null;
    }
}