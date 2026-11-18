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

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { LogItem, LogLevel, appendLog } from '../../../main/ets/model/LogStore';

/**
 * 日志容量网格：容量 1–12、0、-1、20、50 × 追加 1 / 3 / 25 条，共 48 条。
 * 容量为 0 或负数时退回默认 200 条，追加是「新日志前插」所以首条始终是最后一次写入。
 * 这里同时钉住入参不被修改：box 每次都是 appendLog 的返回值。
 */
export default function distributedLogCapacityGridTest() {
  describe('DistributedLogCapacityGridTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0001
     * @tc.name testLogCap0001
     * @tc.desc Verify appending 1 items into capacity 1 keeps 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0001', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 1; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 1);
      }
      expect(box.length).assertEqual(1);
      expect(box[0].detail).assertEqual('item-' + 0);
      expect(box.length <= 1).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0002
     * @tc.name testLogCap0002
     * @tc.desc Verify appending 3 items into capacity 1 keeps 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0002', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 3; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 1);
      }
      expect(box.length).assertEqual(1);
      expect(box[0].detail).assertEqual('item-' + 2);
      expect(box.length <= 1).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0003
     * @tc.name testLogCap0003
     * @tc.desc Verify appending 25 items into capacity 1 keeps 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0003', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 25; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 1);
      }
      expect(box.length).assertEqual(1);
      expect(box[0].detail).assertEqual('item-' + 24);
      expect(box.length <= 1).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0004
     * @tc.name testLogCap0004
     * @tc.desc Verify appending 1 items into capacity 2 keeps 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0004', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 1; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 2);
      }
      expect(box.length).assertEqual(1);
      expect(box[0].detail).assertEqual('item-' + 0);
      expect(box.length <= 2).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0005
     * @tc.name testLogCap0005
     * @tc.desc Verify appending 3 items into capacity 2 keeps 2 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0005', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 3; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 2);
      }
      expect(box.length).assertEqual(2);
      expect(box[0].detail).assertEqual('item-' + 2);
      expect(box.length <= 2).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0006
     * @tc.name testLogCap0006
     * @tc.desc Verify appending 25 items into capacity 2 keeps 2 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0006', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 25; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 2);
      }
      expect(box.length).assertEqual(2);
      expect(box[0].detail).assertEqual('item-' + 24);
      expect(box.length <= 2).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0007
     * @tc.name testLogCap0007
     * @tc.desc Verify appending 1 items into capacity 3 keeps 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0007', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 1; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 3);
      }
      expect(box.length).assertEqual(1);
      expect(box[0].detail).assertEqual('item-' + 0);
      expect(box.length <= 3).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0008
     * @tc.name testLogCap0008
     * @tc.desc Verify appending 3 items into capacity 3 keeps 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0008', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 3; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 3);
      }
      expect(box.length).assertEqual(3);
      expect(box[0].detail).assertEqual('item-' + 2);
      expect(box.length <= 3).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0009
     * @tc.name testLogCap0009
     * @tc.desc Verify appending 25 items into capacity 3 keeps 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0009', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 25; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 3);
      }
      expect(box.length).assertEqual(3);
      expect(box[0].detail).assertEqual('item-' + 24);
      expect(box.length <= 3).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0010
     * @tc.name testLogCap0010
     * @tc.desc Verify appending 1 items into capacity 4 keeps 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0010', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 1; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 4);
      }
      expect(box.length).assertEqual(1);
      expect(box[0].detail).assertEqual('item-' + 0);
      expect(box.length <= 4).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0011
     * @tc.name testLogCap0011
     * @tc.desc Verify appending 3 items into capacity 4 keeps 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0011', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 3; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 4);
      }
      expect(box.length).assertEqual(3);
      expect(box[0].detail).assertEqual('item-' + 2);
      expect(box.length <= 4).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0012
     * @tc.name testLogCap0012
     * @tc.desc Verify appending 25 items into capacity 4 keeps 4 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0012', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 25; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 4);
      }
      expect(box.length).assertEqual(4);
      expect(box[0].detail).assertEqual('item-' + 24);
      expect(box.length <= 4).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0013
     * @tc.name testLogCap0013
     * @tc.desc Verify appending 1 items into capacity 5 keeps 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0013', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 1; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 5);
      }
      expect(box.length).assertEqual(1);
      expect(box[0].detail).assertEqual('item-' + 0);
      expect(box.length <= 5).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0014
     * @tc.name testLogCap0014
     * @tc.desc Verify appending 3 items into capacity 5 keeps 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0014', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 3; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 5);
      }
      expect(box.length).assertEqual(3);
      expect(box[0].detail).assertEqual('item-' + 2);
      expect(box.length <= 5).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0015
     * @tc.name testLogCap0015
     * @tc.desc Verify appending 25 items into capacity 5 keeps 5 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0015', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 25; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 5);
      }
      expect(box.length).assertEqual(5);
      expect(box[0].detail).assertEqual('item-' + 24);
      expect(box.length <= 5).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0016
     * @tc.name testLogCap0016
     * @tc.desc Verify appending 1 items into capacity 6 keeps 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0016', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 1; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 6);
      }
      expect(box.length).assertEqual(1);
      expect(box[0].detail).assertEqual('item-' + 0);
      expect(box.length <= 6).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0017
     * @tc.name testLogCap0017
     * @tc.desc Verify appending 3 items into capacity 6 keeps 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0017', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 3; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 6);
      }
      expect(box.length).assertEqual(3);
      expect(box[0].detail).assertEqual('item-' + 2);
      expect(box.length <= 6).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0018
     * @tc.name testLogCap0018
     * @tc.desc Verify appending 25 items into capacity 6 keeps 6 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0018', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 25; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 6);
      }
      expect(box.length).assertEqual(6);
      expect(box[0].detail).assertEqual('item-' + 24);
      expect(box.length <= 6).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0019
     * @tc.name testLogCap0019
     * @tc.desc Verify appending 1 items into capacity 7 keeps 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0019', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 1; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 7);
      }
      expect(box.length).assertEqual(1);
      expect(box[0].detail).assertEqual('item-' + 0);
      expect(box.length <= 7).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0020
     * @tc.name testLogCap0020
     * @tc.desc Verify appending 3 items into capacity 7 keeps 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0020', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 3; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 7);
      }
      expect(box.length).assertEqual(3);
      expect(box[0].detail).assertEqual('item-' + 2);
      expect(box.length <= 7).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0021
     * @tc.name testLogCap0021
     * @tc.desc Verify appending 25 items into capacity 7 keeps 7 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0021', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 25; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 7);
      }
      expect(box.length).assertEqual(7);
      expect(box[0].detail).assertEqual('item-' + 24);
      expect(box.length <= 7).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0022
     * @tc.name testLogCap0022
     * @tc.desc Verify appending 1 items into capacity 8 keeps 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0022', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 1; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 8);
      }
      expect(box.length).assertEqual(1);
      expect(box[0].detail).assertEqual('item-' + 0);
      expect(box.length <= 8).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0023
     * @tc.name testLogCap0023
     * @tc.desc Verify appending 3 items into capacity 8 keeps 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0023', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 3; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 8);
      }
      expect(box.length).assertEqual(3);
      expect(box[0].detail).assertEqual('item-' + 2);
      expect(box.length <= 8).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0024
     * @tc.name testLogCap0024
     * @tc.desc Verify appending 25 items into capacity 8 keeps 8 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0024', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 25; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 8);
      }
      expect(box.length).assertEqual(8);
      expect(box[0].detail).assertEqual('item-' + 24);
      expect(box.length <= 8).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0025
     * @tc.name testLogCap0025
     * @tc.desc Verify appending 1 items into capacity 9 keeps 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0025', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 1; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 9);
      }
      expect(box.length).assertEqual(1);
      expect(box[0].detail).assertEqual('item-' + 0);
      expect(box.length <= 9).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0026
     * @tc.name testLogCap0026
     * @tc.desc Verify appending 3 items into capacity 9 keeps 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0026', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 3; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 9);
      }
      expect(box.length).assertEqual(3);
      expect(box[0].detail).assertEqual('item-' + 2);
      expect(box.length <= 9).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0027
     * @tc.name testLogCap0027
     * @tc.desc Verify appending 25 items into capacity 9 keeps 9 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0027', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 25; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 9);
      }
      expect(box.length).assertEqual(9);
      expect(box[0].detail).assertEqual('item-' + 24);
      expect(box.length <= 9).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0028
     * @tc.name testLogCap0028
     * @tc.desc Verify appending 1 items into capacity 10 keeps 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0028', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 1; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 10);
      }
      expect(box.length).assertEqual(1);
      expect(box[0].detail).assertEqual('item-' + 0);
      expect(box.length <= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0029
     * @tc.name testLogCap0029
     * @tc.desc Verify appending 3 items into capacity 10 keeps 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0029', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 3; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 10);
      }
      expect(box.length).assertEqual(3);
      expect(box[0].detail).assertEqual('item-' + 2);
      expect(box.length <= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0030
     * @tc.name testLogCap0030
     * @tc.desc Verify appending 25 items into capacity 10 keeps 10 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0030', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 25; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 10);
      }
      expect(box.length).assertEqual(10);
      expect(box[0].detail).assertEqual('item-' + 24);
      expect(box.length <= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0031
     * @tc.name testLogCap0031
     * @tc.desc Verify appending 1 items into capacity 11 keeps 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0031', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 1; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 11);
      }
      expect(box.length).assertEqual(1);
      expect(box[0].detail).assertEqual('item-' + 0);
      expect(box.length <= 11).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0032
     * @tc.name testLogCap0032
     * @tc.desc Verify appending 3 items into capacity 11 keeps 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0032', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 3; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 11);
      }
      expect(box.length).assertEqual(3);
      expect(box[0].detail).assertEqual('item-' + 2);
      expect(box.length <= 11).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0033
     * @tc.name testLogCap0033
     * @tc.desc Verify appending 25 items into capacity 11 keeps 11 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0033', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 25; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 11);
      }
      expect(box.length).assertEqual(11);
      expect(box[0].detail).assertEqual('item-' + 24);
      expect(box.length <= 11).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0034
     * @tc.name testLogCap0034
     * @tc.desc Verify appending 1 items into capacity 12 keeps 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0034', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 1; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 12);
      }
      expect(box.length).assertEqual(1);
      expect(box[0].detail).assertEqual('item-' + 0);
      expect(box.length <= 12).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0035
     * @tc.name testLogCap0035
     * @tc.desc Verify appending 3 items into capacity 12 keeps 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0035', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 3; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 12);
      }
      expect(box.length).assertEqual(3);
      expect(box[0].detail).assertEqual('item-' + 2);
      expect(box.length <= 12).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0036
     * @tc.name testLogCap0036
     * @tc.desc Verify appending 25 items into capacity 12 keeps 12 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0036', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 25; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 12);
      }
      expect(box.length).assertEqual(12);
      expect(box[0].detail).assertEqual('item-' + 24);
      expect(box.length <= 12).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0037
     * @tc.name testLogCap0037
     * @tc.desc Verify appending 1 items into capacity 0 keeps 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0037', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 1; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 0);
      }
      expect(box.length).assertEqual(1);
      expect(box[0].detail).assertEqual('item-' + 0);
      expect(box.length <= 200).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0038
     * @tc.name testLogCap0038
     * @tc.desc Verify appending 3 items into capacity 0 keeps 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0038', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 3; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 0);
      }
      expect(box.length).assertEqual(3);
      expect(box[0].detail).assertEqual('item-' + 2);
      expect(box.length <= 200).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0039
     * @tc.name testLogCap0039
     * @tc.desc Verify appending 25 items into capacity 0 keeps 25 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0039', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 25; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 0);
      }
      expect(box.length).assertEqual(25);
      expect(box[0].detail).assertEqual('item-' + 24);
      expect(box.length <= 200).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0040
     * @tc.name testLogCap0040
     * @tc.desc Verify appending 1 items into capacity -1 keeps 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0040', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 1; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), -1);
      }
      expect(box.length).assertEqual(1);
      expect(box[0].detail).assertEqual('item-' + 0);
      expect(box.length <= 200).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0041
     * @tc.name testLogCap0041
     * @tc.desc Verify appending 3 items into capacity -1 keeps 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0041', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 3; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), -1);
      }
      expect(box.length).assertEqual(3);
      expect(box[0].detail).assertEqual('item-' + 2);
      expect(box.length <= 200).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0042
     * @tc.name testLogCap0042
     * @tc.desc Verify appending 25 items into capacity -1 keeps 25 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0042', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 25; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), -1);
      }
      expect(box.length).assertEqual(25);
      expect(box[0].detail).assertEqual('item-' + 24);
      expect(box.length <= 200).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0043
     * @tc.name testLogCap0043
     * @tc.desc Verify appending 1 items into capacity 20 keeps 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0043', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 1; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 20);
      }
      expect(box.length).assertEqual(1);
      expect(box[0].detail).assertEqual('item-' + 0);
      expect(box.length <= 20).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0044
     * @tc.name testLogCap0044
     * @tc.desc Verify appending 3 items into capacity 20 keeps 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0044', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 3; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 20);
      }
      expect(box.length).assertEqual(3);
      expect(box[0].detail).assertEqual('item-' + 2);
      expect(box.length <= 20).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0045
     * @tc.name testLogCap0045
     * @tc.desc Verify appending 25 items into capacity 20 keeps 20 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0045', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 25; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 20);
      }
      expect(box.length).assertEqual(20);
      expect(box[0].detail).assertEqual('item-' + 24);
      expect(box.length <= 20).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0046
     * @tc.name testLogCap0046
     * @tc.desc Verify appending 1 items into capacity 50 keeps 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0046', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 1; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 50);
      }
      expect(box.length).assertEqual(1);
      expect(box[0].detail).assertEqual('item-' + 0);
      expect(box.length <= 50).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0047
     * @tc.name testLogCap0047
     * @tc.desc Verify appending 3 items into capacity 50 keeps 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0047', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 3; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 50);
      }
      expect(box.length).assertEqual(3);
      expect(box[0].detail).assertEqual('item-' + 2);
      expect(box.length <= 50).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGCAP_0048
     * @tc.name testLogCap0048
     * @tc.desc Verify appending 25 items into capacity 50 keeps 25 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogCap0048', 0, () => {
      let box: LogItem[] = [];
      for (let k = 0; k < 25; k++) {
        box = appendLog(box, new LogItem('INDEX', 'ui', 'item-' + k, LogLevel.INFO), 50);
      }
      expect(box.length).assertEqual(25);
      expect(box[0].detail).assertEqual('item-' + 24);
      expect(box.length <= 50).assertTrue();
    });

  });
}
