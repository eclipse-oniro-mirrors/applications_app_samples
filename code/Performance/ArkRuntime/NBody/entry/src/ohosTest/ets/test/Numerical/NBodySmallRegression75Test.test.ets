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

export default function nBodySmallRegression75Test(): void {
  describe('NBodySmallRegression75Test', (): void => {
    beforeAll((): void => {
      logSuite('NBodySmallRegression75Test', 'start');
    });
    beforeEach((): void => {
      assertNoActiveWorkers();
    });
    afterEach((): void => {
      assertNoActiveWorkers();
    });
    afterAll((): void => {
      logSuite('NBodySmallRegression75Test', 'complete');
    });

    // @tc.number SUB_NBODY_NBODYSMALLREGRESSION75TEST_0100
    // @tc.name nBodySmallRegression75Test001
    // @tc.desc Verify advance and energy for 219 steps at dt 7.5e-07 with small initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodySmallRegression75Test001', 0, async (): Promise<void> => {
      const steps: number = 219;
      const dt: number = 7.5e-7;
      const mode: string = 'small';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516382839569;
      const expectedEnd: number = -0.16907516382826565;
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

    // @tc.number SUB_NBODY_NBODYSMALLREGRESSION75TEST_0200
    // @tc.name nBodySmallRegression75Test002
    // @tc.desc Verify advance and energy for 220 steps at dt 7.5e-07 with small initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodySmallRegression75Test002', 0, async (): Promise<void> => {
      const steps: number = 220;
      const dt: number = 7.5e-7;
      const mode: string = 'small';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516382839444;
      const expectedEnd: number = -0.16907516382826432;
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

    // @tc.number SUB_NBODY_NBODYSMALLREGRESSION75TEST_0300
    // @tc.name nBodySmallRegression75Test003
    // @tc.desc Verify advance and energy for 221 steps at dt 7.5e-07 with small initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodySmallRegression75Test003', 0, async (): Promise<void> => {
      const steps: number = 221;
      const dt: number = 7.5e-7;
      const mode: string = 'small';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516382839444;
      const expectedEnd: number = -0.16907516382826324;
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

    // @tc.number SUB_NBODY_NBODYSMALLREGRESSION75TEST_0400
    // @tc.name nBodySmallRegression75Test004
    // @tc.desc Verify advance and energy for 222 steps at dt 7.5e-07 with small initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodySmallRegression75Test004', 0, async (): Promise<void> => {
      const steps: number = 222;
      const dt: number = 7.5e-7;
      const mode: string = 'small';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.1690751638283933;
      const expectedEnd: number = -0.16907516382826204;
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

    // @tc.number SUB_NBODY_NBODYSMALLREGRESSION75TEST_0500
    // @tc.name nBodySmallRegression75Test005
    // @tc.desc Verify advance and energy for 223 steps at dt 7.5e-07 with small initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodySmallRegression75Test005', 0, async (): Promise<void> => {
      const steps: number = 223;
      const dt: number = 7.5e-7;
      const mode: string = 'small';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.1690751638283933;
      const expectedEnd: number = -0.16907516382826082;
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

    // @tc.number SUB_NBODY_NBODYSMALLREGRESSION75TEST_0600
    // @tc.name nBodySmallRegression75Test006
    // @tc.desc Verify advance and energy for 224 steps at dt 7.5e-07 with small initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodySmallRegression75Test006', 0, async (): Promise<void> => {
      const steps: number = 224;
      const dt: number = 7.5e-7;
      const mode: string = 'small';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516382839208;
      const expectedEnd: number = -0.16907516382825966;
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

    // @tc.number SUB_NBODY_NBODYSMALLREGRESSION75TEST_0700
    // @tc.name nBodySmallRegression75Test007
    // @tc.desc Verify advance and energy for 225 steps at dt 7.5e-07 with small initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodySmallRegression75Test007', 0, async (): Promise<void> => {
      const steps: number = 225;
      const dt: number = 7.5e-7;
      const mode: string = 'small';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516382839208;
      const expectedEnd: number = -0.16907516382825846;
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

    // @tc.number SUB_NBODY_NBODYSMALLREGRESSION75TEST_0800
    // @tc.name nBodySmallRegression75Test008
    // @tc.desc Verify advance and energy for 226 steps at dt 7.5e-07 with small initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodySmallRegression75Test008', 0, async (): Promise<void> => {
      const steps: number = 226;
      const dt: number = 7.5e-7;
      const mode: string = 'small';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516382839083;
      const expectedEnd: number = -0.16907516382825732;
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

    // @tc.number SUB_NBODY_NBODYSMALLREGRESSION75TEST_0900
    // @tc.name nBodySmallRegression75Test009
    // @tc.desc Verify advance and energy for 227 steps at dt 7.5e-07 with small initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodySmallRegression75Test009', 0, async (): Promise<void> => {
      const steps: number = 227;
      const dt: number = 7.5e-7;
      const mode: string = 'small';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516382839083;
      const expectedEnd: number = -0.16907516382825608;
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

    // @tc.number SUB_NBODY_NBODYSMALLREGRESSION75TEST_1000
    // @tc.name nBodySmallRegression75Test010
    // @tc.desc Verify advance and energy for 228 steps at dt 7.5e-07 with small initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodySmallRegression75Test010', 0, async (): Promise<void> => {
      const steps: number = 228;
      const dt: number = 7.5e-7;
      const mode: string = 'small';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516382838975;
      const expectedEnd: number = -0.16907516382825494;
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

    // @tc.number SUB_NBODY_NBODYSMALLREGRESSION75TEST_1100
    // @tc.name nBodySmallRegression75Test011
    // @tc.desc Verify advance and energy for 229 steps at dt 7.5e-07 with small initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodySmallRegression75Test011', 0, async (): Promise<void> => {
      const steps: number = 229;
      const dt: number = 7.5e-7;
      const mode: string = 'small';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516382838975;
      const expectedEnd: number = -0.16907516382825383;
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

    // @tc.number SUB_NBODY_NBODYSMALLREGRESSION75TEST_1200
    // @tc.name nBodySmallRegression75Test012
    // @tc.desc Verify advance and energy for 230 steps at dt 7.5e-07 with small initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodySmallRegression75Test012', 0, async (): Promise<void> => {
      const steps: number = 230;
      const dt: number = 7.5e-7;
      const mode: string = 'small';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516382838841;
      const expectedEnd: number = -0.16907516382825252;
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

    // @tc.number SUB_NBODY_NBODYSMALLREGRESSION75TEST_1300
    // @tc.name nBodySmallRegression75Test013
    // @tc.desc Verify advance and energy for 231 steps at dt 7.5e-07 with small initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodySmallRegression75Test013', 0, async (): Promise<void> => {
      const steps: number = 231;
      const dt: number = 7.5e-7;
      const mode: string = 'small';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516382838841;
      const expectedEnd: number = -0.1690751638282514;
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

    // @tc.number SUB_NBODY_NBODYSMALLREGRESSION75TEST_1400
    // @tc.name nBodySmallRegression75Test014
    // @tc.desc Verify advance and energy for 232 steps at dt 7.5e-07 with small initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodySmallRegression75Test014', 0, async (): Promise<void> => {
      const steps: number = 232;
      const dt: number = 7.5e-7;
      const mode: string = 'small';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516382838744;
      const expectedEnd: number = -0.16907516382825016;
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

    // @tc.number SUB_NBODY_NBODYSMALLREGRESSION75TEST_1500
    // @tc.name nBodySmallRegression75Test015
    // @tc.desc Verify advance and energy for 233 steps at dt 7.5e-07 with small initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodySmallRegression75Test015', 0, async (): Promise<void> => {
      const steps: number = 233;
      const dt: number = 7.5e-7;
      const mode: string = 'small';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516382838744;
      const expectedEnd: number = -0.16907516382824905;
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

    // @tc.number SUB_NBODY_NBODYSMALLREGRESSION75TEST_1600
    // @tc.name nBodySmallRegression75Test016
    // @tc.desc Verify advance and energy for 234 steps at dt 7.5e-07 with small initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodySmallRegression75Test016', 0, async (): Promise<void> => {
      const steps: number = 234;
      const dt: number = 7.5e-7;
      const mode: string = 'small';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516382838617;
      const expectedEnd: number = -0.16907516382824775;
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

    // @tc.number SUB_NBODY_NBODYSMALLREGRESSION75TEST_1700
    // @tc.name nBodySmallRegression75Test017
    // @tc.desc Verify advance and energy for 235 steps at dt 7.5e-07 with small initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodySmallRegression75Test017', 0, async (): Promise<void> => {
      const steps: number = 235;
      const dt: number = 7.5e-7;
      const mode: string = 'small';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516382838617;
      const expectedEnd: number = -0.16907516382824653;
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

    // @tc.number SUB_NBODY_NBODYSMALLREGRESSION75TEST_1800
    // @tc.name nBodySmallRegression75Test018
    // @tc.desc Verify advance and energy for 236 steps at dt 7.5e-07 with small initialization
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nBodySmallRegression75Test018', 0, async (): Promise<void> => {
      const steps: number = 236;
      const dt: number = 7.5e-7;
      const mode: string = 'small';
      const expectedStart: number = -0.16907516382852453;
      const expectedMiddle: number = -0.16907516382838497;
      const expectedEnd: number = -0.16907516382824553;
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
