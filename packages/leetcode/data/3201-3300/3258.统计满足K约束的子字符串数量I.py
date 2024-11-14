"""
十进制 => 二进制 => bin()
1. 把所有子字符串的排列组合列出来
2. 根据规则来过滤
"""


class Solution:
    def countKConstraintSubstrings(self, s: str, k: int) -> int:
        n, cnt = len(s), 0
        for i in range(0, n, 1):
            for j in range(i + 1, n + 1, 1):
                temp = s[i:j]
                if temp.count("1") <= k or temp.count("0") <= k:
                    cnt += 1
        return cnt


solution = Solution()

cc = solution.countKConstraintSubstrings("10101", 1)

print(cc)
