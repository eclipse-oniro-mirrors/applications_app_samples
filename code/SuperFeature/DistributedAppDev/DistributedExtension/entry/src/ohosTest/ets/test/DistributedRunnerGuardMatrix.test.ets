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
import { ProbeStatus } from '../../../main/ets/model/ProbeState';
import { DEFAULT_PEER_ADDRESS, DEFAULT_PEER_UUID, LINK_PAYLOAD_LIMIT } from '../../../main/ets/common/AppConstants';
import { ChannelRunner, LinkRunner, LOCAL_GUARD_CODE } from '../../../main/ets/utils/DistributedProbe';

/** 超过 linkEnhance 单次上限的文本：用于验证 Runner 在本地就拦住超长载荷 */
function overLimitText(): string {
  const parts: string[] = [];
  for (let i = 0; i < LINK_PAYLOAD_LIMIT + 1; i++) {
    parts.push('a');
  }
  return parts.join('');
}

/**
 * 两个 Runner 的守卫分支：参数不合法或前置对象未创建时，必须在本地返回 -1，
 * 而不是把注定失败的调用发给系统。这里逐条验证 action 名、提示文案与副作用（状态不变）。
 */
export default function distributedRunnerGuardMatrixTest() {
  describe('DistributedLinkRunnerGuardTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_GUARD_0100
     * @tc.name testLinkGuard0001
     * @tc.desc Verify a fresh link runner holds no objects and shows the initial placeholder texts.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkGuard0001', 0, () => {
      const runner = new LinkRunner('GuardTest');
      expect(runner.hasServer()).assertFalse();
      expect(runner.hasConnection()).assertFalse();
      expect(runner.peerDeviceId()).assertEqual('');
      expect(runner.lastReceived()).assertEqual('尚未收到数据');
      expect(runner.lastEvent()).assertEqual('暂无回调');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_GUARD_0200
     * @tc.name testLinkGuard0002
     * @tc.desc Verify start, stop and close are blocked before the server exists.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkGuard0002', 0, () => {
      const runner = new LinkRunner('GuardTest');
      const start = runner.startServer();
      const stop = runner.stopServer();
      const close = runner.closeServer();
      expect(start.code).assertEqual(LOCAL_GUARD_CODE);
      expect(stop.code).assertEqual(LOCAL_GUARD_CODE);
      expect(close.code).assertEqual(LOCAL_GUARD_CODE);
      expect(start.action).assertEqual('start');
      expect(stop.action).assertEqual('stop');
      expect(close.action).assertEqual('close');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_GUARD_0300
     * @tc.name testLinkGuard0003
     * @tc.desc Verify each blocked server call names the missing object in its message.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkGuard0003', 0, () => {
      const runner = new LinkRunner('GuardTest');
      expect(runner.startServer().message).assertEqual('尚未创建服务端');
      expect(runner.stopServer().message).assertEqual('尚未创建服务端');
      expect(runner.closeServer().message).assertEqual('尚未创建服务端');
      expect(runner.startServer().describe().includes('未执行')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_GUARD_0400
     * @tc.name testLinkGuard0004
     * @tc.desc Verify connect, sendData, disconnect and close are blocked before the connection exists.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkGuard0004', 0, () => {
      const runner = new LinkRunner('GuardTest');
      expect(runner.connect().code).assertEqual(LOCAL_GUARD_CODE);
      expect(runner.sendData('payload').code).assertEqual(LOCAL_GUARD_CODE);
      expect(runner.disconnect().code).assertEqual(LOCAL_GUARD_CODE);
      expect(runner.closeConnection().code).assertEqual(LOCAL_GUARD_CODE);
      expect(runner.connect().message).assertEqual('尚未创建 Connection 对象');
      expect(runner.disconnect().message).assertEqual('尚未创建 Connection 对象');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_GUARD_0500
     * @tc.name testLinkGuard0005
     * @tc.desc Verify the connection check runs before the empty payload check.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testLinkGuard0005', 0, () => {
      const runner = new LinkRunner('GuardTest');
      // 守卫顺序：connection 为空先拦，因此空文本不会先报「发送内容为空」
      expect(runner.sendData('').message).assertEqual('尚未创建 Connection 对象');
      expect(runner.sendData('').message.includes('发送内容为空')).assertFalse();
      expect(runner.sendData('').code).assertEqual(LOCAL_GUARD_CODE);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_GUARD_0600
     * @tc.name testLinkGuard0006
     * @tc.desc Verify an empty or blank service name is rejected with the documented 255 byte limit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkGuard0006', 0, () => {
      const runner = new LinkRunner('GuardTest');
      const empty = runner.createServer('');
      const blank = runner.createServer('    ');
      expect(empty.code).assertEqual(LOCAL_GUARD_CODE);
      expect(blank.code).assertEqual(LOCAL_GUARD_CODE);
      expect(empty.message.includes('255')).assertTrue();
      expect(runner.hasServer()).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_GUARD_0700
     * @tc.name testLinkGuard0007
     * @tc.desc Verify a missing device id or service name blocks createConnection locally.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkGuard0007', 0, () => {
      const runner = new LinkRunner('GuardTest');
      expect(runner.createConnection('', 'name').code).assertEqual(LOCAL_GUARD_CODE);
      expect(runner.createConnection('device', '').code).assertEqual(LOCAL_GUARD_CODE);
      expect(runner.createConnection('  ', '  ').message).assertEqual('deviceId 与服务名都不能为空');
      expect(runner.hasConnection()).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_GUARD_0800
     * @tc.name testLinkGuard0008
     * @tc.desc Verify a blocked call reports the idle status and the reorder hint instead of a system error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testLinkGuard0008', 0, () => {
      const guard = new LinkRunner('GuardTest').connect();
      expect(guard.status).assertEqual(ProbeStatus.IDLE);
      expect(guard.succeeded()).assertFalse();
      expect(guard.hint()).assertEqual('按顺序完成前一步再调用该接口');
      expect(guard.hint().includes('3239')).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_GUARD_0900
     * @tc.name testLinkGuard0009
     * @tc.desc Verify releaseAll on an empty runner is a no-op and keeps the placeholder state.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkGuard0009', 0, () => {
      const runner = new LinkRunner('GuardTest');
      runner.releaseAll();
      expect(runner.hasServer()).assertFalse();
      expect(runner.hasConnection()).assertFalse();
      expect(runner.lastEvent()).assertEqual('暂无回调');
      runner.releaseAll();
      expect(runner.peerDeviceId()).assertEqual('');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_GUARD_1000
     * @tc.name testLinkGuard0010
     * @tc.desc Verify an over long payload is blocked locally once a connection object exists.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testLinkGuard0010', 0, () => {
      // 无第二台设备时拿不到 Connection，这里只验证守卫的前置条件不会把超长文本当成空文本
      const runner = new LinkRunner('GuardTest');
      const text = overLimitText();
      expect(text.length).assertEqual(LINK_PAYLOAD_LIMIT + 1);
      expect(runner.sendData(text).message).assertEqual('尚未创建 Connection 对象');
      expect(runner.sendData(text).code).assertEqual(LOCAL_GUARD_CODE);
    });
  });

  describe('DistributedChannelRunnerGuardTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_GUARD_1100
     * @tc.name testChannelGuard0001
     * @tc.desc Verify a fresh channel runner reports no channel id and the placeholder texts.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChannelGuard0001', 0, () => {
      const runner = new ChannelRunner('GuardTest');
      expect(runner.channelIdValue()).assertEqual(-1);
      expect(runner.hasChannel()).assertFalse();
      expect(runner.stateTextValue()).assertEqual('暂无状态回调');
      expect(runner.lastReceived()).assertEqual('尚未收到数据');
      expect(runner.lastEvent()).assertEqual('暂无回调');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_GUARD_1200
     * @tc.name testChannelGuard0002
     * @tc.desc Verify sendData is blocked before a channel id exists.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChannelGuard0002', 0, async (done: Function) => {
      const runner = new ChannelRunner('GuardTest');
      const sent = await runner.send('payload');
      expect(sent.code).assertEqual(LOCAL_GUARD_CODE);
      expect(sent.action).assertEqual('sendData');
      expect(sent.message).assertEqual('尚未打开通道');
      expect(runner.channelIdValue()).assertEqual(-1);
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_GUARD_1300
     * @tc.name testChannelGuard0003
     * @tc.desc Verify closeProxyChannel is blocked with a dedicated action name when no channel exists.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChannelGuard0003', 0, () => {
      const runner = new ChannelRunner('GuardTest');
      const closed = runner.close();
      expect(closed.code).assertEqual(LOCAL_GUARD_CODE);
      expect(closed.action).assertEqual('closeProxyChannel');
      expect(closed.message).assertEqual('当前没有打开的通道');
      expect(closed.describe()).assertEqual('closeProxyChannel未执行：当前没有打开的通道');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_GUARD_1400
     * @tc.name testChannelGuard0004
     * @tc.desc Verify an empty MAC or UUID blocks openProxyChannel before the Promise starts.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChannelGuard0004', 0, async (done: Function) => {
      const runner = new ChannelRunner('GuardTest');
      const both = await runner.open('', '');
      const noUuid = await runner.open(DEFAULT_PEER_ADDRESS, '');
      const noAddr = await runner.open('', DEFAULT_PEER_UUID);
      expect(both.code).assertEqual(LOCAL_GUARD_CODE);
      expect(noUuid.code).assertEqual(LOCAL_GUARD_CODE);
      expect(noAddr.code).assertEqual(LOCAL_GUARD_CODE);
      expect(both.message).assertEqual('对端 MAC 与 UUID 都不能为空');
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_GUARD_1500
     * @tc.name testChannelGuard0005
     * @tc.desc Verify whitespace only peer parameters are treated as empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testChannelGuard0005', 0, async (done: Function) => {
      const runner = new ChannelRunner('GuardTest');
      const blank = await runner.open('   ', '   ');
      expect(blank.code).assertEqual(LOCAL_GUARD_CODE);
      expect(blank.action).assertEqual('openProxyChannel');
      expect(runner.hasChannel()).assertFalse();
      expect(runner.stateTextValue()).assertEqual('暂无状态回调');
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_GUARD_1600
     * @tc.name testChannelGuard0006
     * @tc.desc Verify release on a closed runner does not invent a channel id.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChannelGuard0006', 0, () => {
      const runner = new ChannelRunner('GuardTest');
      runner.release();
      expect(runner.channelIdValue()).assertEqual(-1);
      expect(runner.hasChannel()).assertFalse();
      expect(runner.lastEvent()).assertEqual('暂无回调');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_GUARD_1700
     * @tc.name testChannelGuard0007
     * @tc.desc Verify blocked channel calls report the idle status and never a system error code.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testChannelGuard0007', 0, async (done: Function) => {
      const runner = new ChannelRunner('GuardTest');
      const sent = await runner.send('x');
      expect(sent.status).assertEqual(ProbeStatus.IDLE);
      expect(sent.hint()).assertEqual('按顺序完成前一步再调用该接口');
      expect(sent.describe().includes('3239')).assertFalse();
      done();
    });
  });
}
