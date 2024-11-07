from typing import List

"""
给你一个长度为 n 的整数数组 nums 和一个正整数 k 。
一个数组的 能量值 定义为：
如果 所有 元素都是依次 连续 且 上升 的，那么能量值为 最大 的元素。
否则为 -1 。
你需要求出 nums 中所有长度为 k 的 子数组 的能量值。
请你返回一个长度为 n - k + 1 的整数数组 results ，其中 results[i] 是子数组 nums[i..(i + k - 1)] 的能量值。

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
