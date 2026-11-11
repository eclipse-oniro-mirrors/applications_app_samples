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

import { describe, expect, it } from '@ohos/hypium';
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
      expect(THRESHOLD_CATALOG.length > 0).assertTrue();
      expect(entryIds().length).assertEqual(THRESHOLD_CATALOG.length);
      const codes: string[] = entryIds();
      const duplicates: string[] = codes.filter((code: string, index: number): boolean =>
        codes.indexOf(code) !== index);
      expect(duplicates.length).assertEqual(0);
      expect(codes.every((code: string): boolean => code.indexOf('TH-') === 0)).assertTrue();
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
      expect(reachable).assertEqual(THRESHOLD_CATALOG.length);
      expect(entryOf('TH-NOT-EXIST') === undefined).assertTrue();
      expect(THRESHOLD_CATALOG.length > 0).assertTrue();
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
      expect(keys.length).assertEqual(THRESHOLD_CATALOG.length);
      let matched: number = 0;
      keys.forEach((key: string): void => {
        const found = entryOfKey(key);
        if (found !== undefined && found.key === key) {
          matched++;
        }
      });
      expect(matched).assertEqual(keys.length);
      expect(entryOfKey('no.such.key') === undefined).assertTrue();
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
      expect(verified).assertEqual(THRESHOLD_CATALOG.length);
      expect(THRESHOLD_CATALOG.length > 0).assertTrue();
      expect(THRESHOLD_CATALOG.every((entry: ThresholdEntry): boolean => acceptBoundary(entry))).assertTrue();
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
      expect(atMost !== undefined).assertTrue();
      if (atMost !== undefined) {
        expect(atMost.accepts(0)).assertTrue();
        expect(atMost.accepts(-1)).assertTrue();
      }
      expect(THRESHOLD_CATALOG.filter((entry: ThresholdEntry): boolean =>
        entry.limit === Limit.AT_MOST).length > 0).assertTrue();
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
      expect(must + should + info).assertEqual(THRESHOLD_CATALOG.length);
      expect(must > 0).assertTrue();
      expect(entriesOfLevel(ThresholdLevel.MUST).every((entry: ThresholdEntry): boolean =>
        entry.level === ThresholdLevel.MUST)).assertTrue();
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
      expect(latency + count + ratio + size).assertEqual(THRESHOLD_CATALOG.length);
      expect(latency > 0).assertTrue();
      expect(count + ratio + size > 0).assertTrue();
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
      expect(found).assertEqual(musts.length);
      expect(musts.every((entry: ThresholdEntry): boolean => entry.level === ThresholdLevel.MUST))
        .assertTrue();
      expect(musts.length > 0).assertTrue();
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
      expect(text.indexOf(entry.entryId) >= 0).assertTrue();
      expect(text.indexOf(entry.key) >= 0).assertTrue();
      expect(text.length > entry.key.length).assertTrue();
      expect(text.indexOf(String(entry.value)) >= 0).assertTrue();
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
      expect(sample.key).assertEqual('scan.files.ms');
      expect(sample.value).assertEqual(128);
      const zero: MetricSample = new MetricSample();
      expect(zero.key).assertEqual('');
      expect(zero.value).assertEqual(0);
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
      expect(labels.filter((label: string, index: number): boolean =>
        labels.indexOf(label) !== index).length).assertEqual(0);
      expect(labels.every((label: string): boolean => label.length > 0)).assertTrue();
      expect(unitText(ThresholdUnit.MILLIS)).assertEqual('ms');
      expect(labels.length).assertEqual(4);
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
      expect(labels.filter((label: string, index: number): boolean =>
        labels.indexOf(label) !== index).length).assertEqual(0);
      expect(labels.every((label: string): boolean => label.length > 0)).assertTrue();
      expect(labels.length).assertEqual(3);
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
      expect(labels.filter((label: string, index: number): boolean =>
        labels.indexOf(label) !== index).length).assertEqual(0);
      expect(labels.every((label: string): boolean => label.length > 0)).assertTrue();
      expect(labels.length).assertEqual(3);
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
      expect(allMillis).assertTrue();
      expect(latencies.length > 0).assertTrue();
      expect(latencies[0].value > 0).assertTrue();
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
      expect(unique.length).assertEqual(keys.length);
      expect(keys.length).assertEqual(THRESHOLD_CATALOG.length);
      expect(keys.every((key: string): boolean => key.length > 0)).assertTrue();
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
      expect(GATE_RULES.length > 0).assertTrue();
      expect(ruleIds().length).assertEqual(GATE_RULES.length);
      const ids: string[] = ruleIds();
      expect(ids.filter((id: string, index: number): boolean => ids.indexOf(id) !== index).length)
        .assertEqual(0);
      expect(ids.every((id: string): boolean => id.indexOf('GT-') === 0)).assertTrue();
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
        expect(rule.threshold >= 0).assertTrue();
        expect(rule.metric.length > 0).assertTrue();
      });
      expect(GATE_RULES.length > 0).assertTrue();
      expect(GATE_RULES[0].threshold >= 0).assertTrue();
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
      expect(verified).assertEqual(GATE_RULES.length);
      expect(GATE_RULES.length > 0).assertTrue();
      expect(GATE_RULES.length > 0).assertTrue();
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
      expect(blocking + warning).assertEqual(GATE_RULES.length);
      expect(blocking > 0).assertTrue();
      expect(warning > 0).assertTrue();
      expect(rulesOf(GateLevel.BLOCKING).every((rule: GateRule): boolean =>
        rule.level === GateLevel.BLOCKING)).assertTrue();
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
      expect(found).assertEqual(GATE_RULES.length);
      expect(ruleOf('GT-NONE') === undefined).assertTrue();
      expect(ruleIds().length > 0).assertTrue();
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
      expect(unique.length).assertEqual(metrics.length);
      expect(metrics.length > 0).assertTrue();
      expect(metrics.every((metric: string): boolean => metric.length > 0)).assertTrue();
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
      expect(zeroTolerance.length > 0).assertTrue();
      const primary: GateRule = zeroTolerance[0];
      expect(primary.accepts(0)).assertTrue();
      expect(primary.accepts(1)).assertFalse();
      expect(primary.level).assertEqual(GateLevel.BLOCKING);
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
      expect(labels.filter((label: string, index: number): boolean =>
        labels.indexOf(label) !== index).length).assertEqual(0);
      expect(labels.every((label: string): boolean => label.length > 0)).assertTrue();
      expect(labels.length).assertEqual(4);
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
      expect(levelLabel(GateLevel.BLOCKING) !== levelLabel(GateLevel.WARNING)).assertTrue();
      expect(levelLabel(GateLevel.BLOCKING).length > 0).assertTrue();
      expect(levelLabel(GateLevel.WARNING).length > 0).assertTrue();
      expect(levelLabel(GateLevel.BLOCKING)).assertEqual('阻断');
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
        expect(text.indexOf(rule.ruleId) >= 0).assertTrue();
        expect(text.indexOf(rule.metric) >= 0).assertTrue();
        expect(rule.description.length > 0).assertTrue();
      });
      expect(GATE_RULES.length > 0).assertTrue();
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
          expect(blocking.threshold >= warning.threshold).assertTrue();
        }
      });
      expect(compared >= 0).assertTrue();
      expect(blockingMetrics.length > 0).assertTrue();
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
      expect(atLeast.length + atMost.length).assertEqual(GATE_RULES.length);
      atLeast.forEach((rule: GateRule): void => {
        expect(rule.accepts(rule.threshold + 1)).assertTrue();
      });
      expect(atMost.length > 0).assertTrue();
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
      expect(latencyMust.every((entry: ThresholdEntry): boolean =>
        entry.kind === ThresholdKind.LATENCY && entry.level === ThresholdLevel.MUST)).assertTrue();
      expect(latencyMust.length <= entriesOfKind(ThresholdKind.LATENCY).length).assertTrue();
      expect(latencyMust.length <= entriesOfLevel(ThresholdLevel.MUST).length).assertTrue();
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
      expect(entryOf('') === undefined).assertTrue();
      expect(entryOfKey('') === undefined).assertTrue();
      expect(entryIds().indexOf('') < 0).assertTrue();
    });
  });
}
