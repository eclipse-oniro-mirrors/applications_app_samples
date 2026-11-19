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

export default function sensorFusionRepeatedInputsTest(): void {
  describe('SensorFusionRepeatedInputs', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorFusionRepeatedInputsTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_REPEATED_INPUTS_0100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 60
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionRepeatedInputsTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-3.750074801384, 8.168910248027, 3.92962394431];
        const geomagnetic: number[] = [-36.20405426868, -2.847352126039, 23.79409675488];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.5514267501365, 0.1422787592498, -0.8220007870435, -0.7414834528319, -0.5351135778878, 0.4047909929044,
          -0.3822706219555, 0.8327125635094, 0.4005732868818,
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
     * @tc.name testSensorFusionRepeatedInputsTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_REPEATED_INPUTS_0200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 61
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionRepeatedInputsTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-7.97657928569, -2.700885854312, 5.031450933983];
        const geomagnetic: number[] = [-7.486997729148, 18.05612749222, 38.76752668134];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.5245860399033, -0.7284773554556, 0.4406021213373, 0.2523223275834, 0.6273115876367, 0.7367588581209,
          -0.8131069608247, -0.2753196589512, 0.5128900034642,
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
     * @tc.name testSensorFusionRepeatedInputsTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_REPEATED_INPUTS_0300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 62
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionRepeatedInputsTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [7.16734925732, -4.311804937569, 5.125772410471];
        const geomagnetic: number[] = [10.99851868968, 16.44632157885, 38.64648875587];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.6731482977625, 0.5918154912464, -0.4434250709424, -0.1143271260742, 0.6756969750991, 0.7282601911992,
          0.7306166419287, -0.4395315940438, 0.5225048328717,
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
     * @tc.name testSensorFusionRepeatedInputsTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_REPEATED_INPUTS_0400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 63
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionRepeatedInputsTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [1.424162623754, 4.13353797782, -8.781897551613];
        const geomagnetic: number[] = [-8.578994653343, -23.12108175646, -35.73256818575];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.9409005282164, -0.3386148403948, -0.006796018436632, -0.305991074221, -0.841306157962, -0.4456157661847,
          0.1451745793837, 0.4213596307665, -0.8951985271777,
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
     * @tc.name testSensorFusionRepeatedInputsTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_REPEATED_INPUTS_0500
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 64
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionRepeatedInputsTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [2.207699142358, -2.121953868154, 9.319843146655];
        const geomagnetic: number[] = [1.866439703465, 32.25207484155, 29.00551794484];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.9714379786423, 0.1251154348718, -0.201629317333, -0.07525057271992, 0.9682758877269, 0.2382837731615,
          0.2250457841344, -0.2163051853368, 0.9500349792717,
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
     * @tc.name testSensorFusionRepeatedInputsTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_REPEATED_INPUTS_0600
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 65
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionRepeatedInputsTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-4.814514368839, 8.498228422166, 0.9146939799321];
        const geomagnetic: number[] = [19.85727645772, 33.40813637456, 19.35419839881];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.3592418522949, -0.298686618172, 0.8841558661711, 0.7937783244698, 0.4004265812783, 0.457793102403,
          -0.4907761843873, 0.8662822040944, 0.09324097654762,
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
     * @tc.name testSensorFusionRepeatedInputsTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_REPEATED_INPUTS_0700
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 66
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionRepeatedInputsTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-3.65866375171, 8.455759301711, 3.36903757525];
        const geomagnetic: number[] = [-39.86941120789, 12.01110830462, -12.29484962213];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.3874353888463, 0.4809921806633, -0.7864733572158, -0.8430897182346, -0.1602606708182, -0.5133383332618,
          -0.3729524721417, 0.8619530378911, 0.3434289067533,
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
     * @tc.name testSensorFusionRepeatedInputsTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_REPEATED_INPUTS_0800
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 67
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionRepeatedInputsTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [2.669339044404, -0.48476479091, 9.42739264927];
        const geomagnetic: number[] = [23.21669128462, 32.53657314475, 16.95159738169];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.8448752295123, -0.4657527335185, -0.2631733986872, 0.4605923643157, 0.8835341036513, -0.08498330200196,
          0.2721038781248, -0.04941537114271, 0.9609982313221,
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
     * @tc.name testSensorFusionRepeatedInputsTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_REPEATED_INPUTS_0900
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 68
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionRepeatedInputsTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [7.34281442518, -4.808596931617, -4.381389262165];
        const geomagnetic: number[] = [-7.380907155106, -19.33894648213, -38.16447770544];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.2649984922279, -0.8384926894666, 0.4761363342866, -0.6078807932839, -0.2380345764949, -0.7575093937038,
          0.7485029995087, -0.4901729797774, -0.4466247973665,
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
     * @tc.name testSensorFusionRepeatedInputsTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_REPEATED_INPUTS_1000
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 69
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionRepeatedInputsTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-6.210044633553, 1.388320963468, 7.466191167635];
        const geomagnetic: number[] = [-27.03813081942, 33.94815243793, -1.20930882886];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.6844313125382, 0.5616763649237, 0.4648370031563, -0.3616962445245, 0.8151634615141, -0.4524205540304,
          -0.6330320727373, 0.1415209952566, 0.7610796297284,
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
     * @tc.name testSensorFusionRepeatedInputsTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_REPEATED_INPUTS_1100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 70
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionRepeatedInputsTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-3.572502783418, -9.046221237156, 1.280314489062];
        const geomagnetic: number[] = [-8.98811858913, -13.52472516953, 40.26531427068];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.9306643046329, -0.3550091980475, 0.08850096826538, -0.03527787141902, 0.1536914321241, 0.9874889444848,
          -0.3641694988194, -0.9221428376306, 0.1305111609645,
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
     * @tc.name testSensorFusionRepeatedInputsTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_REPEATED_INPUTS_1200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 71
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionRepeatedInputsTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [3.296664006109, -7.180375756626, -5.81466339735];
        const geomagnetic: number[] = [42.21658163065, -1.152385470914, -10.07135756239];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.1760164119854, 0.569433258223, -0.8029719715789, 0.9252500715391, 0.3741697232134, 0.0625245819447,
          0.3360513767696, -0.7319445215725, -0.5927281750612,
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
     * @tc.name testSensorFusionRepeatedInputsTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_REPEATED_INPUTS_1300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 72
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionRepeatedInputsTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-0.06491333852928, 0.04821954719408, 9.809666718791];
        const geomagnetic: number[] = [-0.3224455768466, 38.10231421773, 20.81128732452];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.9999664489491, 0.004861187575748, 0.006593165518145, -0.004828614731881, 0.9999761038275,
          -0.004947348143971, -0.006617057954055, 0.004915346299091, 0.9999660263803,
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
     * @tc.name testSensorFusionRepeatedInputsTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_REPEATED_INPUTS_1400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 73
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionRepeatedInputsTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [7.098700934569, -6.505926197787, 1.875491762314];
        const geomagnetic: number[] = [-10.94170707071, -39.38737666573, 14.62578564626];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.05709421514963, 0.3335617782946, 0.9409977633647, -0.6878342882923, -0.6700083559669, 0.2792360914781,
          0.723618851638, -0.663193292333, 0.1911816271472,
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
     * @tc.name testSensorFusionRepeatedInputsTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_REPEATED_INPUTS_1500
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 74
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionRepeatedInputsTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-2.92037138573, 6.622663115218, 6.621771985786];
        const geomagnetic: number[] = [29.10138650992, 27.99882073919, 15.94287741955];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.2141142243922, -0.6418312918107, 0.7363475346367, 0.9303406855589, 0.3637333173236, 0.04652185145199,
          -0.2976933114913, 0.6750930800426, 0.6750022411606,
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
     * @tc.name testSensorFusionRepeatedInputsTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_REPEATED_INPUTS_1600
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 75
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionRepeatedInputsTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [3.449248769119, 5.75101345753, 7.159932062529];
        const geomagnetic: number[] = [-14.08810349852, 40.98227969013, 2.641607695174];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.7463877271968, 0.2950303826127, -0.5965420639196, -0.5650478015773, 0.7545063607275, -0.3338279999556,
          0.3516053791151, 0.5862399039277, 0.7298605568327,
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
     * @tc.name testSensorFusionRepeatedInputsTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_REPEATED_INPUTS_1700
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 76
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionRepeatedInputsTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-3.075757370818, 9.218850273099, 1.337391579921];
        const geomagnetic: number[] = [-4.863314074488, 14.84746078453, 40.50803728231];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.9484968655138, -0.3167786333888, 0.002234622732425, 0.04528621094598, -0.1286073969602, 0.9906610401875,
          -0.3135328614493, 0.9397400890009, 0.1363294169134,
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
     * @tc.name testSensorFusionRepeatedInputsTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_REPEATED_INPUTS_1800
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 77
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionRepeatedInputsTest0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [1.790204273307, 4.608770992001, 8.472927392768];
        const geomagnetic: number[] = [7.252186660395, 42.80367684899, -0.5010357773725];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.9790804368306, -0.1672412881648, -0.1158958573402, 0.08999855517741, 0.8667843743134, -0.4904947589038,
          0.1824876935073, 0.469803363099, 0.8637030981415,
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
     * @tc.name testSensorFusionRepeatedInputsTest0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_REPEATED_INPUTS_1900
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 78
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionRepeatedInputsTest0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-8.692896950288, 4.098039600798, -1.968683326992];
        const geomagnetic: number[] = [-2.182991192581, 43.01645721999, -5.460673739949];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.1671434220771, 0.115809474051, 0.979107370096, 0.4322541240324, 0.9011551416689, -0.03279912957259,
          -0.8861260907531, 0.4177410398367, -0.2006812769615,
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

    /**
     * @tc.name testSensorFusionRepeatedInputsTest0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_REPEATED_INPUTS_2000
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 79
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionRepeatedInputsTest0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [9.304699295099, -2.55227780049, -1.773287640772];
        const geomagnetic: number[] = [28.17821798914, -0.9281543261995, 33.01706468636];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.230469997939, 0.9581574768295, -0.1697581504542, 0.2173658277708, 0.1193536130433, 0.9687656125044,
          0.9484912635167, -0.2601710296116, -0.1807632661337,
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
        const assertionActual39 = JSON.stringify(gravity);
        expect(assertionActual39).assertEqual(gravityBefore);
        const assertionActual40 = JSON.stringify(geomagnetic);
        expect(assertionActual40).assertEqual(geomagneticBefore);
      },
    );
  });
}
