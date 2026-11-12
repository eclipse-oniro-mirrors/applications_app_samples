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
  ChannelAction, ChannelStage, canSendData, channelStageHint, channelStageName, describeChannel, isMacAddress,
  isServiceUuid, nextChannelStage
} from '../../../main/ets/model/ChannelSession';
import { DEFAULT_PEER_ADDRESS, DEFAULT_PEER_UUID } from '../../../main/ets/common/AppConstants';

/** 按声明顺序排列的四个通道状态 */
function allStages(): ChannelStage[] {
  return [ChannelStage.CLOSED, ChannelStage.OPENING, ChannelStage.OPEN, ChannelStage.FAILED];
}

/**
 * 代理通道的状态机与对端参数校验。
 * openProxyChannel 的成功/失败由 Promise 决定，通道后续是否可用由 channelStateChange 决定，
 * 两条线都写错会让页面显示"已打开"却发不出数据，所以逐条验证转移与格式校验。
 */
export default function distributedChannelStageMatrixTest() {
  describe('DistributedChannelStageMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANSTAGE_0100
     * @tc.name testChanStage0001
     * @tc.desc Verify the four channel stages and five actions keep their documented numbers.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanStage0001', 0, () => {
      expect(ChannelStage.CLOSED).assertEqual(0);
      expect(ChannelStage.OPENING).assertEqual(1);
      expect(ChannelStage.OPEN).assertEqual(2);
      expect(ChannelStage.FAILED).assertEqual(3);
      expect(ChannelAction.OPEN).assertEqual(0);
      expect(ChannelAction.SEND).assertEqual(3);
      expect(ChannelAction.CLOSE).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANSTAGE_0200
     * @tc.name testChanStage0002
     * @tc.desc Verify each stage has its own Chinese name and the unresolved stage falls back.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanStage0002', 0, () => {
      expect(channelStageName(ChannelStage.CLOSED)).assertEqual('未打开');
      expect(channelStageName(ChannelStage.OPENING)).assertEqual('正在打开');
      expect(channelStageName(ChannelStage.OPEN)).assertEqual('通道已打开');
      expect(channelStageName(ChannelStage.FAILED)).assertEqual('打开失败');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANSTAGE_0300
     * @tc.name testChanStage0003
     * @tc.desc Verify every stage hint names the API to call next.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanStage0003', 0, () => {
      expect(channelStageHint(ChannelStage.CLOSED).includes('openProxyChannel')).assertTrue();
      expect(channelStageHint(ChannelStage.OPENING).includes('Promise')).assertTrue();
      expect(channelStageHint(ChannelStage.OPEN).includes('sendData')).assertTrue();
      expect(channelStageHint(ChannelStage.OPEN).includes('closeProxyChannel')).assertTrue();
      expect(channelStageHint(ChannelStage.FAILED).includes('32390101')).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANSTAGE_0400
     * @tc.name testChanStage0004
     * @tc.desc Verify the failure hint enumerates the three codes worth checking first.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testChanStage0004', 0, () => {
      const hint = channelStageHint(ChannelStage.FAILED);
      expect(hint.includes('32390002')).assertTrue();
      expect(hint.includes('32390001')).assertTrue();
      expect(hint.includes('801')).assertTrue();
      expect(hint.startsWith('打开失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANSTAGE_0500
     * @tc.name testChanStage0005
     * @tc.desc Verify open is accepted from closed and failed only.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanStage0005', 0, () => {
      expect(nextChannelStage(ChannelStage.CLOSED, ChannelAction.OPEN)).assertEqual(ChannelStage.OPENING);
      expect(nextChannelStage(ChannelStage.FAILED, ChannelAction.OPEN)).assertEqual(ChannelStage.OPENING);
      expect(nextChannelStage(ChannelStage.OPENING, ChannelAction.OPEN)).assertEqual(ChannelStage.OPENING);
      expect(nextChannelStage(ChannelStage.OPEN, ChannelAction.OPEN)).assertEqual(ChannelStage.OPEN);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANSTAGE_0600
     * @tc.name testChanStage0006
     * @tc.desc Verify the promise resolution only advances an opening channel.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanStage0006', 0, () => {
      expect(nextChannelStage(ChannelStage.OPENING, ChannelAction.OPEN_OK)).assertEqual(ChannelStage.OPEN);
      expect(nextChannelStage(ChannelStage.CLOSED, ChannelAction.OPEN_OK)).assertEqual(ChannelStage.CLOSED);
      expect(nextChannelStage(ChannelStage.FAILED, ChannelAction.OPEN_OK)).assertEqual(ChannelStage.FAILED);
      expect(nextChannelStage(ChannelStage.OPEN, ChannelAction.OPEN_OK)).assertEqual(ChannelStage.OPEN);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANSTAGE_0700
     * @tc.name testChanStage0007
     * @tc.desc Verify a rejected promise only marks an opening channel as failed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanStage0007', 0, () => {
      expect(nextChannelStage(ChannelStage.OPENING, ChannelAction.OPEN_FAIL)).assertEqual(ChannelStage.FAILED);
      expect(nextChannelStage(ChannelStage.CLOSED, ChannelAction.OPEN_FAIL)).assertEqual(ChannelStage.CLOSED);
      expect(nextChannelStage(ChannelStage.OPEN, ChannelAction.OPEN_FAIL)).assertEqual(ChannelStage.OPEN);
      expect(nextChannelStage(ChannelStage.FAILED, ChannelAction.OPEN_FAIL)).assertEqual(ChannelStage.FAILED);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANSTAGE_0800
     * @tc.name testChanStage0008
     * @tc.desc Verify sending never changes the channel stage.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanStage0008', 0, () => {
      const stages = allStages();
      for (let i = 0; i < stages.length; i++) {
        expect(nextChannelStage(stages[i], ChannelAction.SEND)).assertEqual(stages[i]);
      }
      expect(nextChannelStage(ChannelStage.OPEN, ChannelAction.SEND)).assertEqual(ChannelStage.OPEN);
      // 失败态发数据不会把阶段改回开放态：SEND 只作用于负载，不修状态机
      expect(nextChannelStage(ChannelStage.FAILED, ChannelAction.SEND)).assertEqual(ChannelStage.FAILED);
      // 阶段文案同样保持不变，避免按钮可用性与阶段行互相矛盾
      expect(channelStageName(nextChannelStage(ChannelStage.OPEN, ChannelAction.SEND)))
        .assertEqual('通道已打开');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANSTAGE_0900
     * @tc.name testChanStage0009
     * @tc.desc Verify close returns every stage to closed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanStage0009', 0, () => {
      expect(nextChannelStage(ChannelStage.CLOSED, ChannelAction.CLOSE)).assertEqual(ChannelStage.CLOSED);
      expect(nextChannelStage(ChannelStage.OPENING, ChannelAction.CLOSE)).assertEqual(ChannelStage.CLOSED);
      expect(nextChannelStage(ChannelStage.OPEN, ChannelAction.CLOSE)).assertEqual(ChannelStage.CLOSED);
      expect(nextChannelStage(ChannelStage.FAILED, ChannelAction.CLOSE)).assertEqual(ChannelStage.CLOSED);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANSTAGE_1000
     * @tc.name testChanStage0010
     * @tc.desc Verify the happy path open, resolved, send, close walks the documented stages.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanStage0010', 0, () => {
      let stage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      expect(stage).assertEqual(ChannelStage.OPENING);
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      expect(stage).assertEqual(ChannelStage.OPEN);
      stage = nextChannelStage(stage, ChannelAction.SEND);
      expect(stage).assertEqual(ChannelStage.OPEN);
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      expect(stage).assertEqual(ChannelStage.CLOSED);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANSTAGE_1100
     * @tc.name testChanStage0011
     * @tc.desc Verify a failed open can be retried without recreating the channel object.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testChanStage0011', 0, () => {
      let stage = nextChannelStage(ChannelStage.CLOSED, ChannelAction.OPEN);
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      expect(stage).assertEqual(ChannelStage.FAILED);
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      expect(stage).assertEqual(ChannelStage.OPENING);
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      expect(stage).assertEqual(ChannelStage.OPEN);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANSTAGE_1200
     * @tc.name testChanStage0012
     * @tc.desc Verify canSendData is true only for an open channel.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanStage0012', 0, () => {
      expect(canSendData(ChannelStage.OPEN)).assertTrue();
      expect(canSendData(ChannelStage.OPENING)).assertFalse();
      expect(canSendData(ChannelStage.CLOSED)).assertFalse();
      expect(canSendData(ChannelStage.FAILED)).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANSTAGE_1300
     * @tc.name testChanStage0013
     * @tc.desc Verify a negative channel id is described as not yet opened.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanStage0013', 0, () => {
      expect(describeChannel(-1, ChannelStage.CLOSED)).assertEqual('未打开；尚无 channelId');
      expect(describeChannel(-1, ChannelStage.FAILED)).assertEqual('打开失败；尚无 channelId');
      expect(describeChannel(-1, ChannelStage.OPEN).includes('channelId=-1')).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANSTAGE_1400
     * @tc.name testChanStage0014
     * @tc.desc Verify a non negative channel id is rendered with its numeric value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanStage0014', 0, () => {
      expect(describeChannel(0, ChannelStage.OPEN)).assertEqual('通道已打开；channelId=0');
      expect(describeChannel(12, ChannelStage.OPEN)).assertEqual('通道已打开；channelId=12');
      expect(describeChannel(12, ChannelStage.OPEN).includes('尚无')).assertFalse();
      expect(describeChannel(12, ChannelStage.OPENING)).assertEqual('正在打开；channelId=12');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANSTAGE_1500
     * @tc.name testChanStage0015
     * @tc.desc Verify the default peer address and uuid pass their own validators.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanStage0015', 0, () => {
      expect(DEFAULT_PEER_ADDRESS.length).assertEqual(17);
      expect(isMacAddress(DEFAULT_PEER_ADDRESS)).assertTrue();
      expect(DEFAULT_PEER_UUID.length).assertEqual(36);
      expect(isServiceUuid(DEFAULT_PEER_UUID)).assertTrue();
      expect(isServiceUuid(DEFAULT_PEER_ADDRESS)).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANSTAGE_1600
     * @tc.name testChanStage0016
     * @tc.desc Verify the MAC validator accepts lowercase hex and rejects a wrong length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanStage0016', 0, () => {
      expect(isMacAddress('0a:1b:2c:3d:4e:5f')).assertTrue();
      expect(isMacAddress('12:34:56:78:9A:B')).assertFalse();
      expect(isMacAddress('12:34:56:78:9A:BCD')).assertFalse();
      expect(isMacAddress('')).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANSTAGE_1700
     * @tc.name testChanStage0017
     * @tc.desc Verify the MAC validator rejects a misplaced separator and non hex digits.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testChanStage0017', 0, () => {
      expect(isMacAddress('12-34-56-78-9A-BC')).assertFalse();
      expect(isMacAddress('1234:56:78:9A:BC')).assertFalse();
      expect(isMacAddress('GG:34:56:78:9A:BC')).assertFalse();
      expect(isMacAddress('12:34:56:78:9A:B ')).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANSTAGE_1800
     * @tc.name testChanStage0018
     * @tc.desc Verify the uuid validator accepts lowercase hex and rejects a wrong length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanStage0018', 0, () => {
      expect(isServiceUuid('0000a002-0000-1000-8000-00805f9b34fb')).assertTrue();
      expect(isServiceUuid(DEFAULT_PEER_UUID.slice(0, 35))).assertFalse();
      expect(isServiceUuid(`${DEFAULT_PEER_UUID}-0`)).assertFalse();
      expect(isServiceUuid('')).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANSTAGE_1900
     * @tc.name testChanStage0019
     * @tc.desc Verify the uuid validator rejects a dash in the wrong position and non hex digits.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testChanStage0019', 0, () => {
      expect(isServiceUuid('0000A0020000-1000-8000-00805F9B34FB-')).assertFalse();
      expect(isServiceUuid('0000A002-00001000-8000-00805F9B34FB')).assertFalse();
      expect(isServiceUuid('0000A002-0000-1000-8000-00805F9B34FZ')).assertFalse();
      expect(isServiceUuid('0000A002-0000-1000-8000-00805F9B34FB ')).assertFalse();
    });
  });
}
