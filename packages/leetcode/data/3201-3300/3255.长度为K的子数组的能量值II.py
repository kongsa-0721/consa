from typing import List

"""
给你一个长度为 n 的整数数组 nums 和一个正整数 k 。
一个数组的 能量值 定义为：
如果 所有 元素都是依次 连续 且 上升 的，那么能量值为 最大 的元素。
否则为 -1 。
你需要求出 nums 中所有长度为 k 的 子数组 的能量值。
请你返回一个长度为 n - k + 1 的整数数组 results ，其中 results[i] 是子数组 nums[i..(i + k - 1)] 的能量值。

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
