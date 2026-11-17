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

export default function sensorRotationConfigurationsTest(): void {
  describe('SensorRotationConfigurations', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorRotationConfigurationsTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_CONFIGURATIONS_0100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 138
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationConfigurationsTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.2416261111264, -0.3070087761908, 0.462778397115];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.383163533011, -0.5881378204757, -0.7122356429558, 0.8848631671663, 0.4549059551712, 0.1003879840529,
          0.2649582653229, -0.6686961014361, 0.6947248675276,
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
        const expectedQuaternion: number[] = [0.7957377639194, -0.2416261111264, -0.3070087761908, 0.462778397115];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual4 = JSON.stringify(input);
        expect(assertionActual4).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationConfigurationsTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_CONFIGURATIONS_0200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 139
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationConfigurationsTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.5977670683772, -0.2596053078665, -0.6907738375322, 0.3132269488282];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.08912682098295, 0.1223709552841, -0.9884744605119, -0.7431049705582, -0.6689879253106, -0.01581640035816,
          -0.6632129465814, 0.7331306193929, 0.1505592321825,
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
        const expectedQuaternion: number[] = [0.3132269488282, 0.5977670683772, -0.2596053078665, -0.6907738375322];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual8 = JSON.stringify(input);
        expect(assertionActual8).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationConfigurationsTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_CONFIGURATIONS_0300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 140
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationConfigurationsTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.03346206714205, -0.04775774194595, -0.04897484282862];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.9906413257083, 0.1008614108316, -0.09196053286069, -0.09446911976138, 0.992963509665, 0.07140765985035,
          0.0985157307767, -0.06205194822774, 0.9931989762936,
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
        const expectedQuaternion: number[] = [0.9970962606071, -0.03346206714205, -0.04775774194595, -0.04897484282862];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual12 = JSON.stringify(input);
        expect(assertionActual12).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationConfigurationsTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_CONFIGURATIONS_0400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 141
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationConfigurationsTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.4241742115005, 0.5506195952089, 0.5576272301555, 0.4538129260599];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.2282601328778, -0.03899962466611, 0.9728187606202, 0.973234155204, 0.01825622097401, 0.2290894793309,
          -0.02669439797041, 0.9990724396517, 0.03378859933982,
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
        const expectedQuaternion: number[] = [0.4538129260599, 0.4241742115005, 0.5506195952089, 0.5576272301555];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual16 = JSON.stringify(input);
        expect(assertionActual16).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationConfigurationsTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_CONFIGURATIONS_0500
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 142
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationConfigurationsTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.6220537173068, -0.02148366600141, -0.3608433400402];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.7386610720875, 0.4745091075262, -0.4787702240712, -0.5279650847165, -0.03431748653321, -0.8485724361764,
          -0.4190855400785, 0.8795813873615, 0.2251752497598,
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
        const expectedQuaternion: number[] = [0.6945356065952, 0.6220537173068, -0.02148366600141, -0.3608433400402];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual20 = JSON.stringify(input);
        expect(assertionActual20).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationConfigurationsTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_CONFIGURATIONS_0600
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 143
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationConfigurationsTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.147765739586, -0.3303817704289, 0.04220380434697, 0.9312529252955];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.7781334493338, 0.0190333807929, -0.6278105330779, 0.1762430458198, 0.9527682502065, 0.2473278192979,
          0.6028654276272, -0.3031012896939, 0.7380263439457,
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
        const expectedQuaternion: number[] = [0.9312529252955, -0.147765739586, -0.3303817704289, 0.04220380434697];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual24 = JSON.stringify(input);
        expect(assertionActual24).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationConfigurationsTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_CONFIGURATIONS_0700
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 144
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationConfigurationsTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.6900307048893, 0.6852944170373, 0.2292400087647];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.04435883928186, -0.9645304353876, -0.260217856014, -0.9269663231923, -0.05738671061702, 0.3707292827818,
          -0.3725127233329, 0.2576583098903, -0.8915416234252,
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
        const expectedQuaternion: number[] = [0.04096592082435, -0.6900307048893, 0.6852944170373, 0.2292400087647];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual28 = JSON.stringify(input);
        expect(assertionActual28).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationConfigurationsTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_CONFIGURATIONS_0800
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 145
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationConfigurationsTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.01387837762248, 0.1795737132939, 0.2960112322492, 0.9380501172703];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.7602612637524, -0.5603311258576, 0.3286819743046, 0.550362358641, 0.8243694820338, 0.1323488998159,
          -0.3451145969512, 0.08027444479076, 0.9351213442568,
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
        const expectedQuaternion: number[] = [0.9380501172703, -0.01387837762248, 0.1795737132939, 0.2960112322492];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual32 = JSON.stringify(input);
        expect(assertionActual32).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationConfigurationsTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_CONFIGURATIONS_0900
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 146
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationConfigurationsTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.5060275281574, 0.2357353386781, -0.4744246853947];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.438700135973, 0.4072584278005, 0.8010510368777, -0.884412710723, 0.03771471727003, 0.4651792742726,
          0.1592367665109, -0.9125339298277, 0.3767299816904,
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
        const expectedQuaternion: number[] = [0.6806513121513, -0.5060275281574, 0.2357353386781, -0.4744246853947];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual36 = JSON.stringify(input);
        expect(assertionActual36).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationConfigurationsTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_CONFIGURATIONS_1000
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 147
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationConfigurationsTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.1751654229635, -0.6070256253037, 0.6158029219646, 0.470769291822];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.4953866969509, -0.3671424101382, -0.7872728060602, 0.7924620117624, 0.1802076717958, -0.5826913032983,
          0.3558032889078, -0.9125413117793, 0.2016739296453,
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
        const expectedQuaternion: number[] = [0.470769291822, -0.1751654229635, -0.6070256253037, 0.6158029219646];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual40 = JSON.stringify(input);
        expect(assertionActual40).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationConfigurationsTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_CONFIGURATIONS_1100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 148
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationConfigurationsTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.05859211334856, 0.04820655948688, -0.05750523688466];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.9887385507066, 0.1201371220542, 0.08923648497806, -0.1088390252638, 0.9865202239684, -0.1221962122204,
          -0.1027138984088, 0.1111076937296, 0.9884861837516,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
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
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.9954578040312, 0.05859211334856, 0.04820655948688, -0.05750523688466];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual44 = JSON.stringify(input);
        expect(assertionActual44).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationConfigurationsTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_CONFIGURATIONS_1200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 149
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationConfigurationsTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.6512298673597, -0.08846421786817, -0.6935724522833, 0.2950101616037];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.02226267118147, 0.5244429242006, 0.8511545057907, -0.2940007607271, -0.8102861734151, 0.5069515458741,
          0.9555458786284, -0.2615261677695, 0.1361474840313,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
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
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.2950101616037, -0.6512298673597, -0.08846421786817, -0.6935724522833];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual48 = JSON.stringify(input);
        expect(assertionActual48).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationConfigurationsTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_CONFIGURATIONS_1300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 150
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationConfigurationsTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.3772338670285, 0.4389133458913, 0.1162803107986];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.5876679282381, 0.1434292565537, 0.7962879218504, 0.5188626584904, 0.6883469977746, -0.5069121741279,
          -0.620828436643, 0.7110600952235, 0.3300993687304,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
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
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.8071731993109, 0.3772338670285, 0.4389133458913, 0.1162803107986];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual52 = JSON.stringify(input);
        expect(assertionActual52).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationConfigurationsTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_CONFIGURATIONS_1400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 151
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationConfigurationsTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.3303669818955, -0.3898412222577, 0.08500082828271, 0.8553691237666];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.6815973612398, -0.4029955040466, -0.6107533551845, -0.1121671680162, 0.767265032929, -0.631445085232,
          0.723079223578, 0.4988977780694, 0.4777629574039,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
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
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.8553691237666, 0.3303669818955, -0.3898412222577, 0.08500082828271];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual56 = JSON.stringify(input);
        expect(assertionActual56).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationConfigurationsTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_CONFIGURATIONS_1500
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 152
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationConfigurationsTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.5525860758347, 0.3806525779395, -0.7108098498752];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.3002940555432, -0.1207902297109, 0.9461676387469, -0.720583027489, -0.6212040277719, -0.3080026889084,
          0.6249668636818, -0.7742837182108, 0.09950448740323,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
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
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.2109540258493, -0.5525860758347, 0.3806525779395, -0.7108098498752];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual60 = JSON.stringify(input);
        expect(assertionActual60).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationConfigurationsTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_CONFIGURATIONS_1600
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 153
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationConfigurationsTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.1223019991414, -0.07151988325318, -0.1130525523411, 0.9834359398124];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.9642080534172, 0.2048658367191, -0.1683235535234, -0.23985393552, 0.9445226828304, -0.2243813522432,
          0.113017340886, 0.2567233736229, 0.959854254611,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
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
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.9834359398124, 0.1223019991414, -0.07151988325318, -0.1130525523411];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual64 = JSON.stringify(input);
        expect(assertionActual64).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationConfigurationsTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_CONFIGURATIONS_1700
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 154
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationConfigurationsTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.09483668834986, 0.5888035353547, 0.5887799101032];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.3867027715747, -0.7541302906373, 0.5307998409945, 0.5307695811104, 0.2886884400033, 0.7968328785739,
          -0.754151588359, 0.5898698918845, 0.2886327985933,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
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
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.5455773242681, -0.09483668834986, 0.5888035353547, 0.5887799101032];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual68 = JSON.stringify(input);
        expect(assertionActual68).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationConfigurationsTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_CONFIGURATIONS_1800
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 155
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationConfigurationsTest0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.5182236775779, -0.3446081143531, -0.4848657188688, 0.6144873490849];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.2923009643756, 0.9530558691863, 0.07902313860336, -0.2387195318131, -0.007301090673204, 0.9710611099235,
          0.9260524452514, -0.3027064655481, 0.2253789350391,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
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
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.6144873490849, -0.5182236775779, -0.3446081143531, -0.4848657188688];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual72 = JSON.stringify(input);
        expect(assertionActual72).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationConfigurationsTest0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_CONFIGURATIONS_1900
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 156
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationConfigurationsTest0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.05618266386741, -0.06544556054876, 0.2492618970361];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.8671707705809, -0.4735159691832, -0.1542643237391, 0.4882235929029, 0.8694240299335, 0.07576001258735,
          0.09824753423461, -0.1410123508872, 0.9851207737704,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
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
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.9645874214249, -0.05618266386741, -0.06544556054876, 0.2492618970361];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual76 = JSON.stringify(input);
        expect(assertionActual76).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationConfigurationsTest0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_CONFIGURATIONS_2000
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 157
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationConfigurationsTest0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.6998044856621, -0.6563675214759, 0.2513718397582, 0.1275443325883];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.01198774985635, 0.8545357644765, -0.5192541969824, 0.9827799786104, -0.1058282399524, -0.1514724307297,
          -0.1843903671453, -0.508496814994, -0.8410892828024,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
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
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.1275443325883, -0.6998044856621, -0.6563675214759, 0.2513718397582];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual80 = JSON.stringify(input);
        expect(assertionActual80).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationConfigurationsTest0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_CONFIGURATIONS_2100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 158
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationConfigurationsTest0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.2009845341976, 0.3940713466114, 0.03610567113525];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.6868083085835, -0.2231136464722, 0.6917475319931, -0.09369533768512, 0.9166031950505, 0.3886640792759,
          -0.7207742579732, -0.3317512374976, 0.6086259815864,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
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
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.8961079015973, -0.2009845341976, 0.3940713466114, 0.03610567113525];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual84 = JSON.stringify(input);
        expect(assertionActual84).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationConfigurationsTest0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_CONFIGURATIONS_2200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 159
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationConfigurationsTest0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.5456177769163, -0.1464562119925, -0.3343382002534, 0.7543671435932];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.7335370916402, 0.3446092806327, -0.5858052397255, -0.6642457318444, 0.1810384187284, -0.7252604350651,
          -0.1438782225164, 0.9211240603991, 0.3617036389634,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
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
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.7543671435932, 0.5456177769163, -0.1464562119925, -0.3343382002534];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual88 = JSON.stringify(input);
        expect(assertionActual88).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationConfigurationsTest0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_CONFIGURATIONS_2300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 160
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationConfigurationsTest0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.5286399821417, -0.4725213316515, 0.597350605651];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.1602083098748, -0.94729851022, 0.2774145453684, -0.0518761630834, -0.2725759535809, -0.960734725735,
          0.9857191086465, -0.1683088888453, -0.005473279169123,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual89 = promiseResult.length;
        expect(assertionActual89).assertEqual(9);
        const assertionActual90 = callbackResult.length;
        expect(assertionActual90).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual91 = JSON.stringify(input);
        expect(assertionActual91).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.3747474007165, 0.5286399821417, -0.4725213316515, 0.597350605651];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual92 = JSON.stringify(input);
        expect(assertionActual92).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationConfigurationsTest0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_CONFIGURATIONS_2400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 161
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationConfigurationsTest0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.004051131042026, -0.007058993969601, 0.006930477104813, 0.9999428620819];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.9998042781825, -0.01391735604275, -0.01406102872489, 0.01380296840437, 0.9998711136488, -0.008199643529843,
          0.01417333380863, 0.008003954745486, 0.9998675178828,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual93 = promiseResult.length;
        expect(assertionActual93).assertEqual(9);
        const assertionActual94 = callbackResult.length;
        expect(assertionActual94).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual95 = JSON.stringify(input);
        expect(assertionActual95).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [
          0.9999428620819, 0.004051131042026, -0.007058993969601, 0.006930477104813,
        ];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual96 = JSON.stringify(input);
        expect(assertionActual96).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationConfigurationsTest0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_CONFIGURATIONS_2500
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 162
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationConfigurationsTest0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.5717935978197, 0.3688799298965, -0.6175462751513];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.0348716092674, 0.9090685017485, -0.4151848142645, -0.06537577263257, -0.4166226409218, -0.9067257487377,
          -0.9972512116913, -0.004475958004823, 0.07395935762391,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual97 = promiseResult.length;
        expect(assertionActual97).assertEqual(9);
        const assertionActual98 = callbackResult.length;
        expect(assertionActual98).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual99 = JSON.stringify(input);
        expect(assertionActual99).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.3944822896642, 0.5717935978197, 0.3688799298965, -0.6175462751513];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual100 = JSON.stringify(input);
        expect(assertionActual100).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationConfigurationsTest0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_CONFIGURATIONS_2600
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 163
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationConfigurationsTest0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.2175880885224, 0.21977922994, 0.5970883608756, 0.7401607954539];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.1903651587877, -0.9795254773631, 0.06550530906947, 0.7882401072049, 0.19228182608, 0.5845555856828,
          -0.5851825695571, -0.05964510504531, 0.8087050276403,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual101 = promiseResult.length;
        expect(assertionActual101).assertEqual(9);
        const assertionActual102 = callbackResult.length;
        expect(assertionActual102).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual103 = JSON.stringify(input);
        expect(assertionActual103).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.7401607954539, -0.2175880885224, 0.21977922994, 0.5970883608756];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual104 = JSON.stringify(input);
        expect(assertionActual104).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationConfigurationsTest0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_CONFIGURATIONS_2700
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 164
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationConfigurationsTest0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.2930775488517, -0.2761636117409, -0.1345555804109];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.811256910661, 0.4055257016694, -0.4212020063939, -0.08177628402516, 0.7920006922787, 0.6050186301273,
          0.5789428851586, -0.4563812098626, 0.6756784198186,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual105 = promiseResult.length;
        expect(assertionActual105).assertEqual(9);
        const assertionActual106 = callbackResult.length;
        expect(assertionActual106).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual107 = JSON.stringify(input);
        expect(assertionActual107).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.9053916311131, -0.2930775488517, -0.2761636117409, -0.1345555804109];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual108 = JSON.stringify(input);
        expect(assertionActual108).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationConfigurationsTest0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_CONFIGURATIONS_2800
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 165
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationConfigurationsTest0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.03497051858356, 0.992537810153, 0.04841134433557, 0.1063113351731];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.9749499256874, -0.07971247317736, 0.2076500999808, -0.059125774562, 0.9928668091392, 0.1035357044314,
          -0.2144219792478, 0.08866465434216, -0.9727084835067,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual109 = promiseResult.length;
        expect(assertionActual109).assertEqual(9);
        const assertionActual110 = callbackResult.length;
        expect(assertionActual110).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual111 = JSON.stringify(input);
        expect(assertionActual111).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.1063113351731, -0.03497051858356, 0.992537810153, 0.04841134433557];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual112 = JSON.stringify(input);
        expect(assertionActual112).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationConfigurationsTest0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_CONFIGURATIONS_2900
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 166
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationConfigurationsTest0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.2637871216636, 0.0292883703852, -0.1019751965846];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.9774865012834, 0.1800811868539, 0.1099586556394, -0.2109847665424, 0.8400348274519, 0.4998268869868,
          -0.002359681286838, -0.5117736362975, 0.8591170916092,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual113 = promiseResult.length;
        expect(assertionActual113).assertEqual(9);
        const assertionActual114 = callbackResult.length;
        expect(assertionActual114).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual115 = JSON.stringify(input);
        expect(assertionActual115).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.9587281184393, -0.2637871216636, 0.0292883703852, -0.1019751965846];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual116 = JSON.stringify(input);
        expect(assertionActual116).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationConfigurationsTest0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_CONFIGURATIONS_3000
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 167
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationConfigurationsTest0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.2460715692722, 0.5159934785079, 0.5241848322892, 0.6312129391348];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.08203801652948, -0.9156871472596, 0.3934295517464, 0.407801847297, 0.3293580887876, 0.8515990269436,
          -0.9093774888269, 0.2303047930323, 0.3463990258665,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual117 = promiseResult.length;
        expect(assertionActual117).assertEqual(9);
        const assertionActual118 = callbackResult.length;
        expect(assertionActual118).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual119 = JSON.stringify(input);
        expect(assertionActual119).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.6312129391348, -0.2460715692722, 0.5159934785079, 0.5241848322892];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual120 = JSON.stringify(input);
        expect(assertionActual120).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationConfigurationsTest0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_CONFIGURATIONS_3100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 168
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationConfigurationsTest0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.4560262028233, -0.5171603140961, -0.4962770063831];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.02749131508094, 0.05193086595326, -0.9982722137556, -0.9952854831059, 0.09149847054799, 0.03216888257332,
          0.09301093867797, 0.9944502074256, 0.04917062372514,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual121 = promiseResult.length;
        expect(assertionActual121).assertEqual(9);
        const assertionActual122 = callbackResult.length;
        expect(assertionActual122).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual123 = JSON.stringify(input);
        expect(assertionActual123).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.5275362023578, 0.4560262028233, -0.5171603140961, -0.4962770063831];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual124 = JSON.stringify(input);
        expect(assertionActual124).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationConfigurationsTest0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_CONFIGURATIONS_3200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 169
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationConfigurationsTest0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.07838878274782, 0.06175734846148, 0.1253082391561, 0.9870861532054];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.9609677502212, -0.2376978887639, 0.1415651677215, 0.2570622222504, 0.9563060878778, -0.1392755548527,
          -0.1022741263786, 0.1702303732153, 0.9800824573006,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual125 = promiseResult.length;
        expect(assertionActual125).assertEqual(9);
        const assertionActual126 = callbackResult.length;
        expect(assertionActual126).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual127 = JSON.stringify(input);
        expect(assertionActual127).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.9870861532054, 0.07838878274782, 0.06175734846148, 0.1253082391561];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual128 = JSON.stringify(input);
        expect(assertionActual128).assertEqual(inputBefore);
      },
    );
  });
}
