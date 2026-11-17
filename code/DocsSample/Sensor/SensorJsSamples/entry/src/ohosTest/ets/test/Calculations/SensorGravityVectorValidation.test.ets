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

export default function sensorGravityVectorValidationTest(): void {
  describe('SensorGravityVectorValidation', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorGravityVectorValidationTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_0100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 169
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-1.003309179774, 1.669959961242, 9.614608906119];
        const geomagnetic: number[] = [7.620607791566, 39.91446917688, 15.28926051891];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.9609677502212, -0.2376978887639, 0.1415651677215, 0.2570622222504, 0.9563060878778, -0.1392755548527,
          -0.1022741263786, 0.1702303732153, 0.9800824573006,
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
     * @tc.name testSensorGravityVectorValidationTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_0200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 170
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [9.488799400959, -2.056427291127, 1.403528668984];
        const geomagnetic: number[] = [18.86534293849, -30.13641642679, -24.91776957844];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.2509225436734, -0.7052893575663, 0.6630269973238, -0.03808083371836, -0.677217855124, -0.7347964526347,
          0.9672578390376, -0.2096256158132, 0.1430712200799,
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
     * @tc.name testSensorGravityVectorValidationTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_0300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 171
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-7.5074897929, 3.746334696443, 5.083175518484];
        const geomagnetic: number[] = [-20.85663741638, 34.64265122484, -15.80782691566];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.6312465450159, 0.6027551047001, 0.4880718012377, -0.1259357460266, 0.700604592227, -0.7023484841751,
          -0.7652894793986, 0.3818893676293, 0.5181626420473,
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
     * @tc.name testSensorGravityVectorValidationTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_0400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 172
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [7.52789536999, -5.168816489022, 3.584721384055];
        const geomagnetic: number[] = [32.43603832304, 21.065123873, 19.72723939433];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.4760960359183, 0.08645966497291, -0.8751327275995, 0.4295073050573, 0.8455228592296, 0.3171979971919,
          0.7673695586126, -0.526892608463, 0.3654150238588,
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
     * @tc.name testSensorGravityVectorValidationTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_0500
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 173
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-4.583418422374, -4.992347844726, -7.092590398628];
        const geomagnetic: number[] = [-4.665826511419, -42.95956360038, 4.207844843897];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.8737099990843, -0.1405094422785, -0.4657122868582, 0.1354150673127, -0.8492784328035, 0.5102831597452,
          -0.4672190033001, -0.508903959707, -0.7229959631629,
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
     * @tc.name testSensorGravityVectorValidationTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_0600
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 174
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [1.738402043086, -0.3481232855615, 9.648464567725];
        const geomagnetic: number[] = [9.309333914686, 36.84005073729, 21.00349884517];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.9731255197118, -0.1430019129797, -0.1804914839258, 0.1470522098779, 0.9890860205204, 0.009191930223929,
          0.177207139968, -0.03548657345174, 0.983533595079,
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
     * @tc.name testSensorGravityVectorValidationTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_0700
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 175
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [0.002254526162543, -9.786231049196, -0.6824784017577];
        const geomagnetic: number[] = [-37.97755413037, -21.0383202618, -0.3073480712701];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.03044803892366, -0.06953042912665, 0.9971150567267, -0.999536324557, -0.002347415996303, 0.03035828600717,
          0.0002298191806874, -0.9975770692351, -0.06956966378774,
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
     * @tc.name testSensorGravityVectorValidationTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_0800
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 176
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [1.493029879533, -5.530424234465, 7.963753484737];
        const geomagnetic: number[] = [40.65582832854, -10.79703249186, 10.74838184521];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.0711996182569, -0.825487792464, -0.5599111705021, 0.9857826289842, 0.02741568801616, -0.1657739076076,
          0.1521946870064, -0.5637537445938, 0.8117995397285,
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
     * @tc.name testSensorGravityVectorValidationTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_0900
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 177
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [1.204354639892, 4.520387885441, 8.622744532139];
        const geomagnetic: number[] = [-14.72284361605, 40.5754572398, 4.676552751628];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.8818390730441, 0.3556616430413, -0.3096201623309, -0.4552887582788, 0.8131259454052, -0.3626821521579,
          0.1227680570736, 0.4607938721143, 0.8789749777919,
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
     * @tc.name testSensorGravityVectorValidationTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_1000
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 178
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [4.894014490127, 7.113298852781, -4.656790912361];
        const geomagnetic: number[] = [31.04404202695, 21.57746884529, 21.34666936221];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.6768791231166, 0.6680522613034, 0.3090967952864, 0.5412515370773, 0.1671111472287, 0.8240877611537,
          0.4988801722861, 0.7251069166953, -0.4746983600776,
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
     * @tc.name testSensorGravityVectorValidationTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_1100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 179
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-4.078548238645, 5.383645457675, 7.114626191944];
        const geomagnetic: number[] = [3.578307820304, 43.23511705919, -1.708907844478];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.8498359627545, -0.04959616787937, 0.5247085443756, 0.3239248691687, 0.8344866777711, -0.4457630129974,
          -0.4157541527671, 0.5487915858996, 0.7252422214011,
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
     * @tc.name testSensorGravityVectorValidationTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_1200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 180
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [0.3641655901908, 9.795611422772, 0.3866267928941];
        const geomagnetic: number[] = [12.59836711092, 21.95473646333, -35.27422136581];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.949677705585, -0.04752541422287, 0.309602310259, 0.3110212564089, 0.02593520260483, -0.9500490215392,
          0.03712187463719, 0.9985332744925, 0.03941149774659,
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
     * @tc.name testSensorGravityVectorValidationTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_1300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 181
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [9.23844175391, 2.157775154061, -2.496257267216];
        const geomagnetic: number[] = [26.83526123625, 15.66097998264, 30.32494782131];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.2804019905854, 0.9312274800585, -0.2327876802147, 0.1857573794075, 0.2905760378626, 0.9386478371656,
          0.9417371818461, 0.2199566925648, -0.254460475761,
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
     * @tc.name testSensorGravityVectorValidationTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_1400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 182
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-0.6616475422841, -0.6171225484465, 9.768187257111];
        const geomagnetic: number[] = [0.7459071042552, 36.53239040147, 23.44841304111];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.9960989720596, -0.06116407835691, 0.0636065513971, 0.05690205236523, 0.9961433643322, 0.06678738004722,
          -0.06744623264874, -0.06290749729322, 0.9957377428248,
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
     * @tc.name testSensorGravityVectorValidationTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_1500
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 183
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-5.195133707625, 3.19418814771, 7.683999468827];
        const geomagnetic: number[] = [7.28153205509, -17.56091044612, 39.03323859525];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.6964363287402, -0.6940666934587, -0.1823399710491, 0.484279299642, -0.6420690020342, 0.5943239491767,
          -0.5295753014908, 0.3256053157706, 0.7832823107877,
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
     * @tc.name testSensorGravityVectorValidationTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_1600
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 184
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-0.4562676878963, -8.237056304094, 5.308372937178];
        const geomagnetic: number[] = [-32.19137626918, -4.698158835775, 28.75139296538];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.5683976164457, 0.4232134207997, 0.7055597423847, -0.8214383275788, 0.3403864054054, 0.4575764078268,
          -0.04651046767546, -0.8396591543419, 0.5411185460935,
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
     * @tc.name testSensorGravityVectorValidationTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_1700
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 185
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [6.419161836595, -2.796727019845, 6.870864522902];
        const geomagnetic: number[] = [34.00943697165, 25.57465258844, 8.619474569376];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.5360434856497, -0.4784173821694, -0.6955387767269, 0.5333713668205, 0.8305665789725, -0.1602315292005,
          0.6543488110698, -0.2850894005959, 0.700393937095,
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
     * @tc.name testSensorGravityVectorValidationTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_1800
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 186
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-6.64480146183, -0.6614079182327, -7.186463184249];
        const geomagnetic: number[] = [11.918196036, -17.02567530469, -38.11932559302];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.2605879204335, 0.909236084178, -0.324628524552, 0.6879616229723, -0.4107846677829, -0.5983015644571,
          -0.6773497922355, -0.06742180613993, -0.7325650544596,
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
     * @tc.name testSensorGravityVectorValidationTest0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_1900
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 187
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [1.948566864522, -3.748996434222, 8.85348591859];
        const geomagnetic: number[] = [6.265631023037, 27.07684964068, 33.35545055039];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.9785234513354, 0.02554495858189, -0.2045465968373, 0.05511544659323, 0.9237427439609, 0.3790272160762,
          0.1986306691664, -0.3821606966588, 0.9024960161662,
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
     * @tc.name testSensorGravityVectorValidationTest0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_2000
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 188
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-9.171257661553, 2.976336685741, -1.807084070683];
        const geomagnetic: number[] = [-9.047731388166, 17.97991077186, -38.46896626326];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.2199833285148, 0.9025666352984, 0.3701091785158, 0.2785507966487, 0.3054881009479, -0.9105418572837,
          -0.9348886505151, 0.3033982350398, -0.1842083660227,
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

    /**
     * @tc.name testSensorGravityVectorValidationTest0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_2100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 189
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [9.753382873243, -0.2612948172521, 1.019483960841];
        const geomagnetic: number[] = [24.95548475569, 8.968063994032, -34.37728332501];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.0004297211161703, -0.9676928023343, -0.2521318219706, 0.1072811446837, 0.2507213341482, -0.9620964445409,
          0.9942286313193, -0.02663555731417, 0.1039229317881,
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
      },
    );

    /**
     * @tc.name testSensorGravityVectorValidationTest0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_2200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 190
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-0.2492960260871, -2.437254632203, 9.499144242993];
        const geomagnetic: number[] = [-14.63036596607, 29.05132538051, 28.75713625059];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.9282987117742, 0.3535782951085, 0.1150821052405, -0.3709659144249, 0.901807632542, 0.2216467555003,
          -0.02541243894874, -0.2484459360044, 0.9683123591226,
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
      },
    );

    /**
     * @tc.name testSensorGravityVectorValidationTest0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_2300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 191
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-6.081661139342, 7.664850649254, -0.7067972204592];
        const geomagnetic: number[] = [-41.07090536248, -4.479734104695, 13.34588757098];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.2659154766879, -0.2956005353356, -0.917556146929, -0.7382120759692, -0.5496755598514, 0.3910239248376,
          -0.6199450702693, 0.7813303414123, -0.07204864632612,
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
      },
    );

    /**
     * @tc.name testSensorGravityVectorValidationTest0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_2400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 192
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-6.867677678862, -0.08331158712489, 7.004581534875];
        const geomagnetic: number[] = [1.598345561166, 30.00960544484, 31.334786939];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.5708870620739, -0.6073098305621, 0.5525058660859, 0.4289420065753, 0.794419691892, 0.4300071024174,
          -0.7000690804141, -0.008492516526492, 0.7140246212921,
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
      },
    );

    /**
     * @tc.name testSensorGravityVectorValidationTest0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_2500
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 193
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [6.82139737105, -6.144490252413, 3.456859477073];
        const geomagnetic: number[] = [9.789744287621, 1.129062978017, 42.28340245977];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.7074225181304, 0.6829500511275, -0.1820236482078, -0.1266483001515, 0.3758527901578, 0.9179841437625,
          0.6953514139705, -0.6263496689514, 0.3523811903235,
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
      },
    );

    /**
     * @tc.name testSensorGravityVectorValidationTest0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_2600
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 194
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [6.458906473985, -4.611306389337, -5.766669796683];
        const geomagnetic: number[] = [14.76681118717, 20.3045162488, -35.42129172214];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.75226103714, -0.3852875324714, -0.5344687543001, 0.02474752345196, 0.7941003771038, -0.6072825958041,
          0.6584002521901, -0.470061813388, -0.5878358610278,
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
      },
    );

    /**
     * @tc.name testSensorGravityVectorValidationTest0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_2700
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 195
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [0.6815489056947, -0.6999918722611, 9.761229557177];
        const geomagnetic: number[] = [0.6790185004444, 36.39230491246, 23.66725748866];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.9973725260102, 0.02549047155369, -0.06781062025919, -0.02052512347827, 0.9971252226748, 0.07293839600578,
          0.06947491393422, -0.07135493091347, 0.9950284971639,
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
      },
    );

    /**
     * @tc.name testSensorGravityVectorValidationTest0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_2800
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 196
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-8.177746738194, 5.41563976214, -0.1772124506898];
        const geomagnetic: number[] = [-11.03824886766, 22.53125679577, 35.43302878867];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.525471696, -0.7825485560762, 0.3339120454342, 0.1702008157905, 0.2878458988185, 0.942431122596,
          -0.8336133270331, 0.5520529828889, -0.01806446999896,
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
      },
    );

    /**
     * @tc.name testSensorGravityVectorValidationTest0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_2900
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 197
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-4.202922434279, 7.263300732763, 5.080945332995];
        const geomagnetic: number[] = [-37.76981642515, 16.2557727897, -13.9352365685];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.4930803875457, 0.6719112905579, -0.5526363623927, -0.7571772305673, 0.01861638413793, -0.6529441566873,
          -0.4284324601712, 0.7403976282123, 0.517935304077,
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
      },
    );

    /**
     * @tc.name testSensorGravityVectorValidationTest0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_3000
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 198
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [4.688838068753, 1.748887912896, 8.437552289209];
        const geomagnetic: number[] = [27.31659270316, 33.67062824822, 2.256669328879];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.7515183881704, -0.5899029514408, -0.2953550746527, 0.4547190701599, 0.7875481971785, -0.415930768703,
          0.4779651446232, 0.1782760359731, 0.8600970733139,
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
      },
    );

    /**
     * @tc.name testSensorGravityVectorValidationTest0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_3100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 199
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [4.652887439198, -8.115436819862, -2.954052081629];
        const geomagnetic: number[] = [-16.55764693112, -22.87337916333, -32.9795823769];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.5367094902995, -0.5428468157499, 0.6459568543274, -0.6978409587893, -0.1447601168924, -0.7014716706991,
          0.4743004525177, -0.8272616534008, -0.3011266138256,
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
      },
    );

    /**
     * @tc.name testSensorGravityVectorValidationTest0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_3200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 200
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-3.324493751355, 3.835351624999, 8.394874579755];
        const geomagnetic: number[] = [-17.63011298742, 39.67187975928, -0.5666325230549];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.8992265944802, 0.4020772402986, 0.1724106279012, -0.2766699920279, 0.8279380769181, -0.4878240013575,
          -0.338888251922, 0.3909634683994, 0.8557466442156,
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
      },
    );

    /**
     * @tc.name testSensorGravityVectorValidationTest0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_3300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 201
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-8.754637839648, -4.424784183158, 0.1170522493182];
        const geomagnetic: number[] = [-24.31142252946, 2.492355536254, 35.88513478413];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.4267281308679, -0.8351189767982, 0.3471014216588, -0.1465949363736, 0.3148518580851, 0.9377516899958,
          -0.8924197593933, -0.4510483367133, 0.01193193163284,
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
      },
    );

    /**
     * @tc.name testSensorGravityVectorValidationTest0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_3400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 202
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [4.503800176138, -7.310743380503, -4.743934569305];
        const geomagnetic: number[] = [42.47301759628, -6.230195206273, 6.498264688183];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.2067245666786, 0.6190141694429, -0.7576849025554, 0.8639961878873, 0.247887215025, 0.4382493764324,
          0.4591029741222, -0.7452337798678, -0.4835815055357,
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
      },
    );

    /**
     * @tc.name testSensorGravityVectorValidationTest0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_3500
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 203
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-1.865121824998, 0.2580384062795, 9.627608049708];
        const geomagnetic: number[] = [-9.25050036265, 38.13230075094, 18.58375318606];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.9719607371876, 0.1459285050098, 0.1843832877223, -0.1383653903982, 0.9889453936232, -0.0533106665824,
          -0.1901245489295, 0.0263036092028, 0.9814075483902,
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
      },
    );

    /**
     * @tc.name testSensorGravityVectorValidationTest0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_3600
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 204
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [9.106280179107, -3.611385217951, -0.5192861515297];
        const geomagnetic: number[] = [7.554805249182, -40.11953767245, 14.77659008688];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.1990382513294, 0.3714868693771, 0.9068524027581, -0.3141779179859, -0.8523353586291, 0.4181108373155,
          0.9282650539355, -0.3681330497402, -0.05293436814778,
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
      },
    );

    /**
     * @tc.name testSensorGravityVectorValidationTest0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_3700
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 205
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [-6.330564200714, 1.974796507237, 7.229124127835];
        const geomagnetic: number[] = [12.0588082684, 27.18614804904, 31.63065755563];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.3596435611935, -0.7710030853928, 0.5255575622202, 0.6739598619238, 0.6041777609022, 0.4251439023988,
          -0.6453174516528, 0.2013044349885, 0.736913774499,
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
        const assertionActual73 = JSON.stringify(gravity);
        expect(assertionActual73).assertEqual(gravityBefore);
        const assertionActual74 = JSON.stringify(geomagnetic);
        expect(assertionActual74).assertEqual(geomagneticBefore);
      },
    );

    /**
     * @tc.name testSensorGravityVectorValidationTest0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_3800
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 206
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [3.31864725999, 7.047710719257, 5.962587859431];
        const geomagnetic: number[] = [-20.04401462198, 38.51237642769, 0.1853098112848];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.612499109883, 0.3222522027382, -0.7218021600293, -0.714425065458, 0.6164614186684, -0.3310168351289,
          0.3382922793058, 0.7184210722993, 0.6078071212468,
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
        const assertionActual75 = JSON.stringify(gravity);
        expect(assertionActual75).assertEqual(gravityBefore);
        const assertionActual76 = JSON.stringify(geomagnetic);
        expect(assertionActual76).assertEqual(geomagneticBefore);
      },
    );

    /**
     * @tc.name testSensorGravityVectorValidationTest0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_3900
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 207
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [5.315967575116, 7.920074109976, 2.291072856284];
        const geomagnetic: number[] = [38.99263075139, -5.454031162916, 18.29831388844];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          -0.4222854896688, 0.02129482644096, 0.9062127209337, 0.7266548328603, -0.5896925854866, 0.3524704363529,
          0.541892719176, 0.807347004075, 0.2335446336681,
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
        const assertionActual77 = JSON.stringify(gravity);
        expect(assertionActual77).assertEqual(gravityBefore);
        const assertionActual78 = JSON.stringify(geomagnetic);
        expect(assertionActual78).assertEqual(geomagneticBefore);
      },
    );

    /**
     * @tc.name testSensorGravityVectorValidationTest0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GRAVITY_VECTOR_VALIDATION_4000
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 208
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGravityVectorValidationTest0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const gravity: number[] = [1.660518819877, 2.319071101546, 9.386196592593];
        const geomagnetic: number[] = [6.86582896345, 41.57418691225, 10.46170995727];
        const gravityBefore: string = JSON.stringify(gravity);
        const geomagneticBefore: string = JSON.stringify(geomagnetic);
        const expectedRotation: number[] = [
          0.9817105056626, -0.1262732822306, -0.1424764586393, 0.08713688211285, 0.9634161716741, -0.2534490953474,
          0.1692679734839, 0.2363986851729, 0.9567988371655,
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
        const assertionActual79 = JSON.stringify(gravity);
        expect(assertionActual79).assertEqual(gravityBefore);
        const assertionActual80 = JSON.stringify(geomagnetic);
        expect(assertionActual80).assertEqual(geomagneticBefore);
      },
    );
  });
}
