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
import {
  assertArrayNear,
  assertAngleArrayNear,
  assertOrientationRange,
  variationCallback,
} from '../Shared/SharedDriver';

export default function sensorVariationEventValidationTest(): void {
  describe('SensorVariationEventValidation', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorVariationEventValidationTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_EVENT_VALIDATION_0100
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 116
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationEventValidationTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.3796543064934, -0.5432275291829, 0.7488434142722, 0.5707479292188, 0.7745785245877, 0.2725342373721,
          -0.7280861273596, 0.3239320311198, 0.6041180599528,
        ];
        const previous: number[] = [
          0.7262642051811, -0.4228288744974, -0.5419926633856, 0.1476213488724, 0.865988038197, -0.4777788767377,
          0.6713778679922, 0.2669840081183, 0.691354683053,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-0.06344522252352, -0.1488490469418, 1.690827298191];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual1 = promiseResult.length;
        expect(assertionActual1).assertEqual(3);
        const assertionActual2 = callbackResult.length;
        expect(assertionActual2).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual3 = JSON.stringify(current);
        expect(assertionActual3).assertEqual(currentBefore);
        const assertionActual4 = JSON.stringify(previous);
        expect(assertionActual4).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual5 = JSON.stringify(current);
        expect(assertionActual5).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorVariationEventValidationTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_EVENT_VALIDATION_0200
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 117
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationEventValidationTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.6299166860365, 0.746413340778, -0.214644108611, 0, -0.3746783943085, 0.5341303059405, 0.7578396381256, 0,
          0.680309539468, -0.3969533234331, 0.6161225442428, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.1397611387091, 0.4057005528549, -0.9032573750156, 0, 0.1417033645332, -0.9110160102636, -0.3872595841595, 0,
          -0.9799933574197, -0.07387076862097, -0.1848137683091, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [1.835854938199, 0.9402202735028, 1.941264975633];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual6 = promiseResult.length;
        expect(assertionActual6).assertEqual(3);
        const assertionActual7 = callbackResult.length;
        expect(assertionActual7).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual8 = JSON.stringify(current);
        expect(assertionActual8).assertEqual(currentBefore);
        const assertionActual9 = JSON.stringify(previous);
        expect(assertionActual9).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual10 = JSON.stringify(current);
        expect(assertionActual10).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorVariationEventValidationTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_EVENT_VALIDATION_0300
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 118
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationEventValidationTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.6708244751132, -0.4283161581607, -0.6054252986517, 0.4859003542892, -0.8705706589357, 0.07750853825218,
          -0.5602636605124, -0.2421817426207, 0.7921190783275,
        ];
        const previous: number[] = [
          0.8449528119047, 0.4258503669852, -0.3235833904776, -0.465319077702, 0.8836026279421, -0.05219723958654,
          0.2636909205508, 0.194673729179, 0.9447588250906,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-3.120895495777, 0.04478092396432, 0.3447355827184];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual11 = promiseResult.length;
        expect(assertionActual11).assertEqual(3);
        const assertionActual12 = callbackResult.length;
        expect(assertionActual12).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual13 = JSON.stringify(current);
        expect(assertionActual13).assertEqual(currentBefore);
        const assertionActual14 = JSON.stringify(previous);
        expect(assertionActual14).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual15 = JSON.stringify(current);
        expect(assertionActual15).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorVariationEventValidationTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_EVENT_VALIDATION_0400
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 119
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationEventValidationTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.974112918231, -0.1489528979773, -0.1700501594229, 0, 0.1754106575094, 0.9725441791866, 0.1529343674995, 0,
          0.1426012754771, -0.1788039532967, 0.9734957742681, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.2003102367928, -0.1591432250847, 0.9667208712683, 0, 0.9645927527495, 0.2048292414014, -0.1661499419505, 0,
          -0.1715710650991, 0.9657734805722, 0.194537795413, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [1.517355356881, 0.3473084088213, -1.57124230814];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual16 = promiseResult.length;
        expect(assertionActual16).assertEqual(3);
        const assertionActual17 = callbackResult.length;
        expect(assertionActual17).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual18 = JSON.stringify(current);
        expect(assertionActual18).assertEqual(currentBefore);
        const assertionActual19 = JSON.stringify(previous);
        expect(assertionActual19).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual20 = JSON.stringify(current);
        expect(assertionActual20).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorVariationEventValidationTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_EVENT_VALIDATION_0500
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 120
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationEventValidationTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.1185729121862, -0.1639521401176, 0.9793161697055, -0.9317675853402, 0.3592132713633, -0.05267819839159,
          -0.343146661655, -0.9187412701231, -0.1953582533902,
        ];
        const previous: number[] = [
          -0.442640891652, 0.6885298144082, -0.5744525530525, -0.7705813958624, 0.03552841318069, 0.6363505670678,
          0.4585557254993, 0.7243372325981, 0.5148419369903,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-2.456549352675, 0.1508092441892, 2.352753169556];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual21 = promiseResult.length;
        expect(assertionActual21).assertEqual(3);
        const assertionActual22 = callbackResult.length;
        expect(assertionActual22).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual23 = JSON.stringify(current);
        expect(assertionActual23).assertEqual(currentBefore);
        const assertionActual24 = JSON.stringify(previous);
        expect(assertionActual24).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual25 = JSON.stringify(current);
        expect(assertionActual25).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorVariationEventValidationTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_EVENT_VALIDATION_0600
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 121
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationEventValidationTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.7175821206725, -0.6544330688313, -0.2383133620073, 0, -0.2567684560962, 0.06948745040129, -0.96397170819, 0,
          0.6474147511797, 0.752920216661, -0.118174816683, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.986534009753, -0.1317160109684, -0.09696153905106, 0, 0.1530056238133, 0.9527065526013, 0.2625633327638, 0,
          0.05779209878603, -0.273863318254, 0.9600307058802, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-1.661500232134, -0.9348773179494, -2.187409910194];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual26 = promiseResult.length;
        expect(assertionActual26).assertEqual(3);
        const assertionActual27 = callbackResult.length;
        expect(assertionActual27).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual28 = JSON.stringify(current);
        expect(assertionActual28).assertEqual(currentBefore);
        const assertionActual29 = JSON.stringify(previous);
        expect(assertionActual29).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual30 = JSON.stringify(current);
        expect(assertionActual30).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorVariationEventValidationTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_EVENT_VALIDATION_0700
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 122
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationEventValidationTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.9385522725475, -0.2291468917191, -0.2580917156968, 0.07517369296263, 0.8655648371098, -0.4951226400049,
          0.3368509278334, 0.4452967715743, 0.8296036629881,
        ];
        const previous: number[] = [
          -0.6463340947348, -0.6817792823875, -0.342679512213, -0.5784785129224, 0.7306647288787, -0.3626177933577,
          0.4976091318198, -0.03613950857063, -0.8666481915113,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-0.1679927810365, 0.6703507929432, 2.18405467755];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual31 = promiseResult.length;
        expect(assertionActual31).assertEqual(3);
        const assertionActual32 = callbackResult.length;
        expect(assertionActual32).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual33 = JSON.stringify(current);
        expect(assertionActual33).assertEqual(currentBefore);
        const assertionActual34 = JSON.stringify(previous);
        expect(assertionActual34).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual35 = JSON.stringify(current);
        expect(assertionActual35).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorVariationEventValidationTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_EVENT_VALIDATION_0800
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 123
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationEventValidationTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.7795003102578, -0.5962140555138, 0.1921147217571, 0, -0.4163795849196, 0.2640449131796, -0.8700047845191,
          0, 0.4679821658676, -0.7581616475606, -0.4540744527036, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.6951025728054, -0.4957332334359, 0.5206543714851, 0, -0.04653619479072, 0.6916811058927, 0.7207021786602, 0,
          -0.7174028128282, -0.5251912118632, 0.4577197779514, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [0.1329319696018, 0.4860638887142, 2.551852879302];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual36 = promiseResult.length;
        expect(assertionActual36).assertEqual(3);
        const assertionActual37 = callbackResult.length;
        expect(assertionActual37).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual38 = JSON.stringify(current);
        expect(assertionActual38).assertEqual(currentBefore);
        const assertionActual39 = JSON.stringify(previous);
        expect(assertionActual39).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual40 = JSON.stringify(current);
        expect(assertionActual40).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorVariationEventValidationTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_EVENT_VALIDATION_0900
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 124
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationEventValidationTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.8076076610652, 0.5506107346001, 0.2111816391922, -0.3531941592417, 0.7383872395044, -0.5744894867747,
          -0.4722539059302, 0.3893739892189, 0.7907996869331,
        ];
        const previous: number[] = [
          0.6474499762127, 0.7340430126041, 0.2049131131706, -0.6241277556631, 0.3564035977942, 0.6952992306125,
          0.4373477711309, -0.5780634317499, 0.6888901189307,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [0.1480027023598, -1.107229540374, 1.135362538709];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual41 = promiseResult.length;
        expect(assertionActual41).assertEqual(3);
        const assertionActual42 = callbackResult.length;
        expect(assertionActual42).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual43 = JSON.stringify(current);
        expect(assertionActual43).assertEqual(currentBefore);
        const assertionActual44 = JSON.stringify(previous);
        expect(assertionActual44).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual45 = JSON.stringify(current);
        expect(assertionActual45).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorVariationEventValidationTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_EVENT_VALIDATION_1000
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 125
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationEventValidationTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.06573273511294, -0.9955844500304, 0.0670135090274, 0, 0.9685842420282, 0.07980397653058, 0.2355332066282, 0,
          -0.2398411424865, 0.04942598696536, 0.969553143558, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          -0.4038357371701, -0.8466436958787, 0.346570555029, 0, -0.1229199344502, -0.3251837636846, -0.937627969693, 0,
          0.9065359270868, -0.4212481122388, 0.02725143732326, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [0.5020481960594, 0.4318148667717, 1.76042946329];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual46 = promiseResult.length;
        expect(assertionActual46).assertEqual(3);
        const assertionActual47 = callbackResult.length;
        expect(assertionActual47).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual48 = JSON.stringify(current);
        expect(assertionActual48).assertEqual(currentBefore);
        const assertionActual49 = JSON.stringify(previous);
        expect(assertionActual49).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual50 = JSON.stringify(current);
        expect(assertionActual50).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorVariationEventValidationTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_EVENT_VALIDATION_1100
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 126
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationEventValidationTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.0228134238217, 0.9847579898403, 0.1724275185089, 0.1363848461348, -0.1677943922599, 0.9763422635894,
          0.9903932155656, 0.04579021043554, -0.1304781023388,
        ];
        const previous: number[] = [
          0.9795753356589, -0.1338864120705, -0.1500219664971, 0.1512079476165, 0.9822858433247, 0.1106827835819,
          0.1325455331061, -0.1311066385303, 0.9824676742707,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [1.880654429062, 0.121619475651, -1.617149343409];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual51 = promiseResult.length;
        expect(assertionActual51).assertEqual(3);
        const assertionActual52 = callbackResult.length;
        expect(assertionActual52).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual53 = JSON.stringify(current);
        expect(assertionActual53).assertEqual(currentBefore);
        const assertionActual54 = JSON.stringify(previous);
        expect(assertionActual54).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual55 = JSON.stringify(current);
        expect(assertionActual55).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorVariationEventValidationTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_EVENT_VALIDATION_1200
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationEventValidationTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.9982904141077, -0.03420060806925, 0.04739796945413, 0, 0.03364730408257, 0.9993565580749, 0.01242291272693,
          0, -0.04779234278267, -0.01080686079947, 0.9987988304614, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          -0.3256844164583, 0.9440012688727, -0.0528324260567, 0, -0.4528803147651, -0.2048093191745, -0.8677283925731,
          0, -0.8299572768369, -0.2586788494371, 0.4942227953863, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-2.06705256642, 1.056632282755, 0.2163178198153];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual56 = promiseResult.length;
        expect(assertionActual56).assertEqual(3);
        const assertionActual57 = callbackResult.length;
        expect(assertionActual57).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual58 = JSON.stringify(current);
        expect(assertionActual58).assertEqual(currentBefore);
        const assertionActual59 = JSON.stringify(previous);
        expect(assertionActual59).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual60 = JSON.stringify(current);
        expect(assertionActual60).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorVariationEventValidationTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_EVENT_VALIDATION_1300
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationEventValidationTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.7614808338522, -0.5808153470232, -0.2877507121417, -0.2103252863116, -0.6413159727023, 0.7378869134866,
          -0.6131151715735, -0.5013654912528, -0.610509975813,
        ];
        const previous: number[] = [
          0.59603225754, -0.2251279818712, 0.7707547857461, 0.7899844461775, -0.007459279419072, -0.613081506774,
          0.143771077653, 0.9743006470947, 0.1734016329258,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-1.935339570789, 0.1419005741067, -2.478274072];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual61 = promiseResult.length;
        expect(assertionActual61).assertEqual(3);
        const assertionActual62 = callbackResult.length;
        expect(assertionActual62).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual63 = JSON.stringify(current);
        expect(assertionActual63).assertEqual(currentBefore);
        const assertionActual64 = JSON.stringify(previous);
        expect(assertionActual64).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual65 = JSON.stringify(current);
        expect(assertionActual65).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorVariationEventValidationTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_EVENT_VALIDATION_1400
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 129
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationEventValidationTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.5050367792753, -0.5717427106447, 0.6465664114411, 0, -0.2128416388369, 0.6434865106273, 0.7352710707065, 0,
          -0.8364426390114, -0.508955188072, 0.2032936993076, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.7901645228612, 0.1623051733068, -0.5910135848942, 0, -0.1299613524415, 0.9867406095112, 0.09722662399302, 0,
          0.5989574890451, -1.610415271986e-5, 0.8007808227333, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-0.9977677938531, 0.007089883567202, 1.719192000056];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual66 = promiseResult.length;
        expect(assertionActual66).assertEqual(3);
        const assertionActual67 = callbackResult.length;
        expect(assertionActual67).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual68 = JSON.stringify(current);
        expect(assertionActual68).assertEqual(currentBefore);
        const assertionActual69 = JSON.stringify(previous);
        expect(assertionActual69).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual70 = JSON.stringify(current);
        expect(assertionActual70).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorVariationEventValidationTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_EVENT_VALIDATION_1500
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 130
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationEventValidationTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.7059605260763, 0.155691719537, -0.6909267863455, -0.49948841244, 0.801070057639, -0.329845552634,
          0.5021265392909, 0.5779678634854, 0.6432900491364,
        ];
        const previous: number[] = [
          0.1970377385263, -0.9690850979052, 0.1484931062862, -0.9314680383958, -0.2322954396856, -0.2800109321942,
          0.305848693055, -0.08314386158549, -0.94844276329,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-2.191310730172, 0.8470930024708, 2.784362854317];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual71 = promiseResult.length;
        expect(assertionActual71).assertEqual(3);
        const assertionActual72 = callbackResult.length;
        expect(assertionActual72).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual73 = JSON.stringify(current);
        expect(assertionActual73).assertEqual(currentBefore);
        const assertionActual74 = JSON.stringify(previous);
        expect(assertionActual74).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual75 = JSON.stringify(current);
        expect(assertionActual75).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorVariationEventValidationTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_EVENT_VALIDATION_1600
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 131
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationEventValidationTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.2744238163609, 0.3504940352141, 0.895458262731, 0, 0.7315128499338, -0.5283414838373, 0.4309805411366, 0,
          0.6241638562074, 0.7733105506431, -0.1114014042478, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.7454088192962, 0.659878545635, -0.09447749534256, 0, -0.656745542913, 0.7026787641433, -0.2737295129978, 0,
          -0.1142409032677, 0.266088067062, 0.9571552416342, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [1.444907771449, -1.019196276853, -2.201881891323];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual76 = promiseResult.length;
        expect(assertionActual76).assertEqual(3);
        const assertionActual77 = callbackResult.length;
        expect(assertionActual77).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual78 = JSON.stringify(current);
        expect(assertionActual78).assertEqual(currentBefore);
        const assertionActual79 = JSON.stringify(previous);
        expect(assertionActual79).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual80 = JSON.stringify(current);
        expect(assertionActual80).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorVariationEventValidationTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_EVENT_VALIDATION_1700
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 132
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationEventValidationTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.9041148703276, -0.4228450978245, -0.06146807706659, 0.3981593402378, 0.8859207586044, -0.2379360192471,
          0.1550659247993, 0.1906474041774, 0.9693338569588,
        ];
        const previous: number[] = [
          0.3880604277327, -0.9056478122238, 0.170912681338, 0.2609319123323, 0.2858192953779, 0.9220747624332,
          -0.8839251334556, -0.313224153928, 0.3472275735617,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-0.1741953929291, -0.9455408582993, -1.387509456432];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual81 = promiseResult.length;
        expect(assertionActual81).assertEqual(3);
        const assertionActual82 = callbackResult.length;
        expect(assertionActual82).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual83 = JSON.stringify(current);
        expect(assertionActual83).assertEqual(currentBefore);
        const assertionActual84 = JSON.stringify(previous);
        expect(assertionActual84).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual85 = JSON.stringify(current);
        expect(assertionActual85).assertEqual(currentBefore);
      },
    );
  });
}
