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
import { assertArrayNear, assertRotationMatrix, transformCallback } from '../Shared/SharedDriver';

export default function sensorTransformWorkflowTest(): void {
  describe('SensorTransformWorkflow', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorTransformWorkflowTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_TRANSFORM_WORKFLOW_0100
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 84
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorTransformWorkflowTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.5078358577293, -0.3961045070132, -0.7649862489798, -0.7888465521366, -0.5706564607086, -0.2281936042786,
          -0.3461558302072, 0.7193416596968, -0.6022654878359,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 129, y: 2 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.5078358577293, -0.3961045070132, 0.7649862489798, 0.7888465521366, -0.5706564607086, 0.2281936042786,
          0.3461558302072, 0.7193416596968, 0.6022654878359,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual1 = promiseResult.length;
        expect(assertionActual1).assertEqual(9);
        const assertionActual2 = callbackResult.length;
        expect(assertionActual2).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual3 = JSON.stringify(input);
        expect(assertionActual3).assertEqual(inputBefore);
        const assertionActual4 = JSON.stringify(coordinates);
        expect(assertionActual4).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorTransformWorkflowTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_TRANSFORM_WORKFLOW_0200
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 85
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorTransformWorkflowTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9805409798512, -0.01159349490133, -0.195971879892, 0.002878310055585, 0.9989963967245, -0.04469803869046,
          0.1962934083551, 0.04326419082246, 0.979590275385,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 129, y: 3 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.9805409798512, -0.195971879892, -0.01159349490133, -0.002878310055585, -0.04469803869046, 0.9989963967245,
          -0.1962934083551, 0.979590275385, 0.04326419082246,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual5 = promiseResult.length;
        expect(assertionActual5).assertEqual(9);
        const assertionActual6 = callbackResult.length;
        expect(assertionActual6).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual7 = JSON.stringify(input);
        expect(assertionActual7).assertEqual(inputBefore);
        const assertionActual8 = JSON.stringify(coordinates);
        expect(assertionActual8).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorTransformWorkflowTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_TRANSFORM_WORKFLOW_0300
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 86
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorTransformWorkflowTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.3068562157625, 0.9464638248217, 0.1002271976648, 0.3855627890669, -0.02733876292603, -0.9222764920178,
          -0.8701612485826, 0.3216501520993, -0.3733103013843,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 129, y: 130 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.3068562157625, -0.9464638248217, 0.1002271976648, -0.3855627890669, 0.02733876292603, -0.9222764920178,
          0.8701612485826, -0.3216501520993, -0.3733103013843,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual9 = promiseResult.length;
        expect(assertionActual9).assertEqual(9);
        const assertionActual10 = callbackResult.length;
        expect(assertionActual10).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual11 = JSON.stringify(input);
        expect(assertionActual11).assertEqual(inputBefore);
        const assertionActual12 = JSON.stringify(coordinates);
        expect(assertionActual12).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorTransformWorkflowTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_TRANSFORM_WORKFLOW_0400
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 87
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorTransformWorkflowTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.06762882158231, -0.9843539594007, 0.1627071759437, 0.9914943113989, -0.08448385781013, -0.09900256680111,
          0.1111996985386, 0.1546278124455, 0.9816948948952,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 129, y: 131 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.06762882158231, -0.1627071759437, 0.9843539594007, -0.9914943113989, 0.09900256680111, 0.08448385781013,
          -0.1111996985386, -0.9816948948952, -0.1546278124455,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual13 = promiseResult.length;
        expect(assertionActual13).assertEqual(9);
        const assertionActual14 = callbackResult.length;
        expect(assertionActual14).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual15 = JSON.stringify(input);
        expect(assertionActual15).assertEqual(inputBefore);
        const assertionActual16 = JSON.stringify(coordinates);
        expect(assertionActual16).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorTransformWorkflowTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_TRANSFORM_WORKFLOW_0500
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 88
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorTransformWorkflowTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.8535653853963, 0.463486986545, -0.2379200415198, -0.3203253685368, 0.8270435934744, 0.4619421530503,
          0.4108744225735, -0.318086006917, 0.8544024233805,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 130, y: 1 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.463486986545, -0.8535653853963, -0.2379200415198, 0.8270435934744, 0.3203253685368, 0.4619421530503,
          -0.318086006917, -0.4108744225735, 0.8544024233805,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual17 = promiseResult.length;
        expect(assertionActual17).assertEqual(9);
        const assertionActual18 = callbackResult.length;
        expect(assertionActual18).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual19 = JSON.stringify(input);
        expect(assertionActual19).assertEqual(inputBefore);
        const assertionActual20 = JSON.stringify(coordinates);
        expect(assertionActual20).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorTransformWorkflowTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_TRANSFORM_WORKFLOW_0600
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 89
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorTransformWorkflowTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.8336539577386, -0.3172547390012, -0.4520735662789, -0.4454821616196, -0.09755391856077, 0.889960042166,
          -0.3264455887671, 0.9433094208979, -0.06000511661321,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 130, y: 3 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.4520735662789, 0.8336539577386, -0.3172547390012, -0.889960042166, 0.4454821616196, -0.09755391856077,
          0.06000511661321, 0.3264455887671, 0.9433094208979,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual21 = promiseResult.length;
        expect(assertionActual21).assertEqual(9);
        const assertionActual22 = callbackResult.length;
        expect(assertionActual22).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual23 = JSON.stringify(input);
        expect(assertionActual23).assertEqual(inputBefore);
        const assertionActual24 = JSON.stringify(coordinates);
        expect(assertionActual24).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorTransformWorkflowTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_TRANSFORM_WORKFLOW_0700
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 90
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorTransformWorkflowTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.8538193588588, -0.5135464147357, 0.08522078590335, 0.3998235214171, 0.7517653624705, 0.5243948812786,
          -0.3333671461911, -0.4136652266043, 0.8471997557476,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 130, y: 129 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.5135464147357, -0.8538193588588, -0.08522078590335, -0.7517653624705, -0.3998235214171, -0.5243948812786,
          0.4136652266043, 0.3333671461911, -0.8471997557476,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual25 = promiseResult.length;
        expect(assertionActual25).assertEqual(9);
        const assertionActual26 = callbackResult.length;
        expect(assertionActual26).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual27 = JSON.stringify(input);
        expect(assertionActual27).assertEqual(inputBefore);
        const assertionActual28 = JSON.stringify(coordinates);
        expect(assertionActual28).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorTransformWorkflowTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_TRANSFORM_WORKFLOW_0800
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 91
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorTransformWorkflowTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.4632767639184, 0.1421660299353, 0.8747362230671, -0.8718558497375, 0.2500693770564, 0.4211088742085,
          -0.1588773655743, -0.957733849559, 0.2397996165908,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 130, y: 131 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.8747362230671, -0.4632767639184, -0.1421660299353, 0.4211088742085, 0.8718558497375, -0.2500693770564,
          0.2397996165908, 0.1588773655743, 0.957733849559,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual29 = promiseResult.length;
        expect(assertionActual29).assertEqual(9);
        const assertionActual30 = callbackResult.length;
        expect(assertionActual30).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual31 = JSON.stringify(input);
        expect(assertionActual31).assertEqual(inputBefore);
        const assertionActual32 = JSON.stringify(coordinates);
        expect(assertionActual32).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorTransformWorkflowTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_TRANSFORM_WORKFLOW_0900
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 92
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorTransformWorkflowTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.1509854984024, -0.7746843110739, -0.614058301343, -0.6536124576798, 0.5442530239733, -0.525908167898,
          0.7416158941379, 0.3219516486555, -0.5885176305685,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 131, y: 1 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.7746843110739, 0.614058301343, 0.1509854984024, 0.5442530239733, 0.525908167898, 0.6536124576798,
          0.3219516486555, 0.5885176305685, -0.7416158941379,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual33 = promiseResult.length;
        expect(assertionActual33).assertEqual(9);
        const assertionActual34 = callbackResult.length;
        expect(assertionActual34).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual35 = JSON.stringify(input);
        expect(assertionActual35).assertEqual(inputBefore);
        const assertionActual36 = JSON.stringify(coordinates);
        expect(assertionActual36).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorTransformWorkflowTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_TRANSFORM_WORKFLOW_1000
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 93
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorTransformWorkflowTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9956041029959, -0.0356965749307, 0.08659228970244, 0.04456061156089, 0.9937143692352, -0.1026942270665,
          -0.08238217037086, 0.106101399207, 0.9909367644261,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 131, y: 2 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.08659228970244, -0.0356965749307, -0.9956041029959, -0.1026942270665, 0.9937143692352, -0.04456061156089,
          0.9909367644261, 0.106101399207, 0.08238217037086,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual37 = promiseResult.length;
        expect(assertionActual37).assertEqual(9);
        const assertionActual38 = callbackResult.length;
        expect(assertionActual38).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual39 = JSON.stringify(input);
        expect(assertionActual39).assertEqual(inputBefore);
        const assertionActual40 = JSON.stringify(coordinates);
        expect(assertionActual40).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorTransformWorkflowTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_TRANSFORM_WORKFLOW_1100
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 94
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorTransformWorkflowTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.4587429908838, -0.6621034098137, 0.5925993106882, 0.4092737278871, -0.7494029892337, -0.5204711090819,
          0.7887013908802, 0.00377285577983, 0.6147648994396,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 131, y: 129 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.6621034098137, 0.5925993106882, 0.4587429908838, 0.7494029892337, -0.5204711090819, -0.4092737278871,
          -0.00377285577983, 0.6147648994396, -0.7887013908802,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual41 = promiseResult.length;
        expect(assertionActual41).assertEqual(9);
        const assertionActual42 = callbackResult.length;
        expect(assertionActual42).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual43 = JSON.stringify(input);
        expect(assertionActual43).assertEqual(inputBefore);
        const assertionActual44 = JSON.stringify(coordinates);
        expect(assertionActual44).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorTransformWorkflowTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_TRANSFORM_WORKFLOW_1200
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 95
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorTransformWorkflowTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.5334686732381, 0.806552421397, 0.2547240982164, -0.3172083263537, 0.4699546919385, -0.8237241438837,
          -0.7840854879192, 0.3586304212747, 0.5065512496983,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 131, y: 130 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.2547240982164, -0.806552421397, -0.5334686732381, 0.8237241438837, -0.4699546919385, 0.3172083263537,
          -0.5065512496983, -0.3586304212747, 0.7840854879192,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual45 = promiseResult.length;
        expect(assertionActual45).assertEqual(9);
        const assertionActual46 = callbackResult.length;
        expect(assertionActual46).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual47 = JSON.stringify(input);
        expect(assertionActual47).assertEqual(inputBefore);
        const assertionActual48 = JSON.stringify(coordinates);
        expect(assertionActual48).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorTransformWorkflowTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_TRANSFORM_WORKFLOW_1300
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 96
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorTransformWorkflowTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.5072947268025, -0.62422430352, -0.594134731398, 0.6382120692661, 0.7354094505574, -0.2277241635706,
          0.579083253774, -0.2636606890035, 0.7714568207442,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 1, y: 2 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.5072947268025, -0.62422430352, -0.594134731398, 0.6382120692661, 0.7354094505574, -0.2277241635706,
          0.579083253774, -0.2636606890035, 0.7714568207442,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual49 = promiseResult.length;
        expect(assertionActual49).assertEqual(9);
        const assertionActual50 = callbackResult.length;
        expect(assertionActual50).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual51 = JSON.stringify(input);
        expect(assertionActual51).assertEqual(inputBefore);
        const assertionActual52 = JSON.stringify(coordinates);
        expect(assertionActual52).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorTransformWorkflowTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_TRANSFORM_WORKFLOW_1400
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 97
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorTransformWorkflowTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.1061592112895, -0.04513879557052, 0.9933240714857, -0.5215596432702, -0.8530459226976, 0.0169762269305,
          0.8465847626613, -0.5198799312374, -0.1141012564627,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 1, y: 3 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.1061592112895, -0.9933240714857, -0.04513879557052, -0.5215596432702, -0.0169762269305, -0.8530459226976,
          0.8465847626613, 0.1141012564627, -0.5198799312374,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual53 = promiseResult.length;
        expect(assertionActual53).assertEqual(9);
        const assertionActual54 = callbackResult.length;
        expect(assertionActual54).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual55 = JSON.stringify(input);
        expect(assertionActual55).assertEqual(inputBefore);
        const assertionActual56 = JSON.stringify(coordinates);
        expect(assertionActual56).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorTransformWorkflowTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_TRANSFORM_WORKFLOW_1500
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 98
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorTransformWorkflowTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.924068029143, 0.2524877943413, -0.286963745488, -0.2888783841974, 0.9529577993882, -0.09176443607786,
          0.2502949393402, 0.1676942047117, 0.953536101596,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 1, y: 130 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.924068029143, -0.2524877943413, 0.286963745488, -0.2888783841974, -0.9529577993882, 0.09176443607786,
          0.2502949393402, -0.1676942047117, -0.953536101596,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual57 = promiseResult.length;
        expect(assertionActual57).assertEqual(9);
        const assertionActual58 = callbackResult.length;
        expect(assertionActual58).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual59 = JSON.stringify(input);
        expect(assertionActual59).assertEqual(inputBefore);
        const assertionActual60 = JSON.stringify(coordinates);
        expect(assertionActual60).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorTransformWorkflowTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_TRANSFORM_WORKFLOW_1600
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 99
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorTransformWorkflowTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.234541975254, -0.8042562876938, 0.5460420181167, -0.5139472715823, 0.3741962270059, 0.7719037412318,
          -0.825135300346, -0.4616806335548, -0.3255806024986,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 1, y: 131 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.234541975254, 0.5460420181167, 0.8042562876938, -0.5139472715823, 0.7719037412318, -0.3741962270059,
          -0.825135300346, -0.3255806024986, 0.4616806335548,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual61 = promiseResult.length;
        expect(assertionActual61).assertEqual(9);
        const assertionActual62 = callbackResult.length;
        expect(assertionActual62).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual63 = JSON.stringify(input);
        expect(assertionActual63).assertEqual(inputBefore);
        const assertionActual64 = JSON.stringify(coordinates);
        expect(assertionActual64).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorTransformWorkflowTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_TRANSFORM_WORKFLOW_1700
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorTransformWorkflowTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.262208391339, 0.3696718478708, -0.8913974895652, 0.8404906069759, 0.3663801266821, 0.3991755783584,
          0.4741542988277, -0.8538784033246, -0.2146377721629,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 2, y: 1 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.3696718478708, 0.262208391339, 0.8913974895652, 0.3663801266821, 0.8404906069759, -0.3991755783584,
          -0.8538784033246, 0.4741542988277, 0.2146377721629,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual65 = promiseResult.length;
        expect(assertionActual65).assertEqual(9);
        const assertionActual66 = callbackResult.length;
        expect(assertionActual66).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual67 = JSON.stringify(input);
        expect(assertionActual67).assertEqual(inputBefore);
        const assertionActual68 = JSON.stringify(coordinates);
        expect(assertionActual68).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorTransformWorkflowTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_TRANSFORM_WORKFLOW_1800
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 101
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorTransformWorkflowTest0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9483512478857, 0.2703993012239, -0.165873833172, -0.3116134050172, 0.8919725932174, -0.3275392781983,
          0.05938852117311, 0.3623107931689, 0.9301633688263,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 2, y: 3 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.165873833172, 0.9483512478857, 0.2703993012239, -0.3275392781983, -0.3116134050172, 0.8919725932174,
          0.9301633688263, 0.05938852117311, 0.3623107931689,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual69 = promiseResult.length;
        expect(assertionActual69).assertEqual(9);
        const assertionActual70 = callbackResult.length;
        expect(assertionActual70).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual71 = JSON.stringify(input);
        expect(assertionActual71).assertEqual(inputBefore);
        const assertionActual72 = JSON.stringify(coordinates);
        expect(assertionActual72).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorTransformWorkflowTest0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_TRANSFORM_WORKFLOW_1900
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 102
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorTransformWorkflowTest0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.3946278164549, 0.8116590233624, 0.4306721679821, 0.4580499820722, -0.2325422184372, 0.8579710546213,
          0.7965294096288, 0.5358486226899, -0.2800127732044,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 2, y: 129 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.8116590233624, -0.3946278164549, 0.4306721679821, 0.2325422184372, 0.4580499820722, 0.8579710546213,
          -0.5358486226899, 0.7965294096288, -0.2800127732044,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual73 = promiseResult.length;
        expect(assertionActual73).assertEqual(9);
        const assertionActual74 = callbackResult.length;
        expect(assertionActual74).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual75 = JSON.stringify(input);
        expect(assertionActual75).assertEqual(inputBefore);
        const assertionActual76 = JSON.stringify(coordinates);
        expect(assertionActual76).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorTransformWorkflowTest0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_TRANSFORM_WORKFLOW_2000
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 103
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorTransformWorkflowTest0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.6117292295107, -0.4955612199585, 0.6166088119996, 0.6730479025106, 0.7356315420416, -0.07650330240907,
          -0.415684821335, 0.4618065738236, 0.7835437560755,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 2, y: 131 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.6166088119996, 0.6117292295107, 0.4955612199585, 0.07650330240907, 0.6730479025106, -0.7356315420416,
          -0.7835437560755, -0.415684821335, -0.4618065738236,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual77 = promiseResult.length;
        expect(assertionActual77).assertEqual(9);
        const assertionActual78 = callbackResult.length;
        expect(assertionActual78).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual79 = JSON.stringify(input);
        expect(assertionActual79).assertEqual(inputBefore);
        const assertionActual80 = JSON.stringify(coordinates);
        expect(assertionActual80).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorTransformWorkflowTest0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_TRANSFORM_WORKFLOW_2100
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 104
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorTransformWorkflowTest0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.5952051223767, 0.6114583565775, -0.5213919259713, -0.7537648555499, 0.1999489442297, -0.625986391417,
          -0.2785128450078, 0.7655972164742, 0.5799064556397,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 3, y: 1 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.6114583565775, -0.5213919259713, 0.5952051223767, 0.1999489442297, -0.625986391417, -0.7537648555499,
          0.7655972164742, 0.5799064556397, -0.2785128450078,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual81 = promiseResult.length;
        expect(assertionActual81).assertEqual(9);
        const assertionActual82 = callbackResult.length;
        expect(assertionActual82).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual83 = JSON.stringify(input);
        expect(assertionActual83).assertEqual(inputBefore);
        const assertionActual84 = JSON.stringify(coordinates);
        expect(assertionActual84).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorTransformWorkflowTest0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_TRANSFORM_WORKFLOW_2200
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 105
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorTransformWorkflowTest0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.7085713784086, -0.2722800947202, -0.6509916679338, 0.6572736019149, 0.08099820561862, -0.7492867961684,
          0.2567450368086, -0.9588028163839, 0.1215695083827,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 3, y: 2 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.6509916679338, -0.2722800947202, -0.7085713784086, 0.7492867961684, 0.08099820561862, 0.6572736019149,
          -0.1215695083827, -0.9588028163839, 0.2567450368086,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual85 = promiseResult.length;
        expect(assertionActual85).assertEqual(9);
        const assertionActual86 = callbackResult.length;
        expect(assertionActual86).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual87 = JSON.stringify(input);
        expect(assertionActual87).assertEqual(inputBefore);
        const assertionActual88 = JSON.stringify(coordinates);
        expect(assertionActual88).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );
  });
}
