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

/**
 * 连接状态回调的矩阵。
 *
 * 回调有两条入口：会话自己订阅后由系统触发，以及用例直接调用 dispatchParam 模拟；
 * 未订阅时两条入口都必须什么都不改，订阅后都必须把设备与状态写进同一份快照。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { ProfileSession } from '../../../main/ets/utils/ProfileSession';
import { ProfileSnapshot } from '../../../main/ets/model/ProfileSnapshot';
import { ProfileStub, stateParam, stubFactoryOf } from './support/ProfileStub';

export default function bluetoothProfileSessionCallbackTest() {
  describe('BluetoothProfileSessionCallbackTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CALLBACK_0001
     * @tc.name sessionCallback0001
     * @tc.desc Verify handleStateChange writes the incoming connection state 0.
     */
    it('sessionCallback0001', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'callbackCase');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.handleStateChange(stateParam('A1:B2:C3:D4:E5:F6', 0, 0));
      expect(snapshot.currentState).assertEqual(0);
      expect(snapshot.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(session.getSnapshot()).assertEqual(snapshot);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CALLBACK_0002
     * @tc.name sessionCallback0002
     * @tc.desc Verify handleStateChange writes the incoming connection state 1.
     */
    it('sessionCallback0002', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'callbackCase');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.handleStateChange(stateParam('A1:B2:C3:D4:E5:F6', 1, 0));
      expect(snapshot.currentState).assertEqual(1);
      expect(snapshot.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(session.getSnapshot()).assertEqual(snapshot);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CALLBACK_0003
     * @tc.name sessionCallback0003
     * @tc.desc Verify handleStateChange writes the incoming connection state 2.
     */
    it('sessionCallback0003', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'callbackCase');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.handleStateChange(stateParam('A1:B2:C3:D4:E5:F6', 2, 0));
      expect(snapshot.currentState).assertEqual(2);
      expect(snapshot.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(session.getSnapshot()).assertEqual(snapshot);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CALLBACK_0004
     * @tc.name sessionCallback0004
     * @tc.desc Verify handleStateChange writes the incoming connection state 3.
     */
    it('sessionCallback0004', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'callbackCase');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.handleStateChange(stateParam('A1:B2:C3:D4:E5:F6', 3, 0));
      expect(snapshot.currentState).assertEqual(3);
      expect(snapshot.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(session.getSnapshot()).assertEqual(snapshot);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CALLBACK_0005
     * @tc.name sessionCallback0005
     * @tc.desc Verify handleStateChange accepts the user action disconnect cause without changing the state.
     */
    it('sessionCallback0005', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'callbackCause');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.handleStateChange(stateParam('A1:B2:C3:D4:E5:F6', 0, 0));
      expect(snapshot.currentState).assertEqual(0);
      expect(snapshot.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(session.getSnapshot()).assertEqual(snapshot);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CALLBACK_0006
     * @tc.name sessionCallback0006
     * @tc.desc Verify handleStateChange accepts the car side disconnect cause without changing the state.
     */
    it('sessionCallback0006', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'callbackCause');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.handleStateChange(stateParam('A1:B2:C3:D4:E5:F6', 0, 3));
      expect(snapshot.currentState).assertEqual(0);
      expect(snapshot.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(session.getSnapshot()).assertEqual(snapshot);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CALLBACK_0007
     * @tc.name sessionCallback0007
     * @tc.desc Verify handleStateChange accepts the device limit disconnect cause without changing the state.
     */
    it('sessionCallback0007', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'callbackCause');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.handleStateChange(stateParam('A1:B2:C3:D4:E5:F6', 0, 4));
      expect(snapshot.currentState).assertEqual(0);
      expect(snapshot.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(session.getSnapshot()).assertEqual(snapshot);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CALLBACK_0008
     * @tc.name sessionCallback0008
     * @tc.desc Verify handleStateChange accepts the internal failure disconnect cause without changing the state.
     */
    it('sessionCallback0008', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'callbackCause');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.handleStateChange(stateParam('A1:B2:C3:D4:E5:F6', 0, 5));
      expect(snapshot.currentState).assertEqual(0);
      expect(snapshot.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(session.getSnapshot()).assertEqual(snapshot);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CALLBACK_0009
     * @tc.name sessionCallback0009
     * @tc.desc Verify handleStateChange accepts the unknown cause disconnect cause without changing the state.
     */
    it('sessionCallback0009', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'callbackCause');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.handleStateChange(stateParam('A1:B2:C3:D4:E5:F6', 0, 9));
      expect(snapshot.currentState).assertEqual(0);
      expect(snapshot.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(session.getSnapshot()).assertEqual(snapshot);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CALLBACK_0010
     * @tc.name sessionCallback0010
     * @tc.desc Verify dispatchParam does nothing when the session never subscribed.
     */
    it('sessionCallback0010', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'dispatchIdle');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.dispatchParam(stateParam('A1:B2:C3:D4:E5:F6', 2, 0));
      expect(snapshot.currentState).assertEqual(0);
      expect(snapshot.currentDeviceId).assertEqual('');
      expect(session.isSubscribed()).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CALLBACK_0011
     * @tc.name sessionCallback0011
     * @tc.desc Verify dispatchParam reaches the listener once the session subscribed.
     */
    it('sessionCallback0011', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'dispatchActive');
      session.ensureProfile();
      session.subscribe();
      const snapshot: ProfileSnapshot = session.dispatchParam(stateParam('A1:B2:C3:D4:E5:F6', 2, 0));
      expect(snapshot.currentState).assertEqual(2);
      expect(snapshot.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(session.isSubscribed()).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CALLBACK_0012
     * @tc.name sessionCallback0012
     * @tc.desc Verify dispatchParam stops working right after unsubscribe.
     */
    it('sessionCallback0012', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'dispatchStopped');
      session.ensureProfile();
      session.subscribe();
      session.unsubscribe();
      const snapshot: ProfileSnapshot = session.dispatchParam(stateParam('A1:B2:C3:D4:E5:F6', 2, 0));
      expect(snapshot.currentState).assertEqual(0);
      expect(session.isSubscribed()).assertFalse();
      expect(stub.offCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CALLBACK_0013
     * @tc.name sessionCallback0013
     * @tc.desc Verify a system callback delivered by the stub reaches the session snapshot.
     */
    it('sessionCallback0013', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'emitActive');
      session.ensureProfile();
      session.subscribe();
      expect(stub.emit(stateParam('A1:B2:C3:D4:E5:F6', 2, 0))).assertTrue();
      expect(session.getSnapshot().currentState).assertEqual(2);
      expect(session.getSnapshot().currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(stub.onCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CALLBACK_0014
     * @tc.name sessionCallback0014
     * @tc.desc Verify the stub refuses to emit after the session unsubscribed.
     */
    it('sessionCallback0014', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'emitStopped');
      session.ensureProfile();
      session.subscribe();
      session.unsubscribe();
      expect(stub.emit(stateParam('A1:B2:C3:D4:E5:F6', 2, 0))).assertFalse();
      expect(session.getSnapshot().currentState).assertEqual(0);
      expect(stub.hasListener()).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CALLBACK_0015
     * @tc.name sessionCallback0015
     * @tc.desc Verify the change callback fires for every dispatched state change.
     */
    it('sessionCallback0015', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      let calls: number = 0;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'dispatchNotify',
        (snapshot: ProfileSnapshot) => {
          calls++;
        });
      session.ensureProfile();
      session.subscribe();
      session.dispatchParam(stateParam('A1:B2:C3:D4:E5:F6', 2, 0));
      expect(calls).assertEqual(3);
      expect(session.getSnapshot().currentState).assertEqual(2);
      expect(session.getSnapshot().currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CALLBACK_0016
     * @tc.name sessionCallback0016
     * @tc.desc Verify two different devices can be tracked one after another.
     */
    it('sessionCallback0016', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'dispatchTwoDevices');
      session.ensureProfile();
      session.subscribe();
      session.dispatchParam(stateParam('A1:B2:C3:D4:E5:F6', 2, 0));
      const snapshot: ProfileSnapshot = session.dispatchParam(stateParam('A1:B2:C3:D4:E5:F7', 0, 0));
      expect(snapshot.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F7');
      expect(snapshot.currentState).assertEqual(0);
      expect(stub.emit(stateParam('A1:B2:C3:D4:E5:F6', 1, 0))).assertTrue();
    });
  });
}
