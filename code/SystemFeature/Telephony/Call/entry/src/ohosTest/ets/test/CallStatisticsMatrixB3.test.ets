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
const TAG: string = 'CallStatisticsMatrixB3';
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

export default function callStatisticsMatrixB3Test(): void {
  describe('CallStatisticsMatrixB3', () => {
    /**
     * @tc.number    SUB_CALL_STATSB_0181
     * @tc.name      testRatio0181
     * @tc.desc      ratio(outgoing) -> 58.33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0181 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 7);
      stats.increment('missed', 5);
      const actual: number = stats.ratio('outgoing');
      expect(actual).assertEqual(58.33);
      log('testRatio0181 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0182
     * @tc.name      testEntries0182
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0182 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 7);
      stats.increment('missed', 5);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(2);
      expect(actual[0]).assertEqual('outgoing=7');
      log('testEntries0182 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0183
     * @tc.name      testCount0183
     * @tc.desc      count(missed) after 3 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0183 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      stats.increment('blocked', 6);
      const actual: number = stats.count('missed');
      expect(actual).assertEqual(1);
      log('testCount0183 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0184
     * @tc.name      testTotal0184
     * @tc.desc      total() over 3 increments -> 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0184 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      stats.increment('blocked', 6);
      const actual: number = stats.total();
      expect(actual).assertEqual(15);
      log('testTotal0184 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0185
     * @tc.name      testTopKey0185
     * @tc.desc      topKey() returns rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0185 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      stats.increment('blocked', 6);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('rejected');
      log('testTopKey0185 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0186
     * @tc.name      testSize0186
     * @tc.desc      size() counts 3 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0186 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      stats.increment('blocked', 6);
      const actual: number = stats.size();
      expect(actual).assertEqual(3);
      log('testSize0186 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0187
     * @tc.name      testRatio0187
     * @tc.desc      ratio(missed) -> 6.67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0187 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      stats.increment('blocked', 6);
      const actual: number = stats.ratio('missed');
      expect(actual).assertEqual(6.67);
      log('testRatio0187 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0188
     * @tc.name      testEntries0188
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0188 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      stats.increment('blocked', 6);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(3);
      expect(actual[0]).assertEqual('missed=1');
      log('testEntries0188 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0189
     * @tc.name      testCount0189
     * @tc.desc      count(rejected) after 4 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0189 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 4);
      stats.increment('blocked', 2);
      stats.increment('incoming', 9);
      stats.increment('outgoing', 7);
      const actual: number = stats.count('rejected');
      expect(actual).assertEqual(4);
      log('testCount0189 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0190
     * @tc.name      testTotal0190
     * @tc.desc      total() over 4 increments -> 22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0190 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 4);
      stats.increment('blocked', 2);
      stats.increment('incoming', 9);
      stats.increment('outgoing', 7);
      const actual: number = stats.total();
      expect(actual).assertEqual(22);
      log('testTotal0190 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0191
     * @tc.name      testTopKey0191
     * @tc.desc      topKey() returns incoming
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0191 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 4);
      stats.increment('blocked', 2);
      stats.increment('incoming', 9);
      stats.increment('outgoing', 7);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('incoming');
      log('testTopKey0191 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0192
     * @tc.name      testSize0192
     * @tc.desc      size() counts 4 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0192 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 4);
      stats.increment('blocked', 2);
      stats.increment('incoming', 9);
      stats.increment('outgoing', 7);
      const actual: number = stats.size();
      expect(actual).assertEqual(4);
      log('testSize0192 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0193
     * @tc.name      testRatio0193
     * @tc.desc      ratio(rejected) -> 18.18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0193 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 4);
      stats.increment('blocked', 2);
      stats.increment('incoming', 9);
      stats.increment('outgoing', 7);
      const actual: number = stats.ratio('rejected');
      expect(actual).assertEqual(18.18);
      log('testRatio0193 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0194
     * @tc.name      testEntries0194
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0194 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 4);
      stats.increment('blocked', 2);
      stats.increment('incoming', 9);
      stats.increment('outgoing', 7);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(4);
      expect(actual[0]).assertEqual('rejected=4');
      log('testEntries0194 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0195
     * @tc.name      testCount0195
     * @tc.desc      count(blocked) after 5 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0195 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 7);
      stats.increment('incoming', 5);
      stats.increment('outgoing', 3);
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      const actual: number = stats.count('blocked');
      expect(actual).assertEqual(7);
      log('testCount0195 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0196
     * @tc.name      testTotal0196
     * @tc.desc      total() over 5 increments -> 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0196 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 7);
      stats.increment('incoming', 5);
      stats.increment('outgoing', 3);
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      const actual: number = stats.total();
      expect(actual).assertEqual(24);
      log('testTotal0196 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0197
     * @tc.name      testTopKey0197
     * @tc.desc      topKey() returns rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0197 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 7);
      stats.increment('incoming', 5);
      stats.increment('outgoing', 3);
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('rejected');
      log('testTopKey0197 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0198
     * @tc.name      testSize0198
     * @tc.desc      size() counts 5 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0198 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 7);
      stats.increment('incoming', 5);
      stats.increment('outgoing', 3);
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      const actual: number = stats.size();
      expect(actual).assertEqual(5);
      log('testSize0198 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0199
     * @tc.name      testRatio0199
     * @tc.desc      ratio(blocked) -> 29.17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0199 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 7);
      stats.increment('incoming', 5);
      stats.increment('outgoing', 3);
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      const actual: number = stats.ratio('blocked');
      expect(actual).assertEqual(29.17);
      log('testRatio0199 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0200
     * @tc.name      testEntries0200
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0200 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 7);
      stats.increment('incoming', 5);
      stats.increment('outgoing', 3);
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(5);
      expect(actual[0]).assertEqual('blocked=7');
      log('testEntries0200 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0201
     * @tc.name      testCount0201
     * @tc.desc      count(incoming) after 1 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0201 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: number = stats.count('incoming');
      expect(actual).assertEqual(1);
      log('testCount0201 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0202
     * @tc.name      testTotal0202
     * @tc.desc      total() over 1 increments -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0202 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: number = stats.total();
      expect(actual).assertEqual(1);
      log('testTotal0202 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0203
     * @tc.name      testTopKey0203
     * @tc.desc      topKey() returns incoming
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0203 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('incoming');
      log('testTopKey0203 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0204
     * @tc.name      testSize0204
     * @tc.desc      size() counts 1 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0204 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: number = stats.size();
      expect(actual).assertEqual(1);
      log('testSize0204 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0205
     * @tc.name      testRatio0205
     * @tc.desc      ratio(incoming) -> 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0205 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: number = stats.ratio('incoming');
      expect(actual).assertEqual(100);
      log('testRatio0205 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0206
     * @tc.name      testEntries0206
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0206 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(1);
      expect(actual[0]).assertEqual('incoming=1');
      log('testEntries0206 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0207
     * @tc.name      testCount0207
     * @tc.desc      count(outgoing) after 2 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0207 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: number = stats.count('outgoing');
      expect(actual).assertEqual(4);
      log('testCount0207 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0208
     * @tc.name      testTotal0208
     * @tc.desc      total() over 2 increments -> 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0208 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: number = stats.total();
      expect(actual).assertEqual(6);
      log('testTotal0208 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0209
     * @tc.name      testTopKey0209
     * @tc.desc      topKey() returns outgoing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0209 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('outgoing');
      log('testTopKey0209 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0210
     * @tc.name      testSize0210
     * @tc.desc      size() counts 2 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0210 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: number = stats.size();
      expect(actual).assertEqual(2);
      log('testSize0210 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0211
     * @tc.name      testRatio0211
     * @tc.desc      ratio(outgoing) -> 66.67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0211 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: number = stats.ratio('outgoing');
      expect(actual).assertEqual(66.67);
      log('testRatio0211 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0212
     * @tc.name      testEntries0212
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0212 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(2);
      expect(actual[0]).assertEqual('outgoing=4');
      log('testEntries0212 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0213
     * @tc.name      testCount0213
     * @tc.desc      count(missed) after 3 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0213 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: number = stats.count('missed');
      expect(actual).assertEqual(7);
      log('testCount0213 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0214
     * @tc.name      testTotal0214
     * @tc.desc      total() over 3 increments -> 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0214 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: number = stats.total();
      expect(actual).assertEqual(15);
      log('testTotal0214 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0215
     * @tc.name      testTopKey0215
     * @tc.desc      topKey() returns missed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0215 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('missed');
      log('testTopKey0215 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0216
     * @tc.name      testSize0216
     * @tc.desc      size() counts 3 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0216 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: number = stats.size();
      expect(actual).assertEqual(3);
      log('testSize0216 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0217
     * @tc.name      testRatio0217
     * @tc.desc      ratio(missed) -> 46.67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0217 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: number = stats.ratio('missed');
      expect(actual).assertEqual(46.67);
      log('testRatio0217 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0218
     * @tc.name      testEntries0218
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0218 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(3);
      expect(actual[0]).assertEqual('missed=7');
      log('testEntries0218 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0219
     * @tc.name      testCount0219
     * @tc.desc      count(rejected) after 4 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0219 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: number = stats.count('rejected');
      expect(actual).assertEqual(1);
      log('testCount0219 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0220
     * @tc.name      testTotal0220
     * @tc.desc      total() over 4 increments -> 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0220 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: number = stats.total();
      expect(actual).assertEqual(19);
      log('testTotal0220 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0221
     * @tc.name      testTopKey0221
     * @tc.desc      topKey() returns blocked
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0221 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('blocked');
      log('testTopKey0221 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0222
     * @tc.name      testSize0222
     * @tc.desc      size() counts 4 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0222 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: number = stats.size();
      expect(actual).assertEqual(4);
      log('testSize0222 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0223
     * @tc.name      testRatio0223
     * @tc.desc      ratio(rejected) -> 5.26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0223 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: number = stats.ratio('rejected');
      expect(actual).assertEqual(5.26);
      log('testRatio0223 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0224
     * @tc.name      testEntries0224
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0224 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(4);
      expect(actual[0]).assertEqual('rejected=1');
      log('testEntries0224 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0225
     * @tc.name      testCount0225
     * @tc.desc      count(blocked) after 5 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0225 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: number = stats.count('blocked');
      expect(actual).assertEqual(4);
      log('testCount0225 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0226
     * @tc.name      testTotal0226
     * @tc.desc      total() over 5 increments -> 27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0226 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: number = stats.total();
      expect(actual).assertEqual(27);
      log('testTotal0226 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0227
     * @tc.name      testTopKey0227
     * @tc.desc      topKey() returns outgoing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0227 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('outgoing');
      log('testTopKey0227 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0228
     * @tc.name      testSize0228
     * @tc.desc      size() counts 5 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0228 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: number = stats.size();
      expect(actual).assertEqual(5);
      log('testSize0228 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0229
     * @tc.name      testRatio0229
     * @tc.desc      ratio(blocked) -> 14.81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0229 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: number = stats.ratio('blocked');
      expect(actual).assertEqual(14.81);
      log('testRatio0229 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0230
     * @tc.name      testEntries0230
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0230 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(5);
      expect(actual[0]).assertEqual('blocked=4');
      log('testEntries0230 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0231
     * @tc.name      testEmpty0231
     * @tc.desc      an empty statistics object reports zero values
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEmpty0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEmpty0231 begin');
      const stats: CallStatistics = new CallStatistics();
      expect(stats.total()).assertEqual(0);
      expect(stats.size()).assertEqual(0);
      expect(stats.topKey()).assertEqual('');
      expect(stats.ratio('incoming')).assertEqual(0);
      log('testEmpty0231 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0232
     * @tc.name      testClear0232
     * @tc.desc      clear resets counters
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testClear0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testClear0232 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming');
      stats.increment('incoming');
      stats.clear();
      expect(stats.total()).assertEqual(0);
      expect(stats.size()).assertEqual(0);
      log('testClear0232 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0233
     * @tc.name      testNegativeDelta0233
     * @tc.desc      a negative delta is treated as zero
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNegativeDelta0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNegativeDelta0233 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', -5);
      expect(stats.count('incoming')).assertEqual(0);
      expect(stats.total()).assertEqual(0);
      log('testNegativeDelta0233 end');
      await yieldToMain();
    })
  })
}
