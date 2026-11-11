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
  STEP_CATALOG, StepKind, StepOutcome, PlanStep, auditPlan, criticalDuration, estimateDuration,
  evaluateRun, resolveOrder, stepKeys, stepKindLabel, stepsOfKind, verdictLabel, PlanVerdict
} from '../../../main/ets/core/MaintenancePlan';
import {
  LoadTier, TIER_BOUNDS, Workload, auditProfile, classifyLoad, planBatches, recommendedBatch,
  recommendedConcurrency, recommendedTimeout, tierLabel, tierOrder
} from '../../../main/ets/core/LoadProfile';
import {
  LAUNCH_GROUPS, auditBudgets, groupKeys, groupLabel, groupOf, quantileOf, regressionLabel,
  RegressionVerdict, sampleOf, statsFor, allStats, evaluateBudgets
} from '../../../main/ets/core/LaunchBudget';
import { LaunchSample } from '../../../main/ets/core/Types';

function order(): string[] {
  return resolveOrder().order;
}

function requireStep(key: string): PlanStep {
  const found: PlanStep | undefined = STEP_CATALOG.find((item: PlanStep): boolean =>
    item.key === key);
  if (found === undefined) {
    throw new Error(`missing step ${key}`);
  }
  return found;
}

function stepIndex(key: string): number {
  return order().indexOf(key);
}

function allSuccess(): StepOutcome[] {
  return order().map((key: string): StepOutcome => {
    const outcome: StepOutcome = new StepOutcome(key, '成功');
    outcome.elapsed = 5;
    outcome.detail = '本地预演';
    return outcome;
  });
}

