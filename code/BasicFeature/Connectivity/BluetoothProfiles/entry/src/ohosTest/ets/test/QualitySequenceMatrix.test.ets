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
 * 操作序列矩阵。
 *
 * 会话的所有方法单看都简单，真正容易出问题的是顺序：先查状态再建实例、
 * 订阅中途释放、取消订阅失败后重试、两个会话共享同一个底层实例。
 * 这里把页面按钮可能的点击顺序逐条走一遍，观察状态是否仍然自洽。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { ProfileSession } from '../../../main/ets/utils/ProfileSession';
import { ProfileSnapshot } from '../../../main/ets/model/ProfileSnapshot';
import { ProbeStatus } from '../../../main/ets/model/ProfileState';
import {
  ProfileStub,
  countingFactoryOf,
  stateParam,
  stubFactoryOf
} from './support/ProfileStub';

export default function bluetoothProfileQualitySequenceTest() {
  describe('BluetoothProfileQualitySequenceTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_SEQUENCE_0001
     * @tc.name qualitySequence0001
     * @tc.desc Verify the full happy path from creation to release keeps every intermediate state.
     */
    it('qualitySequence0001', 0, () => {
      const stub: ProfileStub = new ProfileStub(['A1:B2:C3:D4:E5:F6'], 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'seqFull');
      expect(session.ensureProfile().status).assertEqual(ProbeStatus.READY);
      expect(session.refreshDevices().status).assertEqual(ProbeStatus.READY);
      expect(session.refreshState('A1:B2:C3:D4:E5:F6').currentState).assertEqual(2);
      expect(session.subscribe().subscribed).assertTrue();
      session.release();
      expect(session.isCreated()).assertFalse();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.IDLE);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_SEQUENCE_0002
     * @tc.name qualitySequence0002
     * @tc.desc Verify that state queries survive a device list that becomes empty.
     */
    it('qualitySequence0002', 0, () => {
      const stub: ProfileStub = new ProfileStub(['A1:B2:C3:D4:E5:F6'], 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'seqEmptyList');
      session.ensureProfile();
      expect(session.refreshDevices().status).assertEqual(ProbeStatus.READY);
      stub.devices = [];
      expect(session.refreshDevices().status).assertEqual(ProbeStatus.NO_DEVICE);
      expect(session.refreshState('A1:B2:C3:D4:E5:F6').currentState).assertEqual(2);
      expect(session.getSnapshot().devices.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_SEQUENCE_0003
     * @tc.name qualitySequence0003
     * @tc.desc Verify subscribe, dispatch, unsubscribe and dispatch again in that exact order.
     */
    it('qualitySequence0003', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'seqDispatch');
      session.ensureProfile();
      session.subscribe();
      expect(session.dispatchParam(stateParam('A1:B2:C3:D4:E5:F6', 1, 0)).currentState).assertEqual(1);
      session.unsubscribe();
      expect(session.dispatchParam(stateParam('A1:B2:C3:D4:E5:F6', 2, 0)).currentState).assertEqual(1);
      expect(session.isSubscribed()).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_SEQUENCE_0004
     * @tc.name qualitySequence0004
     * @tc.desc Verify a release in the middle of a session clears both the instance and the listener.
     */
    it('qualitySequence0004', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'seqReleaseMid');
      session.ensureProfile();
      session.subscribe();
      session.release();
      expect(session.isCreated()).assertFalse();
      expect(session.isSubscribed()).assertFalse();
      expect(stub.onCalls).assertEqual(1);
      expect(stub.offCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_SEQUENCE_0005
     * @tc.name qualitySequence0005
     * @tc.desc Verify a second full cycle after release starts from a clean snapshot.
     */
    it('qualitySequence0005', 0, () => {
      const stubs: ProfileStub[] = [];
      const session: ProfileSession = new ProfileSession(countingFactoryOf(stubs), 'seqSecondCycle');
      session.ensureProfile();
      session.subscribe();
      session.release();
      const snapshot: ProfileSnapshot = session.ensureProfile();
      expect(stubs.length).assertEqual(2);
      expect(snapshot.subscribed).assertFalse();
      expect(snapshot.devices.length).assertEqual(0);
      expect(snapshot.status).assertEqual(ProbeStatus.READY);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_SEQUENCE_0006
     * @tc.name qualitySequence0006
     * @tc.desc Verify an error in the middle of a session does not destroy the created instance.
     */
    it('qualitySequence0006', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'seqErrorKeepsInstance');
      session.ensureProfile();
      stub.devicesError = 2900099;
      expect(session.refreshDevices().status).assertEqual(ProbeStatus.FAILED);
      expect(session.isCreated()).assertTrue();
      stub.devicesError = 0;
      expect(session.refreshDevices().status).assertEqual(ProbeStatus.NO_DEVICE);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_SEQUENCE_0007
     * @tc.name qualitySequence0007
     * @tc.desc Verify the session recovers after an unsubscribe failure and can unsubscribe again.
     */
    it('qualitySequence0007', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'seqUnsubscribeRetry');
      session.ensureProfile();
      session.subscribe();
      stub.offError = 2900099;
      expect(session.unsubscribe().status).assertEqual(ProbeStatus.FAILED);
      stub.offError = 0;
      expect(session.unsubscribe().subscribed).assertFalse();
      expect(stub.offCalls).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_SEQUENCE_0008
     * @tc.name qualitySequence0008
     * @tc.desc Verify the device list and the connection state can be refreshed in either order.
     */
    it('qualitySequence0008', 0, () => {
      const stub: ProfileStub = new ProfileStub([], 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'seqOrderFree');
      session.ensureProfile();
      expect(session.refreshState('A1:B2:C3:D4:E5:F6').currentState).assertEqual(2);
      expect(session.refreshDevices().status).assertEqual(ProbeStatus.NO_DEVICE);
      expect(session.getSnapshot().currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(stub.stateCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_SEQUENCE_0009
     * @tc.name qualitySequence0009
     * @tc.desc Verify two sessions sharing one stub stay independent in their snapshots.
     */
    it('qualitySequence0009', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const first: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'seqTwoA');
      const second: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'seqTwoB');
      first.ensureProfile();
      first.subscribe();
      second.ensureProfile();
      expect(first.isSubscribed()).assertTrue();
      expect(second.isSubscribed()).assertFalse();
      expect(stub.onCalls).assertEqual(1);
    });
  });
}
