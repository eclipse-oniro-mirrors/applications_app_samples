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
    const outcome: StepOutcome = new StepOutcome(key, 'success');
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
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0001 PerformanceRuleCases.test:71 assertEqual actual', step.kind)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceStepCases_0001 PerformanceRuleCases.test:71 assertEqual expected', StepKind.SCAN));
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0001 PerformanceRuleCases.test:72 assertEqual actual', step.dependsOn.length)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceStepCases_0001 PerformanceRuleCases.test:72 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0001 PerformanceRuleCases.test:73 assertEqual actual', step.weightMs)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceStepCases_0001 PerformanceRuleCases.test:73 assertEqual expected', 120));
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0001 PerformanceRuleCases.test:74 assertTrue actual', step.critical)).assertTrue();
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0001 PerformanceRuleCases.test:75 assertTrue actual', step.retryable)).assertTrue();
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0001 PerformanceRuleCases.test:76 assertEqual actual', stepIndex('scan-files'))).assertEqual(traceParameter('com.samples.appperformance_MaintenanceStepCases_0001 PerformanceRuleCases.test:76 assertEqual expected', 0));
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
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0002 PerformanceRuleCases.test:89 assertEqual actual', requireStep('scan-cache')?.weightMs)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceStepCases_0002 PerformanceRuleCases.test:89 assertEqual expected', 90));
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0002 PerformanceRuleCases.test:90 assertFalse actual', requireStep('scan-memory')?.critical)).assertFalse();
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0002 PerformanceRuleCases.test:91 assertEqual actual', requireStep('scan-memory')?.weightMs)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceStepCases_0002 PerformanceRuleCases.test:91 assertEqual expected', 60));
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0002 PerformanceRuleCases.test:92 assertEqual actual', stepIndex('scan-cache'))).assertEqual(traceParameter('com.samples.appperformance_MaintenanceStepCases_0002 PerformanceRuleCases.test:92 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0002 PerformanceRuleCases.test:93 assertEqual actual', stepIndex('scan-memory'))).assertEqual(traceParameter('com.samples.appperformance_MaintenanceStepCases_0002 PerformanceRuleCases.test:93 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0002 PerformanceRuleCases.test:94 assertTrue actual', stepIndex('scan-memory') < stepIndex('validate-files'))).assertTrue();
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
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0003 PerformanceRuleCases.test:109 assertEqual actual', files?.kind)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceStepCases_0003 PerformanceRuleCases.test:109 assertEqual expected', StepKind.VALIDATE));
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0003 PerformanceRuleCases.test:110 assertEqual actual', files?.dependsOn[0])).assertEqual(traceParameter('com.samples.appperformance_MaintenanceStepCases_0003 PerformanceRuleCases.test:110 assertEqual expected', 'scan-files'));
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0003 PerformanceRuleCases.test:111 assertEqual actual', cache?.dependsOn[0])).assertEqual(traceParameter('com.samples.appperformance_MaintenanceStepCases_0003 PerformanceRuleCases.test:111 assertEqual expected', 'scan-cache'));
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0003 PerformanceRuleCases.test:112 assertTrue actual', stepIndex('scan-files') < stepIndex('validate-files'))).assertTrue();
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0003 PerformanceRuleCases.test:113 assertTrue actual', stepIndex('scan-cache') < stepIndex('validate-cache'))).assertTrue();
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0003 PerformanceRuleCases.test:114 assertEqual actual', stepKindLabel(StepKind.VALIDATE))).assertEqual(traceParameter('com.samples.appperformance_MaintenanceStepCases_0003 PerformanceRuleCases.test:114 assertEqual expected', '校验'));
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
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0004 PerformanceRuleCases.test:128 assertEqual actual', prepare?.kind)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceStepCases_0004 PerformanceRuleCases.test:128 assertEqual expected', StepKind.PREPARE));
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0004 PerformanceRuleCases.test:129 assertEqual actual', prepare?.dependsOn.length)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceStepCases_0004 PerformanceRuleCases.test:129 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0004 PerformanceRuleCases.test:130 assertTrue actual', prepare?.dependsOn.indexOf('validate-files') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0004 PerformanceRuleCases.test:131 assertTrue actual', prepare?.dependsOn.indexOf('validate-cache') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0004 PerformanceRuleCases.test:132 assertTrue actual', stepIndex('validate-files') < stepIndex('prepare-budget'))).assertTrue();
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
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0005 PerformanceRuleCases.test:145 assertEqual actual', requireStep('execute-files')?.weightMs)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceStepCases_0005 PerformanceRuleCases.test:145 assertEqual expected', 400));
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0005 PerformanceRuleCases.test:146 assertEqual actual', requireStep('execute-cache')?.weightMs)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceStepCases_0005 PerformanceRuleCases.test:146 assertEqual expected', 320));
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0005 PerformanceRuleCases.test:147 assertFalse actual', requireStep('execute-memory')?.critical)).assertFalse();
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0005 PerformanceRuleCases.test:148 assertTrue actual', stepIndex('prepare-budget') < stepIndex('execute-files'))).assertTrue();
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0005 PerformanceRuleCases.test:149 assertTrue actual', stepIndex('prepare-budget') < stepIndex('execute-cache'))).assertTrue();
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0005 PerformanceRuleCases.test:150 assertEqual actual', stepsOfKind(StepKind.EXECUTE).length)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceStepCases_0005 PerformanceRuleCases.test:150 assertEqual expected', 3));
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
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0006 PerformanceRuleCases.test:163 assertEqual actual', requireStep('verify-files')?.kind)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceStepCases_0006 PerformanceRuleCases.test:163 assertEqual expected', StepKind.VERIFY));
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0006 PerformanceRuleCases.test:164 assertEqual actual', requireStep('verify-files')?.dependsOn[0])).assertEqual(traceParameter('com.samples.appperformance_MaintenanceStepCases_0006 PerformanceRuleCases.test:164 assertEqual expected', 'execute-files'));
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0006 PerformanceRuleCases.test:165 assertEqual actual', requireStep('verify-cache')?.dependsOn[0])).assertEqual(traceParameter('com.samples.appperformance_MaintenanceStepCases_0006 PerformanceRuleCases.test:165 assertEqual expected', 'execute-cache'));
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0006 PerformanceRuleCases.test:166 assertTrue actual', requireStep('verify-files')?.retryable)).assertTrue();
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0006 PerformanceRuleCases.test:167 assertTrue actual', stepIndex('execute-files') < stepIndex('verify-files'))).assertTrue();
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0006 PerformanceRuleCases.test:168 assertTrue actual', stepIndex('execute-cache') < stepIndex('verify-cache'))).assertTrue();
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
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0007 PerformanceRuleCases.test:182 assertEqual actual', cleanup?.kind)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceStepCases_0007 PerformanceRuleCases.test:182 assertEqual expected', StepKind.CLEANUP));
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0007 PerformanceRuleCases.test:183 assertFalse actual', cleanup?.critical)).assertFalse();
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0007 PerformanceRuleCases.test:184 assertEqual actual', cleanup?.weightMs)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceStepCases_0007 PerformanceRuleCases.test:184 assertEqual expected', 30));
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0007 PerformanceRuleCases.test:185 assertEqual actual', stepIndex('cleanup-report'))).assertEqual(traceParameter('com.samples.appperformance_MaintenanceStepCases_0007 PerformanceRuleCases.test:185 assertEqual expected', 11));
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0007 PerformanceRuleCases.test:186 assertEqual actual', stepKeys().length)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceStepCases_0007 PerformanceRuleCases.test:186 assertEqual expected', 12));
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
        expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0008 PerformanceRuleCases.test:202 assertTrue actual', position >= 0)).assertTrue();
        step.dependsOn.forEach((dep: string): void => {
          expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0008 PerformanceRuleCases.test:204 assertTrue actual', sequence.indexOf(dep) < position)).assertTrue();
        });
      });
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0008 PerformanceRuleCases.test:207 assertTrue actual', auditPlan().ok)).assertTrue();
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0008 PerformanceRuleCases.test:208 assertEqual actual', estimateDuration(sequence))).assertEqual(traceParameter('com.samples.appperformance_MaintenanceStepCases_0008 PerformanceRuleCases.test:208 assertEqual expected', 1550));
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0008 PerformanceRuleCases.test:209 assertEqual actual', criticalDuration(sequence))).assertEqual(traceParameter('com.samples.appperformance_MaintenanceStepCases_0008 PerformanceRuleCases.test:209 assertEqual expected', 1200));
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
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0009 PerformanceRuleCases.test:223 assertEqual actual', success.verdict())).assertEqual(traceParameter('com.samples.appperformance_MaintenanceStepCases_0009 PerformanceRuleCases.test:223 assertEqual expected', PlanVerdict.PASS));
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0009 PerformanceRuleCases.test:224 assertEqual actual', success.totalElapsed())).assertEqual(traceParameter('com.samples.appperformance_MaintenanceStepCases_0009 PerformanceRuleCases.test:224 assertEqual expected', 60));
      const partial = evaluateRun(order(), allSuccess().slice(0, 8));
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0009 PerformanceRuleCases.test:226 assertEqual actual', partial.verdict())).assertEqual(traceParameter('com.samples.appperformance_MaintenanceStepCases_0009 PerformanceRuleCases.test:226 assertEqual expected', PlanVerdict.PARTIAL));
      const failedResults: StepOutcome[] = allSuccess();
      const execute = failedResults.find((item): boolean => item.key === 'execute-cache');
      if (execute !== undefined) {
        execute.status = 'failed';
      }
      const failed = evaluateRun(order(), failedResults);
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0009 PerformanceRuleCases.test:233 assertEqual actual', failed.verdict())).assertEqual(traceParameter('com.samples.appperformance_MaintenanceStepCases_0009 PerformanceRuleCases.test:233 assertEqual expected', PlanVerdict.FAILED));
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0009 PerformanceRuleCases.test:234 assertEqual actual', verdictLabel(failed.verdict()))).assertEqual(traceParameter('com.samples.appperformance_MaintenanceStepCases_0009 PerformanceRuleCases.test:234 assertEqual expected', '存在关键失败'));
      expect(traceParameter('com.samples.appperformance_MaintenanceStepCases_0009 PerformanceRuleCases.test:235 assertEqual actual', evaluateRun([], []).verdict())).assertEqual(traceParameter('com.samples.appperformance_MaintenanceStepCases_0009 PerformanceRuleCases.test:235 assertEqual expected', PlanVerdict.BLOCKED));
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
      expect(traceParameter('com.samples.appperformance_LoadTierCases_0001 PerformanceRuleCases.test:250 assertEqual actual', classifyLoad(new Workload(0, 0, 0)))).assertEqual(traceParameter('com.samples.appperformance_LoadTierCases_0001 PerformanceRuleCases.test:250 assertEqual expected', LoadTier.IDLE));
      expect(traceParameter('com.samples.appperformance_LoadTierCases_0001 PerformanceRuleCases.test:251 assertEqual actual', recommendedBatch(LoadTier.IDLE))).assertEqual(traceParameter('com.samples.appperformance_LoadTierCases_0001 PerformanceRuleCases.test:251 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LoadTierCases_0001 PerformanceRuleCases.test:252 assertEqual actual', recommendedConcurrency(LoadTier.IDLE))).assertEqual(traceParameter('com.samples.appperformance_LoadTierCases_0001 PerformanceRuleCases.test:252 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_LoadTierCases_0001 PerformanceRuleCases.test:253 assertEqual actual', recommendedTimeout(LoadTier.IDLE))).assertEqual(traceParameter('com.samples.appperformance_LoadTierCases_0001 PerformanceRuleCases.test:253 assertEqual expected', 500));
      expect(traceParameter('com.samples.appperformance_LoadTierCases_0001 PerformanceRuleCases.test:254 assertEqual actual', planBatches(new Workload(0, 0, 0)).batchCount)).assertEqual(traceParameter('com.samples.appperformance_LoadTierCases_0001 PerformanceRuleCases.test:254 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LoadTierCases_0001 PerformanceRuleCases.test:255 assertEqual actual', tierLabel(LoadTier.IDLE))).assertEqual(traceParameter('com.samples.appperformance_LoadTierCases_0001 PerformanceRuleCases.test:255 assertEqual expected', '空载'));
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
      expect(traceParameter('com.samples.appperformance_LoadTierCases_0002 PerformanceRuleCases.test:268 assertEqual actual', classifyLoad(new Workload(1, 1, 1)))).assertEqual(traceParameter('com.samples.appperformance_LoadTierCases_0002 PerformanceRuleCases.test:268 assertEqual expected', LoadTier.LIGHT));
      expect(traceParameter('com.samples.appperformance_LoadTierCases_0002 PerformanceRuleCases.test:269 assertEqual actual', classifyLoad(new Workload(50, 1048576, 4)))).assertEqual(traceParameter('com.samples.appperformance_LoadTierCases_0002 PerformanceRuleCases.test:269 assertEqual expected', LoadTier.LIGHT));
      expect(traceParameter('com.samples.appperformance_LoadTierCases_0002 PerformanceRuleCases.test:270 assertEqual actual', classifyLoad(new Workload(51, 1048576, 4)))).assertEqual(traceParameter('com.samples.appperformance_LoadTierCases_0002 PerformanceRuleCases.test:270 assertEqual expected', LoadTier.NORMAL));
      expect(traceParameter('com.samples.appperformance_LoadTierCases_0002 PerformanceRuleCases.test:271 assertEqual actual', recommendedBatch(LoadTier.LIGHT))).assertEqual(traceParameter('com.samples.appperformance_LoadTierCases_0002 PerformanceRuleCases.test:271 assertEqual expected', 16));
      expect(traceParameter('com.samples.appperformance_LoadTierCases_0002 PerformanceRuleCases.test:272 assertEqual actual', recommendedConcurrency(LoadTier.LIGHT))).assertEqual(traceParameter('com.samples.appperformance_LoadTierCases_0002 PerformanceRuleCases.test:272 assertEqual expected', 4));
      expect(traceParameter('com.samples.appperformance_LoadTierCases_0002 PerformanceRuleCases.test:273 assertEqual actual', recommendedTimeout(LoadTier.LIGHT))).assertEqual(traceParameter('com.samples.appperformance_LoadTierCases_0002 PerformanceRuleCases.test:273 assertEqual expected', 2000));
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
      expect(traceParameter('com.samples.appperformance_LoadTierCases_0003 PerformanceRuleCases.test:286 assertEqual actual', classifyLoad(new Workload(500, 33554432, 12)))).assertEqual(traceParameter('com.samples.appperformance_LoadTierCases_0003 PerformanceRuleCases.test:286 assertEqual expected', LoadTier.NORMAL));
      expect(traceParameter('com.samples.appperformance_LoadTierCases_0003 PerformanceRuleCases.test:287 assertEqual actual', classifyLoad(new Workload(501, 33554432, 12)))).assertEqual(traceParameter('com.samples.appperformance_LoadTierCases_0003 PerformanceRuleCases.test:287 assertEqual expected', LoadTier.HEAVY));
      expect(traceParameter('com.samples.appperformance_LoadTierCases_0003 PerformanceRuleCases.test:288 assertEqual actual', recommendedBatch(LoadTier.NORMAL))).assertEqual(traceParameter('com.samples.appperformance_LoadTierCases_0003 PerformanceRuleCases.test:288 assertEqual expected', 64));
      expect(traceParameter('com.samples.appperformance_LoadTierCases_0003 PerformanceRuleCases.test:289 assertEqual actual', recommendedConcurrency(LoadTier.NORMAL))).assertEqual(traceParameter('com.samples.appperformance_LoadTierCases_0003 PerformanceRuleCases.test:289 assertEqual expected', 6));
      expect(traceParameter('com.samples.appperformance_LoadTierCases_0003 PerformanceRuleCases.test:290 assertEqual actual', recommendedTimeout(LoadTier.NORMAL))).assertEqual(traceParameter('com.samples.appperformance_LoadTierCases_0003 PerformanceRuleCases.test:290 assertEqual expected', 5000));
      expect(traceParameter('com.samples.appperformance_LoadTierCases_0003 PerformanceRuleCases.test:291 assertTrue actual', tierOrder(LoadTier.NORMAL) > tierOrder(LoadTier.LIGHT))).assertTrue();
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
      expect(traceParameter('com.samples.appperformance_LoadTierCases_0004 PerformanceRuleCases.test:304 assertEqual actual', classifyLoad(new Workload(5000, 268435456, 32)))).assertEqual(traceParameter('com.samples.appperformance_LoadTierCases_0004 PerformanceRuleCases.test:304 assertEqual expected', LoadTier.HEAVY));
      expect(traceParameter('com.samples.appperformance_LoadTierCases_0004 PerformanceRuleCases.test:305 assertEqual actual', classifyLoad(new Workload(5001, 268435456, 32)))).assertEqual(traceParameter('com.samples.appperformance_LoadTierCases_0004 PerformanceRuleCases.test:305 assertEqual expected', LoadTier.EXTREME));
      expect(traceParameter('com.samples.appperformance_LoadTierCases_0004 PerformanceRuleCases.test:306 assertEqual actual', recommendedBatch(LoadTier.HEAVY))).assertEqual(traceParameter('com.samples.appperformance_LoadTierCases_0004 PerformanceRuleCases.test:306 assertEqual expected', 128));
      expect(traceParameter('com.samples.appperformance_LoadTierCases_0004 PerformanceRuleCases.test:307 assertEqual actual', recommendedConcurrency(LoadTier.HEAVY))).assertEqual(traceParameter('com.samples.appperformance_LoadTierCases_0004 PerformanceRuleCases.test:307 assertEqual expected', 4));
      expect(traceParameter('com.samples.appperformance_LoadTierCases_0004 PerformanceRuleCases.test:308 assertEqual actual', recommendedTimeout(LoadTier.HEAVY))).assertEqual(traceParameter('com.samples.appperformance_LoadTierCases_0004 PerformanceRuleCases.test:308 assertEqual expected', 15000));
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
      expect(traceParameter('com.samples.appperformance_LoadTierCases_0005 PerformanceRuleCases.test:321 assertEqual actual', classifyLoad(new Workload(100000, 1, 1)))).assertEqual(traceParameter('com.samples.appperformance_LoadTierCases_0005 PerformanceRuleCases.test:321 assertEqual expected', LoadTier.EXTREME));
      expect(traceParameter('com.samples.appperformance_LoadTierCases_0005 PerformanceRuleCases.test:322 assertEqual actual', recommendedBatch(LoadTier.EXTREME))).assertEqual(traceParameter('com.samples.appperformance_LoadTierCases_0005 PerformanceRuleCases.test:322 assertEqual expected', 256));
      expect(traceParameter('com.samples.appperformance_LoadTierCases_0005 PerformanceRuleCases.test:323 assertEqual actual', recommendedConcurrency(LoadTier.EXTREME))).assertEqual(traceParameter('com.samples.appperformance_LoadTierCases_0005 PerformanceRuleCases.test:323 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_LoadTierCases_0005 PerformanceRuleCases.test:324 assertEqual actual', recommendedTimeout(LoadTier.EXTREME))).assertEqual(traceParameter('com.samples.appperformance_LoadTierCases_0005 PerformanceRuleCases.test:324 assertEqual expected', 30000));
      expect(traceParameter('com.samples.appperformance_LoadTierCases_0005 PerformanceRuleCases.test:325 assertEqual actual', tierLabel(LoadTier.EXTREME))).assertEqual(traceParameter('com.samples.appperformance_LoadTierCases_0005 PerformanceRuleCases.test:325 assertEqual expected', '超重载'));
      expect(traceParameter('com.samples.appperformance_LoadTierCases_0005 PerformanceRuleCases.test:326 assertTrue actual', auditProfile().ok)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LoadTierCases_0005 PerformanceRuleCases.test:327 assertEqual actual', TIER_BOUNDS.length)).assertEqual(traceParameter('com.samples.appperformance_LoadTierCases_0005 PerformanceRuleCases.test:327 assertEqual expected', 5));
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
      expect(traceParameter('com.samples.appperformance_LaunchGroupCases_0001 PerformanceRuleCases.test:342 assertEqual actual', groupOf('cold')?.budgetMs)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCases_0001 PerformanceRuleCases.test:342 assertEqual expected', 1200));
      expect(traceParameter('com.samples.appperformance_LaunchGroupCases_0001 PerformanceRuleCases.test:343 assertEqual actual', groupLabel('cold'))).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCases_0001 PerformanceRuleCases.test:343 assertEqual expected', '冷启动'));
      expect(traceParameter('com.samples.appperformance_LaunchGroupCases_0001 PerformanceRuleCases.test:344 assertEqual actual', groupKeys()[0])).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCases_0001 PerformanceRuleCases.test:344 assertEqual expected', 'cold'));
      expect(traceParameter('com.samples.appperformance_LaunchGroupCases_0001 PerformanceRuleCases.test:345 assertTrue actual', auditBudgets().ok)).assertTrue();
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
      expect(traceParameter('com.samples.appperformance_LaunchGroupCases_0002 PerformanceRuleCases.test:358 assertEqual actual', groupOf('warm')?.budgetMs)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCases_0002 PerformanceRuleCases.test:358 assertEqual expected', 800));
      expect(traceParameter('com.samples.appperformance_LaunchGroupCases_0002 PerformanceRuleCases.test:359 assertEqual actual', groupOf('hot')?.budgetMs)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCases_0002 PerformanceRuleCases.test:359 assertEqual expected', 400));
      expect(traceParameter('com.samples.appperformance_LaunchGroupCases_0002 PerformanceRuleCases.test:360 assertEqual actual', groupLabel('warm'))).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCases_0002 PerformanceRuleCases.test:360 assertEqual expected', '温启动'));
      expect(traceParameter('com.samples.appperformance_LaunchGroupCases_0002 PerformanceRuleCases.test:361 assertEqual actual', groupLabel('hot'))).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCases_0002 PerformanceRuleCases.test:361 assertEqual expected', '热启动'));
      expect(traceParameter('com.samples.appperformance_LaunchGroupCases_0002 PerformanceRuleCases.test:362 assertEqual actual', groupKeys().length)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCases_0002 PerformanceRuleCases.test:362 assertEqual expected', 5));
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
      expect(traceParameter('com.samples.appperformance_LaunchGroupCases_0003 PerformanceRuleCases.test:375 assertEqual actual', groupOf('firstFrame')?.budgetMs)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCases_0003 PerformanceRuleCases.test:375 assertEqual expected', 900));
      expect(traceParameter('com.samples.appperformance_LaunchGroupCases_0003 PerformanceRuleCases.test:376 assertEqual actual', groupOf('interactive')?.budgetMs)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCases_0003 PerformanceRuleCases.test:376 assertEqual expected', 1500));
      expect(traceParameter('com.samples.appperformance_LaunchGroupCases_0003 PerformanceRuleCases.test:377 assertEqual actual', groupLabel('firstFrame'))).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCases_0003 PerformanceRuleCases.test:377 assertEqual expected', '首帧'));
      expect(traceParameter('com.samples.appperformance_LaunchGroupCases_0003 PerformanceRuleCases.test:378 assertEqual actual', groupLabel('interactive'))).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCases_0003 PerformanceRuleCases.test:378 assertEqual expected', '可交互'));
      expect(traceParameter('com.samples.appperformance_LaunchGroupCases_0003 PerformanceRuleCases.test:379 assertEqual actual', LAUNCH_GROUPS.length)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCases_0003 PerformanceRuleCases.test:379 assertEqual expected', 5));
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
      expect(traceParameter('com.samples.appperformance_LaunchGroupCases_0004 PerformanceRuleCases.test:398 assertEqual actual', stats.count)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCases_0004 PerformanceRuleCases.test:398 assertEqual expected', 3));
      expect(traceParameter('com.samples.appperformance_LaunchGroupCases_0004 PerformanceRuleCases.test:399 assertEqual actual', stats.p50)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCases_0004 PerformanceRuleCases.test:399 assertEqual expected', 1200));
      expect(traceParameter('com.samples.appperformance_LaunchGroupCases_0004 PerformanceRuleCases.test:400 assertEqual actual', stats.p90)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCases_0004 PerformanceRuleCases.test:400 assertEqual expected', 1360));
      expect(traceParameter('com.samples.appperformance_LaunchGroupCases_0004 PerformanceRuleCases.test:401 assertEqual actual', stats.worst)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCases_0004 PerformanceRuleCases.test:401 assertEqual expected', 1400));
      expect(traceParameter('com.samples.appperformance_LaunchGroupCases_0004 PerformanceRuleCases.test:402 assertEqual actual', stats.mean)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCases_0004 PerformanceRuleCases.test:402 assertEqual expected', 1200));
      expect(traceParameter('com.samples.appperformance_LaunchGroupCases_0004 PerformanceRuleCases.test:403 assertEqual actual', quantileOf([], 50))).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCases_0004 PerformanceRuleCases.test:403 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LaunchGroupCases_0004 PerformanceRuleCases.test:404 assertEqual actual', allStats(samples).length)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCases_0004 PerformanceRuleCases.test:404 assertEqual expected', 5));
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
      expect(traceParameter('com.samples.appperformance_LaunchGroupCases_0005 PerformanceRuleCases.test:424 assertEqual actual', report.measured())).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCases_0005 PerformanceRuleCases.test:424 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_LaunchGroupCases_0005 PerformanceRuleCases.test:425 assertEqual actual', report.passed())).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCases_0005 PerformanceRuleCases.test:425 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_LaunchGroupCases_0005 PerformanceRuleCases.test:426 assertEqual actual', report.failed())).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCases_0005 PerformanceRuleCases.test:426 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_LaunchGroupCases_0005 PerformanceRuleCases.test:427 assertEqual actual', report.passRate())).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCases_0005 PerformanceRuleCases.test:427 assertEqual expected', 50));
      expect(traceParameter('com.samples.appperformance_LaunchGroupCases_0005 PerformanceRuleCases.test:428 assertEqual actual', report.failures()[0].key)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCases_0005 PerformanceRuleCases.test:428 assertEqual expected', 'hot'));
      expect(traceParameter('com.samples.appperformance_LaunchGroupCases_0005 PerformanceRuleCases.test:429 assertEqual actual', report.failures()[0].overshoot())).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCases_0005 PerformanceRuleCases.test:429 assertEqual expected', 190));
      expect(traceParameter('com.samples.appperformance_LaunchGroupCases_0005 PerformanceRuleCases.test:430 assertEqual actual', regressionLabel(RegressionVerdict.STABLE))).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCases_0005 PerformanceRuleCases.test:430 assertEqual expected', '持平'));
    });
  });
}
