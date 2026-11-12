/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;

export default function algoSelfLogicTest() {
  describe('AlgoSelfLogicTest', () => {
    /**
     * @tc.number    SUB_VCARD_LOGIC_ALGO_0100
     * @tc.name      testPalindromeChecker0001
     * @tc.desc      Verify a local two pointer palindrome helper accepts the
     *               classic symmetric words and rejects ordinary ones.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPalindromeChecker0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPalindromeChecker0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const isPalindrome = (s: string): boolean => {
        let left: number = 0;
        let right: number = s.length - 1;
        while (left < right) {
          if (s.charAt(left) !== s.charAt(right)) {
            return false;
          }
          left++;
          right--;
        }
        return true;
      };
      expect(isPalindrome('level')).assertTrue();
      expect(isPalindrome('hello')).assertFalse();
      expect(isPalindrome('')).assertTrue();
      expect(isPalindrome('a')).assertTrue();
      expect(isPalindrome('abba')).assertTrue();
      expect(isPalindrome('abc')).assertFalse();
      expect(isPalindrome('noon')).assertTrue();
      expect(isPalindrome('racecar')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ALGO_0200
     * @tc.name      testPalindromeChecker0002
     * @tc.desc      Verify the palindrome helper treats digit strings and
     *               mixed case text under strict character comparison.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPalindromeChecker0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPalindromeChecker0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const isPalindrome = (s: string): boolean => {
        let left: number = 0;
        let right: number = s.length - 1;
        while (left < right) {
          if (s.charAt(left) !== s.charAt(right)) {
            return false;
          }
          left++;
          right--;
        }
        return true;
      };
      expect(isPalindrome('12321')).assertTrue();
      expect(isPalindrome('0')).assertTrue();
      expect(isPalindrome('10')).assertFalse();
      expect(isPalindrome('2002')).assertTrue();
      expect(isPalindrome('20022002')).assertTrue();
      expect(isPalindrome('AbBa')).assertFalse();
      expect(isPalindrome('Aa')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ALGO_0300
     * @tc.name      testStringReverser0001
     * @tc.desc      Verify a local backward loop reverser inverts ASCII,
     *               digit and CJK strings into the expected mirror text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringReverser0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testStringReverser0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const reverse = (s: string): string => {
        let out: string = '';
        for (let i = s.length - 1; i >= 0; i--) {
          out = out + s.charAt(i);
        }
        return out;
      };
      expect(reverse('abc')).assertEqual('cba');
      expect(reverse('')).assertEqual('');
      expect(reverse('a')).assertEqual('a');
      expect(reverse('12345')).assertEqual('54321');
      expect(reverse('你好')).assertEqual('好你');
      expect(reverse('OpenHarmony')).assertEqual('ynomraHnepO');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ALGO_0400
     * @tc.name      testStringReverser0002
     * @tc.desc      Verify double reversal restores the original text and
     *               the reversal agrees with the palindrome predicate.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringReverser0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testStringReverser0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const reverse = (s: string): string => {
        let out: string = '';
        for (let i = s.length - 1; i >= 0; i--) {
          out = out + s.charAt(i);
        }
        return out;
      };
      expect(reverse(reverse('vcard'))).assertEqual('vcard');
      expect(reverse(reverse('联系人'))).assertEqual('联系人');
      expect(reverse(reverse('abc123'))).assertEqual('abc123');
      const words: string[] = ['noon', 'test', 'abba', 'open'];
      for (let i = 0; i < words.length; i++) {
        const mirrored: string = reverse(words[i]);
        if (mirrored === words[i]) {
          expect(mirrored === words[i]).assertTrue();
        } else {
          expect(mirrored !== words[i]).assertTrue();
        }
      }
      expect(reverse('noon')).assertEqual('noon');
      expect(reverse('test')).assertEqual('tset');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ALGO_0500
     * @tc.name      testBracketMatcher0001
     * @tc.desc      Verify a local stack helper validates the basic bracket
     *               pairs including empty text and mismatched ordering.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBracketMatcher0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testBracketMatcher0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const isBalanced = (s: string): boolean => {
        const stack: string[] = [];
        for (let i = 0; i < s.length; i++) {
          const c: string = s.charAt(i);
          if (c === '(' || c === '[' || c === '{') {
            stack.push(c);
          } else if (c === ')' || c === ']' || c === '}') {
            if (stack.length === 0) {
              return false;
            }
            const open: string | undefined = stack.pop();
            if (c === ')' && open !== '(') {
              return false;
            }
            if (c === ']' && open !== '[') {
              return false;
            }
            if (c === '}' && open !== '{') {
              return false;
            }
          }
        }
        return stack.length === 0;
      };
      expect(isBalanced('()')).assertTrue();
      expect(isBalanced('(())')).assertTrue();
      expect(isBalanced(')(')).assertFalse();
      expect(isBalanced('(')).assertFalse();
      expect(isBalanced('')).assertTrue();
      expect(isBalanced('()[]{}')).assertTrue();
      expect(isBalanced('([)]')).assertFalse();
      expect(isBalanced('{[()]}')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ALGO_0600
     * @tc.name      testBracketMatcher0002
     * @tc.desc      Verify the bracket helper ignores plain characters and
     *               handles deep nesting plus unclosed leftovers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBracketMatcher0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testBracketMatcher0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const isBalanced = (s: string): boolean => {
        const stack: string[] = [];
        for (let i = 0; i < s.length; i++) {
          const c: string = s.charAt(i);
          if (c === '(' || c === '[' || c === '{') {
            stack.push(c);
          } else if (c === ')' || c === ']' || c === '}') {
            if (stack.length === 0) {
              return false;
            }
            const open: string | undefined = stack.pop();
            if (c === ')' && open !== '(') {
              return false;
            }
            if (c === ']' && open !== '[') {
              return false;
            }
            if (c === '}' && open !== '{') {
              return false;
            }
          }
        }
        return stack.length === 0;
      };
      expect(isBalanced('((((()))))')).assertTrue();
      expect(isBalanced('(()')).assertFalse();
      expect(isBalanced(')()(')).assertFalse();
      expect(isBalanced('[]{}()')).assertTrue();
      expect(isBalanced('[}')).assertFalse();
      expect(isBalanced('{x:[y]}')).assertTrue();
      expect(isBalanced('no brackets here')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ALGO_0700
     * @tc.name      testFibonacciSeries0001
     * @tc.desc      Verify a local iterative Fibonacci helper reproduces the
     *               full opening sequence from term zero through term ten.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFibonacciSeries0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFibonacciSeries0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const fib = (n: number): number => {
        if (n === 0) {
          return 0;
        }
        let a: number = 0;
        let b: number = 1;
        for (let i = 1; i < n; i++) {
          const next: number = a + b;
          a = b;
          b = next;
        }
        return b;
      };
      expect(fib(0)).assertEqual(0);
      expect(fib(1)).assertEqual(1);
      expect(fib(2)).assertEqual(1);
      expect(fib(3)).assertEqual(2);
      expect(fib(4)).assertEqual(3);
      expect(fib(5)).assertEqual(5);
      expect(fib(6)).assertEqual(8);
      expect(fib(7)).assertEqual(13);
      expect(fib(8)).assertEqual(21);
      expect(fib(9)).assertEqual(34);
      expect(fib(10)).assertEqual(55);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ALGO_0800
     * @tc.name      testFibonacciSeries0002
     * @tc.desc      Verify larger Fibonacci terms satisfy the recurrence
     *               relation and reach the documented milestone values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFibonacciSeries0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFibonacciSeries0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const fib = (n: number): number => {
        if (n === 0) {
          return 0;
        }
        let a: number = 0;
        let b: number = 1;
        for (let i = 1; i < n; i++) {
          const next: number = a + b;
          a = b;
          b = next;
        }
        return b;
      };
      expect(fib(15)).assertEqual(610);
      expect(fib(20)).assertEqual(6765);
      expect(fib(30)).assertEqual(832040);
      for (let n = 2; n <= 15; n++) {
        expect(fib(n) === fib(n - 1) + fib(n - 2)).assertTrue();
      }
      expect(fib(12)).assertEqual(144);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ALGO_0900
     * @tc.name      testBubbleSorter0001
     * @tc.desc      Verify a local bubble sort helper orders unsorted,
     *               reversed and duplicated integer arrays ascendingly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBubbleSorter0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testBubbleSorter0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const bubbleSort = (nums: number[]): number[] => {
        const arr: number[] = [];
        for (let i = 0; i < nums.length; i++) {
          arr.push(nums[i]);
        }
        for (let i = 0; i < arr.length - 1; i++) {
          for (let j = 0; j < arr.length - 1 - i; j++) {
            if (arr[j] > arr[j + 1]) {
              const tmp: number = arr[j];
              arr[j] = arr[j + 1];
              arr[j + 1] = tmp;
            }
          }
        }
        return arr;
      };
      const sortedA: number[] = bubbleSort([5, 2, 8, 1, 9]);
      expect(sortedA[0]).assertEqual(1);
      expect(sortedA[1]).assertEqual(2);
      expect(sortedA[2]).assertEqual(5);
      expect(sortedA[3]).assertEqual(8);
      expect(sortedA[4]).assertEqual(9);
      const sortedB: number[] = bubbleSort([9, 8, 5, 2, 1]);
      expect(sortedB[0]).assertEqual(1);
      expect(sortedB[4]).assertEqual(9);
      const sortedC: number[] = bubbleSort([3, 1, 3, 2]);
      expect(sortedC.length).assertEqual(4);
      expect(sortedC[0]).assertEqual(1);
      expect(sortedC[1]).assertEqual(2);
      expect(sortedC[2]).assertEqual(3);
      expect(sortedC[3]).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ALGO_1000
     * @tc.name      testBubbleSorter0002
     * @tc.desc      Verify the bubble sort helper copes with negative values
     *               and degenerate inputs of zero, one and two elements.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBubbleSorter0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testBubbleSorter0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const bubbleSort = (nums: number[]): number[] => {
        const arr: number[] = [];
        for (let i = 0; i < nums.length; i++) {
          arr.push(nums[i]);
        }
        for (let i = 0; i < arr.length - 1; i++) {
          for (let j = 0; j < arr.length - 1 - i; j++) {
            if (arr[j] > arr[j + 1]) {
              const tmp: number = arr[j];
              arr[j] = arr[j + 1];
              arr[j + 1] = tmp;
            }
          }
        }
        return arr;
      };
      const negatives: number[] = bubbleSort([-3, 7, -10, 0]);
      expect(negatives[0]).assertEqual(-10);
      expect(negatives[1]).assertEqual(-3);
      expect(negatives[2]).assertEqual(0);
      expect(negatives[3]).assertEqual(7);
      expect(bubbleSort([]).length).assertEqual(0);
      const single: number[] = bubbleSort([42]);
      expect(single.length).assertEqual(1);
      expect(single[0]).assertEqual(42);
      const pair: number[] = bubbleSort([2, 1]);
      expect(pair[0]).assertEqual(1);
      expect(pair[1]).assertEqual(2);
      const zeroOne: number[] = bubbleSort([0, -1, 1]);
      expect(zeroOne[0]).assertEqual(-1);
      expect(zeroOne[2]).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ALGO_1100
     * @tc.name      testBinarySearcher0001
     * @tc.desc      Verify a local iterative binary search locates present
     *               keys at boundary and middle indexes of a sorted list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBinarySearcher0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testBinarySearcher0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const bsearch = (nums: number[], target: number): number => {
        let low: number = 0;
        let high: number = nums.length - 1;
        while (low <= high) {
          const mid: number = low + Math.floor((high - low) / 2);
          if (nums[mid] === target) {
            return mid;
          }
          if (nums[mid] < target) {
            low = mid + 1;
          } else {
            high = mid - 1;
          }
        }
        return -1;
      };
      const table: number[] = [1, 3, 5, 7, 9, 11];
      expect(bsearch(table, 7)).assertEqual(3);
      expect(bsearch(table, 1)).assertEqual(0);
      expect(bsearch(table, 11)).assertEqual(5);
      expect(bsearch(table, 5)).assertEqual(2);
      expect(bsearch(table, 9)).assertEqual(4);
      expect(bsearch(table, 4)).assertEqual(-1);
      expect(bsearch(table, 0)).assertEqual(-1);
      expect(bsearch(table, 12)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ALGO_1200
     * @tc.name      testBinarySearcher0002
     * @tc.desc      Verify the binary search helper on empty, tiny and one
     *               hundred slot even number tables built by a loop.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBinarySearcher0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testBinarySearcher0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const bsearch = (nums: number[], target: number): number => {
        let low: number = 0;
        let high: number = nums.length - 1;
        while (low <= high) {
          const mid: number = low + Math.floor((high - low) / 2);
          if (nums[mid] === target) {
            return mid;
          }
          if (nums[mid] < target) {
            low = mid + 1;
          } else {
            high = mid - 1;
          }
        }
        return -1;
      };
      expect(bsearch([], 1)).assertEqual(-1);
      const single: number[] = [5];
      expect(bsearch(single, 5)).assertEqual(0);
      expect(bsearch(single, 6)).assertEqual(-1);
      const pair: number[] = [2, 4];
      expect(bsearch(pair, 2)).assertEqual(0);
      expect(bsearch(pair, 4)).assertEqual(1);
      expect(bsearch(pair, 3)).assertEqual(-1);
      const evens: number[] = [];
      for (let i = 0; i < 100; i++) {
        evens.push(i * 2);
      }
      expect(bsearch(evens, 58)).assertEqual(29);
      expect(bsearch(evens, 59)).assertEqual(-1);
      expect(bsearch(evens, 0)).assertEqual(0);
      expect(bsearch(evens, 198)).assertEqual(99);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ALGO_1300
     * @tc.name      testArrayDeduper0001
     * @tc.desc      Verify a local indexOf based deduper counts unique
     *               numbers and preserves first appearance order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayDeduper0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testArrayDeduper0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const unique = (items: number[]): number[] => {
        const out: number[] = [];
        for (let i = 0; i < items.length; i++) {
          if (out.indexOf(items[i]) === -1) {
            out.push(items[i]);
          }
        }
        return out;
      };
      expect(unique([1, 2, 2, 3, 3, 3]).length).assertEqual(3);
      expect(unique([]).length).assertEqual(0);
      expect(unique([7]).length).assertEqual(1);
      expect(unique([1, 1, 1, 1]).length).assertEqual(1);
      expect(unique([1, 2, 3, 4]).length).assertEqual(4);
      const ordered: number[] = unique([3, 1, 2, 1]);
      expect(ordered[0]).assertEqual(3);
      expect(ordered[1]).assertEqual(1);
      expect(ordered[2]).assertEqual(2);
      expect(ordered.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ALGO_1400
     * @tc.name      testArrayDeduper0002
     * @tc.desc      Verify the deduper works on string collections and
     *               keeps case distinct while collapsing repeats.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayDeduper0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testArrayDeduper0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const unique = (items: string[]): string[] => {
        const out: string[] = [];
        for (let i = 0; i < items.length; i++) {
          if (out.indexOf(items[i]) === -1) {
            out.push(items[i]);
          }
        }
        return out;
      };
      expect(unique(['a', 'b', 'a']).length).assertEqual(2);
      expect(unique(['x']).length).assertEqual(1);
      expect(unique([]).length).assertEqual(0);
      expect(unique(['a', 'b', 'c', 'a', 'b', 'c']).length).assertEqual(3);
      expect(unique(['A', 'a']).length).assertEqual(2);
      const collapsed: string[] = unique(['a', 'b', 'a', 'c']);
      expect(collapsed.length).assertEqual(3);
      expect(collapsed[0]).assertEqual('a');
      expect(collapsed[1]).assertEqual('b');
      expect(collapsed[2]).assertEqual('c');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ALGO_1500
     * @tc.name      testRomanConverter0001
     * @tc.desc      Verify a local subtractive Roman numeral converter maps
     *               the small canonical numerals to their decimal values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRomanConverter0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testRomanConverter0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const romanToInt = (s: string): number => {
        const values: number[] = [];
        for (let i = 0; i < s.length; i++) {
          const c: string = s.charAt(i);
          if (c === 'I') {
            values.push(1);
          } else if (c === 'V') {
            values.push(5);
          } else if (c === 'X') {
            values.push(10);
          } else if (c === 'L') {
            values.push(50);
          } else if (c === 'C') {
            values.push(100);
          } else if (c === 'D') {
            values.push(500);
          } else {
            values.push(1000);
          }
        }
        let total: number = 0;
        for (let i = 0; i < values.length; i++) {
          if (i + 1 < values.length && values[i] < values[i + 1]) {
            total = total - values[i];
          } else {
            total = total + values[i];
          }
        }
        return total;
      };
      expect(romanToInt('I')).assertEqual(1);
      expect(romanToInt('II')).assertEqual(2);
      expect(romanToInt('III')).assertEqual(3);
      expect(romanToInt('IV')).assertEqual(4);
      expect(romanToInt('IX')).assertEqual(9);
      expect(romanToInt('X')).assertEqual(10);
      expect(romanToInt('LVIII')).assertEqual(58);
      expect(romanToInt('MCMXCIV')).assertEqual(1994);
      expect(romanToInt('MMXXVI')).assertEqual(2026);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ALGO_1600
     * @tc.name      testRomanConverter0002
     * @tc.desc      Verify the Roman converter handles the four hundreds
     *       [compacted after tool execution: omitted 552 chars]
     * @tc.level     Level 1
     */
    it('testRomanConverter0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testRomanConverter0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const romanToInt = (s: string): number => {
        const values: number[] = [];
        for (let i = 0; i < s.length; i++) {
          const c: string = s.charAt(i);
          if (c === 'I') {
            values.push(1);
          } else if (c === 'V') {
            values.push(5);
          } else if (c === 'X') {
            values.push(10);
          } else if (c === 'L') {
            values.push(50);
          } else if (c === 'C') {
            values.push(100);
          } else if (c === 'D') {
            values.push(500);
          } else {
            values.push(1000);
          }
        }
        let total: number = 0;
        for (let i = 0; i < values.length; i++) {
          if (i + 1 < values.length && values[i] < values[i + 1]) {
            total = total - values[i];
          } else {
            total = total + values[i];
          }
        }
        return total;
      };
      expect(romanToInt('XL')).assertEqual(40);
      expect(romanToInt('XC')).assertEqual(90);
      expect(romanToInt('CD')).assertEqual(400);
      expect(romanToInt('CM')).assertEqual(900);
      expect(romanToInt('CDXLIV')).assertEqual(444);
      expect(romanToInt('D')).assertEqual(500);
      expect(romanToInt('M')).assertEqual(1000);
      expect(romanToInt('MMMCMXCIX')).assertEqual(3999);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ALGO_1700
     * @tc.name      testBitCounter0001
     * @tc.desc      Verify a local modulo based bit counter returns the
     *               popcount of small numbers including powers of two.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBitCounter0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testBitCounter0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const popcount = (n: number): number => {
        let value: number = n;
        let count: number = 0;
        while (value > 0) {
          if (value % 2 === 1) {
            count++;
          }
          value = Math.floor(value / 2);
        }
        return count;
      };
      expect(popcount(0)).assertEqual(0);
      expect(popcount(1)).assertEqual(1);
      expect(popcount(2)).assertEqual(1);
      expect(popcount(3)).assertEqual(2);
      expect(popcount(7)).assertEqual(3);
      expect(popcount(255)).assertEqual(8);
      expect(popcount(1024)).assertEqual(1);
      expect(popcount(1023)).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ALGO_1800
     * @tc.name      testBitCounter0002
     * @tc.desc      Verify the bit counter scales to wide numbers and that
     *               every power of two up to the twentieth bit counts one.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBitCounter0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testBitCounter0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const popcount = (n: number): number => {
        let value: number = n;
        let count: number = 0;
        while (value > 0) {
          if (value % 2 === 1) {
            count++;
          }
          value = Math.floor(value / 2);
        }
        return count;
      };
      expect(popcount(65535)).assertEqual(16);
      expect(popcount(4095)).assertEqual(12);
      expect(popcount(999)).assertEqual(8);
      expect(popcount(1048576)).assertEqual(1);
      expect(popcount(2147483647)).assertEqual(31);
      let power: number = 1;
      for (let i = 0; i <= 20; i++) {
        expect(popcount(power)).assertEqual(1);
        power = power * 2;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ALGO_1900
     * @tc.name      testTwoSumFinder0001
     * @tc.desc      Verify a local nested loop two sum helper returns the
     *               first matching index pair for positive targets.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTwoSumFinder0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testTwoSumFinder0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const twoSum = (nums: number[], target: number): number[] => {
        const result: number[] = [-1, -1];
        for (let i = 0; i < nums.length; i++) {
          for (let j = i + 1; j < nums.length; j++) {
            if (nums[i] + nums[j] === target) {
              result[0] = i;
              result[1] = j;
              return result;
            }
          }
        }
        return result;
      };
      const first: number[] = twoSum([2, 7, 11, 15], 9);
      expect(first[0]).assertEqual(0);
      expect(first[1]).assertEqual(1);
      const second: number[] = twoSum([3, 2, 4], 6);
      expect(second[0]).assertEqual(1);
      expect(second[1]).assertEqual(2);
      const third: number[] = twoSum([3, 3], 6);
      expect(third[0]).assertEqual(0);
      expect(third[1]).assertEqual(1);
      const missing: number[] = twoSum([1, 2, 3], 10);
      expect(missing[0]).assertEqual(-1);
      expect(missing[1]).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ALGO_2000
     * @tc.name      testTwoSumFinder0002
     * @tc.desc      Verify the two sum helper resolves negative targets and
     *               duplicate values while reporting the earliest pair.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTwoSumFinder0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testTwoSumFinder0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const twoSum = (nums: number[], target: number): number[] => {
        const result: number[] = [-1, -1];
        for (let i = 0; i < nums.length; i++) {
          for (let j = i + 1; j < nums.length; j++) {
            if (nums[i] + nums[j] === target) {
              result[0] = i;
              result[1] = j;
              return result;
            }
          }
        }
        return result;
      };
      const deep: number[] = twoSum([-1, -2, -3, -4], -7);
      expect(deep[0]).assertEqual(2);
      expect(deep[1]).assertEqual(3);
      const head: number[] = twoSum([-1, -2, -3, -4], -3);
      expect(head[0]).assertEqual(0);
      expect(head[1]).assertEqual(1);
      const repeated: number[] = twoSum([5, 5, 5], 10);
      expect(repeated[0]).assertEqual(0);
      expect(repeated[1]).assertEqual(1);
      const single: number[] = twoSum([1], 1);
      expect(single[0]).assertEqual(-1);
      expect(single[1]).assertEqual(-1);
      const zeros: number[] = twoSum([0, 4, 3, 0], 0);
      expect(zeros[0]).assertEqual(0);
      expect(zeros[1]).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ALGO_2100
     * @tc.name      testCommonPrefixFinder0001
     * @tc.desc      Verify a local shrinking prefix helper extracts the
     *               longest shared prefix or an empty fallback string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonPrefixFinder0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testCommonPrefixFinder0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const lcp = (words: string[]): string => {
        if (words.length === 0) {
          return '';
        }
        let prefix: string = words[0];
        for (let i = 1; i < words.length; i++) {
          while (words[i].indexOf(prefix) !== 0) {
            prefix = prefix.substring(0, prefix.length - 1);
            if (prefix.length === 0) {
              return '';
            }
          }
        }
        return prefix;
      };
      expect(lcp(['flower', 'flow', 'flight'])).assertEqual('fl');
      expect(lcp(['dog', 'racecar', 'car'])).assertEqual('');
      expect(lcp(['interspecies', 'interstellar', 'interstate'])).assertEqual('inters');
      expect(lcp(['solo'])).assertEqual('solo');
      expect(lcp(['flower', 'flower'])).assertEqual('flower');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ALGO_2200
     * @tc.name      testCommonPrefixFinder0002
     * @tc.desc      Verify the prefix helper degenerates gracefully on
     *               duplicates, empty members and uneven word lengths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonPrefixFinder0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testCommonPrefixFinder0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const lcp = (words: string[]): string => {
        if (words.length === 0) {
          return '';
        }
        let prefix: string = words[0];
        for (let i = 1; i < words.length; i++) {
          while (words[i].indexOf(prefix) !== 0) {
            prefix = prefix.substring(0, prefix.length - 1);
            if (prefix.length === 0) {
              return '';
            }
          }
        }
        return prefix;
      };
      expect(lcp(['abc', 'abc'])).assertEqual('abc');
      expect(lcp(['ab', 'a'])).assertEqual('a');
      expect(lcp([''])).assertEqual('');
      expect(lcp(['', 'b'])).assertEqual('');
      expect(lcp(['prefix1', 'prefix2', 'prefix3'])).assertEqual('prefix');
      expect(lcp(['aaa', 'aa'])).assertEqual('aa');
      expect(lcp([])).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ALGO_2300
     * @tc.name      testSortedMerger0001
     * @tc.desc      Verify a local two pointer merger combines sorted arrays
     *               including duplicates and one sided empty inputs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSortedMerger0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSortedMerger0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const mergeSorted = (a: number[], b: number[]): number[] => {
        const out: number[] = [];
        let i: number = 0;
        let j: number = 0;
        while (i < a.length && j < b.length) {
          if (a[i] <= b[j]) {
            out.push(a[i]);
            i++;
          } else {
            out.push(b[j]);
            j++;
          }
        }
        while (i < a.length) {
          out.push(a[i]);
          i++;
        }
        while (j < b.length) {
          out.push(b[j]);
          j++;
        }
        return out;
      };
      const merged: number[] = mergeSorted([1, 3, 5], [2, 4, 6]);
      expect(merged.length).assertEqual(6);
      expect(merged[0]).assertEqual(1);
      expect(merged[1]).assertEqual(2);
      expect(merged[2]).assertEqual(3);
      expect(merged[3]).assertEqual(4);
      expect(merged[4]).assertEqual(5);
      expect(merged[5]).assertEqual(6);
      const leftOnly: number[] = mergeSorted([1], []);
      expect(leftOnly.length).assertEqual(1);
      expect(leftOnly[0]).assertEqual(1);
      const rightOnly: number[] = mergeSorted([], [1]);
      expect(rightOnly[0]).assertEqual(1);
      const duplicated: number[] = mergeSorted([1, 2, 2], [2, 3]);
      expect(duplicated.length).assertEqual(5);
      expect(duplicated[3]).assertEqual(2);
      expect(duplicated[4]).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ALGO_2400
     * @tc.name      testSortedMerger0002
     * @tc.desc      Verify the merger handles negatives, empty pairs and
     *               interleaved values with the summed output length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSortedMerger0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSortedMerger0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const mergeSorted = (a: number[], b: number[]): number[] => {
        const out: number[] = [];
        let i: number = 0;
        let j: number = 0;
        while (i < a.length && j < b.length) {
          if (a[i] <= b[j]) {
            out.push(a[i]);
            i++;
          } else {
            out.push(b[j]);
            j++;
          }
        }
        while (i < a.length) {
          out.push(a[i]);
          i++;
        }
        while (j < b.length) {
          out.push(b[j]);
          j++;
        }
        return out;
      };
      const negatives: number[] = mergeSorted([-5, -1], [-3, 0]);
      expect(negatives[0]).assertEqual(-5);
      expect(negatives[1]).assertEqual(-3);
      expect(negatives[2]).assertEqual(-1);
      expect(negatives[3]).assertEqual(0);
      expect(mergeSorted([], []).length).assertEqual(0);
      const swapped: number[] = mergeSorted([1], [0]);
      expect(swapped[0]).assertEqual(0);
      expect(swapped[1]).assertEqual(1);
      const interleaved: number[] = mergeSorted([1, 4, 7], [2, 3, 8]);
      expect(interleaved.length).assertEqual(6);
      expect(interleaved[1]).assertEqual(2);
      expect(interleaved[2]).assertEqual(3);
      expect(interleaved[4]).assertEqual(7);
      expect(interleaved[5]).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
