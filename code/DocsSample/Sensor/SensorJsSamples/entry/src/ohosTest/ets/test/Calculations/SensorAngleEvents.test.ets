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

export default function sensorAngleEventsTest(): void {
  describe('SensorAngleEvents', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorAngleEventsTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ANGLE_EVENTS_0100
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 13
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAngleEventsTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const current: number[] = [
        -0.352066288428, -0.756206695631, -0.5515439801461, 0, -0.9262995087498, 0.1969954552469, 0.321188434882, 0,
        -0.1342331875594, 0.6239745380181, -0.7698293494423, 0, 0, 0, 0, 1,
      ];
      const previous: number[] = [
        0.363753911488, -0.1129296632151, 0.9246242388361, 0, -0.1820153969512, 0.9648722703724, 0.1894515693762, 0,
        -0.9135389904924, -0.2372095972606, 0.3304211249567, 0, 0, 0, 0, 1,
      ];
      const currentBefore: string = JSON.stringify(current);
      const previousBefore: string = JSON.stringify(previous);
      const expected: number[] = [-1.427108453904, 0.4731714568484, 2.482134024605];
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
    });

    /**
     * @tc.name testSensorAngleEventsTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ANGLE_EVENTS_0200
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 14
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAngleEventsTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const current: number[] = [
        0.6943677072541, -0.6537756073188, 0.300717379607, 0.4296272011071, 0.7118570341149, 0.5555898046672,
        -0.5772988439202, -0.2565872527157, 0.7751703209955,
      ];
      const previous: number[] = [
        0.8971661546899, -0.3919759884981, 0.2035871197296, 0.3767518707365, 0.4385370690919, -0.8159309204393,
        0.2305448302943, 0.8087274345991, 0.5411183029166,
      ];
      const currentBefore: string = JSON.stringify(current);
      const previousBefore: string = JSON.stringify(previous);
      const expected: number[] = [-0.8078415932104, 1.021267141986, 1.518390804686];
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
    });

    /**
     * @tc.name testSensorAngleEventsTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ANGLE_EVENTS_0300
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAngleEventsTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const current: number[] = [
        0.5401756043212, 0.5969956376464, 0.5931328056409, 0, -0.8127980464974, 0.1874416179299, 0.5515659303093, 0,
        0.2181046815324, -0.7800396454662, 0.5864882772866, 0, 0, 0, 0, 1,
      ];
      const previous: number[] = [
        -0.5905817093161, -0.2138004720164, -0.7781404775404, 0, -0.7790415615873, -0.1004686294741, 0.6188701800953, 0,
        -0.2104934439381, 0.9716971815628, -0.1072245186603, 0, 0, 0, 0, 1,
      ];
      const currentBefore: string = JSON.stringify(current);
      const previousBefore: string = JSON.stringify(previous);
      const expected: number[] = [-2.787439993113, 0.2681054710144, 1.761817678941];
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
    });

    /**
     * @tc.name testSensorAngleEventsTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ANGLE_EVENTS_0400
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAngleEventsTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const current: number[] = [
        -0.6635970126066, -0.7188472043092, -0.2071176035892, 0.2583160441686, 0.0396492900446, -0.9652464737693,
        0.7020767950764, -0.6940364764592, 0.1593786157532,
      ];
      const previous: number[] = [
        0.9577184319641, 0.1853899358064, -0.2200135831668, -0.2196400786523, 0.9650574688729, -0.1429066745197,
        0.1858322924731, 0.1851881569495, 0.9649723859261,
      ];
      const currentBefore: string = JSON.stringify(current);
      const previousBefore: string = JSON.stringify(previous);
      const expected: number[] = [-1.835042584842, 0.543618261416, -1.165686108202];
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
    });

    /**
     * @tc.name testSensorAngleEventsTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ANGLE_EVENTS_0500
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 17
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAngleEventsTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const current: number[] = [
        0.9995097961882, -0.02144216795794, -0.02281229399205, 0, 0.02202111203564, 0.9994338404991, 0.02543755274905,
        0, 0.02225394231659, -0.02592743524552, 0.9994160946037, 0, 0, 0, 0, 1,
      ];
      const previous: number[] = [
        0.03324009614962, -0.4305994433006, 0.9019308263039, 0, 0.9415670179, -0.2891532198636, -0.1727482742182, 0,
        0.3351815132295, 0.8549704877197, 0.3958267529077, 0, 0, 0, 0, 1,
      ];
      const currentBefore: string = JSON.stringify(current);
      const previousBefore: string = JSON.stringify(previous);
      const expected: number[] = [1.8841966777, 0.2036575086051, -1.182677910736];
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
    });

    /**
     * @tc.name testSensorAngleEventsTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ANGLE_EVENTS_0600
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 18
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAngleEventsTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const current: number[] = [
        -0.6652471999288, 0.6780235160305, 0.3126184170781, -0.7434020290899, -0.5626659815184, -0.3616080977894,
        -0.0692790454023, -0.4729599401128, 0.8783560262881,
      ];
      const previous: number[] = [
        0.0906904806557, 0.4632023916705, 0.8816001253795, -0.995296229603, 0.01187345139942, 0.09614799264623,
        0.03406834390563, -0.8861729884749, 0.4621004029872,
      ];
      const currentBefore: string = JSON.stringify(current);
      const previousBefore: string = JSON.stringify(previous);
      const expected: number[] = [0.6947181877758, -0.3311084113192, 0.8177407077693];
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
    });

    /**
     * @tc.name testSensorAngleEventsTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ANGLE_EVENTS_0700
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 19
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAngleEventsTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const current: number[] = [
        0.683211795016, 0.3186069742804, 0.6570473644197, 0, 0.5419379123995, 0.3818309489727, -0.7486711063683, 0,
        -0.4894128546075, 0.8675798074797, 0.0882062095228, 0, 0, 0, 0, 1,
      ];
      const previous: number[] = [
        0.9084648762703, -0.1190731182811, -0.4006409378558, 0, 0.2535296390837, 0.9190644430187, 0.3017337761749, 0,
        0.3322864587811, -0.375688890016, 0.8651263302138, 0, 0, 0, 0, 1,
      ];
      const currentBefore: string = JSON.stringify(current);
      const previousBefore: string = JSON.stringify(previous);
      const expected: number[] = [1.589992967318, -0.8302950070796, 2.229269403865];
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
    });

    /**
     * @tc.name testSensorAngleEventsTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ANGLE_EVENTS_0800
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAngleEventsTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const current: number[] = [
        0.6903542650139, -0.302813976074, -0.6570499864328, 0.09930938547355, 0.9392575116722, -0.3285315399231,
        0.7166230771709, 0.1615519193995, 0.678492699006,
      ];
      const previous: number[] = [
        -0.7569184399234, 0.5854494905814, -0.2903848640715, 0.63996351326, 0.7540356593161, -0.1479085060963,
        0.1323675828889, -0.2977903934945, -0.945409807725,
      ];
      const currentBefore: string = JSON.stringify(current);
      const previousBefore: string = JSON.stringify(previous);
      const expected: number[] = [1.055048306485, 0.2051605537235, 1.993991951694];
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
    });

    /**
     * @tc.name testSensorAngleEventsTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ANGLE_EVENTS_0900
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 21
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAngleEventsTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const current: number[] = [
        0.03577430252928, -0.5050503424222, 0.8623481610682, 0, -0.7166554144543, -0.6143681935407, -0.3300859580456, 0,
        0.6965093080583, -0.6061978838505, -0.3839256560889, 0, 0, 0, 0, 1,
      ];
      const previous: number[] = [
        0.9605132644966, -0.2134419682673, -0.1784847189768, 0, 0.2750041707834, 0.6308222611956, 0.7255590815583, 0,
        -0.04227262444823, -0.7459931641525, 0.6646105809119, 0, 0, 0, 0, 1,
      ];
      const currentBefore: string = JSON.stringify(current);
      const previousBefore: string = JSON.stringify(previous);
      const expected: number[] = [-1.302960637197, 0.8610116011951, 3.044067519972];
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
    });

    /**
     * @tc.name testSensorAngleEventsTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ANGLE_EVENTS_1000
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 22
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAngleEventsTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const current: number[] = [
        0.8780105384565, 0.4113655387235, -0.2446955003878, -0.4683322891061, 0.8438802367876, -0.2617842870378,
        0.09880466254147, 0.3444481666521, 0.9335915055044,
      ];
      const previous: number[] = [
        0.1129510704734, 0.5940929410767, 0.7964267907609, -0.6667505571181, 0.6396066971977, -0.3825532217647,
        -0.736672077835, -0.4878082105322, 0.4683560605732,
      ];
      const currentBefore: string = JSON.stringify(current);
      const previousBefore: string = JSON.stringify(previous);
      const expected: number[] = [-0.8959246144286, -0.1668914721175, -1.216059453974];
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
    });

    /**
     * @tc.name testSensorAngleEventsTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ANGLE_EVENTS_1100
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 23
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAngleEventsTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const current: number[] = [
        0.03773517744723, -0.9595777087368, 0.2789026304618, 0, 0.3200183726315, 0.276006668196, 0.9063159274169, 0,
        -0.9466595468073, 0.05505397357869, 0.3174976573644, 0, 0, 0, 0, 1,
      ];
      const previous: number[] = [
        -0.1006172869542, -0.98151602627, 0.1627957362499, 0, -0.1719739056416, -0.1440057917553, -0.9745190135237, 0,
        0.9799495585714, -0.1260500778108, -0.1543056724154, 0, 0, 0, 0, 1,
      ];
      const currentBefore: string = JSON.stringify(current);
      const previousBefore: string = JSON.stringify(previous);
      const expected: number[] = [0.1145978841335, 0.4485773197121, 2.963477662092];
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
    });

    /**
     * @tc.name testSensorAngleEventsTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ANGLE_EVENTS_1200
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 24
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAngleEventsTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const current: number[] = [
        0.01487830343383, 0.999699365847, 0.01948881761278, -0.08267311067734, -0.01819429904774, 0.9964106203032,
        0.9964656506161, -0.01643610072904, 0.08237755601474,
      ];
      const previous: number[] = [
        0.9999811111054, 0.005879362313941, 0.00179179554245, -0.005875451066723, 0.9999803623454, -0.002180366573746,
        -0.001804579520852, 0.002169797782, 0.9999960177272,
      ];
      const currentBefore: string = JSON.stringify(current);
      const previousBefore: string = JSON.stringify(previous);
      const expected: number[] = [1.583149968614, 0.01460562745081, -1.490461779482];
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
    });

    /**
     * @tc.name testSensorAngleEventsTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ANGLE_EVENTS_1300
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 25
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAngleEventsTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const current: number[] = [
        0.9671784905031, -0.2516798535886, 0.03497168577169, 0, 0.2540345661253, 0.9546616005856, -0.1552020218326, 0,
        0.005675096617518, 0.1589920742208, 0.9872635482045, 0, 0, 0, 0, 1,
      ];
      const previous: number[] = [
        -0.02325357785389, 0.006746930891691, -0.9997068320465, 0, -0.9119538410482, -0.4098779455725, 0.0184461792978,
        0, -0.4096333273971, 0.9121154250734, 0.01568401825993, 0, 0, 0, 0, 1,
      ];
      const currentBefore: string = JSON.stringify(current);
      const previousBefore: string = JSON.stringify(previous);
      const expected: number[] = [-1.831403534174, -0.2751689790451, 1.594011773022];
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
    });

    /**
     * @tc.name testSensorAngleEventsTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ANGLE_EVENTS_1400
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 26
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAngleEventsTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const current: number[] = [
        0.2255109027539, 0.7835046312625, -0.579021006121, 0.9741893064774, -0.1874523112186, 0.1257649639762,
        -0.01000139411555, -0.5924374429499, -0.8055543732776,
      ];
      const previous: number[] = [
        0.3275410567507, -0.1337152983233, 0.9353272556367, 0.7673878168672, 0.615168728377, -0.1807854367775,
        -0.5512102998552, 0.7769733937667, 0.3041045062346,
      ];
      const currentBefore: string = JSON.stringify(current);
      const previousBefore: string = JSON.stringify(previous);
      const expected: number[] = [2.568234351021, -0.6268036183423, -3.102361044552];
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
    });

    /**
     * @tc.name testSensorAngleEventsTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ANGLE_EVENTS_1500
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 27
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAngleEventsTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const current: number[] = [
        0.4121289203032, -0.1051566363593, 0.9050369245944, 0, 0.2065988089146, 0.9782297765803, 0.01958153126813, 0,
        -0.8873931965058, 0.1789094353056, 0.4248820174517, 0, 0, 0, 0, 1,
      ];
      const previous: number[] = [
        0.7986247182695, 0.3610795108606, -0.4814770463955, 0, 0.001125812919225, 0.7991248258942, 0.6011640750951, 0,
        0.6018282910551, -0.4806465431857, 0.6377943309637, 0, 0, 0, 0, 1,
      ];
      const currentBefore: string = JSON.stringify(current);
      const previousBefore: string = JSON.stringify(previous);
      const expected: number[] = [0.03767549203627, -0.8523275752897, 1.805375477375];
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
    });

    /**
     * @tc.name testSensorAngleEventsTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ANGLE_EVENTS_1600
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 28
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAngleEventsTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const current: number[] = [
        0.7859731133904, 0.2503123803121, -0.5653228964848, -0.6126047087001, 0.438701401702, -0.657462205015,
        0.08343701759956, 0.8630670845347, 0.4981500493695,
      ];
      const previous: number[] = [
        0.7960458693149, 0.468058062492, 0.3837090357066, 0.3564727388865, -0.8749393480424, 0.3277320913154,
        0.4891197812166, -0.1241079666397, -0.8633417934046,
      ];
      const currentBefore: string = JSON.stringify(current);
      const previousBefore: string = JSON.stringify(previous);
      const expected: number[] = [2.018787939124, 0.5297275314753, -3.108235436161];
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
    });

    /**
     * @tc.name testSensorAngleEventsTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ANGLE_EVENTS_1700
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 29
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAngleEventsTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const current: number[] = [
        -0.7595412265357, -0.6359846054874, 0.1364577105762, 0, 0.2431469386928, -0.472183091823, -0.8473031889476, 0,
        0.6033048080341, -0.6103824287932, 0.5132802345927, 0, 0, 0, 0, 1,
      ];
      const previous: number[] = [
        0.8695120472499, 0.3116058735685, -0.3832108809062, 0, -0.2348939491815, 0.943399415137, 0.2341417864394, 0,
        0.4344808768233, -0.1135751868883, 0.8934914910608, 0, 0, 0, 0, 1,
      ];
      const currentBefore: string = JSON.stringify(current);
      const previousBefore: string = JSON.stringify(previous);
      const expected: number[] = [-2.252808090807, 0.4248817825142, -1.340545055306];
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
    });

    /**
     * @tc.name testSensorAngleEventsTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ANGLE_EVENTS_1800
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 30
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAngleEventsTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const current: number[] = [
        0.9779082839819, -0.1585411774478, -0.1362353961829, 0.1380233468273, 0.9791917095818, -0.1487721466432,
        0.1569870817941, 0.1266818492906, 0.9794420683277,
      ];
      const previous: number[] = [
        0.2309625103789, -0.9638052480223, 0.1331756835318, 0.112446207192, 0.1624006096758, 0.9802968389549,
        -0.966443050204, -0.2114367183382, 0.1458846971097,
      ];
      const currentBefore: string = JSON.stringify(current);
      const previousBefore: string = JSON.stringify(previous);
      const expected: number[] = [-0.1700428915862, -1.277394770815, -1.643813341473];
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
    });

    /**
     * @tc.name testSensorAngleEventsTest0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ANGLE_EVENTS_1900
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 31
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAngleEventsTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const current: number[] = [
        -0.263992163575, 0.9628744406711, 0.05639990313259, 0, -0.2811791904383, -0.02089313615178, -0.9594278189245, 0,
        -0.9226301536561, -0.2691399048155, 0.2762558799382, 0, 0, 0, 0, 1,
      ];
      const previous: number[] = [
        -0.4113857973646, 0.8688366199971, -0.2754716926993, 0, -0.9077002064983, -0.3631010800218, 0.2103281740753, 0,
        0.08271675071922, 0.3365717359479, 0.9380178067134, 0, 0, 0, 0, 1,
      ];
      const currentBefore: string = JSON.stringify(current);
      const previousBefore: string = JSON.stringify(previous);
      const expected: number[] = [-0.4873710928366, 0.5493079220995, 1.521764677091];
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
    });

    /**
     * @tc.name testSensorAngleEventsTest0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ANGLE_EVENTS_2000
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 32
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAngleEventsTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const current: number[] = [
        0.4507070562052, -0.7409639090041, -0.4978309301764, 0.6312018695239, -0.1298209792521, 0.764676868524,
        -0.631226860484, -0.6588770741948, 0.4091865732207,
      ];
      const previous: number[] = [
        0.9657033364574, -0.2286344133055, -0.1230584048631, 0.1943030879423, 0.9507264290811, -0.2415896667136,
        0.1722305895337, 0.2093933191368, 0.962544057137,
      ];
      const currentBefore: string = JSON.stringify(current);
      const previousBefore: string = JSON.stringify(previous);
      const expected: number[] = [-1.67805456402, 0.5371075539547, 1.250659955289];
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
    });

    /**
     * @tc.name testSensorAngleEventsTest0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ANGLE_EVENTS_2100
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 33
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAngleEventsTest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const current: number[] = [
        0.8819134064352, 0.2798756042476, -0.3793394122641, 0, -0.09906681521652, 0.8967513265633, 0.431303633685, 0,
        0.4608844862573, -0.3427925093319, 0.8185834019043, 0, 0, 0, 0, 1,
      ];
      const previous: number[] = [
        -0.8297556491386, 0.06395532033165, -0.5544504303577, 0, 0.5429299965537, 0.3227308977968, -0.7752881957372, 0,
        0.1293544802655, -0.9443275303667, -0.3025110474457, 0, 0, 0, 0, 1,
      ];
      const currentBefore: string = JSON.stringify(current);
      const previousBefore: string = JSON.stringify(previous);
      const expected: number[] = [0.3216991859011, 0.8431160457493, 2.16375332355];
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
    });

    /**
     * @tc.name testSensorAngleEventsTest0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ANGLE_EVENTS_2200
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 34
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAngleEventsTest0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const current: number[] = [
        -0.5421342847032, 0.8236597317385, -0.1663582389359, 0.8359065449325, 0.5488301884788, -0.006758132392476,
        0.08573602211676, -0.1427237560005, -0.986042222212,
      ];
      const previous: number[] = [
        0.811969356767, 0.4905422728282, 0.3163448154149, -0.04166533266258, 0.589291425619, -0.8068454720367,
        -0.5822110989371, 0.6419531869696, 0.4989251867906,
      ];
      const currentBefore: string = JSON.stringify(current);
      const previousBefore: string = JSON.stringify(previous);
      const expected: number[] = [0.8535603571773, 0.2562648374511, 2.161969826283];
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
    });

    /**
     * @tc.name testSensorAngleEventsTest0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ANGLE_EVENTS_2300
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 35
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAngleEventsTest0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const current: number[] = [
        0.9171846520842, 0.2260766282259, 0.3281183813065, 0, -0.3844075937579, 0.7188071667505, 0.5792642392634, 0,
        -0.1048957379612, -0.6574234671794, 0.7461844738129, 0, 0, 0, 0, 1,
      ];
      const previous: number[] = [
        0.8261559230329, 0.4182125583425, 0.3775773389416, 0, 0.1534943574378, 0.4777283033364, -0.8649943065859, 0,
        -0.5421308634198, 0.7725761607996, 0.3304847994867, 0, 0, 0, 0, 1,
      ];
      const currentBefore: string = JSON.stringify(current);
      const previousBefore: string = JSON.stringify(previous);
      const expected: number[] = [1.677452443896, 0.8536299526635, -1.770783633804];
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
    });

    /**
     * @tc.name testSensorAngleEventsTest0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ANGLE_EVENTS_2400
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 36
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAngleEventsTest0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const current: number[] = [
        0.07272233206501, -0.6824502335183, 0.7273053974706, 0.9187720550191, 0.3295592413491, 0.2173674707894,
        -0.3880326962191, 0.6524204052696, 0.6509825200823,
      ];
      const previous: number[] = [
        -0.229146621143, 0.5522383636866, -0.8015763317935, 0.9733872194604, 0.1274434106366, -0.190461277105,
        -0.003024402404823, -0.8238877148969, -0.5667449922425,
      ];
      const currentBefore: string = JSON.stringify(current);
      const previousBefore: string = JSON.stringify(previous);
      const expected: number[] = [2.642825413068, -0.1147634355584, 3.128136321355];
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
    });

    /**
     * @tc.name testSensorAngleEventsTest0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ANGLE_EVENTS_2500
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 37
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAngleEventsTest0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const current: number[] = [
        -0.08159957790148, -0.1169506584453, -0.9897797999432, 0, -0.9923168822312, -0.08313172858914, 0.09163144078711,
        0, -0.09299846302623, 0.9896522920658, -0.1092685988002, 0, 0, 0, 0, 1,
      ];
      const previous: number[] = [
        0.9853699349324, -0.1249156874706, -0.115940339637, 0, 0.110940452264, 0.9865501111997, -0.1200462166969, 0,
        0.1293766106484, 0.1054274590205, 0.9859750217433, 0, 0, 0, 0, 1,
      ];
      const currentBefore: string = JSON.stringify(current);
      const previousBefore: string = JSON.stringify(previous);
      const expected: number[] = [0.09651325900725, -1.53368324845, -1.678286802346];
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
    });

    /**
     * @tc.name testSensorAngleEventsTest0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ANGLE_EVENTS_2600
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 38
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAngleEventsTest0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const current: number[] = [
        0.9959329903304, -0.07417648870521, 0.0511402707741, 0.07457996150382, 0.9971968397664, -0.006024292651429,
        -0.05055005552492, 0.00981383122059, 0.9986733102488,
      ];
      const previous: number[] = [
        -0.2315252592842, 0.6861155253217, 0.6896677027568, -0.8051736513276, -0.5330193059313, 0.2599727114763,
        0.5459775137506, -0.4951120130001, 0.675849575765,
      ];
      const currentBefore: string = JSON.stringify(current);
      const previousBefore: string = JSON.stringify(previous);
      const expected: number[] = [-2.215926787447, -0.2164046337641, -0.7589191847601];
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
    });

    /**
     * @tc.name testSensorAngleEventsTest0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ANGLE_EVENTS_2700
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 39
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAngleEventsTest0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const current: number[] = [
        0.2523551264661, -0.5964127358872, 0.7619768622588, 0, 0.221552758894, -0.730931060287, -0.6454875367768, 0,
        0.9419295436352, 0.3317101650224, -0.05231731308138, 0, 0, 0, 0, 1,
      ];
      const previous: number[] = [
        0.3170068785623, -0.9469097419909, 0.05355912122923, 0, 0.3147377388722, 0.1583035664514, 0.9358846812393, 0,
        -0.8946769219522, -0.2798248047823, 0.3482115505763, 0, 0, 0, 0, 1,
      ];
      const currentBefore: string = JSON.stringify(current);
      const previousBefore: string = JSON.stringify(previous);
      const expected: number[] = [-1.109080115895, 0.6441327753166, -2.385074592471];
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
    });

    /**
     * @tc.name testSensorAngleEventsTest0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ANGLE_EVENTS_2800
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 40
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAngleEventsTest0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const current: number[] = [
        0.3191410009547, 0.6794742892143, 0.6606540030957, -0.1936233528425, 0.7291516860486, -0.6563899877105,
        -0.9277171005989, 0.08156291454631, 0.3642642889813,
      ];
      const previous: number[] = [
        0.7750416197365, 0.3642496118966, -0.5163648980221, -0.4198172958748, 0.9075527700069, 0.01007014086817,
        0.4722964384373, 0.2089741368829, 0.8563094559524,
      ];
      const currentBefore: string = JSON.stringify(current);
      const previousBefore: string = JSON.stringify(previous);
      const expected: number[] = [0.2726803556576, 0.2772075932209, 1.608052449908];
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
    });

    /**
     * @tc.name testSensorAngleEventsTest0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ANGLE_EVENTS_2900
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 41
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAngleEventsTest0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const current: number[] = [
        0.7549178176348, 0.1703969099143, -0.6332961248178, 0, 0.276600029733, 0.7928400921157, 0.5430442080399, 0,
        0.5946356129339, -0.585123475367, 0.5513973217247, 0, 0, 0, 0, 1,
      ];
      const previous: number[] = [
        0.3980510768968, 0.7017792369437, 0.5908140509298, 0, 0.6288049458751, -0.6776597934125, 0.3812893185433, 0,
        0.6679518547203, 0.2197341734617, -0.7110254656401, 0, 0, 0, 0, 1,
      ];
      const currentBefore: string = JSON.stringify(current);
      const previousBefore: string = JSON.stringify(previous);
      const expected: number[] = [2.83067984784, -0.9596870386182, -2.915400893423];
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
    });

    /**
     * @tc.name testSensorAngleEventsTest0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ANGLE_EVENTS_3000
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 42
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAngleEventsTest0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const current: number[] = [
        0.4779357646938, -0.6057339194729, -0.6361319231312, -0.3276834468081, -0.7948692050773, 0.5106921827361,
        -0.8149852535565, -0.03562815768282, -0.5783853999416,
      ];
      const previous: number[] = [
        0.74656162278, 0.01405461066664, -0.6651678068812, 0.1355408132547, 0.975597006314, 0.1727401783414,
        0.6513635170428, -0.2191185733574, 0.7264383108533,
      ];
      const currentBefore: string = JSON.stringify(current);
      const previousBefore: string = JSON.stringify(previous);
      const expected: number[] = [-2.497244556098, -0.242084843307, 1.476728488411];
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
    });
  });
}
