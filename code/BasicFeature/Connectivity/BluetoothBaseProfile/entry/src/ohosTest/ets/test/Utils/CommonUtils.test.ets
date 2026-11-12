/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect } from '@ohos/hypium';
import { CommonUtils } from 'library';

/**
 * Test suite for CommonUtils.
 * @since 26.0.0
 */
export default function commonUtilsTest(): void {
  describe('CommonUtilsTest', () => {
    // ==================== different step auxiliary assist (3 cases) ====================

    /*
     * @tc.number: SUB_COMMON_UTILS_0100
     * @tc.name: testCommonUtils0001
     * @tc.desc: Resolve delay after the requested milliseconds.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testCommonUtils0001', 0, async () => {
      const start: number = Date.now();
      await CommonUtils.delay(120);
      const elapsed: number = Date.now() - start;
      expect(elapsed >= 115).assertTrue();
      expect(elapsed < 3000).assertTrue();
      expect(CommonUtils.delay(0) !== undefined).assertTrue();
    });

    /*
     * @tc.number: SUB_COMMON_UTILS_0200
     * @tc.name: testCommonUtils0002
     * @tc.desc: Resolve withTimeout when the inner promise finishes first.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testCommonUtils0002', 0, async () => {
      const value: string = await CommonUtils.withTimeout<string>(Promise.resolve<string>('done'), 2000);
      expect(value).assertEqual('done');
      const delayed: number = await CommonUtils.withTimeout<number>(CommonUtils.delay(30).then(() => 7), 2000);
      expect(delayed).assertEqual(7);
      const fast: boolean = await CommonUtils.withTimeout<boolean>(Promise.resolve<boolean>(true), 5000);
      expect(fast).assertTrue();
    });

    /*
     * @tc.number: SUB_COMMON_UTILS_0300
     * @tc.name: testCommonUtils0003
     * @tc.desc: Reject withTimeout when the inner promise exceeds the timeout.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testCommonUtils0003', 0, async () => {
      let rejected: boolean = false;
      let message: string = '';
      try {
        await CommonUtils.withTimeout<number>(CommonUtils.delay(300).then(() => 1), 40);
      } catch (err) {
        rejected = true;
        message = (err as Error).message;
      }
      expect(rejected).assertTrue();
      expect(message).assertEqual('Operation timed out after 40ms');
      expect(message.indexOf('40') >= 0).assertTrue();
    });

    // ==================== unique ID(2 cases) ====================

    /*
     * @tc.number: SUB_COMMON_UTILS_0400
     * @tc.name: testCommonUtils0004
     * @tc.desc: Generate a base36 timestamp and random part joined by a hyphen.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testCommonUtils0004', 0, () => {
      const id: string = CommonUtils.generateId();
      const separator: number = id.indexOf('-');
      expect(id.length > 5).assertTrue();
      expect(separator > 0).assertTrue();
      expect(id.indexOf('-', separator + 1)).assertEqual(-1);
      expect(separator < id.length - 1).assertTrue();
    });

    /*
     * @tc.number: SUB_COMMON_UTILS_0500
     * @tc.name: testCommonUtils0005
     * @tc.desc: Keep the timestamp prefix not later than the current moment.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testCommonUtils0005', 0, () => {
      const before: number = Date.now();
      const id: string = CommonUtils.generateId();
      const prefix: string = id.split('-')[0];
      const decoded: number = Number.parseInt(prefix, 36);
      expect(decoded <= before + 1000).assertTrue();
      expect(decoded >= before - 60000).assertTrue();
      expect(Number.isNaN(decoded)).assertFalse();
    });

    // ==================== JSON safe serialize (4 cases) ====================

    /*
     * @tc.number: SUB_COMMON_UTILS_0600
     * @tc.name: testCommonUtils0006
     * @tc.desc: Serialize plain objects and arrays into JSON text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testCommonUtils0006', 0, () => {
      expect(CommonUtils.safeStringify([1, 2, 3])).assertEqual('[1,2,3]');
      expect(CommonUtils.safeStringify(0)).assertEqual('0');
      expect(CommonUtils.safeStringify('x')).assertEqual('"x"');
      expect(CommonUtils.safeStringify(true)).assertEqual('true');
    });

    /*
     * @tc.number: SUB_COMMON_UTILS_0700
     * @tc.name: testCommonUtils0007
     * @tc.desc: Serialize a device-like record and keep the field order.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testCommonUtils0007', 0, () => {
      const record: Record<string, string | number> = { 'name': 'Headset', 'rssi': -60 };
      const text: string = CommonUtils.safeStringify(record);
      expect(text).assertEqual('{"name":"Headset","rssi":-60}');
      expect(CommonUtils.safeParse(text) !== null).assertTrue();
      expect(text.indexOf('"rssi":-60') > 0).assertTrue();
    });

    /*
     * @tc.number: SUB_COMMON_UTILS_0800
     * @tc.name: testCommonUtils0008
     * @tc.desc: Fall back to an empty object text for unserializable input.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testCommonUtils0008', 0, () => {
      const circle: ESObject = {};
      circle.self = circle;
      const text: string = CommonUtils.safeStringify(circle);
      expect(text).assertEqual('{}');
      expect(text.length).assertEqual(2);
      expect(CommonUtils.safeParse(text) === null).assertFalse();
    });

    /*
     * @tc.number: SUB_COMMON_UTILS_0900
     * @tc.name: testCommonUtils0009
     * @tc.desc: Parse valid JSON and return null for malformed JSON text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testCommonUtils0009', 0, () => {
      const parsed: ESObject = CommonUtils.safeParse('{"count":2,"ok":true}');
      expect(parsed.count).assertEqual(2);
      expect(parsed.ok).assertTrue();
      expect(CommonUtils.safeParse('not-a-json')).assertNull();
      expect(CommonUtils.safeParse('')).assertNull();
    });

    // ==================== prevent shake and section stream (3 cases) ====================

    /*
     * @tc.number: SUB_COMMON_UTILS_1000
     * @tc.name: testCommonUtils0010
     * @tc.desc: Run the debounced callback once after rapid repeated calls.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testCommonUtils0010', 0, async () => {
      let hits: number = 0;
      const invoke: () => void = CommonUtils.debounce(() => {
        hits = hits + 1;
      }, 80);
      invoke();
      invoke();
      invoke();
      expect(hits).assertEqual(0);
      await CommonUtils.delay(200);
      expect(hits).assertEqual(1);
      await CommonUtils.delay(120);
      expect(hits).assertEqual(1);
    });

    /*
     * @tc.number: SUB_COMMON_UTILS_1100
     * @tc.name: testCommonUtils0011
     * @tc.desc: Restart the debounce window when calls are spaced beyond the delay.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testCommonUtils0011', 0, async () => {
      let hits: number = 0;
      const invoke: () => void = CommonUtils.debounce(() => {
        hits = hits + 1;
      }, 60);
      invoke();
      await CommonUtils.delay(150);
      invoke();
      await CommonUtils.delay(150);
      expect(hits).assertEqual(2);
      expect(CommonUtils.debounce(() => {
        hits = hits + 1;
      }, 10) !== undefined).assertTrue();
      await CommonUtils.delay(80);
      expect(hits).assertEqual(2);
    });

    /*
     * @tc.number: SUB_COMMON_UTILS_1200
     * @tc.name: testCommonUtils0012
     * @tc.desc: Run the throttled callback at most once per interval.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testCommonUtils0012', 0, async () => {
      let hits: number = 0;
      const invoke: () => void = CommonUtils.throttle(() => {
        hits = hits + 1;
      }, 3000);
      invoke();
      expect(hits).assertEqual(1);
      invoke();
      invoke();
      expect(hits).assertEqual(1);
      await CommonUtils.delay(30);
      expect(hits).assertEqual(1);
    });

    // ==================== weight try (2 cases) ====================

    /*
     * @tc.number: SUB_COMMON_UTILS_1300
     * @tc.name: testCommonUtils0013
     * @tc.desc: Retry a failing task until it succeeds within the limit.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testCommonUtils0013', 0, async () => {
      let attempts: number = 0;
      const value: string = await CommonUtils.retryAsync<string>(() => {
        attempts = attempts + 1;
        if (attempts < 3) {
          return Promise.reject<string>(new Error('transient'));
        }
        return Promise.resolve<string>('ok');
      }, 3, 10);
      expect(value).assertEqual('ok');
      expect(attempts).assertEqual(3);
      expect(attempts <= 4).assertTrue();
    });

    /*
     * @tc.number: SUB_COMMON_UTILS_1400
     * @tc.name: testCommonUtils0014
     * @tc.desc: Throw the last error after exhausting the retry budget.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testCommonUtils0014', 0, async () => {
      let attempts: number = 0;
      let message: string = '';
      try {
        await CommonUtils.retryAsync<number>(() => {
          attempts = attempts + 1;
          return Promise.reject<number>(new Error('always fails'));
        }, 2, 10);
      } catch (err) {
        message = (err as Error).message;
      }
      expect(message).assertEqual('always fails');
      expect(attempts).assertEqual(3);
      expect(attempts > 1).assertTrue();
    });

    // ==================== array remove weight and divide block (4 cases) ====================

    /*
     * @tc.number: SUB_COMMON_UTILS_1500
     * @tc.name: testCommonUtils0015
     * @tc.desc: Remove duplicate numbers while keeping the first occurrence order.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testCommonUtils0015', 0, () => {
      const result: number[] = CommonUtils.unique<number>([3, 1, 3, 2, 1, 3]);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(2);
    });

    /*
     * @tc.number: SUB_COMMON_UTILS_1600
     * @tc.name: testCommonUtils0016
     * @tc.desc: Deduplicate objects by their JSON shape and keep an empty array empty.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testCommonUtils0016', 0, () => {
      const items: string[] = CommonUtils.unique<string>(['a', 'a', 'b']);
      expect(items.length).assertEqual(2);
      expect(items[1]).assertEqual('b');
      expect(CommonUtils.unique<string>([]).length).assertEqual(0);
    });

    /*
     * @tc.number: SUB_COMMON_UTILS_1700
     * @tc.name: testCommonUtils0017
     * @tc.desc: Split a list into fixed size blocks with a shorter tail block.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testCommonUtils0017', 0, () => {
      const blocks: number[][] = CommonUtils.chunk<number>([1, 2, 3, 4, 5], 2);
      expect(blocks.length).assertEqual(3);
      expect(blocks[0].length).assertEqual(2);
      expect(blocks[1][2 - 1]).assertEqual(4);
      expect(blocks[2].length).assertEqual(1);
      expect(blocks[2][0]).assertEqual(5);
    });

    /*
     * @tc.number: SUB_COMMON_UTILS_1800
     * @tc.name: testCommonUtils0018
     * @tc.desc: Chunk a list whose size exceeds its length into one single block.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testCommonUtils0018', 0, () => {
      const blocks: string[][] = CommonUtils.chunk<string>(['a', 'b'], 10);
      expect(blocks.length).assertEqual(1);
      expect(blocks[0].length).assertEqual(2);
      expect(CommonUtils.chunk<string>([], 3).length).assertEqual(0);
    });

    // ==================== flat flat ize and divide group (3 cases) ====================

    /*
     * @tc.number: SUB_COMMON_UTILS_1900
     * @tc.name: testCommonUtils0019
     * @tc.desc: Flatten a two level list preserving element order.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testCommonUtils0019', 0, () => {
      const flat: number[] = CommonUtils.flatten<number>([[1, 2], [3], [], [4, 5]]);
      expect(flat.length).assertEqual(5);
      expect(flat[0]).assertEqual(1);
      expect(flat[2]).assertEqual(3);
      expect(flat[4]).assertEqual(5);
    });

    /*
     * @tc.number: SUB_COMMON_UTILS_2000
     * @tc.name: testCommonUtils0020
     * @tc.desc: Group items by a key function into a map of lists.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testCommonUtils0020', 0, () => {
      const names: string[] = ['Audio', 'Appliances', 'Beacon'];
      const groups: Map<string,
        string[]> = CommonUtils.groupBy<string>(names, (item: string): string => item.charAt(0));
      expect(groups.size).assertEqual(2);
      expect((groups.get('A') as string[]).length).assertEqual(2);
      expect((groups.get('B') as string[])[0]).assertEqual('Beacon');
      expect(groups.get('C') === undefined).assertTrue();
    });

    /*
     * @tc.number: SUB_COMMON_UTILS_2100
     * @tc.name: testCommonUtils0021
     * @tc.desc: Group an empty list into an empty map.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testCommonUtils0021', 0, () => {
      const groups: Map<string, number[]> = CommonUtils.groupBy<number>([], (item: number): string => `${item}`);
      expect(groups.size).assertEqual(0);
      expect(groups.has('1')).assertFalse();
      expect(groups !== undefined).assertTrue();
    });

    // ==================== sort and check index (4 cases) ====================

    /*
     * @tc.number: SUB_COMMON_UTILS_2200
     * @tc.name: testCommonUtils0022
     * @tc.desc: Sort into a new list without mutating the source list.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testCommonUtils0022', 0, () => {
      const source: number[] = [5, 1, 4];
      const sorted: number[] = CommonUtils.sortBy<number>(source, (a: number, b: number): number => a - b);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[2]).assertEqual(5);
      expect(source[0]).assertEqual(5);
      expect(sorted !== source).assertTrue();
    });

    /*
     * @tc.number: SUB_COMMON_UTILS_2300
     * @tc.name: testCommonUtils0023
     * @tc.desc: Sort text items in descending order by string comparison.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testCommonUtils0023', 0, () => {
      const sorted: string[] =
        CommonUtils.sortBy<string>(['b', 'c', 'a'], (a: string, b: string): number => b.localeCompare(a));
      expect(sorted[0]).assertEqual('c');
      expect(sorted[1]).assertEqual('b');
      expect(sorted.length).assertEqual(3);
    });

    /*
     * @tc.number: SUB_COMMON_UTILS_2400
     * @tc.name: testCommonUtils0024
     * @tc.desc: Report membership for present and absent values.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testCommonUtils0024', 0, () => {
      expect(CommonUtils.includes<number>([1, 2, 3], 2)).assertTrue();
      expect(CommonUtils.includes<number>([1, 2, 3], 9)).assertFalse();
      expect(CommonUtils.includes<string>([], 'a')).assertFalse();
      expect(CommonUtils.includes<string>(['mac'], 'mac')).assertTrue();
    });

    /*
     * @tc.number: SUB_COMMON_UTILS_2500
     * @tc.name: testCommonUtils0025
     * @tc.desc: Return undefined for the first and last item of an empty list.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testCommonUtils0025', 0, () => {
      const empty: number[] = [];
      expect(CommonUtils.first<number>(empty)).assertUndefined();
      expect(CommonUtils.last<number>(empty)).assertUndefined();
      expect(CommonUtils.first<number>([7, 8])).assertEqual(7);
      expect(CommonUtils.last<number>([7, 8])).assertEqual(8);
    });

    /*
     * @tc.number: SUB_COMMON_UTILS_2600
     * @tc.name: testCommonUtils0026
     * @tc.desc: Take the boundary elements of a single item list.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testCommonUtils0026', 0, () => {
      const single: string[] = ['only'];
      expect(CommonUtils.first<string>(single)).assertEqual('only');
      expect(CommonUtils.last<string>(single)).assertEqual('only');
      expect(single.length).assertEqual(1);
    });

    // ==================== not change amount and stable specify property (4 cases) ====================

    /*
     * @tc.number: SUB_COMMON_UTILS_2700
     * @tc.name: testCommonUtils0027
     * @tc.desc: Keep unique and chunk results independent of the input instance.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testCommonUtils0027', 0, () => {
      const source: number[] = [1, 1, 2];
      const result: number[] = CommonUtils.unique<number>(source);
      expect(result !== source).assertTrue();
      expect(source.length).assertEqual(3);
      expect(result.length).assertEqual(2);
      const blocks: number[][] = CommonUtils.chunk<number>(source, 1);
      expect(blocks.length).assertEqual(3);
      expect(blocks[0] !== source).assertTrue();
    });

    /*
     * @tc.number: SUB_COMMON_UTILS_2800
     * @tc.name: testCommonUtils0028
     * @tc.desc: Repeat calls with the same input and get equivalent results.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testCommonUtils0028', 0, () => {
      const first: string = CommonUtils.safeStringify([1, 2]);
      const second: string = CommonUtils.safeStringify([1, 2]);
      expect(first).assertEqual(second);
      expect(first).assertEqual('[1,2]');
      expect(CommonUtils.flatten<number>(CommonUtils.chunk<number>([1, 2, 3], 2)).length).assertEqual(3);
    });

    /*
     * @tc.number: SUB_COMMON_UTILS_2900
     * @tc.name: testCommonUtils0029
     * @tc.desc: Round trip a list through stringify and parse.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testCommonUtils0029', 0, () => {
      const text: string = CommonUtils.safeStringify([1, 2, 3]);
      const parsed: ESObject = CommonUtils.safeParse(text);
      expect(Array.isArray(parsed)).assertTrue();
      expect(parsed.length).assertEqual(3);
      expect(parsed[1]).assertEqual(2);
      expect(CommonUtils.safeParse(text) !== undefined).assertTrue();
    });

    /*
     * @tc.number: SUB_COMMON_UTILS_3000
     * @tc.name: testCommonUtils0030
     * @tc.desc: Handle boundary numeric inputs of delay and withTimeout.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testCommonUtils0030', 0, async () => {
      const start: number = Date.now();
      await CommonUtils.delay(0);
      expect(Date.now() - start < 1000).assertTrue();
      const immediate: number = await CommonUtils.withTimeout<number>(Promise.resolve<number>(1), 1);
      expect(immediate).assertEqual(1);
      const negativeDiff: number = Date.now() - start;
      expect(negativeDiff >= 0).assertTrue();
    });
  });
}
