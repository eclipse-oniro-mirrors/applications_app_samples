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
const TAG: string = 'CallStatisticsMatrixA1';
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

export default function callStatisticsMatrixA1Test(): void {
  describe('CallStatisticsMatrixA1', () => {
    /**
     * @tc.number    SUB_CALL_STATSA_0001
     * @tc.name      testCount0001
     * @tc.desc      count(incoming) after 1 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0001 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: number = stats.count('incoming');
      expect(actual).assertEqual(1);
      log('testCount0001 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0002
     * @tc.name      testTotal0002
     * @tc.desc      total() over 1 increments -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0002 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: number = stats.total();
      expect(actual).assertEqual(1);
      log('testTotal0002 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0003
     * @tc.name      testTopKey0003
     * @tc.desc      topKey() returns incoming
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0003 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('incoming');
      log('testTopKey0003 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0004
     * @tc.name      testSize0004
     * @tc.desc      size() counts 1 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0004 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: number = stats.size();
      expect(actual).assertEqual(1);
      log('testSize0004 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0005
     * @tc.name      testRatio0005
     * @tc.desc      ratio(incoming) -> 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0005 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: number = stats.ratio('incoming');
      expect(actual).assertEqual(100);
      log('testRatio0005 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0006
     * @tc.name      testEntries0006
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0006 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 1);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(1);
      expect(actual[0]).assertEqual('incoming=1');
      log('testEntries0006 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0007
     * @tc.name      testCount0007
     * @tc.desc      count(outgoing) after 2 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0007 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: number = stats.count('outgoing');
      expect(actual).assertEqual(4);
      log('testCount0007 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0008
     * @tc.name      testTotal0008
     * @tc.desc      total() over 2 increments -> 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0008 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: number = stats.total();
      expect(actual).assertEqual(6);
      log('testTotal0008 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0009
     * @tc.name      testTopKey0009
     * @tc.desc      topKey() returns outgoing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0009 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('outgoing');
      log('testTopKey0009 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0010
     * @tc.name      testSize0010
     * @tc.desc      size() counts 2 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0010 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: number = stats.size();
      expect(actual).assertEqual(2);
      log('testSize0010 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0011
     * @tc.name      testRatio0011
     * @tc.desc      ratio(outgoing) -> 66.67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0011 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: number = stats.ratio('outgoing');
      expect(actual).assertEqual(66.67);
      log('testRatio0011 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0012
     * @tc.name      testEntries0012
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0012 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 4);
      stats.increment('missed', 2);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(2);
      expect(actual[0]).assertEqual('outgoing=4');
      log('testEntries0012 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0013
     * @tc.name      testCount0013
     * @tc.desc      count(missed) after 3 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0013 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: number = stats.count('missed');
      expect(actual).assertEqual(7);
      log('testCount0013 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0014
     * @tc.name      testTotal0014
     * @tc.desc      total() over 3 increments -> 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0014 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: number = stats.total();
      expect(actual).assertEqual(15);
      log('testTotal0014 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0015
     * @tc.name      testTopKey0015
     * @tc.desc      topKey() returns missed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0015 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('missed');
      log('testTopKey0015 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0016
     * @tc.name      testSize0016
     * @tc.desc      size() counts 3 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0016 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: number = stats.size();
      expect(actual).assertEqual(3);
      log('testSize0016 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0017
     * @tc.name      testRatio0017
     * @tc.desc      ratio(missed) -> 46.67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0017 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: number = stats.ratio('missed');
      expect(actual).assertEqual(46.67);
      log('testRatio0017 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0018
     * @tc.name      testEntries0018
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0018 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      stats.increment('blocked', 3);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(3);
      expect(actual[0]).assertEqual('missed=7');
      log('testEntries0018 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0019
     * @tc.name      testCount0019
     * @tc.desc      count(rejected) after 4 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0019 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: number = stats.count('rejected');
      expect(actual).assertEqual(1);
      log('testCount0019 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0020
     * @tc.name      testTotal0020
     * @tc.desc      total() over 4 increments -> 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0020 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: number = stats.total();
      expect(actual).assertEqual(19);
      log('testTotal0020 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0021
     * @tc.name      testTopKey0021
     * @tc.desc      topKey() returns blocked
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0021 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('blocked');
      log('testTopKey0021 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0022
     * @tc.name      testSize0022
     * @tc.desc      size() counts 4 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0022 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: number = stats.size();
      expect(actual).assertEqual(4);
      log('testSize0022 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0023
     * @tc.name      testRatio0023
     * @tc.desc      ratio(rejected) -> 5.26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0023 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: number = stats.ratio('rejected');
      expect(actual).assertEqual(5.26);
      log('testRatio0023 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0024
     * @tc.name      testEntries0024
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0024 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 1);
      stats.increment('blocked', 8);
      stats.increment('incoming', 6);
      stats.increment('outgoing', 4);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(4);
      expect(actual[0]).assertEqual('rejected=1');
      log('testEntries0024 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0025
     * @tc.name      testCount0025
     * @tc.desc      count(blocked) after 5 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0025 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: number = stats.count('blocked');
      expect(actual).assertEqual(4);
      log('testCount0025 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0026
     * @tc.name      testTotal0026
     * @tc.desc      total() over 5 increments -> 27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0026 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: number = stats.total();
      expect(actual).assertEqual(27);
      log('testTotal0026 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0027
     * @tc.name      testTopKey0027
     * @tc.desc      topKey() returns outgoing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0027 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('outgoing');
      log('testTopKey0027 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0028
     * @tc.name      testSize0028
     * @tc.desc      size() counts 5 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0028 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: number = stats.size();
      expect(actual).assertEqual(5);
      log('testSize0028 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0029
     * @tc.name      testRatio0029
     * @tc.desc      ratio(blocked) -> 14.81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0029 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: number = stats.ratio('blocked');
      expect(actual).assertEqual(14.81);
      log('testRatio0029 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0030
     * @tc.name      testEntries0030
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0030 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 4);
      stats.increment('incoming', 2);
      stats.increment('outgoing', 9);
      stats.increment('missed', 7);
      stats.increment('rejected', 5);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(5);
      expect(actual[0]).assertEqual('blocked=4');
      log('testEntries0030 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0031
     * @tc.name      testCount0031
     * @tc.desc      count(incoming) after 1 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0031 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 7);
      const actual: number = stats.count('incoming');
      expect(actual).assertEqual(7);
      log('testCount0031 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0032
     * @tc.name      testTotal0032
     * @tc.desc      total() over 1 increments -> 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0032 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 7);
      const actual: number = stats.total();
      expect(actual).assertEqual(7);
      log('testTotal0032 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0033
     * @tc.name      testTopKey0033
     * @tc.desc      topKey() returns incoming
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0033 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 7);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('incoming');
      log('testTopKey0033 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0034
     * @tc.name      testSize0034
     * @tc.desc      size() counts 1 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0034 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 7);
      const actual: number = stats.size();
      expect(actual).assertEqual(1);
      log('testSize0034 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0035
     * @tc.name      testRatio0035
     * @tc.desc      ratio(incoming) -> 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0035 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 7);
      const actual: number = stats.ratio('incoming');
      expect(actual).assertEqual(100);
      log('testRatio0035 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0036
     * @tc.name      testEntries0036
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0036 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 7);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(1);
      expect(actual[0]).assertEqual('incoming=7');
      log('testEntries0036 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0037
     * @tc.name      testCount0037
     * @tc.desc      count(outgoing) after 2 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0037 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 1);
      stats.increment('missed', 8);
      const actual: number = stats.count('outgoing');
      expect(actual).assertEqual(1);
      log('testCount0037 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0038
     * @tc.name      testTotal0038
     * @tc.desc      total() over 2 increments -> 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0038 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 1);
      stats.increment('missed', 8);
      const actual: number = stats.total();
      expect(actual).assertEqual(9);
      log('testTotal0038 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0039
     * @tc.name      testTopKey0039
     * @tc.desc      topKey() returns missed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0039 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 1);
      stats.increment('missed', 8);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('missed');
      log('testTopKey0039 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0040
     * @tc.name      testSize0040
     * @tc.desc      size() counts 2 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0040 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 1);
      stats.increment('missed', 8);
      const actual: number = stats.size();
      expect(actual).assertEqual(2);
      log('testSize0040 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0041
     * @tc.name      testRatio0041
     * @tc.desc      ratio(outgoing) -> 11.11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0041 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 1);
      stats.increment('missed', 8);
      const actual: number = stats.ratio('outgoing');
      expect(actual).assertEqual(11.11);
      log('testRatio0041 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0042
     * @tc.name      testEntries0042
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0042 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 1);
      stats.increment('missed', 8);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(2);
      expect(actual[0]).assertEqual('outgoing=1');
      log('testEntries0042 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0043
     * @tc.name      testCount0043
     * @tc.desc      count(missed) after 3 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0043 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      stats.increment('blocked', 9);
      const actual: number = stats.count('missed');
      expect(actual).assertEqual(4);
      log('testCount0043 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0044
     * @tc.name      testTotal0044
     * @tc.desc      total() over 3 increments -> 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0044 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      stats.increment('blocked', 9);
      const actual: number = stats.total();
      expect(actual).assertEqual(15);
      log('testTotal0044 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0045
     * @tc.name      testTopKey0045
     * @tc.desc      topKey() returns blocked
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0045 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      stats.increment('blocked', 9);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('blocked');
      log('testTopKey0045 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0046
     * @tc.name      testSize0046
     * @tc.desc      size() counts 3 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0046 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      stats.increment('blocked', 9);
      const actual: number = stats.size();
      expect(actual).assertEqual(3);
      log('testSize0046 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0047
     * @tc.name      testRatio0047
     * @tc.desc      ratio(missed) -> 26.67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0047 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      stats.increment('blocked', 9);
      const actual: number = stats.ratio('missed');
      expect(actual).assertEqual(26.67);
      log('testRatio0047 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0048
     * @tc.name      testEntries0048
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0048 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      stats.increment('blocked', 9);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(3);
      expect(actual[0]).assertEqual('missed=4');
      log('testEntries0048 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0049
     * @tc.name      testCount0049
     * @tc.desc      count(rejected) after 4 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0049 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 7);
      stats.increment('blocked', 5);
      stats.increment('incoming', 3);
      stats.increment('outgoing', 1);
      const actual: number = stats.count('rejected');
      expect(actual).assertEqual(7);
      log('testCount0049 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0050
     * @tc.name      testTotal0050
     * @tc.desc      total() over 4 increments -> 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0050 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 7);
      stats.increment('blocked', 5);
      stats.increment('incoming', 3);
      stats.increment('outgoing', 1);
      const actual: number = stats.total();
      expect(actual).assertEqual(16);
      log('testTotal0050 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0051
     * @tc.name      testTopKey0051
     * @tc.desc      topKey() returns rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0051 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 7);
      stats.increment('blocked', 5);
      stats.increment('incoming', 3);
      stats.increment('outgoing', 1);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('rejected');
      log('testTopKey0051 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0052
     * @tc.name      testSize0052
     * @tc.desc      size() counts 4 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0052 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 7);
      stats.increment('blocked', 5);
      stats.increment('incoming', 3);
      stats.increment('outgoing', 1);
      const actual: number = stats.size();
      expect(actual).assertEqual(4);
      log('testSize0052 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0053
     * @tc.name      testRatio0053
     * @tc.desc      ratio(rejected) -> 43.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0053 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 7);
      stats.increment('blocked', 5);
      stats.increment('incoming', 3);
      stats.increment('outgoing', 1);
      const actual: number = stats.ratio('rejected');
      expect(actual).assertEqual(43.75);
      log('testRatio0053 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0054
     * @tc.name      testEntries0054
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0054 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 7);
      stats.increment('blocked', 5);
      stats.increment('incoming', 3);
      stats.increment('outgoing', 1);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(4);
      expect(actual[0]).assertEqual('rejected=7');
      log('testEntries0054 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0055
     * @tc.name      testCount0055
     * @tc.desc      count(blocked) after 5 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0055 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 1);
      stats.increment('incoming', 8);
      stats.increment('outgoing', 6);
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      const actual: number = stats.count('blocked');
      expect(actual).assertEqual(1);
      log('testCount0055 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0056
     * @tc.name      testTotal0056
     * @tc.desc      total() over 5 increments -> 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0056 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 1);
      stats.increment('incoming', 8);
      stats.increment('outgoing', 6);
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      const actual: number = stats.total();
      expect(actual).assertEqual(21);
      log('testTotal0056 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0057
     * @tc.name      testTopKey0057
     * @tc.desc      topKey() returns incoming
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0057 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 1);
      stats.increment('incoming', 8);
      stats.increment('outgoing', 6);
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('incoming');
      log('testTopKey0057 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0058
     * @tc.name      testSize0058
     * @tc.desc      size() counts 5 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0058 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 1);
      stats.increment('incoming', 8);
      stats.increment('outgoing', 6);
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      const actual: number = stats.size();
      expect(actual).assertEqual(5);
      log('testSize0058 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0059
     * @tc.name      testRatio0059
     * @tc.desc      ratio(blocked) -> 4.76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0059 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 1);
      stats.increment('incoming', 8);
      stats.increment('outgoing', 6);
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      const actual: number = stats.ratio('blocked');
      expect(actual).assertEqual(4.76);
      log('testRatio0059 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0060
     * @tc.name      testEntries0060
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0060 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 1);
      stats.increment('incoming', 8);
      stats.increment('outgoing', 6);
      stats.increment('missed', 4);
      stats.increment('rejected', 2);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(5);
      expect(actual[0]).assertEqual('blocked=1');
      log('testEntries0060 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0061
     * @tc.name      testCount0061
     * @tc.desc      count(incoming) after 1 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0061 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 4);
      const actual: number = stats.count('incoming');
      expect(actual).assertEqual(4);
      log('testCount0061 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0062
     * @tc.name      testTotal0062
     * @tc.desc      total() over 1 increments -> 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0062 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 4);
      const actual: number = stats.total();
      expect(actual).assertEqual(4);
      log('testTotal0062 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0063
     * @tc.name      testTopKey0063
     * @tc.desc      topKey() returns incoming
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0063 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 4);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('incoming');
      log('testTopKey0063 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0064
     * @tc.name      testSize0064
     * @tc.desc      size() counts 1 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0064 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 4);
      const actual: number = stats.size();
      expect(actual).assertEqual(1);
      log('testSize0064 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0065
     * @tc.name      testRatio0065
     * @tc.desc      ratio(incoming) -> 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0065 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 4);
      const actual: number = stats.ratio('incoming');
      expect(actual).assertEqual(100);
      log('testRatio0065 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0066
     * @tc.name      testEntries0066
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0066 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('incoming', 4);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(1);
      expect(actual[0]).assertEqual('incoming=4');
      log('testEntries0066 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0067
     * @tc.name      testCount0067
     * @tc.desc      count(outgoing) after 2 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0067 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 7);
      stats.increment('missed', 5);
      const actual: number = stats.count('outgoing');
      expect(actual).assertEqual(7);
      log('testCount0067 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0068
     * @tc.name      testTotal0068
     * @tc.desc      total() over 2 increments -> 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0068 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 7);
      stats.increment('missed', 5);
      const actual: number = stats.total();
      expect(actual).assertEqual(12);
      log('testTotal0068 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0069
     * @tc.name      testTopKey0069
     * @tc.desc      topKey() returns outgoing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0069 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 7);
      stats.increment('missed', 5);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('outgoing');
      log('testTopKey0069 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0070
     * @tc.name      testSize0070
     * @tc.desc      size() counts 2 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0070 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 7);
      stats.increment('missed', 5);
      const actual: number = stats.size();
      expect(actual).assertEqual(2);
      log('testSize0070 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0071
     * @tc.name      testRatio0071
     * @tc.desc      ratio(outgoing) -> 58.33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0071 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 7);
      stats.increment('missed', 5);
      const actual: number = stats.ratio('outgoing');
      expect(actual).assertEqual(58.33);
      log('testRatio0071 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0072
     * @tc.name      testEntries0072
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0072 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('outgoing', 7);
      stats.increment('missed', 5);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(2);
      expect(actual[0]).assertEqual('outgoing=7');
      log('testEntries0072 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0073
     * @tc.name      testCount0073
     * @tc.desc      count(missed) after 3 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0073 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      stats.increment('blocked', 6);
      const actual: number = stats.count('missed');
      expect(actual).assertEqual(1);
      log('testCount0073 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0074
     * @tc.name      testTotal0074
     * @tc.desc      total() over 3 increments -> 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0074 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      stats.increment('blocked', 6);
      const actual: number = stats.total();
      expect(actual).assertEqual(15);
      log('testTotal0074 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0075
     * @tc.name      testTopKey0075
     * @tc.desc      topKey() returns rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0075 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      stats.increment('blocked', 6);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('rejected');
      log('testTopKey0075 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0076
     * @tc.name      testSize0076
     * @tc.desc      size() counts 3 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0076 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      stats.increment('blocked', 6);
      const actual: number = stats.size();
      expect(actual).assertEqual(3);
      log('testSize0076 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0077
     * @tc.name      testRatio0077
     * @tc.desc      ratio(missed) -> 6.67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0077 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      stats.increment('blocked', 6);
      const actual: number = stats.ratio('missed');
      expect(actual).assertEqual(6.67);
      log('testRatio0077 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0078
     * @tc.name      testEntries0078
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0078 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      stats.increment('blocked', 6);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(3);
      expect(actual[0]).assertEqual('missed=1');
      log('testEntries0078 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0079
     * @tc.name      testCount0079
     * @tc.desc      count(rejected) after 4 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0079 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 4);
      stats.increment('blocked', 2);
      stats.increment('incoming', 9);
      stats.increment('outgoing', 7);
      const actual: number = stats.count('rejected');
      expect(actual).assertEqual(4);
      log('testCount0079 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0080
     * @tc.name      testTotal0080
     * @tc.desc      total() over 4 increments -> 22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0080 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 4);
      stats.increment('blocked', 2);
      stats.increment('incoming', 9);
      stats.increment('outgoing', 7);
      const actual: number = stats.total();
      expect(actual).assertEqual(22);
      log('testTotal0080 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0081
     * @tc.name      testTopKey0081
     * @tc.desc      topKey() returns incoming
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0081 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 4);
      stats.increment('blocked', 2);
      stats.increment('incoming', 9);
      stats.increment('outgoing', 7);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('incoming');
      log('testTopKey0081 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0082
     * @tc.name      testSize0082
     * @tc.desc      size() counts 4 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0082 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 4);
      stats.increment('blocked', 2);
      stats.increment('incoming', 9);
      stats.increment('outgoing', 7);
      const actual: number = stats.size();
      expect(actual).assertEqual(4);
      log('testSize0082 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0083
     * @tc.name      testRatio0083
     * @tc.desc      ratio(rejected) -> 18.18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0083 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 4);
      stats.increment('blocked', 2);
      stats.increment('incoming', 9);
      stats.increment('outgoing', 7);
      const actual: number = stats.ratio('rejected');
      expect(actual).assertEqual(18.18);
      log('testRatio0083 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0084
     * @tc.name      testEntries0084
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0084 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('rejected', 4);
      stats.increment('blocked', 2);
      stats.increment('incoming', 9);
      stats.increment('outgoing', 7);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(4);
      expect(actual[0]).assertEqual('rejected=4');
      log('testEntries0084 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0085
     * @tc.name      testCount0085
     * @tc.desc      count(blocked) after 5 increments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCount0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCount0085 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 7);
      stats.increment('incoming', 5);
      stats.increment('outgoing', 3);
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      const actual: number = stats.count('blocked');
      expect(actual).assertEqual(7);
      log('testCount0085 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0086
     * @tc.name      testTotal0086
     * @tc.desc      total() over 5 increments -> 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotal0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotal0086 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 7);
      stats.increment('incoming', 5);
      stats.increment('outgoing', 3);
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      const actual: number = stats.total();
      expect(actual).assertEqual(24);
      log('testTotal0086 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0087
     * @tc.name      testTopKey0087
     * @tc.desc      topKey() returns rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTopKey0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTopKey0087 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 7);
      stats.increment('incoming', 5);
      stats.increment('outgoing', 3);
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      const actual: string = stats.topKey();
      expect(actual).assertEqual('rejected');
      log('testTopKey0087 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0088
     * @tc.name      testSize0088
     * @tc.desc      size() counts 5 distinct keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0088 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 7);
      stats.increment('incoming', 5);
      stats.increment('outgoing', 3);
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      const actual: number = stats.size();
      expect(actual).assertEqual(5);
      log('testSize0088 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0089
     * @tc.name      testRatio0089
     * @tc.desc      ratio(blocked) -> 29.17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatio0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatio0089 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 7);
      stats.increment('incoming', 5);
      stats.increment('outgoing', 3);
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      const actual: number = stats.ratio('blocked');
      expect(actual).assertEqual(29.17);
      log('testRatio0089 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATSA_0090
     * @tc.name      testEntries0090
     * @tc.desc      entries() renders key=count pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntries0090 begin');
      const stats: CallStatistics = new CallStatistics();
      stats.increment('blocked', 7);
      stats.increment('incoming', 5);
      stats.increment('outgoing', 3);
      stats.increment('missed', 1);
      stats.increment('rejected', 8);
      const actual: string[] = stats.entries();
      expect(actual.length).assertEqual(5);
      expect(actual[0]).assertEqual('blocked=7');
      log('testEntries0090 end');
      await yieldToMain();
    })
  })
}
