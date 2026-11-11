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
import { boundedIt as it } from '../support/BoundedCase';
import {
  PlanGraph, PlanIssue, PlanRun, PlanStep, PlanVerdict, STEP_CATALOG, StepKind, StepOutcome,
  auditPlan, criticalDuration, estimateDuration, evaluateRun, planLines, resolveOrder, stepKeys,
  stepKindLabel, stepOf, stepsOfKind, verdictLabel
} from '../../../main/ets/core/MaintenancePlan';
import {
  LoadTier, ProfileConclusion, TIER_BOUNDS, Workload, auditProfile, batchRanges, classifyLoad,
  planBatches, profileLines, profileOf, recommendedBatch, recommendedConcurrency,
  recommendedTimeout, tierLabel, tierOrder
} from '../../../main/ets/core/LoadProfile';
import {
  LAUNCH_GROUPS, BudgetReport, GroupStats, RegressionVerdict, allStats, auditBudgets,
  budgetLines, compareLaunches, evaluateBudgets, groupKeys, groupLabel, groupOf, quantileOf,
  regressionLabel, sampleOf, statsFor
} from '../../../main/ets/core/LaunchBudget';
import { LaunchSample } from '../../../main/ets/core/Types';

function outcomes(items: string[]): StepOutcome[] {
  return items.map((key: string): StepOutcome => {
    const outcome: StepOutcome = new StepOutcome(key, '成功');
    outcome.elapsed = 10;
    outcome.detail = '本地预演';
    return outcome;
  });
}

function coldSamples(values: number[]): LaunchSample[] {
  return values.map((value: number, index: number): LaunchSample =>
    sampleOf(`cold-${index}`, 'cold', 1700000000000 + index * 1000, value));
}

