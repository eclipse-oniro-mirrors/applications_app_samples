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
 * 真实工厂驱动的会话矩阵（真机）。
 *
 * 这一组用例不注入桩，直接用 hfp.createHfpAgProfile() 建实例，
 * 因此它同时验证了「会话抽象与真实类型兼容」和「真机上能拿到什么样的状态」。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { ProbeStatus, classifyErrorCode, probeStatusName } from '../../../main/ets/model/ProfileState';
import { ProfileKind } from '../../../main/ets/model/ProfileCatalog';
import { ProfileSnapshot } from '../../../main/ets/model/ProfileSnapshot';
import { ProfileSession } from '../../../main/ets/utils/ProfileSession';
import { ProfileLike } from '../../../main/ets/utils/ProfileLike';
import { createFunctionNameOf, isProfileLike, profileFactoryOf } from '../../../main/ets/utils/ProfileFactory';
import { HfpAgResult, probeHfpAg } from '../../../main/ets/utils/ProfileFeature';

export default function bluetoothProfileDeviceRealTest() {
  describe('BluetoothProfileDeviceRealTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_REAL_0001
     * @tc.name deviceReal0001
     * @tc.desc Verify the production factory returns an object shaped like the session contract.
     */
    it('deviceReal0001', 0, () => {
      const profile: ProfileLike = profileFactoryOf()();
      expect(isProfileLike(profile)).assertTrue();
      expect(profile === null).assertFalse();
      expect(createFunctionNameOf()).assertEqual('hfp.createHfpAgProfile');
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_REAL_0002
     * @tc.name deviceReal0002
     * @tc.desc Verify two factory calls both return usable profile instances.
     */
    it('deviceReal0002', 0, () => {
      const first: ProfileLike = profileFactoryOf()();
      const second: ProfileLike = profileFactoryOf()();
      expect(isProfileLike(first)).assertTrue();
      expect(isProfileLike(second)).assertTrue();
      expect(isProfileLike(null)).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_REAL_0003
     * @tc.name deviceReal0003
     * @tc.desc Verify the create function name stays stable for the hilog line the page writes.
     */
    it('deviceReal0003', 0, () => {
      expect(createFunctionNameOf()).assertEqual('hfp.createHfpAgProfile');
      expect(createFunctionNameOf().indexOf('createHfpAgProfile')).assertEqual(4);
      expect(createFunctionNameOf().length).assertEqual(22);
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_REAL_0005
     * @tc.name deviceReal0005
     * @tc.desc Verify the probe result explanation is empty unless the create call hit 801.
     */
    it('deviceReal0005', 0, () => {
      const result: HfpAgResult = probeHfpAg();
      expect(result.reason().length >= 0).assertTrue();
      if (!result.created && result.code === 801) {
        expect(result.reason().indexOf('六种设备类型') >= 0).assertTrue();
      } else {
        expect(result.reason()).assertEqual('');
      }
      expect(result.describe().indexOf('AG：')).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_REAL_0006
     * @tc.name deviceReal0006
     * @tc.desc Verify a session driven by the production factory reaches a consistent state.
     */
    it('deviceReal0006', 0, () => {
      const session: ProfileSession = new ProfileSession(profileFactoryOf(), 'realSession');
      const snapshot: ProfileSnapshot = session.ensureProfile();
      expect(snapshot.kind).assertEqual(ProfileKind.HFP);
      expect(snapshot.message.indexOf('createHfpAgProfile') >= 0).assertTrue();
      if (snapshot.status === ProbeStatus.READY) {
        expect(session.isCreated()).assertTrue();
        expect(snapshot.code).assertEqual(0);
        session.release();
        expect(session.isCreated()).assertFalse();
      } else {
        expect(session.isCreated()).assertFalse();
        expect(snapshot.code > 0).assertTrue();
        expect(snapshot.status).assertEqual(classifyErrorCode(snapshot.code));
      }
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_REAL_0008
     * @tc.name deviceReal0008
     * @tc.desc Verify the production session tolerates subscribe and release in sequence.
     */
    it('deviceReal0008', 0, () => {
      const session: ProfileSession = new ProfileSession(profileFactoryOf(), 'realSubscribe');
      const created: ProfileSnapshot = session.ensureProfile();
      expect(created.kind).assertEqual(ProfileKind.HFP);
      if (created.status === ProbeStatus.READY) {
        const subscribed: ProfileSnapshot = session.subscribe();
        expect(subscribed.subscribed).assertTrue();
        expect(session.isSubscribed()).assertTrue();
        session.release();
        expect(session.isSubscribed()).assertFalse();
      } else {
        expect(session.isCreated()).assertFalse();
        expect(created.code > 0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_REAL_0009
     * @tc.name deviceReal0009
     * @tc.desc Verify the released production session reports the released snapshot text.
     */
    it('deviceReal0009', 0, () => {
      const session: ProfileSession = new ProfileSession(profileFactoryOf(), 'realRelease');
      session.ensureProfile();
      session.release();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.IDLE);
      expect(session.getSnapshot().message).assertEqual('已释放 Profile 实例');
      expect(session.isCreated()).assertFalse();
      expect(session.getSnapshot().devices.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_REAL_0010
     * @tc.name deviceReal0010
     * @tc.desc Verify every state reported by the real session belongs to the local probe status set.
     */
    it('deviceReal0010', 0, () => {
      const session: ProfileSession = new ProfileSession(profileFactoryOf(), 'realStatusSet');
      const snapshot: ProfileSnapshot = session.ensureProfile();
      const known: boolean = snapshot.status === ProbeStatus.READY ||
        snapshot.status === ProbeStatus.PERMISSION_DENIED ||
        snapshot.status === ProbeStatus.CAPABILITY_UNSUPPORTED ||
        snapshot.status === ProbeStatus.SERVICE_STOPPED ||
        snapshot.status === ProbeStatus.BLUETOOTH_DISABLED ||
        snapshot.status === ProbeStatus.PROFILE_UNSUPPORTED ||
        snapshot.status === ProbeStatus.FAILED ||
        snapshot.status === ProbeStatus.IDLE;
      expect(known).assertTrue();
      expect(probeStatusName(snapshot.status).length > 0).assertTrue();
      expect(snapshot.code >= 0).assertTrue();
      session.release();
    });
  });
}
