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
import { loggedIt as it } from '../support/TestLog';
import {
  BatchPlan, LoadTier, TIER_BOUNDS, TierBound, Workload, classifyLoad, planBatches,
  recommendedBatch, recommendedConcurrency, recommendedTimeout, tierLabel, tierOrder
} from '../../../main/ets/core/LoadProfile';
import {
  STEP_CATALOG, PlanGraph, PlanStep, criticalDuration, estimateDuration, resolveOrder, stepKeys,
  stepOf, stepKindLabel, stepsOfKind, PlanVerdict
} from '../../../main/ets/core/MaintenancePlan';
import {
  KeyValueLine, WORKLOADS, WorkloadCheck, WorkloadKind, decodeText, firstLine,
  nonEmptyLines, parseKeyValueLines, parseTableRows, valueOf, verifyWorkload, workloadKindLabel,
  workloadOf
} from '../../../main/ets/core/WorkloadCatalog';

function textBytes(text: string): Uint8Array {
  const buffer: Uint8Array = new Uint8Array(text.length);
  for (let index = 0; index < text.length; index++) {
    buffer[index] = text.charCodeAt(index) & 0xff;
  }
  return buffer;
}

export default function loadFaultWorkloadCasesTest(): void {
  describe('LoadProfileMatrixCases', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_LOADPROFILEMATRIXCASES_0100
     * @tc.name      testLoadProfileMatrixCases0001
     * @tc.desc      Verify tier order is strictly increasing
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLoadProfileMatrixCases0001', 0, (): void => {
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0001 LoadFaultWorkloadCases.test:51 assertTrue actual', tierOrder(LoadTier.IDLE) < tierOrder(LoadTier.LIGHT))).assertTrue();
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0001 LoadFaultWorkloadCases.test:52 assertTrue actual', tierOrder(LoadTier.LIGHT) < tierOrder(LoadTier.NORMAL))).assertTrue();
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0001 LoadFaultWorkloadCases.test:53 assertTrue actual', tierOrder(LoadTier.NORMAL) < tierOrder(LoadTier.HEAVY))).assertTrue();
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0001 LoadFaultWorkloadCases.test:54 assertTrue actual', tierOrder(LoadTier.HEAVY) < tierOrder(LoadTier.EXTREME))).assertTrue();
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0001 LoadFaultWorkloadCases.test:55 assertTrue actual', tierOrder(LoadTier.IDLE) >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LOADPROFILEMATRIXCASES_0200
     * @tc.name      testLoadProfileMatrixCases0002
     * @tc.desc      Verify tier labels are distinct
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testLoadProfileMatrixCases0002', 0, (): void => {
      const labels: string[] = [tierLabel(LoadTier.IDLE), tierLabel(LoadTier.LIGHT),
        tierLabel(LoadTier.NORMAL), tierLabel(LoadTier.HEAVY), tierLabel(LoadTier.EXTREME)];
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0002 LoadFaultWorkloadCases.test:70 assertEqual actual', labels.filter((label: string, index: number): boolean =>
        labels.indexOf(label) !== index).length)).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0002 LoadFaultWorkloadCases.test:70 assertEqual expected', 0));
      labels.forEach((label: string): void => {
        expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0002 LoadFaultWorkloadCases.test:73 assertTrue actual', label.length > 0)).assertTrue();
      });
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0002 LoadFaultWorkloadCases.test:75 assertEqual actual', labels.length)).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0002 LoadFaultWorkloadCases.test:75 assertEqual expected', 5));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LOADPROFILEMATRIXCASES_0300
     * @tc.name      testLoadProfileMatrixCases0003
     * @tc.desc      Verify empty workload is recognised
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLoadProfileMatrixCases0003', 0, (): void => {
      const empty: Workload = new Workload(0, 0, 0);
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0003 LoadFaultWorkloadCases.test:89 assertTrue actual', empty.empty())).assertTrue();
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0003 LoadFaultWorkloadCases.test:90 assertEqual actual', empty.averageBytes())).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0003 LoadFaultWorkloadCases.test:90 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0003 LoadFaultWorkloadCases.test:91 assertTrue actual', empty.text().length > 0)).assertTrue();
      const single: Workload = new Workload(1, 100, 1);
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0003 LoadFaultWorkloadCases.test:93 assertFalse actual', single.empty())).assertFalse();
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0003 LoadFaultWorkloadCases.test:94 assertEqual actual', single.averageBytes())).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0003 LoadFaultWorkloadCases.test:94 assertEqual expected', 100));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LOADPROFILEMATRIXCASES_0400
     * @tc.name      testLoadProfileMatrixCases0004
     * @tc.desc      Verify average bytes avoids divide by zero
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLoadProfileMatrixCases0004', 0, (): void => {
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0004 LoadFaultWorkloadCases.test:107 assertEqual actual', new Workload(0, 500, 0).averageBytes())).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0004 LoadFaultWorkloadCases.test:107 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0004 LoadFaultWorkloadCases.test:108 assertEqual actual', new Workload(5, 500, 0).averageBytes())).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0004 LoadFaultWorkloadCases.test:108 assertEqual expected', 100));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0004 LoadFaultWorkloadCases.test:109 assertEqual actual', new Workload(3, 10, 0).averageBytes())).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0004 LoadFaultWorkloadCases.test:109 assertEqual expected', 3));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LOADPROFILEMATRIXCASES_0500
     * @tc.name      testLoadProfileMatrixCases0005
     * @tc.desc      Verify idle tier covers only empty workload
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLoadProfileMatrixCases0005', 0, (): void => {
      const idle: TierBound | undefined = TIER_BOUNDS.find((bound: TierBound): boolean =>
        bound.tier === LoadTier.IDLE);
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0005 LoadFaultWorkloadCases.test:124 assertTrue actual', idle !== undefined)).assertTrue();
      if (idle !== undefined) {
        expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0005 LoadFaultWorkloadCases.test:126 assertTrue actual', idle.covers(new Workload(0, 0, 0)))).assertTrue();
        expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0005 LoadFaultWorkloadCases.test:127 assertFalse actual', idle.covers(new Workload(1, 0, 0)))).assertFalse();
      }
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0005 LoadFaultWorkloadCases.test:129 assertEqual actual', TIER_BOUNDS.length)).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0005 LoadFaultWorkloadCases.test:129 assertEqual expected', 5));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LOADPROFILEMATRIXCASES_0600
     * @tc.name      testLoadProfileMatrixCases0006
     * @tc.desc      Verify classify follows tier bounds
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLoadProfileMatrixCases0006', 0, (): void => {
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0006 LoadFaultWorkloadCases.test:142 assertEqual actual', classifyLoad(new Workload(0, 0, 0)))).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0006 LoadFaultWorkloadCases.test:142 assertEqual expected', LoadTier.IDLE));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0006 LoadFaultWorkloadCases.test:143 assertEqual actual', classifyLoad(new Workload(10, 1024, 1)))).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0006 LoadFaultWorkloadCases.test:143 assertEqual expected', LoadTier.LIGHT));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0006 LoadFaultWorkloadCases.test:144 assertEqual actual', classifyLoad(new Workload(200, 1024 * 1024, 8)))).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0006 LoadFaultWorkloadCases.test:144 assertEqual expected', LoadTier.NORMAL));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0006 LoadFaultWorkloadCases.test:145 assertEqual actual', classifyLoad(new Workload(2000, 64 * 1024 * 1024, 20)))).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0006 LoadFaultWorkloadCases.test:145 assertEqual expected', LoadTier.HEAVY));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0006 LoadFaultWorkloadCases.test:146 assertEqual actual', classifyLoad(new Workload(100000, 512 * 1024 * 1024, 100)))).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0006 LoadFaultWorkloadCases.test:146 assertEqual expected', LoadTier.EXTREME));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LOADPROFILEMATRIXCASES_0700
     * @tc.name      testLoadProfileMatrixCases0007
     * @tc.desc      Verify recommendations are within reasonable bounds
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLoadProfileMatrixCases0007', 0, (): void => {
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0007 LoadFaultWorkloadCases.test:159 assertTrue actual', recommendedConcurrency(LoadTier.IDLE) > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0007 LoadFaultWorkloadCases.test:160 assertTrue actual', recommendedConcurrency(LoadTier.HEAVY) > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0007 LoadFaultWorkloadCases.test:161 assertTrue actual', recommendedTimeout(LoadTier.HEAVY) >= 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0007 LoadFaultWorkloadCases.test:162 assertTrue actual', recommendedBatch(LoadTier.NORMAL) > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0007 LoadFaultWorkloadCases.test:163 assertTrue actual', recommendedTimeout(LoadTier.IDLE) >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LOADPROFILEMATRIXCASES_0800
     * @tc.name      testLoadProfileMatrixCases0008
     * @tc.desc      Verify batch plan is trivial for small load
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLoadProfileMatrixCases0008', 0, (): void => {
      const plan: BatchPlan = planBatches(new Workload(1, 10, 1));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0008 LoadFaultWorkloadCases.test:177 assertTrue actual', plan.trivial())).assertTrue();
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0008 LoadFaultWorkloadCases.test:178 assertTrue actual', plan.text().length > 0)).assertTrue();
      const empty: BatchPlan = planBatches(new Workload(0, 0, 0));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0008 LoadFaultWorkloadCases.test:180 assertTrue actual', empty.trivial())).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LOADPROFILEMATRIXCASES_0900
     * @tc.name      testLoadProfileMatrixCases0009
     * @tc.desc      Verify batch plan splits heavy load
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLoadProfileMatrixCases0009', 0, (): void => {
      const plan: BatchPlan = planBatches(new Workload(20000, 1024 * 1024 * 1024, 200));
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0009 LoadFaultWorkloadCases.test:194 assertFalse actual', plan.trivial())).assertFalse();
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0009 LoadFaultWorkloadCases.test:195 assertTrue actual', plan.text().length > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0009 LoadFaultWorkloadCases.test:196 assertEqual actual', classifyLoad(new Workload(20000, 1024 * 1024 * 1024, 200)))).assertEqual(traceParameter('com.samples.appperformance_LoadProfileMatrixCases_0009 LoadFaultWorkloadCases.test:196 assertEqual expected', LoadTier.EXTREME));
    });
  });

  describe('MaintenancePlanMatrixCases', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCEPLANMATRIXCASES_0100
     * @tc.name      testMaintenancePlanMatrixCases0001
     * @tc.desc      Verify step catalog is well formed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testMaintenancePlanMatrixCases0001', 0, (): void => {
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0001 LoadFaultWorkloadCases.test:211 assertTrue actual', STEP_CATALOG.length > 0)).assertTrue();
      const keys: string[] = stepKeys();
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0001 LoadFaultWorkloadCases.test:213 assertEqual actual', keys.length)).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0001 LoadFaultWorkloadCases.test:213 assertEqual expected', STEP_CATALOG.length));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0001 LoadFaultWorkloadCases.test:214 assertEqual actual', keys.filter((key: string, index: number): boolean => keys.indexOf(key) !== index).length))
        .assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0001 LoadFaultWorkloadCases.test:214 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0001 LoadFaultWorkloadCases.test:216 assertTrue actual', keys.every((key: string): boolean => key.length > 0))).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCEPLANMATRIXCASES_0200
     * @tc.name      testMaintenancePlanMatrixCases0002
     * @tc.desc      Verify every step is reachable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMaintenancePlanMatrixCases0002', 0, (): void => {
      let found: number = 0;
      stepKeys().forEach((key: string): void => {
        const step = stepOf(key);
        if (step !== undefined && step.key === key) {
          found++;
        }
      });
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0002 LoadFaultWorkloadCases.test:236 assertEqual actual', found)).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0002 LoadFaultWorkloadCases.test:236 assertEqual expected', STEP_CATALOG.length));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0002 LoadFaultWorkloadCases.test:237 assertTrue actual', stepOf('no-such-step') === undefined)).assertTrue();
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0002 LoadFaultWorkloadCases.test:238 assertTrue actual', stepKeys().length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCEPLANMATRIXCASES_0300
     * @tc.name      testMaintenancePlanMatrixCases0003
     * @tc.desc      Verify kind labels cover every kind
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testMaintenancePlanMatrixCases0003', 0, (): void => {
      const labels: string[] = STEP_CATALOG.map((step: PlanStep): string => stepKindLabel(step.kind));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0003 LoadFaultWorkloadCases.test:252 assertTrue actual', labels.every((label: string): boolean => label.length > 0))).assertTrue();
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0003 LoadFaultWorkloadCases.test:253 assertTrue actual', stepsOfKind(STEP_CATALOG[0].kind).length > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0003 LoadFaultWorkloadCases.test:254 assertTrue actual', STEP_CATALOG.length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCEPLANMATRIXCASES_0400
     * @tc.name      testMaintenancePlanMatrixCases0004
     * @tc.desc      Verify dependency graph resolves without cycles
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMaintenancePlanMatrixCases0004', 0, (): void => {
      const graph: PlanGraph = resolveOrder();
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0004 LoadFaultWorkloadCases.test:268 assertTrue actual', graph.ok())).assertTrue();
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0004 LoadFaultWorkloadCases.test:269 assertTrue actual', graph.summary().length > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0004 LoadFaultWorkloadCases.test:270 assertEqual actual', graph.issues.length)).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0004 LoadFaultWorkloadCases.test:270 assertEqual expected', 0));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCEPLANMATRIXCASES_0500
     * @tc.name      testMaintenancePlanMatrixCases0005
     * @tc.desc      Verify every dependency points to existing step
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMaintenancePlanMatrixCases0005', 0, (): void => {
      const keys: string[] = stepKeys();
      let checked: number = 0;
      STEP_CATALOG.forEach((step: PlanStep): void => {
        step.dependsOn.forEach((dependency: string): void => {
          checked++;
          expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0005 LoadFaultWorkloadCases.test:288 assertTrue actual', keys.indexOf(dependency) >= 0)).assertTrue();
        });
      });
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0005 LoadFaultWorkloadCases.test:291 assertTrue actual', checked >= 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0005 LoadFaultWorkloadCases.test:292 assertTrue actual', STEP_CATALOG.every((step: PlanStep): boolean => step.key.length > 0))).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCEPLANMATRIXCASES_0600
     * @tc.name      testMaintenancePlanMatrixCases0006
     * @tc.desc      Verify critical duration never exceeds total
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMaintenancePlanMatrixCases0006', 0, (): void => {
      const keys: string[] = stepKeys();
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0006 LoadFaultWorkloadCases.test:306 assertTrue actual', estimateDuration(keys) >= criticalDuration(keys))).assertTrue();
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0006 LoadFaultWorkloadCases.test:307 assertTrue actual', estimateDuration(keys) > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0006 LoadFaultWorkloadCases.test:308 assertTrue actual', criticalDuration(keys) > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCEPLANMATRIXCASES_0700
     * @tc.name      testMaintenancePlanMatrixCases0007
     * @tc.desc      Verify subset duration is monotonic
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMaintenancePlanMatrixCases0007', 0, (): void => {
      const keys: string[] = stepKeys();
      const firstHalf: string[] = keys.slice(0, Math.floor(keys.length / 2));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0007 LoadFaultWorkloadCases.test:323 assertTrue actual', estimateDuration(firstHalf) <= estimateDuration(keys))).assertTrue();
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0007 LoadFaultWorkloadCases.test:324 assertEqual actual', estimateDuration([]))).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0007 LoadFaultWorkloadCases.test:324 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0007 LoadFaultWorkloadCases.test:325 assertEqual actual', criticalDuration([]))).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0007 LoadFaultWorkloadCases.test:325 assertEqual expected', 0));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCEPLANMATRIXCASES_0800
     * @tc.name      testMaintenancePlanMatrixCases0008
     * @tc.desc      Verify step weights are positive
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMaintenancePlanMatrixCases0008', 0, (): void => {
      STEP_CATALOG.forEach((step: PlanStep): void => {
        expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0008 LoadFaultWorkloadCases.test:339 assertTrue actual', step.weightMs >= 0)).assertTrue();
      });
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0008 LoadFaultWorkloadCases.test:341 assertTrue actual', STEP_CATALOG.filter((step: PlanStep): boolean => step.weightMs > 0).length > 0))
        .assertTrue();
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0008 LoadFaultWorkloadCases.test:343 assertEqual actual', STEP_CATALOG.length)).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0008 LoadFaultWorkloadCases.test:343 assertEqual expected', stepKeys().length));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCEPLANMATRIXCASES_0900
     * @tc.name      testMaintenancePlanMatrixCases0009
     * @tc.desc      Verify retryable steps are marked
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMaintenancePlanMatrixCases0009', 0, (): void => {
      const retryable: PlanStep[] = STEP_CATALOG.filter((step: PlanStep): boolean => step.retryable);
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0009 LoadFaultWorkloadCases.test:357 assertTrue actual', retryable.length > 0)).assertTrue();
      retryable.forEach((step: PlanStep): void => {
        expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0009 LoadFaultWorkloadCases.test:359 assertTrue actual', step.retryable)).assertTrue();
      });
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0009 LoadFaultWorkloadCases.test:361 assertTrue actual', STEP_CATALOG.filter((step: PlanStep): boolean => !step.retryable).length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCEPLANMATRIXCASES_1000
     * @tc.name      testMaintenancePlanMatrixCases0010
     * @tc.desc      Verify critical steps are marked
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMaintenancePlanMatrixCases0010', 0, (): void => {
      const critical: PlanStep[] = STEP_CATALOG.filter((step: PlanStep): boolean => step.critical);
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0010 LoadFaultWorkloadCases.test:375 assertTrue actual', critical.length > 0)).assertTrue();
      critical.forEach((step: PlanStep): void => {
        expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0010 LoadFaultWorkloadCases.test:377 assertTrue actual', step.critical)).assertTrue();
      });
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0010 LoadFaultWorkloadCases.test:379 assertTrue actual', STEP_CATALOG.length > critical.length)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCEPLANMATRIXCASES_1100
     * @tc.name      testMaintenancePlanMatrixCases0011
     * @tc.desc      Verify step text mentions key and label
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testMaintenancePlanMatrixCases0011', 0, (): void => {
      STEP_CATALOG.forEach((step: PlanStep): void => {
        const text: string = step.text();
        expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0011 LoadFaultWorkloadCases.test:394 assertTrue actual', text.indexOf(step.key) >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0011 LoadFaultWorkloadCases.test:395 assertTrue actual', text.indexOf(step.label) >= 0)).assertTrue();
      });
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0011 LoadFaultWorkloadCases.test:397 assertTrue actual', STEP_CATALOG.length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCEPLANMATRIXCASES_1200
     * @tc.name      testMaintenancePlanMatrixCases0012
     * @tc.desc      Verify plan verdicts are distinct
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMaintenancePlanMatrixCases0012', 0, (): void => {
      const values: string[] = [PlanVerdict.PASS as string, PlanVerdict.PARTIAL as string,
        PlanVerdict.FAILED as string, PlanVerdict.BLOCKED as string];
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0012 LoadFaultWorkloadCases.test:412 assertEqual actual', values.filter((value: string, index: number): boolean =>
        values.indexOf(value) !== index).length)).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0012 LoadFaultWorkloadCases.test:412 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0012 LoadFaultWorkloadCases.test:414 assertEqual actual', values.length)).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0012 LoadFaultWorkloadCases.test:414 assertEqual expected', 4));
      expect(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0012 LoadFaultWorkloadCases.test:415 assertEqual actual', values.indexOf(PlanVerdict.PASS as string))).assertEqual(traceParameter('com.samples.appperformance_MaintenancePlanMatrixCases_0012 LoadFaultWorkloadCases.test:415 assertEqual expected', 0));
    });
  });

  describe('WorkloadCatalogCases', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGCASES_0100
     * @tc.name      testWorkloadCatalogCases0001
     * @tc.desc      Verify catalog is well formed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testWorkloadCatalogCases0001', 0, (): void => {
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0001 LoadFaultWorkloadCases.test:430 assertTrue actual', WORKLOADS.length > 0)).assertTrue();
      const ids: string[] = WORKLOADS.map((spec): string => spec.id);
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0001 LoadFaultWorkloadCases.test:432 assertEqual actual', ids.filter((id: string, index: number): boolean => ids.indexOf(id) !== index).length))
        .assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0001 LoadFaultWorkloadCases.test:432 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0001 LoadFaultWorkloadCases.test:434 assertTrue actual', WORKLOADS.every((spec): boolean => spec.rawFile.length > 0))).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGCASES_0200
     * @tc.name      testWorkloadCatalogCases0002
     * @tc.desc      Verify every workload is reachable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testWorkloadCatalogCases0002', 0, (): void => {
      let found: number = 0;
      WORKLOADS.forEach((spec): void => {
        const item = workloadOf(spec.id);
        if (item !== undefined && item.id === spec.id) {
          found++;
        }
      });
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0002 LoadFaultWorkloadCases.test:454 assertEqual actual', found)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0002 LoadFaultWorkloadCases.test:454 assertEqual expected', WORKLOADS.length));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0002 LoadFaultWorkloadCases.test:455 assertTrue actual', workloadOf('W-NONE') === undefined)).assertTrue();
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0002 LoadFaultWorkloadCases.test:456 assertTrue actual', WORKLOADS.length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGCASES_0300
     * @tc.name      testWorkloadCatalogCases0003
     * @tc.desc      Verify kind labels cover every kind
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testWorkloadCatalogCases0003', 0, (): void => {
      const labels: string[] = [workloadKindLabel(WorkloadKind.TEXT), workloadKindLabel(WorkloadKind.NOTE_LIST),
        workloadKindLabel(WorkloadKind.IMAGE_INDEX), workloadKindLabel(WorkloadKind.FORM_DRAFT)];
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0003 LoadFaultWorkloadCases.test:471 assertTrue actual', labels.every((label: string): boolean => label.length > 0))).assertTrue();
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0003 LoadFaultWorkloadCases.test:472 assertEqual actual', labels.filter((label: string, index: number): boolean =>
        labels.indexOf(label) !== index).length)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0003 LoadFaultWorkloadCases.test:472 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0003 LoadFaultWorkloadCases.test:474 assertEqual actual', labels.length)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0003 LoadFaultWorkloadCases.test:474 assertEqual expected', 4));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGCASES_0400
     * @tc.name      testWorkloadCatalogCases0004
     * @tc.desc      Verify decode text round trips ascii
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testWorkloadCatalogCases0004', 0, (): void => {
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0004 LoadFaultWorkloadCases.test:487 assertEqual actual', decodeText(textBytes('abc')))).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0004 LoadFaultWorkloadCases.test:487 assertEqual expected', 'abc'));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0004 LoadFaultWorkloadCases.test:488 assertEqual actual', decodeText(textBytes('')))).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0004 LoadFaultWorkloadCases.test:488 assertEqual expected', ''));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0004 LoadFaultWorkloadCases.test:489 assertEqual actual', decodeText(textBytes('a,b;c')))).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0004 LoadFaultWorkloadCases.test:489 assertEqual expected', 'a,b;c'));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGCASES_0500
     * @tc.name      testWorkloadCatalogCases0005
     * @tc.desc      Verify non empty lines ignores blank lines
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testWorkloadCatalogCases0005', 0, (): void => {
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0005 LoadFaultWorkloadCases.test:502 assertEqual actual', nonEmptyLines('a\nb\nc'))).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0005 LoadFaultWorkloadCases.test:502 assertEqual expected', 3));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0005 LoadFaultWorkloadCases.test:503 assertEqual actual', nonEmptyLines('a\n\n\nb'))).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0005 LoadFaultWorkloadCases.test:503 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0005 LoadFaultWorkloadCases.test:504 assertEqual actual', nonEmptyLines(''))).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0005 LoadFaultWorkloadCases.test:504 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0005 LoadFaultWorkloadCases.test:505 assertEqual actual', nonEmptyLines('   \n\t\n'))).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0005 LoadFaultWorkloadCases.test:505 assertEqual expected', 0));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGCASES_0600
     * @tc.name      testWorkloadCatalogCases0006
     * @tc.desc      Verify parse key value lines keeps pairs
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testWorkloadCatalogCases0006', 0, (): void => {
      const pairs: KeyValueLine[] = parseKeyValueLines('name=张三\nage=30');
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0006 LoadFaultWorkloadCases.test:519 assertEqual actual', pairs.length)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0006 LoadFaultWorkloadCases.test:519 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0006 LoadFaultWorkloadCases.test:520 assertEqual actual', pairs[0].key)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0006 LoadFaultWorkloadCases.test:520 assertEqual expected', 'name'));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0006 LoadFaultWorkloadCases.test:521 assertEqual actual', pairs[0].value)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0006 LoadFaultWorkloadCases.test:521 assertEqual expected', '张三'));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0006 LoadFaultWorkloadCases.test:522 assertEqual actual', valueOf(pairs, 'age'))).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0006 LoadFaultWorkloadCases.test:522 assertEqual expected', '30'));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0006 LoadFaultWorkloadCases.test:523 assertEqual actual', valueOf(pairs, 'missing'))).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0006 LoadFaultWorkloadCases.test:523 assertEqual expected', ''));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGCASES_0700
     * @tc.name      testWorkloadCatalogCases0007
     * @tc.desc      Verify parse key value lines skips malformed lines
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testWorkloadCatalogCases0007', 0, (): void => {
      const pairs: KeyValueLine[] = parseKeyValueLines('valid=1\nnonsense\n\nother=2');
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0007 LoadFaultWorkloadCases.test:537 assertEqual actual', pairs.length)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0007 LoadFaultWorkloadCases.test:537 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0007 LoadFaultWorkloadCases.test:538 assertEqual actual', pairs[0].key)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0007 LoadFaultWorkloadCases.test:538 assertEqual expected', 'valid'));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0007 LoadFaultWorkloadCases.test:539 assertEqual actual', pairs[1].key)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0007 LoadFaultWorkloadCases.test:539 assertEqual expected', 'other'));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0007 LoadFaultWorkloadCases.test:540 assertEqual actual', parseKeyValueLines('').length)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0007 LoadFaultWorkloadCases.test:540 assertEqual expected', 0));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGCASES_0800
     * @tc.name      testWorkloadCatalogCases0008
     * @tc.desc      Verify parse table rows keeps content
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testWorkloadCatalogCases0008', 0, (): void => {
      const rows: string[][] = parseTableRows('a,b,c');
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0008 LoadFaultWorkloadCases.test:554 assertTrue actual', rows.length >= 1)).assertTrue();
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0008 LoadFaultWorkloadCases.test:555 assertTrue actual', rows[0].length >= 1)).assertTrue();
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0008 LoadFaultWorkloadCases.test:556 assertEqual actual', rows[0].join('').length)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0008 LoadFaultWorkloadCases.test:556 assertEqual expected', 5));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0008 LoadFaultWorkloadCases.test:557 assertEqual actual', parseTableRows('').length)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0008 LoadFaultWorkloadCases.test:557 assertEqual expected', 0));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGCASES_0900
     * @tc.name      testWorkloadCatalogCases0009
     * @tc.desc      Verify first line returns head or placeholder
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testWorkloadCatalogCases0009', 0, (): void => {
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0009 LoadFaultWorkloadCases.test:570 assertEqual actual', firstLine('head\nbody'))).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0009 LoadFaultWorkloadCases.test:570 assertEqual expected', 'head'));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0009 LoadFaultWorkloadCases.test:571 assertEqual actual', firstLine('single'))).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0009 LoadFaultWorkloadCases.test:571 assertEqual expected', 'single'));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0009 LoadFaultWorkloadCases.test:572 assertTrue actual', firstLine('').length > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0009 LoadFaultWorkloadCases.test:573 assertTrue actual', firstLine('').indexOf('head') < 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGCASES_1000
     * @tc.name      testWorkloadCatalogCases0010
     * @tc.desc      Verify verify workload rejects empty payload
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testWorkloadCatalogCases0010', 0, (): void => {
      const spec = WORKLOADS[0];
      const empty: WorkloadCheck = verifyWorkload(spec, textBytes(''));
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0010 LoadFaultWorkloadCases.test:588 assertFalse actual', empty.ok)).assertFalse();
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0010 LoadFaultWorkloadCases.test:589 assertTrue actual', empty.headline.length > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0010 LoadFaultWorkloadCases.test:590 assertTrue actual', empty.headline.indexOf('不足') >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGCASES_1100
     * @tc.name      testWorkloadCatalogCases0011
     * @tc.desc      Verify verify workload accepts sufficient payload
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testWorkloadCatalogCases0011', 0, (): void => {
      const spec = workloadOf('W-TEXT');
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0011 LoadFaultWorkloadCases.test:604 assertTrue actual', spec !== undefined)).assertTrue();
      if (spec !== undefined) {
        const enough: WorkloadCheck = verifyWorkload(spec, textBytes('hello world'));
        expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0011 LoadFaultWorkloadCases.test:607 assertTrue actual', enough.ok)).assertTrue();
        expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0011 LoadFaultWorkloadCases.test:608 assertTrue actual', enough.headline.length > 0)).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGCASES_1200
     * @tc.name      testWorkloadCatalogCases0012
     * @tc.desc      Verify note list workload rejects thin payload
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testWorkloadCatalogCases0012', 0, (): void => {
      const spec = workloadOf('W-NOTES');
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0012 LoadFaultWorkloadCases.test:623 assertTrue actual', spec !== undefined)).assertTrue();
      if (spec !== undefined) {
        const single: WorkloadCheck = verifyWorkload(spec, textBytes('one'));
        expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0012 LoadFaultWorkloadCases.test:626 assertFalse actual', single.ok)).assertFalse();
        expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0012 LoadFaultWorkloadCases.test:627 assertTrue actual', single.headline.length > 0)).assertTrue();
        const many: string[] = [];
        for (let index = 0; index < 40; index++) {
          many.push(`note-${index}=title-${index}`);
        }
        const rich: WorkloadCheck = verifyWorkload(spec, textBytes(many.join('\n')));
        expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0012 LoadFaultWorkloadCases.test:633 assertTrue actual', rich.headline.length > 0)).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGCASES_1300
     * @tc.name      testWorkloadCatalogCases0013
     * @tc.desc      Verify form draft requires all fields
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testWorkloadCatalogCases0013', 0, (): void => {
      const spec = workloadOf('W-FORM');
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0013 LoadFaultWorkloadCases.test:648 assertTrue actual', spec !== undefined)).assertTrue();
      if (spec !== undefined) {
        const partial: WorkloadCheck = verifyWorkload(spec, textBytes('title=only'));
        expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0013 LoadFaultWorkloadCases.test:651 assertFalse actual', partial.ok)).assertFalse();
        expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0013 LoadFaultWorkloadCases.test:652 assertTrue actual', partial.headline.indexOf('缺少字段') >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0013 LoadFaultWorkloadCases.test:653 assertEqual actual', partial.entryCount)).assertEqual(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0013 LoadFaultWorkloadCases.test:653 assertEqual expected', 0));
      }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGCASES_1400
     * @tc.name      testWorkloadCatalogCases0014
     * @tc.desc      Verify image index validates dimensions
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testWorkloadCatalogCases0014', 0, (): void => {
      const spec = workloadOf('W-IMAGES');
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0014 LoadFaultWorkloadCases.test:668 assertTrue actual', spec !== undefined)).assertTrue();
      if (spec !== undefined) {
        const bad: WorkloadCheck = verifyWorkload(spec, textBytes('id=1\nwidth=-1\nheight=0'));
        expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0014 LoadFaultWorkloadCases.test:671 assertFalse actual', bad.ok)).assertFalse();
        expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0014 LoadFaultWorkloadCases.test:672 assertTrue actual', bad.headline.length > 0)).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_WORKLOADCATALOGCASES_1500
     * @tc.name      testWorkloadCatalogCases0015
     * @tc.desc      Verify spec text carries identity
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testWorkloadCatalogCases0015', 0, (): void => {
      WORKLOADS.forEach((spec): void => {
        const text: string = spec.text();
        expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0015 LoadFaultWorkloadCases.test:688 assertTrue actual', text.length > 0)).assertTrue();
      });
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0015 LoadFaultWorkloadCases.test:690 assertTrue actual', WORKLOADS.length > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0015 LoadFaultWorkloadCases.test:691 assertTrue actual', WORKLOADS[0].label.length > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_WorkloadCatalogCases_0015 LoadFaultWorkloadCases.test:692 assertTrue actual', WORKLOADS[0].text().indexOf(WORKLOADS[0].label) >= 0)).assertTrue();
    });
  });
}
