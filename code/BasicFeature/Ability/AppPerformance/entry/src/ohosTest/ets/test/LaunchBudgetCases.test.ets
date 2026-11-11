import { describe, expect, it } from '@ohos/hypium';
import {
  BudgetAudit, BudgetReport, BudgetResult, GroupStats, LAUNCH_GROUPS, LaunchGroup, RegressionReport,
  RegressionResult, RegressionVerdict, allStats, auditBudgets, budgetLines, compareLaunches,
  evaluateBudgets, groupKeys, groupLabel, groupOf, quantileOf, regressionLabel, sampleOf, statsFor
} from '../../../main/ets/core/LaunchBudget';
import { LaunchSample } from '../../../main/ets/core/Types';

/** 按分组关键字造一组样本，内容耗时从 base 起逐条加 step。 */
function samplesOf(key: string, count: number, base: number, step: number): LaunchSample[] {
  const list: LaunchSample[] = [];
  for (let index = 0; index < count; index++) {
    list.push(sampleOf(`${key}-${index}`, key, 1000 + index, base + index * step));
  }
  return list;
}

/** 合并多组样本，避免每个用例重复拼接。 */
function mergeSamples(groups: LaunchSample[][]): LaunchSample[] {
  const merged: LaunchSample[] = [];
  groups.forEach((group: LaunchSample[]): void => {
    group.forEach((sample: LaunchSample): void => {
      merged.push(sample);
    });
  });
  return merged;
}

