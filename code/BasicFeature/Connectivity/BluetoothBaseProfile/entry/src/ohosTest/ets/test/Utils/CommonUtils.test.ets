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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CommonUtils } from 'library';

/**
 * Shape decoded from the flags JSON sample in testCommonUtils0009.
 */
interface ParsedFlags {
  count: number;
  ok: boolean;
}

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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0001', 'begin');
      const start: number = Date.now();
      await CommonUtils.delay(120);
      const elapsed: number = Date.now() - start;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0001',
        '#1 ' + "elapsed >= 115" + ' = ' + JSON.stringify(elapsed >= 115));
      expect(elapsed >= 115).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0001',
        '#2 ' + "elapsed < 3000" + ' = ' + JSON.stringify(elapsed < 3000));
      expect(elapsed < 3000).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0001',
        '#3 assert ' + "expect(CommonUtils.delay(0) !== undefined).assertTrue()");
      expect(CommonUtils.delay(0) !== undefined).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0001', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0002', 'begin');
      const value: string = await CommonUtils.withTimeout<string>(Promise.resolve<string>('done'), 2000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0002',
        '#1 ' + "value" + ' = ' + JSON.stringify(value));
      expect(value).assertEqual('done');
      const delayed: number = await CommonUtils.withTimeout<number>(CommonUtils.delay(30).then(() => 7), 2000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0002',
        '#2 ' + "delayed" + ' = ' + JSON.stringify(delayed));
      expect(delayed).assertEqual(7);
      const fast: boolean = await CommonUtils.withTimeout<boolean>(Promise.resolve<boolean>(true), 5000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0002',
        '#3 ' + "fast" + ' = ' + JSON.stringify(fast));
      expect(fast).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0002', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0003', 'begin');
      let rejected: boolean = false;
      let message: string = '';
      try {
        await CommonUtils.withTimeout<number>(CommonUtils.delay(300).then(() => 1), 40);
      } catch (err) {
        rejected = true;
        message = (err as Error).message;
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0003',
        '#1 ' + "rejected" + ' = ' + JSON.stringify(rejected));
      expect(rejected).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0003',
        '#2 ' + "message" + ' = ' + JSON.stringify(message));
      expect(message).assertEqual('Operation timed out after 40ms');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0003',
        '#3 assert ' + "expect(message.indexOf('40') >= 0).assertTrue()");
      expect(message.indexOf('40') >= 0).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0003', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0004', 'begin');
      const id: string = CommonUtils.generateId();
      const separator: number = id.indexOf('-');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0004',
        '#1 ' + "id.length > 5" + ' = ' + JSON.stringify(id.length > 5));
      expect(id.length > 5).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0004',
        '#2 ' + "separator > 0" + ' = ' + JSON.stringify(separator > 0));
      expect(separator > 0).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0004',
        '#3 assert ' + "expect(id.indexOf('-', separator + 1)).assertEqual(-1)");
      expect(id.indexOf('-', separator + 1)).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0004',
        '#4 ' + "separator < id.length - 1" + ' = ' + JSON.stringify(separator < id.length - 1));
      expect(separator < id.length - 1).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0004', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0005', 'begin');
      const before: number = Date.now();
      const id: string = CommonUtils.generateId();
      const prefix: string = id.split('-')[0];
      const decoded: number = Number.parseInt(prefix, 36);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0005',
        '#1 ' + "decoded <= before + 1000" + ' = ' + JSON.stringify(decoded <= before + 1000));
      expect(decoded <= before + 1000).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0005',
        '#2 ' + "decoded >= before - 60000" + ' = ' + JSON.stringify(decoded >= before - 60000));
      expect(decoded >= before - 60000).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0005',
        '#3 assert ' + "expect(Number.isNaN(decoded)).assertFalse()");
      expect(Number.isNaN(decoded)).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0005', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0006', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0006',
        '#1 assert ' + "expect(CommonUtils.safeStringify([1, 2, 3])).assertEqual('[1,2,3]')");
      expect(CommonUtils.safeStringify([1, 2, 3])).assertEqual('[1,2,3]');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0006',
        '#2 assert ' + "expect(CommonUtils.safeStringify(0)).assertEqual('0')");
      expect(CommonUtils.safeStringify(0)).assertEqual('0');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0006',
        '#3 assert ' + "expect(CommonUtils.safeStringify('x')).assertEqual('\"x\"')");
      expect(CommonUtils.safeStringify('x')).assertEqual('"x"');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0006',
        '#4 assert ' + "expect(CommonUtils.safeStringify(true)).assertEqual('true')");
      expect(CommonUtils.safeStringify(true)).assertEqual('true');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0006', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0007', 'begin');
      const record: Record<string, string | number> = { 'name': 'Headset', 'rssi': -60 };
      const text: string = CommonUtils.safeStringify(record);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0007',
        '#1 ' + "text" + ' = ' + JSON.stringify(text));
      expect(text).assertEqual('{"name":"Headset","rssi":-60}');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0007',
        '#2 assert ' + "expect(CommonUtils.safeParse<object>(text) !== null).assertTrue()");
      expect(CommonUtils.safeParse<object>(text) !== null).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0007',
        '#3 assert ' + "expect(text.indexOf('\"rssi\":-60') > 0).assertTrue()");
      expect(text.indexOf('"rssi":-60') > 0).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0007', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0008', 'begin');
      const circle: Record<string, Object> = {};
      circle['self'] = circle;
      const text: string = CommonUtils.safeStringify(circle);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0008',
        '#1 ' + "text" + ' = ' + JSON.stringify(text));
      expect(text).assertEqual('{}');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0008',
        '#2 ' + "text.length" + ' = ' + JSON.stringify(text.length));
      expect(text.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0008',
        '#3 assert ' + "expect(CommonUtils.safeParse<object>(text) === null).assertFalse()");
      expect(CommonUtils.safeParse<object>(text) === null).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0008', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0009', 'begin');
      const parsed: ParsedFlags | null = CommonUtils.safeParse<ParsedFlags>('{"count":2,"ok":true}');
      if (parsed !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testCommonUtils0009',
          '#1 ' + "parsed.count" + ' = ' + JSON.stringify(parsed.count));
        expect(parsed.count).assertEqual(2);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testCommonUtils0009',
          '#2 ' + "parsed.ok" + ' = ' + JSON.stringify(parsed.ok));
        expect(parsed.ok).assertTrue();
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0009',
        '#3 assert ' + "expect(CommonUtils.safeParse<object>('not-a-json')).assertNull()");
      expect(CommonUtils.safeParse<object>('not-a-json')).assertNull();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0009',
        '#4 assert ' + "expect(CommonUtils.safeParse<object>('')).assertNull()");
      expect(CommonUtils.safeParse<object>('')).assertNull();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0009', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0010', 'begin');
      let hits: number = 0;
      const invoke: () => void = CommonUtils.debounce(() => {
        hits = hits + 1;
      }, 80);
      invoke();
      invoke();
      invoke();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0010',
        '#1 ' + "hits" + ' = ' + JSON.stringify(hits));
      expect(hits).assertEqual(0);
      await CommonUtils.delay(200);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0010',
        '#2 ' + "hits" + ' = ' + JSON.stringify(hits));
      expect(hits).assertEqual(1);
      await CommonUtils.delay(120);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0010',
        '#3 ' + "hits" + ' = ' + JSON.stringify(hits));
      expect(hits).assertEqual(1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0010', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0011', 'begin');
      let hits: number = 0;
      const invoke: () => void = CommonUtils.debounce(() => {
        hits = hits + 1;
      }, 60);
      invoke();
      await CommonUtils.delay(150);
      invoke();
      await CommonUtils.delay(150);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0011',
        '#1 ' + "hits" + ' = ' + JSON.stringify(hits));
      expect(hits).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0011',
        '#2 assert ' + "expect(CommonUtils.debounce(() => { hits = hits + 1; }, 10) !== undefined).assertTrue()");
      expect(CommonUtils.debounce(() => {
        hits = hits + 1;
      }, 10) !== undefined).assertTrue();
      await CommonUtils.delay(80);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0011',
        '#3 ' + "hits" + ' = ' + JSON.stringify(hits));
      expect(hits).assertEqual(2);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0011', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0012', 'begin');
      let hits: number = 0;
      const invoke: () => void = CommonUtils.throttle(() => {
        hits = hits + 1;
      }, 3000);
      invoke();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0012',
        '#1 ' + "hits" + ' = ' + JSON.stringify(hits));
      expect(hits).assertEqual(1);
      invoke();
      invoke();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0012',
        '#2 ' + "hits" + ' = ' + JSON.stringify(hits));
      expect(hits).assertEqual(1);
      await CommonUtils.delay(30);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0012',
        '#3 ' + "hits" + ' = ' + JSON.stringify(hits));
      expect(hits).assertEqual(1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0012', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0013', 'begin');
      let attempts: number = 0;
      const value: string = await CommonUtils.retryAsync<string>(() => {
        attempts = attempts + 1;
        if (attempts < 3) {
          return Promise.reject<string>(new Error('transient'));
        }
        return Promise.resolve<string>('ok');
      }, 3, 10);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0013',
        '#1 ' + "value" + ' = ' + JSON.stringify(value));
      expect(value).assertEqual('ok');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0013',
        '#2 ' + "attempts" + ' = ' + JSON.stringify(attempts));
      expect(attempts).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0013',
        '#3 ' + "attempts <= 4" + ' = ' + JSON.stringify(attempts <= 4));
      expect(attempts <= 4).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0013', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0014', 'begin');
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
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0014',
        '#1 ' + "message" + ' = ' + JSON.stringify(message));
      expect(message).assertEqual('always fails');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0014',
        '#2 ' + "attempts" + ' = ' + JSON.stringify(attempts));
      expect(attempts).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0014',
        '#3 ' + "attempts > 1" + ' = ' + JSON.stringify(attempts > 1));
      expect(attempts > 1).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0014', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0015', 'begin');
      const result: number[] = CommonUtils.unique<number>([3, 1, 3, 2, 1, 3]);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0015',
        '#1 ' + "result.length" + ' = ' + JSON.stringify(result.length));
      expect(result.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0015',
        '#2 ' + "result[0]" + ' = ' + JSON.stringify(result[0]));
      expect(result[0]).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0015',
        '#3 ' + "result[1]" + ' = ' + JSON.stringify(result[1]));
      expect(result[1]).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0015',
        '#4 ' + "result[2]" + ' = ' + JSON.stringify(result[2]));
      expect(result[2]).assertEqual(2);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0015', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0016', 'begin');
      const items: string[] = CommonUtils.unique<string>(['a', 'a', 'b']);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0016',
        '#1 ' + "items.length" + ' = ' + JSON.stringify(items.length));
      expect(items.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0016',
        '#2 ' + "items[1]" + ' = ' + JSON.stringify(items[1]));
      expect(items[1]).assertEqual('b');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0016',
        '#3 assert ' + "expect(CommonUtils.unique<string>([]).length).assertEqual(0)");
      expect(CommonUtils.unique<string>([]).length).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0016', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0017', 'begin');
      const blocks: number[][] = CommonUtils.chunk<number>([1, 2, 3, 4, 5], 2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0017',
        '#1 ' + "blocks.length" + ' = ' + JSON.stringify(blocks.length));
      expect(blocks.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0017',
        '#2 ' + "blocks[0].length" + ' = ' + JSON.stringify(blocks[0].length));
      expect(blocks[0].length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0017',
        '#3 ' + "blocks[1][2 - 1]" + ' = ' + JSON.stringify(blocks[1][2 - 1]));
      expect(blocks[1][2 - 1]).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0017',
        '#4 ' + "blocks[2].length" + ' = ' + JSON.stringify(blocks[2].length));
      expect(blocks[2].length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0017',
        '#5 ' + "blocks[2][0]" + ' = ' + JSON.stringify(blocks[2][0]));
      expect(blocks[2][0]).assertEqual(5);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0017', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0018', 'begin');
      const blocks: string[][] = CommonUtils.chunk<string>(['a', 'b'], 10);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0018',
        '#1 ' + "blocks.length" + ' = ' + JSON.stringify(blocks.length));
      expect(blocks.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0018',
        '#2 ' + "blocks[0].length" + ' = ' + JSON.stringify(blocks[0].length));
      expect(blocks[0].length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0018',
        '#3 assert ' + "expect(CommonUtils.chunk<string>([], 3).length).assertEqual(0)");
      expect(CommonUtils.chunk<string>([], 3).length).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0018', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0019', 'begin');
      const flat: number[] = CommonUtils.flatten<number>([[1, 2], [3], [], [4, 5]]);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0019',
        '#1 ' + "flat.length" + ' = ' + JSON.stringify(flat.length));
      expect(flat.length).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0019',
        '#2 ' + "flat[0]" + ' = ' + JSON.stringify(flat[0]));
      expect(flat[0]).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0019',
        '#3 ' + "flat[2]" + ' = ' + JSON.stringify(flat[2]));
      expect(flat[2]).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0019',
        '#4 ' + "flat[4]" + ' = ' + JSON.stringify(flat[4]));
      expect(flat[4]).assertEqual(5);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0019', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0020', 'begin');
      const names: string[] = ['Audio', 'Appliances', 'Beacon'];
      const groups: Map<string,
        string[]> = CommonUtils.groupBy<string>(names, (item: string): string => item.charAt(0));
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0020',
        '#1 ' + "groups.size" + ' = ' + JSON.stringify(groups.size));
      expect(groups.size).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0020',
        '#2 assert ' + "expect((groups.get('A') as string[]).length).assertEqual(2)");
      expect((groups.get('A') as string[]).length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0020',
        '#3 assert ' + "expect((groups.get('B') as string[])[0]).assertEqual('Beacon')");
      expect((groups.get('B') as string[])[0]).assertEqual('Beacon');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0020',
        '#4 assert ' + "expect(groups.get('C') === undefined).assertTrue()");
      expect(groups.get('C') === undefined).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0020', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0021', 'begin');
      const groups: Map<string, number[]> = CommonUtils.groupBy<number>([], (item: number): string => `${item}`);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0021',
        '#1 ' + "groups.size" + ' = ' + JSON.stringify(groups.size));
      expect(groups.size).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0021',
        '#2 assert ' + "expect(groups.has('1')).assertFalse()");
      expect(groups.has('1')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0021',
        '#3 ' + "groups !== undefined" + ' = ' + JSON.stringify(groups !== undefined));
      expect(groups !== undefined).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0021', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0022', 'begin');
      const source: number[] = [5, 1, 4];
      const sorted: number[] = CommonUtils.sortBy<number>(source, (a: number, b: number): number => a - b);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0022',
        '#1 ' + "sorted[0]" + ' = ' + JSON.stringify(sorted[0]));
      expect(sorted[0]).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0022',
        '#2 ' + "sorted[2]" + ' = ' + JSON.stringify(sorted[2]));
      expect(sorted[2]).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0022',
        '#3 ' + "source[0]" + ' = ' + JSON.stringify(source[0]));
      expect(source[0]).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0022',
        '#4 ' + "sorted !== source" + ' = ' + JSON.stringify(sorted !== source));
      expect(sorted !== source).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0022', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0023', 'begin');
      const sorted: string[] =
        CommonUtils.sortBy<string>(['b', 'c', 'a'], (a: string, b: string): number => b.localeCompare(a));
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0023',
        '#1 ' + "sorted[0]" + ' = ' + JSON.stringify(sorted[0]));
      expect(sorted[0]).assertEqual('c');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0023',
        '#2 ' + "sorted[1]" + ' = ' + JSON.stringify(sorted[1]));
      expect(sorted[1]).assertEqual('b');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0023',
        '#3 ' + "sorted.length" + ' = ' + JSON.stringify(sorted.length));
      expect(sorted.length).assertEqual(3);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0023', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0024', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0024',
        '#1 assert ' + "expect(CommonUtils.includes<number>([1, 2, 3], 2)).assertTrue()");
      expect(CommonUtils.includes<number>([1, 2, 3], 2)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0024',
        '#2 assert ' + "expect(CommonUtils.includes<number>([1, 2, 3], 9)).assertFalse()");
      expect(CommonUtils.includes<number>([1, 2, 3], 9)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0024',
        '#3 assert ' + "expect(CommonUtils.includes<string>([], 'a')).assertFalse()");
      expect(CommonUtils.includes<string>([], 'a')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0024',
        '#4 assert ' + "expect(CommonUtils.includes<string>(['mac'], 'mac')).assertTrue()");
      expect(CommonUtils.includes<string>(['mac'], 'mac')).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0024', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0025', 'begin');
      const empty: number[] = [];
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0025',
        '#1 assert ' + "expect(CommonUtils.first<number>(empty)).assertUndefined()");
      expect(CommonUtils.first<number>(empty)).assertUndefined();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0025',
        '#2 assert ' + "expect(CommonUtils.last<number>(empty)).assertUndefined()");
      expect(CommonUtils.last<number>(empty)).assertUndefined();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0025',
        '#3 assert ' + "expect(CommonUtils.first<number>([7, 8])).assertEqual(7)");
      expect(CommonUtils.first<number>([7, 8])).assertEqual(7);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0025',
        '#4 assert ' + "expect(CommonUtils.last<number>([7, 8])).assertEqual(8)");
      expect(CommonUtils.last<number>([7, 8])).assertEqual(8);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0025', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0026', 'begin');
      const single: string[] = ['only'];
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0026',
        '#1 assert ' + "expect(CommonUtils.first<string>(single)).assertEqual('only')");
      expect(CommonUtils.first<string>(single)).assertEqual('only');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0026',
        '#2 assert ' + "expect(CommonUtils.last<string>(single)).assertEqual('only')");
      expect(CommonUtils.last<string>(single)).assertEqual('only');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0026',
        '#3 ' + "single.length" + ' = ' + JSON.stringify(single.length));
      expect(single.length).assertEqual(1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0026', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0027', 'begin');
      const source: number[] = [1, 1, 2];
      const result: number[] = CommonUtils.unique<number>(source);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0027',
        '#1 ' + "result !== source" + ' = ' + JSON.stringify(result !== source));
      expect(result !== source).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0027',
        '#2 ' + "source.length" + ' = ' + JSON.stringify(source.length));
      expect(source.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0027',
        '#3 ' + "result.length" + ' = ' + JSON.stringify(result.length));
      expect(result.length).assertEqual(2);
      const blocks: number[][] = CommonUtils.chunk<number>(source, 1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0027',
        '#4 ' + "blocks.length" + ' = ' + JSON.stringify(blocks.length));
      expect(blocks.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0027',
        '#5 ' + "blocks[0] !== source" + ' = ' + JSON.stringify(blocks[0] !== source));
      expect(blocks[0] !== source).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0027', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0028', 'begin');
      const first: string = CommonUtils.safeStringify([1, 2]);
      const second: string = CommonUtils.safeStringify([1, 2]);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0028',
        '#1 ' + "first" + ' = ' + JSON.stringify(first));
      expect(first).assertEqual(second);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0028',
        '#2 ' + "first" + ' = ' + JSON.stringify(first));
      expect(first).assertEqual('[1,2]');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0028',
        '#3 assert ' +
        "expect(CommonUtils.flatten<number>(CommonUtils.chunk<number>([1, 2, 3], 2)).length).assertEqual(3)");
      expect(CommonUtils.flatten<number>(CommonUtils.chunk<number>([1, 2, 3], 2)).length).assertEqual(3);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0028', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0029', 'begin');
      const text: string = CommonUtils.safeStringify([1, 2, 3]);
      const parsed: number[] | null = CommonUtils.safeParse<number[]>(text);
      if (parsed !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testCommonUtils0029',
          '#1 assert ' + "expect(Array.isArray(parsed)).assertTrue()");
        expect(Array.isArray(parsed)).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testCommonUtils0029',
          '#2 ' + "parsed.length" + ' = ' + JSON.stringify(parsed.length));
        expect(parsed.length).assertEqual(3);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testCommonUtils0029',
          '#3 ' + "parsed[1]" + ' = ' + JSON.stringify(parsed[1]));
        expect(parsed[1]).assertEqual(2);
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0029',
        '#4 assert ' + "expect(CommonUtils.safeParse<number[]>(text) !== undefined).assertTrue()");
      expect(CommonUtils.safeParse<number[]>(text) !== undefined).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0029', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0030', 'begin');
      const start: number = Date.now();
      await CommonUtils.delay(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0030',
        '#1 assert ' + "expect(Date.now() - start < 1000).assertTrue()");
      expect(Date.now() - start < 1000).assertTrue();
      const immediate: number = await CommonUtils.withTimeout<number>(Promise.resolve<number>(1), 1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0030',
        '#2 ' + "immediate" + ' = ' + JSON.stringify(immediate));
      expect(immediate).assertEqual(1);
      const negativeDiff: number = Date.now() - start;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testCommonUtils0030',
        '#3 ' + "negativeDiff >= 0" + ' = ' + JSON.stringify(negativeDiff >= 0));
      expect(negativeDiff >= 0).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testCommonUtils0030', 'end');
    });
  });
}
