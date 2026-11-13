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
 * 会话调用链矩阵。
 *
 * 六种操作两两相连得到三十六条二步链，再补十九条精选链，覆盖「先订阅再释放」
 * 「未订阅就取消订阅」「释放后再创建」这类靠人工想不到的组合。
 * 期望值由镜像状态机算出，断言分别落在状态、实例、订阅、四类调用计数上。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { ProbeStatus } from '../../../main/ets/model/ProfileState';
import { ProfileSession } from '../../../main/ets/utils/ProfileSession';
import { ProfileStub, stubFactoryOf } from './support/ProfileStub';

/** 生成 count 个连续尾号的设备地址 */
function devicesOf(count: number): string[] {
  const list: string[] = [];
  for (let index = 0; index < count; index++) {
    list.push('A1:B2:C3:D4:E5:F' + index);
  }
  return list;
}

export default function bluetoothProfileSessionChainTest() {
  describe('BluetoothProfileSessionChainTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0001
     * @tc.name sessionChain0001
     * @tc.desc Verify the 2 step chain from create to create settles in status READY.
     */
    it('sessionChain0001', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0001');
      session.ensureProfile();
      session.ensureProfile();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0002
     * @tc.name sessionChain0002
     * @tc.desc Verify the 2 step chain from create to subscribe settles in status READY.
     */
    it('sessionChain0002', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0002');
      session.ensureProfile();
      session.subscribe();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(true);
      expect(stub.onCalls).assertEqual(1);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0003
     * @tc.name sessionChain0003
     * @tc.desc Verify the 2 step chain from create to device refresh settles in status READY.
     */
    it('sessionChain0003', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0003');
      session.ensureProfile();
      session.refreshDevices();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(1);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0004
     * @tc.name sessionChain0004
     * @tc.desc Verify the 2 step chain from create to state query settles in status READY.
     */
    it('sessionChain0004', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0004');
      session.ensureProfile();
      session.refreshState('A1:B2:C3:D4:E5:F6');
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0005
     * @tc.name sessionChain0005
     * @tc.desc Verify the 2 step chain from create to release settles in status IDLE.
     */
    it('sessionChain0005', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0005');
      session.ensureProfile();
      session.release();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.IDLE);
      expect(session.isCreated()).assertEqual(false);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0006
     * @tc.name sessionChain0006
     * @tc.desc Verify the 2 step chain from create to unsubscribe settles in status READY.
     */
    it('sessionChain0006', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0006');
      session.ensureProfile();
      session.unsubscribe();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0007
     * @tc.name sessionChain0007
     * @tc.desc Verify the 2 step chain from subscribe to create settles in status READY.
     */
    it('sessionChain0007', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0007');
      session.subscribe();
      session.ensureProfile();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0008
     * @tc.name sessionChain0008
     * @tc.desc Verify the 2 step chain from subscribe to subscribe settles in status READY.
     */
    it('sessionChain0008', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0008');
      session.subscribe();
      session.subscribe();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(true);
      expect(stub.onCalls).assertEqual(1);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0009
     * @tc.name sessionChain0009
     * @tc.desc Verify the 2 step chain from subscribe to device refresh settles in status READY.
     */
    it('sessionChain0009', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0009');
      session.subscribe();
      session.refreshDevices();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(1);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0010
     * @tc.name sessionChain0010
     * @tc.desc Verify the 2 step chain from subscribe to state query settles in status READY.
     */
    it('sessionChain0010', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0010');
      session.subscribe();
      session.refreshState('A1:B2:C3:D4:E5:F6');
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0011
     * @tc.name sessionChain0011
     * @tc.desc Verify the 2 step chain from subscribe to release settles in status IDLE.
     */
    it('sessionChain0011', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0011');
      session.subscribe();
      session.release();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.IDLE);
      expect(session.isCreated()).assertEqual(false);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0012
     * @tc.name sessionChain0012
     * @tc.desc Verify the 2 step chain from subscribe to unsubscribe settles in status READY.
     */
    it('sessionChain0012', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0012');
      session.subscribe();
      session.unsubscribe();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0013
     * @tc.name sessionChain0013
     * @tc.desc Verify the 2 step chain from device refresh to create settles in status READY.
     */
    it('sessionChain0013', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0013');
      session.refreshDevices();
      session.ensureProfile();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0014
     * @tc.name sessionChain0014
     * @tc.desc Verify the 2 step chain from device refresh to subscribe settles in status READY.
     */
    it('sessionChain0014', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0014');
      session.refreshDevices();
      session.subscribe();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(true);
      expect(stub.onCalls).assertEqual(1);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0015
     * @tc.name sessionChain0015
     * @tc.desc Verify the 2 step chain from device refresh to device refresh settles in status READY.
     */
    it('sessionChain0015', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0015');
      session.refreshDevices();
      session.refreshDevices();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(1);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0016
     * @tc.name sessionChain0016
     * @tc.desc Verify the 2 step chain from device refresh to state query settles in status READY.
     */
    it('sessionChain0016', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0016');
      session.refreshDevices();
      session.refreshState('A1:B2:C3:D4:E5:F6');
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0017
     * @tc.name sessionChain0017
     * @tc.desc Verify the 2 step chain from device refresh to release settles in status IDLE.
     */
    it('sessionChain0017', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0017');
      session.refreshDevices();
      session.release();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.IDLE);
      expect(session.isCreated()).assertEqual(false);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0018
     * @tc.name sessionChain0018
     * @tc.desc Verify the 2 step chain from device refresh to unsubscribe settles in status READY.
     */
    it('sessionChain0018', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0018');
      session.refreshDevices();
      session.unsubscribe();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0019
     * @tc.name sessionChain0019
     * @tc.desc Verify the 2 step chain from state query to create settles in status READY.
     */
    it('sessionChain0019', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0019');
      session.refreshState('A1:B2:C3:D4:E5:F6');
      session.ensureProfile();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0020
     * @tc.name sessionChain0020
     * @tc.desc Verify the 2 step chain from state query to subscribe settles in status READY.
     */
    it('sessionChain0020', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0020');
      session.refreshState('A1:B2:C3:D4:E5:F6');
      session.subscribe();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(true);
      expect(stub.onCalls).assertEqual(1);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0021
     * @tc.name sessionChain0021
     * @tc.desc Verify the 2 step chain from state query to device refresh settles in status READY.
     */
    it('sessionChain0021', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0021');
      session.refreshState('A1:B2:C3:D4:E5:F6');
      session.refreshDevices();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(1);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0022
     * @tc.name sessionChain0022
     * @tc.desc Verify the 2 step chain from state query to state query settles in status READY.
     */
    it('sessionChain0022', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0022');
      session.refreshState('A1:B2:C3:D4:E5:F6');
      session.refreshState('A1:B2:C3:D4:E5:F6');
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0023
     * @tc.name sessionChain0023
     * @tc.desc Verify the 2 step chain from state query to release settles in status IDLE.
     */
    it('sessionChain0023', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0023');
      session.refreshState('A1:B2:C3:D4:E5:F6');
      session.release();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.IDLE);
      expect(session.isCreated()).assertEqual(false);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0024
     * @tc.name sessionChain0024
     * @tc.desc Verify the 2 step chain from state query to unsubscribe settles in status READY.
     */
    it('sessionChain0024', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0024');
      session.refreshState('A1:B2:C3:D4:E5:F6');
      session.unsubscribe();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0025
     * @tc.name sessionChain0025
     * @tc.desc Verify the 2 step chain from release to create settles in status READY.
     */
    it('sessionChain0025', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0025');
      session.release();
      session.ensureProfile();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0026
     * @tc.name sessionChain0026
     * @tc.desc Verify the 2 step chain from release to subscribe settles in status READY.
     */
    it('sessionChain0026', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0026');
      session.release();
      session.subscribe();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0027
     * @tc.name sessionChain0027
     * @tc.desc Verify the 2 step chain from release to device refresh settles in status READY.
     */
    it('sessionChain0027', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0027');
      session.release();
      session.refreshDevices();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0028
     * @tc.name sessionChain0028
     * @tc.desc Verify the 2 step chain from release to state query settles in status READY.
     */
    it('sessionChain0028', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0028');
      session.release();
      session.refreshState('A1:B2:C3:D4:E5:F6');
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0029
     * @tc.name sessionChain0029
     * @tc.desc Verify the 2 step chain from release to release settles in status IDLE.
     */
    it('sessionChain0029', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0029');
      session.release();
      session.release();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.IDLE);
      expect(session.isCreated()).assertEqual(false);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0030
     * @tc.name sessionChain0030
     * @tc.desc Verify the 2 step chain from release to unsubscribe settles in status IDLE.
     */
    it('sessionChain0030', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0030');
      session.release();
      session.unsubscribe();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.IDLE);
      expect(session.isCreated()).assertEqual(false);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0031
     * @tc.name sessionChain0031
     * @tc.desc Verify the 2 step chain from unsubscribe to create settles in status READY.
     */
    it('sessionChain0031', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0031');
      session.unsubscribe();
      session.ensureProfile();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0032
     * @tc.name sessionChain0032
     * @tc.desc Verify the 2 step chain from unsubscribe to subscribe settles in status READY.
     */
    it('sessionChain0032', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0032');
      session.unsubscribe();
      session.subscribe();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0033
     * @tc.name sessionChain0033
     * @tc.desc Verify the 2 step chain from unsubscribe to device refresh settles in status READY.
     */
    it('sessionChain0033', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0033');
      session.unsubscribe();
      session.refreshDevices();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0034
     * @tc.name sessionChain0034
     * @tc.desc Verify the 2 step chain from unsubscribe to state query settles in status READY.
     */
    it('sessionChain0034', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0034');
      session.unsubscribe();
      session.refreshState('A1:B2:C3:D4:E5:F6');
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0035
     * @tc.name sessionChain0035
     * @tc.desc Verify the 2 step chain from unsubscribe to release settles in status IDLE.
     */
    it('sessionChain0035', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0035');
      session.unsubscribe();
      session.release();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.IDLE);
      expect(session.isCreated()).assertEqual(false);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0036
     * @tc.name sessionChain0036
     * @tc.desc Verify the 2 step chain from unsubscribe to unsubscribe settles in status IDLE.
     */
    it('sessionChain0036', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0036');
      session.unsubscribe();
      session.unsubscribe();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.IDLE);
      expect(session.isCreated()).assertEqual(false);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0037
     * @tc.name sessionChain0037
     * @tc.desc Verify the 3 step chain from create to device refresh settles in status READY.
     */
    it('sessionChain0037', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0037');
      session.ensureProfile();
      session.subscribe();
      session.refreshDevices();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(true);
      expect(stub.onCalls).assertEqual(1);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(1);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0038
     * @tc.name sessionChain0038
     * @tc.desc Verify the 3 step chain from create to state query settles in status READY.
     */
    it('sessionChain0038', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0038');
      session.ensureProfile();
      session.subscribe();
      session.refreshState('A1:B2:C3:D4:E5:F6');
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(true);
      expect(stub.onCalls).assertEqual(1);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0039
     * @tc.name sessionChain0039
     * @tc.desc Verify the 3 step chain from create to release settles in status IDLE.
     */
    it('sessionChain0039', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0039');
      session.ensureProfile();
      session.subscribe();
      session.release();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.IDLE);
      expect(session.isCreated()).assertEqual(false);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(1);
      expect(stub.offCalls).assertEqual(1);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0040
     * @tc.name sessionChain0040
     * @tc.desc Verify the 3 step chain from create to release settles in status IDLE.
     */
    it('sessionChain0040', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0040');
      session.ensureProfile();
      session.refreshDevices();
      session.release();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.IDLE);
      expect(session.isCreated()).assertEqual(false);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(1);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0041
     * @tc.name sessionChain0041
     * @tc.desc Verify the 3 step chain from create to subscribe settles in status READY.
     */
    it('sessionChain0041', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0041');
      session.ensureProfile();
      session.refreshState('A1:B2:C3:D4:E5:F6');
      session.subscribe();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(true);
      expect(stub.onCalls).assertEqual(1);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0042
     * @tc.name sessionChain0042
     * @tc.desc Verify the 3 step chain from create to subscribe settles in status READY.
     */
    it('sessionChain0042', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0042');
      session.ensureProfile();
      session.release();
      session.subscribe();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0043
     * @tc.name sessionChain0043
     * @tc.desc Verify the 3 step chain from create to state query settles in status READY.
     */
    it('sessionChain0043', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0043');
      session.ensureProfile();
      session.refreshDevices();
      session.refreshState('A1:B2:C3:D4:E5:F6');
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(1);
      expect(stub.stateCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0044
     * @tc.name sessionChain0044
     * @tc.desc Verify the 3 step chain from subscribe to unsubscribe settles in status READY.
     */
    it('sessionChain0044', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0044');
      session.subscribe();
      session.refreshDevices();
      session.unsubscribe();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(1);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0045
     * @tc.name sessionChain0045
     * @tc.desc Verify the 3 step chain from create to subscribe settles in status READY.
     */
    it('sessionChain0045', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0045');
      session.ensureProfile();
      session.unsubscribe();
      session.subscribe();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(true);
      expect(stub.onCalls).assertEqual(1);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0046
     * @tc.name sessionChain0046
     * @tc.desc Verify the 3 step chain from release to subscribe settles in status READY.
     */
    it('sessionChain0046', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0046');
      session.release();
      session.ensureProfile();
      session.subscribe();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(true);
      expect(stub.onCalls).assertEqual(1);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0047
     * @tc.name sessionChain0047
     * @tc.desc Verify the 3 step chain from subscribe to subscribe settles in status READY.
     */
    it('sessionChain0047', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0047');
      session.subscribe();
      session.unsubscribe();
      session.subscribe();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(true);
      expect(stub.onCalls).assertEqual(1);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0048
     * @tc.name sessionChain0048
     * @tc.desc Verify the 3 step chain from device refresh to release settles in status IDLE.
     */
    it('sessionChain0048', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0048');
      session.refreshDevices();
      session.subscribe();
      session.release();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.IDLE);
      expect(session.isCreated()).assertEqual(false);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(1);
      expect(stub.offCalls).assertEqual(1);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0049
     * @tc.name sessionChain0049
     * @tc.desc Verify the 4 step chain from create to release settles in status IDLE.
     */
    it('sessionChain0049', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0049');
      session.ensureProfile();
      session.subscribe();
      session.refreshDevices();
      session.release();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.IDLE);
      expect(session.isCreated()).assertEqual(false);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(1);
      expect(stub.offCalls).assertEqual(1);
      expect(stub.deviceCalls).assertEqual(1);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0050
     * @tc.name sessionChain0050
     * @tc.desc Verify the 4 step chain from create to unsubscribe settles in status READY.
     */
    it('sessionChain0050', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0050');
      session.ensureProfile();
      session.refreshDevices();
      session.refreshState('A1:B2:C3:D4:E5:F6');
      session.unsubscribe();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(1);
      expect(stub.stateCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0051
     * @tc.name sessionChain0051
     * @tc.desc Verify the 3 step chain from subscribe to device refresh settles in status READY.
     */
    it('sessionChain0051', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0051');
      session.subscribe();
      session.refreshState('A1:B2:C3:D4:E5:F6');
      session.refreshDevices();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(1);
      expect(stub.stateCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0052
     * @tc.name sessionChain0052
     * @tc.desc Verify the 3 step chain from create to device refresh settles in status READY.
     */
    it('sessionChain0052', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0052');
      session.ensureProfile();
      session.refreshDevices();
      session.refreshDevices();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(2);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0053
     * @tc.name sessionChain0053
     * @tc.desc Verify the 3 step chain from create to state query settles in status READY.
     */
    it('sessionChain0053', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0053');
      session.ensureProfile();
      session.refreshState('A1:B2:C3:D4:E5:F6');
      session.refreshState('A1:B2:C3:D4:E5:F6');
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0054
     * @tc.name sessionChain0054
     * @tc.desc Verify the 3 step chain from release to subscribe settles in status READY.
     */
    it('sessionChain0054', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0054');
      session.release();
      session.refreshDevices();
      session.subscribe();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(true);
      expect(stub.onCalls).assertEqual(1);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0055
     * @tc.name sessionChain0055
     * @tc.desc Verify the 3 step chain from unsubscribe to subscribe settles in status READY.
     */
    it('sessionChain0055', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0055');
      session.unsubscribe();
      session.refreshDevices();
      session.subscribe();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(true);
      expect(stub.onCalls).assertEqual(1);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0056
     * @tc.name sessionChain0056
     * @tc.desc Verify the 3 step chain from create to unsubscribe settles in status READY.
     */
    it('sessionChain0056', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0056');
      session.ensureProfile();
      session.unsubscribe();
      session.unsubscribe();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(0);
      expect(stub.offCalls).assertEqual(0);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CHAIN_0057
     * @tc.name sessionChain0057
     * @tc.desc Verify the 3 step chain from create to unsubscribe settles in status READY.
     */
    it('sessionChain0057', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 2);
      const session: ProfileSession = new ProfileSession(stubFactoryOf(stub), 'chain0057');
      session.ensureProfile();
      session.subscribe();
      session.unsubscribe();
      expect(session.getSnapshot().status).assertEqual(ProbeStatus.READY);
      expect(session.isCreated()).assertEqual(true);
      expect(session.isSubscribed()).assertEqual(false);
      expect(stub.onCalls).assertEqual(1);
      expect(stub.offCalls).assertEqual(1);
      expect(stub.deviceCalls).assertEqual(0);
      expect(stub.stateCalls).assertEqual(0);
    });
  });
}
