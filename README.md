# Daily DSA Grind (C++)

My daily problem-solving log, all in C++. One problem a day, pushed to this repo, no excuses.

## Why this exists

- Build consistency: small daily reps beat occasional marathons.
- Keep a searchable record of how I solved things and what I learned.
- Revisit tricky problems later without re-deriving everything.

## Repo structure

```
.
├── solutions/
│   └── YYYY/
│       └── MM/
│           └── DD-problem-slug/
│               ├── solution.cpp     # the code, with a local test harness
│               └── NOTES.md         # approach, complexity, mistakes
├── LOG.md                           # running table of every problem solved
├── new_problem.sh                   # scaffolds a new day's problem
├── .gitignore
├── LICENSE
└── README.md
```

## Requirements

- A C++17 compiler (`g++` or `clang++`)
- `bash` and `git`

## Quick start

```bash
git clone <your-repo-url>
cd <repo-name>
chmod +x new_problem.sh
```

## Daily workflow

```bash
# 1. Scaffold today's problem
#    ./new_problem.sh "<title>" [platform] [difficulty] [topic]
./new_problem.sh "Check if All A's Appears Before All B's" leetcode Easy String

# 2. Solve it
cd solutions/2026/11/22-check-if-all-as-appears-before-all-bs
g++ -std=c++17 -Wall -Wextra -O2 solution.cpp -o sol && ./sol

# 3. Fill in NOTES.md, then commit and push
cd ../../../..
git add .
git commit -m "feat(leetcode): check-if-all-as-appears-before-all-bs [Easy][String]"
git push
```

Each `solution.cpp` is a standalone file with a `Solution` class (LeetCode style) and a `main()` with `assert`-based tests, so you can compile and run it locally before submitting.

## Debugging tip

For memory and out-of-bounds bugs (like indexing a string with a `char`), compile with sanitizers:

```bash
g++ -std=c++17 -g -fsanitize=address,undefined solution.cpp -o sol && ./sol
```

## Commit message convention

```
feat(<platform>): <problem-slug> [<Difficulty>][<Topic>]
fix(<platform>): <problem-slug> - <what was fixed>
docs: <what changed in notes/readme>
```

## NOTES.md template (generated automatically)

Each problem gets a notes file with:

- Problem link and statement summary
- Approach and intuition
- Time and space complexity
- Mistakes and gotchas
- Alternative approaches

## Progress

See [LOG.md](LOG.md) for the full table of solved problems.

## Tips for keeping the streak

- Solve first, optimize second. A working O(n²) beats a perfect solution you never submitted.
- Always write down what went wrong. The mistakes are the actual learning.
- Revisit anything marked "needs revisit" in NOTES.md once a week.
- If a day gets busy, do an Easy. Keeping the streak matters more than difficulty.

## License

MIT. See [LICENSE](LICENSE).
