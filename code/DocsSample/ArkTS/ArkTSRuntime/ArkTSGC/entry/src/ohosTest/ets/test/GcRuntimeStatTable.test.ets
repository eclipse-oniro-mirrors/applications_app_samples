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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hidebug } from '@kit.PerformanceAnalysisKit';
import {
  allocatePressure,
  collectUntil,
  COLLECT_ROUNDS,
  ERR_INVALID_PARAM,
  GC_STAT_KEYS,
  gcStat,
  GcSnapshot,
  KEY_BYTES_ALLOCATED,
  KEY_GC_COUNT,
  retainArrays,
  statErrorCode
} from './shared/GcProbe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

const MALFORMED_KEYS: string[] = ['', 'ark', 'ark.gc', 'ark.gc.', 'gc-count', 'ark.gc.gc-count.extra',
  'ark..gc.gc-count',
  'x'.repeat(5000), '方舟.gc.gc-count', 'ark.gc.gc-count\n'];
const MONOTONIC_ROUNDS: number = 10;
const RETAIN_COUNT: number = 100;
const RETAIN_LENGTH: number = 10000;
const DOUBLE_BYTES: number = 8;
const HELD_CYCLES: number = 2;

function nearMisses(key: string): string[] {
  return [key.toUpperCase(), key + ' ', ' ' + key, key.split('-').join('_'), key.substring(0, key.length - 1)];
}

