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

export default function sensorQuaternionInputOwnershipTest(): void {
  describe('SensorQuaternionInputOwnership', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorQuaternionInputOwnershipTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_INPUT_OWNERSHIP_0100
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 98
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionInputOwnershipTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.06628372379179, -0.1372531134886, -0.1383024521337];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.9785910701267, 0.06628372379179, -0.1372531134886, -0.1383024521337];
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
          0.924068029143, 0.2524877943413, -0.286963745488, -0.2888783841974, 0.9529577993882, -0.09176443607786,
          0.2502949393402, 0.1676942047117, 0.953536101596,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual4 = JSON.stringify(input);
        expect(assertionActual4).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionInputOwnershipTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_INPUT_OWNERSHIP_0200
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 99
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionInputOwnershipTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.544501228361, 0.6052344285999, 0.1281417137797, 0.5663827327349];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.5663827327349, -0.544501228361, 0.6052344285999, 0.1281417137797];
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
          0.234541975254, -0.8042562876938, 0.5460420181167, -0.5139472715823, 0.3741962270059, 0.7719037412318,
          -0.825135300346, -0.4616806335548, -0.3255806024986,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual8 = JSON.stringify(input);
        expect(assertionActual8).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionInputOwnershipTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_INPUT_OWNERSHIP_0300
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionInputOwnershipTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.5268932616811, -0.5741971585409, 0.1979732998513];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.5945483045679, -0.5268932616811, -0.5741971585409, 0.1979732998513];
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
          0.262208391339, 0.3696718478708, -0.8913974895652, 0.8404906069759, 0.3663801266821, 0.3991755783584,
          0.4741542988277, -0.8538784033246, -0.2146377721629,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual12 = JSON.stringify(input);
        expect(assertionActual12).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionInputOwnershipTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_INPUT_OWNERSHIP_0400
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 101
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionInputOwnershipTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.1776339535689, -0.05800425955347, -0.1498662134398, 0.9708871213907];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.9708871213907, 0.1776339535689, -0.05800425955347, -0.1498662134398];
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
          0.9483512478857, 0.2703993012239, -0.165873833172, -0.3116134050172, 0.8919725932174, -0.3275392781983,
          0.05938852117311, 0.3623107931689, 0.9301633688263,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual16 = JSON.stringify(input);
        expect(assertionActual16).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionInputOwnershipTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_INPUT_OWNERSHIP_0500
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 102
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionInputOwnershipTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.5286603766093, -0.6004370015293, -0.5803355196969];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.1523295702609, -0.5286603766093, -0.6004370015293, -0.5803355196969];
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
          -0.3946278164549, 0.8116590233624, 0.4306721679821, 0.4580499820722, -0.2325422184372, 0.8579710546213,
          0.7965294096288, 0.5358486226899, -0.2800127732044,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual20 = JSON.stringify(input);
        expect(assertionActual20).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionInputOwnershipTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_INPUT_OWNERSHIP_0600
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 103
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionInputOwnershipTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.15211338813, 0.2917012840456, 0.3302207536343, 0.8847181087256];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.8847181087256, 0.15211338813, 0.2917012840456, 0.3302207536343];
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
          0.6117292295107, -0.4955612199585, 0.6166088119996, 0.6730479025106, 0.7356315420416, -0.07650330240907,
          -0.415684821335, 0.4618065738236, 0.7835437560755,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual24 = JSON.stringify(input);
        expect(assertionActual24).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionInputOwnershipTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_INPUT_OWNERSHIP_0700
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 104
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionInputOwnershipTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.4514835884357, -0.07879937533581, -0.4429312556801];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.7705615683134, 0.4514835884357, -0.07879937533581, -0.4429312556801];
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
          0.5952051223767, 0.6114583565775, -0.5213919259713, -0.7537648555499, 0.1999489442297, -0.625986391417,
          -0.2785128450078, 0.7655972164742, 0.5799064556397,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual28 = JSON.stringify(input);
        expect(assertionActual28).assertEqual(inputBefore);
      },
    );
  });
}
