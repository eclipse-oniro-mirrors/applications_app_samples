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
const TAG: string = 'CallStatisticsMatrixA2';
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

export default function callStatisticsMatrixA2Test(): void {
  describe('CallStatisticsMatrixA2', () => {
    /**
     * @tc.number    SUB_CALL_STATSA_0091
     * @tc.name      testCount0091
     * @tc.desc      count(incoming) after 1 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0091 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: number = stats.count('incoming');
      expect(actual).assertEqual(1);
      log('testCount0091 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0092
     * @tc.name      testTotal0092
     * @tc.desc      total() over 1 increments -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0092 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: number = stats.total();
      expect(actual).assertEqual(1);
      log('testTotal0092 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0093
     * @tc.name      testTopKey0093
     * @tc.desc      topKey() returns incoming
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0093 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('incoming');
      log('testTopKey0093 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0094
     * @tc.name      testSize0094
     * @tc.desc      size() counts 1 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0094 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: number = stats.size();
      expect(actual).assertEqual(1);
      log('testSize0094 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0095
     * @tc.name      testRatio0095
     * @tc.desc      ratio(incoming) -> 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0095 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: number = stats.ratio('incoming');
      expect(actual).assertEqual(100);
      log('testRatio0095 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0096
     * @tc.name      testEntries0096
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0096 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(1);
      expect(actual[0]).assertEqual('incoming=1');
      log('testEntries0096 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0097
     * @tc.name      testCount0097
     * @tc.desc      count(outgoing) after 2 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0097 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: number = stats.count('outgoing');
      expect(actual).assertEqual(4);
      log('testCount0097 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0098
     * @tc.name      testTotal0098
     * @tc.desc      total() over 2 increments -> 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0098 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: number = stats.total();
      expect(actual).assertEqual(6);
      log('testTotal0098 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0099
     * @tc.name      testTopKey0099
     * @tc.desc      topKey() returns outgoing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0099 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('outgoing');
      log('testTopKey0099 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0100
     * @tc.name      testSize0100
     * @tc.desc      size() counts 2 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0100 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: number = stats.size();
      expect(actual).assertEqual(2);
      log('testSize0100 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0101
     * @tc.name      testRatio0101
     * @tc.desc      ratio(outgoing) -> 66.67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0101 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: number = stats.ratio('outgoing');
      expect(actual).assertEqual(66.67);
      log('testRatio0101 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0102
     * @tc.name      testEntries0102
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0102 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(2);
      expect(actual[0]).assertEqual('outgoing=4');
      log('testEntries0102 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0103
     * @tc.name      testCount0103
     * @tc.desc      count(missed) after 3 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0103 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: number = stats.count('missed');
      expect(actual).assertEqual(7);
      log('testCount0103 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0104
     * @tc.name      testTotal0104
     * @tc.desc      total() over 3 increments -> 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0104 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: number = stats.total();
      expect(actual).assertEqual(15);
      log('testTotal0104 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0105
     * @tc.name      testTopKey0105
     * @tc.desc      topKey() returns missed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0105 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('missed');
      log('testTopKey0105 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0106
     * @tc.name      testSize0106
     * @tc.desc      size() counts 3 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0106 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: number = stats.size();
      expect(actual).assertEqual(3);
      log('testSize0106 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0107
     * @tc.name      testRatio0107
     * @tc.desc      ratio(missed) -> 46.67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0107 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: number = stats.ratio('missed');
      expect(actual).assertEqual(46.67);
      log('testRatio0107 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0108
     * @tc.name      testEntries0108
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0108 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(3);
      expect(actual[0]).assertEqual('missed=7');
      log('testEntries0108 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0109
     * @tc.name      testCount0109
     * @tc.desc      count(rejected) after 4 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0109 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: number = stats.count('rejected');
      expect(actual).assertEqual(1);
      log('testCount0109 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0110
     * @tc.name      testTotal0110
     * @tc.desc      total() over 4 increments -> 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0110 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: number = stats.total();
      expect(actual).assertEqual(19);
      log('testTotal0110 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0111
     * @tc.name      testTopKey0111
     * @tc.desc      topKey() returns blocked
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0111 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('blocked');
      log('testTopKey0111 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0112
     * @tc.name      testSize0112
     * @tc.desc      size() counts 4 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0112 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: number = stats.size();
      expect(actual).assertEqual(4);
      log('testSize0112 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0113
     * @tc.name      testRatio0113
     * @tc.desc      ratio(rejected) -> 5.26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0113 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: number = stats.ratio('rejected');
      expect(actual).assertEqual(5.26);
      log('testRatio0113 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0114
     * @tc.name      testEntries0114
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0114 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(4);
      expect(actual[0]).assertEqual('rejected=1');
      log('testEntries0114 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0115
     * @tc.name      testCount0115
     * @tc.desc      count(blocked) after 5 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0115 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: number = stats.count('blocked');
      expect(actual).assertEqual(4);
      log('testCount0115 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0116
     * @tc.name      testTotal0116
     * @tc.desc      total() over 5 increments -> 27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0116 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: number = stats.total();
      expect(actual).assertEqual(27);
      log('testTotal0116 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0117
     * @tc.name      testTopKey0117
     * @tc.desc      topKey() returns outgoing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0117 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('outgoing');
      log('testTopKey0117 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0118
     * @tc.name      testSize0118
     * @tc.desc      size() counts 5 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0118 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: number = stats.size();
      expect(actual).assertEqual(5);
      log('testSize0118 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0119
     * @tc.name      testRatio0119
     * @tc.desc      ratio(blocked) -> 14.81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0119 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: number = stats.ratio('blocked');
      expect(actual).assertEqual(14.81);
      log('testRatio0119 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0120
     * @tc.name      testEntries0120
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0120 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(5);
      expect(actual[0]).assertEqual('blocked=4');
      log('testEntries0120 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0121
     * @tc.name      testCount0121
     * @tc.desc      count(incoming) after 1 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0121 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 7);
      const actual: number = stats.count('incoming');
      expect(actual).assertEqual(7);
      log('testCount0121 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0122
     * @tc.name      testTotal0122
     * @tc.desc      total() over 1 increments -> 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0122 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 7);
      const actual: number = stats.total();
      expect(actual).assertEqual(7);
      log('testTotal0122 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0123
     * @tc.name      testTopKey0123
     * @tc.desc      topKey() returns incoming
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0123 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 7);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('incoming');
      log('testTopKey0123 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0124
     * @tc.name      testSize0124
     * @tc.desc      size() counts 1 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0124 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 7);
      const actual: number = stats.size();
      expect(actual).assertEqual(1);
      log('testSize0124 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0125
     * @tc.name      testRatio0125
     * @tc.desc      ratio(incoming) -> 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0125 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 7);
      const actual: number = stats.ratio('incoming');
      expect(actual).assertEqual(100);
      log('testRatio0125 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0126
     * @tc.name      testEntries0126
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0126 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 7);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(1);
      expect(actual[0]).assertEqual('incoming=7');
      log('testEntries0126 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0127
     * @tc.name      testCount0127
     * @tc.desc      count(outgoing) after 2 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0127 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 1);
      stats.increment('missed', 8);
      const actual: number = stats.count('outgoing');
      expect(actual).assertEqual(1);
      log('testCount0127 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0128
     * @tc.name      testTotal0128
     * @tc.desc      total() over 2 increments -> 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0128 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 1);
      stats.increment('missed', 8);
      const actual: number = stats.total();
      expect(actual).assertEqual(9);
      log('testTotal0128 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0129
     * @tc.name      testTopKey0129
     * @tc.desc      topKey() returns missed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0129 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 1);
      stats.increment('missed', 8);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('missed');
      log('testTopKey0129 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0130
     * @tc.name      testSize0130
     * @tc.desc      size() counts 2 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0130 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 1);
      stats.increment('missed', 8);
      const actual: number = stats.size();
      expect(actual).assertEqual(2);
      log('testSize0130 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0131
     * @tc.name      testRatio0131
     * @tc.desc      ratio(outgoing) -> 11.11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0131 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 1);
      stats.increment('missed', 8);
      const actual: number = stats.ratio('outgoing');
      expect(actual).assertEqual(11.11);
      log('testRatio0131 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0132
     * @tc.name      testEntries0132
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0132 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 1);
      stats.increment('missed', 8);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(2);
      expect(actual[0]).assertEqual('outgoing=1');
      log('testEntries0132 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0133
     * @tc.name      testCount0133
     * @tc.desc      count(missed) after 3 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0133 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      stats.increment('blocked', 9);
      const actual: number = stats.count('missed');
      expect(actual).assertEqual(4);
      log('testCount0133 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0134
     * @tc.name      testTotal0134
     * @tc.desc      total() over 3 increments -> 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0134 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      stats.increment('blocked', 9);
      const actual: number = stats.total();
      expect(actual).assertEqual(15);
      log('testTotal0134 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0135
     * @tc.name      testTopKey0135
     * @tc.desc      topKey() returns blocked
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0135 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      stats.increment('blocked', 9);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('blocked');
      log('testTopKey0135 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0136
     * @tc.name      testSize0136
     * @tc.desc      size() counts 3 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0136 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      stats.increment('blocked', 9);
      const actual: number = stats.size();
      expect(actual).assertEqual(3);
      log('testSize0136 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0137
     * @tc.name      testRatio0137
     * @tc.desc      ratio(missed) -> 26.67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0137 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      stats.increment('blocked', 9);
      const actual: number = stats.ratio('missed');
      expect(actual).assertEqual(26.67);
      log('testRatio0137 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0138
     * @tc.name      testEntries0138
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0138 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      stats.increment('blocked', 9);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(3);
      expect(actual[0]).assertEqual('missed=4');
      log('testEntries0138 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0139
     * @tc.name      testCount0139
     * @tc.desc      count(rejected) after 4 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0139 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 7);
      stats.increment('blocked', 5);
      stats.increment('incoming', 3);
      stats.increment('outgoing', 1);
      const actual: number = stats.count('rejected');
      expect(actual).assertEqual(7);
      log('testCount0139 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0140
     * @tc.name      testTotal0140
     * @tc.desc      total() over 4 increments -> 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0140 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 7);
      stats.increment('blocked', 5);
      stats.increment('incoming', 3);
      stats.increment('outgoing', 1);
      const actual: number = stats.total();
      expect(actual).assertEqual(16);
      log('testTotal0140 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0141
     * @tc.name      testTopKey0141
     * @tc.desc      topKey() returns rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0141 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 7);
      stats.increment('blocked', 5);
      stats.increment('incoming', 3);
      stats.increment('outgoing', 1);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('rejected');
      log('testTopKey0141 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0142
     * @tc.name      testSize0142
     * @tc.desc      size() counts 4 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0142 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 7);
      stats.increment('blocked', 5);
      stats.increment('incoming', 3);
      stats.increment('outgoing', 1);
      const actual: number = stats.size();
      expect(actual).assertEqual(4);
      log('testSize0142 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0143
     * @tc.name      testRatio0143
     * @tc.desc      ratio(rejected) -> 43.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0143 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 7);
      stats.increment('blocked', 5);
      stats.increment('incoming', 3);
      stats.increment('outgoing', 1);
      const actual: number = stats.ratio('rejected');
      expect(actual).assertEqual(43.75);
      log('testRatio0143 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0144
     * @tc.name      testEntries0144
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0144 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 7);
      stats.increment('blocked', 5);
      stats.increment('incoming', 3);
      stats.increment('outgoing', 1);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(4);
      expect(actual[0]).assertEqual('rejected=7');
      log('testEntries0144 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0145
     * @tc.name      testCount0145
     * @tc.desc      count(blocked) after 5 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0145 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 1);
      stats.increment('incoming', 8);
      stats.increment('outgoing', 6);
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      const actual: number = stats.count('blocked');
      expect(actual).assertEqual(1);
      log('testCount0145 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0146
     * @tc.name      testTotal0146
     * @tc.desc      total() over 5 increments -> 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0146 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 1);
      stats.increment('incoming', 8);
      stats.increment('outgoing', 6);
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      const actual: number = stats.total();
      expect(actual).assertEqual(21);
      log('testTotal0146 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0147
     * @tc.name      testTopKey0147
     * @tc.desc      topKey() returns incoming
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0147 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 1);
      stats.increment('incoming', 8);
      stats.increment('outgoing', 6);
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('incoming');
      log('testTopKey0147 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0148
     * @tc.name      testSize0148
     * @tc.desc      size() counts 5 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0148 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 1);
      stats.increment('incoming', 8);
      stats.increment('outgoing', 6);
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      const actual: number = stats.size();
      expect(actual).assertEqual(5);
      log('testSize0148 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0149
     * @tc.name      testRatio0149
     * @tc.desc      ratio(blocked) -> 4.76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0149 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 1);
      stats.increment('incoming', 8);
      stats.increment('outgoing', 6);
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      const actual: number = stats.ratio('blocked');
      expect(actual).assertEqual(4.76);
      log('testRatio0149 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0150
     * @tc.name      testEntries0150
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0150 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 1);
      stats.increment('incoming', 8);
      stats.increment('outgoing', 6);
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(5);
      expect(actual[0]).assertEqual('blocked=1');
      log('testEntries0150 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0151
     * @tc.name      testCount0151
     * @tc.desc      count(incoming) after 1 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0151 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 4);
      const actual: number = stats.count('incoming');
      expect(actual).assertEqual(4);
      log('testCount0151 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0152
     * @tc.name      testTotal0152
     * @tc.desc      total() over 1 increments -> 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0152 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 4);
      const actual: number = stats.total();
      expect(actual).assertEqual(4);
      log('testTotal0152 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0153
     * @tc.name      testTopKey0153
     * @tc.desc      topKey() returns incoming
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0153 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 4);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('incoming');
      log('testTopKey0153 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0154
     * @tc.name      testSize0154
     * @tc.desc      size() counts 1 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0154 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 4);
      const actual: number = stats.size();
      expect(actual).assertEqual(1);
      log('testSize0154 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0155
     * @tc.name      testRatio0155
     * @tc.desc      ratio(incoming) -> 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0155 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 4);
      const actual: number = stats.ratio('incoming');
      expect(actual).assertEqual(100);
      log('testRatio0155 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0156
     * @tc.name      testEntries0156
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0156 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 4);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(1);
      expect(actual[0]).assertEqual('incoming=4');
      log('testEntries0156 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0157
     * @tc.name      testCount0157
     * @tc.desc      count(outgoing) after 2 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0157 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 7);
      stats.increment('missed', 5);
      const actual: number = stats.count('outgoing');
      expect(actual).assertEqual(7);
      log('testCount0157 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0158
     * @tc.name      testTotal0158
     * @tc.desc      total() over 2 increments -> 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0158 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 7);
      stats.increment('missed', 5);
      const actual: number = stats.total();
      expect(actual).assertEqual(12);
      log('testTotal0158 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0159
     * @tc.name      testTopKey0159
     * @tc.desc      topKey() returns outgoing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0159 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 7);
      stats.increment('missed', 5);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('outgoing');
      log('testTopKey0159 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0160
     * @tc.name      testSize0160
     * @tc.desc      size() counts 2 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0160 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 7);
      stats.increment('missed', 5);
      const actual: number = stats.size();
      expect(actual).assertEqual(2);
      log('testSize0160 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0161
     * @tc.name      testRatio0161
     * @tc.desc      ratio(outgoing) -> 58.33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0161 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 7);
      stats.increment('missed', 5);
      const actual: number = stats.ratio('outgoing');
      expect(actual).assertEqual(58.33);
      log('testRatio0161 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0162
     * @tc.name      testEntries0162
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0162 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 7);
      stats.increment('missed', 5);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(2);
      expect(actual[0]).assertEqual('outgoing=7');
      log('testEntries0162 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0163
     * @tc.name      testCount0163
     * @tc.desc      count(missed) after 3 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0163 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      stats.increment('blocked', 6);
      const actual: number = stats.count('missed');
      expect(actual).assertEqual(1);
      log('testCount0163 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0164
     * @tc.name      testTotal0164
     * @tc.desc      total() over 3 increments -> 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0164 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      stats.increment('blocked', 6);
      const actual: number = stats.total();
      expect(actual).assertEqual(15);
      log('testTotal0164 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0165
     * @tc.name      testTopKey0165
     * @tc.desc      topKey() returns rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0165 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      stats.increment('blocked', 6);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('rejected');
      log('testTopKey0165 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0166
     * @tc.name      testSize0166
     * @tc.desc      size() counts 3 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0166 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      stats.increment('blocked', 6);
      const actual: number = stats.size();
      expect(actual).assertEqual(3);
      log('testSize0166 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0167
     * @tc.name      testRatio0167
     * @tc.desc      ratio(missed) -> 6.67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0167 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      stats.increment('blocked', 6);
      const actual: number = stats.ratio('missed');
      expect(actual).assertEqual(6.67);
      log('testRatio0167 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0168
     * @tc.name      testEntries0168
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0168 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      stats.increment('blocked', 6);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(3);
      expect(actual[0]).assertEqual('missed=1');
      log('testEntries0168 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0169
     * @tc.name      testCount0169
     * @tc.desc      count(rejected) after 4 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0169 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 4);
      stats.increment('blocked', 2);
      stats.increment('incoming', 9);
      stats.increment('outgoing', 7);
      const actual: number = stats.count('rejected');
      expect(actual).assertEqual(4);
      log('testCount0169 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0170
     * @tc.name      testTotal0170
     * @tc.desc      total() over 4 increments -> 22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0170 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 4);
      stats.increment('blocked', 2);
      stats.increment('incoming', 9);
      stats.increment('outgoing', 7);
      const actual: number = stats.total();
      expect(actual).assertEqual(22);
      log('testTotal0170 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0171
     * @tc.name      testTopKey0171
     * @tc.desc      topKey() returns incoming
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0171 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 4);
      stats.increment('blocked', 2);
      stats.increment('incoming', 9);
      stats.increment('outgoing', 7);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('incoming');
      log('testTopKey0171 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0172
     * @tc.name      testSize0172
     * @tc.desc      size() counts 4 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0172 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 4);
      stats.increment('blocked', 2);
      stats.increment('incoming', 9);
      stats.increment('outgoing', 7);
      const actual: number = stats.size();
      expect(actual).assertEqual(4);
      log('testSize0172 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0173
     * @tc.name      testRatio0173
     * @tc.desc      ratio(rejected) -> 18.18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0173 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 4);
      stats.increment('blocked', 2);
      stats.increment('incoming', 9);
      stats.increment('outgoing', 7);
      const actual: number = stats.ratio('rejected');
      expect(actual).assertEqual(18.18);
      log('testRatio0173 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0174
     * @tc.name      testEntries0174
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0174 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 4);
      stats.increment('blocked', 2);
      stats.increment('incoming', 9);
      stats.increment('outgoing', 7);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(4);
      expect(actual[0]).assertEqual('rejected=4');
      log('testEntries0174 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0175
     * @tc.name      testCount0175
     * @tc.desc      count(blocked) after 5 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0175 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 7);
      stats.increment('incoming', 5);
      stats.increment('outgoing', 3);
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      const actual: number = stats.count('blocked');
      expect(actual).assertEqual(7);
      log('testCount0175 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0176
     * @tc.name      testTotal0176
     * @tc.desc      total() over 5 increments -> 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0176 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 7);
      stats.increment('incoming', 5);
      stats.increment('outgoing', 3);
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      const actual: number = stats.total();
      expect(actual).assertEqual(24);
      log('testTotal0176 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0177
     * @tc.name      testTopKey0177
     * @tc.desc      topKey() returns rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0177 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 7);
      stats.increment('incoming', 5);
      stats.increment('outgoing', 3);
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('rejected');
      log('testTopKey0177 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0178
     * @tc.name      testSize0178
     * @tc.desc      size() counts 5 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0178 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 7);
      stats.increment('incoming', 5);
      stats.increment('outgoing', 3);
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      const actual: number = stats.size();
      expect(actual).assertEqual(5);
      log('testSize0178 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0179
     * @tc.name      testRatio0179
     * @tc.desc      ratio(blocked) -> 29.17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0179 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 7);
      stats.increment('incoming', 5);
      stats.increment('outgoing', 3);
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      const actual: number = stats.ratio('blocked');
      expect(actual).assertEqual(29.17);
      log('testRatio0179 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0180
     * @tc.name      testEntries0180
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0180 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 7);
      stats.increment('incoming', 5);
      stats.increment('outgoing', 3);
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(5);
      expect(actual[0]).assertEqual('blocked=7');
      log('testEntries0180 end');
      await yieldToMain();
    })
  })
}
