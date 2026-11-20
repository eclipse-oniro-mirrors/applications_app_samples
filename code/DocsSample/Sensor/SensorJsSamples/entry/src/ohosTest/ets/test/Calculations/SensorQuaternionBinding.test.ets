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

export default function sensorQuaternionBindingTest(): void {
  describe('SensorQuaternionBinding', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorQuaternionBindingTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_BINDING_0100
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 22
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionBindingTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.1585392665592, -0.0898306640667, -0.230054738193];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.9559657787741, 0.1585392665592, -0.0898306640667, -0.230054738193];
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
          0.8780105384565, 0.4113655387235, -0.2446955003878, -0.4683322891061, 0.8438802367876, -0.2617842870378,
          0.09880466254147, 0.3444481666521, 0.9335915055044,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual4 = JSON.stringify(input);
        expect(assertionActual4).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionBindingTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_BINDING_0200
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 23
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionBindingTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.3332532264986, 0.4797848042051, 0.5009380729494, 0.6385999340369];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.6385999340369, -0.3332532264986, 0.4797848042051, 0.5009380729494];
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
          0.03773517744723, -0.9595777087368, 0.2789026304618, 0.3200183726315, 0.276006668196, 0.9063159274169,
          -0.9466595468073, 0.05505397357869, 0.3174976573644,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual8 = JSON.stringify(input);
        expect(assertionActual8).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionBindingTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_BINDING_0300
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 24
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionBindingTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.4875179603017, -0.4702525495688, -0.5209830975254];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.5193894397273, -0.4875179603017, -0.4702525495688, -0.5209830975254];
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
          0.01487830343383, 0.999699365847, 0.01948881761278, -0.08267311067734, -0.01819429904774, 0.9964106203032,
          0.9964656506161, -0.01643610072904, 0.08237755601474,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual12 = JSON.stringify(input);
        expect(assertionActual12).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionBindingTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_BINDING_0400
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 25
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionBindingTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.07945650022664, 0.007408810260941, 0.1278900476149, 0.988572662895];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.988572662895, 0.07945650022664, 0.007408810260941, 0.1278900476149];
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
          0.9671784905031, -0.2516798535886, 0.03497168577169, 0.2540345661253, 0.9546616005856, -0.1552020218326,
          0.005675096617518, 0.1589920742208, 0.9872635482045,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual16 = JSON.stringify(input);
        expect(assertionActual16).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionBindingTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_BINDING_0500
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 26
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionBindingTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.7447344471773, -0.5900404984629, 0.1977290034284];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.2410934560796, -0.7447344471773, -0.5900404984629, 0.1977290034284];
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
          0.2255109027539, 0.7835046312625, -0.579021006121, 0.9741893064774, -0.1874523112186, 0.1257649639762,
          -0.01000139411555, -0.5924374429499, -0.8055543732776,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual20 = JSON.stringify(input);
        expect(assertionActual20).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionBindingTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_BINDING_0600
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 27
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionBindingTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.04747927513977, 0.5341392231491, 0.09290226123231, 0.8389339536482];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.8389339536482, 0.04747927513977, 0.5341392231491, 0.09290226123231];
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
          0.4121289203032, -0.1051566363593, 0.9050369245944, 0.2065988089146, 0.9782297765803, 0.01958153126813,
          -0.8873931965058, 0.1789094353056, 0.4248820174517,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual24 = JSON.stringify(input);
        expect(assertionActual24).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionBindingTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_BINDING_0700
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 28
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionBindingTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.4607389885605, -0.1965821958762, -0.2614744415221];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.8250491749681, 0.4607389885605, -0.1965821958762, -0.2614744415221];
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
          0.7859731133904, 0.2503123803121, -0.5653228964848, -0.6126047087001, 0.438701401702, -0.657462205015,
          0.08343701759956, 0.8630670845347, 0.4981500493695,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual28 = JSON.stringify(input);
        expect(assertionActual28).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionBindingTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_BINDING_0800
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 29
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionBindingTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.2232496532442, -0.4399084848352, 0.8284027632968, 0.2653092140475];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.2653092140475, 0.2232496532442, -0.4399084848352, 0.8284027632968];
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
          -0.7595412265357, -0.6359846054874, 0.1364577105762, 0.2431469386928, -0.472183091823, -0.8473031889476,
          0.6033048080341, -0.6103824287932, 0.5132802345927,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual32 = JSON.stringify(input);
        expect(assertionActual32).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionBindingTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_BINDING_0900
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 30
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionBindingTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.06941632746034, -0.07389410881835, 0.07473632778647];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.9920360454504, 0.06941632746034, -0.07389410881835, 0.07473632778647];
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
          0.9779082839819, -0.1585411774478, -0.1362353961829, 0.1380233468273, 0.9791917095818, -0.1487721466432,
          0.1569870817941, 0.1266818492906, 0.9794420683277,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual36 = JSON.stringify(input);
        expect(assertionActual36).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionBindingTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_BINDING_1000
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 31
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionBindingTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.3466428611116, 0.4916409125279, -0.6247281768227, 0.4978379706821];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.4978379706821, 0.3466428611116, 0.4916409125279, -0.6247281768227];
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
          -0.263992163575, 0.9628744406711, 0.05639990313259, -0.2811791904383, -0.02089313615178, -0.9594278189245,
          -0.9226301536561, -0.2691399048155, 0.2762558799382,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual40 = JSON.stringify(input);
        expect(assertionActual40).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionBindingTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_BINDING_1100
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 32
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionBindingTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.541142648069, 0.05070845916131, 0.5216082093554];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.6576611304794, -0.541142648069, 0.05070845916131, 0.5216082093554];
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
          0.4507070562052, -0.7409639090041, -0.4978309301764, 0.6312018695239, -0.1298209792521, 0.764676868524,
          -0.631226860484, -0.6588770741948, 0.4091865732207,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual44 = JSON.stringify(input);
        expect(assertionActual44).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionBindingTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_BINDING_1200
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 33
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionBindingTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.2040702562646, -0.2215031140999, -0.09989828440197, 0.9483206386691];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.9483206386691, -0.2040702562646, -0.2215031140999, -0.09989828440197];
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
          0.8819134064352, 0.2798756042476, -0.3793394122641, -0.09906681521652, 0.8967513265633, 0.431303633685,
          0.4608844862573, -0.3427925093319, 0.8185834019043,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual48 = JSON.stringify(input);
        expect(assertionActual48).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionBindingTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_BINDING_1300
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 34
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionBindingTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.473042743584, -0.8770699366918, 0.04260831495286];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.07185694392957, -0.473042743584, -0.8770699366918, 0.04260831495286];
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
          -0.5421342847032, 0.8236597317385, -0.1663582389359, 0.8359065449325, 0.5488301884788, -0.006758132392476,
          0.08573602211676, -0.1427237560005, -0.986042222212,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual52 = JSON.stringify(input);
        expect(assertionActual52).assertEqual(inputBefore);
      },
    );
  });
}
