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
import { QueryOutcome } from '../../../main/ets/autostart/AutoStartupTypes';
import { ArchiveEntry, DAY_MS } from '../../../main/ets/autostart/archive/ArchiveIndex';
import {
  CleanupDecision, CleanupPreview, CleanupReason, MAX_FAILURE_BONUS_DAYS, MAX_RETENTION_DAYS,
  MAX_RETENTION_ENTRIES, MIN_RETENTION_ENTRIES, RetentionAudit, RetentionPolicy, RetentionResult,
  applyRetention, auditRetentionPolicy, cleanupReasonLabel, defaultRetentionPolicy, describePolicy,
  isDeleteReason, normalizePolicy, previewCleanup
} from '../../../main/ets/autostart/archive/RetentionPolicy';

const NOW: number = 1700000000000;

function entryOf(id: number, timestamp: number, outcome: string): ArchiveEntry {
  const entry: ArchiveEntry = new ArchiveEntry(id, timestamp);
  entry.outcome = outcome;
  return entry;
}

/** 距今 daysAgo 个完整天前的一条记录。 */
function agedEntry(id: number, daysAgo: number, outcome: string): ArchiveEntry {
  return entryOf(id, NOW - daysAgo * DAY_MS, outcome);
}

function decisionOf(preview: CleanupPreview, entryId: number): CleanupDecision {
  return preview.decisions.find((item: CleanupDecision): boolean =>
    item.entryId === entryId) as CleanupDecision;
}

