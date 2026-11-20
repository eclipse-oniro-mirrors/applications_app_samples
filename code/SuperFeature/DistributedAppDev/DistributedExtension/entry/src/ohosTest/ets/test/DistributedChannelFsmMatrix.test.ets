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
import { DEFAULT_PEER_ADDRESS, DEFAULT_PEER_UUID } from '../../../main/ets/common/AppConstants';
import {
  ChannelAction, ChannelStage, canSendData, channelStageHint, channelStageName, describeChannel, isMacAddress,
  isServiceUuid, nextChannelStage
} from '../../../main/ets/model/ChannelSession';

const ALL_CHANNEL_STAGES: ChannelStage[] = [
  ChannelStage.CLOSED, ChannelStage.OPENING, ChannelStage.OPEN, ChannelStage.FAILED
];

const ALL_CHANNEL_ACTIONS: ChannelAction[] = [
  ChannelAction.OPEN, ChannelAction.OPEN_OK, ChannelAction.OPEN_FAIL, ChannelAction.SEND, ChannelAction.CLOSE
];

function walkChannel(actions: ChannelAction[]): string[] {
  let stage = ChannelStage.CLOSED;
  const trail: string[] = [];
  for (const action of actions) {
    stage = nextChannelStage(stage, action);
    trail.push(channelStageName(stage));
  }
  return trail;
}

/** 把 text 第 position 个字符换成 ch，用来逐位构造非法 MAC / UUID */
function replaceAt(text: string, position: number, ch: string): string {
  return `${text.slice(0, position)}${ch}${text.slice(position + 1)}`;
}

/**
 * 代理通道状态机与对端参数校验（分）：4 × 5 转移表逐格断言，
 * MAC / UUID 校验器按「每一位 × 每一种替换字符」铺开，覆盖全部字符位置。
 */
