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

export default function sensorGeomagneticLocationsTest(): void {
  describe('SensorGeomagneticLocations', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorGeomagneticLocationsTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_LOCATIONS_0100
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 24
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticLocationsTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 71, longitude: 158, altitude: 2612 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1579910400000;
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
     * @tc.name testSensorGeomagneticLocationsTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_LOCATIONS_0200
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 25
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticLocationsTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -77, longitude: -172, altitude: 2725 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1579996800000;
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
     * @tc.name testSensorGeomagneticLocationsTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_LOCATIONS_0300
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 26
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticLocationsTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -64, longitude: -143, altitude: 2838 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1580083200000;
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
     * @tc.name testSensorGeomagneticLocationsTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_LOCATIONS_0400
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 27
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticLocationsTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -51, longitude: -114, altitude: 2951 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1580169600000;
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
     * @tc.name testSensorGeomagneticLocationsTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_LOCATIONS_0500
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 28
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticLocationsTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -38, longitude: -85, altitude: 3064 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1580256000000;
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
     * @tc.name testSensorGeomagneticLocationsTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_LOCATIONS_0600
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 29
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticLocationsTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -25, longitude: -56, altitude: 3177 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1580342400000;
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
     * @tc.name testSensorGeomagneticLocationsTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_LOCATIONS_0700
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 30
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticLocationsTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -12, longitude: -27, altitude: 3290 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1580428800000;
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
     * @tc.name testSensorGeomagneticLocationsTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_LOCATIONS_0800
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 31
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticLocationsTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 1, longitude: 2, altitude: 3403 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1580515200000;
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
     * @tc.name testSensorGeomagneticLocationsTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_LOCATIONS_0900
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 32
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticLocationsTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 14, longitude: 31, altitude: 3516 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1580601600000;
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
     * @tc.name testSensorGeomagneticLocationsTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_LOCATIONS_1000
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 33
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticLocationsTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 27, longitude: 60, altitude: 3629 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1580688000000;
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
  });
}
