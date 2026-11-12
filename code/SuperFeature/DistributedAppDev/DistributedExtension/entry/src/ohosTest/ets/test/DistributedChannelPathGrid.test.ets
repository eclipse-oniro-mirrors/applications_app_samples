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
  ChannelAction, ChannelStage, canSendData, channelStageName, describeChannel, nextChannelStage
} from '../../../main/ets/model/ChannelSession';

/**
 * 通道状态机三步路径网格：5 个动作的 125 条三步序列里取 80 条。
 * 通道的关键分支是「打开失败后能否重开」：FAILED 允许 OPEN 回到 OPENING，但只有 OPENING 能转 OPEN / FAILED。
 * 每条都交叉核对 canSendData 与 describeChannel，确保按钮可用性和页面文案跟着阶段走。
 */
export default function distributedChannelPathGridTest() {
  describe('DistributedChannelPathGridTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0001
     * @tc.name testChanPath0001
     * @tc.desc Walk OPEN then OPEN then OPEN ends in channel stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0001', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      expect(stage).assertEqual(1);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0002
     * @tc.name testChanPath0002
     * @tc.desc Walk OPEN then OPEN then OPEN_FAIL ends in channel stage 3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0002', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      expect(stage).assertEqual(3);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0003
     * @tc.name testChanPath0003
     * @tc.desc Walk OPEN then OPEN then CLOSE ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0003', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0004
     * @tc.name testChanPath0004
     * @tc.desc Walk OPEN then OPEN_OK then OPEN_OK ends in channel stage 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0004', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      expect(stage).assertEqual(2);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0005
     * @tc.name testChanPath0005
     * @tc.desc Walk OPEN then OPEN_OK then SEND ends in channel stage 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0005', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      stage = nextChannelStage(stage, ChannelAction.SEND);
      expect(stage).assertEqual(2);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0006
     * @tc.name testChanPath0006
     * @tc.desc Walk OPEN then OPEN_FAIL then OPEN ends in channel stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0006', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      expect(stage).assertEqual(1);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0007
     * @tc.name testChanPath0007
     * @tc.desc Walk OPEN then OPEN_FAIL then OPEN_FAIL ends in channel stage 3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0007', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      expect(stage).assertEqual(3);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0008
     * @tc.name testChanPath0008
     * @tc.desc Walk OPEN then OPEN_FAIL then CLOSE ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0008', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0009
     * @tc.name testChanPath0009
     * @tc.desc Walk OPEN then SEND then OPEN_OK ends in channel stage 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0009', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      stage = nextChannelStage(stage, ChannelAction.SEND);
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      expect(stage).assertEqual(2);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0010
     * @tc.name testChanPath0010
     * @tc.desc Walk OPEN then SEND then SEND ends in channel stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0010', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      stage = nextChannelStage(stage, ChannelAction.SEND);
      stage = nextChannelStage(stage, ChannelAction.SEND);
      expect(stage).assertEqual(1);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0011
     * @tc.name testChanPath0011
     * @tc.desc Walk OPEN then CLOSE then OPEN ends in channel stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0011', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      expect(stage).assertEqual(1);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0012
     * @tc.name testChanPath0012
     * @tc.desc Walk OPEN then CLOSE then OPEN_FAIL ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0012', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0013
     * @tc.name testChanPath0013
     * @tc.desc Walk OPEN then CLOSE then CLOSE ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0013', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0014
     * @tc.name testChanPath0014
     * @tc.desc Walk OPEN_OK then OPEN then OPEN_OK ends in channel stage 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0014', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      expect(stage).assertEqual(2);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0015
     * @tc.name testChanPath0015
     * @tc.desc Walk OPEN_OK then OPEN then SEND ends in channel stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0015', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      stage = nextChannelStage(stage, ChannelAction.SEND);
      expect(stage).assertEqual(1);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0016
     * @tc.name testChanPath0016
     * @tc.desc Walk OPEN_OK then OPEN_OK then OPEN ends in channel stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0016', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      expect(stage).assertEqual(1);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0017
     * @tc.name testChanPath0017
     * @tc.desc Walk OPEN_OK then OPEN_OK then OPEN_FAIL ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0017', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0018
     * @tc.name testChanPath0018
     * @tc.desc Walk OPEN_OK then OPEN_OK then CLOSE ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0018', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0019
     * @tc.name testChanPath0019
     * @tc.desc Walk OPEN_OK then OPEN_FAIL then OPEN_OK ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0019', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0020
     * @tc.name testChanPath0020
     * @tc.desc Walk OPEN_OK then OPEN_FAIL then SEND ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0020', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      stage = nextChannelStage(stage, ChannelAction.SEND);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0021
     * @tc.name testChanPath0021
     * @tc.desc Walk OPEN_OK then SEND then OPEN ends in channel stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0021', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      stage = nextChannelStage(stage, ChannelAction.SEND);
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      expect(stage).assertEqual(1);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0022
     * @tc.name testChanPath0022
     * @tc.desc Walk OPEN_OK then SEND then OPEN_FAIL ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0022', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      stage = nextChannelStage(stage, ChannelAction.SEND);
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0023
     * @tc.name testChanPath0023
     * @tc.desc Walk OPEN_OK then SEND then CLOSE ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0023', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      stage = nextChannelStage(stage, ChannelAction.SEND);
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0024
     * @tc.name testChanPath0024
     * @tc.desc Walk OPEN_OK then CLOSE then OPEN_OK ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0024', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0025
     * @tc.name testChanPath0025
     * @tc.desc Walk OPEN_OK then CLOSE then SEND ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0025', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      stage = nextChannelStage(stage, ChannelAction.SEND);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0026
     * @tc.name testChanPath0026
     * @tc.desc Walk OPEN_FAIL then OPEN then OPEN ends in channel stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0026', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      expect(stage).assertEqual(1);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0027
     * @tc.name testChanPath0027
     * @tc.desc Walk OPEN_FAIL then OPEN then OPEN_FAIL ends in channel stage 3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0027', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      expect(stage).assertEqual(3);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0028
     * @tc.name testChanPath0028
     * @tc.desc Walk OPEN_FAIL then OPEN then CLOSE ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0028', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0029
     * @tc.name testChanPath0029
     * @tc.desc Walk OPEN_FAIL then OPEN_OK then OPEN_OK ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0029', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0030
     * @tc.name testChanPath0030
     * @tc.desc Walk OPEN_FAIL then OPEN_OK then SEND ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0030', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      stage = nextChannelStage(stage, ChannelAction.SEND);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0031
     * @tc.name testChanPath0031
     * @tc.desc Walk OPEN_FAIL then OPEN_FAIL then OPEN ends in channel stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0031', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      expect(stage).assertEqual(1);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0032
     * @tc.name testChanPath0032
     * @tc.desc Walk OPEN_FAIL then OPEN_FAIL then OPEN_FAIL ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0032', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0033
     * @tc.name testChanPath0033
     * @tc.desc Walk OPEN_FAIL then OPEN_FAIL then CLOSE ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0033', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0034
     * @tc.name testChanPath0034
     * @tc.desc Walk OPEN_FAIL then SEND then OPEN_OK ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0034', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      stage = nextChannelStage(stage, ChannelAction.SEND);
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0035
     * @tc.name testChanPath0035
     * @tc.desc Walk OPEN_FAIL then SEND then SEND ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0035', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      stage = nextChannelStage(stage, ChannelAction.SEND);
      stage = nextChannelStage(stage, ChannelAction.SEND);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0036
     * @tc.name testChanPath0036
     * @tc.desc Walk OPEN_FAIL then CLOSE then OPEN ends in channel stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0036', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      expect(stage).assertEqual(1);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0037
     * @tc.name testChanPath0037
     * @tc.desc Walk OPEN_FAIL then CLOSE then OPEN_FAIL ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0037', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0038
     * @tc.name testChanPath0038
     * @tc.desc Walk OPEN_FAIL then CLOSE then CLOSE ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0038', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0039
     * @tc.name testChanPath0039
     * @tc.desc Walk SEND then OPEN then OPEN_OK ends in channel stage 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0039', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.SEND);
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      expect(stage).assertEqual(2);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0040
     * @tc.name testChanPath0040
     * @tc.desc Walk SEND then OPEN then SEND ends in channel stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0040', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.SEND);
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      stage = nextChannelStage(stage, ChannelAction.SEND);
      expect(stage).assertEqual(1);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0041
     * @tc.name testChanPath0041
     * @tc.desc Walk SEND then OPEN_OK then OPEN ends in channel stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0041', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.SEND);
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      expect(stage).assertEqual(1);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0042
     * @tc.name testChanPath0042
     * @tc.desc Walk SEND then OPEN_OK then OPEN_FAIL ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0042', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.SEND);
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0043
     * @tc.name testChanPath0043
     * @tc.desc Walk SEND then OPEN_OK then CLOSE ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0043', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.SEND);
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0044
     * @tc.name testChanPath0044
     * @tc.desc Walk SEND then OPEN_FAIL then OPEN_OK ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0044', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.SEND);
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0045
     * @tc.name testChanPath0045
     * @tc.desc Walk SEND then OPEN_FAIL then SEND ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0045', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.SEND);
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      stage = nextChannelStage(stage, ChannelAction.SEND);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0046
     * @tc.name testChanPath0046
     * @tc.desc Walk SEND then SEND then OPEN ends in channel stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0046', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.SEND);
      stage = nextChannelStage(stage, ChannelAction.SEND);
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      expect(stage).assertEqual(1);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0047
     * @tc.name testChanPath0047
     * @tc.desc Walk SEND then SEND then OPEN_FAIL ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0047', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.SEND);
      stage = nextChannelStage(stage, ChannelAction.SEND);
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0048
     * @tc.name testChanPath0048
     * @tc.desc Walk SEND then SEND then CLOSE ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0048', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.SEND);
      stage = nextChannelStage(stage, ChannelAction.SEND);
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0049
     * @tc.name testChanPath0049
     * @tc.desc Walk SEND then CLOSE then OPEN_OK ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0049', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.SEND);
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0050
     * @tc.name testChanPath0050
     * @tc.desc Walk SEND then CLOSE then SEND ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0050', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.SEND);
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      stage = nextChannelStage(stage, ChannelAction.SEND);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0051
     * @tc.name testChanPath0051
     * @tc.desc Walk CLOSE then OPEN then OPEN ends in channel stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0051', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      expect(stage).assertEqual(1);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0052
     * @tc.name testChanPath0052
     * @tc.desc Walk CLOSE then OPEN then OPEN_FAIL ends in channel stage 3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0052', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      expect(stage).assertEqual(3);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0053
     * @tc.name testChanPath0053
     * @tc.desc Walk CLOSE then OPEN then CLOSE ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0053', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0054
     * @tc.name testChanPath0054
     * @tc.desc Walk CLOSE then OPEN_OK then OPEN_OK ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0054', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0055
     * @tc.name testChanPath0055
     * @tc.desc Walk CLOSE then OPEN_OK then SEND ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0055', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      stage = nextChannelStage(stage, ChannelAction.SEND);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0056
     * @tc.name testChanPath0056
     * @tc.desc Walk CLOSE then OPEN_FAIL then OPEN ends in channel stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0056', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      expect(stage).assertEqual(1);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0057
     * @tc.name testChanPath0057
     * @tc.desc Walk CLOSE then OPEN_FAIL then OPEN_FAIL ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0057', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0058
     * @tc.name testChanPath0058
     * @tc.desc Walk CLOSE then OPEN_FAIL then CLOSE ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0058', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0059
     * @tc.name testChanPath0059
     * @tc.desc Walk CLOSE then SEND then OPEN_OK ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0059', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      stage = nextChannelStage(stage, ChannelAction.SEND);
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0060
     * @tc.name testChanPath0060
     * @tc.desc Walk CLOSE then SEND then SEND ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0060', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      stage = nextChannelStage(stage, ChannelAction.SEND);
      stage = nextChannelStage(stage, ChannelAction.SEND);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0061
     * @tc.name testChanPath0061
     * @tc.desc Walk CLOSE then CLOSE then OPEN ends in channel stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0061', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      expect(stage).assertEqual(1);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0062
     * @tc.name testChanPath0062
     * @tc.desc Walk CLOSE then CLOSE then OPEN_FAIL ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0062', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CHANPATH_0063
     * @tc.name testChanPath0063
     * @tc.desc Walk CLOSE then CLOSE then CLOSE ends in channel stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChanPath0063', 0, () => {
      let stage: ChannelStage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      expect(stage).assertEqual(0);
      expect(channelStageName(stage).length > 0).assertTrue();
      expect(canSendData(stage) === (stage === ChannelStage.OPEN)).assertTrue();
      expect(describeChannel(7, stage).length > 0).assertTrue();
    });

  });
}
