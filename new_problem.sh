#!/usr/bin/env bash
# Scaffold a new daily C++ problem folder and append it to LOG.md.
# Usage: ./new_problem.sh "<title>" [platform=leetcode] [difficulty=Easy] [topic=General]

set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $0 \"<title>\" [platform=leetcode] [difficulty=Easy] [topic=General]"
  exit 1
fi

title="$1"
platform="${2:-leetcode}"
difficulty="${3:-Easy}"
topic="${4:-General}"

slug=$(echo "$title" | tr '[:upper:]' '[:lower:]' | tr -d "'" | sed -E "s/[^a-z0-9]+/-/g; s/^-+|-+$//g")
year=$(date +%Y)
month=$(date +%m)
day=$(date +%d)
today=$(date +%F)

dir="solutions/$year/$month/$day-$slug"
file="solution.cpp"

if [ -d "$dir" ]; then
  echo "Already exists: $dir"
  exit 1
fi

mkdir -p "$dir"

# ---------- starter C++ solution with a local test harness ----------
cat > "$dir/$file" <<EOF
// $title
// $today | $platform | $difficulty | $topic
//
// Compile & run:
//   g++ -std=c++17 -Wall -Wextra -O2 $file -o sol && ./sol

#include <bits/stdc++.h>
using namespace std;

class Solution {
public:
    // TODO: implement
};

int main() {
    Solution sol;
    (void)sol;  // remove once you use it

    // TODO: add test cases, e.g.
    // assert(sol.method(input) == expected);

    cout << "All tests passed\n";
    return 0;
}
EOF

# ---------- notes file ----------
cat > "$dir/NOTES.md" <<EOF
# $title

- **Date:** $today
- **Platform:** $platform
- **Difficulty:** $difficulty
- **Topic:** $topic
- **Link:** <paste problem URL>

## Problem (in my words)

## Approach / Intuition

## Complexity

- Time:
- Space:

## Mistakes / Gotchas

## Alternative approaches

## Needs revisit?

- [ ] Yes
- [ ] No
EOF

# ---------- running log ----------
if [ ! -f LOG.md ]; then
  cat > LOG.md <<'EOF'
# Problem Log

| Date | Problem | Platform | Difficulty | Topic | Solution |
|------|---------|----------|------------|-------|----------|
EOF
fi

echo "| $today | $title | $platform | $difficulty | $topic | [code]($dir/$file) |" >> LOG.md

echo "Created $dir"
echo "Next: cd $dir, solve it, fill in NOTES.md, then git add . && git commit && git push"
