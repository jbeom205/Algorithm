from itertools import permutations

def check(n):
    if n == 0 or n == 1: return False
    for i in range(2, int(n**0.5)+1):
        if n%i==0: return False
    return True

def solution(numbers):
    answer = []
    num = []
    
    nums = list(numbers)
    for i in range(1, len(numbers)+1):
        num.append(list(permutations(nums, i)))
        
    num = [int(''.join(y)) for x in num for y in x]
    
    for n in num:
        if check(n):
            answer.append(n)
    # print(set(answer))
    
    return len(set(answer))