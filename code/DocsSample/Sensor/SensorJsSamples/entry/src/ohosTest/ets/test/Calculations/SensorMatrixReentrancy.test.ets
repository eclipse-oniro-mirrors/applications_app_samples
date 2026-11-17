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

export default function sensorMatrixReentrancyTest(): void {
  describe('SensorMatrixReentrancy', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorMatrixReentrancyTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_MATRIX_REENTRANCY_0100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 73
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorMatrixReentrancyTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.6196613881729, 0.1429298794307, -0.6715831608901, 0.380219504474];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.05709421514963, 0.3335617782946, 0.9409977633647, -0.6878342882923, -0.6700083559669, 0.2792360914781,
          0.723618851638, -0.663193292333, 0.1911816271472,
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
        const expectedQuaternion: number[] = [0.380219504474, -0.6196613881729, 0.1429298794307, -0.6715831608901];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual4 = JSON.stringify(input);
        expect(assertionActual4).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorMatrixReentrancyTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_MATRIX_REENTRANCY_0200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 74
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorMatrixReentrancyTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.2093911805139, 0.3444622082939, 0.5237257630299];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.2141142243922, -0.6418312918107, 0.7363475346367, 0.9303406855589, 0.3637333173236, 0.04652185145199,
          -0.2976933114913, 0.6750930800426, 0.6750022411606,
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
        const expectedQuaternion: number[] = [0.7504748135142, 0.2093911805139, 0.3444622082939, 0.5237257630299];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual8 = JSON.stringify(input);
        expect(assertionActual8).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorMatrixReentrancyTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_MATRIX_REENTRANCY_0300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 75
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorMatrixReentrancyTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.2559398413869, -0.2637508657322, -0.2392522042262, 0.8987150055436];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.7463877271968, 0.2950303826127, -0.5965420639196, -0.5650478015773, 0.7545063607275, -0.3338279999556,
          0.3516053791151, 0.5862399039277, 0.7298605568327,
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
        const expectedQuaternion: number[] = [0.8987150055436, 0.2559398413869, -0.2637508657322, -0.2392522042262];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual12 = JSON.stringify(input);
        expect(assertionActual12).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorMatrixReentrancyTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_MATRIX_REENTRANCY_0400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 76
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorMatrixReentrancyTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.1046196856869, 0.6487603663219, 0.7438806489262];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.9484968655138, -0.3167786333888, 0.002234622732425, 0.04528621094598, -0.1286073969602, 0.9906610401875,
          -0.3135328614493, 0.9397400890009, 0.1363294169134,
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
        const expectedQuaternion: number[] = [0.1216810938883, -0.1046196856869, 0.6487603663219, 0.7438806489262];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual16 = JSON.stringify(input);
        expect(assertionActual16).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorMatrixReentrancyTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_MATRIX_REENTRANCY_0500
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 77
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorMatrixReentrancyTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.2492954895178, -0.0774610213935, 0.06678002507775, 0.9630119299995];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.9790804368306, -0.1672412881648, -0.1158958573402, 0.08999855517741, 0.8667843743134, -0.4904947589038,
          0.1824876935073, 0.469803363099, 0.8637030981415,
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
        const expectedQuaternion: number[] = [0.9630119299995, 0.2492954895178, -0.0774610213935, 0.06678002507775];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual20 = JSON.stringify(input);
        expect(assertionActual20).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorMatrixReentrancyTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_MATRIX_REENTRANCY_0600
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 78
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorMatrixReentrancyTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.1819221765038, 0.7531566637671, 0.1277761748594];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.1671434220771, 0.115809474051, 0.979107370096, 0.4322541240324, 0.9011551416689, -0.03279912957259,
          -0.8861260907531, 0.4177410398367, -0.2006812769615,
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
        const expectedQuaternion: number[] = [0.6191386037533, 0.1819221765038, 0.7531566637671, 0.1277761748594];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual24 = JSON.stringify(input);
        expect(assertionActual24).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorMatrixReentrancyTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_MATRIX_REENTRANCY_0700
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 79
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorMatrixReentrancyTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.5683044190901, -0.517118671399, -0.3425686511066, 0.5406154698232];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.230469997939, 0.9581574768295, -0.1697581504542, 0.2173658277708, 0.1193536130433, 0.9687656125044,
          0.9484912635167, -0.2601710296116, -0.1807632661337,
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
        const expectedQuaternion: number[] = [0.5406154698232, -0.5683044190901, -0.517118671399, -0.3425686511066];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual28 = JSON.stringify(input);
        expect(assertionActual28).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorMatrixReentrancyTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_MATRIX_REENTRANCY_0800
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 80
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorMatrixReentrancyTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.09127718801083, 0.01524995990352, 0.1490490790347];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.9551036215237, -0.2962585610104, 0.002817300180703, 0.2906906671813, 0.9389056939755, 0.1842689171674,
          -0.05723642342026, -0.1751769472516, 0.9828718273436,
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
        const expectedQuaternion: number[] = [0.9844898606439, -0.09127718801083, 0.01524995990352, 0.1490490790347];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual32 = JSON.stringify(input);
        expect(assertionActual32).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorMatrixReentrancyTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_MATRIX_REENTRANCY_0900
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 81
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorMatrixReentrancyTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.5106531435198, -0.4949331661481, 0.6688079651556, 0.2167266338139];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.384525866418, 0.2155813563392, -0.8975881777599, 0.7953753521637, -0.4161414544846, -0.440686213796,
          -0.4685273815114, -0.8833747611622, -0.01145094388009,
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
        const expectedQuaternion: number[] = [0.2167266338139, -0.5106531435198, -0.4949331661481, 0.6688079651556];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual36 = JSON.stringify(input);
        expect(assertionActual36).assertEqual(inputBefore);
      },
    );
  });
}
