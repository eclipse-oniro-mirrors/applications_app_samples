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
 * 链路状态机四步路径网格的前一半：8 个动作的全 4096 条四步序列里等距抽取 100 条，这里覆盖前 50 条。
 * 四步比三步更容易暴露「关闭后能否重建」的分支：CLOSED 允许 CREATE_SERVER 与 CREATE_CONNECTION，但不允许 START。
 * 后 50 条见 DistributedLinkQuadPathGridPart2.test.ets。
 */
export default function distributedLinkQuadPathGridTest() {
  describe('DistributedLinkQuadPathGridTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0001
     * @tc.name testLinkQuad0001
     * @tc.desc 4 step walk CREATE_SERVER then CREATE_SERVER then CREATE_SERVER then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0001', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0002
     * @tc.name testLinkQuad0002
     * @tc.desc 4 step walk CREATE_SERVER then CREATE_SERVER then PEER_CONNECTED then START ends in stage 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0002', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.START);
      expect(stage).assertEqual(2);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0003
     * @tc.name testLinkQuad0003
     * @tc.desc 4 step walk CREATE_SERVER then START then STOP then STOP ends in stage 3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0003', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.STOP);
      expect(stage).assertEqual(3);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0004
     * @tc.name testLinkQuad0004
     * @tc.desc 4 step walk CREATE_SERVER then START then CLOSE then CREATE_CONNECTION ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0004', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0005
     * @tc.name testLinkQuad0005
     * @tc.desc 4 step walk CREATE_SERVER then STOP then CONNECT then CONNECT ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0005', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0006
     * @tc.name testLinkQuad0006
     * @tc.desc 4 step walk CREATE_SERVER then CREATE_CONNECTION then START then PEER_CONNECTED ends in stage 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0006', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      expect(stage).assertEqual(2);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0007
     * @tc.name testLinkQuad0007
     * @tc.desc 4 step walk CREATE_SERVER then CREATE_CONNECTION then DISCONNECT then DISCONNECT ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0007', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0008
     * @tc.name testLinkQuad0008
     * @tc.desc 4 step walk CREATE_SERVER then CONNECT then CREATE_CONNECTION then CLOSE ends in stage 7.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0008', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CLOSE);
      expect(stage).assertEqual(7);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0009
     * @tc.name testLinkQuad0009
     * @tc.desc 4 step walk CREATE_SERVER then PEER_CONNECTED then START then CREATE_SERVER ends in stage 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0009', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(2);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0010
     * @tc.name testLinkQuad0010
     * @tc.desc 4 step walk CREATE_SERVER then PEER_CONNECTED then DISCONNECT then START ends in stage 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0010', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.START);
      expect(stage).assertEqual(2);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0011
     * @tc.name testLinkQuad0011
     * @tc.desc 4 step walk CREATE_SERVER then DISCONNECT then CREATE_CONNECTION then STOP ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0011', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.STOP);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0012
     * @tc.name testLinkQuad0012
     * @tc.desc 4 step walk CREATE_SERVER then CLOSE then CREATE_SERVER then CREATE_CONNECTION ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0012', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0013
     * @tc.name testLinkQuad0013
     * @tc.desc 4 step walk CREATE_SERVER then CLOSE then PEER_CONNECTED then CONNECT ends in stage 7.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0013', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(7);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0014
     * @tc.name testLinkQuad0014
     * @tc.desc 4 step walk START then CREATE_SERVER then STOP then PEER_CONNECTED ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0014', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0015
     * @tc.name testLinkQuad0015
     * @tc.desc 4 step walk START then CREATE_SERVER then CLOSE then DISCONNECT ends in stage 7.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0015', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      expect(stage).assertEqual(7);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0016
     * @tc.name testLinkQuad0016
     * @tc.desc 4 step walk START then START then CONNECT then CLOSE ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0016', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CLOSE);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0017
     * @tc.name testLinkQuad0017
     * @tc.desc 4 step walk START then STOP then STOP then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0017', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0018
     * @tc.name testLinkQuad0018
     * @tc.desc 4 step walk START then STOP then CLOSE then START ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0018', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.START);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0019
     * @tc.name testLinkQuad0019
     * @tc.desc 4 step walk START then CREATE_CONNECTION then CONNECT then STOP ends in stage 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0019', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.STOP);
      expect(stage).assertEqual(5);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0020
     * @tc.name testLinkQuad0020
     * @tc.desc 4 step walk START then CONNECT then START then CREATE_CONNECTION ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0020', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0021
     * @tc.name testLinkQuad0021
     * @tc.desc 4 step walk START then CONNECT then DISCONNECT then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0021', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0022
     * @tc.name testLinkQuad0022
     * @tc.desc 4 step walk START then PEER_CONNECTED then CREATE_CONNECTION then PEER_CONNECTED ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0022', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0023
     * @tc.name testLinkQuad0023
     * @tc.desc 4 step walk START then DISCONNECT then CREATE_SERVER then DISCONNECT ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0023', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0024
     * @tc.name testLinkQuad0024
     * @tc.desc 4 step walk START then DISCONNECT then PEER_CONNECTED then CLOSE ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0024', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CLOSE);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0025
     * @tc.name testLinkQuad0025
     * @tc.desc 4 step walk START then CLOSE then CREATE_CONNECTION then CREATE_SERVER ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0025', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0026
     * @tc.name testLinkQuad0026
     * @tc.desc 4 step walk STOP then CREATE_SERVER then CREATE_SERVER then START ends in stage 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0026', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.START);
      expect(stage).assertEqual(2);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0027
     * @tc.name testLinkQuad0027
     * @tc.desc 4 step walk STOP then CREATE_SERVER then PEER_CONNECTED then STOP ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0027', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.STOP);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0028
     * @tc.name testLinkQuad0028
     * @tc.desc 4 step walk STOP then START then STOP then CREATE_CONNECTION ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0028', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0029
     * @tc.name testLinkQuad0029
     * @tc.desc 4 step walk STOP then START then CLOSE then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0029', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0030
     * @tc.name testLinkQuad0030
     * @tc.desc 4 step walk STOP then STOP then CONNECT then PEER_CONNECTED ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0030', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0031
     * @tc.name testLinkQuad0031
     * @tc.desc 4 step walk STOP then CREATE_CONNECTION then START then DISCONNECT ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0031', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0032
     * @tc.name testLinkQuad0032
     * @tc.desc 4 step walk STOP then CREATE_CONNECTION then DISCONNECT then CLOSE ends in stage 7.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0032', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CLOSE);
      expect(stage).assertEqual(7);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0033
     * @tc.name testLinkQuad0033
     * @tc.desc 4 step walk STOP then CONNECT then CONNECT then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0033', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0034
     * @tc.name testLinkQuad0034
     * @tc.desc 4 step walk STOP then PEER_CONNECTED then START then START ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0034', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.START);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0035
     * @tc.name testLinkQuad0035
     * @tc.desc 4 step walk STOP then PEER_CONNECTED then DISCONNECT then STOP ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0035', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.STOP);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0036
     * @tc.name testLinkQuad0036
     * @tc.desc 4 step walk STOP then DISCONNECT then CREATE_CONNECTION then CREATE_CONNECTION ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0036', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0037
     * @tc.name testLinkQuad0037
     * @tc.desc 4 step walk STOP then CLOSE then CREATE_SERVER then CONNECT ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0037', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0038
     * @tc.name testLinkQuad0038
     * @tc.desc 4 step walk STOP then CLOSE then PEER_CONNECTED then PEER_CONNECTED ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0038', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0039
     * @tc.name testLinkQuad0039
     * @tc.desc 4 step walk CREATE_CONNECTION then CREATE_SERVER then STOP then DISCONNECT ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0039', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0040
     * @tc.name testLinkQuad0040
     * @tc.desc 4 step walk CREATE_CONNECTION then CREATE_SERVER then CLOSE then CLOSE ends in stage 7.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0040', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CLOSE);
      expect(stage).assertEqual(7);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0041
     * @tc.name testLinkQuad0041
     * @tc.desc 4 step walk CREATE_CONNECTION then START then PEER_CONNECTED then CREATE_SERVER ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0041', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0042
     * @tc.name testLinkQuad0042
     * @tc.desc 4 step walk CREATE_CONNECTION then STOP then STOP then START ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0042', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.START);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0043
     * @tc.name testLinkQuad0043
     * @tc.desc 4 step walk CREATE_CONNECTION then STOP then CLOSE then STOP ends in stage 7.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0043', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.STOP);
      expect(stage).assertEqual(7);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0044
     * @tc.name testLinkQuad0044
     * @tc.desc 4 step walk CREATE_CONNECTION then CREATE_CONNECTION then CONNECT then CREATE_CONNECTION ends in
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0044', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      expect(stage).assertEqual(5);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0045
     * @tc.name testLinkQuad0045
     * @tc.desc 4 step walk CREATE_CONNECTION then CONNECT then START then CONNECT ends in stage 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0045', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(5);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0046
     * @tc.name testLinkQuad0046
     * @tc.desc 4 step walk CREATE_CONNECTION then CONNECT then DISCONNECT then PEER_CONNECTED ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0046', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0047
     * @tc.name testLinkQuad0047
     * @tc.desc 4 step walk CREATE_CONNECTION then PEER_CONNECTED then CREATE_CONNECTION then DISCONNECT ends in
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0047', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0048
     * @tc.name testLinkQuad0048
     * @tc.desc 4 step walk CREATE_CONNECTION then DISCONNECT then CREATE_SERVER then CLOSE ends in stage 7.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0048', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CLOSE);
      expect(stage).assertEqual(7);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0049
     * @tc.name testLinkQuad0049
     * @tc.desc 4 step walk CREATE_CONNECTION then DISCONNECT then DISCONNECT then CREATE_SERVER ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0049', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0050
     * @tc.name testLinkQuad0050
     * @tc.desc 4 step walk CREATE_CONNECTION then CLOSE then CREATE_CONNECTION then START ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0050', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.START);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

  });
}