export default function launchBudgetCasesTest(): void {
  describe('LaunchGroupCatalogCases', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPCATALOGCASES_0100
     * @tc.name      testLaunchGroupCatalogCases0001
     * @tc.desc      Verify group catalog has stable keys
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testLaunchGroupCatalogCases0001', 0, (): void => {
      expect(LAUNCH_GROUPS.length).assertEqual(5);
      expect(groupKeys().join(',')).assertEqual('cold,warm,hot,firstFrame,interactive');
      expect(LAUNCH_GROUPS[0].key).assertEqual('cold');
      expect(LAUNCH_GROUPS[4].key).assertEqual('interactive');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPCATALOGCASES_0200
     * @tc.name      testLaunchGroupCatalogCases0002
     * @tc.desc      Verify every group carries key and label
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testLaunchGroupCatalogCases0002', 0, (): void => {
      LAUNCH_GROUPS.forEach((group: LaunchGroup): void => {
        expect(group.key.length > 0).assertTrue();
        expect(group.label.length > 0).assertTrue();
        expect(group.key.indexOf(' ')).assertEqual(-1);
      });
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPCATALOGCASES_0300
     * @tc.name      testLaunchGroupCatalogCases0003
     * @tc.desc      Verify every group budget is positive
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupCatalogCases0003', 0, (): void => {
      LAUNCH_GROUPS.forEach((group: LaunchGroup): void => {
        expect(group.budgetMs > 0).assertTrue();
        expect(Number.isInteger(group.budgetMs)).assertTrue();
      });
      expect(LAUNCH_GROUPS.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPCATALOGCASES_0400
     * @tc.name      testLaunchGroupCatalogCases0004
     * @tc.desc      Verify group keys mirror catalog order
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testLaunchGroupCatalogCases0004', 0, (): void => {
      const keys: string[] = groupKeys();
      expect(keys.length).assertEqual(LAUNCH_GROUPS.length);
      keys.forEach((key: string, index: number): void => {
        expect(key).assertEqual(LAUNCH_GROUPS[index].key);
      });
      expect(groupKeys()[0]).assertEqual(LAUNCH_GROUPS[0].key);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPCATALOGCASES_0500
     * @tc.name      testLaunchGroupCatalogCases0005
     * @tc.desc      Verify group of hits known keys
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupCatalogCases0005', 0, (): void => {
      const cold: LaunchGroup | undefined = groupOf('cold');
      expect(cold !== undefined).assertTrue();
      expect(cold?.label).assertEqual('冷启动');
      expect(cold?.budgetMs).assertEqual(1200);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPCATALOGCASES_0600
     * @tc.name      testLaunchGroupCatalogCases0006
     * @tc.desc      Verify group of rejects unknown key
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupCatalogCases0006', 0, (): void => {
      expect(groupOf('unknown')).assertUndefined();
      expect(groupOf('')).assertUndefined();
      expect(groupOf('Cold')).assertUndefined();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPCATALOGCASES_0700
     * @tc.name      testLaunchGroupCatalogCases0007
     * @tc.desc      Verify group label falls back to raw key
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testLaunchGroupCatalogCases0007', 0, (): void => {
      expect(groupLabel('hot')).assertEqual('热启动');
      expect(groupLabel('custom')).assertEqual('custom');
      expect(groupLabel('')).assertEqual('');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPCATALOGCASES_0800
     * @tc.name      testLaunchGroupCatalogCases0008
     * @tc.desc      Verify group text carries all dimensions
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testLaunchGroupCatalogCases0008', 0, (): void => {
      LAUNCH_GROUPS.forEach((group: LaunchGroup): void => {
        const text: string = group.text();
        expect(text.indexOf(group.key) >= 0).assertTrue();
        expect(text.indexOf(group.label) >= 0).assertTrue();
        expect(text.indexOf(`${group.budgetMs}`) >= 0).assertTrue();
      });
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPCATALOGCASES_0900
     * @tc.name      testLaunchGroupCatalogCases0009
     * @tc.desc      Verify heat budget is tightest
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupCatalogCases0009', 0, (): void => {
      const budgets: number[] = LAUNCH_GROUPS.map((group: LaunchGroup): number => group.budgetMs);
      const minBudget: number = budgets.reduce((peak: number, value: number): number =>
        Math.min(peak, value), Number.MAX_SAFE_INTEGER);
      const maxBudget: number = budgets.reduce((peak: number, value: number): number =>
        Math.max(peak, value), 0);
      expect(groupOf('hot')?.budgetMs).assertEqual(minBudget);
      expect(groupOf('interactive')?.budgetMs).assertEqual(maxBudget);
      expect(minBudget < maxBudget).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPCATALOGCASES_1000
     * @tc.name      testLaunchGroupCatalogCases0010
     * @tc.desc      Verify cold budget exceeds warm and heat
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupCatalogCases0010', 0, (): void => {
      const cold: number = groupOf('cold')?.budgetMs ?? 0;
      const warm: number = groupOf('warm')?.budgetMs ?? 0;
      const hot: number = groupOf('hot')?.budgetMs ?? 0;
      expect(cold > warm).assertTrue();
      expect(warm > hot).assertTrue();
      expect(cold > hot).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPCATALOGCASES_1100
     * @tc.name      testLaunchGroupCatalogCases0011
     * @tc.desc      Verify budget audit reports clean catalog
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testLaunchGroupCatalogCases0011', 0, (): void => {
      const audit: BudgetAudit = auditBudgets();
      expect(audit.ok).assertTrue();
      expect(audit.findings.length).assertEqual(0);
      expect(audit.summary().indexOf('自洽') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPCATALOGCASES_1200
     * @tc.name      testLaunchGroupCatalogCases0012
     * @tc.desc      Verify budget lines cover every group
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testLaunchGroupCatalogCases0012', 0, (): void => {
      const lines: string[] = budgetLines();
      expect(lines.length).assertEqual(LAUNCH_GROUPS.length);
      lines.forEach((line: string, index: number): void => {
        expect(line.indexOf(LAUNCH_GROUPS[index].key) >= 0).assertTrue();
        expect(line.length > 0).assertTrue();
      });
    });
  });

  describe('LaunchSampleFactoryCases', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHSAMPLEFACTORYCASES_0100
     * @tc.name      testLaunchSampleFactoryCases0001
     * @tc.desc      Verify sample factory fills every field
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchSampleFactoryCases0001', 0, (): void => {
      const sample: LaunchSample = sampleOf('s1', 'cold', 1700000000000, 850);
      expect(sample.id).assertEqual('s1');
      expect(sample.group).assertEqual('cold');
      expect(sample.at).assertEqual(1700000000000);
      expect(sample.contentMs).assertEqual(850);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHSAMPLEFACTORYCASES_0200
     * @tc.name      testLaunchSampleFactoryCases0002
     * @tc.desc      Verify sample factory keeps device metadata
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchSampleFactoryCases0002', 0, (): void => {
      const sample: LaunchSample = sampleOf('s2', 'warm', 1, 10);
      expect(sample.device.length > 0).assertTrue();
      expect(sample.appVersion.length > 0).assertTrue();
      expect(sample.id).assertEqual('s2');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHSAMPLEFACTORYCASES_0300
     * @tc.name      testLaunchSampleFactoryCases0003
     * @tc.desc      Verify sample factory clamps negative duration
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchSampleFactoryCases0003', 0, (): void => {
      const sample: LaunchSample = sampleOf('s3', 'hot', 1, -50);
      expect(sample.contentMs).assertEqual(0);
      expect(sample.contentMs >= 0).assertTrue();
      expect(sample.group).assertEqual('hot');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHSAMPLEFACTORYCASES_0400
     * @tc.name      testLaunchSampleFactoryCases0004
     * @tc.desc      Verify sample factory rounds fractional duration
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchSampleFactoryCases0004', 0, (): void => {
      const up: LaunchSample = sampleOf('s4', 'hot', 1, 12.6);
      const down: LaunchSample = sampleOf('s5', 'hot', 1, 12.4);
      expect(up.contentMs).assertEqual(13);
      expect(down.contentMs).assertEqual(12);
      expect(Number.isInteger(up.contentMs)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHSAMPLEFACTORYCASES_0500
     * @tc.name      testLaunchSampleFactoryCases0005
     * @tc.desc      Verify sample factory keeps unknown group verbatim
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchSampleFactoryCases0005', 0, (): void => {
      const sample: LaunchSample = sampleOf('s6', 'brand-new', 1, 5);
      expect(sample.group).assertEqual('brand-new');
      expect(groupOf(sample.group)).assertUndefined();
      expect(groupLabel(sample.group)).assertEqual('brand-new');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHSAMPLEFACTORYCASES_0600
     * @tc.name      testLaunchSampleFactoryCases0006
     * @tc.desc      Verify sample factory accepts zero timestamp
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchSampleFactoryCases0006', 0, (): void => {
      const sample: LaunchSample = sampleOf('s7', 'cold', 0, 0);
      expect(sample.at).assertEqual(0);
      expect(sample.contentMs).assertEqual(0);
      expect(sample.id).assertEqual('s7');
    });
  });

  describe('LaunchQuantileCases', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHQUANTILECASES_0100
     * @tc.name      testLaunchQuantileCases0001
     * @tc.desc      Verify quantile of empty is zero
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchQuantileCases0001', 0, (): void => {
      expect(quantileOf([], 50)).assertEqual(0);
      expect(quantileOf([], 0)).assertEqual(0);
      expect(quantileOf([], 100)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHQUANTILECASES_0200
     * @tc.name      testLaunchQuantileCases0002
     * @tc.desc      Verify quantile of single value ignores percentile
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchQuantileCases0002', 0, (): void => {
      expect(quantileOf([42], 0)).assertEqual(42);
      expect(quantileOf([42], 50)).assertEqual(42);
      expect(quantileOf([42], 100)).assertEqual(42);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHQUANTILECASES_0300
     * @tc.name      testLaunchQuantileCases0003
     * @tc.desc      Verify zero percentile yields minimum
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchQuantileCases0003', 0, (): void => {
      const values: number[] = [900, 120, 640, 300];
      expect(quantileOf(values, 0)).assertEqual(120);
      expect(quantileOf(values, 0)).assertEqual(
        values.reduce((peak: number, value: number): number => Math.min(peak, value), 10000));
      expect(quantileOf(values, 0) < quantileOf(values, 50)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHQUANTILECASES_0400
     * @tc.name      testLaunchQuantileCases0004
     * @tc.desc      Verify full percentile yields maximum
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchQuantileCases0004', 0, (): void => {
      const values: number[] = [900, 120, 640, 300];
      expect(quantileOf(values, 100)).assertEqual(900);
      expect(quantileOf(values, 100)).assertEqual(
        values.reduce((peak: number, value: number): number => Math.max(peak, value), 0));
      expect(quantileOf(values, 100) > quantileOf(values, 50)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHQUANTILECASES_0500
     * @tc.name      testLaunchQuantileCases0005
     * @tc.desc      Verify median of odd sized set is middle element
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchQuantileCases0005', 0, (): void => {
      expect(quantileOf([10, 20, 30], 50)).assertEqual(20);
      expect(quantileOf([30, 10, 20], 50)).assertEqual(20);
      expect(quantileOf([1, 2, 3, 4, 5], 50)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHQUANTILECASES_0600
     * @tc.name      testLaunchQuantileCases0006
     * @tc.desc      Verify median of even sized set interpolates
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchQuantileCases0006', 0, (): void => {
      expect(quantileOf([10, 20], 50)).assertEqual(15);
      expect(quantileOf([10, 20, 30, 40], 50)).assertEqual(25);
      expect(quantileOf([0, 100], 50)).assertEqual(50);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHQUANTILECASES_0700
     * @tc.name      testLaunchQuantileCases0007
     * @tc.desc      Verify percentile is clamped to range
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchQuantileCases0007', 0, (): void => {
      const values: number[] = [5, 15, 25];
      expect(quantileOf(values, -40)).assertEqual(5);
      expect(quantileOf(values, 240)).assertEqual(25);
      expect(quantileOf(values, -1)).assertEqual(quantileOf(values, 0));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHQUANTILECASES_0800
     * @tc.name      testLaunchQuantileCases0008
     * @tc.desc      Verify quantile does not mutate input
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchQuantileCases0008', 0, (): void => {
      const values: number[] = [300, 100, 200];
      const snapshot: string = values.join(',');
      quantileOf(values, 90);
      expect(values.join(',')).assertEqual(snapshot);
      expect(values[0]).assertEqual(300);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHQUANTILECASES_0900
     * @tc.name      testLaunchQuantileCases0009
     * @tc.desc      Verify quantile is monotonic in percentile
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchQuantileCases0009', 0, (): void => {
      const values: number[] = [10, 40, 70, 100, 130];
      const p10: number = quantileOf(values, 10);
      const p50: number = quantileOf(values, 50);
      const p90: number = quantileOf(values, 90);
      expect(p10 >= values[0]).assertTrue();
      expect(p10 < p50).assertTrue();
      expect(p50 <= p90 && p90 <= values[4]).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHQUANTILECASES_1000
     * @tc.name      testLaunchQuantileCases0010
     * @tc.desc      Verify quantile interpolates quarters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchQuantileCases0010', 0, (): void => {
      expect(quantileOf([0, 100], 25)).assertEqual(25);
      expect(quantileOf([0, 100], 75)).assertEqual(75);
      expect(quantileOf([0, 100], 90)).assertEqual(90);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHQUANTILECASES_1100
     * @tc.name      testLaunchQuantileCases0011
     * @tc.desc      Verify quantile ignores insertion order
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchQuantileCases0011', 0, (): void => {
      const ascending: number[] = [100, 200, 300, 400];
      const descending: number[] = [400, 300, 200, 100];
      expect(quantileOf(ascending, 50)).assertEqual(quantileOf(descending, 50));
      expect(quantileOf(ascending, 90)).assertEqual(quantileOf(descending, 90));
      expect(quantileOf(ascending, 0)).assertEqual(100);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHQUANTILECASES_1200
     * @tc.name      testLaunchQuantileCases0012
     * @tc.desc      Verify quantile handles duplicate values
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchQuantileCases0012', 0, (): void => {
      const values: number[] = [200, 200, 200, 400];
      expect(quantileOf(values, 0)).assertEqual(200);
      expect(quantileOf(values, 50)).assertEqual(200);
      expect(quantileOf(values, 100)).assertEqual(400);
    });
  });

  describe('LaunchGroupStatsCases', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPSTATSCASES_0100
     * @tc.name      testLaunchGroupStatsCases0001
     * @tc.desc      Verify stats for empty group is zeroed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupStatsCases0001', 0, (): void => {
      const stats: GroupStats = statsFor([], 'cold');
      expect(stats.key).assertEqual('cold');
      expect(stats.count).assertEqual(0);
      expect(stats.p50).assertEqual(0);
      expect(stats.p90).assertEqual(0);
      expect(stats.worst).assertEqual(0);
      expect(stats.mean).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPSTATSCASES_0200
     * @tc.name      testLaunchGroupStatsCases0002
     * @tc.desc      Verify stats for filters by group key
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupStatsCases0002', 0, (): void => {
      const samples: LaunchSample[] = mergeSamples([
        samplesOf('cold', 3, 100, 10),
        samplesOf('hot', 4, 50, 5)
      ]);
      expect(statsFor(samples, 'cold').count).assertEqual(3);
      expect(statsFor(samples, 'hot').count).assertEqual(4);
      expect(statsFor(samples, 'warm').count).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPSTATSCASES_0300
     * @tc.name      testLaunchGroupStatsCases0003
     * @tc.desc      Verify stats for computes percentiles
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupStatsCases0003', 0, (): void => {
      const samples: LaunchSample[] = mergeSamples([samplesOf('cold', 5, 100, 100)]);
      const stats: GroupStats = statsFor(samples, 'cold');
      expect(stats.p50).assertEqual(300);
      expect(stats.p90).assertEqual(460);
      expect(stats.p90 >= stats.p50).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPSTATSCASES_0400
     * @tc.name      testLaunchGroupStatsCases0004
     * @tc.desc      Verify stats for worst tracks maximum
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupStatsCases0004', 0, (): void => {
      const samples: LaunchSample[] = mergeSamples([samplesOf('warm', 4, 400, -80)]);
      const stats: GroupStats = statsFor(samples, 'warm');
      expect(stats.worst).assertEqual(400);
      expect(stats.worst >= stats.p90).assertTrue();
      expect(stats.count).assertEqual(4);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPSTATSCASES_0500
     * @tc.name      testLaunchGroupStatsCases0005
     * @tc.desc      Verify stats for mean is rounded
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupStatsCases0005', 0, (): void => {
      const samples: LaunchSample[] = [
        sampleOf('a', 'hot', 0, 100),
        sampleOf('b', 'hot', 1, 101)
      ];
      const stats: GroupStats = statsFor(samples, 'hot');
      expect(stats.mean).assertEqual(101);
      expect(Number.isInteger(stats.mean)).assertTrue();
      expect(stats.count).assertEqual(2);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPSTATSCASES_0600
     * @tc.name      testLaunchGroupStatsCases0006
     * @tc.desc      Verify stats for text carries label and count
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testLaunchGroupStatsCases0006', 0, (): void => {
      const samples: LaunchSample[] = mergeSamples([samplesOf('firstFrame', 2, 700, 100)]);
      const text: string = statsFor(samples, 'firstFrame').text();
      expect(text.indexOf('首帧') >= 0).assertTrue();
      expect(text.indexOf('2 条') >= 0).assertTrue();
      expect(text.indexOf('P90') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPSTATSCASES_0700
     * @tc.name      testLaunchGroupStatsCases0007
     * @tc.desc      Verify all stats keep catalog order
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testLaunchGroupStatsCases0007', 0, (): void => {
      const stats: GroupStats[] = allStats([]);
      expect(stats.length).assertEqual(LAUNCH_GROUPS.length);
      stats.forEach((item: GroupStats, index: number): void => {
        expect(item.key).assertEqual(LAUNCH_GROUPS[index].key);
      });
      expect(allStats([]).every((item: GroupStats): boolean => item.count === 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPSTATSCASES_0800
     * @tc.name      testLaunchGroupStatsCases0008
     * @tc.desc      Verify all stats conserve sample count
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupStatsCases0008', 0, (): void => {
      const samples: LaunchSample[] = mergeSamples([
        samplesOf('cold', 3, 100, 10),
        samplesOf('warm', 2, 200, 10),
        samplesOf('hot', 5, 30, 10)
      ]);
      let total: number = 0;
      allStats(samples).forEach((item: GroupStats): void => {
        total += item.count;
      });
      expect(total).assertEqual(samples.length);
      expect(total).assertEqual(10);
      expect(samples.length).assertEqual(10);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPSTATSCASES_0900
     * @tc.name      testLaunchGroupStatsCases0009
     * @tc.desc      Verify all stats ignore samples outside catalog
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testLaunchGroupStatsCases0009', 0, (): void => {
      const samples: LaunchSample[] = mergeSamples([
        samplesOf('cold', 2, 100, 10),
        [sampleOf('x', 'orphan', 0, 999)]
      ]);
      let total: number = 0;
      allStats(samples).forEach((item: GroupStats): void => {
        total += item.count;
      });
      expect(total).assertEqual(2);
      expect(samples.length).assertEqual(3);
      expect(samples.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPSTATSCASES_1000
     * @tc.name      testLaunchGroupStatsCases0010
     * @tc.desc      Verify stats P90 never below median
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupStatsCases0010', 0, (): void => {
      const samples: LaunchSample[] = mergeSamples([samplesOf('interactive', 6, 200, 37)]);
      const stats: GroupStats = statsFor(samples, 'interactive');
      expect(stats.p90 >= stats.p50).assertTrue();
      expect(stats.worst >= stats.p90).assertTrue();
      expect(stats.mean >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPSTATSCASES_1100
     * @tc.name      testLaunchGroupStatsCases0011
     * @tc.desc      Verify stats for ignores blank key
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupStatsCases0011', 0, (): void => {
      const samples: LaunchSample[] = mergeSamples([samplesOf('cold', 2, 100, 10)]);
      const stats: GroupStats = statsFor(samples, '');
      expect(stats.count).assertEqual(0);
      expect(stats.key).assertEqual('');
      expect(stats.key === 'cold').assertFalse();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPSTATSCASES_1200
     * @tc.name      testLaunchGroupStatsCases0012
     * @tc.desc      Verify stats for single sample aligns all metrics
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupStatsCases0012', 0, (): void => {
      const samples: LaunchSample[] = [sampleOf('only', 'hot', 0, 320)];
      const stats: GroupStats = statsFor(samples, 'hot');
      expect(stats.count).assertEqual(1);
      expect(stats.p50).assertEqual(320);
      expect(stats.p90).assertEqual(320);
      expect(stats.worst).assertEqual(320);
      expect(stats.mean).assertEqual(320);
    });
  });

  describe('LaunchBudgetEvaluationCases', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHBUDGETEVALUATIONCASES_0100
     * @tc.name      testLaunchBudgetEvaluationCases0001
     * @tc.desc      Verify empty samples produce no measured groups
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchBudgetEvaluationCases0001', 0, (): void => {
      const report: BudgetReport = evaluateBudgets([]);
      expect(report.results.length).assertEqual(LAUNCH_GROUPS.length);
      expect(report.measured()).assertEqual(0);
      expect(report.passed()).assertEqual(0);
      expect(report.failed()).assertEqual(0);
      expect(report.passRate()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHBUDGETEVALUATIONCASES_0200
     * @tc.name      testLaunchBudgetEvaluationCases0002
     * @tc.desc      Verify empty samples headline says no data
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchBudgetEvaluationCases0002', 0, (): void => {
      const report: BudgetReport = evaluateBudgets([]);
      expect(report.headline()).assertEqual('暂无启动样本');
      expect(report.text().indexOf('暂无启动样本') >= 0).assertTrue();
      expect(report.failures().length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHBUDGETEVALUATIONCASES_0300
     * @tc.name      testLaunchBudgetEvaluationCases0003
     * @tc.desc      Verify unmeasured groups count as passed but excluded
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchBudgetEvaluationCases0003', 0, (): void => {
      const samples: LaunchSample[] = mergeSamples([samplesOf('cold', 2, 500, 10)]);
      const report: BudgetReport = evaluateBudgets(samples);
      const cold: BudgetResult | undefined = report.results.find((item: BudgetResult): boolean =>
        item.key === 'cold');
      const warm: BudgetResult | undefined = report.results.find((item: BudgetResult): boolean =>
        item.key === 'warm');
      expect(cold?.passed).assertTrue();
      expect(warm?.passed).assertTrue();
      expect(warm?.count).assertEqual(0);
      expect(report.measured()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHBUDGETEVALUATIONCASES_0400
     * @tc.name      testLaunchBudgetEvaluationCases0004
     * @tc.desc      Verify over budget group is reported as failure
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchBudgetEvaluationCases0004', 0, (): void => {
      const samples: LaunchSample[] = mergeSamples([samplesOf('hot', 3, 500, 10)]);
      const report: BudgetReport = evaluateBudgets(samples);
      const hot: BudgetResult | undefined = report.results.find((item: BudgetResult): boolean =>
        item.key === 'hot');
      expect(hot?.passed).assertFalse();
      expect(hot?.overshoot()).assertEqual(118);
      expect(hot?.overshoot()).assertEqual((hot?.p90 ?? 0) - 400);
      expect(report.failed()).assertEqual(1);
      expect(report.headline()).assertEqual('1 组超出预算');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHBUDGETEVALUATIONCASES_0500
     * @tc.name      testLaunchBudgetEvaluationCases0005
     * @tc.desc      Verify budget boundary is inclusive
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchBudgetEvaluationCases0005', 0, (): void => {
      const atBudget: LaunchSample[] = [sampleOf('edge', 'hot', 0, 400)];
      const overBudget: LaunchSample[] = [sampleOf('edge', 'hot', 0, 401)];
      const passReport: BudgetReport = evaluateBudgets(atBudget);
      const failReport: BudgetReport = evaluateBudgets(overBudget);
      expect(passReport.failed()).assertEqual(0);
      expect(failReport.failed()).assertEqual(1);
      expect(passReport.passRate()).assertEqual(100);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHBUDGETEVALUATIONCASES_0600
     * @tc.name      testLaunchBudgetEvaluationCases0006
     * @tc.desc      Verify overshoot is zero when passed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchBudgetEvaluationCases0006', 0, (): void => {
      const report: BudgetReport = evaluateBudgets([sampleOf('ok', 'cold', 0, 600)]);
      const cold: BudgetResult | undefined = report.results.find((item: BudgetResult): boolean =>
        item.key === 'cold');
      expect(cold?.passed).assertTrue();
      expect(cold?.overshoot()).assertEqual(0);
      expect(cold?.count).assertEqual(1);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHBUDGETEVALUATIONCASES_0700
     * @tc.name      testLaunchBudgetEvaluationCases0007
     * @tc.desc      Verify budget result text for empty group
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testLaunchBudgetEvaluationCases0007', 0, (): void => {
      const result: BudgetResult = new BudgetResult();
      result.key = 'warm';
      result.label = '温启动';
      expect(result.text()).assertEqual('温启动：暂无样本');
      expect(result.count).assertEqual(0);
      expect(result.overshoot()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHBUDGETEVALUATIONCASES_0800
     * @tc.name      testLaunchBudgetEvaluationCases0008
     * @tc.desc      Verify budget result text for passed group
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testLaunchBudgetEvaluationCases0008', 0, (): void => {
      const result: BudgetResult = new BudgetResult();
      result.label = '热启动';
      result.count = 3;
      result.p90 = 300;
      result.budgetMs = 400;
      result.passed = true;
      expect(result.text().indexOf('达标') >= 0).assertTrue();
      expect(result.text().indexOf('300') >= 0).assertTrue();
      expect(result.text().indexOf('超出')).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHBUDGETEVALUATIONCASES_0900
     * @tc.name      testLaunchBudgetEvaluationCases0009
     * @tc.desc      Verify budget result text for failed group
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testLaunchBudgetEvaluationCases0009', 0, (): void => {
      const result: BudgetResult = new BudgetResult();
      result.label = '冷启动';
      result.count = 4;
      result.p90 = 1500;
      result.budgetMs = 1200;
      result.passed = false;
      expect(result.text().indexOf('超出 300 ms') >= 0).assertTrue();
      expect(result.overshoot()).assertEqual(300);
      expect(result.text().indexOf('达标')).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHBUDGETEVALUATIONCASES_1000
     * @tc.name      testLaunchBudgetEvaluationCases0010
     * @tc.desc      Verify report text starts with headline
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testLaunchBudgetEvaluationCases0010', 0, (): void => {
      const report: BudgetReport = evaluateBudgets([sampleOf('ok', 'hot', 0, 100)]);
      const lines: string[] = report.text().split('\n');
      expect(lines.length).assertEqual(LAUNCH_GROUPS.length + 1);
      expect(lines[0].indexOf('启动预算') >= 0).assertTrue();
      expect(lines[0].indexOf('通过率') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHBUDGETEVALUATIONCASES_1100
     * @tc.name      testLaunchBudgetEvaluationCases0011
     * @tc.desc      Verify pass rate counts only measured groups
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchBudgetEvaluationCases0011', 0, (): void => {
      const samples: LaunchSample[] = mergeSamples([
        samplesOf('cold', 2, 500, 10),
        samplesOf('hot', 2, 900, 10)
      ]);
      const report: BudgetReport = evaluateBudgets(samples);
      expect(report.measured()).assertEqual(2);
      expect(report.passed()).assertEqual(1);
      expect(report.failed()).assertEqual(1);
      expect(report.passRate()).assertEqual(50);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHBUDGETEVALUATIONCASES_1200
     * @tc.name      testLaunchBudgetEvaluationCases0012
     * @tc.desc      Verify failures exclude unmeasured groups
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchBudgetEvaluationCases0012', 0, (): void => {
      const report: BudgetReport = evaluateBudgets([sampleOf('slow', 'warm', 0, 2000)]);
      const failures: BudgetResult[] = report.failures();
      expect(failures.length).assertEqual(1);
      expect(failures[0].key).assertEqual('warm');
      expect(failures[0].count > 0).assertTrue();
      expect(report.results.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHBUDGETEVALUATIONCASES_1300
     * @tc.name      testLaunchBudgetEvaluationCases0013
     * @tc.desc      Verify all groups within budget headline
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchBudgetEvaluationCases0013', 0, (): void => {
      const samples: LaunchSample[] = mergeSamples([
        samplesOf('cold', 2, 800, 10),
        samplesOf('warm', 2, 500, 10),
        samplesOf('hot', 2, 200, 10)
      ]);
      const report: BudgetReport = evaluateBudgets(samples);
      expect(report.headline()).assertEqual('全部达标');
      expect(report.failed()).assertEqual(0);
      expect(report.passRate()).assertEqual(100);
    });
  });

  describe('LaunchRegressionCases', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHREGRESSIONCASES_0100
     * @tc.name      testLaunchRegressionCases0001
     * @tc.desc      Verify missing group is uncomparable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchRegressionCases0001', 0, (): void => {
      const before: LaunchSample[] = mergeSamples([samplesOf('cold', 2, 500, 10)]);
      const after: LaunchSample[] = mergeSamples([samplesOf('warm', 2, 500, 10)]);
      const report: RegressionReport = compareLaunches(before, after);
      const cold: RegressionResult | undefined = report.results.find((item: RegressionResult): boolean =>
        item.key === 'cold');
      expect(cold?.verdict).assertEqual(RegressionVerdict.UNKNOWN);
      expect(cold?.beforeP90).assertEqual(509);
      expect(cold?.afterP90).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHREGRESSIONCASES_0200
     * @tc.name      testLaunchRegressionCases0002
     * @tc.desc      Verify empty both sides is uncomparable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchRegressionCases0002', 0, (): void => {
      const report: RegressionReport = compareLaunches([], []);
      expect(report.results.length).assertEqual(LAUNCH_GROUPS.length);
      report.results.forEach((item: RegressionResult): void => {
        expect(item.verdict).assertEqual(RegressionVerdict.UNKNOWN);
      });
      expect(report.regressed().length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHREGRESSIONCASES_0300
     * @tc.name      testLaunchRegressionCases0003
     * @tc.desc      Verify identical samples are stable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchRegressionCases0003', 0, (): void => {
      const samples: LaunchSample[] = mergeSamples([samplesOf('cold', 3, 700, 10)]);
      const report: RegressionReport = compareLaunches(samples, samples);
      const cold: RegressionResult | undefined = report.results.find((item: RegressionResult): boolean =>
        item.key === 'cold');
      expect(cold?.verdict).assertEqual(RegressionVerdict.STABLE);
      expect(cold?.changePercent()).assertEqual(0);
      expect(report.headline()).assertEqual('没有回归');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHREGRESSIONCASES_0400
     * @tc.name      testLaunchRegressionCases0004
     * @tc.desc      Verify slower samples regress
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchRegressionCases0004', 0, (): void => {
      const before: LaunchSample[] = [sampleOf('b', 'hot', 0, 1000)];
      const after: LaunchSample[] = [sampleOf('a', 'hot', 0, 1200)];
      const report: RegressionReport = compareLaunches(before, after);
      const hot: RegressionResult | undefined = report.results.find((item: RegressionResult): boolean =>
        item.key === 'hot');
      expect(hot?.verdict).assertEqual(RegressionVerdict.REGRESSED);
      expect(hot?.changePercent()).assertEqual(20);
      expect(report.regressed().length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHREGRESSIONCASES_0500
     * @tc.name      testLaunchRegressionCases0005
     * @tc.desc      Verify faster samples improve
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchRegressionCases0005', 0, (): void => {
      const before: LaunchSample[] = [sampleOf('b', 'hot', 0, 1000)];
      const after: LaunchSample[] = [sampleOf('a', 'hot', 0, 850)];
      const report: RegressionReport = compareLaunches(before, after);
      const hot: RegressionResult | undefined = report.results.find((item: RegressionResult): boolean =>
        item.key === 'hot');
      expect(hot?.verdict).assertEqual(RegressionVerdict.IMPROVED);
      expect(hot?.changePercent()).assertEqual(-15);
      expect(report.headline()).assertEqual('没有回归');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHREGRESSIONCASES_0600
     * @tc.name      testLaunchRegressionCases0006
     * @tc.desc      Verify change within threshold is stable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchRegressionCases0006', 0, (): void => {
      const before: LaunchSample[] = [sampleOf('b', 'warm', 0, 1000)];
      const after: LaunchSample[] = [sampleOf('a', 'warm', 0, 1050)];
      const report: RegressionReport = compareLaunches(before, after);
      const warm: RegressionResult | undefined = report.results.find((item: RegressionResult): boolean =>
        item.key === 'warm');
      expect(warm?.verdict).assertEqual(RegressionVerdict.STABLE);
      expect(warm?.changePercent()).assertEqual(5);
      expect(warm?.beforeP90).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHREGRESSIONCASES_0700
     * @tc.name      testLaunchRegressionCases0007
     * @tc.desc      Verify custom threshold widens tolerance
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchRegressionCases0007', 0, (): void => {
      const before: LaunchSample[] = [sampleOf('b', 'cold', 0, 1000)];
      const after: LaunchSample[] = [sampleOf('a', 'cold', 0, 1200)];
      const strict: RegressionReport = compareLaunches(before, after, 10);
      const loose: RegressionReport = compareLaunches(before, after, 20);
      const strictCold: RegressionResult | undefined = strict.results.find((item: RegressionResult): boolean =>
        item.key === 'cold');
      const looseCold: RegressionResult | undefined = loose.results.find((item: RegressionResult): boolean =>
        item.key === 'cold');
      expect(strictCold?.verdict).assertEqual(RegressionVerdict.REGRESSED);
      expect(looseCold?.verdict).assertEqual(RegressionVerdict.STABLE);
      expect(strict.results.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHREGRESSIONCASES_0800
     * @tc.name      testLaunchRegressionCases0008
     * @tc.desc      Verify change percent handles zero baseline
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchRegressionCases0008', 0, (): void => {
      const zero: RegressionResult = new RegressionResult();
      zero.beforeP90 = 0;
      zero.afterP90 = 0;
      const grown: RegressionResult = new RegressionResult();
      grown.beforeP90 = 0;
      grown.afterP90 = 240;
      expect(zero.changePercent()).assertEqual(0);
      expect(grown.changePercent()).assertEqual(100);
      expect(grown.changePercent() > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHREGRESSIONCASES_0900
     * @tc.name      testLaunchRegressionCases0009
     * @tc.desc      Verify regression labels cover every verdict
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testLaunchRegressionCases0009', 0, (): void => {
      expect(regressionLabel(RegressionVerdict.IMPROVED)).assertEqual('变快');
      expect(regressionLabel(RegressionVerdict.STABLE)).assertEqual('持平');
      expect(regressionLabel(RegressionVerdict.REGRESSED)).assertEqual('变慢');
      expect(regressionLabel(RegressionVerdict.UNKNOWN)).assertEqual('无法比较');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHREGRESSIONCASES_1000
     * @tc.name      testLaunchRegressionCases0010
     * @tc.desc      Verify regression labels are distinct
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testLaunchRegressionCases0010', 0, (): void => {
      const labels: string[] = [
        regressionLabel(RegressionVerdict.IMPROVED),
        regressionLabel(RegressionVerdict.STABLE),
        regressionLabel(RegressionVerdict.REGRESSED),
        regressionLabel(RegressionVerdict.UNKNOWN)
      ];
      expect(labels.filter((label: string, index: number): boolean =>
        labels.indexOf(label) !== index).length).assertEqual(0);
      expect(labels.every((label: string): boolean => label.length > 0)).assertTrue();
      expect(labels.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHREGRESSIONCASES_1100
     * @tc.name      testLaunchRegressionCases0011
     * @tc.desc      Verify regressed filters only worse groups
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchRegressionCases0011', 0, (): void => {
      const before: LaunchSample[] = mergeSamples([
        [sampleOf('b1', 'cold', 0, 800)],
        [sampleOf('b2', 'hot', 0, 300)],
        [sampleOf('b3', 'warm', 0, 600)]
      ]);
      const after: LaunchSample[] = mergeSamples([
        [sampleOf('a1', 'cold', 0, 1000)],
        [sampleOf('a2', 'hot', 0, 200)],
        [sampleOf('a3', 'warm', 0, 600)]
      ]);
      const report: RegressionReport = compareLaunches(before, after);
      const worse: RegressionResult[] = report.regressed();
      expect(worse.length).assertEqual(1);
      expect(worse[0].key).assertEqual('cold');
      expect(report.headline()).assertEqual('1 组出现回归');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHREGRESSIONCASES_1200
     * @tc.name      testLaunchRegressionCases0012
     * @tc.desc      Verify regression text lists every group
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testLaunchRegressionCases0012', 0, (): void => {
      const report: RegressionReport = compareLaunches(
        [sampleOf('b', 'cold', 0, 700)], [sampleOf('a', 'cold', 0, 800)]);
      const lines: string[] = report.text().split('\n');
      expect(lines.length).assertEqual(LAUNCH_GROUPS.length + 1);
      expect(lines[0].indexOf('回归检测') >= 0).assertTrue();
      expect(report.text().indexOf('冷启动') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHREGRESSIONCASES_1300
     * @tc.name      testLaunchRegressionCases0013
     * @tc.desc      Verify empty report headline says no comparison
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchRegressionCases0013', 0, (): void => {
      const report: RegressionReport = new RegressionReport();
      expect(report.headline()).assertEqual('没有可比样本');
      expect(report.regressed().length).assertEqual(0);
      expect(report.results.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHREGRESSIONCASES_1400
     * @tc.name      testLaunchRegressionCases0014
     * @tc.desc      Verify regression result text shows delta
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testLaunchRegressionCases0014', 0, (): void => {
      const result: RegressionResult = new RegressionResult();
      result.key = 'cold';
      result.beforeP90 = 800;
      result.afterP90 = 1000;
      result.verdict = RegressionVerdict.REGRESSED;
      const text: string = result.text();
      expect(text.indexOf('800 -> 1000') >= 0).assertTrue();
      expect(text.indexOf('变慢') >= 0).assertTrue();
      expect(text.indexOf('25%') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHREGRESSIONCASES_1500
     * @tc.name      testLaunchRegressionCases0015
     * @tc.desc      Verify regression compares percentiles not means
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchRegressionCases0015', 0, (): void => {
      const before: LaunchSample[] = mergeSamples([samplesOf('hot', 5, 100, 10)]);
      const after: LaunchSample[] = mergeSamples([samplesOf('hot', 5, 100, 10)]);
      const report: RegressionReport = compareLaunches(before, after);
      const hot: RegressionResult | undefined = report.results.find((item: RegressionResult): boolean =>
        item.key === 'hot');
      expect(hot?.beforeP90).assertEqual(136);
      expect(hot?.afterP90).assertEqual(136);
      expect(hot?.verdict).assertEqual(RegressionVerdict.STABLE);
    });
  });
}