export default function performanceRuleCasesTest(): void {
  describe('MaintenanceStepCases', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCESTEPCASES_0100
     * @tc.name      testMaintenanceStepCases0001
     * @tc.desc      Verify scan files is first and dependency free
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMaintenanceStepCases0001', 0, (): void => {
      const step = requireStep('scan-files');
      expect(step.kind).assertEqual(StepKind.SCAN);
      expect(step.dependsOn.length).assertEqual(0);
      expect(step.weightMs).assertEqual(120);
      expect(step.critical).assertTrue();
      expect(step.retryable).assertTrue();
      expect(stepIndex('scan-files')).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCESTEPCASES_0200
     * @tc.name      testMaintenanceStepCases0002
     * @tc.desc      Verify scan cache and scan memory are parallel
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMaintenanceStepCases0002', 0, (): void => {
      expect(requireStep('scan-cache')?.weightMs).assertEqual(90);
      expect(requireStep('scan-memory')?.critical).assertFalse();
      expect(requireStep('scan-memory')?.weightMs).assertEqual(60);
      expect(stepIndex('scan-cache')).assertEqual(1);
      expect(stepIndex('scan-memory')).assertEqual(2);
      expect(stepIndex('scan-memory') < stepIndex('validate-files')).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCESTEPCASES_0300
     * @tc.name      testMaintenanceStepCases0003
     * @tc.desc      Verify validate steps depend on scans
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMaintenanceStepCases0003', 0, (): void => {
      const files = requireStep('validate-files');
      const cache = requireStep('validate-cache');
      expect(files?.kind).assertEqual(StepKind.VALIDATE);
      expect(files?.dependsOn[0]).assertEqual('scan-files');
      expect(cache?.dependsOn[0]).assertEqual('scan-cache');
      expect(stepIndex('scan-files') < stepIndex('validate-files')).assertTrue();
      expect(stepIndex('scan-cache') < stepIndex('validate-cache')).assertTrue();
      expect(stepKindLabel(StepKind.VALIDATE)).assertEqual('校验');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCESTEPCASES_0400
     * @tc.name      testMaintenanceStepCases0004
     * @tc.desc      Verify prepare budget joins both validations
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMaintenanceStepCases0004', 0, (): void => {
      const prepare = requireStep('prepare-budget');
      expect(prepare?.kind).assertEqual(StepKind.PREPARE);
      expect(prepare?.dependsOn.length).assertEqual(2);
      expect(prepare?.dependsOn.indexOf('validate-files') >= 0).assertTrue();
      expect(prepare?.dependsOn.indexOf('validate-cache') >= 0).assertTrue();
      expect(stepIndex('validate-files') < stepIndex('prepare-budget')).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCESTEPCASES_0500
     * @tc.name      testMaintenanceStepCases0005
     * @tc.desc      Verify execute steps run after prepare
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMaintenanceStepCases0005', 0, (): void => {
      expect(requireStep('execute-files')?.weightMs).assertEqual(400);
      expect(requireStep('execute-cache')?.weightMs).assertEqual(320);
      expect(requireStep('execute-memory')?.critical).assertFalse();
      expect(stepIndex('prepare-budget') < stepIndex('execute-files')).assertTrue();
      expect(stepIndex('prepare-budget') < stepIndex('execute-cache')).assertTrue();
      expect(stepsOfKind(StepKind.EXECUTE).length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCESTEPCASES_0600
     * @tc.name      testMaintenanceStepCases0006
     * @tc.desc      Verify verify steps follow executes
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMaintenanceStepCases0006', 0, (): void => {
      expect(requireStep('verify-files')?.kind).assertEqual(StepKind.VERIFY);
      expect(requireStep('verify-files')?.dependsOn[0]).assertEqual('execute-files');
      expect(requireStep('verify-cache')?.dependsOn[0]).assertEqual('execute-cache');
      expect(requireStep('verify-files')?.retryable).assertTrue();
      expect(stepIndex('execute-files') < stepIndex('verify-files')).assertTrue();
      expect(stepIndex('execute-cache') < stepIndex('verify-cache')).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCESTEPCASES_0700
     * @tc.name      testMaintenanceStepCases0007
     * @tc.desc      Verify cleanup is last and optional
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMaintenanceStepCases0007', 0, (): void => {
      const cleanup = requireStep('cleanup-report');
      expect(cleanup?.kind).assertEqual(StepKind.CLEANUP);
      expect(cleanup?.critical).assertFalse();
      expect(cleanup?.weightMs).assertEqual(30);
      expect(stepIndex('cleanup-report')).assertEqual(11);
      expect(stepKeys().length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCESTEPCASES_0800
     * @tc.name      testMaintenanceStepCases0008
     * @tc.desc      Verify every dependency precedes its dependent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMaintenanceStepCases0008', 0, (): void => {
      const sequence: string[] = order();
      STEP_CATALOG.forEach((step): void => {
        const position: number = sequence.indexOf(step.key);
        expect(position >= 0).assertTrue();
        step.dependsOn.forEach((dep: string): void => {
          expect(sequence.indexOf(dep) < position).assertTrue();
        });
      });
      expect(auditPlan().ok).assertTrue();
      expect(estimateDuration(sequence)).assertEqual(1550);
      expect(criticalDuration(sequence)).assertEqual(1200);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCESTEPCASES_0900
     * @tc.name      testMaintenanceStepCases0009
     * @tc.desc      Verify run verdicts cover four outcomes
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMaintenanceStepCases0009', 0, (): void => {
      const success = evaluateRun(order(), allSuccess());
      expect(success.verdict()).assertEqual(PlanVerdict.PASS);
      expect(success.totalElapsed()).assertEqual(60);
      const partial = evaluateRun(order(), allSuccess().slice(0, 8));
      expect(partial.verdict()).assertEqual(PlanVerdict.PARTIAL);
      const failedResults: StepOutcome[] = allSuccess();
      const execute = failedResults.find((item): boolean => item.key === 'execute-cache');
      if (execute !== undefined) {
        execute.status = '失败';
      }
      const failed = evaluateRun(order(), failedResults);
      expect(failed.verdict()).assertEqual(PlanVerdict.FAILED);
      expect(verdictLabel(failed.verdict())).assertEqual('存在关键失败');
      expect(evaluateRun([], []).verdict()).assertEqual(PlanVerdict.BLOCKED);
    });
  });

  describe('LoadTierCases', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_LOADTIERCASES_0100
     * @tc.name      testLoadTierCases0001
     * @tc.desc      Verify idle tier handles empty workload
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLoadTierCases0001', 0, (): void => {
      expect(classifyLoad(new Workload(0, 0, 0))).assertEqual(LoadTier.IDLE);
      expect(recommendedBatch(LoadTier.IDLE)).assertEqual(0);
      expect(recommendedConcurrency(LoadTier.IDLE)).assertEqual(1);
      expect(recommendedTimeout(LoadTier.IDLE)).assertEqual(500);
      expect(planBatches(new Workload(0, 0, 0)).batchCount).assertEqual(0);
      expect(tierLabel(LoadTier.IDLE)).assertEqual('空载');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LOADTIERCASES_0200
     * @tc.name      testLoadTierCases0002
     * @tc.desc      Verify light tier boundaries
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLoadTierCases0002', 0, (): void => {
      expect(classifyLoad(new Workload(1, 1, 1))).assertEqual(LoadTier.LIGHT);
      expect(classifyLoad(new Workload(50, 1048576, 4))).assertEqual(LoadTier.LIGHT);
      expect(classifyLoad(new Workload(51, 1048576, 4))).assertEqual(LoadTier.NORMAL);
      expect(recommendedBatch(LoadTier.LIGHT)).assertEqual(16);
      expect(recommendedConcurrency(LoadTier.LIGHT)).assertEqual(4);
      expect(recommendedTimeout(LoadTier.LIGHT)).assertEqual(2000);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LOADTIERCASES_0300
     * @tc.name      testLoadTierCases0003
     * @tc.desc      Verify normal tier boundaries
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLoadTierCases0003', 0, (): void => {
      expect(classifyLoad(new Workload(500, 33554432, 12))).assertEqual(LoadTier.NORMAL);
      expect(classifyLoad(new Workload(501, 33554432, 12))).assertEqual(LoadTier.HEAVY);
      expect(recommendedBatch(LoadTier.NORMAL)).assertEqual(64);
      expect(recommendedConcurrency(LoadTier.NORMAL)).assertEqual(6);
      expect(recommendedTimeout(LoadTier.NORMAL)).assertEqual(5000);
      expect(tierOrder(LoadTier.NORMAL) > tierOrder(LoadTier.LIGHT)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LOADTIERCASES_0400
     * @tc.name      testLoadTierCases0004
     * @tc.desc      Verify heavy tier boundaries
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLoadTierCases0004', 0, (): void => {
      expect(classifyLoad(new Workload(5000, 268435456, 32))).assertEqual(LoadTier.HEAVY);
      expect(classifyLoad(new Workload(5001, 268435456, 32))).assertEqual(LoadTier.EXTREME);
      expect(recommendedBatch(LoadTier.HEAVY)).assertEqual(128);
      expect(recommendedConcurrency(LoadTier.HEAVY)).assertEqual(4);
      expect(recommendedTimeout(LoadTier.HEAVY)).assertEqual(15000);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LOADTIERCASES_0500
     * @tc.name      testLoadTierCases0005
     * @tc.desc      Verify extreme tier is bounded
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLoadTierCases0005', 0, (): void => {
      expect(classifyLoad(new Workload(100000, 1, 1))).assertEqual(LoadTier.EXTREME);
      expect(recommendedBatch(LoadTier.EXTREME)).assertEqual(256);
      expect(recommendedConcurrency(LoadTier.EXTREME)).assertEqual(2);
      expect(recommendedTimeout(LoadTier.EXTREME)).assertEqual(30000);
      expect(tierLabel(LoadTier.EXTREME)).assertEqual('超重载');
      expect(auditProfile().ok).assertTrue();
      expect(TIER_BOUNDS.length).assertEqual(5);
    });
  });

  describe('LaunchGroupCases', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPCASES_0100
     * @tc.name      testLaunchGroupCases0001
     * @tc.desc      Verify cold group budget
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupCases0001', 0, (): void => {
      expect(groupOf('cold')?.budgetMs).assertEqual(1200);
      expect(groupLabel('cold')).assertEqual('冷启动');
      expect(groupKeys()[0]).assertEqual('cold');
      expect(auditBudgets().ok).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPCASES_0200
     * @tc.name      testLaunchGroupCases0002
     * @tc.desc      Verify warm and hot budgets
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupCases0002', 0, (): void => {
      expect(groupOf('warm')?.budgetMs).assertEqual(800);
      expect(groupOf('hot')?.budgetMs).assertEqual(400);
      expect(groupLabel('warm')).assertEqual('温启动');
      expect(groupLabel('hot')).assertEqual('热启动');
      expect(groupKeys().length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPCASES_0300
     * @tc.name      testLaunchGroupCases0003
     * @tc.desc      Verify frame and interactive budgets
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupCases0003', 0, (): void => {
      expect(groupOf('firstFrame')?.budgetMs).assertEqual(900);
      expect(groupOf('interactive')?.budgetMs).assertEqual(1500);
      expect(groupLabel('firstFrame')).assertEqual('首帧');
      expect(groupLabel('interactive')).assertEqual('可交互');
      expect(LAUNCH_GROUPS.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPCASES_0400
     * @tc.name      testLaunchGroupCases0004
     * @tc.desc      Verify group stats use quantiles
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupCases0004', 0, (): void => {
      const samples: LaunchSample[] = [
        sampleOf('a', 'cold', 1000, 1000),
        sampleOf('b', 'cold', 2000, 1200),
        sampleOf('c', 'cold', 3000, 1400)
      ];
      const stats = statsFor(samples, 'cold');
      expect(stats.count).assertEqual(3);
      expect(stats.p50).assertEqual(1200);
      expect(stats.p90).assertEqual(1360);
      expect(stats.worst).assertEqual(1400);
      expect(stats.mean).assertEqual(1200);
      expect(quantileOf([], 50)).assertEqual(0);
      expect(allStats(samples).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPCASES_0500
     * @tc.name      testLaunchGroupCases0005
     * @tc.desc      Verify budget report splits measured groups
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupCases0005', 0, (): void => {
      const samples: LaunchSample[] = [
        sampleOf('a', 'cold', 1000, 1000),
        sampleOf('b', 'cold', 2000, 1100),
        sampleOf('c', 'hot', 3000, 500),
        sampleOf('d', 'hot', 4000, 600)
      ];
      const report = evaluateBudgets(samples);
      expect(report.measured()).assertEqual(2);
      expect(report.passed()).assertEqual(1);
      expect(report.failed()).assertEqual(1);
      expect(report.passRate()).assertEqual(50);
      expect(report.failures()[0].key).assertEqual('hot');
      expect(report.failures()[0].overshoot()).assertEqual(190);
      expect(regressionLabel(RegressionVerdict.STABLE)).assertEqual('持平');
    });
  });
}
