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
  assertAngleArrayNear,
  assertOrientationRange,
  variationCallback,
} from '../Shared/SharedDriver';

export default function sensorCalculationRecoveryTest(): void {
  describe('SensorCalculationRecovery', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorCalculationRecoveryTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_0100
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 43
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.9254513774494, -0.2467389976751, -0.28750585212, 0, 0.3115872694768, 0.9273770962055, 0.2070871674764, 0,
          0.2155298621466, -0.2812322678138, 0.9351231416575, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.4476277731037, 0.2025233306497, 0.8709843151795, 0, 0.7432070222474, 0.4573802999269, -0.4883099254787, 0,
          -0.4972652198057, 0.8659027438352, 0.05421936361003, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [1.390924940379, 0.7518640398874, -1.995297341062];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual1 = promiseResult.length;
        expect(assertionActual1).assertEqual(3);
        const assertionActual2 = callbackResult.length;
        expect(assertionActual2).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual3 = JSON.stringify(current);
        expect(assertionActual3).assertEqual(currentBefore);
        const assertionActual4 = JSON.stringify(previous);
        expect(assertionActual4).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual5 = JSON.stringify(current);
        expect(assertionActual5).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_0200
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 44
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.06870049557854, 0.1138666997868, 0.9911178621067, -0.9817441686188, 0.184340349572, 0.04687241088906,
          -0.1773658064289, -0.9762443393943, 0.1244522418863,
        ];
        const previous: number[] = [
          -0.3817875275415, 0.1078031366902, -0.9179415926591, -0.9090927392955, 0.1353298400491, 0.3940002864877,
          0.1666993556492, 0.9849184322126, 0.04633580380337,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-2.757291403328, 0.07720456942227, 2.664208290355];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual6 = promiseResult.length;
        expect(assertionActual6).assertEqual(3);
        const assertionActual7 = callbackResult.length;
        expect(assertionActual7).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual8 = JSON.stringify(current);
        expect(assertionActual8).assertEqual(currentBefore);
        const assertionActual9 = JSON.stringify(previous);
        expect(assertionActual9).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual10 = JSON.stringify(current);
        expect(assertionActual10).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_0300
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 45
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.2350515613421, -0.9609060008969, -0.1463230021252, 0, 0.5950831366664, -0.0232383195322, -0.8033281029322,
          0, 0.7685224941184, -0.2758978759353, 0.5772811603443, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.994606645512, -0.1035393711993, -0.006100763479086, 0, 0.1036678917719, 0.9905503889181, 0.08979362577519,
          0, -0.003254061913565, -0.0899417902087, 0.99594170786, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-1.465375868832, 0.274434450516, -1.020101859342];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual11 = promiseResult.length;
        expect(assertionActual11).assertEqual(3);
        const assertionActual12 = callbackResult.length;
        expect(assertionActual12).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual13 = JSON.stringify(current);
        expect(assertionActual13).assertEqual(currentBefore);
        const assertionActual14 = JSON.stringify(previous);
        expect(assertionActual14).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual15 = JSON.stringify(current);
        expect(assertionActual15).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_0400
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 46
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.9567992904959, 0.2589611743476, -0.1321901202322, -0.2873575138829, 0.9114927694692, -0.2942899767582,
          0.04428066080687, 0.3195622652721, 0.9465300743731,
        ];
        const previous: number[] = [
          -0.3883582679952, -0.8867482824596, 0.250709671203, -0.05516073020401, -0.2492066566237, -0.9668781392388,
          0.9198560482614, -0.3893244480499, 0.04786778277163,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [2.900173693666, 0.9291000988824, -1.052144670178];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual16 = promiseResult.length;
        expect(assertionActual16).assertEqual(3);
        const assertionActual17 = callbackResult.length;
        expect(assertionActual17).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual18 = JSON.stringify(current);
        expect(assertionActual18).assertEqual(currentBefore);
        const assertionActual19 = JSON.stringify(previous);
        expect(assertionActual19).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual20 = JSON.stringify(current);
        expect(assertionActual20).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_0500
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 47
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.9363823665812, 0.1507971118885, -0.316935789399, 0, -0.2230290717641, 0.441601522682, 0.8690489792371, 0,
          0.2710094033496, 0.8844480347714, -0.3798757390056, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.387085076127, 0.3655060493316, 0.8465048563014, 0, -0.7962154547893, 0.5954815450315, 0.1069704589196, 0,
          -0.4649796698721, -0.7154069173756, 0.5215235844875, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-1.990857842943, -0.6894971937484, 2.076018353881];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual21 = promiseResult.length;
        expect(assertionActual21).assertEqual(3);
        const assertionActual22 = callbackResult.length;
        expect(assertionActual22).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual23 = JSON.stringify(current);
        expect(assertionActual23).assertEqual(currentBefore);
        const assertionActual24 = JSON.stringify(previous);
        expect(assertionActual24).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual25 = JSON.stringify(current);
        expect(assertionActual25).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_0600
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 48
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.7897867492678, 0.1006051296618, 0.6050747875814, 0.3600147543804, 0.7226392688677, -0.5900693719545,
          -0.496614807783, 0.6838648221514, 0.5345115880077,
        ];
        const previous: number[] = [
          0.8189041469274, -0.2994314307519, -0.4896292642633, 0.565465039553, 0.5669222314208, 0.5990396252037,
          0.09821042301321, -0.7674242645361, 0.6335729721293,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [1.825387237523, -0.9560306323524, 2.140473312064];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual26 = promiseResult.length;
        expect(assertionActual26).assertEqual(3);
        const assertionActual27 = callbackResult.length;
        expect(assertionActual27).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual28 = JSON.stringify(current);
        expect(assertionActual28).assertEqual(currentBefore);
        const assertionActual29 = JSON.stringify(previous);
        expect(assertionActual29).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual30 = JSON.stringify(current);
        expect(assertionActual30).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_0700
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 49
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.6709356286046, -0.7401243276816, 0.04540222288454, 0, 0.3950542109825, 0.3049651652289, -0.8665612606053, 0,
          0.6275169739967, 0.5993431634471, 0.4970012271366, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          -0.4015545271565, -0.7253365561007, -0.5591429531918, 0, -0.9153365284725, 0.337998910485, 0.2188967248612, 0,
          0.03021591243164, 0.5997029405421, -0.7996520379146, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [0.0361721386557, -0.001325196501519, 2.230018686387];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual31 = promiseResult.length;
        expect(assertionActual31).assertEqual(3);
        const assertionActual32 = callbackResult.length;
        expect(assertionActual32).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual33 = JSON.stringify(current);
        expect(assertionActual33).assertEqual(currentBefore);
        const assertionActual34 = JSON.stringify(previous);
        expect(assertionActual34).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual35 = JSON.stringify(current);
        expect(assertionActual35).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_0800
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 50
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.06511079098421, 0.9688033054177, 0.2391249470658, 0.3856951739114, -0.2454429014993, 0.8893801295987,
          0.9203259301567, 0.03432109432128, -0.3896437408271,
        ];
        const previous: number[] = [
          0.9553073958716, -0.03432334616431, -0.2936148621939, 0.1172691410627, 0.9557426205418, 0.2698221485244,
          0.2713590388166, -0.292195056748, 0.9170530632764,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [1.868368547323, 0.3248922929633, -1.770025710428];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual36 = promiseResult.length;
        expect(assertionActual36).assertEqual(3);
        const assertionActual37 = callbackResult.length;
        expect(assertionActual37).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual38 = JSON.stringify(current);
        expect(assertionActual38).assertEqual(currentBefore);
        const assertionActual39 = JSON.stringify(previous);
        expect(assertionActual39).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual40 = JSON.stringify(current);
        expect(assertionActual40).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_0900
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 51
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.9937997270326, 0.07212814203131, -0.08461461857808, 0, -0.07614656301304, 0.9960687906732,
          -0.04526218275939, 0, 0.08101730365362, 0.05142465725656, 0.9953852023889, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          -0.3554741731059, 0.6360696233703, 0.6848748400111, 0, -0.6183055724901, 0.3894780535896, -0.6826456363295, 0,
          -0.7009538724355, -0.6661248231357, 0.2548360035789, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-1.037971029961, 0.6655074949743, -1.278571310522];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual41 = promiseResult.length;
        expect(assertionActual41).assertEqual(3);
        const assertionActual42 = callbackResult.length;
        expect(assertionActual42).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual43 = JSON.stringify(current);
        expect(assertionActual43).assertEqual(currentBefore);
        const assertionActual44 = JSON.stringify(previous);
        expect(assertionActual44).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual45 = JSON.stringify(current);
        expect(assertionActual45).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_1000
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 52
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.1444837174777, -0.9217542626732, -0.3598521010465, 0.2707288699368, -0.386615740869, 0.8816088406403,
          -0.9517511935199, 0.0299557699962, 0.3054051693691,
        ];
        const previous: number[] = [
          0.4034907132938, -0.5570644556316, 0.725861168928, 0.7277015015751, -0.2855238056277, -0.6236398648461,
          0.5546582451303, 0.7798431564692, 0.2901704368421,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-0.7771573216473, 0.4326348701621, 2.490962360551];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual46 = promiseResult.length;
        expect(assertionActual46).assertEqual(3);
        const assertionActual47 = callbackResult.length;
        expect(assertionActual47).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual48 = JSON.stringify(current);
        expect(assertionActual48).assertEqual(currentBefore);
        const assertionActual49 = JSON.stringify(previous);
        expect(assertionActual49).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual50 = JSON.stringify(current);
        expect(assertionActual50).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_1100
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 53
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.388789250993, 0.5333797121774, 0.7512316559823, 0, -0.9082642096779, 0.08507294258626, 0.4096568318214, 0,
          0.1545931555101, -0.8415869991137, 0.5175251483669, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.8924796091084, 0.3252847972717, -0.3125219160149, 0, -0.3579070598475, 0.9323255640028, -0.05168732163805,
          0, 0.2745590716713, 0.1579836807102, 0.9485032803276, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [1.061268533633, 1.322522627933, -0.2976760112452];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual51 = promiseResult.length;
        expect(assertionActual51).assertEqual(3);
        const assertionActual52 = callbackResult.length;
        expect(assertionActual52).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual53 = JSON.stringify(current);
        expect(assertionActual53).assertEqual(currentBefore);
        const assertionActual54 = JSON.stringify(previous);
        expect(assertionActual54).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual55 = JSON.stringify(current);
        expect(assertionActual55).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_1200
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 54
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.7501253590089, -0.4580035875012, -0.4770164144008, 0.3013765940195, 0.8788387122764, -0.369884666324,
          0.5886289955048, 0.1336982858546, 0.7972707658071,
        ];
        const previous: number[] = [
          -0.3307252976838, -0.4738190905177, -0.8161594494539, -0.8252516966875, -0.2743223763241, 0.4936667610467,
          -0.4577995353715, 0.8368050569332, -0.3002946588015,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-1.433391169662, -0.8749454508522, 1.621820786389];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual56 = promiseResult.length;
        expect(assertionActual56).assertEqual(3);
        const assertionActual57 = callbackResult.length;
        expect(assertionActual57).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual58 = JSON.stringify(current);
        expect(assertionActual58).assertEqual(currentBefore);
        const assertionActual59 = JSON.stringify(previous);
        expect(assertionActual59).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual60 = JSON.stringify(current);
        expect(assertionActual60).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_1300
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 55
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.1045304346738, 0.9476785433518, -0.3016268666707, 0, 0.8910888472751, -0.2239255707321, -0.3947378940946, 0,
          -0.4416266007487, -0.2275142132769, -0.8678728180259, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.7406985625631, -0.5027344045969, 0.4456722538498, 0, 0.6699601945638, 0.6022705282111, -0.4340778139324, 0,
          -0.05018941239914, 0.6201034827212, 0.7829129540377, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [2.49889233196, -0.3484393194916, 2.323521513579];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual61 = promiseResult.length;
        expect(assertionActual61).assertEqual(3);
        const assertionActual62 = callbackResult.length;
        expect(assertionActual62).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual63 = JSON.stringify(current);
        expect(assertionActual63).assertEqual(currentBefore);
        const assertionActual64 = JSON.stringify(previous);
        expect(assertionActual64).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual65 = JSON.stringify(current);
        expect(assertionActual65).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_1400
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 56
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.9307567409562, -0.3417202060207, 0.1300737866049, 0.3581000423984, 0.7800670351149, -0.5130884722554,
          0.07386642538294, 0.5241399827568, 0.8484226715953,
        ];
        const previous: number[] = [
          0.6236974883796, -0.07513196978998, 0.7780466760448, -0.6531851030321, 0.4966513763658, 0.5715650720005,
          -0.429360762257, -0.8646921981084, 0.2606851326113,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-1.613109489626, -0.3221643517508, -1.540101367443];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual66 = promiseResult.length;
        expect(assertionActual66).assertEqual(3);
        const assertionActual67 = callbackResult.length;
        expect(assertionActual67).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual68 = JSON.stringify(current);
        expect(assertionActual68).assertEqual(currentBefore);
        const assertionActual69 = JSON.stringify(previous);
        expect(assertionActual69).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual70 = JSON.stringify(current);
        expect(assertionActual70).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_1500
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 57
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.4838941601612, 0.8320408006132, 0.2712094170136, 0, 0.09283387558571, 0.259355667269, -0.9613097884653, 0,
          -0.8701886653512, 0.4903496140209, 0.04825912062983, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          -0.0628773503391, 0.9217064738538, -0.3827579063459, 0, 0.7761485232859, 0.286258109242, 0.5618271662124, 0,
          0.6274072908529, -0.2617507802264, -0.7333802700069, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [0.5697558593819, 0.561397676884, -2.502198637793];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual71 = promiseResult.length;
        expect(assertionActual71).assertEqual(3);
        const assertionActual72 = callbackResult.length;
        expect(assertionActual72).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual73 = JSON.stringify(current);
        expect(assertionActual73).assertEqual(currentBefore);
        const assertionActual74 = JSON.stringify(previous);
        expect(assertionActual74).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual75 = JSON.stringify(current);
        expect(assertionActual75).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_1600
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 58
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.5050475719763, -0.6935976099103, -0.5136626378933, 0.3933513583046, 0.3447697563503, -0.8522960307464,
          0.7682458323745, -0.6324999372592, 0.09870243363943,
        ];
        const previous: number[] = [
          0.9978350787481, 0.04377441898531, -0.04908111512874, -0.04203575650601, 0.9984704123132, 0.03591421598721,
          0.05057816519754, -0.03377330273318, 0.9981488933159,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-1.144702767613, 0.6247622288348, -1.455734243605];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual76 = promiseResult.length;
        expect(assertionActual76).assertEqual(3);
        const assertionActual77 = callbackResult.length;
        expect(assertionActual77).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual78 = JSON.stringify(current);
        expect(assertionActual78).assertEqual(currentBefore);
        const assertionActual79 = JSON.stringify(previous);
        expect(assertionActual79).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual80 = JSON.stringify(current);
        expect(assertionActual80).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_1700
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 59
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.9863646807259, 0.1475262863685, 0.0729432069955, 0, -0.156658898967, 0.9774647265082, 0.1414945151115, 0,
          -0.05042525152058, -0.1509923947175, 0.9872479884743, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.2483060244076, -0.2830379901172, -0.9264089887265, 0, 0.7087447940976, -0.5988394533297, 0.3729237535682, 0,
          -0.6603218420456, -0.7491867626208, 0.0519062581127, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [2.12573224292, -0.2218274759625, 1.533436653935];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual81 = promiseResult.length;
        expect(assertionActual81).assertEqual(3);
        const assertionActual82 = callbackResult.length;
        expect(assertionActual82).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual83 = JSON.stringify(current);
        expect(assertionActual83).assertEqual(currentBefore);
        const assertionActual84 = JSON.stringify(previous);
        expect(assertionActual84).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual85 = JSON.stringify(current);
        expect(assertionActual85).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_1800
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 60
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.5514267501365, 0.1422787592498, -0.8220007870435, -0.7414834528319, -0.5351135778878, 0.4047909929044,
          -0.3822706219555, 0.8327125635094, 0.4005732868818,
        ];
        const previous: number[] = [
          0.05253494985449, 0.7976441000424, 0.6008360580985, -0.6671484658042, 0.4757325432387, -0.5732289872981,
          -0.7430699856803, -0.3707322982574, 0.5571396229042,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-2.627046892824, -1.027803237535, 2.908691236587];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual86 = promiseResult.length;
        expect(assertionActual86).assertEqual(3);
        const assertionActual87 = callbackResult.length;
        expect(assertionActual87).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual88 = JSON.stringify(current);
        expect(assertionActual88).assertEqual(currentBefore);
        const assertionActual89 = JSON.stringify(previous);
        expect(assertionActual89).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual90 = JSON.stringify(current);
        expect(assertionActual90).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_1900
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 61
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.5245860399033, -0.7284773554556, 0.4406021213373, 0, 0.2523223275834, 0.6273115876367, 0.7367588581209, 0,
          -0.8131069608247, -0.2753196589512, 0.5128900034642, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.7981972941336, -0.5323666788749, -0.2818985612974, 0, 0.3219538221167, 0.7725278793668, -0.5473083335977, 0,
          0.5091432176336, 0.3461017116756, 0.7880271499847, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-0.5894126480749, 0.3628450822814, 1.70303435718];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual91 = promiseResult.length;
        expect(assertionActual91).assertEqual(3);
        const assertionActual92 = callbackResult.length;
        expect(assertionActual92).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual93 = JSON.stringify(current);
        expect(assertionActual93).assertEqual(currentBefore);
        const assertionActual94 = JSON.stringify(previous);
        expect(assertionActual94).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual95 = JSON.stringify(current);
        expect(assertionActual95).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_2000
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 62
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.6731482977625, 0.5918154912464, -0.4434250709424, -0.1143271260742, 0.6756969750991, 0.7282601911992,
          0.7306166419287, -0.4395315940438, 0.5225048328717,
        ];
        const previous: number[] = [
          -0.8810674893792, 0.2518912792953, -0.4003384350446, -0.04994891725743, -0.8912156288496, -0.450821260101,
          -0.4703458140813, -0.377207484429, 0.7978028132734,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-2.260347757291, 1.102203271704, -0.940838947501];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual96 = promiseResult.length;
        expect(assertionActual96).assertEqual(3);
        const assertionActual97 = callbackResult.length;
        expect(assertionActual97).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual98 = JSON.stringify(current);
        expect(assertionActual98).assertEqual(currentBefore);
        const assertionActual99 = JSON.stringify(previous);
        expect(assertionActual99).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual100 = JSON.stringify(current);
        expect(assertionActual100).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_2100
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 63
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.9409005282164, -0.3386148403948, -0.006796018436632, 0, -0.305991074221, -0.841306157962, -0.4456157661847,
          0, 0.1451745793837, 0.4213596307665, -0.8951985271777, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.9215742485338, 0.1110156404104, -0.3719898278496, 0, -0.2732174469709, 0.8662124829958, -0.4183636707136, 0,
          0.2757773216021, 0.4871872965159, 0.8286105279343, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [3.081063165185, -0.9738860021824, 2.959664674474];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual101 = promiseResult.length;
        expect(assertionActual101).assertEqual(3);
        const assertionActual102 = callbackResult.length;
        expect(assertionActual102).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual103 = JSON.stringify(current);
        expect(assertionActual103).assertEqual(currentBefore);
        const assertionActual104 = JSON.stringify(previous);
        expect(assertionActual104).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual105 = JSON.stringify(current);
        expect(assertionActual105).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_2200
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 64
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.9714379786423, 0.1251154348718, -0.201629317333, -0.07525057271992, 0.9682758877269, 0.2382837731615,
          0.2250457841344, -0.2163051853368, 0.9500349792717,
        ];
        const previous: number[] = [
          0.06746249828429, 0.4689529376386, 0.8806429206014, 0.4333347826081, 0.7812842287305, -0.4492392682291,
          -0.8987044995477, 0.4119200119163, -0.1505062333448,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [0.7086863459572, 0.2965789716986, -2.034335161684];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual106 = promiseResult.length;
        expect(assertionActual106).assertEqual(3);
        const assertionActual107 = callbackResult.length;
        expect(assertionActual107).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual108 = JSON.stringify(current);
        expect(assertionActual108).assertEqual(currentBefore);
        const assertionActual109 = JSON.stringify(previous);
        expect(assertionActual109).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual110 = JSON.stringify(current);
        expect(assertionActual110).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_2300
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 65
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.3592418522949, -0.298686618172, 0.8841558661711, 0, 0.7937783244698, 0.4004265812783, 0.457793102403, 0,
          -0.4907761843873, 0.8662822040944, 0.09324097654762, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.3446722240301, 0.216878678369, -0.913326172214, 0, 0.9386634253936, -0.09059695154486, 0.3327208532678, 0,
          -0.01058450804621, -0.971985509789, -0.234802335912, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [2.868890708086, -0.2040362488678, -2.334278604372];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual111 = promiseResult.length;
        expect(assertionActual111).assertEqual(3);
        const assertionActual112 = callbackResult.length;
        expect(assertionActual112).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual113 = JSON.stringify(current);
        expect(assertionActual113).assertEqual(currentBefore);
        const assertionActual114 = JSON.stringify(previous);
        expect(assertionActual114).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual115 = JSON.stringify(current);
        expect(assertionActual115).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_2400
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 66
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.3874353888463, 0.4809921806633, -0.7864733572158, -0.8430897182346, -0.1602606708182, -0.5133383332618,
          -0.3729524721417, 0.8619530378911, 0.3434289067533,
        ];
        const previous: number[] = [
          0.9796595566413, 0.190763483161, -0.06226111606449, -0.1767835394815, 0.9672729159944, 0.1820183676229,
          0.09494594909579, -0.1673092928561, 0.9813219997912,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [1.913572301502, -0.9055033756527, 1.077062600695];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual116 = promiseResult.length;
        expect(assertionActual116).assertEqual(3);
        const assertionActual117 = callbackResult.length;
        expect(assertionActual117).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual118 = JSON.stringify(current);
        expect(assertionActual118).assertEqual(currentBefore);
        const assertionActual119 = JSON.stringify(previous);
        expect(assertionActual119).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual120 = JSON.stringify(current);
        expect(assertionActual120).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_2500
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 67
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.8448752295123, -0.4657527335185, -0.2631733986872, 0, 0.4605923643157, 0.8835341036513, -0.08498330200196,
          0, 0.2721038781248, -0.04941537114271, 0.9609982313221, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          -0.6000329815639, 0.7868890292122, 0.1441043952874, 0, 0.1292002550003, -0.08244795360145, 0.9881850176231, 0,
          0.7894730616959, 0.6115619270789, -0.05219477180784, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [2.494779144945, -0.9416962596982, -1.86754880603];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual121 = promiseResult.length;
        expect(assertionActual121).assertEqual(3);
        const assertionActual122 = callbackResult.length;
        expect(assertionActual122).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual123 = JSON.stringify(current);
        expect(assertionActual123).assertEqual(currentBefore);
        const assertionActual124 = JSON.stringify(previous);
        expect(assertionActual124).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual125 = JSON.stringify(current);
        expect(assertionActual125).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_2600
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 68
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.2649984922279, -0.8384926894666, 0.4761363342866, -0.6078807932839, -0.2380345764949, -0.7575093937038,
          0.7485029995087, -0.4901729797774, -0.4466247973665,
        ];
        const previous: number[] = [
          0.5841021132883, -0.7679844742866, 0.2627252719228, 0.3891849488644, 0.5490355650154, 0.7396587212531,
          -0.7122919323069, -0.3297875006774, 0.6195808321498,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-0.3327611339432, 0.7754806108447, 3.063809142165];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual126 = promiseResult.length;
        expect(assertionActual126).assertEqual(3);
        const assertionActual127 = callbackResult.length;
        expect(assertionActual127).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual128 = JSON.stringify(current);
        expect(assertionActual128).assertEqual(currentBefore);
        const assertionActual129 = JSON.stringify(previous);
        expect(assertionActual129).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual130 = JSON.stringify(current);
        expect(assertionActual130).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_2700
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 69
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.6844313125382, 0.5616763649237, 0.4648370031563, 0, -0.3616962445245, 0.8151634615141, -0.4524205540304, 0,
          -0.6330320727373, 0.1415209952566, 0.7610796297284, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.4489185144519, 0.8592608964395, -0.2452404518678, 0, -0.8873719480116, 0.3964091918007, -0.2354374195791, 0,
          -0.1050865988812, 0.323311714149, 0.9404394410219, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-0.518699144101, 0.1978623322774, 0.763582647759];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual131 = promiseResult.length;
        expect(assertionActual131).assertEqual(3);
        const assertionActual132 = callbackResult.length;
        expect(assertionActual132).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual133 = JSON.stringify(current);
        expect(assertionActual133).assertEqual(currentBefore);
        const assertionActual134 = JSON.stringify(previous);
        expect(assertionActual134).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual135 = JSON.stringify(current);
        expect(assertionActual135).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_2800
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 70
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.9306643046329, -0.3550091980475, 0.08850096826538, -0.03527787141902, 0.1536914321241, 0.9874889444848,
          -0.3641694988194, -0.9221428376306, 0.1305111609645,
        ];
        const previous: number[] = [
          0.1484149346091, -0.954832585476, 0.257425214185, -0.5890952861938, -0.2944445194158, -0.7525085838515,
          0.794317160188, -0.03996446795871, -0.6061873393033,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-1.209839274514, -0.3596523766609, -2.594556203823];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual136 = promiseResult.length;
        expect(assertionActual136).assertEqual(3);
        const assertionActual137 = callbackResult.length;
        expect(assertionActual137).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual138 = JSON.stringify(current);
        expect(assertionActual138).assertEqual(currentBefore);
        const assertionActual139 = JSON.stringify(previous);
        expect(assertionActual139).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual140 = JSON.stringify(current);
        expect(assertionActual140).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_2900
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 71
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.1760164119854, 0.569433258223, -0.8029719715789, 0, 0.9252500715391, 0.3741697232134, 0.0625245819447, 0,
          0.3360513767696, -0.7319445215725, -0.5927281750612, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.9593425379381, -0.02763702846172, -0.2808880374104, 0, 0.03205516152413, 0.9994239509829, 0.01114597780953,
          0, 0.2804181904266, -0.01969672204898, 0.9596758190235, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [0.7583829601891, 1.03176432299, -2.301520562418];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual141 = promiseResult.length;
        expect(assertionActual141).assertEqual(3);
        const assertionActual142 = callbackResult.length;
        expect(assertionActual142).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual143 = JSON.stringify(current);
        expect(assertionActual143).assertEqual(currentBefore);
        const assertionActual144 = JSON.stringify(previous);
        expect(assertionActual144).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual145 = JSON.stringify(current);
        expect(assertionActual145).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_3000
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 72
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.9999664489491, 0.004861187575748, 0.006593165518145, -0.004828614731881, 0.9999761038275,
          -0.004947348143971, -0.006617057954055, 0.004915346299091, 0.9999660263803,
        ];
        const previous: number[] = [
          0.6413661593202, 0.2647000812962, 0.7201272919704, 0.7671377050357, -0.2361891789399, -0.5964179853629,
          0.01221438461066, 0.9349591107174, -0.354545159458,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [1.86131430207, 0.6368249876713, -2.016832314421];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual146 = promiseResult.length;
        expect(assertionActual146).assertEqual(3);
        const assertionActual147 = callbackResult.length;
        expect(assertionActual147).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual148 = JSON.stringify(current);
        expect(assertionActual148).assertEqual(currentBefore);
        const assertionActual149 = JSON.stringify(previous);
        expect(assertionActual149).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual150 = JSON.stringify(current);
        expect(assertionActual150).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_3100
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 73
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.05709421514963, 0.3335617782946, 0.9409977633647, 0, -0.6878342882923, -0.6700083559669, 0.2792360914781, 0,
          0.723618851638, -0.663193292333, 0.1911816271472, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.02916300284311, 0.9940302298208, 0.1051352532105, 0, -0.5292618824413, 0.1045818608664, -0.8419884168873, 0,
          -0.8479571799684, -0.03108917142958, 0.5291522317442, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [1.275276813204, -0.2509023600252, -1.606953412121];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual151 = promiseResult.length;
        expect(assertionActual151).assertEqual(3);
        const assertionActual152 = callbackResult.length;
        expect(assertionActual152).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual153 = JSON.stringify(current);
        expect(assertionActual153).assertEqual(currentBefore);
        const assertionActual154 = JSON.stringify(previous);
        expect(assertionActual154).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual155 = JSON.stringify(current);
        expect(assertionActual155).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_3200
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 74
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.2141142243922, -0.6418312918107, 0.7363475346367, 0.9303406855589, 0.3637333173236, 0.04652185145199,
          -0.2976933114913, 0.6750930800426, 0.6750022411606,
        ];
        const previous: number[] = [
          0.871149489275, -0.2736068906743, -0.4077227449032, 0.3929505775178, 0.8863849287572, 0.2447684654944,
          0.2944289574147, -0.3734448117829, 0.8796877636913,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-0.724025365704, -1.236345699327, 0.3790278251406];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual156 = promiseResult.length;
        expect(assertionActual156).assertEqual(3);
        const assertionActual157 = callbackResult.length;
        expect(assertionActual157).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual158 = JSON.stringify(current);
        expect(assertionActual158).assertEqual(currentBefore);
        const assertionActual159 = JSON.stringify(previous);
        expect(assertionActual159).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual160 = JSON.stringify(current);
        expect(assertionActual160).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_3300
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 75
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.7463877271968, 0.2950303826127, -0.5965420639196, 0, -0.5650478015773, 0.7545063607275, -0.3338279999556, 0,
          0.3516053791151, 0.5862399039277, 0.7298605568327, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          -0.5761291856187, -0.612870613549, 0.5408001225281, 0, -0.3625735866291, -0.4013559095352, -0.8411027453053,
          0, 0.732540480627, -0.6806636797489, 0.009022156809797, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-3.125625213174, 0.4890367421941, -1.610727673161];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual161 = promiseResult.length;
        expect(assertionActual161).assertEqual(3);
        const assertionActual162 = callbackResult.length;
        expect(assertionActual162).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual163 = JSON.stringify(current);
        expect(assertionActual163).assertEqual(currentBefore);
        const assertionActual164 = JSON.stringify(previous);
        expect(assertionActual164).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual165 = JSON.stringify(current);
        expect(assertionActual165).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_3400
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 76
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.9484968655138, -0.3167786333888, 0.002234622732425, 0.04528621094598, -0.1286073969602, 0.9906610401875,
          -0.3135328614493, 0.9397400890009, 0.1363294169134,
        ];
        const previous: number[] = [
          0.7840250716, 0.6067015868483, 0.1312168877022, -0.5917121574662, 0.6666083262761, 0.4533321762747,
          0.187567080825, -0.4330664196807, 0.8816303456301,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [3.135751679089, -0.8163265576032, 0.5887638224361];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual166 = promiseResult.length;
        expect(assertionActual166).assertEqual(3);
        const assertionActual167 = callbackResult.length;
        expect(assertionActual167).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual168 = JSON.stringify(current);
        expect(assertionActual168).assertEqual(currentBefore);
        const assertionActual169 = JSON.stringify(previous);
        expect(assertionActual169).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual170 = JSON.stringify(current);
        expect(assertionActual170).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorCalculationRecoveryTest0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_RECOVERY_3500
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 77
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationRecoveryTest0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.9790804368306, -0.1672412881648, -0.1158958573402, 0, 0.08999855517741, 0.8667843743134, -0.4904947589038,
          0, 0.1824876935073, 0.469803363099, 0.8637030981415, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.4449687636435, -0.8301711894074, 0.3358847952192, 0, 0.09165304596784, 0.4153071732392, 0.90505230292, 0,
          -0.8908437116276, -0.371935139687, 0.2608864375925, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-0.9060315105321, -1.017651815561, -2.083090449662];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual171 = promiseResult.length;
        expect(assertionActual171).assertEqual(3);
        const assertionActual172 = callbackResult.length;
        expect(assertionActual172).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual173 = JSON.stringify(current);
        expect(assertionActual173).assertEqual(currentBefore);
        const assertionActual174 = JSON.stringify(previous);
        expect(assertionActual174).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual175 = JSON.stringify(current);
        expect(assertionActual175).assertEqual(currentBefore);
      },
    );
  });
}
