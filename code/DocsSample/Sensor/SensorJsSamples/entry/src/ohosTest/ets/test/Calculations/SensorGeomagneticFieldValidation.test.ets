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
import { assertNear, assertGeomagneticResponse, geomagneticCallback } from '../Shared/SharedDriver';

export default function sensorGeomagneticFieldValidationTest(): void {
  describe('SensorGeomagneticFieldValidation', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorGeomagneticFieldValidationTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_FIELD_VALIDATION_0100
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 75
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticFieldValidationTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -71, longitude: -158, altitude: 8375 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1584316800000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual1 = JSON.stringify(location);
        expect(assertionActual1).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual2 = JSON.stringify(location);
        expect(assertionActual2).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticFieldValidationTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_FIELD_VALIDATION_0200
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 76
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticFieldValidationTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -58, longitude: -129, altitude: 8488 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1584403200000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual3 = JSON.stringify(location);
        expect(assertionActual3).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual4 = JSON.stringify(location);
        expect(assertionActual4).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticFieldValidationTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_FIELD_VALIDATION_0300
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 77
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticFieldValidationTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -45, longitude: -100, altitude: 8601 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1584489600000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual5 = JSON.stringify(location);
        expect(assertionActual5).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual6 = JSON.stringify(location);
        expect(assertionActual6).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticFieldValidationTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_FIELD_VALIDATION_0400
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 78
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticFieldValidationTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -32, longitude: -71, altitude: 8714 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1584576000000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual7 = JSON.stringify(location);
        expect(assertionActual7).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual8 = JSON.stringify(location);
        expect(assertionActual8).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticFieldValidationTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_FIELD_VALIDATION_0500
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 79
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticFieldValidationTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -19, longitude: -42, altitude: 8827 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1584662400000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual9 = JSON.stringify(location);
        expect(assertionActual9).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual10 = JSON.stringify(location);
        expect(assertionActual10).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticFieldValidationTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_FIELD_VALIDATION_0600
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 80
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticFieldValidationTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -6, longitude: -13, altitude: 8940 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1584748800000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual11 = JSON.stringify(location);
        expect(assertionActual11).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual12 = JSON.stringify(location);
        expect(assertionActual12).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticFieldValidationTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_FIELD_VALIDATION_0700
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 81
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticFieldValidationTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 7, longitude: 16, altitude: 9053 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1584835200000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual13 = JSON.stringify(location);
        expect(assertionActual13).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual14 = JSON.stringify(location);
        expect(assertionActual14).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticFieldValidationTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_FIELD_VALIDATION_0800
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 82
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticFieldValidationTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 20, longitude: 45, altitude: 9166 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1584921600000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual15 = JSON.stringify(location);
        expect(assertionActual15).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual16 = JSON.stringify(location);
        expect(assertionActual16).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticFieldValidationTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_FIELD_VALIDATION_0900
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 83
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticFieldValidationTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 33, longitude: 74, altitude: 9279 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1585008000000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual17 = JSON.stringify(location);
        expect(assertionActual17).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual18 = JSON.stringify(location);
        expect(assertionActual18).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticFieldValidationTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_FIELD_VALIDATION_1000
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 84
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticFieldValidationTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 46, longitude: 103, altitude: 9392 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1585094400000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual19 = JSON.stringify(location);
        expect(assertionActual19).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual20 = JSON.stringify(location);
        expect(assertionActual20).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticFieldValidationTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_FIELD_VALIDATION_1100
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 85
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticFieldValidationTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 59, longitude: 132, altitude: 9505 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1585180800000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual21 = JSON.stringify(location);
        expect(assertionActual21).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual22 = JSON.stringify(location);
        expect(assertionActual22).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticFieldValidationTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_FIELD_VALIDATION_1200
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 86
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticFieldValidationTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 72, longitude: 161, altitude: 9618 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1585267200000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual23 = JSON.stringify(location);
        expect(assertionActual23).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual24 = JSON.stringify(location);
        expect(assertionActual24).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticFieldValidationTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_FIELD_VALIDATION_1300
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 87
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticFieldValidationTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -76, longitude: -169, altitude: 9731 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1585353600000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual25 = JSON.stringify(location);
        expect(assertionActual25).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual26 = JSON.stringify(location);
        expect(assertionActual26).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticFieldValidationTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_FIELD_VALIDATION_1400
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 88
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticFieldValidationTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -63, longitude: -140, altitude: 9844 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1585440000000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual27 = JSON.stringify(location);
        expect(assertionActual27).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual28 = JSON.stringify(location);
        expect(assertionActual28).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticFieldValidationTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_FIELD_VALIDATION_1500
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 89
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticFieldValidationTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -50, longitude: -111, altitude: -44 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1585526400000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual29 = JSON.stringify(location);
        expect(assertionActual29).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual30 = JSON.stringify(location);
        expect(assertionActual30).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticFieldValidationTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_FIELD_VALIDATION_1600
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 90
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticFieldValidationTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -37, longitude: -82, altitude: 69 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1585612800000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual31 = JSON.stringify(location);
        expect(assertionActual31).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual32 = JSON.stringify(location);
        expect(assertionActual32).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticFieldValidationTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_FIELD_VALIDATION_1700
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 91
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticFieldValidationTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -24, longitude: -53, altitude: 182 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1585699200000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual33 = JSON.stringify(location);
        expect(assertionActual33).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual34 = JSON.stringify(location);
        expect(assertionActual34).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticFieldValidationTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_FIELD_VALIDATION_1800
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 92
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticFieldValidationTest0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -11, longitude: -24, altitude: 295 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1585785600000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual35 = JSON.stringify(location);
        expect(assertionActual35).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual36 = JSON.stringify(location);
        expect(assertionActual36).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticFieldValidationTest0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_FIELD_VALIDATION_1900
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 93
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticFieldValidationTest0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 2, longitude: 5, altitude: 408 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1585872000000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual37 = JSON.stringify(location);
        expect(assertionActual37).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual38 = JSON.stringify(location);
        expect(assertionActual38).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticFieldValidationTest0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_FIELD_VALIDATION_2000
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 94
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticFieldValidationTest0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 15, longitude: 34, altitude: 521 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1585958400000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual39 = JSON.stringify(location);
        expect(assertionActual39).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual40 = JSON.stringify(location);
        expect(assertionActual40).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticFieldValidationTest0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_FIELD_VALIDATION_2100
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 95
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticFieldValidationTest0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 28, longitude: 63, altitude: 634 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1586044800000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual41 = JSON.stringify(location);
        expect(assertionActual41).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual42 = JSON.stringify(location);
        expect(assertionActual42).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticFieldValidationTest0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_FIELD_VALIDATION_2200
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 96
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticFieldValidationTest0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 41, longitude: 92, altitude: 747 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1586131200000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual43 = JSON.stringify(location);
        expect(assertionActual43).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual44 = JSON.stringify(location);
        expect(assertionActual44).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticFieldValidationTest0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_FIELD_VALIDATION_2300
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 97
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticFieldValidationTest0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 54, longitude: 121, altitude: 860 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1586217600000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual45 = JSON.stringify(location);
        expect(assertionActual45).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual46 = JSON.stringify(location);
        expect(assertionActual46).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticFieldValidationTest0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_FIELD_VALIDATION_2400
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 98
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticFieldValidationTest0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 67, longitude: 150, altitude: 973 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1586304000000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual47 = JSON.stringify(location);
        expect(assertionActual47).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual48 = JSON.stringify(location);
        expect(assertionActual48).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticFieldValidationTest0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_FIELD_VALIDATION_2500
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 99
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticFieldValidationTest0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 80, longitude: 179, altitude: 1086 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1586390400000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual49 = JSON.stringify(location);
        expect(assertionActual49).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual50 = JSON.stringify(location);
        expect(assertionActual50).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticFieldValidationTest0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_FIELD_VALIDATION_2600
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticFieldValidationTest0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -68, longitude: -151, altitude: 1199 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1586476800000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual51 = JSON.stringify(location);
        expect(assertionActual51).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual52 = JSON.stringify(location);
        expect(assertionActual52).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticFieldValidationTest0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_FIELD_VALIDATION_2700
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 101
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticFieldValidationTest0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -55, longitude: -122, altitude: 1312 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1586563200000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual53 = JSON.stringify(location);
        expect(assertionActual53).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual54 = JSON.stringify(location);
        expect(assertionActual54).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticFieldValidationTest0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_FIELD_VALIDATION_2800
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 102
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticFieldValidationTest0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -42, longitude: -93, altitude: 1425 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1586649600000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual55 = JSON.stringify(location);
        expect(assertionActual55).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual56 = JSON.stringify(location);
        expect(assertionActual56).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticFieldValidationTest0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_FIELD_VALIDATION_2900
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 103
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticFieldValidationTest0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -29, longitude: -64, altitude: 1538 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1586736000000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual57 = JSON.stringify(location);
        expect(assertionActual57).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual58 = JSON.stringify(location);
        expect(assertionActual58).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticFieldValidationTest0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_FIELD_VALIDATION_3000
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 104
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticFieldValidationTest0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -16, longitude: -35, altitude: 1651 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1586822400000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual59 = JSON.stringify(location);
        expect(assertionActual59).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual60 = JSON.stringify(location);
        expect(assertionActual60).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticFieldValidationTest0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_FIELD_VALIDATION_3100
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 105
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticFieldValidationTest0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -3, longitude: -6, altitude: 1764 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1586908800000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual61 = JSON.stringify(location);
        expect(assertionActual61).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual62 = JSON.stringify(location);
        expect(assertionActual62).assertEqual(locationBefore);
      },
    );
  });
}
