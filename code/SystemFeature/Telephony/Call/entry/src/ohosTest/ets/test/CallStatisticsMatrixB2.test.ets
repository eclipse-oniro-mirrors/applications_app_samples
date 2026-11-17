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
import { CallStatistics } from '../../../main/ets/model/CallStatistics';

const DOMAIN: number = 0xF814;
const TAG: string = 'CallStatisticsMatrixB2';
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

export default function callStatisticsMatrixB2Test(): void {
  describe('CallStatisticsMatrixB2', () => {
    /**
     * @tc.number    SUB_CALL_STATSB_0091
     * @tc.name      testRatio0091
     * @tc.desc      ratio(outgoing) -> 58.33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0091 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 7);
      stats.increment('missed', 5);
      const actual: number = stats.ratio('outgoing');
      expect(actual).assertEqual(58.33);
      log('testRatio0091 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0092
     * @tc.name      testEntries0092
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0092 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 7);
      stats.increment('missed', 5);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(2);
      expect(actual[0]).assertEqual('outgoing=7');
      log('testEntries0092 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0093
     * @tc.name      testCount0093
     * @tc.desc      count(missed) after 3 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0093 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      stats.increment('blocked', 6);
      const actual: number = stats.count('missed');
      expect(actual).assertEqual(1);
      log('testCount0093 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0094
     * @tc.name      testTotal0094
     * @tc.desc      total() over 3 increments -> 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0094 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      stats.increment('blocked', 6);
      const actual: number = stats.total();
      expect(actual).assertEqual(15);
      log('testTotal0094 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0095
     * @tc.name      testTopKey0095
     * @tc.desc      topKey() returns rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0095 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      stats.increment('blocked', 6);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('rejected');
      log('testTopKey0095 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0096
     * @tc.name      testSize0096
     * @tc.desc      size() counts 3 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0096 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      stats.increment('blocked', 6);
      const actual: number = stats.size();
      expect(actual).assertEqual(3);
      log('testSize0096 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0097
     * @tc.name      testRatio0097
     * @tc.desc      ratio(missed) -> 6.67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0097 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      stats.increment('blocked', 6);
      const actual: number = stats.ratio('missed');
      expect(actual).assertEqual(6.67);
      log('testRatio0097 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0098
     * @tc.name      testEntries0098
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0098 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      stats.increment('blocked', 6);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(3);
      expect(actual[0]).assertEqual('missed=1');
      log('testEntries0098 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0099
     * @tc.name      testCount0099
     * @tc.desc      count(rejected) after 4 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0099 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 4);
      stats.increment('blocked', 2);
      stats.increment('incoming', 9);
      stats.increment('outgoing', 7);
      const actual: number = stats.count('rejected');
      expect(actual).assertEqual(4);
      log('testCount0099 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0100
     * @tc.name      testTotal0100
     * @tc.desc      total() over 4 increments -> 22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0100 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 4);
      stats.increment('blocked', 2);
      stats.increment('incoming', 9);
      stats.increment('outgoing', 7);
      const actual: number = stats.total();
      expect(actual).assertEqual(22);
      log('testTotal0100 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0101
     * @tc.name      testTopKey0101
     * @tc.desc      topKey() returns incoming
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0101 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 4);
      stats.increment('blocked', 2);
      stats.increment('incoming', 9);
      stats.increment('outgoing', 7);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('incoming');
      log('testTopKey0101 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0102
     * @tc.name      testSize0102
     * @tc.desc      size() counts 4 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0102 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 4);
      stats.increment('blocked', 2);
      stats.increment('incoming', 9);
      stats.increment('outgoing', 7);
      const actual: number = stats.size();
      expect(actual).assertEqual(4);
      log('testSize0102 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0103
     * @tc.name      testRatio0103
     * @tc.desc      ratio(rejected) -> 18.18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0103 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 4);
      stats.increment('blocked', 2);
      stats.increment('incoming', 9);
      stats.increment('outgoing', 7);
      const actual: number = stats.ratio('rejected');
      expect(actual).assertEqual(18.18);
      log('testRatio0103 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0104
     * @tc.name      testEntries0104
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0104 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 4);
      stats.increment('blocked', 2);
      stats.increment('incoming', 9);
      stats.increment('outgoing', 7);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(4);
      expect(actual[0]).assertEqual('rejected=4');
      log('testEntries0104 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0105
     * @tc.name      testCount0105
     * @tc.desc      count(blocked) after 5 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0105 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 7);
      stats.increment('incoming', 5);
      stats.increment('outgoing', 3);
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      const actual: number = stats.count('blocked');
      expect(actual).assertEqual(7);
      log('testCount0105 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0106
     * @tc.name      testTotal0106
     * @tc.desc      total() over 5 increments -> 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0106 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 7);
      stats.increment('incoming', 5);
      stats.increment('outgoing', 3);
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      const actual: number = stats.total();
      expect(actual).assertEqual(24);
      log('testTotal0106 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0107
     * @tc.name      testTopKey0107
     * @tc.desc      topKey() returns rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0107 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 7);
      stats.increment('incoming', 5);
      stats.increment('outgoing', 3);
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('rejected');
      log('testTopKey0107 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0108
     * @tc.name      testSize0108
     * @tc.desc      size() counts 5 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0108 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 7);
      stats.increment('incoming', 5);
      stats.increment('outgoing', 3);
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      const actual: number = stats.size();
      expect(actual).assertEqual(5);
      log('testSize0108 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0109
     * @tc.name      testRatio0109
     * @tc.desc      ratio(blocked) -> 29.17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0109 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 7);
      stats.increment('incoming', 5);
      stats.increment('outgoing', 3);
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      const actual: number = stats.ratio('blocked');
      expect(actual).assertEqual(29.17);
      log('testRatio0109 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0110
     * @tc.name      testEntries0110
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0110 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 7);
      stats.increment('incoming', 5);
      stats.increment('outgoing', 3);
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(5);
      expect(actual[0]).assertEqual('blocked=7');
      log('testEntries0110 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0111
     * @tc.name      testCount0111
     * @tc.desc      count(incoming) after 1 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0111 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: number = stats.count('incoming');
      expect(actual).assertEqual(1);
      log('testCount0111 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0112
     * @tc.name      testTotal0112
     * @tc.desc      total() over 1 increments -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0112 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: number = stats.total();
      expect(actual).assertEqual(1);
      log('testTotal0112 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0113
     * @tc.name      testTopKey0113
     * @tc.desc      topKey() returns incoming
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0113 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('incoming');
      log('testTopKey0113 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0114
     * @tc.name      testSize0114
     * @tc.desc      size() counts 1 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0114 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: number = stats.size();
      expect(actual).assertEqual(1);
      log('testSize0114 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0115
     * @tc.name      testRatio0115
     * @tc.desc      ratio(incoming) -> 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0115 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: number = stats.ratio('incoming');
      expect(actual).assertEqual(100);
      log('testRatio0115 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0116
     * @tc.name      testEntries0116
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0116 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(1);
      expect(actual[0]).assertEqual('incoming=1');
      log('testEntries0116 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0117
     * @tc.name      testCount0117
     * @tc.desc      count(outgoing) after 2 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0117 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: number = stats.count('outgoing');
      expect(actual).assertEqual(4);
      log('testCount0117 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0118
     * @tc.name      testTotal0118
     * @tc.desc      total() over 2 increments -> 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0118 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: number = stats.total();
      expect(actual).assertEqual(6);
      log('testTotal0118 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0119
     * @tc.name      testTopKey0119
     * @tc.desc      topKey() returns outgoing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0119 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('outgoing');
      log('testTopKey0119 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0120
     * @tc.name      testSize0120
     * @tc.desc      size() counts 2 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0120 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: number = stats.size();
      expect(actual).assertEqual(2);
      log('testSize0120 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0121
     * @tc.name      testRatio0121
     * @tc.desc      ratio(outgoing) -> 66.67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0121 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: number = stats.ratio('outgoing');
      expect(actual).assertEqual(66.67);
      log('testRatio0121 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0122
     * @tc.name      testEntries0122
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0122 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(2);
      expect(actual[0]).assertEqual('outgoing=4');
      log('testEntries0122 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0123
     * @tc.name      testCount0123
     * @tc.desc      count(missed) after 3 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0123 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: number = stats.count('missed');
      expect(actual).assertEqual(7);
      log('testCount0123 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0124
     * @tc.name      testTotal0124
     * @tc.desc      total() over 3 increments -> 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0124 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: number = stats.total();
      expect(actual).assertEqual(15);
      log('testTotal0124 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0125
     * @tc.name      testTopKey0125
     * @tc.desc      topKey() returns missed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0125 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('missed');
      log('testTopKey0125 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0126
     * @tc.name      testSize0126
     * @tc.desc      size() counts 3 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0126 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: number = stats.size();
      expect(actual).assertEqual(3);
      log('testSize0126 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0127
     * @tc.name      testRatio0127
     * @tc.desc      ratio(missed) -> 46.67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0127 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: number = stats.ratio('missed');
      expect(actual).assertEqual(46.67);
      log('testRatio0127 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0128
     * @tc.name      testEntries0128
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0128 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(3);
      expect(actual[0]).assertEqual('missed=7');
      log('testEntries0128 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0129
     * @tc.name      testCount0129
     * @tc.desc      count(rejected) after 4 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0129 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: number = stats.count('rejected');
      expect(actual).assertEqual(1);
      log('testCount0129 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0130
     * @tc.name      testTotal0130
     * @tc.desc      total() over 4 increments -> 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0130 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: number = stats.total();
      expect(actual).assertEqual(19);
      log('testTotal0130 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0131
     * @tc.name      testTopKey0131
     * @tc.desc      topKey() returns blocked
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0131 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('blocked');
      log('testTopKey0131 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0132
     * @tc.name      testSize0132
     * @tc.desc      size() counts 4 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0132 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: number = stats.size();
      expect(actual).assertEqual(4);
      log('testSize0132 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0133
     * @tc.name      testRatio0133
     * @tc.desc      ratio(rejected) -> 5.26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0133 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: number = stats.ratio('rejected');
      expect(actual).assertEqual(5.26);
      log('testRatio0133 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0134
     * @tc.name      testEntries0134
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0134 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(4);
      expect(actual[0]).assertEqual('rejected=1');
      log('testEntries0134 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0135
     * @tc.name      testCount0135
     * @tc.desc      count(blocked) after 5 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0135 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: number = stats.count('blocked');
      expect(actual).assertEqual(4);
      log('testCount0135 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0136
     * @tc.name      testTotal0136
     * @tc.desc      total() over 5 increments -> 27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0136 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: number = stats.total();
      expect(actual).assertEqual(27);
      log('testTotal0136 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0137
     * @tc.name      testTopKey0137
     * @tc.desc      topKey() returns outgoing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0137 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('outgoing');
      log('testTopKey0137 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0138
     * @tc.name      testSize0138
     * @tc.desc      size() counts 5 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0138 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: number = stats.size();
      expect(actual).assertEqual(5);
      log('testSize0138 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0139
     * @tc.name      testRatio0139
     * @tc.desc      ratio(blocked) -> 14.81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0139 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: number = stats.ratio('blocked');
      expect(actual).assertEqual(14.81);
      log('testRatio0139 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0140
     * @tc.name      testEntries0140
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0140 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(5);
      expect(actual[0]).assertEqual('blocked=4');
      log('testEntries0140 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0141
     * @tc.name      testCount0141
     * @tc.desc      count(incoming) after 1 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0141 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 7);
      const actual: number = stats.count('incoming');
      expect(actual).assertEqual(7);
      log('testCount0141 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0142
     * @tc.name      testTotal0142
     * @tc.desc      total() over 1 increments -> 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0142 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 7);
      const actual: number = stats.total();
      expect(actual).assertEqual(7);
      log('testTotal0142 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0143
     * @tc.name      testTopKey0143
     * @tc.desc      topKey() returns incoming
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0143 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 7);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('incoming');
      log('testTopKey0143 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0144
     * @tc.name      testSize0144
     * @tc.desc      size() counts 1 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0144 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 7);
      const actual: number = stats.size();
      expect(actual).assertEqual(1);
      log('testSize0144 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0145
     * @tc.name      testRatio0145
     * @tc.desc      ratio(incoming) -> 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0145 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 7);
      const actual: number = stats.ratio('incoming');
      expect(actual).assertEqual(100);
      log('testRatio0145 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0146
     * @tc.name      testEntries0146
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0146 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 7);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(1);
      expect(actual[0]).assertEqual('incoming=7');
      log('testEntries0146 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0147
     * @tc.name      testCount0147
     * @tc.desc      count(outgoing) after 2 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0147 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 1);
      stats.increment('missed', 8);
      const actual: number = stats.count('outgoing');
      expect(actual).assertEqual(1);
      log('testCount0147 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0148
     * @tc.name      testTotal0148
     * @tc.desc      total() over 2 increments -> 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0148 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 1);
      stats.increment('missed', 8);
      const actual: number = stats.total();
      expect(actual).assertEqual(9);
      log('testTotal0148 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0149
     * @tc.name      testTopKey0149
     * @tc.desc      topKey() returns missed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0149 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 1);
      stats.increment('missed', 8);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('missed');
      log('testTopKey0149 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0150
     * @tc.name      testSize0150
     * @tc.desc      size() counts 2 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0150 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 1);
      stats.increment('missed', 8);
      const actual: number = stats.size();
      expect(actual).assertEqual(2);
      log('testSize0150 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0151
     * @tc.name      testRatio0151
     * @tc.desc      ratio(outgoing) -> 11.11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0151 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 1);
      stats.increment('missed', 8);
      const actual: number = stats.ratio('outgoing');
      expect(actual).assertEqual(11.11);
      log('testRatio0151 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0152
     * @tc.name      testEntries0152
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0152 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 1);
      stats.increment('missed', 8);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(2);
      expect(actual[0]).assertEqual('outgoing=1');
      log('testEntries0152 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0153
     * @tc.name      testCount0153
     * @tc.desc      count(missed) after 3 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0153 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      stats.increment('blocked', 9);
      const actual: number = stats.count('missed');
      expect(actual).assertEqual(4);
      log('testCount0153 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0154
     * @tc.name      testTotal0154
     * @tc.desc      total() over 3 increments -> 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0154 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      stats.increment('blocked', 9);
      const actual: number = stats.total();
      expect(actual).assertEqual(15);
      log('testTotal0154 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0155
     * @tc.name      testTopKey0155
     * @tc.desc      topKey() returns blocked
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0155 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      stats.increment('blocked', 9);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('blocked');
      log('testTopKey0155 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0156
     * @tc.name      testSize0156
     * @tc.desc      size() counts 3 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0156 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      stats.increment('blocked', 9);
      const actual: number = stats.size();
      expect(actual).assertEqual(3);
      log('testSize0156 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0157
     * @tc.name      testRatio0157
     * @tc.desc      ratio(missed) -> 26.67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0157 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      stats.increment('blocked', 9);
      const actual: number = stats.ratio('missed');
      expect(actual).assertEqual(26.67);
      log('testRatio0157 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0158
     * @tc.name      testEntries0158
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0158 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      stats.increment('blocked', 9);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(3);
      expect(actual[0]).assertEqual('missed=4');
      log('testEntries0158 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0159
     * @tc.name      testCount0159
     * @tc.desc      count(rejected) after 4 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0159 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 7);
      stats.increment('blocked', 5);
      stats.increment('incoming', 3);
      stats.increment('outgoing', 1);
      const actual: number = stats.count('rejected');
      expect(actual).assertEqual(7);
      log('testCount0159 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0160
     * @tc.name      testTotal0160
     * @tc.desc      total() over 4 increments -> 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0160 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 7);
      stats.increment('blocked', 5);
      stats.increment('incoming', 3);
      stats.increment('outgoing', 1);
      const actual: number = stats.total();
      expect(actual).assertEqual(16);
      log('testTotal0160 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0161
     * @tc.name      testTopKey0161
     * @tc.desc      topKey() returns rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0161 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 7);
      stats.increment('blocked', 5);
      stats.increment('incoming', 3);
      stats.increment('outgoing', 1);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('rejected');
      log('testTopKey0161 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0162
     * @tc.name      testSize0162
     * @tc.desc      size() counts 4 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0162 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 7);
      stats.increment('blocked', 5);
      stats.increment('incoming', 3);
      stats.increment('outgoing', 1);
      const actual: number = stats.size();
      expect(actual).assertEqual(4);
      log('testSize0162 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0163
     * @tc.name      testRatio0163
     * @tc.desc      ratio(rejected) -> 43.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0163 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 7);
      stats.increment('blocked', 5);
      stats.increment('incoming', 3);
      stats.increment('outgoing', 1);
      const actual: number = stats.ratio('rejected');
      expect(actual).assertEqual(43.75);
      log('testRatio0163 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0164
     * @tc.name      testEntries0164
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0164 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 7);
      stats.increment('blocked', 5);
      stats.increment('incoming', 3);
      stats.increment('outgoing', 1);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(4);
      expect(actual[0]).assertEqual('rejected=7');
      log('testEntries0164 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0165
     * @tc.name      testCount0165
     * @tc.desc      count(blocked) after 5 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0165 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 1);
      stats.increment('incoming', 8);
      stats.increment('outgoing', 6);
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      const actual: number = stats.count('blocked');
      expect(actual).assertEqual(1);
      log('testCount0165 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0166
     * @tc.name      testTotal0166
     * @tc.desc      total() over 5 increments -> 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0166 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 1);
      stats.increment('incoming', 8);
      stats.increment('outgoing', 6);
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      const actual: number = stats.total();
      expect(actual).assertEqual(21);
      log('testTotal0166 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0167
     * @tc.name      testTopKey0167
     * @tc.desc      topKey() returns incoming
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0167 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 1);
      stats.increment('incoming', 8);
      stats.increment('outgoing', 6);
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('incoming');
      log('testTopKey0167 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0168
     * @tc.name      testSize0168
     * @tc.desc      size() counts 5 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0168 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 1);
      stats.increment('incoming', 8);
      stats.increment('outgoing', 6);
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      const actual: number = stats.size();
      expect(actual).assertEqual(5);
      log('testSize0168 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0169
     * @tc.name      testRatio0169
     * @tc.desc      ratio(blocked) -> 4.76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0169 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 1);
      stats.increment('incoming', 8);
      stats.increment('outgoing', 6);
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      const actual: number = stats.ratio('blocked');
      expect(actual).assertEqual(4.76);
      log('testRatio0169 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0170
     * @tc.name      testEntries0170
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0170 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 1);
      stats.increment('incoming', 8);
      stats.increment('outgoing', 6);
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(5);
      expect(actual[0]).assertEqual('blocked=1');
      log('testEntries0170 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0171
     * @tc.name      testCount0171
     * @tc.desc      count(incoming) after 1 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0171 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 4);
      const actual: number = stats.count('incoming');
      expect(actual).assertEqual(4);
      log('testCount0171 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0172
     * @tc.name      testTotal0172
     * @tc.desc      total() over 1 increments -> 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0172 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 4);
      const actual: number = stats.total();
      expect(actual).assertEqual(4);
      log('testTotal0172 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0173
     * @tc.name      testTopKey0173
     * @tc.desc      topKey() returns incoming
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0173 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 4);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('incoming');
      log('testTopKey0173 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0174
     * @tc.name      testSize0174
     * @tc.desc      size() counts 1 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0174 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 4);
      const actual: number = stats.size();
      expect(actual).assertEqual(1);
      log('testSize0174 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0175
     * @tc.name      testRatio0175
     * @tc.desc      ratio(incoming) -> 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0175 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 4);
      const actual: number = stats.ratio('incoming');
      expect(actual).assertEqual(100);
      log('testRatio0175 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0176
     * @tc.name      testEntries0176
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0176 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 4);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(1);
      expect(actual[0]).assertEqual('incoming=4');
      log('testEntries0176 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0177
     * @tc.name      testCount0177
     * @tc.desc      count(outgoing) after 2 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0177 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 7);
      stats.increment('missed', 5);
      const actual: number = stats.count('outgoing');
      expect(actual).assertEqual(7);
      log('testCount0177 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0178
     * @tc.name      testTotal0178
     * @tc.desc      total() over 2 increments -> 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0178 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 7);
      stats.increment('missed', 5);
      const actual: number = stats.total();
      expect(actual).assertEqual(12);
      log('testTotal0178 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0179
     * @tc.name      testTopKey0179
     * @tc.desc      topKey() returns outgoing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0179 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 7);
      stats.increment('missed', 5);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('outgoing');
      log('testTopKey0179 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0180
     * @tc.name      testSize0180
     * @tc.desc      size() counts 2 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0180 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 7);
      stats.increment('missed', 5);
      const actual: number = stats.size();
      expect(actual).assertEqual(2);
      log('testSize0180 end');
      await yieldToMain();
    })
  })
}
