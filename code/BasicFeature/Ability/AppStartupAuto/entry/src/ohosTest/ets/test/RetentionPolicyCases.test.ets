import { describe, expect, it } from '@ohos/hypium';
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
      expect(MIN_RETENTION_ENTRIES).assertEqual(1);
      expect(MAX_RETENTION_ENTRIES).assertEqual(100000);
      expect(MAX_RETENTION_DAYS).assertEqual(3650);
      expect(MAX_FAILURE_BONUS_DAYS).assertEqual(7);
      expect(DAY_MS).assertEqual(86400000);
      expect(cleanupReasonLabel(CleanupReason.AGE_EXPIRED)).assertEqual('超过保留天数');
      expect(cleanupReasonLabel(CleanupReason.OVER_COUNT)).assertEqual('超出条数上限');
      expect(cleanupReasonLabel(CleanupReason.KEPT_FAILURE_GRACE)).assertEqual('失败样本多保留一天');
      expect(cleanupReasonLabel(CleanupReason.KEPT_PROTECTED)).assertEqual('最近有效样本，禁止删除');
      expect(cleanupReasonLabel(CleanupReason.KEPT_UNKNOWN_TIME)).assertEqual('时间未知，暂不清理');
      expect(cleanupReasonLabel(CleanupReason.KEPT_RECENT)).assertEqual('在保留范围内');
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
      expect(isDeleteReason(CleanupReason.AGE_EXPIRED)).assertTrue();
      expect(isDeleteReason(CleanupReason.OVER_COUNT)).assertTrue();
      expect(isDeleteReason(CleanupReason.KEPT_RECENT)).assertFalse();
      expect(isDeleteReason(CleanupReason.KEPT_FAILURE_GRACE)).assertFalse();
      expect(isDeleteReason(CleanupReason.KEPT_PROTECTED)).assertFalse();
      expect(isDeleteReason(CleanupReason.KEPT_UNKNOWN_TIME)).assertFalse();
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
      const policy: RetentionPolicy = new RetentionPolicy(500, 90, 1);
      expect(policy.retentionDaysFor(QueryOutcome.SUCCESS)).assertEqual(90);
      expect(policy.retentionDaysFor(QueryOutcome.FAILURE)).assertEqual(91);
      expect(policy.retentionDaysFor(QueryOutcome.TIMEOUT)).assertEqual(90);
      expect(policy.retentionDaysFor(QueryOutcome.UNSUPPORTED)).assertEqual(90);
      expect(policy.retentionDaysFor(QueryOutcome.UNKNOWN)).assertEqual(90);
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
      const policy: RetentionPolicy = new RetentionPolicy(500, Number.NaN, Number.NaN);
      expect(policy.retentionDaysFor(QueryOutcome.SUCCESS)).assertEqual(1);
      expect(policy.retentionDaysFor(QueryOutcome.FAILURE)).assertEqual(1);
      const tiny: RetentionPolicy = new RetentionPolicy(500, 0.4, 0.4);
      expect(tiny.retentionDaysFor(QueryOutcome.SUCCESS)).assertEqual(1);
      expect(tiny.retentionDaysFor(QueryOutcome.FAILURE)).assertEqual(1);
      const rounded: RetentionPolicy = new RetentionPolicy(500, 10.6, 2.4);
      expect(rounded.retentionDaysFor(QueryOutcome.SUCCESS)).assertEqual(11);
      expect(rounded.retentionDaysFor(QueryOutcome.FAILURE)).assertEqual(13);
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
      const clamped: RetentionPolicy = normalizePolicy(new RetentionPolicy(0, 0, -5));
      expect(clamped.maxEntries).assertEqual(MIN_RETENTION_ENTRIES);
      expect(clamped.maxDays).assertEqual(1);
      expect(clamped.failureBonusDays).assertEqual(0);
      const capped: RetentionPolicy = normalizePolicy(new RetentionPolicy(200000, 4000, 9));
      expect(capped.maxEntries).assertEqual(MAX_RETENTION_ENTRIES);
      expect(capped.maxDays).assertEqual(MAX_RETENTION_DAYS);
      expect(capped.failureBonusDays).assertEqual(MAX_FAILURE_BONUS_DAYS);
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
      const policy: RetentionPolicy = normalizePolicy(
        new RetentionPolicy(Number.NaN, Number.POSITIVE_INFINITY, Number.NaN));
      expect(policy.maxEntries).assertEqual(MIN_RETENTION_ENTRIES);
      expect(policy.maxDays).assertEqual(1);
      expect(policy.failureBonusDays).assertEqual(0);
      const rounded: RetentionPolicy = normalizePolicy(new RetentionPolicy(10.5, 20.4, 1.6));
      expect(rounded.maxEntries).assertEqual(11);
      expect(rounded.maxDays).assertEqual(20);
      expect(rounded.failureBonusDays).assertEqual(2);
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
      const left: RetentionPolicy = new RetentionPolicy(500.4, 90, 1);
      const right: RetentionPolicy = new RetentionPolicy(500, 90, 1);
      expect(left.equals(right)).assertFalse();
      expect(normalizePolicy(left).equals(right)).assertTrue();
      expect(new RetentionPolicy(500, 90, 1).equals(new RetentionPolicy(500, 90, 1))).assertTrue();
      expect(new RetentionPolicy(500, 90, 1).equals(new RetentionPolicy(500, 90, 2))).assertFalse();
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
      const policy: RetentionPolicy = defaultRetentionPolicy();
      expect(policy.maxEntries).assertEqual(500);
      expect(policy.maxDays).assertEqual(90);
      expect(policy.failureBonusDays).assertEqual(1);
      expect(policy.text()).assertEqual('条数上限 500｜天数上限 90 天｜失败样本额外 1 天');
      expect(new RetentionPolicy().equals(policy)).assertTrue();
      expect(policy.normalized().equals(policy)).assertTrue();
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
      const lines: string[] = describePolicy(new RetentionPolicy(500, 90, 2));
      expect(lines.length).assertEqual(4);
      expect(lines[0]).assertEqual('最多保留 500 条，超出部分按时间从旧到新清理');
      expect(lines[1]).assertEqual('最多保留 90 天，更早的记录按天数清理');
      expect(lines[2]).assertEqual('失败样本额外保留 2 天（实际 92 天），用于排查');
      expect(lines[3]).assertEqual('最近一条有效样本永远保留，不受上述两条规则影响');
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
      const lines: string[] = describePolicy(new RetentionPolicy(10, 7, 0));
      expect(lines.length).assertEqual(4);
      expect(lines[2]).assertEqual('失败样本与其他结果保留天数一致');
      expect(describePolicy(new RetentionPolicy(0, 0, 0))[0])
        .assertEqual('最多保留 1 条，超出部分按时间从旧到新清理');
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
      const kept: CleanupDecision = new CleanupDecision(7, true, CleanupReason.KEPT_RECENT);
      expect(kept.describe()).assertEqual('保留 #7｜在保留范围内');
      kept.detail = '年龄 1/90 天，且在 500 条以内';
      expect(kept.describe()).assertEqual('保留 #7｜在保留范围内｜年龄 1/90 天，且在 500 条以内');
      const dropped: CleanupDecision = new CleanupDecision(9, false, CleanupReason.OVER_COUNT);
      expect(dropped.describe()).assertEqual('删除 #9｜超出条数上限');
      expect(dropped.ageDays).assertEqual(-1);
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
      const audit: RetentionAudit = auditRetentionPolicy(defaultRetentionPolicy());
      expect(audit.ok).assertTrue();
      expect(audit.findings.length).assertEqual(0);
      expect(audit.report()).assertEqual('保留策略自洽');
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
      const audit: RetentionAudit = auditRetentionPolicy(new RetentionPolicy(0, 90, 1));
      expect(audit.ok).assertFalse();
      expect(audit.findings.length).assertEqual(1);
      expect(audit.findings[0]).assertEqual('条数上限越界：0');
      expect(audit.report()).assertEqual('条数上限越界：0');
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
      const audit: RetentionAudit = auditRetentionPolicy(new RetentionPolicy(500, 4000, 9));
      expect(audit.ok).assertFalse();
      expect(audit.findings.length).assertEqual(2);
      expect(audit.findings[0]).assertEqual('天数上限越界：4000');
      expect(audit.findings[1]).assertEqual('失败样本额外天数越界：9');
      expect(audit.report().indexOf('；') > 0).assertTrue();
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
      const audit: RetentionAudit = auditRetentionPolicy(new RetentionPolicy(500.5, 90.5, 1.5));
      expect(audit.ok).assertFalse();
      expect(audit.findings.length).assertEqual(3);
      expect(audit.findings[0]).assertEqual('条数上限越界：500.5');
      expect(audit.findings[1]).assertEqual('天数上限越界：90.5');
      expect(audit.findings[2]).assertEqual('失败样本额外天数越界：1.5');
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
      const preview: CleanupPreview = previewCleanup([], NOW, defaultRetentionPolicy());
      expect(preview.emptyInput).assertTrue();
      expect(preview.decisions.length).assertEqual(0);
      expect(preview.notes.length).assertEqual(1);
      expect(preview.summaryText()).assertEqual('没有可清理的归档记录：保留 0 条，删除 0 条');
      expect(preview.hasDeletions()).assertFalse();
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
      const entries: ArchiveEntry[] = [
        agedEntry(1, 11, QueryOutcome.SUCCESS),
        agedEntry(2, 1, QueryOutcome.SUCCESS)
      ];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(500, 10, 1));
      expect(preview.deleteCount).assertEqual(1);
      expect(preview.agedCount).assertEqual(1);
      expect(preview.countCutCount).assertEqual(0);
      expect(preview.deletedIds().length).assertEqual(1);
      expect(preview.deletedIds()[0]).assertEqual(1);
      expect(decisionOf(preview, 1).detail).assertEqual('年龄 11 天超过 10 天');
      expect(decisionOf(preview, 1).ageDays).assertEqual(11);
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
      const entries: ArchiveEntry[] = [
        agedEntry(2, 1, QueryOutcome.SUCCESS),
        agedEntry(1, 10, QueryOutcome.TIMEOUT)
      ];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(500, 10, 1));
      expect(preview.deleteCount).assertEqual(0);
      expect(preview.keepCount).assertEqual(2);
      expect(decisionOf(preview, 1).reason).assertEqual(CleanupReason.KEPT_RECENT);
      expect(decisionOf(preview, 1).ageDays).assertEqual(10);
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
      const entries: ArchiveEntry[] = [agedEntry(5, 100, QueryOutcome.SUCCESS)];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(500, 90, 1));
      expect(preview.keepCount).assertEqual(1);
      expect(preview.deleteCount).assertEqual(0);
      expect(preview.protectedId).assertEqual(5);
      expect(preview.protectedRescued).assertTrue();
      expect(decisionOf(preview, 5).reason).assertEqual(CleanupReason.KEPT_PROTECTED);
      expect(decisionOf(preview, 5).detail)
        .assertEqual('年龄 100 天已超过 90 天，但作为最近有效样本豁免');
      expect(preview.notes.indexOf('最近有效样本 #5 本应被清理，已豁免保留') >= 0).assertTrue();
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
      const entries: ArchiveEntry[] = [agedEntry(5, 3, QueryOutcome.FAILURE)];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(500, 90, 1));
      expect(preview.protectedRescued).assertFalse();
      expect(decisionOf(preview, 5).detail).assertEqual('最近一条有效样本，规则不删除');
      expect(preview.notes.indexOf('最近有效样本 #5 已保留（不受天数/条数规则影响）') >= 0)
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
      const entries: ArchiveEntry[] = [
        agedEntry(1, 3, QueryOutcome.SUCCESS),
        agedEntry(2, 2, QueryOutcome.SUCCESS),
        agedEntry(3, 1, QueryOutcome.SUCCESS)
      ];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(2, 90, 1));
      expect(preview.deleteCount).assertEqual(1);
      expect(preview.countCutCount).assertEqual(1);
      expect(preview.deletedIds().length).assertEqual(1);
      expect(preview.deletedIds()[0]).assertEqual(1);
      expect(preview.keptIds().length).assertEqual(2);
      expect(decisionOf(preview, 1).detail).assertEqual('超出条数上限 2，按时间从旧到新清理');
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
      const entries: ArchiveEntry[] = [
        entryOf(1, 0, QueryOutcome.SUCCESS),
        agedEntry(2, 500, QueryOutcome.SUCCESS)
      ];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(1, 90, 1));
      expect(preview.unknownTimeCount).assertEqual(1);
      expect(decisionOf(preview, 1).reason).assertEqual(CleanupReason.KEPT_UNKNOWN_TIME);
      expect(decisionOf(preview, 1).ageDays).assertEqual(-1);
      expect(decisionOf(preview, 1).retentionDays).assertEqual(0);
      expect(decisionOf(preview, 1).detail).assertEqual('时间戳缺失或非法，已保留且不计入天数/条数');
      expect(preview.keepCount).assertEqual(2);
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
      const entries: ArchiveEntry[] = [
        entryOf(3, 0, QueryOutcome.SUCCESS),
        agedEntry(2, 2, QueryOutcome.SUCCESS),
        agedEntry(1, 1, QueryOutcome.SUCCESS)
      ];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(500, 90, 1));
      expect(preview.protectedId).assertEqual(1);
      expect(preview.decisions[0].entryId).assertEqual(1);
      expect(preview.decisions[1].entryId).assertEqual(2);
      expect(preview.decisions[2].entryId).assertEqual(3);
      expect(decisionOf(preview, 3).reason).assertEqual(CleanupReason.KEPT_UNKNOWN_TIME);
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
      const entries: ArchiveEntry[] = [
        agedEntry(2, 1, QueryOutcome.SUCCESS),
        agedEntry(1, 12, QueryOutcome.FAILURE)
      ];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(500, 10, 5));
      expect(preview.deleteCount).assertEqual(0);
      expect(decisionOf(preview, 1).reason).assertEqual(CleanupReason.KEPT_FAILURE_GRACE);
      expect(decisionOf(preview, 1).detail)
        .assertEqual('失败样本在 10 天基础上多保留 5 天');
      expect(decisionOf(preview, 1).retentionDays).assertEqual(15);
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
      const entries: ArchiveEntry[] = [
        agedEntry(2, 1, QueryOutcome.SUCCESS),
        agedEntry(1, 12, QueryOutcome.TIMEOUT)
      ];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(500, 10, 5));
      expect(preview.deletedIds().length).assertEqual(1);
      expect(preview.deletedIds()[0]).assertEqual(1);
      expect(decisionOf(preview, 1).reason).assertEqual(CleanupReason.AGE_EXPIRED);
      expect(decisionOf(preview, 1).retentionDays).assertEqual(10);
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
      const entries: ArchiveEntry[] = [agedEntry(1, 5000, QueryOutcome.SUCCESS)];
      const preview: CleanupPreview = previewCleanup(entries, 0, new RetentionPolicy(500, 90, 1));
      expect(preview.now).assertEqual(0);
      expect(preview.deleteCount).assertEqual(0);
      expect(decisionOf(preview, 1).ageDays).assertEqual(0);
      expect(preview.notes.indexOf('当前时间无效，已跳过天数规则，仅按条数上限清理') >= 0).assertTrue();
      const negative: CleanupPreview = previewCleanup(entries, -5, new RetentionPolicy(500, 90, 1));
      expect(negative.deleteCount).assertEqual(0);
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
      const entries: ArchiveEntry[] = [
        agedEntry(3, 1, QueryOutcome.TIMEOUT),
        agedEntry(2, 2, QueryOutcome.SUCCESS)
      ];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(1, 90, 1));
      expect(preview.protectedId).assertEqual(2);
      expect(preview.protectedRescued).assertTrue();
      expect(decisionOf(preview, 3).reason).assertEqual(CleanupReason.OVER_COUNT);
      expect(preview.deleteCount).assertEqual(1);
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
      const same: number = NOW - DAY_MS;
      const entries: ArchiveEntry[] = [
        entryOf(1, same, QueryOutcome.SUCCESS),
        entryOf(3, same, QueryOutcome.SUCCESS),
        entryOf(2, same, QueryOutcome.SUCCESS)
      ];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(500, 90, 1));
      expect(preview.decisions.length).assertEqual(3);
      expect(preview.decisions[0].entryId).assertEqual(3);
      expect(preview.decisions[1].entryId).assertEqual(2);
      expect(preview.decisions[2].entryId).assertEqual(1);
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
      const entries: ArchiveEntry[] = [
        entryOf(1, 0, QueryOutcome.SUCCESS),
        agedEntry(2, 1, QueryOutcome.SUCCESS)
      ];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(300, 60, 2));
      expect(preview.notes.length).assertEqual(4);
      expect(preview.notes[0]).assertEqual('天数上限 60 天；失败样本额外 2 天（共 62 天）');
      expect(preview.notes[1]).assertEqual('条数上限 300 条，超出部分按时间从旧到新清理');
      expect(preview.notes[2]).assertEqual('最近有效样本 #2 已保留（不受天数/条数规则影响）');
      expect(preview.notes[3]).assertEqual('1 条记录时间未知，已保留且不参与天数/条数计算');
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
      const preview: CleanupPreview = previewCleanup([agedEntry(1, 1, QueryOutcome.SUCCESS)], NOW,
        new RetentionPolicy(500, 90, 0));
      expect(preview.notes.length).assertEqual(3);
      expect(preview.notes[0]).assertEqual('天数上限 90 天');
      expect(preview.notes[1]).assertEqual('条数上限 500 条，超出部分按时间从旧到新清理');
      expect(preview.notes[2]).assertEqual('最近有效样本 #1 已保留（不受天数/条数规则影响）');
      expect(preview.text().indexOf('保留 1 条，删除 0 条') === 0).assertTrue();
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
      const entries: ArchiveEntry[] = [
        agedEntry(1, 100, QueryOutcome.SUCCESS),
        agedEntry(2, 2, QueryOutcome.SUCCESS),
        agedEntry(3, 1, QueryOutcome.SUCCESS),
        agedEntry(4, 0.5, QueryOutcome.SUCCESS)
      ];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(2, 90, 0));
      expect(preview.agedCount).assertEqual(1);
      expect(preview.countCutCount).assertEqual(1);
      expect(preview.deleteCount).assertEqual(2);
      expect(preview.keepCount).assertEqual(2);
      expect(preview.summaryText()).assertEqual('保留 2 条，删除 2 条（按天数 1 条，按条数 1 条）');
      expect(preview.hasDeletions()).assertTrue();
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
      const entries: ArchiveEntry[] = [];
      for (let index: number = 1; index <= 5; index++) {
        entries.push(agedEntry(index, index, QueryOutcome.SUCCESS));
      }
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(500, 90, 1));
      const limited: string[] = preview.explainLines(2);
      expect(limited.length).assertEqual(3);
      expect(limited[2]).assertEqual('其余 3 条从略');
      const all: string[] = preview.explainLines(0);
      expect(all.length).assertEqual(5);
      expect(all[0].indexOf('保留 #1｜') === 0).assertTrue();
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
      const entries: ArchiveEntry[] = [
        agedEntry(1, 100, QueryOutcome.SUCCESS),
        agedEntry(2, 1, QueryOutcome.SUCCESS)
      ];
      const before: number = entries[0].id;
      previewCleanup(entries, NOW, new RetentionPolicy(1, 90, 1));
      expect(entries.length).assertEqual(2);
      expect(entries[0].id).assertEqual(before);
      expect(entries[0].timestamp).assertEqual(NOW - 100 * DAY_MS);
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
      const entries: ArchiveEntry[] = [
        agedEntry(1, 100, QueryOutcome.SUCCESS),
        agedEntry(2, 1, QueryOutcome.SUCCESS)
      ];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(500, 90, 0));
      const result: RetentionResult = applyRetention(entries, preview);
      expect(result.executed).assertTrue();
      expect(result.deletedCount()).assertEqual(1);
      expect(result.keptCount()).assertEqual(1);
      expect(result.removed[0].id).assertEqual(1);
      expect(result.kept[0].id).assertEqual(2);
      expect(result.matchesPreview()).assertTrue();
      expect(result.missingIds.length).assertEqual(0);
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
      const entries: ArchiveEntry[] = [
        agedEntry(1, 100, QueryOutcome.SUCCESS),
        agedEntry(2, 1, QueryOutcome.SUCCESS)
      ];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(500, 90, 0));
      const result: RetentionResult = applyRetention([entries[1]], preview);
      expect(result.missingIds.length).assertEqual(1);
      expect(result.missingIds[0]).assertEqual(1);
      expect(result.matchesPreview()).assertFalse();
      expect(result.deletedCount()).assertEqual(0);
      expect(result.text().indexOf('预览中 1 条待删记录在执行时已不存在') > 0).assertTrue();
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
      const entries: ArchiveEntry[] = [agedEntry(1, 1, QueryOutcome.SUCCESS)];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(500, 90, 0));
      const extended: ArchiveEntry[] = [entries[0], agedEntry(9, 0.5, QueryOutcome.SUCCESS)];
      const result: RetentionResult = applyRetention(extended, preview);
      expect(result.unseenIds.length).assertEqual(1);
      expect(result.unseenIds[0]).assertEqual(9);
      expect(result.keptCount()).assertEqual(2);
      expect(result.deletedCount()).assertEqual(0);
      expect(result.matchesPreview()).assertFalse();
      expect(result.text().indexOf('预览之后新增 1 条记录，未纳入本次清理，已保留') > 0).assertTrue();
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
      const entries: ArchiveEntry[] = [agedEntry(1, 1, QueryOutcome.SUCCESS)];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(500, 90, 0));
      const result: RetentionResult = applyRetention(entries, preview);
      result.kept[0].outcome = QueryOutcome.TIMEOUT;
      expect(entries[0].outcome).assertEqual(QueryOutcome.SUCCESS);
      expect(result.preview.summaryText()).assertEqual(preview.summaryText());
      expect(result.kept.length).assertEqual(1);
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
      const result: RetentionResult = new RetentionResult();
      expect(result.executed).assertFalse();
      expect(result.text()).assertEqual('未执行清理');
      expect(result.deletedCount()).assertEqual(0);
      expect(result.matchesPreview()).assertTrue();
      result.executed = true;
      expect(result.text()).assertEqual('清理完成：删除 0 条，保留 0 条');
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
      const entries: ArchiveEntry[] = [agedEntry(4, 200, QueryOutcome.SUCCESS)];
      const preview: CleanupPreview = previewCleanup(entries, NOW, new RetentionPolicy(500, 90, 0));
      const result: RetentionResult = applyRetention(entries, preview);
      expect(preview.protectedRescued).assertTrue();
      expect(result.deletedCount()).assertEqual(0);
      expect(result.kept[0].id).assertEqual(4);
      expect(result.matchesPreview()).assertTrue();
    });
  });
}
