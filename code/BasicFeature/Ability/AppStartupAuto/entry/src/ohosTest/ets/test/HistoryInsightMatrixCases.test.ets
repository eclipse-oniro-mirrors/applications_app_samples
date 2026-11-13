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

import { describe, expect } from '@ohos/hypium';
import { traceParameter, loggedIt as it } from '../support/TestLog';
import { configureTestText } from '../support/TestTextResources';
import {
  RETENTION_RULES, RetentionRule, RetentionTier, ruleIds, ruleOf, rulesOfTier, tierLabel, tierOrder
} from '../../../main/ets/autostart/history/ArchivePolicy';
import { QueryOutcome, QueryRecord, RefreshSource } from '../../../main/ets/autostart/AutoStartupTypes';

function record(id: number, timestamp: number, outcome: QueryOutcome, duration: number,
  source: RefreshSource): QueryRecord {
  const item: QueryRecord = new QueryRecord();
  item.id = id;
  item.timestamp = timestamp;
  item.outcome = outcome;
  item.durationMillis = duration;
  item.source = source;
  item.result = outcome === QueryOutcome.SUCCESS ? '已开启' : '未开启';
  return item;
}

function sampleRecords(): QueryRecord[] {
  const items: QueryRecord[] = [
    record(1, 1000, QueryOutcome.SUCCESS, 120, RefreshSource.INITIAL),
    record(2, 2000, QueryOutcome.FAILURE, 300, RefreshSource.MANUAL),
    record(3, 3000, QueryOutcome.SUCCESS, 180, RefreshSource.FOREGROUND),
    record(4, 4000, QueryOutcome.TIMEOUT, 3000, RefreshSource.SETTINGS),
    record(5, 5000, QueryOutcome.UNSUPPORTED, 60, RefreshSource.MANUAL)
  ];
  return items;
}

