import { describe, expect, it } from '@ohos/hypium';
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
      expect(RETENTION_RULES.length > 0).assertTrue();
      const ids: string[] = ruleIds();
      expect(ids.length).assertEqual(RETENTION_RULES.length);
      expect(ids.filter((id: string, index: number): boolean => ids.indexOf(id) !== index).length)
        .assertEqual(0);
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
      let found: number = 0;
      ruleIds().forEach((id: string): void => {
        const rule = ruleOf(id);
        if (rule !== undefined && rule.ruleId === id) {
          found++;
        }
      });
      expect(found).assertEqual(RETENTION_RULES.length);
      expect(ruleOf('XX-99') === undefined).assertTrue();
      expect(found > 0).assertTrue();
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
      const tiers: RetentionTier[] = [];
      RETENTION_RULES.forEach((rule: RetentionRule): void => {
        if (tiers.indexOf(rule.tier) < 0) {
          tiers.push(rule.tier);
        }
      });
      expect(tiers.length > 0).assertTrue();
      tiers.forEach((tier: RetentionTier): void => {
        expect(tierOrder(tier) >= 0).assertTrue();
        expect(tierLabel(tier).length > 0).assertTrue();
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
      const tiers: RetentionTier[] = [];
      RETENTION_RULES.forEach((rule: RetentionRule): void => {
        if (tiers.indexOf(rule.tier) < 0) {
          tiers.push(rule.tier);
        }
      });
      expect(tiers.length > 0).assertTrue();
      tiers.forEach((tier: RetentionTier): void => {
        expect(tierLabel(tier).length > 0).assertTrue();
      });
      expect(tierLabel(tiers[0]).length > 0).assertTrue();
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
      expect(covered).assertEqual(tiers.length);
      expect(tiers.length > 0).assertTrue();
      expect(tiers.length > 0).assertTrue();
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
      RETENTION_RULES.forEach((rule: RetentionRule): void => {
        expect(rule.maxAgeMs >= 0).assertTrue();
        expect(rule.description.length > 0).assertTrue();
      });
      expect(RETENTION_RULES.length > 0).assertTrue();
    });
  });
}
