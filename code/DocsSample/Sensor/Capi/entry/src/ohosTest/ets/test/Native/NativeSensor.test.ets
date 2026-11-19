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

import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import sensor from '@ohos.sensor';
import hilog from '@ohos.hilog';
import { GetAllSensor, SubscribeSensor, UnsubscribeSensor } from 'library';
import { SensorEvent } from '../../../../main/ets/moudle/CompassController';

export default function NativeSensor(): void {
  describe('NativeSensor', () => {
    const orientation: number = sensor.SensorType.SENSOR_TYPE_ID_ORIENTATION;
    const accelerometer: number = sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER;
    let subscribed: boolean = false;
    let activeSensorType: number = orientation;
    beforeAll(() => {
      hilog.info(0xF811, 'SensorTest', '%{public}s', 'NativeSensor validates available device hardware');
    });
    beforeEach(async () => {
      subscribed = false;
      activeSensorType = orientation;
      await Promise.resolve();
    });
    afterEach(() => {
      if (subscribed) {
        UnsubscribeSensor(activeSensorType);
        subscribed = false;
      }
    });
    afterAll(() => {
      hilog.info(0xF811, 'SensorTest', '%{public}s', 'NativeSensor end');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_NATIVE_0100
     * @tc.name testNativeSensorEnumerationTest0001
     * @tc.desc Verify native sensor metadata and consistency for sensors shared with the system API
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testNativeSensorEnumerationTest0001', 0, async (): Promise<void> => {
      const sensors = GetAllSensor();
      const isSensorArray: boolean = Array.isArray(sensors);
      expect(isSensorArray).assertTrue();
      const systemSensors: sensor.Sensor[] = await sensor.getSensorList();
      hilog.info(0xF811, 'SensorTest', 'Native count=%{public}d ArkTS count=%{public}d',
        sensors.length, systemSensors.length);
      expect(sensors.length).assertLarger(0);
      let orientationCount: number = 0;
      let sharedSensorCount: number = 0;
      for (let index: number = 0; index < sensors.length; index++) {
        const item = sensors[index];
        hilog.info(0xF811, 'SensorTest', 'Native entry=%{public}s', JSON.stringify(item));
        const nameType: string = typeof item.sensorName;
        const vendorType: string = typeof item.vendorName;
        const finiteSensorType: boolean = isFinite(item.sensorType);
        expect(nameType).assertEqual('string');
        expect(vendorType).assertEqual('string');
        expect(finiteSensorType).assertTrue();
        const nameLength: number = item.sensorName.length;
        const validSensorType: boolean = Number.isInteger(item.sensorType) && item.sensorType >= 0;
        expect(nameLength).assertLarger(0);
        expect(validSensorType).assertTrue();
        const sharedSensors: sensor.Sensor[] = systemSensors.filter((entry: sensor.Sensor): boolean => {
          return entry.sensorId === item.sensorType;
        });
        if (sharedSensors.length > 0) {
          const matchingSensors: sensor.Sensor[] = sharedSensors.filter((entry: sensor.Sensor): boolean => {
            return entry.sensorName === item.sensorName && entry.vendorName === item.vendorName;
          });
          const matchingCount: number = matchingSensors.length;
          expect(matchingCount).assertLarger(0);
          sharedSensorCount++;
        } else {
          hilog.info(0xF811, 'SensorTest', 'Native-only sensor type=%{public}d', item.sensorType);
        }
        if (item.sensorType === orientation) {
          orientationCount++;
        }
        hilog.info(0xF811, 'SensorTest', 'Enumerated sensor type=%{public}d name=%{public}s',
          item.sensorType, item.sensorName);
      }
      expect(sharedSensorCount).assertLarger(0);
      hilog.info(0xF811, 'SensorTest', 'Native sensor count=%{public}d orientation count=%{public}d',
        sensors.length, orientationCount);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_NATIVE_0200
     * @tc.name testNativeSensorCallbackTest0002
     * @tc.desc Verify real sensor callbacks, preferring orientation and falling back to accelerometer hardware
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testNativeSensorCallbackTest0002', 0, async (): Promise<void> => {
      const sensors = GetAllSensor();
      let hasOrientation: boolean = false;
      let hasAccelerometer: boolean = false;
      for (let index: number = 0; index < sensors.length; index++) {
        if (sensors[index].sensorType === orientation) {
          hasOrientation = true;
        }
        if (sensors[index].sensorType === accelerometer) {
          hasAccelerometer = true;
        }
      }
      if (!hasOrientation && !hasAccelerometer) {
        throw new Error('Native callback test requires orientation or accelerometer hardware');
      }
      activeSensorType = hasOrientation ? orientation : accelerometer;
      if (!hasOrientation) {
        hilog.warn(0xF811, 'SensorTest', '%{public}s',
          'Orientation hardware is unavailable; validating native callbacks with the accelerometer');
      }
      hilog.info(0xF811, 'SensorTest', 'Subscribing to sensor type=%{public}d', activeSensorType);
      let timer: number = -1;
      let eventCount: number = 0;
      try {
        await new Promise<void>((resolve, reject) => {
          timer = setTimeout(() => {
            reject(new Error('Sensor type ' + activeSensorType + ' produced no event within ten seconds'));
          }, 10000);
          subscribed = true;
          const result: number = SubscribeSensor(activeSensorType, 200000000, (event: SensorEvent): void => {
            try {
              const receivedSensorType: number = event.sensorType;
              expect(receivedSensorType).assertEqual(activeSensorType);
              expect(event.data.length).assertLargerOrEqual(3);
              const finiteX: boolean = isFinite(event.data[0]);
              const finiteY: boolean = isFinite(event.data[1]);
              const finiteZ: boolean = isFinite(event.data[2]);
              expect(finiteX).assertTrue();
              expect(finiteY).assertTrue();
              expect(finiteZ).assertTrue();
              if (activeSensorType === orientation) {
                expect(event.data[0]).assertLargerOrEqual(0);
                expect(event.data[0]).assertLessOrEqual(360);
              }
              eventCount++;
              resolve();
            } catch (error) {
              expect(error.name).assertEqual('Error');
              reject(error);
            }
          });
          /*
           * The bundled native implementation returns undefined on successful subscription.
           * Only a validated hardware callback resolves this test.
           */
          if (result !== undefined && result !== 0) {
            reject(new Error('SubscribeSensor for type ' + activeSensorType + ' failed with code ' + result));
          }
        });
        expect(eventCount).assertLarger(0);
      } finally {
        clearTimeout(timer);
        /*
         * Native callback delivery holds the same mutex used by unsubscribe.
         * Yield to a timer so native delivery can release its lock first.
         */
        await new Promise<void>((resolve) => setTimeout(resolve, 1));
        if (subscribed) {
          UnsubscribeSensor(activeSensorType);
          subscribed = false;
        }
      }
    });
  });
}
