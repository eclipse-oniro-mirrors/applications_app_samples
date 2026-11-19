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

export default function sensorInclinationNumericValidationTest(): void {
  describe('SensorInclinationNumericValidation', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorInclinationNumericValidationTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_NUMERIC_VALIDATION_0100
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationNumericValidationTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.3974617401432, -0.9176187471506, 0, 0.9176187471506, 0.3974617401432];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -1.162047281111;
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
          1, 0, 0, 0, 0, 0.3974617401432, -0.9176187471506, 0, 0, 0.9176187471506, 0.3974617401432, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorInclinationNumericValidationTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_NUMERIC_VALIDATION_0200
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 129
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationNumericValidationTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.7827670495826, 0.6223148287546, 0, 0, -0.6223148287546, 0.7827670495826, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 0.6716964776858;
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
          1, 0, 0, 0, 0.7827670495826, 0.6223148287546, 0, -0.6223148287546, 0.7827670495826,
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
     * @tc.name testSensorInclinationNumericValidationTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_NUMERIC_VALIDATION_0300
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 130
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationNumericValidationTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.8953323524105, -0.4453986739171, 0, 0.4453986739171, 0.8953323524105];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -0.4616194919083;
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
          1, 0, 0, 0, 0, 0.8953323524105, -0.4453986739171, 0, 0, 0.4453986739171, 0.8953323524105, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorInclinationNumericValidationTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_NUMERIC_VALIDATION_0400
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 131
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationNumericValidationTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.1973676863058, 0.9803295345966, 0, 0, -0.9803295345966, 0.1973676863058, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 1.372124266888;
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
          1, 0, 0, 0, 0.1973676863058, 0.9803295345966, 0, -0.9803295345966, 0.1973676863058,
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
     * @tc.name testSensorInclinationNumericValidationTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_NUMERIC_VALIDATION_0500
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 132
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationNumericValidationTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.9716205559228, 0.2365449118206, 0, -0.2365449118206, 0.9716205559228];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 0.2388082972939;
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
          1, 0, 0, 0, 0, 0.9716205559228, 0.2365449118206, 0, 0, -0.2365449118206, 0.9716205559228, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorInclinationNumericValidationTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_NUMERIC_VALIDATION_0600
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 133
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationNumericValidationTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.6259028591092, -0.7799010263867, 0, 0, 0.7799010263867, 0.6259028591092, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -0.8945076723002;
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
          1, 0, 0, 0, 0.6259028591092, -0.7799010263867, 0, 0.7799010263867, 0.6259028591092,
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
     * @tc.name testSensorInclinationNumericValidationTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_NUMERIC_VALIDATION_0700
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 134
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationNumericValidationTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.5904047574197, 0.8071073177813, 0, -0.8071073177813, 0.5904047574197];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 0.9392360864961;
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
          1, 0, 0, 0, 0, 0.5904047574197, 0.8071073177813, 0, 0, -0.8071073177813, 0.5904047574197, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorInclinationNumericValidationTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_NUMERIC_VALIDATION_0800
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 135
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationNumericValidationTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.9812255421034, -0.1928637745246, 0, 0, 0.1928637745246, 0.9812255421034, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -0.194079883098;
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
          1, 0, 0, 0, 0.9812255421034, -0.1928637745246, 0, 0.1928637745246, 0.9812255421034,
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
     * @tc.name testSensorInclinationNumericValidationTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_NUMERIC_VALIDATION_0900
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 136
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationNumericValidationTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.241004255387, -0.9705240588905, 0, 0.9705240588905, 0.241004255387];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -1.327395852692;
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
          1, 0, 0, 0, 0, 0.241004255387, -0.9705240588905, 0, 0, 0.9705240588905, 0.241004255387, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorInclinationNumericValidationTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_NUMERIC_VALIDATION_1000
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 137
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationNumericValidationTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.874521552591, 0.4849866534801, 0, 0, -0.4849866534801, 0.874521552591, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 0.5063479061042;
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
          1, 0, 0, 0, 0.874521552591, 0.4849866534801, 0, -0.4849866534801, 0.874521552591,
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
     * @tc.name testSensorInclinationNumericValidationTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_NUMERIC_VALIDATION_1100
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 138
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationNumericValidationTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.809810041127, -0.5866921656967, 0, 0.5866921656967, 0.809810041127];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -0.6269680634899;
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
          1, 0, 0, 0, 0, 0.809810041127, -0.5866921656967, 0, 0, 0.5866921656967, 0.809810041127, 0, 0, 0, 0, 1,
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
