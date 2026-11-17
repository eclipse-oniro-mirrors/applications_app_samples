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
import { assertArrayNear, assertUnitQuaternion, assertRotationMatrix, rotationCallback } from '../Shared/SharedDriver';

export default function sensorAxisRotationValidationTest(): void {
  describe('SensorAxisRotationValidation', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorAxisRotationValidationTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_0100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 245
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.1796515419172, 0.1538179946845, 0.07727549802815, 0.9685524484521];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.9407370438315, -0.09442346580166, 0.3257269154817, 0.2049580254804, 0.9235076417826, -0.3242311572943,
          -0.270196265989, 0.371776605874, 0.888130695996,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual1 = promiseResult.length;
        expect(assertionActual1).assertEqual(9);
        const assertionActual2 = callbackResult.length;
        expect(assertionActual2).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual3 = JSON.stringify(input);
        expect(assertionActual3).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.9685524484521, 0.1796515419172, 0.1538179946845, 0.07727549802815];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual4 = JSON.stringify(input);
        expect(assertionActual4).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_0200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 246
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.7846411125997, -0.5413962721385, -0.2661122744719];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.2721486677799, -0.7735630953938, -0.5723069456772, -0.9256439979185, -0.3729548364125, 0.06393652410078,
          -0.2629035787949, 0.5123522493767, -0.8175431981342,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual5 = promiseResult.length;
        expect(assertionActual5).assertEqual(9);
        const assertionActual6 = callbackResult.length;
        expect(assertionActual6).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual7 = JSON.stringify(input);
        expect(assertionActual7).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.1428728746414, 0.7846411125997, -0.5413962721385, -0.2661122744719];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual8 = JSON.stringify(input);
        expect(assertionActual8).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_0300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 247
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.1939914310131, 0.3433190099784, 0.2322483843178, 0.8891344499358];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.6563854907384, -0.2797981867983, 0.7006219110279, 0.5462019709571, 0.8168560253506, -0.1854983578661,
          -0.5204051253308, 0.5044394993583, 0.6889987641618,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual9 = promiseResult.length;
        expect(assertionActual9).assertEqual(9);
        const assertionActual10 = callbackResult.length;
        expect(assertionActual10).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual11 = JSON.stringify(input);
        expect(assertionActual11).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.8891344499358, 0.1939914310131, 0.3433190099784, 0.2322483843178];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual12 = JSON.stringify(input);
        expect(assertionActual12).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_0400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 248
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.3547360916141, -0.2930121877781, -0.4516076101644];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.4203888485102, 0.8983308779214, -0.1275729196236, -0.4825628847705, 0.3404257434959, 0.8069965151147,
          0.7683789939153, -0.2776903796286, 0.5766123262396,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual13 = promiseResult.length;
        expect(assertionActual13).assertEqual(9);
        const assertionActual14 = callbackResult.length;
        expect(assertionActual14).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual15 = JSON.stringify(input);
        expect(assertionActual15).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.764432292333, -0.3547360916141, -0.2930121877781, -0.4516076101644];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual16 = JSON.stringify(input);
        expect(assertionActual16).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_0500
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 249
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.56879250551, -0.1916301354405, 0.7140684983717, 0.3603597598233];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.0932318583515, -0.2966475354043, -0.9504251997537, 0.732638674878, -0.6668374693824, 0.1362657752362,
          -0.6742020414248, -0.6836139474632, 0.2795059537334,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual17 = promiseResult.length;
        expect(assertionActual17).assertEqual(9);
        const assertionActual18 = callbackResult.length;
        expect(assertionActual18).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual19 = JSON.stringify(input);
        expect(assertionActual19).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.3603597598233, -0.56879250551, -0.1916301354405, 0.7140684983717];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual20 = JSON.stringify(input);
        expect(assertionActual20).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_0600
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 250
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.008978948119508, -0.01768016318353, 0.01705936885649];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.998792779528, -0.03378956461794, -0.03565457734392, 0.03442456168982, 0.9992567128498, 0.01734852665601,
          0.03504187659227, -0.01855497635677, 0.9992135806409,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual21 = promiseResult.length;
        expect(assertionActual21).assertEqual(9);
        const assertionActual22 = callbackResult.length;
        expect(assertionActual22).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual23 = JSON.stringify(input);
        expect(assertionActual23).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.9996578255857, -0.008978948119508, -0.01768016318353, 0.01705936885649];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual24 = JSON.stringify(input);
        expect(assertionActual24).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_0700
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 251
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.6056916959127, 0.5533756716147, -0.3998969543062, 0.4086506594929];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.06771558400308, -0.3435137898214, 0.9367031951935, -0.9971864062472, -0.05356000912188, 0.05244613063638,
          0.03215386258268, -0.9376191133, -0.3461741288652,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual25 = promiseResult.length;
        expect(assertionActual25).assertEqual(9);
        const assertionActual26 = callbackResult.length;
        expect(assertionActual26).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual27 = JSON.stringify(input);
        expect(assertionActual27).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.4086506594929, -0.6056916959127, 0.5533756716147, -0.3998969543062];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual28 = JSON.stringify(input);
        expect(assertionActual28).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_0800
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 252
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.3578829604391, -0.2774512672794, 0.5123698037681];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.3209959569434, -0.9463115294002, -0.03815868119118, 0.549131205754, 0.2187939416279, -0.8065879555101,
          0.7716323700397, 0.2379573500255, 0.5898811618248,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual29 = promiseResult.length;
        expect(assertionActual29).assertEqual(9);
        const assertionActual30 = callbackResult.length;
        expect(assertionActual30).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual31 = JSON.stringify(input);
        expect(assertionActual31).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.729669627365, 0.3578829604391, -0.2774512672794, 0.5123698037681];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual32 = JSON.stringify(input);
        expect(assertionActual32).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_0900
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 253
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.3317509868655, -0.2337805748455, 0.06176291349963, 0.9118515603182];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.8830639706819, -0.2677510909188, -0.3853665488795, -0.04247665474107, 0.7722532504596, -0.633893248865,
          0.4673261789003, 0.5761373711767, 0.6705758510774,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual33 = promiseResult.length;
        expect(assertionActual33).assertEqual(9);
        const assertionActual34 = callbackResult.length;
        expect(assertionActual34).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual35 = JSON.stringify(input);
        expect(assertionActual35).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.9118515603182, 0.3317509868655, -0.2337805748455, 0.06176291349963];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual36 = JSON.stringify(input);
        expect(assertionActual36).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_1000
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 254
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.1292779576737, 0.8526339578319, -0.4980329312104];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.9500429332361, 0.3110120087634, 0.02626700236183, 0.1298950980836, 0.4705008181795, -0.8727864822431,
          -0.2838057231663, -0.8257726748309, -0.4873949127767,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual37 = promiseResult.length;
        expect(assertionActual37).assertEqual(9);
        const assertionActual38 = callbackResult.length;
        expect(assertionActual38).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual39 = JSON.stringify(input);
        expect(assertionActual39).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.090916131911, 0.1292779576737, 0.8526339578319, -0.4980329312104];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual40 = JSON.stringify(input);
        expect(assertionActual40).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_1100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 255
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.2056751821444, 0.1099032525162, -0.1873313219586, 0.9542148449639];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.9056565017992, 0.4027173996383, 0.1326838225912, -0.3122999137202, 0.8452093905262, -0.4336932672485,
          -0.286801437652, 0.3513399809228, 0.8912379890725,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual41 = promiseResult.length;
        expect(assertionActual41).assertEqual(9);
        const assertionActual42 = callbackResult.length;
        expect(assertionActual42).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual43 = JSON.stringify(input);
        expect(assertionActual43).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.9542148449639, 0.2056751821444, 0.1099032525162, -0.1873313219586];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual44 = JSON.stringify(input);
        expect(assertionActual44).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_1200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 256
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.3009715809676, 0.2454038277598, 0.6599764366582];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.008416128753564, -0.7011903191693, 0.7129244736155, 0.9966286312347, -0.05230557898837, -0.06320995024425,
          0.08161213255388, 0.711052925393, 0.6983861375415,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual45 = promiseResult.length;
        expect(assertionActual45).assertEqual(9);
        const assertionActual46 = callbackResult.length;
        expect(assertionActual46).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual47 = JSON.stringify(input);
        expect(assertionActual47).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.6431362000593, 0.3009715809676, 0.2454038277598, 0.6599764366582];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual48 = JSON.stringify(input);
        expect(assertionActual48).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_1300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 257
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.4409005776225, -0.525262186394, -0.514946864783, 0.5143306744177];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.08214127601049, 0.9928827392749, -0.08623616889286, -0.06652913373746, 0.08087281420469, 0.9945016150247,
          0.9943976494037, 0.0874268492659, 0.0594126323935,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual49 = promiseResult.length;
        expect(assertionActual49).assertEqual(9);
        const assertionActual50 = callbackResult.length;
        expect(assertionActual50).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual51 = JSON.stringify(input);
        expect(assertionActual51).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.5143306744177, -0.4409005776225, -0.525262186394, -0.514946864783];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual52 = JSON.stringify(input);
        expect(assertionActual52).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_1400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 258
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.07982061330773, 0.09032898986295, 0.08040875096899];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.9707502127159, -0.1735404963867, 0.1659147992975, 0.1447000349053, 0.9743262049176, 0.1724828870043,
          -0.1915879025681, -0.1434299219996, 0.970938686563,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual53 = promiseResult.length;
        expect(assertionActual53).assertEqual(9);
        const assertionActual54 = callbackResult.length;
        expect(assertionActual54).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual55 = JSON.stringify(input);
        expect(assertionActual55).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.9894461966419, -0.07982061330773, 0.09032898986295, 0.08040875096899];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual56 = JSON.stringify(input);
        expect(assertionActual56).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_1500
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 259
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.8228423066784, 0.03297409251928, 0.5108043245389, 0.2468242078789];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.4759833025098, -0.3064227022692, -0.8243452087966, 0.1978927888724, -0.875981039255, 0.4398814192234,
          -0.856900425863, -0.372508182997, -0.3563135048747,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual57 = promiseResult.length;
        expect(assertionActual57).assertEqual(9);
        const assertionActual58 = callbackResult.length;
        expect(assertionActual58).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual59 = JSON.stringify(input);
        expect(assertionActual59).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.2468242078789, -0.8228423066784, 0.03297409251928, 0.5108043245389];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual60 = JSON.stringify(input);
        expect(assertionActual60).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_1600
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 260
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.4144837410971, 0.3591174472948, 0.02894668385919];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.7403934970841, -0.3460783635514, 0.5762353996043, -0.2493150086405, 0.6547306357194, 0.7135613646471,
          -0.6242271188776, -0.6719803277865, 0.3984757748293,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual61 = promiseResult.length;
        expect(assertionActual61).assertEqual(9);
        const assertionActual62 = callbackResult.length;
        expect(assertionActual62).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual63 = JSON.stringify(input);
        expect(assertionActual63).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.8357032828153, -0.4144837410971, 0.3591174472948, 0.02894668385919];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual64 = JSON.stringify(input);
        expect(assertionActual64).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_1700
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 261
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.1467982438617, -0.4860470343576, -0.2366543652498, 0.8283738693365];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.4155059836008, 0.2493748823189, -0.8747382155024, -0.5347782866304, 0.8448899740147, -0.01315735376415,
          0.735776434619, 0.4732579633538, 0.4844171119826,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual65 = promiseResult.length;
        expect(assertionActual65).assertEqual(9);
        const assertionActual66 = callbackResult.length;
        expect(assertionActual66).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual67 = JSON.stringify(input);
        expect(assertionActual67).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.8283738693365, 0.1467982438617, -0.4860470343576, -0.2366543652498];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual68 = JSON.stringify(input);
        expect(assertionActual68).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_1800
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 262
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.7151026986459, 0.2982385515969, 0.5764425925615];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.1575354076447, 0.1272452336293, 0.9792809841189, 0.7258395387195, -0.6873158642593, -0.02745663433481,
          0.6695816301017, 0.7151262498721, -0.2006362065385,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual69 = promiseResult.length;
        expect(assertionActual69).assertEqual(9);
        const assertionActual70 = callbackResult.length;
        expect(assertionActual70).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual71 = JSON.stringify(input);
        expect(assertionActual71).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.2596070765825, 0.7151026986459, 0.2982385515969, 0.5764425925615];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual72 = JSON.stringify(input);
        expect(assertionActual72).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_1900
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 263
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.002684060424437, -0.05694770396281, 0.1188476621389, 0.9912744261995];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.965264384435, -0.2353155940268, -0.1135395937512, 0.2359269983407, 0.9717360580475, -0.008214922046076,
          0.1122636165253, -0.01885748387455, 0.993499509666,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual73 = promiseResult.length;
        expect(assertionActual73).assertEqual(9);
        const assertionActual74 = callbackResult.length;
        expect(assertionActual74).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual75 = JSON.stringify(input);
        expect(assertionActual75).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.9912744261995, -0.002684060424437, -0.05694770396281, 0.1188476621389];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual76 = JSON.stringify(input);
        expect(assertionActual76).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_2000
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 264
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.4997873802255, 0.5008252847819, -0.4964107843079];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.005500734691899, 0.9999561062751, 0.007584684638468, 0.001268521852367, 0.007577815580348, -0.9999704833461,
          -0.9999840662581, 0.005510193666824, -0.001226782619167,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual77 = promiseResult.length;
        expect(assertionActual77).assertEqual(9);
        const assertionActual78 = callbackResult.length;
        expect(assertionActual78).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual79 = JSON.stringify(input);
        expect(assertionActual79).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.5029542145298, 0.4997873802255, 0.5008252847819, -0.4964107843079];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual80 = JSON.stringify(input);
        expect(assertionActual80).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_2100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 265
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.2236597603786, -0.4907685400944, 0.5314647504478, 0.65319810982];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.04661708182999, -0.9138338890147, -0.4034036080278, 0.4747731926992, 0.3350430612376, -0.8138406248221,
          0.8788727229673, -0.2294640939336, 0.4182451032819,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual81 = promiseResult.length;
        expect(assertionActual81).assertEqual(9);
        const assertionActual82 = callbackResult.length;
        expect(assertionActual82).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual83 = JSON.stringify(input);
        expect(assertionActual83).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.65319810982, 0.2236597603786, -0.4907685400944, 0.5314647504478];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual84 = JSON.stringify(input);
        expect(assertionActual84).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_2200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 266
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.273288045464, -0.02634297399469, -0.147577872694];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.9550536384245, 0.2948492822147, 0.03060144620275, -0.2660524027158, 0.8070688313952, 0.527120498937,
          0.1307236273263, -0.5115699386867, 0.8492393838552,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual85 = promiseResult.length;
        expect(assertionActual85).assertEqual(9);
        const assertionActual86 = callbackResult.length;
        expect(assertionActual86).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual87 = JSON.stringify(input);
        expect(assertionActual87).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.9501791743764, -0.273288045464, -0.02634297399469, -0.147577872694];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual88 = JSON.stringify(input);
        expect(assertionActual88).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_2300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 267
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.5880849862654, -0.8028780618242, -0.05914264892875, 0.07774968712708];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.2962220701618, -0.9351244230212, -0.194408843982, -0.9535177128215, 0.3013163920139, 0.003521823313604,
          0.05528522845013, 0.1864155180587, -0.9809142664587,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual89 = promiseResult.length;
        expect(assertionActual89).assertEqual(9);
        const assertionActual90 = callbackResult.length;
        expect(assertionActual90).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual91 = JSON.stringify(input);
        expect(assertionActual91).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.07774968712708, 0.5880849862654, -0.8028780618242, -0.05914264892875];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual92 = JSON.stringify(input);
        expect(assertionActual92).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_2400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 268
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.2225895411727, 0.3086403900938, -0.118093348797];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.7815901411453, 0.07922930843267, 0.6187403073582, -0.3540297997061, 0.8730157142609, 0.3354198318133,
          -0.5135949300611, -0.481213340774, 0.7103900115265,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual93 = promiseResult.length;
        expect(assertionActual93).assertEqual(9);
        const assertionActual94 = callbackResult.length;
        expect(assertionActual94).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual95 = JSON.stringify(input);
        expect(assertionActual95).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.9171962531177, -0.2225895411727, 0.3086403900938, -0.118093348797];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual96 = JSON.stringify(input);
        expect(assertionActual96).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_2500
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 269
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.5051548191652, -0.1897778574864, 0.4354087799186, 0.7205707236988];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.5488071183553, -0.4357512407413, -0.7133944231875, 0.8192200378618, 0.1104756060879, 0.5627376564841,
          -0.1664009507435, -0.8932614380191, 0.4176059469641,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual97 = promiseResult.length;
        expect(assertionActual97).assertEqual(9);
        const assertionActual98 = callbackResult.length;
        expect(assertionActual98).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual99 = JSON.stringify(input);
        expect(assertionActual99).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.7205707236988, -0.5051548191652, -0.1897778574864, 0.4354087799186];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual100 = JSON.stringify(input);
        expect(assertionActual100).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_2600
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 270
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.3206426781912, -0.4336587238175, -0.7294938536901];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.4404423426293, 0.3356600506477, -0.8326721282824, -0.891858029151, -0.2699460192985, 0.3629302997874,
          -0.1029553236024, 0.9024751947085, 0.4182567683587,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual101 = promiseResult.length;
        expect(assertionActual101).assertEqual(9);
        const assertionActual102 = callbackResult.length;
        expect(assertionActual102).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual103 = JSON.stringify(input);
        expect(assertionActual103).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.4206745792269, 0.3206426781912, -0.4336587238175, -0.7294938536901];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual104 = JSON.stringify(input);
        expect(assertionActual104).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_2700
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 271
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.02222659714683, 0.02299827597609, 0.02294780532367, 0.9992249275875];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.9978889550659, -0.04483769139529, 0.04698100454237, 0.04688238505605, 0.9979587532202, -0.04336321992935,
          -0.04494079804504, 0.04547425976887, 0.9979541153628,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual105 = promiseResult.length;
        expect(assertionActual105).assertEqual(9);
        const assertionActual106 = callbackResult.length;
        expect(assertionActual106).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual107 = JSON.stringify(input);
        expect(assertionActual107).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.9992249275875, 0.02222659714683, 0.02299827597609, 0.02294780532367];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual108 = JSON.stringify(input);
        expect(assertionActual108).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_2800
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 272
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.09138927663155, 0.5651927825476, 0.7423605281865];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.7410840705064, -0.413381999978, 0.5290649511504, 0.6199922381956, -0.1189023073851, 0.7755461726265,
          -0.2576897844673, 0.9027610776904, 0.3444102373458,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual109 = promiseResult.length;
        expect(assertionActual109).assertEqual(9);
        const assertionActual110 = callbackResult.length;
        expect(assertionActual110).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual111 = JSON.stringify(input);
        expect(assertionActual111).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.3480028230684, 0.09138927663155, 0.5651927825476, 0.7423605281865];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual112 = JSON.stringify(input);
        expect(assertionActual112).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_2900
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 273
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.5415622657234, 0.103693718148, -0.3140190569235, 0.7728841808771];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.7812792894111, 0.5977139330632, -0.1798352750697, -0.3730875132971, 0.2162046884669, -0.9022534234386,
          -0.5004082127215, 0.7720062091117, 0.3919158503224,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual113 = promiseResult.length;
        expect(assertionActual113).assertEqual(9);
        const assertionActual114 = callbackResult.length;
        expect(assertionActual114).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual115 = JSON.stringify(input);
        expect(assertionActual115).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.7728841808771, 0.5415622657234, 0.103693718148, -0.3140190569235];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual116 = JSON.stringify(input);
        expect(assertionActual116).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_3000
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 274
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.1061444663738, -0.4476578116749, 0.09289481120273];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.581946075396, -0.2590868651371, -0.7708519712919, 0.06902126698384, 0.9602078126196, -0.2706233938301,
          0.8102930519479, 0.1042830422342, 0.5766716718092,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual117 = promiseResult.length;
        expect(assertionActual117).assertEqual(9);
        const assertionActual118 = callbackResult.length;
        expect(assertionActual118).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual119 = JSON.stringify(input);
        expect(assertionActual119).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.8830098470324, 0.1061444663738, -0.4476578116749, 0.09289481120273];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual120 = JSON.stringify(input);
        expect(assertionActual120).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_3100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 275
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.6975399214173, 0.6754485126495, 0.1813578799543, 0.1559380779901];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.02175725227621, -0.9988658033268, -0.04235243697576, -0.885743406413, -0.03890524518474, 0.4625418898791,
          -0.4636650083511, 0.02744975121038, -0.8855852704225,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual121 = promiseResult.length;
        expect(assertionActual121).assertEqual(9);
        const assertionActual122 = callbackResult.length;
        expect(assertionActual122).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual123 = JSON.stringify(input);
        expect(assertionActual123).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.1559380779901, -0.6975399214173, 0.6754485126495, 0.1813578799543];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual124 = JSON.stringify(input);
        expect(assertionActual124).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_3200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 276
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.1442157128162, 0.05913165287548, 0.1771907966309];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.930213738435, -0.3273168254953, 0.1660304085835, 0.361427679373, 0.8956104995324, -0.2593296468017,
          -0.06381562042109, 0.3012399855181, 0.9514105516102,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual125 = promiseResult.length;
        expect(assertionActual125).assertEqual(9);
        const assertionActual126 = callbackResult.length;
        expect(assertionActual126).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual127 = JSON.stringify(input);
        expect(assertionActual127).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.9717554720167, 0.1442157128162, 0.05913165287548, 0.1771907966309];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual128 = JSON.stringify(input);
        expect(assertionActual128).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_3300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 277
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.4608577112152, 0.3875474408017, -0.5361132032949, 0.59160779609];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.1247792287619, 0.2771290482017, 0.9526959823115, -0.9915459544224, 0.0003856065327157, 0.1297554298523,
          0.03559163297951, -0.9608326295201, 0.2748343022831,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual129 = promiseResult.length;
        expect(assertionActual129).assertEqual(9);
        const assertionActual130 = callbackResult.length;
        expect(assertionActual130).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual131 = JSON.stringify(input);
        expect(assertionActual131).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.59160779609, -0.4608577112152, 0.3875474408017, -0.5361132032949];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual132 = JSON.stringify(input);
        expect(assertionActual132).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_3400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 278
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.3870438212614, -0.5127147277285, 0.5129493484008];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.05198685210916, -0.1872491369851, -0.9809358429103, 0.9810214067334, 0.1741600927971, -0.08523650396259,
          0.1868003392358, -0.9667502380528, 0.1746413767872,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual133 = promiseResult.length;
        expect(assertionActual133).assertEqual(9);
        const assertionActual134 = callbackResult.length;
        expect(assertionActual134).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual135 = JSON.stringify(input);
        expect(assertionActual135).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.5693888428559, -0.3870438212614, -0.5127147277285, 0.5129493484008];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual136 = JSON.stringify(input);
        expect(assertionActual136).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_3500
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 279
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.09151231225084, 0.09968226011164, -0.15978673953, 0.9778328801978];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.9290632897788, 0.3307337636904, 0.1657002750164, -0.2942451472376, 0.9321873891538, -0.210823302388,
          -0.224190091022, 0.1471116890592, 0.9633778874511,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual137 = promiseResult.length;
        expect(assertionActual137).assertEqual(9);
        const assertionActual138 = callbackResult.length;
        expect(assertionActual138).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual139 = JSON.stringify(input);
        expect(assertionActual139).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.9778328801978, 0.09151231225084, 0.09968226011164, -0.15978673953];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual140 = JSON.stringify(input);
        expect(assertionActual140).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_3600
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 280
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.7678529230028, -0.2461144821294, -0.5624961592979];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.2460514649225, 0.5836442933988, 0.7738333253307, 0.1722746045866, -0.8120000811777, 0.557653412777,
          0.9538239550483, -0.003899608995539, -0.3003408993555,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual141 = promiseResult.length;
        expect(assertionActual141).assertEqual(9);
        const assertionActual142 = callbackResult.length;
        expect(assertionActual142).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual143 = JSON.stringify(input);
        expect(assertionActual143).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.1828322211683, -0.7678529230028, -0.2461144821294, -0.5624961592979];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual144 = JSON.stringify(input);
        expect(assertionActual144).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_3700
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 281
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.113809733659, 0.4562219099796, 0.1490894673995, 0.8698742691272];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.5392677991301, -0.1555331948491, 0.8276470661589, 0.3632231711057, 0.92963935047, -0.0619645546226,
          -0.7597757358545, 0.334036080922, 0.557817826758,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual145 = promiseResult.length;
        expect(assertionActual145).assertEqual(9);
        const assertionActual146 = callbackResult.length;
        expect(assertionActual146).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual147 = JSON.stringify(input);
        expect(assertionActual147).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.8698742691272, 0.113809733659, 0.4562219099796, 0.1490894673995];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual148 = JSON.stringify(input);
        expect(assertionActual148).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_3800
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 282
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.4648149144405, -0.3960808649329, 0.05575113234501];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.6800235193526, -0.4562854144804, -0.5739090813533, -0.2801317589008, 0.5616778131118, -0.7784884276038,
          0.6775649125969, 0.690160600723, 0.2541340874954,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual149 = promiseResult.length;
        expect(assertionActual149).assertEqual(9);
        const assertionActual150 = callbackResult.length;
        expect(assertionActual150).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual151 = JSON.stringify(input);
        expect(assertionActual151).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.7899106626638, 0.4648149144405, -0.3960808649329, 0.05575113234501];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual152 = JSON.stringify(input);
        expect(assertionActual152).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_3900
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 283
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.148043121342, 0.1791956621416, -0.9176597935908, 0.3222928049459];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.7484211642069, 0.6445676680336, -0.1561994951751, -0.538452927416, -0.7280325250996, -0.4243077743269,
          -0.387213385518, -0.2334548430058, 0.8919442977859,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual153 = promiseResult.length;
        expect(assertionActual153).assertEqual(9);
        const assertionActual154 = callbackResult.length;
        expect(assertionActual154).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual155 = JSON.stringify(input);
        expect(assertionActual155).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.3222928049459, 0.148043121342, 0.1791956621416, -0.9176597935908];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual156 = JSON.stringify(input);
        expect(assertionActual156).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_4000
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 284
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.04399546825516, -0.03286311939629, -0.03770806291966];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.9949962347488, 0.07235695422381, -0.06889821486217, -0.07814026752847, 0.9932850015277, -0.08531708111904,
          0.06226227932159, 0.09027389941476, 0.9939688283131,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual157 = promiseResult.length;
        expect(assertionActual157).assertEqual(9);
        const assertionActual158 = callbackResult.length;
        expect(assertionActual158).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual159 = JSON.stringify(input);
        expect(assertionActual159).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.9977787911894, 0.04399546825516, -0.03286311939629, -0.03770806291966];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual160 = JSON.stringify(input);
        expect(assertionActual160).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_4100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 285
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.2430073440641, 0.6096201309697, 0.6091333707539, 0.4452721227311];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.485360334899, -0.246175880214, 0.8389414647683, 0.8387445558737, 0.1398079347299, 0.5262711386527,
          -0.2468459343376, 0.9590887223753, 0.1386214532949,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual161 = promiseResult.length;
        expect(assertionActual161).assertEqual(9);
        const assertionActual162 = callbackResult.length;
        expect(assertionActual162).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual163 = JSON.stringify(input);
        expect(assertionActual163).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.4452721227311, 0.2430073440641, 0.6096201309697, 0.6091333707539];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual164 = JSON.stringify(input);
        expect(assertionActual164).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_4200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 286
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.4396602990375, -0.2518704857827, -0.5013204659726];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.3704780975772, 0.9247100376727, 0.08750614517194, -0.4817602252809, 0.1107532236946, 0.869276025655,
          0.7941366787606, -0.3642047084657, 0.4865201596836,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual165 = promiseResult.length;
        expect(assertionActual165).assertEqual(9);
        const assertionActual166 = callbackResult.length;
        expect(assertionActual166).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual167 = JSON.stringify(input);
        expect(assertionActual167).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.7013828271628, -0.4396602990375, -0.2518704857827, -0.5013204659726];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual168 = JSON.stringify(input);
        expect(assertionActual168).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_4300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 287
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.2281010117521, -0.1364285351578, 0.2620701883003, 0.9277264681126];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.825412942398, -0.4240199265761, -0.3726936763461, 0.5484978741815, 0.7585782896839, 0.3517229882147,
          0.1335797759407, -0.494738395808, 0.8587143664647,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual169 = promiseResult.length;
        expect(assertionActual169).assertEqual(9);
        const assertionActual170 = callbackResult.length;
        expect(assertionActual170).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual171 = JSON.stringify(input);
        expect(assertionActual171).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.9277264681126, -0.2281010117521, -0.1364285351578, 0.2620701883003];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual172 = JSON.stringify(input);
        expect(assertionActual172).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_4400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 288
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.51307380523, 0.785571759404, -0.342169957525];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.4684065380114, 0.8406836141636, -0.2717468969924, 0.7715415533507, 0.2393499811084, -0.5894363561883,
          -0.4304868715784, -0.485759866004, -0.7607354375724,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual173 = promiseResult.length;
        expect(assertionActual173).assertEqual(9);
        const assertionActual174 = callbackResult.length;
        expect(assertionActual174).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual175 = JSON.stringify(input);
        expect(assertionActual175).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.05051733743155, 0.51307380523, 0.785571759404, -0.342169957525];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual176 = JSON.stringify(input);
        expect(assertionActual176).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_4500
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 289
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.2495418831116, 0.2272514686613, -0.001357173606329, 0.941320230657];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.8967098561422, -0.1108624489149, 0.4285101531097, -0.1159725888035, 0.8754540133058, 0.4691808065478,
          -0.42715546648, -0.4704144853289, 0.7721712371288,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual177 = promiseResult.length;
        expect(assertionActual177).assertEqual(9);
        const assertionActual178 = callbackResult.length;
        expect(assertionActual178).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual179 = JSON.stringify(input);
        expect(assertionActual179).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.941320230657, -0.2495418831116, 0.2272514686613, -0.001357173606329];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual180 = JSON.stringify(input);
        expect(assertionActual180).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorAxisRotationValidationTest0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_AXIS_ROTATION_VALIDATION_4600
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 290
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAxisRotationValidationTest0046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.4828009602998, 0.007335336036885, -0.559545863638];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.3737092386617, 0.7609205564731, -0.5304161683768, -0.7467545273422, -0.09237668156165, -0.6586533417493,
          -0.5501809528081, 0.642235513998, 0.5336988511576,
        ];
        const promiseResult: number[] = await sensor.getRotationMatrix(input);
        const callbackResult: number[] = await rotationCallback(input);
        const assertionActual181 = promiseResult.length;
        expect(assertionActual181).assertEqual(9);
        const assertionActual182 = callbackResult.length;
        expect(assertionActual182).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual183 = JSON.stringify(input);
        expect(assertionActual183).assertEqual(inputBefore);
        const quaternionResult: number[] = await sensor.getQuaternion(input);
        assertUnitQuaternion(quaternionResult);
        const expectedQuaternion: number[] = [0.673615507589, 0.4828009602998, 0.007335336036885, -0.559545863638];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual184 = JSON.stringify(input);
        expect(assertionActual184).assertEqual(inputBefore);
      },
    );
  });
}
