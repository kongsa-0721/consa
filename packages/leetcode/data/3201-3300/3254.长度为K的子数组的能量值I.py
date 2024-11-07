from typing import List

"""
双循环 找出每一个数组 判断是否连续并递增
"""


class Solution:
    def resultsArray(self, nums: List[int], k: int) -> List[int]:
        result = []
        for i in range(0, len(nums) - k + 1, 1):
            buffer = nums[i : i + k]
            flag = True
            for j in range(1, k, 1):
                if buffer[j] - buffer[j - 1] == 1:
                    continue
                else:
                    flag = False
            result.append(buffer[len(buffer) - 1] if flag == True else -1)
        return result


solution = Solution()

res = solution.resultsArray(
    [1, 2, 3, 5, 5, 6, 7],
    3,
)

print(res)