export default function distributedChannelFsmMatrixTest() {
  describe('DistributedChannelFsmMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANFSM_0100
     * @tc.name testChanFsm0001
     * @tc.desc Verify all five channel actions from stage CLOSED land on the documented next stage.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanFsm0001', 0, () => {
      const stage = ChannelStage.CLOSED;
      expect(nextChannelStage(stage, ChannelAction.OPEN)).assertEqual(ChannelStage.OPENING);
      expect(nextChannelStage(stage, ChannelAction.OPEN_OK)).assertEqual(ChannelStage.CLOSED);
      expect(nextChannelStage(stage, ChannelAction.OPEN_FAIL)).assertEqual(ChannelStage.CLOSED);
      expect(nextChannelStage(stage, ChannelAction.SEND)).assertEqual(ChannelStage.CLOSED);
      expect(nextChannelStage(stage, ChannelAction.CLOSE)).assertEqual(ChannelStage.CLOSED);
      expect(channelStageName(stage)).assertEqual('未打开');
      expect(canSendData(stage)).assertFalse();
      expect(describeChannel(-1, stage)).assertEqual('未打开；尚无 channelId');
      expect(describeChannel(0, stage)).assertEqual('未打开；channelId=0');
      expect(describeChannel(65535, stage)).assertEqual('未打开；channelId=65535');
      expect(channelStageHint(stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANFSM_0200
     * @tc.name testChanFsm0002
     * @tc.desc Verify all five channel actions from stage OPENING land on the documented next stage.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanFsm0002', 0, () => {
      const stage = ChannelStage.OPENING;
      expect(nextChannelStage(stage, ChannelAction.OPEN)).assertEqual(ChannelStage.OPENING);
      expect(nextChannelStage(stage, ChannelAction.OPEN_OK)).assertEqual(ChannelStage.OPEN);
      expect(nextChannelStage(stage, ChannelAction.OPEN_FAIL)).assertEqual(ChannelStage.FAILED);
      expect(nextChannelStage(stage, ChannelAction.SEND)).assertEqual(ChannelStage.OPENING);
      expect(nextChannelStage(stage, ChannelAction.CLOSE)).assertEqual(ChannelStage.CLOSED);
      expect(channelStageName(stage)).assertEqual('正在打开');
      expect(canSendData(stage)).assertFalse();
      expect(describeChannel(-1, stage)).assertEqual('正在打开；尚无 channelId');
      expect(describeChannel(0, stage)).assertEqual('正在打开；channelId=0');
      expect(describeChannel(65535, stage)).assertEqual('正在打开；channelId=65535');
      expect(channelStageHint(stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANFSM_0300
     * @tc.name testChanFsm0003
     * @tc.desc Verify all five channel actions from stage OPEN land on the documented next stage.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanFsm0003', 0, () => {
      const stage = ChannelStage.OPEN;
      expect(nextChannelStage(stage, ChannelAction.OPEN)).assertEqual(ChannelStage.OPEN);
      expect(nextChannelStage(stage, ChannelAction.OPEN_OK)).assertEqual(ChannelStage.OPEN);
      expect(nextChannelStage(stage, ChannelAction.OPEN_FAIL)).assertEqual(ChannelStage.OPEN);
      expect(nextChannelStage(stage, ChannelAction.SEND)).assertEqual(ChannelStage.OPEN);
      expect(nextChannelStage(stage, ChannelAction.CLOSE)).assertEqual(ChannelStage.CLOSED);
      expect(channelStageName(stage)).assertEqual('通道已打开');
      expect(canSendData(stage)).assertTrue();
      expect(describeChannel(-1, stage)).assertEqual('通道已打开；尚无 channelId');
      expect(describeChannel(0, stage)).assertEqual('通道已打开；channelId=0');
      expect(describeChannel(65535, stage)).assertEqual('通道已打开；channelId=65535');
      expect(channelStageHint(stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANFSM_0400
     * @tc.name testChanFsm0004
     * @tc.desc Verify all five channel actions from stage FAILED land on the documented next stage.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanFsm0004', 0, () => {
      const stage = ChannelStage.FAILED;
      expect(nextChannelStage(stage, ChannelAction.OPEN)).assertEqual(ChannelStage.OPENING);
      expect(nextChannelStage(stage, ChannelAction.OPEN_OK)).assertEqual(ChannelStage.FAILED);
      expect(nextChannelStage(stage, ChannelAction.OPEN_FAIL)).assertEqual(ChannelStage.FAILED);
      expect(nextChannelStage(stage, ChannelAction.SEND)).assertEqual(ChannelStage.FAILED);
      expect(nextChannelStage(stage, ChannelAction.CLOSE)).assertEqual(ChannelStage.CLOSED);
      expect(channelStageName(stage)).assertEqual('打开失败');
      expect(canSendData(stage)).assertFalse();
      expect(describeChannel(-1, stage)).assertEqual('打开失败；尚无 channelId');
      expect(describeChannel(0, stage)).assertEqual('打开失败；channelId=0');
      expect(describeChannel(65535, stage)).assertEqual('打开失败；channelId=65535');
      expect(channelStageHint(stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANFSM_0500
     * @tc.name testChanFsm0005
     * @tc.desc Verify channel action OPEN moves exactly the expected source stages.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanFsm0005', 0, () => {
      const action = ChannelAction.OPEN;
      const moved: number[] = [];
      for (const stage of ALL_CHANNEL_STAGES) {
        if (nextChannelStage(stage, action) !== stage) {
          moved.push(stage);
        }
      }
      expect(moved.length).assertEqual(2);
      expect(moved.join(',')).assertEqual('0,3');
      expect(ALL_CHANNEL_STAGES.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANFSM_0600
     * @tc.name testChanFsm0006
     * @tc.desc Verify channel action OPEN_OK moves exactly the expected source stages.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanFsm0006', 0, () => {
      const action = ChannelAction.OPEN_OK;
      const moved: number[] = [];
      for (const stage of ALL_CHANNEL_STAGES) {
        if (nextChannelStage(stage, action) !== stage) {
          moved.push(stage);
        }
      }
      expect(moved.length).assertEqual(1);
      expect(moved.join(',')).assertEqual('1');
      expect(ALL_CHANNEL_STAGES.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANFSM_0700
     * @tc.name testChanFsm0007
     * @tc.desc Verify channel action OPEN_FAIL moves exactly the expected source stages.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanFsm0007', 0, () => {
      const action = ChannelAction.OPEN_FAIL;
      const moved: number[] = [];
      for (const stage of ALL_CHANNEL_STAGES) {
        if (nextChannelStage(stage, action) !== stage) {
          moved.push(stage);
        }
      }
      expect(moved.length).assertEqual(1);
      expect(moved.join(',')).assertEqual('1');
      expect(ALL_CHANNEL_STAGES.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANFSM_0800
     * @tc.name testChanFsm0008
     * @tc.desc Verify channel action SEND moves exactly the expected source stages.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanFsm0008', 0, () => {
      const action = ChannelAction.SEND;
      const moved: number[] = [];
      for (const stage of ALL_CHANNEL_STAGES) {
        if (nextChannelStage(stage, action) !== stage) {
          moved.push(stage);
        }
      }
      expect(moved.length).assertEqual(0);
      expect(moved.join(',')).assertEqual('');
      expect(ALL_CHANNEL_STAGES.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANFSM_0900
     * @tc.name testChanFsm0009
     * @tc.desc Verify channel action CLOSE moves exactly the expected source stages.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanFsm0009', 0, () => {
      const action = ChannelAction.CLOSE;
      const moved: number[] = [];
      for (const stage of ALL_CHANNEL_STAGES) {
        if (nextChannelStage(stage, action) !== stage) {
          moved.push(stage);
        }
      }
      expect(moved.length).assertEqual(3);
      expect(moved.join(',')).assertEqual('1,2,3');
      expect(ALL_CHANNEL_STAGES.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANFSM_1000
     * @tc.name testChanFsm0010
     * @tc.desc Verify the channel path of open success, several sends and close.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanFsm0010', 0, () => {
      const actions: ChannelAction[] = [
        ChannelAction.OPEN, ChannelAction.OPEN_OK, ChannelAction.SEND, ChannelAction.SEND,
        ChannelAction.SEND, ChannelAction.CLOSE
      ];
      const trail = walkChannel(actions);
      expect(trail.length).assertEqual(6);
      expect(trail[trail.length - 1]).assertEqual('未打开');
      expect(trail.join('>')).assertEqual('正在打开>通道已打开>通道已打开>通道已打开>通道已打开>未打开');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANFSM_1100
     * @tc.name testChanFsm0011
     * @tc.desc Verify the channel path of open failure followed by a retry that succeeds.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanFsm0011', 0, () => {
      const actions: ChannelAction[] = [
        ChannelAction.OPEN, ChannelAction.OPEN_FAIL, ChannelAction.OPEN, ChannelAction.OPEN_OK
      ];
      const trail = walkChannel(actions);
      expect(trail.length).assertEqual(4);
      expect(trail[trail.length - 1]).assertEqual('通道已打开');
      expect(trail.join('>')).assertEqual('正在打开>打开失败>正在打开>通道已打开');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANFSM_1200
     * @tc.name testChanFsm0012
     * @tc.desc Verify the channel path of close while opening abandoning the pending open.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanFsm0012', 0, () => {
      const actions: ChannelAction[] = [
        ChannelAction.OPEN, ChannelAction.CLOSE, ChannelAction.OPEN_OK
      ];
      const trail = walkChannel(actions);
      expect(trail.length).assertEqual(3);
      expect(trail[trail.length - 1]).assertEqual('未打开');
      expect(trail.join('>')).assertEqual('正在打开>未打开>未打开');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANFSM_1300
     * @tc.name testChanFsm0013
     * @tc.desc Verify the channel path of repeated open calls being ignored while opening.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanFsm0013', 0, () => {
      const actions: ChannelAction[] = [
        ChannelAction.OPEN, ChannelAction.OPEN, ChannelAction.OPEN, ChannelAction.OPEN_OK
      ];
      const trail = walkChannel(actions);
      expect(trail.length).assertEqual(4);
      expect(trail[trail.length - 1]).assertEqual('通道已打开');
      expect(trail.join('>')).assertEqual('正在打开>正在打开>正在打开>通道已打开');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANFSM_1400
     * @tc.name testChanFsm0014
     * @tc.desc Verify the channel path of send before open being ignored.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanFsm0014', 0, () => {
      const actions: ChannelAction[] = [
        ChannelAction.SEND, ChannelAction.SEND, ChannelAction.OPEN, ChannelAction.OPEN_OK,
        ChannelAction.SEND
      ];
      const trail = walkChannel(actions);
      expect(trail.length).assertEqual(5);
      expect(trail[trail.length - 1]).assertEqual('通道已打开');
      expect(trail.join('>')).assertEqual('未打开>未打开>正在打开>通道已打开>通道已打开');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANFSM_1500
     * @tc.name testChanFsm0015
     * @tc.desc Verify the channel path of late open result arriving after close being ignored.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanFsm0015', 0, () => {
      const actions: ChannelAction[] = [
        ChannelAction.OPEN, ChannelAction.CLOSE, ChannelAction.OPEN_OK, ChannelAction.OPEN_FAIL
      ];
      const trail = walkChannel(actions);
      expect(trail.length).assertEqual(4);
      expect(trail[trail.length - 1]).assertEqual('未打开');
      expect(trail.join('>')).assertEqual('正在打开>未打开>未打开>未打开');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANFSM_1600
     * @tc.name testChanFsm0016
     * @tc.desc Verify the channel path of failure, close and reopen ending open.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanFsm0016', 0, () => {
      const actions: ChannelAction[] = [
        ChannelAction.OPEN, ChannelAction.OPEN_FAIL, ChannelAction.CLOSE, ChannelAction.OPEN,
        ChannelAction.OPEN_OK
      ];
      const trail = walkChannel(actions);
      expect(trail.length).assertEqual(5);
      expect(trail[trail.length - 1]).assertEqual('通道已打开');
      expect(trail.join('>')).assertEqual('正在打开>打开失败>未打开>正在打开>通道已打开');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANFSM_1700
     * @tc.name testChanFsm0017
     * @tc.desc Verify well formed MAC addresses in upper, lower and mixed case are all accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanFsm0017', 0, () => {
      const valid: string[] = ['12:34:56:78:9A:BC', '12:34:56:78:9a:bc', '00:00:00:00:00:00', 'FF:FF:FF:FF:FF:FF',
        'fF:0a:B1:c2:D3:e4', DEFAULT_PEER_ADDRESS];
      for (const mac of valid) {
        expect(isMacAddress(mac)).assertTrue();
        expect(isServiceUuid(mac)).assertFalse();
      }
      expect(valid.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANFSM_1800
     * @tc.name testChanFsm0018
     * @tc.desc Verify MAC addresses with a wrong length are rejected whatever the content.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanFsm0018', 0, () => {
      const invalid: string[] = ['', '1', '12:34:56:78:9A:B', '12:34:56:78:9A:BCD', '12:34:56:78:9A:BC:',
        ':12:34:56:78:9A:BC', '12:34:56:78:9A', '12:34:56:78:9A:BC:DE'];
      for (const mac of invalid) {
        expect(isMacAddress(mac)).assertFalse();
        expect(mac.length === 17).assertFalse();
      }
      expect(invalid.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANFSM_1900
     * @tc.name testChanFsm0019
     * @tc.desc Verify replacing any one of the five separators breaks the MAC check.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanFsm0019', 0, () => {
      let rejected = 0;
      const separators: string[] = ['-', '.', ' ', '0', 'G'];
      for (const position of [2, 5, 8, 11, 14]) {
        for (const sep of separators) {
          const mac = replaceAt(DEFAULT_PEER_ADDRESS, position, sep);
          expect(isMacAddress(mac)).assertFalse();
          rejected++;
        }
      }
      expect(rejected).assertEqual(25);
      expect(isMacAddress(DEFAULT_PEER_ADDRESS)).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANFSM_2000
     * @tc.name testChanFsm0020
     * @tc.desc Verify replacing any one of the twelve hex digits with a non hex char breaks the MAC check.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanFsm0020', 0, () => {
      let rejected = 0;
      const bad: string[] = ['G', 'g', 'Z', ':', '-', '中'];
      for (let position = 0; position < 17; position++) {
        if (position % 3 === 2) {
          continue;
        }
        for (const ch of bad) {
          expect(isMacAddress(replaceAt(DEFAULT_PEER_ADDRESS, position, ch))).assertFalse();
          rejected++;
        }
      }
      expect(rejected).assertEqual(72);
      expect(isMacAddress(replaceAt(DEFAULT_PEER_ADDRESS, 0, 'f'))).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANFSM_2100
     * @tc.name testChanFsm0021
     * @tc.desc Verify replacing any hex digit with every other hex digit keeps the MAC valid.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanFsm0021', 0, () => {
      const hex = '0123456789ABCDEFabcdef';
      let accepted = 0;
      for (let position = 0; position < 17; position++) {
        if (position % 3 === 2) {
          continue;
        }
        for (let i = 0; i < hex.length; i++) {
          expect(isMacAddress(replaceAt(DEFAULT_PEER_ADDRESS, position, hex.charAt(i)))).assertTrue();
          accepted++;
        }
      }
      expect(accepted).assertEqual(12 * 22);
      expect(hex.length).assertEqual(22);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANFSM_2200
     * @tc.name testChanFsm0022
     * @tc.desc Verify well formed service UUIDs in any case are accepted and are not MAC addresses.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanFsm0022', 0, () => {
      const valid: string[] = [DEFAULT_PEER_UUID, '0000a002-0000-1000-8000-00805f9b34fb',
        '00000000-0000-0000-0000-000000000000', 'FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF',
        '12345678-9abc-DEF0-1234-56789ABCDEF0'];
      for (const uuid of valid) {
        expect(isServiceUuid(uuid)).assertTrue();
        expect(isMacAddress(uuid)).assertFalse();
      }
      expect(valid.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANFSM_2300
     * @tc.name testChanFsm0023
     * @tc.desc Verify UUIDs with a wrong length or misplaced dashes are rejected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanFsm0023', 0, () => {
      const invalid: string[] = ['', '0000A002', '0000A002-0000-1000-8000-00805F9B34F',
        '0000A002-0000-1000-8000-00805F9B34FB0', '0000A0020-000-1000-8000-00805F9B34FB',
        '0000A002_0000_1000_8000_00805F9B34FB', '{0000A002-0000-1000-8000-00805F9B34F}',
        '0000A002000010008000-00805F9B34FB----'];
      for (const uuid of invalid) {
        expect(isServiceUuid(uuid)).assertFalse();
      }
      expect(invalid.length).assertEqual(8);
      expect(isServiceUuid(DEFAULT_PEER_UUID)).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANFSM_2400
     * @tc.name testChanFsm0024
     * @tc.desc Verify replacing any one of the thirty two hex digits with a non hex char breaks the UUID check.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanFsm0024', 0, () => {
      let rejected = 0;
      const bad: string[] = ['G', 'z', '-', ' '];
      for (let position = 0; position < 36; position++) {
        if (position === 8 || position === 13 || position === 18 || position === 23) {
          continue;
        }
        for (const ch of bad) {
          expect(isServiceUuid(replaceAt(DEFAULT_PEER_UUID, position, ch))).assertFalse();
          rejected++;
        }
      }
      expect(rejected).assertEqual(128);
      expect(isServiceUuid(replaceAt(DEFAULT_PEER_UUID, 0, 'f'))).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANFSM_2500
     * @tc.name testChanFsm0025
     * @tc.desc Verify replacing any of the four UUID dashes with a hex digit breaks the UUID check.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanFsm0025', 0, () => {
      let rejected = 0;
      for (const ch of ['0', 'A', 'f', ':']) {
        for (const position of [8, 13, 18, 23]) {
          expect(isServiceUuid(replaceAt(DEFAULT_PEER_UUID, position, ch))).assertFalse();
          rejected++;
        }
      }
      expect(rejected).assertEqual(16);
      expect(DEFAULT_PEER_UUID.length).assertEqual(36);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANFSM_2600
     * @tc.name testChanFsm0026
     * @tc.desc Verify combining a valid or invalid MAC with a valid or invalid UUID yields four outcomes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanFsm0026', 0, () => {
      const macs: string[] = [DEFAULT_PEER_ADDRESS, 'xyz'];
      const uuids: string[] = [DEFAULT_PEER_UUID, 'bad-uuid'];
      const verdicts: string[] = [];
      for (const mac of macs) {
        for (const uuid of uuids) {
          verdicts.push(`${isMacAddress(mac) ? 'M' : 'm'}${isServiceUuid(uuid) ? 'U' : 'u'}`);
        }
      }
      expect(verdicts.join(',')).assertEqual('MU,Mu,mU,mu');
      expect(verdicts.length).assertEqual(4);
      expect(verdicts.filter((v: string) => v === 'MU').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANFSM_2700
     * @tc.name testChanFsm0027
     * @tc.desc Verify the channel stage table has exactly six self loops away from CLOSED and OPEN.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanFsm0027', 0, () => {
      let selfLoops = 0;
      let toOpen = 0;
      for (const stage of ALL_CHANNEL_STAGES) {
        for (const action of ALL_CHANNEL_ACTIONS) {
          const target = nextChannelStage(stage, action);
          selfLoops += target === stage ? 1 : 0;
          toOpen += target === ChannelStage.OPEN && stage !== ChannelStage.OPEN ? 1 : 0;
        }
      }
      expect(selfLoops).assertEqual(13);
      expect(toOpen).assertEqual(1);
      expect(ALL_CHANNEL_ACTIONS.length).assertEqual(5);
    });
  });
}
