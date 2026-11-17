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
import { assertAngleArrayNear, assertOrientationRange, orientationCallback } from '../Shared/SharedDriver';

export default function sensorLayoutCompatibilityTest(): void {
  describe('SensorLayoutCompatibility', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorLayoutCompatibilityTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_LAYOUT_COMPATIBILITY_0100
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorLayoutCompatibilityTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.8598165055393, -0.4997752411494, 0.1045958179673, 0, 0.4891789912977, 0.7475561595031, -0.449292446923, 0,
          0.1463539930278, 0.4374751384057, 0.8872406730993, 0, 0, 0, 0, 1,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [-0.5893021462747, -0.4527889469268, -0.1634819419268];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual1 = promiseResult.length;
        expect(assertionActual1).assertEqual(3);
        const assertionActual2 = callbackResult.length;
        expect(assertionActual2).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual3 = JSON.stringify(input);
        expect(assertionActual3).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.8598165055393, -0.4997752411494, 0.1045958179673, 0.4891789912977, 0.7475561595031, -0.449292446923,
          0.1463539930278, 0.4374751384057, 0.8872406730993,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual4 = JSON.stringify(input);
        expect(assertionActual4).assertEqual(inputBefore);
      },
    );

    /**
     * @tc.name testSensorLayoutCompatibilityTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_LAYOUT_COMPATIBILITY_0200
     * @tc.desc Verify sensor.getOrientation with independent expectations for input partition 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorLayoutCompatibilityTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.1373314756002, 0.9461679309424, 0.2930977861835, -0.4078161433075, 0.3236681114109, -0.8537710155033,
          -0.90267716215, -0.002280375389617, 0.430312375863,
        ];
        const inputBefore: string = JSON.stringify(input);
        const expected: number[] = [1.241191710901, 0.00228037736599, 1.125956285121];
        const promiseResult: number[] = await sensor.getOrientation(input);
        const callbackResult: number[] = await orientationCallback(input);
        const assertionActual5 = promiseResult.length;
        expect(assertionActual5).assertEqual(3);
        const assertionActual6 = callbackResult.length;
        expect(assertionActual6).assertEqual(3);
        assertAngleArrayNear(promiseResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, expected, 0.00005);
        assertAngleArrayNear(callbackResult, promiseResult, 0.00005);
        assertOrientationRange(promiseResult);
        assertOrientationRange(callbackResult);
        const assertionActual7 = JSON.stringify(input);
        expect(assertionActual7).assertEqual(inputBefore);
        const alternateLayout: number[] = [
          0.1373314756002, 0.9461679309424, 0.2930977861835, 0, -0.4078161433075, 0.3236681114109, -0.8537710155033, 0,
          -0.90267716215, -0.002280375389617, 0.430312375863, 0, 0, 0, 0, 1,
        ];
        const alternateResult: number[] = await sensor.getOrientation(alternateLayout);
        assertAngleArrayNear(alternateResult, expected, 0.00005);
        assertAngleArrayNear(alternateResult, promiseResult, 0.00005);
        const assertionActual8 = JSON.stringify(input);
        expect(assertionActual8).assertEqual(inputBefore);
      },
    );
  });
}
