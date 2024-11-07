from typing import List

"""
已知数组有序
双指针 s>target b--; s<target a++
"""


class Solution:
    def twoSum(self, numbers: List[int], target: int) -> List[int]:
        a = 0
        b = len(numbers) - 1
        while a <= b:
            s = numbers[a] + numbers[b]
            if s == target:
                return [a + 1, b + 1]
            if s < target:
                a = a + 1
            else:
                b = b - 1