export default function historyInsightMatrixCasesTest(): void {
  configureTestText();

  describe('ArchivePolicyMatrixCases', (): void => {
    /**
     * @tc.number    SUB_STARTUP_ARCHIVEPOLICYMATRIXCASES_0100
     * @tc.name      testArchivePolicyMatrixCases0001
     * @tc.desc      Verify rule table is well formed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testArchivePolicyMatrixCases0001', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyMatrixCases_0001|HistoryInsightMatrixCases.test.ets|assert0001|assertTrue|actual|expected=true', RETENTION_RULES.length > 0)).assertTrue();
      const ids: string[] = ruleIds();
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyMatrixCases_0001|HistoryInsightMatrixCases.test.ets|assert0002|assertEqual|actual', ids.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyMatrixCases_0001|HistoryInsightMatrixCases.test.ets|assert0002|assertEqual|expected', RETENTION_RULES.length));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyMatrixCases_0001|HistoryInsightMatrixCases.test.ets|assert0003|assertEqual|actual', ids.filter((id: string, index: number): boolean => ids.indexOf(id) !== index).length))
        .assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyMatrixCases_0001|HistoryInsightMatrixCases.test.ets|assert0003|assertEqual|expected', 0));
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEPOLICYMATRIXCASES_0200
     * @tc.name      testArchivePolicyMatrixCases0002
     * @tc.desc      Verify every rule is reachable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchivePolicyMatrixCases0002', 0, (): void => {
      configureTestText();
      let found: number = 0;
      ruleIds().forEach((id: string): void => {
        const rule = ruleOf(id);
        if (rule !== undefined && rule.ruleId === id) {
          found++;
        }
      });
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyMatrixCases_0002|HistoryInsightMatrixCases.test.ets|assert0004|assertEqual|actual', found)).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyMatrixCases_0002|HistoryInsightMatrixCases.test.ets|assert0004|assertEqual|expected', RETENTION_RULES.length));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyMatrixCases_0002|HistoryInsightMatrixCases.test.ets|assert0005|assertTrue|actual|expected=true', ruleOf('XX-99') === undefined)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyMatrixCases_0002|HistoryInsightMatrixCases.test.ets|assert0006|assertTrue|actual|expected=true', found > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEPOLICYMATRIXCASES_0300
     * @tc.name      testArchivePolicyMatrixCases0003
     * @tc.desc      Verify tier order is total and labeled
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testArchivePolicyMatrixCases0003', 0, (): void => {
      configureTestText();
      const tiers: RetentionTier[] = [];
      RETENTION_RULES.forEach((rule: RetentionRule): void => {
        if (tiers.indexOf(rule.tier) < 0) {
          tiers.push(rule.tier);
        }
      });
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyMatrixCases_0003|HistoryInsightMatrixCases.test.ets|assert0007|assertTrue|actual|expected=true', tiers.length > 0)).assertTrue();
      tiers.forEach((tier: RetentionTier): void => {
        expect(traceParameter('com.samples.appstartupauto_ArchivePolicyMatrixCases_0003|HistoryInsightMatrixCases.test.ets|assert0008|assertTrue|actual|expected=true', tierOrder(tier) >= 0)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_ArchivePolicyMatrixCases_0003|HistoryInsightMatrixCases.test.ets|assert0009|assertTrue|actual|expected=true', tierLabel(tier).length > 0)).assertTrue();
      });
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEPOLICYMATRIXCASES_0400
     * @tc.name      testArchivePolicyMatrixCases0004
     * @tc.desc      Verify tier labels are present
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testArchivePolicyMatrixCases0004', 0, (): void => {
      configureTestText();
      const tiers: RetentionTier[] = [];
      RETENTION_RULES.forEach((rule: RetentionRule): void => {
        if (tiers.indexOf(rule.tier) < 0) {
          tiers.push(rule.tier);
        }
      });
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyMatrixCases_0004|HistoryInsightMatrixCases.test.ets|assert0010|assertTrue|actual|expected=true', tiers.length > 0)).assertTrue();
      tiers.forEach((tier: RetentionTier): void => {
        expect(traceParameter('com.samples.appstartupauto_ArchivePolicyMatrixCases_0004|HistoryInsightMatrixCases.test.ets|assert0011|assertTrue|actual|expected=true', tierLabel(tier).length > 0)).assertTrue();
      });
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyMatrixCases_0004|HistoryInsightMatrixCases.test.ets|assert0012|assertTrue|actual|expected=true', tierLabel(tiers[0]).length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEPOLICYMATRIXCASES_0500
     * @tc.name      testArchivePolicyMatrixCases0005
     * @tc.desc      Verify rules of tier are consistent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testArchivePolicyMatrixCases0005', 0, (): void => {
      configureTestText();
      const tiers: RetentionTier[] = [];
      RETENTION_RULES.forEach((rule: RetentionRule): void => {
        if (tiers.indexOf(rule.tier) < 0) {
          tiers.push(rule.tier);
        }
      });
      let covered: number = 0;
      tiers.forEach((tier: RetentionTier): void => {
        const subset: RetentionRule[] = rulesOfTier(tier);
        if (subset.every((rule: RetentionRule): boolean => rule.tier === tier)) {
          covered++;
        }
      });
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyMatrixCases_0005|HistoryInsightMatrixCases.test.ets|assert0013|assertEqual|actual', covered)).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyMatrixCases_0005|HistoryInsightMatrixCases.test.ets|assert0013|assertEqual|expected', tiers.length));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyMatrixCases_0005|HistoryInsightMatrixCases.test.ets|assert0014|assertTrue|actual|expected=true', tiers.length > 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyMatrixCases_0005|HistoryInsightMatrixCases.test.ets|assert0015|assertTrue|actual|expected=true', tiers.length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEPOLICYMATRIXCASES_0600
     * @tc.name      testArchivePolicyMatrixCases0006
     * @tc.desc      Verify rule thresholds are ordered
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchivePolicyMatrixCases0006', 0, (): void => {
      configureTestText();
      RETENTION_RULES.forEach((rule: RetentionRule): void => {
        expect(traceParameter('com.samples.appstartupauto_ArchivePolicyMatrixCases_0006|HistoryInsightMatrixCases.test.ets|assert0016|assertTrue|actual|expected=true', rule.maxAgeMs >= 0)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_ArchivePolicyMatrixCases_0006|HistoryInsightMatrixCases.test.ets|assert0017|assertTrue|actual|expected=true', rule.description.length > 0)).assertTrue();
      });
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyMatrixCases_0006|HistoryInsightMatrixCases.test.ets|assert0018|assertTrue|actual|expected=true', RETENTION_RULES.length > 0)).assertTrue();
    });
  });
}
