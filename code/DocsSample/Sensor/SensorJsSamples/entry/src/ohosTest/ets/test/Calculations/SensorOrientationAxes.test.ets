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
import { assertAngleArrayNear, assertOrientationRange, orientationCallback } from '../Shared/SharedDriver';

export default function sensorOrientationAxesTest(): void {
  describe('SensorOrientationAxes', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorOrientationAxesTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_0100
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 13
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.352066288428, -0.756206695631, -0.5515439801461, 0, -0.9262995087498, 0.1969954552469, 0.321188434882, 0,
          -0.1342331875594, 0.6239745380181, -0.7698293494423, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-1.315955513359, -0.6738185799785, 2.968960798002];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual1 = promiseResult.length;
        expect(assertionActual1).assertEqual(3);
        const assertionActual2 = callbackResult.length;
        expect(assertionActual2).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual3 = JSON.stringify(input);
        expect(assertionActual3).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          -0.352066288428, -0.756206695631, -0.5515439801461, -0.9262995087498, 0.1969954552469, 0.321188434882,
          -0.1342331875594, 0.6239745380181, -0.7698293494423,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual4 = JSON.stringify(input);
        expect(assertionActual4).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_0200
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 14
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.6943677072541, -0.6537756073188, 0.300717379607, 0.4296272011071, 0.7118570341149, 0.5555898046672,
          -0.5772988439202, -0.2565872527157, 0.7751703209955,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.7428929958599, 0.2594895790307, 0.640124955126];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual5 = promiseResult.length;
        expect(assertionActual5).assertEqual(3);
        const assertionActual6 = callbackResult.length;
        expect(assertionActual6).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual7 = JSON.stringify(input);
        expect(assertionActual7).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.6943677072541, -0.6537756073188, 0.300717379607, 0, 0.4296272011071, 0.7118570341149, 0.5555898046672, 0,
          -0.5772988439202, -0.2565872527157, 0.7751703209955, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual8 = JSON.stringify(input);
        expect(assertionActual8).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_0300
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.5401756043212, 0.5969956376464, 0.5931328056409, 0, -0.8127980464974, 0.1874416179299, 0.5515659303093, 0,
          0.2181046815324, -0.7800396454662, 0.5864882772866, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [1.2665683843, 0.8947291734657, -0.356034654472];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual9 = promiseResult.length;
        expect(assertionActual9).assertEqual(3);
        const assertionActual10 = callbackResult.length;
        expect(assertionActual10).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual11 = JSON.stringify(input);
        expect(assertionActual11).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.5401756043212, 0.5969956376464, 0.5931328056409, -0.8127980464974, 0.1874416179299, 0.5515659303093,
          0.2181046815324, -0.7800396454662, 0.5864882772866,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual12 = JSON.stringify(input);
        expect(assertionActual12).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_0400
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.6635970126066, -0.7188472043092, -0.2071176035892, 0.2583160441686, 0.0396492900446, -0.9652464737693,
          0.7020767950764, -0.6940364764592, 0.1593786157532,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-1.51569538865, 0.7670806969604, -1.3475693429];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual13 = promiseResult.length;
        expect(assertionActual13).assertEqual(3);
        const assertionActual14 = callbackResult.length;
        expect(assertionActual14).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual15 = JSON.stringify(input);
        expect(assertionActual15).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          -0.6635970126066, -0.7188472043092, -0.2071176035892, 0, 0.2583160441686, 0.0396492900446, -0.9652464737693,
          0, 0.7020767950764, -0.6940364764592, 0.1593786157532, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual16 = JSON.stringify(input);
        expect(assertionActual16).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_0500
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 17
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9995097961882, -0.02144216795794, -0.02281229399205, 0, 0.02202111203564, 0.9994338404991, 0.02543755274905,
          0, 0.02225394231659, -0.02592743524552, 0.9994160946037, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.02145102371233, 0.02593034099945, -0.02226326509149];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual17 = promiseResult.length;
        expect(assertionActual17).assertEqual(3);
        const assertionActual18 = callbackResult.length;
        expect(assertionActual18).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual19 = JSON.stringify(input);
        expect(assertionActual19).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.9995097961882, -0.02144216795794, -0.02281229399205, 0.02202111203564, 0.9994338404991, 0.02543755274905,
          0.02225394231659, -0.02592743524552, 0.9994160946037,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual20 = JSON.stringify(input);
        expect(assertionActual20).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_0600
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 18
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.6652471999288, 0.6780235160305, 0.3126184170781, -0.7434020290899, -0.5626659815184, -0.3616080977894,
          -0.0692790454023, -0.4729599401128, 0.8783560262881,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [2.263482473264, 0.4926471910568, 0.07871058517533];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual21 = promiseResult.length;
        expect(assertionActual21).assertEqual(3);
        const assertionActual22 = callbackResult.length;
        expect(assertionActual22).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual23 = JSON.stringify(input);
        expect(assertionActual23).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          -0.6652471999288, 0.6780235160305, 0.3126184170781, 0, -0.7434020290899, -0.5626659815184, -0.3616080977894,
          0, -0.0692790454023, -0.4729599401128, 0.8783560262881, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual24 = JSON.stringify(input);
        expect(assertionActual24).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_0700
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 19
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.683211795016, 0.3186069742804, 0.6570473644197, 0, 0.5419379123995, 0.3818309489727, -0.7486711063683, 0,
          -0.4894128546075, 0.8675798074797, 0.0882062095228, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.6953786179347, -1.050314778892, 1.392481940093];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual25 = promiseResult.length;
        expect(assertionActual25).assertEqual(3);
        const assertionActual26 = callbackResult.length;
        expect(assertionActual26).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual27 = JSON.stringify(input);
        expect(assertionActual27).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.683211795016, 0.3186069742804, 0.6570473644197, 0.5419379123995, 0.3818309489727, -0.7486711063683,
          -0.4894128546075, 0.8675798074797, 0.0882062095228,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual28 = JSON.stringify(input);
        expect(assertionActual28).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_0800
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.6903542650139, -0.302813976074, -0.6570499864328, 0.09930938547355, 0.9392575116722, -0.3285315399231,
          0.7166230771709, 0.1615519193995, 0.678492699006,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.3118759421256, -0.1622630276607, -0.8127226970171];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual29 = promiseResult.length;
        expect(assertionActual29).assertEqual(3);
        const assertionActual30 = callbackResult.length;
        expect(assertionActual30).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual31 = JSON.stringify(input);
        expect(assertionActual31).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.6903542650139, -0.302813976074, -0.6570499864328, 0, 0.09930938547355, 0.9392575116722, -0.3285315399231, 0,
          0.7166230771709, 0.1615519193995, 0.678492699006, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual32 = JSON.stringify(input);
        expect(assertionActual32).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_0900
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 21
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.03577430252928, -0.5050503424222, 0.8623481610682, 0, -0.7166554144543, -0.6143681935407, -0.3300859580456,
          0, 0.6965093080583, -0.6061978838505, -0.3839256560889, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-2.453541740446, 0.6512711819411, -2.074571085405];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual33 = promiseResult.length;
        expect(assertionActual33).assertEqual(3);
        const assertionActual34 = callbackResult.length;
        expect(assertionActual34).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual35 = JSON.stringify(input);
        expect(assertionActual35).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.03577430252928, -0.5050503424222, 0.8623481610682, -0.7166554144543, -0.6143681935407, -0.3300859580456,
          0.6965093080583, -0.6061978838505, -0.3839256560889,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual36 = JSON.stringify(input);
        expect(assertionActual36).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_1000
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 22
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.8780105384565, 0.4113655387235, -0.2446955003878, -0.4683322891061, 0.8438802367876, -0.2617842870378,
          0.09880466254147, 0.3444481666521, 0.9335915055044,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.4535727284826, -0.3516509178614, -0.1054403676938];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual37 = promiseResult.length;
        expect(assertionActual37).assertEqual(3);
        const assertionActual38 = callbackResult.length;
        expect(assertionActual38).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual39 = JSON.stringify(input);
        expect(assertionActual39).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.8780105384565, 0.4113655387235, -0.2446955003878, 0, -0.4683322891061, 0.8438802367876, -0.2617842870378, 0,
          0.09880466254147, 0.3444481666521, 0.9335915055044, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual40 = JSON.stringify(input);
        expect(assertionActual40).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_1100
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 23
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.03773517744723, -0.9595777087368, 0.2789026304618, 0, 0.3200183726315, 0.276006668196, 0.9063159274169, 0,
          -0.9466595468073, 0.05505397357869, 0.3174976573644, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-1.290723226495, -0.05508182246101, 1.247198278356];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual41 = promiseResult.length;
        expect(assertionActual41).assertEqual(3);
        const assertionActual42 = callbackResult.length;
        expect(assertionActual42).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual43 = JSON.stringify(input);
        expect(assertionActual43).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.03773517744723, -0.9595777087368, 0.2789026304618, 0.3200183726315, 0.276006668196, 0.9063159274169,
          -0.9466595468073, 0.05505397357869, 0.3174976573644,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual44 = JSON.stringify(input);
        expect(assertionActual44).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_1200
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 24
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.01487830343383, 0.999699365847, 0.01948881761278, -0.08267311067734, -0.01819429904774, 0.9964106203032,
          0.9964656506161, -0.01643610072904, 0.08237755601474,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [1.588994088268, 0.01643684084187, -1.488314148072];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual45 = promiseResult.length;
        expect(assertionActual45).assertEqual(3);
        const assertionActual46 = callbackResult.length;
        expect(assertionActual46).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual47 = JSON.stringify(input);
        expect(assertionActual47).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.01487830343383, 0.999699365847, 0.01948881761278, 0, -0.08267311067734, -0.01819429904774, 0.9964106203032,
          0, 0.9964656506161, -0.01643610072904, 0.08237755601474, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual48 = JSON.stringify(input);
        expect(assertionActual48).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_1300
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 25
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9671784905031, -0.2516798535886, 0.03497168577169, 0, 0.2540345661253, 0.9546616005856, -0.1552020218326, 0,
          0.005675096617518, 0.1589920742208, 0.9872635482045, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.2577675582534, -0.1596696569149, -0.005748246374082];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual49 = promiseResult.length;
        expect(assertionActual49).assertEqual(3);
        const assertionActual50 = callbackResult.length;
        expect(assertionActual50).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual51 = JSON.stringify(input);
        expect(assertionActual51).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.9671784905031, -0.2516798535886, 0.03497168577169, 0.2540345661253, 0.9546616005856, -0.1552020218326,
          0.005675096617518, 0.1589920742208, 0.9872635482045,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual52 = JSON.stringify(input);
        expect(assertionActual52).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_1400
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 26
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.2255109027539, 0.7835046312625, -0.579021006121, 0.9741893064774, -0.1874523112186, 0.1257649639762,
          -0.01000139411555, -0.5924374429499, -0.8055543732776,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [1.805630619492, 0.6340810494855, 3.129177749513];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual53 = promiseResult.length;
        expect(assertionActual53).assertEqual(3);
        const assertionActual54 = callbackResult.length;
        expect(assertionActual54).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual55 = JSON.stringify(input);
        expect(assertionActual55).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.2255109027539, 0.7835046312625, -0.579021006121, 0, 0.9741893064774, -0.1874523112186, 0.1257649639762, 0,
          -0.01000139411555, -0.5924374429499, -0.8055543732776, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual56 = JSON.stringify(input);
        expect(assertionActual56).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_1500
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 27
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.4121289203032, -0.1051566363593, 0.9050369245944, 0, 0.2065988089146, 0.9782297765803, 0.01958153126813, 0,
          -0.8873931965058, 0.1789094353056, 0.4248820174517, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.1070856517743, -0.1798778903735, 1.124253792114];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual57 = promiseResult.length;
        expect(assertionActual57).assertEqual(3);
        const assertionActual58 = callbackResult.length;
        expect(assertionActual58).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual59 = JSON.stringify(input);
        expect(assertionActual59).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.4121289203032, -0.1051566363593, 0.9050369245944, 0.2065988089146, 0.9782297765803, 0.01958153126813,
          -0.8873931965058, 0.1789094353056, 0.4248820174517,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual60 = JSON.stringify(input);
        expect(assertionActual60).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_1600
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 28
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.7859731133904, 0.2503123803121, -0.5653228964848, -0.6126047087001, 0.438701401702, -0.657462205015,
          0.08343701759956, 0.8630670845347, 0.4981500493695,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.5185029802117, -1.041310888812, -0.1659532946952];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual61 = promiseResult.length;
        expect(assertionActual61).assertEqual(3);
        const assertionActual62 = callbackResult.length;
        expect(assertionActual62).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual63 = JSON.stringify(input);
        expect(assertionActual63).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.7859731133904, 0.2503123803121, -0.5653228964848, 0, -0.6126047087001, 0.438701401702, -0.657462205015, 0,
          0.08343701759956, 0.8630670845347, 0.4981500493695, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual64 = JSON.stringify(input);
        expect(assertionActual64).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_1700
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 29
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.7595412265357, -0.6359846054874, 0.1364577105762, 0, 0.2431469386928, -0.472183091823, -0.8473031889476, 0,
          0.6033048080341, -0.6103824287932, 0.5132802345927, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-2.209444170101, 0.6565433006592, -0.8658490585314];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual65 = promiseResult.length;
        expect(assertionActual65).assertEqual(3);
        const assertionActual66 = callbackResult.length;
        expect(assertionActual66).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual67 = JSON.stringify(input);
        expect(assertionActual67).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          -0.7595412265357, -0.6359846054874, 0.1364577105762, 0.2431469386928, -0.472183091823, -0.8473031889476,
          0.6033048080341, -0.6103824287932, 0.5132802345927,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual68 = JSON.stringify(input);
        expect(assertionActual68).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_1800
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 30
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9779082839819, -0.1585411774478, -0.1362353961829, 0.1380233468273, 0.9791917095818, -0.1487721466432,
          0.1569870817941, 0.1266818492906, 0.9794420683277,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.1605172763241, -0.1270231577823, -0.158930358601];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual69 = promiseResult.length;
        expect(assertionActual69).assertEqual(3);
        const assertionActual70 = callbackResult.length;
        expect(assertionActual70).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual71 = JSON.stringify(input);
        expect(assertionActual71).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.9779082839819, -0.1585411774478, -0.1362353961829, 0, 0.1380233468273, 0.9791917095818, -0.1487721466432, 0,
          0.1569870817941, 0.1266818492906, 0.9794420683277, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual72 = JSON.stringify(input);
        expect(assertionActual72).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_1900
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 31
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.263992163575, 0.9628744406711, 0.05639990313259, 0, -0.2811791904383, -0.02089313615178, -0.9594278189245,
          0, -0.9226301536561, -0.2691399048155, 0.2762558799382, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [1.592491635267, 0.2724998722158, 1.279869778404];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual73 = promiseResult.length;
        expect(assertionActual73).assertEqual(3);
        const assertionActual74 = callbackResult.length;
        expect(assertionActual74).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual75 = JSON.stringify(input);
        expect(assertionActual75).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          -0.263992163575, 0.9628744406711, 0.05639990313259, -0.2811791904383, -0.02089313615178, -0.9594278189245,
          -0.9226301536561, -0.2691399048155, 0.2762558799382,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual76 = JSON.stringify(input);
        expect(assertionActual76).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_2000
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 32
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.4507070562052, -0.7409639090041, -0.4978309301764, 0.6312018695239, -0.1298209792521, 0.764676868524,
          -0.631226860484, -0.6588770741948, 0.4091865732207,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-1.744241415335, 0.7193250282725, 0.9956592781138];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual77 = promiseResult.length;
        expect(assertionActual77).assertEqual(3);
        const assertionActual78 = callbackResult.length;
        expect(assertionActual78).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual79 = JSON.stringify(input);
        expect(assertionActual79).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.4507070562052, -0.7409639090041, -0.4978309301764, 0, 0.6312018695239, -0.1298209792521, 0.764676868524, 0,
          -0.631226860484, -0.6588770741948, 0.4091865732207, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual80 = JSON.stringify(input);
        expect(assertionActual80).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_2100
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 33
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.8819134064352, 0.2798756042476, -0.3793394122641, 0, -0.09906681521652, 0.8967513265633, 0.431303633685, 0,
          0.4608844862573, -0.3427925093319, 0.8185834019043, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.302519921471, 0.3498879082092, -0.5127896368625];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual81 = promiseResult.length;
        expect(assertionActual81).assertEqual(3);
        const assertionActual82 = callbackResult.length;
        expect(assertionActual82).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual83 = JSON.stringify(input);
        expect(assertionActual83).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.8819134064352, 0.2798756042476, -0.3793394122641, -0.09906681521652, 0.8967513265633, 0.431303633685,
          0.4608844862573, -0.3427925093319, 0.8185834019043,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual84 = JSON.stringify(input);
        expect(assertionActual84).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_2200
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 34
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.5421342847032, 0.8236597317385, -0.1663582389359, 0.8359065449325, 0.5488301884788, -0.006758132392476,
          0.08573602211676, -0.1427237560005, -0.986042222212,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.983025996081, 0.1432128010749, -3.054861139103];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual85 = promiseResult.length;
        expect(assertionActual85).assertEqual(3);
        const assertionActual86 = callbackResult.length;
        expect(assertionActual86).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual87 = JSON.stringify(input);
        expect(assertionActual87).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          -0.5421342847032, 0.8236597317385, -0.1663582389359, 0, 0.8359065449325, 0.5488301884788, -0.006758132392476,
          0, 0.08573602211676, -0.1427237560005, -0.986042222212, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual88 = JSON.stringify(input);
        expect(assertionActual88).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_2300
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 35
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9171846520842, 0.2260766282259, 0.3281183813065, 0, -0.3844075937579, 0.7188071667505, 0.5792642392634, 0,
          -0.1048957379612, -0.6574234671794, 0.7461844738129, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.3047207994215, 0.7173943155022, 0.1396609679006];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual89 = promiseResult.length;
        expect(assertionActual89).assertEqual(3);
        const assertionActual90 = callbackResult.length;
        expect(assertionActual90).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual91 = JSON.stringify(input);
        expect(assertionActual91).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.9171846520842, 0.2260766282259, 0.3281183813065, -0.3844075937579, 0.7188071667505, 0.5792642392634,
          -0.1048957379612, -0.6574234671794, 0.7461844738129,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual92 = JSON.stringify(input);
        expect(assertionActual92).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_2400
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 36
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.07272233206501, -0.6824502335183, 0.7273053974706, 0.9187720550191, 0.3295592413491, 0.2173674707894,
          -0.3880326962191, 0.6524204052696, 0.6509825200823,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-1.1209172815, -0.7107738119219, 0.5375265352187];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual93 = promiseResult.length;
        expect(assertionActual93).assertEqual(3);
        const assertionActual94 = callbackResult.length;
        expect(assertionActual94).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual95 = JSON.stringify(input);
        expect(assertionActual95).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.07272233206501, -0.6824502335183, 0.7273053974706, 0, 0.9187720550191, 0.3295592413491, 0.2173674707894, 0,
          -0.3880326962191, 0.6524204052696, 0.6509825200823, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual96 = JSON.stringify(input);
        expect(assertionActual96).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_2500
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 37
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.08159957790148, -0.1169506584453, -0.9897797999432, 0, -0.9923168822312, -0.08313172858914,
          0.09163144078711, 0, -0.09299846302623, 0.9896522920658, -0.1092685988002, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-2.188752078077, -1.426812972302, 2.436460549005];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual97 = promiseResult.length;
        expect(assertionActual97).assertEqual(3);
        const assertionActual98 = callbackResult.length;
        expect(assertionActual98).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual99 = JSON.stringify(input);
        expect(assertionActual99).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          -0.08159957790148, -0.1169506584453, -0.9897797999432, -0.9923168822312, -0.08313172858914, 0.09163144078711,
          -0.09299846302623, 0.9896522920658, -0.1092685988002,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual100 = JSON.stringify(input);
        expect(assertionActual100).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_2600
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 38
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9959329903304, -0.07417648870521, 0.0511402707741, 0.07457996150382, 0.9971968397664, -0.006024292651429,
          -0.05055005552492, 0.00981383122059, 0.9986733102488,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.07424826153455, -0.009813988757864, 0.05057404637522];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual101 = promiseResult.length;
        expect(assertionActual101).assertEqual(3);
        const assertionActual102 = callbackResult.length;
        expect(assertionActual102).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual103 = JSON.stringify(input);
        expect(assertionActual103).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.9959329903304, -0.07417648870521, 0.0511402707741, 0, 0.07457996150382, 0.9971968397664, -0.006024292651429,
          0, -0.05055005552492, 0.00981383122059, 0.9986733102488, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual104 = JSON.stringify(input);
        expect(assertionActual104).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_2700
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 39
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.2523551264661, -0.5964127358872, 0.7619768622588, 0, 0.221552758894, -0.730931060287, -0.6454875367768, 0,
          0.9419295436352, 0.3317101650224, -0.05231731308138, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-2.45719365398, -0.3381158022745, -1.626282019226];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual105 = promiseResult.length;
        expect(assertionActual105).assertEqual(3);
        const assertionActual106 = callbackResult.length;
        expect(assertionActual106).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual107 = JSON.stringify(input);
        expect(assertionActual107).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.2523551264661, -0.5964127358872, 0.7619768622588, 0.221552758894, -0.730931060287, -0.6454875367768,
          0.9419295436352, 0.3317101650224, -0.05231731308138,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual108 = JSON.stringify(input);
        expect(assertionActual108).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_2800
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 40
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.3191410009547, 0.6794742892143, 0.6606540030957, -0.1936233528425, 0.7291516860486, -0.6563899877105,
          -0.9277171005989, 0.08156291454631, 0.3642642889813,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.750146210101, -0.08165361935032, 1.196645748429];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual109 = promiseResult.length;
        expect(assertionActual109).assertEqual(3);
        const assertionActual110 = callbackResult.length;
        expect(assertionActual110).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual111 = JSON.stringify(input);
        expect(assertionActual111).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.3191410009547, 0.6794742892143, 0.6606540030957, 0, -0.1936233528425, 0.7291516860486, -0.6563899877105, 0,
          -0.9277171005989, 0.08156291454631, 0.3642642889813, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual112 = JSON.stringify(input);
        expect(assertionActual112).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_2900
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 41
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.7549178176348, 0.1703969099143, -0.6332961248178, 0, 0.276600029733, 0.7928400921157, 0.5430442080399, 0,
          0.5946356129339, -0.585123475367, 0.5513973217247, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.2116993525724, 0.6250323106333, -0.8231089407478];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual113 = promiseResult.length;
        expect(assertionActual113).assertEqual(3);
        const assertionActual114 = callbackResult.length;
        expect(assertionActual114).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual115 = JSON.stringify(input);
        expect(assertionActual115).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.7549178176348, 0.1703969099143, -0.6332961248178, 0.276600029733, 0.7928400921157, 0.5430442080399,
          0.5946356129339, -0.585123475367, 0.5513973217247,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual116 = JSON.stringify(input);
        expect(assertionActual116).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_3000
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 42
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.4779357646938, -0.6057339194729, -0.6361319231312, -0.3276834468081, -0.7948692050773, 0.5106921827361,
          -0.8149852535565, -0.03562815768282, -0.5783853999416,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-2.490420987176, 0.03563569951803, 2.187994873559];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual117 = promiseResult.length;
        expect(assertionActual117).assertEqual(3);
        const assertionActual118 = callbackResult.length;
        expect(assertionActual118).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual119 = JSON.stringify(input);
        expect(assertionActual119).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.4779357646938, -0.6057339194729, -0.6361319231312, 0, -0.3276834468081, -0.7948692050773, 0.5106921827361,
          0, -0.8149852535565, -0.03562815768282, -0.5783853999416, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual120 = JSON.stringify(input);
        expect(assertionActual120).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_3100
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 43
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9254513774494, -0.2467389976751, -0.28750585212, 0, 0.3115872694768, 0.9273770962055, 0.2070871674764, 0,
          0.2155298621466, -0.2812322678138, 0.9351231416575, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.260036971024, 0.285077962241, -0.2265269457495];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual121 = promiseResult.length;
        expect(assertionActual121).assertEqual(3);
        const assertionActual122 = callbackResult.length;
        expect(assertionActual122).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual123 = JSON.stringify(input);
        expect(assertionActual123).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.9254513774494, -0.2467389976751, -0.28750585212, 0.3115872694768, 0.9273770962055, 0.2070871674764,
          0.2155298621466, -0.2812322678138, 0.9351231416575,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual124 = JSON.stringify(input);
        expect(assertionActual124).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_3200
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 44
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.06870049557854, 0.1138666997868, 0.9911178621067, -0.9817441686188, 0.184340349572, 0.04687241088906,
          -0.1773658064289, -0.9762443393943, 0.1244522418863,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.5533313342326, 1.352391582092, 0.958950524982];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual125 = promiseResult.length;
        expect(assertionActual125).assertEqual(3);
        const assertionActual126 = callbackResult.length;
        expect(assertionActual126).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual127 = JSON.stringify(input);
        expect(assertionActual127).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.06870049557854, 0.1138666997868, 0.9911178621067, 0, -0.9817441686188, 0.184340349572, 0.04687241088906, 0,
          -0.1773658064289, -0.9762443393943, 0.1244522418863, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual128 = JSON.stringify(input);
        expect(assertionActual128).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_3300
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 45
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.2350515613421, -0.9609060008969, -0.1463230021252, 0, 0.5950831366664, -0.0232383195322, -0.8033281029322,
          0, 0.7685224941184, -0.2758978759353, 0.5772811603443, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-1.594975373191, 0.2795237097862, -0.9265550582795];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual129 = promiseResult.length;
        expect(assertionActual129).assertEqual(3);
        const assertionActual130 = callbackResult.length;
        expect(assertionActual130).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual131 = JSON.stringify(input);
        expect(assertionActual131).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          -0.2350515613421, -0.9609060008969, -0.1463230021252, 0.5950831366664, -0.0232383195322, -0.8033281029322,
          0.7685224941184, -0.2758978759353, 0.5772811603443,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual132 = JSON.stringify(input);
        expect(assertionActual132).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_3400
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 46
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9567992904959, 0.2589611743476, -0.1321901202322, -0.2873575138829, 0.9114927694692, -0.2942899767582,
          0.04428066080687, 0.3195622652721, 0.9465300743731,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.2768127413178, -0.3252674939562, -0.04674801220132];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual133 = promiseResult.length;
        expect(assertionActual133).assertEqual(3);
        const assertionActual134 = callbackResult.length;
        expect(assertionActual134).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual135 = JSON.stringify(input);
        expect(assertionActual135).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.9567992904959, 0.2589611743476, -0.1321901202322, 0, -0.2873575138829, 0.9114927694692, -0.2942899767582, 0,
          0.04428066080687, 0.3195622652721, 0.9465300743731, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual136 = JSON.stringify(input);
        expect(assertionActual136).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_3500
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 47
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.9363823665812, 0.1507971118885, -0.316935789399, 0, -0.2230290717641, 0.441601522682, 0.8690489792371, 0,
          0.2710094033496, 0.8844480347714, -0.3798757390056, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.3290625687668, -1.085309828325, -2.5219193433];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual137 = promiseResult.length;
        expect(assertionActual137).assertEqual(3);
        const assertionActual138 = callbackResult.length;
        expect(assertionActual138).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual139 = JSON.stringify(input);
        expect(assertionActual139).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          -0.9363823665812, 0.1507971118885, -0.316935789399, -0.2230290717641, 0.441601522682, 0.8690489792371,
          0.2710094033496, 0.8844480347714, -0.3798757390056,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual140 = JSON.stringify(input);
        expect(assertionActual140).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_3600
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 48
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.7897867492678, 0.1006051296618, 0.6050747875814, 0.3600147543804, 0.7226392688677, -0.5900693719545,
          -0.496614807783, 0.6838648221514, 0.5345115880077,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.138329890859, -0.7530466900122, 0.7486619000836];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual141 = promiseResult.length;
        expect(assertionActual141).assertEqual(3);
        const assertionActual142 = callbackResult.length;
        expect(assertionActual142).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual143 = JSON.stringify(input);
        expect(assertionActual143).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.7897867492678, 0.1006051296618, 0.6050747875814, 0, 0.3600147543804, 0.7226392688677, -0.5900693719545, 0,
          -0.496614807783, 0.6838648221514, 0.5345115880077, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual144 = JSON.stringify(input);
        expect(assertionActual144).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_3700
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 49
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.6709356286046, -0.7401243276816, 0.04540222288454, 0, 0.3950542109825, 0.3049651652289, -0.8665612606053, 0,
          0.6275169739967, 0.5993431634471, 0.4970012271366, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-1.179948911665, -0.642680315648, -0.900944882496];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual145 = promiseResult.length;
        expect(assertionActual145).assertEqual(3);
        const assertionActual146 = callbackResult.length;
        expect(assertionActual146).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual147 = JSON.stringify(input);
        expect(assertionActual147).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.6709356286046, -0.7401243276816, 0.04540222288454, 0.3950542109825, 0.3049651652289, -0.8665612606053,
          0.6275169739967, 0.5993431634471, 0.4970012271366,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual148 = JSON.stringify(input);
        expect(assertionActual148).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_3800
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 50
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.06511079098421, 0.9688033054177, 0.2391249470658, 0.3856951739114, -0.2454429014993, 0.8893801295987,
          0.9203259301567, 0.03432109432128, -0.3896437408271,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [1.81892212411, -0.03432783591285, -1.971290471064];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual149 = promiseResult.length;
        expect(assertionActual149).assertEqual(3);
        const assertionActual150 = callbackResult.length;
        expect(assertionActual150).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual151 = JSON.stringify(input);
        expect(assertionActual151).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.06511079098421, 0.9688033054177, 0.2391249470658, 0, 0.3856951739114, -0.2454429014993, 0.8893801295987, 0,
          0.9203259301567, 0.03432109432128, -0.3896437408271, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual152 = JSON.stringify(input);
        expect(assertionActual152).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_3900
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 51
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9937997270326, 0.07212814203131, -0.08461461857808, 0, -0.07614656301304, 0.9960687906732,
          -0.04526218275939, 0, 0.08101730365362, 0.05142465725656, 0.9953852023889, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.07228664036256, -0.05144734964945, -0.08121388911396];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual153 = promiseResult.length;
        expect(assertionActual153).assertEqual(3);
        const assertionActual154 = callbackResult.length;
        expect(assertionActual154).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual155 = JSON.stringify(input);
        expect(assertionActual155).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.9937997270326, 0.07212814203131, -0.08461461857808, -0.07614656301304, 0.9960687906732, -0.04526218275939,
          0.08101730365362, 0.05142465725656, 0.9953852023889,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual156 = JSON.stringify(input);
        expect(assertionActual156).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationAxesTest0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_AXES_4000
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 52
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationAxesTest0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.1444837174777, -0.9217542626732, -0.3598521010465, 0.2707288699368, -0.386615740869, 0.8816088406403,
          -0.9517511935199, 0.0299557699962, 0.3054051693691,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-1.967943704339, -0.0299602519321, 1.260288424961];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual157 = promiseResult.length;
        expect(assertionActual157).assertEqual(3);
        const assertionActual158 = callbackResult.length;
        expect(assertionActual158).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual159 = JSON.stringify(input);
        expect(assertionActual159).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          -0.1444837174777, -0.9217542626732, -0.3598521010465, 0, 0.2707288699368, -0.386615740869, 0.8816088406403, 0,
          -0.9517511935199, 0.0299557699962, 0.3054051693691, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual160 = JSON.stringify(input);
        expect(assertionActual160).assertEqual(inputBefore);
      },
    );
  });
}
