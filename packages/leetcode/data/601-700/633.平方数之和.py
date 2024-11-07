import math

"""
取 0 和 c的平方根 [4 = 0, 2] 包含0的可能
双指针 如果值大了 减小b 值小了 加大a
等于就直接返回True
"""


class Solution:
    def judgeSquareSum(self, c: int) -> bool:
        a = 0
        b = math.floor(math.sqrt(c))
        while a <= b:
            s = a * a + b * b
            print(a, b, s)
            if s == c:
                return True
            if s < c:
                a = a + 1
            else:
                b = b - 1

        return False


solution = Solution()

cc = solution.judgeSquareSum(4)
print(cc)
