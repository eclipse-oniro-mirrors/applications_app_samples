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

export default function CompassPipelinePart13(): void {
  describe('CompassPipelinePart13', () => {
    let fixture: CompassFixture;
    beforeAll(() => {
      hilog.info(0xF811, 'SensorTest', '%{public}s', 'CompassPipelinePart13 begin');
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
      hilog.info(0xF811, 'SensorTest', '%{public}s', 'CompassPipelinePart13 end');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_13_0100
     * @tc.name testCompassPipelinePart13Test0001
     * @tc.desc Verify onSensor rounds yaw 141.499 to 141 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart13Test0001', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(141.499, 51, -67, 29200000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(141);
      expect(fixture.state.angleTest).assertEqual('141°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(141.499);
      expect(event.data[1]).assertEqual(51);
      expect(event.data[2]).assertEqual(-67);
      expect(event.timestamp).assertEqual(29200000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(141);
      expect(fixture.state.angleTest).assertEqual('141°');
      fixture.emit(141.499, -51, 67);
      expect(fixture.state.angle).assertEqual(141);
      expect(fixture.state.angleTest).assertEqual('141°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_13_0200
     * @tc.name testCompassPipelinePart13Test0002
     * @tc.desc Verify onSensor rounds yaw 142.499 to 142 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart13Test0002', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(142.499, 68, -54, 29400000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(142);
      expect(fixture.state.angleTest).assertEqual('142°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(142.499);
      expect(event.data[1]).assertEqual(68);
      expect(event.data[2]).assertEqual(-54);
      expect(event.timestamp).assertEqual(29400000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(142);
      expect(fixture.state.angleTest).assertEqual('142°');
      fixture.emit(142.499, -68, 54);
      expect(fixture.state.angle).assertEqual(142);
      expect(fixture.state.angleTest).assertEqual('142°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_13_0300
     * @tc.name testCompassPipelinePart13Test0003
     * @tc.desc Verify onSensor rounds yaw 143.499 to 143 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart13Test0003', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(143.499, 85, -41, 29600000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(143);
      expect(fixture.state.angleTest).assertEqual('143°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(143.499);
      expect(event.data[1]).assertEqual(85);
      expect(event.data[2]).assertEqual(-41);
      expect(event.timestamp).assertEqual(29600000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(143);
      expect(fixture.state.angleTest).assertEqual('143°');
      fixture.emit(143.499, -85, 41);
      expect(fixture.state.angle).assertEqual(143);
      expect(fixture.state.angleTest).assertEqual('143°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_13_0400
     * @tc.name testCompassPipelinePart13Test0004
     * @tc.desc Verify onSensor rounds yaw 144.499 to 144 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart13Test0004', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(144.499, 102, -28, 29800000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(144);
      expect(fixture.state.angleTest).assertEqual('144°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(144.499);
      expect(event.data[1]).assertEqual(102);
      expect(event.data[2]).assertEqual(-28);
      expect(event.timestamp).assertEqual(29800000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(144);
      expect(fixture.state.angleTest).assertEqual('144°');
      fixture.emit(144.499, -102, 28);
      expect(fixture.state.angle).assertEqual(144);
      expect(fixture.state.angleTest).assertEqual('144°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_13_0500
     * @tc.name testCompassPipelinePart13Test0005
     * @tc.desc Verify onSensor rounds yaw 145.499 to 145 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart13Test0005', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(145.499, 119, -15, 30000000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(145);
      expect(fixture.state.angleTest).assertEqual('145°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(145.499);
      expect(event.data[1]).assertEqual(119);
      expect(event.data[2]).assertEqual(-15);
      expect(event.timestamp).assertEqual(30000000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(145);
      expect(fixture.state.angleTest).assertEqual('145°');
      fixture.emit(145.499, -119, 15);
      expect(fixture.state.angle).assertEqual(145);
      expect(fixture.state.angleTest).assertEqual('145°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_13_0600
     * @tc.name testCompassPipelinePart13Test0006
     * @tc.desc Verify onSensor rounds yaw 146.499 to 146 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart13Test0006', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(146.499, 136, -2, 30200000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(146);
      expect(fixture.state.angleTest).assertEqual('146°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(146.499);
      expect(event.data[1]).assertEqual(136);
      expect(event.data[2]).assertEqual(-2);
      expect(event.timestamp).assertEqual(30200000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(146);
      expect(fixture.state.angleTest).assertEqual('146°');
      fixture.emit(146.499, -136, 2);
      expect(fixture.state.angle).assertEqual(146);
      expect(fixture.state.angleTest).assertEqual('146°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_13_0700
     * @tc.name testCompassPipelinePart13Test0007
     * @tc.desc Verify onSensor rounds yaw 147.499 to 147 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart13Test0007', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(147.499, 153, 11, 30400000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(147);
      expect(fixture.state.angleTest).assertEqual('147°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(147.499);
      expect(event.data[1]).assertEqual(153);
      expect(event.data[2]).assertEqual(11);
      expect(event.timestamp).assertEqual(30400000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(147);
      expect(fixture.state.angleTest).assertEqual('147°');
      fixture.emit(147.499, -153, -11);
      expect(fixture.state.angle).assertEqual(147);
      expect(fixture.state.angleTest).assertEqual('147°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_13_0800
     * @tc.name testCompassPipelinePart13Test0008
     * @tc.desc Verify onSensor rounds yaw 148.499 to 148 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart13Test0008', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(148.499, 170, 24, 30600000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(148);
      expect(fixture.state.angleTest).assertEqual('148°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(148.499);
      expect(event.data[1]).assertEqual(170);
      expect(event.data[2]).assertEqual(24);
      expect(event.timestamp).assertEqual(30600000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(148);
      expect(fixture.state.angleTest).assertEqual('148°');
      fixture.emit(148.499, -170, -24);
      expect(fixture.state.angle).assertEqual(148);
      expect(fixture.state.angleTest).assertEqual('148°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_13_0900
     * @tc.name testCompassPipelinePart13Test0009
     * @tc.desc Verify onSensor rounds yaw 149.499 to 149 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart13Test0009', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(149.499, -174, 37, 30800000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(149);
      expect(fixture.state.angleTest).assertEqual('149°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(149.499);
      expect(event.data[1]).assertEqual(-174);
      expect(event.data[2]).assertEqual(37);
      expect(event.timestamp).assertEqual(30800000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(149);
      expect(fixture.state.angleTest).assertEqual('149°');
      fixture.emit(149.499, 174, -37);
      expect(fixture.state.angle).assertEqual(149);
      expect(fixture.state.angleTest).assertEqual('149°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_13_1000
     * @tc.name testCompassPipelinePart13Test0010
     * @tc.desc Verify onSensor rounds yaw 150.499 to 150 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart13Test0010', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(150.499, -157, 50, 31000000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(150);
      expect(fixture.state.angleTest).assertEqual('150°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(150.499);
      expect(event.data[1]).assertEqual(-157);
      expect(event.data[2]).assertEqual(50);
      expect(event.timestamp).assertEqual(31000000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(150);
      expect(fixture.state.angleTest).assertEqual('150°');
      fixture.emit(150.499, 157, -50);
      expect(fixture.state.angle).assertEqual(150);
      expect(fixture.state.angleTest).assertEqual('150°');
      expect(fixture.state.isLand).assertEqual(false);
    });

  });
}
