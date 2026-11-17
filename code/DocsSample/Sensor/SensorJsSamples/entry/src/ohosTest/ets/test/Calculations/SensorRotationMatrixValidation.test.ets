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

export default function sensorRotationMatrixValidationTest(): void {
  describe('SensorRotationMatrixValidation', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorRotationMatrixValidationTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_0100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 201
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.5243911567594, 0.4680255857281, 0.2599768944925, 0.662101185731];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.4267281308679, -0.8351189767982, 0.3471014216588, -0.1465949363736, 0.3148518580851, 0.9377516899958,
          -0.8924197593933, -0.4510483367133, 0.01193193163284,
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
        const expectedQuaternion: number[] = [0.662101185731, -0.5243911567594, 0.4680255857281, 0.2599768944925];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual4 = JSON.stringify(input);
        expect(assertionActual4).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_0200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 202
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.6005037171386, -0.6174026550563, 0.1243047794342];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.2067245666786, 0.6190141694429, -0.7576849025554, 0.8639961878873, 0.247887215025, 0.4382493764324,
          0.4591029741222, -0.7452337798678, -0.4835815055357,
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
        const expectedQuaternion: number[] = [0.4927043424225, -0.6005037171386, -0.6174026550563, 0.1243047794342];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual8 = JSON.stringify(input);
        expect(assertionActual8).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_0300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 203
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.02004866064261, 0.09430947466366, -0.07159158047458, 0.9927630229819];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.9719607371876, 0.1459285050098, 0.1843832877223, -0.1383653903982, 0.9889453936232, -0.0533106665824,
          -0.1901245489295, 0.0263036092028, 0.9814075483902,
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
        const expectedQuaternion: number[] = [0.9927630229819, 0.02004866064261, 0.09430947466366, -0.07159158047458];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual12 = JSON.stringify(input);
        expect(assertionActual12).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_0400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 204
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.7253116533784, -0.01975321612588, -0.6325272205905];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.1990382513294, 0.3714868693771, 0.9068524027581, -0.3141779179859, -0.8523353586291, 0.4181108373155,
          0.9282650539355, -0.3681330497402, -0.05293436814778,
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
        const expectedQuaternion: number[] = [0.2710020869627, -0.7253116533784, -0.01975321612588, -0.6325272205905];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual16 = JSON.stringify(input);
        expect(assertionActual16).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_0500
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 205
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.06810291071683, 0.3562374296764, 0.4396283806817, 0.8216956700316];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.3596435611935, -0.7710030853928, 0.5255575622202, 0.6739598619238, 0.6041777609022, 0.4251439023988,
          -0.6453174516528, 0.2013044349885, 0.736913774499,
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
        const expectedQuaternion: number[] = [0.8216956700316, -0.06810291071683, 0.3562374296764, 0.4396283806817];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual20 = JSON.stringify(input);
        expect(assertionActual20).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_0600
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 206
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.3115407557479, -0.3147043007089, -0.3077525762262];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.612499109883, 0.3222522027382, -0.7218021600293, -0.714425065458, 0.6164614186684, -0.3310168351289,
          0.3382922793058, 0.7184210722993, 0.6078071212468,
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
        const expectedQuaternion: number[] = [0.8421353290591, 0.3115407557479, -0.3147043007089, -0.3077525762262];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual24 = JSON.stringify(input);
        expect(assertionActual24).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_0700
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 207
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.4831827972284, 0.3869910433441, 0.7492534132094, 0.2353542853405];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.4222854896688, 0.02129482644096, 0.9062127209337, 0.7266548328603, -0.5896925854866, 0.3524704363529,
          0.541892719176, 0.807347004075, 0.2335446336681,
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
        const expectedQuaternion: number[] = [0.2353542853405, 0.4831827972284, 0.3869910433441, 0.7492534132094];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual28 = JSON.stringify(input);
        expect(assertionActual28).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_0800
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 208
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.1239914279527, -0.07890948746202, 0.05401888519012];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.9817105056626, -0.1262732822306, -0.1424764586393, 0.08713688211285, 0.9634161716741, -0.2534490953474,
          0.1692679734839, 0.2363986851729, 0.9567988371655,
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
        const expectedQuaternion: number[] = [0.9876646083694, 0.1239914279527, -0.07890948746202, 0.05401888519012];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual32 = JSON.stringify(input);
        expect(assertionActual32).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_0900
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 209
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.4964685920942, 0.6898815040334, 0.05055245968367, 0.5244300680516];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.04301591842507, 0.6319865382944, 0.7737846251876, 0.7380314577827, 0.5019267717679, -0.4509757012365,
          -0.6733937912434, 0.5904765289131, -0.4448351050867,
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
        const expectedQuaternion: number[] = [0.5244300680516, 0.4964685920942, 0.6898815040334, 0.05055245968367];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual36 = JSON.stringify(input);
        expect(assertionActual36).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_1000
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 210
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.4335518431985, -0.5275660358253, -0.3629027700199];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.179951314711, 0.9176451921506, -0.3543230526745, -0.002736283186655, 0.3606687575421, 0.9326899592508,
          0.9836717120504, -0.1668692561733, 0.0674137542055,
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
        const expectedQuaternion: number[] = [0.6340413682203, -0.4335518431985, -0.5275660358253, -0.3629027700199];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual40 = JSON.stringify(input);
        expect(assertionActual40).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_1100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 211
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.2131029788196, -0.03193519454819, 0.1908137898052, 0.9576833304321];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.9251404819387, -0.3518674012512, -0.1424935809605, 0.3790893416008, 0.8363544360768, 0.3959829899622,
          -0.02015836706887, -0.4203576919618, 0.9071345275347,
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
        const expectedQuaternion: number[] = [0.9576833304321, -0.2131029788196, -0.03193519454819, 0.1908137898052];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual44 = JSON.stringify(input);
        expect(assertionActual44).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_1200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 212
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.2154826329354, -0.6435704067073, 0.7272147914311];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.8860484425312, 0.128016857102, -0.4455668768949, 0.4266961257642, -0.1505482359458, -0.8917766788335,
          -0.1812417549736, -0.980278997506, 0.07876873302767,
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
        const expectedQuaternion: number[] = [0.102679178209, -0.2154826329354, -0.6435704067073, 0.7272147914311];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual48 = JSON.stringify(input);
        expect(assertionActual48).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_1300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 213
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.2500677558002, 0.2333618934285, -0.2459167598725, 0.9069362113282];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.7701343478185, 0.3293490590438, 0.5462804074988, -0.5627741989596, 0.7539821294458, 0.3388158046222,
          -0.3002969984789, -0.5683662074608, 0.766016688409,
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
        const expectedQuaternion: number[] = [0.9069362113282, -0.2500677558002, 0.2333618934285, -0.2459167598725];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual52 = JSON.stringify(input);
        expect(assertionActual52).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_1400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 214
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.02106887570853, -0.2136969085224, 0.6400690380628];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.08929051560258, -0.9353532125247, -0.3422595092077, 0.9533626269446, 0.1797354579794, -0.2424765281224,
          0.2883173691764, -0.3046465705774, 0.9077794675287,
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
        const expectedQuaternion: number[] = [0.737700047633, -0.02106887570853, -0.2136969085224, 0.6400690380628];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual56 = JSON.stringify(input);
        expect(assertionActual56).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_1500
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 215
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.7257876493008, -0.4442941663133, -0.3428728555973, 0.3978356278626];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.370081797349, -0.372112361566, -0.851217864968, -0.9177405127005, -0.2886590139662, -0.2728155512509,
          -0.1441936705242, 0.8821611893673, -0.4483300361953,
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
        const expectedQuaternion: number[] = [0.3978356278626, 0.7257876493008, -0.4442941663133, -0.3428728555973];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual60 = JSON.stringify(input);
        expect(assertionActual60).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_1600
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 216
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.004606349679844, 0.013563665199, 0.000702060897689];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.9996310681937, -0.001279019415311, 0.0271310082967, 0.001528935354699, 0.9999565773062, -0.009192706818944,
          -0.02711807254474, 0.009230796894807, 0.999589617058,
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
        const expectedQuaternion: number[] = [0.9998971525309, 0.004606349679844, 0.013563665199, 0.000702060897689];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual64 = JSON.stringify(input);
        expect(assertionActual64).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_1700
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 217
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.7155284625974, 0.508265788794, -0.3029479741093, 0.3713588993652];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.2997768258494, 0.9523621293535, -0.05603774849978, 0.502352424433, -0.2075169116078, -0.8393919067176,
          -0.8110338441458, 0.2234795426209, -0.5406301856908,
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
        const expectedQuaternion: number[] = [0.3713588993652, 0.7155284625974, 0.508265788794, -0.3029479741093];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual68 = JSON.stringify(input);
        expect(assertionActual68).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_1800
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 218
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.4115515391146, 0.1600100044816, 0.4820135654962];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.4841194422868, -0.5978320330726, 0.6389250549416, 0.8612414875451, 0.1965765066601, -0.4686371487201,
          0.1545686440747, 0.777145119821, 0.6100442582365,
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
        const expectedQuaternion: number[] = [0.7567595733097, 0.4115515391146, 0.1600100044816, 0.4820135654962];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual72 = JSON.stringify(input);
        expect(assertionActual72).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_1900
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 219
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.2044949861234, -0.2764193659624, -0.2857935048137, 0.8944809709422];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.6838288134545, 0.6243264521628, -0.3776170481045, -0.3982209545359, 0.7530077465134, 0.5238314662745,
          0.6113904033086, -0.2078360286874, 0.7635482695426,
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
        const expectedQuaternion: number[] = [0.8944809709422, -0.2044949861234, -0.2764193659624, -0.2857935048137];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual76 = JSON.stringify(input);
        expect(assertionActual76).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_2000
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 220
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.5277010785092, 0.5555050823863, 0.6290796517324];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.4086542095614, -0.7513087331276, -0.5182054848552, -0.4212537912427, -0.3484192729669, 0.8373465552499,
          -0.8096585578942, 0.5604812198026, -0.1741086496335,
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
        const expectedQuaternion: number[] = [0.1311657995041, -0.5277010785092, 0.5555050823863, 0.6290796517324];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual80 = JSON.stringify(input);
        expect(assertionActual80).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_2100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 221
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.1104731066294, 0.04277406841817, 0.2317116631265, 0.965544290519];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.8889601684842, -0.4569065151996, 0.03140470055115, 0.4380049783143, 0.8682107957656, 0.2331558557876,
          -0.1337963296226, -0.1935108536601, 0.9719321435652,
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
        const expectedQuaternion: number[] = [0.965544290519, -0.1104731066294, 0.04277406841817, 0.2317116631265];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual84 = JSON.stringify(input);
        expect(assertionActual84).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_2200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 222
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.5814906630708, 0.4119326449214, -0.3436904527922];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.4243767374152, -0.05866645331453, 0.9035832180803, -0.8994734940289, 0.0874909628419, 0.4281270430147,
          -0.1041720609393, -0.9944363120263, -0.01563979038094,
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
        const expectedQuaternion: number[] = [0.6116019763449, -0.5814906630708, 0.4119326449214, -0.3436904527922];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual88 = JSON.stringify(input);
        expect(assertionActual88).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_2300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 223
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.08452402344233, -0.8191513077961, 0.1443853001103, 0.5486344042339];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.383711959904, -0.2969054148983, -0.8744211264778, 0.01995355752642, 0.9440171491463, -0.3292923893133,
          0.9232372324428, -0.1438012403344, -0.3563063512058,
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
        const expectedQuaternion: number[] = [0.5486344042339, 0.08452402344233, -0.8191513077961, 0.1443853001103];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual92 = JSON.stringify(input);
        expect(assertionActual92).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_2400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 224
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.1591589875043, 0.08499504635908, 0.04015570836974];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.9823267223595, -0.05187199180475, 0.1798430065493, 0.1059828938903, 0.9461118715638, -0.3060064585733,
          -0.1542784390027, 0.3196586037512, 0.934888517582,
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
        const expectedQuaternion: number[] = [0.9827674078216, 0.1591589875043, 0.08499504635908, 0.04015570836974];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual96 = JSON.stringify(input);
        expect(assertionActual96).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_2500
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 225
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.2807356808764, -0.4469106279445, 0.8236812488338, 0.207382661842];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.7563598181004, -0.09070690093116, -0.6478364636902, 0.5925619386388, -0.5145266443951, -0.6197843827365,
          -0.2771104011758, -0.8526632338332, 0.4429167362262,
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
        const expectedQuaternion: number[] = [0.207382661842, -0.2807356808764, -0.4469106279445, 0.8236812488338];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual100 = JSON.stringify(input);
        expect(assertionActual100).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_2600
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 226
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.2979540881819, 0.3055510374665, -0.2880542935215];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.647326574974, 0.6759525009542, 0.3522165836332, -0.3117917779086, 0.6564961706391, -0.6868760187725,
          -0.6955244011255, 0.3348148658439, 0.6357238496776,
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
        const expectedQuaternion: number[] = [0.857255299676, 0.2979540881819, 0.3055510374665, -0.2880542935215];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual104 = JSON.stringify(input);
        expect(assertionActual104).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_2700
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 227
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.2183599608475, -0.3503303884703, 0.4260790831889, 0.8050119013293];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.3914504675663, -0.8389937255692, -0.3779630403857, 0.5330012059289, 0.5415510847351, -0.6501016359774,
          0.750117488078, 0.05302783304681, 0.6591750928258,
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
        const expectedQuaternion: number[] = [0.8050119013293, 0.2183599608475, -0.3503303884703, 0.4260790831889];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual108 = JSON.stringify(input);
        expect(assertionActual108).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_2800
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 228
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.6109250385072, 0.0413807745056, -0.7320910420522];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.07533932470351, 0.3864940243863, 0.9192096361913, -0.4876162294194, -0.8183733930562, 0.3041305679218,
          0.8698013560348, -0.4253085452367, 0.2501164576525,
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
        const expectedQuaternion: number[] = [0.2984977972669, -0.6109250385072, 0.0413807745056, -0.7320910420522];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual112 = JSON.stringify(input);
        expect(assertionActual112).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_2900
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 229
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.05487175714693, -0.05500250868448, -0.04846068778913, 0.9957988632475];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.9892525715548, 0.0904780270272, -0.1148611174306, -0.1025503642232, 0.9892813040132, -0.1039515479807,
          0.1042246250645, 0.1146133855846, 0.987927628612,
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
        const expectedQuaternion: number[] = [0.9957988632475, 0.05487175714693, -0.05500250868448, -0.04846068778913];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual116 = JSON.stringify(input);
        expect(assertionActual116).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_3000
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 230
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.4032824832403, 0.752885617887, 0.2278795091461];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.2375316486197, -0.8203385685529, 0.5202147141792, -0.3941637577566, 0.5708683360457, 0.7202390401607,
          -0.8878139714913, -0.03397021997152, -0.4589470298192,
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
        const expectedQuaternion: number[] = [0.4675440240252, -0.4032824832403, 0.752885617887, 0.2278795091461];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual120 = JSON.stringify(input);
        expect(assertionActual120).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_3100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 231
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.6542481397579, -0.3108093358293, 0.09180129774089, 0.6833223617867];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.7899401569889, 0.2812331003966, -0.5448875953971, 0.5321526187461, 0.1270637867129, 0.8370593673497,
          0.3046442822998, -0.9511901688661, -0.04928614323056,
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
        const expectedQuaternion: number[] = [0.6833223617867, -0.6542481397579, -0.3108093358293, 0.09180129774089];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual124 = JSON.stringify(input);
        expect(assertionActual124).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_3200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 232
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.1102631678777, -0.212380538502, -0.2553091856856];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.7794234531403, 0.4315007561877, -0.4542093989608, -0.5251717600709, 0.8453185070283, -0.09813890207036,
          0.341604600553, 0.3150297114321, 0.8854730813503,
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
        const expectedQuaternion: number[] = [0.9367783944881, 0.1102631678777, -0.212380538502, -0.2553091856856];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual128 = JSON.stringify(input);
        expect(assertionActual128).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_3300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 233
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.6115445377089, -0.6009814419461, -0.5132660699481, 0.03731656836884];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.2492415042471, 0.7733604929544, 0.5829169928026, 0.6967471793919, -0.2748575603232, 0.6625682527428,
          0.6726232530697, 0.5712852785348, -0.4703308303304,
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
        const expectedQuaternion: number[] = [0.03731656836884, -0.6115445377089, -0.6009814419461, -0.5132660699481];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual132 = JSON.stringify(input);
        expect(assertionActual132).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_3400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 234
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.02557718872811, 0.2186419920225, 0.2860782571641];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.7407098202048, -0.5447647634187, 0.3931670316665, 0.5223957734433, 0.8350100763894, 0.1728028593995,
          -0.4224353419645, 0.07739202068321, 0.9030829734824,
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
        const expectedQuaternion: number[] = [0.9325774592596, -0.02557718872811, 0.2186419920225, 0.2860782571641];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual136 = JSON.stringify(input);
        expect(assertionActual136).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_3500
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 235
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.5124875176455, 0.02954413819935, -0.5076941613836, 0.6919034084702];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.4827475647902, 0.7328326455369, -0.4794904611403, -0.6722686373499, -0.04079363449081, -0.7391824934485,
          -0.561257220822, 0.6791849475808, 0.4729673763112,
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
        const expectedQuaternion: number[] = [0.6919034084702, 0.5124875176455, 0.02954413819935, -0.5076941613836];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual140 = JSON.stringify(input);
        expect(assertionActual140).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_3600
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 236
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.298018554083, -0.6177439050207, 0.5662769827669];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.4045543068037, -0.8858482931608, -0.2271752943229, 0.1494517116894, 0.1810306404213, -0.9720556018571,
          0.9022194847817, -0.4272010167741, 0.05915481846411,
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
        const expectedQuaternion: number[] = [0.4570643149716, 0.298018554083, -0.6177439050207, 0.5662769827669];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual144 = JSON.stringify(input);
        expect(assertionActual144).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_3700
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 237
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.05029002403329, 0.05683575965129, -0.02464658329847, 0.9968114946364];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.9923244847131, 0.04341945163323, 0.1157880315864, -0.05485253850848, 0.9937269188289, 0.09745773347469,
          -0.1108301225208, -0.103060962613, 0.9884812198152,
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
        const expectedQuaternion: number[] = [0.9968114946364, -0.05029002403329, 0.05683575965129, -0.02464658329847];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual148 = JSON.stringify(input);
        expect(assertionActual148).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_3800
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 238
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.8470367231311, 0.4318933290499, 0.006917700517346];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.6268405954835, 0.7273734150027, 0.2792826220896, 0.7359446257198, -0.4350381298263, -0.5187748388958,
          -0.2558444365783, 0.5307256737191, -0.808006116021,
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
        const expectedQuaternion: number[] = [0.3097564969602, 0.8470367231311, 0.4318933290499, 0.006917700517346];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual152 = JSON.stringify(input);
        expect(assertionActual152).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_3900
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 239
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.4085572746317, 0.3480751989326, -0.2742433741812, 0.7979443470263];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.6072684552114, 0.153244590989, 0.7795775257392, -0.7220792095603, 0.5157430501264, 0.4610973014095,
          -0.3314010235741, -0.8429265695058, 0.4238492184671,
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
        const expectedQuaternion: number[] = [0.7979443470263, -0.4085572746317, 0.3480751989326, -0.2742433741812];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual156 = JSON.stringify(input);
        expect(assertionActual156).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_4000
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 240
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.2870546682585, -0.3295876751781, 0.2524246375059];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.6553075335015, -0.2466072205518, -0.7139726292428, 0.6250459435931, 0.707762839622, 0.329225350251,
          0.4241339469247, -0.6620095479839, 0.6179431636034,
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
        const expectedQuaternion: number[] = [0.8632805941186, -0.2870546682585, -0.3295876751781, 0.2524246375059];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual160 = JSON.stringify(input);
        expect(assertionActual160).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_4100
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 241
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.2811657249817, 0.5424410409589, -0.7670484086337, 0.1958067695239];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.7652110882083, 0.6054181990081, -0.2189081880445, 0.004645115156119, -0.3348348521841, -0.9422653791093,
          -0.6437626995938, -0.7220487698713, 0.2534071043578,
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
        const expectedQuaternion: number[] = [0.1958067695239, 0.2811657249817, 0.5424410409589, -0.7670484086337];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual164 = JSON.stringify(input);
        expect(assertionActual164).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_4200
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 242
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [-0.1374393776736, -0.02285938725799, -0.1384910902911];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.9605953326483, 0.2778685193439, -0.006759648799566, -0.2653013995089, 0.9238612707493, 0.2758541640579,
          0.08289616585138, -0.2631908781989, 0.9611757317577,
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
        const expectedQuaternion: number[] = [0.9805141935683, -0.1374393776736, -0.02285938725799, -0.1384910902911];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual168 = JSON.stringify(input);
        expect(assertionActual168).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_4300
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 243
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.02766705489424, 0.6028585109508, 0.5691218120892, 0.5584769582104];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          -0.3746760424431, -0.6023241979017, 0.7048570236873, 0.6690414759654, 0.3506697941556, 0.6552970310515,
          -0.641873326021, 0.7171026816914, 0.2715922996952,
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
        const expectedQuaternion: number[] = [0.5584769582104, 0.02766705489424, 0.6028585109508, 0.5691218120892];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual172 = JSON.stringify(input);
        expect(assertionActual172).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorRotationMatrixValidationTest0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ROTATION_MATRIX_VALIDATION_4400
     * @tc.desc Verify sensor.getRotationMatrix with independent expectations for input partition 244
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorRotationMatrixValidationTest0044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [0.5477949197899, -0.5040380200251, -0.2884626893711];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [
          0.32546990242, -0.2047892793487, -0.9231092533837, -0.899648587654, 0.2334200053863, -0.368981733718,
          0.2910356702379, 0.950566384925, -0.1082671995568,
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
        const expectedQuaternion: number[] = [0.6022089978258, 0.5477949197899, -0.5040380200251, -0.2884626893711];
        assertArrayNear(quaternionResult, expectedQuaternion, 0.00002);
        const assertionActual176 = JSON.stringify(input);
        expect(assertionActual176).assertEqual(inputBefore);
      },
    );
  });
}
