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
import { assertArrayNear, assertRotationMatrix, assertNear, fusionCallback } from '../Shared/SharedDriver';

export default function sensorFusionConfigurationValidationTest(): void {
  describe('SensorFusionConfigurationValidation', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorFusionConfigurationValidationTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_CONFIGURATION_VALIDATION_0100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 150
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionConfigurationValidationTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-6.090326963468, 6.975499534142, 3.238274807245];
        const geomagnetic: number[] = [6.679383853132, 41.08944791513, -12.33057587352];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.5876679282381, 0.1434292565537, 0.7962879218504, 0.5188626584904, 0.6883469977746, -0.5069121741279,
          -0.620828436643, 0.7110600952235, 0.3300993687304,
        ];
        const expectedInclination: number[] = [
          1, 0, 0, 0, 0.8752415354393, 0.4836861116901, 0, -0.4836861116901, 0.8752415354393,
        ];
        const promiseResult: sensor.RotationMatrixResponse = await sensor.getRotationMatrix(gravity, geomagnetic);
        const callbackResult: sensor.RotationMatrixResponse = await fusionCallback(gravity, geomagnetic);
        assertRotationMatrix(promiseResult.rotation);
        assertRotationMatrix(callbackResult.rotation);
        assertArrayNear(promiseResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(callbackResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(promiseResult.inclination, expectedInclination, 0.00008);
        assertArrayNear(callbackResult.inclination, expectedInclination, 0.00008);
        const dip: number = await sensor.getInclination(promiseResult.inclination);
        assertNear(dip, 0.5048613716591, 0.00005);
        const assertionActual1 = JSON.stringify(gravity);
        expect(assertionActual1).assertEqual(gravityBefore);
        const assertionActual2 = JSON.stringify(geomagnetic);
        expect(assertionActual2).assertEqual(geomagneticBefore);
      },
    );

    /**
     * @tc.name testSensorFusionConfigurationValidationTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_CONFIGURATION_VALIDATION_0200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 151
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionConfigurationValidationTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [7.0934071833, 4.894187202861, 4.686854612132];
        const geomagnetic: number[] = [10.92231131052, 39.63292459076, -13.96189113333];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.6815973612398, -0.4029955040466, -0.6107533551845, -0.1121671680162, 0.767265032929, -0.631445085232,
          0.723079223578, 0.4988977780694, 0.4777629574039,
        ];
        const expectedInclination: number[] = [
          1, 0, 0, 0, 0.8752415354393, 0.4836861116901, 0, -0.4836861116901, 0.8752415354393,
        ];
        const promiseResult: sensor.RotationMatrixResponse = await sensor.getRotationMatrix(gravity, geomagnetic);
        const callbackResult: sensor.RotationMatrixResponse = await fusionCallback(gravity, geomagnetic);
        assertRotationMatrix(promiseResult.rotation);
        assertRotationMatrix(callbackResult.rotation);
        assertArrayNear(promiseResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(callbackResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(promiseResult.inclination, expectedInclination, 0.00008);
        assertArrayNear(callbackResult.inclination, expectedInclination, 0.00008);
        const dip: number = await sensor.getInclination(promiseResult.inclination);
        assertNear(dip, 0.5048613716591, 0.00005);
        const assertionActual3 = JSON.stringify(gravity);
        expect(assertionActual3).assertEqual(gravityBefore);
        const assertionActual4 = JSON.stringify(geomagnetic);
        expect(assertionActual4).assertEqual(geomagneticBefore);
      },
    );

    /**
     * @tc.name testSensorFusionConfigurationValidationTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_CONFIGURATION_VALIDATION_0300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 152
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionConfigurationValidationTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [6.130924932719, -7.595723275648, 0.9761390214257];
        const geomagnetic: number[] = [-14.25785090726, -39.86571113776, -9.61450794305];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.3002940555432, -0.1207902297109, 0.9461676387469, -0.720583027489, -0.6212040277719, -0.3080026889084,
          0.6249668636818, -0.7742837182108, 0.09950448740323,
        ];
        const expectedInclination: number[] = [
          1, 0, 0, 0, 0.8752415354393, 0.4836861116901, 0, -0.4836861116901, 0.8752415354393,
        ];
        const promiseResult: sensor.RotationMatrixResponse = await sensor.getRotationMatrix(gravity, geomagnetic);
        const callbackResult: sensor.RotationMatrixResponse = await fusionCallback(gravity, geomagnetic);
        assertRotationMatrix(promiseResult.rotation);
        assertRotationMatrix(callbackResult.rotation);
        assertArrayNear(promiseResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(callbackResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(promiseResult.inclination, expectedInclination, 0.00008);
        assertArrayNear(callbackResult.inclination, expectedInclination, 0.00008);
        const dip: number = await sensor.getInclination(promiseResult.inclination);
        assertNear(dip, 0.5048613716591, 0.00005);
        const assertionActual5 = JSON.stringify(gravity);
        expect(assertionActual5).assertEqual(gravityBefore);
        const assertionActual6 = JSON.stringify(geomagnetic);
        expect(assertionActual6).assertEqual(geomagneticBefore);
      },
    );

    /**
     * @tc.name testSensorFusionConfigurationValidationTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_CONFIGURATION_VALIDATION_0400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 153
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionConfigurationValidationTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [1.108700114092, 2.51845629524, 9.416170237733];
        const geomagnetic: number[] = [-6.741085391154, 41.28305279363, 11.63044796159];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.9642080534172, 0.2048658367191, -0.1683235535234, -0.23985393552, 0.9445226828304, -0.2243813522432,
          0.113017340886, 0.2567233736229, 0.959854254611,
        ];
        const expectedInclination: number[] = [
          1, 0, 0, 0, 0.8752415354393, 0.4836861116901, 0, -0.4836861116901, 0.8752415354393,
        ];
        const promiseResult: sensor.RotationMatrixResponse = await sensor.getRotationMatrix(gravity, geomagnetic);
        const callbackResult: sensor.RotationMatrixResponse = await fusionCallback(gravity, geomagnetic);
        assertRotationMatrix(promiseResult.rotation);
        assertRotationMatrix(callbackResult.rotation);
        assertArrayNear(promiseResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(callbackResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(promiseResult.inclination, expectedInclination, 0.00008);
        assertArrayNear(callbackResult.inclination, expectedInclination, 0.00008);
        const dip: number = await sensor.getInclination(promiseResult.inclination);
        assertNear(dip, 0.5048613716591, 0.00005);
        const assertionActual7 = JSON.stringify(gravity);
        expect(assertionActual7).assertEqual(gravityBefore);
        const assertionActual8 = JSON.stringify(geomagnetic);
        expect(assertionActual8).assertEqual(geomagneticBefore);
      },
    );

    /**
     * @tc.name testSensorFusionConfigurationValidationTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_CONFIGURATION_VALIDATION_0500
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 154
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionConfigurationValidationTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-7.398227081802, 5.786623639387, 2.831487754201];
        const geomagnetic: number[] = [4.332060726655, 23.3574284497, 36.34093815627];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.3867027715747, -0.7541302906373, 0.5307998409945, 0.5307695811104, 0.2886884400033, 0.7968328785739,
          -0.754151588359, 0.5898698918845, 0.2886327985933,
        ];
        const expectedInclination: number[] = [
          1, 0, 0, 0, 0.8752415354393, 0.4836861116901, 0, -0.4836861116901, 0.8752415354393,
        ];
        const promiseResult: sensor.RotationMatrixResponse = await sensor.getRotationMatrix(gravity, geomagnetic);
        const callbackResult: sensor.RotationMatrixResponse = await fusionCallback(gravity, geomagnetic);
        assertRotationMatrix(promiseResult.rotation);
        assertRotationMatrix(callbackResult.rotation);
        assertArrayNear(promiseResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(callbackResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(promiseResult.inclination, expectedInclination, 0.00008);
        assertArrayNear(callbackResult.inclination, expectedInclination, 0.00008);
        const dip: number = await sensor.getInclination(promiseResult.inclination);
        assertNear(dip, 0.5048613716591, 0.00005);
        const assertionActual9 = JSON.stringify(gravity);
        expect(assertionActual9).assertEqual(gravityBefore);
        const assertionActual10 = JSON.stringify(geomagnetic);
        expect(assertionActual10).assertEqual(geomagneticBefore);
      },
    );

    /**
     * @tc.name testSensorFusionConfigurationValidationTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_CONFIGURATION_VALIDATION_0600
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 155
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionConfigurationValidationTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [9.084574487916, -2.969550427026, 2.210967352734];
        const geomagnetic: number[] = [10.37575914138, -6.634277222091, 41.63327981292];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.2923009643756, 0.9530558691863, 0.07902313860336, -0.2387195318131, -0.007301090673204, 0.9710611099235,
          0.9260524452514, -0.3027064655481, 0.2253789350391,
        ];
        const expectedInclination: number[] = [
          1, 0, 0, 0, 0.8752415354393, 0.4836861116901, 0, -0.4836861116901, 0.8752415354393,
        ];
        const promiseResult: sensor.RotationMatrixResponse = await sensor.getRotationMatrix(gravity, geomagnetic);
        const callbackResult: sensor.RotationMatrixResponse = await fusionCallback(gravity, geomagnetic);
        assertRotationMatrix(promiseResult.rotation);
        assertRotationMatrix(callbackResult.rotation);
        assertArrayNear(promiseResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(callbackResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(promiseResult.inclination, expectedInclination, 0.00008);
        assertArrayNear(callbackResult.inclination, expectedInclination, 0.00008);
        const dip: number = await sensor.getInclination(promiseResult.inclination);
        assertNear(dip, 0.5048613716591, 0.00005);
        const assertionActual11 = JSON.stringify(gravity);
        expect(assertionActual11).assertEqual(gravityBefore);
        const assertionActual12 = JSON.stringify(geomagnetic);
        expect(assertionActual12).assertEqual(geomagneticBefore);
      },
    );

    /**
     * @tc.name testSensorFusionConfigurationValidationTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_CONFIGURATION_VALIDATION_0700
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 156
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionConfigurationValidationTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [0.9638083108416, -1.383331162204, 9.664034790688];
        const geomagnetic: number[] = [20.61569474924, 30.07685376884, 23.5664167275];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.8671707705809, -0.4735159691832, -0.1542643237391, 0.4882235929029, 0.8694240299335, 0.07576001258735,
          0.09824753423461, -0.1410123508872, 0.9851207737704,
        ];
        const expectedInclination: number[] = [
          1, 0, 0, 0, 0.8752415354393, 0.4836861116901, 0, -0.4836861116901, 0.8752415354393,
        ];
        const promiseResult: sensor.RotationMatrixResponse = await sensor.getRotationMatrix(gravity, geomagnetic);
        const callbackResult: sensor.RotationMatrixResponse = await fusionCallback(gravity, geomagnetic);
        assertRotationMatrix(promiseResult.rotation);
        assertRotationMatrix(callbackResult.rotation);
        assertArrayNear(promiseResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(callbackResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(promiseResult.inclination, expectedInclination, 0.00008);
        assertArrayNear(callbackResult.inclination, expectedInclination, 0.00008);
        const dip: number = await sensor.getInclination(promiseResult.inclination);
        assertNear(dip, 0.5048613716591, 0.00005);
        const assertionActual13 = JSON.stringify(gravity);
        expect(assertionActual13).assertEqual(gravityBefore);
        const assertionActual14 = JSON.stringify(geomagnetic);
        expect(assertionActual14).assertEqual(geomagneticBefore);
      },
    );

    /**
     * @tc.name testSensorFusionConfigurationValidationTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_CONFIGURATION_VALIDATION_0800
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 157
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionConfigurationValidationTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-1.808869501695, -4.988353755091, -8.251085864291];
        const geomagnetic: number[] = [33.47344147714, -14.69990623307, -23.41882730658];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.01198774985635, 0.8545357644765, -0.5192541969824, 0.9827799786104, -0.1058282399524, -0.1514724307297,
          -0.1843903671453, -0.508496814994, -0.8410892828024,
        ];
        const expectedInclination: number[] = [
          1, 0, 0, 0, 0.8752415354393, 0.4836861116901, 0, -0.4836861116901, 0.8752415354393,
        ];
        const promiseResult: sensor.RotationMatrixResponse = await sensor.getRotationMatrix(gravity, geomagnetic);
        const callbackResult: sensor.RotationMatrixResponse = await fusionCallback(gravity, geomagnetic);
        assertRotationMatrix(promiseResult.rotation);
        assertRotationMatrix(callbackResult.rotation);
        assertArrayNear(promiseResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(callbackResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(promiseResult.inclination, expectedInclination, 0.00008);
        assertArrayNear(callbackResult.inclination, expectedInclination, 0.00008);
        const dip: number = await sensor.getInclination(promiseResult.inclination);
        assertNear(dip, 0.5048613716591, 0.00005);
        const assertionActual15 = JSON.stringify(gravity);
        expect(assertionActual15).assertEqual(gravityBefore);
        const assertionActual16 = JSON.stringify(geomagnetic);
        expect(assertionActual16).assertEqual(geomagneticBefore);
      },
    );

    /**
     * @tc.name testSensorFusionConfigurationValidationTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_CONFIGURATION_VALIDATION_0900
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 158
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionConfigurationValidationTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-7.070795470717, -3.254479639851, 5.970620879363];
        const geomagnetic: number[] = [-18.69668224947, 27.86414542447, 27.5503806258];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.6868083085835, -0.2231136464722, 0.6917475319931, -0.09369533768512, 0.9166031950505, 0.3886640792759,
          -0.7207742579732, -0.3317512374976, 0.6086259815864,
        ];
        const expectedInclination: number[] = [
          1, 0, 0, 0, 0.8752415354393, 0.4836861116901, 0, -0.4836861116901, 0.8752415354393,
        ];
        const promiseResult: sensor.RotationMatrixResponse = await sensor.getRotationMatrix(gravity, geomagnetic);
        const callbackResult: sensor.RotationMatrixResponse = await fusionCallback(gravity, geomagnetic);
        assertRotationMatrix(promiseResult.rotation);
        assertRotationMatrix(callbackResult.rotation);
        assertArrayNear(promiseResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(callbackResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(promiseResult.inclination, expectedInclination, 0.00008);
        assertArrayNear(callbackResult.inclination, expectedInclination, 0.00008);
        const dip: number = await sensor.getInclination(promiseResult.inclination);
        assertNear(dip, 0.5048613716591, 0.00005);
        const assertionActual17 = JSON.stringify(gravity);
        expect(assertionActual17).assertEqual(gravityBefore);
        const assertionActual18 = JSON.stringify(geomagnetic);
        expect(assertionActual18).assertEqual(geomagneticBefore);
      },
    );

    /**
     * @tc.name testSensorFusionConfigurationValidationTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_CONFIGURATION_VALIDATION_1000
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 159
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionConfigurationValidationTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-1.411445362886, 9.036227032515, 3.548312698231];
        const geomagnetic: number[] = [-28.26278048293, 26.22306518006, -19.96412011424];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.7335370916402, 0.3446092806327, -0.5858052397255, -0.6642457318444, 0.1810384187284, -0.7252604350651,
          -0.1438782225164, 0.9211240603991, 0.3617036389634,
        ];
        const expectedInclination: number[] = [
          1, 0, 0, 0, 0.8752415354393, 0.4836861116901, 0, -0.4836861116901, 0.8752415354393,
        ];
        const promiseResult: sensor.RotationMatrixResponse = await sensor.getRotationMatrix(gravity, geomagnetic);
        const callbackResult: sensor.RotationMatrixResponse = await fusionCallback(gravity, geomagnetic);
        assertRotationMatrix(promiseResult.rotation);
        assertRotationMatrix(callbackResult.rotation);
        assertArrayNear(promiseResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(callbackResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(promiseResult.inclination, expectedInclination, 0.00008);
        assertArrayNear(callbackResult.inclination, expectedInclination, 0.00008);
        const dip: number = await sensor.getInclination(promiseResult.inclination);
        assertNear(dip, 0.5048613716591, 0.00005);
        const assertionActual19 = JSON.stringify(gravity);
        expect(assertionActual19).assertEqual(gravityBefore);
        const assertionActual20 = JSON.stringify(geomagnetic);
        expect(assertionActual20).assertEqual(geomagneticBefore);
      },
    );

    /**
     * @tc.name testSensorFusionConfigurationValidationTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_CONFIGURATION_VALIDATION_1100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 160
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionConfigurationValidationTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [9.669904455822, -1.651110199572, -0.0536928686491];
        const geomagnetic: number[] = [18.72880708441, -13.89237290183, -36.62285844048];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.1602083098748, -0.94729851022, 0.2774145453684, -0.0518761630834, -0.2725759535809, -0.960734725735,
          0.9857191086465, -0.1683088888453, -0.005473279169123,
        ];
        const expectedInclination: number[] = [
          1, 0, 0, 0, 0.8752415354393, 0.4836861116901, 0, -0.4836861116901, 0.8752415354393,
        ];
        const promiseResult: sensor.RotationMatrixResponse = await sensor.getRotationMatrix(gravity, geomagnetic);
        const callbackResult: sensor.RotationMatrixResponse = await fusionCallback(gravity, geomagnetic);
        assertRotationMatrix(promiseResult.rotation);
        assertRotationMatrix(callbackResult.rotation);
        assertArrayNear(promiseResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(callbackResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(promiseResult.inclination, expectedInclination, 0.00008);
        assertArrayNear(callbackResult.inclination, expectedInclination, 0.00008);
        const dip: number = await sensor.getInclination(promiseResult.inclination);
        assertNear(dip, 0.5048613716591, 0.00005);
        const assertionActual21 = JSON.stringify(gravity);
        expect(assertionActual21).assertEqual(gravityBefore);
        const assertionActual22 = JSON.stringify(geomagnetic);
        expect(assertionActual22).assertEqual(geomagneticBefore);
      },
    );

    /**
     * @tc.name testSensorFusionConfigurationValidationTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_CONFIGURATION_VALIDATION_1200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 161
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionConfigurationValidationTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [0.1390404046627, 0.07851879605322, 9.808700350431];
        const geomagnetic: number[] = [0.8221528093473, 38.16318536831, 20.68563142141];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.9998042781825, -0.01391735604275, -0.01406102872489, 0.01380296840437, 0.9998711136488, -0.008199643529843,
          0.01417333380863, 0.008003954745486, 0.9998675178828,
        ];
        const expectedInclination: number[] = [
          1, 0, 0, 0, 0.8752415354393, 0.4836861116901, 0, -0.4836861116901, 0.8752415354393,
        ];
        const promiseResult: sensor.RotationMatrixResponse = await sensor.getRotationMatrix(gravity, geomagnetic);
        const callbackResult: sensor.RotationMatrixResponse = await fusionCallback(gravity, geomagnetic);
        assertRotationMatrix(promiseResult.rotation);
        assertRotationMatrix(callbackResult.rotation);
        assertArrayNear(promiseResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(callbackResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(promiseResult.inclination, expectedInclination, 0.00008);
        assertArrayNear(callbackResult.inclination, expectedInclination, 0.00008);
        const dip: number = await sensor.getInclination(promiseResult.inclination);
        assertNear(dip, 0.5048613716591, 0.00005);
        const assertionActual23 = JSON.stringify(gravity);
        expect(assertionActual23).assertEqual(gravityBefore);
        const assertionActual24 = JSON.stringify(geomagnetic);
        expect(assertionActual24).assertEqual(geomagneticBefore);
      },
    );

    /**
     * @tc.name testSensorFusionConfigurationValidationTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_CONFIGURATION_VALIDATION_1300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 162
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionConfigurationValidationTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-9.783034386692, -0.04390914802731, 0.7255412982906];
        const geomagnetic: number[] = [-23.42655480556, -15.92565547313, -32.90243194193];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.0348716092674, 0.9090685017485, -0.4151848142645, -0.06537577263257, -0.4166226409218, -0.9067257487377,
          -0.9972512116913, -0.004475958004823, 0.07395935762391,
        ];
        const expectedInclination: number[] = [
          1, 0, 0, 0, 0.8752415354393, 0.4836861116901, 0, -0.4836861116901, 0.8752415354393,
        ];
        const promiseResult: sensor.RotationMatrixResponse = await sensor.getRotationMatrix(gravity, geomagnetic);
        const callbackResult: sensor.RotationMatrixResponse = await fusionCallback(gravity, geomagnetic);
        assertRotationMatrix(promiseResult.rotation);
        assertRotationMatrix(callbackResult.rotation);
        assertArrayNear(promiseResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(callbackResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(promiseResult.inclination, expectedInclination, 0.00008);
        assertArrayNear(callbackResult.inclination, expectedInclination, 0.00008);
        const dip: number = await sensor.getInclination(promiseResult.inclination);
        assertNear(dip, 0.5048613716591, 0.00005);
        const assertionActual25 = JSON.stringify(gravity);
        expect(assertionActual25).assertEqual(gravityBefore);
        const assertionActual26 = JSON.stringify(geomagnetic);
        expect(assertionActual26).assertEqual(geomagneticBefore);
      },
    );

    /**
     * @tc.name testSensorFusionConfigurationValidationTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_CONFIGURATION_VALIDATION_1400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 163
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionConfigurationValidationTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-5.740641007355, -0.5851184804945, 7.933396321152];
        const geomagnetic: number[] = [17.66429011309, 6.054162185089, 39.19591783639];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.1903651587877, -0.9795254773631, 0.06550530906947, 0.7882401072049, 0.19228182608, 0.5845555856828,
          -0.5851825695571, -0.05964510504531, 0.8087050276403,
        ];
        const expectedInclination: number[] = [
          1, 0, 0, 0, 0.8752415354393, 0.4836861116901, 0, -0.4836861116901, 0.8752415354393,
        ];
        const promiseResult: sensor.RotationMatrixResponse = await sensor.getRotationMatrix(gravity, geomagnetic);
        const callbackResult: sensor.RotationMatrixResponse = await fusionCallback(gravity, geomagnetic);
        assertRotationMatrix(promiseResult.rotation);
        assertRotationMatrix(callbackResult.rotation);
        assertArrayNear(promiseResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(callbackResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(promiseResult.inclination, expectedInclination, 0.00008);
        assertArrayNear(callbackResult.inclination, expectedInclination, 0.00008);
        const dip: number = await sensor.getInclination(promiseResult.inclination);
        assertNear(dip, 0.5048613716591, 0.00005);
        const assertionActual27 = JSON.stringify(gravity);
        expect(assertionActual27).assertEqual(gravityBefore);
        const assertionActual28 = JSON.stringify(geomagnetic);
        expect(assertionActual28).assertEqual(geomagneticBefore);
      },
    );

    /**
     * @tc.name testSensorFusionConfigurationValidationTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_CONFIGURATION_VALIDATION_1500
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 164
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionConfigurationValidationTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [5.679429703406, -4.477099668752, 6.628405298421];
        const geomagnetic: number[] = [9.050301795374, 20.51202089947, 37.17995476103];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.811256910661, 0.4055257016694, -0.4212020063939, -0.08177628402516, 0.7920006922787, 0.6050186301273,
          0.5789428851586, -0.4563812098626, 0.6756784198186,
        ];
        const expectedInclination: number[] = [
          1, 0, 0, 0, 0.8752415354393, 0.4836861116901, 0, -0.4836861116901, 0.8752415354393,
        ];
        const promiseResult: sensor.RotationMatrixResponse = await sensor.getRotationMatrix(gravity, geomagnetic);
        const callbackResult: sensor.RotationMatrixResponse = await fusionCallback(gravity, geomagnetic);
        assertRotationMatrix(promiseResult.rotation);
        assertRotationMatrix(callbackResult.rotation);
        assertArrayNear(promiseResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(callbackResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(promiseResult.inclination, expectedInclination, 0.00008);
        assertArrayNear(callbackResult.inclination, expectedInclination, 0.00008);
        const dip: number = await sensor.getInclination(promiseResult.inclination);
        assertNear(dip, 0.5048613716591, 0.00005);
        const assertionActual29 = JSON.stringify(gravity);
        expect(assertionActual29).assertEqual(gravityBefore);
        const assertionActual30 = JSON.stringify(geomagnetic);
        expect(assertionActual30).assertEqual(geomagneticBefore);
      },
    );

    /**
     * @tc.name testSensorFusionConfigurationValidationTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_CONFIGURATION_VALIDATION_1600
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 165
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionConfigurationValidationTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-2.103479616421, 0.8698002590966, -9.5422702232];
        const geomagnetic: number[] = [-6.74964099756, 39.59089648848, -16.49252138525];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.9749499256874, -0.07971247317736, 0.2076500999808, -0.059125774562, 0.9928668091392, 0.1035357044314,
          -0.2144219792478, 0.08866465434216, -0.9727084835067,
        ];
        const expectedInclination: number[] = [
          1, 0, 0, 0, 0.8752415354393, 0.4836861116901, 0, -0.4836861116901, 0.8752415354393,
        ];
        const promiseResult: sensor.RotationMatrixResponse = await sensor.getRotationMatrix(gravity, geomagnetic);
        const callbackResult: sensor.RotationMatrixResponse = await fusionCallback(gravity, geomagnetic);
        assertRotationMatrix(promiseResult.rotation);
        assertRotationMatrix(callbackResult.rotation);
        assertArrayNear(promiseResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(callbackResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(promiseResult.inclination, expectedInclination, 0.00008);
        assertArrayNear(callbackResult.inclination, expectedInclination, 0.00008);
        const dip: number = await sensor.getInclination(promiseResult.inclination);
        assertNear(dip, 0.5048613716591, 0.00005);
        const assertionActual31 = JSON.stringify(gravity);
        expect(assertionActual31).assertEqual(gravityBefore);
        const assertionActual32 = JSON.stringify(geomagnetic);
        expect(assertionActual32).assertEqual(geomagneticBefore);
      },
    );

    /**
     * @tc.name testSensorFusionConfigurationValidationTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_CONFIGURATION_VALIDATION_1700
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 166
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionConfigurationValidationTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-0.02314847342389, -5.020499372078, 8.427938668686];
        const geomagnetic: number[] = [-8.066974435634, 21.17407708093, 37.03488062929];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.9774865012834, 0.1800811868539, 0.1099586556394, -0.2109847665424, 0.8400348274519, 0.4998268869868,
          -0.002359681286838, -0.5117736362975, 0.8591170916092,
        ];
        const expectedInclination: number[] = [
          1, 0, 0, 0, 0.8752415354393, 0.4836861116901, 0, -0.4836861116901, 0.8752415354393,
        ];
        const promiseResult: sensor.RotationMatrixResponse = await sensor.getRotationMatrix(gravity, geomagnetic);
        const callbackResult: sensor.RotationMatrixResponse = await fusionCallback(gravity, geomagnetic);
        assertRotationMatrix(promiseResult.rotation);
        assertRotationMatrix(callbackResult.rotation);
        assertArrayNear(promiseResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(callbackResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(promiseResult.inclination, expectedInclination, 0.00008);
        assertArrayNear(callbackResult.inclination, expectedInclination, 0.00008);
        const dip: number = await sensor.getInclination(promiseResult.inclination);
        assertNear(dip, 0.5048613716591, 0.00005);
        const assertionActual33 = JSON.stringify(gravity);
        expect(assertionActual33).assertEqual(gravityBefore);
        const assertionActual34 = JSON.stringify(geomagnetic);
        expect(assertionActual34).assertEqual(geomagneticBefore);
      },
    );

    /**
     * @tc.name testSensorFusionConfigurationValidationTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_CONFIGURATION_VALIDATION_1800
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 167
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionConfigurationValidationTest0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-8.920993165392, 2.259290019647, 3.39817444375];
        const geomagnetic: number[] = [-3.600457068079, 17.35200802761, 39.63514256705];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.08203801652948, -0.9156871472596, 0.3934295517464, 0.407801847297, 0.3293580887876, 0.8515990269436,
          -0.9093774888269, 0.2303047930323, 0.3463990258665,
        ];
        const expectedInclination: number[] = [
          1, 0, 0, 0, 0.8752415354393, 0.4836861116901, 0, -0.4836861116901, 0.8752415354393,
        ];
        const promiseResult: sensor.RotationMatrixResponse = await sensor.getRotationMatrix(gravity, geomagnetic);
        const callbackResult: sensor.RotationMatrixResponse = await fusionCallback(gravity, geomagnetic);
        assertRotationMatrix(promiseResult.rotation);
        assertRotationMatrix(callbackResult.rotation);
        assertArrayNear(promiseResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(callbackResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(promiseResult.inclination, expectedInclination, 0.00008);
        assertArrayNear(callbackResult.inclination, expectedInclination, 0.00008);
        const dip: number = await sensor.getInclination(promiseResult.inclination);
        assertNear(dip, 0.5048613716591, 0.00005);
        const assertionActual35 = JSON.stringify(gravity);
        expect(assertionActual35).assertEqual(gravityBefore);
        const assertionActual36 = JSON.stringify(geomagnetic);
        expect(assertionActual36).assertEqual(geomagneticBefore);
      },
    );

    /**
     * @tc.name testSensorFusionConfigurationValidationTest0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_CONFIGURATION_VALIDATION_1900
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 168
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionConfigurationValidationTest0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [0.9124373084309, 9.755556534845, 0.4823638187436];
        const geomagnetic: number[] = [-35.86761864579, 24.36039623676, 2.255000636014];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.02749131508095, 0.05193086595326, -0.9982722137556, -0.9952854831059, 0.09149847054799, 0.03216888257332,
          0.09301093867797, 0.9944502074256, 0.04917062372514,
        ];
        const expectedInclination: number[] = [
          1, 0, 0, 0, 0.8752415354393, 0.4836861116901, 0, -0.4836861116901, 0.8752415354393,
        ];
        const promiseResult: sensor.RotationMatrixResponse = await sensor.getRotationMatrix(gravity, geomagnetic);
        const callbackResult: sensor.RotationMatrixResponse = await fusionCallback(gravity, geomagnetic);
        assertRotationMatrix(promiseResult.rotation);
        assertRotationMatrix(callbackResult.rotation);
        assertArrayNear(promiseResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(callbackResult.rotation, expectedRotation, 0.00008);
        assertArrayNear(promiseResult.inclination, expectedInclination, 0.00008);
        assertArrayNear(callbackResult.inclination, expectedInclination, 0.00008);
        const dip: number = await sensor.getInclination(promiseResult.inclination);
        assertNear(dip, 0.5048613716591, 0.00005);
        const assertionActual37 = JSON.stringify(gravity);
        expect(assertionActual37).assertEqual(gravityBefore);
        const assertionActual38 = JSON.stringify(geomagnetic);
        expect(assertionActual38).assertEqual(geomagneticBefore);
      },
    );
  });
}
