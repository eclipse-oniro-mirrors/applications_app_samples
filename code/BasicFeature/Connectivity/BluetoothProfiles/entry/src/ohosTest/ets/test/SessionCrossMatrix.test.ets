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
 * 会话的五类异常路径与调用顺序矩阵。
 *
 * 会话的方法都不抛异常，而是把异常折算成快照里的状态与错误码，因此每条异常路径都成对断言
 * 「状态与码正确」与「桩的调用次数正确」，后者用来证明失败发生在预期的那一步。
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
  stubFactoryOf,
  throwingFactoryOf
} from './support/ProfileStub';

/** 生成 count 个连续尾号的设备地址 */
function devicesOf(count: number): string[] {
  const list: string[] = [];
  for (let index = 0; index < count; index++) {
    list.push('A1:B2:C3:D4:E5:F' + index);
  }
  return list;
}

export default function bluetoothProfileSessionCrossTest() {
  describe('BluetoothProfileSessionCrossTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0001
     * @tc.name sessionCross0001
     * @tc.desc Verify a factory that throws 201 leaves the session uncreated with status PERMISSION_DENIED.
     */
    it('sessionCross0001', 0, () => {
      const session: ProfileSession = new ProfileSession(throwingFactoryOf(201), 'crossCreate201');
      const snapshot: ProfileSnapshot = session.ensureProfile();
      expect(snapshot.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(snapshot.code).assertEqual(201);
      expect(session.isCreated()).assertFalse();
      expect(snapshot.message.indexOf('失败') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0002
     * @tc.name sessionCross0002
     * @tc.desc Verify a factory that throws 401 leaves the session uncreated with status FAILED.
     */
    it('sessionCross0002', 0, () => {
      const session: ProfileSession = new ProfileSession(throwingFactoryOf(401), 'crossCreate401');
      const snapshot: ProfileSnapshot = session.ensureProfile();
      expect(snapshot.status).assertEqual(ProbeStatus.FAILED);
      expect(snapshot.code).assertEqual(401);
      expect(session.isCreated()).assertFalse();
      expect(snapshot.message.indexOf('失败') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0003
     * @tc.name sessionCross0003
     * @tc.desc Verify a factory that throws 801 leaves the session uncreated with status CAPABILITY_UNSUPPORTED.
     */
    it('sessionCross0003', 0, () => {
      const session: ProfileSession = new ProfileSession(throwingFactoryOf(801), 'crossCreate801');
      const snapshot: ProfileSnapshot = session.ensureProfile();
      expect(snapshot.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(snapshot.code).assertEqual(801);
      expect(session.isCreated()).assertFalse();
      expect(snapshot.message.indexOf('失败') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0004
     * @tc.name sessionCross0004
     * @tc.desc Verify a factory that throws 2900001 leaves the session uncreated with status SERVICE_STOPPED.
     */
    it('sessionCross0004', 0, () => {
      const session: ProfileSession = new ProfileSession(throwingFactoryOf(2900001), 'crossCreate2900001');
      const snapshot: ProfileSnapshot = session.ensureProfile();
      expect(snapshot.status).assertEqual(ProbeStatus.SERVICE_STOPPED);
      expect(snapshot.code).assertEqual(2900001);
      expect(session.isCreated()).assertFalse();
      expect(snapshot.message.indexOf('失败') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0005
     * @tc.name sessionCross0005
     * @tc.desc Verify a factory that throws 2900003 leaves the session uncreated with status BLUETOOTH_DISABLED.
     */
    it('sessionCross0005', 0, () => {
      const session: ProfileSession = new ProfileSession(throwingFactoryOf(2900003), 'crossCreate2900003');
      const snapshot: ProfileSnapshot = session.ensureProfile();
      expect(snapshot.status).assertEqual(ProbeStatus.BLUETOOTH_DISABLED);
      expect(snapshot.code).assertEqual(2900003);
      expect(session.isCreated()).assertFalse();
      expect(snapshot.message.indexOf('失败') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0006
     * @tc.name sessionCross0006
     * @tc.desc Verify a factory that throws 2900004 leaves the session uncreated with status PROFILE_UNSUPPORTED.
     */
    it('sessionCross0006', 0, () => {
      const session: ProfileSession = new ProfileSession(throwingFactoryOf(2900004), 'crossCreate2900004');
      const snapshot: ProfileSnapshot = session.ensureProfile();
      expect(snapshot.status).assertEqual(ProbeStatus.PROFILE_UNSUPPORTED);
      expect(snapshot.code).assertEqual(2900004);
      expect(session.isCreated()).assertFalse();
      expect(snapshot.message.indexOf('失败') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0007
     * @tc.name sessionCross0007
     * @tc.desc Verify a factory that throws 2900099 leaves the session uncreated with status FAILED.
     */
    it('sessionCross0007', 0, () => {
      const session: ProfileSession = new ProfileSession(throwingFactoryOf(2900099), 'crossCreate2900099');
      const snapshot: ProfileSnapshot = session.ensureProfile();
      expect(snapshot.status).assertEqual(ProbeStatus.FAILED);
      expect(snapshot.code).assertEqual(2900099);
      expect(session.isCreated()).assertFalse();
      expect(snapshot.message.indexOf('失败') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0008
     * @tc.name sessionCross0008
     * @tc.desc Verify a factory that throws 0 leaves the session uncreated with status IDLE.
     */
    it('sessionCross0008', 0, () => {
      const session: ProfileSession = new ProfileSession(throwingFactoryOf(0), 'crossCreate0');
      const snapshot: ProfileSnapshot = session.ensureProfile();
      expect(snapshot.status).assertEqual(ProbeStatus.IDLE);
      expect(snapshot.code).assertEqual(0);
      expect(session.isCreated()).assertFalse();
      expect(snapshot.message.indexOf('失败') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0009
     * @tc.name sessionCross0009
     * @tc.desc Verify a factory that throws -1 leaves the session uncreated with status IDLE.
     */
    it('sessionCross0009', 0, () => {
      const session: ProfileSession = new ProfileSession(throwingFactoryOf(-1), 'crossCreate-1');
      const snapshot: ProfileSnapshot = session.ensureProfile();
      expect(snapshot.status).assertEqual(ProbeStatus.IDLE);
      expect(snapshot.code).assertEqual(-1);
      expect(session.isCreated()).assertFalse();
      expect(snapshot.message.indexOf('失败') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0010
     * @tc.name sessionCross0010
     * @tc.desc Verify a device query failure 201 maps to status PERMISSION_DENIED and keeps an empty list.
     */
    it('sessionCross0010', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2));
      stub.devicesError = 201;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossDevices201');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshDevices();
      expect(snapshot.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(snapshot.code).assertEqual(201);
      expect(stub.deviceCalls).assertEqual(1);
      expect(snapshot.devices.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0011
     * @tc.name sessionCross0011
     * @tc.desc Verify a device query failure 401 maps to status FAILED and keeps an empty list.
     */
    it('sessionCross0011', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2));
      stub.devicesError = 401;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossDevices401');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshDevices();
      expect(snapshot.status).assertEqual(ProbeStatus.FAILED);
      expect(snapshot.code).assertEqual(401);
      expect(stub.deviceCalls).assertEqual(1);
      expect(snapshot.devices.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0012
     * @tc.name sessionCross0012
     * @tc.desc Verify a device query failure 801 maps to status CAPABILITY_UNSUPPORTED and keeps an empty list.
     */
    it('sessionCross0012', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2));
      stub.devicesError = 801;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossDevices801');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshDevices();
      expect(snapshot.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(snapshot.code).assertEqual(801);
      expect(stub.deviceCalls).assertEqual(1);
      expect(snapshot.devices.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0013
     * @tc.name sessionCross0013
     * @tc.desc Verify a device query failure 2900001 maps to status SERVICE_STOPPED and keeps an empty list.
     */
    it('sessionCross0013', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2));
      stub.devicesError = 2900001;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossDevices2900001');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshDevices();
      expect(snapshot.status).assertEqual(ProbeStatus.SERVICE_STOPPED);
      expect(snapshot.code).assertEqual(2900001);
      expect(stub.deviceCalls).assertEqual(1);
      expect(snapshot.devices.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0014
     * @tc.name sessionCross0014
     * @tc.desc Verify a device query failure 2900003 maps to status BLUETOOTH_DISABLED and keeps an empty list.
     */
    it('sessionCross0014', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2));
      stub.devicesError = 2900003;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossDevices2900003');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshDevices();
      expect(snapshot.status).assertEqual(ProbeStatus.BLUETOOTH_DISABLED);
      expect(snapshot.code).assertEqual(2900003);
      expect(stub.deviceCalls).assertEqual(1);
      expect(snapshot.devices.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0015
     * @tc.name sessionCross0015
     * @tc.desc Verify a device query failure 2900004 maps to status PROFILE_UNSUPPORTED and keeps an empty list.
     */
    it('sessionCross0015', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2));
      stub.devicesError = 2900004;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossDevices2900004');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshDevices();
      expect(snapshot.status).assertEqual(ProbeStatus.PROFILE_UNSUPPORTED);
      expect(snapshot.code).assertEqual(2900004);
      expect(stub.deviceCalls).assertEqual(1);
      expect(snapshot.devices.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0016
     * @tc.name sessionCross0016
     * @tc.desc Verify a device query failure 2900099 maps to status FAILED and keeps an empty list.
     */
    it('sessionCross0016', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2));
      stub.devicesError = 2900099;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossDevices2900099');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshDevices();
      expect(snapshot.status).assertEqual(ProbeStatus.FAILED);
      expect(snapshot.code).assertEqual(2900099);
      expect(stub.deviceCalls).assertEqual(1);
      expect(snapshot.devices.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0017
     * @tc.name sessionCross0017
     * @tc.desc Verify a state query failure 201 maps to status PERMISSION_DENIED and records the device.
     */
    it('sessionCross0017', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(1), 2);
      stub.stateError = 201;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossState201');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshState('A1:B2:C3:D4:E5:F6');
      expect(snapshot.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(snapshot.code).assertEqual(201);
      expect(stub.stateCalls).assertEqual(1);
      expect(stub.lastDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0018
     * @tc.name sessionCross0018
     * @tc.desc Verify a state query failure 801 maps to status CAPABILITY_UNSUPPORTED and records the device.
     */
    it('sessionCross0018', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(1), 2);
      stub.stateError = 801;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossState801');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshState('A1:B2:C3:D4:E5:F6');
      expect(snapshot.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(snapshot.code).assertEqual(801);
      expect(stub.stateCalls).assertEqual(1);
      expect(stub.lastDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0019
     * @tc.name sessionCross0019
     * @tc.desc Verify a state query failure 2900001 maps to status SERVICE_STOPPED and records the device.
     */
    it('sessionCross0019', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(1), 2);
      stub.stateError = 2900001;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossState2900001');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshState('A1:B2:C3:D4:E5:F6');
      expect(snapshot.status).assertEqual(ProbeStatus.SERVICE_STOPPED);
      expect(snapshot.code).assertEqual(2900001);
      expect(stub.stateCalls).assertEqual(1);
      expect(stub.lastDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0020
     * @tc.name sessionCross0020
     * @tc.desc Verify a state query failure 2900003 maps to status BLUETOOTH_DISABLED and records the device.
     */
    it('sessionCross0020', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(1), 2);
      stub.stateError = 2900003;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossState2900003');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshState('A1:B2:C3:D4:E5:F6');
      expect(snapshot.status).assertEqual(ProbeStatus.BLUETOOTH_DISABLED);
      expect(snapshot.code).assertEqual(2900003);
      expect(stub.stateCalls).assertEqual(1);
      expect(stub.lastDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0021
     * @tc.name sessionCross0021
     * @tc.desc Verify a state query failure 2900099 maps to status FAILED and records the device.
     */
    it('sessionCross0021', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(1), 2);
      stub.stateError = 2900099;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossState2900099');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshState('A1:B2:C3:D4:E5:F6');
      expect(snapshot.status).assertEqual(ProbeStatus.FAILED);
      expect(snapshot.code).assertEqual(2900099);
      expect(stub.stateCalls).assertEqual(1);
      expect(stub.lastDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0022
     * @tc.name sessionCross0022
     * @tc.desc Verify a subscribe failure 201 maps to status PERMISSION_DENIED and keeps the flag false.
     */
    it('sessionCross0022', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.onError = 201;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossOn201');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.subscribe();
      expect(snapshot.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(snapshot.code).assertEqual(201);
      expect(snapshot.subscribed).assertFalse();
      expect(stub.onCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0023
     * @tc.name sessionCross0023
     * @tc.desc Verify a subscribe failure 801 maps to status CAPABILITY_UNSUPPORTED and keeps the flag false.
     */
    it('sessionCross0023', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.onError = 801;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossOn801');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.subscribe();
      expect(snapshot.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(snapshot.code).assertEqual(801);
      expect(snapshot.subscribed).assertFalse();
      expect(stub.onCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0024
     * @tc.name sessionCross0024
     * @tc.desc Verify a subscribe failure 2900003 maps to status BLUETOOTH_DISABLED and keeps the flag false.
     */
    it('sessionCross0024', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.onError = 2900003;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossOn2900003');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.subscribe();
      expect(snapshot.status).assertEqual(ProbeStatus.BLUETOOTH_DISABLED);
      expect(snapshot.code).assertEqual(2900003);
      expect(snapshot.subscribed).assertFalse();
      expect(stub.onCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0025
     * @tc.name sessionCross0025
     * @tc.desc Verify a subscribe failure 2900099 maps to status FAILED and keeps the flag false.
     */
    it('sessionCross0025', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.onError = 2900099;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossOn2900099');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.subscribe();
      expect(snapshot.status).assertEqual(ProbeStatus.FAILED);
      expect(snapshot.code).assertEqual(2900099);
      expect(snapshot.subscribed).assertFalse();
      expect(stub.onCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0026
     * @tc.name sessionCross0026
     * @tc.desc Verify an unsubscribe failure 201 maps to status PERMISSION_DENIED and keeps the flag true.
     */
    it('sessionCross0026', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.offError = 201;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossOff201');
      session.ensureProfile();
      session.subscribe();
      const snapshot: ProfileSnapshot = session.unsubscribe();
      expect(snapshot.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(snapshot.code).assertEqual(201);
      expect(snapshot.subscribed).assertTrue();
      expect(stub.offCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0027
     * @tc.name sessionCross0027
     * @tc.desc Verify an unsubscribe failure 801 maps to status CAPABILITY_UNSUPPORTED and keeps the flag true.
     */
    it('sessionCross0027', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.offError = 801;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossOff801');
      session.ensureProfile();
      session.subscribe();
      const snapshot: ProfileSnapshot = session.unsubscribe();
      expect(snapshot.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(snapshot.code).assertEqual(801);
      expect(snapshot.subscribed).assertTrue();
      expect(stub.offCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0028
     * @tc.name sessionCross0028
     * @tc.desc Verify an unsubscribe failure 2900001 maps to status SERVICE_STOPPED and keeps the flag true.
     */
    it('sessionCross0028', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.offError = 2900001;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossOff2900001');
      session.ensureProfile();
      session.subscribe();
      const snapshot: ProfileSnapshot = session.unsubscribe();
      expect(snapshot.status).assertEqual(ProbeStatus.SERVICE_STOPPED);
      expect(snapshot.code).assertEqual(2900001);
      expect(snapshot.subscribed).assertTrue();
      expect(stub.offCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0029
     * @tc.name sessionCross0029
     * @tc.desc Verify an unsubscribe failure 2900099 maps to status FAILED and keeps the flag true.
     */
    it('sessionCross0029', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.offError = 2900099;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossOff2900099');
      session.ensureProfile();
      session.subscribe();
      const snapshot: ProfileSnapshot = session.unsubscribe();
      expect(snapshot.status).assertEqual(ProbeStatus.FAILED);
      expect(snapshot.code).assertEqual(2900099);
      expect(snapshot.subscribed).assertTrue();
      expect(stub.offCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0030
     * @tc.name sessionCross0030
     * @tc.desc Verify a device refresh on an empty stub ends in the no device status.
     */
    it('sessionCross0030', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossSeqEmptyDevices');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshDevices();
      expect(snapshot.status).assertEqual(ProbeStatus.NO_DEVICE);
      expect(snapshot.devices.length).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0031
     * @tc.name sessionCross0031
     * @tc.desc Verify a device refresh on a two device stub ends in the ready status.
     */
    it('sessionCross0031', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2));
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossSeqTwoDevices');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshDevices();
      expect(snapshot.status).assertEqual(ProbeStatus.READY);
      expect(snapshot.deviceCount()).assertEqual(2);
      expect(stub.deviceCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0032
     * @tc.name sessionCross0032
     * @tc.desc Verify subscribe followed by unsubscribe returns the flag to false exactly once.
     */
    it('sessionCross0032', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossSeqSubOff');
      session.ensureProfile();
      session.subscribe();
      const snapshot: ProfileSnapshot = session.unsubscribe();
      expect(snapshot.subscribed).assertFalse();
      expect(stub.onCalls).assertEqual(1);
      expect(stub.offCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0033
     * @tc.name sessionCross0033
     * @tc.desc Verify a dispatched change updates the connection pair while subscribed.
     */
    it('sessionCross0033', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossSeqDispatch');
      session.ensureProfile();
      session.subscribe();
      session.dispatchParam(stateParam('A1:B2:C3:D4:E5:F6', 2, 0));
      expect(session.getSnapshot().currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(session.getSnapshot().currentState).assertEqual(2);
      expect(session.isSubscribed()).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0034
     * @tc.name sessionCross0034
     * @tc.desc Verify a dispatch before subscribe is dropped without touching the snapshot.
     */
    it('sessionCross0034', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossSeqDispatchEarly');
      session.ensureProfile();
      session.dispatchParam(stateParam('A1:B2:C3:D4:E5:F6', 2, 0));
      expect(session.getSnapshot().currentDeviceId).assertEqual('');
      expect(session.getSnapshot().currentState).assertEqual(0);
      expect(session.isSubscribed()).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0035
     * @tc.name sessionCross0035
     * @tc.desc Verify release clears the instance, the subscription and the status.
     */
    it('sessionCross0035', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2));
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossSeqRelease');
      session.ensureProfile();
      session.subscribe();
      session.release();
      expect(session.isCreated()).assertFalse();
      expect(session.isSubscribed()).assertFalse();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.IDLE);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0036
     * @tc.name sessionCross0036
     * @tc.desc Verify release unsubscribes the profile it still holds before dropping the reference.
     */
    it('sessionCross0036', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossSeqReleaseOff');
      session.ensureProfile();
      session.subscribe();
      session.release();
      expect(stub.offCalls).assertEqual(1);
      expect(stub.hasListener()).assertFalse();
      expect(session.isSubscribed()).assertFalse();
      expect(session.getSnapshot().subscribed).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0037
     * @tc.name sessionCross0037
     * @tc.desc Verify an illegal device id is rejected locally without calling the profile.
     */
    it('sessionCross0037', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(1), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossSeqBadId');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshState('bad-id');
      expect(snapshot.status).assertEqual(ProbeStatus.FAILED);
      expect(snapshot.code).assertEqual(401);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0038
     * @tc.name sessionCross0038
     * @tc.desc Verify a legal device id reaches the profile and stores the returned state.
     */
    it('sessionCross0038', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(1), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossSeqGoodId');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshState('A1:B2:C3:D4:E5:F6');
      expect(snapshot.currentState).assertEqual(2);
      expect(snapshot.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(stub.stateCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0039
     * @tc.name sessionCross0039
     * @tc.desc Verify the first device refresh creates the instance but skips the device query.
     */
    it('sessionCross0039', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(3));
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossSeqFirstDevices');
      const snapshot: ProfileSnapshot = session.refreshDevices();
      expect(snapshot.status).assertEqual(ProbeStatus.READY);
      expect(stub.deviceCalls).assertEqual(0);
      expect(session.isCreated()).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0040
     * @tc.name sessionCross0040
     * @tc.desc Verify the first state query creates the instance but skips the state query.
     */
    it('sessionCross0040', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(1), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossSeqFirstState');
      const snapshot: ProfileSnapshot = session.refreshState('A1:B2:C3:D4:E5:F6');
      expect(snapshot.status).assertEqual(ProbeStatus.READY);
      expect(stub.stateCalls).assertEqual(0);
      expect(session.isCreated()).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0041
     * @tc.name sessionCross0041
     * @tc.desc Verify the first subscribe creates the instance but leaves the subscription off.
     */
    it('sessionCross0041', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossSeqFirstSubscribe');
      const snapshot: ProfileSnapshot = session.subscribe();
      expect(snapshot.status).assertEqual(ProbeStatus.READY);
      expect(stub.onCalls).assertEqual(0);
      expect(snapshot.subscribed).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0042
     * @tc.name sessionCross0042
     * @tc.desc Verify three create calls hit the factory once and keep the ready status.
     */
    it('sessionCross0042', 0, () => {
      const stubs: ProfileStub[] = [];
      const session: ProfileSession = new ProfileSession(countingFactoryOf(stubs), 'crossRepeatCreate');
      session.ensureProfile();
      session.ensureProfile();
      session.ensureProfile();
      expect(stubs.length).assertEqual(1);
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0043
     * @tc.name sessionCross0043
     * @tc.desc Verify three subscribe calls register a single listener.
     */
    it('sessionCross0043', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossRepeatSubscribe');
      session.ensureProfile();
      session.subscribe();
      session.subscribe();
      session.subscribe();
      expect(stub.onCalls).assertEqual(1);
      expect(session.getSnapshot().subscribed).assertTrue();
      expect(session.isSubscribed()).assertTrue();
      expect(stub.hasListener()).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0044
     * @tc.name sessionCross0044
     * @tc.desc Verify the second unsubscribe is a no-op because the listener is already gone.
     */
    it('sessionCross0044', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossRepeatOff');
      session.ensureProfile();
      session.subscribe();
      session.unsubscribe();
      session.unsubscribe();
      expect(stub.offCalls).assertEqual(1);
      expect(session.isSubscribed()).assertFalse();
      expect(stub.hasListener()).assertFalse();
      expect(session.getSnapshot().subscribed).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0045
     * @tc.name sessionCross0045
     * @tc.desc Verify unsubscribe before subscribe never reaches the profile.
     */
    it('sessionCross0045', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossEarlyOff');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.unsubscribe();
      expect(stub.offCalls).assertEqual(0);
      expect(snapshot.subscribed).assertFalse();
      expect(session.isSubscribed()).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0046
     * @tc.name sessionCross0046
     * @tc.desc Verify every device refresh reaches the profile and counts once per call.
     */
    it('sessionCross0046', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(1));
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossRepeatDevices');
      session.ensureProfile();
      session.refreshDevices();
      session.refreshDevices();
      session.refreshDevices();
      expect(stub.deviceCalls).assertEqual(3);
      expect(session.getSnapshot().deviceCount()).assertEqual(1);
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0047
     * @tc.name sessionCross0047
     * @tc.desc Verify every state refresh reaches the profile and keeps the last device.
     */
    it('sessionCross0047', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(1), 1);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossRepeatStates');
      session.ensureProfile();
      session.refreshState('A1:B2:C3:D4:E5:F6');
      session.refreshState('A1:B2:C3:D4:E5:F7');
      expect(stub.stateCalls).assertEqual(2);
      expect(session.getSnapshot().currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F7');
      expect(session.getSnapshot().currentState).assertEqual(1);
      expect(stub.lastDeviceId).assertEqual('A1:B2:C3:D4:E5:F7');
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0048
     * @tc.name sessionCross0048
     * @tc.desc Verify release twice keeps the session idle and never touches a null profile.
     */
    it('sessionCross0048', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossRepeatRelease');
      session.ensureProfile();
      session.release();
      session.release();
      expect(session.isCreated()).assertFalse();
      expect(stub.offCalls).assertEqual(0);
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.IDLE);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_CROSS_0049
     * @tc.name sessionCross0049
     * @tc.desc Verify three dispatches after subscribe update the state three times.
     */
    it('sessionCross0049', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      let calls: number = 0;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'crossRepeatDispatch',
        (snapshot: ProfileSnapshot) => {
          calls++;
        });
      session.ensureProfile();
      session.subscribe();
      session.dispatchParam(stateParam('A1:B2:C3:D4:E5:F6', 1, 0));
      session.dispatchParam(stateParam('A1:B2:C3:D4:E5:F6', 2, 0));
      session.dispatchParam(stateParam('A1:B2:C3:D4:E5:F6', 3, 0));
      expect(calls).assertEqual(5);
      expect(session.getSnapshot().currentState).assertEqual(3);
      expect(session.isSubscribed()).assertTrue();
      expect(session.getSnapshot().currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
    });
  });
}
