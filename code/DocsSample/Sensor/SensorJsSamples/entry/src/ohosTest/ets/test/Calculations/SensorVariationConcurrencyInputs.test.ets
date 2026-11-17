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

export default function sensorVariationConcurrencyInputsTest(): void {
  describe('SensorVariationConcurrencyInputs', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorVariationConcurrencyInputsTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_CONCURRENCY_INPUTS_0100
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 78
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationConcurrencyInputsTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.1671434220771, 0.115809474051, 0.979107370096, 0.4322541240324, 0.9011551416689, -0.03279912957259,
          -0.8861260907531, 0.4177410398367, -0.2006812769615,
        ];
        const previous: number[] = [
          -0.4414690686798, -0.3883874617775, -0.8088635490198, -0.7107414807351, 0.7015998126496, 0.05103185723193,
          0.5476783809513, 0.5974218630282, -0.5857776955591,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-0.5051938480584, 0.2967249214463, -2.356013772277];
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
     * @tc.name testSensorVariationConcurrencyInputsTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_CONCURRENCY_INPUTS_0200
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 79
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationConcurrencyInputsTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.230469997939, 0.9581574768295, -0.1697581504542, 0, 0.2173658277708, 0.1193536130433, 0.9687656125044, 0,
          0.9484912635167, -0.2601710296116, -0.1807632661337, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.9997624549284, 0.01124956186813, 0.01866764777054, 0, -0.01025987128363, 0.9985791994915, -0.0522907007428,
          0, -0.01922937224022, 0.05208675168126, 0.9984574109808, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [1.450335877962, 0.250743451712, -1.815093774436];
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
     * @tc.name testSensorVariationConcurrencyInputsTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_CONCURRENCY_INPUTS_0300
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 80
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationConcurrencyInputsTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.9551036215237, -0.2962585610104, 0.002817300180703, 0.2906906671813, 0.9389056939755, 0.1842689171674,
          -0.05723642342026, -0.1751769472516, 0.9828718273436,
        ];
        const previous: number[] = [
          -0.7276301220162, 0.3897544081302, -0.5644872955857, -0.6069938154259, 0.01751314901854, 0.7945135603916,
          0.3195511126085, 0.9207522961983, 0.2238354205128,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-2.136146877485, -1.063367261994, 0.7215933832856];
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
     * @tc.name testSensorVariationConcurrencyInputsTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_CONCURRENCY_INPUTS_0400
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 81
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationConcurrencyInputsTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.384525866418, 0.2155813563392, -0.8975881777599, 0, 0.7953753521637, -0.4161414544846, -0.440686213796, 0,
          -0.4685273815114, -0.8833747611622, -0.01145094388009, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.4719448804858, -0.2211625204884, 0.8534372673574, 0, 0.8180567906823, 0.4707776181894, -0.3303808732819, 0,
          -0.3287112973444, 0.8540817137389, 0.4031045884818, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [3.089848118957, 0.03462899936537, 2.246481122334];
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
     * @tc.name testSensorVariationConcurrencyInputsTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_CONCURRENCY_INPUTS_0500
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 82
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationConcurrencyInputsTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.5827510503431, 0.3729959267979, 0.7219939417448, -0.7081494403812, 0.6689150661481, 0.2260022220419,
          -0.3986547170318, -0.64298263808, 0.6539478142145,
        ];
        const previous: number[] = [
          0.5939295163567, 0.6113991856197, -0.522913726559, -0.7040723170866, 0.7094998820584, 0.02986787021856,
          0.3892684188482, 0.3504296693813, 0.8518621630902,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-0.808320084606, 0.8078429422877, 1.2978585013];
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
     * @tc.name testSensorVariationConcurrencyInputsTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_CONCURRENCY_INPUTS_0600
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 83
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationConcurrencyInputsTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.4909876517078, -0.8505614557936, -0.1883516280489, 0, 0.5272179941391, 0.4622292559392, -0.7130114316123, 0,
          0.6935216741576, 0.2507774409153, 0.6753801615398, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          -0.01100931866301, -0.05006376670244, -0.9986853429215, 0, 0.3571501337272, -0.9330641830243,
          0.04283704396767, 0, -0.9339821073668, -0.3562089971081, 0.02815268189662, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-3.017201107886, -1.068135631185, 1.195529849966];
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
     * @tc.name testSensorVariationConcurrencyInputsTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_CONCURRENCY_INPUTS_0700
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 84
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationConcurrencyInputsTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.5078358577293, -0.3961045070132, -0.7649862489798, -0.7888465521366, -0.5706564607086, -0.2281936042786,
          -0.3461558302072, 0.7193416596968, -0.6022654878359,
        ];
        const previous: number[] = [
          0.9008142832438, -0.3082512816489, -0.3058018549089, 0.2346652711878, 0.9381865087266, -0.2544371933146,
          0.3653297655575, 0.1574395827143, 0.9174676780097,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-2.491911488221, -1.184467186549, 2.334408409748];
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
     * @tc.name testSensorVariationConcurrencyInputsTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_CONCURRENCY_INPUTS_0800
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 85
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationConcurrencyInputsTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.9805409798512, -0.01159349490133, -0.195971879892, 0, 0.002878310055585, 0.9989963967245, -0.04469803869046,
          0, 0.1962934083551, 0.04326419082246, 0.979590275385, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.1903859247089, -0.3071810764186, 0.932412454852, 0, -0.8462318825125, 0.4301047967244, 0.3144860328441, 0,
          -0.497639227445, -0.8489108611185, -0.1780605211238, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-1.142784597802, -0.3001430350354, -1.969888197287];
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
     * @tc.name testSensorVariationConcurrencyInputsTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_CONCURRENCY_INPUTS_0900
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 86
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationConcurrencyInputsTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.3068562157625, 0.9464638248217, 0.1002271976648, 0.3855627890669, -0.02733876292603, -0.9222764920178,
          -0.8701612485826, 0.3216501520993, -0.3733103013843,
        ];
        const previous: number[] = [
          0.8591975349485, 0.485459793086, -0.1615808937815, 0.3104603294371, -0.2436478654791, 0.9188308339914,
          0.4066865866784, -0.8396216451143, -0.3600576527051,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [1.36420651871, 0.2982655376903, -2.438553286135];
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
     * @tc.name testSensorVariationConcurrencyInputsTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_CONCURRENCY_INPUTS_1000
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 87
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationConcurrencyInputsTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.06762882158231, -0.9843539594007, 0.1627071759437, 0, 0.9914943113989, -0.08448385781013,
          -0.09900256680111, 0, 0.1111996985386, 0.1546278124455, 0.9816948948952, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.9440543750358, -0.2318387440289, -0.2345466557912, 0, 0.1757802421816, 0.9554898243602, -0.2369398700151, 0,
          0.2790387848208, 0.1824554529503, 0.9427870195619, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-1.378204364368, -0.407892506491, 0.1247568230002];
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
     * @tc.name testSensorVariationConcurrencyInputsTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_CONCURRENCY_INPUTS_1100
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 88
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationConcurrencyInputsTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.8535653853963, 0.463486986545, -0.2379200415198, -0.3203253685368, 0.8270435934744, 0.4619421530503,
          0.4108744225735, -0.318086006917, 0.8544024233805,
        ];
        const previous: number[] = [
          -0.25916125159, 0.5194335970182, -0.814262969785, 0.9055717232956, -0.1624516549921, -0.391853689223,
          -0.3358203383383, -0.8389268133032, -0.4282832033588,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [1.101269391264, 0.6007356508333, 2.013269103938];
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
     * @tc.name testSensorVariationConcurrencyInputsTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_CONCURRENCY_INPUTS_1200
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 89
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationConcurrencyInputsTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.8336539577386, -0.3172547390012, -0.4520735662789, 0, -0.4454821616196, -0.09755391856077, 0.889960042166,
          0, -0.3264455887671, 0.9433094208979, -0.06000511661321, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.5093260088512, 0.7725179817891, 0.3792136396811, 0, -0.6815500051495, 0.631141560484, -0.3703375772326, 0,
          -0.5254299260495, -0.0698304979379, 0.8479664464879, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-2.133419355279, -0.7976477724569, 2.482003903355];
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
     * @tc.name testSensorVariationConcurrencyInputsTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_CONCURRENCY_INPUTS_1300
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 90
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationConcurrencyInputsTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.8538193588588, -0.5135464147357, 0.08522078590335, 0.3998235214171, 0.7517653624705, 0.5243948812786,
          -0.3333671461911, -0.4136652266043, 0.8471997557476,
        ];
        const previous: number[] = [
          0.6320196571436, -0.568812242263, 0.5263114914533, 0.7536183796948, 0.2928691327103, -0.5884615610996,
          0.1805837500172, 0.7685572874921, 0.6137664092083,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [0.7106444613062, 1.311474960037, -0.03699634048049];
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
     * @tc.name testSensorVariationConcurrencyInputsTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_CONCURRENCY_INPUTS_1400
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 91
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationConcurrencyInputsTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.4632767639184, 0.1421660299353, 0.8747362230671, 0, -0.8718558497375, 0.2500693770564, 0.4211088742085, 0,
          -0.1588773655743, -0.957733849559, 0.2397996165908, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          -0.7891549462367, 0.2535876060759, -0.5593994966701, 0, -0.5139551299415, 0.2260199157623, 0.8275053607595, 0,
          0.3362805305648, 0.940536189481, -0.04803208343956, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-2.533333153116, -0.1742891457944, 1.726139566246];
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
     * @tc.name testSensorVariationConcurrencyInputsTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_CONCURRENCY_INPUTS_1500
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 92
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationConcurrencyInputsTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.1509854984024, -0.7746843110739, -0.614058301343, -0.6536124576798, 0.5442530239733, -0.525908167898,
          0.7416158941379, 0.3219516486555, -0.5885176305685,
        ];
        const previous: number[] = [
          0.993821240229, 0.04643505821944, -0.1008123397098, -0.05709949475823, 0.992766142027, -0.1056173988662,
          0.09517872749704, 0.1107211479938, 0.98928349689,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-0.9594099422024, -0.3459776969168, -2.087521436559];
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
     * @tc.name testSensorVariationConcurrencyInputsTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_CONCURRENCY_INPUTS_1600
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 93
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationConcurrencyInputsTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.9956041029959, -0.0356965749307, 0.08659228970244, 0, 0.04456061156089, 0.9937143692352, -0.1026942270665,
          0, -0.08238217037086, 0.106101399207, 0.9909367644261, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.8181474208914, 0.3947194169515, 0.4181284247336, 0, 0.5655975598206, -0.4214097346496, -0.7088816797375, 0,
          -0.1036059747972, 0.8164621347154, -0.5680276265837, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [2.15657595166, 0.8940591073606, -2.38146343143];
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
     * @tc.name testSensorVariationConcurrencyInputsTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_CONCURRENCY_INPUTS_1700
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 94
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationConcurrencyInputsTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.4587429908838, -0.6621034098137, 0.5925993106882, 0.4092737278871, -0.7494029892337, -0.5204711090819,
          0.7887013908802, 0.00377285577983, 0.6147648994396,
        ];
        const previous: number[] = [
          0.5052850781087, -0.7837074039583, 0.3612335737741, -0.1293090628485, 0.345114162984, 0.929610338138,
          -0.8532093272497, -0.5164290072108, 0.0730405668465,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-0.7504513811273, 1.209816411923, -2.260966943817];
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
  });
}
