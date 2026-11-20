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

export default function sensorInclinationOperationsTest(): void {
  describe('SensorInclinationOperations', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorInclinationOperationsTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_OPERATIONS_0100
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 105
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationOperationsTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.3922295657744, 0.9198673642066, 0, 0, -0.9198673642066, 0.3922295657744, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 1.167742192431;
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
          1, 0, 0, 0, 0.3922295657744, 0.9198673642066, 0, -0.9198673642066, 0.3922295657744,
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
     * @tc.name testSensorInclinationOperationsTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_OPERATIONS_0200
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 106
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationOperationsTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.9994074761139, 0.03441942311475, 0, -0.03441942311475, 0.9994074761139];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 0.03442622283649;
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
          1, 0, 0, 0, 0, 0.9994074761139, 0.03441942311475, 0, 0, -0.03441942311475, 0.9994074761139, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorInclinationOperationsTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_OPERATIONS_0300
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 107
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationOperationsTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.4545853075181, -0.8907032043216, 0, 0, 0.8907032043216, 0.4545853075181, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -1.098889746758;
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
          1, 0, 0, 0, 0.4545853075181, -0.8907032043216, 0, 0.8907032043216, 0.4545853075181,
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
     * @tc.name testSensorInclinationOperationsTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_OPERATIONS_0400
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 108
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationOperationsTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.7419286431486, 0.670478850133, 0, -0.670478850133, 0.7419286431486];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 0.7348540120387;
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
          1, 0, 0, 0, 0, 0.7419286431486, 0.670478850133, 0, 0, -0.670478850133, 0.7419286431486, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorInclinationOperationsTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_OPERATIONS_0500
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 109
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationOperationsTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.9216588462869, -0.3880012513654, 0, 0, 0.3880012513654, 0.9216588462869, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -0.3984619575554;
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
          1, 0, 0, 0, 0.9216588462869, -0.3880012513654, 0, 0.3880012513654, 0.9216588462869,
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
     * @tc.name testSensorInclinationOperationsTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_OPERATIONS_0600
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 110
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationOperationsTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.1351001372258, 0.9908319498894, 0, -0.9908319498894, 0.1351001372258];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 1.435281801241;
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
          1, 0, 0, 0, 0, 0.1351001372258, 0.9908319498894, 0, 0, -0.9908319498894, 0.1351001372258, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorInclinationOperationsTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_OPERATIONS_0700
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 111
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationOperationsTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.9547537005798, 0.2973976651375, 0, 0, -0.2973976651375, 0.9547537005798, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 0.3019658316468;
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
          1, 0, 0, 0, 0.9547537005798, 0.2973976651375, 0, -0.2973976651375, 0.9547537005798,
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
     * @tc.name testSensorInclinationOperationsTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_OPERATIONS_0800
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 112
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationOperationsTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.6738788361212, -0.7388418736292, 0, 0.7388418736292, 0.6738788361212];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -0.8313501379473;
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
          1, 0, 0, 0, 0, 0.6738788361212, -0.7388418736292, 0, 0, 0.7388418736292, 0.6738788361212, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorInclinationOperationsTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_OPERATIONS_0900
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 113
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationOperationsTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.5382865974895, 0.8427618518675, 0, 0, -0.8427618518675, 0.5382865974895, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 1.002393620849;
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
          1, 0, 0, 0, 0.5382865974895, 0.8427618518675, 0, -0.8427618518675, 0.5382865974895,
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
     * @tc.name testSensorInclinationOperationsTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_OPERATIONS_1000
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 114
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationOperationsTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.9914419040687, -0.1305486532167, 0, 0.1305486532167, 0.9914419040687];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -0.1309223487451;
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
          1, 0, 0, 0, 0, 0.9914419040687, -0.1305486532167, 0, 0, 0.1305486532167, 0.9914419040687, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorInclinationOperationsTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_OPERATIONS_1100
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 115
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationOperationsTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.3017789117613, -0.9533779357716, 0, 0, 0.9533779357716, 0.3017789117613, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -1.264238318339;
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
          1, 0, 0, 0, 0.3017789117613, -0.9533779357716, 0, 0.9533779357716, 0.3017789117613,
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
     * @tc.name testSensorInclinationOperationsTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_OPERATIONS_1200
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 116
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationOperationsTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.8421677523708, 0.5392156125954, 0, -0.5392156125954, 0.8421677523708];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 0.5695054404571;
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
          1, 0, 0, 0, 0, 0.8421677523708, 0.5392156125954, 0, 0, -0.5392156125954, 0.8421677523708, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorInclinationOperationsTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_OPERATIONS_1300
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 117
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationOperationsTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.8452248643067, -0.5344108239526, 0, 0, 0.5344108239526, 0.8452248643067, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -0.563810529137;
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
          1, 0, 0, 0, 0.8452248643067, -0.5344108239526, 0, 0.5344108239526, 0.8452248643067,
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
     * @tc.name testSensorInclinationOperationsTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_OPERATIONS_1400
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 118
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationOperationsTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.2963446446744, 0.9550810706808, 0, -0.9550810706808, 0.2963446446744];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 1.269933229659;
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
          1, 0, 0, 0, 0, 0.2963446446744, 0.9550810706808, 0, 0, -0.9550810706808, 0.2963446446744, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorInclinationOperationsTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_OPERATIONS_1500
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 119
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationOperationsTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.9906823678984, 0.1361926794478, 0, 0, -0.1361926794478, 0.9906823678984, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 0.1366172600652;
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
          1, 0, 0, 0, 0.9906823678984, 0.1361926794478, 0, -0.1361926794478, 0.9906823678984,
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
     * @tc.name testSensorInclinationOperationsTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_OPERATIONS_1600
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 120
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationOperationsTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.5430772967214, -0.8396827078045, 0, 0.8396827078045, 0.5430772967214];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -0.9966987095289;
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
          1, 0, 0, 0, 0, 0.5430772967214, -0.8396827078045, 0, 0, 0.8396827078045, 0.5430772967214, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorInclinationOperationsTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_OPERATIONS_1700
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 121
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationOperationsTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.6696602923203, 0.7426675520645, 0, 0, -0.7426675520645, 0.6696602923203, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 0.8370450492674;
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
          1, 0, 0, 0, 0.6696602923203, 0.7426675520645, 0, -0.7426675520645, 0.6696602923203,
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
     * @tc.name testSensorInclinationOperationsTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_OPERATIONS_1800
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 122
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationOperationsTest0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.9564318625035, -0.2919556342805, 0, 0.2919556342805, 0.9564318625035];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -0.2962709203267;
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
          1, 0, 0, 0, 0, 0.9564318625035, -0.2919556342805, 0, 0, 0.2919556342805, 0.9564318625035, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorInclinationOperationsTest0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_OPERATIONS_1900
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 123
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationOperationsTest0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.140740616034, -0.9900465034524, 0, 0, 0.9900465034524, 0.140740616034, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -1.429586889921;
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
          1, 0, 0, 0, 0.140740616034, -0.9900465034524, 0, 0.9900465034524, 0.140740616034,
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
     * @tc.name testSensorInclinationOperationsTest0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_OPERATIONS_2000
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 124
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationOperationsTest0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.9194342799258, 0.3932436965768, 0, -0.3932436965768, 0.9194342799258];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 0.4041568688755;
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
          1, 0, 0, 0, 0, 0.9194342799258, 0.3932436965768, 0, 0, -0.3932436965768, 0.9194342799258, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorInclinationOperationsTest0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_OPERATIONS_2100
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 125
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationOperationsTest0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.7457349090149, -0.6662427826825, 0, 0, 0.6662427826825, 0.7457349090149, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -0.7291591007186;
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
          1, 0, 0, 0, 0.7457349090149, -0.6662427826825, 0, 0.6662427826825, 0.7457349090149,
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
     * @tc.name testSensorInclinationOperationsTest0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_OPERATIONS_2200
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 126
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationOperationsTest0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0.4495054876365, 0.8932775697311, 0, -0.8932775697311, 0.4495054876365];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = 1.104584658078;
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
          1, 0, 0, 0, 0, 0.4495054876365, 0.8932775697311, 0, 0, -0.8932775697311, 0.4495054876365, 0, 0, 0, 0, 1,
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
     * @tc.name testSensorInclinationOperationsTest0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INCLINATION_OPERATIONS_2300
     * @tc.desc Verify sensor.getInclination with independent expectations for input partition 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInclinationOperationsTest0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          1, 0, 0, 0, 0, 0.9995872842614, -0.02872735878619, 0, 0, 0.02872735878619, 0.9995872842614, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expectedInclination: number = -0.02873131151644;
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
          1, 0, 0, 0, 0.9995872842614, -0.02872735878619, 0, 0.02872735878619, 0.9995872842614,
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
