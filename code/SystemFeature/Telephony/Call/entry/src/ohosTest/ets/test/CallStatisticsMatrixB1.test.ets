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
const TAG: string = 'CallStatisticsMatrixB1';
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

export default function callStatisticsMatrixB1Test(): void {
  describe('CallStatisticsMatrixB1', () => {
    /**
     * @tc.number    SUB_CALL_STATSB_0001
     * @tc.name      testRatio0001
     * @tc.desc      ratio(outgoing) -> 58.33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0001 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 7);
      stats.increment('missed', 5);
      const actual: number = stats.ratio('outgoing');
      expect(actual).assertEqual(58.33);
      log('testRatio0001 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0002
     * @tc.name      testEntries0002
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0002 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 7);
      stats.increment('missed', 5);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(2);
      expect(actual[0]).assertEqual('outgoing=7');
      log('testEntries0002 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0003
     * @tc.name      testCount0003
     * @tc.desc      count(missed) after 3 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0003 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      stats.increment('blocked', 6);
      const actual: number = stats.count('missed');
      expect(actual).assertEqual(1);
      log('testCount0003 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0004
     * @tc.name      testTotal0004
     * @tc.desc      total() over 3 increments -> 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0004 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      stats.increment('blocked', 6);
      const actual: number = stats.total();
      expect(actual).assertEqual(15);
      log('testTotal0004 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0005
     * @tc.name      testTopKey0005
     * @tc.desc      topKey() returns rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0005 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      stats.increment('blocked', 6);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('rejected');
      log('testTopKey0005 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0006
     * @tc.name      testSize0006
     * @tc.desc      size() counts 3 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0006 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      stats.increment('blocked', 6);
      const actual: number = stats.size();
      expect(actual).assertEqual(3);
      log('testSize0006 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0007
     * @tc.name      testRatio0007
     * @tc.desc      ratio(missed) -> 6.67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0007 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      stats.increment('blocked', 6);
      const actual: number = stats.ratio('missed');
      expect(actual).assertEqual(6.67);
      log('testRatio0007 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0008
     * @tc.name      testEntries0008
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0008 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      stats.increment('blocked', 6);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(3);
      expect(actual[0]).assertEqual('missed=1');
      log('testEntries0008 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0009
     * @tc.name      testCount0009
     * @tc.desc      count(rejected) after 4 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0009 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 4);
      stats.increment('blocked', 2);
      stats.increment('incoming', 9);
      stats.increment('outgoing', 7);
      const actual: number = stats.count('rejected');
      expect(actual).assertEqual(4);
      log('testCount0009 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0010
     * @tc.name      testTotal0010
     * @tc.desc      total() over 4 increments -> 22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0010 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 4);
      stats.increment('blocked', 2);
      stats.increment('incoming', 9);
      stats.increment('outgoing', 7);
      const actual: number = stats.total();
      expect(actual).assertEqual(22);
      log('testTotal0010 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0011
     * @tc.name      testTopKey0011
     * @tc.desc      topKey() returns incoming
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0011 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 4);
      stats.increment('blocked', 2);
      stats.increment('incoming', 9);
      stats.increment('outgoing', 7);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('incoming');
      log('testTopKey0011 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0012
     * @tc.name      testSize0012
     * @tc.desc      size() counts 4 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0012 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 4);
      stats.increment('blocked', 2);
      stats.increment('incoming', 9);
      stats.increment('outgoing', 7);
      const actual: number = stats.size();
      expect(actual).assertEqual(4);
      log('testSize0012 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0013
     * @tc.name      testRatio0013
     * @tc.desc      ratio(rejected) -> 18.18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0013 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 4);
      stats.increment('blocked', 2);
      stats.increment('incoming', 9);
      stats.increment('outgoing', 7);
      const actual: number = stats.ratio('rejected');
      expect(actual).assertEqual(18.18);
      log('testRatio0013 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0014
     * @tc.name      testEntries0014
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0014 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 4);
      stats.increment('blocked', 2);
      stats.increment('incoming', 9);
      stats.increment('outgoing', 7);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(4);
      expect(actual[0]).assertEqual('rejected=4');
      log('testEntries0014 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0015
     * @tc.name      testCount0015
     * @tc.desc      count(blocked) after 5 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0015 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 7);
      stats.increment('incoming', 5);
      stats.increment('outgoing', 3);
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      const actual: number = stats.count('blocked');
      expect(actual).assertEqual(7);
      log('testCount0015 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0016
     * @tc.name      testTotal0016
     * @tc.desc      total() over 5 increments -> 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0016 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 7);
      stats.increment('incoming', 5);
      stats.increment('outgoing', 3);
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      const actual: number = stats.total();
      expect(actual).assertEqual(24);
      log('testTotal0016 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0017
     * @tc.name      testTopKey0017
     * @tc.desc      topKey() returns rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0017 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 7);
      stats.increment('incoming', 5);
      stats.increment('outgoing', 3);
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('rejected');
      log('testTopKey0017 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0018
     * @tc.name      testSize0018
     * @tc.desc      size() counts 5 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0018 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 7);
      stats.increment('incoming', 5);
      stats.increment('outgoing', 3);
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      const actual: number = stats.size();
      expect(actual).assertEqual(5);
      log('testSize0018 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0019
     * @tc.name      testRatio0019
     * @tc.desc      ratio(blocked) -> 29.17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0019 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 7);
      stats.increment('incoming', 5);
      stats.increment('outgoing', 3);
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      const actual: number = stats.ratio('blocked');
      expect(actual).assertEqual(29.17);
      log('testRatio0019 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0020
     * @tc.name      testEntries0020
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0020 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 7);
      stats.increment('incoming', 5);
      stats.increment('outgoing', 3);
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(5);
      expect(actual[0]).assertEqual('blocked=7');
      log('testEntries0020 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0021
     * @tc.name      testCount0021
     * @tc.desc      count(incoming) after 1 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0021 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: number = stats.count('incoming');
      expect(actual).assertEqual(1);
      log('testCount0021 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0022
     * @tc.name      testTotal0022
     * @tc.desc      total() over 1 increments -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0022 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: number = stats.total();
      expect(actual).assertEqual(1);
      log('testTotal0022 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0023
     * @tc.name      testTopKey0023
     * @tc.desc      topKey() returns incoming
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0023 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('incoming');
      log('testTopKey0023 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0024
     * @tc.name      testSize0024
     * @tc.desc      size() counts 1 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0024 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: number = stats.size();
      expect(actual).assertEqual(1);
      log('testSize0024 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0025
     * @tc.name      testRatio0025
     * @tc.desc      ratio(incoming) -> 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0025 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: number = stats.ratio('incoming');
      expect(actual).assertEqual(100);
      log('testRatio0025 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0026
     * @tc.name      testEntries0026
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0026 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(1);
      expect(actual[0]).assertEqual('incoming=1');
      log('testEntries0026 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0027
     * @tc.name      testCount0027
     * @tc.desc      count(outgoing) after 2 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0027 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: number = stats.count('outgoing');
      expect(actual).assertEqual(4);
      log('testCount0027 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0028
     * @tc.name      testTotal0028
     * @tc.desc      total() over 2 increments -> 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0028 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: number = stats.total();
      expect(actual).assertEqual(6);
      log('testTotal0028 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0029
     * @tc.name      testTopKey0029
     * @tc.desc      topKey() returns outgoing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0029 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('outgoing');
      log('testTopKey0029 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0030
     * @tc.name      testSize0030
     * @tc.desc      size() counts 2 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0030 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: number = stats.size();
      expect(actual).assertEqual(2);
      log('testSize0030 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0031
     * @tc.name      testRatio0031
     * @tc.desc      ratio(outgoing) -> 66.67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0031 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: number = stats.ratio('outgoing');
      expect(actual).assertEqual(66.67);
      log('testRatio0031 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0032
     * @tc.name      testEntries0032
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0032 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(2);
      expect(actual[0]).assertEqual('outgoing=4');
      log('testEntries0032 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0033
     * @tc.name      testCount0033
     * @tc.desc      count(missed) after 3 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0033 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: number = stats.count('missed');
      expect(actual).assertEqual(7);
      log('testCount0033 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0034
     * @tc.name      testTotal0034
     * @tc.desc      total() over 3 increments -> 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0034 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: number = stats.total();
      expect(actual).assertEqual(15);
      log('testTotal0034 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0035
     * @tc.name      testTopKey0035
     * @tc.desc      topKey() returns missed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0035 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('missed');
      log('testTopKey0035 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0036
     * @tc.name      testSize0036
     * @tc.desc      size() counts 3 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0036 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: number = stats.size();
      expect(actual).assertEqual(3);
      log('testSize0036 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0037
     * @tc.name      testRatio0037
     * @tc.desc      ratio(missed) -> 46.67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0037 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: number = stats.ratio('missed');
      expect(actual).assertEqual(46.67);
      log('testRatio0037 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0038
     * @tc.name      testEntries0038
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0038 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(3);
      expect(actual[0]).assertEqual('missed=7');
      log('testEntries0038 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0039
     * @tc.name      testCount0039
     * @tc.desc      count(rejected) after 4 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0039 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: number = stats.count('rejected');
      expect(actual).assertEqual(1);
      log('testCount0039 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0040
     * @tc.name      testTotal0040
     * @tc.desc      total() over 4 increments -> 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0040 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: number = stats.total();
      expect(actual).assertEqual(19);
      log('testTotal0040 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0041
     * @tc.name      testTopKey0041
     * @tc.desc      topKey() returns blocked
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0041 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('blocked');
      log('testTopKey0041 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0042
     * @tc.name      testSize0042
     * @tc.desc      size() counts 4 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0042 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: number = stats.size();
      expect(actual).assertEqual(4);
      log('testSize0042 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0043
     * @tc.name      testRatio0043
     * @tc.desc      ratio(rejected) -> 5.26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0043 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: number = stats.ratio('rejected');
      expect(actual).assertEqual(5.26);
      log('testRatio0043 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0044
     * @tc.name      testEntries0044
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0044 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(4);
      expect(actual[0]).assertEqual('rejected=1');
      log('testEntries0044 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0045
     * @tc.name      testCount0045
     * @tc.desc      count(blocked) after 5 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0045 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: number = stats.count('blocked');
      expect(actual).assertEqual(4);
      log('testCount0045 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0046
     * @tc.name      testTotal0046
     * @tc.desc      total() over 5 increments -> 27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0046 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: number = stats.total();
      expect(actual).assertEqual(27);
      log('testTotal0046 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0047
     * @tc.name      testTopKey0047
     * @tc.desc      topKey() returns outgoing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0047 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('outgoing');
      log('testTopKey0047 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0048
     * @tc.name      testSize0048
     * @tc.desc      size() counts 5 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0048 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: number = stats.size();
      expect(actual).assertEqual(5);
      log('testSize0048 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0049
     * @tc.name      testRatio0049
     * @tc.desc      ratio(blocked) -> 14.81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0049 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: number = stats.ratio('blocked');
      expect(actual).assertEqual(14.81);
      log('testRatio0049 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0050
     * @tc.name      testEntries0050
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0050 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(5);
      expect(actual[0]).assertEqual('blocked=4');
      log('testEntries0050 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0051
     * @tc.name      testCount0051
     * @tc.desc      count(incoming) after 1 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0051 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 7);
      const actual: number = stats.count('incoming');
      expect(actual).assertEqual(7);
      log('testCount0051 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0052
     * @tc.name      testTotal0052
     * @tc.desc      total() over 1 increments -> 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0052 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 7);
      const actual: number = stats.total();
      expect(actual).assertEqual(7);
      log('testTotal0052 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0053
     * @tc.name      testTopKey0053
     * @tc.desc      topKey() returns incoming
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0053 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 7);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('incoming');
      log('testTopKey0053 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0054
     * @tc.name      testSize0054
     * @tc.desc      size() counts 1 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0054 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 7);
      const actual: number = stats.size();
      expect(actual).assertEqual(1);
      log('testSize0054 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0055
     * @tc.name      testRatio0055
     * @tc.desc      ratio(incoming) -> 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0055 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 7);
      const actual: number = stats.ratio('incoming');
      expect(actual).assertEqual(100);
      log('testRatio0055 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0056
     * @tc.name      testEntries0056
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0056 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 7);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(1);
      expect(actual[0]).assertEqual('incoming=7');
      log('testEntries0056 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0057
     * @tc.name      testCount0057
     * @tc.desc      count(outgoing) after 2 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0057 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 1);
      stats.increment('missed', 8);
      const actual: number = stats.count('outgoing');
      expect(actual).assertEqual(1);
      log('testCount0057 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0058
     * @tc.name      testTotal0058
     * @tc.desc      total() over 2 increments -> 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0058 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 1);
      stats.increment('missed', 8);
      const actual: number = stats.total();
      expect(actual).assertEqual(9);
      log('testTotal0058 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0059
     * @tc.name      testTopKey0059
     * @tc.desc      topKey() returns missed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0059 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 1);
      stats.increment('missed', 8);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('missed');
      log('testTopKey0059 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0060
     * @tc.name      testSize0060
     * @tc.desc      size() counts 2 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0060 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 1);
      stats.increment('missed', 8);
      const actual: number = stats.size();
      expect(actual).assertEqual(2);
      log('testSize0060 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0061
     * @tc.name      testRatio0061
     * @tc.desc      ratio(outgoing) -> 11.11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0061 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 1);
      stats.increment('missed', 8);
      const actual: number = stats.ratio('outgoing');
      expect(actual).assertEqual(11.11);
      log('testRatio0061 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0062
     * @tc.name      testEntries0062
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0062 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 1);
      stats.increment('missed', 8);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(2);
      expect(actual[0]).assertEqual('outgoing=1');
      log('testEntries0062 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0063
     * @tc.name      testCount0063
     * @tc.desc      count(missed) after 3 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0063 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      stats.increment('blocked', 9);
      const actual: number = stats.count('missed');
      expect(actual).assertEqual(4);
      log('testCount0063 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0064
     * @tc.name      testTotal0064
     * @tc.desc      total() over 3 increments -> 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0064 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      stats.increment('blocked', 9);
      const actual: number = stats.total();
      expect(actual).assertEqual(15);
      log('testTotal0064 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0065
     * @tc.name      testTopKey0065
     * @tc.desc      topKey() returns blocked
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0065 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      stats.increment('blocked', 9);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('blocked');
      log('testTopKey0065 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0066
     * @tc.name      testSize0066
     * @tc.desc      size() counts 3 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0066 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      stats.increment('blocked', 9);
      const actual: number = stats.size();
      expect(actual).assertEqual(3);
      log('testSize0066 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0067
     * @tc.name      testRatio0067
     * @tc.desc      ratio(missed) -> 26.67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0067 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      stats.increment('blocked', 9);
      const actual: number = stats.ratio('missed');
      expect(actual).assertEqual(26.67);
      log('testRatio0067 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0068
     * @tc.name      testEntries0068
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0068 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      stats.increment('blocked', 9);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(3);
      expect(actual[0]).assertEqual('missed=4');
      log('testEntries0068 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0069
     * @tc.name      testCount0069
     * @tc.desc      count(rejected) after 4 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0069 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 7);
      stats.increment('blocked', 5);
      stats.increment('incoming', 3);
      stats.increment('outgoing', 1);
      const actual: number = stats.count('rejected');
      expect(actual).assertEqual(7);
      log('testCount0069 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0070
     * @tc.name      testTotal0070
     * @tc.desc      total() over 4 increments -> 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0070 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 7);
      stats.increment('blocked', 5);
      stats.increment('incoming', 3);
      stats.increment('outgoing', 1);
      const actual: number = stats.total();
      expect(actual).assertEqual(16);
      log('testTotal0070 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0071
     * @tc.name      testTopKey0071
     * @tc.desc      topKey() returns rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0071 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 7);
      stats.increment('blocked', 5);
      stats.increment('incoming', 3);
      stats.increment('outgoing', 1);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('rejected');
      log('testTopKey0071 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0072
     * @tc.name      testSize0072
     * @tc.desc      size() counts 4 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0072 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 7);
      stats.increment('blocked', 5);
      stats.increment('incoming', 3);
      stats.increment('outgoing', 1);
      const actual: number = stats.size();
      expect(actual).assertEqual(4);
      log('testSize0072 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0073
     * @tc.name      testRatio0073
     * @tc.desc      ratio(rejected) -> 43.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0073 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 7);
      stats.increment('blocked', 5);
      stats.increment('incoming', 3);
      stats.increment('outgoing', 1);
      const actual: number = stats.ratio('rejected');
      expect(actual).assertEqual(43.75);
      log('testRatio0073 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0074
     * @tc.name      testEntries0074
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0074 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 7);
      stats.increment('blocked', 5);
      stats.increment('incoming', 3);
      stats.increment('outgoing', 1);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(4);
      expect(actual[0]).assertEqual('rejected=7');
      log('testEntries0074 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0075
     * @tc.name      testCount0075
     * @tc.desc      count(blocked) after 5 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0075 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 1);
      stats.increment('incoming', 8);
      stats.increment('outgoing', 6);
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      const actual: number = stats.count('blocked');
      expect(actual).assertEqual(1);
      log('testCount0075 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0076
     * @tc.name      testTotal0076
     * @tc.desc      total() over 5 increments -> 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0076 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 1);
      stats.increment('incoming', 8);
      stats.increment('outgoing', 6);
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      const actual: number = stats.total();
      expect(actual).assertEqual(21);
      log('testTotal0076 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0077
     * @tc.name      testTopKey0077
     * @tc.desc      topKey() returns incoming
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0077 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 1);
      stats.increment('incoming', 8);
      stats.increment('outgoing', 6);
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('incoming');
      log('testTopKey0077 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0078
     * @tc.name      testSize0078
     * @tc.desc      size() counts 5 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0078 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 1);
      stats.increment('incoming', 8);
      stats.increment('outgoing', 6);
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      const actual: number = stats.size();
      expect(actual).assertEqual(5);
      log('testSize0078 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0079
     * @tc.name      testRatio0079
     * @tc.desc      ratio(blocked) -> 4.76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0079 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 1);
      stats.increment('incoming', 8);
      stats.increment('outgoing', 6);
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      const actual: number = stats.ratio('blocked');
      expect(actual).assertEqual(4.76);
      log('testRatio0079 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0080
     * @tc.name      testEntries0080
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0080 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 1);
      stats.increment('incoming', 8);
      stats.increment('outgoing', 6);
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(5);
      expect(actual[0]).assertEqual('blocked=1');
      log('testEntries0080 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0081
     * @tc.name      testCount0081
     * @tc.desc      count(incoming) after 1 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0081 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 4);
      const actual: number = stats.count('incoming');
      expect(actual).assertEqual(4);
      log('testCount0081 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0082
     * @tc.name      testTotal0082
     * @tc.desc      total() over 1 increments -> 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0082 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 4);
      const actual: number = stats.total();
      expect(actual).assertEqual(4);
      log('testTotal0082 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0083
     * @tc.name      testTopKey0083
     * @tc.desc      topKey() returns incoming
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0083 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 4);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('incoming');
      log('testTopKey0083 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0084
     * @tc.name      testSize0084
     * @tc.desc      size() counts 1 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0084 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 4);
      const actual: number = stats.size();
      expect(actual).assertEqual(1);
      log('testSize0084 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0085
     * @tc.name      testRatio0085
     * @tc.desc      ratio(incoming) -> 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0085 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 4);
      const actual: number = stats.ratio('incoming');
      expect(actual).assertEqual(100);
      log('testRatio0085 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0086
     * @tc.name      testEntries0086
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0086 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 4);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(1);
      expect(actual[0]).assertEqual('incoming=4');
      log('testEntries0086 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0087
     * @tc.name      testCount0087
     * @tc.desc      count(outgoing) after 2 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0087 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 7);
      stats.increment('missed', 5);
      const actual: number = stats.count('outgoing');
      expect(actual).assertEqual(7);
      log('testCount0087 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0088
     * @tc.name      testTotal0088
     * @tc.desc      total() over 2 increments -> 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0088 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 7);
      stats.increment('missed', 5);
      const actual: number = stats.total();
      expect(actual).assertEqual(12);
      log('testTotal0088 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0089
     * @tc.name      testTopKey0089
     * @tc.desc      topKey() returns outgoing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0089 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 7);
      stats.increment('missed', 5);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('outgoing');
      log('testTopKey0089 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSB_0090
     * @tc.name      testSize0090
     * @tc.desc      size() counts 2 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0090 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 7);
      stats.increment('missed', 5);
      const actual: number = stats.size();
      expect(actual).assertEqual(2);
      log('testSize0090 end');
      await yieldToMain();
    })
  })
}
