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
 * 会话释放阶段的矩阵。
 *
 * 释放要保证三件事：先取消订阅避免回调打到已销毁的页面、实例引用被丢弃、快照回到未探测；
 * 另外覆盖「取消订阅本身抛错时释放仍然完成」这条容错分支。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { ProfileSession } from '../../../main/ets/utils/ProfileSession';
import { ProfileSnapshot } from '../../../main/ets/model/ProfileSnapshot';
import { ProbeStatus } from '../../../main/ets/model/ProfileState';
import { ProfileStub, countingFactoryOf, stubFactoryOf } from './support/ProfileStub';

export default function bluetoothProfileSessionReleaseTest() {
  describe('BluetoothProfileSessionReleaseTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_RELEASE_0001
     * @tc.name sessionRelease0001
     * @tc.desc Verify release drops the instance and returns the snapshot to idle.
     */
    it('sessionRelease0001', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'releaseBasic');
      session.ensureProfile();
      session.release();
      expect(session.isCreated()).assertFalse();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.IDLE);
      expect(session.getSnapshot().message).assertEqual('已释放 Profile 实例');
      expect(session.isSubscribed()).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_RELEASE_0002
     * @tc.name sessionRelease0002
     * @tc.desc Verify release unsubscribes before dropping the instance when a listener exists.
     */
    it('sessionRelease0002', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'releaseUnsubscribe');
      session.ensureProfile();
      session.subscribe();
      session.release();
      expect(stub.offCalls).assertEqual(1);
      expect(stub.hasListener()).assertFalse();
      expect(session.getSnapshot().subscribed).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_RELEASE_0003
     * @tc.name sessionRelease0003
     * @tc.desc Verify release without a listener never calls off on the profile.
     */
    it('sessionRelease0003', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'releaseNoListener');
      session.ensureProfile();
      session.release();
      expect(stub.offCalls).assertEqual(0);
      expect(session.isCreated()).assertFalse();
      expect(session.getSnapshot().subscribed).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_RELEASE_0004
     * @tc.name sessionRelease0004
     * @tc.desc Verify a released session can create a fresh instance again.
     */
    it('sessionRelease0004', 0, () => {
      const stubs: ProfileStub[] = [];
      const session: ProfileSession = new ProfileSession(countingFactoryOf(stubs), 'releaseRecreate');
      session.ensureProfile();
      session.release();
      session.ensureProfile();
      expect(stubs.length).assertEqual(2);
      expect(session.isCreated()).assertTrue();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_RELEASE_0005
     * @tc.name sessionRelease0005
     * @tc.desc Verify release tolerates an off failure and still frees the instance.
     */
    it('sessionRelease0005', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.offError = 2900099;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'releaseOffError');
      session.ensureProfile();
      session.subscribe();
      session.release();
      expect(session.isCreated()).assertFalse();
      expect(session.isSubscribed()).assertFalse();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.IDLE);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_RELEASE_0006
     * @tc.name sessionRelease0006
     * @tc.desc Verify a second release on an already released session is a no-op.
     */
    it('sessionRelease0006', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'releaseTwice');
      session.ensureProfile();
      session.release();
      session.release();
      expect(stub.offCalls).assertEqual(0);
      expect(session.isCreated()).assertFalse();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.IDLE);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_RELEASE_0007
     * @tc.name sessionRelease0007
     * @tc.desc Verify release notifies the page callback so the view can clear stale rows.
     */
    it('sessionRelease0007', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      let calls: number = 0;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'releaseNotify',
        (snapshot: ProfileSnapshot) => {
          calls++;
        });
      session.ensureProfile();
      session.release();
      expect(calls).assertEqual(2);
      expect(session.isCreated()).assertFalse();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.IDLE);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_RELEASE_0008
     * @tc.name sessionRelease0008
     * @tc.desc Verify release on a never created session still reports the released state.
     */
    it('sessionRelease0008', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'releaseFresh');
      session.release();
      expect(session.isCreated()).assertFalse();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.IDLE);
      expect(stub.offCalls).assertEqual(0);
    });
  });
}
