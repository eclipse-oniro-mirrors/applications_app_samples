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

export default function sensorMatrixOrthogonalityTest(): void {
  describe('SensorMatrixOrthogonality', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorMatrixOrthogonalityTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_MATRIX_ORTHOGONALITY_0100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 18
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorMatrixOrthogonalityTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.06903396863408, 0.2367621127431, -0.8812305611665];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.6652471999288, 0.6780235160305, 0.3126184170781, -0.7434020290899, -0.5626659815184, -0.3616080977894,
          -0.0692790454023, -0.4729599401128, 0.8783560262881,
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
        const expectedQuaternion: number[] = [0.4032501843896, -0.06903396863408, 0.2367621127431, -0.8812305611665];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual4 = JSON.stringify(input);
        expect(assertionActual4).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorMatrixOrthogonalityTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_MATRIX_ORTHOGONALITY_0200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 19
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorMatrixOrthogonalityTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.5507210356706, 0.390644641725, 0.07609774230254, 0.7336976477936];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.683211795016, 0.3186069742804, 0.6570473644197, 0.5419379123995, 0.3818309489727, -0.7486711063683,
          -0.4894128546075, 0.8675798074797, 0.0882062095228,
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
        const expectedQuaternion: number[] = [0.7336976477936, 0.5507210356706, 0.390644641725, 0.07609774230254];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual8 = JSON.stringify(input);
        expect(assertionActual8).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorMatrixOrthogonalityTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_MATRIX_ORTHOGONALITY_0300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorMatrixOrthogonalityTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.1347256975634, -0.3776276432057, 0.1105451517705];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.6903542650139, -0.302813976074, -0.6570499864328, 0.09930938547355, 0.9392575116722, -0.3285315399231,
          0.7166230771709, 0.1615519193995, 0.678492699006,
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
        const expectedQuaternion: number[] = [0.9094097640355, 0.1347256975634, -0.3776276432057, 0.1105451517705];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual12 = JSON.stringify(input);
        expect(assertionActual12).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorMatrixOrthogonalityTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_MATRIX_ORTHOGONALITY_0400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 21
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorMatrixOrthogonalityTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.7131038059355, 0.4283057202569, -0.5465043995528, 0.09679934516779];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.03577430252928, -0.5050503424222, 0.8623481610682, -0.7166554144543, -0.6143681935407, -0.3300859580456,
          0.6965093080583, -0.6061978838505, -0.3839256560889,
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
        const expectedQuaternion: number[] = [0.09679934516779, -0.7131038059355, 0.4283057202569, -0.5465043995528];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual16 = JSON.stringify(input);
        expect(assertionActual16).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorMatrixOrthogonalityTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_MATRIX_ORTHOGONALITY_0500
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 22
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorMatrixOrthogonalityTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.1585392665592, -0.0898306640667, -0.230054738193];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.8780105384565, 0.4113655387235, -0.2446955003878, -0.4683322891061, 0.8438802367876, -0.2617842870378,
          0.09880466254147, 0.3444481666521, 0.9335915055044,
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
        const expectedQuaternion: number[] = [0.9559657787741, 0.1585392665592, -0.0898306640667, -0.230054738193];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual20 = JSON.stringify(input);
        expect(assertionActual20).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorMatrixOrthogonalityTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_MATRIX_ORTHOGONALITY_0600
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 23
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorMatrixOrthogonalityTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.3332532264986, 0.4797848042051, 0.5009380729494, 0.6385999340369];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.03773517744723, -0.9595777087368, 0.2789026304618, 0.3200183726315, 0.276006668196, 0.9063159274169,
          -0.9466595468073, 0.05505397357869, 0.3174976573644,
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
        const expectedQuaternion: number[] = [0.6385999340369, -0.3332532264986, 0.4797848042051, 0.5009380729494];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual24 = JSON.stringify(input);
        expect(assertionActual24).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorMatrixOrthogonalityTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_MATRIX_ORTHOGONALITY_0700
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 24
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorMatrixOrthogonalityTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.4875179603017, -0.4702525495688, -0.5209830975254];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.01487830343383, 0.999699365847, 0.01948881761278, -0.08267311067734, -0.01819429904774, 0.9964106203032,
          0.9964656506161, -0.01643610072904, 0.08237755601474,
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
        const expectedQuaternion: number[] = [0.5193894397273, -0.4875179603017, -0.4702525495688, -0.5209830975254];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual28 = JSON.stringify(input);
        expect(assertionActual28).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorMatrixOrthogonalityTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_MATRIX_ORTHOGONALITY_0800
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 25
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorMatrixOrthogonalityTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.07945650022664, 0.007408810260941, 0.1278900476149, 0.988572662895];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.9671784905031, -0.2516798535886, 0.03497168577169, 0.2540345661253, 0.9546616005856, -0.1552020218326,
          0.005675096617518, 0.1589920742208, 0.9872635482045,
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
        const expectedQuaternion: number[] = [0.988572662895, 0.07945650022664, 0.007408810260941, 0.1278900476149];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual32 = JSON.stringify(input);
        expect(assertionActual32).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorMatrixOrthogonalityTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_MATRIX_ORTHOGONALITY_0900
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 26
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorMatrixOrthogonalityTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.7447344471773, -0.5900404984629, 0.1977290034284];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.2255109027539, 0.7835046312625, -0.579021006121, 0.9741893064774, -0.1874523112186, 0.1257649639762,
          -0.01000139411555, -0.5924374429499, -0.8055543732776,
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
        const expectedQuaternion: number[] = [0.2410934560796, -0.7447344471773, -0.5900404984629, 0.1977290034284];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual36 = JSON.stringify(input);
        expect(assertionActual36).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorMatrixOrthogonalityTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_MATRIX_ORTHOGONALITY_1000
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 27
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorMatrixOrthogonalityTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.04747927513977, 0.5341392231491, 0.09290226123231, 0.8389339536482];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.4121289203032, -0.1051566363593, 0.9050369245944, 0.2065988089146, 0.9782297765803, 0.01958153126813,
          -0.8873931965058, 0.1789094353056, 0.4248820174517,
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
        const expectedQuaternion: number[] = [0.8389339536482, 0.04747927513977, 0.5341392231491, 0.09290226123231];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual40 = JSON.stringify(input);
        expect(assertionActual40).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorMatrixOrthogonalityTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_MATRIX_ORTHOGONALITY_1100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 28
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorMatrixOrthogonalityTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.4607389885605, -0.1965821958762, -0.2614744415221];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.7859731133904, 0.2503123803121, -0.5653228964848, -0.6126047087001, 0.438701401702, -0.657462205015,
          0.08343701759956, 0.8630670845347, 0.4981500493695,
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
        const expectedQuaternion: number[] = [0.8250491749681, 0.4607389885605, -0.1965821958762, -0.2614744415221];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual44 = JSON.stringify(input);
        expect(assertionActual44).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorMatrixOrthogonalityTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_MATRIX_ORTHOGONALITY_1200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 29
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorMatrixOrthogonalityTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.2232496532442, -0.4399084848352, 0.8284027632968, 0.2653092140475];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.7595412265357, -0.6359846054874, 0.1364577105762, 0.2431469386928, -0.472183091823, -0.8473031889476,
          0.6033048080341, -0.6103824287932, 0.5132802345927,
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
        const expectedQuaternion: number[] = [0.2653092140475, 0.2232496532442, -0.4399084848352, 0.8284027632968];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual48 = JSON.stringify(input);
        expect(assertionActual48).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorMatrixOrthogonalityTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_MATRIX_ORTHOGONALITY_1300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 30
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorMatrixOrthogonalityTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.06941632746034, -0.07389410881835, 0.07473632778647];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.9779082839819, -0.1585411774478, -0.1362353961829, 0.1380233468273, 0.9791917095818, -0.1487721466432,
          0.1569870817941, 0.1266818492906, 0.9794420683277,
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
        const expectedQuaternion: number[] = [0.9920360454504, 0.06941632746034, -0.07389410881835, 0.07473632778647];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual52 = JSON.stringify(input);
        expect(assertionActual52).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorMatrixOrthogonalityTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_MATRIX_ORTHOGONALITY_1400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 31
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorMatrixOrthogonalityTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.3466428611116, 0.4916409125279, -0.6247281768227, 0.4978379706821];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.263992163575, 0.9628744406711, 0.05639990313259, -0.2811791904383, -0.02089313615178, -0.9594278189245,
          -0.9226301536561, -0.2691399048155, 0.2762558799382,
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
        const expectedQuaternion: number[] = [0.4978379706821, 0.3466428611116, 0.4916409125279, -0.6247281768227];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual56 = JSON.stringify(input);
        expect(assertionActual56).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorMatrixOrthogonalityTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_MATRIX_ORTHOGONALITY_1500
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 32
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorMatrixOrthogonalityTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.541142648069, 0.05070845916131, 0.5216082093554];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.4507070562052, -0.7409639090041, -0.4978309301764, 0.6312018695239, -0.1298209792521, 0.764676868524,
          -0.631226860484, -0.6588770741948, 0.4091865732207,
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
        const expectedQuaternion: number[] = [0.6576611304794, -0.541142648069, 0.05070845916131, 0.5216082093554];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual60 = JSON.stringify(input);
        expect(assertionActual60).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorMatrixOrthogonalityTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_MATRIX_ORTHOGONALITY_1600
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 33
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorMatrixOrthogonalityTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.2040702562646, -0.2215031140999, -0.09989828440197, 0.9483206386691];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.8819134064352, 0.2798756042476, -0.3793394122641, -0.09906681521652, 0.8967513265633, 0.431303633685,
          0.4608844862573, -0.3427925093319, 0.8185834019043,
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
        const expectedQuaternion: number[] = [0.9483206386691, -0.2040702562646, -0.2215031140999, -0.09989828440197];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual64 = JSON.stringify(input);
        expect(assertionActual64).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorMatrixOrthogonalityTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_MATRIX_ORTHOGONALITY_1700
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 34
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorMatrixOrthogonalityTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.473042743584, -0.8770699366918, 0.04260831495286];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.5421342847032, 0.8236597317385, -0.1663582389359, 0.8359065449325, 0.5488301884788, -0.006758132392476,
          0.08573602211676, -0.1427237560005, -0.986042222212,
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
        const expectedQuaternion: number[] = [0.07185694392957, -0.473042743584, -0.8770699366918, 0.04260831495286];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual68 = JSON.stringify(input);
        expect(assertionActual68).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorMatrixOrthogonalityTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_MATRIX_ORTHOGONALITY_1800
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 35
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorMatrixOrthogonalityTest0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.3362264904498, 0.1177264210505, -0.1659763951426, 0.9195347047077];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.9171846520842, 0.2260766282259, 0.3281183813065, -0.3844075937579, 0.7188071667505, 0.5792642392634,
          -0.1048957379612, -0.6574234671794, 0.7461844738129,
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
        const expectedQuaternion: number[] = [0.9195347047077, -0.3362264904498, 0.1177264210505, -0.1659763951426];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual72 = JSON.stringify(input);
        expect(assertionActual72).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorMatrixOrthogonalityTest0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_MATRIX_ORTHOGONALITY_1900
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 36
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorMatrixOrthogonalityTest0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.1518062668614, 0.3891832438588, 0.558726441711];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.07272233206501, -0.6824502335183, 0.7273053974706, 0.9187720550191, 0.3295592413491, 0.2173674707894,
          -0.3880326962191, 0.6524204052696, 0.6509825200823,
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
        const expectedQuaternion: number[] = [0.7164607619222, 0.1518062668614, 0.3891832438588, 0.558726441711];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual76 = JSON.stringify(input);
        expect(assertionActual76).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorMatrixOrthogonalityTest0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_MATRIX_ORTHOGONALITY_2000
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 37
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorMatrixOrthogonalityTest0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.5269726628317, -0.5262452964428, -0.5136785735483, 0.4260281958712];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.08159957790148, -0.1169506584453, -0.9897797999432, -0.9923168822312, -0.08313172858914, 0.09163144078711,
          -0.09299846302623, 0.9896522920658, -0.1092685988002,
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
        const expectedQuaternion: number[] = [0.4260281958712, 0.5269726628317, -0.5262452964428, -0.5136785735483];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual80 = JSON.stringify(input);
        expect(assertionActual80).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorMatrixOrthogonalityTest0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_MATRIX_ORTHOGONALITY_2100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 38
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorMatrixOrthogonalityTest0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.003963594178822, 0.02544866984361, 0.03722727545731];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.9959329903304, -0.07417648870521, 0.0511402707741, 0.07457996150382, 0.9971968397664, -0.006024292651429,
          -0.05055005552492, 0.00981383122059, 0.9986733102488,
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
        const expectedQuaternion: number[] = [0.9989748670945, 0.003963594178822, 0.02544866984361, 0.03722727545731];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual84 = JSON.stringify(input);
        expect(assertionActual84).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorMatrixOrthogonalityTest0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_MATRIX_ORTHOGONALITY_2200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 39
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorMatrixOrthogonalityTest0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.7133728863355, -0.1313688760021, 0.597130350246, 0.342456841477];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.2523551264661, -0.5964127358872, 0.7619768622588, 0.221552758894, -0.730931060287, -0.6454875367768,
          0.9419295436352, 0.3317101650224, -0.05231731308138,
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
        const expectedQuaternion: number[] = [0.342456841477, 0.7133728863355, -0.1313688760021, 0.597130350246];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual88 = JSON.stringify(input);
        expect(assertionActual88).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorMatrixOrthogonalityTest0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_MATRIX_ORTHOGONALITY_2300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 40
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorMatrixOrthogonalityTest0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.2375526393901, 0.5113087120597, -0.2810567567139];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.3191410009547, 0.6794742892143, 0.6606540030957, -0.1936233528425, 0.7291516860486, -0.6563899877105,
          -0.9277171005989, 0.08156291454631, 0.3642642889813,
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
        const expectedQuaternion: number[] = [0.7766203989055, 0.2375526393901, 0.5113087120597, -0.2810567567139];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual92 = JSON.stringify(input);
        expect(assertionActual92).assertEqual(inputBefore);
      },
    );
  });
}
