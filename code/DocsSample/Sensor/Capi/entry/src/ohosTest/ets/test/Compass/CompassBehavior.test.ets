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
import { CompassFixture, activeCallbackCount, hasBalancedSubscriptions, makeFrame,
  replayFrames, replayFramesAsync, replayLayout, copySensorEvent, snapshotState } from '../Shared/SharedDriver';

export default function CompassBehavior(): void {
  describe('CompassBehavior', () => {
    let fixtures: CompassFixture[] = [];
    function createFixture(): CompassFixture {
      const fixture = new CompassFixture();
      fixtures.push(fixture);
      return fixture;
    }
    beforeAll(() => {
      hilog.info(0xF811, 'SensorTest', '%{public}s', 'CompassBehavior begin');
    });
    beforeEach(async () => {
      fixtures = [];
      await new Promise<void>((resolve) => {
        setTimeout(resolve, 1);
      });
    });
    afterEach(() => {
      for (let index: number = 0; index < fixtures.length; index++) {
        const fixture = fixtures[index];
        if (activeCallbackCount(fixture) > 0) {
          fixture.stop();
        }
        expect(activeCallbackCount(fixture)).assertEqual(0);
      }
    });
    afterAll(() => {
      hilog.info(0xF811, 'SensorTest', '%{public}s', 'CompassBehavior end');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_BEHAVIOR_0100
     * @tc.name testCompassInitialStateTest0001
     * @tc.desc Verify CompassController construction leaves the default view unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassInitialStateTest0001', 0, (): void => {
      const fixture = createFixture();
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      expect(fixture.sensor.subscriptions.length).assertEqual(0);
      expect(fixture.layout.onEvents.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_BEHAVIOR_0200
     * @tc.name testCompassSubscriptionResultTest0002
     * @tc.desc Verify start forwards the subscribe return code without changing its value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassSubscriptionResultTest0002', 0, (): void => {
      const fixture = createFixture();
      fixture.sensor.result = 401;
      expect(fixture.start()).assertEqual(401);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      expect(fixture.layout.onEvents[0]).assertEqual('change');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_BEHAVIOR_0300
     * @tc.name testCompassCallbackIdentityTest0003
     * @tc.desc Verify start and stop use the identical onLayout callback reference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassCallbackIdentityTest0003', 0, (): void => {
      const fixture = createFixture();
      fixture.start();
      expect(fixture.sensor.subscriptions[0].callback).assertEqual(fixture.controller.onSensor);
      expect(fixture.layout.onCallbacks[0]).assertEqual(fixture.controller.onLayout);
      fixture.stop();
      expect(fixture.layout.offCallbacks[0]).assertEqual(fixture.layout.onCallbacks[0]);
      expect(activeCallbackCount(fixture)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_BEHAVIOR_0400
     * @tc.name testCompassStopFailureTest0004
     * @tc.desc Verify stop removes the layout listener when unsubscribe throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassStopFailureTest0004', 0, (): void => {
      const fixture = createFixture();
      fixture.start();
      const expectedError = new Error('Injected unsubscribe failure');
      fixture.sensor.unsubscribeError = expectedError;
      let captured: Error | undefined = undefined;
      try {
        fixture.stop();
      } catch (error) {
        expect(error.name).assertEqual('Error');
        captured = error as Error;
        expect(captured.name).assertEqual('Error');
      } finally {
        fixture.sensor.unsubscribeError = undefined;
      }
      expect(captured).assertEqual(expectedError);
      expect(fixture.layout.offEvents[0]).assertEqual('change');
      expect(activeCallbackCount(fixture)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_BEHAVIOR_0500
     * @tc.name testCompassStartFailureTest0005
     * @tc.desc Verify start propagates a subscribe error and stop releases the registered layout listener
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassStartFailureTest0005', 0, (): void => {
      const fixture = createFixture();
      const expectedError = new Error('Injected subscribe failure');
      fixture.sensor.subscribeError = expectedError;
      let captured: Error | undefined = undefined;
      try {
        fixture.start();
      } catch (error) {
        expect(error.name).assertEqual('Error');
        captured = error as Error;
        expect(captured.name).assertEqual('Error');
      }
      expect(captured).assertEqual(expectedError);
      expect(fixture.sensor.subscriptions.length).assertEqual(0);
      expect(fixture.layout.onEvents.length).assertEqual(1);
      fixture.stop();
      expect(activeCallbackCount(fixture)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_BEHAVIOR_0600
     * @tc.name testCompassRestartTest0006
     * @tc.desc Verify start and stop preserve the heading and reattach callbacks across sessions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassRestartTest0006', 0, (): void => {
      const fixture = createFixture();
      fixture.start();
      fixture.emit(359.5, -180, 90);
      fixture.layout.emit(true);
      fixture.stop();
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.isLand).assertTrue();
      fixture.start();
      fixture.emit(90.49, 180, -90);
      expect(fixture.state.angle).assertEqual(90);
      expect(fixture.state.angleTest).assertEqual('90°');
      expect(fixture.sensor.subscriptions.length).assertEqual(2);
      fixture.stop();
      expect(hasBalancedSubscriptions(fixture)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_BEHAVIOR_0700
     * @tc.name testCompassMultipleViewsTest0007
     * @tc.desc Verify onSensor updates only its own CompassState instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassMultipleViewsTest0007', 0, (): void => {
      const first = createFixture();
      const second = createFixture();
      first.start();
      second.start();
      first.emit(45.5, 10, 20);
      second.emit(270.49, 30, 40);
      first.layout.emit(true);
      expect(first.state.angle).assertEqual(46);
      expect(second.state.angle).assertEqual(270);
      expect(first.state.isLand).assertTrue();
      expect(second.state.isLand).assertFalse();
      first.stop();
      second.emit(180.5, 0, 0);
      expect(first.state.angle).assertEqual(46);
      expect(second.state.angle).assertEqual(181);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_BEHAVIOR_0800
     * @tc.name testCompassNorthCrossingTest0008
     * @tc.desc Verify onSensor wraps clockwise and counterclockwise samples across north
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassNorthCrossingTest0008', 0, (): void => {
      const fixture = createFixture();
      fixture.start();
      const frames = [makeFrame(358.9, 0, 0, 1, 3), makeFrame(359.5, 0, 0, 2, 3),
        makeFrame(0.1, 0, 0, 3, 3), makeFrame(359.49, 0, 0, 4, 3)];
      const snapshots = replayFrames(fixture, frames);
      expect(snapshots.length).assertEqual(4);
      expect(snapshots[0].angle).assertEqual(359);
      expect(snapshots[1].angle).assertEqual(0);
      expect(snapshots[2].angle).assertEqual(0);
      expect(snapshots[3].angle).assertEqual(359);
      expect(snapshots[1].text).assertEqual('0°');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_BEHAVIOR_0900
     * @tc.name testCompassExactFullTurnTest0009
     * @tc.desc Verify onSensor maps an exact 360 degree heading to zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassExactFullTurnTest0009', 0, (): void => {
      const fixture = createFixture();
      fixture.start();
      fixture.emit(360, 0, 0);
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      fixture.emit(0, 0, 0);
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_BEHAVIOR_1000
     * @tc.name testCompassImmutableSnapshotTest0010
     * @tc.desc Verify onSensor does not retain or mutate the incoming event array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassImmutableSnapshotTest0010', 0, (): void => {
      const fixture = createFixture();
      fixture.start();
      const event = fixture.event(21.5, -35, 72);
      const copy = copySensorEvent(event);
      fixture.sensor.emit(event);
      event.data[0] = 200;
      expect(fixture.state.angle).assertEqual(22);
      expect(copy.data[0]).assertEqual(21.5);
      expect(copy.data[1]).assertEqual(-35);
      expect(copy.data[2]).assertEqual(72);
      const snapshot = snapshotState(fixture.state);
      fixture.emit(70.5, 0, 0);
      expect(snapshot.angle).assertEqual(22);
      expect(fixture.state.angle).assertEqual(71);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_BEHAVIOR_1100
     * @tc.name testCompassLandscapeSequenceTest0011
     * @tc.desc Verify onLayout follows the last event without resetting the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassLandscapeSequenceTest0011', 0, (): void => {
      const fixture = createFixture();
      fixture.start();
      fixture.emit(123.5, 0, 0);
      const snapshots = replayLayout(fixture, [true, true, false, true, false]);
      expect(snapshots.length).assertEqual(5);
      expect(snapshots[0].landscape).assertTrue();
      expect(snapshots[1].landscape).assertTrue();
      expect(snapshots[2].landscape).assertFalse();
      expect(snapshots[3].landscape).assertTrue();
      expect(snapshots[4].landscape).assertFalse();
      for (let index: number = 0; index < snapshots.length; index++) {
        expect(snapshots[index].angle).assertEqual(124);
        expect(snapshots[index].text).assertEqual('124°');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_BEHAVIOR_1200
     * @tc.name testCompassDeferredEventTest0012
     * @tc.desc Verify onSensor processes an awaited asynchronous sensor delivery
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassDeferredEventTest0012', 0, async (): Promise<void> => {
      const fixture = createFixture();
      fixture.start();
      const pending = fixture.emitAsync(89.5, 10, -10);
      expect(fixture.state.angle).assertEqual(0);
      await pending;
      expect(fixture.state.angle).assertEqual(90);
      expect(fixture.state.angleTest).assertEqual('90°');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_BEHAVIOR_1300
     * @tc.name testCompassAsyncSequenceTest0013
     * @tc.desc Verify onSensor preserves chronological asynchronous replay results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassAsyncSequenceTest0013', 0, async (): Promise<void> => {
      const fixture = createFixture();
      fixture.start();
      const frames = [makeFrame(0.5, 12, 13, 1, 1), makeFrame(179.5, 14, 15, 2, 2),
        makeFrame(359.5, 16, 17, 3, 3)];
      const snapshots = await replayFramesAsync(fixture, frames);
      expect(snapshots.length).assertEqual(3);
      expect(snapshots[0].angle).assertEqual(1);
      expect(snapshots[1].angle).assertEqual(180);
      expect(snapshots[2].angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_BEHAVIOR_1400
     * @tc.name testCompassConcurrentDeliveryTest0014
     * @tc.desc Verify onSensor applies queued asynchronous deliveries in dispatch order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassConcurrentDeliveryTest0014', 0, async (): Promise<void> => {
      const fixture = createFixture();
      fixture.start();
      await Promise.all([fixture.emitAsync(1.5, 0, 0), fixture.emitAsync(44.5, 0, 0),
        fixture.emitAsync(269.5, 0, 0)]);
      expect(fixture.state.angle).assertEqual(270);
      expect(fixture.state.angleTest).assertEqual('270°');
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_BEHAVIOR_1500
     * @tc.name testCompassMetadataTest0015
     * @tc.desc Verify onSensor ignores accuracy and timestamp when projecting yaw
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassMetadataTest0015', 0, (): void => {
      const fixture = createFixture();
      fixture.start();
      for (let accuracy: number = 0; accuracy <= 3; accuracy++) {
        fixture.sensor.emit(fixture.event(234.5, 0, 0, 9000000000 - accuracy, accuracy));
        expect(fixture.state.angle).assertEqual(235);
        expect(fixture.state.angleTest).assertEqual('235°');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_BEHAVIOR_1600
     * @tc.name testCompassSubscriptionCyclesTest0016
     * @tc.desc Verify start and stop balance registrations across twenty page lifecycles
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassSubscriptionCyclesTest0016', 0, (): void => {
      const fixture = createFixture();
      for (let cycle: number = 0; cycle < 20; cycle++) {
        fixture.start();
        fixture.emit(cycle, 0, 0);
        expect(fixture.state.angle).assertEqual(cycle);
        fixture.stop();
        expect(hasBalancedSubscriptions(fixture)).assertTrue();
        expect(fixture.sensor.subscriptions.length).assertEqual(cycle + 1);
      }
    });

  });
}
