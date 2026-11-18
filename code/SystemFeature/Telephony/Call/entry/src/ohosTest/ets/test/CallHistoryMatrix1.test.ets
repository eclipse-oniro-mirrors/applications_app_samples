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

import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { CallHistoryModel } from '../../../main/ets/model/CallHistoryModel';
import { CallHistoryEntry } from '../../../main/ets/model/CallHistoryModel';

const DOMAIN: number = 0xF814;
const TAG: string = 'CallHistoryMatrix1';
const delegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

let caseCounter: number = 0;

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

// Breaking the JS micro-task chain every 20 cases: Hypium runs all `it` callbacks as
// promise continuations inside one native task, so a real async call is required to
// hand the main thread back to the EventHandler before THREAD_BLOCK_3S/6S fires.
async function yieldToMain(): Promise<void> {
  caseCounter++;
  if (caseCounter % 20 === 0) {
    try {
      await delegator.getCurrentTopAbility();
    } catch (error) {
      log('yield point failed');
    }
  }
}

function makeEntry(id: number, number: string, startTime: number, durationSec: number,
  direction: string): CallHistoryEntry {
  return { id: id, number: number, startTime: startTime, durationSec: durationSec, direction: direction };
}

export default function callHistoryMatrix1Test(): void {
  describe('CallHistoryMatrix1', () => {
    /**
     * @tc.number    SUB_CALL_HISTORY_0001
     * @tc.name      testAddTrim0001
     * @tc.desc      adding 3 entries with capacity 2 keeps 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddTrim0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAddTrim0001 begin');
      const model: CallHistoryModel = new CallHistoryModel(2);
      model.add(makeEntry(1, '13800138000', 0, 5, 'outgoing'));
      model.add(makeEntry(2, '13900139000', 7000, 22, 'incoming'));
      model.add(makeEntry(3, '138-0013-8000', 3000, 39, 'missed'));
      const actual: number = model.size();
      expect(actual).assertEqual(2);
      expect(model.totalDuration()).assertEqual(61);
      expect(model.lastEntry() === undefined).assertEqual(false);
      log('testAddTrim0001 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0002
     * @tc.name      testAddTrim0002
     * @tc.desc      adding 3 entries with capacity 3 keeps 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddTrim0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAddTrim0002 begin');
      const model: CallHistoryModel = new CallHistoryModel(3);
      model.add(makeEntry(1, '13800138000', 0, 5, 'outgoing'));
      model.add(makeEntry(2, '13900139000', 7000, 22, 'incoming'));
      model.add(makeEntry(3, '138-0013-8000', 3000, 39, 'missed'));
      const actual: number = model.size();
      expect(actual).assertEqual(3);
      expect(model.totalDuration()).assertEqual(66);
      expect(model.lastEntry() === undefined).assertEqual(false);
      log('testAddTrim0002 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0003
     * @tc.name      testAddTrim0003
     * @tc.desc      adding 3 entries with capacity 5 keeps 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddTrim0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAddTrim0003 begin');
      const model: CallHistoryModel = new CallHistoryModel(5);
      model.add(makeEntry(1, '13800138000', 0, 5, 'outgoing'));
      model.add(makeEntry(2, '13900139000', 7000, 22, 'incoming'));
      model.add(makeEntry(3, '138-0013-8000', 3000, 39, 'missed'));
      const actual: number = model.size();
      expect(actual).assertEqual(3);
      expect(model.totalDuration()).assertEqual(66);
      expect(model.lastEntry() === undefined).assertEqual(false);
      log('testAddTrim0003 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0004
     * @tc.name      testAddTrim0004
     * @tc.desc      adding 3 entries with capacity 10 keeps 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddTrim0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAddTrim0004 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(1, '13800138000', 0, 5, 'outgoing'));
      model.add(makeEntry(2, '13900139000', 7000, 22, 'incoming'));
      model.add(makeEntry(3, '138-0013-8000', 3000, 39, 'missed'));
      const actual: number = model.size();
      expect(actual).assertEqual(3);
      expect(model.totalDuration()).assertEqual(66);
      expect(model.lastEntry() === undefined).assertEqual(false);
      log('testAddTrim0004 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0005
     * @tc.name      testFindByNumber0005
     * @tc.desc      findByNumber(13800138000) matches 2 entries by normalized value
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFindByNumber0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFindByNumber0005 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(1, '13800138000', 0, 5, 'outgoing'));
      model.add(makeEntry(2, '13900139000', 7000, 22, 'incoming'));
      model.add(makeEntry(3, '138-0013-8000', 3000, 39, 'missed'));
      const actual: CallHistoryEntry[] = model.findByNumber('13800138000');
      expect(actual.length).assertEqual(2);
      log('testFindByNumber0005 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0006
     * @tc.name      testCountByDirection0006
     * @tc.desc      countByDirection(outgoing) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountByDirection0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountByDirection0006 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(1, '13800138000', 0, 5, 'outgoing'));
      model.add(makeEntry(2, '13900139000', 7000, 22, 'incoming'));
      model.add(makeEntry(3, '138-0013-8000', 3000, 39, 'missed'));
      const actual: number = model.countByDirection('outgoing');
      expect(actual).assertEqual(1);
      log('testCountByDirection0006 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0007
     * @tc.name      testCountByDirection0007
     * @tc.desc      countByDirection(incoming) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountByDirection0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountByDirection0007 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(1, '13800138000', 0, 5, 'outgoing'));
      model.add(makeEntry(2, '13900139000', 7000, 22, 'incoming'));
      model.add(makeEntry(3, '138-0013-8000', 3000, 39, 'missed'));
      const actual: number = model.countByDirection('incoming');
      expect(actual).assertEqual(1);
      log('testCountByDirection0007 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0008
     * @tc.name      testCountByDirection0008
     * @tc.desc      countByDirection(missed) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountByDirection0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountByDirection0008 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(1, '13800138000', 0, 5, 'outgoing'));
      model.add(makeEntry(2, '13900139000', 7000, 22, 'incoming'));
      model.add(makeEntry(3, '138-0013-8000', 3000, 39, 'missed'));
      const actual: number = model.countByDirection('missed');
      expect(actual).assertEqual(1);
      log('testCountByDirection0008 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0009
     * @tc.name      testLongestEntry0009
     * @tc.desc      longestEntry returns id 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLongestEntry0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLongestEntry0009 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(1, '13800138000', 0, 5, 'outgoing'));
      model.add(makeEntry(2, '13900139000', 7000, 22, 'incoming'));
      model.add(makeEntry(3, '138-0013-8000', 3000, 39, 'missed'));
      const actual: CallHistoryEntry | undefined = model.longestEntry();
      expect(actual === undefined).assertFalse();
      if (actual !== undefined) {
        expect(actual.id).assertEqual(3);
      }
      log('testLongestEntry0009 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0010
     * @tc.name      testNumbers0010
     * @tc.desc      numbers returns 2 unique normalized numbers
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNumbers0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNumbers0010 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(1, '13800138000', 0, 5, 'outgoing'));
      model.add(makeEntry(2, '13900139000', 7000, 22, 'incoming'));
      model.add(makeEntry(3, '138-0013-8000', 3000, 39, 'missed'));
      const actual: string[] = model.numbers();
      expect(actual.length).assertEqual(2);
      log('testNumbers0010 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0011
     * @tc.name      testRemoveById0011
     * @tc.desc      removeById(1) leaves 2 entries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRemoveById0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRemoveById0011 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(1, '13800138000', 0, 5, 'outgoing'));
      model.add(makeEntry(2, '13900139000', 7000, 22, 'incoming'));
      model.add(makeEntry(3, '138-0013-8000', 3000, 39, 'missed'));
      expect(model.removeById(1)).assertTrue();
      expect(model.removeById(1000)).assertFalse();
      expect(model.size()).assertEqual(2);
      log('testRemoveById0011 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0012
     * @tc.name      testClear0012
     * @tc.desc      clear empties the model
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testClear0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testClear0012 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(1, '13800138000', 0, 5, 'outgoing'));
      model.add(makeEntry(2, '13900139000', 7000, 22, 'incoming'));
      model.add(makeEntry(3, '138-0013-8000', 3000, 39, 'missed'));
      model.clear();
      expect(model.size()).assertEqual(0);
      expect(model.lastEntry() === undefined).assertTrue();
      log('testClear0012 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0013
     * @tc.name      testAddTrim0013
     * @tc.desc      adding 4 entries with capacity 2 keeps 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddTrim0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAddTrim0013 begin');
      const model: CallHistoryModel = new CallHistoryModel(2);
      model.add(makeEntry(11, '13900139000', 2000, 10, 'incoming'));
      model.add(makeEntry(12, '138-0013-8000', 9000, 27, 'missed'));
      model.add(makeEntry(13, '13700137000', 5000, 44, 'outgoing'));
      model.add(makeEntry(14, '13600136000', 1000, 61, 'incoming'));
      const actual: number = model.size();
      expect(actual).assertEqual(2);
      expect(model.totalDuration()).assertEqual(71);
      expect(model.lastEntry() === undefined).assertEqual(false);
      log('testAddTrim0013 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0014
     * @tc.name      testAddTrim0014
     * @tc.desc      adding 4 entries with capacity 3 keeps 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddTrim0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAddTrim0014 begin');
      const model: CallHistoryModel = new CallHistoryModel(3);
      model.add(makeEntry(11, '13900139000', 2000, 10, 'incoming'));
      model.add(makeEntry(12, '138-0013-8000', 9000, 27, 'missed'));
      model.add(makeEntry(13, '13700137000', 5000, 44, 'outgoing'));
      model.add(makeEntry(14, '13600136000', 1000, 61, 'incoming'));
      const actual: number = model.size();
      expect(actual).assertEqual(3);
      expect(model.totalDuration()).assertEqual(81);
      expect(model.lastEntry() === undefined).assertEqual(false);
      log('testAddTrim0014 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0015
     * @tc.name      testAddTrim0015
     * @tc.desc      adding 4 entries with capacity 5 keeps 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddTrim0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAddTrim0015 begin');
      const model: CallHistoryModel = new CallHistoryModel(5);
      model.add(makeEntry(11, '13900139000', 2000, 10, 'incoming'));
      model.add(makeEntry(12, '138-0013-8000', 9000, 27, 'missed'));
      model.add(makeEntry(13, '13700137000', 5000, 44, 'outgoing'));
      model.add(makeEntry(14, '13600136000', 1000, 61, 'incoming'));
      const actual: number = model.size();
      expect(actual).assertEqual(4);
      expect(model.totalDuration()).assertEqual(142);
      expect(model.lastEntry() === undefined).assertEqual(false);
      log('testAddTrim0015 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0016
     * @tc.name      testAddTrim0016
     * @tc.desc      adding 4 entries with capacity 10 keeps 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddTrim0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAddTrim0016 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(11, '13900139000', 2000, 10, 'incoming'));
      model.add(makeEntry(12, '138-0013-8000', 9000, 27, 'missed'));
      model.add(makeEntry(13, '13700137000', 5000, 44, 'outgoing'));
      model.add(makeEntry(14, '13600136000', 1000, 61, 'incoming'));
      const actual: number = model.size();
      expect(actual).assertEqual(4);
      expect(model.totalDuration()).assertEqual(142);
      expect(model.lastEntry() === undefined).assertEqual(false);
      log('testAddTrim0016 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0017
     * @tc.name      testFindByNumber0017
     * @tc.desc      findByNumber(13900139000) matches 1 entries by normalized value
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFindByNumber0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFindByNumber0017 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(11, '13900139000', 2000, 10, 'incoming'));
      model.add(makeEntry(12, '138-0013-8000', 9000, 27, 'missed'));
      model.add(makeEntry(13, '13700137000', 5000, 44, 'outgoing'));
      model.add(makeEntry(14, '13600136000', 1000, 61, 'incoming'));
      const actual: CallHistoryEntry[] = model.findByNumber('13900139000');
      expect(actual.length).assertEqual(1);
      log('testFindByNumber0017 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0018
     * @tc.name      testCountByDirection0018
     * @tc.desc      countByDirection(outgoing) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountByDirection0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountByDirection0018 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(11, '13900139000', 2000, 10, 'incoming'));
      model.add(makeEntry(12, '138-0013-8000', 9000, 27, 'missed'));
      model.add(makeEntry(13, '13700137000', 5000, 44, 'outgoing'));
      model.add(makeEntry(14, '13600136000', 1000, 61, 'incoming'));
      const actual: number = model.countByDirection('outgoing');
      expect(actual).assertEqual(1);
      log('testCountByDirection0018 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0019
     * @tc.name      testCountByDirection0019
     * @tc.desc      countByDirection(incoming) -> 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountByDirection0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountByDirection0019 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(11, '13900139000', 2000, 10, 'incoming'));
      model.add(makeEntry(12, '138-0013-8000', 9000, 27, 'missed'));
      model.add(makeEntry(13, '13700137000', 5000, 44, 'outgoing'));
      model.add(makeEntry(14, '13600136000', 1000, 61, 'incoming'));
      const actual: number = model.countByDirection('incoming');
      expect(actual).assertEqual(2);
      log('testCountByDirection0019 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0020
     * @tc.name      testCountByDirection0020
     * @tc.desc      countByDirection(missed) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountByDirection0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountByDirection0020 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(11, '13900139000', 2000, 10, 'incoming'));
      model.add(makeEntry(12, '138-0013-8000', 9000, 27, 'missed'));
      model.add(makeEntry(13, '13700137000', 5000, 44, 'outgoing'));
      model.add(makeEntry(14, '13600136000', 1000, 61, 'incoming'));
      const actual: number = model.countByDirection('missed');
      expect(actual).assertEqual(1);
      log('testCountByDirection0020 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0021
     * @tc.name      testLongestEntry0021
     * @tc.desc      longestEntry returns id 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLongestEntry0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLongestEntry0021 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(11, '13900139000', 2000, 10, 'incoming'));
      model.add(makeEntry(12, '138-0013-8000', 9000, 27, 'missed'));
      model.add(makeEntry(13, '13700137000', 5000, 44, 'outgoing'));
      model.add(makeEntry(14, '13600136000', 1000, 61, 'incoming'));
      const actual: CallHistoryEntry | undefined = model.longestEntry();
      expect(actual === undefined).assertFalse();
      if (actual !== undefined) {
        expect(actual.id).assertEqual(14);
      }
      log('testLongestEntry0021 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0022
     * @tc.name      testNumbers0022
     * @tc.desc      numbers returns 4 unique normalized numbers
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNumbers0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNumbers0022 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(11, '13900139000', 2000, 10, 'incoming'));
      model.add(makeEntry(12, '138-0013-8000', 9000, 27, 'missed'));
      model.add(makeEntry(13, '13700137000', 5000, 44, 'outgoing'));
      model.add(makeEntry(14, '13600136000', 1000, 61, 'incoming'));
      const actual: string[] = model.numbers();
      expect(actual.length).assertEqual(4);
      log('testNumbers0022 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0023
     * @tc.name      testRemoveById0023
     * @tc.desc      removeById(11) leaves 3 entries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRemoveById0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRemoveById0023 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(11, '13900139000', 2000, 10, 'incoming'));
      model.add(makeEntry(12, '138-0013-8000', 9000, 27, 'missed'));
      model.add(makeEntry(13, '13700137000', 5000, 44, 'outgoing'));
      model.add(makeEntry(14, '13600136000', 1000, 61, 'incoming'));
      expect(model.removeById(11)).assertTrue();
      expect(model.removeById(1010)).assertFalse();
      expect(model.size()).assertEqual(3);
      log('testRemoveById0023 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0024
     * @tc.name      testClear0024
     * @tc.desc      clear empties the model
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testClear0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testClear0024 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(11, '13900139000', 2000, 10, 'incoming'));
      model.add(makeEntry(12, '138-0013-8000', 9000, 27, 'missed'));
      model.add(makeEntry(13, '13700137000', 5000, 44, 'outgoing'));
      model.add(makeEntry(14, '13600136000', 1000, 61, 'incoming'));
      model.clear();
      expect(model.size()).assertEqual(0);
      expect(model.lastEntry() === undefined).assertTrue();
      log('testClear0024 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0025
     * @tc.name      testAddTrim0025
     * @tc.desc      adding 5 entries with capacity 2 keeps 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddTrim0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAddTrim0025 begin');
      const model: CallHistoryModel = new CallHistoryModel(2);
      model.add(makeEntry(21, '138-0013-8000', 4000, 15, 'missed'));
      model.add(makeEntry(22, '13700137000', 0, 32, 'outgoing'));
      model.add(makeEntry(23, '13600136000', 7000, 49, 'incoming'));
      model.add(makeEntry(24, '13500135000', 3000, 66, 'missed'));
      model.add(makeEntry(25, '13800138000', 10000, 83, 'outgoing'));
      const actual: number = model.size();
      expect(actual).assertEqual(2);
      expect(model.totalDuration()).assertEqual(132);
      expect(model.lastEntry() === undefined).assertEqual(false);
      log('testAddTrim0025 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0026
     * @tc.name      testAddTrim0026
     * @tc.desc      adding 5 entries with capacity 3 keeps 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddTrim0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAddTrim0026 begin');
      const model: CallHistoryModel = new CallHistoryModel(3);
      model.add(makeEntry(21, '138-0013-8000', 4000, 15, 'missed'));
      model.add(makeEntry(22, '13700137000', 0, 32, 'outgoing'));
      model.add(makeEntry(23, '13600136000', 7000, 49, 'incoming'));
      model.add(makeEntry(24, '13500135000', 3000, 66, 'missed'));
      model.add(makeEntry(25, '13800138000', 10000, 83, 'outgoing'));
      const actual: number = model.size();
      expect(actual).assertEqual(3);
      expect(model.totalDuration()).assertEqual(147);
      expect(model.lastEntry() === undefined).assertEqual(false);
      log('testAddTrim0026 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0027
     * @tc.name      testAddTrim0027
     * @tc.desc      adding 5 entries with capacity 5 keeps 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddTrim0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAddTrim0027 begin');
      const model: CallHistoryModel = new CallHistoryModel(5);
      model.add(makeEntry(21, '138-0013-8000', 4000, 15, 'missed'));
      model.add(makeEntry(22, '13700137000', 0, 32, 'outgoing'));
      model.add(makeEntry(23, '13600136000', 7000, 49, 'incoming'));
      model.add(makeEntry(24, '13500135000', 3000, 66, 'missed'));
      model.add(makeEntry(25, '13800138000', 10000, 83, 'outgoing'));
      const actual: number = model.size();
      expect(actual).assertEqual(5);
      expect(model.totalDuration()).assertEqual(245);
      expect(model.lastEntry() === undefined).assertEqual(false);
      log('testAddTrim0027 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0028
     * @tc.name      testAddTrim0028
     * @tc.desc      adding 5 entries with capacity 10 keeps 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddTrim0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAddTrim0028 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(21, '138-0013-8000', 4000, 15, 'missed'));
      model.add(makeEntry(22, '13700137000', 0, 32, 'outgoing'));
      model.add(makeEntry(23, '13600136000', 7000, 49, 'incoming'));
      model.add(makeEntry(24, '13500135000', 3000, 66, 'missed'));
      model.add(makeEntry(25, '13800138000', 10000, 83, 'outgoing'));
      const actual: number = model.size();
      expect(actual).assertEqual(5);
      expect(model.totalDuration()).assertEqual(245);
      expect(model.lastEntry() === undefined).assertEqual(false);
      log('testAddTrim0028 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0029
     * @tc.name      testFindByNumber0029
     * @tc.desc      findByNumber(138-0013-8000) matches 2 entries by normalized value
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFindByNumber0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFindByNumber0029 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(21, '138-0013-8000', 4000, 15, 'missed'));
      model.add(makeEntry(22, '13700137000', 0, 32, 'outgoing'));
      model.add(makeEntry(23, '13600136000', 7000, 49, 'incoming'));
      model.add(makeEntry(24, '13500135000', 3000, 66, 'missed'));
      model.add(makeEntry(25, '13800138000', 10000, 83, 'outgoing'));
      const actual: CallHistoryEntry[] = model.findByNumber('138-0013-8000');
      expect(actual.length).assertEqual(2);
      log('testFindByNumber0029 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0030
     * @tc.name      testCountByDirection0030
     * @tc.desc      countByDirection(outgoing) -> 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountByDirection0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountByDirection0030 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(21, '138-0013-8000', 4000, 15, 'missed'));
      model.add(makeEntry(22, '13700137000', 0, 32, 'outgoing'));
      model.add(makeEntry(23, '13600136000', 7000, 49, 'incoming'));
      model.add(makeEntry(24, '13500135000', 3000, 66, 'missed'));
      model.add(makeEntry(25, '13800138000', 10000, 83, 'outgoing'));
      const actual: number = model.countByDirection('outgoing');
      expect(actual).assertEqual(2);
      log('testCountByDirection0030 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0031
     * @tc.name      testCountByDirection0031
     * @tc.desc      countByDirection(incoming) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountByDirection0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountByDirection0031 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(21, '138-0013-8000', 4000, 15, 'missed'));
      model.add(makeEntry(22, '13700137000', 0, 32, 'outgoing'));
      model.add(makeEntry(23, '13600136000', 7000, 49, 'incoming'));
      model.add(makeEntry(24, '13500135000', 3000, 66, 'missed'));
      model.add(makeEntry(25, '13800138000', 10000, 83, 'outgoing'));
      const actual: number = model.countByDirection('incoming');
      expect(actual).assertEqual(1);
      log('testCountByDirection0031 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0032
     * @tc.name      testCountByDirection0032
     * @tc.desc      countByDirection(missed) -> 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountByDirection0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountByDirection0032 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(21, '138-0013-8000', 4000, 15, 'missed'));
      model.add(makeEntry(22, '13700137000', 0, 32, 'outgoing'));
      model.add(makeEntry(23, '13600136000', 7000, 49, 'incoming'));
      model.add(makeEntry(24, '13500135000', 3000, 66, 'missed'));
      model.add(makeEntry(25, '13800138000', 10000, 83, 'outgoing'));
      const actual: number = model.countByDirection('missed');
      expect(actual).assertEqual(2);
      log('testCountByDirection0032 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0033
     * @tc.name      testLongestEntry0033
     * @tc.desc      longestEntry returns id 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLongestEntry0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLongestEntry0033 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(21, '138-0013-8000', 4000, 15, 'missed'));
      model.add(makeEntry(22, '13700137000', 0, 32, 'outgoing'));
      model.add(makeEntry(23, '13600136000', 7000, 49, 'incoming'));
      model.add(makeEntry(24, '13500135000', 3000, 66, 'missed'));
      model.add(makeEntry(25, '13800138000', 10000, 83, 'outgoing'));
      const actual: CallHistoryEntry | undefined = model.longestEntry();
      expect(actual === undefined).assertFalse();
      if (actual !== undefined) {
        expect(actual.id).assertEqual(25);
      }
      log('testLongestEntry0033 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0034
     * @tc.name      testNumbers0034
     * @tc.desc      numbers returns 4 unique normalized numbers
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNumbers0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNumbers0034 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(21, '138-0013-8000', 4000, 15, 'missed'));
      model.add(makeEntry(22, '13700137000', 0, 32, 'outgoing'));
      model.add(makeEntry(23, '13600136000', 7000, 49, 'incoming'));
      model.add(makeEntry(24, '13500135000', 3000, 66, 'missed'));
      model.add(makeEntry(25, '13800138000', 10000, 83, 'outgoing'));
      const actual: string[] = model.numbers();
      expect(actual.length).assertEqual(4);
      log('testNumbers0034 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0035
     * @tc.name      testRemoveById0035
     * @tc.desc      removeById(21) leaves 4 entries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRemoveById0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRemoveById0035 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(21, '138-0013-8000', 4000, 15, 'missed'));
      model.add(makeEntry(22, '13700137000', 0, 32, 'outgoing'));
      model.add(makeEntry(23, '13600136000', 7000, 49, 'incoming'));
      model.add(makeEntry(24, '13500135000', 3000, 66, 'missed'));
      model.add(makeEntry(25, '13800138000', 10000, 83, 'outgoing'));
      expect(model.removeById(21)).assertTrue();
      expect(model.removeById(1020)).assertFalse();
      expect(model.size()).assertEqual(4);
      log('testRemoveById0035 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0036
     * @tc.name      testClear0036
     * @tc.desc      clear empties the model
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testClear0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testClear0036 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(21, '138-0013-8000', 4000, 15, 'missed'));
      model.add(makeEntry(22, '13700137000', 0, 32, 'outgoing'));
      model.add(makeEntry(23, '13600136000', 7000, 49, 'incoming'));
      model.add(makeEntry(24, '13500135000', 3000, 66, 'missed'));
      model.add(makeEntry(25, '13800138000', 10000, 83, 'outgoing'));
      model.clear();
      expect(model.size()).assertEqual(0);
      expect(model.lastEntry() === undefined).assertTrue();
      log('testClear0036 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0037
     * @tc.name      testAddTrim0037
     * @tc.desc      adding 6 entries with capacity 2 keeps 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddTrim0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAddTrim0037 begin');
      const model: CallHistoryModel = new CallHistoryModel(2);
      model.add(makeEntry(31, '13700137000', 6000, 20, 'outgoing'));
      model.add(makeEntry(32, '13600136000', 2000, 37, 'incoming'));
      model.add(makeEntry(33, '13500135000', 9000, 54, 'missed'));
      model.add(makeEntry(34, '13800138000', 5000, 71, 'outgoing'));
      model.add(makeEntry(35, '13900139000', 1000, 88, 'incoming'));
      model.add(makeEntry(36, '138-0013-8000', 8000, 15, 'missed'));
      const actual: number = model.size();
      expect(actual).assertEqual(2);
      expect(model.totalDuration()).assertEqual(69);
      expect(model.lastEntry() === undefined).assertEqual(false);
      log('testAddTrim0037 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0038
     * @tc.name      testAddTrim0038
     * @tc.desc      adding 6 entries with capacity 3 keeps 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddTrim0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAddTrim0038 begin');
      const model: CallHistoryModel = new CallHistoryModel(3);
      model.add(makeEntry(31, '13700137000', 6000, 20, 'outgoing'));
      model.add(makeEntry(32, '13600136000', 2000, 37, 'incoming'));
      model.add(makeEntry(33, '13500135000', 9000, 54, 'missed'));
      model.add(makeEntry(34, '13800138000', 5000, 71, 'outgoing'));
      model.add(makeEntry(35, '13900139000', 1000, 88, 'incoming'));
      model.add(makeEntry(36, '138-0013-8000', 8000, 15, 'missed'));
      const actual: number = model.size();
      expect(actual).assertEqual(3);
      expect(model.totalDuration()).assertEqual(89);
      expect(model.lastEntry() === undefined).assertEqual(false);
      log('testAddTrim0038 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0039
     * @tc.name      testAddTrim0039
     * @tc.desc      adding 6 entries with capacity 5 keeps 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddTrim0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAddTrim0039 begin');
      const model: CallHistoryModel = new CallHistoryModel(5);
      model.add(makeEntry(31, '13700137000', 6000, 20, 'outgoing'));
      model.add(makeEntry(32, '13600136000', 2000, 37, 'incoming'));
      model.add(makeEntry(33, '13500135000', 9000, 54, 'missed'));
      model.add(makeEntry(34, '13800138000', 5000, 71, 'outgoing'));
      model.add(makeEntry(35, '13900139000', 1000, 88, 'incoming'));
      model.add(makeEntry(36, '138-0013-8000', 8000, 15, 'missed'));
      const actual: number = model.size();
      expect(actual).assertEqual(5);
      expect(model.totalDuration()).assertEqual(197);
      expect(model.lastEntry() === undefined).assertEqual(false);
      log('testAddTrim0039 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0040
     * @tc.name      testAddTrim0040
     * @tc.desc      adding 6 entries with capacity 10 keeps 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddTrim0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAddTrim0040 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(31, '13700137000', 6000, 20, 'outgoing'));
      model.add(makeEntry(32, '13600136000', 2000, 37, 'incoming'));
      model.add(makeEntry(33, '13500135000', 9000, 54, 'missed'));
      model.add(makeEntry(34, '13800138000', 5000, 71, 'outgoing'));
      model.add(makeEntry(35, '13900139000', 1000, 88, 'incoming'));
      model.add(makeEntry(36, '138-0013-8000', 8000, 15, 'missed'));
      const actual: number = model.size();
      expect(actual).assertEqual(6);
      expect(model.totalDuration()).assertEqual(285);
      expect(model.lastEntry() === undefined).assertEqual(false);
      log('testAddTrim0040 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0041
     * @tc.name      testFindByNumber0041
     * @tc.desc      findByNumber(13700137000) matches 1 entries by normalized value
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFindByNumber0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFindByNumber0041 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(31, '13700137000', 6000, 20, 'outgoing'));
      model.add(makeEntry(32, '13600136000', 2000, 37, 'incoming'));
      model.add(makeEntry(33, '13500135000', 9000, 54, 'missed'));
      model.add(makeEntry(34, '13800138000', 5000, 71, 'outgoing'));
      model.add(makeEntry(35, '13900139000', 1000, 88, 'incoming'));
      model.add(makeEntry(36, '138-0013-8000', 8000, 15, 'missed'));
      const actual: CallHistoryEntry[] = model.findByNumber('13700137000');
      expect(actual.length).assertEqual(1);
      log('testFindByNumber0041 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0042
     * @tc.name      testCountByDirection0042
     * @tc.desc      countByDirection(outgoing) -> 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountByDirection0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountByDirection0042 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(31, '13700137000', 6000, 20, 'outgoing'));
      model.add(makeEntry(32, '13600136000', 2000, 37, 'incoming'));
      model.add(makeEntry(33, '13500135000', 9000, 54, 'missed'));
      model.add(makeEntry(34, '13800138000', 5000, 71, 'outgoing'));
      model.add(makeEntry(35, '13900139000', 1000, 88, 'incoming'));
      model.add(makeEntry(36, '138-0013-8000', 8000, 15, 'missed'));
      const actual: number = model.countByDirection('outgoing');
      expect(actual).assertEqual(2);
      log('testCountByDirection0042 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0043
     * @tc.name      testCountByDirection0043
     * @tc.desc      countByDirection(incoming) -> 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountByDirection0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountByDirection0043 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(31, '13700137000', 6000, 20, 'outgoing'));
      model.add(makeEntry(32, '13600136000', 2000, 37, 'incoming'));
      model.add(makeEntry(33, '13500135000', 9000, 54, 'missed'));
      model.add(makeEntry(34, '13800138000', 5000, 71, 'outgoing'));
      model.add(makeEntry(35, '13900139000', 1000, 88, 'incoming'));
      model.add(makeEntry(36, '138-0013-8000', 8000, 15, 'missed'));
      const actual: number = model.countByDirection('incoming');
      expect(actual).assertEqual(2);
      log('testCountByDirection0043 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0044
     * @tc.name      testCountByDirection0044
     * @tc.desc      countByDirection(missed) -> 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountByDirection0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountByDirection0044 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(31, '13700137000', 6000, 20, 'outgoing'));
      model.add(makeEntry(32, '13600136000', 2000, 37, 'incoming'));
      model.add(makeEntry(33, '13500135000', 9000, 54, 'missed'));
      model.add(makeEntry(34, '13800138000', 5000, 71, 'outgoing'));
      model.add(makeEntry(35, '13900139000', 1000, 88, 'incoming'));
      model.add(makeEntry(36, '138-0013-8000', 8000, 15, 'missed'));
      const actual: number = model.countByDirection('missed');
      expect(actual).assertEqual(2);
      log('testCountByDirection0044 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0045
     * @tc.name      testLongestEntry0045
     * @tc.desc      longestEntry returns id 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLongestEntry0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLongestEntry0045 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(31, '13700137000', 6000, 20, 'outgoing'));
      model.add(makeEntry(32, '13600136000', 2000, 37, 'incoming'));
      model.add(makeEntry(33, '13500135000', 9000, 54, 'missed'));
      model.add(makeEntry(34, '13800138000', 5000, 71, 'outgoing'));
      model.add(makeEntry(35, '13900139000', 1000, 88, 'incoming'));
      model.add(makeEntry(36, '138-0013-8000', 8000, 15, 'missed'));
      const actual: CallHistoryEntry | undefined = model.longestEntry();
      expect(actual === undefined).assertFalse();
      if (actual !== undefined) {
        expect(actual.id).assertEqual(35);
      }
      log('testLongestEntry0045 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0046
     * @tc.name      testNumbers0046
     * @tc.desc      numbers returns 5 unique normalized numbers
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNumbers0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNumbers0046 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(31, '13700137000', 6000, 20, 'outgoing'));
      model.add(makeEntry(32, '13600136000', 2000, 37, 'incoming'));
      model.add(makeEntry(33, '13500135000', 9000, 54, 'missed'));
      model.add(makeEntry(34, '13800138000', 5000, 71, 'outgoing'));
      model.add(makeEntry(35, '13900139000', 1000, 88, 'incoming'));
      model.add(makeEntry(36, '138-0013-8000', 8000, 15, 'missed'));
      const actual: string[] = model.numbers();
      expect(actual.length).assertEqual(5);
      log('testNumbers0046 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0047
     * @tc.name      testRemoveById0047
     * @tc.desc      removeById(31) leaves 5 entries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRemoveById0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRemoveById0047 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(31, '13700137000', 6000, 20, 'outgoing'));
      model.add(makeEntry(32, '13600136000', 2000, 37, 'incoming'));
      model.add(makeEntry(33, '13500135000', 9000, 54, 'missed'));
      model.add(makeEntry(34, '13800138000', 5000, 71, 'outgoing'));
      model.add(makeEntry(35, '13900139000', 1000, 88, 'incoming'));
      model.add(makeEntry(36, '138-0013-8000', 8000, 15, 'missed'));
      expect(model.removeById(31)).assertTrue();
      expect(model.removeById(1030)).assertFalse();
      expect(model.size()).assertEqual(5);
      log('testRemoveById0047 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0048
     * @tc.name      testClear0048
     * @tc.desc      clear empties the model
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testClear0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testClear0048 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(31, '13700137000', 6000, 20, 'outgoing'));
      model.add(makeEntry(32, '13600136000', 2000, 37, 'incoming'));
      model.add(makeEntry(33, '13500135000', 9000, 54, 'missed'));
      model.add(makeEntry(34, '13800138000', 5000, 71, 'outgoing'));
      model.add(makeEntry(35, '13900139000', 1000, 88, 'incoming'));
      model.add(makeEntry(36, '138-0013-8000', 8000, 15, 'missed'));
      model.clear();
      expect(model.size()).assertEqual(0);
      expect(model.lastEntry() === undefined).assertTrue();
      log('testClear0048 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0049
     * @tc.name      testAddTrim0049
     * @tc.desc      adding 7 entries with capacity 2 keeps 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddTrim0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAddTrim0049 begin');
      const model: CallHistoryModel = new CallHistoryModel(2);
      model.add(makeEntry(41, '13600136000', 8000, 25, 'incoming'));
      model.add(makeEntry(42, '13500135000', 4000, 42, 'missed'));
      model.add(makeEntry(43, '13800138000', 0, 59, 'outgoing'));
      model.add(makeEntry(44, '13900139000', 7000, 76, 'incoming'));
      model.add(makeEntry(45, '138-0013-8000', 3000, 93, 'missed'));
      model.add(makeEntry(46, '13700137000', 10000, 20, 'outgoing'));
      model.add(makeEntry(47, '13600136000', 6000, 37, 'incoming'));
      const actual: number = model.size();
      expect(actual).assertEqual(2);
      expect(model.totalDuration()).assertEqual(45);
      expect(model.lastEntry() === undefined).assertEqual(false);
      log('testAddTrim0049 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0050
     * @tc.name      testAddTrim0050
     * @tc.desc      adding 7 entries with capacity 3 keeps 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddTrim0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAddTrim0050 begin');
      const model: CallHistoryModel = new CallHistoryModel(3);
      model.add(makeEntry(41, '13600136000', 8000, 25, 'incoming'));
      model.add(makeEntry(42, '13500135000', 4000, 42, 'missed'));
      model.add(makeEntry(43, '13800138000', 0, 59, 'outgoing'));
      model.add(makeEntry(44, '13900139000', 7000, 76, 'incoming'));
      model.add(makeEntry(45, '138-0013-8000', 3000, 93, 'missed'));
      model.add(makeEntry(46, '13700137000', 10000, 20, 'outgoing'));
      model.add(makeEntry(47, '13600136000', 6000, 37, 'incoming'));
      const actual: number = model.size();
      expect(actual).assertEqual(3);
      expect(model.totalDuration()).assertEqual(121);
      expect(model.lastEntry() === undefined).assertEqual(false);
      log('testAddTrim0050 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0051
     * @tc.name      testAddTrim0051
     * @tc.desc      adding 7 entries with capacity 5 keeps 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddTrim0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAddTrim0051 begin');
      const model: CallHistoryModel = new CallHistoryModel(5);
      model.add(makeEntry(41, '13600136000', 8000, 25, 'incoming'));
      model.add(makeEntry(42, '13500135000', 4000, 42, 'missed'));
      model.add(makeEntry(43, '13800138000', 0, 59, 'outgoing'));
      model.add(makeEntry(44, '13900139000', 7000, 76, 'incoming'));
      model.add(makeEntry(45, '138-0013-8000', 3000, 93, 'missed'));
      model.add(makeEntry(46, '13700137000', 10000, 20, 'outgoing'));
      model.add(makeEntry(47, '13600136000', 6000, 37, 'incoming'));
      const actual: number = model.size();
      expect(actual).assertEqual(5);
      expect(model.totalDuration()).assertEqual(200);
      expect(model.lastEntry() === undefined).assertEqual(false);
      log('testAddTrim0051 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0052
     * @tc.name      testAddTrim0052
     * @tc.desc      adding 7 entries with capacity 10 keeps 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddTrim0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAddTrim0052 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(41, '13600136000', 8000, 25, 'incoming'));
      model.add(makeEntry(42, '13500135000', 4000, 42, 'missed'));
      model.add(makeEntry(43, '13800138000', 0, 59, 'outgoing'));
      model.add(makeEntry(44, '13900139000', 7000, 76, 'incoming'));
      model.add(makeEntry(45, '138-0013-8000', 3000, 93, 'missed'));
      model.add(makeEntry(46, '13700137000', 10000, 20, 'outgoing'));
      model.add(makeEntry(47, '13600136000', 6000, 37, 'incoming'));
      const actual: number = model.size();
      expect(actual).assertEqual(7);
      expect(model.totalDuration()).assertEqual(352);
      expect(model.lastEntry() === undefined).assertEqual(false);
      log('testAddTrim0052 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0053
     * @tc.name      testFindByNumber0053
     * @tc.desc      findByNumber(13600136000) matches 2 entries by normalized value
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFindByNumber0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFindByNumber0053 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(41, '13600136000', 8000, 25, 'incoming'));
      model.add(makeEntry(42, '13500135000', 4000, 42, 'missed'));
      model.add(makeEntry(43, '13800138000', 0, 59, 'outgoing'));
      model.add(makeEntry(44, '13900139000', 7000, 76, 'incoming'));
      model.add(makeEntry(45, '138-0013-8000', 3000, 93, 'missed'));
      model.add(makeEntry(46, '13700137000', 10000, 20, 'outgoing'));
      model.add(makeEntry(47, '13600136000', 6000, 37, 'incoming'));
      const actual: CallHistoryEntry[] = model.findByNumber('13600136000');
      expect(actual.length).assertEqual(2);
      log('testFindByNumber0053 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0054
     * @tc.name      testCountByDirection0054
     * @tc.desc      countByDirection(outgoing) -> 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountByDirection0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountByDirection0054 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(41, '13600136000', 8000, 25, 'incoming'));
      model.add(makeEntry(42, '13500135000', 4000, 42, 'missed'));
      model.add(makeEntry(43, '13800138000', 0, 59, 'outgoing'));
      model.add(makeEntry(44, '13900139000', 7000, 76, 'incoming'));
      model.add(makeEntry(45, '138-0013-8000', 3000, 93, 'missed'));
      model.add(makeEntry(46, '13700137000', 10000, 20, 'outgoing'));
      model.add(makeEntry(47, '13600136000', 6000, 37, 'incoming'));
      const actual: number = model.countByDirection('outgoing');
      expect(actual).assertEqual(2);
      log('testCountByDirection0054 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0055
     * @tc.name      testCountByDirection0055
     * @tc.desc      countByDirection(incoming) -> 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountByDirection0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountByDirection0055 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(41, '13600136000', 8000, 25, 'incoming'));
      model.add(makeEntry(42, '13500135000', 4000, 42, 'missed'));
      model.add(makeEntry(43, '13800138000', 0, 59, 'outgoing'));
      model.add(makeEntry(44, '13900139000', 7000, 76, 'incoming'));
      model.add(makeEntry(45, '138-0013-8000', 3000, 93, 'missed'));
      model.add(makeEntry(46, '13700137000', 10000, 20, 'outgoing'));
      model.add(makeEntry(47, '13600136000', 6000, 37, 'incoming'));
      const actual: number = model.countByDirection('incoming');
      expect(actual).assertEqual(3);
      log('testCountByDirection0055 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0056
     * @tc.name      testCountByDirection0056
     * @tc.desc      countByDirection(missed) -> 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountByDirection0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountByDirection0056 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(41, '13600136000', 8000, 25, 'incoming'));
      model.add(makeEntry(42, '13500135000', 4000, 42, 'missed'));
      model.add(makeEntry(43, '13800138000', 0, 59, 'outgoing'));
      model.add(makeEntry(44, '13900139000', 7000, 76, 'incoming'));
      model.add(makeEntry(45, '138-0013-8000', 3000, 93, 'missed'));
      model.add(makeEntry(46, '13700137000', 10000, 20, 'outgoing'));
      model.add(makeEntry(47, '13600136000', 6000, 37, 'incoming'));
      const actual: number = model.countByDirection('missed');
      expect(actual).assertEqual(2);
      log('testCountByDirection0056 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0057
     * @tc.name      testLongestEntry0057
     * @tc.desc      longestEntry returns id 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLongestEntry0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLongestEntry0057 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(41, '13600136000', 8000, 25, 'incoming'));
      model.add(makeEntry(42, '13500135000', 4000, 42, 'missed'));
      model.add(makeEntry(43, '13800138000', 0, 59, 'outgoing'));
      model.add(makeEntry(44, '13900139000', 7000, 76, 'incoming'));
      model.add(makeEntry(45, '138-0013-8000', 3000, 93, 'missed'));
      model.add(makeEntry(46, '13700137000', 10000, 20, 'outgoing'));
      model.add(makeEntry(47, '13600136000', 6000, 37, 'incoming'));
      const actual: CallHistoryEntry | undefined = model.longestEntry();
      expect(actual === undefined).assertFalse();
      if (actual !== undefined) {
        expect(actual.id).assertEqual(45);
      }
      log('testLongestEntry0057 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0058
     * @tc.name      testNumbers0058
     * @tc.desc      numbers returns 5 unique normalized numbers
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNumbers0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNumbers0058 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(41, '13600136000', 8000, 25, 'incoming'));
      model.add(makeEntry(42, '13500135000', 4000, 42, 'missed'));
      model.add(makeEntry(43, '13800138000', 0, 59, 'outgoing'));
      model.add(makeEntry(44, '13900139000', 7000, 76, 'incoming'));
      model.add(makeEntry(45, '138-0013-8000', 3000, 93, 'missed'));
      model.add(makeEntry(46, '13700137000', 10000, 20, 'outgoing'));
      model.add(makeEntry(47, '13600136000', 6000, 37, 'incoming'));
      const actual: string[] = model.numbers();
      expect(actual.length).assertEqual(5);
      log('testNumbers0058 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0059
     * @tc.name      testRemoveById0059
     * @tc.desc      removeById(41) leaves 6 entries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRemoveById0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRemoveById0059 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(41, '13600136000', 8000, 25, 'incoming'));
      model.add(makeEntry(42, '13500135000', 4000, 42, 'missed'));
      model.add(makeEntry(43, '13800138000', 0, 59, 'outgoing'));
      model.add(makeEntry(44, '13900139000', 7000, 76, 'incoming'));
      model.add(makeEntry(45, '138-0013-8000', 3000, 93, 'missed'));
      model.add(makeEntry(46, '13700137000', 10000, 20, 'outgoing'));
      model.add(makeEntry(47, '13600136000', 6000, 37, 'incoming'));
      expect(model.removeById(41)).assertTrue();
      expect(model.removeById(1040)).assertFalse();
      expect(model.size()).assertEqual(6);
      log('testRemoveById0059 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0060
     * @tc.name      testClear0060
     * @tc.desc      clear empties the model
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testClear0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testClear0060 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(41, '13600136000', 8000, 25, 'incoming'));
      model.add(makeEntry(42, '13500135000', 4000, 42, 'missed'));
      model.add(makeEntry(43, '13800138000', 0, 59, 'outgoing'));
      model.add(makeEntry(44, '13900139000', 7000, 76, 'incoming'));
      model.add(makeEntry(45, '138-0013-8000', 3000, 93, 'missed'));
      model.add(makeEntry(46, '13700137000', 10000, 20, 'outgoing'));
      model.add(makeEntry(47, '13600136000', 6000, 37, 'incoming'));
      model.clear();
      expect(model.size()).assertEqual(0);
      expect(model.lastEntry() === undefined).assertTrue();
      log('testClear0060 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0061
     * @tc.name      testAddTrim0061
     * @tc.desc      adding 3 entries with capacity 2 keeps 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddTrim0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAddTrim0061 begin');
      const model: CallHistoryModel = new CallHistoryModel(2);
      model.add(makeEntry(51, '13500135000', 10000, 30, 'missed'));
      model.add(makeEntry(52, '13800138000', 6000, 47, 'outgoing'));
      model.add(makeEntry(53, '13900139000', 2000, 64, 'incoming'));
      const actual: number = model.size();
      expect(actual).assertEqual(2);
      expect(model.totalDuration()).assertEqual(77);
      expect(model.lastEntry() === undefined).assertEqual(false);
      log('testAddTrim0061 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0062
     * @tc.name      testAddTrim0062
     * @tc.desc      adding 3 entries with capacity 3 keeps 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddTrim0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAddTrim0062 begin');
      const model: CallHistoryModel = new CallHistoryModel(3);
      model.add(makeEntry(51, '13500135000', 10000, 30, 'missed'));
      model.add(makeEntry(52, '13800138000', 6000, 47, 'outgoing'));
      model.add(makeEntry(53, '13900139000', 2000, 64, 'incoming'));
      const actual: number = model.size();
      expect(actual).assertEqual(3);
      expect(model.totalDuration()).assertEqual(141);
      expect(model.lastEntry() === undefined).assertEqual(false);
      log('testAddTrim0062 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0063
     * @tc.name      testAddTrim0063
     * @tc.desc      adding 3 entries with capacity 5 keeps 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddTrim0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAddTrim0063 begin');
      const model: CallHistoryModel = new CallHistoryModel(5);
      model.add(makeEntry(51, '13500135000', 10000, 30, 'missed'));
      model.add(makeEntry(52, '13800138000', 6000, 47, 'outgoing'));
      model.add(makeEntry(53, '13900139000', 2000, 64, 'incoming'));
      const actual: number = model.size();
      expect(actual).assertEqual(3);
      expect(model.totalDuration()).assertEqual(141);
      expect(model.lastEntry() === undefined).assertEqual(false);
      log('testAddTrim0063 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0064
     * @tc.name      testAddTrim0064
     * @tc.desc      adding 3 entries with capacity 10 keeps 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddTrim0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAddTrim0064 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(51, '13500135000', 10000, 30, 'missed'));
      model.add(makeEntry(52, '13800138000', 6000, 47, 'outgoing'));
      model.add(makeEntry(53, '13900139000', 2000, 64, 'incoming'));
      const actual: number = model.size();
      expect(actual).assertEqual(3);
      expect(model.totalDuration()).assertEqual(141);
      expect(model.lastEntry() === undefined).assertEqual(false);
      log('testAddTrim0064 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0065
     * @tc.name      testFindByNumber0065
     * @tc.desc      findByNumber(13500135000) matches 1 entries by normalized value
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFindByNumber0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFindByNumber0065 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(51, '13500135000', 10000, 30, 'missed'));
      model.add(makeEntry(52, '13800138000', 6000, 47, 'outgoing'));
      model.add(makeEntry(53, '13900139000', 2000, 64, 'incoming'));
      const actual: CallHistoryEntry[] = model.findByNumber('13500135000');
      expect(actual.length).assertEqual(1);
      log('testFindByNumber0065 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0066
     * @tc.name      testCountByDirection0066
     * @tc.desc      countByDirection(outgoing) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountByDirection0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountByDirection0066 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(51, '13500135000', 10000, 30, 'missed'));
      model.add(makeEntry(52, '13800138000', 6000, 47, 'outgoing'));
      model.add(makeEntry(53, '13900139000', 2000, 64, 'incoming'));
      const actual: number = model.countByDirection('outgoing');
      expect(actual).assertEqual(1);
      log('testCountByDirection0066 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0067
     * @tc.name      testCountByDirection0067
     * @tc.desc      countByDirection(incoming) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountByDirection0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountByDirection0067 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(51, '13500135000', 10000, 30, 'missed'));
      model.add(makeEntry(52, '13800138000', 6000, 47, 'outgoing'));
      model.add(makeEntry(53, '13900139000', 2000, 64, 'incoming'));
      const actual: number = model.countByDirection('incoming');
      expect(actual).assertEqual(1);
      log('testCountByDirection0067 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0068
     * @tc.name      testCountByDirection0068
     * @tc.desc      countByDirection(missed) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountByDirection0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountByDirection0068 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(51, '13500135000', 10000, 30, 'missed'));
      model.add(makeEntry(52, '13800138000', 6000, 47, 'outgoing'));
      model.add(makeEntry(53, '13900139000', 2000, 64, 'incoming'));
      const actual: number = model.countByDirection('missed');
      expect(actual).assertEqual(1);
      log('testCountByDirection0068 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0069
     * @tc.name      testLongestEntry0069
     * @tc.desc      longestEntry returns id 53
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLongestEntry0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLongestEntry0069 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(51, '13500135000', 10000, 30, 'missed'));
      model.add(makeEntry(52, '13800138000', 6000, 47, 'outgoing'));
      model.add(makeEntry(53, '13900139000', 2000, 64, 'incoming'));
      const actual: CallHistoryEntry | undefined = model.longestEntry();
      expect(actual === undefined).assertFalse();
      if (actual !== undefined) {
        expect(actual.id).assertEqual(53);
      }
      log('testLongestEntry0069 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0070
     * @tc.name      testNumbers0070
     * @tc.desc      numbers returns 3 unique normalized numbers
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNumbers0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNumbers0070 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(51, '13500135000', 10000, 30, 'missed'));
      model.add(makeEntry(52, '13800138000', 6000, 47, 'outgoing'));
      model.add(makeEntry(53, '13900139000', 2000, 64, 'incoming'));
      const actual: string[] = model.numbers();
      expect(actual.length).assertEqual(3);
      log('testNumbers0070 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0071
     * @tc.name      testRemoveById0071
     * @tc.desc      removeById(51) leaves 2 entries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRemoveById0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRemoveById0071 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(51, '13500135000', 10000, 30, 'missed'));
      model.add(makeEntry(52, '13800138000', 6000, 47, 'outgoing'));
      model.add(makeEntry(53, '13900139000', 2000, 64, 'incoming'));
      expect(model.removeById(51)).assertTrue();
      expect(model.removeById(1050)).assertFalse();
      expect(model.size()).assertEqual(2);
      log('testRemoveById0071 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0072
     * @tc.name      testClear0072
     * @tc.desc      clear empties the model
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testClear0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testClear0072 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(51, '13500135000', 10000, 30, 'missed'));
      model.add(makeEntry(52, '13800138000', 6000, 47, 'outgoing'));
      model.add(makeEntry(53, '13900139000', 2000, 64, 'incoming'));
      model.clear();
      expect(model.size()).assertEqual(0);
      expect(model.lastEntry() === undefined).assertTrue();
      log('testClear0072 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0073
     * @tc.name      testAddTrim0073
     * @tc.desc      adding 4 entries with capacity 2 keeps 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddTrim0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAddTrim0073 begin');
      const model: CallHistoryModel = new CallHistoryModel(2);
      model.add(makeEntry(61, '13800138000', 1000, 35, 'outgoing'));
      model.add(makeEntry(62, '13900139000', 8000, 52, 'incoming'));
      model.add(makeEntry(63, '138-0013-8000', 4000, 69, 'missed'));
      model.add(makeEntry(64, '13700137000', 0, 86, 'outgoing'));
      const actual: number = model.size();
      expect(actual).assertEqual(2);
      expect(model.totalDuration()).assertEqual(121);
      expect(model.lastEntry() === undefined).assertEqual(false);
      log('testAddTrim0073 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0074
     * @tc.name      testAddTrim0074
     * @tc.desc      adding 4 entries with capacity 3 keeps 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddTrim0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAddTrim0074 begin');
      const model: CallHistoryModel = new CallHistoryModel(3);
      model.add(makeEntry(61, '13800138000', 1000, 35, 'outgoing'));
      model.add(makeEntry(62, '13900139000', 8000, 52, 'incoming'));
      model.add(makeEntry(63, '138-0013-8000', 4000, 69, 'missed'));
      model.add(makeEntry(64, '13700137000', 0, 86, 'outgoing'));
      const actual: number = model.size();
      expect(actual).assertEqual(3);
      expect(model.totalDuration()).assertEqual(156);
      expect(model.lastEntry() === undefined).assertEqual(false);
      log('testAddTrim0074 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0075
     * @tc.name      testAddTrim0075
     * @tc.desc      adding 4 entries with capacity 5 keeps 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddTrim0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAddTrim0075 begin');
      const model: CallHistoryModel = new CallHistoryModel(5);
      model.add(makeEntry(61, '13800138000', 1000, 35, 'outgoing'));
      model.add(makeEntry(62, '13900139000', 8000, 52, 'incoming'));
      model.add(makeEntry(63, '138-0013-8000', 4000, 69, 'missed'));
      model.add(makeEntry(64, '13700137000', 0, 86, 'outgoing'));
      const actual: number = model.size();
      expect(actual).assertEqual(4);
      expect(model.totalDuration()).assertEqual(242);
      expect(model.lastEntry() === undefined).assertEqual(false);
      log('testAddTrim0075 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0076
     * @tc.name      testAddTrim0076
     * @tc.desc      adding 4 entries with capacity 10 keeps 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddTrim0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAddTrim0076 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(61, '13800138000', 1000, 35, 'outgoing'));
      model.add(makeEntry(62, '13900139000', 8000, 52, 'incoming'));
      model.add(makeEntry(63, '138-0013-8000', 4000, 69, 'missed'));
      model.add(makeEntry(64, '13700137000', 0, 86, 'outgoing'));
      const actual: number = model.size();
      expect(actual).assertEqual(4);
      expect(model.totalDuration()).assertEqual(242);
      expect(model.lastEntry() === undefined).assertEqual(false);
      log('testAddTrim0076 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0077
     * @tc.name      testFindByNumber0077
     * @tc.desc      findByNumber(13800138000) matches 2 entries by normalized value
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFindByNumber0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFindByNumber0077 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(61, '13800138000', 1000, 35, 'outgoing'));
      model.add(makeEntry(62, '13900139000', 8000, 52, 'incoming'));
      model.add(makeEntry(63, '138-0013-8000', 4000, 69, 'missed'));
      model.add(makeEntry(64, '13700137000', 0, 86, 'outgoing'));
      const actual: CallHistoryEntry[] = model.findByNumber('13800138000');
      expect(actual.length).assertEqual(2);
      log('testFindByNumber0077 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0078
     * @tc.name      testCountByDirection0078
     * @tc.desc      countByDirection(outgoing) -> 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountByDirection0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountByDirection0078 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(61, '13800138000', 1000, 35, 'outgoing'));
      model.add(makeEntry(62, '13900139000', 8000, 52, 'incoming'));
      model.add(makeEntry(63, '138-0013-8000', 4000, 69, 'missed'));
      model.add(makeEntry(64, '13700137000', 0, 86, 'outgoing'));
      const actual: number = model.countByDirection('outgoing');
      expect(actual).assertEqual(2);
      log('testCountByDirection0078 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0079
     * @tc.name      testCountByDirection0079
     * @tc.desc      countByDirection(incoming) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountByDirection0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountByDirection0079 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(61, '13800138000', 1000, 35, 'outgoing'));
      model.add(makeEntry(62, '13900139000', 8000, 52, 'incoming'));
      model.add(makeEntry(63, '138-0013-8000', 4000, 69, 'missed'));
      model.add(makeEntry(64, '13700137000', 0, 86, 'outgoing'));
      const actual: number = model.countByDirection('incoming');
      expect(actual).assertEqual(1);
      log('testCountByDirection0079 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0080
     * @tc.name      testCountByDirection0080
     * @tc.desc      countByDirection(missed) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountByDirection0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountByDirection0080 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(61, '13800138000', 1000, 35, 'outgoing'));
      model.add(makeEntry(62, '13900139000', 8000, 52, 'incoming'));
      model.add(makeEntry(63, '138-0013-8000', 4000, 69, 'missed'));
      model.add(makeEntry(64, '13700137000', 0, 86, 'outgoing'));
      const actual: number = model.countByDirection('missed');
      expect(actual).assertEqual(1);
      log('testCountByDirection0080 end');
      await yieldToMain();
    })
  })
}
