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

export default function sensorCalculationResultsTest(): void {
  describe('SensorCalculationResults', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorCalculationResultsTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RESULTS_0100
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 26
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationResultsTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.2875315363654, -0.9577711707894, 0, 0.9577711707894, 0.2875315363654];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -1.279147789738;
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
          1, 0, 0, 0, 0, 0.2875315363654, -0.9577711707894, 0, 0, 0.9577711707894, 0.2875315363654, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorCalculationResultsTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RESULTS_0200
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 27
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationResultsTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.8501132722925, 0.5265998711282, 0, 0, -0.5265998711282, 0.8501132722925, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 0.5545959690585;
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
          1, 0, 0, 0, 0.8501132722925, 0.5265998711282, 0, -0.5265998711282, 0.8501132722925,
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
     * @tc.name testSensorCalculationResultsTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RESULTS_0300
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 28
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationResultsTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.8371634348397, -0.5469528163996, 0, 0.5469528163996, 0.8371634348397];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -0.5787200005356;
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
          1, 0, 0, 0, 0, 0.8371634348397, -0.5469528163996, 0, 0, 0.5469528163996, 0.8371634348397, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorCalculationResultsTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RESULTS_0400
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 29
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationResultsTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.3105509340605, 0.9505567407336, 0, 0, -0.9505567407336, 0.3105509340605, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 1.255023758261;
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
          1, 0, 0, 0, 0.3105509340605, 0.9505567407336, 0, -0.9505567407336, 0.3105509340605,
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
     * @tc.name testSensorCalculationResultsTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RESULTS_0500
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 30
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationResultsTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.9926027450186, 0.1214075392283, 0, -0.1214075392283, 0.9926027450186];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 0.1217077886666;
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
          1, 0, 0, 0, 0, 0.9926027450186, 0.1214075392283, 0, 0, -0.1214075392283, 0.9926027450186, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorCalculationResultsTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RESULTS_0600
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 31
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationResultsTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.5304981753789, -0.8476860774601, 0, 0, 0.8476860774601, 0.5304981753789, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -1.011608180928;
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
          1, 0, 0, 0, 0.5304981753789, -0.8476860774601, 0, 0.8476860774601, 0.5304981753789,
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
     * @tc.name testSensorCalculationResultsTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RESULTS_0700
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 32
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationResultsTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.6806582339216, 0.7326010978662, 0, -0.7326010978662, 0.6806582339216];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 0.8221355778688;
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
          1, 0, 0, 0, 0, 0.6806582339216, 0.7326010978662, 0, 0, -0.7326010978662, 0.6806582339216, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorCalculationResultsTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RESULTS_0800
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 33
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationResultsTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.9519728178243, -0.3061825503252, 0, 0, 0.3061825503252, 0.9519728178243, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -0.3111803917253;
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
          1, 0, 0, 0, 0.9519728178243, -0.3061825503252, 0, 0.3061825503252, 0.9519728178243,
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
     * @tc.name testSensorCalculationResultsTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RESULTS_0900
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 34
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationResultsTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.1259644503897, -0.9920347560635, 0, 0.9920347560635, 0.1259644503897];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -1.444496361319;
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
          1, 0, 0, 0, 0, 0.1259644503897, -0.9920347560635, 0, 0, 0.9920347560635, 0.1259644503897, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorCalculationResultsTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RESULTS_1000
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 35
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationResultsTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.9251949286517, 0.3794922186254, 0, 0, -0.3794922186254, 0.9251949286517, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 0.3892473974769;
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
          1, 0, 0, 0, 0.9251949286517, 0.3794922186254, 0, -0.3794922186254, 0.9251949286517,
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
     * @tc.name testSensorCalculationResultsTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RESULTS_1100
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 36
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationResultsTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.7357190652724, -0.6772868350963, 0, 0.6772868350963, 0.7357190652724];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -0.7440685721172;
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
          1, 0, 0, 0, 0, 0.7357190652724, -0.6772868350963, 0, 0, 0.6772868350963, 0.7357190652724, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorCalculationResultsTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RESULTS_1200
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 37
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationResultsTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.4627733307058, 0.886476646273, 0, 0, -0.886476646273, 0.4627733307058, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 1.089675186679;
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
          1, 0, 0, 0, 0.4627733307058, 0.886476646273, 0, -0.886476646273, 0.4627733307058,
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
     * @tc.name testSensorCalculationResultsTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RESULTS_1300
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 38
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationResultsTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.9990478921565, -0.04362693179181, 0, 0.04362693179181, 0.9990478921565];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -0.04364078291504;
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
          1, 0, 0, 0, 0, 0.9990478921565, -0.04362693179181, 0, 0, 0.04362693179181, 0.9990478921565, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorCalculationResultsTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RESULTS_1400
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 39
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationResultsTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.3837368610122, -0.9234424841323, 0, 0, 0.9234424841323, 0.3837368610122, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -1.176956752509;
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
          1, 0, 0, 0, 0.3837368610122, -0.9234424841323, 0, 0.9234424841323, 0.3837368610122,
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
     * @tc.name testSensorCalculationResultsTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RESULTS_1500
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 40
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationResultsTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.7919580910274, 0.610575451567, 0, -0.610575451567, 0.7919580910274];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 0.6567870062871;
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
          1, 0, 0, 0, 0, 0.7919580910274, 0.610575451567, 0, 0, -0.610575451567, 0.7919580910274, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorCalculationResultsTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RESULTS_1600
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 41
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationResultsTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.8885924287286, -0.4586976080231, 0, 0, 0.4586976080231, 0.8885924287286, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -0.4765289633069;
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
          1, 0, 0, 0, 0.8885924287286, -0.4586976080231, 0, 0.4586976080231, 0.8885924287286,
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
     * @tc.name testSensorCalculationResultsTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RESULTS_1700
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 42
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationResultsTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.2119614037019, 0.9772780378893, 0, -0.9772780378893, 0.2119614037019];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 1.357214795489;
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
          1, 0, 0, 0, 0, 0.2119614037019, 0.9772780378893, 0, 0, -0.9772780378893, 0.2119614037019, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorCalculationResultsTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RESULTS_1800
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 43
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationResultsTest0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.9750391949579, 0.2220328090529, 0, 0, -0.2220328090529, 0.9750391949579, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 0.2238988258953;
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
          1, 0, 0, 0, 0.9750391949579, 0.2220328090529, 0, -0.2220328090529, 0.9750391949579,
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
     * @tc.name testSensorCalculationResultsTest0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RESULTS_1900
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 44
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationResultsTest0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.6142058124409, -0.7891458800271, 0, 0.7891458800271, 0.6142058124409];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -0.9094171436988;
        const promiseResult: number = await sensor.getInclination(input);
        const callbackResult: number = await inclinationCallback(input);
        assertNear(promiseResult, expectedInclination, 0.00002);
        assertNear(callbackResult, expectedInclination, 0.00002);
        assertNear(callbackResult, promiseResult, 0.00002);
        const assertionActual37 = Number.isFinite(promiseResult);
        expect(assertionActual37).assertTrue();
        expect(Math.abs(promiseResult)).assertLessOrEqual(Math.PI);
        const assertionActual38 = JSON.stringify(input);
        expect(assertionActual38).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          1, 0, 0, 0, 0, 0.6142058124409, -0.7891458800271, 0, 0, 0.7891458800271, 0.6142058124409, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorCalculationResultsTest0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RESULTS_2000
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 45
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationResultsTest0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.6023722350562, 0.7982153158349, 0, 0, -0.7982153158349, 0.6023722350562, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 0.9243266150974;
        const promiseResult: number = await sensor.getInclination(input);
        const callbackResult: number = await inclinationCallback(input);
        assertNear(promiseResult, expectedInclination, 0.00002);
        assertNear(callbackResult, expectedInclination, 0.00002);
        assertNear(callbackResult, promiseResult, 0.00002);
        const assertionActual39 = Number.isFinite(promiseResult);
        expect(assertionActual39).assertTrue();
        expect(Math.abs(promiseResult)).assertLessOrEqual(Math.PI);
        const assertionActual40 = JSON.stringify(input);
        expect(assertionActual40).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          1, 0, 0, 0, 0.6023722350562, 0.7982153158349, 0, -0.7982153158349, 0.6023722350562,
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
     * @tc.name testSensorCalculationResultsTest0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RESULTS_2100
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 46
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationResultsTest0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.9782410942662, -0.2074713510073, 0, 0.2074713510073, 0.9782410942662];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -0.2089893544966;
        const promiseResult: number = await sensor.getInclination(input);
        const callbackResult: number = await inclinationCallback(input);
        assertNear(promiseResult, expectedInclination, 0.00002);
        assertNear(callbackResult, expectedInclination, 0.00002);
        assertNear(callbackResult, promiseResult, 0.00002);
        const assertionActual41 = Number.isFinite(promiseResult);
        expect(assertionActual41).assertTrue();
        expect(Math.abs(promiseResult)).assertLessOrEqual(Math.PI);
        const assertionActual42 = JSON.stringify(input);
        expect(assertionActual42).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          1, 0, 0, 0, 0, 0.9782410942662, -0.2074713510073, 0, 0, 0.2074713510073, 0.9782410942662, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorCalculationResultsTest0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RESULTS_2200
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 47
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationResultsTest0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.226508004575, -0.9740093037869, 0, 0, 0.9740093037869, 0.226508004575, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -1.342305324091;
        const promiseResult: number = await sensor.getInclination(input);
        const callbackResult: number = await inclinationCallback(input);
        assertNear(promiseResult, expectedInclination, 0.00002);
        assertNear(callbackResult, expectedInclination, 0.00002);
        assertNear(callbackResult, promiseResult, 0.00002);
        const assertionActual43 = Number.isFinite(promiseResult);
        expect(assertionActual43).assertTrue();
        expect(Math.abs(promiseResult)).assertLessOrEqual(Math.PI);
        const assertionActual44 = JSON.stringify(input);
        expect(assertionActual44).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          1, 0, 0, 0, 0.226508004575, -0.9740093037869, 0, 0.9740093037869, 0.226508004575,
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
     * @tc.name testSensorCalculationResultsTest0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RESULTS_2300
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 48
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationResultsTest0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.8816549814179, 0.4718945790545, 0, -0.4718945790545, 0.8816549814179];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 0.4914384347056;
        const promiseResult: number = await sensor.getInclination(input);
        const callbackResult: number = await inclinationCallback(input);
        assertNear(promiseResult, expectedInclination, 0.00002);
        assertNear(callbackResult, expectedInclination, 0.00002);
        assertNear(callbackResult, promiseResult, 0.00002);
        const assertionActual45 = Number.isFinite(promiseResult);
        expect(assertionActual45).assertTrue();
        expect(Math.abs(promiseResult)).assertLessOrEqual(Math.PI);
        const assertionActual46 = JSON.stringify(input);
        expect(assertionActual46).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          1, 0, 0, 0, 0, 0.8816549814179, 0.4718945790545, 0, 0, -0.4718945790545, 0.8816549814179, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorCalculationResultsTest0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RESULTS_2400
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 49
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationResultsTest0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.8009730895182, -0.5987003506493, 0, 0, 0.5987003506493, 0.8009730895182, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -0.6418775348885;
        const promiseResult: number = await sensor.getInclination(input);
        const callbackResult: number = await inclinationCallback(input);
        assertNear(promiseResult, expectedInclination, 0.00002);
        assertNear(callbackResult, expectedInclination, 0.00002);
        assertNear(callbackResult, promiseResult, 0.00002);
        const assertionActual47 = Number.isFinite(promiseResult);
        expect(assertionActual47).assertTrue();
        expect(Math.abs(promiseResult)).assertLessOrEqual(Math.PI);
        const assertionActual48 = JSON.stringify(input);
        expect(assertionActual48).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          1, 0, 0, 0, 0.8009730895182, -0.5987003506493, 0, 0.5987003506493, 0.8009730895182,
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
     * @tc.name testSensorCalculationResultsTest0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RESULTS_2500
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 50
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationResultsTest0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.3699266816976, 0.9290609507283, 0, -0.9290609507283, 0.3699266816976];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 1.191866223908;
        const promiseResult: number = await sensor.getInclination(input);
        const callbackResult: number = await inclinationCallback(input);
        assertNear(promiseResult, expectedInclination, 0.00002);
        assertNear(callbackResult, expectedInclination, 0.00002);
        assertNear(callbackResult, promiseResult, 0.00002);
        const assertionActual49 = Number.isFinite(promiseResult);
        expect(assertionActual49).assertTrue();
        expect(Math.abs(promiseResult)).assertLessOrEqual(Math.PI);
        const assertionActual50 = JSON.stringify(input);
        expect(assertionActual50).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          1, 0, 0, 0, 0, 0.3699266816976, 0.9290609507283, 0, 0, -0.9290609507283, 0.3699266816976, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorCalculationResultsTest0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RESULTS_2600
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 51
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationResultsTest0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.9982864234744, 0.05851680704444, 0, 0, -0.05851680704444, 0.9982864234744, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 0.05855025431365;
        const promiseResult: number = await sensor.getInclination(input);
        const callbackResult: number = await inclinationCallback(input);
        assertNear(promiseResult, expectedInclination, 0.00002);
        assertNear(callbackResult, expectedInclination, 0.00002);
        assertNear(callbackResult, promiseResult, 0.00002);
        const assertionActual51 = Number.isFinite(promiseResult);
        expect(assertionActual51).assertTrue();
        expect(Math.abs(promiseResult)).assertLessOrEqual(Math.PI);
        const assertionActual52 = JSON.stringify(input);
        expect(assertionActual52).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          1, 0, 0, 0, 0.9982864234744, 0.05851680704444, 0, -0.05851680704444, 0.9982864234744,
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
