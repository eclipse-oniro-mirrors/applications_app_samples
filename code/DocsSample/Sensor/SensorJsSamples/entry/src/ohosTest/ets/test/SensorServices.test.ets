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
import { BusinessError } from '@kit.BasicServicesKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import {
  assertSensorInventory,
  sensorInventoryKeys,
  inventoryCallback,
  singleSensorCallback,
  assertSameSensor,
  assertSensorMetadata,
  captureAcceleration,
  assertAcceleration,
  delay,
  assertStatusEvent,
  assertArrayNear,
  assertGeomagneticResponse,
} from './Shared/SharedDriver';

export default function sensorServicesTest(): void {
  describe('SensorDiscoveryAndSubscriptions', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorServiceInventoryPromiseCallback0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SERVICES_0100
     * @tc.desc Compare callback and Promise sensor inventories
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorServiceInventoryPromiseCallback0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const promised: sensor.Sensor[] = await sensor.getSensorList();
        const callback: sensor.Sensor[] = await inventoryCallback();
        assertSensorInventory(promised);
        assertSensorInventory(callback);
        expect(sensorInventoryKeys(callback)).assertDeepEquals(sensorInventoryKeys(promised));
      },
    );

    /**
     * @tc.name testSensorServiceInventorySync0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SERVICES_0200
     * @tc.desc Compare synchronous and asynchronous sensor discovery
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorServiceInventorySync0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const asynchronous: sensor.Sensor[] = await sensor.getSensorList();
        const synchronous: sensor.Sensor[] = sensor.getSensorListSync();
        assertSensorInventory(synchronous);
        expect(sensorInventoryKeys(synchronous)).assertDeepEquals(sensorInventoryKeys(asynchronous));
      },
    );

    /**
     * @tc.name testSensorServiceDeviceDiscovery0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SERVICES_0300
     * @tc.desc Compare default and explicit local device sensor discovery
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorServiceDeviceDiscovery0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const implicit: sensor.Sensor[] = sensor.getSensorListByDeviceSync();
        const explicit: sensor.Sensor[] = sensor.getSensorListByDeviceSync(-1);
        assertSensorInventory(implicit);
        assertSensorInventory(explicit);
        expect(sensorInventoryKeys(implicit)).assertDeepEquals(sensorInventoryKeys(explicit));
      },
    );

    /**
     * @tc.name testSensorServiceSinglePromiseCallback0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SERVICES_0400
     * @tc.desc Compare accelerometer metadata through both asynchronous styles
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorServiceSinglePromiseCallback0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const promised: sensor.Sensor = await sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER);
        const callback: sensor.Sensor = await singleSensorCallback(sensor.SensorId.ACCELEROMETER);
        assertSameSensor(callback, promised);
        const assertionActual1 = promised.sensorId;
        expect(assertionActual1).assertEqual(sensor.SensorId.ACCELEROMETER);
      },
    );

    /**
     * @tc.name testSensorServiceSingleSync0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SERVICES_0500
     * @tc.desc Compare synchronous and Promise accelerometer lookup
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorServiceSingleSync0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const promised: sensor.Sensor = await sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER);
        const synchronous: sensor.Sensor = sensor.getSingleSensorSync(sensor.SensorId.ACCELEROMETER);
        assertSameSensor(synchronous, promised);
        const assertionActual2 = synchronous.sensorId;
        expect(assertionActual2).assertEqual(sensor.SensorId.ACCELEROMETER);
      },
    );

    /**
     * @tc.name testSensorServiceSingleDevice0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SERVICES_0600
     * @tc.desc Compare device-specific accelerometer discovery and its default device
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorServiceSingleDevice0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const implicit: sensor.Sensor[] = sensor.getSingleSensorByDeviceSync(sensor.SensorId.ACCELEROMETER);
        const explicit: sensor.Sensor[] = sensor.getSingleSensorByDeviceSync(sensor.SensorId.ACCELEROMETER, -1);
        const assertionActual3 = implicit.length > 0;
        expect(assertionActual3).assertTrue();
        assertSensorInventory(implicit);
        expect(sensorInventoryKeys(implicit)).assertDeepEquals(sensorInventoryKeys(explicit));
        for (let index: number = 0; index < implicit.length; index++) {
          const assertionActual4 = implicit[index].sensorId;
          expect(assertionActual4).assertEqual(sensor.SensorId.ACCELEROMETER);
        }
      },
    );

    /**
     * @tc.name testSensorServiceInventoryLookup0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SERVICES_0700
     * @tc.desc Verify single-sensor lookup identifies an enumerated accelerometer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorServiceInventoryLookup0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const items: sensor.Sensor[] = await sensor.getSensorList();
        const single: sensor.Sensor = await sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER);
        let found: boolean = false;
        for (let index: number = 0; index < items.length; index++) {
          if (items[index].sensorId === single.sensorId && items[index].sensorName === single.sensorName) {
            assertSameSensor(items[index], single);
            found = true;
          }
        }
        const assertionActual5 = found;
        expect(assertionActual5).message('Accelerometer is absent from the inventory').assertTrue();
      },
    );

    /**
     * @tc.name testSensorServiceAccelerationOn0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SERVICES_0800
     * @tc.desc Receive a finite timestamped accelerometer event and detach the specific callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorServiceAccelerationOn0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const response: sensor.AccelerometerResponse = await captureAcceleration(false, 200000000);
        assertAcceleration(response);
        const metadata: sensor.Sensor = await sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER);
        assertSensorMetadata(metadata);
        const assertionActual6 = metadata.sensorId;
        expect(assertionActual6).assertEqual(sensor.SensorId.ACCELEROMETER);
      },
    );

    /**
     * @tc.name testSensorServiceAccelerationOnce0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SERVICES_0900
     * @tc.desc Receive exactly one event using once and verify cancellation remains quiet
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorServiceAccelerationOnce0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const response: sensor.AccelerometerResponse = await captureAcceleration(true);
        assertAcceleration(response);
        const next: sensor.AccelerometerResponse = await captureAcceleration(true);
        assertAcceleration(next);
        const assertionActual7 = next.timestamp >= response.timestamp;
        expect(assertionActual7).assertTrue();
      },
    );

    /**
     * @tc.name testSensorServiceAccelerationOptions0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SERVICES_1000
     * @tc.desc Subscribe using the discovered sensor device and index options
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorServiceAccelerationOptions0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const metadata: sensor.Sensor = await sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER);
        const info: sensor.SensorInfoParam = {
          deviceId: metadata.deviceId ?? -1,
          sensorIndex: metadata.sensorIndex ?? 0,
        };
        const response: sensor.AccelerometerResponse = await captureAcceleration(false, 100000000, info);
        assertAcceleration(response);
        expect(response.timestamp).assertLarger(0);
      },
    );

    /**
     * @tc.name testSensorServiceAccelerationResubscribe0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SERVICES_1100
     * @tc.desc Resume delivery after cancelling a previous accelerometer listener
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorServiceAccelerationResubscribe0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const first: sensor.AccelerometerResponse = await captureAcceleration(false, 100000000);
        const second: sensor.AccelerometerResponse = await captureAcceleration(false, 200000000);
        assertAcceleration(first);
        assertAcceleration(second);
        const assertionActual8 = second.timestamp >= first.timestamp;
        expect(assertionActual8).assertTrue();
      },
    );

    /**
     * @tc.name testSensorServiceStatusLifecycle0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SERVICES_1200
     * @tc.desc Register and remove a specific status callback while calculation remains usable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorServiceStatusLifecycle0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const events: sensor.SensorStatusEvent[] = [];
        const listener = (event: sensor.SensorStatusEvent): void => {
          events.push(event);
        };
        try {
          sensor.on('sensorStatusChange', listener);
          const result: number[] = await sensor.getQuaternion([0, 0, 0]);
          assertArrayNear(result, [1, 0, 0, 0], 0.00001);
          await delay(100);
        } finally {
          sensor.off('sensorStatusChange', listener);
        }
        await delay(100);
        const detachedCount: number = events.length;
        await delay(100);
        const assertionActual9 = events.length;
        expect(assertionActual9).assertEqual(detachedCount);
        for (let index: number = 0; index < events.length; index++) {
          assertStatusEvent(events[index]);
        }
      },
    );

    /**
     * @tc.name testSensorServiceTransformFourByFour0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SERVICES_1300
     * @tc.desc Verify coordinate remapping preserves homogeneous matrix structure
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorServiceTransformFourByFour0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1];
        const before: string = JSON.stringify(input);
        const result: number[] = await sensor.transformRotationMatrix(input, { x: 2, y: 3 });
        assertArrayNear(result, [0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1], 0.00001);
        const assertionActual10 = JSON.stringify(input);
        expect(assertionActual10).assertEqual(before);
      },
    );

    /**
     * @tc.name testSensorServiceQuaternionEmpty0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SERVICES_1400
     * @tc.desc Reject invalid input with the documented parameter error code 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorServiceQuaternionEmpty0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        let observedCode: number = 0;
        try {
          await sensor.getQuaternion([]);
        } catch (error) {
          observedCode = (error as BusinessError).code;
        }
        const assertionActual11 = observedCode;
        expect(assertionActual11).message('Expected a parameter error with code 401').assertEqual(401);
        const recovered: number[] = await sensor.getQuaternion([0, 0, 0]);
        assertArrayNear(recovered, [1, 0, 0, 0], 0.00001);
      },
    );

    /**
     * @tc.name testSensorServiceQuaternionShort0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SERVICES_1500
     * @tc.desc Reject invalid input with the documented parameter error code 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorServiceQuaternionShort0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        let observedCode: number = 0;
        try {
          await sensor.getQuaternion([0, 1]);
        } catch (error) {
          observedCode = (error as BusinessError).code;
        }
        const assertionActual12 = observedCode;
        expect(assertionActual12).message('Expected a parameter error with code 401').assertEqual(401);
        const recovered: number[] = await sensor.getQuaternion([0, 0, 0]);
        assertArrayNear(recovered, [1, 0, 0, 0], 0.00001);
      },
    );

    /**
     * @tc.name testSensorServiceRotationShort0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SERVICES_1600
     * @tc.desc Reject invalid input with the documented parameter error code 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorServiceRotationShort0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        let observedCode: number = 0;
        try {
          await sensor.getRotationMatrix([0, 0]);
        } catch (error) {
          observedCode = (error as BusinessError).code;
        }
        const assertionActual13 = observedCode;
        expect(assertionActual13).message('Expected a parameter error with code 401').assertEqual(401);
        const recovered: number[] = await sensor.getQuaternion([0, 0, 0]);
        assertArrayNear(recovered, [1, 0, 0, 0], 0.00001);
      },
    );

    /**
     * @tc.name testSensorServiceOrientationShape0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SERVICES_1700
     * @tc.desc Reject invalid input with the documented parameter error code 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorServiceOrientationShape0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        let observedCode: number = 0;
        try {
          await sensor.getOrientation([1, 0, 0, 0, 1, 0, 0, 0]);
        } catch (error) {
          observedCode = (error as BusinessError).code;
        }
        const assertionActual14 = observedCode;
        expect(assertionActual14).message('Expected a parameter error with code 401').assertEqual(401);
        const recovered: number[] = await sensor.getQuaternion([0, 0, 0]);
        assertArrayNear(recovered, [1, 0, 0, 0], 0.00001);
      },
    );

    /**
     * @tc.name testSensorServiceInclinationShape0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SERVICES_1800
     * @tc.desc Reject invalid input with the documented parameter error code 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorServiceInclinationShape0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        let observedCode: number = 0;
        try {
          await sensor.getInclination([1, 0, 0, 0, 1, 0, 0, 0, 1, 0]);
        } catch (error) {
          observedCode = (error as BusinessError).code;
        }
        const assertionActual15 = observedCode;
        expect(assertionActual15).message('Expected a parameter error with code 401').assertEqual(401);
        const recovered: number[] = await sensor.getQuaternion([0, 0, 0]);
        assertArrayNear(recovered, [1, 0, 0, 0], 0.00001);
      },
    );

    /**
     * @tc.name testSensorServiceVariationCurrentShape0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SERVICES_1900
     * @tc.desc Reject invalid input with the documented parameter error code 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorServiceVariationCurrentShape0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        let observedCode: number = 0;
        try {
          await sensor.getAngleVariation([1, 0, 0], [1, 0, 0, 0, 1, 0, 0, 0, 1]);
        } catch (error) {
          observedCode = (error as BusinessError).code;
        }
        const assertionActual16 = observedCode;
        expect(assertionActual16).message('Expected a parameter error with code 401').assertEqual(401);
        const recovered: number[] = await sensor.getQuaternion([0, 0, 0]);
        assertArrayNear(recovered, [1, 0, 0, 0], 0.00001);
      },
    );

    /**
     * @tc.name testSensorServiceVariationPreviousShape0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SERVICES_2000
     * @tc.desc Reject invalid input with the documented parameter error code 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorServiceVariationPreviousShape0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        let observedCode: number = 0;
        try {
          await sensor.getAngleVariation([1, 0, 0, 0, 1, 0, 0, 0, 1], [1, 0, 0]);
        } catch (error) {
          observedCode = (error as BusinessError).code;
        }
        const assertionActual17 = observedCode;
        expect(assertionActual17).message('Expected a parameter error with code 401').assertEqual(401);
        const recovered: number[] = await sensor.getQuaternion([0, 0, 0]);
        assertArrayNear(recovered, [1, 0, 0, 0], 0.00001);
      },
    );

    /**
     * @tc.name testSensorServiceTransformShape0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SERVICES_2100
     * @tc.desc Reject invalid input with the documented parameter error code 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorServiceTransformShape0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        let observedCode: number = 0;
        try {
          await sensor.transformRotationMatrix([1, 0, 0], { x: 1, y: 2 });
        } catch (error) {
          observedCode = (error as BusinessError).code;
        }
        const assertionActual18 = observedCode;
        expect(assertionActual18).message('Expected a parameter error with code 401').assertEqual(401);
        const recovered: number[] = await sensor.getQuaternion([0, 0, 0]);
        assertArrayNear(recovered, [1, 0, 0, 0], 0.00001);
      },
    );

    /**
     * @tc.name testSensorServiceTransformAxisZeroX0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SERVICES_2200
     * @tc.desc Reject invalid input with the documented parameter error code 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorServiceTransformAxisZeroX0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        let observedCode: number = 0;
        try {
          await sensor.transformRotationMatrix([1, 0, 0, 0, 1, 0, 0, 0, 1], { x: 0, y: 2 });
        } catch (error) {
          observedCode = (error as BusinessError).code;
        }
        const assertionActual19 = observedCode;
        expect(assertionActual19).message('Expected a parameter error with code 401').assertEqual(401);
        const recovered: number[] = await sensor.getQuaternion([0, 0, 0]);
        assertArrayNear(recovered, [1, 0, 0, 0], 0.00001);
      },
    );

    /**
     * @tc.name testSensorServiceTransformAxisZeroY0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SERVICES_2300
     * @tc.desc Reject invalid input with the documented parameter error code 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorServiceTransformAxisZeroY0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        let observedCode: number = 0;
        try {
          await sensor.transformRotationMatrix([1, 0, 0, 0, 1, 0, 0, 0, 1], { x: 1, y: 0 });
        } catch (error) {
          observedCode = (error as BusinessError).code;
        }
        const assertionActual20 = observedCode;
        expect(assertionActual20).message('Expected a parameter error with code 401').assertEqual(401);
        const recovered: number[] = await sensor.getQuaternion([0, 0, 0]);
        assertArrayNear(recovered, [1, 0, 0, 0], 0.00001);
      },
    );

    /**
     * @tc.name testSensorServiceTransformRepeatedAxes0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SERVICES_2400
     * @tc.desc Reject invalid input with the documented parameter error code 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorServiceTransformRepeatedAxes0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        let observedCode: number = 0;
        try {
          await sensor.transformRotationMatrix([1, 0, 0, 0, 1, 0, 0, 0, 1], { x: 1, y: 129 });
        } catch (error) {
          observedCode = (error as BusinessError).code;
        }
        const assertionActual21 = observedCode;
        expect(assertionActual21).message('Expected a parameter error with code 401').assertEqual(401);
        const recovered: number[] = await sensor.getQuaternion([0, 0, 0]);
        assertArrayNear(recovered, [1, 0, 0, 0], 0.00001);
      },
    );

    /**
     * @tc.name testSensorServiceTransformNegativeAxis0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SERVICES_2500
     * @tc.desc Reject invalid input with the documented parameter error code 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorServiceTransformNegativeAxis0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        let observedCode: number = 0;
        try {
          await sensor.transformRotationMatrix([1, 0, 0, 0, 1, 0, 0, 0, 1], { x: -1, y: 2 });
        } catch (error) {
          observedCode = (error as BusinessError).code;
        }
        const assertionActual22 = observedCode;
        expect(assertionActual22).message('Expected a parameter error with code 401').assertEqual(401);
        const recovered: number[] = await sensor.getQuaternion([0, 0, 0]);
        assertArrayNear(recovered, [1, 0, 0, 0], 0.00001);
      },
    );

    /**
     * @tc.name testSensorServiceTransformReservedAxis0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SERVICES_2600
     * @tc.desc Reject invalid input with the documented parameter error code 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorServiceTransformReservedAxis0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        let observedCode: number = 0;
        try {
          await sensor.transformRotationMatrix([1, 0, 0, 0, 1, 0, 0, 0, 1], { x: 4, y: 2 });
        } catch (error) {
          observedCode = (error as BusinessError).code;
        }
        const assertionActual23 = observedCode;
        expect(assertionActual23).message('Expected a parameter error with code 401').assertEqual(401);
        const recovered: number[] = await sensor.getQuaternion([0, 0, 0]);
        assertArrayNear(recovered, [1, 0, 0, 0], 0.00001);
      },
    );

    /**
     * @tc.name testSensorServiceGeomagneticLocation0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_SERVICES_2700
     * @tc.desc Verify geographic location changes the modeled field and reverses polar dip direction
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorServiceGeomagneticLocation0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const time: number = 1580486400000;
        const north: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(
          { latitude: 80, longitude: 0, altitude: 0 },
          time,
        );
        const south: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(
          { latitude: -80, longitude: 0, altitude: 0 },
          time,
        );
        assertGeomagneticResponse(north);
        assertGeomagneticResponse(south);
        const assertionActual24 = north.z > 0;
        expect(assertionActual24).assertTrue();
        const assertionActual25 = south.z < 0;
        expect(assertionActual25).assertTrue();
        const assertionActual26 = north.geomagneticDip > 0;
        expect(assertionActual26).assertTrue();
        const assertionActual27 = south.geomagneticDip < 0;
        expect(assertionActual27).assertTrue();
        const separation: number =
          Math.abs(north.x - south.x) + Math.abs(north.y - south.y) + Math.abs(north.z - south.z);
        expect(separation > 1000)
          .message('Geographic input must affect the modeled field')
          .assertTrue();
      },
    );
  });
}
