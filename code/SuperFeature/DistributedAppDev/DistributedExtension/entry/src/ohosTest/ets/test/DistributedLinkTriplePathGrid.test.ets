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
  LinkAction, LinkStage, allowedActions, canSend, nextStage, stageName
} from '../../../main/ets/model/LinkSession';

/**
 * 链路状态机三步路径网格的前一半：8 个动作的全 512 条三步序列里等距抽取 128 条，这里覆盖前 64 条。
 * 每条都核对终点阶段号，并交叉核对两个下游函数：canSend 与 allowedActions 必须与「已连接」一致。
 * 后 64 条见 DistributedLinkTriplePathGridPart2.test.ets。
 */
export default function distributedLinkTriplePathGridTest() {
  describe('DistributedLinkTriplePathGridTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0001
     * @tc.name testLinkTriple0001
     * @tc.desc 3 step walk CREATE_SERVER then CREATE_SERVER then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0001', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0002
     * @tc.name testLinkTriple0002
     * @tc.desc 3 step walk CREATE_SERVER then CREATE_SERVER then CONNECT ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0002', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0003
     * @tc.name testLinkTriple0003
     * @tc.desc 3 step walk CREATE_SERVER then START then CREATE_SERVER ends in stage 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0003', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(2);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0004
     * @tc.name testLinkTriple0004
     * @tc.desc 3 step walk CREATE_SERVER then START then CONNECT ends in stage 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0004', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(2);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0005
     * @tc.name testLinkTriple0005
     * @tc.desc 3 step walk CREATE_SERVER then STOP then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0005', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0006
     * @tc.name testLinkTriple0006
     * @tc.desc 3 step walk CREATE_SERVER then STOP then CONNECT ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0006', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0007
     * @tc.name testLinkTriple0007
     * @tc.desc 3 step walk CREATE_SERVER then CREATE_CONNECTION then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0007', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0008
     * @tc.name testLinkTriple0008
     * @tc.desc 3 step walk CREATE_SERVER then CREATE_CONNECTION then CONNECT ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0008', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0009
     * @tc.name testLinkTriple0009
     * @tc.desc 3 step walk CREATE_SERVER then CONNECT then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0009', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0010
     * @tc.name testLinkTriple0010
     * @tc.desc 3 step walk CREATE_SERVER then CONNECT then CONNECT ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0010', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0011
     * @tc.name testLinkTriple0011
     * @tc.desc 3 step walk CREATE_SERVER then PEER_CONNECTED then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0011', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0012
     * @tc.name testLinkTriple0012
     * @tc.desc 3 step walk CREATE_SERVER then PEER_CONNECTED then CONNECT ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0012', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0013
     * @tc.name testLinkTriple0013
     * @tc.desc 3 step walk CREATE_SERVER then DISCONNECT then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0013', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0014
     * @tc.name testLinkTriple0014
     * @tc.desc 3 step walk CREATE_SERVER then DISCONNECT then CONNECT ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0014', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0015
     * @tc.name testLinkTriple0015
     * @tc.desc 3 step walk CREATE_SERVER then CLOSE then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0015', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0016
     * @tc.name testLinkTriple0016
     * @tc.desc 3 step walk CREATE_SERVER then CLOSE then CONNECT ends in stage 7.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0016', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(7);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0017
     * @tc.name testLinkTriple0017
     * @tc.desc 3 step walk START then CREATE_SERVER then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0017', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0018
     * @tc.name testLinkTriple0018
     * @tc.desc 3 step walk START then CREATE_SERVER then CONNECT ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0018', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0019
     * @tc.name testLinkTriple0019
     * @tc.desc 3 step walk START then START then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0019', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0020
     * @tc.name testLinkTriple0020
     * @tc.desc 3 step walk START then START then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0020', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0021
     * @tc.name testLinkTriple0021
     * @tc.desc 3 step walk START then STOP then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0021', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0022
     * @tc.name testLinkTriple0022
     * @tc.desc 3 step walk START then STOP then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0022', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0023
     * @tc.name testLinkTriple0023
     * @tc.desc 3 step walk START then CREATE_CONNECTION then CREATE_SERVER ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0023', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0024
     * @tc.name testLinkTriple0024
     * @tc.desc 3 step walk START then CREATE_CONNECTION then CONNECT ends in stage 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0024', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(5);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0025
     * @tc.name testLinkTriple0025
     * @tc.desc 3 step walk START then CONNECT then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0025', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0026
     * @tc.name testLinkTriple0026
     * @tc.desc 3 step walk START then CONNECT then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0026', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0027
     * @tc.name testLinkTriple0027
     * @tc.desc 3 step walk START then PEER_CONNECTED then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0027', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0028
     * @tc.name testLinkTriple0028
     * @tc.desc 3 step walk START then PEER_CONNECTED then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0028', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0029
     * @tc.name testLinkTriple0029
     * @tc.desc 3 step walk START then DISCONNECT then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0029', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0030
     * @tc.name testLinkTriple0030
     * @tc.desc 3 step walk START then DISCONNECT then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0030', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0031
     * @tc.name testLinkTriple0031
     * @tc.desc 3 step walk START then CLOSE then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0031', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0032
     * @tc.name testLinkTriple0032
     * @tc.desc 3 step walk START then CLOSE then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0032', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0033
     * @tc.name testLinkTriple0033
     * @tc.desc 3 step walk STOP then CREATE_SERVER then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0033', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0034
     * @tc.name testLinkTriple0034
     * @tc.desc 3 step walk STOP then CREATE_SERVER then CONNECT ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0034', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0035
     * @tc.name testLinkTriple0035
     * @tc.desc 3 step walk STOP then START then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0035', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0036
     * @tc.name testLinkTriple0036
     * @tc.desc 3 step walk STOP then START then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0036', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0037
     * @tc.name testLinkTriple0037
     * @tc.desc 3 step walk STOP then STOP then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0037', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0038
     * @tc.name testLinkTriple0038
     * @tc.desc 3 step walk STOP then STOP then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0038', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0039
     * @tc.name testLinkTriple0039
     * @tc.desc 3 step walk STOP then CREATE_CONNECTION then CREATE_SERVER ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0039', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0040
     * @tc.name testLinkTriple0040
     * @tc.desc 3 step walk STOP then CREATE_CONNECTION then CONNECT ends in stage 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0040', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(5);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0041
     * @tc.name testLinkTriple0041
     * @tc.desc 3 step walk STOP then CONNECT then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0041', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0042
     * @tc.name testLinkTriple0042
     * @tc.desc 3 step walk STOP then CONNECT then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0042', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0043
     * @tc.name testLinkTriple0043
     * @tc.desc 3 step walk STOP then PEER_CONNECTED then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0043', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0044
     * @tc.name testLinkTriple0044
     * @tc.desc 3 step walk STOP then PEER_CONNECTED then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0044', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0045
     * @tc.name testLinkTriple0045
     * @tc.desc 3 step walk STOP then DISCONNECT then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0045', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0046
     * @tc.name testLinkTriple0046
     * @tc.desc 3 step walk STOP then DISCONNECT then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0046', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0047
     * @tc.name testLinkTriple0047
     * @tc.desc 3 step walk STOP then CLOSE then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0047', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0048
     * @tc.name testLinkTriple0048
     * @tc.desc 3 step walk STOP then CLOSE then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0048', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0049
     * @tc.name testLinkTriple0049
     * @tc.desc 3 step walk CREATE_CONNECTION then CREATE_SERVER then CREATE_SERVER ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0049', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0050
     * @tc.name testLinkTriple0050
     * @tc.desc 3 step walk CREATE_CONNECTION then CREATE_SERVER then CONNECT ends in stage 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0050', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(5);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0051
     * @tc.name testLinkTriple0051
     * @tc.desc 3 step walk CREATE_CONNECTION then START then CREATE_SERVER ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0051', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0052
     * @tc.name testLinkTriple0052
     * @tc.desc 3 step walk CREATE_CONNECTION then START then CONNECT ends in stage 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0052', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(5);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0053
     * @tc.name testLinkTriple0053
     * @tc.desc 3 step walk CREATE_CONNECTION then STOP then CREATE_SERVER ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0053', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0054
     * @tc.name testLinkTriple0054
     * @tc.desc 3 step walk CREATE_CONNECTION then STOP then CONNECT ends in stage 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0054', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(5);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0055
     * @tc.name testLinkTriple0055
     * @tc.desc 3 step walk CREATE_CONNECTION then CREATE_CONNECTION then CREATE_SERVER ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0055', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0056
     * @tc.name testLinkTriple0056
     * @tc.desc 3 step walk CREATE_CONNECTION then CREATE_CONNECTION then CONNECT ends in stage 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0056', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(5);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0057
     * @tc.name testLinkTriple0057
     * @tc.desc 3 step walk CREATE_CONNECTION then CONNECT then CREATE_SERVER ends in stage 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0057', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(5);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0058
     * @tc.name testLinkTriple0058
     * @tc.desc 3 step walk CREATE_CONNECTION then CONNECT then CONNECT ends in stage 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0058', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(5);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0059
     * @tc.name testLinkTriple0059
     * @tc.desc 3 step walk CREATE_CONNECTION then PEER_CONNECTED then CREATE_SERVER ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0059', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0060
     * @tc.name testLinkTriple0060
     * @tc.desc 3 step walk CREATE_CONNECTION then PEER_CONNECTED then CONNECT ends in stage 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0060', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(5);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0061
     * @tc.name testLinkTriple0061
     * @tc.desc 3 step walk CREATE_CONNECTION then DISCONNECT then CREATE_SERVER ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0061', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0062
     * @tc.name testLinkTriple0062
     * @tc.desc 3 step walk CREATE_CONNECTION then DISCONNECT then CONNECT ends in stage 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0062', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(5);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0063
     * @tc.name testLinkTriple0063
     * @tc.desc 3 step walk CREATE_CONNECTION then CLOSE then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0063', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0064
     * @tc.name testLinkTriple0064
     * @tc.desc 3 step walk CREATE_CONNECTION then CLOSE then CONNECT ends in stage 7.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0064', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(7);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

  });
}
