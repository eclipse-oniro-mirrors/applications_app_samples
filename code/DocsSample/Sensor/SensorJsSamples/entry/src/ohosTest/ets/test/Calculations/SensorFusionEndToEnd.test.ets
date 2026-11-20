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

export default function sensorFusionEndToEndTest(): void {
  describe('SensorFusionEndToEnd', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorFusionEndToEndTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_END_TO_END_0100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 80
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionEndToEndTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-0.5614893137527, -1.718485852539, 9.64197262624];
        const geomagnetic: number[] = [9.844280461065, 31.99970047878, 27.64252722658];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.9551036215237, -0.2962585610104, 0.002817300180703, 0.2906906671813, 0.9389056939755, 0.1842689171674,
          -0.05723642342026, -0.1751769472516, 0.9828718273436,
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
     * @tc.name testSensorFusionEndToEndTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_END_TO_END_0200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 81
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionEndToEndTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-4.596253612626, -8.665906407001, -0.1123337594637];
        const geomagnetic: number[] = [20.38518837048, -34.36424525482, -16.98654594573];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.384525866418, 0.2155813563392, -0.8975881777599, 0.7953753521637, -0.4161414544846, -0.440686213796,
          -0.4685273815114, -0.8833747611622, -0.01145094388009,
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
     * @tc.name testSensorFusionEndToEndTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_END_TO_END_0300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 82
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionEndToEndTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-3.910802774082, -6.307659679565, 6.415228057445];
        const geomagnetic: number[] = [-35.28142779216, 11.91613711395, 22.3209885361];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.5827510503431, 0.3729959267979, 0.7219939417448, -0.7081494403812, 0.6689150661481, 0.2260022220419,
          -0.3986547170318, -0.64298263808, 0.6539478142145,
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
     * @tc.name testSensorFusionEndToEndTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_END_TO_END_0400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 83
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionEndToEndTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [6.803447623486, 2.460126695379, 6.625479384706];
        const geomagnetic: number[] = [34.5982389346, 22.83103798491, -12.91145100893];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.4909876517078, -0.8505614557936, -0.1883516280489, 0.5272179941391, 0.4622292559392, -0.7130114316123,
          0.6935216741576, 0.2507774409153, 0.6753801615398,
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
     * @tc.name testSensorFusionEndToEndTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_END_TO_END_0500
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 84
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionEndToEndTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-3.395788694333, 7.056741681625, -5.90822443567];
        const geomagnetic: number[] = [-37.24544141554, -6.578770653295, -21.31893220714];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.5078358577293, -0.3961045070132, -0.7649862489798, -0.7888465521366, -0.5706564607086, -0.2281936042786,
          -0.3461558302072, 0.7193416596968, -0.6022654878359,
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
     * @tc.name testSensorFusionEndToEndTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_END_TO_END_0600
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 85
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionEndToEndTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [1.925638335963, 0.4244217119684, 9.609780601527];
        const geomagnetic: number[] = [4.231537357569, 38.8704110828, 18.87287031285];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.9805409798512, -0.01159349490133, -0.195971879892, 0.002878310055585, 0.9989963967245, -0.04469803869046,
          0.1962934083551, 0.04326419082246, 0.979590275385,
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
     * @tc.name testSensorFusionEndToEndTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_END_TO_END_0700
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 86
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionEndToEndTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-8.536281848596, 3.155387992094, -3.66217405658];
        const geomagnetic: number[] = [-3.622000235694, 5.715780202895, -42.88602302575];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.3068562157625, 0.9464638248217, 0.1002271976648, 0.3855627890669, -0.02733876292603, -0.9222764920178,
          -0.8701612485826, 0.3216501520993, -0.3733103013843,
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
     * @tc.name testSensorFusionEndToEndTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_END_TO_END_0800
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 87
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionEndToEndTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [1.090869042664, 1.516898840091, 9.630426918922];
        const geomagnetic: number[] = [40.01197750247, 0.03679746457093, 16.85349525436];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.06762882158231, -0.9843539594007, 0.1627071759437, 0.9914943113989, -0.08448385781013, -0.09900256680111,
          0.1111996985386, 0.1546278124455, 0.9816948948952,
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
     * @tc.name testSensorFusionEndToEndTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_END_TO_END_0900
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 88
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionEndToEndTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [4.030678085446, -3.120423727856, 8.381687773363];
        const geomagnetic: number[] = [-3.544001130353, 24.74785040677, 35.4962527069];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.8535653853963, 0.463486986545, -0.2379200415198, -0.3203253685368, 0.8270435934744, 0.4619421530503,
          0.4108744225735, -0.318086006917, 0.8544024233805,
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
     * @tc.name testSensorFusionEndToEndTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_END_TO_END_1000
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 89
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionEndToEndTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-3.202431225805, 9.253865419008, -0.5886501939756];
        const geomagnetic: number[] = [-23.78367950565, 16.10244893355, 32.55837415343];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.8336539577386, -0.3172547390012, -0.4520735662789, -0.4454821616196, -0.09755391856077, 0.889960042166,
          -0.3264455887671, 0.9433094208979, -0.06000511661321,
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
     * @tc.name testSensorFusionEndToEndTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_END_TO_END_1100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 90
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionEndToEndTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-3.270331704134, -4.058055872989, 8.311029603884];
        const geomagnetic: number[] = [8.192583743837, 19.88011401519, 37.71820035929];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.8538193588588, -0.5135464147357, 0.08522078590335, 0.3998235214171, 0.7517653624705, 0.5243948812786,
          -0.3333671461911, -0.4136652266043, 0.8471997557476,
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
     * @tc.name testSensorFusionEndToEndTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_END_TO_END_1200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 91
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionEndToEndTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-1.558586956284, -9.395369064174, 2.352434238756];
        const geomagnetic: number[] = [-36.46694696708, -10.6097745126, 21.03792916833];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.4632767639184, 0.1421660299353, 0.8747362230671, -0.8718558497375, 0.2500693770564, 0.4211088742085,
          -0.1588773655743, -0.957733849559, 0.2397996165908,
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
     * @tc.name testSensorFusionEndToEndTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_END_TO_END_1300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 92
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionEndToEndTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [7.275251921493, 3.15834567331, -5.773357955877];
        const geomagnetic: number[] = [-9.263339614934, 27.44259953275, -32.34338062206];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.1509854984024, -0.7746843110739, -0.614058301343, -0.6536124576798, 0.5442530239733, -0.525908167898,
          0.7416158941379, 0.3219516486555, -0.5885176305685,
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
     * @tc.name testSensorFusionEndToEndTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_END_TO_END_1400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 93
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionEndToEndTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-0.8081690913381, 1.040854726221, 9.72108965902];
        const geomagnetic: number[] = [-0.03672233847427, 39.98927541429, 16.90729142442];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.9956041029959, -0.0356965749307, 0.08659228970244, 0.04456061156089, 0.9937143692352, -0.1026942270665,
          -0.08238217037086, 0.106101399207, 0.9909367644261,
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
     * @tc.name testSensorFusionEndToEndTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_END_TO_END_1500
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 94
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionEndToEndTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [7.737160644535, 0.03701171520013, 6.030843663502];
        const geomagnetic: number[] = [32.11513086819, -28.3980836195, -6.867839256882];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.4587429908838, -0.6621034098137, 0.5925993106882, 0.4092737278871, -0.7494029892337, -0.5204711090819,
          0.7887013908802, 0.00377285577983, 0.6147648994396,
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
     * @tc.name testSensorFusionEndToEndTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_END_TO_END_1600
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 95
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionEndToEndTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-7.691878636487, 3.518164432704, 4.96926775954];
        const geomagnetic: number[] = [-28.51971164774, 25.38951714043, -20.66394122392];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.5334686732381, 0.806552421397, 0.2547240982164, -0.3172083263537, 0.4699546919385, -0.8237241438837,
          -0.7840854879192, 0.3586304212747, 0.5065512496983,
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
  });
}