export default function planMatrixTest(): void {
  describe('MaintenancePlanMatrix', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCEPLANMATRIX_0100
     * @tc.name      testMaintenancePlanMatrix0001
     * @tc.desc      Verify catalog and audit
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testMaintenancePlanMatrix0001', 0, (): void => {
      expect(STEP_CATALOG.length).assertEqual(12);
      expect(stepKeys().length).assertEqual(12);
      expect(planLines().length).assertEqual(12);
      const audit = auditPlan();
      expect(audit.findings.length).assertEqual(0);
      expect(audit.ok).assertTrue();
      expect(audit.summary()).assertEqual('维护步骤表自洽');
      STEP_CATALOG.forEach((step: PlanStep): void => {
        expect(step.key.length > 0).assertTrue();
        expect(step.label.length > 0).assertTrue();
        expect(step.weightMs >= 0).assertTrue();
        expect(step.text().indexOf(step.key) === 0).assertTrue();
        step.dependsOn.forEach((dep: string): void => {
          expect(stepOf(dep) !== undefined).assertTrue();
        });
      });
      expect(stepsOfKind(StepKind.VERIFY).length).assertEqual(2);
      expect(stepsOfKind(StepKind.EXECUTE).length).assertEqual(3);
      expect(stepKindLabel(StepKind.EXECUTE)).assertEqual('执行');
      expect(stepOf('missing')).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCEPLANMATRIX_0200
     * @tc.name      testMaintenancePlanMatrix0002
     * @tc.desc      Verify order respects dependencies
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMaintenancePlanMatrix0002', 0, (): void => {
      const graph: PlanGraph = resolveOrder();
      expect(graph.ok()).assertTrue();
      expect(graph.order.length).assertEqual(12);
      expect(graph.blocked.length).assertEqual(0);
      expect(graph.order[0]).assertEqual('scan-files');
      expect(graph.order[graph.order.length - 1]).assertEqual('cleanup-report');
      graph.order.forEach((key: string, index: number): void => {
        const step: PlanStep | undefined = stepOf(key);
        expect(step !== undefined).assertTrue();
        if (step !== undefined) {
          step.dependsOn.forEach((dep: string): void => {
            expect(graph.order.indexOf(dep) < index).assertTrue();
          });
        }
      });
      expect(graph.summary().indexOf('可执行') === 0).assertTrue();
      expect(estimateDuration(graph.order)).assertEqual(1550);
      expect(criticalDuration(graph.order)).assertEqual(1200);
      expect(estimateDuration([])).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCEPLANMATRIX_0300
     * @tc.name      testMaintenancePlanMatrix0003
     * @tc.desc      Verify run passes when every step succeeds
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMaintenancePlanMatrix0003', 0, (): void => {
      const order: string[] = resolveOrder().order;
      const run: PlanRun = evaluateRun(order, outcomes(order));
      expect(run.outcomes.length).assertEqual(12);
      expect(run.succeeded()).assertEqual(12);
      expect(run.failed()).assertEqual(0);
      expect(run.skipped()).assertEqual(0);
      expect(run.totalElapsed()).assertEqual(120);
      expect(run.verdict()).assertEqual(PlanVerdict.PASS);
      expect(verdictLabel(run.verdict())).assertEqual('全部完成');
      expect(run.headline().indexOf('成功 12 步') > 0).assertTrue();
      expect(run.retryables().length).assertEqual(0);
      expect(run.text().split('\n').length).assertEqual(13);
      expect(run.outcomeOf('scan-files')?.status).assertEqual('成功');
      expect(run.outcomeOf('missing')).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCEPLANMATRIX_0400
     * @tc.name      testMaintenancePlanMatrix0004
     * @tc.desc      Verify critical failure blocks dependents
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMaintenancePlanMatrix0004', 0, (): void => {
      const order: string[] = resolveOrder().order;
      const results: StepOutcome[] = outcomes(order);
      const execute: StepOutcome | undefined = results.find((item: StepOutcome): boolean =>
        item.key === 'execute-files');
      expect(execute !== undefined).assertTrue();
      if (execute !== undefined) {
        execute.status = '失败';
      }
      const run: PlanRun = evaluateRun(order, results);
      expect(run.verdict()).assertEqual(PlanVerdict.FAILED);
      expect(run.failed()).assertEqual(1);
      expect(run.skipped()).assertEqual(1);
      expect(run.outcomeOf('verify-files')?.skipped()).assertTrue();
      expect(run.headline().indexOf('存在关键失败') === 0).assertTrue();
      const retrySource: StepOutcome[] = outcomes(order);
      const scan: StepOutcome | undefined = retrySource.find((item: StepOutcome): boolean =>
        item.key === 'scan-files');
      expect(scan !== undefined).assertTrue();
      if (scan !== undefined) {
        scan.status = '失败';
      }
      const retryRun: PlanRun = evaluateRun(order, retrySource);
      expect(retryRun.retryables().length).assertEqual(1);
      expect(retryRun.retryables()[0]).assertEqual('scan-files');
      expect(retryRun.verdict()).assertEqual(PlanVerdict.FAILED);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCEPLANMATRIX_0500
     * @tc.name      testMaintenancePlanMatrix0005
     * @tc.desc      Verify missing results become skipped
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMaintenancePlanMatrix0005', 0, (): void => {
      const order: string[] = resolveOrder().order;
      const partial: PlanRun = evaluateRun(order, outcomes(order.slice(0, 6)));
      expect(partial.succeeded()).assertEqual(6);
      expect(partial.skipped()).assertEqual(6);
      expect(partial.verdict()).assertEqual(PlanVerdict.PARTIAL);
      expect(verdictLabel(partial.verdict())).assertEqual('部分完成');
      const empty: PlanRun = evaluateRun([], []);
      expect(empty.verdict()).assertEqual(PlanVerdict.BLOCKED);
      expect(verdictLabel(empty.verdict())).assertEqual('被阻塞');
      const pending: StepOutcome = new StepOutcome('scan-files', '待执行');
      expect(pending.pending()).assertTrue();
      expect(pending.succeeded()).assertFalse();
      expect(pending.text().indexOf('scan-files') === 0).assertTrue();
      const issue: PlanIssue = new PlanIssue('scan-files', '依赖不存在');
      expect(issue.text()).assertEqual('scan-files：依赖不存在');
    });
  });

  describe('LoadProfileMatrix', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_LOADPROFILEMATRIX_0100
     * @tc.name      testLoadProfileMatrix0001
     * @tc.desc      Verify tier classification
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLoadProfileMatrix0001', 0, (): void => {
      expect(TIER_BOUNDS.length).assertEqual(5);
      expect(profileLines().length).assertEqual(5);
      expect(classifyLoad(new Workload(0, 0, 0))).assertEqual(LoadTier.IDLE);
      expect(classifyLoad(new Workload(50, 1048576, 4))).assertEqual(LoadTier.LIGHT);
      expect(classifyLoad(new Workload(500, 33554432, 12))).assertEqual(LoadTier.NORMAL);
      expect(classifyLoad(new Workload(5000, 268435456, 32))).assertEqual(LoadTier.HEAVY);
      expect(classifyLoad(new Workload(6000, 268435457, 33))).assertEqual(LoadTier.EXTREME);
      expect(tierLabel(LoadTier.EXTREME)).assertEqual('超重载');
      expect(tierOrder(LoadTier.HEAVY) > tierOrder(LoadTier.LIGHT)).assertTrue();
      const workload: Workload = new Workload(100, 4096, 6);
      expect(workload.averageBytes()).assertEqual(41);
      expect(workload.empty()).assertFalse();
      expect(new Workload(0, 0, 0).empty()).assertTrue();
      expect(workload.text().indexOf('100 个文件') === 0).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LOADPROFILEMATRIX_0200
     * @tc.name      testLoadProfileMatrix0002
     * @tc.desc      Verify concurrency and timeout are reasonable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLoadProfileMatrix0002', 0, (): void => {
      const audit = auditProfile();
      expect(audit.findings.length).assertEqual(0);
      expect(audit.ok).assertTrue();
      expect(audit.summary()).assertEqual('负载档位表自洽');
      const tiers: LoadTier[] = [LoadTier.IDLE, LoadTier.LIGHT, LoadTier.NORMAL, LoadTier.HEAVY,
        LoadTier.EXTREME];
      tiers.forEach((tier: LoadTier): void => {
        expect(recommendedConcurrency(tier) > 0).assertTrue();
        expect(recommendedTimeout(tier) > 0).assertTrue();
        expect(recommendedBatch(tier) >= 0).assertTrue();
      });
      expect(recommendedConcurrency(LoadTier.LIGHT)).assertEqual(4);
      expect(recommendedConcurrency(LoadTier.HEAVY)).assertEqual(4);
      expect(recommendedTimeout(LoadTier.HEAVY)).assertEqual(15000);
      expect(recommendedTimeout(LoadTier.EXTREME) > recommendedTimeout(LoadTier.NORMAL)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LOADPROFILEMATRIX_0300
     * @tc.name      testLoadProfileMatrix0003
     * @tc.desc      Verify batches and profile
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLoadProfileMatrix0003', 0, (): void => {
      const workload: Workload = new Workload(100, 1024, 2);
      const plan = planBatches(workload);
      expect(plan.tier).assertEqual(LoadTier.NORMAL);
      expect(plan.batchSize).assertEqual(64);
      expect(plan.concurrency).assertEqual(6);
      expect(plan.batchCount).assertEqual(2);
      expect(plan.trivial()).assertFalse();
      const ranges = batchRanges(plan, 100, 8);
      expect(ranges.length).assertEqual(2);
      expect(ranges[0].start).assertEqual(0);
      expect(ranges[0].end).assertEqual(64);
      expect(ranges[0].size()).assertEqual(64);
      expect(ranges[1].end).assertEqual(100);
      expect(ranges[1].size()).assertEqual(36);
      expect(ranges[0].text().indexOf('第 1 批') === 0).assertTrue();
      expect(batchRanges(plan, 0, 8).length).assertEqual(0);
      const emptyPlan = planBatches(new Workload(0, 0, 0));
      expect(emptyPlan.batchSize).assertEqual(0);
      expect(emptyPlan.batchCount).assertEqual(0);
      const conclusion: ProfileConclusion = profileOf(workload);
      expect(conclusion.needsDryRun()).assertFalse();
      expect(conclusion.needsProgress()).assertTrue();
      expect(profileOf(new Workload(6000, 0, 1)).needsDryRun()).assertTrue();
      expect(conclusion.text().indexOf('100 个文件') === 0).assertTrue();
    });
  });

  describe('LaunchBudgetMatrix', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHBUDGETMATRIX_0100
     * @tc.name      testLaunchBudgetMatrix0001
     * @tc.desc      Verify groups are consistent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testLaunchBudgetMatrix0001', 0, (): void => {
      expect(LAUNCH_GROUPS.length).assertEqual(5);
      expect(groupKeys().length).assertEqual(5);
      expect(budgetLines().length).assertEqual(5);
      const audit = auditBudgets();
      expect(audit.ok).assertTrue();
      expect(audit.summary()).assertEqual('启动预算表自洽');
      expect(groupLabel('cold')).assertEqual('冷启动');
      expect(groupLabel('missing')).assertEqual('missing');
      expect(groupOf('hot')?.budgetMs).assertEqual(400);
      expect(groupOf('missing')).assertEqual(undefined);
      LAUNCH_GROUPS.forEach((group): void => {
        expect(group.budgetMs > 0).assertTrue();
        expect(group.text().indexOf(group.key) === 0).assertTrue();
      });
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHBUDGETMATRIX_0200
     * @tc.name      testLaunchBudgetMatrix0002
     * @tc.desc      Verify quantiles and group stats
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchBudgetMatrix0002', 0, (): void => {
      expect(quantileOf([], 50)).assertEqual(0);
      expect(quantileOf([10], 90)).assertEqual(10);
      expect(quantileOf([1000, 1100, 1200], 50)).assertEqual(1100);
      expect(quantileOf([1000, 1100, 1200], 90)).assertEqual(1180);
      expect(quantileOf([1000, 1100], 90)).assertEqual(1090);
      const samples: LaunchSample[] = coldSamples([1000, 1100, 1200]);
      const stats: GroupStats = statsFor(samples, 'cold');
      expect(stats.count).assertEqual(3);
      expect(stats.p50).assertEqual(1100);
      expect(stats.worst).assertEqual(1200);
      expect(stats.mean).assertEqual(1100);
      expect(stats.text().indexOf('冷启动') === 0).assertTrue();
      const empty: GroupStats = statsFor(samples, 'hot');
      expect(empty.count).assertEqual(0);
      expect(empty.p50).assertEqual(0);
      expect(allStats(samples).length).assertEqual(5);
      expect(allStats(samples)[0].count).assertEqual(3);
      expect(samples[0].device).assertEqual('unit-test');
      expect(samples[0].contentMs).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHBUDGETMATRIX_0300
     * @tc.name      testLaunchBudgetMatrix0003
     * @tc.desc      Verify budget evaluation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchBudgetMatrix0003', 0, (): void => {
      const samples: LaunchSample[] = coldSamples([1000, 1100, 1200]).concat([
        sampleOf('hot-0', 'hot', 1700000001000, 500),
        sampleOf('hot-1', 'hot', 1700000002000, 600)
      ]);
      const report: BudgetReport = evaluateBudgets(samples);
      expect(report.results.length).assertEqual(5);
      expect(report.measured()).assertEqual(2);
      expect(report.passed()).assertEqual(1);
      expect(report.failed()).assertEqual(1);
      expect(report.passRate()).assertEqual(50);
      expect(report.headline()).assertEqual('1 组超出预算');
      const failures = report.failures();
      expect(failures.length).assertEqual(1);
      expect(failures[0].key).assertEqual('hot');
      expect(failures[0].overshoot()).assertEqual(190);
      expect(failures[0].text().indexOf('超出') > 0).assertTrue();
      expect(report.text().indexOf('启动预算') === 0).assertTrue();
      const emptyReport: BudgetReport = evaluateBudgets([]);
      expect(emptyReport.headline()).assertEqual('暂无启动样本');
      expect(emptyReport.passRate()).assertEqual(0);
      expect(emptyReport.results[0].text().indexOf('暂无样本') > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHBUDGETMATRIX_0400
     * @tc.name      testLaunchBudgetMatrix0004
     * @tc.desc      Verify regression detection
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchBudgetMatrix0004', 0, (): void => {
      const before: LaunchSample[] = coldSamples([500, 600]).concat([
        sampleOf('b-hot-0', 'hot', 1700000003000, 500),
        sampleOf('b-hot-1', 'hot', 1700000004000, 600)
      ]);
      const after: LaunchSample[] = coldSamples([500, 600]).concat([
        sampleOf('a-hot-0', 'hot', 1700000005000, 800),
        sampleOf('a-hot-1', 'hot', 1700000006000, 900)
      ]);
      const report = compareLaunches(before, after);
      expect(report.results.length).assertEqual(5);
      expect(report.headline()).assertEqual('1 组出现回归');
      const regressed = report.regressed();
      expect(regressed.length).assertEqual(1);
      expect(regressed[0].key).assertEqual('hot');
      expect(regressed[0].verdict).assertEqual(RegressionVerdict.REGRESSED);
      expect(regressed[0].changePercent()).assertEqual(50.8);
      expect(regressed[0].text().indexOf('热启动') === 0).assertTrue();
      expect(report.results[0].verdict).assertEqual(RegressionVerdict.STABLE);
      expect(report.results[3].verdict).assertEqual(RegressionVerdict.UNKNOWN);
      expect(regressionLabel(RegressionVerdict.IMPROVED)).assertEqual('变快');
      expect(regressionLabel(RegressionVerdict.UNKNOWN)).assertEqual('无法比较');
      const same = compareLaunches(before, before);
      expect(same.regressed().length).assertEqual(0);
      expect(same.headline()).assertEqual('没有回归');
      expect(compareLaunches([], []).headline()).assertEqual('没有回归');
    });
  });
}
