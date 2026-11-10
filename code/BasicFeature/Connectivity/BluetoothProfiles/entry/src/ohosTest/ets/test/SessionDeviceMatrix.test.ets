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
 * 设备查询阶段的矩阵。
 *
 * 重点覆盖「未创建实例时 refreshDevices 先建实例、不查设备」这条反直觉行为，
 * 它决定了页面第一次点击刷新时看到的是「可用」而不是「无设备」，
 * 用例把第一次与第二次调用的差异分开断言，避免将来被误改成一次到位的实现。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { ProfileSession } from '../../../main/ets/utils/ProfileSession';
import { ProfileSnapshot } from '../../../main/ets/model/ProfileSnapshot';
import { ProbeStatus } from '../../../main/ets/model/ProfileState';
import {
  ProfileStub,
  countingFactoryOf,
  stubFactoryOf
} from './support/ProfileStub';

/** 生成 count 个连续尾号的设备地址，避免用例里出现超长数组字面量 */
function devicesOf(count: number): string[] {
  const list: string[] = [];
  for (let index = 0; index < count; index++) {
    list.push('A1:B2:C3:D4:E5:F' + index);
  }
  return list;
}

export default function bluetoothProfileSessionDeviceTest() {
  describe('BluetoothProfileSessionDeviceMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_DEVICES_0001
     * @tc.name sessionDevice0001
     * @tc.desc Verify refreshDevices reports NO_DEVICE for a stub holding 0 devices.
     */
    it('sessionDevice0001', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(0));
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'devicesCase');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshDevices();
      expect(snapshot.status).assertEqual(ProbeStatus.NO_DEVICE);
      expect(snapshot.devices.length).assertEqual(0);
      expect(snapshot.message.indexOf('0') >= 0).assertTrue();
      expect(stub.deviceCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_DEVICES_0002
     * @tc.name sessionDevice0002
     * @tc.desc Verify refreshDevices reports READY for a stub holding 1 devices.
     */
    it('sessionDevice0002', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(1));
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'devicesCase');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshDevices();
      expect(snapshot.status).assertEqual(ProbeStatus.READY);
      expect(snapshot.devices.length).assertEqual(1);
      expect(snapshot.message.indexOf('1') >= 0).assertTrue();
      expect(stub.deviceCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_DEVICES_0003
     * @tc.name sessionDevice0003
     * @tc.desc Verify refreshDevices reports READY for a stub holding 2 devices.
     */
    it('sessionDevice0003', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2));
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'devicesCase');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshDevices();
      expect(snapshot.status).assertEqual(ProbeStatus.READY);
      expect(snapshot.devices.length).assertEqual(2);
      expect(snapshot.message.indexOf('2') >= 0).assertTrue();
      expect(stub.deviceCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_DEVICES_0004
     * @tc.name sessionDevice0004
     * @tc.desc Verify refreshDevices reports READY for a stub holding 3 devices.
     */
    it('sessionDevice0004', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(3));
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'devicesCase');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshDevices();
      expect(snapshot.status).assertEqual(ProbeStatus.READY);
      expect(snapshot.devices.length).assertEqual(3);
      expect(snapshot.message.indexOf('3') >= 0).assertTrue();
      expect(stub.deviceCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_DEVICES_0005
     * @tc.name sessionDevice0005
     * @tc.desc Verify refreshDevices reports READY for a stub holding 5 devices.
     */
    it('sessionDevice0005', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(5));
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'devicesCase');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshDevices();
      expect(snapshot.status).assertEqual(ProbeStatus.READY);
      expect(snapshot.devices.length).assertEqual(5);
      expect(snapshot.message.indexOf('5') >= 0).assertTrue();
      expect(stub.deviceCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_DEVICES_0006
     * @tc.name sessionDevice0006
     * @tc.desc Verify refreshDevices on a fresh session creates the instance and skips the device query.
     */
    it('sessionDevice0006', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'devicesLazy');
      const snapshot: ProfileSnapshot = session.refreshDevices();
      expect(snapshot.status).assertEqual(ProbeStatus.READY);
      expect(stub.deviceCalls).assertEqual(0);
      expect(session.isCreated()).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_DEVICES_0007
     * @tc.name sessionDevice0007
     * @tc.desc Verify the second refreshDevices call finally queries the stub and reports no device.
     */
    it('sessionDevice0007', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'devicesSecond');
      session.refreshDevices();
      const snapshot: ProfileSnapshot = session.refreshDevices();
      expect(snapshot.status).assertEqual(ProbeStatus.NO_DEVICE);
      expect(stub.deviceCalls).assertEqual(1);
      expect(snapshot.devices.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_DEVICES_0008
     * @tc.name sessionDevice0008
     * @tc.desc Verify repeated refreshes never create a second instance.
     */
    it('sessionDevice0008', 0, () => {
      const stubs: ProfileStub[] = [];
      const session: ProfileSession = new ProfileSession(countingFactoryOf(stubs), 'devicesRepeat');
      session.refreshDevices();
      session.refreshDevices();
      session.refreshDevices();
      expect(stubs.length).assertEqual(1);
      expect(stubs[0].deviceCalls).assertEqual(2);
      expect(session.isCreated()).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_DEVICES_0009
     * @tc.name sessionDevice0009
     * @tc.desc Verify the snapshot keeps an isolated copy of the device list returned by the profile.
     */
    it('sessionDevice0009', 0, () => {
      const stub: ProfileStub = new ProfileStub(['A1:B2:C3:D4:E5:F6']);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'devicesCopy');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshDevices();
      stub.devices.push('A1:B2:C3:D4:E5:F7');
      expect(snapshot.devices.length).assertEqual(1);
      expect(snapshot.hasDevice('A1:B2:C3:D4:E5:F7')).assertFalse();
      expect(snapshot.devices[0]).assertEqual('A1:B2:C3:D4:E5:F6');
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_DEVICES_0010
     * @tc.name sessionDevice0010
     * @tc.desc Verify the device query result replaces the previous list instead of appending to it.
     */
    it('sessionDevice0010', 0, () => {
      const stub: ProfileStub = new ProfileStub(['A1:B2:C3:D4:E5:F6', 'A1:B2:C3:D4:E5:F7']);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'devicesReplace');
      session.ensureProfile();
      expect(session.refreshDevices().devices.length).assertEqual(2);
      stub.devices = [];
      expect(session.refreshDevices().devices.length).assertEqual(0);
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.NO_DEVICE);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_DEVICES_0011
     * @tc.name sessionDevice0011
     * @tc.desc Verify the change callback fires on every successful device refresh.
     */
    it('sessionDevice0011', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      let calls: number = 0;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'devicesNotify',
        (snapshot: ProfileSnapshot) => {
          calls++;
        });
      session.ensureProfile();
      session.refreshDevices();
      session.refreshDevices();
      expect(calls).assertEqual(3);
      expect(stub.deviceCalls).assertEqual(2);
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.NO_DEVICE);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_DEVICES_0012
     * @tc.name sessionDevice0012
     * @tc.desc Verify a device query failure with code 201 maps to PERMISSION_DENIED.
     */
    it('sessionDevice0012', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.devicesError = 201;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'devicesError');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshDevices();
      expect(snapshot.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(snapshot.code).assertEqual(201);
      expect(snapshot.message.indexOf('getConnectedDevices') >= 0).assertTrue();
      expect(snapshot.devices.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_DEVICES_0013
     * @tc.name sessionDevice0013
     * @tc.desc Verify a device query failure with code 401 maps to FAILED.
     */
    it('sessionDevice0013', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.devicesError = 401;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'devicesError');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshDevices();
      expect(snapshot.status).assertEqual(ProbeStatus.FAILED);
      expect(snapshot.code).assertEqual(401);
      expect(snapshot.message.indexOf('getConnectedDevices') >= 0).assertTrue();
      expect(snapshot.devices.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_DEVICES_0014
     * @tc.name sessionDevice0014
     * @tc.desc Verify a device query failure with code 801 maps to CAPABILITY_UNSUPPORTED.
     */
    it('sessionDevice0014', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.devicesError = 801;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'devicesError');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshDevices();
      expect(snapshot.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(snapshot.code).assertEqual(801);
      expect(snapshot.message.indexOf('getConnectedDevices') >= 0).assertTrue();
      expect(snapshot.devices.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_DEVICES_0015
     * @tc.name sessionDevice0015
     * @tc.desc Verify a device query failure with code 2900001 maps to SERVICE_STOPPED.
     */
    it('sessionDevice0015', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.devicesError = 2900001;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'devicesError');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshDevices();
      expect(snapshot.status).assertEqual(ProbeStatus.SERVICE_STOPPED);
      expect(snapshot.code).assertEqual(2900001);
      expect(snapshot.message.indexOf('getConnectedDevices') >= 0).assertTrue();
      expect(snapshot.devices.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_DEVICES_0016
     * @tc.name sessionDevice0016
     * @tc.desc Verify a device query failure with code 2900003 maps to BLUETOOTH_DISABLED.
     */
    it('sessionDevice0016', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.devicesError = 2900003;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'devicesError');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshDevices();
      expect(snapshot.status).assertEqual(ProbeStatus.BLUETOOTH_DISABLED);
      expect(snapshot.code).assertEqual(2900003);
      expect(snapshot.message.indexOf('getConnectedDevices') >= 0).assertTrue();
      expect(snapshot.devices.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_DEVICES_0017
     * @tc.name sessionDevice0017
     * @tc.desc Verify a device query failure with code 2900004 maps to PROFILE_UNSUPPORTED.
     */
    it('sessionDevice0017', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.devicesError = 2900004;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'devicesError');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshDevices();
      expect(snapshot.status).assertEqual(ProbeStatus.PROFILE_UNSUPPORTED);
      expect(snapshot.code).assertEqual(2900004);
      expect(snapshot.message.indexOf('getConnectedDevices') >= 0).assertTrue();
      expect(snapshot.devices.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SESSION_DEVICES_0018
     * @tc.name sessionDevice0018
     * @tc.desc Verify a device query failure with code 2900099 maps to FAILED.
     */
    it('sessionDevice0018', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.devicesError = 2900099;
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'devicesError');
      session.ensureProfile();
      const snapshot: ProfileSnapshot = session.refreshDevices();
      expect(snapshot.status).assertEqual(ProbeStatus.FAILED);
      expect(snapshot.code).assertEqual(2900099);
      expect(snapshot.message.indexOf('getConnectedDevices') >= 0).assertTrue();
      expect(snapshot.devices.length).assertEqual(0);
    });
  });
}