export default function gcRuntimeStatTableTest() {
  describe('GcRuntimeStatTable', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATTABLE_0100
     * @tc.name      testGcStatKeys0001
     * @tc.desc      Read each of the five GC statistic keys and check every value is a finite non negative number
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testGcStatKeys0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const values: number[] = GC_STAT_KEYS.map((key: string) => gcStat(key));
      logCase('testGcStatKeys0001', `valuesLength=${values.length} values=${values.join(',')}`);
      expect(values.length).assertEqual(5);
      expect(values.every((value: number) => typeof value === 'number' && Number.isFinite(value) && value >= 0))
        .assertTrue();
      expect(Number.isInteger(values[0])).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATTABLE_0200
     * @tc.name      testGcStatMapKeys0001
     * @tc.desc      Read the full statistic map and check it holds exactly the five documented keys
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testGcStatMapKeys0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const stats: hidebug.GcStats = hidebug.getVMRuntimeStats();
      const keys: string[] = Object.keys(stats).sort();
      logCase('testGcStatMapKeys0001', `keysLength=${keys.length} expectedLength=${GC_STAT_KEYS.length} ` +
        `keys=${keys.join(',')}`);
      expect(keys.length).assertEqual(GC_STAT_KEYS.length);
      expect(GC_STAT_KEYS.every((key: string) => keys.indexOf(key) >= 0)).assertTrue();
      expect(keys.every((key: string) => Number.isFinite(Number(stats[key])) && Number(stats[key]) >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATTABLE_0300
     * @tc.name      testGcStatMapConsistent0001
     * @tc.desc      Check the map values sit between single key reads taken just before and just after the map
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGcStatMapConsistent0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const before: GcSnapshot = new GcSnapshot();
      const stats: hidebug.GcStats = hidebug.getVMRuntimeStats();
      const after: GcSnapshot = new GcSnapshot();
      const count: number = Number(stats[KEY_GC_COUNT]);
      const allocated: number = Number(stats[KEY_BYTES_ALLOCATED]);
      logCase('testGcStatMapConsistent0001', `count=${count} beforeCount=${before.count} afterCount=${after.count} ` +
        `allocated=${allocated} beforeAllocated=${before.allocated} afterAllocated=${after.allocated}`);
      expect(count >= before.count && count <= after.count).assertTrue();
      expect(allocated >= before.allocated && allocated <= after.allocated).assertTrue();
      expect(after.notBefore(before)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATTABLE_0400
     * @tc.name      testGcStatInvalidKeys0001
     * @tc.desc      Ask for malformed statistic keys and check each one is rejected with error 401 while a valid key
     *               still works
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGcStatInvalidKeys0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const before: GcSnapshot = new GcSnapshot();
      const codes: number[] = MALFORMED_KEYS.map((key: string) => statErrorCode(key));
      logCase('testGcStatInvalidKeys0001', `keyCount=${MALFORMED_KEYS.length} beforeCount=${before.count} ` +
        `codes=${codes.join(',')}`);
      expect(new GcSnapshot().notBefore(before)).assertTrue();
      expect(codes.every((code: number) => code === ERR_INVALID_PARAM)).assertTrue();
      expect(statErrorCode(KEY_GC_COUNT)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATTABLE_0500
     * @tc.name      testGcStatNearMiss0001
     * @tc.desc      Derive upper case, padded, underscored and truncated variants of every key and check each is
     *               rejected
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGcStatNearMiss0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const variants: string[] = [];
      GC_STAT_KEYS.forEach((key: string) => nearMisses(key).forEach((variant: string) => variants.push(variant)));
      const accepted: string[] = variants.filter((variant: string) => statErrorCode(variant) !== ERR_INVALID_PARAM);
      logCase('testGcStatNearMiss0001', `variantsLength=${variants.length} acceptedLength=${accepted.length} ` +
        `accepted=${accepted.join(',')}`);
      expect(variants.length).assertEqual(GC_STAT_KEYS.length * 5);
      expect(variants.every((variant: string) => GC_STAT_KEYS.indexOf(variant) < 0)).assertTrue();
      expect(accepted.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATTABLE_0600
     * @tc.name      testGcStatBounds0001
     * @tc.desc      Check freed bytes never exceed allocated bytes and long full GC count never exceeds the total GC
     *               count
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGcStatBounds0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      allocatePressure();
      const snapshot: GcSnapshot = new GcSnapshot();
      logCase('testGcStatBounds0001', `freed=${snapshot.freed} allocated=${snapshot.allocated} ` +
        `longFullGc=${snapshot.longFullGc} count=${snapshot.count}`);
      expect(snapshot.freed <= snapshot.allocated).assertTrue();
      expect(snapshot.longFullGc <= snapshot.count).assertTrue();
      expect(snapshot.allocated > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATTABLE_0700
     * @tc.name      testGcStatMonotonic0001
     * @tc.desc      Allocate in ten rounds and check none of the five cumulative counters ever goes down between rounds
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGcStatMonotonic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const series: GcSnapshot[] = [new GcSnapshot()];
      for (let round = 0; round < MONOTONIC_ROUNDS; round++) {
        allocatePressure();
        await paceTurn();
        series.push(new GcSnapshot());
      }
      const drops: number[] = [];
      for (let i = 1; i < series.length; i++) {
        if (!series[i].notBefore(series[i - 1])) {
          drops.push(i);
        }
      }
      logCase('testGcStatMonotonic0001', `seriesLength=${series.length} drops=${drops.join(',')} ` +
        `firstAllocated=${series[0].allocated} lastAllocated=${series[series.length - 1].allocated}`);
      expect(series.length).assertEqual(MONOTONIC_ROUNDS + 1);
      expect(drops.length).assertEqual(0);
      expect(series[MONOTONIC_ROUNDS].allocated > series[0].allocated).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATTABLE_0800
     * @tc.name      testGcStatAllocatedGrows0001
     * @tc.desc      Keep about eight megabytes of number arrays and check the allocated byte counter grows by at least
     *               half of that
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGcStatAllocatedGrows0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const before: GcSnapshot = new GcSnapshot();
      const kept: number[][] = retainArrays(RETAIN_COUNT, RETAIN_LENGTH);
      await paceTurn();
      const after: GcSnapshot = new GcSnapshot();
      const expectedBytes: number = RETAIN_COUNT * RETAIN_LENGTH * DOUBLE_BYTES;
      logCase('testGcStatAllocatedGrows0001', `keptLength=${kept.length} beforeAllocated=${before.allocated} ` +
        `afterAllocated=${after.allocated} expectedBytes=${expectedBytes}`);
      expect(kept.length).assertEqual(RETAIN_COUNT);
      expect(kept[RETAIN_COUNT - 1][RETAIN_LENGTH - 1]).assertEqual(RETAIN_COUNT - 1);
      expect(after.allocated - before.allocated >= expectedBytes / 2).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATTABLE_0900
     * @tc.name      testGcStatCountGrows0001
     * @tc.desc      Apply allocation pressure until three collections happen and check count, time and allocated move
     *               together
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGcStatCountGrows0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const before: GcSnapshot = new GcSnapshot();
      const rounds: number = await collectUntil(() => gcStat(KEY_GC_COUNT) - before.count >= 3, COLLECT_ROUNDS);
      const after: GcSnapshot = new GcSnapshot();
      logCase('testGcStatCountGrows0001', `rounds=${rounds} count=${before.count}->${after.count} ` +
        `time=${before.time}->${after.time} allocated=${before.allocated}->${after.allocated} ` +
        `freed=${before.freed}->${after.freed}`);
      expect(rounds > 0).assertTrue();
      expect(after.count - before.count >= 3).assertTrue();
      expect(after.time >= before.time).assertTrue();
      expect(after.allocated > before.allocated && after.freed > before.freed).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATTABLE_1000
     * @tc.name      testGcStatRetainedNotFreed0001
     * @tc.desc      Keep sixteen megabytes reachable while two collections run and check the arrays stay intact and
     *               allocated minus freed bytes still cover them
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGcStatRetainedNotFreed0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const before: GcSnapshot = new GcSnapshot();
      const kept: number[][] = retainArrays(RETAIN_COUNT * 2, RETAIN_LENGTH);
      const rounds: number = await collectUntil(() => gcStat(KEY_GC_COUNT) - before.count >= HELD_CYCLES,
        COLLECT_ROUNDS);
      const after: GcSnapshot = new GcSnapshot();
      const retainedBytes: number = RETAIN_COUNT * 2 * RETAIN_LENGTH * DOUBLE_BYTES;
      const intact: boolean = kept.every((row: number[], index: number) =>
        row.length === RETAIN_LENGTH && row[0] === index && row[RETAIN_LENGTH - 1] === index);
      const allocatedDelta: number = after.allocated - before.allocated;
      // freed deltas also count garbage left by earlier cases, so check what the heap still holds instead
      const heldBytes: number = after.allocated - after.freed;
      logCase('testGcStatRetainedNotFreed0001', `rounds=${rounds} count=${before.count}->${after.count} ` +
        `intact=${intact} allocatedDelta=${allocatedDelta} heldBytes=${heldBytes} retainedBytes=${retainedBytes}`);
      expect(rounds > 0 && after.count - before.count >= HELD_CYCLES).assertTrue();
      expect(intact).assertTrue();
      expect(allocatedDelta >= retainedBytes).assertTrue();
      expect(heldBytes >= retainedBytes).assertTrue();
    });
  });
}
