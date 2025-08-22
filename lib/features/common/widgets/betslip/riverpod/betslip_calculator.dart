class BetslipCalculator {
  static List<List<int>> generateCombinations(int n, int k) {
    List<List<int>> result = [];
    void helper(int start, List<int> current) {
      if (current.length == k) {
        result.add(List.from(current));
        return;
      }
      for (int i = start; i < n; i++) {
        current.add(i);
        helper(i + 1, current);
        current.removeLast();
      }
    }

    helper(0, []);
    return result;
  }

  static int combination(int n, int r) {
    if (r > n || r < 0) return 0;
    if (r == 0 || r == n) return 1;

    int result = 1;
    for (int i = 0; i < r; i++) {
      result = result * (n - i) ~/ (i + 1);
    }
    return result;
  }
}
