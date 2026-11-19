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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import {
  launchSensorApp,
  clearSensorResults,
  readComponentText,
  clickComponent,
  waitForText,
  requireComponent,
  assertNear,
  assertArrayNear,
  assertRotationMatrix,
  assertGeomagneticResponse,
  waitForTextPrefix,
  assertSensorInventory,
  sensorInventoryKeys,
  assertSensorMetadata,
  getDriver,
  findComponentsByType,
  runSerializedUiOperation,
  delay,
  UI_TIMEOUT,
} from './Shared/SharedDriver';

export default function sensorSampleTest(): void {
  describe('SensorSamplePage', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await launchSensorApp();
      await clearSensorResults();
    });
    afterEach(async () => {
      await clearSensorResults();
    });
    afterAll(() => {});

    /**
     * @tc.name testSensorPageAltitude0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SAMPLE_0100
     * @tc.desc Verify altitude button wiring, reset, and independent SDK results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorPageAltitude0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const assertionActual1 = await readComponentText('sensorApiText');
      expect(assertionActual1).assertEqual('');
      const button = await requireComponent('getDeviceAltitudeId');
      const assertionActual2 = await button.isEnabled();
      expect(assertionActual2).assertTrue();
      await clickComponent('getDeviceAltitudeId');
      await waitForText('sensorApiText', 'deviceAltitude:success');
      const result: number = await sensor.getDeviceAltitude(1013.25, 1013.25);
      assertNear(result, 0, 0.001);
      const elevated: number = await sensor.getDeviceAltitude(1013.25, 900);
      const assertionActual3 = elevated > 0;
      expect(assertionActual3).assertTrue();
      const assertionActual4 = await readComponentText('sensorApiText');
      expect(assertionActual4).assertEqual('deviceAltitude:success');
      await clearSensorResults();
      const assertionActual5 = await readComponentText('sensorApiText');
      expect(assertionActual5).assertEqual('');
    });

    /**
     * @tc.name testSensorPageInclination0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SAMPLE_0200
     * @tc.desc Verify inclination button wiring, reset, and independent SDK results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorPageInclination0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const assertionActual6 = await readComponentText('sensorApiText');
      expect(assertionActual6).assertEqual('');
      const button = await requireComponent('getInclinationId');
      const assertionActual7 = await button.isEnabled();
      expect(assertionActual7).assertTrue();
      await clickComponent('getInclinationId');
      await waitForText('sensorApiText', 'inclination:success');
      const identity: number[] = [1, 0, 0, 0, 1, 0, 0, 0, 1];
      const result: number = await sensor.getInclination(identity);
      assertNear(result, 0, 0.00001);
      const tilted: number = await sensor.getInclination([1, 0, 0, 0, 0, 1, 0, -1, 0]);
      assertNear(tilted, Math.PI / 2, 0.00001);
      const assertionActual8 = await readComponentText('sensorApiText');
      expect(assertionActual8).assertEqual('inclination:success');
      await clearSensorResults();
      const assertionActual9 = await readComponentText('sensorApiText');
      expect(assertionActual9).assertEqual('');
    });

    /**
     * @tc.name testSensorPageVariation0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SAMPLE_0300
     * @tc.desc Verify variation button wiring, reset, and independent SDK results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorPageVariation0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const assertionActual10 = await readComponentText('sensorApiText');
      expect(assertionActual10).assertEqual('');
      const button = await requireComponent('getAngleVariationId');
      const assertionActual11 = await button.isEnabled();
      expect(assertionActual11).assertTrue();
      await clickComponent('getAngleVariationId');
      await waitForText('sensorApiText', 'angleVariation:success');
      const identity: number[] = [1, 0, 0, 0, 1, 0, 0, 0, 1];
      const result: number[] = await sensor.getAngleVariation(identity, identity);
      assertArrayNear(result, [0, 0, 0], 0.00001);
      const quarterTurn: number[] = [0, -1, 0, 1, 0, 0, 0, 0, 1];
      const changed: number[] = await sensor.getAngleVariation(quarterTurn, identity);
      assertArrayNear(changed, [-Math.PI / 2, 0, 0], 0.00001);
      const assertionActual12 = await readComponentText('sensorApiText');
      expect(assertionActual12).assertEqual('angleVariation:success');
      await clearSensorResults();
      const assertionActual13 = await readComponentText('sensorApiText');
      expect(assertionActual13).assertEqual('');
    });

    /**
     * @tc.name testSensorPageRotation0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SAMPLE_0400
     * @tc.desc Verify rotation button wiring, reset, and independent SDK results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorPageRotation0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const assertionActual14 = await readComponentText('sensorApiText');
      expect(assertionActual14).assertEqual('');
      const button = await requireComponent('getRotationMatrixId');
      const assertionActual15 = await button.isEnabled();
      expect(assertionActual15).assertTrue();
      await clickComponent('getRotationMatrixId');
      await waitForText('sensorApiText', 'rotationMatrix:success');
      const result: number[] = await sensor.getRotationMatrix([0, 0, 0]);
      assertArrayNear(result, [1, 0, 0, 0, 1, 0, 0, 0, 1], 0.00001);
      assertRotationMatrix(result);
      const rotated: number[] = await sensor.getRotationMatrix([0, 0, 1, 0]);
      assertArrayNear(rotated, [-1, 0, 0, 0, -1, 0, 0, 0, 1], 0.00001);
      const assertionActual16 = await readComponentText('sensorApiText');
      expect(assertionActual16).assertEqual('rotationMatrix:success');
      await clearSensorResults();
      const assertionActual17 = await readComponentText('sensorApiText');
      expect(assertionActual17).assertEqual('');
    });

    /**
     * @tc.name testSensorPageTransform0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SAMPLE_0500
     * @tc.desc Verify transform button wiring, reset, and independent SDK results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorPageTransform0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const assertionActual18 = await readComponentText('sensorApiText');
      expect(assertionActual18).assertEqual('');
      const button = await requireComponent('transformRotationMatrixId');
      const assertionActual19 = await button.isEnabled();
      expect(assertionActual19).assertTrue();
      await clickComponent('transformRotationMatrixId');
      await waitForText('sensorApiText', 'transformRotationMatrix:success');
      const identity: number[] = [1, 0, 0, 0, 1, 0, 0, 0, 1];
      const result: number[] = await sensor.transformRotationMatrix(identity, { x: 1, y: 2 });
      assertArrayNear(result, identity, 0.00001);
      const remapped: number[] = await sensor.transformRotationMatrix(identity, { x: 2, y: 3 });
      assertArrayNear(remapped, [0, 1, 0, 0, 0, 1, 1, 0, 0], 0.00001);
      const assertionActual20 = await readComponentText('sensorApiText');
      expect(assertionActual20).assertEqual('transformRotationMatrix:success');
      await clearSensorResults();
      const assertionActual21 = await readComponentText('sensorApiText');
      expect(assertionActual21).assertEqual('');
    });

    /**
     * @tc.name testSensorPageQuaternion0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SAMPLE_0600
     * @tc.desc Verify quaternion button wiring, reset, and independent SDK results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorPageQuaternion0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const assertionActual22 = await readComponentText('sensorApiText');
      expect(assertionActual22).assertEqual('');
      const button = await requireComponent('getQuaternionId');
      const assertionActual23 = await button.isEnabled();
      expect(assertionActual23).assertTrue();
      await clickComponent('getQuaternionId');
      await waitForText('sensorApiText', 'quaternion:success');
      const result: number[] = await sensor.getQuaternion([0, 0, 0]);
      assertArrayNear(result, [1, 0, 0, 0], 0.00001);
      const rotated: number[] = await sensor.getQuaternion([0, 0, 1, 0]);
      assertArrayNear(rotated, [0, 0, 0, 1], 0.00001);
      const assertionActual24 = await readComponentText('sensorApiText');
      expect(assertionActual24).assertEqual('quaternion:success');
      await clearSensorResults();
      const assertionActual25 = await readComponentText('sensorApiText');
      expect(assertionActual25).assertEqual('');
    });

    /**
     * @tc.name testSensorPageOrientation0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SAMPLE_0700
     * @tc.desc Verify orientation button wiring, reset, and independent SDK results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorPageOrientation0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const assertionActual26 = await readComponentText('sensorApiText');
      expect(assertionActual26).assertEqual('');
      const button = await requireComponent('getOrientationId');
      const assertionActual27 = await button.isEnabled();
      expect(assertionActual27).assertTrue();
      await clickComponent('getOrientationId');
      await waitForText('sensorApiText', 'orientation:success');
      const identity: number[] = [1, 0, 0, 0, 1, 0, 0, 0, 1];
      const result: number[] = await sensor.getOrientation(identity);
      assertArrayNear(result, [0, 0, 0], 0.00001);
      const turned: number[] = [0, -1, 0, 1, 0, 0, 0, 0, 1];
      const changed: number[] = await sensor.getOrientation(turned);
      assertArrayNear(changed, [-Math.PI / 2, 0, 0], 0.00001);
      const assertionActual28 = await readComponentText('sensorApiText');
      expect(assertionActual28).assertEqual('orientation:success');
      await clearSensorResults();
      const assertionActual29 = await readComponentText('sensorApiText');
      expect(assertionActual29).assertEqual('');
    });

    /**
     * @tc.name testSensorPageFusion0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SAMPLE_0800
     * @tc.desc Verify fusion button wiring, reset, and independent SDK results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorPageFusion0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const assertionActual30 = await readComponentText('sensorApiText');
      expect(assertionActual30).assertEqual('');
      const button = await requireComponent('getRotationMatrixTwoParamId');
      const assertionActual31 = await button.isEnabled();
      expect(assertionActual31).assertTrue();
      await clickComponent('getRotationMatrixTwoParamId');
      await waitForText('sensorApiText', 'rotationMatrixTwoParam:success');
      const result: sensor.RotationMatrixResponse = await sensor.getRotationMatrix([0, 0, 9.81], [0, 35, 0]);
      assertArrayNear(result.rotation, [1, 0, 0, 0, 1, 0, 0, 0, 1], 0.00001);
      assertRotationMatrix(result.rotation);
      assertNear(await sensor.getInclination(result.inclination), 0, 0.00001);
      const assertionActual32 = await readComponentText('sensorApiText');
      expect(assertionActual32).assertEqual('rotationMatrixTwoParam:success');
      await clearSensorResults();
      const assertionActual33 = await readComponentText('sensorApiText');
      expect(assertionActual33).assertEqual('');
    });

    /**
     * @tc.name testSensorPageGeomagnetic0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SAMPLE_0900
     * @tc.desc Verify geomagnetic button wiring, reset, and independent SDK results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorPageGeomagnetic0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const assertionActual34 = await readComponentText('sensorApiText');
      expect(assertionActual34).assertEqual('');
      const button = await requireComponent('getGeomagneticInfoId');
      const assertionActual35 = await button.isEnabled();
      expect(assertionActual35).assertTrue();
      await clickComponent('getGeomagneticInfoId');
      await waitForText('sensorApiText', 'geomagneticInfo:success');
      const result: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(
        { latitude: 80, longitude: 0, altitude: 0 },
        1580486400000,
      );
      assertGeomagneticResponse(result);
      const assertionActual36 = result.totalIntensity > result.levelIntensity;
      expect(assertionActual36).assertTrue();
      const assertionActual37 = await readComponentText('sensorApiText');
      expect(assertionActual37).assertEqual('geomagneticInfo:success');
      await clearSensorResults();
      const assertionActual38 = await readComponentText('sensorApiText');
      expect(assertionActual38).assertEqual('');
    });

    /**
     * @tc.name testSensorPageAltitude0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SAMPLE_1000
     * @tc.desc Verify result replacement and reusing the altitude command after reset
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorPageAltitude0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await clickComponent('getDeviceAltitudeId');
      await waitForText('sensorApiText', 'deviceAltitude:success');
      await clickComponent('getInclinationId');
      await waitForText('sensorApiText', 'inclination:success');
      const result: number = await sensor.getDeviceAltitude(1013.25, 1013.25);
      assertNear(result, 0, 0.001);
      const elevated: number = await sensor.getDeviceAltitude(1013.25, 900);
      const assertionActual39 = elevated > 0;
      expect(assertionActual39).assertTrue();
      const assertionActual40 = await readComponentText('sensorApiText');
      expect(assertionActual40).assertEqual('inclination:success');
      await clearSensorResults();
      await waitForText('sensorApiText', '');
      await clickComponent('getDeviceAltitudeId');
      await waitForText('sensorApiText', 'deviceAltitude:success');
    });

    /**
     * @tc.name testSensorPageInclination0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SAMPLE_1100
     * @tc.desc Verify result replacement and reusing the inclination command after reset
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorPageInclination0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await clickComponent('getInclinationId');
      await waitForText('sensorApiText', 'inclination:success');
      await clickComponent('getAngleVariationId');
      await waitForText('sensorApiText', 'angleVariation:success');
      const identity: number[] = [1, 0, 0, 0, 1, 0, 0, 0, 1];
      const result: number = await sensor.getInclination(identity);
      assertNear(result, 0, 0.00001);
      const tilted: number = await sensor.getInclination([1, 0, 0, 0, 0, 1, 0, -1, 0]);
      assertNear(tilted, Math.PI / 2, 0.00001);
      const assertionActual41 = await readComponentText('sensorApiText');
      expect(assertionActual41).assertEqual('angleVariation:success');
      await clearSensorResults();
      await waitForText('sensorApiText', '');
      await clickComponent('getInclinationId');
      await waitForText('sensorApiText', 'inclination:success');
    });

    /**
     * @tc.name testSensorPageVariation0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SAMPLE_1200
     * @tc.desc Verify result replacement and reusing the variation command after reset
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorPageVariation0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await clickComponent('getAngleVariationId');
      await waitForText('sensorApiText', 'angleVariation:success');
      await clickComponent('getRotationMatrixId');
      await waitForText('sensorApiText', 'rotationMatrix:success');
      const identity: number[] = [1, 0, 0, 0, 1, 0, 0, 0, 1];
      const result: number[] = await sensor.getAngleVariation(identity, identity);
      assertArrayNear(result, [0, 0, 0], 0.00001);
      const quarterTurn: number[] = [0, -1, 0, 1, 0, 0, 0, 0, 1];
      const changed: number[] = await sensor.getAngleVariation(quarterTurn, identity);
      assertArrayNear(changed, [-Math.PI / 2, 0, 0], 0.00001);
      const assertionActual42 = await readComponentText('sensorApiText');
      expect(assertionActual42).assertEqual('rotationMatrix:success');
      await clearSensorResults();
      await waitForText('sensorApiText', '');
      await clickComponent('getAngleVariationId');
      await waitForText('sensorApiText', 'angleVariation:success');
    });

    /**
     * @tc.name testSensorPageRotation0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SAMPLE_1300
     * @tc.desc Verify result replacement and reusing the rotation command after reset
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorPageRotation0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await clickComponent('getRotationMatrixId');
      await waitForText('sensorApiText', 'rotationMatrix:success');
      await clickComponent('transformRotationMatrixId');
      await waitForText('sensorApiText', 'transformRotationMatrix:success');
      const result: number[] = await sensor.getRotationMatrix([0, 0, 0]);
      assertArrayNear(result, [1, 0, 0, 0, 1, 0, 0, 0, 1], 0.00001);
      assertRotationMatrix(result);
      const rotated: number[] = await sensor.getRotationMatrix([0, 0, 1, 0]);
      assertArrayNear(rotated, [-1, 0, 0, 0, -1, 0, 0, 0, 1], 0.00001);
      const assertionActual43 = await readComponentText('sensorApiText');
      expect(assertionActual43).assertEqual('transformRotationMatrix:success');
      await clearSensorResults();
      await waitForText('sensorApiText', '');
      await clickComponent('getRotationMatrixId');
      await waitForText('sensorApiText', 'rotationMatrix:success');
    });

    /**
     * @tc.name testSensorPageTransform0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SAMPLE_1400
     * @tc.desc Verify result replacement and reusing the transform command after reset
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorPageTransform0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await clickComponent('transformRotationMatrixId');
      await waitForText('sensorApiText', 'transformRotationMatrix:success');
      await clickComponent('getQuaternionId');
      await waitForText('sensorApiText', 'quaternion:success');
      const identity: number[] = [1, 0, 0, 0, 1, 0, 0, 0, 1];
      const result: number[] = await sensor.transformRotationMatrix(identity, { x: 1, y: 2 });
      assertArrayNear(result, identity, 0.00001);
      const remapped: number[] = await sensor.transformRotationMatrix(identity, { x: 2, y: 3 });
      assertArrayNear(remapped, [0, 1, 0, 0, 0, 1, 1, 0, 0], 0.00001);
      const assertionActual44 = await readComponentText('sensorApiText');
      expect(assertionActual44).assertEqual('quaternion:success');
      await clearSensorResults();
      await waitForText('sensorApiText', '');
      await clickComponent('transformRotationMatrixId');
      await waitForText('sensorApiText', 'transformRotationMatrix:success');
    });

    /**
     * @tc.name testSensorPageQuaternion0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SAMPLE_1500
     * @tc.desc Verify result replacement and reusing the quaternion command after reset
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorPageQuaternion0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await clickComponent('getQuaternionId');
      await waitForText('sensorApiText', 'quaternion:success');
      await clickComponent('getOrientationId');
      await waitForText('sensorApiText', 'orientation:success');
      const result: number[] = await sensor.getQuaternion([0, 0, 0]);
      assertArrayNear(result, [1, 0, 0, 0], 0.00001);
      const rotated: number[] = await sensor.getQuaternion([0, 0, 1, 0]);
      assertArrayNear(rotated, [0, 0, 0, 1], 0.00001);
      const assertionActual45 = await readComponentText('sensorApiText');
      expect(assertionActual45).assertEqual('orientation:success');
      await clearSensorResults();
      await waitForText('sensorApiText', '');
      await clickComponent('getQuaternionId');
      await waitForText('sensorApiText', 'quaternion:success');
    });

    /**
     * @tc.name testSensorPageOrientation0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SAMPLE_1600
     * @tc.desc Verify result replacement and reusing the orientation command after reset
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorPageOrientation0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await clickComponent('getOrientationId');
      await waitForText('sensorApiText', 'orientation:success');
      await clickComponent('getRotationMatrixTwoParamId');
      await waitForText('sensorApiText', 'rotationMatrixTwoParam:success');
      const identity: number[] = [1, 0, 0, 0, 1, 0, 0, 0, 1];
      const result: number[] = await sensor.getOrientation(identity);
      assertArrayNear(result, [0, 0, 0], 0.00001);
      const turned: number[] = [0, -1, 0, 1, 0, 0, 0, 0, 1];
      const changed: number[] = await sensor.getOrientation(turned);
      assertArrayNear(changed, [-Math.PI / 2, 0, 0], 0.00001);
      const assertionActual46 = await readComponentText('sensorApiText');
      expect(assertionActual46).assertEqual('rotationMatrixTwoParam:success');
      await clearSensorResults();
      await waitForText('sensorApiText', '');
      await clickComponent('getOrientationId');
      await waitForText('sensorApiText', 'orientation:success');
    });

    /**
     * @tc.name testSensorPageFusion0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SAMPLE_1700
     * @tc.desc Verify result replacement and reusing the fusion command after reset
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorPageFusion0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await clickComponent('getRotationMatrixTwoParamId');
      await waitForText('sensorApiText', 'rotationMatrixTwoParam:success');
      await clickComponent('getGeomagneticInfoId');
      await waitForText('sensorApiText', 'geomagneticInfo:success');
      const result: sensor.RotationMatrixResponse = await sensor.getRotationMatrix([0, 0, 9.81], [0, 35, 0]);
      assertArrayNear(result.rotation, [1, 0, 0, 0, 1, 0, 0, 0, 1], 0.00001);
      assertRotationMatrix(result.rotation);
      assertNear(await sensor.getInclination(result.inclination), 0, 0.00001);
      const assertionActual47 = await readComponentText('sensorApiText');
      expect(assertionActual47).assertEqual('geomagneticInfo:success');
      await clearSensorResults();
      await waitForText('sensorApiText', '');
      await clickComponent('getRotationMatrixTwoParamId');
      await waitForText('sensorApiText', 'rotationMatrixTwoParam:success');
    });

    /**
     * @tc.name testSensorPageGeomagnetic0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SAMPLE_1800
     * @tc.desc Verify result replacement and reusing the geomagnetic command after reset
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorPageGeomagnetic0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await clickComponent('getGeomagneticInfoId');
      await waitForText('sensorApiText', 'geomagneticInfo:success');
      await clickComponent('getDeviceAltitudeId');
      await waitForText('sensorApiText', 'deviceAltitude:success');
      const result: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(
        { latitude: 80, longitude: 0, altitude: 0 },
        1580486400000,
      );
      assertGeomagneticResponse(result);
      const assertionActual48 = result.totalIntensity > result.levelIntensity;
      expect(assertionActual48).assertTrue();
      const assertionActual49 = await readComponentText('sensorApiText');
      expect(assertionActual49).assertEqual('deviceAltitude:success');
      await clearSensorResults();
      await waitForText('sensorApiText', '');
      await clickComponent('getGeomagneticInfoId');
      await waitForText('sensorApiText', 'geomagneticInfo:success');
    });

    /**
     * @tc.name testSensorPageReset0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SAMPLE_1900
     * @tc.desc Verify clearing computed results is idempotent and preserves result regions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorPageReset0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await clickComponent('getQuaternionId');
      await waitForText('sensorApiText', 'quaternion:success');
      await clearSensorResults();
      await clearSensorResults();
      const assertionActual50 = await readComponentText('sensorApiText');
      expect(assertionActual50).assertEqual('');
      await requireComponent('callbackText');
      await requireComponent('deviceText');
      await requireComponent('sensor_type_selector');
      const result: number[] = await sensor.getQuaternion([0, 0, 0]);
      assertArrayNear(result, [1, 0, 0, 0], 0.00001);
    });

    /**
     * @tc.name testSensorPageControls0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SAMPLE_2000
     * @tc.desc Verify discovery, subscription, once, cancellation and status controls remain enabled
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorPageControls0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const identifiers: string[] = [
        'subscribeId',
        'subscribeUseSensorInfoParamId',
        'onceSubscribeId',
        'unSubscribeId',
        'unSubscribeUseSensorInfoParamId',
        'getSensorListByDeviceId',
        'getSingleDeviceId',
        'onSensorStatusId',
        'offSensorStatusId',
        'getSingleSensorId',
      ];
      for (let index: number = 0; index < identifiers.length; index++) {
        const control = await requireComponent(identifiers[index]);
        expect(await control.isEnabled())
          .message(identifiers[index])
          .assertTrue();
      }
      const metadata: sensor.Sensor[] = await sensor.getSensorList();
      const assertionActual51 = Array.isArray(metadata);
      expect(assertionActual51).assertTrue();
    });

    /**
     * @tc.name testSensorPageDeviceList0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SAMPLE_2100
     * @tc.desc Verify the device-discovery button displays the actual local sensor inventory
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorPageDeviceList0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const button = await requireComponent('getSensorListByDeviceId');
      const assertionActual52 = await button.isEnabled();
      expect(assertionActual52).assertTrue();
      await clickComponent('getSensorListByDeviceId');
      const output: string = await waitForTextPrefix('deviceText', 'sensorInfoList:');
      const json: string = output.substring('sensorInfoList:'.length);
      const displayed: sensor.Sensor[] = JSON.parse(json) as sensor.Sensor[];
      assertSensorInventory(displayed);
      const expected: sensor.Sensor[] = sensor.getSensorListByDeviceSync(-1);
      assertSensorInventory(expected);
      expect(sensorInventoryKeys(displayed)).assertDeepEquals(sensorInventoryKeys(expected));
      const assertionActual53 = await readComponentText('sensorApiText');
      expect(assertionActual53).assertEqual('');
      await requireComponent('sensor_type_selector');
    });

    /**
     * @tc.name testSensorPageDeviceSingle0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SAMPLE_2200
     * @tc.desc Verify device-specific single-sensor results are displayed as accelerometer metadata
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorPageDeviceSingle0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        await clickComponent('getSingleDeviceId');
        const output: string = await waitForTextPrefix('deviceText', 'sensor_test:');
        const json: string = output.substring('sensor_test:'.length);
        const displayed: sensor.Sensor[] = JSON.parse(json) as sensor.Sensor[];
        const assertionActual54 = displayed.length > 0;
        expect(assertionActual54).assertTrue();
        assertSensorInventory(displayed);
        for (let index: number = 0; index < displayed.length; index++) {
          const assertionActual55 = displayed[index].sensorId;
          expect(assertionActual55).assertEqual(sensor.SensorId.ACCELEROMETER);
        }
        const expected: sensor.Sensor[] = sensor.getSingleSensorByDeviceSync(sensor.SensorId.ACCELEROMETER, -1);
        expect(sensorInventoryKeys(displayed)).assertDeepEquals(sensorInventoryKeys(expected));
        const assertionActual56 = await readComponentText('sensorApiText');
        expect(assertionActual56).assertEqual('');
      },
    );

    /**
     * @tc.name testSensorPageSingleSensor0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SAMPLE_2300
     * @tc.desc Verify the single-sensor command and independent accelerometer lookup
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorPageSingleSensor0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const button = await requireComponent('getSingleSensorId');
        const assertionActual57 = await button.isEnabled();
        expect(assertionActual57).assertTrue();
        await clickComponent('getSingleSensorId');
        await waitForText('sensorApiText', 'singleSensor:success');
        const result: sensor.Sensor = await sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER);
        assertSensorMetadata(result);
        const assertionActual58 = result.sensorId;
        expect(assertionActual58).assertEqual(sensor.SensorId.ACCELEROMETER);
        const before: string = await readComponentText('sensorApiText');
        await launchSensorApp();
        const assertionActual59 = await readComponentText('sensorApiText');
        expect(assertionActual59).assertEqual(before);
        await clearSensorResults();
        const assertionActual60 = await readComponentText('sensorApiText');
        expect(assertionActual60).assertEqual('');
      },
    );

    /**
     * @tc.name testSensorPageSelectionCancel0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SAMPLE_2400
     * @tc.desc Verify opening and cancelling sensor selection preserves the selection and computed result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorPageSelectionCancel0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const selectionBefore: string = await readComponentText('sensor_type_selector');
        await clickComponent('getQuaternionId');
        await waitForText('sensorApiText', 'quaternion:success');
        await clickComponent('sensor_type_selector');
        try {
          let pickerCount: number = 0;
          const deadline: number = Date.now() + UI_TIMEOUT;
          while (Date.now() < deadline && pickerCount === 0) {
            const pickers = await findComponentsByType(getDriver(), 'TextPicker');
            pickerCount = pickers.length;
            if (pickerCount === 0) {
              await delay(50);
            }
          }
          expect(pickerCount > 0)
            .message('Sensor selection dialog did not open')
            .assertTrue();
        } finally {
          await runSerializedUiOperation(async () => {
            await getDriver().pressBack();
          });
        }
        const assertionActual61 = await readComponentText('sensor_type_selector');
        expect(assertionActual61).assertEqual(selectionBefore);
        const assertionActual62 = await readComponentText('sensorApiText');
        expect(assertionActual62).assertEqual('quaternion:success');
        await clearSensorResults();
        const assertionActual63 = await readComponentText('sensorApiText');
        expect(assertionActual63).assertEqual('');
      },
    );
  });
}
