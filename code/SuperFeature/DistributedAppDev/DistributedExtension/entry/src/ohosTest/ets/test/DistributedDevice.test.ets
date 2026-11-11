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

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import {
  BLUETOOTH_PERMISSION,
  DATASYNC_PERMISSION,
  DEFAULT_PEER_ADDRESS,
  DEFAULT_PEER_UUID,
  DEFAULT_SERVER_NAME
} from '../../../main/ets/common/AppConstants';
import { ERROR_CODE_CAPABILITY_UNSUPPORTED, ProbeStatus, classifyErrorCode } from '../../../main/ets/model/ProbeState';
import {
  ChannelRunner,
  LinkRunner,
  LOCAL_GUARD_CODE,
  LOCAL_THROWN_CODE,
  ProbeOutcome,
  probeEnums,
  probeSyscap,
  readExtensionInfo
} from '../../../main/ets/utils/DistributedProbe';
import { checkPermission } from '../../../main/ets/utils/PermissionUtil';

const EXTENSION_NAME: string = 'DistributedExtAbility';
/** 设备侧 openProxyChannel 可能长时间等待对端，用例用竞速方式取回结果 */
const OPEN_TIMEOUT_MS: number = 4000;
const LOCAL_TIMEOUT_CODE: number = -9001;

function timeoutOutcome(action: string): ProbeOutcome {
  return new ProbeOutcome(action, LOCAL_TIMEOUT_CODE, `${OPEN_TIMEOUT_MS} ms 内未返回结果`);
}

async function openWithTimeout(runner: ChannelRunner): Promise<ProbeOutcome> {
  const pending: Promise<ProbeOutcome> = runner.open(DEFAULT_PEER_ADDRESS, DEFAULT_PEER_UUID);
  const guard = new Promise<ProbeOutcome>((resolve: (value: ProbeOutcome) => void) => {
    setTimeout(() => {
      resolve(timeoutOutcome('openProxyChannel'));
    }, OPEN_TIMEOUT_MS);
  });
  return Promise.race<ProbeOutcome>([pending, guard]);
}

