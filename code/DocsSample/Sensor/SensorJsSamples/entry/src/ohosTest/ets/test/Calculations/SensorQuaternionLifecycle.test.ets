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

export default function sensorQuaternionLifecycleTest(): void {
  describe('SensorQuaternionLifecycle', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorQuaternionLifecycleTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_LIFECYCLE_0100
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 105
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionLifecycleTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.1490477336209, -0.6457553862812, 0.6612757898889, 0.351424364406];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.351424364406, -0.1490477336209, -0.6457553862812, 0.6612757898889];
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
          -0.7085713784086, -0.2722800947202, -0.6509916679338, 0.6572736019149, 0.08099820561862, -0.7492867961684,
          0.2567450368086, -0.9588028163839, 0.1215695083827,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual4 = JSON.stringify(input);
        expect(assertionActual4).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionLifecycleTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_LIFECYCLE_0200
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 106
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionLifecycleTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.02463335826329, -0.02453677382576, 0.008165915921978];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.9993620275996, 0.02463335826329, -0.02453677382576, 0.008165915921978];
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
          0.9986625290948, -0.01753025886654, -0.04863993221762, 0.01511256630544, 0.9986530309557, -0.0496360161853,
          0.04944454794743, 0.04883455525707, 0.9975822887818,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual8 = JSON.stringify(input);
        expect(assertionActual8).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionLifecycleTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_LIFECYCLE_0300
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 107
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionLifecycleTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.2585579847832, 0.8585009479113, 0.1481072887509, 0.4173585053153];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.4173585053153, 0.2585579847832, 0.8585009479113, 0.1481072887509];
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
          -0.5179192930916, 0.3203168767341, 0.7931939890864, 0.5675722233716, 0.8224239990474, 0.03847774743755,
          -0.6400167006418, 0.4701232437034, -0.6077522181196,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual12 = JSON.stringify(input);
        expect(assertionActual12).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionLifecycleTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_LIFECYCLE_0400
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 108
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionLifecycleTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.5827605779901, 0.2071758685059, -0.3075665656771];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.7230982477694, -0.5827605779901, 0.2071758685059, -0.3075665656771];
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
          0.7249619343729, 0.2033338316749, 0.6580923541622, -0.6862695471792, 0.1315858328365, 0.7153455648924,
          0.05885832417541, -0.9702270463624, 0.234936536499,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual16 = JSON.stringify(input);
        expect(assertionActual16).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionLifecycleTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_LIFECYCLE_0500
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 109
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionLifecycleTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.13970188358, -0.2858533943709, 0.2453582006837, 0.9157349911454];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.9157349911454, -0.13970188358, -0.2858533943709, 0.2453582006837];
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
          0.7161743805678, -0.3694976642183, -0.5920859167008, 0.5292346947038, 0.8405654741629, 0.115586857242,
          0.4549779055515, -0.3961327552506, 0.7975424413017,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual20 = JSON.stringify(input);
        expect(assertionActual20).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionLifecycleTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_LIFECYCLE_0600
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 110
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionLifecycleTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.5270494956876, 0.5441580970566, -0.6476777133393];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.08139025830327, 0.5270494956876, 0.5441580970566, -0.6476777133393];
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
          -0.4311889098975, 0.679025814028, -0.5941380882127, 0.4681671884841, -0.3945351825221, -0.7906715331787,
          -0.7712947605217, -0.6190847548082, -0.1477784109937,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual24 = JSON.stringify(input);
        expect(assertionActual24).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionLifecycleTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_LIFECYCLE_0700
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 111
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionLifecycleTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.1835228500668, 0.0149685413069, -0.2471887058851, 0.9513112266537];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.9513112266537, -0.1835228500668, 0.0149685413069, -0.2471887058851];
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
          0.877347372908, 0.464812643297, 0.1192090344005, -0.475800920745, 0.8104342143724, 0.3417745865228,
          0.06225006883296, -0.3565748039414, 0.932190612549,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual28 = JSON.stringify(input);
        expect(assertionActual28).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionLifecycleTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_LIFECYCLE_0800
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 112
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionLifecycleTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.3535098749462, 0.4675086483369, 0.4831245521694];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.6504283966255, 0.3535098749462, 0.4675086483369, 0.4831245521694];
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
          0.09605266164268, -0.2979380080563, 0.9497404011343, 0.9590137032956, 0.2832428708133, -0.008135909578944,
          -0.266583201051, 0.9115955350312, 0.3129328640915,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual32 = JSON.stringify(input);
        expect(assertionActual32).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionLifecycleTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_LIFECYCLE_0900
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 113
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionLifecycleTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.5536031196492, -0.6019823376008, -0.2738541457895, 0.506107456935];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.506107456935, 0.5536031196492, -0.6019823376008, -0.2738541457895];
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
          0.1252423441011, -0.3893193495457, -0.9125485188818, -0.9437178507323, 0.2370549854972, -0.2306546163858,
          0.3061224811301, 0.890076051762, -0.3377182977373,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual36 = JSON.stringify(input);
        expect(assertionActual36).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionLifecycleTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_LIFECYCLE_1000
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 114
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionLifecycleTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.07242771342788, 0.1141549832426, 0.008071881582248];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.9907864103106, -0.07242771342788, 0.1141549832426, 0.008071881582248];
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
          0.9738069690572, -0.03253098997998, 0.2250371562799, -0.0005409476706636, 0.9893781421107, 0.145363679402,
          -0.2273756679841, -0.1416778973749, 0.963445732257,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual40 = JSON.stringify(input);
        expect(assertionActual40).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionLifecycleTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_LIFECYCLE_1100
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 115
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionLifecycleTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.8328035726538, -0.366385438023, -0.3265329460038, 0.2560784164155];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.2560784164155, 0.8328035726538, -0.366385438023, -0.3265329460038];
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
          0.5182758919576, -0.4430181240673, -0.7315224135756, -0.777490282948, -0.6003711109017, -0.1872522072397,
          -0.3562288025091, 0.6657998730419, -0.6556001596403,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual44 = JSON.stringify(input);
        expect(assertionActual44).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionLifecycleTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_LIFECYCLE_1200
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 116
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionLifecycleTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.015473541554, 0.4446364127412, 0.3353674212232];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.8304141874742, 0.015473541554, 0.4446364127412, 0.3353674212232];
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
          0.3796543064934, -0.5432275291829, 0.7488434142722, 0.5707479292188, 0.7745785245877, 0.2725342373721,
          -0.7280861273596, 0.3239320311198, 0.6041180599528,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual48 = JSON.stringify(input);
        expect(assertionActual48).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionLifecycleTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_LIFECYCLE_1300
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 117
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionLifecycleTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.3462888374801, -0.2683705813149, -0.33618281941, 0.833692019906];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.833692019906, -0.3462888374801, -0.2683705813149, -0.33618281941];
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
          0.6299166860365, 0.746413340778, -0.214644108611, -0.3746783943085, 0.5341303059405, 0.7578396381256,
          0.680309539468, -0.3969533234331, 0.6161225442428,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual52 = JSON.stringify(input);
        expect(assertionActual52).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionLifecycleTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_LIFECYCLE_1400
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 118
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionLifecycleTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.3192284078426, -0.04509639079244, 0.9128956967223];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.2503617104704, -0.3192284078426, -0.04509639079244, 0.9128956967223];
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
          -0.6708244751132, -0.4283161581607, -0.6054252986517, 0.4859003542892, -0.8705706589357, 0.07750853825218,
          -0.5602636605124, -0.2421817426207, 0.7921190783275,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual56 = JSON.stringify(input);
        expect(assertionActual56).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionLifecycleTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_LIFECYCLE_1500
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 119
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionLifecycleTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.08377494371281, -0.07895487110927, 0.08191257054103, 0.9899687964382];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.9899687964382, -0.08377494371281, -0.07895487110927, 0.08191257054103];
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
          0.974112918231, -0.1489528979773, -0.1700501594229, 0.1754106575094, 0.9725441791866, 0.1529343674995,
          0.1426012754771, -0.1788039532967, 0.9734957742681,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual60 = JSON.stringify(input);
        expect(assertionActual60).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionLifecycleTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_LIFECYCLE_1600
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 120
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionLifecycleTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.4235481288593, 0.6467504226786, -0.3755001289723];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.5111951940763, -0.4235481288593, 0.6467504226786, -0.3755001289723];
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
          -0.1185729121862, -0.1639521401176, 0.9793161697055, -0.9317675853402, 0.3592132713633, -0.05267819839159,
          -0.343146661655, -0.9187412701231, -0.1953582533902,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual64 = JSON.stringify(input);
        expect(assertionActual64).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionLifecycleTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_LIFECYCLE_1700
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 121
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionLifecycleTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.6645053586982, -0.3428119551634, 0.1539119977805, 0.6459285475946];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.6459285475946, 0.6645053586982, -0.3428119551634, 0.1539119977805];
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
          0.7175821206725, -0.6544330688313, -0.2383133620073, -0.2567684560962, 0.06948745040129, -0.96397170819,
          0.6474147511797, 0.752920216661, -0.118174816683,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual68 = JSON.stringify(input);
        expect(assertionActual68).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionLifecycleTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_LIFECYCLE_1800
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 122
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionLifecycleTest0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.2466697044884, -0.1560519958012, 0.07982254276008];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.9531160439114, 0.2466697044884, -0.1560519958012, 0.07982254276008];
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
          0.9385522725475, -0.2291468917191, -0.2580917156968, 0.07517369296263, 0.8655648371098, -0.4951226400049,
          0.3368509278334, 0.4452967715743, 0.8296036629881,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual72 = JSON.stringify(input);
        expect(assertionActual72).assertEqual(inputBefore);
      },
    );
  });
}
