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

export default function sensorOrientationRepeatabilityTest(): void {
  describe('SensorOrientationRepeatability', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorOrientationRepeatabilityTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_REPEATABILITY_0100
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 87
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationRepeatabilityTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.06762882158231, -0.9843539594007, 0.1627071759437, 0, 0.9914943113989, -0.08448385781013,
          -0.09900256680111, 0, 0.1111996985386, 0.1546278124455, 0.9816948948952, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-1.656413219706, -0.1552507238039, -0.1127924094229];
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
          -0.06762882158231, -0.9843539594007, 0.1627071759437, 0.9914943113989, -0.08448385781013, -0.09900256680111,
          0.1111996985386, 0.1546278124455, 0.9816948948952,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual4 = JSON.stringify(input);
        expect(assertionActual4).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationRepeatabilityTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_REPEATABILITY_0200
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 88
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationRepeatabilityTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.8535653853963, 0.463486986545, -0.2379200415198, -0.3203253685368, 0.8270435934744, 0.4619421530503,
          0.4108744225735, -0.318086006917, 0.8544024233805,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.5108035946506, 0.3237099534196, -0.448243865597];
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
          0.8535653853963, 0.463486986545, -0.2379200415198, 0, -0.3203253685368, 0.8270435934744, 0.4619421530503, 0,
          0.4108744225735, -0.318086006917, 0.8544024233805, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual8 = JSON.stringify(input);
        expect(assertionActual8).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationRepeatabilityTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_REPEATABILITY_0300
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 89
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationRepeatabilityTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.8336539577386, -0.3172547390012, -0.4520735662789, 0, -0.4454821616196, -0.09755391856077, 0.889960042166,
          0, -0.3264455887671, 0.9433094208979, -0.06000511661321, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-1.869114062288, -1.232463756271, 1.752580644906];
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
          -0.8336539577386, -0.3172547390012, -0.4520735662789, -0.4454821616196, -0.09755391856077, 0.889960042166,
          -0.3264455887671, 0.9433094208979, -0.06000511661321,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual12 = JSON.stringify(input);
        expect(assertionActual12).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationRepeatabilityTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_REPEATABILITY_0400
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 90
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationRepeatabilityTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.8538193588588, -0.5135464147357, 0.08522078590335, 0.3998235214171, 0.7517653624705, 0.5243948812786,
          -0.3333671461911, -0.4136652266043, 0.8471997557476,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.5993074608853, 0.4264762211214, 0.3748843108626];
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
          0.8538193588588, -0.5135464147357, 0.08522078590335, 0, 0.3998235214171, 0.7517653624705, 0.5243948812786, 0,
          -0.3333671461911, -0.4136652266043, 0.8471997557476, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual16 = JSON.stringify(input);
        expect(assertionActual16).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationRepeatabilityTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_REPEATABILITY_0500
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 91
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationRepeatabilityTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.4632767639184, 0.1421660299353, 0.8747362230671, 0, -0.8718558497375, 0.2500693770564, 0.4211088742085, 0,
          -0.1588773655743, -0.957733849559, 0.2397996165908, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.5169404393595, 1.279018019048, 0.5851417655593];
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
          0.4632767639184, 0.1421660299353, 0.8747362230671, -0.8718558497375, 0.2500693770564, 0.4211088742085,
          -0.1588773655743, -0.957733849559, 0.2397996165908,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual20 = JSON.stringify(input);
        expect(assertionActual20).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationRepeatabilityTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_REPEATABILITY_0600
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 92
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationRepeatabilityTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.1509854984024, -0.7746843110739, -0.614058301343, -0.6536124576798, 0.5442530239733, -0.525908167898,
          0.7416158941379, 0.3219516486555, -0.5885176305685,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.9583622459503, -0.3277901726599, -2.241598847783];
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
          -0.1509854984024, -0.7746843110739, -0.614058301343, 0, -0.6536124576798, 0.5442530239733, -0.525908167898, 0,
          0.7416158941379, 0.3219516486555, -0.5885176305685, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual24 = JSON.stringify(input);
        expect(assertionActual24).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationRepeatabilityTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_REPEATABILITY_0700
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 93
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationRepeatabilityTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9956041029959, -0.0356965749307, 0.08659228970244, 0, 0.04456061156089, 0.9937143692352, -0.1026942270665,
          0, -0.08238217037086, 0.106101399207, 0.9909367644261, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.0359069300272, -0.1063014873684, 0.08294490702685];
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
          0.9956041029959, -0.0356965749307, 0.08659228970244, 0.04456061156089, 0.9937143692352, -0.1026942270665,
          -0.08238217037086, 0.106101399207, 0.9909367644261,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual28 = JSON.stringify(input);
        expect(assertionActual28).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationRepeatabilityTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_REPEATABILITY_0800
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 94
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationRepeatabilityTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.4587429908838, -0.6621034098137, 0.5925993106882, 0.4092737278871, -0.7494029892337, -0.5204711090819,
          0.7887013908802, 0.00377285577983, 0.6147648994396,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-2.417964327254, -0.003772864730636, -0.9087029295357];
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
          -0.4587429908838, -0.6621034098137, 0.5925993106882, 0, 0.4092737278871, -0.7494029892337, -0.5204711090819,
          0, 0.7887013908802, 0.00377285577983, 0.6147648994396, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual32 = JSON.stringify(input);
        expect(assertionActual32).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationRepeatabilityTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_REPEATABILITY_0900
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 95
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationRepeatabilityTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.5334686732381, 0.806552421397, 0.2547240982164, 0, -0.3172083263537, 0.4699546919385, -0.8237241438837, 0,
          -0.7840854879192, 0.3586304212747, 0.5065512496983, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [1.04321620994, -0.3668003033738, 0.9972093818502];
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
          0.5334686732381, 0.806552421397, 0.2547240982164, -0.3172083263537, 0.4699546919385, -0.8237241438837,
          -0.7840854879192, 0.3586304212747, 0.5065512496983,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual36 = JSON.stringify(input);
        expect(assertionActual36).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationRepeatabilityTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_REPEATABILITY_1000
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 96
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationRepeatabilityTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.5072947268025, -0.62422430352, -0.594134731398, 0.6382120692661, 0.7354094505574, -0.2277241635706,
          0.579083253774, -0.2636606890035, 0.7714568207442,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.7038039147634, 0.2668152180356, -0.6439080176478];
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
          0.5072947268025, -0.62422430352, -0.594134731398, 0, 0.6382120692661, 0.7354094505574, -0.2277241635706, 0,
          0.579083253774, -0.2636606890035, 0.7714568207442, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual40 = JSON.stringify(input);
        expect(assertionActual40).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationRepeatabilityTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_REPEATABILITY_1100
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 97
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationRepeatabilityTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.1061592112895, -0.04513879557052, 0.9933240714857, 0, -0.5215596432702, -0.8530459226976, 0.0169762269305,
          0, 0.8465847626613, -0.5198799312374, -0.1141012564627, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-3.088727109371, 0.5467103883352, -1.704767318074];
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
          0.1061592112895, -0.04513879557052, 0.9933240714857, -0.5215596432702, -0.8530459226976, 0.0169762269305,
          0.8465847626613, -0.5198799312374, -0.1141012564627,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual44 = JSON.stringify(input);
        expect(assertionActual44).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationRepeatabilityTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_REPEATABILITY_1200
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 98
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationRepeatabilityTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.924068029143, 0.2524877943413, -0.286963745488, -0.2888783841974, 0.9529577993882, -0.09176443607786,
          0.2502949393402, 0.1676942047117, 0.953536101596,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.2590006045133, -0.1684902849892, -0.2567001995312];
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
          0.924068029143, 0.2524877943413, -0.286963745488, 0, -0.2888783841974, 0.9529577993882, -0.09176443607786, 0,
          0.2502949393402, 0.1676942047117, 0.953536101596, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual48 = JSON.stringify(input);
        expect(assertionActual48).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationRepeatabilityTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_REPEATABILITY_1300
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 99
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationRepeatabilityTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.234541975254, -0.8042562876938, 0.5460420181167, 0, -0.5139472715823, 0.3741962270059, 0.7719037412318, 0,
          -0.825135300346, -0.4616806335548, -0.3255806024986, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-1.13531677655, 0.4798889067629, 1.946620228576];
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
          0.234541975254, -0.8042562876938, 0.5460420181167, -0.5139472715823, 0.3741962270059, 0.7719037412318,
          -0.825135300346, -0.4616806335548, -0.3255806024986,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual52 = JSON.stringify(input);
        expect(assertionActual52).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationRepeatabilityTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_REPEATABILITY_1400
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationRepeatabilityTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.262208391339, 0.3696718478708, -0.8913974895652, 0.8404906069759, 0.3663801266821, 0.3991755783584,
          0.4741542988277, -0.8538784033246, -0.2146377721629,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.7898702650396, 1.023392056684, -1.995872513014];
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
          0.262208391339, 0.3696718478708, -0.8913974895652, 0, 0.8404906069759, 0.3663801266821, 0.3991755783584, 0,
          0.4741542988277, -0.8538784033246, -0.2146377721629, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual56 = JSON.stringify(input);
        expect(assertionActual56).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationRepeatabilityTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_REPEATABILITY_1500
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 101
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationRepeatabilityTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9483512478857, 0.2703993012239, -0.165873833172, 0, -0.3116134050172, 0.8919725932174, -0.3275392781983, 0,
          0.05938852117311, 0.3623107931689, 0.9301633688263, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.2943419424001, -0.3707459417321, -0.06376086291079];
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
          0.9483512478857, 0.2703993012239, -0.165873833172, -0.3116134050172, 0.8919725932174, -0.3275392781983,
          0.05938852117311, 0.3623107931689, 0.9301633688263,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual60 = JSON.stringify(input);
        expect(assertionActual60).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationRepeatabilityTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_REPEATABILITY_1600
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 102
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationRepeatabilityTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.3946278164549, 0.8116590233624, 0.4306721679821, 0.4580499820722, -0.2325422184372, 0.8579710546213,
          0.7965294096288, 0.5358486226899, -0.2800127732044,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [1.849824422732, -0.5655125300304, -1.908843345817];
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
          -0.3946278164549, 0.8116590233624, 0.4306721679821, 0, 0.4580499820722, -0.2325422184372, 0.8579710546213, 0,
          0.7965294096288, 0.5358486226899, -0.2800127732044, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual64 = JSON.stringify(input);
        expect(assertionActual64).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationRepeatabilityTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_REPEATABILITY_1700
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 103
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationRepeatabilityTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.6117292295107, -0.4955612199585, 0.6166088119996, 0, 0.6730479025106, 0.7356315420416, -0.07650330240907, 0,
          -0.415684821335, 0.4618065738236, 0.7835437560755, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.5928244840946, -0.4800308891311, 0.4877636478662];
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
          0.6117292295107, -0.4955612199585, 0.6166088119996, 0.6730479025106, 0.7356315420416, -0.07650330240907,
          -0.415684821335, 0.4618065738236, 0.7835437560755,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual68 = JSON.stringify(input);
        expect(assertionActual68).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationRepeatabilityTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_REPEATABILITY_1800
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 104
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationRepeatabilityTest0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.5952051223767, 0.6114583565775, -0.5213919259713, -0.7537648555499, 0.1999489442297, -0.625986391417,
          -0.2785128450078, 0.7655972164742, 0.5799064556397,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [1.254753514977, -0.871969153009, 0.4477410344752];
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
          0.5952051223767, 0.6114583565775, -0.5213919259713, 0, -0.7537648555499, 0.1999489442297, -0.625986391417, 0,
          -0.2785128450078, 0.7655972164742, 0.5799064556397, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual72 = JSON.stringify(input);
        expect(assertionActual72).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationRepeatabilityTest0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_REPEATABILITY_1900
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 105
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationRepeatabilityTest0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.7085713784086, -0.2722800947202, -0.6509916679338, 0, 0.6572736019149, 0.08099820561862, -0.7492867961684,
          0, 0.2567450368086, -0.9588028163839, 0.1215695083827, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-1.281651969436, 1.282757437295, -1.128570233479];
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
          -0.7085713784086, -0.2722800947202, -0.6509916679338, 0.6572736019149, 0.08099820561862, -0.7492867961684,
          0.2567450368086, -0.9588028163839, 0.1215695083827,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual76 = JSON.stringify(input);
        expect(assertionActual76).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationRepeatabilityTest0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_REPEATABILITY_2000
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 106
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationRepeatabilityTest0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9986625290948, -0.01753025886654, -0.04863993221762, 0.01511256630544, 0.9986530309557, -0.0496360161853,
          0.04944454794743, 0.04883455525707, 0.9975822887818,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.01755210074719, -0.04885398633719, -0.04952385294725];
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
          0.9986625290948, -0.01753025886654, -0.04863993221762, 0, 0.01511256630544, 0.9986530309557, -0.0496360161853,
          0, 0.04944454794743, 0.04883455525707, 0.9975822887818, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual80 = JSON.stringify(input);
        expect(assertionActual80).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationRepeatabilityTest0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_REPEATABILITY_2100
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 107
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationRepeatabilityTest0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.5179192930916, 0.3203168767341, 0.7931939890864, 0, 0.5675722233716, 0.8224239990474, 0.03847774743755, 0,
          -0.6400167006418, 0.4701232437034, -0.6077522181196, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.3714037764302, -0.4894304097974, 2.330342512315];
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
          -0.5179192930916, 0.3203168767341, 0.7931939890864, 0.5675722233716, 0.8224239990474, 0.03847774743755,
          -0.6400167006418, 0.4701232437034, -0.6077522181196,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual84 = JSON.stringify(input);
        expect(assertionActual84).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationRepeatabilityTest0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_REPEATABILITY_2200
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 108
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationRepeatabilityTest0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.7249619343729, 0.2033338316749, 0.6580923541622, -0.6862695471792, 0.1315858328365, 0.7153455648924,
          0.05885832417541, -0.9702270463624, 0.234936536499,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.996432972392, 1.326166500032, -0.245476117501];
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
          0.7249619343729, 0.2033338316749, 0.6580923541622, 0, -0.6862695471792, 0.1315858328365, 0.7153455648924, 0,
          0.05885832417541, -0.9702270463624, 0.234936536499, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual88 = JSON.stringify(input);
        expect(assertionActual88).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationRepeatabilityTest0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_REPEATABILITY_2300
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 109
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationRepeatabilityTest0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.7161743805678, -0.3694976642183, -0.5920859167008, 0, 0.5292346947038, 0.8405654741629, 0.115586857242, 0,
          0.4549779055515, -0.3961327552506, 0.7975424413017, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.4141568308795, 0.4073012017177, -0.5184268605739];
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
          0.7161743805678, -0.3694976642183, -0.5920859167008, 0.5292346947038, 0.8405654741629, 0.115586857242,
          0.4549779055515, -0.3961327552506, 0.7975424413017,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual92 = JSON.stringify(input);
        expect(assertionActual92).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationRepeatabilityTest0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_REPEATABILITY_2400
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 110
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationRepeatabilityTest0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.4311889098975, 0.679025814028, -0.5941380882127, 0.4681671884841, -0.3945351825221, -0.7906715331787,
          -0.7712947605217, -0.6190847548082, -0.1477784109937,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [2.097151399137, 0.6675767309278, 1.760099989184];
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
          -0.4311889098975, 0.679025814028, -0.5941380882127, 0, 0.4681671884841, -0.3945351825221, -0.7906715331787, 0,
          -0.7712947605217, -0.6190847548082, -0.1477784109937, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual96 = JSON.stringify(input);
        expect(assertionActual96).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationRepeatabilityTest0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_REPEATABILITY_2500
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 111
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationRepeatabilityTest0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.877347372908, 0.464812643297, 0.1192090344005, 0, -0.475800920745, 0.8104342143724, 0.3417745865228, 0,
          0.06225006883296, -0.3565748039414, 0.932190612549, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.5207328342802, 0.3645991303499, -0.06667926436682];
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
          0.877347372908, 0.464812643297, 0.1192090344005, -0.475800920745, 0.8104342143724, 0.3417745865228,
          0.06225006883296, -0.3565748039414, 0.932190612549,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual100 = JSON.stringify(input);
        expect(assertionActual100).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationRepeatabilityTest0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_REPEATABILITY_2600
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 112
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationRepeatabilityTest0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.09605266164268, -0.2979380080563, 0.9497404011343, 0.9590137032956, 0.2832428708133, -0.008135909578944,
          -0.266583201051, 0.9115955350312, 0.3129328640915,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.8106777403765, -1.147148757835, 0.7055881051403];
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
          0.09605266164268, -0.2979380080563, 0.9497404011343, 0, 0.9590137032956, 0.2832428708133, -0.008135909578944,
          0, -0.266583201051, 0.9115955350312, 0.3129328640915, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual104 = JSON.stringify(input);
        expect(assertionActual104).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationRepeatabilityTest0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_REPEATABILITY_2700
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 113
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationRepeatabilityTest0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.1252423441011, -0.3893193495457, -0.9125485188818, 0, -0.9437178507323, 0.2370549854972, -0.2306546163858,
          0, 0.3061224811301, 0.890076051762, -0.3377182977373, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-1.023861331257, -1.097511991303, -2.405229112805];
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
          0.1252423441011, -0.3893193495457, -0.9125485188818, -0.9437178507323, 0.2370549854972, -0.2306546163858,
          0.3061224811301, 0.890076051762, -0.3377182977373,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual108 = JSON.stringify(input);
        expect(assertionActual108).assertEqual(inputBefore);
      },
    );
  });
}
