from typing import List


"""
给你一个整数数组 nums ，判断是否存在三元组 [nums[i], nums[j], nums[k]] 满足 i != j、i != k 且 j != k ，同时还满足 nums[i] + nums[j] + nums[k] == 0 。请你返回所有和为 0 且不重复的三元组。
注意：答案中不可以包含重复的三元组。

双指针问题 需要注意 nums[i j k] 都不能重复
当[i>0 && i与i-1]相同时 continue
当前的 j与j-1 相同时 continue
当前的 k与k+1 相同时 continue
"""


class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        nums.sort()

        n = len(nums)
        if n < 3:
            return []
        if n > 0 and nums[0] > 0:
            return []

        ans = []
        for i in range(0, n - 2, 1):
            x = nums[i]
            if i > 0 and nums[i - 1] == x:
                continue
            j = i + 1
            k = n - 1
            while j < k:
                s = x + nums[j] + nums[k]
                if s > 0:
                    k = k - 1
                elif s < 0:
                    j = j + 1
                else:
                    ans.append([x, nums[j], nums[k]])
                    j = j + 1
                    k = k - 1
                    while j < k and nums[j] == nums[j - 1]:
                        j = j + 1
                    while k > j and nums[k] == nums[k + 1]:
                        k = k - 1

        return ans


solution = Solution()

cc = solution.threeSum([-1, 0, 1, 2, -1, -4])

print(cc)
