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
  assertUnitQuaternion,
  assertRotationMatrix,
  quaternionCallback,
} from '../Shared/SharedDriver';

export default function sensorQuaternionIsolationTest(): void {
  describe('SensorQuaternionIsolation', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorQuaternionIsolationTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_ISOLATION_0100
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 155
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionIsolationTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.5182236775779, -0.3446081143531, -0.4848657188688, 0.6144873490849];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.6144873490849, -0.5182236775779, -0.3446081143531, -0.4848657188688];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual1 = promiseResult.length;
        expect(assertionActual1).assertEqual(4);
        const assertionActual2 = callbackResult.length;
        expect(assertionActual2).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual3 = JSON.stringify(input);
        expect(assertionActual3).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.2923009643756, 0.9530558691863, 0.07902313860336, -0.2387195318131, -0.007301090673204, 0.9710611099235,
          0.9260524452514, -0.3027064655481, 0.2253789350391,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual4 = JSON.stringify(input);
        expect(assertionActual4).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionIsolationTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_ISOLATION_0200
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 156
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionIsolationTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.05618266386741, -0.06544556054876, 0.2492618970361];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.9645874214249, -0.05618266386741, -0.06544556054876, 0.2492618970361];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual5 = promiseResult.length;
        expect(assertionActual5).assertEqual(4);
        const assertionActual6 = callbackResult.length;
        expect(assertionActual6).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual7 = JSON.stringify(input);
        expect(assertionActual7).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.8671707705809, -0.4735159691832, -0.1542643237391, 0.4882235929029, 0.8694240299335, 0.07576001258735,
          0.09824753423461, -0.1410123508872, 0.9851207737704,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual8 = JSON.stringify(input);
        expect(assertionActual8).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionIsolationTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_ISOLATION_0300
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 157
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionIsolationTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.6998044856621, -0.6563675214759, 0.2513718397582, 0.1275443325883];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.1275443325883, -0.6998044856621, -0.6563675214759, 0.2513718397582];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual9 = promiseResult.length;
        expect(assertionActual9).assertEqual(4);
        const assertionActual10 = callbackResult.length;
        expect(assertionActual10).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual11 = JSON.stringify(input);
        expect(assertionActual11).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.01198774985635, 0.8545357644765, -0.5192541969824, 0.9827799786104, -0.1058282399524, -0.1514724307297,
          -0.1843903671453, -0.508496814994, -0.8410892828024,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual12 = JSON.stringify(input);
        expect(assertionActual12).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionIsolationTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_ISOLATION_0400
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 158
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionIsolationTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.2009845341976, 0.3940713466114, 0.03610567113525];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.8961079015973, -0.2009845341976, 0.3940713466114, 0.03610567113525];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual13 = promiseResult.length;
        expect(assertionActual13).assertEqual(4);
        const assertionActual14 = callbackResult.length;
        expect(assertionActual14).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual15 = JSON.stringify(input);
        expect(assertionActual15).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.6868083085835, -0.2231136464722, 0.6917475319931, -0.09369533768512, 0.9166031950505, 0.3886640792759,
          -0.7207742579732, -0.3317512374976, 0.6086259815864,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual16 = JSON.stringify(input);
        expect(assertionActual16).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionIsolationTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_ISOLATION_0500
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 159
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionIsolationTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.5456177769163, -0.1464562119925, -0.3343382002534, 0.7543671435932];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.7543671435932, 0.5456177769163, -0.1464562119925, -0.3343382002534];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual17 = promiseResult.length;
        expect(assertionActual17).assertEqual(4);
        const assertionActual18 = callbackResult.length;
        expect(assertionActual18).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual19 = JSON.stringify(input);
        expect(assertionActual19).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.7335370916402, 0.3446092806327, -0.5858052397255, -0.6642457318444, 0.1810384187284, -0.7252604350651,
          -0.1438782225164, 0.9211240603991, 0.3617036389634,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual20 = JSON.stringify(input);
        expect(assertionActual20).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionIsolationTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_ISOLATION_0600
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 160
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionIsolationTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.5286399821417, -0.4725213316515, 0.597350605651];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.3747474007165, 0.5286399821417, -0.4725213316515, 0.597350605651];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual21 = promiseResult.length;
        expect(assertionActual21).assertEqual(4);
        const assertionActual22 = callbackResult.length;
        expect(assertionActual22).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual23 = JSON.stringify(input);
        expect(assertionActual23).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          -0.1602083098748, -0.94729851022, 0.2774145453684, -0.0518761630834, -0.2725759535809, -0.960734725735,
          0.9857191086465, -0.1683088888453, -0.005473279169123,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual24 = JSON.stringify(input);
        expect(assertionActual24).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionIsolationTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_ISOLATION_0700
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 161
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionIsolationTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.004051131042026, -0.007058993969601, 0.006930477104813, 0.9999428620819];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.9999428620819, 0.004051131042026, -0.007058993969601, 0.006930477104813];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual25 = promiseResult.length;
        expect(assertionActual25).assertEqual(4);
        const assertionActual26 = callbackResult.length;
        expect(assertionActual26).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual27 = JSON.stringify(input);
        expect(assertionActual27).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.9998042781825, -0.01391735604275, -0.01406102872489, 0.01380296840437, 0.9998711136488, -0.008199643529843,
          0.01417333380863, 0.008003954745486, 0.9998675178828,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual28 = JSON.stringify(input);
        expect(assertionActual28).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionIsolationTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_ISOLATION_0800
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 162
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionIsolationTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.5717935978197, 0.3688799298965, -0.6175462751513];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.3944822896642, 0.5717935978197, 0.3688799298965, -0.6175462751513];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual29 = promiseResult.length;
        expect(assertionActual29).assertEqual(4);
        const assertionActual30 = callbackResult.length;
        expect(assertionActual30).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual31 = JSON.stringify(input);
        expect(assertionActual31).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          -0.0348716092674, 0.9090685017485, -0.4151848142645, -0.06537577263257, -0.4166226409218, -0.9067257487377,
          -0.9972512116913, -0.004475958004823, 0.07395935762391,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual32 = JSON.stringify(input);
        expect(assertionActual32).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionIsolationTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_ISOLATION_0900
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 163
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionIsolationTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.2175880885224, 0.21977922994, 0.5970883608756, 0.7401607954539];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.7401607954539, -0.2175880885224, 0.21977922994, 0.5970883608756];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual33 = promiseResult.length;
        expect(assertionActual33).assertEqual(4);
        const assertionActual34 = callbackResult.length;
        expect(assertionActual34).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual35 = JSON.stringify(input);
        expect(assertionActual35).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.1903651587877, -0.9795254773631, 0.06550530906947, 0.7882401072049, 0.19228182608, 0.5845555856828,
          -0.5851825695571, -0.05964510504531, 0.8087050276403,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual36 = JSON.stringify(input);
        expect(assertionActual36).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionIsolationTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_ISOLATION_1000
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 164
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionIsolationTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.2930775488517, -0.2761636117409, -0.1345555804109];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.9053916311131, -0.2930775488517, -0.2761636117409, -0.1345555804109];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual37 = promiseResult.length;
        expect(assertionActual37).assertEqual(4);
        const assertionActual38 = callbackResult.length;
        expect(assertionActual38).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual39 = JSON.stringify(input);
        expect(assertionActual39).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.811256910661, 0.4055257016694, -0.4212020063939, -0.08177628402516, 0.7920006922787, 0.6050186301273,
          0.5789428851586, -0.4563812098626, 0.6756784198186,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual40 = JSON.stringify(input);
        expect(assertionActual40).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionIsolationTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_ISOLATION_1100
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 165
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionIsolationTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.03497051858356, 0.992537810153, 0.04841134433557, 0.1063113351731];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.1063113351731, -0.03497051858356, 0.992537810153, 0.04841134433557];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual41 = promiseResult.length;
        expect(assertionActual41).assertEqual(4);
        const assertionActual42 = callbackResult.length;
        expect(assertionActual42).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual43 = JSON.stringify(input);
        expect(assertionActual43).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          -0.9749499256874, -0.07971247317736, 0.2076500999808, -0.059125774562, 0.9928668091392, 0.1035357044314,
          -0.2144219792478, 0.08866465434216, -0.9727084835067,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual44 = JSON.stringify(input);
        expect(assertionActual44).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionIsolationTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_ISOLATION_1200
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 166
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionIsolationTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.2637871216636, 0.0292883703852, -0.1019751965846];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.9587281184393, -0.2637871216636, 0.0292883703852, -0.1019751965846];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual45 = promiseResult.length;
        expect(assertionActual45).assertEqual(4);
        const assertionActual46 = callbackResult.length;
        expect(assertionActual46).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual47 = JSON.stringify(input);
        expect(assertionActual47).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.9774865012834, 0.1800811868539, 0.1099586556394, -0.2109847665424, 0.8400348274519, 0.4998268869868,
          -0.002359681286838, -0.5117736362975, 0.8591170916092,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual48 = JSON.stringify(input);
        expect(assertionActual48).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionIsolationTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_ISOLATION_1300
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 167
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionIsolationTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.2460715692722, 0.5159934785079, 0.5241848322892, 0.6312129391348];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.6312129391348, -0.2460715692722, 0.5159934785079, 0.5241848322892];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual49 = promiseResult.length;
        expect(assertionActual49).assertEqual(4);
        const assertionActual50 = callbackResult.length;
        expect(assertionActual50).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual51 = JSON.stringify(input);
        expect(assertionActual51).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          -0.08203801652948, -0.9156871472596, 0.3934295517464, 0.407801847297, 0.3293580887876, 0.8515990269436,
          -0.9093774888269, 0.2303047930323, 0.3463990258665,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual52 = JSON.stringify(input);
        expect(assertionActual52).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionIsolationTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_ISOLATION_1400
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 168
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionIsolationTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.4560262028233, -0.5171603140961, -0.4962770063831];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.5275362023578, 0.4560262028233, -0.5171603140961, -0.4962770063831];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual53 = promiseResult.length;
        expect(assertionActual53).assertEqual(4);
        const assertionActual54 = callbackResult.length;
        expect(assertionActual54).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual55 = JSON.stringify(input);
        expect(assertionActual55).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          -0.02749131508094, 0.05193086595326, -0.9982722137556, -0.9952854831059, 0.09149847054799, 0.03216888257332,
          0.09301093867797, 0.9944502074256, 0.04917062372514,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual56 = JSON.stringify(input);
        expect(assertionActual56).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionIsolationTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_ISOLATION_1500
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 169
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionIsolationTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.07838878274782, 0.06175734846148, 0.1253082391561, 0.9870861532054];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.9870861532054, 0.07838878274782, 0.06175734846148, 0.1253082391561];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual57 = promiseResult.length;
        expect(assertionActual57).assertEqual(4);
        const assertionActual58 = callbackResult.length;
        expect(assertionActual58).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual59 = JSON.stringify(input);
        expect(assertionActual59).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.9609677502212, -0.2376978887639, 0.1415651677215, 0.2570622222504, 0.9563060878778, -0.1392755548527,
          -0.1022741263786, 0.1702303732153, 0.9800824573006,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual60 = JSON.stringify(input);
        expect(assertionActual60).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionIsolationTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_ISOLATION_1600
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 170
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionIsolationTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.5663974071645, -0.3281133449242, 0.719585231032];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.2318031607219, 0.5663974071645, -0.3281133449242, 0.719585231032];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual61 = promiseResult.length;
        expect(assertionActual61).assertEqual(4);
        const assertionActual62 = callbackResult.length;
        expect(assertionActual62).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual63 = JSON.stringify(input);
        expect(assertionActual63).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          -0.2509225436734, -0.7052893575663, 0.6630269973238, -0.03808083371836, -0.677217855124, -0.7347964526347,
          0.9672578390376, -0.2096256158132, 0.1430712200799,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual64 = JSON.stringify(input);
        expect(assertionActual64).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionIsolationTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_ISOLATION_1700
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 171
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionIsolationTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.3211227610827, 0.3712126766302, -0.2158190821061, 0.844099191341];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.844099191341, 0.3211227610827, 0.3712126766302, -0.2158190821061];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual65 = promiseResult.length;
        expect(assertionActual65).assertEqual(4);
        const assertionActual66 = callbackResult.length;
        expect(assertionActual66).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual67 = JSON.stringify(input);
        expect(assertionActual67).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.6312465450159, 0.6027551047001, 0.4880718012377, -0.1259357460266, 0.700604592227, -0.7023484841751,
          -0.7652894793986, 0.3818893676293, 0.5181626420473,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual68 = JSON.stringify(input);
        expect(assertionActual68).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionIsolationTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_ISOLATION_1800
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 172
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionIsolationTest0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.2574675478725, -0.5010019459674, 0.1046376231464];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.8196087357707, -0.2574675478725, -0.5010019459674, 0.1046376231464];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual69 = promiseResult.length;
        expect(assertionActual69).assertEqual(4);
        const assertionActual70 = callbackResult.length;
        expect(assertionActual70).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual71 = JSON.stringify(input);
        expect(assertionActual71).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.4760960359183, 0.08645966497291, -0.8751327275995, 0.4295073050573, 0.8455228592296, 0.3171979971919,
          0.7673695586126, -0.526892608463, 0.3654150238588,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual72 = JSON.stringify(input);
        expect(assertionActual72).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionIsolationTest0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_ISOLATION_1900
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 173
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionIsolationTest0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.9281681414284, 0.001372158431844, 0.2512829433907, 0.2745157568875];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.2745157568875, -0.9281681414284, 0.001372158431844, 0.2512829433907];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual73 = promiseResult.length;
        expect(assertionActual73).assertEqual(4);
        const assertionActual74 = callbackResult.length;
        expect(assertionActual74).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual75 = JSON.stringify(input);
        expect(assertionActual75).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.8737099990843, -0.1405094422785, -0.4657122868582, 0.1354150673127, -0.8492784328035, 0.5102831597452,
          -0.4672190033001, -0.508903959707, -0.7229959631629,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual76 = JSON.stringify(input);
        expect(assertionActual76).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionIsolationTest0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_ISOLATION_2000
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 174
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionIsolationTest0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.0112461561485, -0.09003736131396, 0.07301036715225];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.9931949878185, -0.0112461561485, -0.09003736131396, 0.07301036715225];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual77 = promiseResult.length;
        expect(assertionActual77).assertEqual(4);
        const assertionActual78 = callbackResult.length;
        expect(assertionActual78).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual79 = JSON.stringify(input);
        expect(assertionActual79).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.9731255197118, -0.1430019129797, -0.1804914839258, 0.1470522098779, 0.9890860205204, 0.009191930223929,
          0.177207139968, -0.03548657345174, 0.983533595079,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual80 = JSON.stringify(input);
        expect(assertionActual80).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionIsolationTest0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_ISOLATION_2100
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 175
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionIsolationTest0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.5249678844243, 0.5091105500939, -0.4749551855925, 0.4895229716621];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.4895229716621, -0.5249678844243, 0.5091105500939, -0.4749551855925];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual81 = promiseResult.length;
        expect(assertionActual81).assertEqual(4);
        const assertionActual82 = callbackResult.length;
        expect(assertionActual82).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual83 = JSON.stringify(input);
        expect(assertionActual83).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.03044803892366, -0.06953042912665, 0.9971150567267, -0.999536324557, -0.002347415996303, 0.03035828600717,
          0.0002298191806874, -0.9975770692351, -0.06956966378774,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual84 = JSON.stringify(input);
        expect(assertionActual84).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionIsolationTest0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_ISOLATION_2200
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 176
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionIsolationTest0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.1496538957047, -0.2677759168337, 0.6810990144555];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.6648337403983, -0.1496538957047, -0.2677759168337, 0.6810990144555];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual85 = promiseResult.length;
        expect(assertionActual85).assertEqual(4);
        const assertionActual86 = callbackResult.length;
        expect(assertionActual86).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual87 = JSON.stringify(input);
        expect(assertionActual87).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          -0.0711996182569, -0.825487792464, -0.5599111705021, 0.9857826289842, 0.02741568801616, -0.1657739076076,
          0.1521946870064, -0.5637537445938, 0.8117995397285,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual88 = JSON.stringify(input);
        expect(assertionActual88).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionIsolationTest0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_ISOLATION_2300
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 177
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionIsolationTest0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.2177947140354, -0.1143589683509, -0.214481910276, 0.9452433544121];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.9452433544121, 0.2177947140354, -0.1143589683509, -0.214481910276];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual89 = promiseResult.length;
        expect(assertionActual89).assertEqual(4);
        const assertionActual90 = callbackResult.length;
        expect(assertionActual90).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual91 = JSON.stringify(input);
        expect(assertionActual91).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.8818390730441, 0.3556616430413, -0.3096201623309, -0.4552887582788, 0.8131259454052, -0.3626821521579,
          0.1227680570736, 0.4607938721143, 0.8789749777919,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual92 = JSON.stringify(input);
        expect(assertionActual92).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionIsolationTest0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_ISOLATION_2400
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 178
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionIsolationTest0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.397085661329, -0.7613620410854, -0.5086918555988];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.06231706033348, -0.397085661329, -0.7613620410854, -0.5086918555988];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual93 = promiseResult.length;
        expect(assertionActual93).assertEqual(4);
        const assertionActual94 = callbackResult.length;
        expect(assertionActual94).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual95 = JSON.stringify(input);
        expect(assertionActual95).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          -0.6768791231166, 0.6680522613034, 0.3090967952864, 0.5412515370773, 0.1671111472287, 0.8240877611537,
          0.4988801722861, 0.7251069166953, -0.4746983600776,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual96 = JSON.stringify(input);
        expect(assertionActual96).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionIsolationTest0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_ISOLATION_2500
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 179
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionIsolationTest0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.2693079387905, 0.2546608006818, 0.1011429444838, 0.923250353632];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.923250353632, 0.2693079387905, 0.2546608006818, 0.1011429444838];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual97 = promiseResult.length;
        expect(assertionActual97).assertEqual(4);
        const assertionActual98 = callbackResult.length;
        expect(assertionActual98).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual99 = JSON.stringify(input);
        expect(assertionActual99).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.8498359627545, -0.04959616787937, 0.5247085443756, 0.3239248691687, 0.8344866777711, -0.4457630129974,
          -0.4157541527671, 0.5487915858996, 0.7252422214011,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual100 = JSON.stringify(input);
        expect(assertionActual100).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionIsolationTest0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_ISOLATION_2600
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 180
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionIsolationTest0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.686354683315, 0.09597655869173, 0.1262919133959];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.7097577766281, 0.686354683315, 0.09597655869173, 0.1262919133959];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual101 = promiseResult.length;
        expect(assertionActual101).assertEqual(4);
        const assertionActual102 = callbackResult.length;
        expect(assertionActual102).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual103 = JSON.stringify(input);
        expect(assertionActual103).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.949677705585, -0.04752541422287, 0.309602310259, 0.3110212564089, 0.02593520260483, -0.9500490215392,
          0.03712187463719, 0.9985332744925, 0.03941149774659,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual104 = JSON.stringify(input);
        expect(assertionActual104).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionIsolationTest0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_ISOLATION_2700
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 181
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionIsolationTest0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.4133649862147, -0.6755439482759, -0.4287672669881, 0.4346589385703];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.4346589385703, -0.4133649862147, -0.6755439482759, -0.4287672669881];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual105 = promiseResult.length;
        expect(assertionActual105).assertEqual(4);
        const assertionActual106 = callbackResult.length;
        expect(assertionActual106).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual107 = JSON.stringify(input);
        expect(assertionActual107).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          -0.2804019905854, 0.9312274800585, -0.2327876802147, 0.1857573794075, 0.2905760378626, 0.9386478371656,
          0.9417371818461, 0.2199566925648, -0.254460475761,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual108 = JSON.stringify(input);
        expect(assertionActual108).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionIsolationTest0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_ISOLATION_2800
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 182
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionIsolationTest0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.03247254572169, 0.03281253361081, 0.02956098117888];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.9984963794647, -0.03247254572169, 0.03281253361081, 0.02956098117888];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual109 = promiseResult.length;
        expect(assertionActual109).assertEqual(4);
        const assertionActual110 = callbackResult.length;
        expect(assertionActual110).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual111 = JSON.stringify(input);
        expect(assertionActual111).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          0.9960989720596, -0.06116407835691, 0.0636065513971, 0.05690205236523, 0.9961433643322, 0.06678738004722,
          -0.06744623264874, -0.06290749729322, 0.9957377428248,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual112 = JSON.stringify(input);
        expect(assertionActual112).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorQuaternionIsolationTest0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_QUATERNION_ISOLATION_2900
     * @tc.desc Verify sensor.getQuaternion with independent expectations for input partition 183
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorQuaternionIsolationTest0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.2014636210997, 0.2603291262605, 0.8834290635872, 0.3334580108549];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [0.3334580108549, -0.2014636210997, 0.2603291262605, 0.8834290635872];
        const promiseResult: number[] = await sensor.getQuaternion(input);
        const callbackResult: number[] = await quaternionCallback(input);
        const assertionActual113 = promiseResult.length;
        expect(assertionActual113).assertEqual(4);
        const assertionActual114 = callbackResult.length;
        expect(assertionActual114).assertEqual(4);
        assertArrayNear(promiseResult, expected, 0.00002);
        assertArrayNear(callbackResult, expected, 0.00002);
        assertArrayNear(callbackResult, promiseResult, 0.00002);
        assertUnitQuaternion(promiseResult);
        assertUnitQuaternion(callbackResult);
        const assertionActual115 = JSON.stringify(input);
        expect(assertionActual115).assertEqual(inputBefore);
        const rotation: number[] = await sensor.getRotationMatrix(input);
        assertRotationMatrix(rotation);
        const expectedRotation: number[] = [
          -0.6964363287402, -0.6940666934587, -0.1823399710491, 0.484279299642, -0.6420690020342, 0.5943239491767,
          -0.5295753014908, 0.3256053157706, 0.7832823107877,
        ];
        assertArrayNear(rotation, expectedRotation, 0.00005);
        const assertionActual116 = JSON.stringify(input);
        expect(assertionActual116).assertEqual(inputBefore);
      },
    );
  });
}
