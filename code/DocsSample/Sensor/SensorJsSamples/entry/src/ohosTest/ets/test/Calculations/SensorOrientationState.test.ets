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

export default function sensorOrientationStateTest(): void {
  describe('SensorOrientationState', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorOrientationStateTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_0100
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 53
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.388789250993, 0.5333797121774, 0.7512316559823, 0, -0.9082642096779, 0.08507294258626, 0.4096568318214, 0,
          0.1545931555101, -0.8415869991137, 0.5175251483669, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [1.412630672579, 1.000214757017, -0.2902785979075];
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
          0.388789250993, 0.5333797121774, 0.7512316559823, -0.9082642096779, 0.08507294258626, 0.4096568318214,
          0.1545931555101, -0.8415869991137, 0.5175251483669,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual4 = JSON.stringify(input);
        expect(assertionActual4).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_0200
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 54
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.7501253590089, -0.4580035875012, -0.4770164144008, 0.3013765940195, 0.8788387122764, -0.369884666324,
          0.5886289955048, 0.1336982858546, 0.7972707658071,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.480421222452, -0.1340998389885, -0.6359741993081];
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
          0.7501253590089, -0.4580035875012, -0.4770164144008, 0, 0.3013765940195, 0.8788387122764, -0.369884666324, 0,
          0.5886289955048, 0.1336982858546, 0.7972707658071, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual8 = JSON.stringify(input);
        expect(assertionActual8).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_0300
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 55
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.1045304346738, 0.9476785433518, -0.3016268666707, 0, 0.8910888472751, -0.2239255707321, -0.3947378940946, 0,
          -0.4416266007487, -0.2275142132769, -0.8678728180259, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [1.802829032127, 0.2295241856234, 2.670881425695];
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
          0.1045304346738, 0.9476785433518, -0.3016268666707, 0.8910888472751, -0.2239255707321, -0.3947378940946,
          -0.4416266007487, -0.2275142132769, -0.8678728180259,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual12 = JSON.stringify(input);
        expect(assertionActual12).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_0400
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 56
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9307567409562, -0.3417202060207, 0.1300737866049, 0.3581000423984, 0.7800670351149, -0.5130884722554,
          0.07386642538294, 0.5241399827568, 0.8484226715953,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.41288472358, -0.5517049529756, -0.08684425355785];
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
          0.9307567409562, -0.3417202060207, 0.1300737866049, 0, 0.3581000423984, 0.7800670351149, -0.5130884722554, 0,
          0.07386642538294, 0.5241399827568, 0.8484226715953, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual16 = JSON.stringify(input);
        expect(assertionActual16).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_0500
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 57
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.4838941601612, 0.8320408006132, 0.2712094170136, 0, 0.09283387558571, 0.259355667269, -0.9613097884653, 0,
          -0.8701886653512, 0.4903496140209, 0.04825912062983, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [1.268631084314, -0.5124908593348, 1.515394851047];
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
          0.4838941601612, 0.8320408006132, 0.2712094170136, 0.09283387558571, 0.259355667269, -0.9613097884653,
          -0.8701886653512, 0.4903496140209, 0.04825912062983,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual20 = JSON.stringify(input);
        expect(assertionActual20).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_0600
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 58
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.5050475719763, -0.6935976099103, -0.5136626378933, 0.3933513583046, 0.3447697563503, -0.8522960307464,
          0.7682458323745, -0.6324999372592, 0.09870243363943,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-1.109491773133, 0.6847765312436, -1.443018644358];
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
          -0.5050475719763, -0.6935976099103, -0.5136626378933, 0, 0.3933513583046, 0.3447697563503, -0.8522960307464,
          0, 0.7682458323745, -0.6324999372592, 0.09870243363943, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual24 = JSON.stringify(input);
        expect(assertionActual24).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_0700
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 59
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9863646807259, 0.1475262863685, 0.0729432069955, 0, -0.156658898967, 0.9774647265082, 0.1414945151115, 0,
          -0.05042525152058, -0.1509923947175, 0.9872479884743, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.1497968932729, 0.1515721005469, 0.05103223357577];
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
          0.9863646807259, 0.1475262863685, 0.0729432069955, -0.156658898967, 0.9774647265082, 0.1414945151115,
          -0.05042525152058, -0.1509923947175, 0.9872479884743,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual28 = JSON.stringify(input);
        expect(assertionActual28).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_0800
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 60
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.5514267501365, 0.1422787592498, -0.8220007870435, -0.7414834528319, -0.5351135778878, 0.4047909929044,
          -0.3822706219555, 0.8327125635094, 0.4005732868818,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [2.881720026151, -0.9839887172678, 0.7620227101292];
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
          -0.5514267501365, 0.1422787592498, -0.8220007870435, 0, -0.7414834528319, -0.5351135778878, 0.4047909929044,
          0, -0.3822706219555, 0.8327125635094, 0.4005732868818, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual32 = JSON.stringify(input);
        expect(assertionActual32).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_0900
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 61
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.5245860399033, -0.7284773554556, 0.4406021213373, 0, 0.2523223275834, 0.6273115876367, 0.7367588581209, 0,
          -0.8131069608247, -0.2753196589512, 0.5128900034642, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.8598777764956, 0.278922196102, 1.008052812364];
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
          0.5245860399033, -0.7284773554556, 0.4406021213373, 0.2523223275834, 0.6273115876367, 0.7367588581209,
          -0.8131069608247, -0.2753196589512, 0.5128900034642,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual36 = JSON.stringify(input);
        expect(assertionActual36).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_1000
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 62
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.6731482977625, 0.5918154912464, -0.4434250709424, -0.1143271260742, 0.6756969750991, 0.7282601911992,
          0.7306166419287, -0.4395315940438, 0.5225048328717,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.7193164853393, 0.4550771285216, -0.9499708460216];
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
          0.6731482977625, 0.5918154912464, -0.4434250709424, 0, -0.1143271260742, 0.6756969750991, 0.7282601911992, 0,
          0.7306166419287, -0.4395315940438, 0.5225048328717, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual40 = JSON.stringify(input);
        expect(assertionActual40).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_1100
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 63
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9409005282164, -0.3386148403948, -0.006796018436632, 0, -0.305991074221, -0.841306157962, -0.4456157661847,
          0, 0.1451745793837, 0.4213596307665, -0.8951985271777, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-2.758944101383, -0.4349440163007, -2.980822021015];
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
          0.9409005282164, -0.3386148403948, -0.006796018436632, -0.305991074221, -0.841306157962, -0.4456157661847,
          0.1451745793837, 0.4213596307665, -0.8951985271777,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual44 = JSON.stringify(input);
        expect(assertionActual44).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_1200
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 64
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9714379786423, 0.1251154348718, -0.201629317333, -0.07525057271992, 0.9682758877269, 0.2382837731615,
          0.2250457841344, -0.2163051853368, 0.9500349792717,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.1285026335088, 0.2180284661379, -0.2325943167185];
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
          0.9714379786423, 0.1251154348718, -0.201629317333, 0, -0.07525057271992, 0.9682758877269, 0.2382837731615, 0,
          0.2250457841344, -0.2163051853368, 0.9500349792717, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual48 = JSON.stringify(input);
        expect(assertionActual48).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_1300
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 65
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.3592418522949, -0.298686618172, 0.8841558661711, 0, 0.7937783244698, 0.4004265812783, 0.457793102403, 0,
          -0.4907761843873, 0.8662822040944, 0.09324097654762, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.6408854691466, -1.047711380488, 1.3830471602];
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
          -0.3592418522949, -0.298686618172, 0.8841558661711, 0.7937783244698, 0.4004265812783, 0.457793102403,
          -0.4907761843873, 0.8662822040944, 0.09324097654762,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual52 = JSON.stringify(input);
        expect(assertionActual52).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_1400
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 66
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.3874353888463, 0.4809921806633, -0.7864733572158, -0.8430897182346, -0.1602606708182, -0.5133383332618,
          -0.3729524721417, 0.8619530378911, 0.3434289067533,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [1.89241579129, -1.039109384941, 0.8265869333007];
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
          0.3874353888463, 0.4809921806633, -0.7864733572158, 0, -0.8430897182346, -0.1602606708182, -0.5133383332618,
          0, -0.3729524721417, 0.8619530378911, 0.3434289067533, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual56 = JSON.stringify(input);
        expect(assertionActual56).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_1500
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 67
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.8448752295123, -0.4657527335185, -0.2631733986872, 0, 0.4605923643157, 0.8835341036513, -0.08498330200196,
          0, 0.2721038781248, -0.04941537114271, 0.9609982313221, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.4851289483771, 0.04943550433256, -0.2759246322855];
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
          0.8448752295123, -0.4657527335185, -0.2631733986872, 0.4605923643157, 0.8835341036513, -0.08498330200196,
          0.2721038781248, -0.04941537114271, 0.9609982313221,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual60 = JSON.stringify(input);
        expect(assertionActual60).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_1600
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 68
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.2649984922279, -0.8384926894666, 0.4761363342866, -0.6078807932839, -0.2380345764949, -0.7575093937038,
          0.7485029995087, -0.4901729797774, -0.4466247973665,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-1.847402927292, 0.5122881984717, -2.108778983638];
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
          -0.2649984922279, -0.8384926894666, 0.4761363342866, 0, -0.6078807932839, -0.2380345764949, -0.7575093937038,
          0, 0.7485029995087, -0.4901729797774, -0.4466247973665, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual64 = JSON.stringify(input);
        expect(assertionActual64).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_1700
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 69
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.6844313125382, 0.5616763649237, 0.4648370031563, 0, -0.3616962445245, 0.8151634615141, -0.4524205540304, 0,
          -0.6330320727373, 0.1415209952566, 0.7610796297284, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.6033291076026, -0.1419977059369, 0.6938062990401];
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
          0.6844313125382, 0.5616763649237, 0.4648370031563, -0.3616962445245, 0.8151634615141, -0.4524205540304,
          -0.6330320727373, 0.1415209952566, 0.7610796297284,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual68 = JSON.stringify(input);
        expect(assertionActual68).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_1800
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 70
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9306643046329, -0.3550091980475, 0.08850096826538, -0.03527787141902, 0.1536914321241, 0.9874889444848,
          -0.3641694988194, -0.9221428376306, 0.1305111609645,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-1.162234522447, 1.173583619468, 1.226675388462];
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
          0.9306643046329, -0.3550091980475, 0.08850096826538, 0, -0.03527787141902, 0.1536914321241, 0.9874889444848,
          0, -0.3641694988194, -0.9221428376306, 0.1305111609645, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual72 = JSON.stringify(input);
        expect(assertionActual72).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_1900
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 71
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.1760164119854, 0.569433258223, -0.8029719715789, 0, 0.9252500715391, 0.3741697232134, 0.0625245819447, 0,
          0.3360513767696, -0.7319445215725, -0.5927281750612, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.989452049362, 0.82117145832, -2.625823923263];
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
          -0.1760164119854, 0.569433258223, -0.8029719715789, 0.9252500715391, 0.3741697232134, 0.0625245819447,
          0.3360513767696, -0.7319445215725, -0.5927281750612,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual76 = JSON.stringify(input);
        expect(assertionActual76).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_2000
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 72
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9999664489491, 0.004861187575748, 0.006593165518145, -0.004828614731881, 0.9999761038275,
          -0.004947348143971, -0.006617057954055, 0.004915346299091, 0.9999660263803,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.00486126544829, -0.004915366092282, 0.00661718618283];
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
          0.9999664489491, 0.004861187575748, 0.006593165518145, 0, -0.004828614731881, 0.9999761038275,
          -0.004947348143971, 0, -0.006617057954055, 0.004915346299091, 0.9999660263803, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual80 = JSON.stringify(input);
        expect(assertionActual80).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_2100
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 73
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.05709421514963, 0.3335617782946, 0.9409977633647, 0, -0.6878342882923, -0.6700083559669, 0.2792360914781, 0,
          0.723618851638, -0.663193292333, 0.1911816271472, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [2.679668774033, 0.7250772901738, -1.312496278683];
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
          0.05709421514963, 0.3335617782946, 0.9409977633647, -0.6878342882923, -0.6700083559669, 0.2792360914781,
          0.723618851638, -0.663193292333, 0.1911816271472,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual84 = JSON.stringify(input);
        expect(assertionActual84).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_2200
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 74
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.2141142243922, -0.6418312918107, 0.7363475346367, 0.9303406855589, 0.3637333173236, 0.04652185145199,
          -0.2976933114913, 0.6750930800426, 0.6750022411606,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-1.055213215039, -0.7410908653614, 0.4153658524023];
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
          0.2141142243922, -0.6418312918107, 0.7363475346367, 0, 0.9303406855589, 0.3637333173236, 0.04652185145199, 0,
          -0.2976933114913, 0.6750930800426, 0.6750022411606, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual88 = JSON.stringify(input);
        expect(assertionActual88).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_2300
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 75
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.7463877271968, 0.2950303826127, -0.5965420639196, 0, -0.5650478015773, 0.7545063607275, -0.3338279999556, 0,
          0.3516053791151, 0.5862399039277, 0.7298605568327, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.372744907774, -0.6264096975617, -0.4489358074495];
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
          0.7463877271968, 0.2950303826127, -0.5965420639196, -0.5650478015773, 0.7545063607275, -0.3338279999556,
          0.3516053791151, 0.5862399039277, 0.7298605568327,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual92 = JSON.stringify(input);
        expect(assertionActual92).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_2400
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 76
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.9484968655138, -0.3167786333888, 0.002234622732425, 0.04528621094598, -0.1286073969602, 0.9906610401875,
          -0.3135328614493, 0.9397400890009, 0.1363294169134,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-1.956451578635, -1.221869290644, 1.160640066425];
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
          -0.9484968655138, -0.3167786333888, 0.002234622732425, 0, 0.04528621094598, -0.1286073969602, 0.9906610401875,
          0, -0.3135328614493, 0.9397400890009, 0.1363294169134, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual96 = JSON.stringify(input);
        expect(assertionActual96).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_2500
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 77
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9790804368306, -0.1672412881648, -0.1158958573402, 0, 0.08999855517741, 0.8667843743134, -0.4904947589038,
          0, 0.1824876935073, 0.469803363099, 0.8637030981415, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.1906023239612, -0.4890680152151, -0.2082228050177];
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
          0.9790804368306, -0.1672412881648, -0.1158958573402, 0.08999855517741, 0.8667843743134, -0.4904947589038,
          0.1824876935073, 0.469803363099, 0.8637030981415,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual100 = JSON.stringify(input);
        expect(assertionActual100).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_2600
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 78
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.1671434220771, 0.115809474051, 0.979107370096, 0.4322541240324, 0.9011551416689, -0.03279912957259,
          -0.8861260907531, 0.4177410398367, -0.2006812769615,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.127811701025, -0.4309576033827, 1.793509818367];
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
          -0.1671434220771, 0.115809474051, 0.979107370096, 0, 0.4322541240324, 0.9011551416689, -0.03279912957259, 0,
          -0.8861260907531, 0.4177410398367, -0.2006812769615, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual104 = JSON.stringify(input);
        expect(assertionActual104).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_2700
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 79
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.230469997939, 0.9581574768295, -0.1697581504542, 0, 0.2173658277708, 0.1193536130433, 0.9687656125044, 0,
          0.9484912635167, -0.2601710296116, -0.1807632661337, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [1.446868915751, 0.2631993281828, -1.759117802924];
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
          0.230469997939, 0.9581574768295, -0.1697581504542, 0.2173658277708, 0.1193536130433, 0.9687656125044,
          0.9484912635167, -0.2601710296116, -0.1807632661337,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual108 = JSON.stringify(input);
        expect(assertionActual108).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_2800
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 80
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9551036215237, -0.2962585610104, 0.002817300180703, 0.2906906671813, 0.9389056939755, 0.1842689171674,
          -0.05723642342026, -0.1751769472516, 0.9828718273436,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.3056483794848, 0.1760854916577, 0.05816816947214];
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
          0.9551036215237, -0.2962585610104, 0.002817300180703, 0, 0.2906906671813, 0.9389056939755, 0.1842689171674, 0,
          -0.05723642342026, -0.1751769472516, 0.9828718273436, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual112 = JSON.stringify(input);
        expect(assertionActual112).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_2900
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 81
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.384525866418, 0.2155813563392, -0.8975881777599, 0, 0.7953753521637, -0.4161414544846, -0.440686213796, 0,
          -0.4685273815114, -0.8833747611622, -0.01145094388009, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [2.663610908114, 1.08301480798, 1.595231749697];
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
          -0.384525866418, 0.2155813563392, -0.8975881777599, 0.7953753521637, -0.4161414544846, -0.440686213796,
          -0.4685273815114, -0.8833747611622, -0.01145094388009,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual116 = JSON.stringify(input);
        expect(assertionActual116).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_3000
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 82
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.5827510503431, 0.3729959267979, 0.7219939417448, -0.7081494403812, 0.6689150661481, 0.2260022220419,
          -0.3986547170318, -0.64298263808, 0.6539478142145,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.508669545878, 0.6983863194866, 0.5474575012309];
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
          0.5827510503431, 0.3729959267979, 0.7219939417448, 0, -0.7081494403812, 0.6689150661481, 0.2260022220419, 0,
          -0.3986547170318, -0.64298263808, 0.6539478142145, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual120 = JSON.stringify(input);
        expect(assertionActual120).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_3100
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 83
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.4909876517078, -0.8505614557936, -0.1883516280489, 0, 0.5272179941391, 0.4622292559392, -0.7130114316123, 0,
          0.6935216741576, 0.2507774409153, 0.6753801615398, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-1.073003405697, -0.2534832760019, -0.7986499906527];
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
          0.4909876517078, -0.8505614557936, -0.1883516280489, 0.5272179941391, 0.4622292559392, -0.7130114316123,
          0.6935216741576, 0.2507774409153, 0.6753801615398,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual124 = JSON.stringify(input);
        expect(assertionActual124).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_3200
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 84
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.5078358577293, -0.3961045070132, -0.7649862489798, -0.7888465521366, -0.5706564607086, -0.2281936042786,
          -0.3461558302072, 0.7193416596968, -0.6022654878359,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-2.534823383144, -0.8028541325723, 2.619941606477];
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
          0.5078358577293, -0.3961045070132, -0.7649862489798, 0, -0.7888465521366, -0.5706564607086, -0.2281936042786,
          0, -0.3461558302072, 0.7193416596968, -0.6022654878359, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual128 = JSON.stringify(input);
        expect(assertionActual128).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_3300
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 85
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9805409798512, -0.01159349490133, -0.195971879892, 0, 0.002878310055585, 0.9989963967245, -0.04469803869046,
          0, 0.1962934083551, 0.04326419082246, 0.979590275385, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.01160462091095, -0.04327769911846, -0.1977639689831];
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
          0.9805409798512, -0.01159349490133, -0.195971879892, 0.002878310055585, 0.9989963967245, -0.04469803869046,
          0.1962934083551, 0.04326419082246, 0.979590275385,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual132 = JSON.stringify(input);
        expect(assertionActual132).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationStateTest0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_STATE_3400
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 86
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationStateTest0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.3068562157625, 0.9464638248217, 0.1002271976648, 0.3855627890669, -0.02733876292603, -0.9222764920178,
          -0.8701612485826, 0.3216501520993, -0.3733103013843,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [1.599673461476, -0.3274717377068, 1.976060924283];
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
          0.3068562157625, 0.9464638248217, 0.1002271976648, 0, 0.3855627890669, -0.02733876292603, -0.9222764920178, 0,
          -0.8701612485826, 0.3216501520993, -0.3733103013843, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual136 = JSON.stringify(input);
        expect(assertionActual136).assertEqual(inputBefore);
      },
    );
  });
}
