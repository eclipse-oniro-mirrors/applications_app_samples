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
const TAG: string = 'CallHistoryMatrix2';
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

export default function callHistoryMatrix2Test(): void {
  describe('CallHistoryMatrix2', () => {
    /**
     * @tc.number    SUB_CALL_HISTORY_0081
     * @tc.name      testLongestEntry0081
     * @tc.desc      longestEntry returns id 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLongestEntry0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLongestEntry0081 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(61, '13800138000', 1000, 35, 'outgoing'));
      model.add(makeEntry(62, '13900139000', 8000, 52, 'incoming'));
      model.add(makeEntry(63, '138-0013-8000', 4000, 69, 'missed'));
      model.add(makeEntry(64, '13700137000', 0, 86, 'outgoing'));
      const actual: CallHistoryEntry | undefined = model.longestEntry();
      expect(actual === undefined).assertFalse();
      if (actual !== undefined) {
        expect(actual.id).assertEqual(64);
      }
      log('testLongestEntry0081 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0082
     * @tc.name      testNumbers0082
     * @tc.desc      numbers returns 3 unique normalized numbers
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNumbers0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNumbers0082 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(61, '13800138000', 1000, 35, 'outgoing'));
      model.add(makeEntry(62, '13900139000', 8000, 52, 'incoming'));
      model.add(makeEntry(63, '138-0013-8000', 4000, 69, 'missed'));
      model.add(makeEntry(64, '13700137000', 0, 86, 'outgoing'));
      const actual: string[] = model.numbers();
      expect(actual.length).assertEqual(3);
      log('testNumbers0082 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0083
     * @tc.name      testRemoveById0083
     * @tc.desc      removeById(61) leaves 3 entries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRemoveById0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRemoveById0083 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(61, '13800138000', 1000, 35, 'outgoing'));
      model.add(makeEntry(62, '13900139000', 8000, 52, 'incoming'));
      model.add(makeEntry(63, '138-0013-8000', 4000, 69, 'missed'));
      model.add(makeEntry(64, '13700137000', 0, 86, 'outgoing'));
      expect(model.removeById(61)).assertTrue();
      expect(model.removeById(1060)).assertFalse();
      expect(model.size()).assertEqual(3);
      log('testRemoveById0083 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0084
     * @tc.name      testClear0084
     * @tc.desc      clear empties the model
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testClear0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testClear0084 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(61, '13800138000', 1000, 35, 'outgoing'));
      model.add(makeEntry(62, '13900139000', 8000, 52, 'incoming'));
      model.add(makeEntry(63, '138-0013-8000', 4000, 69, 'missed'));
      model.add(makeEntry(64, '13700137000', 0, 86, 'outgoing'));
      model.clear();
      expect(model.size()).assertEqual(0);
      expect(model.lastEntry() === undefined).assertTrue();
      log('testClear0084 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0085
     * @tc.name      testAddTrim0085
     * @tc.desc      adding 5 entries with capacity 2 keeps 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddTrim0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAddTrim0085 begin');
      const model: CallHistoryModel = new CallHistoryModel(2);
      model.add(makeEntry(71, '13900139000', 3000, 40, 'incoming'));
      model.add(makeEntry(72, '138-0013-8000', 10000, 57, 'missed'));
      model.add(makeEntry(73, '13700137000', 6000, 74, 'outgoing'));
      model.add(makeEntry(74, '13600136000', 2000, 91, 'incoming'));
      model.add(makeEntry(75, '13500135000', 9000, 18, 'missed'));
      const actual: number = model.size();
      expect(actual).assertEqual(2);
      expect(model.totalDuration()).assertEqual(75);
      expect(model.lastEntry() === undefined).assertEqual(false);
      log('testAddTrim0085 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0086
     * @tc.name      testAddTrim0086
     * @tc.desc      adding 5 entries with capacity 3 keeps 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddTrim0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAddTrim0086 begin');
      const model: CallHistoryModel = new CallHistoryModel(3);
      model.add(makeEntry(71, '13900139000', 3000, 40, 'incoming'));
      model.add(makeEntry(72, '138-0013-8000', 10000, 57, 'missed'));
      model.add(makeEntry(73, '13700137000', 6000, 74, 'outgoing'));
      model.add(makeEntry(74, '13600136000', 2000, 91, 'incoming'));
      model.add(makeEntry(75, '13500135000', 9000, 18, 'missed'));
      const actual: number = model.size();
      expect(actual).assertEqual(3);
      expect(model.totalDuration()).assertEqual(149);
      expect(model.lastEntry() === undefined).assertEqual(false);
      log('testAddTrim0086 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0087
     * @tc.name      testAddTrim0087
     * @tc.desc      adding 5 entries with capacity 5 keeps 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddTrim0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAddTrim0087 begin');
      const model: CallHistoryModel = new CallHistoryModel(5);
      model.add(makeEntry(71, '13900139000', 3000, 40, 'incoming'));
      model.add(makeEntry(72, '138-0013-8000', 10000, 57, 'missed'));
      model.add(makeEntry(73, '13700137000', 6000, 74, 'outgoing'));
      model.add(makeEntry(74, '13600136000', 2000, 91, 'incoming'));
      model.add(makeEntry(75, '13500135000', 9000, 18, 'missed'));
      const actual: number = model.size();
      expect(actual).assertEqual(5);
      expect(model.totalDuration()).assertEqual(280);
      expect(model.lastEntry() === undefined).assertEqual(false);
      log('testAddTrim0087 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0088
     * @tc.name      testAddTrim0088
     * @tc.desc      adding 5 entries with capacity 10 keeps 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddTrim0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAddTrim0088 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(71, '13900139000', 3000, 40, 'incoming'));
      model.add(makeEntry(72, '138-0013-8000', 10000, 57, 'missed'));
      model.add(makeEntry(73, '13700137000', 6000, 74, 'outgoing'));
      model.add(makeEntry(74, '13600136000', 2000, 91, 'incoming'));
      model.add(makeEntry(75, '13500135000', 9000, 18, 'missed'));
      const actual: number = model.size();
      expect(actual).assertEqual(5);
      expect(model.totalDuration()).assertEqual(280);
      expect(model.lastEntry() === undefined).assertEqual(false);
      log('testAddTrim0088 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0089
     * @tc.name      testFindByNumber0089
     * @tc.desc      findByNumber(13900139000) matches 1 entries by normalized value
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFindByNumber0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFindByNumber0089 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(71, '13900139000', 3000, 40, 'incoming'));
      model.add(makeEntry(72, '138-0013-8000', 10000, 57, 'missed'));
      model.add(makeEntry(73, '13700137000', 6000, 74, 'outgoing'));
      model.add(makeEntry(74, '13600136000', 2000, 91, 'incoming'));
      model.add(makeEntry(75, '13500135000', 9000, 18, 'missed'));
      const actual: CallHistoryEntry[] = model.findByNumber('13900139000');
      expect(actual.length).assertEqual(1);
      log('testFindByNumber0089 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0090
     * @tc.name      testCountByDirection0090
     * @tc.desc      countByDirection(outgoing) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountByDirection0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountByDirection0090 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(71, '13900139000', 3000, 40, 'incoming'));
      model.add(makeEntry(72, '138-0013-8000', 10000, 57, 'missed'));
      model.add(makeEntry(73, '13700137000', 6000, 74, 'outgoing'));
      model.add(makeEntry(74, '13600136000', 2000, 91, 'incoming'));
      model.add(makeEntry(75, '13500135000', 9000, 18, 'missed'));
      const actual: number = model.countByDirection('outgoing');
      expect(actual).assertEqual(1);
      log('testCountByDirection0090 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0091
     * @tc.name      testCountByDirection0091
     * @tc.desc      countByDirection(incoming) -> 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountByDirection0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountByDirection0091 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(71, '13900139000', 3000, 40, 'incoming'));
      model.add(makeEntry(72, '138-0013-8000', 10000, 57, 'missed'));
      model.add(makeEntry(73, '13700137000', 6000, 74, 'outgoing'));
      model.add(makeEntry(74, '13600136000', 2000, 91, 'incoming'));
      model.add(makeEntry(75, '13500135000', 9000, 18, 'missed'));
      const actual: number = model.countByDirection('incoming');
      expect(actual).assertEqual(2);
      log('testCountByDirection0091 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0092
     * @tc.name      testCountByDirection0092
     * @tc.desc      countByDirection(missed) -> 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountByDirection0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountByDirection0092 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(71, '13900139000', 3000, 40, 'incoming'));
      model.add(makeEntry(72, '138-0013-8000', 10000, 57, 'missed'));
      model.add(makeEntry(73, '13700137000', 6000, 74, 'outgoing'));
      model.add(makeEntry(74, '13600136000', 2000, 91, 'incoming'));
      model.add(makeEntry(75, '13500135000', 9000, 18, 'missed'));
      const actual: number = model.countByDirection('missed');
      expect(actual).assertEqual(2);
      log('testCountByDirection0092 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0093
     * @tc.name      testLongestEntry0093
     * @tc.desc      longestEntry returns id 74
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLongestEntry0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLongestEntry0093 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(71, '13900139000', 3000, 40, 'incoming'));
      model.add(makeEntry(72, '138-0013-8000', 10000, 57, 'missed'));
      model.add(makeEntry(73, '13700137000', 6000, 74, 'outgoing'));
      model.add(makeEntry(74, '13600136000', 2000, 91, 'incoming'));
      model.add(makeEntry(75, '13500135000', 9000, 18, 'missed'));
      const actual: CallHistoryEntry | undefined = model.longestEntry();
      expect(actual === undefined).assertFalse();
      if (actual !== undefined) {
        expect(actual.id).assertEqual(74);
      }
      log('testLongestEntry0093 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0094
     * @tc.name      testNumbers0094
     * @tc.desc      numbers returns 5 unique normalized numbers
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNumbers0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNumbers0094 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(71, '13900139000', 3000, 40, 'incoming'));
      model.add(makeEntry(72, '138-0013-8000', 10000, 57, 'missed'));
      model.add(makeEntry(73, '13700137000', 6000, 74, 'outgoing'));
      model.add(makeEntry(74, '13600136000', 2000, 91, 'incoming'));
      model.add(makeEntry(75, '13500135000', 9000, 18, 'missed'));
      const actual: string[] = model.numbers();
      expect(actual.length).assertEqual(5);
      log('testNumbers0094 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0095
     * @tc.name      testRemoveById0095
     * @tc.desc      removeById(71) leaves 4 entries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRemoveById0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRemoveById0095 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(71, '13900139000', 3000, 40, 'incoming'));
      model.add(makeEntry(72, '138-0013-8000', 10000, 57, 'missed'));
      model.add(makeEntry(73, '13700137000', 6000, 74, 'outgoing'));
      model.add(makeEntry(74, '13600136000', 2000, 91, 'incoming'));
      model.add(makeEntry(75, '13500135000', 9000, 18, 'missed'));
      expect(model.removeById(71)).assertTrue();
      expect(model.removeById(1070)).assertFalse();
      expect(model.size()).assertEqual(4);
      log('testRemoveById0095 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0096
     * @tc.name      testClear0096
     * @tc.desc      clear empties the model
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testClear0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testClear0096 begin');
      const model: CallHistoryModel = new CallHistoryModel(10);
      model.add(makeEntry(71, '13900139000', 3000, 40, 'incoming'));
      model.add(makeEntry(72, '138-0013-8000', 10000, 57, 'missed'));
      model.add(makeEntry(73, '13700137000', 6000, 74, 'outgoing'));
      model.add(makeEntry(74, '13600136000', 2000, 91, 'incoming'));
      model.add(makeEntry(75, '13500135000', 9000, 18, 'missed'));
      model.clear();
      expect(model.size()).assertEqual(0);
      expect(model.lastEntry() === undefined).assertTrue();
      log('testClear0096 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_HISTORY_0097
     * @tc.name      testEmptyModel0097
     * @tc.desc      an empty model reports no last or longest entry
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEmptyModel0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEmptyModel0097 begin');
      const model: CallHistoryModel = new CallHistoryModel(5);
      expect(model.size()).assertEqual(0);
      expect(model.totalDuration()).assertEqual(0);
      expect(model.lastEntry() === undefined).assertTrue();
      expect(model.longestEntry() === undefined).assertTrue();
      log('testEmptyModel0097 end');
      await yieldToMain();
    })
  })
}