export default function retentionPolicyCasesTest(): void {
  configureTestText();
  describe('RetentionPolicyBasicsCases', (): void => {
    /**
     * @tc.number    SUB_STARTUP_RETENTIONPOLICYBASICSCASES_0100
     * @tc.name      testRetentionPolicyBasicsCases0001
     * @tc.desc      Verify constants and labels
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testRetentionPolicyBasicsCases0001', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0001|RetentionPolicyCases.test.ets|assert0001|assertEqual|actual', MIN_RETENTION_ENTRIES)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0001|RetentionPolicyCases.test.ets|assert0001|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0001|RetentionPolicyCases.test.ets|assert0002|assertEqual|actual', MAX_RETENTION_ENTRIES)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0001|RetentionPolicyCases.test.ets|assert0002|assertEqual|expected', 100000));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0001|RetentionPolicyCases.test.ets|assert0003|assertEqual|actual', MAX_RETENTION_DAYS)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0001|RetentionPolicyCases.test.ets|assert0003|assertEqual|expected', 3650));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0001|RetentionPolicyCases.test.ets|assert0004|assertEqual|actual', MAX_FAILURE_BONUS_DAYS)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0001|RetentionPolicyCases.test.ets|assert0004|assertEqual|expected', 7));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0001|RetentionPolicyCases.test.ets|assert0005|assertEqual|actual', DAY_MS)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0001|RetentionPolicyCases.test.ets|assert0005|assertEqual|expected', 86400000));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0001|RetentionPolicyCases.test.ets|assert0006|assertEqual|actual', cleanupReasonLabel(CleanupReason.AGE_EXPIRED))).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0001|RetentionPolicyCases.test.ets|assert0006|assertEqual|expected', '超过保留天数'));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0001|RetentionPolicyCases.test.ets|assert0007|assertEqual|actual', cleanupReasonLabel(CleanupReason.OVER_COUNT))).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0001|RetentionPolicyCases.test.ets|assert0007|assertEqual|expected', '超出条数上限'));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0001|RetentionPolicyCases.test.ets|assert0008|assertEqual|actual', cleanupReasonLabel(CleanupReason.KEPT_FAILURE_GRACE))).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0001|RetentionPolicyCases.test.ets|assert0008|assertEqual|expected', '失败样本多保留一天'));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0001|RetentionPolicyCases.test.ets|assert0009|assertEqual|actual', cleanupReasonLabel(CleanupReason.KEPT_PROTECTED))).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0001|RetentionPolicyCases.test.ets|assert0009|assertEqual|expected', '最近有效样本，禁止删除'));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0001|RetentionPolicyCases.test.ets|assert0010|assertEqual|actual', cleanupReasonLabel(CleanupReason.KEPT_UNKNOWN_TIME))).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0001|RetentionPolicyCases.test.ets|assert0010|assertEqual|expected', '时间未知，暂不清理'));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0001|RetentionPolicyCases.test.ets|assert0011|assertEqual|actual', cleanupReasonLabel(CleanupReason.KEPT_RECENT))).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0001|RetentionPolicyCases.test.ets|assert0011|assertEqual|expected', '在保留范围内'));
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONPOLICYBASICSCASES_0200
     * @tc.name      testRetentionPolicyBasicsCases0002
     * @tc.desc      Verify is delete reason covers two values
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionPolicyBasicsCases0002', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0002|RetentionPolicyCases.test.ets|assert0012|assertTrue|actual|expected=true', isDeleteReason(CleanupReason.AGE_EXPIRED))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0002|RetentionPolicyCases.test.ets|assert0013|assertTrue|actual|expected=true', isDeleteReason(CleanupReason.OVER_COUNT))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0002|RetentionPolicyCases.test.ets|assert0014|assertFalse|actual|expected=false', isDeleteReason(CleanupReason.KEPT_RECENT))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0002|RetentionPolicyCases.test.ets|assert0015|assertFalse|actual|expected=false', isDeleteReason(CleanupReason.KEPT_FAILURE_GRACE))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0002|RetentionPolicyCases.test.ets|assert0016|assertFalse|actual|expected=false', isDeleteReason(CleanupReason.KEPT_PROTECTED))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0002|RetentionPolicyCases.test.ets|assert0017|assertFalse|actual|expected=false', isDeleteReason(CleanupReason.KEPT_UNKNOWN_TIME))).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONPOLICYBASICSCASES_0300
     * @tc.name      testRetentionPolicyBasicsCases0003
     * @tc.desc      Verify retention days for only failure gets bonus
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionPolicyBasicsCases0003', 0, (): void => {
      configureTestText();
      const policy: RetentionPolicy = new RetentionPolicy(500, 90, 1);
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0003|RetentionPolicyCases.test.ets|assert0018|assertEqual|actual', policy.retentionDaysFor(QueryOutcome.SUCCESS))).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0003|RetentionPolicyCases.test.ets|assert0018|assertEqual|expected', 90));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0003|RetentionPolicyCases.test.ets|assert0019|assertEqual|actual', policy.retentionDaysFor(QueryOutcome.FAILURE))).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0003|RetentionPolicyCases.test.ets|assert0019|assertEqual|expected', 91));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0003|RetentionPolicyCases.test.ets|assert0020|assertEqual|actual', policy.retentionDaysFor(QueryOutcome.TIMEOUT))).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0003|RetentionPolicyCases.test.ets|assert0020|assertEqual|expected', 90));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0003|RetentionPolicyCases.test.ets|assert0021|assertEqual|actual', policy.retentionDaysFor(QueryOutcome.UNSUPPORTED))).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0003|RetentionPolicyCases.test.ets|assert0021|assertEqual|expected', 90));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0003|RetentionPolicyCases.test.ets|assert0022|assertEqual|actual', policy.retentionDaysFor(QueryOutcome.UNKNOWN))).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0003|RetentionPolicyCases.test.ets|assert0022|assertEqual|expected', 90));
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONPOLICYBASICSCASES_0400
     * @tc.name      testRetentionPolicyBasicsCases0004
     * @tc.desc      Verify retention days for falls back when not finite
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionPolicyBasicsCases0004', 0, (): void => {
      configureTestText();
      const policy: RetentionPolicy = new RetentionPolicy(500, Number.NaN, Number.NaN);
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0004|RetentionPolicyCases.test.ets|assert0023|assertEqual|actual', policy.retentionDaysFor(QueryOutcome.SUCCESS))).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0004|RetentionPolicyCases.test.ets|assert0023|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0004|RetentionPolicyCases.test.ets|assert0024|assertEqual|actual', policy.retentionDaysFor(QueryOutcome.FAILURE))).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0004|RetentionPolicyCases.test.ets|assert0024|assertEqual|expected', 1));
      const tiny: RetentionPolicy = new RetentionPolicy(500, 0.4, 0.4);
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0004|RetentionPolicyCases.test.ets|assert0025|assertEqual|actual', tiny.retentionDaysFor(QueryOutcome.SUCCESS))).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0004|RetentionPolicyCases.test.ets|assert0025|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0004|RetentionPolicyCases.test.ets|assert0026|assertEqual|actual', tiny.retentionDaysFor(QueryOutcome.FAILURE))).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0004|RetentionPolicyCases.test.ets|assert0026|assertEqual|expected', 1));
      const rounded: RetentionPolicy = new RetentionPolicy(500, 10.6, 2.4);
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0004|RetentionPolicyCases.test.ets|assert0027|assertEqual|actual', rounded.retentionDaysFor(QueryOutcome.SUCCESS))).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0004|RetentionPolicyCases.test.ets|assert0027|assertEqual|expected', 11));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0004|RetentionPolicyCases.test.ets|assert0028|assertEqual|actual', rounded.retentionDaysFor(QueryOutcome.FAILURE))).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0004|RetentionPolicyCases.test.ets|assert0028|assertEqual|expected', 13));
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONPOLICYBASICSCASES_0500
     * @tc.name      testRetentionPolicyBasicsCases0005
     * @tc.desc      Verify normalize clamps every field
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionPolicyBasicsCases0005', 0, (): void => {
      configureTestText();
      const clamped: RetentionPolicy = normalizePolicy(new RetentionPolicy(0, 0, -5));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0005|RetentionPolicyCases.test.ets|assert0029|assertEqual|actual', clamped.maxEntries)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0005|RetentionPolicyCases.test.ets|assert0029|assertEqual|expected', MIN_RETENTION_ENTRIES));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0005|RetentionPolicyCases.test.ets|assert0030|assertEqual|actual', clamped.maxDays)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0005|RetentionPolicyCases.test.ets|assert0030|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0005|RetentionPolicyCases.test.ets|assert0031|assertEqual|actual', clamped.failureBonusDays)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0005|RetentionPolicyCases.test.ets|assert0031|assertEqual|expected', 0));
      const capped: RetentionPolicy = normalizePolicy(new RetentionPolicy(200000, 4000, 9));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0005|RetentionPolicyCases.test.ets|assert0032|assertEqual|actual', capped.maxEntries)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0005|RetentionPolicyCases.test.ets|assert0032|assertEqual|expected', MAX_RETENTION_ENTRIES));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0005|RetentionPolicyCases.test.ets|assert0033|assertEqual|actual', capped.maxDays)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0005|RetentionPolicyCases.test.ets|assert0033|assertEqual|expected', MAX_RETENTION_DAYS));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0005|RetentionPolicyCases.test.ets|assert0034|assertEqual|actual', capped.failureBonusDays)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0005|RetentionPolicyCases.test.ets|assert0034|assertEqual|expected', MAX_FAILURE_BONUS_DAYS));
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONPOLICYBASICSCASES_0600
     * @tc.name      testRetentionPolicyBasicsCases0006
     * @tc.desc      Verify normalize maps non finite to minimum
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionPolicyBasicsCases0006', 0, (): void => {
      configureTestText();
      const policy: RetentionPolicy = normalizePolicy(
        new RetentionPolicy(Number.NaN, Number.POSITIVE_INFINITY, Number.NaN));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0006|RetentionPolicyCases.test.ets|assert0035|assertEqual|actual', policy.maxEntries)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0006|RetentionPolicyCases.test.ets|assert0035|assertEqual|expected', MIN_RETENTION_ENTRIES));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0006|RetentionPolicyCases.test.ets|assert0036|assertEqual|actual', policy.maxDays)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0006|RetentionPolicyCases.test.ets|assert0036|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0006|RetentionPolicyCases.test.ets|assert0037|assertEqual|actual', policy.failureBonusDays)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0006|RetentionPolicyCases.test.ets|assert0037|assertEqual|expected', 0));
      const rounded: RetentionPolicy = normalizePolicy(new RetentionPolicy(10.5, 20.4, 1.6));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0006|RetentionPolicyCases.test.ets|assert0038|assertEqual|actual', rounded.maxEntries)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0006|RetentionPolicyCases.test.ets|assert0038|assertEqual|expected', 11));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0006|RetentionPolicyCases.test.ets|assert0039|assertEqual|actual', rounded.maxDays)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0006|RetentionPolicyCases.test.ets|assert0039|assertEqual|expected', 20));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0006|RetentionPolicyCases.test.ets|assert0040|assertEqual|actual', rounded.failureBonusDays)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0006|RetentionPolicyCases.test.ets|assert0040|assertEqual|expected', 2));
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONPOLICYBASICSCASES_0700
     * @tc.name      testRetentionPolicyBasicsCases0007
     * @tc.desc      Verify equals compares raw fields
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionPolicyBasicsCases0007', 0, (): void => {
      configureTestText();
      const left: RetentionPolicy = new RetentionPolicy(500.4, 90, 1);
      const right: RetentionPolicy = new RetentionPolicy(500, 90, 1);
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0007|RetentionPolicyCases.test.ets|assert0041|assertFalse|actual|expected=false', left.equals(right))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0007|RetentionPolicyCases.test.ets|assert0042|assertTrue|actual|expected=true', normalizePolicy(left).equals(right))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0007|RetentionPolicyCases.test.ets|assert0043|assertTrue|actual|expected=true', new RetentionPolicy(500, 90, 1).equals(new RetentionPolicy(500, 90, 1)))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0007|RetentionPolicyCases.test.ets|assert0044|assertFalse|actual|expected=false', new RetentionPolicy(500, 90, 1).equals(new RetentionPolicy(500, 90, 2)))).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONPOLICYBASICSCASES_0800
     * @tc.name      testRetentionPolicyBasicsCases0008
     * @tc.desc      Verify default policy and text
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testRetentionPolicyBasicsCases0008', 0, (): void => {
      configureTestText();
      const policy: RetentionPolicy = defaultRetentionPolicy();
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0008|RetentionPolicyCases.test.ets|assert0045|assertEqual|actual', policy.maxEntries)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0008|RetentionPolicyCases.test.ets|assert0045|assertEqual|expected', 500));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0008|RetentionPolicyCases.test.ets|assert0046|assertEqual|actual', policy.maxDays)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0008|RetentionPolicyCases.test.ets|assert0046|assertEqual|expected', 90));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0008|RetentionPolicyCases.test.ets|assert0047|assertEqual|actual', policy.failureBonusDays)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0008|RetentionPolicyCases.test.ets|assert0047|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0008|RetentionPolicyCases.test.ets|assert0048|assertEqual|actual', policy.text())).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0008|RetentionPolicyCases.test.ets|assert0048|assertEqual|expected', '条数上限 500｜天数上限 90 天｜失败样本额外 1 天'));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0008|RetentionPolicyCases.test.ets|assert0049|assertTrue|actual|expected=true', new RetentionPolicy().equals(policy))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0008|RetentionPolicyCases.test.ets|assert0050|assertTrue|actual|expected=true', policy.normalized().equals(policy))).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONPOLICYBASICSCASES_0900
     * @tc.name      testRetentionPolicyBasicsCases0009
     * @tc.desc      Verify describe policy with bonus
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionPolicyBasicsCases0009', 0, (): void => {
      configureTestText();
      const lines: string[] = describePolicy(new RetentionPolicy(500, 90, 2));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0009|RetentionPolicyCases.test.ets|assert0051|assertEqual|actual', lines.length)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0009|RetentionPolicyCases.test.ets|assert0051|assertEqual|expected', 4));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0009|RetentionPolicyCases.test.ets|assert0052|assertEqual|actual', lines[0])).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0009|RetentionPolicyCases.test.ets|assert0052|assertEqual|expected', '最多保留 500 条，超出部分按时间从旧到新清理'));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0009|RetentionPolicyCases.test.ets|assert0053|assertEqual|actual', lines[1])).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0009|RetentionPolicyCases.test.ets|assert0053|assertEqual|expected', '最多保留 90 天，更早的记录按天数清理'));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0009|RetentionPolicyCases.test.ets|assert0054|assertEqual|actual', lines[2])).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0009|RetentionPolicyCases.test.ets|assert0054|assertEqual|expected', '失败样本额外保留 2 天（实际 92 天），用于排查'));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0009|RetentionPolicyCases.test.ets|assert0055|assertEqual|actual', lines[3])).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0009|RetentionPolicyCases.test.ets|assert0055|assertEqual|expected', '最近一条有效样本永远保留，不受上述两条规则影响'));
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONPOLICYBASICSCASES_1000
     * @tc.name      testRetentionPolicyBasicsCases0010
     * @tc.desc      Verify describe policy without bonus
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionPolicyBasicsCases0010', 0, (): void => {
      configureTestText();
      const lines: string[] = describePolicy(new RetentionPolicy(10, 7, 0));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0010|RetentionPolicyCases.test.ets|assert0056|assertEqual|actual', lines.length)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0010|RetentionPolicyCases.test.ets|assert0056|assertEqual|expected', 4));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0010|RetentionPolicyCases.test.ets|assert0057|assertEqual|actual', lines[2])).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0010|RetentionPolicyCases.test.ets|assert0057|assertEqual|expected', '失败样本与其他结果保留天数一致'));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0010|RetentionPolicyCases.test.ets|assert0058|assertEqual|actual', describePolicy(new RetentionPolicy(0, 0, 0))[0]))
        .assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0010|RetentionPolicyCases.test.ets|assert0058|assertEqual|expected', '最多保留 1 条，超出部分按时间从旧到新清理'));
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONPOLICYBASICSCASES_1100
     * @tc.name      testRetentionPolicyBasicsCases0011
     * @tc.desc      Verify decision describe carries detail
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionPolicyBasicsCases0011', 0, (): void => {
      configureTestText();
      const kept: CleanupDecision = new CleanupDecision(7, true, CleanupReason.KEPT_RECENT);
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0011|RetentionPolicyCases.test.ets|assert0059|assertEqual|actual', kept.describe())).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0011|RetentionPolicyCases.test.ets|assert0059|assertEqual|expected', '保留 #7｜在保留范围内'));
      kept.detail = '年龄 1/90 天，且在 500 条以内';
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0011|RetentionPolicyCases.test.ets|assert0060|assertEqual|actual', kept.describe())).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0011|RetentionPolicyCases.test.ets|assert0060|assertEqual|expected', '保留 #7｜在保留范围内｜年龄 1/90 天，且在 500 条以内'));
      const dropped: CleanupDecision = new CleanupDecision(9, false, CleanupReason.OVER_COUNT);
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0011|RetentionPolicyCases.test.ets|assert0061|assertEqual|actual', dropped.describe())).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0011|RetentionPolicyCases.test.ets|assert0061|assertEqual|expected', '删除 #9｜超出条数上限'));
      expect(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0011|RetentionPolicyCases.test.ets|assert0062|assertEqual|actual', dropped.ageDays)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPolicyBasicsCases_0011|RetentionPolicyCases.test.ets|assert0062|assertEqual|expected', -1));
    });
  });

  describe('RetentionAuditCases', (): void => {
    /**
     * @tc.number    SUB_STARTUP_RETENTIONAUDITCASES_0100
     * @tc.name      testRetentionAuditCases0001
     * @tc.desc      Verify audit passes for defaults
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testRetentionAuditCases0001', 0, (): void => {
      configureTestText();
      const audit: RetentionAudit = auditRetentionPolicy(defaultRetentionPolicy());
      expect(traceParameter('com.samples.appstartupauto_RetentionAuditCases_0001|RetentionPolicyCases.test.ets|assert0063|assertTrue|actual|expected=true', audit.ok)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RetentionAuditCases_0001|RetentionPolicyCases.test.ets|assert0064|assertEqual|actual', audit.findings.length)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionAuditCases_0001|RetentionPolicyCases.test.ets|assert0064|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_RetentionAuditCases_0001|RetentionPolicyCases.test.ets|assert0065|assertEqual|actual', audit.report())).assertEqual(traceParameter('com.samples.appstartupauto_RetentionAuditCases_0001|RetentionPolicyCases.test.ets|assert0065|assertEqual|expected', '保留策略自洽'));
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONAUDITCASES_0200
     * @tc.name      testRetentionAuditCases0002
     * @tc.desc      Verify audit flags out of range entries
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionAuditCases0002', 0, (): void => {
      configureTestText();
      const audit: RetentionAudit = auditRetentionPolicy(new RetentionPolicy(0, 90, 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionAuditCases_0002|RetentionPolicyCases.test.ets|assert0066|assertFalse|actual|expected=false', audit.ok)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RetentionAuditCases_0002|RetentionPolicyCases.test.ets|assert0067|assertEqual|actual', audit.findings.length)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionAuditCases_0002|RetentionPolicyCases.test.ets|assert0067|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionAuditCases_0002|RetentionPolicyCases.test.ets|assert0068|assertEqual|actual', audit.findings[0])).assertEqual(traceParameter('com.samples.appstartupauto_RetentionAuditCases_0002|RetentionPolicyCases.test.ets|assert0068|assertEqual|expected', '条数上限越界：0'));
      expect(traceParameter('com.samples.appstartupauto_RetentionAuditCases_0002|RetentionPolicyCases.test.ets|assert0069|assertEqual|actual', audit.report())).assertEqual(traceParameter('com.samples.appstartupauto_RetentionAuditCases_0002|RetentionPolicyCases.test.ets|assert0069|assertEqual|expected', '条数上限越界：0'));
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONAUDITCASES_0300
     * @tc.name      testRetentionAuditCases0003
     * @tc.desc      Verify audit flags days and bonus together
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionAuditCases0003', 0, (): void => {
      configureTestText();
      const audit: RetentionAudit = auditRetentionPolicy(new RetentionPolicy(500, 4000, 9));
      expect(traceParameter('com.samples.appstartupauto_RetentionAuditCases_0003|RetentionPolicyCases.test.ets|assert0070|assertFalse|actual|expected=false', audit.ok)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RetentionAuditCases_0003|RetentionPolicyCases.test.ets|assert0071|assertEqual|actual', audit.findings.length)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionAuditCases_0003|RetentionPolicyCases.test.ets|assert0071|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_RetentionAuditCases_0003|RetentionPolicyCases.test.ets|assert0072|assertEqual|actual', audit.findings[0])).assertEqual(traceParameter('com.samples.appstartupauto_RetentionAuditCases_0003|RetentionPolicyCases.test.ets|assert0072|assertEqual|expected', '天数上限越界：4000'));
      expect(traceParameter('com.samples.appstartupauto_RetentionAuditCases_0003|RetentionPolicyCases.test.ets|assert0073|assertEqual|actual', audit.findings[1])).assertEqual(traceParameter('com.samples.appstartupauto_RetentionAuditCases_0003|RetentionPolicyCases.test.ets|assert0073|assertEqual|expected', '失败样本额外天数越界：9'));
      expect(traceParameter('com.samples.appstartupauto_RetentionAuditCases_0003|RetentionPolicyCases.test.ets|assert0074|assertTrue|actual|expected=true', audit.report().indexOf('；') > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONAUDITCASES_0400
     * @tc.name      testRetentionAuditCases0004
     * @tc.desc      Verify audit rejects fractional fields
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionAuditCases0004', 0, (): void => {
      configureTestText();
      const audit: RetentionAudit = auditRetentionPolicy(new RetentionPolicy(500.5, 90.5, 1.5));
      expect(traceParameter('com.samples.appstartupauto_RetentionAuditCases_0004|RetentionPolicyCases.test.ets|assert0075|assertFalse|actual|expected=false', audit.ok)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RetentionAuditCases_0004|RetentionPolicyCases.test.ets|assert0076|assertEqual|actual', audit.findings.length)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionAuditCases_0004|RetentionPolicyCases.test.ets|assert0076|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_RetentionAuditCases_0004|RetentionPolicyCases.test.ets|assert0077|assertEqual|actual', audit.findings[0])).assertEqual(traceParameter('com.samples.appstartupauto_RetentionAuditCases_0004|RetentionPolicyCases.test.ets|assert0077|assertEqual|expected', '条数上限越界：500.5'));
      expect(traceParameter('com.samples.appstartupauto_RetentionAuditCases_0004|RetentionPolicyCases.test.ets|assert0078|assertEqual|actual', audit.findings[1])).assertEqual(traceParameter('com.samples.appstartupauto_RetentionAuditCases_0004|RetentionPolicyCases.test.ets|assert0078|assertEqual|expected', '天数上限越界：90.5'));
      expect(traceParameter('com.samples.appstartupauto_RetentionAuditCases_0004|RetentionPolicyCases.test.ets|assert0079|assertEqual|actual', audit.findings[2])).assertEqual(traceParameter('com.samples.appstartupauto_RetentionAuditCases_0004|RetentionPolicyCases.test.ets|assert0079|assertEqual|expected', '失败样本额外天数越界：1.5'));
    });
  });

  describe('RetentionPreviewCases', (): void => {
    /**
     * @tc.number    SUB_STARTUP_RETENTIONPREVIEWCASES_0100
     * @tc.name      testRetentionPreviewCases0001
     * @tc.desc      Verify empty input preview
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionPreviewCases0001', 0, (): void => {
      configureTestText();
      const preview: CleanupPreview = previewCleanup([], NOW, defaultRetentionPolicy());
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0001|RetentionPolicyCases.test.ets|assert0080|assertTrue|actual|expected=true', preview.emptyInput)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0001|RetentionPolicyCases.test.ets|assert0081|assertEqual|actual', preview.decisions.length)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0001|RetentionPolicyCases.test.ets|assert0081|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0001|RetentionPolicyCases.test.ets|assert0082|assertEqual|actual', preview.notes.length)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0001|RetentionPolicyCases.test.ets|assert0082|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0001|RetentionPolicyCases.test.ets|assert0083|assertEqual|actual', preview.summaryText())).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0001|RetentionPolicyCases.test.ets|assert0083|assertEqual|expected', '没有可清理的归档记录：保留 0 条，删除 0 条'));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0001|RetentionPolicyCases.test.ets|assert0084|assertFalse|actual|expected=false', preview.hasDeletions())).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONPREVIEWCASES_0200
     * @tc.name      testRetentionPreviewCases0002
     * @tc.desc      Verify age expired by days
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionPreviewCases0002', 0, (): void => {
      configureTestText();
      const entries: ArchiveEntry[] = [
        agedEntry(1, 11, QueryOutcome.SUCCESS),
        agedEntry(2, 1, QueryOutcome.SUCCESS)
      ];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(500, 10, 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0002|RetentionPolicyCases.test.ets|assert0085|assertEqual|actual', preview.deleteCount)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0002|RetentionPolicyCases.test.ets|assert0085|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0002|RetentionPolicyCases.test.ets|assert0086|assertEqual|actual', preview.agedCount)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0002|RetentionPolicyCases.test.ets|assert0086|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0002|RetentionPolicyCases.test.ets|assert0087|assertEqual|actual', preview.countCutCount)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0002|RetentionPolicyCases.test.ets|assert0087|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0002|RetentionPolicyCases.test.ets|assert0088|assertEqual|actual', preview.deletedIds().length)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0002|RetentionPolicyCases.test.ets|assert0088|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0002|RetentionPolicyCases.test.ets|assert0089|assertEqual|actual', preview.deletedIds()[0])).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0002|RetentionPolicyCases.test.ets|assert0089|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0002|RetentionPolicyCases.test.ets|assert0090|assertEqual|actual', decisionOf(preview, 1).detail)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0002|RetentionPolicyCases.test.ets|assert0090|assertEqual|expected', '年龄 11 天超过 10 天'));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0002|RetentionPolicyCases.test.ets|assert0091|assertEqual|actual', decisionOf(preview, 1).ageDays)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0002|RetentionPolicyCases.test.ets|assert0091|assertEqual|expected', 11));
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONPREVIEWCASES_0300
     * @tc.name      testRetentionPreviewCases0003
     * @tc.desc      Verify age boundary is strictly greater
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionPreviewCases0003', 0, (): void => {
      configureTestText();
      const entries: ArchiveEntry[] = [
        agedEntry(2, 1, QueryOutcome.SUCCESS),
        agedEntry(1, 10, QueryOutcome.TIMEOUT)
      ];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(500, 10, 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0003|RetentionPolicyCases.test.ets|assert0092|assertEqual|actual', preview.deleteCount)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0003|RetentionPolicyCases.test.ets|assert0092|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0003|RetentionPolicyCases.test.ets|assert0093|assertEqual|actual', preview.keepCount)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0003|RetentionPolicyCases.test.ets|assert0093|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0003|RetentionPolicyCases.test.ets|assert0094|assertEqual|actual', decisionOf(preview, 1).reason)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0003|RetentionPolicyCases.test.ets|assert0094|assertEqual|expected', CleanupReason.KEPT_RECENT));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0003|RetentionPolicyCases.test.ets|assert0095|assertEqual|actual', decisionOf(preview, 1).ageDays)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0003|RetentionPolicyCases.test.ets|assert0095|assertEqual|expected', 10));
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONPREVIEWCASES_0400
     * @tc.name      testRetentionPreviewCases0004
     * @tc.desc      Verify protected sample is rescued from age
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionPreviewCases0004', 0, (): void => {
      configureTestText();
      const entries: ArchiveEntry[] = [agedEntry(5, 100, QueryOutcome.SUCCESS)];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(500, 90, 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0004|RetentionPolicyCases.test.ets|assert0096|assertEqual|actual', preview.keepCount)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0004|RetentionPolicyCases.test.ets|assert0096|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0004|RetentionPolicyCases.test.ets|assert0097|assertEqual|actual', preview.deleteCount)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0004|RetentionPolicyCases.test.ets|assert0097|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0004|RetentionPolicyCases.test.ets|assert0098|assertEqual|actual', preview.protectedId)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0004|RetentionPolicyCases.test.ets|assert0098|assertEqual|expected', 5));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0004|RetentionPolicyCases.test.ets|assert0099|assertTrue|actual|expected=true', preview.protectedRescued)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0004|RetentionPolicyCases.test.ets|assert0100|assertEqual|actual', decisionOf(preview, 5).reason)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0004|RetentionPolicyCases.test.ets|assert0100|assertEqual|expected', CleanupReason.KEPT_PROTECTED));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0004|RetentionPolicyCases.test.ets|assert0101|assertEqual|actual', decisionOf(preview, 5).detail))
        .assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0004|RetentionPolicyCases.test.ets|assert0101|assertEqual|expected', '年龄 100 天已超过 90 天，但作为最近有效样本豁免'));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0004|RetentionPolicyCases.test.ets|assert0102|assertTrue|actual|expected=true', preview.notes.indexOf('最近有效样本 #5 本应被清理，已豁免保留') >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONPREVIEWCASES_0500
     * @tc.name      testRetentionPreviewCases0005
     * @tc.desc      Verify protected sample not rescued when in range
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionPreviewCases0005', 0, (): void => {
      configureTestText();
      const entries: ArchiveEntry[] = [agedEntry(5, 3, QueryOutcome.FAILURE)];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(500, 90, 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0005|RetentionPolicyCases.test.ets|assert0103|assertFalse|actual|expected=false', preview.protectedRescued)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0005|RetentionPolicyCases.test.ets|assert0104|assertEqual|actual', decisionOf(preview, 5).detail)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0005|RetentionPolicyCases.test.ets|assert0104|assertEqual|expected', '最近一条有效样本，规则不删除'));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0005|RetentionPolicyCases.test.ets|assert0105|assertTrue|actual|expected=true', preview.notes.indexOf('最近有效样本 #5 已保留（不受天数/条数规则影响）') >= 0))
        .assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONPREVIEWCASES_0600
     * @tc.name      testRetentionPreviewCases0006
     * @tc.desc      Verify over count keeps newest only
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionPreviewCases0006', 0, (): void => {
      configureTestText();
      const entries: ArchiveEntry[] = [
        agedEntry(1, 3, QueryOutcome.SUCCESS),
        agedEntry(2, 2, QueryOutcome.SUCCESS),
        agedEntry(3, 1, QueryOutcome.SUCCESS)
      ];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(2, 90, 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0006|RetentionPolicyCases.test.ets|assert0106|assertEqual|actual', preview.deleteCount)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0006|RetentionPolicyCases.test.ets|assert0106|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0006|RetentionPolicyCases.test.ets|assert0107|assertEqual|actual', preview.countCutCount)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0006|RetentionPolicyCases.test.ets|assert0107|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0006|RetentionPolicyCases.test.ets|assert0108|assertEqual|actual', preview.deletedIds().length)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0006|RetentionPolicyCases.test.ets|assert0108|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0006|RetentionPolicyCases.test.ets|assert0109|assertEqual|actual', preview.deletedIds()[0])).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0006|RetentionPolicyCases.test.ets|assert0109|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0006|RetentionPolicyCases.test.ets|assert0110|assertEqual|actual', preview.keptIds().length)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0006|RetentionPolicyCases.test.ets|assert0110|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0006|RetentionPolicyCases.test.ets|assert0111|assertEqual|actual', decisionOf(preview, 1).detail)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0006|RetentionPolicyCases.test.ets|assert0111|assertEqual|expected', '超出条数上限 2，按时间从旧到新清理'));
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONPREVIEWCASES_0700
     * @tc.name      testRetentionPreviewCases0007
     * @tc.desc      Verify unknown time entries are kept aside
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionPreviewCases0007', 0, (): void => {
      configureTestText();
      const entries: ArchiveEntry[] = [
        entryOf(1, 0, QueryOutcome.SUCCESS),
        agedEntry(2, 500, QueryOutcome.SUCCESS)
      ];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(1, 90, 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0007|RetentionPolicyCases.test.ets|assert0112|assertEqual|actual', preview.unknownTimeCount)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0007|RetentionPolicyCases.test.ets|assert0112|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0007|RetentionPolicyCases.test.ets|assert0113|assertEqual|actual', decisionOf(preview, 1).reason)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0007|RetentionPolicyCases.test.ets|assert0113|assertEqual|expected', CleanupReason.KEPT_UNKNOWN_TIME));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0007|RetentionPolicyCases.test.ets|assert0114|assertEqual|actual', decisionOf(preview, 1).ageDays)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0007|RetentionPolicyCases.test.ets|assert0114|assertEqual|expected', -1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0007|RetentionPolicyCases.test.ets|assert0115|assertEqual|actual', decisionOf(preview, 1).retentionDays)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0007|RetentionPolicyCases.test.ets|assert0115|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0007|RetentionPolicyCases.test.ets|assert0116|assertEqual|actual', decisionOf(preview, 1).detail)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0007|RetentionPolicyCases.test.ets|assert0116|assertEqual|expected', '时间戳缺失或非法，已保留且不计入天数/条数'));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0007|RetentionPolicyCases.test.ets|assert0117|assertEqual|actual', preview.keepCount)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0007|RetentionPolicyCases.test.ets|assert0117|assertEqual|expected', 2));
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONPREVIEWCASES_0800
     * @tc.name      testRetentionPreviewCases0008
     * @tc.desc      Verify unknown time does not take protection slot
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionPreviewCases0008', 0, (): void => {
      configureTestText();
      const entries: ArchiveEntry[] = [
        entryOf(3, 0, QueryOutcome.SUCCESS),
        agedEntry(2, 2, QueryOutcome.SUCCESS),
        agedEntry(1, 1, QueryOutcome.SUCCESS)
      ];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(500, 90, 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0008|RetentionPolicyCases.test.ets|assert0118|assertEqual|actual', preview.protectedId)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0008|RetentionPolicyCases.test.ets|assert0118|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0008|RetentionPolicyCases.test.ets|assert0119|assertEqual|actual', preview.decisions[0].entryId)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0008|RetentionPolicyCases.test.ets|assert0119|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0008|RetentionPolicyCases.test.ets|assert0120|assertEqual|actual', preview.decisions[1].entryId)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0008|RetentionPolicyCases.test.ets|assert0120|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0008|RetentionPolicyCases.test.ets|assert0121|assertEqual|actual', preview.decisions[2].entryId)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0008|RetentionPolicyCases.test.ets|assert0121|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0008|RetentionPolicyCases.test.ets|assert0122|assertEqual|actual', decisionOf(preview, 3).reason)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0008|RetentionPolicyCases.test.ets|assert0122|assertEqual|expected', CleanupReason.KEPT_UNKNOWN_TIME));
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONPREVIEWCASES_0900
     * @tc.name      testRetentionPreviewCases0009
     * @tc.desc      Verify failure grace keeps older failure
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionPreviewCases0009', 0, (): void => {
      configureTestText();
      const entries: ArchiveEntry[] = [
        agedEntry(2, 1, QueryOutcome.SUCCESS),
        agedEntry(1, 12, QueryOutcome.FAILURE)
      ];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(500, 10, 5));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0009|RetentionPolicyCases.test.ets|assert0123|assertEqual|actual', preview.deleteCount)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0009|RetentionPolicyCases.test.ets|assert0123|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0009|RetentionPolicyCases.test.ets|assert0124|assertEqual|actual', decisionOf(preview, 1).reason)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0009|RetentionPolicyCases.test.ets|assert0124|assertEqual|expected', CleanupReason.KEPT_FAILURE_GRACE));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0009|RetentionPolicyCases.test.ets|assert0125|assertEqual|actual', decisionOf(preview, 1).detail))
        .assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0009|RetentionPolicyCases.test.ets|assert0125|assertEqual|expected', '失败样本在 10 天基础上多保留 5 天'));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0009|RetentionPolicyCases.test.ets|assert0126|assertEqual|actual', decisionOf(preview, 1).retentionDays)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0009|RetentionPolicyCases.test.ets|assert0126|assertEqual|expected', 15));
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONPREVIEWCASES_1000
     * @tc.name      testRetentionPreviewCases0010
     * @tc.desc      Verify non failure does not get grace
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionPreviewCases0010', 0, (): void => {
      configureTestText();
      const entries: ArchiveEntry[] = [
        agedEntry(2, 1, QueryOutcome.SUCCESS),
        agedEntry(1, 12, QueryOutcome.TIMEOUT)
      ];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(500, 10, 5));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0010|RetentionPolicyCases.test.ets|assert0127|assertEqual|actual', preview.deletedIds().length)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0010|RetentionPolicyCases.test.ets|assert0127|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0010|RetentionPolicyCases.test.ets|assert0128|assertEqual|actual', preview.deletedIds()[0])).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0010|RetentionPolicyCases.test.ets|assert0128|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0010|RetentionPolicyCases.test.ets|assert0129|assertEqual|actual', decisionOf(preview, 1).reason)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0010|RetentionPolicyCases.test.ets|assert0129|assertEqual|expected', CleanupReason.AGE_EXPIRED));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0010|RetentionPolicyCases.test.ets|assert0130|assertEqual|actual', decisionOf(preview, 1).retentionDays)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0010|RetentionPolicyCases.test.ets|assert0130|assertEqual|expected', 10));
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONPREVIEWCASES_1100
     * @tc.name      testRetentionPreviewCases0011
     * @tc.desc      Verify invalid now skips day rules
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionPreviewCases0011', 0, (): void => {
      configureTestText();
      const entries: ArchiveEntry[] = [agedEntry(1, 5000, QueryOutcome.SUCCESS)];
      const preview: CleanupPreview = previewCleanup(entries, 0, new RetentionPolicy(500, 90, 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0011|RetentionPolicyCases.test.ets|assert0131|assertEqual|actual', preview.now)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0011|RetentionPolicyCases.test.ets|assert0131|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0011|RetentionPolicyCases.test.ets|assert0132|assertEqual|actual', preview.deleteCount)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0011|RetentionPolicyCases.test.ets|assert0132|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0011|RetentionPolicyCases.test.ets|assert0133|assertEqual|actual', decisionOf(preview, 1).ageDays)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0011|RetentionPolicyCases.test.ets|assert0133|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0011|RetentionPolicyCases.test.ets|assert0134|assertTrue|actual|expected=true', preview.notes.indexOf('当前时间无效，已跳过天数规则，仅按条数上限清理') >= 0)).assertTrue();
      const negative: CleanupPreview = previewCleanup(entries, -5, new RetentionPolicy(500, 90, 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0011|RetentionPolicyCases.test.ets|assert0135|assertEqual|actual', negative.deleteCount)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0011|RetentionPolicyCases.test.ets|assert0135|assertEqual|expected', 0));
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONPREVIEWCASES_1200
     * @tc.name      testRetentionPreviewCases0012
     * @tc.desc      Verify rescued when rank exceeds max entries
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionPreviewCases0012', 0, (): void => {
      configureTestText();
      const entries: ArchiveEntry[] = [
        agedEntry(3, 1, QueryOutcome.TIMEOUT),
        agedEntry(2, 2, QueryOutcome.SUCCESS)
      ];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(1, 90, 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0012|RetentionPolicyCases.test.ets|assert0136|assertEqual|actual', preview.protectedId)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0012|RetentionPolicyCases.test.ets|assert0136|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0012|RetentionPolicyCases.test.ets|assert0137|assertTrue|actual|expected=true', preview.protectedRescued)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0012|RetentionPolicyCases.test.ets|assert0138|assertEqual|actual', decisionOf(preview, 3).reason)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0012|RetentionPolicyCases.test.ets|assert0138|assertEqual|expected', CleanupReason.OVER_COUNT));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0012|RetentionPolicyCases.test.ets|assert0139|assertEqual|actual', preview.deleteCount)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0012|RetentionPolicyCases.test.ets|assert0139|assertEqual|expected', 1));
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONPREVIEWCASES_1300
     * @tc.name      testRetentionPreviewCases0013
     * @tc.desc      Verify sort is timestamp then id descending
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionPreviewCases0013', 0, (): void => {
      configureTestText();
      const same: number = NOW - DAY_MS;
      const entries: ArchiveEntry[] = [
        entryOf(1, same, QueryOutcome.SUCCESS),
        entryOf(3, same, QueryOutcome.SUCCESS),
        entryOf(2, same, QueryOutcome.SUCCESS)
      ];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(500, 90, 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0013|RetentionPolicyCases.test.ets|assert0140|assertEqual|actual', preview.decisions.length)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0013|RetentionPolicyCases.test.ets|assert0140|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0013|RetentionPolicyCases.test.ets|assert0141|assertEqual|actual', preview.decisions[0].entryId)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0013|RetentionPolicyCases.test.ets|assert0141|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0013|RetentionPolicyCases.test.ets|assert0142|assertEqual|actual', preview.decisions[1].entryId)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0013|RetentionPolicyCases.test.ets|assert0142|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0013|RetentionPolicyCases.test.ets|assert0143|assertEqual|actual', preview.decisions[2].entryId)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0013|RetentionPolicyCases.test.ets|assert0143|assertEqual|expected', 1));
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONPREVIEWCASES_1400
     * @tc.name      testRetentionPreviewCases0014
     * @tc.desc      Verify notes order and content
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionPreviewCases0014', 0, (): void => {
      configureTestText();
      const entries: ArchiveEntry[] = [
        entryOf(1, 0, QueryOutcome.SUCCESS),
        agedEntry(2, 1, QueryOutcome.SUCCESS)
      ];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(300, 60, 2));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0014|RetentionPolicyCases.test.ets|assert0144|assertEqual|actual', preview.notes.length)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0014|RetentionPolicyCases.test.ets|assert0144|assertEqual|expected', 4));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0014|RetentionPolicyCases.test.ets|assert0145|assertEqual|actual', preview.notes[0])).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0014|RetentionPolicyCases.test.ets|assert0145|assertEqual|expected', '天数上限 60 天；失败样本额外 2 天（共 62 天）'));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0014|RetentionPolicyCases.test.ets|assert0146|assertEqual|actual', preview.notes[1])).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0014|RetentionPolicyCases.test.ets|assert0146|assertEqual|expected', '条数上限 300 条，超出部分按时间从旧到新清理'));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0014|RetentionPolicyCases.test.ets|assert0147|assertEqual|actual', preview.notes[2])).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0014|RetentionPolicyCases.test.ets|assert0147|assertEqual|expected', '最近有效样本 #2 已保留（不受天数/条数规则影响）'));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0014|RetentionPolicyCases.test.ets|assert0148|assertEqual|actual', preview.notes[3])).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0014|RetentionPolicyCases.test.ets|assert0148|assertEqual|expected', '1 条记录时间未知，已保留且不参与天数/条数计算'));
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONPREVIEWCASES_1500
     * @tc.name      testRetentionPreviewCases0015
     * @tc.desc      Verify notes omit bonus when zero
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionPreviewCases0015', 0, (): void => {
      configureTestText();
      const preview: CleanupPreview = previewCleanup([agedEntry(1, 1, QueryOutcome.SUCCESS)], NOW,
        new RetentionPolicy(500, 90, 0));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0015|RetentionPolicyCases.test.ets|assert0149|assertEqual|actual', preview.notes.length)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0015|RetentionPolicyCases.test.ets|assert0149|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0015|RetentionPolicyCases.test.ets|assert0150|assertEqual|actual', preview.notes[0])).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0015|RetentionPolicyCases.test.ets|assert0150|assertEqual|expected', '天数上限 90 天'));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0015|RetentionPolicyCases.test.ets|assert0151|assertEqual|actual', preview.notes[1])).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0015|RetentionPolicyCases.test.ets|assert0151|assertEqual|expected', '条数上限 500 条，超出部分按时间从旧到新清理'));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0015|RetentionPolicyCases.test.ets|assert0152|assertEqual|actual', preview.notes[2])).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0015|RetentionPolicyCases.test.ets|assert0152|assertEqual|expected', '最近有效样本 #1 已保留（不受天数/条数规则影响）'));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0015|RetentionPolicyCases.test.ets|assert0153|assertTrue|actual|expected=true', preview.text().indexOf('保留 1 条，删除 0 条') === 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONPREVIEWCASES_1600
     * @tc.name      testRetentionPreviewCases0016
     * @tc.desc      Verify summary text counts both rules
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testRetentionPreviewCases0016', 0, (): void => {
      configureTestText();
      const entries: ArchiveEntry[] = [
        agedEntry(1, 100, QueryOutcome.SUCCESS),
        agedEntry(2, 2, QueryOutcome.SUCCESS),
        agedEntry(3, 1, QueryOutcome.SUCCESS),
        agedEntry(4, 0.5, QueryOutcome.SUCCESS)
      ];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(2, 90, 0));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0016|RetentionPolicyCases.test.ets|assert0154|assertEqual|actual', preview.agedCount)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0016|RetentionPolicyCases.test.ets|assert0154|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0016|RetentionPolicyCases.test.ets|assert0155|assertEqual|actual', preview.countCutCount)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0016|RetentionPolicyCases.test.ets|assert0155|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0016|RetentionPolicyCases.test.ets|assert0156|assertEqual|actual', preview.deleteCount)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0016|RetentionPolicyCases.test.ets|assert0156|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0016|RetentionPolicyCases.test.ets|assert0157|assertEqual|actual', preview.keepCount)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0016|RetentionPolicyCases.test.ets|assert0157|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0016|RetentionPolicyCases.test.ets|assert0158|assertEqual|actual', preview.summaryText())).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0016|RetentionPolicyCases.test.ets|assert0158|assertEqual|expected', '保留 2 条，删除 2 条（按天数 1 条，按条数 1 条）'));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0016|RetentionPolicyCases.test.ets|assert0159|assertTrue|actual|expected=true', preview.hasDeletions())).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONPREVIEWCASES_1700
     * @tc.name      testRetentionPreviewCases0017
     * @tc.desc      Verify explain lines truncates
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testRetentionPreviewCases0017', 0, (): void => {
      configureTestText();
      const entries: ArchiveEntry[] = [];
      for (let index: number = 1; index <= 5; index++) {
        entries.push(agedEntry(index, index, QueryOutcome.SUCCESS));
      }
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(500, 90, 1));
      const limited: string[] = preview.explainLines(2);
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0017|RetentionPolicyCases.test.ets|assert0160|assertEqual|actual', limited.length)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0017|RetentionPolicyCases.test.ets|assert0160|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0017|RetentionPolicyCases.test.ets|assert0161|assertEqual|actual', limited[2])).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0017|RetentionPolicyCases.test.ets|assert0161|assertEqual|expected', '其余 3 条从略'));
      const all: string[] = preview.explainLines(0);
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0017|RetentionPolicyCases.test.ets|assert0162|assertEqual|actual', all.length)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0017|RetentionPolicyCases.test.ets|assert0162|assertEqual|expected', 5));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0017|RetentionPolicyCases.test.ets|assert0163|assertTrue|actual|expected=true', all[0].indexOf('保留 #1｜') === 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONPREVIEWCASES_1800
     * @tc.name      testRetentionPreviewCases0018
     * @tc.desc      Verify preview does not mutate input
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionPreviewCases0018', 0, (): void => {
      configureTestText();
      const entries: ArchiveEntry[] = [
        agedEntry(1, 100, QueryOutcome.SUCCESS),
        agedEntry(2, 1, QueryOutcome.SUCCESS)
      ];
      const before: number = entries[0].id;
      previewCleanup(entries, NOW, new RetentionPolicy(1, 90, 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0018|RetentionPolicyCases.test.ets|assert0164|assertEqual|actual', entries.length)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0018|RetentionPolicyCases.test.ets|assert0164|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0018|RetentionPolicyCases.test.ets|assert0165|assertEqual|actual', entries[0].id)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0018|RetentionPolicyCases.test.ets|assert0165|assertEqual|expected', before));
      expect(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0018|RetentionPolicyCases.test.ets|assert0166|assertEqual|actual', entries[0].timestamp)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionPreviewCases_0018|RetentionPolicyCases.test.ets|assert0166|assertEqual|expected', NOW - 100 * DAY_MS));
    });
  });

  describe('RetentionApplyCases', (): void => {
    /**
     * @tc.number    SUB_STARTUP_RETENTIONAPPLYCASES_0100
     * @tc.name      testRetentionApplyCases0001
     * @tc.desc      Verify apply deletes per preview
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionApplyCases0001', 0, (): void => {
      configureTestText();
      const entries: ArchiveEntry[] = [
        agedEntry(1, 100, QueryOutcome.SUCCESS),
        agedEntry(2, 1, QueryOutcome.SUCCESS)
      ];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(500, 90, 0));
      const result: RetentionResult = applyRetention(entries, preview);
      expect(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0001|RetentionPolicyCases.test.ets|assert0167|assertTrue|actual|expected=true', result.executed)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0001|RetentionPolicyCases.test.ets|assert0168|assertEqual|actual', result.deletedCount())).assertEqual(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0001|RetentionPolicyCases.test.ets|assert0168|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0001|RetentionPolicyCases.test.ets|assert0169|assertEqual|actual', result.keptCount())).assertEqual(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0001|RetentionPolicyCases.test.ets|assert0169|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0001|RetentionPolicyCases.test.ets|assert0170|assertEqual|actual', result.removed[0].id)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0001|RetentionPolicyCases.test.ets|assert0170|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0001|RetentionPolicyCases.test.ets|assert0171|assertEqual|actual', result.kept[0].id)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0001|RetentionPolicyCases.test.ets|assert0171|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0001|RetentionPolicyCases.test.ets|assert0172|assertTrue|actual|expected=true', result.matchesPreview())).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0001|RetentionPolicyCases.test.ets|assert0173|assertEqual|actual', result.missingIds.length)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0001|RetentionPolicyCases.test.ets|assert0173|assertEqual|expected', 0));
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONAPPLYCASES_0200
     * @tc.name      testRetentionApplyCases0002
     * @tc.desc      Verify apply reports missing ids
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionApplyCases0002', 0, (): void => {
      configureTestText();
      const entries: ArchiveEntry[] = [
        agedEntry(1, 100, QueryOutcome.SUCCESS),
        agedEntry(2, 1, QueryOutcome.SUCCESS)
      ];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(500, 90, 0));
      const result: RetentionResult = applyRetention([entries[1]], preview);
      expect(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0002|RetentionPolicyCases.test.ets|assert0174|assertEqual|actual', result.missingIds.length)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0002|RetentionPolicyCases.test.ets|assert0174|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0002|RetentionPolicyCases.test.ets|assert0175|assertEqual|actual', result.missingIds[0])).assertEqual(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0002|RetentionPolicyCases.test.ets|assert0175|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0002|RetentionPolicyCases.test.ets|assert0176|assertFalse|actual|expected=false', result.matchesPreview())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0002|RetentionPolicyCases.test.ets|assert0177|assertEqual|actual', result.deletedCount())).assertEqual(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0002|RetentionPolicyCases.test.ets|assert0177|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0002|RetentionPolicyCases.test.ets|assert0178|assertTrue|actual|expected=true', result.text().indexOf('预览中 1 条待删记录在执行时已不存在') > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONAPPLYCASES_0300
     * @tc.name      testRetentionApplyCases0003
     * @tc.desc      Verify apply keeps unseen entries
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionApplyCases0003', 0, (): void => {
      configureTestText();
      const entries: ArchiveEntry[] = [agedEntry(1, 1, QueryOutcome.SUCCESS)];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(500, 90, 0));
      const extended: ArchiveEntry[] = [entries[0], agedEntry(9, 0.5, QueryOutcome.SUCCESS)];
      const result: RetentionResult = applyRetention(extended, preview);
      expect(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0003|RetentionPolicyCases.test.ets|assert0179|assertEqual|actual', result.unseenIds.length)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0003|RetentionPolicyCases.test.ets|assert0179|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0003|RetentionPolicyCases.test.ets|assert0180|assertEqual|actual', result.unseenIds[0])).assertEqual(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0003|RetentionPolicyCases.test.ets|assert0180|assertEqual|expected', 9));
      expect(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0003|RetentionPolicyCases.test.ets|assert0181|assertEqual|actual', result.keptCount())).assertEqual(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0003|RetentionPolicyCases.test.ets|assert0181|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0003|RetentionPolicyCases.test.ets|assert0182|assertEqual|actual', result.deletedCount())).assertEqual(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0003|RetentionPolicyCases.test.ets|assert0182|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0003|RetentionPolicyCases.test.ets|assert0183|assertFalse|actual|expected=false', result.matchesPreview())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0003|RetentionPolicyCases.test.ets|assert0184|assertTrue|actual|expected=true', result.text().indexOf('预览之后新增 1 条记录，未纳入本次清理，已保留') > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONAPPLYCASES_0400
     * @tc.name      testRetentionApplyCases0004
     * @tc.desc      Verify apply returns clones
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionApplyCases0004', 0, (): void => {
      configureTestText();
      const entries: ArchiveEntry[] = [agedEntry(1, 1, QueryOutcome.SUCCESS)];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(500, 90, 0));
      const result: RetentionResult = applyRetention(entries, preview);
      result.kept[0].outcome = QueryOutcome.TIMEOUT;
      expect(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0004|RetentionPolicyCases.test.ets|assert0185|assertEqual|actual', entries[0].outcome)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0004|RetentionPolicyCases.test.ets|assert0185|assertEqual|expected', QueryOutcome.SUCCESS));
      expect(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0004|RetentionPolicyCases.test.ets|assert0186|assertEqual|actual', result.preview.summaryText())).assertEqual(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0004|RetentionPolicyCases.test.ets|assert0186|assertEqual|expected', preview.summaryText()));
      expect(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0004|RetentionPolicyCases.test.ets|assert0187|assertEqual|actual', result.kept.length)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0004|RetentionPolicyCases.test.ets|assert0187|assertEqual|expected', 1));
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONAPPLYCASES_0500
     * @tc.name      testRetentionApplyCases0005
     * @tc.desc      Verify unexecuted result text
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testRetentionApplyCases0005', 0, (): void => {
      configureTestText();
      const result: RetentionResult = new RetentionResult();
      expect(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0005|RetentionPolicyCases.test.ets|assert0188|assertFalse|actual|expected=false', result.executed)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0005|RetentionPolicyCases.test.ets|assert0189|assertEqual|actual', result.text())).assertEqual(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0005|RetentionPolicyCases.test.ets|assert0189|assertEqual|expected', '未执行清理'));
      expect(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0005|RetentionPolicyCases.test.ets|assert0190|assertEqual|actual', result.deletedCount())).assertEqual(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0005|RetentionPolicyCases.test.ets|assert0190|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0005|RetentionPolicyCases.test.ets|assert0191|assertTrue|actual|expected=true', result.matchesPreview())).assertTrue();
      result.executed = true;
      expect(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0005|RetentionPolicyCases.test.ets|assert0192|assertEqual|actual', result.text())).assertEqual(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0005|RetentionPolicyCases.test.ets|assert0192|assertEqual|expected', '清理完成：删除 0 条，保留 0 条'));
    });

    /**
     * @tc.number    SUB_STARTUP_RETENTIONAPPLYCASES_0600
     * @tc.name      testRetentionApplyCases0006
     * @tc.desc      Verify apply keeps protected entry
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRetentionApplyCases0006', 0, (): void => {
      configureTestText();
      const entries: ArchiveEntry[] = [agedEntry(4, 200, QueryOutcome.SUCCESS)];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(500, 90, 0));
      const result: RetentionResult = applyRetention(entries, preview);
      expect(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0006|RetentionPolicyCases.test.ets|assert0193|assertTrue|actual|expected=true', preview.protectedRescued)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0006|RetentionPolicyCases.test.ets|assert0194|assertEqual|actual', result.deletedCount())).assertEqual(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0006|RetentionPolicyCases.test.ets|assert0194|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0006|RetentionPolicyCases.test.ets|assert0195|assertEqual|actual', result.kept[0].id)).assertEqual(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0006|RetentionPolicyCases.test.ets|assert0195|assertEqual|expected', 4));
      expect(traceParameter('com.samples.appstartupauto_RetentionApplyCases_0006|RetentionPolicyCases.test.ets|assert0196|assertTrue|actual|expected=true', result.matchesPreview())).assertTrue();
    });
  });
}
