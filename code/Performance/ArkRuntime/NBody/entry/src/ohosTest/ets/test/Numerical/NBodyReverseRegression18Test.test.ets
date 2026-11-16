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

export default function nBodyReverseRegression18Test(): void {
  describe('NBodyReverseRegression18Test', (): void => {
    beforeAll((): void => {
      logSuite('NBodyReverseRegression18Test', 'start');
    });
    beforeEach((): void => {
      assertNoActiveWorkers();
    });
    afterEach((): void => {
      assertNoActiveWorkers();
    });
    afterAll((): void => {
      logSuite('NBodyReverseRegression18Test', 'complete');
    });

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION18TEST_0100
    // @tc.name nBodyReverseRegression18Test001
    // @tc.desc Verify advance and energy for 63 steps at dt -0.00025 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression18Test001', 0, async (): Promise<void> => {
      const steps: number = 63;
      const dt: number = -0.00025;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907515976011903;
      const expectedEnd: number = -0.16907515557477687;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION18TEST_0200
    // @tc.name nBodyReverseRegression18Test002
    // @tc.desc Verify advance and energy for 64 steps at dt -0.00025 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression18Test002', 0, async (): Promise<void> => {
      const steps: number = 64;
      const dt: number = -0.00025;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907515962910666;
      const expectedEnd: number = -0.1690751554442201;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION18TEST_0300
    // @tc.name nBodyReverseRegression18Test003
    // @tc.desc Verify advance and energy for 65 steps at dt -0.00025 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression18Test003', 0, async (): Promise<void> => {
      const steps: number = 65;
      const dt: number = -0.00025;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907515962910666;
      const expectedEnd: number = -0.16907515531367767;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION18TEST_0400
    // @tc.name nBodyReverseRegression18Test004
    // @tc.desc Verify advance and energy for 66 steps at dt -0.00025 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression18Test004', 0, async (): Promise<void> => {
      const steps: number = 66;
      const dt: number = -0.00025;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907515949810847;
      const expectedEnd: number = -0.1690751551831495;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION18TEST_0500
    // @tc.name nBodyReverseRegression18Test005
    // @tc.desc Verify advance and energy for 67 steps at dt -0.00025 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression18Test005', 0, async (): Promise<void> => {
      const steps: number = 67;
      const dt: number = -0.00025;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907515949810847;
      const expectedEnd: number = -0.1690751550526356;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION18TEST_0600
    // @tc.name nBodyReverseRegression18Test006
    // @tc.desc Verify advance and energy for 68 steps at dt -0.00025 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression18Test006', 0, async (): Promise<void> => {
      const steps: number = 68;
      const dt: number = -0.00025;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907515936712453;
      const expectedEnd: number = -0.16907515492213604;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION18TEST_0700
    // @tc.name nBodyReverseRegression18Test007
    // @tc.desc Verify advance and energy for 69 steps at dt -0.00025 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression18Test007', 0, async (): Promise<void> => {
      const steps: number = 69;
      const dt: number = -0.00025;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907515936712453;
      const expectedEnd: number = -0.1690751547916508;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION18TEST_0800
    // @tc.name nBodyReverseRegression18Test008
    // @tc.desc Verify advance and energy for 70 steps at dt -0.00025 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression18Test008', 0, async (): Promise<void> => {
      const steps: number = 70;
      const dt: number = -0.00025;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907515923615477;
      const expectedEnd: number = -0.16907515466117976;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION18TEST_0900
    // @tc.name nBodyReverseRegression18Test009
    // @tc.desc Verify advance and energy for 71 steps at dt -0.00025 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression18Test009', 0, async (): Promise<void> => {
      const steps: number = 71;
      const dt: number = -0.00025;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907515923615477;
      const expectedEnd: number = -0.1690751545307232;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION18TEST_1000
    // @tc.name nBodyReverseRegression18Test010
    // @tc.desc Verify advance and energy for 72 steps at dt -0.00025 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression18Test010', 0, async (): Promise<void> => {
      const steps: number = 72;
      const dt: number = -0.00025;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907515910519916;
      const expectedEnd: number = -0.16907515440028098;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION18TEST_1100
    // @tc.name nBodyReverseRegression18Test011
    // @tc.desc Verify advance and energy for 73 steps at dt -0.00025 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression18Test011', 0, async (): Promise<void> => {
      const steps: number = 73;
      const dt: number = -0.00025;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907515910519916;
      const expectedEnd: number = -0.1690751542698528;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION18TEST_1200
    // @tc.name nBodyReverseRegression18Test012
    // @tc.desc Verify advance and energy for 74 steps at dt -0.00025 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression18Test012', 0, async (): Promise<void> => {
      const steps: number = 74;
      const dt: number = -0.00025;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907515897425765;
      const expectedEnd: number = -0.1690751541394392;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION18TEST_1300
    // @tc.name nBodyReverseRegression18Test013
    // @tc.desc Verify advance and energy for 75 steps at dt -0.00025 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression18Test013', 0, async (): Promise<void> => {
      const steps: number = 75;
      const dt: number = -0.00025;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907515897425765;
      const expectedEnd: number = -0.1690751540090396;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION18TEST_1400
    // @tc.name nBodyReverseRegression18Test014
    // @tc.desc Verify advance and energy for 76 steps at dt -0.00025 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression18Test014', 0, async (): Promise<void> => {
      const steps: number = 76;
      const dt: number = -0.00025;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907515884333038;
      const expectedEnd: number = -0.1690751538786546;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION18TEST_1500
    // @tc.name nBodyReverseRegression18Test015
    // @tc.desc Verify advance and energy for 77 steps at dt -0.00025 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression18Test015', 0, async (): Promise<void> => {
      const steps: number = 77;
      const dt: number = -0.00025;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907515884333038;
      const expectedEnd: number = -0.1690751537482839;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION18TEST_1600
    // @tc.name nBodyReverseRegression18Test016
    // @tc.desc Verify advance and energy for 78 steps at dt -0.00025 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression18Test016', 0, async (): Promise<void> => {
      const steps: number = 78;
      const dt: number = -0.00025;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907515871241746;
      const expectedEnd: number = -0.16907515361792758;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION18TEST_1700
    // @tc.name nBodyReverseRegression18Test017
    // @tc.desc Verify advance and energy for 79 steps at dt -0.00025 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression18Test017', 0, async (): Promise<void> => {
      const steps: number = 79;
      const dt: number = -0.00025;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907515871241746;
      const expectedEnd: number = -0.16907515348758545;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION18TEST_1800
    // @tc.name nBodyReverseRegression18Test018
    // @tc.desc Verify advance and energy for 80 steps at dt -0.00025 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression18Test018', 0, async (): Promise<void> => {
      const steps: number = 80;
      const dt: number = -0.00025;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907515858151873;
      const expectedEnd: number = -0.16907515335725773;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION18TEST_1900
    // @tc.name nBodyReverseRegression18Test019
    // @tc.desc Verify advance and energy for 81 steps at dt -0.00025 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression18Test019', 0, async (): Promise<void> => {
      const steps: number = 81;
      const dt: number = -0.00025;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907515858151873;
      const expectedEnd: number = -0.16907515322694439;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION18TEST_2000
    // @tc.name nBodyReverseRegression18Test020
    // @tc.desc Verify advance and energy for 82 steps at dt -0.00025 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression18Test020', 0, async (): Promise<void> => {
      const steps: number = 82;
      const dt: number = -0.00025;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.1690751584506342;
      const expectedEnd: number = -0.16907515309664525;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION18TEST_2100
    // @tc.name nBodyReverseRegression18Test021
    // @tc.desc Verify advance and energy for 83 steps at dt -0.00025 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression18Test021', 0, async (): Promise<void> => {
      const steps: number = 83;
      const dt: number = -0.00025;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.1690751584506342;
      const expectedEnd: number = -0.1690751529663605;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION18TEST_2200
    // @tc.name nBodyReverseRegression18Test022
    // @tc.desc Verify advance and energy for 84 steps at dt -0.00025 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression18Test022', 0, async (): Promise<void> => {
      const steps: number = 84;
      const dt: number = -0.00025;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907515831976383;
      const expectedEnd: number = -0.16907515283609012;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION18TEST_2300
    // @tc.name nBodyReverseRegression18Test023
    // @tc.desc Verify advance and energy for 85 steps at dt -0.00025 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression18Test023', 0, async (): Promise<void> => {
      const steps: number = 85;
      const dt: number = -0.00025;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907515831976383;
      const expectedEnd: number = -0.16907515270583423;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION18TEST_2400
    // @tc.name nBodyReverseRegression18Test024
    // @tc.desc Verify advance and energy for 86 steps at dt -0.00025 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression18Test024', 0, async (): Promise<void> => {
      const steps: number = 86;
      const dt: number = -0.00025;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907515818890773;
      const expectedEnd: number = -0.16907515257559252;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION18TEST_2500
    // @tc.name nBodyReverseRegression18Test025
    // @tc.desc Verify advance and energy for 87 steps at dt -0.00025 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression18Test025', 0, async (): Promise<void> => {
      const steps: number = 87;
      const dt: number = -0.00025;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907515818890773;
      const expectedEnd: number = -0.16907515244536528;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION18TEST_2600
    // @tc.name nBodyReverseRegression18Test026
    // @tc.desc Verify advance and energy for 88 steps at dt -0.00025 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression18Test026', 0, async (): Promise<void> => {
      const steps: number = 88;
      const dt: number = -0.00025;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.1690751580580658;
      const expectedEnd: number = -0.16907515231515235;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION18TEST_2700
    // @tc.name nBodyReverseRegression18Test027
    // @tc.desc Verify advance and energy for 89 steps at dt -0.00025 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression18Test027', 0, async (): Promise<void> => {
      const steps: number = 89;
      const dt: number = -0.00025;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.1690751580580658;
      const expectedEnd: number = -0.16907515218495384;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION18TEST_2800
    // @tc.name nBodyReverseRegression18Test028
    // @tc.desc Verify advance and energy for 90 steps at dt -0.00025 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression18Test028', 0, async (): Promise<void> => {
      const steps: number = 90;
      const dt: number = -0.00025;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.1690751579272382;
      const expectedEnd: number = -0.1690751520547695;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION18TEST_2900
    // @tc.name nBodyReverseRegression18Test029
    // @tc.desc Verify advance and energy for 91 steps at dt -0.00025 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression18Test029', 0, async (): Promise<void> => {
      const steps: number = 91;
      const dt: number = -0.00025;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.1690751579272382;
      const expectedEnd: number = -0.16907515192459974;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION18TEST_3000
    // @tc.name nBodyReverseRegression18Test030
    // @tc.desc Verify advance and energy for 92 steps at dt -0.00025 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression18Test030', 0, async (): Promise<void> => {
      const steps: number = 92;
      const dt: number = -0.00025;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907515779642482;
      const expectedEnd: number = -0.16907515179444424;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION18TEST_3100
    // @tc.name nBodyReverseRegression18Test031
    // @tc.desc Verify advance and energy for 93 steps at dt -0.00025 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression18Test031', 0, async (): Promise<void> => {
      const steps: number = 93;
      const dt: number = -0.00025;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907515779642482;
      const expectedEnd: number = -0.16907515166430312;
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
