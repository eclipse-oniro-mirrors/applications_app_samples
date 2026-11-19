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
  assertUnitQuaternion,
  assertRotationMatrix,
  quaternionCallback,
} from '../Shared/SharedDriver';

export default function sensorQuaternionInputValidationTest(): void {
  describe('SensorQuaternionInputValidation', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorQuaternionInputValidationTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_INPUT_VALIDATION_0100
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 184
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionInputValidationTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.4143949399265, 0.2402447933183, -0.3975973227533];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.782608230206, -0.4143949399265, 0.2402447933183, -0.3975973227533];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual1 = promiseResult.length;
        expect(assertionActual1).assertEqual(4);
        const assertionActual2 = callbackResult.length;
        expect(assertionActual2).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual3 = JSON.stringify(input);
        expect(assertionActual3).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.5683976164457, 0.4232134207997, 0.7055597423847, -0.8214383275788, 0.3403864054054, 0.4575764078268,
          -0.04651046767546, -0.8396591543419, 0.5411185460935,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual4 = JSON.stringify(input);
        expect(assertionActual4).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionInputValidationTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_INPUT_VALIDATION_0200
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 185
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionInputValidationTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.03564747390158, -0.3853988700774, 0.2888701578879, 0.8756431924187];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.8756431924187, -0.03564747390158, -0.3853988700774, 0.2888701578879];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual5 = promiseResult.length;
        expect(assertionActual5).assertEqual(4);
        const assertionActual6 = callbackResult.length;
        expect(assertionActual6).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual7 = JSON.stringify(input);
        expect(assertionActual7).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.5360434856497, -0.4784173821694, -0.6955387767269, 0.5333713668205, 0.8305665789725, -0.1602315292005,
          0.6543488110698, -0.2850894005959, 0.700393937095,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual8 = JSON.stringify(input);
        expect(assertionActual8).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionInputValidationTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_INPUT_VALIDATION_0300
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 186
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionInputValidationTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.7752318431727, 0.5150709820605, -0.3231221490744];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.1712003199406, 0.7752318431727, 0.5150709820605, -0.3231221490744];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual9 = promiseResult.length;
        expect(assertionActual9).assertEqual(4);
        const assertionActual10 = callbackResult.length;
        expect(assertionActual10).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual11 = JSON.stringify(input);
        expect(assertionActual11).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.2605879204335, 0.909236084178, -0.324628524552, 0.6879616229723, -0.4107846677829, -0.5983015644571,
          -0.6773497922355, -0.06742180613993, -0.7325650544596,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual12 = JSON.stringify(input);
        expect(assertionActual12).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionInputValidationTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_INPUT_VALIDATION_0400
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 187
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionInputValidationTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.195118355882, -0.1033480484326, 0.007579921996751, 0.9752899839871];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.9752899839871, -0.195118355882, -0.1033480484326, 0.007579921996751];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual13 = promiseResult.length;
        expect(assertionActual13).assertEqual(4);
        const assertionActual14 = callbackResult.length;
        expect(assertionActual14).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual15 = JSON.stringify(input);
        expect(assertionActual15).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.9785234513354, 0.02554495858189, -0.2045465968373, 0.05511544659323, 0.9237427439609, 0.3790272160762,
          0.1986306691664, -0.3821606966588, 0.9024960161662,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual16 = JSON.stringify(input);
        expect(assertionActual16).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionInputValidationTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_INPUT_VALIDATION_0500
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 188
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionInputValidationTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.5240953142296, 0.5634077427707, -0.26940685056];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.5790645610465, 0.5240953142296, 0.5634077427707, -0.26940685056];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual17 = promiseResult.length;
        expect(assertionActual17).assertEqual(4);
        const assertionActual18 = callbackResult.length;
        expect(assertionActual18).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual19 = JSON.stringify(input);
        expect(assertionActual19).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.2199833285148, 0.9025666352984, 0.3701091785158, 0.2785507966487, 0.3054881009479, -0.9105418572837,
          -0.9348886505151, 0.3033982350398, -0.1842083660227,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual20 = JSON.stringify(input);
        expect(assertionActual20).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionInputValidationTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_INPUT_VALIDATION_0600
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 189
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionInputValidationTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.4018038872323, -0.5353430398455, 0.4617282416432, 0.5820382262044];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.5820382262044, 0.4018038872323, -0.5353430398455, 0.4617282416432];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual21 = promiseResult.length;
        expect(assertionActual21).assertEqual(4);
        const assertionActual22 = callbackResult.length;
        expect(assertionActual22).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual23 = JSON.stringify(input);
        expect(assertionActual23).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.0004297211161702, -0.9676928023343, -0.2521318219706, 0.1072811446837, 0.2507213341482, -0.9620964445409,
          0.9942286313193, -0.02663555731417, 0.1039229317881,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual24 = JSON.stringify(input);
        expect(assertionActual24).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionInputValidationTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_INPUT_VALIDATION_0700
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 190
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionInputValidationTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.120601326806, 0.03604359043319, -0.185880347809];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.974476616374, -0.120601326806, 0.03604359043319, -0.185880347809];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual25 = promiseResult.length;
        expect(assertionActual25).assertEqual(4);
        const assertionActual26 = callbackResult.length;
        expect(assertionActual26).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual27 = JSON.stringify(input);
        expect(assertionActual27).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.9282987117742, 0.3535782951085, 0.1150821052405, -0.3709659144249, 0.901807632542, 0.2216467555003,
          -0.02541243894874, -0.2484459360044, 0.9683123591226,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual28 = JSON.stringify(input);
        expect(assertionActual28).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionInputValidationTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_INPUT_VALIDATION_0800
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 191
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionInputValidationTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.5821959999626, -0.4439280806512, -0.6602163263305, 0.1676009525142];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.1676009525142, 0.5821959999626, -0.4439280806512, -0.6602163263305];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual29 = promiseResult.length;
        expect(assertionActual29).assertEqual(4);
        const assertionActual30 = callbackResult.length;
        expect(assertionActual30).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual31 = JSON.stringify(input);
        expect(assertionActual31).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          -0.2659154766879, -0.2956005353356, -0.917556146929, -0.7382120759692, -0.5496755598514, 0.3910239248376,
          -0.6199450702693, 0.7813303414123, -0.07204864632612,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual32 = JSON.stringify(input);
        expect(assertionActual32).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionInputValidationTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_INPUT_VALIDATION_0900
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 192
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionInputValidationTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.1249427357731, 0.356899148404, 0.2952616921166];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.8774011874932, -0.1249427357731, 0.356899148404, 0.2952616921166];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual33 = promiseResult.length;
        expect(assertionActual33).assertEqual(4);
        const assertionActual34 = callbackResult.length;
        expect(assertionActual34).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual35 = JSON.stringify(input);
        expect(assertionActual35).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.5708870620739, -0.6073098305621, 0.5525058660859, 0.4289420065753, 0.794419691892, 0.4300071024174,
          -0.7000690804141, -0.008492516526492, 0.7140246212921,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual36 = JSON.stringify(input);
        expect(assertionActual36).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionInputValidationTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_INPUT_VALIDATION_1000
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 193
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionInputValidationTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.4947697792027, -0.2810912137118, -0.2593770816954, 0.78032949749];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.78032949749, -0.4947697792027, -0.2810912137118, -0.2593770816954];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual37 = promiseResult.length;
        expect(assertionActual37).assertEqual(4);
        const assertionActual38 = callbackResult.length;
        expect(assertionActual38).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual39 = JSON.stringify(input);
        expect(assertionActual39).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.7074225181304, 0.6829500511275, -0.1820236482078, -0.1266483001515, 0.3758527901578, 0.9179841437625,
          0.6953514139705, -0.6263496689514, 0.3523811903235,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual40 = JSON.stringify(input);
        expect(assertionActual40).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionInputValidationTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_INPUT_VALIDATION_1100
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 194
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionInputValidationTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.1018263801576, -0.8851832120064, 0.304271588802];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.3368989013547, 0.1018263801576, -0.8851832120064, 0.304271588802];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual41 = promiseResult.length;
        expect(assertionActual41).assertEqual(4);
        const assertionActual42 = callbackResult.length;
        expect(assertionActual42).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual43 = JSON.stringify(input);
        expect(assertionActual43).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          -0.75226103714, -0.3852875324714, -0.5344687543001, 0.02474752345196, 0.7941003771038, -0.6072825958041,
          0.6584002521901, -0.470061813388, -0.5878358610278,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual44 = JSON.stringify(input);
        expect(assertionActual44).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionInputValidationTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_INPUT_VALIDATION_1200
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 195
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionInputValidationTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.03612065258117, -0.03436640620113, -0.01151898952607, 0.9986899225797];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.9986899225797, -0.03612065258117, -0.03436640620113, -0.01151898952607];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual45 = promiseResult.length;
        expect(assertionActual45).assertEqual(4);
        const assertionActual46 = callbackResult.length;
        expect(assertionActual46).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual47 = JSON.stringify(input);
        expect(assertionActual47).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.9973725260102, 0.02549047155369, -0.06781062025919, -0.02052512347827, 0.9971252226748, 0.07293839600578,
          0.06947491393422, -0.07135493091347, 0.9950284971639,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual48 = JSON.stringify(input);
        expect(assertionActual48).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionInputValidationTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_INPUT_VALIDATION_1300
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 196
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionInputValidationTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.2262448204824, 0.6766428276457, 0.5521687530055];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.431366935688, -0.2262448204824, 0.6766428276457, 0.5521687530055];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual49 = promiseResult.length;
        expect(assertionActual49).assertEqual(4);
        const assertionActual50 = callbackResult.length;
        expect(assertionActual50).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual51 = JSON.stringify(input);
        expect(assertionActual51).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          -0.525471696, -0.7825485560762, 0.3339120454342, 0.1702008157905, 0.2878458988185, 0.942431122596,
          -0.8336133270331, 0.5520529828889, -0.01806446999896,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual52 = JSON.stringify(input);
        expect(assertionActual52).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionInputValidationTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_INPUT_VALIDATION_1400
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 197
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionInputValidationTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.4890114260758, -0.04359097531399, -0.501557208201, 0.7123257814653];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.7123257814653, 0.4890114260758, -0.04359097531399, -0.501557208201];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual53 = promiseResult.length;
        expect(assertionActual53).assertEqual(4);
        const assertionActual54 = callbackResult.length;
        expect(assertionActual54).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual55 = JSON.stringify(input);
        expect(assertionActual55).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.4930803875457, 0.6719112905579, -0.5526363623927, -0.7571772305673, 0.01861638413793, -0.6529441566873,
          -0.4284324601712, 0.7403976282123, 0.517935304077,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual56 = JSON.stringify(input);
        expect(assertionActual56).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionInputValidationTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_INPUT_VALIDATION_1500
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 198
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionInputValidationTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.1611467636024, -0.209721682054, 0.2832977620653];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.9218410463121, 0.1611467636024, -0.209721682054, 0.2832977620653];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual57 = promiseResult.length;
        expect(assertionActual57).assertEqual(4);
        const assertionActual58 = callbackResult.length;
        expect(assertionActual58).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual59 = JSON.stringify(input);
        expect(assertionActual59).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.7515183881704, -0.5899029514408, -0.2953550746527, 0.4547190701599, 0.7875481971785, -0.415930768703,
          0.4779651446232, 0.1782760359731, 0.8600970733139,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual60 = JSON.stringify(input);
        expect(assertionActual60).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionInputValidationTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_INPUT_VALIDATION_1600
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 199
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionInputValidationTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.4767539303505, 0.6505912670857, -0.5874399955243, 0.06596169150053];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.06596169150053, -0.4767539303505, 0.6505912670857, -0.5874399955243];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual61 = promiseResult.length;
        expect(assertionActual61).assertEqual(4);
        const assertionActual62 = callbackResult.length;
        expect(assertionActual62).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual63 = JSON.stringify(input);
        expect(assertionActual63).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          -0.5367094902995, -0.5428468157499, 0.6459568543274, -0.6978409587893, -0.1447601168924, -0.7014716706991,
          0.4743004525177, -0.8272616534008, -0.3011266138256,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual64 = JSON.stringify(input);
        expect(assertionActual64).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionInputValidationTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_INPUT_VALIDATION_1700
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 200
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionInputValidationTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.2321324370626, 0.1350600220478, -0.1792916428736];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.9464289877764, 0.2321324370626, 0.1350600220478, -0.1792916428736];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual65 = promiseResult.length;
        expect(assertionActual65).assertEqual(4);
        const assertionActual66 = callbackResult.length;
        expect(assertionActual66).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual67 = JSON.stringify(input);
        expect(assertionActual67).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.8992265944802, 0.4020772402986, 0.1724106279012, -0.2766699920279, 0.8279380769181, -0.4878240013575,
          -0.338888251922, 0.3909634683994, 0.8557466442156,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual68 = JSON.stringify(input);
        expect(assertionActual68).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionInputValidationTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_INPUT_VALIDATION_1800
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 201
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionInputValidationTest0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.5243911567594, 0.4680255857281, 0.2599768944925, 0.662101185731];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.662101185731, -0.5243911567594, 0.4680255857281, 0.2599768944925];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual69 = promiseResult.length;
        expect(assertionActual69).assertEqual(4);
        const assertionActual70 = callbackResult.length;
        expect(assertionActual70).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual71 = JSON.stringify(input);
        expect(assertionActual71).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.4267281308679, -0.8351189767982, 0.3471014216588, -0.1465949363736, 0.3148518580851, 0.9377516899958,
          -0.8924197593933, -0.4510483367133, 0.01193193163284,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual72 = JSON.stringify(input);
        expect(assertionActual72).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionInputValidationTest0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_INPUT_VALIDATION_1900
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 202
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionInputValidationTest0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.6005037171386, -0.6174026550563, 0.1243047794342];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.4927043424225, -0.6005037171386, -0.6174026550563, 0.1243047794342];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual73 = promiseResult.length;
        expect(assertionActual73).assertEqual(4);
        const assertionActual74 = callbackResult.length;
        expect(assertionActual74).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual75 = JSON.stringify(input);
        expect(assertionActual75).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.2067245666786, 0.6190141694429, -0.7576849025554, 0.8639961878873, 0.247887215025, 0.4382493764324,
          0.4591029741222, -0.7452337798678, -0.4835815055357,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual76 = JSON.stringify(input);
        expect(assertionActual76).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionInputValidationTest0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_INPUT_VALIDATION_2000
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 203
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionInputValidationTest0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.02004866064261, 0.09430947466366, -0.07159158047458, 0.9927630229819];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.9927630229819, 0.02004866064261, 0.09430947466366, -0.07159158047458];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual77 = promiseResult.length;
        expect(assertionActual77).assertEqual(4);
        const assertionActual78 = callbackResult.length;
        expect(assertionActual78).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual79 = JSON.stringify(input);
        expect(assertionActual79).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.9719607371876, 0.1459285050098, 0.1843832877223, -0.1383653903982, 0.9889453936232, -0.0533106665824,
          -0.1901245489295, 0.0263036092028, 0.9814075483902,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual80 = JSON.stringify(input);
        expect(assertionActual80).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionInputValidationTest0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_INPUT_VALIDATION_2100
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 204
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionInputValidationTest0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.7253116533784, -0.01975321612588, -0.6325272205905];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.2710020869627, -0.7253116533784, -0.01975321612588, -0.6325272205905];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual81 = promiseResult.length;
        expect(assertionActual81).assertEqual(4);
        const assertionActual82 = callbackResult.length;
        expect(assertionActual82).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual83 = JSON.stringify(input);
        expect(assertionActual83).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.1990382513294, 0.3714868693771, 0.9068524027581, -0.3141779179859, -0.8523353586291, 0.4181108373155,
          0.9282650539355, -0.3681330497402, -0.05293436814778,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual84 = JSON.stringify(input);
        expect(assertionActual84).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionInputValidationTest0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_INPUT_VALIDATION_2200
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 205
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionInputValidationTest0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.06810291071683, 0.3562374296764, 0.4396283806817, 0.8216956700316];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.8216956700316, -0.06810291071683, 0.3562374296764, 0.4396283806817];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual85 = promiseResult.length;
        expect(assertionActual85).assertEqual(4);
        const assertionActual86 = callbackResult.length;
        expect(assertionActual86).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual87 = JSON.stringify(input);
        expect(assertionActual87).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.3596435611935, -0.7710030853928, 0.5255575622202, 0.6739598619238, 0.6041777609022, 0.4251439023988,
          -0.6453174516528, 0.2013044349885, 0.736913774499,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual88 = JSON.stringify(input);
        expect(assertionActual88).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionInputValidationTest0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_INPUT_VALIDATION_2300
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 206
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionInputValidationTest0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.3115407557479, -0.3147043007089, -0.3077525762262];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.8421353290591, 0.3115407557479, -0.3147043007089, -0.3077525762262];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual89 = promiseResult.length;
        expect(assertionActual89).assertEqual(4);
        const assertionActual90 = callbackResult.length;
        expect(assertionActual90).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual91 = JSON.stringify(input);
        expect(assertionActual91).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.612499109883, 0.3222522027382, -0.7218021600293, -0.714425065458, 0.6164614186684, -0.3310168351289,
          0.3382922793058, 0.7184210722993, 0.6078071212468,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual92 = JSON.stringify(input);
        expect(assertionActual92).assertEqual(inputBefore);
      },
    );
  });
}
