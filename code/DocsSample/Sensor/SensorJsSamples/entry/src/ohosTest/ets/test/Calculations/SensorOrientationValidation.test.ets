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
import { assertAngleArrayNear, assertOrientationRange, orientationCallback } from '../Shared/SharedDriver';

export default function sensorOrientationValidationTest(): void {
  describe('SensorOrientationValidation', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorOrientationValidationTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_0100
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 188
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.2199833285148, 0.9025666352984, 0.3701091785158, 0.2785507966487, 0.3054881009479, -0.9105418572837,
          -0.9348886505151, 0.3033982350398, -0.1842083660227,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [1.24443352485, -0.308256977499, 1.765341963662];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual1 = promiseResult.length;
        expect(assertionActual1).assertEqual(3);
        const assertionActual2 = callbackResult.length;
        expect(assertionActual2).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual3 = JSON.stringify(input);
        expect(assertionActual3).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.2199833285148, 0.9025666352984, 0.3701091785158, 0, 0.2785507966487, 0.3054881009479, -0.9105418572837, 0,
          -0.9348886505151, 0.3033982350398, -0.1842083660227, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual4 = JSON.stringify(input);
        expect(assertionActual4).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_0200
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 189
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.0004297211161702, -0.9676928023343, -0.2521318219706, 0, 0.1072811446837, 0.2507213341482, -0.9620964445409,
          0, 0.9942286313193, -0.02663555731417, 0.1039229317881, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-1.317279087262, 0.02663870776569, -1.466648334436];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual5 = promiseResult.length;
        expect(assertionActual5).assertEqual(3);
        const assertionActual6 = callbackResult.length;
        expect(assertionActual6).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual7 = JSON.stringify(input);
        expect(assertionActual7).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.0004297211161702, -0.9676928023343, -0.2521318219706, 0.1072811446837, 0.2507213341482, -0.9620964445409,
          0.9942286313193, -0.02663555731417, 0.1039229317881,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual8 = JSON.stringify(input);
        expect(assertionActual8).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_0300
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 190
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9282987117742, 0.3535782951085, 0.1150821052405, -0.3709659144249, 0.901807632542, 0.2216467555003,
          -0.02541243894874, -0.2484459360044, 0.9683123591226,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.3736578538645, 0.2510755564987, 0.0262380283025];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual9 = promiseResult.length;
        expect(assertionActual9).assertEqual(3);
        const assertionActual10 = callbackResult.length;
        expect(assertionActual10).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual11 = JSON.stringify(input);
        expect(assertionActual11).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.9282987117742, 0.3535782951085, 0.1150821052405, 0, -0.3709659144249, 0.901807632542, 0.2216467555003, 0,
          -0.02541243894874, -0.2484459360044, 0.9683123591226, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual12 = JSON.stringify(input);
        expect(assertionActual12).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_0400
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 191
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.2659154766879, -0.2956005353356, -0.917556146929, 0, -0.7382120759692, -0.5496755598514, 0.3910239248376,
          0, -0.6199450702693, 0.7813303414123, -0.07204864632612, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-2.648185410182, -0.8967945377404, 1.686495082361];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual13 = promiseResult.length;
        expect(assertionActual13).assertEqual(3);
        const assertionActual14 = callbackResult.length;
        expect(assertionActual14).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual15 = JSON.stringify(input);
        expect(assertionActual15).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          -0.2659154766879, -0.2956005353356, -0.917556146929, -0.7382120759692, -0.5496755598514, 0.3910239248376,
          -0.6199450702693, 0.7813303414123, -0.07204864632612,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual16 = JSON.stringify(input);
        expect(assertionActual16).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_0500
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 192
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.5708870620739, -0.6073098305621, 0.5525058660859, 0.4289420065753, 0.794419691892, 0.4300071024174,
          -0.7000690804141, -0.008492516526492, 0.7140246212921,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.6526976193814, 0.00849261861387, 0.7755295897515];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual17 = promiseResult.length;
        expect(assertionActual17).assertEqual(3);
        const assertionActual18 = callbackResult.length;
        expect(assertionActual18).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual19 = JSON.stringify(input);
        expect(assertionActual19).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.5708870620739, -0.6073098305621, 0.5525058660859, 0, 0.4289420065753, 0.794419691892, 0.4300071024174, 0,
          -0.7000690804141, -0.008492516526492, 0.7140246212921, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual20 = JSON.stringify(input);
        expect(assertionActual20).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_0600
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 193
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.7074225181304, 0.6829500511275, -0.1820236482078, 0, -0.1266483001515, 0.3758527901578, 0.9179841437625, 0,
          0.6953514139705, -0.6263496689514, 0.3523811903235, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [1.06769429825, 0.6768616921187, -1.10174973809];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual21 = promiseResult.length;
        expect(assertionActual21).assertEqual(3);
        const assertionActual22 = callbackResult.length;
        expect(assertionActual22).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual23 = JSON.stringify(input);
        expect(assertionActual23).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.7074225181304, 0.6829500511275, -0.1820236482078, -0.1266483001515, 0.3758527901578, 0.9179841437625,
          0.6953514139705, -0.6263496689514, 0.3523811903235,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual24 = JSON.stringify(input);
        expect(assertionActual24).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_0700
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 194
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.75226103714, -0.3852875324714, -0.5344687543001, 0.02474752345196, 0.7941003771038, -0.6072825958041,
          0.6584002521901, -0.470061813388, -0.5878358610278,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.4517274987677, 0.4893608096134, -2.299632877096];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual25 = promiseResult.length;
        expect(assertionActual25).assertEqual(3);
        const assertionActual26 = callbackResult.length;
        expect(assertionActual26).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual27 = JSON.stringify(input);
        expect(assertionActual27).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          -0.75226103714, -0.3852875324714, -0.5344687543001, 0, 0.02474752345196, 0.7941003771038, -0.6072825958041, 0,
          0.6584002521901, -0.470061813388, -0.5878358610278, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual28 = JSON.stringify(input);
        expect(assertionActual28).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_0800
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 195
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9973725260102, 0.02549047155369, -0.06781062025919, 0, -0.02052512347827, 0.9971252226748, 0.07293839600578,
          0, 0.06947491393422, -0.07135493091347, 0.9950284971639, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.02555839561442, 0.07141562098514, -0.0697089015966];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual29 = promiseResult.length;
        expect(assertionActual29).assertEqual(3);
        const assertionActual30 = callbackResult.length;
        expect(assertionActual30).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual31 = JSON.stringify(input);
        expect(assertionActual31).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.9973725260102, 0.02549047155369, -0.06781062025919, -0.02052512347827, 0.9971252226748, 0.07293839600578,
          0.06947491393422, -0.07135493091347, 0.9950284971639,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual32 = JSON.stringify(input);
        expect(assertionActual32).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_0900
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 196
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.525471696, -0.7825485560762, 0.3339120454342, 0.1702008157905, 0.2878458988185, 0.942431122596,
          -0.8336133270331, 0.5520529828889, -0.01806446999896,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-1.218325256366, -0.5848244106905, 1.592463018729];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual33 = promiseResult.length;
        expect(assertionActual33).assertEqual(3);
        const assertionActual34 = callbackResult.length;
        expect(assertionActual34).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual35 = JSON.stringify(input);
        expect(assertionActual35).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          -0.525471696, -0.7825485560762, 0.3339120454342, 0, 0.1702008157905, 0.2878458988185, 0.942431122596, 0,
          -0.8336133270331, 0.5520529828889, -0.01806446999896, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual36 = JSON.stringify(input);
        expect(assertionActual36).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_1000
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 197
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.4930803875457, 0.6719112905579, -0.5526363623927, 0, -0.7571772305673, 0.01861638413793, -0.6529441566873,
          0, -0.4284324601712, 0.7403976282123, 0.517935304077, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [1.543096803165, -0.8336617255258, 0.6911035149918];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual37 = promiseResult.length;
        expect(assertionActual37).assertEqual(3);
        const assertionActual38 = callbackResult.length;
        expect(assertionActual38).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual39 = JSON.stringify(input);
        expect(assertionActual39).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.4930803875457, 0.6719112905579, -0.5526363623927, -0.7571772305673, 0.01861638413793, -0.6529441566873,
          -0.4284324601712, 0.7403976282123, 0.517935304077,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual40 = JSON.stringify(input);
        expect(assertionActual40).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_1100
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 198
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.7515183881704, -0.5899029514408, -0.2953550746527, 0.4547190701599, 0.7875481971785, -0.415930768703,
          0.4779651446232, 0.1782760359731, 0.8600970733139,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.6428846766757, -0.1792341415328, -0.5072170485311];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual41 = promiseResult.length;
        expect(assertionActual41).assertEqual(3);
        const assertionActual42 = callbackResult.length;
        expect(assertionActual42).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual43 = JSON.stringify(input);
        expect(assertionActual43).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.7515183881704, -0.5899029514408, -0.2953550746527, 0, 0.4547190701599, 0.7875481971785, -0.415930768703, 0,
          0.4779651446232, 0.1782760359731, 0.8600970733139, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual44 = JSON.stringify(input);
        expect(assertionActual44).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_1200
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 199
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.5367094902995, -0.5428468157499, 0.6459568543274, 0, -0.6978409587893, -0.1447601168924, -0.7014716706991,
          0, 0.4743004525177, -0.8272616534008, -0.3011266138256, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-1.831400379952, 0.9742159560683, -2.136472955737];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual45 = promiseResult.length;
        expect(assertionActual45).assertEqual(3);
        const assertionActual46 = callbackResult.length;
        expect(assertionActual46).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual47 = JSON.stringify(input);
        expect(assertionActual47).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          -0.5367094902995, -0.5428468157499, 0.6459568543274, -0.6978409587893, -0.1447601168924, -0.7014716706991,
          0.4743004525177, -0.8272616534008, -0.3011266138256,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual48 = JSON.stringify(input);
        expect(assertionActual48).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_1300
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 200
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.8992265944802, 0.4020772402986, 0.1724106279012, -0.2766699920279, 0.8279380769181, -0.4878240013575,
          -0.338888251922, 0.3909634683994, 0.8557466442156,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.4520912066016, -0.4016781463566, 0.377066060742];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual49 = promiseResult.length;
        expect(assertionActual49).assertEqual(3);
        const assertionActual50 = callbackResult.length;
        expect(assertionActual50).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual51 = JSON.stringify(input);
        expect(assertionActual51).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.8992265944802, 0.4020772402986, 0.1724106279012, 0, -0.2766699920279, 0.8279380769181, -0.4878240013575, 0,
          -0.338888251922, 0.3909634683994, 0.8557466442156, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual52 = JSON.stringify(input);
        expect(assertionActual52).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_1400
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 201
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.4267281308679, -0.8351189767982, 0.3471014216588, 0, -0.1465949363736, 0.3148518580851, 0.9377516899958, 0,
          -0.8924197593933, -0.4510483367133, 0.01193193163284, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-1.210260800807, 0.467939598479, 1.557426810288];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual53 = promiseResult.length;
        expect(assertionActual53).assertEqual(3);
        const assertionActual54 = callbackResult.length;
        expect(assertionActual54).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual55 = JSON.stringify(input);
        expect(assertionActual55).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.4267281308679, -0.8351189767982, 0.3471014216588, -0.1465949363736, 0.3148518580851, 0.9377516899958,
          -0.8924197593933, -0.4510483367133, 0.01193193163284,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual56 = JSON.stringify(input);
        expect(assertionActual56).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_1500
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 202
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.2067245666786, 0.6190141694429, -0.7576849025554, 0.8639961878873, 0.247887215025, 0.4382493764324,
          0.4591029741222, -0.7452337798678, -0.4835815055357,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [1.189897914922, 0.8408853704011, -2.382155490294];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual57 = promiseResult.length;
        expect(assertionActual57).assertEqual(3);
        const assertionActual58 = callbackResult.length;
        expect(assertionActual58).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual59 = JSON.stringify(input);
        expect(assertionActual59).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.2067245666786, 0.6190141694429, -0.7576849025554, 0, 0.8639961878873, 0.247887215025, 0.4382493764324, 0,
          0.4591029741222, -0.7452337798678, -0.4835815055357, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual60 = JSON.stringify(input);
        expect(assertionActual60).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_1600
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 203
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9719607371876, 0.1459285050098, 0.1843832877223, 0, -0.1383653903982, 0.9889453936232, -0.0533106665824, 0,
          -0.1901245489295, 0.0263036092028, 0.9814075483902, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.1465025152018, -0.02630664330378, 0.1913560367418];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual61 = promiseResult.length;
        expect(assertionActual61).assertEqual(3);
        const assertionActual62 = callbackResult.length;
        expect(assertionActual62).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual63 = JSON.stringify(input);
        expect(assertionActual63).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.9719607371876, 0.1459285050098, 0.1843832877223, -0.1383653903982, 0.9889453936232, -0.0533106665824,
          -0.1901245489295, 0.0263036092028, 0.9814075483902,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual64 = JSON.stringify(input);
        expect(assertionActual64).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_1700
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 204
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.1990382513294, 0.3714868693771, 0.9068524027581, -0.3141779179859, -0.8523353586291, 0.4181108373155,
          0.9282650539355, -0.3681330497402, -0.05293436814778,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [2.730571416332, 0.3770002572625, -1.627759692248];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual65 = promiseResult.length;
        expect(assertionActual65).assertEqual(3);
        const assertionActual66 = callbackResult.length;
        expect(assertionActual66).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual67 = JSON.stringify(input);
        expect(assertionActual67).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.1990382513294, 0.3714868693771, 0.9068524027581, 0, -0.3141779179859, -0.8523353586291, 0.4181108373155, 0,
          0.9282650539355, -0.3681330497402, -0.05293436814778, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual68 = JSON.stringify(input);
        expect(assertionActual68).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_1800
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 205
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.3596435611935, -0.7710030853928, 0.5255575622202, 0, 0.6739598619238, 0.6041777609022, 0.4251439023988, 0,
          -0.6453174516528, 0.2013044349885, 0.736913774499, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.9061198231306, -0.202689435518, 0.7192279039324];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual69 = promiseResult.length;
        expect(assertionActual69).assertEqual(3);
        const assertionActual70 = callbackResult.length;
        expect(assertionActual70).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual71 = JSON.stringify(input);
        expect(assertionActual71).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.3596435611935, -0.7710030853928, 0.5255575622202, 0.6739598619238, 0.6041777609022, 0.4251439023988,
          -0.6453174516528, 0.2013044349885, 0.736913774499,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual72 = JSON.stringify(input);
        expect(assertionActual72).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_1900
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 206
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.612499109883, 0.3222522027382, -0.7218021600293, -0.714425065458, 0.6164614186684, -0.3310168351289,
          0.3382922793058, 0.7184210722993, 0.6078071212468,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.4816777003039, -0.8015297989956, -0.5078797276311];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual73 = promiseResult.length;
        expect(assertionActual73).assertEqual(3);
        const assertionActual74 = callbackResult.length;
        expect(assertionActual74).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual75 = JSON.stringify(input);
        expect(assertionActual75).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.612499109883, 0.3222522027382, -0.7218021600293, 0, -0.714425065458, 0.6164614186684, -0.3310168351289, 0,
          0.3382922793058, 0.7184210722993, 0.6078071212468, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual76 = JSON.stringify(input);
        expect(assertionActual76).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_2000
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 207
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.4222854896688, 0.02129482644096, 0.9062127209337, 0, 0.7266548328603, -0.5896925854866, 0.3524704363529, 0,
          0.541892719176, 0.807347004075, 0.2335446336681, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [3.105496596698, -0.93964216867, -1.163871940707];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual77 = promiseResult.length;
        expect(assertionActual77).assertEqual(3);
        const assertionActual78 = callbackResult.length;
        expect(assertionActual78).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual79 = JSON.stringify(input);
        expect(assertionActual79).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          -0.4222854896688, 0.02129482644096, 0.9062127209337, 0.7266548328603, -0.5896925854866, 0.3524704363529,
          0.541892719176, 0.807347004075, 0.2335446336681,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual80 = JSON.stringify(input);
        expect(assertionActual80).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_2100
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 208
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9817105056626, -0.1262732822306, -0.1424764586393, 0.08713688211285, 0.9634161716741, -0.2534490953474,
          0.1692679734839, 0.2363986851729, 0.9567988371655,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.1303253676322, -0.2386578023618, -0.1750990083647];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual81 = promiseResult.length;
        expect(assertionActual81).assertEqual(3);
        const assertionActual82 = callbackResult.length;
        expect(assertionActual82).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual83 = JSON.stringify(input);
        expect(assertionActual83).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.9817105056626, -0.1262732822306, -0.1424764586393, 0, 0.08713688211285, 0.9634161716741, -0.2534490953474,
          0, 0.1692679734839, 0.2363986851729, 0.9567988371655, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual84 = JSON.stringify(input);
        expect(assertionActual84).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_2200
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 209
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.04301591842507, 0.6319865382944, 0.7737846251876, 0, 0.7380314577827, 0.5019267717679, -0.4509757012365, 0,
          -0.6733937912434, 0.5904765289131, -0.4448351050867, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.8995990173459, -0.6316491675411, 2.154578029746];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual85 = promiseResult.length;
        expect(assertionActual85).assertEqual(3);
        const assertionActual86 = callbackResult.length;
        expect(assertionActual86).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual87 = JSON.stringify(input);
        expect(assertionActual87).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.04301591842507, 0.6319865382944, 0.7737846251876, 0.7380314577827, 0.5019267717679, -0.4509757012365,
          -0.6733937912434, 0.5904765289131, -0.4448351050867,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual88 = JSON.stringify(input);
        expect(assertionActual88).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_2300
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 210
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.179951314711, 0.9176451921506, -0.3543230526745, -0.002736283186655, 0.3606687575421, 0.9326899592508,
          0.9836717120504, -0.1668692561733, 0.0674137542055,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [1.196306679916, 0.1676535460493, -1.502370541903];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual89 = promiseResult.length;
        expect(assertionActual89).assertEqual(3);
        const assertionActual90 = callbackResult.length;
        expect(assertionActual90).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual91 = JSON.stringify(input);
        expect(assertionActual91).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.179951314711, 0.9176451921506, -0.3543230526745, 0, -0.002736283186655, 0.3606687575421, 0.9326899592508, 0,
          0.9836717120504, -0.1668692561733, 0.0674137542055, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual92 = JSON.stringify(input);
        expect(assertionActual92).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_2400
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 211
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9251404819387, -0.3518674012512, -0.1424935809605, 0, 0.3790893416008, 0.8363544360768, 0.3959829899622, 0,
          -0.02015836706887, -0.4203576919618, 0.9071345275347, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.3982361761185, 0.4338394964869, 0.02221836921512];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual93 = promiseResult.length;
        expect(assertionActual93).assertEqual(3);
        const assertionActual94 = callbackResult.length;
        expect(assertionActual94).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual95 = JSON.stringify(input);
        expect(assertionActual95).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.9251404819387, -0.3518674012512, -0.1424935809605, 0.3790893416008, 0.8363544360768, 0.3959829899622,
          -0.02015836706887, -0.4203576919618, 0.9071345275347,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual96 = JSON.stringify(input);
        expect(assertionActual96).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_2500
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 212
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.8860484425312, 0.128016857102, -0.4455668768949, 0.4266961257642, -0.1505482359458, -0.8917766788335,
          -0.1812417549736, -0.980278997506, 0.07876873302767,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [2.436902506511, 1.371868373963, 1.160817624929];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual97 = promiseResult.length;
        expect(assertionActual97).assertEqual(3);
        const assertionActual98 = callbackResult.length;
        expect(assertionActual98).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual99 = JSON.stringify(input);
        expect(assertionActual99).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          -0.8860484425312, 0.128016857102, -0.4455668768949, 0, 0.4266961257642, -0.1505482359458, -0.8917766788335, 0,
          -0.1812417549736, -0.980278997506, 0.07876873302767, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual100 = JSON.stringify(input);
        expect(assertionActual100).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_2600
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 213
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.7701343478185, 0.3293490590438, 0.5462804074988, 0, -0.5627741989596, 0.7539821294458, 0.3388158046222, 0,
          -0.3002969984789, -0.5683662074608, 0.766016688409, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.4118335142091, 0.6045187818242, 0.3736117428734];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual101 = promiseResult.length;
        expect(assertionActual101).assertEqual(3);
        const assertionActual102 = callbackResult.length;
        expect(assertionActual102).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual103 = JSON.stringify(input);
        expect(assertionActual103).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.7701343478185, 0.3293490590438, 0.5462804074988, -0.5627741989596, 0.7539821294458, 0.3388158046222,
          -0.3002969984789, -0.5683662074608, 0.766016688409,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual104 = JSON.stringify(input);
        expect(assertionActual104).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_2700
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 214
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.08929051560258, -0.9353532125247, -0.3422595092077, 0.9533626269446, 0.1797354579794, -0.2424765281224,
          0.2883173691764, -0.3046465705774, 0.9077794675287,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-1.380952545786, 0.309567339282, -0.3075309766316];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual105 = promiseResult.length;
        expect(assertionActual105).assertEqual(3);
        const assertionActual106 = callbackResult.length;
        expect(assertionActual106).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual107 = JSON.stringify(input);
        expect(assertionActual107).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.08929051560258, -0.9353532125247, -0.3422595092077, 0, 0.9533626269446, 0.1797354579794, -0.2424765281224,
          0, 0.2883173691764, -0.3046465705774, 0.9077794675287, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual108 = JSON.stringify(input);
        expect(assertionActual108).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_2800
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 215
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.370081797349, -0.372112361566, -0.851217864968, 0, -0.9177405127005, -0.2886590139662, -0.2728155512509, 0,
          -0.1441936705242, 0.8821611893673, -0.4483300361953, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-2.230562795249, -1.080431683473, 2.830417313442];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual109 = promiseResult.length;
        expect(assertionActual109).assertEqual(3);
        const assertionActual110 = callbackResult.length;
        expect(assertionActual110).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual111 = JSON.stringify(input);
        expect(assertionActual111).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.370081797349, -0.372112361566, -0.851217864968, -0.9177405127005, -0.2886590139662, -0.2728155512509,
          -0.1441936705242, 0.8821611893673, -0.4483300361953,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual112 = JSON.stringify(input);
        expect(assertionActual112).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_2900
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 216
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9996310681937, -0.001279019415311, 0.0271310082967, 0.001528935354699, 0.9999565773062, -0.009192706818944,
          -0.02711807254474, 0.009230796894807, 0.999589617058,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.001279074258656, -0.009230927988859, 0.02712255320307];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual113 = promiseResult.length;
        expect(assertionActual113).assertEqual(3);
        const assertionActual114 = callbackResult.length;
        expect(assertionActual114).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual115 = JSON.stringify(input);
        expect(assertionActual115).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.9996310681937, -0.001279019415311, 0.0271310082967, 0, 0.001528935354699, 0.9999565773062,
          -0.009192706818944, 0, -0.02711807254474, 0.009230796894807, 0.999589617058, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual116 = JSON.stringify(input);
        expect(assertionActual116).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_3000
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 217
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.2997768258494, 0.9523621293535, -0.05603774849978, 0, 0.502352424433, -0.2075169116078, -0.8393919067176, 0,
          -0.8110338441458, 0.2234795426209, -0.5406301856908, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [1.785339895944, -0.2253828468454, 2.158748528243];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual117 = promiseResult.length;
        expect(assertionActual117).assertEqual(3);
        const assertionActual118 = callbackResult.length;
        expect(assertionActual118).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual119 = JSON.stringify(input);
        expect(assertionActual119).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.2997768258494, 0.9523621293535, -0.05603774849978, 0.502352424433, -0.2075169116078, -0.8393919067176,
          -0.8110338441458, 0.2234795426209, -0.5406301856908,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual120 = JSON.stringify(input);
        expect(assertionActual120).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_3100
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 218
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.4841194422868, -0.5978320330726, 0.6389250549416, 0.8612414875451, 0.1965765066601, -0.4686371487201,
          0.1545686440747, 0.777145119821, 0.6100442582365,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-1.253117215972, -0.8901165811454, -0.2481505695427];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual121 = promiseResult.length;
        expect(assertionActual121).assertEqual(3);
        const assertionActual122 = callbackResult.length;
        expect(assertionActual122).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual123 = JSON.stringify(input);
        expect(assertionActual123).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.4841194422868, -0.5978320330726, 0.6389250549416, 0, 0.8612414875451, 0.1965765066601, -0.4686371487201, 0,
          0.1545686440747, 0.777145119821, 0.6100442582365, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual124 = JSON.stringify(input);
        expect(assertionActual124).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_3200
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 219
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.6838288134545, 0.6243264521628, -0.3776170481045, 0, -0.3982209545359, 0.7530077465134, 0.5238314662745, 0,
          0.6113904033086, -0.2078360286874, 0.7635482695426, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.6922407916074, 0.2093621584078, -0.6751814347578];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual125 = promiseResult.length;
        expect(assertionActual125).assertEqual(3);
        const assertionActual126 = callbackResult.length;
        expect(assertionActual126).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual127 = JSON.stringify(input);
        expect(assertionActual127).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.6838288134545, 0.6243264521628, -0.3776170481045, -0.3982209545359, 0.7530077465134, 0.5238314662745,
          0.6113904033086, -0.2078360286874, 0.7635482695426,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual128 = JSON.stringify(input);
        expect(assertionActual128).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_3300
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 220
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.4086542095614, -0.7513087331276, -0.5182054848552, -0.4212537912427, -0.3484192729669, 0.8373465552499,
          -0.8096585578942, 0.5604812198026, -0.1741086496335,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-2.005025571713, -0.5949667518732, 1.782610333577];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual129 = promiseResult.length;
        expect(assertionActual129).assertEqual(3);
        const assertionActual130 = callbackResult.length;
        expect(assertionActual130).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual131 = JSON.stringify(input);
        expect(assertionActual131).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          -0.4086542095614, -0.7513087331276, -0.5182054848552, 0, -0.4212537912427, -0.3484192729669, 0.8373465552499,
          0, -0.8096585578942, 0.5604812198026, -0.1741086496335, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual132 = JSON.stringify(input);
        expect(assertionActual132).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_3400
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 221
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.8889601684842, -0.4569065151996, 0.03140470055115, 0, 0.4380049783143, 0.8682107957656, 0.2331558557876, 0,
          -0.1337963296226, -0.1935108536601, 0.9719321435652, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.4844359558154, 0.194739386033, 0.1368003424376];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual133 = promiseResult.length;
        expect(assertionActual133).assertEqual(3);
        const assertionActual134 = callbackResult.length;
        expect(assertionActual134).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual135 = JSON.stringify(input);
        expect(assertionActual135).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.8889601684842, -0.4569065151996, 0.03140470055115, 0.4380049783143, 0.8682107957656, 0.2331558557876,
          -0.1337963296226, -0.1935108536601, 0.9719321435652,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual136 = JSON.stringify(input);
        expect(assertionActual136).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_3500
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 222
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.4243767374152, -0.05866645331453, 0.9035832180803, -0.8994734940289, 0.0874909628419, 0.4281270430147,
          -0.1041720609393, -0.9944363120263, -0.01563979038094,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.5906814247741, 1.465260979677, 1.719817531432];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual137 = promiseResult.length;
        expect(assertionActual137).assertEqual(3);
        const assertionActual138 = callbackResult.length;
        expect(assertionActual138).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual139 = JSON.stringify(input);
        expect(assertionActual139).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.4243767374152, -0.05866645331453, 0.9035832180803, 0, -0.8994734940289, 0.0874909628419, 0.4281270430147, 0,
          -0.1041720609393, -0.9944363120263, -0.01563979038094, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual140 = JSON.stringify(input);
        expect(assertionActual140).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_3600
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 223
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.383711959904, -0.2969054148983, -0.8744211264778, 0, 0.01995355752642, 0.9440171491463, -0.3292923893133,
          0, 0.9232372324428, -0.1438012403344, -0.3563063512058, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.3047174817002, 0.1443015158568, -1.939116187664];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual141 = promiseResult.length;
        expect(assertionActual141).assertEqual(3);
        const assertionActual142 = callbackResult.length;
        expect(assertionActual142).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual143 = JSON.stringify(input);
        expect(assertionActual143).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          -0.383711959904, -0.2969054148983, -0.8744211264778, 0.01995355752642, 0.9440171491463, -0.3292923893133,
          0.9232372324428, -0.1438012403344, -0.3563063512058,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual144 = JSON.stringify(input);
        expect(assertionActual144).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_3700
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 224
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9823267223595, -0.05187199180475, 0.1798430065493, 0.1059828938903, 0.9461118715638, -0.3060064585733,
          -0.1542784390027, 0.3196586037512, 0.934888517582,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.05477165241902, -0.3253691651898, 0.1635493539984];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual145 = promiseResult.length;
        expect(assertionActual145).assertEqual(3);
        const assertionActual146 = callbackResult.length;
        expect(assertionActual146).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual147 = JSON.stringify(input);
        expect(assertionActual147).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.9823267223595, -0.05187199180475, 0.1798430065493, 0, 0.1059828938903, 0.9461118715638, -0.3060064585733, 0,
          -0.1542784390027, 0.3196586037512, 0.934888517582, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual148 = JSON.stringify(input);
        expect(assertionActual148).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationValidationTest0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_VALIDATION_3800
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 225
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationValidationTest0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.7563598181004, -0.09070690093116, -0.6478364636902, 0, 0.5925619386388, -0.5145266443951, -0.6197843827365,
          0, -0.2771104011758, -0.8526632338332, 0.4429167362262, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-2.967093711548, 1.021061766242, 0.5590658564965];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual149 = promiseResult.length;
        expect(assertionActual149).assertEqual(3);
        const assertionActual150 = callbackResult.length;
        expect(assertionActual150).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual151 = JSON.stringify(input);
        expect(assertionActual151).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          -0.7563598181004, -0.09070690093116, -0.6478364636902, 0.5925619386388, -0.5145266443951, -0.6197843827365,
          -0.2771104011758, -0.8526632338332, 0.4429167362262,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual152 = JSON.stringify(input);
        expect(assertionActual152).assertEqual(inputBefore);
      },
    );
  });
}
