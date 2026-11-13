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
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0001 PlanMatrix.test:61 assertEqual actual', STEP_CATALOG.length)).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0001 PlanMatrix.test:61 assertEqual expected', 12));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0001 PlanMatrix.test:62 assertEqual actual', stepKeys().length)).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0001 PlanMatrix.test:62 assertEqual expected', 12));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0001 PlanMatrix.test:63 assertEqual actual', planLines().length)).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0001 PlanMatrix.test:63 assertEqual expected', 12));
      const audit = auditPlan();
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0001 PlanMatrix.test:65 assertEqual actual', audit.findings.length)).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0001 PlanMatrix.test:65 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0001 PlanMatrix.test:66 assertTrue actual', audit.ok)).assertTrue();
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0001 PlanMatrix.test:67 assertEqual actual', audit.summary())).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0001 PlanMatrix.test:67 assertEqual expected', '维护步骤表自洽'));
      STEP_CATALOG.forEach((step: PlanStep): void => {
        expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0001 PlanMatrix.test:69 assertTrue actual', step.key.length > 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0001 PlanMatrix.test:70 assertTrue actual', step.label.length > 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0001 PlanMatrix.test:71 assertTrue actual', step.weightMs >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0001 PlanMatrix.test:72 assertTrue actual', step.text().indexOf(step.key) === 0)).assertTrue();
        step.dependsOn.forEach((dep: string): void => {
          expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0001 PlanMatrix.test:74 assertTrue actual', stepOf(dep) !== undefined)).assertTrue();
        });
      });
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0001 PlanMatrix.test:77 assertEqual actual', stepsOfKind(StepKind.VERIFY).length)).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0001 PlanMatrix.test:77 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0001 PlanMatrix.test:78 assertEqual actual', stepsOfKind(StepKind.EXECUTE).length)).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0001 PlanMatrix.test:78 assertEqual expected', 3));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0001 PlanMatrix.test:79 assertEqual actual', stepKindLabel(StepKind.EXECUTE))).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0001 PlanMatrix.test:79 assertEqual expected', '执行'));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0001 PlanMatrix.test:80 assertEqual actual', stepOf('missing'))).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0001 PlanMatrix.test:80 assertEqual expected', undefined));
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
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0002 PlanMatrix.test:94 assertTrue actual', graph.ok())).assertTrue();
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0002 PlanMatrix.test:95 assertEqual actual', graph.order.length)).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0002 PlanMatrix.test:95 assertEqual expected', 12));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0002 PlanMatrix.test:96 assertEqual actual', graph.blocked.length)).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0002 PlanMatrix.test:96 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0002 PlanMatrix.test:97 assertEqual actual', graph.order[0])).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0002 PlanMatrix.test:97 assertEqual expected', 'scan-files'));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0002 PlanMatrix.test:98 assertEqual actual', graph.order[graph.order.length - 1])).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0002 PlanMatrix.test:98 assertEqual expected', 'cleanup-report'));
      graph.order.forEach((key: string, index: number): void => {
        const step: PlanStep | undefined = stepOf(key);
        expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0002 PlanMatrix.test:101 assertTrue actual', step !== undefined)).assertTrue();
        if (step !== undefined) {
          step.dependsOn.forEach((dep: string): void => {
            expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0002 PlanMatrix.test:104 assertTrue actual', graph.order.indexOf(dep) < index)).assertTrue();
          });
        }
      });
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0002 PlanMatrix.test:108 assertTrue actual', graph.summary().indexOf('可执行') === 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0002 PlanMatrix.test:109 assertEqual actual', estimateDuration(graph.order))).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0002 PlanMatrix.test:109 assertEqual expected', 1550));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0002 PlanMatrix.test:110 assertEqual actual', criticalDuration(graph.order))).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0002 PlanMatrix.test:110 assertEqual expected', 1200));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0002 PlanMatrix.test:111 assertEqual actual', estimateDuration([]))).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0002 PlanMatrix.test:111 assertEqual expected', 0));
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
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0003 PlanMatrix.test:126 assertEqual actual', run.outcomes.length)).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0003 PlanMatrix.test:126 assertEqual expected', 12));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0003 PlanMatrix.test:127 assertEqual actual', run.succeeded())).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0003 PlanMatrix.test:127 assertEqual expected', 12));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0003 PlanMatrix.test:128 assertEqual actual', run.failed())).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0003 PlanMatrix.test:128 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0003 PlanMatrix.test:129 assertEqual actual', run.skipped())).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0003 PlanMatrix.test:129 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0003 PlanMatrix.test:130 assertEqual actual', run.totalElapsed())).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0003 PlanMatrix.test:130 assertEqual expected', 120));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0003 PlanMatrix.test:131 assertEqual actual', run.verdict())).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0003 PlanMatrix.test:131 assertEqual expected', PlanVerdict.PASS));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0003 PlanMatrix.test:132 assertEqual actual', verdictLabel(run.verdict()))).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0003 PlanMatrix.test:132 assertEqual expected', '全部完成'));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0003 PlanMatrix.test:133 assertTrue actual', run.headline().indexOf('成功 12 步') > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0003 PlanMatrix.test:134 assertEqual actual', run.retryables().length)).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0003 PlanMatrix.test:134 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0003 PlanMatrix.test:135 assertEqual actual', run.text().split('\n').length)).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0003 PlanMatrix.test:135 assertEqual expected', 13));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0003 PlanMatrix.test:136 assertEqual actual', run.outcomeOf('scan-files')?.status)).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0003 PlanMatrix.test:136 assertEqual expected', '成功'));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0003 PlanMatrix.test:137 assertEqual actual', run.outcomeOf('missing'))).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0003 PlanMatrix.test:137 assertEqual expected', undefined));
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
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0004 PlanMatrix.test:154 assertTrue actual', execute !== undefined)).assertTrue();
      if (execute !== undefined) {
        execute.status = '失败';
      }
      const run: PlanRun = evaluateRun(order, results);
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0004 PlanMatrix.test:159 assertEqual actual', run.verdict())).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0004 PlanMatrix.test:159 assertEqual expected', PlanVerdict.FAILED));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0004 PlanMatrix.test:160 assertEqual actual', run.failed())).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0004 PlanMatrix.test:160 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0004 PlanMatrix.test:161 assertEqual actual', run.skipped())).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0004 PlanMatrix.test:161 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0004 PlanMatrix.test:162 assertTrue actual', run.outcomeOf('verify-files')?.skipped())).assertTrue();
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0004 PlanMatrix.test:163 assertTrue actual', run.headline().indexOf('存在关键失败') === 0)).assertTrue();
      const retrySource: StepOutcome[] = outcomes(order);
      const scan: StepOutcome | undefined = retrySource.find((item: StepOutcome): boolean =>
        item.key === 'scan-files');
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0004 PlanMatrix.test:167 assertTrue actual', scan !== undefined)).assertTrue();
      if (scan !== undefined) {
        scan.status = '失败';
      }
      const retryRun: PlanRun = evaluateRun(order, retrySource);
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0004 PlanMatrix.test:172 assertEqual actual', retryRun.retryables().length)).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0004 PlanMatrix.test:172 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0004 PlanMatrix.test:173 assertEqual actual', retryRun.retryables()[0])).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0004 PlanMatrix.test:173 assertEqual expected', 'scan-files'));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0004 PlanMatrix.test:174 assertEqual actual', retryRun.verdict())).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0004 PlanMatrix.test:174 assertEqual expected', PlanVerdict.FAILED));
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
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0005 PlanMatrix.test:189 assertEqual actual', partial.succeeded())).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0005 PlanMatrix.test:189 assertEqual expected', 6));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0005 PlanMatrix.test:190 assertEqual actual', partial.skipped())).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0005 PlanMatrix.test:190 assertEqual expected', 6));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0005 PlanMatrix.test:191 assertEqual actual', partial.verdict())).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0005 PlanMatrix.test:191 assertEqual expected', PlanVerdict.PARTIAL));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0005 PlanMatrix.test:192 assertEqual actual', verdictLabel(partial.verdict()))).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0005 PlanMatrix.test:192 assertEqual expected', '部分完成'));
      const empty: PlanRun = evaluateRun([], []);
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0005 PlanMatrix.test:194 assertEqual actual', empty.verdict())).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0005 PlanMatrix.test:194 assertEqual expected', PlanVerdict.BLOCKED));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0005 PlanMatrix.test:195 assertEqual actual', verdictLabel(empty.verdict()))).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0005 PlanMatrix.test:195 assertEqual expected', '被阻塞'));
      const pending: StepOutcome = new StepOutcome('scan-files', '待执行');
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0005 PlanMatrix.test:197 assertTrue actual', pending.pending())).assertTrue();
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0005 PlanMatrix.test:198 assertFalse actual', pending.succeeded())).assertFalse();
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0005 PlanMatrix.test:199 assertTrue actual', pending.text().indexOf('scan-files') === 0)).assertTrue();
      const issue: PlanIssue = new PlanIssue('scan-files', '依赖不存在');
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0005 PlanMatrix.test:201 assertEqual actual', issue.text())).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrix_0005 PlanMatrix.test:201 assertEqual expected', 'scan-files：依赖不存在'));
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
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0001 PlanMatrix.test:216 assertEqual actual', TIER_BOUNDS.length)).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrix_0001 PlanMatrix.test:216 assertEqual expected', 5));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0001 PlanMatrix.test:217 assertEqual actual', profileLines().length)).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrix_0001 PlanMatrix.test:217 assertEqual expected', 5));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0001 PlanMatrix.test:218 assertEqual actual', classifyLoad(new Workload(0, 0, 0)))).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrix_0001 PlanMatrix.test:218 assertEqual expected', LoadTier.IDLE));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0001 PlanMatrix.test:219 assertEqual actual', classifyLoad(new Workload(50, 1048576, 4)))).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrix_0001 PlanMatrix.test:219 assertEqual expected', LoadTier.LIGHT));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0001 PlanMatrix.test:220 assertEqual actual', classifyLoad(new Workload(500, 33554432, 12)))).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrix_0001 PlanMatrix.test:220 assertEqual expected', LoadTier.NORMAL));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0001 PlanMatrix.test:221 assertEqual actual', classifyLoad(new Workload(5000, 268435456, 32)))).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrix_0001 PlanMatrix.test:221 assertEqual expected', LoadTier.HEAVY));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0001 PlanMatrix.test:222 assertEqual actual', classifyLoad(new Workload(6000, 268435457, 33)))).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrix_0001 PlanMatrix.test:222 assertEqual expected', LoadTier.EXTREME));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0001 PlanMatrix.test:223 assertEqual actual', tierLabel(LoadTier.EXTREME))).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrix_0001 PlanMatrix.test:223 assertEqual expected', '超重载'));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0001 PlanMatrix.test:224 assertTrue actual', tierOrder(LoadTier.HEAVY) > tierOrder(LoadTier.LIGHT))).assertTrue();
      const workload: Workload = new Workload(100, 4096, 6);
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0001 PlanMatrix.test:226 assertEqual actual', workload.averageBytes())).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrix_0001 PlanMatrix.test:226 assertEqual expected', 41));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0001 PlanMatrix.test:227 assertFalse actual', workload.empty())).assertFalse();
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0001 PlanMatrix.test:228 assertTrue actual', new Workload(0, 0, 0).empty())).assertTrue();
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0001 PlanMatrix.test:229 assertTrue actual', workload.text().indexOf('100 个文件') === 0)).assertTrue();
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
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0002 PlanMatrix.test:243 assertEqual actual', audit.findings.length)).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrix_0002 PlanMatrix.test:243 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0002 PlanMatrix.test:244 assertTrue actual', audit.ok)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0002 PlanMatrix.test:245 assertEqual actual', audit.summary())).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrix_0002 PlanMatrix.test:245 assertEqual expected', '负载档位表自洽'));
      const tiers: LoadTier[] = [LoadTier.IDLE, LoadTier.LIGHT, LoadTier.NORMAL, LoadTier.HEAVY,
        LoadTier.EXTREME];
      tiers.forEach((tier: LoadTier): void => {
        expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0002 PlanMatrix.test:249 assertTrue actual', recommendedConcurrency(tier) > 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0002 PlanMatrix.test:250 assertTrue actual', recommendedTimeout(tier) > 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0002 PlanMatrix.test:251 assertTrue actual', recommendedBatch(tier) >= 0)).assertTrue();
      });
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0002 PlanMatrix.test:253 assertEqual actual', recommendedConcurrency(LoadTier.LIGHT))).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrix_0002 PlanMatrix.test:253 assertEqual expected', 4));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0002 PlanMatrix.test:254 assertEqual actual', recommendedConcurrency(LoadTier.HEAVY))).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrix_0002 PlanMatrix.test:254 assertEqual expected', 4));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0002 PlanMatrix.test:255 assertEqual actual', recommendedTimeout(LoadTier.HEAVY))).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrix_0002 PlanMatrix.test:255 assertEqual expected', 15000));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0002 PlanMatrix.test:256 assertTrue actual', recommendedTimeout(LoadTier.EXTREME) > recommendedTimeout(LoadTier.NORMAL))).assertTrue();
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
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0003 PlanMatrix.test:271 assertEqual actual', plan.tier)).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrix_0003 PlanMatrix.test:271 assertEqual expected', LoadTier.NORMAL));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0003 PlanMatrix.test:272 assertEqual actual', plan.batchSize)).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrix_0003 PlanMatrix.test:272 assertEqual expected', 64));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0003 PlanMatrix.test:273 assertEqual actual', plan.concurrency)).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrix_0003 PlanMatrix.test:273 assertEqual expected', 6));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0003 PlanMatrix.test:274 assertEqual actual', plan.batchCount)).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrix_0003 PlanMatrix.test:274 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0003 PlanMatrix.test:275 assertFalse actual', plan.trivial())).assertFalse();
      const ranges = batchRanges(plan, 100, 8);
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0003 PlanMatrix.test:277 assertEqual actual', ranges.length)).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrix_0003 PlanMatrix.test:277 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0003 PlanMatrix.test:278 assertEqual actual', ranges[0].start)).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrix_0003 PlanMatrix.test:278 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0003 PlanMatrix.test:279 assertEqual actual', ranges[0].end)).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrix_0003 PlanMatrix.test:279 assertEqual expected', 64));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0003 PlanMatrix.test:280 assertEqual actual', ranges[0].size())).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrix_0003 PlanMatrix.test:280 assertEqual expected', 64));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0003 PlanMatrix.test:281 assertEqual actual', ranges[1].end)).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrix_0003 PlanMatrix.test:281 assertEqual expected', 100));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0003 PlanMatrix.test:282 assertEqual actual', ranges[1].size())).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrix_0003 PlanMatrix.test:282 assertEqual expected', 36));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0003 PlanMatrix.test:283 assertTrue actual', ranges[0].text().indexOf('第 1 批') === 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0003 PlanMatrix.test:284 assertEqual actual', batchRanges(plan, 0, 8).length)).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrix_0003 PlanMatrix.test:284 assertEqual expected', 0));
      const emptyPlan = planBatches(new Workload(0, 0, 0));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0003 PlanMatrix.test:286 assertEqual actual', emptyPlan.batchSize)).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrix_0003 PlanMatrix.test:286 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0003 PlanMatrix.test:287 assertEqual actual', emptyPlan.batchCount)).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrix_0003 PlanMatrix.test:287 assertEqual expected', 0));
      const conclusion: ProfileConclusion = profileOf(workload);
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0003 PlanMatrix.test:289 assertFalse actual', conclusion.needsDryRun())).assertFalse();
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0003 PlanMatrix.test:290 assertTrue actual', conclusion.needsProgress())).assertTrue();
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0003 PlanMatrix.test:291 assertTrue actual', profileOf(new Workload(6000, 0, 1)).needsDryRun())).assertTrue();
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrix_0003 PlanMatrix.test:292 assertTrue actual', conclusion.text().indexOf('100 个文件') === 0)).assertTrue();
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
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0001 PlanMatrix.test:307 assertEqual actual', LAUNCH_GROUPS.length)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0001 PlanMatrix.test:307 assertEqual expected', 5));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0001 PlanMatrix.test:308 assertEqual actual', groupKeys().length)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0001 PlanMatrix.test:308 assertEqual expected', 5));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0001 PlanMatrix.test:309 assertEqual actual', budgetLines().length)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0001 PlanMatrix.test:309 assertEqual expected', 5));
      const audit = auditBudgets();
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0001 PlanMatrix.test:311 assertTrue actual', audit.ok)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0001 PlanMatrix.test:312 assertEqual actual', audit.summary())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0001 PlanMatrix.test:312 assertEqual expected', '启动预算表自洽'));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0001 PlanMatrix.test:313 assertEqual actual', groupLabel('cold'))).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0001 PlanMatrix.test:313 assertEqual expected', '冷启动'));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0001 PlanMatrix.test:314 assertEqual actual', groupLabel('missing'))).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0001 PlanMatrix.test:314 assertEqual expected', 'missing'));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0001 PlanMatrix.test:315 assertEqual actual', groupOf('hot')?.budgetMs)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0001 PlanMatrix.test:315 assertEqual expected', 400));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0001 PlanMatrix.test:316 assertEqual actual', groupOf('missing'))).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0001 PlanMatrix.test:316 assertEqual expected', undefined));
      LAUNCH_GROUPS.forEach((group): void => {
        expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0001 PlanMatrix.test:318 assertTrue actual', group.budgetMs > 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0001 PlanMatrix.test:319 assertTrue actual', group.text().indexOf(group.key) === 0)).assertTrue();
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
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0002 PlanMatrix.test:333 assertEqual actual', quantileOf([], 50))).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0002 PlanMatrix.test:333 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0002 PlanMatrix.test:334 assertEqual actual', quantileOf([10], 90))).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0002 PlanMatrix.test:334 assertEqual expected', 10));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0002 PlanMatrix.test:335 assertEqual actual', quantileOf([1000, 1100, 1200], 50))).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0002 PlanMatrix.test:335 assertEqual expected', 1100));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0002 PlanMatrix.test:336 assertEqual actual', quantileOf([1000, 1100, 1200], 90))).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0002 PlanMatrix.test:336 assertEqual expected', 1180));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0002 PlanMatrix.test:337 assertEqual actual', quantileOf([1000, 1100], 90))).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0002 PlanMatrix.test:337 assertEqual expected', 1090));
      const samples: LaunchSample[] = coldSamples([1000, 1100, 1200]);
      const stats: GroupStats = statsFor(samples, 'cold');
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0002 PlanMatrix.test:340 assertEqual actual', stats.count)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0002 PlanMatrix.test:340 assertEqual expected', 3));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0002 PlanMatrix.test:341 assertEqual actual', stats.p50)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0002 PlanMatrix.test:341 assertEqual expected', 1100));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0002 PlanMatrix.test:342 assertEqual actual', stats.worst)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0002 PlanMatrix.test:342 assertEqual expected', 1200));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0002 PlanMatrix.test:343 assertEqual actual', stats.mean)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0002 PlanMatrix.test:343 assertEqual expected', 1100));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0002 PlanMatrix.test:344 assertTrue actual', stats.text().indexOf('冷启动') === 0)).assertTrue();
      const empty: GroupStats = statsFor(samples, 'hot');
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0002 PlanMatrix.test:346 assertEqual actual', empty.count)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0002 PlanMatrix.test:346 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0002 PlanMatrix.test:347 assertEqual actual', empty.p50)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0002 PlanMatrix.test:347 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0002 PlanMatrix.test:348 assertEqual actual', allStats(samples).length)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0002 PlanMatrix.test:348 assertEqual expected', 5));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0002 PlanMatrix.test:349 assertEqual actual', allStats(samples)[0].count)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0002 PlanMatrix.test:349 assertEqual expected', 3));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0002 PlanMatrix.test:350 assertEqual actual', samples[0].device)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0002 PlanMatrix.test:350 assertEqual expected', 'unit-test'));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0002 PlanMatrix.test:351 assertEqual actual', samples[0].contentMs)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0002 PlanMatrix.test:351 assertEqual expected', 1000));
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
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0003 PlanMatrix.test:369 assertEqual actual', report.results.length)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0003 PlanMatrix.test:369 assertEqual expected', 5));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0003 PlanMatrix.test:370 assertEqual actual', report.measured())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0003 PlanMatrix.test:370 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0003 PlanMatrix.test:371 assertEqual actual', report.passed())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0003 PlanMatrix.test:371 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0003 PlanMatrix.test:372 assertEqual actual', report.failed())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0003 PlanMatrix.test:372 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0003 PlanMatrix.test:373 assertEqual actual', report.passRate())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0003 PlanMatrix.test:373 assertEqual expected', 50));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0003 PlanMatrix.test:374 assertEqual actual', report.headline())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0003 PlanMatrix.test:374 assertEqual expected', '1 组超出预算'));
      const failures = report.failures();
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0003 PlanMatrix.test:376 assertEqual actual', failures.length)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0003 PlanMatrix.test:376 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0003 PlanMatrix.test:377 assertEqual actual', failures[0].key)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0003 PlanMatrix.test:377 assertEqual expected', 'hot'));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0003 PlanMatrix.test:378 assertEqual actual', failures[0].overshoot())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0003 PlanMatrix.test:378 assertEqual expected', 190));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0003 PlanMatrix.test:379 assertTrue actual', failures[0].text().indexOf('超出') > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0003 PlanMatrix.test:380 assertTrue actual', report.text().indexOf('启动预算') === 0)).assertTrue();
      const emptyReport: BudgetReport = evaluateBudgets([]);
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0003 PlanMatrix.test:382 assertEqual actual', emptyReport.headline())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0003 PlanMatrix.test:382 assertEqual expected', '暂无启动样本'));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0003 PlanMatrix.test:383 assertEqual actual', emptyReport.passRate())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0003 PlanMatrix.test:383 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0003 PlanMatrix.test:384 assertTrue actual', emptyReport.results[0].text().indexOf('暂无样本') > 0)).assertTrue();
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
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0004 PlanMatrix.test:406 assertEqual actual', report.results.length)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0004 PlanMatrix.test:406 assertEqual expected', 5));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0004 PlanMatrix.test:407 assertEqual actual', report.headline())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0004 PlanMatrix.test:407 assertEqual expected', '1 组出现回归'));
      const regressed = report.regressed();
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0004 PlanMatrix.test:409 assertEqual actual', regressed.length)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0004 PlanMatrix.test:409 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0004 PlanMatrix.test:410 assertEqual actual', regressed[0].key)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0004 PlanMatrix.test:410 assertEqual expected', 'hot'));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0004 PlanMatrix.test:411 assertEqual actual', regressed[0].verdict)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0004 PlanMatrix.test:411 assertEqual expected', RegressionVerdict.REGRESSED));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0004 PlanMatrix.test:412 assertEqual actual', regressed[0].changePercent())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0004 PlanMatrix.test:412 assertEqual expected', 50.8));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0004 PlanMatrix.test:413 assertTrue actual', regressed[0].text().indexOf('热启动') === 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0004 PlanMatrix.test:414 assertEqual actual', report.results[0].verdict)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0004 PlanMatrix.test:414 assertEqual expected', RegressionVerdict.STABLE));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0004 PlanMatrix.test:415 assertEqual actual', report.results[3].verdict)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0004 PlanMatrix.test:415 assertEqual expected', RegressionVerdict.UNKNOWN));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0004 PlanMatrix.test:416 assertEqual actual', regressionLabel(RegressionVerdict.IMPROVED))).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0004 PlanMatrix.test:416 assertEqual expected', '变快'));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0004 PlanMatrix.test:417 assertEqual actual', regressionLabel(RegressionVerdict.UNKNOWN))).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0004 PlanMatrix.test:417 assertEqual expected', '无法比较'));
      const same = compareLaunches(before, before);
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0004 PlanMatrix.test:419 assertEqual actual', same.regressed().length)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0004 PlanMatrix.test:419 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0004 PlanMatrix.test:420 assertEqual actual', same.headline())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0004 PlanMatrix.test:420 assertEqual expected', '没有回归'));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0004 PlanMatrix.test:421 assertEqual actual', compareLaunches([], []).headline())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetMatrix_0004 PlanMatrix.test:421 assertEqual expected', '没有回归'));
    });
  });
}
