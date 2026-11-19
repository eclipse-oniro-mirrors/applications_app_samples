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

export default function sensorCoordinateRepeatabilityTest(): void {
  describe('SensorCoordinateRepeatability', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorCoordinateRepeatabilityTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_REPEATABILITY_0100
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 63
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateRepeatabilityTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9409005282164, -0.3386148403948, -0.006796018436632, -0.305991074221, -0.841306157962, -0.4456157661847,
          0.1451745793837, 0.4213596307665, -0.8951985271777,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 129, y: 131 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.9409005282164, 0.006796018436632, 0.3386148403948, 0.305991074221, 0.4456157661847, 0.841306157962,
          -0.1451745793837, 0.8951985271777, -0.4213596307665,
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
     * @tc.name testSensorCoordinateRepeatabilityTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_REPEATABILITY_0200
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 64
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateRepeatabilityTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9714379786423, 0.1251154348718, -0.201629317333, -0.07525057271992, 0.9682758877269, 0.2382837731615,
          0.2250457841344, -0.2163051853368, 0.9500349792717,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 130, y: 1 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.1251154348718, -0.9714379786423, -0.201629317333, 0.9682758877269, 0.07525057271992, 0.2382837731615,
          -0.2163051853368, -0.2250457841344, 0.9500349792717,
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
     * @tc.name testSensorCoordinateRepeatabilityTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_REPEATABILITY_0300
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 65
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateRepeatabilityTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.3592418522949, -0.298686618172, 0.8841558661711, 0.7937783244698, 0.4004265812783, 0.457793102403,
          -0.4907761843873, 0.8662822040944, 0.09324097654762,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 130, y: 3 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.8841558661711, 0.3592418522949, -0.298686618172, -0.457793102403, -0.7937783244698, 0.4004265812783,
          -0.09324097654762, 0.4907761843873, 0.8662822040944,
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
     * @tc.name testSensorCoordinateRepeatabilityTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_REPEATABILITY_0400
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 66
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateRepeatabilityTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.3874353888463, 0.4809921806633, -0.7864733572158, -0.8430897182346, -0.1602606708182, -0.5133383332618,
          -0.3729524721417, 0.8619530378911, 0.3434289067533,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 130, y: 129 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.4809921806633, -0.3874353888463, 0.7864733572158, 0.1602606708182, 0.8430897182346, 0.5133383332618,
          -0.8619530378911, 0.3729524721417, -0.3434289067533,
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
     * @tc.name testSensorCoordinateRepeatabilityTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_REPEATABILITY_0500
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 67
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateRepeatabilityTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.8448752295123, -0.4657527335185, -0.2631733986872, 0.4605923643157, 0.8835341036513, -0.08498330200196,
          0.2721038781248, -0.04941537114271, 0.9609982313221,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 130, y: 131 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.2631733986872, -0.8448752295123, 0.4657527335185, -0.08498330200196, -0.4605923643157, -0.8835341036513,
          0.9609982313221, -0.2721038781248, 0.04941537114271,
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
  });
}
