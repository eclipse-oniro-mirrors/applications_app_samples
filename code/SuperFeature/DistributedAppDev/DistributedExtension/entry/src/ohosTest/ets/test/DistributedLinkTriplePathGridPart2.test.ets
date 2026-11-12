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
 * 链路状态机三步路径网格的后一半：承接前 64 条，按顺序推进剩下 64 条三步序列。
 * 非法序列（例如未创建就 connect）原地不动，这批用例把「原地不动」也算进了终点。
 * 前 64 条见 DistributedLinkTriplePathGrid.test.ets。
 */
export default function distributedLinkTriplePathGridPart2Test() {
  describe('DistributedLinkTriplePathGridTestPart2', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0065
     * @tc.name testLinkTriple0065
     * @tc.desc 3 step walk CONNECT then CREATE_SERVER then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0065', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0066
     * @tc.name testLinkTriple0066
     * @tc.desc 3 step walk CONNECT then CREATE_SERVER then CONNECT ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0066', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0067
     * @tc.name testLinkTriple0067
     * @tc.desc 3 step walk CONNECT then START then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0067', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0068
     * @tc.name testLinkTriple0068
     * @tc.desc 3 step walk CONNECT then START then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0068', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0069
     * @tc.name testLinkTriple0069
     * @tc.desc 3 step walk CONNECT then STOP then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0069', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0070
     * @tc.name testLinkTriple0070
     * @tc.desc 3 step walk CONNECT then STOP then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0070', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0071
     * @tc.name testLinkTriple0071
     * @tc.desc 3 step walk CONNECT then CREATE_CONNECTION then CREATE_SERVER ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0071', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0072
     * @tc.name testLinkTriple0072
     * @tc.desc 3 step walk CONNECT then CREATE_CONNECTION then CONNECT ends in stage 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0072', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(5);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0073
     * @tc.name testLinkTriple0073
     * @tc.desc 3 step walk CONNECT then CONNECT then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0073', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0074
     * @tc.name testLinkTriple0074
     * @tc.desc 3 step walk CONNECT then CONNECT then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0074', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0075
     * @tc.name testLinkTriple0075
     * @tc.desc 3 step walk CONNECT then PEER_CONNECTED then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0075', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0076
     * @tc.name testLinkTriple0076
     * @tc.desc 3 step walk CONNECT then PEER_CONNECTED then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0076', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0077
     * @tc.name testLinkTriple0077
     * @tc.desc 3 step walk CONNECT then DISCONNECT then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0077', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0078
     * @tc.name testLinkTriple0078
     * @tc.desc 3 step walk CONNECT then DISCONNECT then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0078', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0079
     * @tc.name testLinkTriple0079
     * @tc.desc 3 step walk CONNECT then CLOSE then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0079', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0080
     * @tc.name testLinkTriple0080
     * @tc.desc 3 step walk CONNECT then CLOSE then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0080', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0081
     * @tc.name testLinkTriple0081
     * @tc.desc 3 step walk PEER_CONNECTED then CREATE_SERVER then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0081', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0082
     * @tc.name testLinkTriple0082
     * @tc.desc 3 step walk PEER_CONNECTED then CREATE_SERVER then CONNECT ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0082', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0083
     * @tc.name testLinkTriple0083
     * @tc.desc 3 step walk PEER_CONNECTED then START then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0083', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0084
     * @tc.name testLinkTriple0084
     * @tc.desc 3 step walk PEER_CONNECTED then START then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0084', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0085
     * @tc.name testLinkTriple0085
     * @tc.desc 3 step walk PEER_CONNECTED then STOP then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0085', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0086
     * @tc.name testLinkTriple0086
     * @tc.desc 3 step walk PEER_CONNECTED then STOP then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0086', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0087
     * @tc.name testLinkTriple0087
     * @tc.desc 3 step walk PEER_CONNECTED then CREATE_CONNECTION then CREATE_SERVER ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0087', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0088
     * @tc.name testLinkTriple0088
     * @tc.desc 3 step walk PEER_CONNECTED then CREATE_CONNECTION then CONNECT ends in stage 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0088', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(5);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0089
     * @tc.name testLinkTriple0089
     * @tc.desc 3 step walk PEER_CONNECTED then CONNECT then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0089', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0090
     * @tc.name testLinkTriple0090
     * @tc.desc 3 step walk PEER_CONNECTED then CONNECT then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0090', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0091
     * @tc.name testLinkTriple0091
     * @tc.desc 3 step walk PEER_CONNECTED then PEER_CONNECTED then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0091', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0092
     * @tc.name testLinkTriple0092
     * @tc.desc 3 step walk PEER_CONNECTED then PEER_CONNECTED then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0092', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0093
     * @tc.name testLinkTriple0093
     * @tc.desc 3 step walk PEER_CONNECTED then DISCONNECT then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0093', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0094
     * @tc.name testLinkTriple0094
     * @tc.desc 3 step walk PEER_CONNECTED then DISCONNECT then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0094', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0095
     * @tc.name testLinkTriple0095
     * @tc.desc 3 step walk PEER_CONNECTED then CLOSE then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0095', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0096
     * @tc.name testLinkTriple0096
     * @tc.desc 3 step walk PEER_CONNECTED then CLOSE then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0096', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0097
     * @tc.name testLinkTriple0097
     * @tc.desc 3 step walk DISCONNECT then CREATE_SERVER then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0097', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0098
     * @tc.name testLinkTriple0098
     * @tc.desc 3 step walk DISCONNECT then CREATE_SERVER then CONNECT ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0098', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0099
     * @tc.name testLinkTriple0099
     * @tc.desc 3 step walk DISCONNECT then START then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0099', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0100
     * @tc.name testLinkTriple0100
     * @tc.desc 3 step walk DISCONNECT then START then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0100', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0101
     * @tc.name testLinkTriple0101
     * @tc.desc 3 step walk DISCONNECT then STOP then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0101', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0102
     * @tc.name testLinkTriple0102
     * @tc.desc 3 step walk DISCONNECT then STOP then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0102', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0103
     * @tc.name testLinkTriple0103
     * @tc.desc 3 step walk DISCONNECT then CREATE_CONNECTION then CREATE_SERVER ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0103', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0104
     * @tc.name testLinkTriple0104
     * @tc.desc 3 step walk DISCONNECT then CREATE_CONNECTION then CONNECT ends in stage 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0104', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(5);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0105
     * @tc.name testLinkTriple0105
     * @tc.desc 3 step walk DISCONNECT then CONNECT then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0105', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0106
     * @tc.name testLinkTriple0106
     * @tc.desc 3 step walk DISCONNECT then CONNECT then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0106', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0107
     * @tc.name testLinkTriple0107
     * @tc.desc 3 step walk DISCONNECT then PEER_CONNECTED then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0107', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0108
     * @tc.name testLinkTriple0108
     * @tc.desc 3 step walk DISCONNECT then PEER_CONNECTED then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0108', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0109
     * @tc.name testLinkTriple0109
     * @tc.desc 3 step walk DISCONNECT then DISCONNECT then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0109', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0110
     * @tc.name testLinkTriple0110
     * @tc.desc 3 step walk DISCONNECT then DISCONNECT then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0110', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0111
     * @tc.name testLinkTriple0111
     * @tc.desc 3 step walk DISCONNECT then CLOSE then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0111', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0112
     * @tc.name testLinkTriple0112
     * @tc.desc 3 step walk DISCONNECT then CLOSE then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0112', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0113
     * @tc.name testLinkTriple0113
     * @tc.desc 3 step walk CLOSE then CREATE_SERVER then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0113', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0114
     * @tc.name testLinkTriple0114
     * @tc.desc 3 step walk CLOSE then CREATE_SERVER then CONNECT ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0114', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0115
     * @tc.name testLinkTriple0115
     * @tc.desc 3 step walk CLOSE then START then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0115', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0116
     * @tc.name testLinkTriple0116
     * @tc.desc 3 step walk CLOSE then START then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0116', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.START);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0117
     * @tc.name testLinkTriple0117
     * @tc.desc 3 step walk CLOSE then STOP then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0117', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0118
     * @tc.name testLinkTriple0118
     * @tc.desc 3 step walk CLOSE then STOP then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0118', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.STOP);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0119
     * @tc.name testLinkTriple0119
     * @tc.desc 3 step walk CLOSE then CREATE_CONNECTION then CREATE_SERVER ends in stage 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0119', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(4);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0120
     * @tc.name testLinkTriple0120
     * @tc.desc 3 step walk CLOSE then CREATE_CONNECTION then CONNECT ends in stage 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0120', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(5);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0121
     * @tc.name testLinkTriple0121
     * @tc.desc 3 step walk CLOSE then CONNECT then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0121', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0122
     * @tc.name testLinkTriple0122
     * @tc.desc 3 step walk CLOSE then CONNECT then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0122', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CONNECT);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0123
     * @tc.name testLinkTriple0123
     * @tc.desc 3 step walk CLOSE then PEER_CONNECTED then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0123', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0124
     * @tc.name testLinkTriple0124
     * @tc.desc 3 step walk CLOSE then PEER_CONNECTED then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0124', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0125
     * @tc.name testLinkTriple0125
     * @tc.desc 3 step walk CLOSE then DISCONNECT then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0125', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0126
     * @tc.name testLinkTriple0126
     * @tc.desc 3 step walk CLOSE then DISCONNECT then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0126', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0127
     * @tc.name testLinkTriple0127
     * @tc.desc 3 step walk CLOSE then CLOSE then CREATE_SERVER ends in stage 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0127', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(1);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKTRIPLE_0128
     * @tc.name testLinkTriple0128
     * @tc.desc 3 step walk CLOSE then CLOSE then CONNECT ends in stage 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkTriple0128', 0, () => {
      let stage: LinkStage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CLOSE);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(0);
      expect(stageName(stage).length > 0).assertTrue();
      expect(canSend(stage) === (stage === LinkStage.CONNECTED)).assertTrue();
      expect(allowedActions(stage).indexOf('sendData') >= 0).assertEqual(canSend(stage));
    });

  });
}
