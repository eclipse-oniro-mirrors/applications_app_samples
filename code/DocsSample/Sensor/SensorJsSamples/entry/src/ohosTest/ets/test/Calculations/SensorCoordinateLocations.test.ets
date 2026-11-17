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

export default function sensorCoordinateLocationsTest(): void {
  describe('SensorCoordinateLocations', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorCoordinateLocationsTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_LOCATIONS_0100
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateLocationsTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -67, longitude: -150, altitude: 13 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1577923200000;
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
     * @tc.name testSensorCoordinateLocationsTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_LOCATIONS_0200
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateLocationsTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -54, longitude: -121, altitude: 126 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1578009600000;
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
     * @tc.name testSensorCoordinateLocationsTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_LOCATIONS_0300
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateLocationsTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -41, longitude: -92, altitude: 239 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1578096000000;
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
     * @tc.name testSensorCoordinateLocationsTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_LOCATIONS_0400
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateLocationsTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -28, longitude: -63, altitude: 352 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1578182400000;
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
     * @tc.name testSensorCoordinateLocationsTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_LOCATIONS_0500
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateLocationsTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -15, longitude: -34, altitude: 465 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1578268800000;
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
     * @tc.name testSensorCoordinateLocationsTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_LOCATIONS_0600
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateLocationsTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -2, longitude: -5, altitude: 578 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1578355200000;
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
     * @tc.name testSensorCoordinateLocationsTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_LOCATIONS_0700
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateLocationsTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 11, longitude: 24, altitude: 691 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1578441600000;
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
     * @tc.name testSensorCoordinateLocationsTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_LOCATIONS_0800
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateLocationsTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 24, longitude: 53, altitude: 804 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1578528000000;
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
     * @tc.name testSensorCoordinateLocationsTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_LOCATIONS_0900
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateLocationsTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 37, longitude: 82, altitude: 917 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1578614400000;
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
     * @tc.name testSensorCoordinateLocationsTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_LOCATIONS_1000
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateLocationsTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 50, longitude: 111, altitude: 1030 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1578700800000;
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
     * @tc.name testSensorCoordinateLocationsTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_LOCATIONS_1100
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 11
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateLocationsTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 63, longitude: 140, altitude: 1143 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1578787200000;
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
     * @tc.name testSensorCoordinateLocationsTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_LOCATIONS_1200
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateLocationsTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 76, longitude: 169, altitude: 1256 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1578873600000;
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
     * @tc.name testSensorCoordinateLocationsTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_LOCATIONS_1300
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 13
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateLocationsTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -72, longitude: -161, altitude: 1369 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1578960000000;
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
     * @tc.name testSensorCoordinateLocationsTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_LOCATIONS_1400
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 14
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateLocationsTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -59, longitude: -132, altitude: 1482 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1579046400000;
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
     * @tc.name testSensorCoordinateLocationsTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_LOCATIONS_1500
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateLocationsTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -46, longitude: -103, altitude: 1595 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1579132800000;
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
     * @tc.name testSensorCoordinateLocationsTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_LOCATIONS_1600
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateLocationsTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -33, longitude: -74, altitude: 1708 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1579219200000;
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
     * @tc.name testSensorCoordinateLocationsTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_LOCATIONS_1700
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 17
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateLocationsTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -20, longitude: -45, altitude: 1821 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1579305600000;
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
     * @tc.name testSensorCoordinateLocationsTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_LOCATIONS_1800
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 18
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateLocationsTest0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -7, longitude: -16, altitude: 1934 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1579392000000;
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
     * @tc.name testSensorCoordinateLocationsTest0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_LOCATIONS_1900
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 19
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateLocationsTest0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 6, longitude: 13, altitude: 2047 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1579478400000;
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
     * @tc.name testSensorCoordinateLocationsTest0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_LOCATIONS_2000
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateLocationsTest0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 19, longitude: 42, altitude: 2160 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1579564800000;
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
     * @tc.name testSensorCoordinateLocationsTest0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_LOCATIONS_2100
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 21
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateLocationsTest0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 32, longitude: 71, altitude: 2273 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1579651200000;
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
     * @tc.name testSensorCoordinateLocationsTest0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_LOCATIONS_2200
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 22
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateLocationsTest0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 45, longitude: 100, altitude: 2386 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1579737600000;
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
     * @tc.name testSensorCoordinateLocationsTest0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_LOCATIONS_2300
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 23
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinateLocationsTest0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 58, longitude: 129, altitude: 2499 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1579824000000;
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
  });
}
