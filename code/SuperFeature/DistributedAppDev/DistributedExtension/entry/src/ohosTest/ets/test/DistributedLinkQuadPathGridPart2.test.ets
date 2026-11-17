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
 * 链路状态机四步路径网格的后一半：承接前 50 条，按顺序推进剩下 50 条四步序列。
 * 终点仍做 canSend / allowedActions 两个下游交叉核对。
 * 前 50 条见 DistributedLinkQuadPathGrid.test.ets。
 */
export default function distributedLinkQuadPathGridPart2Test() {
  describe('DistributedLinkQuadPathGridTestPart2', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0051
     * @tc.name testLinkQuad0051
     * @tc.desc 4 step walk CONNECT then CREATE_SERVER then CREATE_SERVER then STOP ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0051', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.STOP);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0052
     * @tc.name testLinkQuad0052
     * @tc.desc 4 step walk CONNECT then CREATE_SERVER then PEER_CONNECTED then CREATE_CONNECTION ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0052', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0053
     * @tc.name testLinkQuad0053
     * @tc.desc 4 step walk CONNECT then START then STOP then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0053', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0054
     * @tc.name testLinkQuad0054
     * @tc.desc 4 step walk CONNECT then START then CLOSE then PEER_CONNECTED ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0054', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0055
     * @tc.name testLinkQuad0055
     * @tc.desc 4 step walk CONNECT then STOP then CONNECT then DISCONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0055', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0056
     * @tc.name testLinkQuad0056
     * @tc.desc 4 step walk CONNECT then CREATE_CONNECTION then START then CLOSE ends in stage 7.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0056', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CLOSE);
      expect(stage).assertEqual(7);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0057
     * @tc.name testLinkQuad0057
     * @tc.desc 4 step walk CONNECT then CREATE_CONNECTION then CLOSE then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0057', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0058
     * @tc.name testLinkQuad0058
     * @tc.desc 4 step walk CONNECT then CONNECT then CONNECT then START ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0058', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.START);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0059
     * @tc.name testLinkQuad0059
     * @tc.desc 4 step walk CONNECT then PEER_CONNECTED then START then STOP ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0059', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.STOP);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0060
     * @tc.name testLinkQuad0060
     * @tc.desc 4 step walk CONNECT then PEER_CONNECTED then DISCONNECT then CREATE_CONNECTION ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0060', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0061
     * @tc.name testLinkQuad0061
     * @tc.desc 4 step walk CONNECT then DISCONNECT then CREATE_CONNECTION then CONNECT ends in stage 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0061', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(5);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0062
     * @tc.name testLinkQuad0062
     * @tc.desc 4 step walk CONNECT then CLOSE then CREATE_SERVER then PEER_CONNECTED ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0062', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0063
     * @tc.name testLinkQuad0063
     * @tc.desc 4 step walk CONNECT then CLOSE then PEER_CONNECTED then DISCONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0063', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0064
     * @tc.name testLinkQuad0064
     * @tc.desc 4 step walk PEER_CONNECTED then CREATE_SERVER then STOP then CLOSE ends in stage 7.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0064', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CLOSE);
      expect(stage).assertEqual(7);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0065
     * @tc.name testLinkQuad0065
     * @tc.desc 4 step walk PEER_CONNECTED then START then CREATE_SERVER then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0065', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0066
     * @tc.name testLinkQuad0066
     * @tc.desc 4 step walk PEER_CONNECTED then START then PEER_CONNECTED then START ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0066', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.START);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0067
     * @tc.name testLinkQuad0067
     * @tc.desc 4 step walk PEER_CONNECTED then STOP then STOP then STOP ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0067', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.STOP);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0068
     * @tc.name testLinkQuad0068
     * @tc.desc 4 step walk PEER_CONNECTED then STOP then CLOSE then CREATE_CONNECTION ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0068', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0069
     * @tc.name testLinkQuad0069
     * @tc.desc 4 step walk PEER_CONNECTED then CREATE_CONNECTION then CONNECT then CONNECT ends in stage 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0069', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(5);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0070
     * @tc.name testLinkQuad0070
     * @tc.desc 4 step walk PEER_CONNECTED then CONNECT then START then PEER_CONNECTED ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0070', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0071
     * @tc.name testLinkQuad0071
     * @tc.desc 4 step walk PEER_CONNECTED then CONNECT then DISCONNECT then DISCONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0071', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0072
     * @tc.name testLinkQuad0072
     * @tc.desc 4 step walk PEER_CONNECTED then PEER_CONNECTED then CREATE_CONNECTION then CLOSE ends in stage 7.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0072', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CLOSE);
      expect(stage).assertEqual(7);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0073
     * @tc.name testLinkQuad0073
     * @tc.desc 4 step walk PEER_CONNECTED then DISCONNECT then START then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0073', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0074
     * @tc.name testLinkQuad0074
     * @tc.desc 4 step walk PEER_CONNECTED then DISCONNECT then DISCONNECT then START ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0074', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.START);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0075
     * @tc.name testLinkQuad0075
     * @tc.desc 4 step walk PEER_CONNECTED then CLOSE then CREATE_CONNECTION then STOP ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0075', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.STOP);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0076
     * @tc.name testLinkQuad0076
     * @tc.desc 4 step walk DISCONNECT then CREATE_SERVER then CREATE_SERVER then CREATE_CONNECTION ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0076', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0077
     * @tc.name testLinkQuad0077
     * @tc.desc 4 step walk DISCONNECT then CREATE_SERVER then PEER_CONNECTED then CONNECT ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0077', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0078
     * @tc.name testLinkQuad0078
     * @tc.desc 4 step walk DISCONNECT then START then STOP then PEER_CONNECTED ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0078', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0079
     * @tc.name testLinkQuad0079
     * @tc.desc 4 step walk DISCONNECT then START then CLOSE then DISCONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0079', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0080
     * @tc.name testLinkQuad0080
     * @tc.desc 4 step walk DISCONNECT then STOP then CONNECT then CLOSE ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0080', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CLOSE);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0081
     * @tc.name testLinkQuad0081
     * @tc.desc 4 step walk DISCONNECT then CREATE_CONNECTION then STOP then CREATE_SERVER ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0081', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0082
     * @tc.name testLinkQuad0082
     * @tc.desc 4 step walk DISCONNECT then CREATE_CONNECTION then CLOSE then START ends in stage 7.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0082', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.START);
      expect(stage).assertEqual(7);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0083
     * @tc.name testLinkQuad0083
     * @tc.desc 4 step walk DISCONNECT then CONNECT then CONNECT then STOP ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0083', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.STOP);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0084
     * @tc.name testLinkQuad0084
     * @tc.desc 4 step walk DISCONNECT then PEER_CONNECTED then START then CREATE_CONNECTION ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0084', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0085
     * @tc.name testLinkQuad0085
     * @tc.desc 4 step walk DISCONNECT then PEER_CONNECTED then DISCONNECT then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0085', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0086
     * @tc.name testLinkQuad0086
     * @tc.desc 4 step walk DISCONNECT then DISCONNECT then CREATE_CONNECTION then PEER_CONNECTED ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0086', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0087
     * @tc.name testLinkQuad0087
     * @tc.desc 4 step walk DISCONNECT then CLOSE then CREATE_SERVER then DISCONNECT ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0087', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0088
     * @tc.name testLinkQuad0088
     * @tc.desc 4 step walk DISCONNECT then CLOSE then PEER_CONNECTED then CLOSE ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0088', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CLOSE);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0089
     * @tc.name testLinkQuad0089
     * @tc.desc 4 step walk CLOSE then CREATE_SERVER then CREATE_CONNECTION then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0089', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0090
     * @tc.name testLinkQuad0090
     * @tc.desc 4 step walk CLOSE then START then CREATE_SERVER then START ends in stage 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0090', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.START);
      expect(stage).assertEqual(2);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0091
     * @tc.name testLinkQuad0091
     * @tc.desc 4 step walk CLOSE then START then PEER_CONNECTED then STOP ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0091', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.STOP);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0092
     * @tc.name testLinkQuad0092
     * @tc.desc 4 step walk CLOSE then STOP then STOP then CREATE_CONNECTION ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0092', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0093
     * @tc.name testLinkQuad0093
     * @tc.desc 4 step walk CLOSE then STOP then CLOSE then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0093', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0094
     * @tc.name testLinkQuad0094
     * @tc.desc 4 step walk CLOSE then CREATE_CONNECTION then CONNECT then PEER_CONNECTED ends in stage 6.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0094', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      expect(stage).assertEqual(6);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0095
     * @tc.name testLinkQuad0095
     * @tc.desc 4 step walk CLOSE then CONNECT then START then DISCONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0095', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0096
     * @tc.name testLinkQuad0096
     * @tc.desc 4 step walk CLOSE then CONNECT then DISCONNECT then CLOSE ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0096', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CLOSE);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0097
     * @tc.name testLinkQuad0097
     * @tc.desc 4 step walk CLOSE then PEER_CONNECTED then CONNECT then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0097', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0098
     * @tc.name testLinkQuad0098
     * @tc.desc 4 step walk CLOSE then DISCONNECT then START then START ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0098', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.START);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0099
     * @tc.name testLinkQuad0099
     * @tc.desc 4 step walk CLOSE then DISCONNECT then DISCONNECT then STOP ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0099', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.STOP);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKQUAD_0100
     * @tc.name testLinkQuad0100
     * @tc.desc 4 step walk CLOSE then CLOSE then CREATE_CONNECTION then CREATE_CONNECTION ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkQuad0100', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

  });
}
