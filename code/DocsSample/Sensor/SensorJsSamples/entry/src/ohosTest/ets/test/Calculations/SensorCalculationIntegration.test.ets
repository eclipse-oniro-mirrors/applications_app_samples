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

export default function sensorCalculationIntegrationTest(): void {
  describe('SensorCalculationIntegration', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorCalculationIntegrationTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_INTEGRATION_0100
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationIntegrationTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.8598165055393, -0.4997752411494, 0.1045958179673, 0, 0.4891789912977, 0.7475561595031, -0.449292446923, 0,
          0.1463539930278, 0.4374751384057, 0.8872406730993, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.5763245454145, -0.8107948262204, 0.1022827850956, 0, 0.3803403540483, 0.3768944241792, 0.844566047213, 0,
          -0.7233195928738, -0.4478418725363, 0.5255914989496, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-0.5777510520446, -0.9444512081951, -1.403574147101];
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
     * @tc.name testSensorCalculationIntegrationTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_INTEGRATION_0200
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationIntegrationTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.1373314756002, 0.9461679309424, 0.2930977861835, -0.4078161433075, 0.3236681114109, -0.8537710155033,
          -0.90267716215, -0.002280375389617, 0.430312375863,
        ];
        const previous: number[] = [
          -0.7868506055107, 0.43242381326, -0.4403132638623, -0.4404370117603, 0.1063010131471, 0.8914680775415,
          0.4322977715408, 0.8953824547809, 0.106812435565,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-1.109409764878, 0.1286688123912, 2.589137026559];
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
     * @tc.name testSensorCalculationIntegrationTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_INTEGRATION_0300
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationIntegrationTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.150783574646, 0.160807000506, -0.9754001344091, 0, 0.97429605367, 0.1912205535496, -0.1190877815029, 0,
          0.1673664046936, -0.9682849830956, -0.1855065446055, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.9957682584305, 0.079011294632, -0.04693389844198, 0, -0.0747973224213, 0.9935167068317, 0.08561491578501, 0,
          0.05339415755483, -0.08174208565265, 0.9952222341629, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [0.322317653031, 1.269103015443, -2.096214220961];
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
     * @tc.name testSensorCalculationIntegrationTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_INTEGRATION_0400
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationIntegrationTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.9962760779976, 0.05222182645675, 0.06860653941986, -0.0617868882633, 0.9874045030909, 0.1456527641841,
          -0.06013615259048, -0.1493493492361, 0.9869541098928,
        ];
        const previous: number[] = [
          -0.3490327195528, -0.4355497993788, -0.8297424497654, 0.8992487120107, -0.404807743951, -0.1657782988944,
          -0.2636814643251, -0.8040068797581, 0.5329587438751,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [1.891904261375, 0.2906948028718, 1.087818207536];
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
     * @tc.name testSensorCalculationIntegrationTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_INTEGRATION_0500
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationIntegrationTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          -0.06096295830452, 0.7809805515792, -0.6215729207179, 0, 0.9677116590192, 0.1988347013258, 0.1549158047035, 0,
          0.2445764966488, -0.5920592365665, -0.7678855368369, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.4532200016089, 0.6890426669728, 0.5655190829959, 0, 0.2739617666288, 0.496040276234, -0.8239472038786, 0,
          -0.8482550209502, 0.5283599601074, 0.03604402846634, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [1.229031507654, -0.2593888650177, 2.122775375053];
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
     * @tc.name testSensorCalculationIntegrationTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_INTEGRATION_0600
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationIntegrationTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.5845574626383, 0.02445886359415, 0.8109835614028, -0.6504596317475, 0.6115849495402, 0.4504066129209,
          -0.4849689065711, -0.7908006155079, 0.3734160496974,
        ];
        const previous: number[] = [
          0.8052304378345, -0.02845083854308, -0.5922790657882, -0.2321776813264, 0.9039665875626, -0.3590792849278,
          0.545616592745, 0.4266555500126, 0.7212957613661,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-1.20084659161, 0.9348249052416, 2.249150539549];
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
     * @tc.name testSensorCalculationIntegrationTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_INTEGRATION_0700
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationIntegrationTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.4898867729384, -0.7121936967305, -0.50278334105, 0, 0.6219801799544, 0.6896430103211, -0.3708546535493, 0,
          0.610861363522, -0.1310444834879, 0.7808173524605, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.210083759566, -0.2793505625078, -0.9369247980458, 0, -0.1446421455818, -0.9566461434959, 0.2527979546117, 0,
          -0.9669247456178, 0.08241006832277, -0.2413816831305, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-2.887129855467, -1.061820475373, 1.172829975715];
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
     * @tc.name testSensorCalculationIntegrationTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_INTEGRATION_0800
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationIntegrationTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.04272199666908, 0.1320978686249, -0.9903155982339, -0.4195007394931, -0.8972379588152, -0.1377794426822,
          -0.9067491166609, 0.421324338682, 0.01708335648574,
        ];
        const previous: number[] = [
          0.8560591070688, -0.4563511988073, -0.2427063834175, 0.3202250735055, 0.8368459127808, -0.4440099329526,
          0.405732310154, 0.302378077263, 0.8625246610317,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-3.136781445319, -0.817918498505, 1.089924637592];
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
     * @tc.name testSensorCalculationIntegrationTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_INTEGRATION_0900
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationIntegrationTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.9285267848785, 0.2813475971308, -0.2422427281716, 0, -0.2687984530607, 0.9595182593204, 0.08409578861605, 0,
          0.2560964689241, -0.01297072162775, 0.96656420324, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          -0.003214102119508, 0.4502172006043, 0.8929132890867, 0, -0.89341366487, 0.3998288947861, -0.2048142532095, 0,
          -0.4492234332392, -0.7983992279394, 0.4009451082812, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-1.022416383938, -0.04951567651351, -1.415976159394];
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
     * @tc.name testSensorCalculationIntegrationTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_INTEGRATION_1000
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationIntegrationTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.1461172457558, 0.05492985162532, 0.9877410905157, 0.9815387329825, 0.1165124272826, -0.1516791677979,
          -0.1234158261645, 0.9916690807367, -0.03689130199638,
        ];
        const previous: number[] = [
          0.1432168345709, -0.2045155338136, -0.9683296622145, 0.9143037688283, -0.3472063226507, 0.2085578764223,
          -0.3788635065586, -0.915216458517, 0.1372635328767,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [-2.875640589193, -0.1074359415223, -3.095029982887];
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
     * @tc.name testSensorCalculationIntegrationTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_INTEGRATION_1100
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 11
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationIntegrationTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.3374945473034, 0.2851201012716, -0.8971086658769, 0, -0.9214352846058, -0.09482336820873, -0.3767831539824,
          0, -0.1924953163686, 0.9537898388494, 0.2307173519346, 0, 0, 0, 0, 1,
        ];
        const previous: number[] = [
          0.9767990374845, 0.1890173339599, -0.100678139792, 0, -0.1923997512049, 0.9809999144568, -0.02492997336721, 0,
          0.0940530494221, 0.04372202303737, 0.9946066602411, 0, 0, 0, 0, 1,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [1.564139658415, -1.174001227805, 0.5514091228817];
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
     * @tc.name testSensorCalculationIntegrationTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_INTEGRATION_1200
     * @tc.desc Verify sensor.getAngleVariation with independent expectations for input partition 12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationIntegrationTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const current: number[] = [
          0.9516399709796, 0.0571749708959, -0.301848286954, 0.06814049422043, 0.9187743698629, 0.3888579822127,
          0.299563413456, -0.3906208903607, 0.8704464838992,
        ];
        const previous: number[] = [
          0.04327789429915, 0.9989386532097, -0.01576676849155, 0.7064348183267, -0.01943847823882, 0.7075111257213,
          0.7064537290727, -0.04175778594937, -0.7065263024063,
        ];
        const currentBefore: string = JSON.stringify(current);
        const previousBefore: string = JSON.stringify(previous);
        const expected: number[] = [1.423911488762, -1.181366170061, 2.652293672157];
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
  });
}
