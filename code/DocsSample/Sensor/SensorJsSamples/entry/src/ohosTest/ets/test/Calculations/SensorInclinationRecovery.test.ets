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
import { sensor } from '@kit.SensorServiceKit';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { assertNear, inclinationCallback } from '../Shared/SharedDriver';

export default function sensorInclinationRecoveryTest(): void {
  describe('SensorInclinationRecovery', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorInclinationRecoveryTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_RECOVERY_0100
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 87
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationRecoveryTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.6981317603441, 0.7159693046485, 0, 0, -0.7159693046485, 0.6981317603441, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 0.7980115463916;
        const promiseResult: number = await sensor.getInclination(input);
        const callbackResult: number = await inclinationCallback(input);
        assertNear(promiseResult, expectedInclination, 0.00002);
        assertNear(callbackResult, expectedInclination, 0.00002);
        assertNear(callbackResult, promiseResult, 0.00002);
        const assertionActual1 = Number.isFinite(promiseResult);
        expect(assertionActual1).assertTrue();
        expect(Math.abs(promiseResult)).assertLessOrEqual(Math.PI);
        const assertionActual2 = JSON.stringify(input);
        expect(assertionActual2).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          1, 0, 0, 0, 0.6981317603441, 0.7159693046485, 0, -0.7159693046485, 0.6981317603441,
        ];
        const alternateResult: number = await sensor.getInclination(alternateLayout);
        assertNear(alternateResult, expectedInclination, 0.00002);
        const identityResult: number = await sensor.getInclination([1, 0, 0, 0, 1, 0, 0, 0, 1]);
        assertNear(identityResult, 0, 0.000001);
        const repeatedResult: number = await sensor.getInclination(input);
        assertNear(repeatedResult, promiseResult, 0.00002);
      },
    );

    /**
     * @tc.name testSensorInclinationRecoveryTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_RECOVERY_0200
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 88
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationRecoveryTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.9443101809097, -0.3290566550463, 0, 0.3290566550463, 0.9443101809097];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -0.3353044232025;
        const promiseResult: number = await sensor.getInclination(input);
        const callbackResult: number = await inclinationCallback(input);
        assertNear(promiseResult, expectedInclination, 0.00002);
        assertNear(callbackResult, expectedInclination, 0.00002);
        assertNear(callbackResult, promiseResult, 0.00002);
        const assertionActual3 = Number.isFinite(promiseResult);
        expect(assertionActual3).assertTrue();
        expect(Math.abs(promiseResult)).assertLessOrEqual(Math.PI);
        const assertionActual4 = JSON.stringify(input);
        expect(assertionActual4).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          1, 0, 0, 0, 0, 0.9443101809097, -0.3290566550463, 0, 0, 0.3290566550463, 0.9443101809097, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number = await sensor.getInclination(alternateLayout);
        assertNear(alternateResult, expectedInclination, 0.00002);
        const identityResult: number = await sensor.getInclination([1, 0, 0, 0, 1, 0, 0, 0, 1]);
        assertNear(identityResult, 0, 0.000001);
        const repeatedResult: number = await sensor.getInclination(input);
        assertNear(repeatedResult, promiseResult, 0.00002);
      },
    );

    /**
     * @tc.name testSensorInclinationRecoveryTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_RECOVERY_0300
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 89
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationRecoveryTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.1019982419901, -0.9947845790074, 0, 0, 0.9947845790074, 0.1019982419901, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -1.468620392797;
        const promiseResult: number = await sensor.getInclination(input);
        const callbackResult: number = await inclinationCallback(input);
        assertNear(promiseResult, expectedInclination, 0.00002);
        assertNear(callbackResult, expectedInclination, 0.00002);
        assertNear(callbackResult, promiseResult, 0.00002);
        const assertionActual5 = Number.isFinite(promiseResult);
        expect(assertionActual5).assertTrue();
        expect(Math.abs(promiseResult)).assertLessOrEqual(Math.PI);
        const assertionActual6 = JSON.stringify(input);
        expect(assertionActual6).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          1, 0, 0, 0, 0.1019982419901, -0.9947845790074, 0, 0.9947845790074, 0.1019982419901,
        ];
        const alternateResult: number = await sensor.getInclination(alternateLayout);
        assertNear(alternateResult, expectedInclination, 0.00002);
        const identityResult: number = await sensor.getInclination([1, 0, 0, 0, 1, 0, 0, 0, 1]);
        assertNear(identityResult, 0, 0.000001);
        const repeatedResult: number = await sensor.getInclination(input);
        assertNear(repeatedResult, promiseResult, 0.00002);
      },
    );

    /**
     * @tc.name testSensorInclinationRecoveryTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_RECOVERY_0400
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 90
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationRecoveryTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.9340797186499, 0.357064530872, 0, -0.357064530872, 0.9340797186499];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 0.3651233659997;
        const promiseResult: number = await sensor.getInclination(input);
        const callbackResult: number = await inclinationCallback(input);
        assertNear(promiseResult, expectedInclination, 0.00002);
        assertNear(callbackResult, expectedInclination, 0.00002);
        assertNear(callbackResult, promiseResult, 0.00002);
        const assertionActual7 = Number.isFinite(promiseResult);
        expect(assertionActual7).assertTrue();
        expect(Math.abs(promiseResult)).assertLessOrEqual(Math.PI);
        const assertionActual8 = JSON.stringify(input);
        expect(assertionActual8).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          1, 0, 0, 0, 0, 0.9340797186499, 0.357064530872, 0, 0, -0.357064530872, 0.9340797186499, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number = await sensor.getInclination(alternateLayout);
        assertNear(alternateResult, expectedInclination, 0.00002);
        const identityResult: number = await sensor.getInclination([1, 0, 0, 0, 1, 0, 0, 0, 1]);
        assertNear(identityResult, 0, 0.000001);
        const repeatedResult: number = await sensor.getInclination(input);
        assertNear(repeatedResult, promiseResult, 0.00002);
      },
    );

    /**
     * @tc.name testSensorInclinationRecoveryTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_RECOVERY_0500
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 91
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationRecoveryTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.7191676886615, -0.6948365531442, 0, 0, 0.6948365531442, 0.7191676886615, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -0.7681926035944;
        const promiseResult: number = await sensor.getInclination(input);
        const callbackResult: number = await inclinationCallback(input);
        assertNear(promiseResult, expectedInclination, 0.00002);
        assertNear(callbackResult, expectedInclination, 0.00002);
        assertNear(callbackResult, promiseResult, 0.00002);
        const assertionActual9 = Number.isFinite(promiseResult);
        expect(assertionActual9).assertTrue();
        expect(Math.abs(promiseResult)).assertLessOrEqual(Math.PI);
        const assertionActual10 = JSON.stringify(input);
        expect(assertionActual10).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          1, 0, 0, 0, 0.7191676886615, -0.6948365531442, 0, 0.6948365531442, 0.7191676886615,
        ];
        const alternateResult: number = await sensor.getInclination(alternateLayout);
        assertNear(alternateResult, expectedInclination, 0.00002);
        const identityResult: number = await sensor.getInclination([1, 0, 0, 0, 1, 0, 0, 0, 1]);
        assertNear(identityResult, 0, 0.000001);
        const repeatedResult: number = await sensor.getInclination(input);
        assertNear(repeatedResult, promiseResult, 0.00002);
      },
    );

    /**
     * @tc.name testSensorInclinationRecoveryTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_RECOVERY_0600
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 92
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationRecoveryTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.4840219937012, 0.8750558322836, 0, -0.8750558322836, 0.4840219937012];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 1.065551155202;
        const promiseResult: number = await sensor.getInclination(input);
        const callbackResult: number = await inclinationCallback(input);
        assertNear(promiseResult, expectedInclination, 0.00002);
        assertNear(callbackResult, expectedInclination, 0.00002);
        assertNear(callbackResult, promiseResult, 0.00002);
        const assertionActual11 = Number.isFinite(promiseResult);
        expect(assertionActual11).assertTrue();
        expect(Math.abs(promiseResult)).assertLessOrEqual(Math.PI);
        const assertionActual12 = JSON.stringify(input);
        expect(assertionActual12).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          1, 0, 0, 0, 0, 0.4840219937012, 0.8750558322836, 0, 0, -0.8750558322836, 0.4840219937012, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number = await sensor.getInclination(alternateLayout);
        assertNear(alternateResult, expectedInclination, 0.00002);
        const identityResult: number = await sensor.getInclination([1, 0, 0, 0, 1, 0, 0, 0, 1]);
        assertNear(identityResult, 0, 0.000001);
        const repeatedResult: number = await sensor.getInclination(input);
        assertNear(repeatedResult, promiseResult, 0.00002);
      },
    );

    /**
     * @tc.name testSensorInclinationRecoveryTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_RECOVERY_0700
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 93
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationRecoveryTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.9977048434602, -0.06771296283626, 0, 0, 0.06771296283626, 0.9977048434602, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -0.06776481439218;
        const promiseResult: number = await sensor.getInclination(input);
        const callbackResult: number = await inclinationCallback(input);
        assertNear(promiseResult, expectedInclination, 0.00002);
        assertNear(callbackResult, expectedInclination, 0.00002);
        assertNear(callbackResult, promiseResult, 0.00002);
        const assertionActual13 = Number.isFinite(promiseResult);
        expect(assertionActual13).assertTrue();
        expect(Math.abs(promiseResult)).assertLessOrEqual(Math.PI);
        const assertionActual14 = JSON.stringify(input);
        expect(assertionActual14).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          1, 0, 0, 0, 0.9977048434602, -0.06771296283626, 0, 0.06771296283626, 0.9977048434602,
        ];
        const alternateResult: number = await sensor.getInclination(alternateLayout);
        assertNear(alternateResult, expectedInclination, 0.00002);
        const identityResult: number = await sensor.getInclination([1, 0, 0, 0, 1, 0, 0, 0, 1]);
        assertNear(identityResult, 0, 0.000001);
        const repeatedResult: number = await sensor.getInclination(input);
        assertNear(repeatedResult, promiseResult, 0.00002);
      },
    );

    /**
     * @tc.name testSensorInclinationRecoveryTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_RECOVERY_0800
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 94
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationRecoveryTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.3613502101201, -0.9324301719947, 0, 0.9324301719947, 0.3613502101201];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -1.201080783986;
        const promiseResult: number = await sensor.getInclination(input);
        const callbackResult: number = await inclinationCallback(input);
        assertNear(promiseResult, expectedInclination, 0.00002);
        assertNear(callbackResult, expectedInclination, 0.00002);
        assertNear(callbackResult, promiseResult, 0.00002);
        const assertionActual15 = Number.isFinite(promiseResult);
        expect(assertionActual15).assertTrue();
        expect(Math.abs(promiseResult)).assertLessOrEqual(Math.PI);
        const assertionActual16 = JSON.stringify(input);
        expect(assertionActual16).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          1, 0, 0, 0, 0, 0.3613502101201, -0.9324301719947, 0, 0, 0.9324301719947, 0.3613502101201, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number = await sensor.getInclination(alternateLayout);
        assertNear(alternateResult, expectedInclination, 0.00002);
        const identityResult: number = await sensor.getInclination([1, 0, 0, 0, 1, 0, 0, 0, 1]);
        assertNear(identityResult, 0, 0.000001);
        const repeatedResult: number = await sensor.getInclination(input);
        assertNear(repeatedResult, promiseResult, 0.00002);
      },
    );

    /**
     * @tc.name testSensorInclinationRecoveryTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_RECOVERY_0900
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 95
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationRecoveryTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.8064557674811, 0.5912944233599, 0, 0, -0.5912944233599, 0.8064557674811, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 0.63266297481;
        const promiseResult: number = await sensor.getInclination(input);
        const callbackResult: number = await inclinationCallback(input);
        assertNear(promiseResult, expectedInclination, 0.00002);
        assertNear(callbackResult, expectedInclination, 0.00002);
        assertNear(callbackResult, promiseResult, 0.00002);
        const assertionActual17 = Number.isFinite(promiseResult);
        expect(assertionActual17).assertTrue();
        expect(Math.abs(promiseResult)).assertLessOrEqual(Math.PI);
        const assertionActual18 = JSON.stringify(input);
        expect(assertionActual18).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          1, 0, 0, 0, 0.8064557674811, 0.5912944233599, 0, -0.5912944233599, 0.8064557674811,
        ];
        const alternateResult: number = await sensor.getInclination(alternateLayout);
        assertNear(alternateResult, expectedInclination, 0.00002);
        const identityResult: number = await sensor.getInclination([1, 0, 0, 0, 1, 0, 0, 0, 1]);
        assertNear(identityResult, 0, 0.000001);
        const repeatedResult: number = await sensor.getInclination(input);
        assertNear(repeatedResult, promiseResult, 0.00002);
      },
    );

    /**
     * @tc.name testSensorInclinationRecoveryTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_RECOVERY_1000
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 96
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationRecoveryTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.877269312435, -0.4799984931849, 0, 0.4799984931849, 0.877269312435];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -0.5006529947841;
        const promiseResult: number = await sensor.getInclination(input);
        const callbackResult: number = await inclinationCallback(input);
        assertNear(promiseResult, expectedInclination, 0.00002);
        assertNear(callbackResult, expectedInclination, 0.00002);
        assertNear(callbackResult, promiseResult, 0.00002);
        const assertionActual19 = Number.isFinite(promiseResult);
        expect(assertionActual19).assertTrue();
        expect(Math.abs(promiseResult)).assertLessOrEqual(Math.PI);
        const assertionActual20 = JSON.stringify(input);
        expect(assertionActual20).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          1, 0, 0, 0, 0, 0.877269312435, -0.4799984931849, 0, 0, 0.4799984931849, 0.877269312435, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number = await sensor.getInclination(alternateLayout);
        assertNear(alternateResult, expectedInclination, 0.00002);
        const identityResult: number = await sensor.getInclination([1, 0, 0, 0, 1, 0, 0, 0, 1]);
        assertNear(identityResult, 0, 0.000001);
        const repeatedResult: number = await sensor.getInclination(input);
        assertNear(repeatedResult, promiseResult, 0.00002);
      },
    );

    /**
     * @tc.name testSensorInclinationRecoveryTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_RECOVERY_1100
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 97
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationRecoveryTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.2354733286969, 0.9718808113511, 0, 0, -0.9718808113511, 0.2354733286969, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 1.333090764012;
        const promiseResult: number = await sensor.getInclination(input);
        const callbackResult: number = await inclinationCallback(input);
        assertNear(promiseResult, expectedInclination, 0.00002);
        assertNear(callbackResult, expectedInclination, 0.00002);
        assertNear(callbackResult, promiseResult, 0.00002);
        const assertionActual21 = Number.isFinite(promiseResult);
        expect(assertionActual21).assertTrue();
        expect(Math.abs(promiseResult)).assertLessOrEqual(Math.PI);
        const assertionActual22 = JSON.stringify(input);
        expect(assertionActual22).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          1, 0, 0, 0, 0.2354733286969, 0.9718808113511, 0, -0.9718808113511, 0.2354733286969,
        ];
        const alternateResult: number = await sensor.getInclination(alternateLayout);
        assertNear(alternateResult, expectedInclination, 0.00002);
        const identityResult: number = await sensor.getInclination([1, 0, 0, 0, 1, 0, 0, 0, 1]);
        assertNear(identityResult, 0, 0.000001);
        const repeatedResult: number = await sensor.getInclination(input);
        assertNear(repeatedResult, promiseResult, 0.00002);
      },
    );

    /**
     * @tc.name testSensorInclinationRecoveryTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_RECOVERY_1200
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 98
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationRecoveryTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.9801112944298, 0.198448609295, 0, -0.198448609295, 0.9801112944298];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 0.1997747944181;
        const promiseResult: number = await sensor.getInclination(input);
        const callbackResult: number = await inclinationCallback(input);
        assertNear(promiseResult, expectedInclination, 0.00002);
        assertNear(callbackResult, expectedInclination, 0.00002);
        assertNear(callbackResult, promiseResult, 0.00002);
        const assertionActual23 = Number.isFinite(promiseResult);
        expect(assertionActual23).assertTrue();
        expect(Math.abs(promiseResult)).assertLessOrEqual(Math.PI);
        const assertionActual24 = JSON.stringify(input);
        expect(assertionActual24).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          1, 0, 0, 0, 0, 0.9801112944298, 0.198448609295, 0, 0, -0.198448609295, 0.9801112944298, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number = await sensor.getInclination(alternateLayout);
        assertNear(alternateResult, expectedInclination, 0.00002);
        const identityResult: number = await sensor.getInclination([1, 0, 0, 0, 1, 0, 0, 0, 1]);
        assertNear(identityResult, 0, 0.000001);
        const repeatedResult: number = await sensor.getInclination(input);
        assertNear(repeatedResult, promiseResult, 0.00002);
      },
    );

    /**
     * @tc.name testSensorInclinationRecoveryTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_RECOVERY_1300
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 99
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationRecoveryTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.5949915631931, -0.8037319451963, 0, 0, 0.8037319451963, 0.5949915631931, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -0.933541175176;
        const promiseResult: number = await sensor.getInclination(input);
        const callbackResult: number = await inclinationCallback(input);
        assertNear(promiseResult, expectedInclination, 0.00002);
        assertNear(callbackResult, expectedInclination, 0.00002);
        assertNear(callbackResult, promiseResult, 0.00002);
        const assertionActual25 = Number.isFinite(promiseResult);
        expect(assertionActual25).assertTrue();
        expect(Math.abs(promiseResult)).assertLessOrEqual(Math.PI);
        const assertionActual26 = JSON.stringify(input);
        expect(assertionActual26).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          1, 0, 0, 0, 0.5949915631931, -0.8037319451963, 0, 0.8037319451963, 0.5949915631931,
        ];
        const alternateResult: number = await sensor.getInclination(alternateLayout);
        assertNear(alternateResult, expectedInclination, 0.00002);
        const identityResult: number = await sensor.getInclination([1, 0, 0, 0, 1, 0, 0, 0, 1]);
        assertNear(identityResult, 0, 0.000001);
        const repeatedResult: number = await sensor.getInclination(input);
        assertNear(repeatedResult, promiseResult, 0.00002);
      },
    );

    /**
     * @tc.name testSensorInclinationRecoveryTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_RECOVERY_1400
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationRecoveryTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.621451266315, 0.7834528215505, 0, -0.7834528215505, 0.621451266315];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 0.9002025836203;
        const promiseResult: number = await sensor.getInclination(input);
        const callbackResult: number = await inclinationCallback(input);
        assertNear(promiseResult, expectedInclination, 0.00002);
        assertNear(callbackResult, expectedInclination, 0.00002);
        assertNear(callbackResult, promiseResult, 0.00002);
        const assertionActual27 = Number.isFinite(promiseResult);
        expect(assertionActual27).assertTrue();
        expect(Math.abs(promiseResult)).assertLessOrEqual(Math.PI);
        const assertionActual28 = JSON.stringify(input);
        expect(assertionActual28).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          1, 0, 0, 0, 0, 0.621451266315, 0.7834528215505, 0, 0, -0.7834528215505, 0.621451266315, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number = await sensor.getInclination(alternateLayout);
        assertNear(alternateResult, expectedInclination, 0.00002);
        const identityResult: number = await sensor.getInclination([1, 0, 0, 0, 1, 0, 0, 0, 1]);
        assertNear(identityResult, 0, 0.000001);
        const repeatedResult: number = await sensor.getInclination(input);
        assertNear(repeatedResult, promiseResult, 0.00002);
      },
    );

    /**
     * @tc.name testSensorInclinationRecoveryTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_RECOVERY_1500
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 101
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationRecoveryTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.9729518951737, -0.2310078130234, 0, 0, 0.2310078130234, 0.9729518951737, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -0.2331133859738;
        const promiseResult: number = await sensor.getInclination(input);
        const callbackResult: number = await inclinationCallback(input);
        assertNear(promiseResult, expectedInclination, 0.00002);
        assertNear(callbackResult, expectedInclination, 0.00002);
        assertNear(callbackResult, promiseResult, 0.00002);
        const assertionActual29 = Number.isFinite(promiseResult);
        expect(assertionActual29).assertTrue();
        expect(Math.abs(promiseResult)).assertLessOrEqual(Math.PI);
        const assertionActual30 = JSON.stringify(input);
        expect(assertionActual30).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          1, 0, 0, 0, 0.9729518951737, -0.2310078130234, 0, 0.2310078130234, 0.9729518951737,
        ];
        const alternateResult: number = await sensor.getInclination(alternateLayout);
        assertNear(alternateResult, expectedInclination, 0.00002);
        const identityResult: number = await sensor.getInclination([1, 0, 0, 0, 1, 0, 0, 0, 1]);
        assertNear(identityResult, 0, 0.000001);
        const repeatedResult: number = await sensor.getInclination(input);
        assertNear(repeatedResult, promiseResult, 0.00002);
      },
    );

    /**
     * @tc.name testSensorInclinationRecoveryTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_RECOVERY_1600
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 102
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationRecoveryTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.2029473453852, -0.979189652213, 0, 0.979189652213, 0.2029473453852];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -1.366429355568;
        const promiseResult: number = await sensor.getInclination(input);
        const callbackResult: number = await inclinationCallback(input);
        assertNear(promiseResult, expectedInclination, 0.00002);
        assertNear(callbackResult, expectedInclination, 0.00002);
        assertNear(callbackResult, promiseResult, 0.00002);
        const assertionActual31 = Number.isFinite(promiseResult);
        expect(assertionActual31).assertTrue();
        expect(Math.abs(promiseResult)).assertLessOrEqual(Math.PI);
        const assertionActual32 = JSON.stringify(input);
        expect(assertionActual32).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          1, 0, 0, 0, 0, 0.2029473453852, -0.979189652213, 0, 0, 0.979189652213, 0.2029473453852, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number = await sensor.getInclination(alternateLayout);
        assertNear(alternateResult, expectedInclination, 0.00002);
        const identityResult: number = await sensor.getInclination([1, 0, 0, 0, 1, 0, 0, 0, 1]);
        assertNear(identityResult, 0, 0.000001);
        const repeatedResult: number = await sensor.getInclination(input);
        assertNear(repeatedResult, promiseResult, 0.00002);
      },
    );

    /**
     * @tc.name testSensorInclinationRecoveryTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_RECOVERY_1700
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 103
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationRecoveryTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.8927813414942, 0.4504902621365, 0, 0, -0.4504902621365, 0.8927813414942, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 0.4673144032284;
        const promiseResult: number = await sensor.getInclination(input);
        const callbackResult: number = await inclinationCallback(input);
        assertNear(promiseResult, expectedInclination, 0.00002);
        assertNear(callbackResult, expectedInclination, 0.00002);
        assertNear(callbackResult, promiseResult, 0.00002);
        const assertionActual33 = Number.isFinite(promiseResult);
        expect(assertionActual33).assertTrue();
        expect(Math.abs(promiseResult)).assertLessOrEqual(Math.PI);
        const assertionActual34 = JSON.stringify(input);
        expect(assertionActual34).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          1, 0, 0, 0, 0.8927813414942, 0.4504902621365, 0, -0.4504902621365, 0.8927813414942,
        ];
        const alternateResult: number = await sensor.getInclination(alternateLayout);
        assertNear(alternateResult, expectedInclination, 0.00002);
        const identityResult: number = await sensor.getInclination([1, 0, 0, 0, 1, 0, 0, 0, 1]);
        assertNear(identityResult, 0, 0.000001);
        const repeatedResult: number = await sensor.getInclination(input);
        assertNear(repeatedResult, promiseResult, 0.00002);
      },
    );

    /**
     * @tc.name testSensorInclinationRecoveryTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_RECOVERY_1800
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 104
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationRecoveryTest0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.7862983648669, -0.6178469724841, 0, 0.6178469724841, 0.7862983648669];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -0.6660015663657;
        const promiseResult: number = await sensor.getInclination(input);
        const callbackResult: number = await inclinationCallback(input);
        assertNear(promiseResult, expectedInclination, 0.00002);
        assertNear(callbackResult, expectedInclination, 0.00002);
        assertNear(callbackResult, promiseResult, 0.00002);
        const assertionActual35 = Number.isFinite(promiseResult);
        expect(assertionActual35).assertTrue();
        expect(Math.abs(promiseResult)).assertLessOrEqual(Math.PI);
        const assertionActual36 = JSON.stringify(input);
        expect(assertionActual36).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          1, 0, 0, 0, 0, 0.7862983648669, -0.6178469724841, 0, 0, 0.6178469724841, 0.7862983648669, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number = await sensor.getInclination(alternateLayout);
        assertNear(alternateResult, expectedInclination, 0.00002);
        const identityResult: number = await sensor.getInclination([1, 0, 0, 0, 1, 0, 0, 0, 1]);
        assertNear(identityResult, 0, 0.000001);
        const repeatedResult: number = await sensor.getInclination(input);
        assertNear(repeatedResult, promiseResult, 0.00002);
      },
    );
  });
}
