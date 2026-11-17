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

export default function sensorQuaternionRepresentationsTest(): void {
  describe('SensorQuaternionRepresentations', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorQuaternionRepresentationsTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_REPRESENTATIONS_0100
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 64
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionRepresentationsTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.1152465960926, -0.1081699239771, -0.05079643910379];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.9861223105732, -0.1152465960926, -0.1081699239771, -0.05079643910379];
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
          0.9714379786423, 0.1251154348718, -0.201629317333, -0.07525057271992, 0.9682758877269, 0.2382837731615,
          0.2250457841344, -0.2163051853368, 0.9500349792717,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual4 = JSON.stringify(input);
        expect(assertionActual4).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionRepresentationsTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_REPRESENTATIONS_0200
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 65
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionRepresentationsTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.19176195522, 0.6454508999578, 0.5128489659647, 0.5325471118904];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.5325471118904, 0.19176195522, 0.6454508999578, 0.5128489659647];
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
          -0.3592418522949, -0.298686618172, 0.8841558661711, 0.7937783244698, 0.4004265812783, 0.457793102403,
          -0.4907761843873, 0.8662822040944, 0.09324097654762,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual8 = JSON.stringify(input);
        expect(assertionActual8).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionRepresentationsTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_REPRESENTATIONS_0300
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 66
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionRepresentationsTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.5486955332676, -0.164981084963, -0.5282646563809];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.6266186289884, 0.5486955332676, -0.164981084963, -0.5282646563809];
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
          0.3874353888463, 0.4809921806633, -0.7864733572158, -0.8430897182346, -0.1602606708182, -0.5133383332618,
          -0.3729524721417, 0.8619530378911, 0.3434289067533,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual12 = JSON.stringify(input);
        expect(assertionActual12).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionRepresentationsTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_REPRESENTATIONS_0400
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 67
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionRepresentationsTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.009258705888133, -0.1393382958996, 0.2411373561679, 0.9603915301175];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.9603915301175, 0.009258705888133, -0.1393382958996, 0.2411373561679];
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
          0.8448752295123, -0.4657527335185, -0.2631733986872, 0.4605923643157, 0.8835341036513, -0.08498330200196,
          0.2721038781248, -0.04941537114271, 0.9609982313221,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual16 = JSON.stringify(input);
        expect(assertionActual16).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionRepresentationsTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_REPRESENTATIONS_0500
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 68
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionRepresentationsTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.5957476146896, -0.6069573117402, 0.5139086181794];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.1121852640844, 0.5957476146896, -0.6069573117402, 0.5139086181794];
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
          -0.2649984922279, -0.8384926894666, 0.4761363342866, -0.6078807932839, -0.2380345764949, -0.7575093937038,
          0.7485029995087, -0.4901729797774, -0.4466247973665,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual20 = JSON.stringify(input);
        expect(assertionActual20).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionRepresentationsTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_REPRESENTATIONS_0600
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 69
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionRepresentationsTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.1644598897115, 0.3039952792592, -0.2556779496144, 0.9028668788615];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.9028668788615, 0.1644598897115, 0.3039952792592, -0.2556779496144];
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
          0.6844313125382, 0.5616763649237, 0.4648370031563, -0.3616962445245, 0.8151634615141, -0.4524205540304,
          -0.6330320727373, 0.1415209952566, 0.7610796297284,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual24 = JSON.stringify(input);
        expect(assertionActual24).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionRepresentationsTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_REPRESENTATIONS_0700
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 70
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionRepresentationsTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.6415726208981, 0.1520821870953, 0.1074190674503];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.7441214446785, -0.6415726208981, 0.1520821870953, 0.1074190674503];
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
          0.9306643046329, -0.3550091980475, 0.08850096826538, -0.03527787141902, 0.1536914321241, 0.9874889444848,
          -0.3641694988194, -0.9221428376306, 0.1305111609645,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual28 = JSON.stringify(input);
        expect(assertionActual28).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionRepresentationsTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_REPRESENTATIONS_0800
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 71
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionRepresentationsTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.5105247398174, -0.731934817839, 0.2286473888495, 0.3890453495953];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.3890453495953, -0.5105247398174, -0.731934817839, 0.2286473888495];
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
          -0.1760164119854, 0.569433258223, -0.8029719715789, 0.9252500715391, 0.3741697232134, 0.0625245819447,
          0.3360513767696, -0.7319445215725, -0.5927281750612,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual32 = JSON.stringify(input);
        expect(assertionActual32).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionRepresentationsTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_REPRESENTATIONS_0900
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 72
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionRepresentationsTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.002465701787993, 0.003302593609002, -0.002422478260191];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.9999885723293, 0.002465701787993, 0.003302593609002, -0.002422478260191];
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
          0.9999664489491, 0.004861187575748, 0.006593165518145, -0.004828614731881, 0.9999761038275,
          -0.004947348143971, -0.006617057954055, 0.004915346299091, 0.9999660263803,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual36 = JSON.stringify(input);
        expect(assertionActual36).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionRepresentationsTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_REPRESENTATIONS_1000
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 73
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionRepresentationsTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.6196613881729, 0.1429298794307, -0.6715831608901, 0.380219504474];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.380219504474, -0.6196613881729, 0.1429298794307, -0.6715831608901];
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
          0.05709421514963, 0.3335617782946, 0.9409977633647, -0.6878342882923, -0.6700083559669, 0.2792360914781,
          0.723618851638, -0.663193292333, 0.1911816271472,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual40 = JSON.stringify(input);
        expect(assertionActual40).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionRepresentationsTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_REPRESENTATIONS_1100
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 74
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionRepresentationsTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.2093911805139, 0.3444622082939, 0.5237257630299];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.7504748135142, 0.2093911805139, 0.3444622082939, 0.5237257630299];
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
          0.2141142243922, -0.6418312918107, 0.7363475346367, 0.9303406855589, 0.3637333173236, 0.04652185145199,
          -0.2976933114913, 0.6750930800426, 0.6750022411606,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual44 = JSON.stringify(input);
        expect(assertionActual44).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionRepresentationsTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_REPRESENTATIONS_1200
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 75
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionRepresentationsTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.2559398413869, -0.2637508657322, -0.2392522042262, 0.8987150055436];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.8987150055436, 0.2559398413869, -0.2637508657322, -0.2392522042262];
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
          0.7463877271968, 0.2950303826127, -0.5965420639196, -0.5650478015773, 0.7545063607275, -0.3338279999556,
          0.3516053791151, 0.5862399039277, 0.7298605568327,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual48 = JSON.stringify(input);
        expect(assertionActual48).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionRepresentationsTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_REPRESENTATIONS_1300
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 76
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionRepresentationsTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.1046196856869, 0.6487603663219, 0.7438806489262];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.1216810938883, -0.1046196856869, 0.6487603663219, 0.7438806489262];
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
          -0.9484968655138, -0.3167786333888, 0.002234622732425, 0.04528621094598, -0.1286073969602, 0.9906610401875,
          -0.3135328614493, 0.9397400890009, 0.1363294169134,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual52 = JSON.stringify(input);
        expect(assertionActual52).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionRepresentationsTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_REPRESENTATIONS_1400
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 77
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionRepresentationsTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.2492954895178, -0.0774610213935, 0.06678002507775, 0.9630119299995];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.9630119299995, 0.2492954895178, -0.0774610213935, 0.06678002507775];
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
          0.9790804368306, -0.1672412881648, -0.1158958573402, 0.08999855517741, 0.8667843743134, -0.4904947589038,
          0.1824876935073, 0.469803363099, 0.8637030981415,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual56 = JSON.stringify(input);
        expect(assertionActual56).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionRepresentationsTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_REPRESENTATIONS_1500
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 78
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionRepresentationsTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.1819221765038, 0.7531566637671, 0.1277761748594];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.6191386037533, 0.1819221765038, 0.7531566637671, 0.1277761748594];
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
          -0.1671434220771, 0.115809474051, 0.979107370096, 0.4322541240324, 0.9011551416689, -0.03279912957259,
          -0.8861260907531, 0.4177410398367, -0.2006812769615,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual60 = JSON.stringify(input);
        expect(assertionActual60).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionRepresentationsTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_REPRESENTATIONS_1600
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 79
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionRepresentationsTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.5683044190901, -0.517118671399, -0.3425686511066, 0.5406154698232];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.5406154698232, -0.5683044190901, -0.517118671399, -0.3425686511066];
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
          0.230469997939, 0.9581574768295, -0.1697581504542, 0.2173658277708, 0.1193536130433, 0.9687656125044,
          0.9484912635167, -0.2601710296116, -0.1807632661337,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual64 = JSON.stringify(input);
        expect(assertionActual64).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionRepresentationsTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_REPRESENTATIONS_1700
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 80
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionRepresentationsTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.09127718801083, 0.01524995990352, 0.1490490790347];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.9844898606439, -0.09127718801083, 0.01524995990352, 0.1490490790347];
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
          0.9551036215237, -0.2962585610104, 0.002817300180703, 0.2906906671813, 0.9389056939755, 0.1842689171674,
          -0.05723642342026, -0.1751769472516, 0.9828718273436,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual68 = JSON.stringify(input);
        expect(assertionActual68).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionRepresentationsTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_REPRESENTATIONS_1800
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 81
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionRepresentationsTest0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.5106531435198, -0.4949331661481, 0.6688079651556, 0.2167266338139];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.2167266338139, -0.5106531435198, -0.4949331661481, 0.6688079651556];
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
          -0.384525866418, 0.2155813563392, -0.8975881777599, 0.7953753521637, -0.4161414544846, -0.440686213796,
          -0.4685273815114, -0.8833747611622, -0.01145094388009,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual72 = JSON.stringify(input);
        expect(assertionActual72).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionRepresentationsTest0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_REPRESENTATIONS_1900
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 82
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionRepresentationsTest0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.2548961406046, 0.3287157592778, -0.3171284036961];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.8522930732303, -0.2548961406046, 0.3287157592778, -0.3171284036961];
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
          0.5827510503431, 0.3729959267979, 0.7219939417448, -0.7081494403812, 0.6689150661481, 0.2260022220419,
          -0.3986547170318, -0.64298263808, 0.6539478142145,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual76 = JSON.stringify(input);
        expect(assertionActual76).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionRepresentationsTest0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_REPRESENTATIONS_2000
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 83
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionRepresentationsTest0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.2972281254477, -0.2719657343727, 0.424900945484, 0.8106474371123];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.8106474371123, 0.2972281254477, -0.2719657343727, 0.424900945484];
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
          0.4909876517078, -0.8505614557936, -0.1883516280489, 0.5272179941391, 0.4622292559392, -0.7130114316123,
          0.6935216741576, 0.2507774409153, 0.6753801615398,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual80 = JSON.stringify(input);
        expect(assertionActual80).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionRepresentationsTest0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_REPRESENTATIONS_2100
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 84
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionRepresentationsTest0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.8186509949719, -0.3618608743005, -0.3393210556182];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.2893587346119, 0.8186509949719, -0.3618608743005, -0.3393210556182];
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
          0.5078358577293, -0.3961045070132, -0.7649862489798, -0.7888465521366, -0.5706564607086, -0.2281936042786,
          -0.3461558302072, 0.7193416596968, -0.6022654878359,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual84 = JSON.stringify(input);
        expect(assertionActual84).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionRepresentationsTest0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_REPRESENTATIONS_2200
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 85
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionRepresentationsTest0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.0221037764973, -0.09857121979599, 0.003636578382011, 0.9948778382245];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.9948778382245, 0.0221037764973, -0.09857121979599, 0.003636578382011];
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
          0.9805409798512, -0.01159349490133, -0.195971879892, 0.002878310055585, 0.9989963967245, -0.04469803869046,
          0.1962934083551, 0.04326419082246, 0.979590275385,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual88 = JSON.stringify(input);
        expect(assertionActual88).assertEqual(inputBefore);
      },
    );
  });
}
