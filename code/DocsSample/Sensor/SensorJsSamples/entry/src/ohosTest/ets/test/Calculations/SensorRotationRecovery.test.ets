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
import { assertArrayNear, assertUnitQuaternion, assertRotationMatrix, rotationCallback } from '../Shared/SharedDriver';

export default function sensorRotationRecoveryTest(): void {
  describe('SensorRotationRecovery', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorRotationRecoveryTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_RECOVERY_0100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 82
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationRecoveryTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.2548961406046, 0.3287157592778, -0.3171284036961];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.5827510503431, 0.3729959267979, 0.7219939417448, -0.7081494403812, 0.6689150661481, 0.2260022220419,
          -0.3986547170318, -0.64298263808, 0.6539478142145,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
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
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.8522930732303, -0.2548961406046, 0.3287157592778, -0.3171284036961];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual4 = JSON.stringify(input);
        expect(assertionActual4).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationRecoveryTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_RECOVERY_0200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 83
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationRecoveryTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.2972281254477, -0.2719657343727, 0.424900945484, 0.8106474371123];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.4909876517078, -0.8505614557936, -0.1883516280489, 0.5272179941391, 0.4622292559392, -0.7130114316123,
          0.6935216741576, 0.2507774409153, 0.6753801615398,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
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
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.8106474371123, 0.2972281254477, -0.2719657343727, 0.424900945484];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual8 = JSON.stringify(input);
        expect(assertionActual8).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationRecoveryTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_RECOVERY_0300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 84
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationRecoveryTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.8186509949719, -0.3618608743005, -0.3393210556182];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.5078358577293, -0.3961045070132, -0.7649862489798, -0.7888465521366, -0.5706564607086, -0.2281936042786,
          -0.3461558302072, 0.7193416596968, -0.6022654878359,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
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
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.2893587346119, 0.8186509949719, -0.3618608743005, -0.3393210556182];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual12 = JSON.stringify(input);
        expect(assertionActual12).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationRecoveryTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_RECOVERY_0400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 85
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationRecoveryTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.0221037764973, -0.09857121979599, 0.003636578382011, 0.9948778382245];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.9805409798512, -0.01159349490133, -0.195971879892, 0.002878310055585, 0.9989963967245, -0.04469803869046,
          0.1962934083551, 0.04326419082246, 0.979590275385,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
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
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.9948778382245, 0.0221037764973, -0.09857121979599, 0.003636578382011];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual16 = JSON.stringify(input);
        expect(assertionActual16).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationRecoveryTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_RECOVERY_0500
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 86
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationRecoveryTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.6533577274497, 0.5096850308513, -0.2946066215224];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.3068562157625, 0.9464638248217, 0.1002271976648, 0.3855627890669, -0.02733876292603, -0.9222764920178,
          -0.8701612485826, 0.3216501520993, -0.3733103013843,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
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
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.4759745664035, 0.6533577274497, 0.5096850308513, -0.2946066215224];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual20 = JSON.stringify(input);
        expect(assertionActual20).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationRecoveryTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_RECOVERY_0600
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 87
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationRecoveryTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.09375518829998, 0.01903988495901, 0.7303779114759, 0.6763102497195];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.06762882158231, -0.9843539594007, 0.1627071759437, 0.9914943113989, -0.08448385781013, -0.09900256680111,
          0.1111996985386, 0.1546278124455, 0.9816948948952,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
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
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.6763102497195, 0.09375518829998, 0.01903988495901, 0.7303779114759];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual24 = JSON.stringify(input);
        expect(assertionActual24).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationRecoveryTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_RECOVERY_0700
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 88
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationRecoveryTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.2074363568311, -0.1725367965809, -0.2084427046636];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.8535653853963, 0.463486986545, -0.2379200415198, -0.3203253685368, 0.8270435934744, 0.4619421530503,
          0.4108744225735, -0.318086006917, 0.8544024233805,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
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
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.9400812999751, -0.2074363568311, -0.1725367965809, -0.2084427046636];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual28 = JSON.stringify(input);
        expect(assertionActual28).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationRecoveryTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_RECOVERY_0800
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 89
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationRecoveryTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.2845632958743, -0.6700942388558, -0.6839595674611, 0.04686951857931];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.8336539577386, -0.3172547390012, -0.4520735662789, -0.4454821616196, -0.09755391856077, 0.889960042166,
          -0.3264455887671, 0.9433094208979, -0.06000511661321,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
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
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.04686951857931, 0.2845632958743, -0.6700942388558, -0.6839595674611];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual32 = JSON.stringify(input);
        expect(assertionActual32).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationRecoveryTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_RECOVERY_0900
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 90
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationRecoveryTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.2524154515084, 0.1126346392813, 0.2457717612025];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.8538193588588, -0.5135464147357, 0.08522078590335, 0.3998235214171, 0.7517653624705, 0.5243948812786,
          -0.3333671461911, -0.4136652266043, 0.8471997557476,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
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
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.9290834834767, -0.2524154515084, 0.1126346392813, 0.2457717612025];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual36 = JSON.stringify(input);
        expect(assertionActual36).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationRecoveryTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_RECOVERY_1000
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 91
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationRecoveryTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.493307148304, 0.3697948744058, -0.3627855687648, 0.698774956185];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.4632767639184, 0.1421660299353, 0.8747362230671, -0.8718558497375, 0.2500693770564, 0.4211088742085,
          -0.1588773655743, -0.957733849559, 0.2397996165908,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
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
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.698774956185, -0.493307148304, 0.3697948744058, -0.3627855687648];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual40 = JSON.stringify(input);
        expect(assertionActual40).assertEqual(inputBefore);
      },
    );
  });
}
