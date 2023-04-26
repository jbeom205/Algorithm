import java.util.*;

class Solution {
    
    private static final class State{
        public final int x;
        public final int y;
        public final int step;
        
        private State(int x, int y, int step){
            this.x = x;
            this.y = y;
            this.step = step;
        }
    }
    
    // 방향
    private static final int[] dx = {0,1,0,-1};
    private static final int[] dy = {-1,0,1,0};
    
    public int solution(int[][] maps) {
        //[y][x]
        boolean[][] isVisited = new boolean[maps.length][maps[0].length];
        
        Queue<State> queue = new LinkedList<>();
        queue.add(new State(0,0,1));
        isVisited[0][0] = true;
        
        while(!queue.isEmpty()){
            
            State state = queue.poll();
            //목표에 도달했으면 반환
            if(state.y == maps.length -1 && state.x == maps[state.y].length -1){
                return state.step;
            }
            
            for(int d=0; d<4; d++){
                int nx = state.x + dx[d];
                int ny = state.y + dy[d];
                
                // 경계 밖인지 체크
                if(ny < 0 || ny >= maps.length || nx <0 || nx >= maps[ny].length){
                    continue;
                }
                
                //벽인지 체크
                if(maps[ny][nx] != 1){
                    continue;
                }
                
                //방문했는지 체크
                if(isVisited[ny][nx] ){
                    continue;
                }
                
                isVisited[ny][nx] = true;
                queue.add(new State(nx, ny, state.step+1));
            }
        }
        
        return -1;
        
        
    }
}