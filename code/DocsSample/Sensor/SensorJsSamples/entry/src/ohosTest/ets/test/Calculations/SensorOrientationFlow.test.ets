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

export default function sensorOrientationFlowTest(): void {
  describe('SensorOrientationFlow', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorOrientationFlowTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_0100
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 131
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.2744238163609, 0.3504940352141, 0.895458262731, 0, 0.7315128499338, -0.5283414838373, 0.4309805411366, 0,
          0.6241638562074, 0.7733105506431, -0.1114014042478, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [2.555865126407, -0.8840461163703, -1.747417570711];
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
          -0.2744238163609, 0.3504940352141, 0.895458262731, 0.7315128499338, -0.5283414838373, 0.4309805411366,
          0.6241638562074, 0.7733105506431, -0.1114014042478,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual4 = JSON.stringify(input);
        expect(assertionActual4).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_0200
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 132
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9041148703276, -0.4228450978245, -0.06146807706659, 0.3981593402378, 0.8859207586044, -0.2379360192471,
          0.1550659247993, 0.1906474041774, 0.9693338569588,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.4453187699422, -0.1918216046999, -0.1586276079402];
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
          0.9041148703276, -0.4228450978245, -0.06146807706659, 0, 0.3981593402378, 0.8859207586044, -0.2379360192471,
          0, 0.1550659247993, 0.1906474041774, 0.9693338569588, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual8 = JSON.stringify(input);
        expect(assertionActual8).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_0300
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 133
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.1382504877669, 0.9837037900848, 0.1149506677013, 0, -0.1469010408135, 0.135148831689, -0.9798749295196, 0,
          -0.9794421304192, 0.1185818142292, 0.1631915025178, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [1.434263351779, -0.1188614968904, 1.405696179657];
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
          0.1382504877669, 0.9837037900848, 0.1149506677013, -0.1469010408135, 0.135148831689, -0.9798749295196,
          -0.9794421304192, 0.1185818142292, 0.1631915025178,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual12 = JSON.stringify(input);
        expect(assertionActual12).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_0400
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 134
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.3195603951747, -0.3978707743451, -0.859988372455, 0.7877957977425, 0.3927767760728, -0.4744514571978,
          0.5265538290574, -0.8291111210808, 0.1879250222963,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.7918408922562, 0.9775159201577, -1.227991222884];
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
          -0.3195603951747, -0.3978707743451, -0.859988372455, 0, 0.7877957977425, 0.3927767760728, -0.4744514571978, 0,
          0.5265538290574, -0.8291111210808, 0.1879250222963, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual16 = JSON.stringify(input);
        expect(assertionActual16).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_0500
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 135
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9880790801172, 0.1334711768952, 0.07671490319955, 0, -0.1522333969603, 0.9212699269866, 0.357892043052, 0,
          -0.02290686108184, -0.3653042109917, 0.9306063126517, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.1438763284435, 0.3739595786155, 0.0246100161241];
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
          0.9880790801172, 0.1334711768952, 0.07671490319955, -0.1522333969603, 0.9212699269866, 0.357892043052,
          -0.02290686108184, -0.3653042109917, 0.9306063126517,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual20 = JSON.stringify(input);
        expect(assertionActual20).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_0600
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 136
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.8902755454955, -0.2737873866947, -0.3639366977644, -0.246313926286, 0.9616222741072, -0.1208803195666,
          0.3830651417322, -0.01797411549589, -0.9235464408257,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.2773746825606, 0.01797508344936, -2.748413372156];
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
          -0.8902755454955, -0.2737873866947, -0.3639366977644, 0, -0.246313926286, 0.9616222741072, -0.1208803195666,
          0, 0.3830651417322, -0.01797411549589, -0.9235464408257, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual24 = JSON.stringify(input);
        expect(assertionActual24).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_0700
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 137
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.7192708646905, 0.0347217231789, 0.6938615316811, 0, -0.4914616009036, 0.7313463587314, 0.4728615002383, 0,
          -0.4910345385455, -0.6811217993207, 0.5431005214926, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.04744081960034, 0.7492937015345, 0.7350932675893];
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
          0.7192708646905, 0.0347217231789, 0.6938615316811, -0.4914616009036, 0.7313463587314, 0.4728615002383,
          -0.4910345385455, -0.6811217993207, 0.5431005214926,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual28 = JSON.stringify(input);
        expect(assertionActual28).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_0800
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 138
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.383163533011, -0.5881378204757, -0.7122356429558, 0.8848631671663, 0.4549059551712, 0.1003879840529,
          0.2649582653229, -0.6686961014361, 0.6947248675276,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.9124439124008, 0.7324537555822, -0.3643574754829];
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
          0.383163533011, -0.5881378204757, -0.7122356429558, 0, 0.8848631671663, 0.4549059551712, 0.1003879840529, 0,
          0.2649582653229, -0.6686961014361, 0.6947248675276, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual32 = JSON.stringify(input);
        expect(assertionActual32).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_0900
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 139
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.08912682098295, 0.1223709552841, -0.9884744605119, 0, -0.7431049705582, -0.6689879253106,
          -0.01581640035816, 0, -0.6632129465814, 0.7331306193929, 0.1505592321825, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [2.960673258071, -0.8229138589942, 1.347564886763];
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
          -0.08912682098295, 0.1223709552841, -0.9884744605119, -0.7431049705582, -0.6689879253106, -0.01581640035816,
          -0.6632129465814, 0.7331306193929, 0.1505592321825,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual36 = JSON.stringify(input);
        expect(assertionActual36).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_1000
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 140
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9906413257083, 0.1008614108316, -0.09196053286069, -0.09446911976138, 0.992963509665, 0.07140765985035,
          0.0985157307767, -0.06205194822774, 0.9931989762936,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.1012289527154, 0.0620918386461, -0.09886693150026];
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
          0.9906413257083, 0.1008614108316, -0.09196053286069, 0, -0.09446911976138, 0.992963509665, 0.07140765985035,
          0, 0.0985157307767, -0.06205194822774, 0.9931989762936, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual40 = JSON.stringify(input);
        expect(assertionActual40).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_1100
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 141
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.2282601328778, -0.03899962466611, 0.9728187606202, 0, 0.973234155204, 0.01825622097401, 0.2290894793309, 0,
          -0.02669439797041, 0.9990724396517, 0.03378859933982, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-1.132982360176, -1.527721884757, 0.6686391613004];
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
          -0.2282601328778, -0.03899962466611, 0.9728187606202, 0.973234155204, 0.01825622097401, 0.2290894793309,
          -0.02669439797041, 0.9990724396517, 0.03378859933982,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual44 = JSON.stringify(input);
        expect(assertionActual44).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_1200
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 142
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.7386610720875, 0.4745091075262, -0.4787702240712, -0.5279650847165, -0.03431748653321, -0.8485724361764,
          -0.4190855400785, 0.8795813873615, 0.2251752497598,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [1.642992709779, -1.074981580136, 1.077754762423];
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
          0.7386610720875, 0.4745091075262, -0.4787702240712, 0, -0.5279650847165, -0.03431748653321, -0.8485724361764,
          0, -0.4190855400785, 0.8795813873615, 0.2251752497598, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual48 = JSON.stringify(input);
        expect(assertionActual48).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_1300
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 143
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.7781334493338, 0.0190333807929, -0.6278105330779, 0, 0.1762430458198, 0.9527682502065, 0.2473278192979, 0,
          0.6028654276272, -0.3031012896939, 0.7380263439457, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.01997426915, 0.3079453583514, -0.684938213863];
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
          0.7781334493338, 0.0190333807929, -0.6278105330779, 0.1762430458198, 0.9527682502065, 0.2473278192979,
          0.6028654276272, -0.3031012896939, 0.7380263439457,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual52 = JSON.stringify(input);
        expect(assertionActual52).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_1400
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 144
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.04435883928186, -0.9645304353876, -0.260217856014, -0.9269663231923, -0.05738671061702, 0.3707292827818,
          -0.3725127233329, 0.2576583098903, -0.8915416234252,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-1.630223315927, -0.2605978993954, 2.745810808925];
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
          -0.04435883928186, -0.9645304353876, -0.260217856014, 0, -0.9269663231923, -0.05738671061702, 0.3707292827818,
          0, -0.3725127233329, 0.2576583098903, -0.8915416234252, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual56 = JSON.stringify(input);
        expect(assertionActual56).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_1500
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 145
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.7602612637524, -0.5603311258576, 0.3286819743046, 0, 0.550362358641, 0.8243694820338, 0.1323488998159, 0,
          -0.3451145969512, 0.08027444479076, 0.9351213442568, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.5969774520296, -0.08036091033133, 0.3535516458474];
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
          0.7602612637524, -0.5603311258576, 0.3286819743046, 0.550362358641, 0.8243694820338, 0.1323488998159,
          -0.3451145969512, 0.08027444479076, 0.9351213442568,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual60 = JSON.stringify(input);
        expect(assertionActual60).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_1600
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 146
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.438700135973, 0.4072584278005, 0.8010510368777, -0.884412710723, 0.03771471727003, 0.4651792742726,
          0.1592367665109, -0.9125339298277, 0.3767299816904,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [1.478453349756, 1.14943727541, -0.3999051578786];
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
          0.438700135973, 0.4072584278005, 0.8010510368777, 0, -0.884412710723, 0.03771471727003, 0.4651792742726, 0,
          0.1592367665109, -0.9125339298277, 0.3767299816904, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual64 = JSON.stringify(input);
        expect(assertionActual64).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_1700
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 147
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.4953866969509, -0.3671424101382, -0.7872728060602, 0, 0.7924620117624, 0.1802076717958, -0.5826913032983,
          0, 0.3558032889078, -0.9125413117793, 0.2016739296453, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-1.114504650479, 1.149455324511, -1.055136560834];
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
          -0.4953866969509, -0.3671424101382, -0.7872728060602, 0.7924620117624, 0.1802076717958, -0.5826913032983,
          0.3558032889078, -0.9125413117793, 0.2016739296453,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual68 = JSON.stringify(input);
        expect(assertionActual68).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_1800
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 148
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9887385507066, 0.1201371220542, 0.08923648497806, -0.1088390252638, 0.9865202239684, -0.1221962122204,
          -0.1027138984088, 0.1111076937296, 0.9884861837516,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.1211819773531, -0.1113375756678, 0.1035387215034];
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
          0.9887385507066, 0.1201371220542, 0.08923648497806, 0, -0.1088390252638, 0.9865202239684, -0.1221962122204, 0,
          -0.1027138984088, 0.1111076937296, 0.9884861837516, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual72 = JSON.stringify(input);
        expect(assertionActual72).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_1900
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 149
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.02226267118147, 0.5244429242006, 0.8511545057907, 0, -0.2940007607271, -0.8102861734151, 0.5069515458741, 0,
          0.9555458786284, -0.2615261677695, 0.1361474840313, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [2.567165952976, 0.2646030642071, -1.42926755085];
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
          0.02226267118147, 0.5244429242006, 0.8511545057907, -0.2940007607271, -0.8102861734151, 0.5069515458741,
          0.9555458786284, -0.2615261677695, 0.1361474840313,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual76 = JSON.stringify(input);
        expect(assertionActual76).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_2000
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 150
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.5876679282381, 0.1434292565537, 0.7962879218504, 0.5188626584904, 0.6883469977746, -0.5069121741279,
          -0.620828436643, 0.7110600952235, 0.3300993687304,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.2054282924102, -0.7910047399062, 1.082105349876];
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
          0.5876679282381, 0.1434292565537, 0.7962879218504, 0, 0.5188626584904, 0.6883469977746, -0.5069121741279, 0,
          -0.620828436643, 0.7110600952235, 0.3300993687304, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual80 = JSON.stringify(input);
        expect(assertionActual80).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_2100
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 151
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.6815973612398, -0.4029955040466, -0.6107533551845, 0, -0.1121671680162, 0.767265032929, -0.631445085232, 0,
          0.723079223578, 0.4988977780694, 0.4777629574039, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.4836322843387, -0.5223265062679, -0.9869122755235];
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
          0.6815973612398, -0.4029955040466, -0.6107533551845, -0.1121671680162, 0.767265032929, -0.631445085232,
          0.723079223578, 0.4988977780694, 0.4777629574039,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual84 = JSON.stringify(input);
        expect(assertionActual84).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_2200
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 152
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.3002940555432, -0.1207902297109, 0.9461676387469, -0.720583027489, -0.6212040277719, -0.3080026889084,
          0.6249668636818, -0.7742837182108, 0.09950448740323,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-2.94954377137, 0.885582454592, -1.412905958022];
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
          -0.3002940555432, -0.1207902297109, 0.9461676387469, 0, -0.720583027489, -0.6212040277719, -0.3080026889084,
          0, 0.6249668636818, -0.7742837182108, 0.09950448740323, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual88 = JSON.stringify(input);
        expect(assertionActual88).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_2300
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 153
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9642080534172, 0.2048658367191, -0.1683235535234, 0, -0.23985393552, 0.9445226828304, -0.2243813522432, 0,
          0.113017340886, 0.2567233736229, 0.959854254611, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.2135903563355, -0.2596304176077, -0.1172046299822];
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
          0.9642080534172, 0.2048658367191, -0.1683235535234, -0.23985393552, 0.9445226828304, -0.2243813522432,
          0.113017340886, 0.2567233736229, 0.959854254611,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual92 = JSON.stringify(input);
        expect(assertionActual92).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_2400
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 154
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.3867027715747, -0.7541302906373, 0.5307998409945, 0.5307695811104, 0.2886884400033, 0.7968328785739,
          -0.754151588359, 0.5898698918845, 0.2886327985933,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-1.205196379748, -0.6308977063542, 1.20527016093];
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
          -0.3867027715747, -0.7541302906373, 0.5307998409945, 0, 0.5307695811104, 0.2886884400033, 0.7968328785739, 0,
          -0.754151588359, 0.5898698918845, 0.2886327985933, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual96 = JSON.stringify(input);
        expect(assertionActual96).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_2500
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 155
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.2923009643756, 0.9530558691863, 0.07902313860336, 0, -0.2387195318131, -0.007301090673204, 0.9710611099235,
          0, 0.9260524452514, -0.3027064655481, 0.2253789350391, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [1.578456893283, 0.3075310714649, -1.33206167239];
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
          0.2923009643756, 0.9530558691863, 0.07902313860336, -0.2387195318131, -0.007301090673204, 0.9710611099235,
          0.9260524452514, -0.3027064655481, 0.2253789350391,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual100 = JSON.stringify(input);
        expect(assertionActual100).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_2600
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 156
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.8671707705809, -0.4735159691832, -0.1542643237391, 0.4882235929029, 0.8694240299335, 0.07576001258735,
          0.09824753423461, -0.1410123508872, 0.9851207737704,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.498712407317, 0.1414839089894, -0.09940276543608];
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
          0.8671707705809, -0.4735159691832, -0.1542643237391, 0, 0.4882235929029, 0.8694240299335, 0.07576001258735, 0,
          0.09824753423461, -0.1410123508872, 0.9851207737704, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual104 = JSON.stringify(input);
        expect(assertionActual104).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_2700
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 157
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.01198774985635, 0.8545357644765, -0.5192541969824, 0, 0.9827799786104, -0.1058282399524, -0.1514724307297,
          0, -0.1843903671453, -0.508496814994, -0.8410892828024, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [1.694011921869, 0.5334381586224, 2.925778775939];
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
          0.01198774985635, 0.8545357644765, -0.5192541969824, 0.9827799786104, -0.1058282399524, -0.1514724307297,
          -0.1843903671453, -0.508496814994, -0.8410892828024,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual108 = JSON.stringify(input);
        expect(assertionActual108).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_2800
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 158
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.6868083085835, -0.2231136464722, 0.6917475319931, -0.09369533768512, 0.9166031950505, 0.3886640792759,
          -0.7207742579732, -0.3317512374976, 0.6086259815864,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.2387701183751, 0.3381593401181, 0.8695589484269];
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
          0.6868083085835, -0.2231136464722, 0.6917475319931, 0, -0.09369533768512, 0.9166031950505, 0.3886640792759, 0,
          -0.7207742579732, -0.3317512374976, 0.6086259815864, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual112 = JSON.stringify(input);
        expect(assertionActual112).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_2900
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 159
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.7335370916402, 0.3446092806327, -0.5858052397255, 0, -0.6642457318444, 0.1810384187284, -0.7252604350651, 0,
          -0.1438782225164, 0.9211240603991, 0.3617036389634, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [1.087079689851, -1.170958308071, 0.3785905210721];
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
          0.7335370916402, 0.3446092806327, -0.5858052397255, -0.6642457318444, 0.1810384187284, -0.7252604350651,
          -0.1438782225164, 0.9211240603991, 0.3617036389634,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual116 = JSON.stringify(input);
        expect(assertionActual116).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_3000
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 160
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.1602083098748, -0.94729851022, 0.2774145453684, -0.0518761630834, -0.2725759535809, -0.960734725735,
          0.9857191086465, -0.1683088888453, -0.005473279169123,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-1.850968085418, 0.1691138317713, -1.57634884462];
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
          -0.1602083098748, -0.94729851022, 0.2774145453684, 0, -0.0518761630834, -0.2725759535809, -0.960734725735, 0,
          0.9857191086465, -0.1683088888453, -0.005473279169123, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual120 = JSON.stringify(input);
        expect(assertionActual120).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_3100
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 161
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9998042781825, -0.01391735604275, -0.01406102872489, 0, 0.01380296840437, 0.9998711136488,
          -0.008199643529843, 0, 0.01417333380863, 0.008003954745486, 0.9998675178828, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.01391825122428, -0.008004040207897, -0.0141742624454];
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
          0.9998042781825, -0.01391735604275, -0.01406102872489, 0.01380296840437, 0.9998711136488, -0.008199643529843,
          0.01417333380863, 0.008003954745486, 0.9998675178828,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual124 = JSON.stringify(input);
        expect(assertionActual124).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_3200
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 162
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.0348716092674, 0.9090685017485, -0.4151848142645, -0.06537577263257, -0.4166226409218, -0.9067257487377,
          -0.9972512116913, -0.004475958004823, 0.07395935762391,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [2.000527919453, 0.004475972950331, 1.49676863364];
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
          -0.0348716092674, 0.9090685017485, -0.4151848142645, 0, -0.06537577263257, -0.4166226409218, -0.9067257487377,
          0, -0.9972512116913, -0.004475958004823, 0.07395935762391, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual128 = JSON.stringify(input);
        expect(assertionActual128).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_3300
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 163
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.1903651587877, -0.9795254773631, 0.06550530906947, 0, 0.7882401072049, 0.19228182608, 0.5845555856828, 0,
          -0.5851825695571, -0.05964510504531, 0.8087050276403, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-1.376960019125, 0.05968052674113, 0.626392856029];
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
          0.1903651587877, -0.9795254773631, 0.06550530906947, 0.7882401072049, 0.19228182608, 0.5845555856828,
          -0.5851825695571, -0.05964510504531, 0.8087050276403,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual132 = JSON.stringify(input);
        expect(assertionActual132).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorOrientationFlowTest0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ORIENTATION_FLOW_3400
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 164
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOrientationFlowTest0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.811256910661, 0.4055257016694, -0.4212020063939, -0.08177628402516, 0.7920006922787, 0.6050186301273,
          0.5789428851586, -0.4563812098626, 0.6756784198186,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.4732228135656, 0.4739238945983, -0.7084470389237];
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
          0.811256910661, 0.4055257016694, -0.4212020063939, 0, -0.08177628402516, 0.7920006922787, 0.6050186301273, 0,
          0.5789428851586, -0.4563812098626, 0.6756784198186, 0, 0, 0, 0, 1,
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
