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

export default function nBodyReverseRegression11Test(): void {
  describe('NBodyReverseRegression11Test', (): void => {
    beforeAll((): void => {
      logSuite('NBodyReverseRegression11Test', 'start');
    });
    beforeEach((): void => {
      assertNoActiveWorkers();
    });
    afterEach((): void => {
      assertNoActiveWorkers();
    });
    afterAll((): void => {
      logSuite('NBodyReverseRegression11Test', 'complete');
    });

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION11TEST_0100
    // @tc.name nBodyReverseRegression11Test001
    // @tc.desc Verify advance and energy for 176 steps at dt -0.000125 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression11Test001', 0, async (): Promise<void> => {
      const steps: number = 176;
      const dt: number = -0.000125;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516094347783;
      const expectedEnd: number = -0.1690751580722232;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION11TEST_0200
    // @tc.name nBodyReverseRegression11Test002
    // @tc.desc Verify advance and energy for 177 steps at dt -0.000125 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression11Test002', 0, async (): Promise<void> => {
      const steps: number = 177;
      const dt: number = -0.000125;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516094347783;
      const expectedEnd: number = -0.16907515803967504;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION11TEST_0300
    // @tc.name nBodyReverseRegression11Test003
    // @tc.desc Verify advance and energy for 178 steps at dt -0.000125 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression11Test003', 0, async (): Promise<void> => {
      const steps: number = 178;
      const dt: number = -0.000125;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.1690751609107722;
      const expectedEnd: number = -0.16907515800712863;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION11TEST_0400
    // @tc.name nBodyReverseRegression11Test004
    // @tc.desc Verify advance and energy for 179 steps at dt -0.000125 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression11Test004', 0, async (): Promise<void> => {
      const steps: number = 179;
      const dt: number = -0.000125;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.1690751609107722;
      const expectedEnd: number = -0.16907515797458406;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION11TEST_0500
    // @tc.name nBodyReverseRegression11Test005
    // @tc.desc Verify advance and energy for 180 steps at dt -0.000125 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression11Test005', 0, async (): Promise<void> => {
      const steps: number = 180;
      const dt: number = -0.000125;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516087806845;
      const expectedEnd: number = -0.16907515794204148;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION11TEST_0600
    // @tc.name nBodyReverseRegression11Test006
    // @tc.desc Verify advance and energy for 181 steps at dt -0.000125 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression11Test006', 0, async (): Promise<void> => {
      const steps: number = 181;
      const dt: number = -0.000125;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516087806845;
      const expectedEnd: number = -0.1690751579095005;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION11TEST_0700
    // @tc.name nBodyReverseRegression11Test007
    // @tc.desc Verify advance and energy for 182 steps at dt -0.000125 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression11Test007', 0, async (): Promise<void> => {
      const steps: number = 182;
      const dt: number = -0.000125;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516084536642;
      const expectedEnd: number = -0.16907515787696129;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION11TEST_0800
    // @tc.name nBodyReverseRegression11Test008
    // @tc.desc Verify advance and energy for 183 steps at dt -0.000125 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression11Test008', 0, async (): Promise<void> => {
      const steps: number = 183;
      const dt: number = -0.000125;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516084536642;
      const expectedEnd: number = -0.16907515784442417;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION11TEST_0900
    // @tc.name nBodyReverseRegression11Test009
    // @tc.desc Verify advance and energy for 184 steps at dt -0.000125 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression11Test009', 0, async (): Promise<void> => {
      const steps: number = 184;
      const dt: number = -0.000125;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516081266613;
      const expectedEnd: number = -0.16907515781188862;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION11TEST_1000
    // @tc.name nBodyReverseRegression11Test010
    // @tc.desc Verify advance and energy for 185 steps at dt -0.000125 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression11Test010', 0, async (): Promise<void> => {
      const steps: number = 185;
      const dt: number = -0.000125;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516081266613;
      const expectedEnd: number = -0.16907515777935467;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION11TEST_1100
    // @tc.name nBodyReverseRegression11Test011
    // @tc.desc Verify advance and energy for 186 steps at dt -0.000125 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression11Test011', 0, async (): Promise<void> => {
      const steps: number = 186;
      const dt: number = -0.000125;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516077996745;
      const expectedEnd: number = -0.16907515774682289;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION11TEST_1200
    // @tc.name nBodyReverseRegression11Test012
    // @tc.desc Verify advance and energy for 187 steps at dt -0.000125 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression11Test012', 0, async (): Promise<void> => {
      const steps: number = 187;
      const dt: number = -0.000125;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516077996745;
      const expectedEnd: number = -0.1690751577142927;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION11TEST_1300
    // @tc.name nBodyReverseRegression11Test013
    // @tc.desc Verify advance and energy for 188 steps at dt -0.000125 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression11Test013', 0, async (): Promise<void> => {
      const steps: number = 188;
      const dt: number = -0.000125;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516074727091;
      const expectedEnd: number = -0.16907515768176434;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION11TEST_1400
    // @tc.name nBodyReverseRegression11Test014
    // @tc.desc Verify advance and energy for 189 steps at dt -0.000125 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression11Test014', 0, async (): Promise<void> => {
      const steps: number = 189;
      const dt: number = -0.000125;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516074727091;
      const expectedEnd: number = -0.1690751576492378;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION11TEST_1500
    // @tc.name nBodyReverseRegression11Test015
    // @tc.desc Verify advance and energy for 190 steps at dt -0.000125 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression11Test015', 0, async (): Promise<void> => {
      const steps: number = 190;
      const dt: number = -0.000125;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516071457585;
      const expectedEnd: number = -0.16907515761671302;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION11TEST_1600
    // @tc.name nBodyReverseRegression11Test016
    // @tc.desc Verify advance and energy for 191 steps at dt -0.000125 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression11Test016', 0, async (): Promise<void> => {
      const steps: number = 191;
      const dt: number = -0.000125;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516071457585;
      const expectedEnd: number = -0.16907515758419012;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION11TEST_1700
    // @tc.name nBodyReverseRegression11Test017
    // @tc.desc Verify advance and energy for 192 steps at dt -0.000125 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression11Test017', 0, async (): Promise<void> => {
      const steps: number = 192;
      const dt: number = -0.000125;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516068188286;
      const expectedEnd: number = -0.16907515755166888;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION11TEST_1800
    // @tc.name nBodyReverseRegression11Test018
    // @tc.desc Verify advance and energy for 193 steps at dt -0.000125 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression11Test018', 0, async (): Promise<void> => {
      const steps: number = 193;
      const dt: number = -0.000125;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516068188286;
      const expectedEnd: number = -0.1690751575191497;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION11TEST_1900
    // @tc.name nBodyReverseRegression11Test019
    // @tc.desc Verify advance and energy for 194 steps at dt -0.000125 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression11Test019', 0, async (): Promise<void> => {
      const steps: number = 194;
      const dt: number = -0.000125;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516064919145;
      const expectedEnd: number = -0.16907515748663204;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION11TEST_2000
    // @tc.name nBodyReverseRegression11Test020
    // @tc.desc Verify advance and energy for 195 steps at dt -0.000125 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression11Test020', 0, async (): Promise<void> => {
      const steps: number = 195;
      const dt: number = -0.000125;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516064919145;
      const expectedEnd: number = -0.1690751574541164;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION11TEST_2100
    // @tc.name nBodyReverseRegression11Test021
    // @tc.desc Verify advance and energy for 196 steps at dt -0.000125 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression11Test021', 0, async (): Promise<void> => {
      const steps: number = 196;
      const dt: number = -0.000125;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516061650193;
      const expectedEnd: number = -0.16907515742160248;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION11TEST_2200
    // @tc.name nBodyReverseRegression11Test022
    // @tc.desc Verify advance and energy for 197 steps at dt -0.000125 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression11Test022', 0, async (): Promise<void> => {
      const steps: number = 197;
      const dt: number = -0.000125;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516061650193;
      const expectedEnd: number = -0.16907515738909026;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION11TEST_2300
    // @tc.name nBodyReverseRegression11Test023
    // @tc.desc Verify advance and energy for 198 steps at dt -0.000125 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression11Test023', 0, async (): Promise<void> => {
      const steps: number = 198;
      const dt: number = -0.000125;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516058381414;
      const expectedEnd: number = -0.16907515735657994;
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

    // @tc.number SUB_NBODY_NBODYREVERSEREGRESSION11TEST_2400
    // @tc.name nBodyReverseRegression11Test024
    // @tc.desc Verify advance and energy for 199 steps at dt -0.000125 with reverse initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyReverseRegression11Test024', 0, async (): Promise<void> => {
      const steps: number = 199;
      const dt: number = -0.000125;
      const mode: string = 'reverse';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516058381414;
      const expectedEnd: number = -0.1690751573240714;
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
