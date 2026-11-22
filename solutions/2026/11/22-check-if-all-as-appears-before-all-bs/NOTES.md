# Check if All A's Appears Before All B's

- **Date:** 2026-11-22
- **Platform:** leetcode
- **Difficulty:** Easy
- **Topic:** String
- **Link:** https://leetcode.com/problems/check-if-all-as-appears-before-all-bs/

## Problem (in my words)

Given a string of only `'a'` and `'b'`, return `true` if every `'a'` comes before every `'b'`.

## Approach / Intuition

Scan left to right. The moment a `'b'` shows up, no `'a'` is allowed anymore. So keep a `seenB` flag and return `false` if an `'a'` appears after it. Equivalently, the string is valid exactly when the substring `"ba"` never occurs.

## Complexity

- Time: O(n)
- Space: O(1)

## Mistakes / Gotchas

- My first attempt did `for (auto i : s)` and then `s[i]`. `i` is already the character (ASCII 97 or 98), so `s[i]` is an out-of-bounds read. Loop with `char c : s` and use `c` directly.
- My first logic was also backwards: I flagged on `'a'` and failed on a following `'b'`, which rejects the valid `"aaabbb"`. The flag should be set by `'b'`, and the failure triggered by a later `'a'`.
- Sanitizers (`-fsanitize=address,undefined`) would have caught the bad index immediately.

## Alternative approaches

- `s.find("ba") == string::npos` (one-liner, same complexity).
- Compare against the sorted string: `is_sorted(s.begin(), s.end())` also works since `'a' < 'b'`.

## Needs revisit?

- [ ] Yes
- [x] No
