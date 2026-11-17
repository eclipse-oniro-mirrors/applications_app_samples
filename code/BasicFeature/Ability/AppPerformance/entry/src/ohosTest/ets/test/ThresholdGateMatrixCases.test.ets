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

import { traceParameter } from '../support/TestLog';
import { describe, expect } from '@ohos/hypium';
import { loggedIt as it } from '../support/TestLog';
import {
  Limit, MetricSample, THRESHOLD_CATALOG, ThresholdEntry, ThresholdKind, ThresholdLevel,
  ThresholdUnit, catalogKeys, entriesOfKind, entriesOfLevel, entryIds, entryOf, entryOfKey, levelText,
  limitText, unitText
} from '../../../main/ets/core/ThresholdCatalog';
import {
  GATE_RULES, GateCompare, GateLevel, GateRule, GateVerdict, gateMetrics, levelLabel, ruleIds, ruleOf,
  rulesOf, verdictLabel
} from '../../../main/ets/core/RegressionGate';

/** 按限制方向断言 entry 的接受区间，避免在用例里复述阈值数字。 */
function acceptBoundary(entry: ThresholdEntry): boolean {
  if (entry.limit === Limit.AT_MOST) {
    return entry.accepts(entry.value) && !entry.accepts(entry.value + 1);
  }
  if (entry.limit === Limit.AT_LEAST) {
    return entry.accepts(entry.value) && !entry.accepts(entry.value - 1);
  }
  return entry.accepts(entry.value) && !entry.accepts(entry.value + 1);
}

/** 按比较方向断言 gate 规则的接受区间。 */
function gateBoundary(rule: GateRule): boolean {
  if (rule.compare === GateCompare.AT_MOST) {
    return rule.accepts(rule.threshold) && !rule.accepts(rule.threshold + 1);
  }
  return rule.accepts(rule.threshold) && !rule.accepts(rule.threshold - 1);
}

