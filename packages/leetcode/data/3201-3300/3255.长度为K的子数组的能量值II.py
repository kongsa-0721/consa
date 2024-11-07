from typing import List

"""
一次遍历 如果满足条件 cnt+=1 否则将cnt置为1
[1,2,3,5,5,6,7]
cnt => 1 2 3 1 1 2 3
"""


class Solution:
    def resultsArray(self, nums: List[int], k: int) -> List[int]:
        result = [-1] * (len(nums) - k + 1)
        cnt = 0
        for i, x in enumerate(nums):
            cnt = cnt + 1 if i == 0 or x == nums[i - 1] + 1 else 1
            if cnt >= k:
                result[i - k + 1] = x
        return result


solution = Solution()

res = solution.resultsArray(
    [1, 2, 3, 5, 5, 6, 7],
    3,
)

print(res)
