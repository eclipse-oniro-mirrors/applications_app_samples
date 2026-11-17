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
  LinkAction, LinkStage, allowedActions, canClose, canConnect, canSend, canStart, canStop, nextStage, stageHint,
  stageName, summarizeStage
} from '../../../main/ets/model/LinkSession';

/** 按声明顺序排列的八个状态，用于逐个状态断言守卫 */
function allStages(): LinkStage[] {
  return [
    LinkStage.EMPTY, LinkStage.SERVER_CREATED, LinkStage.SERVER_STARTED, LinkStage.SERVER_STOPPED,
    LinkStage.CONNECTION_CREATED, LinkStage.CONNECTING, LinkStage.CONNECTED, LinkStage.CLOSED
  ];
}

/**
 * 链路增强的状态机：文档没有把 Server 与 Connection 串成状态机，
 * 但页面要靠它决定按钮是否可点，转移写错就会出现"点了必失败"的按钮。
 * 这里按动作逐条验证允许的前驱状态，并把完整正向流程走一遍。
 */
export default function distributedLinkStageMatrixTest() {
  describe('DistributedLinkStageMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKSTAGE_0100
     * @tc.name testLinkStage0001
     * @tc.desc Verify createServer is accepted from empty, stopped and closed only.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkStage0001', 0, () => {
      expect(nextStage(LinkStage.EMPTY, LinkAction.CREATE_SERVER)).assertEqual(LinkStage.SERVER_CREATED);
      expect(nextStage(LinkStage.SERVER_STOPPED, LinkAction.CREATE_SERVER)).assertEqual(LinkStage.SERVER_CREATED);
      expect(nextStage(LinkStage.CLOSED, LinkAction.CREATE_SERVER)).assertEqual(LinkStage.SERVER_CREATED);
      expect(nextStage(LinkStage.SERVER_CREATED, LinkAction.CREATE_SERVER)).assertEqual(LinkStage.SERVER_CREATED);
      expect(nextStage(LinkStage.CONNECTED, LinkAction.CREATE_SERVER)).assertEqual(LinkStage.CONNECTED);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKSTAGE_0200
     * @tc.name testLinkStage0002
     * @tc.desc Verify start is accepted from created and stopped, and rejected elsewhere.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkStage0002', 0, () => {
      expect(nextStage(LinkStage.SERVER_CREATED, LinkAction.START)).assertEqual(LinkStage.SERVER_STARTED);
      expect(nextStage(LinkStage.SERVER_STOPPED, LinkAction.START)).assertEqual(LinkStage.SERVER_STARTED);
      expect(nextStage(LinkStage.EMPTY, LinkAction.START)).assertEqual(LinkStage.EMPTY);
      expect(nextStage(LinkStage.SERVER_STARTED, LinkAction.START)).assertEqual(LinkStage.SERVER_STARTED);
      expect(nextStage(LinkStage.CLOSED, LinkAction.START)).assertEqual(LinkStage.CLOSED);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKSTAGE_0300
     * @tc.name testLinkStage0003
     * @tc.desc Verify stop is only legal while the server is started.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkStage0003', 0, () => {
      expect(nextStage(LinkStage.SERVER_STARTED, LinkAction.STOP)).assertEqual(LinkStage.SERVER_STOPPED);
      expect(nextStage(LinkStage.SERVER_CREATED, LinkAction.STOP)).assertEqual(LinkStage.SERVER_CREATED);
      expect(nextStage(LinkStage.EMPTY, LinkAction.STOP)).assertEqual(LinkStage.EMPTY);
      expect(nextStage(LinkStage.CONNECTED, LinkAction.STOP)).assertEqual(LinkStage.CONNECTED);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKSTAGE_0400
     * @tc.name testLinkStage0004
     * @tc.desc Verify createConnection is accepted from empty, stopped and closed only.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkStage0004', 0, () => {
      expect(nextStage(LinkStage.EMPTY, LinkAction.CREATE_CONNECTION)).assertEqual(LinkStage.CONNECTION_CREATED);
      expect(nextStage(LinkStage.SERVER_STOPPED, LinkAction.CREATE_CONNECTION))
        .assertEqual(LinkStage.CONNECTION_CREATED);
      expect(nextStage(LinkStage.CLOSED, LinkAction.CREATE_CONNECTION)).assertEqual(LinkStage.CONNECTION_CREATED);
      expect(nextStage(LinkStage.CONNECTED, LinkAction.CREATE_CONNECTION)).assertEqual(LinkStage.CONNECTED);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKSTAGE_0500
     * @tc.name testLinkStage0005
     * @tc.desc Verify connect requires a created connection object.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkStage0005', 0, () => {
      expect(nextStage(LinkStage.CONNECTION_CREATED, LinkAction.CONNECT)).assertEqual(LinkStage.CONNECTING);
      expect(nextStage(LinkStage.EMPTY, LinkAction.CONNECT)).assertEqual(LinkStage.EMPTY);
      expect(nextStage(LinkStage.CONNECTING, LinkAction.CONNECT)).assertEqual(LinkStage.CONNECTING);
      expect(nextStage(LinkStage.CONNECTED, LinkAction.CONNECT)).assertEqual(LinkStage.CONNECTED);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKSTAGE_0600
     * @tc.name testLinkStage0006
     * @tc.desc Verify the peer connected callback only advances a connecting session.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkStage0006', 0, () => {
      expect(nextStage(LinkStage.CONNECTING, LinkAction.PEER_CONNECTED)).assertEqual(LinkStage.CONNECTED);
      expect(nextStage(LinkStage.CONNECTION_CREATED, LinkAction.PEER_CONNECTED))
        .assertEqual(LinkStage.CONNECTION_CREATED);
      expect(nextStage(LinkStage.EMPTY, LinkAction.PEER_CONNECTED)).assertEqual(LinkStage.EMPTY);
      expect(nextStage(LinkStage.CONNECTED, LinkAction.PEER_CONNECTED)).assertEqual(LinkStage.CONNECTED);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKSTAGE_0700
     * @tc.name testLinkStage0007
     * @tc.desc Verify disconnect returns to the created stage from connected or connecting.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkStage0007', 0, () => {
      expect(nextStage(LinkStage.CONNECTED, LinkAction.DISCONNECT)).assertEqual(LinkStage.CONNECTION_CREATED);
      expect(nextStage(LinkStage.CONNECTING, LinkAction.DISCONNECT)).assertEqual(LinkStage.CONNECTION_CREATED);
      expect(nextStage(LinkStage.CONNECTION_CREATED, LinkAction.DISCONNECT))
        .assertEqual(LinkStage.CONNECTION_CREATED);
      expect(nextStage(LinkStage.EMPTY, LinkAction.DISCONNECT)).assertEqual(LinkStage.EMPTY);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKSTAGE_0800
     * @tc.name testLinkStage0008
     * @tc.desc Verify close moves every non empty stage to closed and keeps empty untouched.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkStage0008', 0, () => {
      const stages = allStages();
      for (let i = 1; i < stages.length; i++) {
        expect(nextStage(stages[i], LinkAction.CLOSE)).assertEqual(LinkStage.CLOSED);
      }
      expect(nextStage(LinkStage.EMPTY, LinkAction.CLOSE)).assertEqual(LinkStage.EMPTY);
      // 已关闭的再关一次仍是 CLOSED，不会退回 EMPTY 把服务名重新变成“可创建”
      expect(nextStage(LinkStage.CLOSED, LinkAction.CLOSE)).assertEqual(LinkStage.CLOSED);
      // 循环覆盖的是 8 个阶段中的后 7 个，前缀数据少一个就会漏测某个阶段
      expect(stages.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKSTAGE_0900
     * @tc.name testLinkStage0009
     * @tc.desc Verify the eight actions applied to the empty stage land on the documented results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testLinkStage0009', 0, () => {
      expect(nextStage(LinkStage.EMPTY, LinkAction.START)).assertEqual(LinkStage.EMPTY);
      expect(nextStage(LinkStage.EMPTY, LinkAction.STOP)).assertEqual(LinkStage.EMPTY);
      expect(nextStage(LinkStage.EMPTY, LinkAction.CONNECT)).assertEqual(LinkStage.EMPTY);
      expect(nextStage(LinkStage.EMPTY, LinkAction.PEER_CONNECTED)).assertEqual(LinkStage.EMPTY);
      expect(nextStage(LinkStage.EMPTY, LinkAction.DISCONNECT)).assertEqual(LinkStage.EMPTY);
      expect(nextStage(LinkStage.EMPTY, LinkAction.CREATE_SERVER)).assertEqual(LinkStage.SERVER_CREATED);
      expect(nextStage(LinkStage.EMPTY, LinkAction.CREATE_CONNECTION)).assertEqual(LinkStage.CONNECTION_CREATED);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKSTAGE_1000
     * @tc.name testLinkStage0010
     * @tc.desc Verify the connected stage rejects every action except disconnect and close.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testLinkStage0010', 0, () => {
      expect(nextStage(LinkStage.CONNECTED, LinkAction.CREATE_SERVER)).assertEqual(LinkStage.CONNECTED);
      expect(nextStage(LinkStage.CONNECTED, LinkAction.START)).assertEqual(LinkStage.CONNECTED);
      expect(nextStage(LinkStage.CONNECTED, LinkAction.CONNECT)).assertEqual(LinkStage.CONNECTED);
      expect(nextStage(LinkStage.CONNECTED, LinkAction.DISCONNECT)).assertEqual(LinkStage.CONNECTION_CREATED);
      expect(nextStage(LinkStage.CONNECTED, LinkAction.CLOSE)).assertEqual(LinkStage.CLOSED);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKSTAGE_1100
     * @tc.name testLinkStage0011
     * @tc.desc Verify the server flow create, start, stop, start, close walks the documented stages.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkStage0011', 0, () => {
      let stage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(LinkStage.SERVER_CREATED);
      stage = nextStage(stage, LinkAction.START);
      expect(stage).assertEqual(LinkStage.SERVER_STARTED);
      stage = nextStage(stage, LinkAction.STOP);
      expect(stage).assertEqual(LinkStage.SERVER_STOPPED);
      stage = nextStage(stage, LinkAction.START);
      expect(stage).assertEqual(LinkStage.SERVER_STARTED);
      stage = nextStage(stage, LinkAction.CLOSE);
      expect(stage).assertEqual(LinkStage.CLOSED);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKSTAGE_1200
     * @tc.name testLinkStage0012
     * @tc.desc Verify the connection flow create, connect, connected, disconnect, connect, close.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkStage0012', 0, () => {
      let stage = LinkStage.EMPTY;
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      expect(stage).assertEqual(LinkStage.CONNECTION_CREATED);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(LinkStage.CONNECTING);
      stage = nextStage(stage, LinkAction.PEER_CONNECTED);
      expect(stage).assertEqual(LinkStage.CONNECTED);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      expect(stage).assertEqual(LinkStage.CONNECTION_CREATED);
      stage = nextStage(stage, LinkAction.CONNECT);
      expect(stage).assertEqual(LinkStage.CONNECTING);
      stage = nextStage(stage, LinkAction.CLOSE);
      expect(stage).assertEqual(LinkStage.CLOSED);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKSTAGE_1300
     * @tc.name testLinkStage0013
     * @tc.desc Verify a closed session can only be rebuilt by creating a new object.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testLinkStage0013', 0, () => {
      expect(nextStage(LinkStage.CLOSED, LinkAction.START)).assertEqual(LinkStage.CLOSED);
      expect(nextStage(LinkStage.CLOSED, LinkAction.CONNECT)).assertEqual(LinkStage.CLOSED);
      expect(nextStage(LinkStage.CLOSED, LinkAction.CLOSE)).assertEqual(LinkStage.CLOSED);
      expect(nextStage(LinkStage.CLOSED, LinkAction.CREATE_SERVER)).assertEqual(LinkStage.SERVER_CREATED);
      expect(nextStage(LinkStage.CLOSED, LinkAction.CREATE_CONNECTION)).assertEqual(LinkStage.CONNECTION_CREATED);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKSTAGE_1400
     * @tc.name testLinkStage0014
     * @tc.desc Verify the server side and connection side do not accept each other's actions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testLinkStage0014', 0, () => {
      expect(nextStage(LinkStage.SERVER_CREATED, LinkAction.CONNECT)).assertEqual(LinkStage.SERVER_CREATED);
      expect(nextStage(LinkStage.SERVER_CREATED, LinkAction.PEER_CONNECTED)).assertEqual(LinkStage.SERVER_CREATED);
      expect(nextStage(LinkStage.CONNECTION_CREATED, LinkAction.START)).assertEqual(LinkStage.CONNECTION_CREATED);
      expect(nextStage(LinkStage.CONNECTION_CREATED, LinkAction.STOP)).assertEqual(LinkStage.CONNECTION_CREATED);
      expect(nextStage(LinkStage.CONNECTING, LinkAction.START)).assertEqual(LinkStage.CONNECTING);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKSTAGE_1500
     * @tc.name testLinkStage0015
     * @tc.desc Verify canStart is true for exactly the created and stopped server stages.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkStage0015', 0, () => {
      const stages = allStages();
      let count = 0;
      for (let i = 0; i < stages.length; i++) {
        if (canStart(stages[i])) {
          count++;
        }
      }
      expect(count).assertEqual(2);
      expect(canStart(LinkStage.SERVER_CREATED)).assertTrue();
      expect(canStart(LinkStage.SERVER_STOPPED)).assertTrue();
      expect(canStart(LinkStage.EMPTY)).assertFalse();
      expect(canStart(LinkStage.SERVER_STARTED)).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKSTAGE_1600
     * @tc.name testLinkStage0016
     * @tc.desc Verify canStop, canConnect and canSend each allow a single stage.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkStage0016', 0, () => {
      expect(canStop(LinkStage.SERVER_STARTED)).assertTrue();
      expect(canStop(LinkStage.SERVER_CREATED)).assertFalse();
      expect(canConnect(LinkStage.CONNECTION_CREATED)).assertTrue();
      expect(canConnect(LinkStage.CONNECTING)).assertFalse();
      expect(canSend(LinkStage.CONNECTED)).assertTrue();
      expect(canSend(LinkStage.CONNECTING)).assertFalse();
      expect(canSend(LinkStage.CONNECTION_CREATED)).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKSTAGE_1700
     * @tc.name testLinkStage0017
     * @tc.desc Verify canClose is false only for the empty stage.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkStage0017', 0, () => {
      expect(canClose(LinkStage.EMPTY)).assertFalse();
      for (let i = 1; i < allStages().length; i++) {
        expect(canClose(allStages()[i])).assertTrue();
      }
      expect(canClose(LinkStage.CLOSED)).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKSTAGE_1800
     * @tc.name testLinkStage0018
     * @tc.desc Verify the empty stage offers no action at all.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkStage0018', 0, () => {
      const actions = allowedActions(LinkStage.EMPTY);
      expect(actions.length).assertEqual(0);
      expect(actions.indexOf('start')).assertEqual(-1);
      expect(actions.indexOf('close')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKSTAGE_1900
     * @tc.name testLinkStage0019
     * @tc.desc Verify the action list of every stage matches the documented ordering.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkStage0019', 0, () => {
      expect(allowedActions(LinkStage.SERVER_CREATED).join(',')).assertEqual('start,close');
      expect(allowedActions(LinkStage.SERVER_STARTED).join(',')).assertEqual('stop,close');
      expect(allowedActions(LinkStage.SERVER_STOPPED).join(',')).assertEqual('start,close');
      expect(allowedActions(LinkStage.CONNECTION_CREATED).join(',')).assertEqual('connect,close');
      expect(allowedActions(LinkStage.CONNECTING).join(',')).assertEqual('close');
      expect(allowedActions(LinkStage.CONNECTED).join(',')).assertEqual('sendData,close');
      expect(allowedActions(LinkStage.CLOSED).join(',')).assertEqual('close');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKSTAGE_2000
     * @tc.name testLinkStage0020
     * @tc.desc Verify the action list stays consistent with the individual guards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testLinkStage0020', 0, () => {
      const stages = allStages();
      for (let i = 0; i < stages.length; i++) {
        const expected = (canStart(stages[i]) ? 1 : 0) + (canStop(stages[i]) ? 1 : 0) +
          (canConnect(stages[i]) ? 1 : 0) + (canSend(stages[i]) ? 1 : 0) + (canClose(stages[i]) ? 1 : 0);
        expect(allowedActions(stages[i]).length).assertEqual(expected);
      }
      expect(allowedActions(LinkStage.EMPTY).length).assertEqual(0);
      // 具体阶段的按钮集合必须与页面顺序一致：连接对象只能 connect/close，监听中只能 stop/close
      expect(allowedActions(LinkStage.CONNECTION_CREATED).join(',')).assertEqual('connect,close');
      expect(allowedActions(LinkStage.SERVER_STARTED).join(',')).assertEqual('stop,close');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKSTAGE_2100
     * @tc.name testLinkStage0021
     * @tc.desc Verify every stage has a distinct Chinese name and the default is unresolved.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkStage0021', 0, () => {
      expect(stageName(LinkStage.EMPTY)).assertEqual('未创建');
      expect(stageName(LinkStage.SERVER_CREATED)).assertEqual('服务端已创建');
      expect(stageName(LinkStage.SERVER_STARTED)).assertEqual('服务端已启动');
      expect(stageName(LinkStage.SERVER_STOPPED)).assertEqual('服务端已停止');
      expect(stageName(LinkStage.CONNECTION_CREATED)).assertEqual('连接对象已创建');
      expect(stageName(LinkStage.CONNECTING)).assertEqual('正在连接');
      expect(stageName(LinkStage.CONNECTED)).assertEqual('已连接');
      expect(stageName(LinkStage.CLOSED)).assertEqual('已关闭');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKSTAGE_2200
     * @tc.name testLinkStage0022
     * @tc.desc Verify every stage hint names the next API and stays distinct.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testLinkStage0022', 0, () => {
      const stages = allStages();
      const hints: string[] = [];
      for (let i = 0; i < stages.length; i++) {
        const hint = stageHint(stages[i]);
        expect(hint.length > 10).assertTrue();
        if (hints.indexOf(hint) < 0) {
          hints.push(hint);
        }
      }
      expect(hints.length).assertEqual(8);
      expect(stageHint(LinkStage.CONNECTING).includes('32390205')).assertTrue();
      expect(stageHint(LinkStage.EMPTY).includes('createServer')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKSTAGE_2300
     * @tc.name testLinkStage0023
     * @tc.desc Verify summarizeStage keeps the stage name and falls back for a blank server name.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkStage0023', 0, () => {
      expect(summarizeStage(LinkStage.SERVER_CREATED, 'sample_link_server'))
        .assertEqual('服务端已创建；服务名 sample_link_server');
      expect(summarizeStage(LinkStage.EMPTY, '')).assertEqual('未创建；服务名 （未填写服务名）');
      expect(summarizeStage(LinkStage.EMPTY, '   ').includes('未填写服务名')).assertTrue();
      expect(summarizeStage(LinkStage.CONNECTED, '   ')).assertEqual('已连接；服务名 （未填写服务名）');
    });
  });
}