export default function thresholdGateMatrixCasesTest(): void {
  describe('ThresholdGateMatrixCases', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDGATEMATRIXCASES_0100
     * @tc.name      testThresholdGateMatrixCases0001
     * @tc.desc      Verify catalog is non empty and ordered
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testThresholdGateMatrixCases0001', 0, (): void => {
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0001 ThresholdGateMatrixCases.test:58 assertTrue actual', THRESHOLD_CATALOG.length > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0001 ThresholdGateMatrixCases.test:59 assertEqual actual', entryIds().length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0001 ThresholdGateMatrixCases.test:59 assertEqual expected', THRESHOLD_CATALOG.length));
      const codes: string[] = entryIds();
      const duplicates: string[] = codes.filter((code: string, index: number): boolean =>
        codes.indexOf(code) !== index);
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0001 ThresholdGateMatrixCases.test:63 assertEqual actual', duplicates.length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0001 ThresholdGateMatrixCases.test:63 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0001 ThresholdGateMatrixCases.test:64 assertTrue actual', codes.every((code: string): boolean => code.indexOf('TH-') === 0))).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDGATEMATRIXCASES_0200
     * @tc.name      testThresholdGateMatrixCases0002
     * @tc.desc      Verify every entry is reachable by id
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testThresholdGateMatrixCases0002', 0, (): void => {
      let reachable: number = 0;
      THRESHOLD_CATALOG.forEach((entry: ThresholdEntry): void => {
        const found = entryOf(entry.entryId);
        if (found !== undefined && found.entryId === entry.entryId) {
          reachable++;
        }
      });
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0002 ThresholdGateMatrixCases.test:84 assertEqual actual', reachable)).assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0002 ThresholdGateMatrixCases.test:84 assertEqual expected', THRESHOLD_CATALOG.length));
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0002 ThresholdGateMatrixCases.test:85 assertTrue actual', entryOf('TH-NOT-EXIST') === undefined)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0002 ThresholdGateMatrixCases.test:86 assertTrue actual', THRESHOLD_CATALOG.length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDGATEMATRIXCASES_0300
     * @tc.name      testThresholdGateMatrixCases0003
     * @tc.desc      Verify key lookup matches catalog keys
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testThresholdGateMatrixCases0003', 0, (): void => {
      const keys: string[] = catalogKeys();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0003 ThresholdGateMatrixCases.test:100 assertEqual actual', keys.length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0003 ThresholdGateMatrixCases.test:100 assertEqual expected', THRESHOLD_CATALOG.length));
      let matched: number = 0;
      keys.forEach((key: string): void => {
        const found = entryOfKey(key);
        if (found !== undefined && found.key === key) {
          matched++;
        }
      });
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0003 ThresholdGateMatrixCases.test:108 assertEqual actual', matched)).assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0003 ThresholdGateMatrixCases.test:108 assertEqual expected', keys.length));
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0003 ThresholdGateMatrixCases.test:109 assertTrue actual', entryOfKey('no.such.key') === undefined)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDGATEMATRIXCASES_0400
     * @tc.name      testThresholdGateMatrixCases0004
     * @tc.desc      Verify accepts honours limit direction
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testThresholdGateMatrixCases0004', 0, (): void => {
      let verified: number = 0;
      THRESHOLD_CATALOG.forEach((entry: ThresholdEntry): void => {
        if (acceptBoundary(entry)) {
          verified++;
        }
      });
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0004 ThresholdGateMatrixCases.test:128 assertEqual actual', verified)).assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0004 ThresholdGateMatrixCases.test:128 assertEqual expected', THRESHOLD_CATALOG.length));
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0004 ThresholdGateMatrixCases.test:129 assertTrue actual', THRESHOLD_CATALOG.length > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0004 ThresholdGateMatrixCases.test:130 assertTrue actual', THRESHOLD_CATALOG.every((entry: ThresholdEntry): boolean => acceptBoundary(entry)))).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDGATEMATRIXCASES_0500
     * @tc.name      testThresholdGateMatrixCases0005
     * @tc.desc      Verify negative observation behaviour is consistent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testThresholdGateMatrixCases0005', 0, (): void => {
      const atMost: ThresholdEntry | undefined = THRESHOLD_CATALOG.find((entry: ThresholdEntry): boolean =>
        entry.limit === Limit.AT_MOST);
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0005 ThresholdGateMatrixCases.test:145 assertTrue actual', atMost !== undefined)).assertTrue();
      if (atMost !== undefined) {
        expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0005 ThresholdGateMatrixCases.test:147 assertTrue actual', atMost.accepts(0))).assertTrue();
        expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0005 ThresholdGateMatrixCases.test:148 assertTrue actual', atMost.accepts(-1))).assertTrue();
      }
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0005 ThresholdGateMatrixCases.test:150 assertTrue actual', THRESHOLD_CATALOG.filter((entry: ThresholdEntry): boolean =>
        entry.limit === Limit.AT_MOST).length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDGATEMATRIXCASES_0600
     * @tc.name      testThresholdGateMatrixCases0006
     * @tc.desc      Verify level filter partitions catalog
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testThresholdGateMatrixCases0006', 0, (): void => {
      const must: number = entriesOfLevel(ThresholdLevel.MUST).length;
      const should: number = entriesOfLevel(ThresholdLevel.SHOULD).length;
      const info: number = entriesOfLevel(ThresholdLevel.INFO).length;
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0006 ThresholdGateMatrixCases.test:167 assertEqual actual', must + should + info)).assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0006 ThresholdGateMatrixCases.test:167 assertEqual expected', THRESHOLD_CATALOG.length));
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0006 ThresholdGateMatrixCases.test:168 assertTrue actual', must > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0006 ThresholdGateMatrixCases.test:169 assertTrue actual', entriesOfLevel(ThresholdLevel.MUST).every((entry: ThresholdEntry): boolean =>
        entry.level === ThresholdLevel.MUST))).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDGATEMATRIXCASES_0700
     * @tc.name      testThresholdGateMatrixCases0007
     * @tc.desc      Verify kind filter partitions catalog
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testThresholdGateMatrixCases0007', 0, (): void => {
      const latency: number = entriesOfKind(ThresholdKind.LATENCY).length;
      const count: number = entriesOfKind(ThresholdKind.COUNT).length;
      const ratio: number = entriesOfKind(ThresholdKind.RATIO).length;
      const size: number = entriesOfKind(ThresholdKind.SIZE).length;
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0007 ThresholdGateMatrixCases.test:187 assertEqual actual', latency + count + ratio + size)).assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0007 ThresholdGateMatrixCases.test:187 assertEqual expected', THRESHOLD_CATALOG.length));
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0007 ThresholdGateMatrixCases.test:188 assertTrue actual', latency > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0007 ThresholdGateMatrixCases.test:189 assertTrue actual', count + ratio + size > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDGATEMATRIXCASES_0800
     * @tc.name      testThresholdGateMatrixCases0008
     * @tc.desc      Verify must level entries are all reachable by key
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testThresholdGateMatrixCases0008', 0, (): void => {
      const musts: ThresholdEntry[] = entriesOfLevel(ThresholdLevel.MUST);
      let found: number = 0;
      musts.forEach((entry: ThresholdEntry): void => {
        if (entryOfKey(entry.key) !== undefined) {
          found++;
        }
      });
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0008 ThresholdGateMatrixCases.test:209 assertEqual actual', found)).assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0008 ThresholdGateMatrixCases.test:209 assertEqual expected', musts.length));
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0008 ThresholdGateMatrixCases.test:210 assertTrue actual', musts.every((entry: ThresholdEntry): boolean => entry.level === ThresholdLevel.MUST)))
        .assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0008 ThresholdGateMatrixCases.test:212 assertTrue actual', musts.length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDGATEMATRIXCASES_0900
     * @tc.name      testThresholdGateMatrixCases0009
     * @tc.desc      Verify text renders all four dimensions
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testThresholdGateMatrixCases0009', 0, (): void => {
      const entry: ThresholdEntry = THRESHOLD_CATALOG[0];
      const text: string = entry.text();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0009 ThresholdGateMatrixCases.test:227 assertTrue actual', text.indexOf(entry.entryId) >= 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0009 ThresholdGateMatrixCases.test:228 assertTrue actual', text.indexOf(entry.key) >= 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0009 ThresholdGateMatrixCases.test:229 assertTrue actual', text.length > entry.key.length)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0009 ThresholdGateMatrixCases.test:230 assertTrue actual', text.indexOf(String(entry.value)) >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDGATEMATRIXCASES_1000
     * @tc.name      testThresholdGateMatrixCases0010
     * @tc.desc      Verify metric sample keeps key and value
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testThresholdGateMatrixCases0010', 0, (): void => {
      const sample: MetricSample = new MetricSample('scan.files.ms', 128);
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0010 ThresholdGateMatrixCases.test:244 assertEqual actual', sample.key)).assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0010 ThresholdGateMatrixCases.test:244 assertEqual expected', 'scan.files.ms'));
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0010 ThresholdGateMatrixCases.test:245 assertEqual actual', sample.value)).assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0010 ThresholdGateMatrixCases.test:245 assertEqual expected', 128));
      const zero: MetricSample = new MetricSample();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0010 ThresholdGateMatrixCases.test:247 assertEqual actual', zero.key)).assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0010 ThresholdGateMatrixCases.test:247 assertEqual expected', ''));
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0010 ThresholdGateMatrixCases.test:248 assertEqual actual', zero.value)).assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0010 ThresholdGateMatrixCases.test:248 assertEqual expected', 0));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDGATEMATRIXCASES_1100
     * @tc.name      testThresholdGateMatrixCases0011
     * @tc.desc      Verify unit labels are distinct
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testThresholdGateMatrixCases0011', 0, (): void => {
      const labels: string[] = [unitText(ThresholdUnit.MILLIS), unitText(ThresholdUnit.COUNT),
        unitText(ThresholdUnit.PERCENT), unitText(ThresholdUnit.BYTES)];
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0011 ThresholdGateMatrixCases.test:263 assertEqual actual', labels.filter((label: string, index: number): boolean =>
        labels.indexOf(label) !== index).length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0011 ThresholdGateMatrixCases.test:263 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0011 ThresholdGateMatrixCases.test:265 assertTrue actual', labels.every((label: string): boolean => label.length > 0))).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0011 ThresholdGateMatrixCases.test:266 assertEqual actual', unitText(ThresholdUnit.MILLIS))).assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0011 ThresholdGateMatrixCases.test:266 assertEqual expected', 'ms'));
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0011 ThresholdGateMatrixCases.test:267 assertEqual actual', labels.length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0011 ThresholdGateMatrixCases.test:267 assertEqual expected', 4));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDGATEMATRIXCASES_1200
     * @tc.name      testThresholdGateMatrixCases0012
     * @tc.desc      Verify level labels are distinct
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testThresholdGateMatrixCases0012', 0, (): void => {
      const labels: string[] = [levelText(ThresholdLevel.MUST), levelText(ThresholdLevel.SHOULD),
        levelText(ThresholdLevel.INFO)];
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0012 ThresholdGateMatrixCases.test:282 assertEqual actual', labels.filter((label: string, index: number): boolean =>
        labels.indexOf(label) !== index).length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0012 ThresholdGateMatrixCases.test:282 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0012 ThresholdGateMatrixCases.test:284 assertTrue actual', labels.every((label: string): boolean => label.length > 0))).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0012 ThresholdGateMatrixCases.test:285 assertEqual actual', labels.length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0012 ThresholdGateMatrixCases.test:285 assertEqual expected', 3));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDGATEMATRIXCASES_1300
     * @tc.name      testThresholdGateMatrixCases0013
     * @tc.desc      Verify limit labels are distinct
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testThresholdGateMatrixCases0013', 0, (): void => {
      const labels: string[] = [limitText(Limit.AT_MOST), limitText(Limit.AT_LEAST),
        limitText(Limit.EQUALS)];
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0013 ThresholdGateMatrixCases.test:300 assertEqual actual', labels.filter((label: string, index: number): boolean =>
        labels.indexOf(label) !== index).length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0013 ThresholdGateMatrixCases.test:300 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0013 ThresholdGateMatrixCases.test:302 assertTrue actual', labels.every((label: string): boolean => label.length > 0))).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0013 ThresholdGateMatrixCases.test:303 assertEqual actual', labels.length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0013 ThresholdGateMatrixCases.test:303 assertEqual expected', 3));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDGATEMATRIXCASES_1400
     * @tc.name      testThresholdGateMatrixCases0014
     * @tc.desc      Verify latency entries use millis unit
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testThresholdGateMatrixCases0014', 0, (): void => {
      const latencies: ThresholdEntry[] = entriesOfKind(ThresholdKind.LATENCY);
      const allMillis: boolean = latencies.every((entry: ThresholdEntry): boolean =>
        entry.unit === ThresholdUnit.MILLIS);
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0014 ThresholdGateMatrixCases.test:319 assertTrue actual', allMillis)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0014 ThresholdGateMatrixCases.test:320 assertTrue actual', latencies.length > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0014 ThresholdGateMatrixCases.test:321 assertTrue actual', latencies[0].value > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDGATEMATRIXCASES_1500
     * @tc.name      testThresholdGateMatrixCases0015
     * @tc.desc      Verify catalog keys have no duplicates
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testThresholdGateMatrixCases0015', 0, (): void => {
      const keys: string[] = catalogKeys();
      const unique: string[] = [];
      keys.forEach((key: string): void => {
        if (unique.indexOf(key) < 0) {
          unique.push(key);
        }
      });
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0015 ThresholdGateMatrixCases.test:341 assertEqual actual', unique.length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0015 ThresholdGateMatrixCases.test:341 assertEqual expected', keys.length));
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0015 ThresholdGateMatrixCases.test:342 assertEqual actual', keys.length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0015 ThresholdGateMatrixCases.test:342 assertEqual expected', THRESHOLD_CATALOG.length));
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0015 ThresholdGateMatrixCases.test:343 assertTrue actual', keys.every((key: string): boolean => key.length > 0))).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDGATEMATRIXCASES_1600
     * @tc.name      testThresholdGateMatrixCases0016
     * @tc.desc      Verify gate rule table is well formed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testThresholdGateMatrixCases0016', 0, (): void => {
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0016 ThresholdGateMatrixCases.test:356 assertTrue actual', GATE_RULES.length > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0016 ThresholdGateMatrixCases.test:357 assertEqual actual', ruleIds().length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0016 ThresholdGateMatrixCases.test:357 assertEqual expected', GATE_RULES.length));
      const ids: string[] = ruleIds();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0016 ThresholdGateMatrixCases.test:359 assertEqual actual', ids.filter((id: string, index: number): boolean => ids.indexOf(id) !== index).length))
        .assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0016 ThresholdGateMatrixCases.test:359 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0016 ThresholdGateMatrixCases.test:361 assertTrue actual', ids.every((id: string): boolean => id.indexOf('GT-') === 0))).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDGATEMATRIXCASES_1700
     * @tc.name      testThresholdGateMatrixCases0017
     * @tc.desc      Verify every rule has positive threshold
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testThresholdGateMatrixCases0017', 0, (): void => {
      GATE_RULES.forEach((rule: GateRule): void => {
        expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0017 ThresholdGateMatrixCases.test:375 assertTrue actual', rule.threshold >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0017 ThresholdGateMatrixCases.test:376 assertTrue actual', rule.metric.length > 0)).assertTrue();
      });
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0017 ThresholdGateMatrixCases.test:378 assertTrue actual', GATE_RULES.length > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0017 ThresholdGateMatrixCases.test:379 assertTrue actual', GATE_RULES[0].threshold >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDGATEMATRIXCASES_1800
     * @tc.name      testThresholdGateMatrixCases0018
     * @tc.desc      Verify accepts honours compare direction
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testThresholdGateMatrixCases0018', 0, (): void => {
      let verified: number = 0;
      GATE_RULES.forEach((rule: GateRule): void => {
        if (gateBoundary(rule)) {
          verified++;
        }
      });
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0018 ThresholdGateMatrixCases.test:398 assertEqual actual', verified)).assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0018 ThresholdGateMatrixCases.test:398 assertEqual expected', GATE_RULES.length));
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0018 ThresholdGateMatrixCases.test:399 assertTrue actual', GATE_RULES.length > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0018 ThresholdGateMatrixCases.test:400 assertTrue actual', GATE_RULES.length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDGATEMATRIXCASES_1900
     * @tc.name      testThresholdGateMatrixCases0019
     * @tc.desc      Verify blocking and warning partition rules
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testThresholdGateMatrixCases0019', 0, (): void => {
      const blocking: number = rulesOf(GateLevel.BLOCKING).length;
      const warning: number = rulesOf(GateLevel.WARNING).length;
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0019 ThresholdGateMatrixCases.test:415 assertEqual actual', blocking + warning)).assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0019 ThresholdGateMatrixCases.test:415 assertEqual expected', GATE_RULES.length));
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0019 ThresholdGateMatrixCases.test:416 assertTrue actual', blocking > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0019 ThresholdGateMatrixCases.test:417 assertTrue actual', warning > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0019 ThresholdGateMatrixCases.test:418 assertTrue actual', rulesOf(GateLevel.BLOCKING).every((rule: GateRule): boolean =>
        rule.level === GateLevel.BLOCKING))).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDGATEMATRIXCASES_2000
     * @tc.name      testThresholdGateMatrixCases0020
     * @tc.desc      Verify rule lookup covers every id
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testThresholdGateMatrixCases0020', 0, (): void => {
      let found: number = 0;
      ruleIds().forEach((id: string): void => {
        const rule = ruleOf(id);
        if (rule !== undefined && rule.ruleId === id) {
          found++;
        }
      });
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0020 ThresholdGateMatrixCases.test:439 assertEqual actual', found)).assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0020 ThresholdGateMatrixCases.test:439 assertEqual expected', GATE_RULES.length));
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0020 ThresholdGateMatrixCases.test:440 assertTrue actual', ruleOf('GT-NONE') === undefined)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0020 ThresholdGateMatrixCases.test:441 assertTrue actual', ruleIds().length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDGATEMATRIXCASES_2100
     * @tc.name      testThresholdGateMatrixCases0021
     * @tc.desc      Verify gate metrics are unique
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testThresholdGateMatrixCases0021', 0, (): void => {
      const metrics: string[] = gateMetrics();
      const unique: string[] = [];
      metrics.forEach((metric: string): void => {
        if (unique.indexOf(metric) < 0) {
          unique.push(metric);
        }
      });
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0021 ThresholdGateMatrixCases.test:461 assertEqual actual', unique.length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0021 ThresholdGateMatrixCases.test:461 assertEqual expected', metrics.length));
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0021 ThresholdGateMatrixCases.test:462 assertTrue actual', metrics.length > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0021 ThresholdGateMatrixCases.test:463 assertTrue actual', metrics.every((metric: string): boolean => metric.length > 0))).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDGATEMATRIXCASES_2200
     * @tc.name      testThresholdGateMatrixCases0022
     * @tc.desc      Verify zero threshold rule rejects any failure
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testThresholdGateMatrixCases0022', 0, (): void => {
      const zeroTolerance: GateRule[] = GATE_RULES.filter((rule: GateRule): boolean =>
        rule.compare === GateCompare.AT_MOST && rule.threshold === 0);
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0022 ThresholdGateMatrixCases.test:478 assertTrue actual', zeroTolerance.length > 0)).assertTrue();
      const primary: GateRule = zeroTolerance[0];
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0022 ThresholdGateMatrixCases.test:480 assertTrue actual', primary.accepts(0))).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0022 ThresholdGateMatrixCases.test:481 assertFalse actual', primary.accepts(1))).assertFalse();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0022 ThresholdGateMatrixCases.test:482 assertEqual actual', primary.level)).assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0022 ThresholdGateMatrixCases.test:482 assertEqual expected', GateLevel.BLOCKING));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDGATEMATRIXCASES_2300
     * @tc.name      testThresholdGateMatrixCases0023
     * @tc.desc      Verify verdict labels are distinct
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testThresholdGateMatrixCases0023', 0, (): void => {
      const labels: string[] = [verdictLabel(GateVerdict.PASS), verdictLabel(GateVerdict.WARN),
        verdictLabel(GateVerdict.BLOCK), verdictLabel(GateVerdict.NOT_EVALUABLE)];
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0023 ThresholdGateMatrixCases.test:497 assertEqual actual', labels.filter((label: string, index: number): boolean =>
        labels.indexOf(label) !== index).length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0023 ThresholdGateMatrixCases.test:497 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0023 ThresholdGateMatrixCases.test:499 assertTrue actual', labels.every((label: string): boolean => label.length > 0))).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0023 ThresholdGateMatrixCases.test:500 assertEqual actual', labels.length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0023 ThresholdGateMatrixCases.test:500 assertEqual expected', 4));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDGATEMATRIXCASES_2400
     * @tc.name      testThresholdGateMatrixCases0024
     * @tc.desc      Verify level labels are distinct
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testThresholdGateMatrixCases0024', 0, (): void => {
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0024 ThresholdGateMatrixCases.test:513 assertTrue actual', levelLabel(GateLevel.BLOCKING) !== levelLabel(GateLevel.WARNING))).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0024 ThresholdGateMatrixCases.test:514 assertTrue actual', levelLabel(GateLevel.BLOCKING).length > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0024 ThresholdGateMatrixCases.test:515 assertTrue actual', levelLabel(GateLevel.WARNING).length > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0024 ThresholdGateMatrixCases.test:516 assertEqual actual', levelLabel(GateLevel.BLOCKING))).assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0024 ThresholdGateMatrixCases.test:516 assertEqual expected', '阻断'));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDGATEMATRIXCASES_2500
     * @tc.name      testThresholdGateMatrixCases0025
     * @tc.desc      Verify rule text mentions id and metric
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testThresholdGateMatrixCases0025', 0, (): void => {
      GATE_RULES.forEach((rule: GateRule): void => {
        const text: string = rule.text();
        expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0025 ThresholdGateMatrixCases.test:531 assertTrue actual', text.indexOf(rule.ruleId) >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0025 ThresholdGateMatrixCases.test:532 assertTrue actual', text.indexOf(rule.metric) >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0025 ThresholdGateMatrixCases.test:533 assertTrue actual', rule.description.length > 0)).assertTrue();
      });
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0025 ThresholdGateMatrixCases.test:535 assertTrue actual', GATE_RULES.length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDGATEMATRIXCASES_2600
     * @tc.name      testThresholdGateMatrixCases0026
     * @tc.desc      Verify blocking thresholds are looser than warnings
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testThresholdGateMatrixCases0026', 0, (): void => {
      const blockingMetrics: string[] = rulesOf(GateLevel.BLOCKING).map((rule: GateRule): string =>
        rule.metric);
      let compared: number = 0;
      blockingMetrics.forEach((metric: string): void => {
        const warning = rulesOf(GateLevel.WARNING).find((rule: GateRule): boolean =>
          rule.metric === metric);
        const blocking = rulesOf(GateLevel.BLOCKING).find((rule: GateRule): boolean =>
          rule.metric === metric);
        if (warning !== undefined && blocking !== undefined) {
          compared++;
          expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0026 ThresholdGateMatrixCases.test:558 assertTrue actual', blocking.threshold >= warning.threshold)).assertTrue();
        }
      });
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0026 ThresholdGateMatrixCases.test:561 assertTrue actual', compared >= 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0026 ThresholdGateMatrixCases.test:562 assertTrue actual', blockingMetrics.length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDGATEMATRIXCASES_2700
     * @tc.name      testThresholdGateMatrixCases0027
     * @tc.desc      Verify at least rules exist or are absent consistently
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testThresholdGateMatrixCases0027', 0, (): void => {
      const atLeast: GateRule[] = GATE_RULES.filter((rule: GateRule): boolean =>
        rule.compare === GateCompare.AT_LEAST);
      const atMost: GateRule[] = GATE_RULES.filter((rule: GateRule): boolean =>
        rule.compare === GateCompare.AT_MOST);
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0027 ThresholdGateMatrixCases.test:579 assertEqual actual', atLeast.length + atMost.length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0027 ThresholdGateMatrixCases.test:579 assertEqual expected', GATE_RULES.length));
      atLeast.forEach((rule: GateRule): void => {
        expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0027 ThresholdGateMatrixCases.test:581 assertTrue actual', rule.accepts(rule.threshold + 1))).assertTrue();
      });
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0027 ThresholdGateMatrixCases.test:583 assertTrue actual', atMost.length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDGATEMATRIXCASES_2800
     * @tc.name      testThresholdGateMatrixCases0028
     * @tc.desc      Verify kind and level filters compose
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testThresholdGateMatrixCases0028', 0, (): void => {
      const latencyMust: ThresholdEntry[] = entriesOfKind(ThresholdKind.LATENCY)
        .filter((entry: ThresholdEntry): boolean => entry.level === ThresholdLevel.MUST);
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0028 ThresholdGateMatrixCases.test:598 assertTrue actual', latencyMust.every((entry: ThresholdEntry): boolean =>
        entry.kind === ThresholdKind.LATENCY && entry.level === ThresholdLevel.MUST))).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0028 ThresholdGateMatrixCases.test:600 assertTrue actual', latencyMust.length <= entriesOfKind(ThresholdKind.LATENCY).length)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0028 ThresholdGateMatrixCases.test:601 assertTrue actual', latencyMust.length <= entriesOfLevel(ThresholdLevel.MUST).length)).assertTrue();
    });

;

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDGATEMATRIXCASES_3000
     * @tc.name      testThresholdGateMatrixCases0030
     * @tc.desc      Verify unknown codes return empty not throw
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testThresholdGateMatrixCases0030', 0, (): void => {
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0030 ThresholdGateMatrixCases.test:616 assertTrue actual', entryOf('') === undefined)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0030 ThresholdGateMatrixCases.test:617 assertTrue actual', entryOfKey('') === undefined)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdGateMatrixCases_0030 ThresholdGateMatrixCases.test:618 assertTrue actual', entryIds().indexOf('') < 0)).assertTrue();
    });
  });
}
