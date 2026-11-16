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

import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { runIsolatedTrajectory, assertNoActiveWorkers, logSuite } from '../Shared/NBodyHarness';

export default function nBodyLargeRegression20Test(): void {
  describe('NBodyLargeRegression20Test', (): void => {
    beforeAll((): void => {
      logSuite('NBodyLargeRegression20Test', 'start');
    });
    beforeEach((): void => {
      assertNoActiveWorkers();
    });
    afterEach((): void => {
      assertNoActiveWorkers();
    });
    afterAll((): void => {
      logSuite('NBodyLargeRegression20Test', 'complete');
    });

    // @tc.number SUB_NBODY_NBODYLARGEREGRESSION20TEST_0100
    // @tc.name nBodyLargeRegression20Test001
    // @tc.desc Verify advance and energy for 112 steps at dt 0.0025 with large initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyLargeRegression20Test001', 0, async (): Promise<void> => {
      const steps: number = 112;
      const dt: number = 0.0025;
      const mode: string = 'large';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907440677227953;
      const expectedEnd: number = -0.169073609967235;
      const tolerance: number = 2e-11;
      const result = await runIsolatedTrajectory(steps, dt, mode);

      const actualSteps: number = result.steps;
      const actualDt: number = result.dt;
      const startError: number = Math.abs(result.initialEnergy - expectedStart);
      const middleError: number = Math.abs(result.middleEnergy - expectedMiddle);
      const endError: number = Math.abs(result.finalEnergy - expectedEnd);
      const readError: number = Math.abs(result.repeatedEnergy - result.finalEnergy);
      const finiteEnergy: boolean = isFinite(result.finalEnergy);
      const isolatedSession: number = result.requests;
      const startMatches: boolean = startError < tolerance;
      const middleMatches: boolean = middleError < tolerance;
      const endMatches: boolean = endError < tolerance;

      expect(actualSteps).assertEqual(steps);
      expect(actualDt).assertEqual(dt);
      expect(startMatches).assertTrue();
      expect(middleMatches).assertTrue();
      expect(endMatches).assertTrue();
      expect(readError).assertEqual(0);
      expect(finiteEnergy).assertTrue();
      expect(isolatedSession).assertEqual(1);
    });

    // @tc.number SUB_NBODY_NBODYLARGEREGRESSION20TEST_0200
    // @tc.name nBodyLargeRegression20Test002
    // @tc.desc Verify advance and energy for 113 steps at dt 0.0025 with large initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyLargeRegression20Test002', 0, async (): Promise<void> => {
      const steps: number = 113;
      const dt: number = 0.0025;
      const mode: string = 'large';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907440677227953;
      const expectedEnd: number = -0.16907359541579342;
      const tolerance: number = 2e-11;
      const result = await runIsolatedTrajectory(steps, dt, mode);

      const actualSteps: number = result.steps;
      const actualDt: number = result.dt;
      const startError: number = Math.abs(result.initialEnergy - expectedStart);
      const middleError: number = Math.abs(result.middleEnergy - expectedMiddle);
      const endError: number = Math.abs(result.finalEnergy - expectedEnd);
      const readError: number = Math.abs(result.repeatedEnergy - result.finalEnergy);
      const finiteEnergy: boolean = isFinite(result.finalEnergy);
      const isolatedSession: number = result.requests;
      const startMatches: boolean = startError < tolerance;
      const middleMatches: boolean = middleError < tolerance;
      const endMatches: boolean = endError < tolerance;

      expect(actualSteps).assertEqual(steps);
      expect(actualDt).assertEqual(dt);
      expect(startMatches).assertTrue();
      expect(middleMatches).assertTrue();
      expect(endMatches).assertTrue();
      expect(readError).assertEqual(0);
      expect(finiteEnergy).assertTrue();
      expect(isolatedSession).assertEqual(1);
    });

    // @tc.number SUB_NBODY_NBODYLARGEREGRESSION20TEST_0300
    // @tc.name nBodyLargeRegression20Test003
    // @tc.desc Verify advance and energy for 114 steps at dt 0.0025 with large initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyLargeRegression20Test003', 0, async (): Promise<void> => {
      const steps: number = 114;
      const dt: number = 0.0025;
      const mode: string = 'large';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.1690743928739424;
      const expectedEnd: number = -0.16907358085375393;
      const tolerance: number = 2e-11;
      const result = await runIsolatedTrajectory(steps, dt, mode);

      const actualSteps: number = result.steps;
      const actualDt: number = result.dt;
      const startError: number = Math.abs(result.initialEnergy - expectedStart);
      const middleError: number = Math.abs(result.middleEnergy - expectedMiddle);
      const endError: number = Math.abs(result.finalEnergy - expectedEnd);
      const readError: number = Math.abs(result.repeatedEnergy - result.finalEnergy);
      const finiteEnergy: boolean = isFinite(result.finalEnergy);
      const isolatedSession: number = result.requests;
      const startMatches: boolean = startError < tolerance;
      const middleMatches: boolean = middleError < tolerance;
      const endMatches: boolean = endError < tolerance;

      expect(actualSteps).assertEqual(steps);
      expect(actualDt).assertEqual(dt);
      expect(startMatches).assertTrue();
      expect(middleMatches).assertTrue();
      expect(endMatches).assertTrue();
      expect(readError).assertEqual(0);
      expect(finiteEnergy).assertTrue();
      expect(isolatedSession).assertEqual(1);
    });

    // @tc.number SUB_NBODY_NBODYLARGEREGRESSION20TEST_0400
    // @tc.name nBodyLargeRegression20Test004
    // @tc.desc Verify advance and energy for 115 steps at dt 0.0025 with large initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyLargeRegression20Test004', 0, async (): Promise<void> => {
      const steps: number = 115;
      const dt: number = 0.0025;
      const mode: string = 'large';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.1690743928739424;
      const expectedEnd: number = -0.16907356628115505;
      const tolerance: number = 2e-11;
      const result = await runIsolatedTrajectory(steps, dt, mode);

      const actualSteps: number = result.steps;
      const actualDt: number = result.dt;
      const startError: number = Math.abs(result.initialEnergy - expectedStart);
      const middleError: number = Math.abs(result.middleEnergy - expectedMiddle);
      const endError: number = Math.abs(result.finalEnergy - expectedEnd);
      const readError: number = Math.abs(result.repeatedEnergy - result.finalEnergy);
      const finiteEnergy: boolean = isFinite(result.finalEnergy);
      const isolatedSession: number = result.requests;
      const startMatches: boolean = startError < tolerance;
      const middleMatches: boolean = middleError < tolerance;
      const endMatches: boolean = endError < tolerance;

      expect(actualSteps).assertEqual(steps);
      expect(actualDt).assertEqual(dt);
      expect(startMatches).assertTrue();
      expect(middleMatches).assertTrue();
      expect(endMatches).assertTrue();
      expect(readError).assertEqual(0);
      expect(finiteEnergy).assertTrue();
      expect(isolatedSession).assertEqual(1);
    });

    // @tc.number SUB_NBODY_NBODYLARGEREGRESSION20TEST_0500
    // @tc.name nBodyLargeRegression20Test005
    // @tc.desc Verify advance and energy for 116 steps at dt 0.0025 with large initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyLargeRegression20Test005', 0, async (): Promise<void> => {
      const steps: number = 116;
      const dt: number = 0.0025;
      const mode: string = 'large';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907437896294744;
      const expectedEnd: number = -0.16907355169803528;
      const tolerance: number = 2e-11;
      const result = await runIsolatedTrajectory(steps, dt, mode);

      const actualSteps: number = result.steps;
      const actualDt: number = result.dt;
      const startError: number = Math.abs(result.initialEnergy - expectedStart);
      const middleError: number = Math.abs(result.middleEnergy - expectedMiddle);
      const endError: number = Math.abs(result.finalEnergy - expectedEnd);
      const readError: number = Math.abs(result.repeatedEnergy - result.finalEnergy);
      const finiteEnergy: boolean = isFinite(result.finalEnergy);
      const isolatedSession: number = result.requests;
      const startMatches: boolean = startError < tolerance;
      const middleMatches: boolean = middleError < tolerance;
      const endMatches: boolean = endError < tolerance;

      expect(actualSteps).assertEqual(steps);
      expect(actualDt).assertEqual(dt);
      expect(startMatches).assertTrue();
      expect(middleMatches).assertTrue();
      expect(endMatches).assertTrue();
      expect(readError).assertEqual(0);
      expect(finiteEnergy).assertTrue();
      expect(isolatedSession).assertEqual(1);
    });

    // @tc.number SUB_NBODY_NBODYLARGEREGRESSION20TEST_0600
    // @tc.name nBodyLargeRegression20Test006
    // @tc.desc Verify advance and energy for 117 steps at dt 0.0025 with large initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyLargeRegression20Test006', 0, async (): Promise<void> => {
      const steps: number = 117;
      const dt: number = 0.0025;
      const mode: string = 'large';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907437896294744;
      const expectedEnd: number = -0.16907353710443346;
      const tolerance: number = 2e-11;
      const result = await runIsolatedTrajectory(steps, dt, mode);

      const actualSteps: number = result.steps;
      const actualDt: number = result.dt;
      const startError: number = Math.abs(result.initialEnergy - expectedStart);
      const middleError: number = Math.abs(result.middleEnergy - expectedMiddle);
      const endError: number = Math.abs(result.finalEnergy - expectedEnd);
      const readError: number = Math.abs(result.repeatedEnergy - result.finalEnergy);
      const finiteEnergy: boolean = isFinite(result.finalEnergy);
      const isolatedSession: number = result.requests;
      const startMatches: boolean = startError < tolerance;
      const middleMatches: boolean = middleError < tolerance;
      const endMatches: boolean = endError < tolerance;

      expect(actualSteps).assertEqual(steps);
      expect(actualDt).assertEqual(dt);
      expect(startMatches).assertTrue();
      expect(middleMatches).assertTrue();
      expect(endMatches).assertTrue();
      expect(readError).assertEqual(0);
      expect(finiteEnergy).assertTrue();
      expect(isolatedSession).assertEqual(1);
    });

    // @tc.number SUB_NBODY_NBODYLARGEREGRESSION20TEST_0700
    // @tc.name nBodyLargeRegression20Test007
    // @tc.desc Verify advance and energy for 118 steps at dt 0.0025 with large initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyLargeRegression20Test007', 0, async (): Promise<void> => {
      const steps: number = 118;
      const dt: number = 0.0025;
      const mode: string = 'large';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907436503932985;
      const expectedEnd: number = -0.1690735225003879;
      const tolerance: number = 2e-11;
      const result = await runIsolatedTrajectory(steps, dt, mode);

      const actualSteps: number = result.steps;
      const actualDt: number = result.dt;
      const startError: number = Math.abs(result.initialEnergy - expectedStart);
      const middleError: number = Math.abs(result.middleEnergy - expectedMiddle);
      const endError: number = Math.abs(result.finalEnergy - expectedEnd);
      const readError: number = Math.abs(result.repeatedEnergy - result.finalEnergy);
      const finiteEnergy: boolean = isFinite(result.finalEnergy);
      const isolatedSession: number = result.requests;
      const startMatches: boolean = startError < tolerance;
      const middleMatches: boolean = middleError < tolerance;
      const endMatches: boolean = endError < tolerance;

      expect(actualSteps).assertEqual(steps);
      expect(actualDt).assertEqual(dt);
      expect(startMatches).assertTrue();
      expect(middleMatches).assertTrue();
      expect(endMatches).assertTrue();
      expect(readError).assertEqual(0);
      expect(finiteEnergy).assertTrue();
      expect(isolatedSession).assertEqual(1);
    });

    // @tc.number SUB_NBODY_NBODYLARGEREGRESSION20TEST_0800
    // @tc.name nBodyLargeRegression20Test008
    // @tc.desc Verify advance and energy for 119 steps at dt 0.0025 with large initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyLargeRegression20Test008', 0, async (): Promise<void> => {
      const steps: number = 119;
      const dt: number = 0.0025;
      const mode: string = 'large';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907436503932985;
      const expectedEnd: number = -0.16907350788593778;
      const tolerance: number = 2e-11;
      const result = await runIsolatedTrajectory(steps, dt, mode);

      const actualSteps: number = result.steps;
      const actualDt: number = result.dt;
      const startError: number = Math.abs(result.initialEnergy - expectedStart);
      const middleError: number = Math.abs(result.middleEnergy - expectedMiddle);
      const endError: number = Math.abs(result.finalEnergy - expectedEnd);
      const readError: number = Math.abs(result.repeatedEnergy - result.finalEnergy);
      const finiteEnergy: boolean = isFinite(result.finalEnergy);
      const isolatedSession: number = result.requests;
      const startMatches: boolean = startError < tolerance;
      const middleMatches: boolean = middleError < tolerance;
      const endMatches: boolean = endError < tolerance;

      expect(actualSteps).assertEqual(steps);
      expect(actualDt).assertEqual(dt);
      expect(startMatches).assertTrue();
      expect(middleMatches).assertTrue();
      expect(endMatches).assertTrue();
      expect(readError).assertEqual(0);
      expect(finiteEnergy).assertTrue();
      expect(isolatedSession).assertEqual(1);
    });

    // @tc.number SUB_NBODY_NBODYLARGEREGRESSION20TEST_0900
    // @tc.name nBodyLargeRegression20Test009
    // @tc.desc Verify advance and energy for 120 steps at dt 0.0025 with large initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyLargeRegression20Test009', 0, async (): Promise<void> => {
      const steps: number = 120;
      const dt: number = 0.0025;
      const mode: string = 'large';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907435110312477;
      const expectedEnd: number = -0.1690734932611216;
      const tolerance: number = 2e-11;
      const result = await runIsolatedTrajectory(steps, dt, mode);

      const actualSteps: number = result.steps;
      const actualDt: number = result.dt;
      const startError: number = Math.abs(result.initialEnergy - expectedStart);
      const middleError: number = Math.abs(result.middleEnergy - expectedMiddle);
      const endError: number = Math.abs(result.finalEnergy - expectedEnd);
      const readError: number = Math.abs(result.repeatedEnergy - result.finalEnergy);
      const finiteEnergy: boolean = isFinite(result.finalEnergy);
      const isolatedSession: number = result.requests;
      const startMatches: boolean = startError < tolerance;
      const middleMatches: boolean = middleError < tolerance;
      const endMatches: boolean = endError < tolerance;

      expect(actualSteps).assertEqual(steps);
      expect(actualDt).assertEqual(dt);
      expect(startMatches).assertTrue();
      expect(middleMatches).assertTrue();
      expect(endMatches).assertTrue();
      expect(readError).assertEqual(0);
      expect(finiteEnergy).assertTrue();
      expect(isolatedSession).assertEqual(1);
    });

    // @tc.number SUB_NBODY_NBODYLARGEREGRESSION20TEST_1000
    // @tc.name nBodyLargeRegression20Test010
    // @tc.desc Verify advance and energy for 121 steps at dt 0.0025 with large initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyLargeRegression20Test010', 0, async (): Promise<void> => {
      const steps: number = 121;
      const dt: number = 0.0025;
      const mode: string = 'large';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907435110312477;
      const expectedEnd: number = -0.16907347862597852;
      const tolerance: number = 2e-11;
      const result = await runIsolatedTrajectory(steps, dt, mode);

      const actualSteps: number = result.steps;
      const actualDt: number = result.dt;
      const startError: number = Math.abs(result.initialEnergy - expectedStart);
      const middleError: number = Math.abs(result.middleEnergy - expectedMiddle);
      const endError: number = Math.abs(result.finalEnergy - expectedEnd);
      const readError: number = Math.abs(result.repeatedEnergy - result.finalEnergy);
      const finiteEnergy: boolean = isFinite(result.finalEnergy);
      const isolatedSession: number = result.requests;
      const startMatches: boolean = startError < tolerance;
      const middleMatches: boolean = middleError < tolerance;
      const endMatches: boolean = endError < tolerance;

      expect(actualSteps).assertEqual(steps);
      expect(actualDt).assertEqual(dt);
      expect(startMatches).assertTrue();
      expect(middleMatches).assertTrue();
      expect(endMatches).assertTrue();
      expect(readError).assertEqual(0);
      expect(finiteEnergy).assertTrue();
      expect(isolatedSession).assertEqual(1);
    });

    // @tc.number SUB_NBODY_NBODYLARGEREGRESSION20TEST_1100
    // @tc.name nBodyLargeRegression20Test011
    // @tc.desc Verify advance and energy for 122 steps at dt 0.0025 with large initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyLargeRegression20Test011', 0, async (): Promise<void> => {
      const steps: number = 122;
      const dt: number = 0.0025;
      const mode: string = 'large';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.1690743371543673;
      const expectedEnd: number = -0.16907346398054698;
      const tolerance: number = 2e-11;
      const result = await runIsolatedTrajectory(steps, dt, mode);

      const actualSteps: number = result.steps;
      const actualDt: number = result.dt;
      const startError: number = Math.abs(result.initialEnergy - expectedStart);
      const middleError: number = Math.abs(result.middleEnergy - expectedMiddle);
      const endError: number = Math.abs(result.finalEnergy - expectedEnd);
      const readError: number = Math.abs(result.repeatedEnergy - result.finalEnergy);
      const finiteEnergy: boolean = isFinite(result.finalEnergy);
      const isolatedSession: number = result.requests;
      const startMatches: boolean = startError < tolerance;
      const middleMatches: boolean = middleError < tolerance;
      const endMatches: boolean = endError < tolerance;

      expect(actualSteps).assertEqual(steps);
      expect(actualDt).assertEqual(dt);
      expect(startMatches).assertTrue();
      expect(middleMatches).assertTrue();
      expect(endMatches).assertTrue();
      expect(readError).assertEqual(0);
      expect(finiteEnergy).assertTrue();
      expect(isolatedSession).assertEqual(1);
    });

    // @tc.number SUB_NBODY_NBODYLARGEREGRESSION20TEST_1200
    // @tc.name nBodyLargeRegression20Test012
    // @tc.desc Verify advance and energy for 123 steps at dt 0.0025 with large initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyLargeRegression20Test012', 0, async (): Promise<void> => {
      const steps: number = 123;
      const dt: number = 0.0025;
      const mode: string = 'large';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.1690743371543673;
      const expectedEnd: number = -0.1690734493248666;
      const tolerance: number = 2e-11;
      const result = await runIsolatedTrajectory(steps, dt, mode);

      const actualSteps: number = result.steps;
      const actualDt: number = result.dt;
      const startError: number = Math.abs(result.initialEnergy - expectedStart);
      const middleError: number = Math.abs(result.middleEnergy - expectedMiddle);
      const endError: number = Math.abs(result.finalEnergy - expectedEnd);
      const readError: number = Math.abs(result.repeatedEnergy - result.finalEnergy);
      const finiteEnergy: boolean = isFinite(result.finalEnergy);
      const isolatedSession: number = result.requests;
      const startMatches: boolean = startError < tolerance;
      const middleMatches: boolean = middleError < tolerance;
      const endMatches: boolean = endError < tolerance;

      expect(actualSteps).assertEqual(steps);
      expect(actualDt).assertEqual(dt);
      expect(startMatches).assertTrue();
      expect(middleMatches).assertTrue();
      expect(endMatches).assertTrue();
      expect(readError).assertEqual(0);
      expect(finiteEnergy).assertTrue();
      expect(isolatedSession).assertEqual(1);
    });

    // @tc.number SUB_NBODY_NBODYLARGEREGRESSION20TEST_1300
    // @tc.name nBodyLargeRegression20Test013
    // @tc.desc Verify advance and energy for 124 steps at dt 0.0025 with large initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyLargeRegression20Test013', 0, async (): Promise<void> => {
      const steps: number = 124;
      const dt: number = 0.0025;
      const mode: string = 'large';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907432319309243;
      const expectedEnd: number = -0.16907343465897579;
      const tolerance: number = 2e-11;
      const result = await runIsolatedTrajectory(steps, dt, mode);

      const actualSteps: number = result.steps;
      const actualDt: number = result.dt;
      const startError: number = Math.abs(result.initialEnergy - expectedStart);
      const middleError: number = Math.abs(result.middleEnergy - expectedMiddle);
      const endError: number = Math.abs(result.finalEnergy - expectedEnd);
      const readError: number = Math.abs(result.repeatedEnergy - result.finalEnergy);
      const finiteEnergy: boolean = isFinite(result.finalEnergy);
      const isolatedSession: number = result.requests;
      const startMatches: boolean = startError < tolerance;
      const middleMatches: boolean = middleError < tolerance;
      const endMatches: boolean = endError < tolerance;

      expect(actualSteps).assertEqual(steps);
      expect(actualDt).assertEqual(dt);
      expect(startMatches).assertTrue();
      expect(middleMatches).assertTrue();
      expect(endMatches).assertTrue();
      expect(readError).assertEqual(0);
      expect(finiteEnergy).assertTrue();
      expect(isolatedSession).assertEqual(1);
    });

    // @tc.number SUB_NBODY_NBODYLARGEREGRESSION20TEST_1400
    // @tc.name nBodyLargeRegression20Test014
    // @tc.desc Verify advance and energy for 125 steps at dt 0.0025 with large initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyLargeRegression20Test014', 0, async (): Promise<void> => {
      const steps: number = 125;
      const dt: number = 0.0025;
      const mode: string = 'large';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907432319309243;
      const expectedEnd: number = -0.1690734199829141;
      const tolerance: number = 2e-11;
      const result = await runIsolatedTrajectory(steps, dt, mode);

      const actualSteps: number = result.steps;
      const actualDt: number = result.dt;
      const startError: number = Math.abs(result.initialEnergy - expectedStart);
      const middleError: number = Math.abs(result.middleEnergy - expectedMiddle);
      const endError: number = Math.abs(result.finalEnergy - expectedEnd);
      const readError: number = Math.abs(result.repeatedEnergy - result.finalEnergy);
      const finiteEnergy: boolean = isFinite(result.finalEnergy);
      const isolatedSession: number = result.requests;
      const startMatches: boolean = startError < tolerance;
      const middleMatches: boolean = middleError < tolerance;
      const endMatches: boolean = endError < tolerance;

      expect(actualSteps).assertEqual(steps);
      expect(actualDt).assertEqual(dt);
      expect(startMatches).assertTrue();
      expect(middleMatches).assertTrue();
      expect(endMatches).assertTrue();
      expect(readError).assertEqual(0);
      expect(finiteEnergy).assertTrue();
      expect(isolatedSession).assertEqual(1);
    });

    // @tc.number SUB_NBODY_NBODYLARGEREGRESSION20TEST_1500
    // @tc.name nBodyLargeRegression20Test015
    // @tc.desc Verify advance and energy for 126 steps at dt 0.0025 with large initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyLargeRegression20Test015', 0, async (): Promise<void> => {
      const steps: number = 126;
      const dt: number = 0.0025;
      const mode: string = 'large';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.1690743092193356;
      const expectedEnd: number = -0.16907340529672035;
      const tolerance: number = 2e-11;
      const result = await runIsolatedTrajectory(steps, dt, mode);

      const actualSteps: number = result.steps;
      const actualDt: number = result.dt;
      const startError: number = Math.abs(result.initialEnergy - expectedStart);
      const middleError: number = Math.abs(result.middleEnergy - expectedMiddle);
      const endError: number = Math.abs(result.finalEnergy - expectedEnd);
      const readError: number = Math.abs(result.repeatedEnergy - result.finalEnergy);
      const finiteEnergy: boolean = isFinite(result.finalEnergy);
      const isolatedSession: number = result.requests;
      const startMatches: boolean = startError < tolerance;
      const middleMatches: boolean = middleError < tolerance;
      const endMatches: boolean = endError < tolerance;

      expect(actualSteps).assertEqual(steps);
      expect(actualDt).assertEqual(dt);
      expect(startMatches).assertTrue();
      expect(middleMatches).assertTrue();
      expect(endMatches).assertTrue();
      expect(readError).assertEqual(0);
      expect(finiteEnergy).assertTrue();
      expect(isolatedSession).assertEqual(1);
    });

    // @tc.number SUB_NBODY_NBODYLARGEREGRESSION20TEST_1600
    // @tc.name nBodyLargeRegression20Test016
    // @tc.desc Verify advance and energy for 127 steps at dt 0.0025 with large initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyLargeRegression20Test016', 0, async (): Promise<void> => {
      const steps: number = 127;
      const dt: number = 0.0025;
      const mode: string = 'large';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.1690743092193356;
      const expectedEnd: number = -0.16907339060043383;
      const tolerance: number = 2e-11;
      const result = await runIsolatedTrajectory(steps, dt, mode);

      const actualSteps: number = result.steps;
      const actualDt: number = result.dt;
      const startError: number = Math.abs(result.initialEnergy - expectedStart);
      const middleError: number = Math.abs(result.middleEnergy - expectedMiddle);
      const endError: number = Math.abs(result.finalEnergy - expectedEnd);
      const readError: number = Math.abs(result.repeatedEnergy - result.finalEnergy);
      const finiteEnergy: boolean = isFinite(result.finalEnergy);
      const isolatedSession: number = result.requests;
      const startMatches: boolean = startError < tolerance;
      const middleMatches: boolean = middleError < tolerance;
      const endMatches: boolean = endError < tolerance;

      expect(actualSteps).assertEqual(steps);
      expect(actualDt).assertEqual(dt);
      expect(startMatches).assertTrue();
      expect(middleMatches).assertTrue();
      expect(endMatches).assertTrue();
      expect(readError).assertEqual(0);
      expect(finiteEnergy).assertTrue();
      expect(isolatedSession).assertEqual(1);
    });

    // @tc.number SUB_NBODY_NBODYLARGEREGRESSION20TEST_1700
    // @tc.name nBodyLargeRegression20Test017
    // @tc.desc Verify advance and energy for 128 steps at dt 0.0025 with large initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyLargeRegression20Test017', 0, async (): Promise<void> => {
      const steps: number = 128;
      const dt: number = 0.0025;
      const mode: string = 'large';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.1690742952331323;
      const expectedEnd: number = -0.1690733758940939;
      const tolerance: number = 2e-11;
      const result = await runIsolatedTrajectory(steps, dt, mode);

      const actualSteps: number = result.steps;
      const actualDt: number = result.dt;
      const startError: number = Math.abs(result.initialEnergy - expectedStart);
      const middleError: number = Math.abs(result.middleEnergy - expectedMiddle);
      const endError: number = Math.abs(result.finalEnergy - expectedEnd);
      const readError: number = Math.abs(result.repeatedEnergy - result.finalEnergy);
      const finiteEnergy: boolean = isFinite(result.finalEnergy);
      const isolatedSession: number = result.requests;
      const startMatches: boolean = startError < tolerance;
      const middleMatches: boolean = middleError < tolerance;
      const endMatches: boolean = endError < tolerance;

      expect(actualSteps).assertEqual(steps);
      expect(actualDt).assertEqual(dt);
      expect(startMatches).assertTrue();
      expect(middleMatches).assertTrue();
      expect(endMatches).assertTrue();
      expect(readError).assertEqual(0);
      expect(finiteEnergy).assertTrue();
      expect(isolatedSession).assertEqual(1);
    });

    // @tc.number SUB_NBODY_NBODYLARGEREGRESSION20TEST_1800
    // @tc.name nBodyLargeRegression20Test018
    // @tc.desc Verify advance and energy for 129 steps at dt 0.0025 with large initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyLargeRegression20Test018', 0, async (): Promise<void> => {
      const steps: number = 129;
      const dt: number = 0.0025;
      const mode: string = 'large';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.1690742952331323;
      const expectedEnd: number = -0.16907336117773974;
      const tolerance: number = 2e-11;
      const result = await runIsolatedTrajectory(steps, dt, mode);

      const actualSteps: number = result.steps;
      const actualDt: number = result.dt;
      const startError: number = Math.abs(result.initialEnergy - expectedStart);
      const middleError: number = Math.abs(result.middleEnergy - expectedMiddle);
      const endError: number = Math.abs(result.finalEnergy - expectedEnd);
      const readError: number = Math.abs(result.repeatedEnergy - result.finalEnergy);
      const finiteEnergy: boolean = isFinite(result.finalEnergy);
      const isolatedSession: number = result.requests;
      const startMatches: boolean = startError < tolerance;
      const middleMatches: boolean = middleError < tolerance;
      const endMatches: boolean = endError < tolerance;

      expect(actualSteps).assertEqual(steps);
      expect(actualDt).assertEqual(dt);
      expect(startMatches).assertTrue();
      expect(middleMatches).assertTrue();
      expect(endMatches).assertTrue();
      expect(readError).assertEqual(0);
      expect(finiteEnergy).assertTrue();
      expect(isolatedSession).assertEqual(1);
    });

    // @tc.number SUB_NBODY_NBODYLARGEREGRESSION20TEST_1900
    // @tc.name nBodyLargeRegression20Test019
    // @tc.desc Verify advance and energy for 130 steps at dt 0.0025 with large initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyLargeRegression20Test019', 0, async (): Promise<void> => {
      const steps: number = 130;
      const dt: number = 0.0025;
      const mode: string = 'large';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907428123451773;
      const expectedEnd: number = -0.16907334645141073;
      const tolerance: number = 2e-11;
      const result = await runIsolatedTrajectory(steps, dt, mode);

      const actualSteps: number = result.steps;
      const actualDt: number = result.dt;
      const startError: number = Math.abs(result.initialEnergy - expectedStart);
      const middleError: number = Math.abs(result.middleEnergy - expectedMiddle);
      const endError: number = Math.abs(result.finalEnergy - expectedEnd);
      const readError: number = Math.abs(result.repeatedEnergy - result.finalEnergy);
      const finiteEnergy: boolean = isFinite(result.finalEnergy);
      const isolatedSession: number = result.requests;
      const startMatches: boolean = startError < tolerance;
      const middleMatches: boolean = middleError < tolerance;
      const endMatches: boolean = endError < tolerance;

      expect(actualSteps).assertEqual(steps);
      expect(actualDt).assertEqual(dt);
      expect(startMatches).assertTrue();
      expect(middleMatches).assertTrue();
      expect(endMatches).assertTrue();
      expect(readError).assertEqual(0);
      expect(finiteEnergy).assertTrue();
      expect(isolatedSession).assertEqual(1);
    });

    // @tc.number SUB_NBODY_NBODYLARGEREGRESSION20TEST_2000
    // @tc.name nBodyLargeRegression20Test020
    // @tc.desc Verify advance and energy for 131 steps at dt 0.0025 with large initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyLargeRegression20Test020', 0, async (): Promise<void> => {
      const steps: number = 131;
      const dt: number = 0.0025;
      const mode: string = 'large';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907428123451773;
      const expectedEnd: number = -0.1690733317151464;
      const tolerance: number = 2e-11;
      const result = await runIsolatedTrajectory(steps, dt, mode);

      const actualSteps: number = result.steps;
      const actualDt: number = result.dt;
      const startError: number = Math.abs(result.initialEnergy - expectedStart);
      const middleError: number = Math.abs(result.middleEnergy - expectedMiddle);
      const endError: number = Math.abs(result.finalEnergy - expectedEnd);
      const readError: number = Math.abs(result.repeatedEnergy - result.finalEnergy);
      const finiteEnergy: boolean = isFinite(result.finalEnergy);
      const isolatedSession: number = result.requests;
      const startMatches: boolean = startError < tolerance;
      const middleMatches: boolean = middleError < tolerance;
      const endMatches: boolean = endError < tolerance;

      expect(actualSteps).assertEqual(steps);
      expect(actualDt).assertEqual(dt);
      expect(startMatches).assertTrue();
      expect(middleMatches).assertTrue();
      expect(endMatches).assertTrue();
      expect(readError).assertEqual(0);
      expect(finiteEnergy).assertTrue();
      expect(isolatedSession).assertEqual(1);
    });

    // @tc.number SUB_NBODY_NBODYLARGEREGRESSION20TEST_2100
    // @tc.name nBodyLargeRegression20Test021
    // @tc.desc Verify advance and energy for 132 steps at dt 0.0025 with large initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyLargeRegression20Test021', 0, async (): Promise<void> => {
      const steps: number = 132;
      const dt: number = 0.0025;
      const mode: string = 'large';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907426722352745;
      const expectedEnd: number = -0.16907331696898598;
      const tolerance: number = 2e-11;
      const result = await runIsolatedTrajectory(steps, dt, mode);

      const actualSteps: number = result.steps;
      const actualDt: number = result.dt;
      const startError: number = Math.abs(result.initialEnergy - expectedStart);
      const middleError: number = Math.abs(result.middleEnergy - expectedMiddle);
      const endError: number = Math.abs(result.finalEnergy - expectedEnd);
      const readError: number = Math.abs(result.repeatedEnergy - result.finalEnergy);
      const finiteEnergy: boolean = isFinite(result.finalEnergy);
      const isolatedSession: number = result.requests;
      const startMatches: boolean = startError < tolerance;
      const middleMatches: boolean = middleError < tolerance;
      const endMatches: boolean = endError < tolerance;

      expect(actualSteps).assertEqual(steps);
      expect(actualDt).assertEqual(dt);
      expect(startMatches).assertTrue();
      expect(middleMatches).assertTrue();
      expect(endMatches).assertTrue();
      expect(readError).assertEqual(0);
      expect(finiteEnergy).assertTrue();
      expect(isolatedSession).assertEqual(1);
    });

    // @tc.number SUB_NBODY_NBODYLARGEREGRESSION20TEST_2200
    // @tc.name nBodyLargeRegression20Test022
    // @tc.desc Verify advance and energy for 133 steps at dt 0.0025 with large initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyLargeRegression20Test022', 0, async (): Promise<void> => {
      const steps: number = 133;
      const dt: number = 0.0025;
      const mode: string = 'large';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907426722352745;
      const expectedEnd: number = -0.1690733022129693;
      const tolerance: number = 2e-11;
      const result = await runIsolatedTrajectory(steps, dt, mode);

      const actualSteps: number = result.steps;
      const actualDt: number = result.dt;
      const startError: number = Math.abs(result.initialEnergy - expectedStart);
      const middleError: number = Math.abs(result.middleEnergy - expectedMiddle);
      const endError: number = Math.abs(result.finalEnergy - expectedEnd);
      const readError: number = Math.abs(result.repeatedEnergy - result.finalEnergy);
      const finiteEnergy: boolean = isFinite(result.finalEnergy);
      const isolatedSession: number = result.requests;
      const startMatches: boolean = startError < tolerance;
      const middleMatches: boolean = middleError < tolerance;
      const endMatches: boolean = endError < tolerance;

      expect(actualSteps).assertEqual(steps);
      expect(actualDt).assertEqual(dt);
      expect(startMatches).assertTrue();
      expect(middleMatches).assertTrue();
      expect(endMatches).assertTrue();
      expect(readError).assertEqual(0);
      expect(finiteEnergy).assertTrue();
      expect(isolatedSession).assertEqual(1);
    });

    // @tc.number SUB_NBODY_NBODYLARGEREGRESSION20TEST_2300
    // @tc.name nBodyLargeRegression20Test023
    // @tc.desc Verify advance and energy for 134 steps at dt 0.0025 with large initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyLargeRegression20Test023', 0, async (): Promise<void> => {
      const steps: number = 134;
      const dt: number = 0.0025;
      const mode: string = 'large';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907425320019712;
      const expectedEnd: number = -0.1690732874471356;
      const tolerance: number = 2e-11;
      const result = await runIsolatedTrajectory(steps, dt, mode);

      const actualSteps: number = result.steps;
      const actualDt: number = result.dt;
      const startError: number = Math.abs(result.initialEnergy - expectedStart);
      const middleError: number = Math.abs(result.middleEnergy - expectedMiddle);
      const endError: number = Math.abs(result.finalEnergy - expectedEnd);
      const readError: number = Math.abs(result.repeatedEnergy - result.finalEnergy);
      const finiteEnergy: boolean = isFinite(result.finalEnergy);
      const isolatedSession: number = result.requests;
      const startMatches: boolean = startError < tolerance;
      const middleMatches: boolean = middleError < tolerance;
      const endMatches: boolean = endError < tolerance;

      expect(actualSteps).assertEqual(steps);
      expect(actualDt).assertEqual(dt);
      expect(startMatches).assertTrue();
      expect(middleMatches).assertTrue();
      expect(endMatches).assertTrue();
      expect(readError).assertEqual(0);
      expect(finiteEnergy).assertTrue();
      expect(isolatedSession).assertEqual(1);
    });
  });
}
