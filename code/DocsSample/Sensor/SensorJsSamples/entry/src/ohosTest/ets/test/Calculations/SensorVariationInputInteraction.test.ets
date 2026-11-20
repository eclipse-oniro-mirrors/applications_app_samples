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

export default function sensorVariationInputInteractionTest(): void {
  describe('SensorVariationInputInteraction', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorVariationInputInteractionTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_INPUT_INTERACTION_0100
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 95
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationInputInteractionTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.5334686732381, 0.806552421397, 0.2547240982164, 0, -0.3172083263537, 0.4699546919385, -0.8237241438837, 0,
          -0.7840854879192, 0.3586304212747, 0.5065512496983, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.7990355284926, 0.4393354503833, -0.4105198974995, 0, -0.2584409719197, 0.8673935105004, 0.4252490587585, 0,
          0.5429092817772, -0.2336939451039, 0.8066205128696, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [0.8137162108294, -0.158685771719, 1.617664730436];
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
     * @tc.name testSensorVariationInputInteractionTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_INPUT_INTERACTION_0200
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 96
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationInputInteractionTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.5072947268025, -0.62422430352, -0.594134731398, 0.6382120692661, 0.7354094505574, -0.2277241635706,
          0.579083253774, -0.2636606890035, 0.7714568207442,
        ];
        const previous: number[] = [
          -0.5174169292575, 0.350636893029, 0.78059816203, 0.4710796563086, -0.6448239061668, 0.6019020580194,
          0.7143974235185, 0.6791582284584, 0.1684648983834,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [2.637537209322, 0.08915953428407, -2.06321953141];
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
     * @tc.name testSensorVariationInputInteractionTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_INPUT_INTERACTION_0300
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 97
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationInputInteractionTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.1061592112895, -0.04513879557052, 0.9933240714857, 0, -0.5215596432702, -0.8530459226976, 0.0169762269305,
          0, 0.8465847626613, -0.5198799312374, -0.1141012564627, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.8571690629772, -0.4313466434789, -0.2814272030815, 0, 0.5118391260844, 0.7742113992911, 0.3723136019766, 0,
          0.05728792616214, -0.4631811550215, 0.8844101487144, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-2.240801011985, 0.8705514376639, -2.190259311998];
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
     * @tc.name testSensorVariationInputInteractionTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_INPUT_INTERACTION_0400
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 98
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationInputInteractionTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.924068029143, 0.2524877943413, -0.286963745488, -0.2888783841974, 0.9529577993882, -0.09176443607786,
          0.2502949393402, 0.1676942047117, 0.953536101596,
        ];
        const previous: number[] = [
          -0.005525407559237, 0.8358476695424, 0.5489336418838, -0.4557092099916, 0.4865223858681, -0.7454026321244,
          -0.8901115580646, -0.2542727696189, 0.3782152466919,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-0.7467121007176, 0.5332255135209, -1.250033641273];
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
     * @tc.name testSensorVariationInputInteractionTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_INPUT_INTERACTION_0500
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 99
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationInputInteractionTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.234541975254, -0.8042562876938, 0.5460420181167, 0, -0.5139472715823, 0.3741962270059, 0.7719037412318, 0,
          -0.825135300346, -0.4616806335548, -0.3255806024986, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.2150955775256, -0.9759025450566, -0.03671668668178, 0, -0.3032748962095, -0.03101147457991,
          -0.9523983545626, 0, 0.9283093395297, 0.2159919234517, -0.3026371740973, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-0.8152800335754, 0.1882422869715, -2.302966088308];
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
     * @tc.name testSensorVariationInputInteractionTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_INPUT_INTERACTION_0600
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationInputInteractionTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.262208391339, 0.3696718478708, -0.8913974895652, 0.8404906069759, 0.3663801266821, 0.3991755783584,
          0.4741542988277, -0.8538784033246, -0.2146377721629,
        ];
        const previous: number[] = [
          0.9825331753277, 0.1815258247721, 0.04095038853707, -0.1820574821616, 0.9832408367944, 0.009619254072206,
          -0.03851795126309, -0.01690656087845, 0.9991148760927,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [0.640694165325, 0.987152334556, -2.035795266737];
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
     * @tc.name testSensorVariationInputInteractionTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_INPUT_INTERACTION_0700
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 101
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationInputInteractionTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.9483512478857, 0.2703993012239, -0.165873833172, 0, -0.3116134050172, 0.8919725932174, -0.3275392781983, 0,
          0.05938852117311, 0.3623107931689, 0.9301633688263, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.2682637253205, -0.9616368138556, -0.05735165136944, 0, -0.7347055379757, -0.1657248201656, -0.6578320883394,
          0, 0.6230909613732, 0.2186090625265, -0.7509778502967, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-2.314795923812, 1.064122462545, -2.921382194438];
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
     * @tc.name testSensorVariationInputInteractionTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_INPUT_INTERACTION_0800
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 102
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationInputInteractionTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.3946278164549, 0.8116590233624, 0.4306721679821, 0.4580499820722, -0.2325422184372, 0.8579710546213,
          0.7965294096288, 0.5358486226899, -0.2800127732044,
        ];
        const previous: number[] = [
          0.3444808760951, 0.6469664081507, 0.6802700880748, -0.3613840233463, 0.7601671789886, -0.539951338232,
          -0.8664493716743, -0.05983583134773, 0.4956663793442,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-0.3080883786982, -1.232468465758, 2.768548353646];
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
     * @tc.name testSensorVariationInputInteractionTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_INPUT_INTERACTION_0900
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 103
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationInputInteractionTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.6117292295107, -0.4955612199585, 0.6166088119996, 0, 0.6730479025106, 0.7356315420416, -0.07650330240907, 0,
          -0.415684821335, 0.4618065738236, 0.7835437560755, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.7037504694673, -0.4822608606375, -0.5216893127348, 0, 0.7092119616276, 0.5201678773646, 0.4758610856566, 0,
          0.04187684573647, -0.7048757632769, 0.7080935588861, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [0.5759590239393, -1.209925437301, 0.9797937023204];
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
     * @tc.name testSensorVariationInputInteractionTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_INPUT_INTERACTION_1000
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 104
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationInputInteractionTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.5952051223767, 0.6114583565775, -0.5213919259713, -0.7537648555499, 0.1999489442297, -0.625986391417,
          -0.2785128450078, 0.7655972164742, 0.5799064556397,
        ];
        const previous: number[] = [
          -0.4867345165712, 0.6584688263062, 0.5740281484048, 0.001088455168193, -0.6566634888249, 0.75418292059,
          0.8735492691563, 0.3677116631644, 0.3189040719861,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [0.5915288570342, -0.8419518031467, 2.647861681507];
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
     * @tc.name testSensorVariationInputInteractionTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_INPUT_INTERACTION_1100
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 105
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationInputInteractionTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.7085713784086, -0.2722800947202, -0.6509916679338, 0, 0.6572736019149, 0.08099820561862, -0.7492867961684,
          0, 0.2567450368086, -0.9588028163839, 0.1215695083827, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.9476174499109, 0.2370781721103, -0.2140446423839, 0, -0.1968784101783, 0.9612332455523, 0.1930532031607, 0,
          0.2515155268172, -0.1407998151765, 0.9575569705329, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-1.290471167948, 1.005054648081, -1.362025477647];
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
     * @tc.name testSensorVariationInputInteractionTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_INPUT_INTERACTION_1200
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 106
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationInputInteractionTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.9986625290948, -0.01753025886654, -0.04863993221762, 0.01511256630544, 0.9986530309557, -0.0496360161853,
          0.04944454794743, 0.04883455525707, 0.9975822887818,
        ];
        const previous: number[] = [
          0.1559006583805, -0.9849986097268, 0.07397785853045, -0.03960473145604, 0.06860009913047, 0.9968578091411,
          -0.986978444528, -0.1583406619776, -0.0283158048034,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-0.8590844103298, -1.451020371195, -2.319388275938];
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
     * @tc.name testSensorVariationInputInteractionTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_INPUT_INTERACTION_1300
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 107
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationInputInteractionTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.5179192930916, 0.3203168767341, 0.7931939890864, 0, 0.5675722233716, 0.8224239990474, 0.03847774743755, 0,
          -0.6400167006418, 0.4701232437034, -0.6077522181196, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.6097440808798, 0.6621290982022, -0.4356572197795, 0, -0.3914282532667, -0.2263944162443, -0.8919245993009,
          0, -0.689199592554, 0.7143742895761, 0.1211333810971, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-0.8943676459534, 0.9547008940734, 2.473169859612];
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
     * @tc.name testSensorVariationInputInteractionTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_INPUT_INTERACTION_1400
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 108
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationInputInteractionTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.7249619343729, 0.2033338316749, 0.6580923541622, -0.6862695471792, 0.1315858328365, 0.7153455648924,
          0.05885832417541, -0.9702270463624, 0.234936536499,
        ];
        const previous: number[] = [
          0.9397199348897, -0.01415132851829, -0.3416521386909, -0.1206527934952, 0.9211589857373, -0.3700121976602,
          0.3199521017164, 0.3889291232303, 0.8639240647827,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-2.66044142006, 1.274280374418, -2.944932563881];
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
     * @tc.name testSensorVariationInputInteractionTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_INPUT_INTERACTION_1500
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 109
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationInputInteractionTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.7161743805678, -0.3694976642183, -0.5920859167008, 0, 0.5292346947038, 0.8405654741629, 0.115586857242, 0,
          0.4549779055515, -0.3961327552506, 0.7975424413017, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          -0.9342409802493, -0.09314265219483, -0.3442647777001, 0, -0.3430183659222, 0.4989256642234, 0.7958715865134,
          0, 0.09763294250836, 0.8616249926281, -0.4980664419691, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [0.1603747530403, -1.45660841068, 2.668063848864];
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
     * @tc.name testSensorVariationInputInteractionTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_INPUT_INTERACTION_1600
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 110
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationInputInteractionTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.4311889098975, 0.679025814028, -0.5941380882127, 0.4681671884841, -0.3945351825221, -0.7906715331787,
          -0.7712947605217, -0.6190847548082, -0.1477784109937,
        ];
        const previous: number[] = [
          0.8224308068042, -0.4260279814342, 0.3769717854886, 0.5687862246049, 0.6268788868015, -0.5324519621357,
          -0.009476218603308, 0.6523212554544, 0.7578833557767,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [2.794767373304, 0.003149431118345, 1.485670618139];
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
     * @tc.name testSensorVariationInputInteractionTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_INPUT_INTERACTION_1700
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 111
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationInputInteractionTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.877347372908, 0.464812643297, 0.1192090344005, 0, -0.475800920745, 0.8104342143724, 0.3417745865228, 0,
          0.06225006883296, -0.3565748039414, 0.932190612549, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.1618874301759, 0.9192381166267, 0.3588784542037, 0, -0.7913997191721, 0.3381829040895, -0.5092335494405, 0,
          -0.5894734467686, -0.2015777971954, 0.7822323486232, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-0.4314105989345, 0.5524958769349, -0.7919779896655];
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
     * @tc.name testSensorVariationInputInteractionTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_INPUT_INTERACTION_1800
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 112
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationInputInteractionTest0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.09605266164268, -0.2979380080563, 0.9497404011343, 0.9590137032956, 0.2832428708133, -0.008135909578944,
          -0.266583201051, 0.9115955350312, 0.3129328640915,
        ];
        const previous: number[] = [
          -0.1751257835837, 0.1806377271371, -0.967833132032, 0.9741350203076, -0.1107885249256, -0.1969438116702,
          -0.1428002875858, -0.9772900870671, -0.1565636087533,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [2.941539868407, -0.08996998756837, 2.89812179007];
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
     * @tc.name testSensorVariationInputInteractionTest0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_INPUT_INTERACTION_1900
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 113
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationInputInteractionTest0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.1252423441011, -0.3893193495457, -0.9125485188818, 0, -0.9437178507323, 0.2370549854972, -0.2306546163858,
          0, 0.3061224811301, 0.890076051762, -0.3377182977373, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.9997567126807, -0.01654775138434, -0.01458380519866, 0, 0.01639400960858, 0.9998094285215,
          -0.01059920225627, 0, 0.01475641890515, 0.01035753656221, 0.999837471561, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-0.974405606794, -1.104182116929, -2.368237043482];
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
     * @tc.name testSensorVariationInputInteractionTest0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_INPUT_INTERACTION_2000
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 114
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationInputInteractionTest0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.9738069690572, -0.03253098997998, 0.2250371562799, -0.0005409476706636, 0.9893781421107, 0.145363679402,
          -0.2273756679841, -0.1416778973749, 0.963445732257,
        ];
        const previous: number[] = [
          0.5930905406284, 0.6147044704214, 0.519982715733, -0.04061173589642, -0.6221699824335, 0.7818281140162,
          0.8041108739002, -0.4848122595424, -0.3440389156372,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-2.844743068934, -0.9362670076125, -1.741664057173];
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
     * @tc.name testSensorVariationInputInteractionTest0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_INPUT_INTERACTION_2100
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 115
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationInputInteractionTest0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.5182758919576, -0.4430181240673, -0.7315224135756, 0, -0.777490282948, -0.6003711109017, -0.1872522072397,
          0, -0.3562288025091, 0.6657998730419, -0.6556001596403, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.4595226643321, -0.4367759854192, 0.7733470498594, 0, -0.4537592608996, 0.6330592927951, 0.6271670151991, 0,
          -0.7635060275551, -0.6391108435685, 0.09271394458291, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-2.518872962633, 0.7173774842584, 2.981881558049];
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
  });
}
