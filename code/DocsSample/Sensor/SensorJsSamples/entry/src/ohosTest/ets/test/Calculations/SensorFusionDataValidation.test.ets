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

export default function sensorFusionDataValidationTest(): void {
  describe('SensorFusionDataValidation', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorFusionDataValidationTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_DATA_VALIDATION_0100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 132
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionDataValidationTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [1.521196722281, 1.87025103498, 9.509165136766];
        const geomagnetic: number[] = [18.38643934982, 37.66858431469, 11.31444226474];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.9041148703276, -0.4228450978245, -0.06146807706659, 0.3981593402378, 0.8859207586044, -0.2379360192471,
          0.1550659247993, 0.1906474041774, 0.9693338569588,
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
     * @tc.name testSensorFusionDataValidationTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_DATA_VALIDATION_0200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 133
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionDataValidationTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-9.608327299412, 1.163287597588, 1.6009086397];
        const geomagnetic: number[] = [-26.15052428972, 7.625873702992, -33.80822576887];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.1382504877669, 0.9837037900848, 0.1149506677013, -0.1469010408135, 0.135148831689, -0.9798749295196,
          -0.9794421304192, 0.1185818142292, 0.1631915025178,
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
     * @tc.name testSensorFusionDataValidationTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_DATA_VALIDATION_0300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 134
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionDataValidationTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [5.165493063053, -8.133580097803, 1.843544468727];
        const geomagnetic: number[] = [40.99387072442, -2.485816051929, -14.08272990529];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.3195603951747, -0.3978707743451, -0.859988372455, 0.7877957977425, 0.3927767760728, -0.4744514571978,
          0.5265538290574, -0.8291111210808, 0.1879250222963,
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
     * @tc.name testSensorFusionDataValidationTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_DATA_VALIDATION_0400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 135
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionDataValidationTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-0.2247163072129, -3.583634309828, 9.129247927113];
        const geomagnetic: number[] = [-6.265913167212, 27.33686879467, 33.14263020166];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.9880790801172, 0.1334711768952, 0.07671490319955, -0.1522333969603, 0.9212699269866, 0.357892043052,
          -0.02290686108184, -0.3653042109917, 0.9306063126517,
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
     * @tc.name testSensorFusionDataValidationTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_DATA_VALIDATION_0500
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 136
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionDataValidationTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [3.757869040393, -0.1763260730147, -9.0599905845];
        const geomagnetic: number[] = [-1.315561222492, 36.16418999066, -23.98792740087];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.8902755454955, -0.2737873866947, -0.3639366977644, -0.246313926286, 0.9616222741072, -0.1208803195666,
          0.3830651417322, -0.01797411549589, -0.9235464408257,
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
     * @tc.name testSensorFusionDataValidationTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_DATA_VALIDATION_0600
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 137
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionDataValidationTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-4.817048823131, -6.681804851336, 5.327816115843];
        const geomagnetic: number[] = [-28.98726614379, 13.48760384606, 29.3738479604];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.7192708646905, 0.0347217231789, 0.6938615316811, -0.4914616009036, 0.7313463587314, 0.4728615002383,
          -0.4910345385455, -0.6811217993207, 0.5431005214926,
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
     * @tc.name testSensorFusionDataValidationTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_DATA_VALIDATION_0700
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 138
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionDataValidationTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [2.599240582818, -6.559908755088, 6.815250950446];
        const geomagnetic: number[] = [39.1889239241, 3.243808166346, 18.40396561209];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.383163533011, -0.5881378204757, -0.7122356429558, 0.8848631671663, 0.4549059551712, 0.1003879840529,
          0.2649582653229, -0.6686961014361, 0.6947248675276,
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
     * @tc.name testSensorFusionDataValidationTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_DATA_VALIDATION_0800
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 139
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionDataValidationTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-6.506119005963, 7.192011376245, 1.47698606771];
        const geomagnetic: number[] = [-42.16546075942, -10.02579815455, 2.560720662222];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.08912682098295, 0.1223709552841, -0.9884744605119, -0.7431049705582, -0.6689879253106, -0.01581640035816,
          -0.6632129465814, 0.7331306193929, 0.1505592321825,
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
     * @tc.name testSensorFusionDataValidationTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_DATA_VALIDATION_0900
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 140
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionDataValidationTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [0.9664393189194, -0.6087296121141, 9.74328195744];
        const geomagnetic: number[] = [-1.520996204622, 36.42952245449, 23.57066957648];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.9906413257083, 0.1008614108316, -0.09196053286069, -0.09446911976138, 0.992963509665, 0.07140765985035,
          0.0985157307767, -0.06205194822774, 0.9931989762936,
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
     * @tc.name testSensorFusionDataValidationTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_DATA_VALIDATION_1000
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 141
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionDataValidationTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-0.2618720440897, 9.800900632983, 0.3314661595236];
        const geomagnetic: number[] = [36.42231554037, 21.6742576297, 9.414960800712];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.2282601328778, -0.03899962466611, 0.9728187606202, 0.973234155204, 0.01825622097401, 0.2290894793309,
          -0.02669439797041, 0.9990724396517, 0.03378859933982,
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
     * @tc.name testSensorFusionDataValidationTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_DATA_VALIDATION_1100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 142
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionDataValidationTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-4.11122914817, 8.628693410016, 2.208969200144];
        const geomagnetic: number[] = [-28.86346956087, 17.16714464633, -27.51707232975];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.7386610720875, 0.4745091075262, -0.4787702240712, -0.5279650847165, -0.03431748653321, -0.8485724361764,
          -0.4190855400785, 0.8795813873615, 0.2251752497598,
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
     * @tc.name testSensorFusionDataValidationTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_DATA_VALIDATION_1200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 143
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionDataValidationTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [5.914109845023, -2.973423651897, 7.240038434107];
        const geomagnetic: number[] = [19.35740972132, 29.84006642428, 24.89701035618];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.7781334493338, 0.0190333807929, -0.6278105330779, 0.1762430458198, 0.9527682502065, 0.2473278192979,
          0.6028654276272, -0.3031012896939, 0.7380263439457,
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
     * @tc.name testSensorFusionDataValidationTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_DATA_VALIDATION_1300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 144
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionDataValidationTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-3.654349815896, 2.527628020024, -8.746023325801];
        const geomagnetic: number[] = [-43.0474874713, 3.230129504249, -4.634661346222];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.04435883928186, -0.9645304353876, -0.260217856014, -0.9269663231923, -0.05738671061702, 0.3707292827818,
          -0.3725127233329, 0.2576583098903, -0.8915416234252,
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
     * @tc.name testSensorFusionDataValidationTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_DATA_VALIDATION_1400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 145
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionDataValidationTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-3.385574196091, 0.7874923033974, 9.17354038716];
        const geomagnetic: number[] = [13.66636309238, 33.01180365789, 24.6668064224];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.7602612637524, -0.5603311258576, 0.3286819743046, 0.550362358641, 0.8243694820338, 0.1323488998159,
          -0.3451145969512, 0.08027444479076, 0.9351213442568,
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
     * @tc.name testSensorFusionDataValidationTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_DATA_VALIDATION_1500
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 146
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionDataValidationTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [1.562112679472, -8.951957851609, 3.695721120383];
        const geomagnetic: number[] = [-30.26371091074, -17.73005327012, 25.58814203786];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.438700135973, 0.4072584278005, 0.8010510368776, -0.884412710723, 0.03771471727003, 0.4651792742726,
          0.1592367665109, -0.9125339298277, 0.3767299816904,
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
     * @tc.name testSensorFusionDataValidationTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_DATA_VALIDATION_1600
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 147
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionDataValidationTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [3.490430264186, -8.952030268555, 1.97842124982];
        const geomagnetic: number[] = [37.58542551403, -12.31547601912, -17.90711700279];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.4953866969509, -0.3671424101382, -0.7872728060602, 0.7924620117624, 0.1802076717958, -0.5826913032983,
          0.3558032889078, -0.9125413117793, 0.2016739296453,
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
     * @tc.name testSensorFusionDataValidationTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_DATA_VALIDATION_1700
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 148
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionDataValidationTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-1.00762334339, 1.089966475488, 9.697049462603];
        const geomagnetic: number[] = [-6.292874826609, 39.82103007912, 16.11475379441];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.9887385507066, 0.1201371220542, 0.08923648497806, -0.1088390252638, 0.9865202239684, -0.1221962122204,
          -0.1027138984088, 0.1111076937296, 0.9884861837516,
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
     * @tc.name testSensorFusionDataValidationTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_DATA_VALIDATION_1800
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 149
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorFusionDataValidationTest0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [9.373905069345, -2.565571705819, 1.335606818347];
        const geomagnetic: number[] = [8.894434543565, -36.28292411293, 22.12325590787];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.02226267118147, 0.5244429242006, 0.8511545057907, -0.2940007607271, -0.8102861734151, 0.5069515458741,
          0.9555458786284, -0.2615261677695, 0.1361474840313,
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
  });
}
