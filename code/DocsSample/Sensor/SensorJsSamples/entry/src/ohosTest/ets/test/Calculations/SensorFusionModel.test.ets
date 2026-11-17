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

export default function sensorFusionModelTest(): void {
  describe('SensorFusionModel', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorFusionModelTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_0100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 96
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [5.680806719523, -2.586511359125, 7.5679914115];
      const geomagnetic: number[] = [36.41280696137, 22.40868465211, 7.547075019944];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        0.5072947268025, -0.62422430352, -0.594134731398, 0.6382120692661, 0.7354094505574, -0.2277241635706,
        0.579083253774, -0.2636606890035, 0.7714568207442,
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
    });

    /**
     * @tc.name testSensorFusionModelTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_0200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 97
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [8.304996521707, -5.100022125439, -1.119333325899];
      const geomagnetic: number[] = [-2.040986428381, -43.3332236185, -1.751029762357];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        0.1061592112895, -0.04513879557052, 0.9933240714857, -0.5215596432702, -0.8530459226976, 0.0169762269305,
        0.8465847626613, -0.5198799312374, -0.1141012564627,
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
    });

    /**
     * @tc.name testSensorFusionModelTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_0300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 98
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [2.455393354927, 1.645080148222, 9.354189156656];
      const geomagnetic: number[] = [-5.721184873359, 39.7339746757, 16.53720956256];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        0.924068029143, 0.2524877943413, -0.286963745488, -0.2888783841974, 0.9529577993882, -0.09176443607786,
        0.2502949393402, 0.1676942047117, 0.953536101596,
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
    });

    /**
     * @tc.name testSensorFusionModelTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_0400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 99
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [-8.094577296394, -4.529087015173, -3.193945710511];
      const geomagnetic: number[] = [-36.85783762739, 4.524163321572, 22.49514951434];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        0.234541975254, -0.8042562876938, 0.5460420181167, -0.5139472715823, 0.3741962270059, 0.7719037412318,
        -0.825135300346, -0.4616806335548, -0.3255806024986,
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
    });

    /**
     * @tc.name testSensorFusionModelTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_0500
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [4.651453671499, -8.376547136615, -2.105596544918];
      const geomagnetic: number[] = [41.89588334046, -4.009001655896, 10.6612787622];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        0.262208391339, 0.3696718478708, -0.8913974895652, 0.8404906069759, 0.3663801266821, 0.3991755783584,
        0.4741542988277, -0.8538784033246, -0.2146377721629,
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
    });

    /**
     * @tc.name testSensorFusionModelTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_0600
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 101
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [0.5826013927082, 3.554268880987, 9.124902648186];
      const geomagnetic: number[] = [-10.59415044602, 41.50348519881, 7.086938173818];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        0.9483512478857, 0.2703993012239, -0.165873833172, -0.3116134050172, 0.8919725932174, -0.3275392781983,
        0.05938852117311, 0.3623107931689, 0.9301633688263,
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
    });

    /**
     * @tc.name testSensorFusionModelTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_0700
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 102
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [7.813953508459, 5.256674988588, -2.746925305136];
      const geomagnetic: number[] = [34.13301692095, 2.416216775875, 26.72263183832];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        -0.3946278164549, 0.8116590233624, 0.4306721679821, 0.4580499820722, -0.2325422184372, 0.8579710546213,
        0.7965294096288, 0.5358486226899, -0.2800127732044,
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
    });

    /**
     * @tc.name testSensorFusionModelTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_0800
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 103
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [-4.077868097297, 4.53032248921, 7.686564247101];
      const geomagnetic: number[] = [16.84643904737, 37.65193664788, 13.54729338604];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        0.6117292295107, -0.4955612199585, 0.6166088119996, 0.6730479025106, 0.7356315420416, -0.07650330240907,
        -0.415684821335, 0.4618065738236, 0.7835437560755,
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
    });

    /**
     * @tc.name testSensorFusionModelTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_0900
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 104
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [-2.732211009527, 7.510508693612, 5.688882329826];
      const geomagnetic: number[] = [-34.49183425606, 23.67560142669, -11.60944730541];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        0.5952051223767, 0.6114583565775, -0.5213919259713, -0.7537648555499, 0.1999489442297, -0.625986391417,
        -0.2785128450078, 0.7655972164742, 0.5799064556397,
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
    });

    /**
     * @tc.name testSensorFusionModelTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_1000
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 105
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [2.518668811093, -9.405855628726, 1.192596877234];
      const geomagnetic: number[] = [30.36804264575, -17.05692733055, -25.91993857836];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        -0.7085713784086, -0.2722800947202, -0.6509916679338, 0.6572736019149, 0.08099820561862, -0.7492867961684,
        0.2567450368086, -0.9588028163839, 0.1215695083827,
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
    });

    /**
     * @tc.name testSensorFusionModelTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_1100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 106
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [0.4850510153643, 0.4790669870719, 9.786282252949];
      const geomagnetic: number[] = [1.612613026503, 38.97434083671, 19.06305944938];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        0.9986625290948, -0.01753025886654, -0.04863993221762, 0.01511256630544, 0.9986530309557, -0.0496360161853,
        0.04944454794743, 0.04883455525707, 0.9975822887818,
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
    });

    /**
     * @tc.name testSensorFusionModelTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_1200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 107
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [-6.278563833296, 4.61190902073, -5.962049259754];
      const geomagnetic: number[] = [8.127393774643, 41.12470008157, -11.30064217789];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        -0.5179192930916, 0.3203168767341, 0.7931939890864, 0.5675722233716, 0.8224239990474, 0.03847774743755,
        -0.6400167006418, 0.4701232437034, -0.6077522181196,
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
    });

    /**
     * @tc.name testSensorFusionModelTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_1300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 108
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [0.5774001601608, -9.517927324815, 2.304727423055];
      const geomagnetic: number[] = [-24.84221798513, -15.37450632582, 32.11679873239];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        0.7249619343729, 0.2033338316749, 0.6580923541622, -0.6862695471792, 0.1315858328365, 0.7153455648924,
        0.05885832417541, -0.9702270463624, 0.234936536499,
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
    });

    /**
     * @tc.name testSensorFusionModelTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_1400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 109
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [4.463333253461, -3.886062329009, 7.82389134917];
      const geomagnetic: number[] = [29.66545441533, 23.62270015793, 21.14069184253];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        0.7161743805678, -0.3694976642183, -0.5920859167008, 0.5292346947038, 0.8405654741629, 0.115586857242,
        0.4549779055515, -0.3961327552506, 0.7975424413017,
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
    });

    /**
     * @tc.name testSensorFusionModelTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_1500
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 110
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [-7.566401600718, -6.073221444668, -1.449706211848];
      const geomagnetic: number[] = [1.593163191441, -27.99311678681, -33.14886489166];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        -0.4311889098975, 0.679025814028, -0.5941380882127, 0.4681671884841, -0.3945351825221, -0.7906715331787,
        -0.7712947605217, -0.6190847548082, -0.1477784109937,
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
    });

    /**
     * @tc.name testSensorFusionModelTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_1600
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 111
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [0.6106731752514, -3.497998826665, 9.144789909106];
      const geomagnetic: number[] = [-16.77318354282, 23.30842926338, 32.5634371514];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        0.877347372908, 0.464812643297, 0.1192090344005, -0.475800920745, 0.8104342143724, 0.3417745865228,
        0.06225006883296, -0.3565748039414, 0.932190612549,
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
    });

    /**
     * @tc.name testSensorFusionModelTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_1700
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 112
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [-2.61518120231, 8.942752198657, 3.069871396738];
      const geomagnetic: number[] = [30.84427350316, 29.90673532656, 6.262425581922];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        0.09605266164268, -0.2979380080563, 0.9497404011343, 0.9590137032956, 0.2832428708133, -0.008135909578944,
        -0.266583201051, 0.9115955350312, 0.3129328640915,
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
    });

    /**
     * @tc.name testSensorFusionModelTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_1800
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 113
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [3.003061539886, 8.731646067785, -3.313016500803];
      const geomagnetic: number[] = [-29.4327062241, 27.6996865359, -15.85695967514];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        0.1252423441011, -0.3893193495457, -0.9125485188818, -0.9437178507323, 0.2370549854972, -0.2306546163858,
        0.3061224811301, 0.890076051762, -0.3377182977373,
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
    });

    /**
     * @tc.name testSensorFusionModelTest0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_1900
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 114
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [-2.230555302924, -1.389860173248, 9.451402633441];
      const geomagnetic: number[] = [-4.795445039152, 34.62113355533, 25.75618019467];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        0.9738069690572, -0.03253098997998, 0.2250371562799, -0.0005409476706636, 0.9893781421107, 0.145363679402,
        -0.2273756679841, -0.1416778973749, 0.963445732257,
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
    });

    /**
     * @tc.name testSensorFusionModelTest0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_2000
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 115
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [-3.494604552614, 6.531496754541, -6.431437566071];
      const geomagnetic: number[] = [-37.02543560471, -8.832304880384, -20.88318722755];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        0.5182758919576, -0.4430181240673, -0.7315224135756, -0.777490282948, -0.6003711109017, -0.1872522072397,
        -0.3562288025091, 0.6657998730419, -0.6556001596403,
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
    });

    /**
     * @tc.name testSensorFusionModelTest0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_2100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 116
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [-7.142524909398, 3.177773225285, 5.926398168137];
      const geomagnetic: number[] = [6.398612635761, 36.23655658785, 23.04278027915];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        0.3796543064934, -0.5432275291829, 0.7488434142722, 0.5707479292188, 0.7745785245877, 0.2725342373721,
        -0.7280861273596, 0.3239320311198, 0.6041180599528,
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
      const assertionActual41 = JSON.stringify(gravity);
      expect(assertionActual41).assertEqual(gravityBefore);
      const assertionActual42 = JSON.stringify(geomagnetic);
      expect(assertionActual42).assertEqual(geomagneticBefore);
    });

    /**
     * @tc.name testSensorFusionModelTest0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_2200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 117
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [6.673836582181, -3.894112102879, 6.044162159022];
      const geomagnetic: number[] = [0.04872134510642, 11.96093183364, 41.73647967787];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        0.6299166860365, 0.746413340778, -0.214644108611, -0.3746783943085, 0.5341303059405, 0.7578396381256,
        0.680309539468, -0.3969533234331, 0.6161225442428,
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
      const assertionActual43 = JSON.stringify(gravity);
      expect(assertionActual43).assertEqual(gravityBefore);
      const assertionActual44 = JSON.stringify(geomagnetic);
      expect(assertionActual44).assertEqual(geomagneticBefore);
    });

    /**
     * @tc.name testSensorFusionModelTest0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_2300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 118
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [-5.496186509627, -2.375802895109, 7.770688158393];
      const geomagnetic: number[] = [6.698676592228, -38.16750163459, 19.57982509846];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        -0.6708244751132, -0.4283161581607, -0.6054252986517, 0.4859003542892, -0.8705706589357, 0.07750853825218,
        -0.5602636605124, -0.2421817426207, 0.7921190783275,
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
      const assertionActual45 = JSON.stringify(gravity);
      expect(assertionActual45).assertEqual(gravityBefore);
      const assertionActual46 = JSON.stringify(geomagnetic);
      expect(assertionActual46).assertEqual(geomagneticBefore);
    });

    /**
     * @tc.name testSensorFusionModelTest0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_2400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 119
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [1.39891851243, -1.754066781841, 9.54999354557];
      const geomagnetic: number[] = [9.660231770376, 33.20179578986, 26.25491722461];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        0.974112918231, -0.1489528979773, -0.1700501594229, 0.1754106575094, 0.9725441791865, 0.1529343674995,
        0.1426012754771, -0.1788039532967, 0.9734957742681,
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
      const assertionActual47 = JSON.stringify(gravity);
      expect(assertionActual47).assertEqual(gravityBefore);
      const assertionActual48 = JSON.stringify(geomagnetic);
      expect(assertionActual48).assertEqual(geomagneticBefore);
    });

    /**
     * @tc.name testSensorFusionModelTest0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_2500
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 120
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [-3.366268750836, -9.012851859907, -1.916464465757];
      const geomagnetic: number[] = [-42.61324813768, -5.64346236078, -6.104294860074];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        -0.1185729121862, -0.1639521401176, 0.9793161697055, -0.9317675853402, 0.3592132713633, -0.05267819839159,
        -0.343146661655, -0.9187412701231, -0.1953582533902,
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
      const assertionActual49 = JSON.stringify(gravity);
      expect(assertionActual49).assertEqual(gravityBefore);
      const assertionActual50 = JSON.stringify(geomagnetic);
      expect(assertionActual50).assertEqual(geomagneticBefore);
    });

    /**
     * @tc.name testSensorFusionModelTest0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_2600
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 121
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [6.351138709073, 7.386147325444, -1.15929495166];
      const geomagnetic: number[] = [3.838508443118, 18.45184766513, -39.11259606156];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        0.7175821206725, -0.6544330688313, -0.2383133620073, -0.2567684560962, 0.06948745040129, -0.96397170819,
        0.6474147511797, 0.752920216661, -0.118174816683,
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
      const assertionActual51 = JSON.stringify(gravity);
      expect(assertionActual51).assertEqual(gravityBefore);
      const assertionActual52 = JSON.stringify(geomagnetic);
      expect(assertionActual52).assertEqual(geomagneticBefore);
    });

    /**
     * @tc.name testSensorFusionModelTest0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_2700
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 122
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [3.304507602046, 4.368361329144, 8.138411933913];
      const geomagnetic: number[] = [9.930469817081, 42.24269601323, -1.392983397436];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        0.9385522725475, -0.2291468917191, -0.2580917156968, 0.07517369296263, 0.8655648371098, -0.4951226400049,
        0.3368509278334, 0.4452967715743, 0.8296036629881,
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
      const assertionActual53 = JSON.stringify(gravity);
      expect(assertionActual53).assertEqual(gravityBefore);
      const assertionActual54 = JSON.stringify(geomagnetic);
      expect(assertionActual54).assertEqual(geomagneticBefore);
    });

    /**
     * @tc.name testSensorFusionModelTest0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_2800
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 123
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [4.590905047162, -7.437565762569, -4.454470381022];
      const geomagnetic: number[] = [-5.994798743725, -5.887687897946, -42.5957453185];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        -0.7795003102578, -0.5962140555138, 0.1921147217571, -0.4163795849196, 0.2640449131796, -0.8700047845191,
        0.4679821658676, -0.7581616475606, -0.4540744527036,
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
      const assertionActual55 = JSON.stringify(gravity);
      expect(assertionActual55).assertEqual(gravityBefore);
      const assertionActual56 = JSON.stringify(geomagnetic);
      expect(assertionActual56).assertEqual(geomagneticBefore);
    });

    /**
     * @tc.name testSensorFusionModelTest0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_2900
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 124
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [-4.632810817175, 3.819758834238, 7.757744928813];
      const geomagnetic: number[] = [-23.33871007572, 36.23556887476, -5.223807071845];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        0.8076076610652, 0.5506107346001, 0.2111816391922, -0.3531941592417, 0.7383872395044, -0.5744894867747,
        -0.4722539059302, 0.3893739892189, 0.7907996869331,
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
      const assertionActual57 = JSON.stringify(gravity);
      expect(assertionActual57).assertEqual(gravityBefore);
      const assertionActual58 = JSON.stringify(geomagnetic);
      expect(assertionActual58).assertEqual(geomagneticBefore);
    });

    /**
     * @tc.name testSensorFusionModelTest0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_3000
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 125
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [-2.352841607793, 0.4848689321302, 9.511316338304];
      const geomagnetic: number[] = [31.76953720485, 4.070496834435, 29.31087786659];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        0.06573273511294, -0.9955844500304, 0.0670135090274, 0.9685842420282, 0.07980397653058, 0.2355332066282,
        -0.2398411424865, 0.04942598696536, 0.969553143558,
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
      const assertionActual59 = JSON.stringify(gravity);
      expect(assertionActual59).assertEqual(gravityBefore);
      const assertionActual60 = JSON.stringify(geomagnetic);
      expect(assertionActual60).assertEqual(geomagneticBefore);
    });

    /**
     * @tc.name testSensorFusionModelTest0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_3100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 126
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [9.715757444698, 0.4492019643727, -1.279990183944];
      const geomagnetic: number[] = [25.98088168, -5.414592486732, 34.36096586728];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        -0.0228134238217, 0.9847579898403, 0.1724275185089, 0.1363848461348, -0.1677943922599, 0.9763422635894,
        0.9903932155656, 0.04579021043554, -0.1304781023388,
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
      const assertionActual61 = JSON.stringify(gravity);
      expect(assertionActual61).assertEqual(gravityBefore);
      const assertionActual62 = JSON.stringify(geomagnetic);
      expect(assertionActual62).assertEqual(geomagneticBefore);
    });

    /**
     * @tc.name testSensorFusionModelTest0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_3200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [-0.468842882698, -0.1060153044428, 9.798216526826];
      const geomagnetic: number[] = [0.2749583567016, 37.74860513006, 21.44684612331];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        0.9982904141077, -0.03420060806925, 0.04739796945413, 0.03364730408257, 0.9993565580749, 0.01242291272693,
        -0.04779234278267, -0.01080686079947, 0.9987988304614,
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
      const assertionActual63 = JSON.stringify(gravity);
      expect(assertionActual63).assertEqual(gravityBefore);
      const assertionActual64 = JSON.stringify(geomagnetic);
      expect(assertionActual64).assertEqual(geomagneticBefore);
    });

    /**
     * @tc.name testSensorFusionModelTest0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_3300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [-6.014659833136, -4.91839546919, -5.989102862725];
      const geomagnetic: number[] = [-20.86777948289, -34.898682279, 15.21899322042];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        0.7614808338522, -0.5808153470232, -0.2877507121417, -0.2103252863116, -0.6413159727023, 0.7378869134866,
        -0.6131151715735, -0.5013654912528, -0.610509975813,
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
      const assertionActual65 = JSON.stringify(gravity);
      expect(assertionActual65).assertEqual(gravityBefore);
      const assertionActual66 = JSON.stringify(geomagnetic);
      expect(assertionActual66).assertEqual(geomagneticBefore);
    });

    /**
     * @tc.name testSensorFusionModelTest0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_3400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 129
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [-8.205502288702, -4.992850394986, 1.994311190208];
      const geomagnetic: number[] = [-25.65327769504, 13.76442845432, 32.20946837231];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        0.5050367792753, -0.5717427106447, 0.6465664114411, -0.2128416388369, 0.6434865106273, 0.7352710707065,
        -0.8364426390114, -0.508955188072, 0.2032936993076,
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
      const assertionActual67 = JSON.stringify(gravity);
      expect(assertionActual67).assertEqual(gravityBefore);
      const assertionActual68 = JSON.stringify(geomagnetic);
      expect(assertionActual68).assertEqual(geomagneticBefore);
    });

    /**
     * @tc.name testSensorFusionModelTest0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_3500
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 130
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [4.925861350443, 5.669864740792, 6.310675382028];
      const geomagnetic: number[] = [-8.435902347613, 42.57798732347, 0.9749600317737];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        0.7059605260763, 0.155691719537, -0.6909267863455, -0.49948841244, 0.801070057639, -0.329845552634,
        0.5021265392909, 0.5779678634854, 0.6432900491364,
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
      const assertionActual69 = JSON.stringify(gravity);
      expect(assertionActual69).assertEqual(gravityBefore);
      const assertionActual70 = JSON.stringify(geomagnetic);
      expect(assertionActual70).assertEqual(geomagneticBefore);
    });

    /**
     * @tc.name testSensorFusionModelTest0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_FUSION_MODEL_3600
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 131
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorFusionModelTest0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const gravity: number[] = [6.123047429394, 7.586176501809, -1.092847775671];
      const geomagnetic: number[] = [40.90492927784, -3.837454822311, 14.03783107399];
      const gravityBefore: string = JSON.stringify(gravity);
      const geomagneticBefore: string = JSON.stringify(geomagnetic);
      const expectedRotation: number[] = [
        -0.2744238163609, 0.3504940352141, 0.895458262731, 0.7315128499338, -0.5283414838373, 0.4309805411366,
        0.6241638562074, 0.7733105506431, -0.1114014042478,
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
      const assertionActual71 = JSON.stringify(gravity);
      expect(assertionActual71).assertEqual(gravityBefore);
      const assertionActual72 = JSON.stringify(geomagnetic);
      expect(assertionActual72).assertEqual(geomagneticBefore);
    });
  });
}