export default function distributedDeviceTest() {
  describe('DistributedExtensionDeviceTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DEVICE_0100
     * @tc.name deviceExtensionRegistered
     * @tc.desc Verify bundleManager reports the distributed extension declared in module.json5.
     */
    it('deviceExtensionRegistered', 0, () => {
      const result = readExtensionInfo();
      expect(result.code).assertEqual(0);
      expect(result.declared).assertTrue();
      expect(result.name).assertEqual(EXTENSION_NAME);
      expect(result.total > 1).assertTrue();
      expect(result.describe().includes(EXTENSION_NAME)).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DEVICE_0200
     * @tc.name deviceExtensionTypeName
     * @tc.desc Verify the read back extension type is the distributed type declared by the API.
     */
    it('deviceExtensionTypeName', 0, () => {
      const result = readExtensionInfo();
      expect(result.typeName.length > 0).assertTrue();
      expect(result.typeName.toLowerCase().includes('distribut')).assertTrue();
      // message 里记的就是「扩展名 / 类型名」这一对：两者都对上才能证明类型名真的被读到
      expect(result.message).assertEqual(`${result.name} / ${result.typeName}`);
      expect(result.declared).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DEVICE_0300
     * @tc.name deviceSyscapProbe
     * @tc.desc Verify canIUse returns the syscap state and maps a missing capability to 801.
     */
    it('deviceSyscapProbe', 0, () => {
      const outcome = probeSyscap();
      expect(outcome.action).assertEqual('canIUse');
      expect(outcome.message.length > 0).assertTrue();
      const allowed: boolean = outcome.code === 0 || outcome.code === ERROR_CODE_CAPABILITY_UNSUPPORTED;
      expect(allowed).assertTrue();
      if (outcome.code === 0) {
        expect(outcome.succeeded()).assertTrue();
        expect(outcome.hint().length > 0).assertTrue();
      } else {
        expect(outcome.code).assertEqual(ERROR_CODE_CAPABILITY_UNSUPPORTED);
        expect(outcome.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
        expect(outcome.hint().includes('SystemCapability')).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DEVICE_0400
     * @tc.name deviceEnumSnapshot
     * @tc.desc Verify the runtime LinkType and ChannelState values match the constants used by the pages.
     */
    it('deviceEnumSnapshot', 0, () => {
      const snapshot = probeEnums();
      expect(snapshot.staticCollaborateAccept).assertEqual(0);
      expect(snapshot.describe().length > 0).assertTrue();
      if (snapshot.code === 0) {
        expect(snapshot.consistent()).assertTrue();
        expect(snapshot.runtimeLinkType).assertEqual(0);
        expect(snapshot.runtimeChannelResume).assertEqual(1);
      } else {
        expect(snapshot.runtimeLinkType).assertEqual(-1);
        expect(snapshot.message.length > 0).assertTrue();
      }
    });
  });

  describe('DistributedLinkDeviceTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DEVICE_0500
     * @tc.name deviceLinkServerGuards
     * @tc.desc Verify the server calls are blocked before createServer instead of failing on device.
     */
    it('deviceLinkServerGuards', 0, () => {
      const runner = new LinkRunner('LinkEnhanceTest');
      const start = runner.startServer();
      const stop = runner.stopServer();
      const close = runner.closeServer();
      expect(start.code).assertEqual(LOCAL_GUARD_CODE);
      expect(stop.code).assertEqual(LOCAL_GUARD_CODE);
      expect(close.code).assertEqual(LOCAL_GUARD_CODE);
      expect(start.describe().includes('未执行')).assertTrue();
      expect(start.hint().length > 0).assertTrue();
      expect(runner.hasServer()).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DEVICE_0600
     * @tc.name deviceLinkConnectionGuards
     * @tc.desc Verify connect / sendData / disconnect / close need a Connection object first.
     */
    it('deviceLinkConnectionGuards', 0, () => {
      const runner = new LinkRunner('LinkEnhanceTest');
      expect(runner.connect().code).assertEqual(LOCAL_GUARD_CODE);
      expect(runner.sendData('payload').code).assertEqual(LOCAL_GUARD_CODE);
      expect(runner.disconnect().code).assertEqual(LOCAL_GUARD_CODE);
      expect(runner.closeConnection().code).assertEqual(LOCAL_GUARD_CODE);
      expect(runner.hasConnection()).assertFalse();
      expect(runner.lastReceived()).assertEqual('尚未收到数据');
      expect(runner.lastEvent()).assertEqual('暂无回调');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DEVICE_0700
     * @tc.name deviceLinkCreateServerEmptyName
     * @tc.desc Verify an empty or blank service name is rejected locally before createServer is called.
     */
    it('deviceLinkCreateServerEmptyName', 0, () => {
      const runner = new LinkRunner('LinkEnhanceTest');
      expect(runner.createServer('').code).assertEqual(LOCAL_GUARD_CODE);
      expect(runner.createServer('   ').code).assertEqual(LOCAL_GUARD_CODE);
      expect(runner.hasServer()).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DEVICE_0800
     * @tc.name deviceLinkCreateServerReal
     * @tc.desc Verify linkEnhance.createServer returns either success or a documented error code.
     */
    it('deviceLinkCreateServerReal', 0, () => {
      const runner = new LinkRunner('LinkEnhanceTest');
      const created = runner.createServer(DEFAULT_SERVER_NAME);
      console.info(`[DistributedTest] createServer -> ${created.describe()}`);
      expect(created.action).assertEqual('createServer');
      expect(created.message.length > 0).assertTrue();
      expect(created.code === LOCAL_GUARD_CODE).assertFalse();
      if (created.succeeded()) {
        expect(runner.hasServer()).assertTrue();
        const started = runner.startServer();
        expect(started.code === LOCAL_GUARD_CODE).assertFalse();
        if (started.succeeded()) {
          const stopped = runner.stopServer();
          expect(stopped.code === LOCAL_GUARD_CODE).assertFalse();
        }
      } else {
        expect(created.code === LOCAL_THROWN_CODE || created.code > 0).assertTrue();
        expect(runner.hasServer()).assertFalse();
      }
      runner.releaseAll();
      expect(runner.hasServer()).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DEVICE_0900
     * @tc.name deviceLinkCreateConnectionEmptyParam
     * @tc.desc Verify createConnection refuses an empty deviceId or service name without touching the device.
     */
    it('deviceLinkCreateConnectionEmptyParam', 0, () => {
      const runner = new LinkRunner('LinkEnhanceTest');
      expect(runner.createConnection('', DEFAULT_SERVER_NAME).code).assertEqual(LOCAL_GUARD_CODE);
      expect(runner.createConnection('device', '').code).assertEqual(LOCAL_GUARD_CODE);
      expect(runner.hasConnection()).assertFalse();
    });
  });

  describe('DistributedChannelDeviceTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DEVICE_1000
     * @tc.name deviceChannelOpenGuards
     * @tc.desc Verify openProxyChannel is blocked locally when the peer parameters are empty.
     */
    it('deviceChannelOpenGuards', 0, async (done: Function) => {
      const runner = new ChannelRunner('ProxyChannelTest');
      const empty = await runner.open('', '');
      const noUuid = await runner.open(DEFAULT_PEER_ADDRESS, '');
      expect(empty.code).assertEqual(LOCAL_GUARD_CODE);
      expect(noUuid.code).assertEqual(LOCAL_GUARD_CODE);
      expect(empty.action).assertEqual('openProxyChannel');
      expect(runner.hasChannel()).assertFalse();
      expect(runner.channelIdValue()).assertEqual(-1);
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DEVICE_1100
     * @tc.name deviceChannelSendCloseGuards
     * @tc.desc Verify sendData and closeProxyChannel need an open channel id first.
     */
    it('deviceChannelSendCloseGuards', 0, async (done: Function) => {
      const runner = new ChannelRunner('ProxyChannelTest');
      const sent = await runner.send('payload');
      const closed = runner.close();
      expect(sent.code).assertEqual(LOCAL_GUARD_CODE);
      expect(closed.code).assertEqual(LOCAL_GUARD_CODE);
      expect(sent.describe().includes('未执行')).assertTrue();
      expect(runner.stateTextValue()).assertEqual('暂无状态回调');
      expect(runner.lastReceived()).assertEqual('尚未收到数据');
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DEVICE_1200
     * @tc.name deviceChannelOpenUnpairedPeer
     * @tc.desc Verify opening a channel to an absent peer returns a system error code or a real channel id.
     */
    it('deviceChannelOpenUnpairedPeer', 0, async (done: Function) => {
      const runner = new ChannelRunner('ProxyChannelTest');
      const outcome = await openWithTimeout(runner);
      console.info(`[DistributedTest] openProxyChannel -> ${outcome.describe()}`);
      expect(outcome.action).assertEqual('openProxyChannel');
      expect(outcome.message.length > 0).assertTrue();
      expect(outcome.code === LOCAL_GUARD_CODE).assertFalse();
      if (outcome.code === LOCAL_TIMEOUT_CODE) {
        expect(outcome.describe().includes('未返回结果')).assertTrue();
        expect(outcome.hint().length > 0).assertTrue();
      } else if (outcome.succeeded()) {
        expect(runner.hasChannel()).assertTrue();
        expect(runner.channelIdValue() >= 0).assertTrue();
        const closed = runner.close();
        expect(closed.code).assertEqual(0);
      } else {
        expect(runner.hasChannel()).assertFalse();
        expect(outcome.hint().length > 0).assertTrue();
      }
      runner.release();
      expect(runner.hasChannel()).assertFalse();
      done();
    });
  });

  describe('DistributedPermissionDeviceTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DEVICE_1300
     * @tc.name devicePermissionQuery
     * @tc.desc Verify both user granted permissions can be queried before any carrier call.
     */
    it('devicePermissionQuery', 0, () => {
      const datasync = checkPermission(DATASYNC_PERMISSION);
      const bluetooth = checkPermission(BLUETOOTH_PERMISSION);
      expect(datasync.code).assertEqual(0);
      expect(bluetooth.code).assertEqual(0);
      expect(datasync.name).assertEqual(DATASYNC_PERMISSION);
      expect(bluetooth.name).assertEqual(BLUETOOTH_PERMISSION);
      expect(datasync.describe().includes('DISTRIBUTED_DATASYNC')).assertTrue();
      expect(bluetooth.describe().includes('ACCESS_BLUETOOTH')).assertTrue();
      // 授权状态必须和展示文案一致：已授权就写已授权，未授权就必须带出错误码，不能两种说法
      expect(datasync.describe().includes(datasync.granted ? '已授权' : '未授权')).assertTrue();
      expect(bluetooth.describe().includes(bluetooth.granted ? '已授权' : '未授权')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DEVICE_1400
     * @tc.name devicePermissionHintAligned
     * @tc.desc Verify an unauthorized carrier call would be classified as a permission problem.
     */
    it('devicePermissionHintAligned', 0, () => {
      const datasync = checkPermission(DATASYNC_PERMISSION);
      if (!datasync.granted) {
        expect(classifyErrorCode(201)).assertEqual(ProbeStatus.PERMISSION_DENIED);
        expect(datasync.describe().includes('未授权')).assertTrue();
      } else {
        expect(datasync.describe().includes('已授权')).assertTrue();
      }
    });
  });
}
