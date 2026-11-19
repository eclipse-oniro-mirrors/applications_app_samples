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
import { assertArrayNear, assertRotationMatrix, transformCallback } from '../Shared/SharedDriver';

export default function sensorCoordinateNavigationTest(): void {
  describe('SensorCoordinateNavigation', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorCoordinateNavigationTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_NAVIGATION_0100
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 13
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateNavigationTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.352066288428, -0.756206695631, -0.5515439801461, -0.9262995087498, 0.1969954552469, 0.321188434882,
          -0.1342331875594, 0.6239745380181, -0.7698293494423,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 129, y: 3 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.352066288428, -0.5515439801461, -0.756206695631, 0.9262995087498, 0.321188434882, 0.1969954552469,
          0.1342331875594, -0.7698293494423, 0.6239745380181,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual4 = JSON.stringify(coordinates);
        expect(assertionActual4).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateNavigationTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_NAVIGATION_0200
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 14
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateNavigationTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.6943677072541, -0.6537756073188, 0.300717379607, 0.4296272011071, 0.7118570341149, 0.5555898046672,
          -0.5772988439202, -0.2565872527157, 0.7751703209955,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 129, y: 130 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.6943677072541, 0.6537756073188, 0.300717379607, -0.4296272011071, -0.7118570341149, 0.5555898046672,
          0.5772988439202, 0.2565872527157, 0.7751703209955,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual8 = JSON.stringify(coordinates);
        expect(assertionActual8).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateNavigationTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_NAVIGATION_0300
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateNavigationTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.5401756043212, 0.5969956376464, 0.5931328056409, -0.8127980464974, 0.1874416179299, 0.5515659303093,
          0.2181046815324, -0.7800396454662, 0.5864882772866,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 129, y: 131 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.5401756043212, -0.5931328056409, -0.5969956376464, 0.8127980464974, -0.5515659303093, -0.1874416179299,
          -0.2181046815324, -0.5864882772866, 0.7800396454662,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual12 = JSON.stringify(coordinates);
        expect(assertionActual12).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateNavigationTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_NAVIGATION_0400
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateNavigationTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.6635970126066, -0.7188472043092, -0.2071176035892, 0.2583160441686, 0.0396492900446, -0.9652464737693,
          0.7020767950764, -0.6940364764592, 0.1593786157532,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 130, y: 1 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.7188472043092, 0.6635970126066, -0.2071176035892, 0.0396492900446, -0.2583160441686, -0.9652464737693,
          -0.6940364764592, -0.7020767950764, 0.1593786157532,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual16 = JSON.stringify(coordinates);
        expect(assertionActual16).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateNavigationTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_NAVIGATION_0500
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 17
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateNavigationTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9995097961882, -0.02144216795794, -0.02281229399205, 0.02202111203564, 0.9994338404991, 0.02543755274905,
          0.02225394231659, -0.02592743524552, 0.9994160946037,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 130, y: 3 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.02281229399205, -0.9995097961882, -0.02144216795794, -0.02543755274905, -0.02202111203564, 0.9994338404991,
          -0.9994160946037, -0.02225394231659, -0.02592743524552,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual20 = JSON.stringify(coordinates);
        expect(assertionActual20).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateNavigationTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_NAVIGATION_0600
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 18
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateNavigationTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.6652471999288, 0.6780235160305, 0.3126184170781, -0.7434020290899, -0.5626659815184, -0.3616080977894,
          -0.0692790454023, -0.4729599401128, 0.8783560262881,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 130, y: 129 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.6780235160305, 0.6652471999288, -0.3126184170781, 0.5626659815184, 0.7434020290899, 0.3616080977894,
          0.4729599401128, 0.0692790454023, -0.8783560262881,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual24 = JSON.stringify(coordinates);
        expect(assertionActual24).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateNavigationTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_NAVIGATION_0700
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 19
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateNavigationTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.683211795016, 0.3186069742804, 0.6570473644197, 0.5419379123995, 0.3818309489727, -0.7486711063683,
          -0.4894128546075, 0.8675798074797, 0.0882062095228,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 130, y: 131 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.6570473644197, -0.683211795016, -0.3186069742804, -0.7486711063683, -0.5419379123995, -0.3818309489727,
          0.0882062095228, 0.4894128546075, -0.8675798074797,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual28 = JSON.stringify(coordinates);
        expect(assertionActual28).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateNavigationTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_NAVIGATION_0800
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateNavigationTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.6903542650139, -0.302813976074, -0.6570499864328, 0.09930938547355, 0.9392575116722, -0.3285315399231,
          0.7166230771709, 0.1615519193995, 0.678492699006,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 131, y: 1 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.302813976074, 0.6570499864328, -0.6903542650139, 0.9392575116722, 0.3285315399231, -0.09930938547355,
          0.1615519193995, -0.678492699006, -0.7166230771709,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual32 = JSON.stringify(coordinates);
        expect(assertionActual32).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateNavigationTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_NAVIGATION_0900
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 21
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateNavigationTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.03577430252928, -0.5050503424222, 0.8623481610682, -0.7166554144543, -0.6143681935407, -0.3300859580456,
          0.6965093080583, -0.6061978838505, -0.3839256560889,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 131, y: 2 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.8623481610682, -0.5050503424222, -0.03577430252928, -0.3300859580456, -0.6143681935407, 0.7166554144543,
          -0.3839256560889, -0.6061978838505, -0.6965093080583,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual36 = JSON.stringify(coordinates);
        expect(assertionActual36).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateNavigationTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_NAVIGATION_1000
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 22
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateNavigationTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.8780105384565, 0.4113655387235, -0.2446955003878, -0.4683322891061, 0.8438802367876, -0.2617842870378,
          0.09880466254147, 0.3444481666521, 0.9335915055044,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 131, y: 129 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.4113655387235, -0.2446955003878, -0.8780105384565, -0.8438802367876, -0.2617842870378, 0.4683322891061,
          -0.3444481666521, 0.9335915055044, -0.09880466254147,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual40 = JSON.stringify(coordinates);
        expect(assertionActual40).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateNavigationTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_NAVIGATION_1100
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 23
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateNavigationTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.03773517744723, -0.9595777087368, 0.2789026304618, 0.3200183726315, 0.276006668196, 0.9063159274169,
          -0.9466595468073, 0.05505397357869, 0.3174976573644,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 131, y: 130 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.2789026304618, 0.9595777087368, -0.03773517744723, -0.9063159274169, -0.276006668196, -0.3200183726315,
          -0.3174976573644, -0.05505397357869, 0.9466595468073,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual44 = JSON.stringify(coordinates);
        expect(assertionActual44).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateNavigationTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_NAVIGATION_1200
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 24
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateNavigationTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.01487830343383, 0.999699365847, 0.01948881761278, -0.08267311067734, -0.01819429904774, 0.9964106203032,
          0.9964656506161, -0.01643610072904, 0.08237755601474,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 1, y: 2 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.01487830343383, 0.999699365847, 0.01948881761278, -0.08267311067734, -0.01819429904774, 0.9964106203032,
          0.9964656506161, -0.01643610072904, 0.08237755601474,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual48 = JSON.stringify(coordinates);
        expect(assertionActual48).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateNavigationTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_NAVIGATION_1300
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 25
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateNavigationTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9671784905031, -0.2516798535886, 0.03497168577169, 0.2540345661253, 0.9546616005856, -0.1552020218326,
          0.005675096617518, 0.1589920742208, 0.9872635482045,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 1, y: 3 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.9671784905031, -0.03497168577169, -0.2516798535886, 0.2540345661253, 0.1552020218326, 0.9546616005856,
          0.005675096617518, -0.9872635482045, 0.1589920742208,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual52 = JSON.stringify(coordinates);
        expect(assertionActual52).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateNavigationTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_NAVIGATION_1400
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 26
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateNavigationTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.2255109027539, 0.7835046312625, -0.579021006121, 0.9741893064774, -0.1874523112186, 0.1257649639762,
          -0.01000139411555, -0.5924374429499, -0.8055543732776,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 1, y: 130 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.2255109027539, -0.7835046312625, 0.579021006121, 0.9741893064774, 0.1874523112186, -0.1257649639762,
          -0.01000139411555, 0.5924374429499, 0.8055543732776,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual56 = JSON.stringify(coordinates);
        expect(assertionActual56).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateNavigationTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_NAVIGATION_1500
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 27
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateNavigationTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.4121289203032, -0.1051566363593, 0.9050369245944, 0.2065988089146, 0.9782297765803, 0.01958153126813,
          -0.8873931965058, 0.1789094353056, 0.4248820174517,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 1, y: 131 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.4121289203032, 0.9050369245944, 0.1051566363593, 0.2065988089146, 0.01958153126813, -0.9782297765803,
          -0.8873931965058, 0.4248820174517, -0.1789094353056,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual60 = JSON.stringify(coordinates);
        expect(assertionActual60).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateNavigationTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_NAVIGATION_1600
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 28
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateNavigationTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.7859731133904, 0.2503123803121, -0.5653228964848, -0.6126047087001, 0.438701401702, -0.657462205015,
          0.08343701759956, 0.8630670845347, 0.4981500493695,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 2, y: 1 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.2503123803121, 0.7859731133904, 0.5653228964848, 0.438701401702, -0.6126047087001, 0.657462205015,
          0.8630670845347, 0.08343701759956, -0.4981500493695,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual64 = JSON.stringify(coordinates);
        expect(assertionActual64).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateNavigationTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_NAVIGATION_1700
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 29
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateNavigationTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.7595412265357, -0.6359846054874, 0.1364577105762, 0.2431469386928, -0.472183091823, -0.8473031889476,
          0.6033048080341, -0.6103824287932, 0.5132802345927,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 2, y: 3 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.1364577105762, -0.7595412265357, -0.6359846054874, -0.8473031889476, 0.2431469386928, -0.472183091823,
          0.5132802345927, 0.6033048080341, -0.6103824287932,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual68 = JSON.stringify(coordinates);
        expect(assertionActual68).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateNavigationTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_NAVIGATION_1800
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 30
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateNavigationTest0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9779082839819, -0.1585411774478, -0.1362353961829, 0.1380233468273, 0.9791917095818, -0.1487721466432,
          0.1569870817941, 0.1266818492906, 0.9794420683277,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 2, y: 129 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.1585411774478, 0.9779082839819, -0.1362353961829, -0.9791917095818, 0.1380233468273, -0.1487721466432,
          -0.1266818492906, 0.1569870817941, 0.9794420683277,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual72 = JSON.stringify(coordinates);
        expect(assertionActual72).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateNavigationTest0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_NAVIGATION_1900
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 31
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateNavigationTest0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.263992163575, 0.9628744406711, 0.05639990313259, -0.2811791904383, -0.02089313615178, -0.9594278189245,
          -0.9226301536561, -0.2691399048155, 0.2762558799382,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 2, y: 131 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.05639990313259, -0.263992163575, -0.9628744406711, 0.9594278189245, -0.2811791904383, 0.02089313615178,
          -0.2762558799382, -0.9226301536561, 0.2691399048155,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual76 = JSON.stringify(coordinates);
        expect(assertionActual76).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateNavigationTest0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_NAVIGATION_2000
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 32
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateNavigationTest0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.4507070562052, -0.7409639090041, -0.4978309301764, 0.6312018695239, -0.1298209792521, 0.764676868524,
          -0.631226860484, -0.6588770741948, 0.4091865732207,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 3, y: 1 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.7409639090041, -0.4978309301764, 0.4507070562052, -0.1298209792521, 0.764676868524, 0.6312018695239,
          -0.6588770741948, 0.4091865732207, -0.631226860484,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual80 = JSON.stringify(coordinates);
        expect(assertionActual80).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateNavigationTest0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_NAVIGATION_2100
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 33
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateNavigationTest0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.8819134064352, 0.2798756042476, -0.3793394122641, -0.09906681521652, 0.8967513265633, 0.431303633685,
          0.4608844862573, -0.3427925093319, 0.8185834019043,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 3, y: 2 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.3793394122641, 0.2798756042476, 0.8819134064352, -0.431303633685, 0.8967513265633, -0.09906681521652,
          -0.8185834019043, -0.3427925093319, 0.4608844862573,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual84 = JSON.stringify(coordinates);
        expect(assertionActual84).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateNavigationTest0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_NAVIGATION_2200
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 34
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateNavigationTest0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.5421342847032, 0.8236597317385, -0.1663582389359, 0.8359065449325, 0.5488301884788, -0.006758132392476,
          0.08573602211676, -0.1427237560005, -0.986042222212,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 3, y: 129 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.8236597317385, 0.1663582389359, -0.5421342847032, -0.5488301884788, 0.006758132392476, 0.8359065449325,
          0.1427237560005, 0.986042222212, 0.08573602211676,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual88 = JSON.stringify(coordinates);
        expect(assertionActual88).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateNavigationTest0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_NAVIGATION_2300
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 35
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateNavigationTest0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9171846520842, 0.2260766282259, 0.3281183813065, -0.3844075937579, 0.7188071667505, 0.5792642392634,
          -0.1048957379612, -0.6574234671794, 0.7461844738129,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 3, y: 130 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.3281183813065, -0.2260766282259, 0.9171846520842, 0.5792642392634, -0.7188071667505, -0.3844075937579,
          0.7461844738129, 0.6574234671794, -0.1048957379612,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual92 = JSON.stringify(coordinates);
        expect(assertionActual92).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateNavigationTest0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_NAVIGATION_2400
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 36
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateNavigationTest0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.07272233206501, -0.6824502335183, 0.7273053974706, 0.9187720550191, 0.3295592413491, 0.2173674707894,
          -0.3880326962191, 0.6524204052696, 0.6509825200823,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 129, y: 2 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.07272233206501, -0.6824502335183, -0.7273053974706, -0.9187720550191, 0.3295592413491, -0.2173674707894,
          0.3880326962191, 0.6524204052696, -0.6509825200823,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual93 = promiseResult.length;
        expect(assertionActual93).assertEqual(9);
        const assertionActual94 = callbackResult.length;
        expect(assertionActual94).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual95 = JSON.stringify(input);
        expect(assertionActual95).assertEqual(inputBefore);
        const assertionActual96 = JSON.stringify(coordinates);
        expect(assertionActual96).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateNavigationTest0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_NAVIGATION_2500
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 37
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateNavigationTest0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.08159957790148, -0.1169506584453, -0.9897797999432, -0.9923168822312, -0.08313172858914, 0.09163144078711,
          -0.09299846302623, 0.9896522920658, -0.1092685988002,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 129, y: 3 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.08159957790148, -0.9897797999432, -0.1169506584453, 0.9923168822312, 0.09163144078711, -0.08313172858914,
          0.09299846302623, -0.1092685988002, 0.9896522920658,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual97 = promiseResult.length;
        expect(assertionActual97).assertEqual(9);
        const assertionActual98 = callbackResult.length;
        expect(assertionActual98).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual99 = JSON.stringify(input);
        expect(assertionActual99).assertEqual(inputBefore);
        const assertionActual100 = JSON.stringify(coordinates);
        expect(assertionActual100).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateNavigationTest0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_NAVIGATION_2600
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 38
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateNavigationTest0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9959329903304, -0.07417648870521, 0.0511402707741, 0.07457996150382, 0.9971968397664, -0.006024292651429,
          -0.05055005552492, 0.00981383122059, 0.9986733102488,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 129, y: 130 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.9959329903304, 0.07417648870521, 0.0511402707741, -0.07457996150382, -0.9971968397664, -0.006024292651429,
          0.05055005552492, -0.00981383122059, 0.9986733102488,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual101 = promiseResult.length;
        expect(assertionActual101).assertEqual(9);
        const assertionActual102 = callbackResult.length;
        expect(assertionActual102).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual103 = JSON.stringify(input);
        expect(assertionActual103).assertEqual(inputBefore);
        const assertionActual104 = JSON.stringify(coordinates);
        expect(assertionActual104).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateNavigationTest0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_NAVIGATION_2700
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 39
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateNavigationTest0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.2523551264661, -0.5964127358872, 0.7619768622588, 0.221552758894, -0.730931060287, -0.6454875367768,
          0.9419295436352, 0.3317101650224, -0.05231731308138,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 129, y: 131 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.2523551264661, -0.7619768622588, 0.5964127358872, -0.221552758894, 0.6454875367768, 0.730931060287,
          -0.9419295436352, 0.05231731308138, -0.3317101650224,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual105 = promiseResult.length;
        expect(assertionActual105).assertEqual(9);
        const assertionActual106 = callbackResult.length;
        expect(assertionActual106).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual107 = JSON.stringify(input);
        expect(assertionActual107).assertEqual(inputBefore);
        const assertionActual108 = JSON.stringify(coordinates);
        expect(assertionActual108).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateNavigationTest0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_NAVIGATION_2800
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 40
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateNavigationTest0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.3191410009547, 0.6794742892143, 0.6606540030957, -0.1936233528425, 0.7291516860486, -0.6563899877105,
          -0.9277171005989, 0.08156291454631, 0.3642642889813,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 130, y: 1 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.6794742892143, -0.3191410009547, 0.6606540030957, 0.7291516860486, 0.1936233528425, -0.6563899877105,
          0.08156291454631, 0.9277171005989, 0.3642642889813,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual109 = promiseResult.length;
        expect(assertionActual109).assertEqual(9);
        const assertionActual110 = callbackResult.length;
        expect(assertionActual110).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual111 = JSON.stringify(input);
        expect(assertionActual111).assertEqual(inputBefore);
        const assertionActual112 = JSON.stringify(coordinates);
        expect(assertionActual112).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateNavigationTest0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_NAVIGATION_2900
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 41
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateNavigationTest0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.7549178176348, 0.1703969099143, -0.6332961248178, 0.276600029733, 0.7928400921157, 0.5430442080399,
          0.5946356129339, -0.585123475367, 0.5513973217247,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 130, y: 3 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.6332961248178, -0.7549178176348, 0.1703969099143, -0.5430442080399, -0.276600029733, 0.7928400921157,
          -0.5513973217247, -0.5946356129339, -0.585123475367,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual113 = promiseResult.length;
        expect(assertionActual113).assertEqual(9);
        const assertionActual114 = callbackResult.length;
        expect(assertionActual114).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual115 = JSON.stringify(input);
        expect(assertionActual115).assertEqual(inputBefore);
        const assertionActual116 = JSON.stringify(coordinates);
        expect(assertionActual116).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateNavigationTest0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_NAVIGATION_3000
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 42
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateNavigationTest0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.4779357646938, -0.6057339194729, -0.6361319231312, -0.3276834468081, -0.7948692050773, 0.5106921827361,
          -0.8149852535565, -0.03562815768282, -0.5783853999416,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 130, y: 129 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.6057339194729, -0.4779357646938, 0.6361319231312, 0.7948692050773, 0.3276834468081, -0.5106921827361,
          0.03562815768282, 0.8149852535565, 0.5783853999416,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual117 = promiseResult.length;
        expect(assertionActual117).assertEqual(9);
        const assertionActual118 = callbackResult.length;
        expect(assertionActual118).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual119 = JSON.stringify(input);
        expect(assertionActual119).assertEqual(inputBefore);
        const assertionActual120 = JSON.stringify(coordinates);
        expect(assertionActual120).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateNavigationTest0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_NAVIGATION_3100
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 43
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateNavigationTest0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9254513774494, -0.2467389976751, -0.28750585212, 0.3115872694768, 0.9273770962055, 0.2070871674764,
          0.2155298621466, -0.2812322678138, 0.9351231416575,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 130, y: 131 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.28750585212, -0.9254513774494, 0.2467389976751, 0.2070871674764, -0.3115872694768, -0.9273770962055,
          0.9351231416575, -0.2155298621466, 0.2812322678138,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual121 = promiseResult.length;
        expect(assertionActual121).assertEqual(9);
        const assertionActual122 = callbackResult.length;
        expect(assertionActual122).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual123 = JSON.stringify(input);
        expect(assertionActual123).assertEqual(inputBefore);
        const assertionActual124 = JSON.stringify(coordinates);
        expect(assertionActual124).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );
  });
}
