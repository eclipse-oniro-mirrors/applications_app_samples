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

export default function sensorInclinationMatrixValidationTest(): void {
  describe('SensorInclinationMatrixValidation', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorInclinationMatrixValidationTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_MATRIX_VALIDATION_0100
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 139
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationMatrixValidationTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.3560342720395, 0.9344728980197, 0, 0, -0.9344728980197, 0.3560342720395, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 1.206775695306;
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
          1, 0, 0, 0, 0.3560342720395, 0.9344728980197, 0, -0.9344728980197, 0.3560342720395,
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
     * @tc.name testSensorInclinationMatrixValidationTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_MATRIX_VALIDATION_0200
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 140
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationMatrixValidationTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.9973030474806, 0.07339367470024, 0, -0.07339367470024, 0.9973030474806];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 0.07345972571228;
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
          1, 0, 0, 0, 0, 0.9973030474806, 0.07339367470024, 0, 0, -0.07339367470024, 0.9973030474806, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorInclinationMatrixValidationTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_MATRIX_VALIDATION_0300
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 141
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationMatrixValidationTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.4889974832464, -0.8722851949785, 0, 0, 0.8722851949785, 0.4889974832464, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -1.059856243882;
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
          1, 0, 0, 0, 0.4889974832464, -0.8722851949785, 0, 0.8722851949785, 0.4889974832464,
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
     * @tc.name testSensorInclinationMatrixValidationTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_MATRIX_VALIDATION_0400
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 142
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationMatrixValidationTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.7151990155014, 0.698920859773, 0, -0.698920859773, 0.7151990155014];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 0.7738875149145;
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
          1, 0, 0, 0, 0, 0.7151990155014, 0.698920859773, 0, 0, -0.698920859773, 0.7151990155014, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorInclinationMatrixValidationTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_MATRIX_VALIDATION_0500
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 143
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationMatrixValidationTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.9360980114946, -0.3517392683167, 0, 0, 0.3517392683167, 0.9360980114946, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -0.3594284546797;
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
          1, 0, 0, 0, 0.9360980114946, -0.3517392683167, 0, 0.3517392683167, 0.9360980114946,
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
     * @tc.name testSensorInclinationMatrixValidationTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_MATRIX_VALIDATION_0600
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 144
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationMatrixValidationTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.09633140865258, 0.99534931542, 0, -0.99534931542, 0.09633140865258];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 1.474315304117;
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
          1, 0, 0, 0, 0, 0.09633140865258, 0.99534931542, 0, 0, -0.99534931542, 0.09633140865258, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorInclinationMatrixValidationTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_MATRIX_VALIDATION_0700
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 145
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationMatrixValidationTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.9424209296697, 0.3344290527459, 0, 0, -0.3344290527459, 0.9424209296697, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 0.3409993345226;
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
          1, 0, 0, 0, 0.9424209296697, 0.3344290527459, 0, -0.3344290527459, 0.9424209296697,
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
     * @tc.name testSensorInclinationMatrixValidationTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_MATRIX_VALIDATION_0800
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 146
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationMatrixValidationTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.7021977991231, -0.7119819175419, 0, 0.7119819175419, 0.7021977991231];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -0.7923166350715;
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
          1, 0, 0, 0, 0, 0.7021977991231, -0.7119819175419, 0, 0, 0.7119819175419, 0.7021977991231, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorInclinationMatrixValidationTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_MATRIX_VALIDATION_0900
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 147
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationMatrixValidationTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.5049889846128, 0.8631257877157, 0, 0, -0.8631257877157, 0.5049889846128, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 1.041427123725;
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
          1, 0, 0, 0, 0.5049889846128, 0.8631257877157, 0, -0.8631257877157, 0.5049889846128,
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
     * @tc.name testSensorInclinationMatrixValidationTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_MATRIX_VALIDATION_1000
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 148
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationMatrixValidationTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.9957811897375, -0.09175958895366, 0, 0.09175958895366, 0.9957811897375];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -0.09188884586933;
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
          1, 0, 0, 0, 0, 0.9957811897375, -0.09175958895366, 0, 0, 0.09175958895366, 0.9957811897375, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorInclinationMatrixValidationTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_MATRIX_VALIDATION_1100
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 149
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationMatrixValidationTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.3387532748442, -0.9408752408169, 0, 0, 0.9408752408169, 0.3387532748442, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -1.225204815463;
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
          1, 0, 0, 0, 0.3387532748442, -0.9408752408169, 0, 0.9408752408169, 0.3387532748442,
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
     * @tc.name testSensorInclinationMatrixValidationTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_MATRIX_VALIDATION_1200
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 150
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationMatrixValidationTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.820484134524, 0.5716692968792, 0, -0.5716692968792, 0.820484134524];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 0.6085389433328;
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
          1, 0, 0, 0, 0, 0.820484134524, 0.5716692968792, 0, 0, -0.5716692968792, 0.820484134524, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorInclinationMatrixValidationTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_MATRIX_VALIDATION_1300
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 151
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationMatrixValidationTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.8654356774488, -0.5010200477014, 0, 0, 0.5010200477014, 0.8654356774488, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -0.5247770262612;
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
          1, 0, 0, 0, 0.8654356774488, -0.5010200477014, 0, 0.5010200477014, 0.8654356774488,
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
     * @tc.name testSensorInclinationMatrixValidationTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_MATRIX_VALIDATION_1400
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 152
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationMatrixValidationTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.258848222185, 0.9659180078411, 0, -0.9659180078411, 0.258848222185];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 1.308966732535;
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
          1, 0, 0, 0, 0, 0.258848222185, 0.9659180078411, 0, 0, -0.9659180078411, 0.258848222185, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorInclinationMatrixValidationTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_MATRIX_VALIDATION_1500
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 153
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationMatrixValidationTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.9846130272772, 0.1747489242201, 0, 0, -0.1747489242201, 0.9846130272772, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 0.175650762941;
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
          1, 0, 0, 0, 0.9846130272772, 0.1747489242201, 0, -0.1747489242201, 0.9846130272772,
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
     * @tc.name testSensorInclinationMatrixValidationTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_MATRIX_VALIDATION_1600
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 154
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationMatrixValidationTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.5754310641556, -0.8178502860577, 0, 0.8178502860577, 0.5754310641556];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -0.9576652066532;
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
          1, 0, 0, 0, 0, 0.5754310641556, -0.8178502860577, 0, 0, 0.8178502860577, 0.5754310641556, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorInclinationMatrixValidationTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_MATRIX_VALIDATION_1700
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 155
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationMatrixValidationTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.6401686498069, 0.7682344042052, 0, 0, -0.7682344042052, 0.6401686498069, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 0.8760785521431;
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
          1, 0, 0, 0, 0.6401686498069, 0.7682344042052, 0, -0.7682344042052, 0.6401686498069,
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
