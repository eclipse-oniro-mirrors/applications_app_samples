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

export default function nBodyRawRegression30Test(): void {
  describe('NBodyRawRegression30Test', (): void => {
    beforeAll((): void => {
      logSuite('NBodyRawRegression30Test', 'start');
    });
    beforeEach((): void => {
      assertNoActiveWorkers();
    });
    afterEach((): void => {
      assertNoActiveWorkers();
    });
    afterAll((): void => {
      logSuite('NBodyRawRegression30Test', 'complete');
    });

    // @tc.number SUB_NBODY_NBODYRAWREGRESSION30TEST_0100
    // @tc.name nBodyRawRegression30Test001
    // @tc.desc Verify advance and energy for 73 steps at dt 0.000375 with raw initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyRawRegression30Test001', 0, async (): Promise<void> => {
      const steps: number = 73;
      const dt: number = 0.000375;
      const mode: string = 'raw';
      const expectedStart: number = -0.1692899033779057;
      const expectedMiddle: number = -0.16928989329196095;
      const expectedEnd: number = -0.16928988286321087;
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

    // @tc.number SUB_NBODY_NBODYRAWREGRESSION30TEST_0200
    // @tc.name nBodyRawRegression30Test002
    // @tc.desc Verify advance and energy for 74 steps at dt 0.000375 with raw initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyRawRegression30Test002', 0, async (): Promise<void> => {
      const steps: number = 74;
      const dt: number = 0.000375;
      const mode: string = 'raw';
      const expectedStart: number = -0.1692899033779057;
      const expectedMiddle: number = -0.16928989301093456;
      const expectedEnd: number = -0.16928988258047842;
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

    // @tc.number SUB_NBODY_NBODYRAWREGRESSION30TEST_0300
    // @tc.name nBodyRawRegression30Test003
    // @tc.desc Verify advance and energy for 75 steps at dt 0.000375 with raw initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyRawRegression30Test003', 0, async (): Promise<void> => {
      const steps: number = 75;
      const dt: number = 0.000375;
      const mode: string = 'raw';
      const expectedStart: number = -0.1692899033779057;
      const expectedMiddle: number = -0.16928989301093456;
      const expectedEnd: number = -0.1692898822977001;
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

    // @tc.number SUB_NBODY_NBODYRAWREGRESSION30TEST_0400
    // @tc.name nBodyRawRegression30Test004
    // @tc.desc Verify advance and energy for 76 steps at dt 0.000375 with raw initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyRawRegression30Test004', 0, async (): Promise<void> => {
      const steps: number = 76;
      const dt: number = 0.000375;
      const mode: string = 'raw';
      const expectedStart: number = -0.1692899033779057;
      const expectedMiddle: number = -0.16928989272986145;
      const expectedEnd: number = -0.169289882014876;
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

    // @tc.number SUB_NBODY_NBODYRAWREGRESSION30TEST_0500
    // @tc.name nBodyRawRegression30Test005
    // @tc.desc Verify advance and energy for 77 steps at dt 0.000375 with raw initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyRawRegression30Test005', 0, async (): Promise<void> => {
      const steps: number = 77;
      const dt: number = 0.000375;
      const mode: string = 'raw';
      const expectedStart: number = -0.1692899033779057;
      const expectedMiddle: number = -0.16928989272986145;
      const expectedEnd: number = -0.16928988173200604;
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

    // @tc.number SUB_NBODY_NBODYRAWREGRESSION30TEST_0600
    // @tc.name nBodyRawRegression30Test006
    // @tc.desc Verify advance and energy for 78 steps at dt 0.000375 with raw initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyRawRegression30Test006', 0, async (): Promise<void> => {
      const steps: number = 78;
      const dt: number = 0.000375;
      const mode: string = 'raw';
      const expectedStart: number = -0.1692899033779057;
      const expectedMiddle: number = -0.16928989244874243;
      const expectedEnd: number = -0.16928988144909052;
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

    // @tc.number SUB_NBODY_NBODYRAWREGRESSION30TEST_0700
    // @tc.name nBodyRawRegression30Test007
    // @tc.desc Verify advance and energy for 79 steps at dt 0.000375 with raw initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyRawRegression30Test007', 0, async (): Promise<void> => {
      const steps: number = 79;
      const dt: number = 0.000375;
      const mode: string = 'raw';
      const expectedStart: number = -0.1692899033779057;
      const expectedMiddle: number = -0.16928989244874243;
      const expectedEnd: number = -0.16928988116612903;
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

    // @tc.number SUB_NBODY_NBODYRAWREGRESSION30TEST_0800
    // @tc.name nBodyRawRegression30Test008
    // @tc.desc Verify advance and energy for 80 steps at dt 0.000375 with raw initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyRawRegression30Test008', 0, async (): Promise<void> => {
      const steps: number = 80;
      const dt: number = 0.000375;
      const mode: string = 'raw';
      const expectedStart: number = -0.1692899033779057;
      const expectedMiddle: number = -0.1692898921675768;
      const expectedEnd: number = -0.16928988088312186;
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

    // @tc.number SUB_NBODY_NBODYRAWREGRESSION30TEST_0900
    // @tc.name nBodyRawRegression30Test009
    // @tc.desc Verify advance and energy for 81 steps at dt 0.000375 with raw initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyRawRegression30Test009', 0, async (): Promise<void> => {
      const steps: number = 81;
      const dt: number = 0.000375;
      const mode: string = 'raw';
      const expectedStart: number = -0.1692899033779057;
      const expectedMiddle: number = -0.1692898921675768;
      const expectedEnd: number = -0.16928988060006894;
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

    // @tc.number SUB_NBODY_NBODYRAWREGRESSION30TEST_1000
    // @tc.name nBodyRawRegression30Test010
    // @tc.desc Verify advance and energy for 82 steps at dt 0.000375 with raw initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyRawRegression30Test010', 0, async (): Promise<void> => {
      const steps: number = 82;
      const dt: number = 0.000375;
      const mode: string = 'raw';
      const expectedStart: number = -0.1692899033779057;
      const expectedMiddle: number = -0.1692898918863648;
      const expectedEnd: number = -0.16928988031697043;
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

    // @tc.number SUB_NBODY_NBODYRAWREGRESSION30TEST_1100
    // @tc.name nBodyRawRegression30Test011
    // @tc.desc Verify advance and energy for 83 steps at dt 0.000375 with raw initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyRawRegression30Test011', 0, async (): Promise<void> => {
      const steps: number = 83;
      const dt: number = 0.000375;
      const mode: string = 'raw';
      const expectedStart: number = -0.1692899033779057;
      const expectedMiddle: number = -0.1692898918863648;
      const expectedEnd: number = -0.16928988003382606;
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

    // @tc.number SUB_NBODY_NBODYRAWREGRESSION30TEST_1200
    // @tc.name nBodyRawRegression30Test012
    // @tc.desc Verify advance and energy for 84 steps at dt 0.000375 with raw initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyRawRegression30Test012', 0, async (): Promise<void> => {
      const steps: number = 84;
      const dt: number = 0.000375;
      const mode: string = 'raw';
      const expectedStart: number = -0.1692899033779057;
      const expectedMiddle: number = -0.1692898916051067;
      const expectedEnd: number = -0.16928987975063609;
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

    // @tc.number SUB_NBODY_NBODYRAWREGRESSION30TEST_1300
    // @tc.name nBodyRawRegression30Test013
    // @tc.desc Verify advance and energy for 85 steps at dt 0.000375 with raw initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyRawRegression30Test013', 0, async (): Promise<void> => {
      const steps: number = 85;
      const dt: number = 0.000375;
      const mode: string = 'raw';
      const expectedStart: number = -0.1692899033779057;
      const expectedMiddle: number = -0.1692898916051067;
      const expectedEnd: number = -0.16928987946740037;
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

    // @tc.number SUB_NBODY_NBODYRAWREGRESSION30TEST_1400
    // @tc.name nBodyRawRegression30Test014
    // @tc.desc Verify advance and energy for 86 steps at dt 0.000375 with raw initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyRawRegression30Test014', 0, async (): Promise<void> => {
      const steps: number = 86;
      const dt: number = 0.000375;
      const mode: string = 'raw';
      const expectedStart: number = -0.1692899033779057;
      const expectedMiddle: number = -0.16928989132380212;
      const expectedEnd: number = -0.1692898791841191;
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

    // @tc.number SUB_NBODY_NBODYRAWREGRESSION30TEST_1500
    // @tc.name nBodyRawRegression30Test015
    // @tc.desc Verify advance and energy for 87 steps at dt 0.000375 with raw initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyRawRegression30Test015', 0, async (): Promise<void> => {
      const steps: number = 87;
      const dt: number = 0.000375;
      const mode: string = 'raw';
      const expectedStart: number = -0.1692899033779057;
      const expectedMiddle: number = -0.16928989132380212;
      const expectedEnd: number = -0.1692898789007921;
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

    // @tc.number SUB_NBODY_NBODYRAWREGRESSION30TEST_1600
    // @tc.name nBodyRawRegression30Test016
    // @tc.desc Verify advance and energy for 88 steps at dt 0.000375 with raw initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyRawRegression30Test016', 0, async (): Promise<void> => {
      const steps: number = 88;
      const dt: number = 0.000375;
      const mode: string = 'raw';
      const expectedStart: number = -0.1692899033779057;
      const expectedMiddle: number = -0.1692898910424514;
      const expectedEnd: number = -0.1692898786174194;
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

    // @tc.number SUB_NBODY_NBODYRAWREGRESSION30TEST_1700
    // @tc.name nBodyRawRegression30Test017
    // @tc.desc Verify advance and energy for 89 steps at dt 0.000375 with raw initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyRawRegression30Test017', 0, async (): Promise<void> => {
      const steps: number = 89;
      const dt: number = 0.000375;
      const mode: string = 'raw';
      const expectedStart: number = -0.1692899033779057;
      const expectedMiddle: number = -0.1692898910424514;
      const expectedEnd: number = -0.16928987833400116;
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

    // @tc.number SUB_NBODY_NBODYRAWREGRESSION30TEST_1800
    // @tc.name nBodyRawRegression30Test018
    // @tc.desc Verify advance and energy for 90 steps at dt 0.000375 with raw initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyRawRegression30Test018', 0, async (): Promise<void> => {
      const steps: number = 90;
      const dt: number = 0.000375;
      const mode: string = 'raw';
      const expectedStart: number = -0.1692899033779057;
      const expectedMiddle: number = -0.16928989076105422;
      const expectedEnd: number = -0.16928987805053733;
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

    // @tc.number SUB_NBODY_NBODYRAWREGRESSION30TEST_1900
    // @tc.name nBodyRawRegression30Test019
    // @tc.desc Verify advance and energy for 91 steps at dt 0.000375 with raw initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodyRawRegression30Test019', 0, async (): Promise<void> => {
      const steps: number = 91;
      const dt: number = 0.000375;
      const mode: string = 'raw';
      const expectedStart: number = -0.1692899033779057;
      const expectedMiddle: number = -0.16928989076105422;
      const expectedEnd: number = -0.16928987776702803;
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
