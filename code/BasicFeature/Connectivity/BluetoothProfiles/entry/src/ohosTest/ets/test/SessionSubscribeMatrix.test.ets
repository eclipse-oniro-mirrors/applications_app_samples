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
 * 订阅与取消订阅的矩阵。
 *
 * 除了成功路径，还覆盖订阅抛错后状态必须保持「未订阅」、取消订阅抛错后必须保持「已订阅」，
 * 这两条是页面按钮文案（订阅 / 取消订阅）与真实链路是否一致的关键。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { ProfileSession } from '../../../main/ets/utils/ProfileSession';
import { ProfileSnapshot } from '../../../main/ets/model/ProfileSnapshot';
import { ProbeStatus } from '../../../main/ets/model/ProfileState';
import { ProfileStub, stubFactoryOf } from './support/ProfileStub';

export default function bluetoothProfileSessionSubscribeTest() {
  describe('BluetoothProfileSessionSubscribeTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_SUBSCRIBE_0001
     * @tc.name sessionSubscribe0001
     * @tc.desc Verify subscribe installs one listener and flips the subscription flag.
     */
    it('sessionSubscribe0001', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'subscribeBasic');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.subscribe();
      expect(snapshot.subscribed).assertTrue();
      expect(session.isSubscribed()).assertTrue();
      expect(stub.onCalls).assertEqual(1);
      expect(stub.hasListener()).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_SUBSCRIBE_0002
     * @tc.name sessionSubscribe0002
     * @tc.desc Verify a repeated subscribe does not install a second listener.
     */
    it('sessionSubscribe0002', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'subscribeRepeat');
      session.ensureProfile();
      session.subscribe();
      session.subscribe();
      session.subscribe();
      expect(stub.onCalls).assertEqual(1);
      expect(session.isSubscribed()).assertTrue();
      expect(session.getSnapshot().subscribed).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_SUBSCRIBE_0003
     * @tc.name sessionSubscribe0003
     * @tc.desc Verify unsubscribe removes the listener and clears the subscription flag.
     */
    it('sessionSubscribe0003', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'unsubscribeBasic');
      session.ensureProfile();
      session.subscribe();
      const snapshot: ProfileSnapshot = session.unsubscribe();
      expect(snapshot.subscribed).assertFalse();
      expect(session.isSubscribed()).assertFalse();
      expect(stub.offCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_SUBSCRIBE_0004
     * @tc.name sessionSubscribe0004
     * @tc.desc Verify unsubscribe without a previous subscribe never touches the profile.
     */
    it('sessionSubscribe0004', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'unsubscribeIdle');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.unsubscribe();
      expect(snapshot.subscribed).assertFalse();
      expect(stub.offCalls).assertEqual(0);
      expect(session.isSubscribed()).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_SUBSCRIBE_0005
     * @tc.name sessionSubscribe0005
     * @tc.desc Verify unsubscribe on a never created session stays silent and keeps the snapshot idle.
     */
    it('sessionSubscribe0005', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'unsubscribeFresh');
      const snapshot: ProfileSnapshot = session.unsubscribe();
      expect(snapshot.status).assertEqual(ProbeStatus.IDLE);
      expect(stub.offCalls).assertEqual(0);
      expect(session.isCreated()).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_SUBSCRIBE_0006
     * @tc.name sessionSubscribe0006
     * @tc.desc Verify subscribe on a fresh session creates the instance first and then listens.
     */
    it('sessionSubscribe0006', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'subscribeLazy');
      const snapshot: ProfileSnapshot = session.subscribe();
      expect(snapshot.status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertTrue();
      expect(stub.onCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_SUBSCRIBE_0007
     * @tc.name sessionSubscribe0007
     * @tc.desc Verify the subscribe then unsubscribe cycle can be repeated many times.
     */
    it('sessionSubscribe0007', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'subscribeCycle');
      session.ensureProfile();
      session.subscribe();
      session.unsubscribe();
      session.subscribe();
      session.unsubscribe();
      expect(stub.onCalls).assertEqual(2);
      expect(stub.offCalls).assertEqual(2);
      expect(session.isSubscribed()).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_SUBSCRIBE_0008
     * @tc.name sessionSubscribe0008
     * @tc.desc Verify the subscription flag survives a device refresh.
     */
    it('sessionSubscribe0008', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'subscribeSurvive');
      session.ensureProfile();
      session.subscribe();
      const snapshot: ProfileSnapshot = session.refreshDevices();
      expect(snapshot.subscribed).assertTrue();
      expect(snapshot.status).assertEqual(ProbeStatus.NO_DEVICE);
      expect(session.isSubscribed()).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_SUBSCRIBE_0009
     * @tc.name sessionSubscribe0009
     * @tc.desc Verify a subscribe failure with code 201 maps to PERMISSION_DENIED and stays unsubscribed.
     */
    it('sessionSubscribe0009', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.onError = 201;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'subscribeError');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.subscribe();
      expect(snapshot.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(snapshot.code).assertEqual(201);
      expect(session.isSubscribed()).assertFalse();
      expect(snapshot.message.indexOf('订阅') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_SUBSCRIBE_0010
     * @tc.name sessionSubscribe0010
     * @tc.desc Verify a subscribe failure with code 401 maps to FAILED and stays unsubscribed.
     */
    it('sessionSubscribe0010', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.onError = 401;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'subscribeError');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.subscribe();
      expect(snapshot.status).assertEqual(ProbeStatus.FAILED);
      expect(snapshot.code).assertEqual(401);
      expect(session.isSubscribed()).assertFalse();
      expect(snapshot.message.indexOf('订阅') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_SUBSCRIBE_0011
     * @tc.name sessionSubscribe0011
     * @tc.desc Verify a subscribe failure with code 801 maps to CAPABILITY_UNSUPPORTED and stays unsubscribed.
     */
    it('sessionSubscribe0011', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.onError = 801;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'subscribeError');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.subscribe();
      expect(snapshot.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(snapshot.code).assertEqual(801);
      expect(session.isSubscribed()).assertFalse();
      expect(snapshot.message.indexOf('订阅') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_SUBSCRIBE_0012
     * @tc.name sessionSubscribe0012
     * @tc.desc Verify a subscribe failure with code 2900001 maps to SERVICE_STOPPED and stays unsubscribed.
     */
    it('sessionSubscribe0012', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.onError = 2900001;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'subscribeError');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.subscribe();
      expect(snapshot.status).assertEqual(ProbeStatus.SERVICE_STOPPED);
      expect(snapshot.code).assertEqual(2900001);
      expect(session.isSubscribed()).assertFalse();
      expect(snapshot.message.indexOf('订阅') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_SUBSCRIBE_0013
     * @tc.name sessionSubscribe0013
     * @tc.desc Verify a subscribe failure with code 2900003 maps to BLUETOOTH_DISABLED and stays unsubscribed.
     */
    it('sessionSubscribe0013', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.onError = 2900003;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'subscribeError');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.subscribe();
      expect(snapshot.status).assertEqual(ProbeStatus.BLUETOOTH_DISABLED);
      expect(snapshot.code).assertEqual(2900003);
      expect(session.isSubscribed()).assertFalse();
      expect(snapshot.message.indexOf('订阅') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_SUBSCRIBE_0014
     * @tc.name sessionSubscribe0014
     * @tc.desc Verify a subscribe failure with code 2900004 maps to PROFILE_UNSUPPORTED and stays unsubscribed.
     */
    it('sessionSubscribe0014', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.onError = 2900004;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'subscribeError');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.subscribe();
      expect(snapshot.status).assertEqual(ProbeStatus.PROFILE_UNSUPPORTED);
      expect(snapshot.code).assertEqual(2900004);
      expect(session.isSubscribed()).assertFalse();
      expect(snapshot.message.indexOf('订阅') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_SUBSCRIBE_0015
     * @tc.name sessionSubscribe0015
     * @tc.desc Verify a subscribe failure with code 2900099 maps to FAILED and stays unsubscribed.
     */
    it('sessionSubscribe0015', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.onError = 2900099;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'subscribeError');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.subscribe();
      expect(snapshot.status).assertEqual(ProbeStatus.FAILED);
      expect(snapshot.code).assertEqual(2900099);
      expect(session.isSubscribed()).assertFalse();
      expect(snapshot.message.indexOf('订阅') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_SUBSCRIBE_0016
     * @tc.name sessionSubscribe0016
     * @tc.desc Verify an unsubscribe failure with code 201 maps to PERMISSION_DENIED and keeps the listener.
     */
    it('sessionSubscribe0016', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.offError = 201;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'unsubscribeError');
      session.ensureProfile();
      session.subscribe();
      const snapshot: ProfileSnapshot = session.unsubscribe();
      expect(snapshot.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(snapshot.code).assertEqual(201);
      expect(session.isSubscribed()).assertTrue();
      expect(snapshot.message.indexOf('取消订阅') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_SUBSCRIBE_0017
     * @tc.name sessionSubscribe0017
     * @tc.desc Verify an unsubscribe failure with code 401 maps to FAILED and keeps the listener.
     */
    it('sessionSubscribe0017', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.offError = 401;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'unsubscribeError');
      session.ensureProfile();
      session.subscribe();
      const snapshot: ProfileSnapshot = session.unsubscribe();
      expect(snapshot.status).assertEqual(ProbeStatus.FAILED);
      expect(snapshot.code).assertEqual(401);
      expect(session.isSubscribed()).assertTrue();
      expect(snapshot.message.indexOf('取消订阅') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_SUBSCRIBE_0018
     * @tc.name sessionSubscribe0018
     * @tc.desc Verify an unsubscribe failure with code 801 maps to CAPABILITY_UNSUPPORTED and keeps the listener.
     */
    it('sessionSubscribe0018', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.offError = 801;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'unsubscribeError');
      session.ensureProfile();
      session.subscribe();
      const snapshot: ProfileSnapshot = session.unsubscribe();
      expect(snapshot.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(snapshot.code).assertEqual(801);
      expect(session.isSubscribed()).assertTrue();
      expect(snapshot.message.indexOf('取消订阅') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_SUBSCRIBE_0019
     * @tc.name sessionSubscribe0019
     * @tc.desc Verify an unsubscribe failure with code 2900001 maps to SERVICE_STOPPED and keeps the listener.
     */
    it('sessionSubscribe0019', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.offError = 2900001;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'unsubscribeError');
      session.ensureProfile();
      session.subscribe();
      const snapshot: ProfileSnapshot = session.unsubscribe();
      expect(snapshot.status).assertEqual(ProbeStatus.SERVICE_STOPPED);
      expect(snapshot.code).assertEqual(2900001);
      expect(session.isSubscribed()).assertTrue();
      expect(snapshot.message.indexOf('取消订阅') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_SUBSCRIBE_0020
     * @tc.name sessionSubscribe0020
     * @tc.desc Verify an unsubscribe failure with code 2900003 maps to BLUETOOTH_DISABLED and keeps the listener.
     */
    it('sessionSubscribe0020', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.offError = 2900003;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'unsubscribeError');
      session.ensureProfile();
      session.subscribe();
      const snapshot: ProfileSnapshot = session.unsubscribe();
      expect(snapshot.status).assertEqual(ProbeStatus.BLUETOOTH_DISABLED);
      expect(snapshot.code).assertEqual(2900003);
      expect(session.isSubscribed()).assertTrue();
      expect(snapshot.message.indexOf('取消订阅') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_SUBSCRIBE_0021
     * @tc.name sessionSubscribe0021
     * @tc.desc Verify an unsubscribe failure with code 2900004 maps to PROFILE_UNSUPPORTED and keeps the listener.
     */
    it('sessionSubscribe0021', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.offError = 2900004;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'unsubscribeError');
      session.ensureProfile();
      session.subscribe();
      const snapshot: ProfileSnapshot = session.unsubscribe();
      expect(snapshot.status).assertEqual(ProbeStatus.PROFILE_UNSUPPORTED);
      expect(snapshot.code).assertEqual(2900004);
      expect(session.isSubscribed()).assertTrue();
      expect(snapshot.message.indexOf('取消订阅') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_SUBSCRIBE_0022
     * @tc.name sessionSubscribe0022
     * @tc.desc Verify an unsubscribe failure with code 2900099 maps to FAILED and keeps the listener.
     */
    it('sessionSubscribe0022', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.offError = 2900099;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'unsubscribeError');
      session.ensureProfile();
      session.subscribe();
      const snapshot: ProfileSnapshot = session.unsubscribe();
      expect(snapshot.status).assertEqual(ProbeStatus.FAILED);
      expect(snapshot.code).assertEqual(2900099);
      expect(session.isSubscribed()).assertTrue();
      expect(snapshot.message.indexOf('取消订阅') >= 0).assertTrue();
    });
  });
}
