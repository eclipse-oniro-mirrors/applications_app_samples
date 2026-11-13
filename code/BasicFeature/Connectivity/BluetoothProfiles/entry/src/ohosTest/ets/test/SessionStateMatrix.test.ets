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
 * 连接状态查询阶段的矩阵。
 *
 * 合法地址走蓝牙服务，非法地址必须在本地就被拦下并且不产生任何服务调用，
 * 用例用桩的 stateCalls 计数证明「没有把明显非法的地址送进系统接口」。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { ProfileSession } from '../../../main/ets/utils/ProfileSession';
import { ProfileSnapshot } from '../../../main/ets/model/ProfileSnapshot';
import { ProbeStatus } from '../../../main/ets/model/ProfileState';
import { ProfileStub, stubFactoryOf } from './support/ProfileStub';

export default function bluetoothProfileSessionStateTest() {
  describe('BluetoothProfileSessionStateTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_STATE_0001
     * @tc.name sessionState0001
     * @tc.desc Verify refreshState records the raw connection state 0 for a legal deviceId.
     */
    it('sessionState0001', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.state = 0;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'stateCase');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshState('A1:B2:C3:D4:E5:F6');
      expect(snapshot.currentState).assertEqual(0);
      expect(snapshot.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(stub.stateCalls).assertEqual(1);
      expect(stub.lastDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_STATE_0002
     * @tc.name sessionState0002
     * @tc.desc Verify refreshState records the raw connection state 1 for a legal deviceId.
     */
    it('sessionState0002', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.state = 1;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'stateCase');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshState('A1:B2:C3:D4:E5:F6');
      expect(snapshot.currentState).assertEqual(1);
      expect(snapshot.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(stub.stateCalls).assertEqual(1);
      expect(stub.lastDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_STATE_0003
     * @tc.name sessionState0003
     * @tc.desc Verify refreshState records the raw connection state 2 for a legal deviceId.
     */
    it('sessionState0003', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.state = 2;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'stateCase');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshState('A1:B2:C3:D4:E5:F6');
      expect(snapshot.currentState).assertEqual(2);
      expect(snapshot.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(stub.stateCalls).assertEqual(1);
      expect(stub.lastDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_STATE_0004
     * @tc.name sessionState0004
     * @tc.desc Verify refreshState records the raw connection state 3 for a legal deviceId.
     */
    it('sessionState0004', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.state = 3;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'stateCase');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshState('A1:B2:C3:D4:E5:F6');
      expect(snapshot.currentState).assertEqual(3);
      expect(snapshot.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(stub.stateCalls).assertEqual(1);
      expect(stub.lastDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_STATE_0005
     * @tc.name sessionState0005
     * @tc.desc Verify refreshState rejects the empty string before touching the bluetooth service.
     */
    it('sessionState0005', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'stateInvalid');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshState('');
      expect(snapshot.status).assertEqual(ProbeStatus.FAILED);
      expect(snapshot.code).assertEqual(401);
      expect(stub.stateCalls).assertEqual(0);
      expect(snapshot.message.indexOf('deviceId 不合法') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_STATE_0006
     * @tc.name sessionState0006
     * @tc.desc Verify refreshState rejects the plain text before touching the bluetooth service.
     */
    it('sessionState0006', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'stateInvalid');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshState('abc');
      expect(snapshot.status).assertEqual(ProbeStatus.FAILED);
      expect(snapshot.code).assertEqual(401);
      expect(stub.stateCalls).assertEqual(0);
      expect(snapshot.message.indexOf('deviceId 不合法') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_STATE_0007
     * @tc.name sessionState0007
     * @tc.desc Verify refreshState rejects the five segments before touching the bluetooth service.
     */
    it('sessionState0007', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'stateInvalid');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshState('A1:B2:C3:D4:E5');
      expect(snapshot.status).assertEqual(ProbeStatus.FAILED);
      expect(snapshot.code).assertEqual(401);
      expect(stub.stateCalls).assertEqual(0);
      expect(snapshot.message.indexOf('deviceId 不合法') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_STATE_0008
     * @tc.name sessionState0008
     * @tc.desc Verify refreshState rejects the no separators before touching the bluetooth service.
     */
    it('sessionState0008', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'stateInvalid');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshState('A1B2C3D4E5F6');
      expect(snapshot.status).assertEqual(ProbeStatus.FAILED);
      expect(snapshot.code).assertEqual(401);
      expect(stub.stateCalls).assertEqual(0);
      expect(snapshot.message.indexOf('deviceId 不合法') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_STATE_0009
     * @tc.name sessionState0009
     * @tc.desc Verify refreshState rejects the non hex letter before touching the bluetooth service.
     */
    it('sessionState0009', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'stateInvalid');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshState('G1:B2:C3:D4:E5:F6');
      expect(snapshot.status).assertEqual(ProbeStatus.FAILED);
      expect(snapshot.code).assertEqual(401);
      expect(stub.stateCalls).assertEqual(0);
      expect(snapshot.message.indexOf('deviceId 不合法') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_STATE_0010
     * @tc.name sessionState0010
     * @tc.desc Verify refreshState rejects the blank string before touching the bluetooth service.
     */
    it('sessionState0010', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'stateInvalid');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshState('   ');
      expect(snapshot.status).assertEqual(ProbeStatus.FAILED);
      expect(snapshot.code).assertEqual(401);
      expect(stub.stateCalls).assertEqual(0);
      expect(snapshot.message.indexOf('deviceId 不合法') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_STATE_0011
     * @tc.name sessionState0011
     * @tc.desc Verify a connection state query failure with code 201 maps to PERMISSION_DENIED.
     */
    it('sessionState0011', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.stateError = 201;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'stateError');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshState('A1:B2:C3:D4:E5:F6');
      expect(snapshot.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(snapshot.code).assertEqual(201);
      expect(snapshot.message.indexOf('getConnectionState') >= 0).assertTrue();
      expect(stub.stateCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_STATE_0012
     * @tc.name sessionState0012
     * @tc.desc Verify a connection state query failure with code 401 maps to FAILED.
     */
    it('sessionState0012', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.stateError = 401;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'stateError');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshState('A1:B2:C3:D4:E5:F6');
      expect(snapshot.status).assertEqual(ProbeStatus.FAILED);
      expect(snapshot.code).assertEqual(401);
      expect(snapshot.message.indexOf('getConnectionState') >= 0).assertTrue();
      expect(stub.stateCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_STATE_0013
     * @tc.name sessionState0013
     * @tc.desc Verify a connection state query failure with code 801 maps to CAPABILITY_UNSUPPORTED.
     */
    it('sessionState0013', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.stateError = 801;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'stateError');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshState('A1:B2:C3:D4:E5:F6');
      expect(snapshot.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(snapshot.code).assertEqual(801);
      expect(snapshot.message.indexOf('getConnectionState') >= 0).assertTrue();
      expect(stub.stateCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_STATE_0014
     * @tc.name sessionState0014
     * @tc.desc Verify a connection state query failure with code 2900001 maps to SERVICE_STOPPED.
     */
    it('sessionState0014', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.stateError = 2900001;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'stateError');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshState('A1:B2:C3:D4:E5:F6');
      expect(snapshot.status).assertEqual(ProbeStatus.SERVICE_STOPPED);
      expect(snapshot.code).assertEqual(2900001);
      expect(snapshot.message.indexOf('getConnectionState') >= 0).assertTrue();
      expect(stub.stateCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_STATE_0015
     * @tc.name sessionState0015
     * @tc.desc Verify a connection state query failure with code 2900003 maps to BLUETOOTH_DISABLED.
     */
    it('sessionState0015', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.stateError = 2900003;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'stateError');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshState('A1:B2:C3:D4:E5:F6');
      expect(snapshot.status).assertEqual(ProbeStatus.BLUETOOTH_DISABLED);
      expect(snapshot.code).assertEqual(2900003);
      expect(snapshot.message.indexOf('getConnectionState') >= 0).assertTrue();
      expect(stub.stateCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_STATE_0016
     * @tc.name sessionState0016
     * @tc.desc Verify a connection state query failure with code 2900004 maps to PROFILE_UNSUPPORTED.
     */
    it('sessionState0016', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.stateError = 2900004;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'stateError');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshState('A1:B2:C3:D4:E5:F6');
      expect(snapshot.status).assertEqual(ProbeStatus.PROFILE_UNSUPPORTED);
      expect(snapshot.code).assertEqual(2900004);
      expect(snapshot.message.indexOf('getConnectionState') >= 0).assertTrue();
      expect(stub.stateCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_STATE_0017
     * @tc.name sessionState0017
     * @tc.desc Verify a connection state query failure with code 2900099 maps to FAILED.
     */
    it('sessionState0017', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.stateError = 2900099;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'stateError');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshState('A1:B2:C3:D4:E5:F6');
      expect(snapshot.status).assertEqual(ProbeStatus.FAILED);
      expect(snapshot.code).assertEqual(2900099);
      expect(snapshot.message.indexOf('getConnectionState') >= 0).assertTrue();
      expect(stub.stateCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_STATE_0018
     * @tc.name sessionState0018
     * @tc.desc Verify refreshState on a fresh session creates the instance instead of querying.
     */
    it('sessionState0018', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'stateLazy');
      const snapshot: ProfileSnapshot = session.refreshState('A1:B2:C3:D4:E5:F6');
      expect(snapshot.status).assertEqual(ProbeStatus.READY);
      expect(stub.stateCalls).assertEqual(0);
      expect(session.isCreated()).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_STATE_0019
     * @tc.name sessionState0019
     * @tc.desc Verify the session keeps only the most recent device and state pair.
     */
    it('sessionState0019', 0, () => {
      const stub: ProfileStub = new ProfileStub([], 0);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'stateKeepLast');
      session.ensureProfile();
      session.refreshState('A1:B2:C3:D4:E5:F6');
      const snapshot: ProfileSnapshot = session.refreshState('A1:B2:C3:D4:E5:F7');
      expect(snapshot.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F7');
      expect(snapshot.currentState).assertEqual(0);
      expect(stub.stateCalls).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_STATE_0020
     * @tc.name sessionState0020
     * @tc.desc Verify the state query result is written into the same snapshot the page renders.
     */
    it('sessionState0020', 0, () => {
      const stub: ProfileStub = new ProfileStub([], 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'stateSameSnapshot');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshState('A1:B2:C3:D4:E5:F6');
      expect(session.getSnapshot()).assertEqual(snapshot);
      expect(session.getSnapshot().currentState).assertEqual(2);
      expect(session.getSnapshot().currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
    });
  });
}
