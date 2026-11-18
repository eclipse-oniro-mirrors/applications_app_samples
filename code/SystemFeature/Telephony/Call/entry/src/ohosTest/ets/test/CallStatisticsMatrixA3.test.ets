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
const TAG: string = 'CallStatisticsMatrixA3';
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

export default function callStatisticsMatrixA3Test(): void {
  describe('CallStatisticsMatrixA3', () => {
    /**
     * @tc.number    SUB_CALL_STATSA_0181
     * @tc.name      testCount0181
     * @tc.desc      count(incoming) after 1 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0181 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: number = stats.count('incoming');
      expect(actual).assertEqual(1);
      log('testCount0181 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0182
     * @tc.name      testTotal0182
     * @tc.desc      total() over 1 increments -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0182 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: number = stats.total();
      expect(actual).assertEqual(1);
      log('testTotal0182 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0183
     * @tc.name      testTopKey0183
     * @tc.desc      topKey() returns incoming
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0183 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('incoming');
      log('testTopKey0183 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0184
     * @tc.name      testSize0184
     * @tc.desc      size() counts 1 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0184 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: number = stats.size();
      expect(actual).assertEqual(1);
      log('testSize0184 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0185
     * @tc.name      testRatio0185
     * @tc.desc      ratio(incoming) -> 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0185 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: number = stats.ratio('incoming');
      expect(actual).assertEqual(100);
      log('testRatio0185 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0186
     * @tc.name      testEntries0186
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0186 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(1);
      expect(actual[0]).assertEqual('incoming=1');
      log('testEntries0186 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0187
     * @tc.name      testCount0187
     * @tc.desc      count(outgoing) after 2 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0187 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: number = stats.count('outgoing');
      expect(actual).assertEqual(4);
      log('testCount0187 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0188
     * @tc.name      testTotal0188
     * @tc.desc      total() over 2 increments -> 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0188 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: number = stats.total();
      expect(actual).assertEqual(6);
      log('testTotal0188 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0189
     * @tc.name      testTopKey0189
     * @tc.desc      topKey() returns outgoing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0189 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('outgoing');
      log('testTopKey0189 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0190
     * @tc.name      testSize0190
     * @tc.desc      size() counts 2 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0190 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: number = stats.size();
      expect(actual).assertEqual(2);
      log('testSize0190 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0191
     * @tc.name      testRatio0191
     * @tc.desc      ratio(outgoing) -> 66.67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0191 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: number = stats.ratio('outgoing');
      expect(actual).assertEqual(66.67);
      log('testRatio0191 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0192
     * @tc.name      testEntries0192
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0192 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(2);
      expect(actual[0]).assertEqual('outgoing=4');
      log('testEntries0192 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0193
     * @tc.name      testCount0193
     * @tc.desc      count(missed) after 3 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0193 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: number = stats.count('missed');
      expect(actual).assertEqual(7);
      log('testCount0193 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0194
     * @tc.name      testTotal0194
     * @tc.desc      total() over 3 increments -> 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0194 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: number = stats.total();
      expect(actual).assertEqual(15);
      log('testTotal0194 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0195
     * @tc.name      testTopKey0195
     * @tc.desc      topKey() returns missed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0195 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('missed');
      log('testTopKey0195 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0196
     * @tc.name      testSize0196
     * @tc.desc      size() counts 3 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0196 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: number = stats.size();
      expect(actual).assertEqual(3);
      log('testSize0196 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0197
     * @tc.name      testRatio0197
     * @tc.desc      ratio(missed) -> 46.67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0197 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: number = stats.ratio('missed');
      expect(actual).assertEqual(46.67);
      log('testRatio0197 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0198
     * @tc.name      testEntries0198
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0198 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(3);
      expect(actual[0]).assertEqual('missed=7');
      log('testEntries0198 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0199
     * @tc.name      testCount0199
     * @tc.desc      count(rejected) after 4 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0199 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: number = stats.count('rejected');
      expect(actual).assertEqual(1);
      log('testCount0199 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0200
     * @tc.name      testTotal0200
     * @tc.desc      total() over 4 increments -> 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0200 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: number = stats.total();
      expect(actual).assertEqual(19);
      log('testTotal0200 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0201
     * @tc.name      testTopKey0201
     * @tc.desc      topKey() returns blocked
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0201 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('blocked');
      log('testTopKey0201 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0202
     * @tc.name      testSize0202
     * @tc.desc      size() counts 4 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0202 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: number = stats.size();
      expect(actual).assertEqual(4);
      log('testSize0202 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0203
     * @tc.name      testRatio0203
     * @tc.desc      ratio(rejected) -> 5.26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0203 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: number = stats.ratio('rejected');
      expect(actual).assertEqual(5.26);
      log('testRatio0203 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0204
     * @tc.name      testEntries0204
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0204 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(4);
      expect(actual[0]).assertEqual('rejected=1');
      log('testEntries0204 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0205
     * @tc.name      testCount0205
     * @tc.desc      count(blocked) after 5 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0205 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: number = stats.count('blocked');
      expect(actual).assertEqual(4);
      log('testCount0205 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0206
     * @tc.name      testTotal0206
     * @tc.desc      total() over 5 increments -> 27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0206 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: number = stats.total();
      expect(actual).assertEqual(27);
      log('testTotal0206 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0207
     * @tc.name      testTopKey0207
     * @tc.desc      topKey() returns outgoing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0207 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('outgoing');
      log('testTopKey0207 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0208
     * @tc.name      testSize0208
     * @tc.desc      size() counts 5 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0208 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: number = stats.size();
      expect(actual).assertEqual(5);
      log('testSize0208 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0209
     * @tc.name      testRatio0209
     * @tc.desc      ratio(blocked) -> 14.81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0209 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: number = stats.ratio('blocked');
      expect(actual).assertEqual(14.81);
      log('testRatio0209 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0210
     * @tc.name      testEntries0210
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0210 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(5);
      expect(actual[0]).assertEqual('blocked=4');
      log('testEntries0210 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0211
     * @tc.name      testCount0211
     * @tc.desc      count(incoming) after 1 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0211 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 7);
      const actual: number = stats.count('incoming');
      expect(actual).assertEqual(7);
      log('testCount0211 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0212
     * @tc.name      testTotal0212
     * @tc.desc      total() over 1 increments -> 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0212 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 7);
      const actual: number = stats.total();
      expect(actual).assertEqual(7);
      log('testTotal0212 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0213
     * @tc.name      testTopKey0213
     * @tc.desc      topKey() returns incoming
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0213 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 7);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('incoming');
      log('testTopKey0213 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0214
     * @tc.name      testSize0214
     * @tc.desc      size() counts 1 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0214 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 7);
      const actual: number = stats.size();
      expect(actual).assertEqual(1);
      log('testSize0214 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0215
     * @tc.name      testRatio0215
     * @tc.desc      ratio(incoming) -> 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0215 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 7);
      const actual: number = stats.ratio('incoming');
      expect(actual).assertEqual(100);
      log('testRatio0215 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0216
     * @tc.name      testEntries0216
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0216 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 7);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(1);
      expect(actual[0]).assertEqual('incoming=7');
      log('testEntries0216 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0217
     * @tc.name      testCount0217
     * @tc.desc      count(outgoing) after 2 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0217 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 1);
      stats.increment('missed', 8);
      const actual: number = stats.count('outgoing');
      expect(actual).assertEqual(1);
      log('testCount0217 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0218
     * @tc.name      testTotal0218
     * @tc.desc      total() over 2 increments -> 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0218 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 1);
      stats.increment('missed', 8);
      const actual: number = stats.total();
      expect(actual).assertEqual(9);
      log('testTotal0218 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0219
     * @tc.name      testTopKey0219
     * @tc.desc      topKey() returns missed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0219 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 1);
      stats.increment('missed', 8);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('missed');
      log('testTopKey0219 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0220
     * @tc.name      testSize0220
     * @tc.desc      size() counts 2 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0220 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 1);
      stats.increment('missed', 8);
      const actual: number = stats.size();
      expect(actual).assertEqual(2);
      log('testSize0220 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0221
     * @tc.name      testRatio0221
     * @tc.desc      ratio(outgoing) -> 11.11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0221 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 1);
      stats.increment('missed', 8);
      const actual: number = stats.ratio('outgoing');
      expect(actual).assertEqual(11.11);
      log('testRatio0221 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0222
     * @tc.name      testEntries0222
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0222 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 1);
      stats.increment('missed', 8);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(2);
      expect(actual[0]).assertEqual('outgoing=1');
      log('testEntries0222 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0223
     * @tc.name      testCount0223
     * @tc.desc      count(missed) after 3 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0223 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      stats.increment('blocked', 9);
      const actual: number = stats.count('missed');
      expect(actual).assertEqual(4);
      log('testCount0223 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0224
     * @tc.name      testTotal0224
     * @tc.desc      total() over 3 increments -> 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0224 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      stats.increment('blocked', 9);
      const actual: number = stats.total();
      expect(actual).assertEqual(15);
      log('testTotal0224 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0225
     * @tc.name      testTopKey0225
     * @tc.desc      topKey() returns blocked
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0225 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      stats.increment('blocked', 9);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('blocked');
      log('testTopKey0225 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0226
     * @tc.name      testSize0226
     * @tc.desc      size() counts 3 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0226 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      stats.increment('blocked', 9);
      const actual: number = stats.size();
      expect(actual).assertEqual(3);
      log('testSize0226 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0227
     * @tc.name      testRatio0227
     * @tc.desc      ratio(missed) -> 26.67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0227 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      stats.increment('blocked', 9);
      const actual: number = stats.ratio('missed');
      expect(actual).assertEqual(26.67);
      log('testRatio0227 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0228
     * @tc.name      testEntries0228
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0228 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      stats.increment('blocked', 9);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(3);
      expect(actual[0]).assertEqual('missed=4');
      log('testEntries0228 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0229
     * @tc.name      testCount0229
     * @tc.desc      count(rejected) after 4 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0229 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 7);
      stats.increment('blocked', 5);
      stats.increment('incoming', 3);
      stats.increment('outgoing', 1);
      const actual: number = stats.count('rejected');
      expect(actual).assertEqual(7);
      log('testCount0229 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0230
     * @tc.name      testTotal0230
     * @tc.desc      total() over 4 increments -> 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0230 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 7);
      stats.increment('blocked', 5);
      stats.increment('incoming', 3);
      stats.increment('outgoing', 1);
      const actual: number = stats.total();
      expect(actual).assertEqual(16);
      log('testTotal0230 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0231
     * @tc.name      testTopKey0231
     * @tc.desc      topKey() returns rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0231 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 7);
      stats.increment('blocked', 5);
      stats.increment('incoming', 3);
      stats.increment('outgoing', 1);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('rejected');
      log('testTopKey0231 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0232
     * @tc.name      testSize0232
     * @tc.desc      size() counts 4 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0232 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 7);
      stats.increment('blocked', 5);
      stats.increment('incoming', 3);
      stats.increment('outgoing', 1);
      const actual: number = stats.size();
      expect(actual).assertEqual(4);
      log('testSize0232 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0233
     * @tc.name      testRatio0233
     * @tc.desc      ratio(rejected) -> 43.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0233 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 7);
      stats.increment('blocked', 5);
      stats.increment('incoming', 3);
      stats.increment('outgoing', 1);
      const actual: number = stats.ratio('rejected');
      expect(actual).assertEqual(43.75);
      log('testRatio0233 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0234
     * @tc.name      testEntries0234
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0234 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 7);
      stats.increment('blocked', 5);
      stats.increment('incoming', 3);
      stats.increment('outgoing', 1);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(4);
      expect(actual[0]).assertEqual('rejected=7');
      log('testEntries0234 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0235
     * @tc.name      testCount0235
     * @tc.desc      count(blocked) after 5 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0235 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 1);
      stats.increment('incoming', 8);
      stats.increment('outgoing', 6);
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      const actual: number = stats.count('blocked');
      expect(actual).assertEqual(1);
      log('testCount0235 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0236
     * @tc.name      testTotal0236
     * @tc.desc      total() over 5 increments -> 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0236 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 1);
      stats.increment('incoming', 8);
      stats.increment('outgoing', 6);
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      const actual: number = stats.total();
      expect(actual).assertEqual(21);
      log('testTotal0236 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0237
     * @tc.name      testTopKey0237
     * @tc.desc      topKey() returns incoming
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0237 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 1);
      stats.increment('incoming', 8);
      stats.increment('outgoing', 6);
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('incoming');
      log('testTopKey0237 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0238
     * @tc.name      testSize0238
     * @tc.desc      size() counts 5 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0238 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 1);
      stats.increment('incoming', 8);
      stats.increment('outgoing', 6);
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      const actual: number = stats.size();
      expect(actual).assertEqual(5);
      log('testSize0238 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0239
     * @tc.name      testRatio0239
     * @tc.desc      ratio(blocked) -> 4.76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0239 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 1);
      stats.increment('incoming', 8);
      stats.increment('outgoing', 6);
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      const actual: number = stats.ratio('blocked');
      expect(actual).assertEqual(4.76);
      log('testRatio0239 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0240
     * @tc.name      testEntries0240
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0240 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 1);
      stats.increment('incoming', 8);
      stats.increment('outgoing', 6);
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(5);
      expect(actual[0]).assertEqual('blocked=1');
      log('testEntries0240 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0241
     * @tc.name      testCount0241
     * @tc.desc      count(incoming) after 1 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0241 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 4);
      const actual: number = stats.count('incoming');
      expect(actual).assertEqual(4);
      log('testCount0241 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0242
     * @tc.name      testTotal0242
     * @tc.desc      total() over 1 increments -> 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0242 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 4);
      const actual: number = stats.total();
      expect(actual).assertEqual(4);
      log('testTotal0242 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0243
     * @tc.name      testTopKey0243
     * @tc.desc      topKey() returns incoming
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0243 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 4);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('incoming');
      log('testTopKey0243 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0244
     * @tc.name      testSize0244
     * @tc.desc      size() counts 1 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0244 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 4);
      const actual: number = stats.size();
      expect(actual).assertEqual(1);
      log('testSize0244 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0245
     * @tc.name      testRatio0245
     * @tc.desc      ratio(incoming) -> 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0245 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 4);
      const actual: number = stats.ratio('incoming');
      expect(actual).assertEqual(100);
      log('testRatio0245 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0246
     * @tc.name      testEntries0246
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0246 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 4);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(1);
      expect(actual[0]).assertEqual('incoming=4');
      log('testEntries0246 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0247
     * @tc.name      testCount0247
     * @tc.desc      count(outgoing) after 2 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0247 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 7);
      stats.increment('missed', 5);
      const actual: number = stats.count('outgoing');
      expect(actual).assertEqual(7);
      log('testCount0247 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0248
     * @tc.name      testTotal0248
     * @tc.desc      total() over 2 increments -> 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0248 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 7);
      stats.increment('missed', 5);
      const actual: number = stats.total();
      expect(actual).assertEqual(12);
      log('testTotal0248 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0249
     * @tc.name      testTopKey0249
     * @tc.desc      topKey() returns outgoing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0249 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 7);
      stats.increment('missed', 5);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('outgoing');
      log('testTopKey0249 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0250
     * @tc.name      testSize0250
     * @tc.desc      size() counts 2 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0250 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 7);
      stats.increment('missed', 5);
      const actual: number = stats.size();
      expect(actual).assertEqual(2);
      log('testSize0250 end');
      await yieldToMain();
    })
  })
}
