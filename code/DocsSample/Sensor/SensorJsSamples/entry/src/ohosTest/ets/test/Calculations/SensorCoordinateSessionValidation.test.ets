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
import { assertArrayNear, assertRotationMatrix, transformCallback } from '../Shared/SharedDriver';

export default function sensorCoordinateSessionValidationTest(): void {
  describe('SensorCoordinateSessionValidation', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorCoordinateSessionValidationTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_SESSION_VALIDATION_0100
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 106
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateSessionValidationTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9986625290948, -0.01753025886654, -0.04863993221762, 0.01511256630544, 0.9986530309557, -0.0496360161853,
          0.04944454794743, 0.04883455525707, 0.9975822887818,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 3, y: 129 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.01753025886654, 0.04863993221762, 0.9986625290948, -0.9986530309557, 0.0496360161853, 0.01511256630544,
          -0.04883455525707, -0.9975822887818, 0.04944454794743,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual4 = JSON.stringify(coordinates);
        expect(assertionActual4).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateSessionValidationTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_SESSION_VALIDATION_0200
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 107
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateSessionValidationTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.5179192930916, 0.3203168767341, 0.7931939890864, 0.5675722233716, 0.8224239990474, 0.03847774743755,
          -0.6400167006418, 0.4701232437034, -0.6077522181196,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 3, y: 130 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.7931939890864, -0.3203168767341, -0.5179192930916, 0.03847774743755, -0.8224239990474, 0.5675722233716,
          -0.6077522181196, -0.4701232437034, -0.6400167006418,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual8 = JSON.stringify(coordinates);
        expect(assertionActual8).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateSessionValidationTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_SESSION_VALIDATION_0300
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 108
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateSessionValidationTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.7249619343729, 0.2033338316749, 0.6580923541622, -0.6862695471792, 0.1315858328365, 0.7153455648924,
          0.05885832417541, -0.9702270463624, 0.234936536499,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 129, y: 2 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.7249619343729, 0.2033338316749, -0.6580923541622, 0.6862695471792, 0.1315858328365, -0.7153455648924,
          -0.05885832417541, -0.9702270463624, -0.234936536499,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual12 = JSON.stringify(coordinates);
        expect(assertionActual12).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateSessionValidationTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_SESSION_VALIDATION_0400
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 109
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateSessionValidationTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.7161743805678, -0.3694976642183, -0.5920859167008, 0.5292346947038, 0.8405654741629, 0.115586857242,
          0.4549779055515, -0.3961327552506, 0.7975424413017,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 129, y: 3 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.7161743805678, -0.5920859167008, -0.3694976642183, -0.5292346947038, 0.115586857242, 0.8405654741629,
          -0.4549779055515, 0.7975424413017, -0.3961327552506,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual16 = JSON.stringify(coordinates);
        expect(assertionActual16).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateSessionValidationTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_SESSION_VALIDATION_0500
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 110
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateSessionValidationTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.4311889098975, 0.679025814028, -0.5941380882127, 0.4681671884841, -0.3945351825221, -0.7906715331787,
          -0.7712947605217, -0.6190847548082, -0.1477784109937,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 129, y: 130 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.4311889098975, -0.679025814028, -0.5941380882127, -0.4681671884841, 0.3945351825221, -0.7906715331787,
          0.7712947605217, 0.6190847548082, -0.1477784109937,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual20 = JSON.stringify(coordinates);
        expect(assertionActual20).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateSessionValidationTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_SESSION_VALIDATION_0600
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 111
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateSessionValidationTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.877347372908, 0.464812643297, 0.1192090344005, -0.475800920745, 0.8104342143724, 0.3417745865228,
          0.06225006883296, -0.3565748039414, 0.932190612549,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 129, y: 131 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.877347372908, -0.1192090344005, -0.464812643297, 0.475800920745, -0.3417745865228, -0.8104342143724,
          -0.06225006883296, -0.932190612549, 0.3565748039414,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual24 = JSON.stringify(coordinates);
        expect(assertionActual24).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateSessionValidationTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_SESSION_VALIDATION_0700
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 112
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateSessionValidationTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.09605266164268, -0.2979380080563, 0.9497404011343, 0.9590137032956, 0.2832428708133, -0.008135909578944,
          -0.266583201051, 0.9115955350312, 0.3129328640915,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 130, y: 1 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.2979380080563, -0.09605266164268, 0.9497404011343, 0.2832428708133, -0.9590137032956, -0.008135909578944,
          0.9115955350312, 0.266583201051, 0.3129328640915,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual28 = JSON.stringify(coordinates);
        expect(assertionActual28).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateSessionValidationTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_SESSION_VALIDATION_0800
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 113
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateSessionValidationTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.1252423441011, -0.3893193495457, -0.9125485188818, -0.9437178507323, 0.2370549854972, -0.2306546163858,
          0.3061224811301, 0.890076051762, -0.3377182977373,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 130, y: 3 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.9125485188818, -0.1252423441011, -0.3893193495457, 0.2306546163858, 0.9437178507323, 0.2370549854972,
          0.3377182977373, -0.3061224811301, 0.890076051762,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual32 = JSON.stringify(coordinates);
        expect(assertionActual32).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateSessionValidationTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_SESSION_VALIDATION_0900
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 114
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateSessionValidationTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9738069690572, -0.03253098997998, 0.2250371562799, -0.0005409476706636, 0.9893781421107, 0.145363679402,
          -0.2273756679841, -0.1416778973749, 0.963445732257,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 130, y: 129 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.03253098997998, -0.9738069690572, -0.2250371562799, -0.9893781421107, 0.0005409476706636, -0.145363679402,
          0.1416778973749, 0.2273756679841, -0.963445732257,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual36 = JSON.stringify(coordinates);
        expect(assertionActual36).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateSessionValidationTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_SESSION_VALIDATION_1000
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 115
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateSessionValidationTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.5182758919576, -0.4430181240673, -0.7315224135756, -0.777490282948, -0.6003711109017, -0.1872522072397,
          -0.3562288025091, 0.6657998730419, -0.6556001596403,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 130, y: 131 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.7315224135756, -0.5182758919576, 0.4430181240673, -0.1872522072397, 0.777490282948, 0.6003711109017,
          -0.6556001596403, 0.3562288025091, -0.6657998730419,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual40 = JSON.stringify(coordinates);
        expect(assertionActual40).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateSessionValidationTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_SESSION_VALIDATION_1100
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 116
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateSessionValidationTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.3796543064934, -0.5432275291829, 0.7488434142722, 0.5707479292188, 0.7745785245877, 0.2725342373721,
          -0.7280861273596, 0.3239320311198, 0.6041180599528,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 131, y: 1 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.5432275291829, -0.7488434142722, -0.3796543064934, 0.7745785245877, -0.2725342373721, -0.5707479292188,
          0.3239320311198, -0.6041180599528, 0.7280861273596,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual44 = JSON.stringify(coordinates);
        expect(assertionActual44).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateSessionValidationTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_SESSION_VALIDATION_1200
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 117
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateSessionValidationTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.6299166860365, 0.746413340778, -0.214644108611, -0.3746783943085, 0.5341303059405, 0.7578396381256,
          0.680309539468, -0.3969533234331, 0.6161225442428,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 131, y: 2 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.214644108611, 0.746413340778, -0.6299166860365, 0.7578396381256, 0.5341303059405, 0.3746783943085,
          0.6161225442428, -0.3969533234331, -0.680309539468,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual48 = JSON.stringify(coordinates);
        expect(assertionActual48).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateSessionValidationTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_SESSION_VALIDATION_1300
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 118
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateSessionValidationTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.6708244751132, -0.4283161581607, -0.6054252986517, 0.4859003542892, -0.8705706589357, 0.07750853825218,
          -0.5602636605124, -0.2421817426207, 0.7921190783275,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 131, y: 129 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.4283161581607, -0.6054252986517, 0.6708244751132, 0.8705706589357, 0.07750853825218, -0.4859003542892,
          0.2421817426207, 0.7921190783275, 0.5602636605124,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual52 = JSON.stringify(coordinates);
        expect(assertionActual52).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateSessionValidationTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_SESSION_VALIDATION_1400
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 119
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateSessionValidationTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.974112918231, -0.1489528979773, -0.1700501594229, 0.1754106575094, 0.9725441791866, 0.1529343674995,
          0.1426012754771, -0.1788039532967, 0.9734957742681,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 131, y: 130 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.1700501594229, 0.1489528979773, -0.974112918231, -0.1529343674995, -0.9725441791866, -0.1754106575094,
          -0.9734957742681, 0.1788039532967, -0.1426012754771,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual56 = JSON.stringify(coordinates);
        expect(assertionActual56).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateSessionValidationTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_SESSION_VALIDATION_1500
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 120
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateSessionValidationTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.1185729121862, -0.1639521401176, 0.9793161697055, -0.9317675853402, 0.3592132713633, -0.05267819839159,
          -0.343146661655, -0.9187412701231, -0.1953582533902,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 1, y: 2 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.1185729121862, -0.1639521401176, 0.9793161697055, -0.9317675853402, 0.3592132713633, -0.05267819839159,
          -0.343146661655, -0.9187412701231, -0.1953582533902,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual60 = JSON.stringify(coordinates);
        expect(assertionActual60).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateSessionValidationTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_SESSION_VALIDATION_1600
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 121
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateSessionValidationTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.7175821206725, -0.6544330688313, -0.2383133620073, -0.2567684560962, 0.06948745040129, -0.96397170819,
          0.6474147511797, 0.752920216661, -0.118174816683,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 1, y: 3 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.7175821206725, 0.2383133620073, -0.6544330688313, -0.2567684560962, 0.96397170819, 0.06948745040129,
          0.6474147511797, 0.118174816683, 0.752920216661,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual64 = JSON.stringify(coordinates);
        expect(assertionActual64).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateSessionValidationTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_SESSION_VALIDATION_1700
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 122
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateSessionValidationTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9385522725475, -0.2291468917191, -0.2580917156968, 0.07517369296263, 0.8655648371098, -0.4951226400049,
          0.3368509278334, 0.4452967715743, 0.8296036629881,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 1, y: 130 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.9385522725475, 0.2291468917191, 0.2580917156968, 0.07517369296263, -0.8655648371098, 0.4951226400049,
          0.3368509278334, -0.4452967715743, -0.8296036629881,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual68 = JSON.stringify(coordinates);
        expect(assertionActual68).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateSessionValidationTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_SESSION_VALIDATION_1800
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 123
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateSessionValidationTest0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.7795003102578, -0.5962140555138, 0.1921147217571, -0.4163795849196, 0.2640449131796, -0.8700047845191,
          0.4679821658676, -0.7581616475606, -0.4540744527036,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 1, y: 131 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.7795003102578, 0.1921147217571, 0.5962140555138, -0.4163795849196, -0.8700047845191, -0.2640449131796,
          0.4679821658676, -0.4540744527036, 0.7581616475606,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual72 = JSON.stringify(coordinates);
        expect(assertionActual72).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinateSessionValidationTest0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_SESSION_VALIDATION_1900
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 124
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateSessionValidationTest0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.8076076610652, 0.5506107346001, 0.2111816391922, -0.3531941592417, 0.7383872395044, -0.5744894867747,
          -0.4722539059302, 0.3893739892189, 0.7907996869331,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 2, y: 1 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.5506107346001, 0.8076076610652, -0.2111816391922, 0.7383872395044, -0.3531941592417, 0.5744894867747,
          0.3893739892189, -0.4722539059302, -0.7907996869331,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
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
        const assertionActual76 = JSON.stringify(coordinates);
        expect(assertionActual76).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );
  });
}
