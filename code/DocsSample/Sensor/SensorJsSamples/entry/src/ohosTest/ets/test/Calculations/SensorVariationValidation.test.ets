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

export default function sensorVariationValidationTest(): void {
  describe('SensorVariationValidation', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorVariationValidationTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_0100
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 133
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.1382504877669, 0.9837037900848, 0.1149506677013, 0, -0.1469010408135, 0.135148831689, -0.9798749295196, 0,
          -0.9794421304192, 0.1185818142292, 0.1631915025178, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          -0.4165403915244, 0.9011957400854, -0.11975115983, 0, -0.1440010378129, 0.06465587543115, 0.9874630721607, 0,
          0.8976401301956, 0.4285625459885, 0.1028413381784, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-0.3287871520099, -0.02785352461409, 2.8760385941];
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
     * @tc.name testSensorVariationValidationTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_0200
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 134
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.3195603951747, -0.3978707743451, -0.859988372455, 0.7877957977425, 0.3927767760728, -0.4744514571978,
          0.5265538290574, -0.8291111210808, 0.1879250222963,
        ];
        const previous: number[] = [
          0.99630732836, -0.07792348179574, 0.03605049848501, 0.08004289103142, 0.9948830173197, -0.06165158103558,
          -0.03106192285614, 0.06430950811259, 0.9974464617787,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-0.7440996688825, 1.046252922522, -1.190948486132];
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
     * @tc.name testSensorVariationValidationTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_0300
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 135
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.9880790801172, 0.1334711768952, 0.07671490319955, 0, -0.1522333969603, 0.9212699269866, 0.357892043052, 0,
          -0.02290686108184, -0.3653042109917, 0.9306063126517, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.01615533089278, 0.1035207000153, -0.9944960884549, 0, 0.8827421283628, -0.4685940431337, -0.03443773443565,
          0, -0.4695799613454, -0.8773272407762, -0.09895237488234, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [1.669159922131, 0.1286700425173, 1.754029548129];
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
     * @tc.name testSensorVariationValidationTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_0400
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 136
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.8902755454955, -0.2737873866947, -0.3639366977644, -0.246313926286, 0.9616222741072, -0.1208803195666,
          0.3830651417322, -0.01797411549589, -0.9235464408257,
        ];
        const previous: number[] = [
          0.3677170220951, 0.5835813722167, 0.7240282961758, -0.01243610170896, 0.7815935233261, -0.6236640984288,
          -0.9298545773592, 0.2203278155304, 0.2946627201866,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-0.1617456456359, 0.9327406894347, 2.453878681788];
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
     * @tc.name testSensorVariationValidationTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_0500
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 137
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.7192708646905, 0.0347217231789, 0.6938615316811, 0, -0.4914616009036, 0.7313463587314, 0.4728615002383, 0,
          -0.4910345385455, -0.6811217993207, 0.5431005214926, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.8238126327586, -0.1764839857837, -0.538689287873, 0, -0.2719336455041, 0.710776671603, -0.6487284605656, 0,
          0.4973779634746, 0.6809184428893, 0.5375548675094, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-1.473067482048, 1.033879468458, 2.433677672569];
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
     * @tc.name testSensorVariationValidationTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_0600
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 138
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.383163533011, -0.5881378204757, -0.7122356429558, 0.8848631671663, 0.4549059551712, 0.1003879840529,
          0.2649582653229, -0.6686961014361, 0.6947248675276,
        ];
        const previous: number[] = [
          -0.6473826533901, -0.1603013108916, -0.7451168967457, 0.4429731583751, -0.8746924613741, -0.1966923459988,
          -0.62021809152, -0.4574019979644, 0.637269904522,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [1.568550202614, 0.07746243733591, 0.2958696752747];
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
     * @tc.name testSensorVariationValidationTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_0700
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 139
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.08912682098295, 0.1223709552841, -0.9884744605119, 0, -0.7431049705582, -0.6689879253106,
          -0.01581640035816, 0, -0.6632129465814, 0.7331306193929, 0.1505592321825, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.9429209012826, -0.2617435951127, -0.2058894468928, 0, 0.1906832805078, 0.9312275015245, -0.3105724181883, 0,
          0.2730202564997, 0.2535855493162, 0.9279840024046, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [2.760458938867, -1.040995606412, 0.8108212879221];
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
     * @tc.name testSensorVariationValidationTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_0800
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 140
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.9906413257083, 0.1008614108316, -0.09196053286069, -0.09446911976138, 0.992963509665, 0.07140765985035,
          0.0985157307767, -0.06205194822774, 0.9931989762936,
        ];
        const previous: number[] = [
          -0.3174552744676, 0.7553643623649, 0.5732772704213, -0.6042826481774, 0.304758797454, -0.7361824206582,
          -0.730797256306, -0.5801264995184, 0.3597062895365,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-0.9553866776771, 0.7691172083846, -1.212499733158];
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
     * @tc.name testSensorVariationValidationTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_0900
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 141
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.2282601328778, -0.03899962466611, 0.9728187606202, 0, 0.973234155204, 0.01825622097401, 0.2290894793309, 0,
          -0.02669439797041, 0.9990724396517, 0.03378859933982, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.2989163897025, -0.4638466340223, -0.8339636035664, 0, 0.851334350635, -0.265210431357, 0.4526513564858, 0,
          -0.4311366551294, -0.84528677217, 0.3156128283169, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-2.667200622919, -0.3640995831145, -2.41257099933];
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
     * @tc.name testSensorVariationValidationTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_1000
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 142
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.7386610720875, 0.4745091075262, -0.4787702240712, -0.5279650847165, -0.03431748653321, -0.8485724361764,
          -0.4190855400785, 0.8795813873615, 0.2251752497598,
        ];
        const previous: number[] = [
          0.9159403691517, 0.34543043099, -0.2042818090394, -0.3033887706483, 0.9292208744553, 0.2109592859325,
          0.2626946782919, -0.1312493193227, 0.9559106245745,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [1.54628263679, -0.8280707905828, 1.371282817774];
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
     * @tc.name testSensorVariationValidationTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_1100
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 143
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.7781334493338, 0.0190333807929, -0.6278105330779, 0, 0.1762430458198, 0.9527682502065, 0.2473278192979, 0,
          0.6028654276272, -0.3031012896939, 0.7380263439457, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          -0.2417667280752, 0.9577737752047, 0.1556221215825, 0, 0.7311018326661, 0.07435201740885, 0.6782049010288, 0,
          0.6379960497276, 0.2777429981787, -0.7182060063065, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [1.560997730754, -1.048795513112, 2.745535159198];
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
     * @tc.name testSensorVariationValidationTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_1200
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 144
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.04435883928186, -0.9645304353876, -0.260217856014, -0.9269663231923, -0.05738671061702, 0.3707292827818,
          -0.3725127233329, 0.2576583098903, -0.8915416234252,
        ];
        const previous: number[] = [
          0.7798462078339, -0.2816470320917, 0.5590302688057, -0.1788921066235, 0.7555390664568, 0.6302049930343,
          -0.599864573312, -0.5914690764288, 0.5388198449516,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-1.48633068065, 0.451744486797, 2.021884996309];
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
     * @tc.name testSensorVariationValidationTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_1300
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 145
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.7602612637524, -0.5603311258576, 0.3286819743046, 0, 0.550362358641, 0.8243694820338, 0.1323488998159, 0,
          -0.3451145969512, 0.08027444479076, 0.9351213442568, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.7510330443072, -0.3021376205292, 0.5870794023125, 0, 0.6586517555963, 0.2807228709367, -0.6981207163399, 0,
          0.0461219167921, 0.9109926058943, 0.4098356265595, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [0.2595947522068, 1.058393427462, 0.1625138555433];
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
     * @tc.name testSensorVariationValidationTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_1400
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 146
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.438700135973, 0.4072584278005, 0.8010510368777, -0.884412710723, 0.03771471727003, 0.4651792742726,
          0.1592367665109, -0.9125339298277, 0.3767299816904,
        ];
        const previous: number[] = [
          -0.1224609704001, -0.3540109156439, -0.9271890758274, -0.9822072362745, -0.09079425778031, 0.1643938799475,
          -0.1423806719282, 0.9308236537385, -0.3365933301511,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [3.098479977895, 0.06429695477536, 2.48930961675];
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
     * @tc.name testSensorVariationValidationTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_1500
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 147
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.4953866969509, -0.3671424101382, -0.7872728060602, 0, 0.7924620117624, 0.1802076717958, -0.5826913032983,
          0, 0.3558032889078, -0.9125413117793, 0.2016739296453, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.9947842963987, 0.07310906306242, -0.07112853531945, 0, -0.07493227361093, 0.9969161987227,
          -0.02330766173929, 0, 0.06920518773944, 0.02851591875412, 0.9971948076317, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-1.291375299298, 1.093123968458, -0.9412021339878];
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
     * @tc.name testSensorVariationValidationTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_1600
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 148
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.9887385507066, 0.1201371220542, 0.08923648497806, -0.1088390252638, 0.9865202239684, -0.1221962122204,
          -0.1027138984088, 0.1111076937296, 0.9884861837516,
        ];
        const previous: number[] = [
          0.1630176375128, -0.3937334411121, 0.9046542031128, 0.7052600238354, -0.5947044960578, -0.3859207964704,
          0.6899518451599, 0.7009283413578, 0.1807371340979,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [2.182973087536, 0.2546997248348, -1.248483196291];
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
     * @tc.name testSensorVariationValidationTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_1700
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 149
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.02226267118147, 0.5244429242006, 0.8511545057907, 0, -0.2940007607271, -0.8102861734151, 0.5069515458741, 0,
          0.9555458786284, -0.2615261677695, 0.1361474840313, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.01200248176368, 0.7867950089739, 0.6170976861772, 0, -0.8049535164131, 0.3737279210302, -0.4608440923529, 0,
          -0.5932164671059, -0.4912036796444, 0.6378190717266, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [1.285935499493, -0.5588856547822, -1.10808630428];
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
     * @tc.name testSensorVariationValidationTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_1800
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 150
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.5876679282381, 0.1434292565537, 0.7962879218504, 0.5188626584904, 0.6883469977746, -0.5069121741279,
          -0.620828436643, 0.7110600952235, 0.3300993687304,
        ];
        const previous: number[] = [
          0.8283742453275, -0.1421920955958, -0.5418279409814, 0.3976219998041, 0.8305689915068, 0.3899383228398,
          0.3945793392335, -0.5384575733495, 0.744560666939,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [1.325568343298, -0.8039842936655, 2.15613662687];
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
     * @tc.name testSensorVariationValidationTest0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_1900
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 151
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.6815973612398, -0.4029955040466, -0.6107533551845, 0, -0.1121671680162, 0.767265032929, -0.631445085232, 0,
          0.723079223578, 0.4988977780694, 0.4777629574039, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          -0.5859570150318, -0.7285068104677, 0.3548692768292, 0, -0.7987893243055, 0.4455881989057, -0.4042112966897,
          0, 0.1363451205971, -0.5203162347056, -0.8430189938496, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-0.6876084212693, 1.062815042728, 2.417159220621];
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
     * @tc.name testSensorVariationValidationTest0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_2000
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 152
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.3002940555432, -0.1207902297109, 0.9461676387469, -0.720583027489, -0.6212040277719, -0.3080026889084,
          0.6249668636818, -0.7742837182108, 0.09950448740323,
        ];
        const previous: number[] = [
          0.9655678142104, -0.09364616046026, -0.2427121603711, 0.2154694137072, 0.8106767483566, 0.5444043914505,
          0.1457797239592, -0.5779564051942, 0.8029412592322,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-1.693422989796, 1.19597564642, -2.620026069082];
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
     * @tc.name testSensorVariationValidationTest0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_2100
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 153
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.9642080534172, 0.2048658367191, -0.1683235535234, 0, -0.23985393552, 0.9445226828304, -0.2243813522432, 0,
          0.113017340886, 0.2567233736229, 0.959854254611, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.1155128342277, 0.1100045726414, 0.9871959172964, 0, -0.8695557131904, 0.4915962071785, 0.04696840156477, 0,
          -0.4801350297433, -0.8638473031072, 0.1524407758042, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-1.290517705454, -0.2897791067216, -1.602509884762];
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
     * @tc.name testSensorVariationValidationTest0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_2200
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 154
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.3867027715747, -0.7541302906373, 0.5307998409945, 0.5307695811104, 0.2886884400033, 0.7968328785739,
          -0.754151588359, 0.5898698918845, 0.2886327985933,
        ];
        const previous: number[] = [
          -0.1395575017464, -0.989760570971, -0.02996190677406, 0.09147714909238, 0.01724203522369, -0.9956578947687,
          0.98597953067, -0.1416923582011, 0.08813421995563,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [0.8182933899733, 0.2144929450282, 2.501803484724];
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
     * @tc.name testSensorVariationValidationTest0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_2300
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 155
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.2923009643756, 0.9530558691863, 0.07902313860336, 0, -0.2387195318131, -0.007301090673204, 0.9710611099235,
          0, 0.9260524452514, -0.3027064655481, 0.2253789350391, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.9829785144859, 0.1837057077613, 0.002335164864512, 0, -0.1813004413421, 0.9720078720369, -0.1494350918207,
          0, -0.02972187793811, 0.1464681181495, 0.9887687800176, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [1.440983339224, 0.3004919209383, -1.48912861241];
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
     * @tc.name testSensorVariationValidationTest0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_2400
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 156
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.8671707705809, -0.4735159691832, -0.1542643237391, 0.4882235929029, 0.8694240299335, 0.07576001258735,
          0.09824753423461, -0.1410123508872, 0.9851207737704,
        ];
        const previous: number[] = [
          -0.616314837349, -0.001810175058323, -0.7874977743015, -0.7675217151524, -0.2224367880333, 0.6011923919171,
          -0.1762567389721, 0.9749454336504, 0.1357017441717,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-2.325939791455, -1.068435469529, 0.8962586591687];
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
     * @tc.name testSensorVariationValidationTest0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_2500
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 157
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.01198774985635, 0.8545357644765, -0.5192541969824, 0, 0.9827799786104, -0.1058282399524, -0.1514724307297,
          0, -0.1843903671453, -0.508496814994, -0.8410892828024, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.6017427037401, -0.1499611280451, 0.7844854227906, 0, 0.6756803793982, 0.6193041000089, -0.3998980577702, 0,
          -0.4258658748852, 0.7706971466066, 0.4739875154692, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [2.297081555577, -0.4911839727588, 2.578082378175];
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
     * @tc.name testSensorVariationValidationTest0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_2600
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 158
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.6868083085835, -0.2231136464722, 0.6917475319931, -0.09369533768512, 0.9166031950505, 0.3886640792759,
          -0.7207742579732, -0.3317512374976, 0.6086259815864,
        ];
        const previous: number[] = [
          0.4575431720665, 0.5921325479855, -0.6633500518666, -0.3555377407721, 0.805616114496, 0.4738940714453,
          0.8150135953356, 0.01901898210914, 0.5791296208429,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-0.8609993407035, -0.4009012611993, 1.486208295024];
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
     * @tc.name testSensorVariationValidationTest0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_2700
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 159
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.7335370916402, 0.3446092806327, -0.5858052397255, 0, -0.6642457318444, 0.1810384187284, -0.7252604350651, 0,
          -0.1438782225164, 0.9211240603991, 0.3617036389634, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.7068154402113, 0.7068993482969, 0.02655644660382, 0, 0.6032755364783, -0.6219585877462, 0.4992255424311, 0,
          0.369419220623, -0.3368394669663, -0.866065016571, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [1.823902360984, 0.7729118377693, 2.876556990758];
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
     * @tc.name testSensorVariationValidationTest0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_2800
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 160
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.1602083098748, -0.94729851022, 0.2774145453684, -0.0518761630834, -0.2725759535809, -0.960734725735,
          0.9857191086465, -0.1683088888453, -0.005473279169123,
        ];
        const previous: number[] = [
          0.951225370382, 0.1402276828992, -0.2747844458667, -0.1537228321513, 0.9877145068643, -0.02809526303959,
          0.2674688498067, 0.06896557024057, 0.961095294185,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-1.999865938052, -0.1064007573084, -1.625631200992];
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
     * @tc.name testSensorVariationValidationTest0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_2900
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 161
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.9998042781825, -0.01391735604275, -0.01406102872489, 0, 0.01380296840437, 0.9998711136488,
          -0.008199643529843, 0, 0.01417333380863, 0.008003954745486, 0.9998675178828, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.1409945368748, -0.9887932393293, -0.04907616965545, 0, 0.01833109240491, -0.04695541688609, 0.9987287719277,
          0, -0.9898406496112, -0.1417149204623, 0.01150520298188, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [2.900367291715, -1.535443306737, 1.457256572734];
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
     * @tc.name testSensorVariationValidationTest0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_3000
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 162
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.0348716092674, 0.9090685017485, -0.4151848142645, -0.06537577263257, -0.4166226409218, -0.9067257487377,
          -0.9972512116913, -0.004475958004823, 0.07395935762391,
        ];
        const previous: number[] = [
          0.02624217238928, 0.8735717468789, 0.4859873984408, -0.8924382414478, -0.198569631315, 0.4051223108161,
          0.4504057432914, -0.4443450287494, 0.7743979350668,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [0.4211167983493, -0.2729221079459, 2.131176135654];
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
     * @tc.name testSensorVariationValidationTest0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_3100
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 163
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.1903651587877, -0.9795254773631, 0.06550530906947, 0, 0.7882401072049, 0.19228182608, 0.5845555856828, 0,
          -0.5851825695571, -0.05964510504531, 0.8087050276403, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.8828608296355, -0.4034225374474, -0.2404308877302, 0, 0.308416163159, 0.8841292996783, -0.3509912417036, 0,
          0.3541697697398, 0.2357236469466, 0.9049851581505, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-0.9827652552949, -0.1142896568889, 1.030607531052];
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
     * @tc.name testSensorVariationValidationTest0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_3200
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 164
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.811256910661, 0.4055257016694, -0.4212020063939, -0.08177628402516, 0.7920006922787, 0.6050186301273,
          0.5789428851586, -0.4563812098626, 0.6756784198186,
        ];
        const previous: number[] = [
          -0.4622584668422, 0.5715668742294, -0.6779590091712, 0.7923099439632, -0.07709965225158, -0.6052277226959,
          -0.3981985215062, -0.8169253037496, -0.417218151048,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [0.8524295967378, 0.5990523052302, 2.025233966981];
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
     * @tc.name testSensorVariationValidationTest0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_3300
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 165
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.9749499256874, -0.07971247317736, 0.2076500999808, 0, -0.059125774562, 0.9928668091392, 0.1035357044314, 0,
          -0.2144219792478, 0.08866465434216, -0.9727084835067, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.8213046356439, 0.5230876863565, 0.2276795288382, 0, -0.2851070315355, 0.7220309429542, -0.6303850394685, 0,
          -0.4941383167077, 0.4528251205476, 0.7421433380165, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-0.5016840747574, 0.6165641822305, 2.706565779414];
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
     * @tc.name testSensorVariationValidationTest0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_3400
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 166
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.9774865012834, 0.1800811868539, 0.1099586556394, -0.2109847665424, 0.8400348274519, 0.4998268869868,
          -0.002359681286838, -0.5117736362975, 0.8591170916092,
        ];
        const previous: number[] = [
          0.784477827911, 0.3861496125457, 0.4852659211679, 0.3868101006473, 0.3069540414541, -0.8695729770825,
          -0.4847396038631, 0.8698664800794, 0.09143206921472,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [1.734224905008, 0.7613189185286, -2.00222833599];
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
     * @tc.name testSensorVariationValidationTest0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_3500
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 167
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.08203801652948, -0.9156871472596, 0.3934295517464, 0, 0.407801847297, 0.3293580887876, 0.8515990269436, 0,
          -0.9093774888269, 0.2303047930323, 0.3463990258665, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          -0.5851603398448, 0.09407237097993, -0.805442589941, 0, 0.641724407503, 0.660947646206, -0.389021842304, 0,
          0.4957591769071, -0.7445123222573, -0.447128885803, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [1.617105396989, -0.5310395645027, -2.76881990622];
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

    /**
     * @tc.name testSensorVariationValidationTest0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_3600
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 168
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.02749131508094, 0.05193086595326, -0.9982722137556, -0.9952854831059, 0.09149847054799, 0.03216888257332,
          0.09301093867797, 0.9944502074256, 0.04917062372514,
        ];
        const previous: number[] = [
          0.9998285424834, 0.0134362463921, 0.01274177846722, -0.01366013497582, 0.9997509067821, 0.01765007367899,
          -0.01250145383782, -0.01782110185488, 0.9997630329136,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [0.4744880047693, -1.487000717451, -1.112800603788];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual176 = promiseResult.length;
        expect(assertionActual176).assertEqual(3);
        const assertionActual177 = callbackResult.length;
        expect(assertionActual177).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual178 = JSON.stringify(current);
        expect(assertionActual178).assertEqual(currentBefore);
        const assertionActual179 = JSON.stringify(previous);
        expect(assertionActual179).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual180 = JSON.stringify(current);
        expect(assertionActual180).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorVariationValidationTest0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_3700
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 169
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.9609677502212, -0.2376978887639, 0.1415651677215, 0, 0.2570622222504, 0.9563060878778, -0.1392755548527, 0,
          -0.1022741263786, 0.1702303732153, 0.9800824573006, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          -0.7182240983399, 0.6743494113303, -0.1714847398526, 0, -0.6957398165702, -0.6924518609461, 0.1909359261928,
          0, 0.01001260219512, 0.2564435448801, 0.966507349215, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-2.577339849673, -0.3983343699942, 0.2349378206557];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual181 = promiseResult.length;
        expect(assertionActual181).assertEqual(3);
        const assertionActual182 = callbackResult.length;
        expect(assertionActual182).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual183 = JSON.stringify(current);
        expect(assertionActual183).assertEqual(currentBefore);
        const assertionActual184 = JSON.stringify(previous);
        expect(assertionActual184).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual185 = JSON.stringify(current);
        expect(assertionActual185).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorVariationValidationTest0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_3800
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 170
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.2509225436734, -0.7052893575663, 0.6630269973238, -0.03808083371836, -0.677217855124, -0.7347964526347,
          0.9672578390376, -0.2096256158132, 0.1430712200799,
        ];
        const previous: number[] = [
          0.4490439988922, -0.867981091422, 0.2120573318532, 0.3273320880565, 0.3806359834134, 0.8648525609949,
          -0.8313923208615, -0.3189436832181, 0.455040367163,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-0.7127406577937, 0.9802623789454, -2.452592989741];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual186 = promiseResult.length;
        expect(assertionActual186).assertEqual(3);
        const assertionActual187 = callbackResult.length;
        expect(assertionActual187).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual188 = JSON.stringify(current);
        expect(assertionActual188).assertEqual(currentBefore);
        const assertionActual189 = JSON.stringify(previous);
        expect(assertionActual189).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual190 = JSON.stringify(current);
        expect(assertionActual190).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorVariationValidationTest0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_3900
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 171
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.6312465450159, 0.6027551047001, 0.4880718012377, 0, -0.1259357460266, 0.700604592227, -0.7023484841751, 0,
          -0.7652894793986, 0.3818893676293, 0.5181626420473, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.6328932436134, 0.5913293975087, -0.4997756354911, 0, -0.4345787604422, 0.8055471289446, 0.4027842152092, 0,
          0.640770975592, -0.03772753226908, 0.7668045319035, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [0.3410705187251, -0.2773258458744, 1.705842561213];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual191 = promiseResult.length;
        expect(assertionActual191).assertEqual(3);
        const assertionActual192 = callbackResult.length;
        expect(assertionActual192).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual193 = JSON.stringify(current);
        expect(assertionActual193).assertEqual(currentBefore);
        const assertionActual194 = JSON.stringify(previous);
        expect(assertionActual194).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual195 = JSON.stringify(current);
        expect(assertionActual195).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorVariationValidationTest0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_4000
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 172
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.4760960359183, 0.08645966497291, -0.8751327275995, 0.4295073050573, 0.8455228592296, 0.3171979971919,
          0.7673695586126, -0.526892608463, 0.3654150238588,
        ];
        const previous: number[] = [
          0.3701979521679, 0.2902140653693, 0.8824563855922, 0.5490268697756, -0.8346369519478, 0.04416621681529,
          0.7493483652315, 0.4681420240751, -0.4683162102893,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [3.032676999268, -0.3686889341685, -3.056012196157];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual196 = promiseResult.length;
        expect(assertionActual196).assertEqual(3);
        const assertionActual197 = callbackResult.length;
        expect(assertionActual197).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual198 = JSON.stringify(current);
        expect(assertionActual198).assertEqual(currentBefore);
        const assertionActual199 = JSON.stringify(previous);
        expect(assertionActual199).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual200 = JSON.stringify(current);
        expect(assertionActual200).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorVariationValidationTest0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_4100
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 173
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.8737099990843, -0.1405094422785, -0.4657122868582, 0, 0.1354150673127, -0.8492784328035, 0.5102831597452, 0,
          -0.4672190033001, -0.508903959707, -0.7229959631629, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.9343168809875, -0.004642852313739, -0.3564132570826, 0, 0.1386089562072, 0.9259484126723, 0.3512934589895,
          0, 0.3283892860022, -0.377621478457, 0.8657727737963, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-2.530162906228, 0.7599176094336, 1.968428842082];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual201 = promiseResult.length;
        expect(assertionActual201).assertEqual(3);
        const assertionActual202 = callbackResult.length;
        expect(assertionActual202).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual203 = JSON.stringify(current);
        expect(assertionActual203).assertEqual(currentBefore);
        const assertionActual204 = JSON.stringify(previous);
        expect(assertionActual204).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual205 = JSON.stringify(current);
        expect(assertionActual205).assertEqual(currentBefore);
      },
    );

    /**
     * @tc.name testSensorVariationValidationTest0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_VARIATION_VALIDATION_4200
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 174
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorVariationValidationTest0042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.9731255197118, -0.1430019129797, -0.1804914839258, 0.1470522098779, 0.9890860205204, 0.009191930223929,
          0.177207139968, -0.03548657345174, 0.983533595079,
        ];
        const previous: number[] = [
          0.1092903420038, 0.3048406500362, 0.9461119380022, 0.7768507202758, 0.567608448097, -0.2726235647479,
          -0.6201278735484, 0.7647828631281, -0.1747815571332,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [1.006220973737, 0.4101442027875, -1.956694330754];
        const promiseResult: number[] = await sensor.getAngleVariation(current, previous);
        const callbackResult: number[] = await variationCallback(current, previous);
        const assertionActual206 = promiseResult.length;
        expect(assertionActual206).assertEqual(3);
        const assertionActual207 = callbackResult.length;
        expect(assertionActual207).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, expected, 0.00008);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00008);
        assertOrientationRange(promiseResult);
        const assertionActual208 = JSON.stringify(current);
        expect(assertionActual208).assertEqual(currentBefore);
        const assertionActual209 = JSON.stringify(previous);
        expect(assertionActual209).assertEqual(previousBefore);
        const noChange: number[] = await sensor.getAngleVariation(current, current);
        assertArrayNear(noChange, [0, 0, 0], 0.0001);
        const assertionActual210 = JSON.stringify(current);
        expect(assertionActual210).assertEqual(currentBefore);
      },
    );
  });
}
