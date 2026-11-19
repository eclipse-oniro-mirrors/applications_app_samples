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
import hilog from '@ohos.hilog';
import { CompassFixture, hasBalancedSubscriptions } from '../Shared/SharedDriver';

export default function CompassPipelinePart29(): void {
  describe('CompassPipelinePart29', () => {
    let fixture: CompassFixture;
    beforeAll(() => {
      hilog.info(0xF811, 'SensorTest', '%{public}s', 'CompassPipelinePart29 begin');
    });
    beforeEach(async () => {
      fixture = new CompassFixture();
      await new Promise<void>((resolve) => {
        setTimeout(resolve, 1);
      });
    });
    afterEach(() => {
      fixture.stop();
      expect(hasBalancedSubscriptions(fixture)).assertTrue();
      expect(fixture.sensor.unsubscriptions[0]).assertEqual(256);
      expect(fixture.layout.offEvents[0]).assertEqual('change');
      expect(fixture.layout.offCallbacks[0]).assertEqual(fixture.layout.onCallbacks[0]);
    });
    afterAll(() => {
      hilog.info(0xF811, 'SensorTest', '%{public}s', 'CompassPipelinePart29 end');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_29_0100
     * @tc.name testCompassPipelinePart29Test0001
     * @tc.desc Verify onSensor rounds yaw 68.5 to 69 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart29Test0001', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(68.5, -124, 44, 86600000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(69);
      expect(fixture.state.angleTest).assertEqual('69°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(68.5);
      expect(event.data[1]).assertEqual(-124);
      expect(event.data[2]).assertEqual(44);
      expect(event.timestamp).assertEqual(86600000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(69);
      expect(fixture.state.angleTest).assertEqual('69°');
      fixture.emit(68.5, 124, -44);
      expect(fixture.state.angle).assertEqual(69);
      expect(fixture.state.angleTest).assertEqual('69°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_29_0200
     * @tc.name testCompassPipelinePart29Test0002
     * @tc.desc Verify onSensor rounds yaw 69.5 to 70 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart29Test0002', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(69.5, -107, 57, 86800000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(70);
      expect(fixture.state.angleTest).assertEqual('70°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(69.5);
      expect(event.data[1]).assertEqual(-107);
      expect(event.data[2]).assertEqual(57);
      expect(event.timestamp).assertEqual(86800000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(70);
      expect(fixture.state.angleTest).assertEqual('70°');
      fixture.emit(69.5, 107, -57);
      expect(fixture.state.angle).assertEqual(70);
      expect(fixture.state.angleTest).assertEqual('70°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_29_0300
     * @tc.name testCompassPipelinePart29Test0003
     * @tc.desc Verify onSensor rounds yaw 70.5 to 71 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart29Test0003', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(70.5, -90, 70, 87000000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(71);
      expect(fixture.state.angleTest).assertEqual('71°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(70.5);
      expect(event.data[1]).assertEqual(-90);
      expect(event.data[2]).assertEqual(70);
      expect(event.timestamp).assertEqual(87000000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(71);
      expect(fixture.state.angleTest).assertEqual('71°');
      fixture.emit(70.5, 90, -70);
      expect(fixture.state.angle).assertEqual(71);
      expect(fixture.state.angleTest).assertEqual('71°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_29_0400
     * @tc.name testCompassPipelinePart29Test0004
     * @tc.desc Verify onSensor rounds yaw 71.5 to 72 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart29Test0004', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(71.5, -73, 83, 87200000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(72);
      expect(fixture.state.angleTest).assertEqual('72°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(71.5);
      expect(event.data[1]).assertEqual(-73);
      expect(event.data[2]).assertEqual(83);
      expect(event.timestamp).assertEqual(87200000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(72);
      expect(fixture.state.angleTest).assertEqual('72°');
      fixture.emit(71.5, 73, -83);
      expect(fixture.state.angle).assertEqual(72);
      expect(fixture.state.angleTest).assertEqual('72°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_29_0500
     * @tc.name testCompassPipelinePart29Test0005
     * @tc.desc Verify onSensor rounds yaw 72.5 to 73 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart29Test0005', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(72.5, -56, -85, 87400000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(73);
      expect(fixture.state.angleTest).assertEqual('73°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(72.5);
      expect(event.data[1]).assertEqual(-56);
      expect(event.data[2]).assertEqual(-85);
      expect(event.timestamp).assertEqual(87400000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(73);
      expect(fixture.state.angleTest).assertEqual('73°');
      fixture.emit(72.5, 56, 85);
      expect(fixture.state.angle).assertEqual(73);
      expect(fixture.state.angleTest).assertEqual('73°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_29_0600
     * @tc.name testCompassPipelinePart29Test0006
     * @tc.desc Verify onSensor rounds yaw 73.5 to 74 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart29Test0006', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(73.5, -39, -72, 87600000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(74);
      expect(fixture.state.angleTest).assertEqual('74°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(73.5);
      expect(event.data[1]).assertEqual(-39);
      expect(event.data[2]).assertEqual(-72);
      expect(event.timestamp).assertEqual(87600000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(74);
      expect(fixture.state.angleTest).assertEqual('74°');
      fixture.emit(73.5, 39, 72);
      expect(fixture.state.angle).assertEqual(74);
      expect(fixture.state.angleTest).assertEqual('74°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_29_0700
     * @tc.name testCompassPipelinePart29Test0007
     * @tc.desc Verify onSensor rounds yaw 74.5 to 75 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart29Test0007', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(74.5, -22, -59, 87800000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(75);
      expect(fixture.state.angleTest).assertEqual('75°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(74.5);
      expect(event.data[1]).assertEqual(-22);
      expect(event.data[2]).assertEqual(-59);
      expect(event.timestamp).assertEqual(87800000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(75);
      expect(fixture.state.angleTest).assertEqual('75°');
      fixture.emit(74.5, 22, 59);
      expect(fixture.state.angle).assertEqual(75);
      expect(fixture.state.angleTest).assertEqual('75°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_29_0800
     * @tc.name testCompassPipelinePart29Test0008
     * @tc.desc Verify onSensor rounds yaw 75.5 to 76 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart29Test0008', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(75.5, -5, -46, 88000000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(76);
      expect(fixture.state.angleTest).assertEqual('76°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(75.5);
      expect(event.data[1]).assertEqual(-5);
      expect(event.data[2]).assertEqual(-46);
      expect(event.timestamp).assertEqual(88000000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(76);
      expect(fixture.state.angleTest).assertEqual('76°');
      fixture.emit(75.5, 5, 46);
      expect(fixture.state.angle).assertEqual(76);
      expect(fixture.state.angleTest).assertEqual('76°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_29_0900
     * @tc.name testCompassPipelinePart29Test0009
     * @tc.desc Verify onSensor rounds yaw 76.5 to 77 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart29Test0009', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(76.5, 12, -33, 88200000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(77);
      expect(fixture.state.angleTest).assertEqual('77°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(76.5);
      expect(event.data[1]).assertEqual(12);
      expect(event.data[2]).assertEqual(-33);
      expect(event.timestamp).assertEqual(88200000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(77);
      expect(fixture.state.angleTest).assertEqual('77°');
      fixture.emit(76.5, -12, 33);
      expect(fixture.state.angle).assertEqual(77);
      expect(fixture.state.angleTest).assertEqual('77°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_29_1000
     * @tc.name testCompassPipelinePart29Test0010
     * @tc.desc Verify onSensor rounds yaw 77.5 to 78 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart29Test0010', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(77.5, 29, -20, 88400000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(78);
      expect(fixture.state.angleTest).assertEqual('78°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(77.5);
      expect(event.data[1]).assertEqual(29);
      expect(event.data[2]).assertEqual(-20);
      expect(event.timestamp).assertEqual(88400000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(78);
      expect(fixture.state.angleTest).assertEqual('78°');
      fixture.emit(77.5, -29, 20);
      expect(fixture.state.angle).assertEqual(78);
      expect(fixture.state.angleTest).assertEqual('78°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_29_1100
     * @tc.name testCompassPipelinePart29Test0011
     * @tc.desc Verify onSensor rounds yaw 78.5 to 79 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart29Test0011', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(78.5, 46, -7, 88600000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(79);
      expect(fixture.state.angleTest).assertEqual('79°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(78.5);
      expect(event.data[1]).assertEqual(46);
      expect(event.data[2]).assertEqual(-7);
      expect(event.timestamp).assertEqual(88600000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(79);
      expect(fixture.state.angleTest).assertEqual('79°');
      fixture.emit(78.5, -46, 7);
      expect(fixture.state.angle).assertEqual(79);
      expect(fixture.state.angleTest).assertEqual('79°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_29_1200
     * @tc.name testCompassPipelinePart29Test0012
     * @tc.desc Verify onSensor rounds yaw 79.5 to 80 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart29Test0012', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(79.5, 63, 6, 88800000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(80);
      expect(fixture.state.angleTest).assertEqual('80°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(79.5);
      expect(event.data[1]).assertEqual(63);
      expect(event.data[2]).assertEqual(6);
      expect(event.timestamp).assertEqual(88800000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(80);
      expect(fixture.state.angleTest).assertEqual('80°');
      fixture.emit(79.5, -63, -6);
      expect(fixture.state.angle).assertEqual(80);
      expect(fixture.state.angleTest).assertEqual('80°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_29_1300
     * @tc.name testCompassPipelinePart29Test0013
     * @tc.desc Verify onSensor rounds yaw 80.5 to 81 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart29Test0013', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(80.5, 80, 19, 89000000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(81);
      expect(fixture.state.angleTest).assertEqual('81°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(80.5);
      expect(event.data[1]).assertEqual(80);
      expect(event.data[2]).assertEqual(19);
      expect(event.timestamp).assertEqual(89000000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(81);
      expect(fixture.state.angleTest).assertEqual('81°');
      fixture.emit(80.5, -80, -19);
      expect(fixture.state.angle).assertEqual(81);
      expect(fixture.state.angleTest).assertEqual('81°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_29_1400
     * @tc.name testCompassPipelinePart29Test0014
     * @tc.desc Verify onSensor rounds yaw 81.5 to 82 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart29Test0014', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(81.5, 97, 32, 89200000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(82);
      expect(fixture.state.angleTest).assertEqual('82°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(81.5);
      expect(event.data[1]).assertEqual(97);
      expect(event.data[2]).assertEqual(32);
      expect(event.timestamp).assertEqual(89200000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(82);
      expect(fixture.state.angleTest).assertEqual('82°');
      fixture.emit(81.5, -97, -32);
      expect(fixture.state.angle).assertEqual(82);
      expect(fixture.state.angleTest).assertEqual('82°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_29_1500
     * @tc.name testCompassPipelinePart29Test0015
     * @tc.desc Verify onSensor rounds yaw 82.5 to 83 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart29Test0015', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(82.5, 114, 45, 89400000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(83);
      expect(fixture.state.angleTest).assertEqual('83°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(82.5);
      expect(event.data[1]).assertEqual(114);
      expect(event.data[2]).assertEqual(45);
      expect(event.timestamp).assertEqual(89400000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(83);
      expect(fixture.state.angleTest).assertEqual('83°');
      fixture.emit(82.5, -114, -45);
      expect(fixture.state.angle).assertEqual(83);
      expect(fixture.state.angleTest).assertEqual('83°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_29_1600
     * @tc.name testCompassPipelinePart29Test0016
     * @tc.desc Verify onSensor rounds yaw 83.5 to 84 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart29Test0016', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(83.5, 131, 58, 89600000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(84);
      expect(fixture.state.angleTest).assertEqual('84°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(83.5);
      expect(event.data[1]).assertEqual(131);
      expect(event.data[2]).assertEqual(58);
      expect(event.timestamp).assertEqual(89600000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(84);
      expect(fixture.state.angleTest).assertEqual('84°');
      fixture.emit(83.5, -131, -58);
      expect(fixture.state.angle).assertEqual(84);
      expect(fixture.state.angleTest).assertEqual('84°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_29_1700
     * @tc.name testCompassPipelinePart29Test0017
     * @tc.desc Verify onSensor rounds yaw 84.5 to 85 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart29Test0017', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(84.5, 148, 71, 89800000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(85);
      expect(fixture.state.angleTest).assertEqual('85°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(84.5);
      expect(event.data[1]).assertEqual(148);
      expect(event.data[2]).assertEqual(71);
      expect(event.timestamp).assertEqual(89800000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(85);
      expect(fixture.state.angleTest).assertEqual('85°');
      fixture.emit(84.5, -148, -71);
      expect(fixture.state.angle).assertEqual(85);
      expect(fixture.state.angleTest).assertEqual('85°');
      expect(fixture.state.isLand).assertEqual(false);
    });

  });
}
