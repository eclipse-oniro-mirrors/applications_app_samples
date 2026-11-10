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
 * 会话创建阶段的矩阵。
 *
 * 覆盖创建成功、七个文档错误码、自造零码异常、重复创建幂等与回调次数，
 * 其中「失败后重试会再次调用工厂」是与页面重试按钮直接对应的一条行为。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { ProfileSession } from '../../../main/ets/utils/ProfileSession';
import { ProfileSnapshot } from '../../../main/ets/model/ProfileSnapshot';
import { ProfileKind } from '../../../main/ets/model/ProfileCatalog';
import { ProbeStatus } from '../../../main/ets/model/ProfileState';
import {
  ProfileStub,
  StubError,
  countingFactoryOf,
  stubFactoryOf,
  throwingFactoryOf
} from './support/ProfileStub';

export default function bluetoothProfileSessionCreateTest() {
  describe('BluetoothProfileSessionCreateTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CREATE_0001
     * @tc.name sessionCreate0001
     * @tc.desc Verify ensureProfile creates the profile once and reports a ready snapshot.
     */
    it('sessionCreate0001', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'createReady');
      const snapshot: ProfileSnapshot = session.ensureProfile();
      expect(snapshot.status).assertEqual(ProbeStatus.READY);
      expect(snapshot.code).assertEqual(0);
      expect(snapshot.kind).assertEqual(ProfileKind.HFP);
      expect(session.isCreated()).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CREATE_0002
     * @tc.name sessionCreate0002
     * @tc.desc Verify the ready message names the documented create function so hilog matches the page.
     */
    it('sessionCreate0002', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'createMessage');
      const snapshot: ProfileSnapshot = session.ensureProfile();
      expect(snapshot.message.indexOf('createHfpAgProfile') >= 0).assertTrue();
      expect(snapshot.message.indexOf('调用成功') >= 0).assertTrue();
      expect(snapshot.message.length > 0).assertTrue();
      expect(session.getSnapshot()).assertEqual(snapshot);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CREATE_0003
     * @tc.name sessionCreate0003
     * @tc.desc Verify ensureProfile is idempotent and never calls the factory twice.
     */
    it('sessionCreate0003', 0, () => {
      const stubs: ProfileStub[] = [];
      const session: ProfileSession = new ProfileSession(countingFactoryOf(stubs), 'createOnce');
      session.ensureProfile();
      session.ensureProfile();
      session.ensureProfile();
      expect(stubs.length).assertEqual(1);
      expect(session.isCreated()).assertTrue();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CREATE_0004
     * @tc.name sessionCreate0004
     * @tc.desc Verify the change callback fires exactly once per successful creation.
     */
    it('sessionCreate0004', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      let calls: number = 0;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'createNotify',
        (snapshot: ProfileSnapshot) => {
          calls++;
        });
      session.ensureProfile();
      expect(calls).assertEqual(1);
      expect(session.isCreated()).assertTrue();
      expect(session.getSnapshot().code).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CREATE_0005
     * @tc.name sessionCreate0005
     * @tc.desc Verify the callback only runs for the first creation and not for repeated calls.
     */
    it('sessionCreate0005', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      let calls: number = 0;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'createNotifyOnce',
        (snapshot: ProfileSnapshot) => {
          calls++;
        });
      session.ensureProfile();
      session.ensureProfile();
      expect(calls).assertEqual(1);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CREATE_0006
     * @tc.name sessionCreate0006
     * @tc.desc Verify a brand new session starts uncreated, unsubscribed and idle.
     */
    it('sessionCreate0006', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'createFresh');
      const snapshot: ProfileSnapshot = session.getSnapshot();
      expect(session.isCreated()).assertFalse();
      expect(session.isSubscribed()).assertFalse();
      expect(snapshot.status).assertEqual(ProbeStatus.IDLE);
      expect(snapshot.devices.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CREATE_0007
     * @tc.name sessionCreate0007
     * @tc.desc Verify a create failure with code 201 maps to PERMISSION_DENIED and stays uncreated.
     */
    it('sessionCreate0007', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(throwingFactoryOf(201), 'createError201');
      const snapshot: ProfileSnapshot = session.ensureProfile();
      expect(snapshot.code).assertEqual(201);
      expect(snapshot.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(session.isCreated()).assertFalse();
      expect(snapshot.message.indexOf('201') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CREATE_0008
     * @tc.name sessionCreate0008
     * @tc.desc Verify a create failure with code 401 maps to FAILED and stays uncreated.
     */
    it('sessionCreate0008', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(throwingFactoryOf(401), 'createError401');
      const snapshot: ProfileSnapshot = session.ensureProfile();
      expect(snapshot.code).assertEqual(401);
      expect(snapshot.status).assertEqual(ProbeStatus.FAILED);
      expect(session.isCreated()).assertFalse();
      expect(snapshot.message.indexOf('401') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CREATE_0009
     * @tc.name sessionCreate0009
     * @tc.desc Verify a create failure with code 801 maps to CAPABILITY_UNSUPPORTED and stays uncreated.
     */
    it('sessionCreate0009', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(throwingFactoryOf(801), 'createError801');
      const snapshot: ProfileSnapshot = session.ensureProfile();
      expect(snapshot.code).assertEqual(801);
      expect(snapshot.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(session.isCreated()).assertFalse();
      expect(snapshot.message.indexOf('801') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CREATE_0010
     * @tc.name sessionCreate0010
     * @tc.desc Verify a create failure with code 2900001 maps to SERVICE_STOPPED and stays uncreated.
     */
    it('sessionCreate0010', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(throwingFactoryOf(2900001), 'createError2900001');
      const snapshot: ProfileSnapshot = session.ensureProfile();
      expect(snapshot.code).assertEqual(2900001);
      expect(snapshot.status).assertEqual(ProbeStatus.SERVICE_STOPPED);
      expect(session.isCreated()).assertFalse();
      expect(snapshot.message.indexOf('2900001') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CREATE_0011
     * @tc.name sessionCreate0011
     * @tc.desc Verify a create failure with code 2900003 maps to BLUETOOTH_DISABLED and stays uncreated.
     */
    it('sessionCreate0011', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(throwingFactoryOf(2900003), 'createError2900003');
      const snapshot: ProfileSnapshot = session.ensureProfile();
      expect(snapshot.code).assertEqual(2900003);
      expect(snapshot.status).assertEqual(ProbeStatus.BLUETOOTH_DISABLED);
      expect(session.isCreated()).assertFalse();
      expect(snapshot.message.indexOf('2900003') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CREATE_0012
     * @tc.name sessionCreate0012
     * @tc.desc Verify a create failure with code 2900004 maps to PROFILE_UNSUPPORTED and stays uncreated.
     */
    it('sessionCreate0012', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(throwingFactoryOf(2900004), 'createError2900004');
      const snapshot: ProfileSnapshot = session.ensureProfile();
      expect(snapshot.code).assertEqual(2900004);
      expect(snapshot.status).assertEqual(ProbeStatus.PROFILE_UNSUPPORTED);
      expect(session.isCreated()).assertFalse();
      expect(snapshot.message.indexOf('2900004') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CREATE_0013
     * @tc.name sessionCreate0013
     * @tc.desc Verify a create failure with code 2900099 maps to FAILED and stays uncreated.
     */
    it('sessionCreate0013', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(throwingFactoryOf(2900099), 'createError2900099');
      const snapshot: ProfileSnapshot = session.ensureProfile();
      expect(snapshot.code).assertEqual(2900099);
      expect(snapshot.status).assertEqual(ProbeStatus.FAILED);
      expect(session.isCreated()).assertFalse();
      expect(snapshot.message.indexOf('2900099') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CREATE_0014
     * @tc.name sessionCreate0014
     * @tc.desc Verify a failed creation can be retried and the session keeps the newest error until then.
     */
    it('sessionCreate0014', 0, () => {
      const session: ProfileSession = new ProfileSession(throwingFactoryOf(801), 'createRetry');
      const first: ProfileSnapshot = session.ensureProfile();
      const second: ProfileSnapshot = session.ensureProfile();
      expect(first.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(second.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(session.isCreated()).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CREATE_0015
     * @tc.name sessionCreate0015
     * @tc.desc Verify every ensureProfile retry calls the factory again while creation keeps failing.
     */
    it('sessionCreate0015', 0, () => {
      let calls: number = 0;
      const session: ProfileSession = new ProfileSession(() => {
        calls++;
        throw new StubError(801, 'create failed while probing');
      }, 'createRetryCount');
      session.ensureProfile();
      session.ensureProfile();
      session.ensureProfile();
      expect(calls).assertEqual(3);
      expect(session.isCreated()).assertFalse();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CREATE_0016
     * @tc.name sessionCreate0016
     * @tc.desc Verify a zero code thrown object still leaves the session in the idle status.
     */
    it('sessionCreate0016', 0, () => {
      const session: ProfileSession = new ProfileSession(() => {
        throw new Error('no numeric code at all');
      }, 'createZeroCode');
      const snapshot: ProfileSnapshot = session.ensureProfile();
      expect(snapshot.code).assertEqual(0);
      expect(snapshot.status).assertEqual(ProbeStatus.IDLE);
      expect(session.isCreated()).assertFalse();
    });
  });
}
