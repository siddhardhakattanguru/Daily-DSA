// Check if All A's Appears Before All B's
// 2026-11-22 | leetcode | Easy | String
//
// Compile & run:
//   g++ -std=c++17 -Wall -Wextra -O2 solution.cpp -o sol && ./sol

#include <bits/stdc++.h>
using namespace std;

class Solution {
public:
    // Once a 'b' has been seen, any later 'a' breaks the ordering.
    bool checkString(string s) {
        bool seenB = false;
        for (char c : s) {
            if (c == 'b') {
                seenB = true;
            } else if (seenB) {  // an 'a' after a 'b'
                return false;
            }
        }
        return true;
    }

    // Equivalent one-liner: the string is valid iff "ba" never appears.
    bool checkStringShort(string s) {
        return s.find("ba") == string::npos;
    }
};

int main() {
    Solution sol;

    assert(sol.checkString("aaabbb") == true);
    assert(sol.checkString("abab") == false);
    assert(sol.checkString("bbb") == true);
    assert(sol.checkString("aaa") == true);
    assert(sol.checkString("ba") == false);
    assert(sol.checkString("a") == true);
    assert(sol.checkString("b") == true);

    for (string s : {"aaabbb", "abab", "bbb", "aaa", "ba", "a", "b", "aabbab"}) {
        assert(sol.checkString(s) == sol.checkStringShort(s));
    }

    cout << "All tests passed\n";
    return 0;
}
