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

const ALL_LINK_STAGES: LinkStage[] = [
  LinkStage.EMPTY, LinkStage.SERVER_CREATED, LinkStage.SERVER_STARTED, LinkStage.SERVER_STOPPED,
  LinkStage.CONNECTION_CREATED, LinkStage.CONNECTING, LinkStage.CONNECTED, LinkStage.CLOSED
];

const ALL_LINK_ACTIONS: LinkAction[] = [
  LinkAction.CREATE_SERVER, LinkAction.START, LinkAction.STOP, LinkAction.CREATE_CONNECTION,
  LinkAction.CONNECT, LinkAction.PEER_CONNECTED, LinkAction.DISCONNECT, LinkAction.CLOSE
];

/** 从 EMPTY 依次施加动作，返回每一步之后的阶段名 */
function walkLink(actions: LinkAction[]): string[] {
  let stage = LinkStage.EMPTY;
  const trail: string[] = [];
  for (const action of actions) {
    stage = nextStage(stage, action);
    trail.push(stageName(stage));
  }
  return trail;
}

/** 某个动作真正改变阶段时落到的目标阶段（去重，按来源阶段顺序） */
function targetsOf(action: LinkAction): number[] {
  const targets: number[] = [];
  for (const stage of ALL_LINK_STAGES) {
    const target = nextStage(stage, action);
    if (target !== stage && !targets.includes(target)) {
      targets.push(target);
    }
  }
  return targets;
}

/**
 * 链路状态机穷举（分）：8 个阶段 × 8 个动作的转移表逐格断言，
 * 再从动作维度、路径维度、两步/三步组合维度把同一张表反过来核对一遍。
 */
export default function distributedLinkFsmMatrixTest() {
  describe('DistributedLinkFsmMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKFSM_0100
     * @tc.name testLinkFsm0001
     * @tc.desc Verify all eight actions from stage EMPTY land on the documented next stage.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkFsm0001', 0, () => {
      const stage = LinkStage.EMPTY;
      expect(nextStage(stage, LinkAction.CREATE_SERVER)).assertEqual(LinkStage.SERVER_CREATED);
      expect(nextStage(stage, LinkAction.START)).assertEqual(LinkStage.EMPTY);
      expect(nextStage(stage, LinkAction.STOP)).assertEqual(LinkStage.EMPTY);
      expect(nextStage(stage, LinkAction.CREATE_CONNECTION)).assertEqual(LinkStage.CONNECTION_CREATED);
      expect(nextStage(stage, LinkAction.CONNECT)).assertEqual(LinkStage.EMPTY);
      expect(nextStage(stage, LinkAction.PEER_CONNECTED)).assertEqual(LinkStage.EMPTY);
      expect(nextStage(stage, LinkAction.DISCONNECT)).assertEqual(LinkStage.EMPTY);
      expect(nextStage(stage, LinkAction.CLOSE)).assertEqual(LinkStage.EMPTY);
      expect(allowedActions(stage).join(',')).assertEqual('');
      expect(stageName(stage)).assertEqual('未创建');
      expect(summarizeStage(stage, 'svc')).assertEqual('未创建；服务名 svc');
      expect(summarizeStage(stage, '  ')).assertEqual('未创建；服务名 （未填写服务名）');
      expect(stageHint(stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKFSM_0200
     * @tc.name testLinkFsm0002
     * @tc.desc Verify all eight actions from stage SERVER_CREATED land on the documented next stage.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkFsm0002', 0, () => {
      const stage = LinkStage.SERVER_CREATED;
      expect(nextStage(stage, LinkAction.CREATE_SERVER)).assertEqual(LinkStage.SERVER_CREATED);
      expect(nextStage(stage, LinkAction.START)).assertEqual(LinkStage.SERVER_STARTED);
      expect(nextStage(stage, LinkAction.STOP)).assertEqual(LinkStage.SERVER_CREATED);
      expect(nextStage(stage, LinkAction.CREATE_CONNECTION)).assertEqual(LinkStage.SERVER_CREATED);
      expect(nextStage(stage, LinkAction.CONNECT)).assertEqual(LinkStage.SERVER_CREATED);
      expect(nextStage(stage, LinkAction.PEER_CONNECTED)).assertEqual(LinkStage.SERVER_CREATED);
      expect(nextStage(stage, LinkAction.DISCONNECT)).assertEqual(LinkStage.SERVER_CREATED);
      expect(nextStage(stage, LinkAction.CLOSE)).assertEqual(LinkStage.CLOSED);
      expect(allowedActions(stage).join(',')).assertEqual('start,close');
      expect(stageName(stage)).assertEqual('服务端已创建');
      expect(summarizeStage(stage, 'svc')).assertEqual('服务端已创建；服务名 svc');
      expect(summarizeStage(stage, '  ')).assertEqual('服务端已创建；服务名 （未填写服务名）');
      expect(stageHint(stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKFSM_0300
     * @tc.name testLinkFsm0003
     * @tc.desc Verify all eight actions from stage SERVER_STARTED land on the documented next stage.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkFsm0003', 0, () => {
      const stage = LinkStage.SERVER_STARTED;
      expect(nextStage(stage, LinkAction.CREATE_SERVER)).assertEqual(LinkStage.SERVER_STARTED);
      expect(nextStage(stage, LinkAction.START)).assertEqual(LinkStage.SERVER_STARTED);
      expect(nextStage(stage, LinkAction.STOP)).assertEqual(LinkStage.SERVER_STOPPED);
      expect(nextStage(stage, LinkAction.CREATE_CONNECTION)).assertEqual(LinkStage.SERVER_STARTED);
      expect(nextStage(stage, LinkAction.CONNECT)).assertEqual(LinkStage.SERVER_STARTED);
      expect(nextStage(stage, LinkAction.PEER_CONNECTED)).assertEqual(LinkStage.SERVER_STARTED);
      expect(nextStage(stage, LinkAction.DISCONNECT)).assertEqual(LinkStage.SERVER_STARTED);
      expect(nextStage(stage, LinkAction.CLOSE)).assertEqual(LinkStage.CLOSED);
      expect(allowedActions(stage).join(',')).assertEqual('stop,close');
      expect(stageName(stage)).assertEqual('服务端已启动');
      expect(summarizeStage(stage, 'svc')).assertEqual('服务端已启动；服务名 svc');
      expect(summarizeStage(stage, '  ')).assertEqual('服务端已启动；服务名 （未填写服务名）');
      expect(stageHint(stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKFSM_0400
     * @tc.name testLinkFsm0004
     * @tc.desc Verify all eight actions from stage SERVER_STOPPED land on the documented next stage.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkFsm0004', 0, () => {
      const stage = LinkStage.SERVER_STOPPED;
      expect(nextStage(stage, LinkAction.CREATE_SERVER)).assertEqual(LinkStage.SERVER_CREATED);
      expect(nextStage(stage, LinkAction.START)).assertEqual(LinkStage.SERVER_STARTED);
      expect(nextStage(stage, LinkAction.STOP)).assertEqual(LinkStage.SERVER_STOPPED);
      expect(nextStage(stage, LinkAction.CREATE_CONNECTION)).assertEqual(LinkStage.CONNECTION_CREATED);
      expect(nextStage(stage, LinkAction.CONNECT)).assertEqual(LinkStage.SERVER_STOPPED);
      expect(nextStage(stage, LinkAction.PEER_CONNECTED)).assertEqual(LinkStage.SERVER_STOPPED);
      expect(nextStage(stage, LinkAction.DISCONNECT)).assertEqual(LinkStage.SERVER_STOPPED);
      expect(nextStage(stage, LinkAction.CLOSE)).assertEqual(LinkStage.CLOSED);
      expect(allowedActions(stage).join(',')).assertEqual('start,close');
      expect(stageName(stage)).assertEqual('服务端已停止');
      expect(summarizeStage(stage, 'svc')).assertEqual('服务端已停止；服务名 svc');
      expect(summarizeStage(stage, '  ')).assertEqual('服务端已停止；服务名 （未填写服务名）');
      expect(stageHint(stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKFSM_0500
     * @tc.name testLinkFsm0005
     * @tc.desc Verify all eight actions from stage CONNECTION_CREATED land on the documented next stage.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkFsm0005', 0, () => {
      const stage = LinkStage.CONNECTION_CREATED;
      expect(nextStage(stage, LinkAction.CREATE_SERVER)).assertEqual(LinkStage.CONNECTION_CREATED);
      expect(nextStage(stage, LinkAction.START)).assertEqual(LinkStage.CONNECTION_CREATED);
      expect(nextStage(stage, LinkAction.STOP)).assertEqual(LinkStage.CONNECTION_CREATED);
      expect(nextStage(stage, LinkAction.CREATE_CONNECTION)).assertEqual(LinkStage.CONNECTION_CREATED);
      expect(nextStage(stage, LinkAction.CONNECT)).assertEqual(LinkStage.CONNECTING);
      expect(nextStage(stage, LinkAction.PEER_CONNECTED)).assertEqual(LinkStage.CONNECTION_CREATED);
      expect(nextStage(stage, LinkAction.DISCONNECT)).assertEqual(LinkStage.CONNECTION_CREATED);
      expect(nextStage(stage, LinkAction.CLOSE)).assertEqual(LinkStage.CLOSED);
      expect(allowedActions(stage).join(',')).assertEqual('connect,close');
      expect(stageName(stage)).assertEqual('连接对象已创建');
      expect(summarizeStage(stage, 'svc')).assertEqual('连接对象已创建；服务名 svc');
      expect(summarizeStage(stage, '  ')).assertEqual('连接对象已创建；服务名 （未填写服务名）');
      expect(stageHint(stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKFSM_0600
     * @tc.name testLinkFsm0006
     * @tc.desc Verify all eight actions from stage CONNECTING land on the documented next stage.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkFsm0006', 0, () => {
      const stage = LinkStage.CONNECTING;
      expect(nextStage(stage, LinkAction.CREATE_SERVER)).assertEqual(LinkStage.CONNECTING);
      expect(nextStage(stage, LinkAction.START)).assertEqual(LinkStage.CONNECTING);
      expect(nextStage(stage, LinkAction.STOP)).assertEqual(LinkStage.CONNECTING);
      expect(nextStage(stage, LinkAction.CREATE_CONNECTION)).assertEqual(LinkStage.CONNECTING);
      expect(nextStage(stage, LinkAction.CONNECT)).assertEqual(LinkStage.CONNECTING);
      expect(nextStage(stage, LinkAction.PEER_CONNECTED)).assertEqual(LinkStage.CONNECTED);
      expect(nextStage(stage, LinkAction.DISCONNECT)).assertEqual(LinkStage.CONNECTION_CREATED);
      expect(nextStage(stage, LinkAction.CLOSE)).assertEqual(LinkStage.CLOSED);
      expect(allowedActions(stage).join(',')).assertEqual('close');
      expect(stageName(stage)).assertEqual('正在连接');
      expect(summarizeStage(stage, 'svc')).assertEqual('正在连接；服务名 svc');
      expect(summarizeStage(stage, '  ')).assertEqual('正在连接；服务名 （未填写服务名）');
      expect(stageHint(stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKFSM_0700
     * @tc.name testLinkFsm0007
     * @tc.desc Verify all eight actions from stage CONNECTED land on the documented next stage.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkFsm0007', 0, () => {
      const stage = LinkStage.CONNECTED;
      expect(nextStage(stage, LinkAction.CREATE_SERVER)).assertEqual(LinkStage.CONNECTED);
      expect(nextStage(stage, LinkAction.START)).assertEqual(LinkStage.CONNECTED);
      expect(nextStage(stage, LinkAction.STOP)).assertEqual(LinkStage.CONNECTED);
      expect(nextStage(stage, LinkAction.CREATE_CONNECTION)).assertEqual(LinkStage.CONNECTED);
      expect(nextStage(stage, LinkAction.CONNECT)).assertEqual(LinkStage.CONNECTED);
      expect(nextStage(stage, LinkAction.PEER_CONNECTED)).assertEqual(LinkStage.CONNECTED);
      expect(nextStage(stage, LinkAction.DISCONNECT)).assertEqual(LinkStage.CONNECTION_CREATED);
      expect(nextStage(stage, LinkAction.CLOSE)).assertEqual(LinkStage.CLOSED);
      expect(allowedActions(stage).join(',')).assertEqual('sendData,close');
      expect(stageName(stage)).assertEqual('已连接');
      expect(summarizeStage(stage, 'svc')).assertEqual('已连接；服务名 svc');
      expect(summarizeStage(stage, '  ')).assertEqual('已连接；服务名 （未填写服务名）');
      expect(stageHint(stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKFSM_0800
     * @tc.name testLinkFsm0008
     * @tc.desc Verify all eight actions from stage CLOSED land on the documented next stage.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkFsm0008', 0, () => {
      const stage = LinkStage.CLOSED;
      expect(nextStage(stage, LinkAction.CREATE_SERVER)).assertEqual(LinkStage.SERVER_CREATED);
      expect(nextStage(stage, LinkAction.START)).assertEqual(LinkStage.CLOSED);
      expect(nextStage(stage, LinkAction.STOP)).assertEqual(LinkStage.CLOSED);
      expect(nextStage(stage, LinkAction.CREATE_CONNECTION)).assertEqual(LinkStage.CONNECTION_CREATED);
      expect(nextStage(stage, LinkAction.CONNECT)).assertEqual(LinkStage.CLOSED);
      expect(nextStage(stage, LinkAction.PEER_CONNECTED)).assertEqual(LinkStage.CLOSED);
      expect(nextStage(stage, LinkAction.DISCONNECT)).assertEqual(LinkStage.CLOSED);
      expect(nextStage(stage, LinkAction.CLOSE)).assertEqual(LinkStage.CLOSED);
      expect(allowedActions(stage).join(',')).assertEqual('close');
      expect(stageName(stage)).assertEqual('已关闭');
      expect(summarizeStage(stage, 'svc')).assertEqual('已关闭；服务名 svc');
      expect(summarizeStage(stage, '  ')).assertEqual('已关闭；服务名 （未填写服务名）');
      expect(stageHint(stage).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKFSM_0900
     * @tc.name testLinkFsm0009
     * @tc.desc Verify action CREATE_SERVER moves exactly the expected source stages to one target.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkFsm0009', 0, () => {
      const action = LinkAction.CREATE_SERVER;
      const moved: number[] = [];
      for (const stage of ALL_LINK_STAGES) {
        if (nextStage(stage, action) !== stage) {
          moved.push(stage);
        }
      }
      expect(moved.length).assertEqual(3);
      expect(moved.join(',')).assertEqual('0,3,7');
      expect(targetsOf(action).join(',')).assertEqual('1');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKFSM_1000
     * @tc.name testLinkFsm0010
     * @tc.desc Verify action START moves exactly the expected source stages to one target.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkFsm0010', 0, () => {
      const action = LinkAction.START;
      const moved: number[] = [];
      for (const stage of ALL_LINK_STAGES) {
        if (nextStage(stage, action) !== stage) {
          moved.push(stage);
        }
      }
      expect(moved.length).assertEqual(2);
      expect(moved.join(',')).assertEqual('1,3');
      expect(targetsOf(action).join(',')).assertEqual('2');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKFSM_1100
     * @tc.name testLinkFsm0011
     * @tc.desc Verify action STOP moves exactly the expected source stages to one target.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkFsm0011', 0, () => {
      const action = LinkAction.STOP;
      const moved: number[] = [];
      for (const stage of ALL_LINK_STAGES) {
        if (nextStage(stage, action) !== stage) {
          moved.push(stage);
        }
      }
      expect(moved.length).assertEqual(1);
      expect(moved.join(',')).assertEqual('2');
      expect(targetsOf(action).join(',')).assertEqual('3');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKFSM_1200
     * @tc.name testLinkFsm0012
     * @tc.desc Verify action CREATE_CONNECTION moves exactly the expected source stages to one target.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkFsm0012', 0, () => {
      const action = LinkAction.CREATE_CONNECTION;
      const moved: number[] = [];
      for (const stage of ALL_LINK_STAGES) {
        if (nextStage(stage, action) !== stage) {
          moved.push(stage);
        }
      }
      expect(moved.length).assertEqual(3);
      expect(moved.join(',')).assertEqual('0,3,7');
      expect(targetsOf(action).join(',')).assertEqual('4');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKFSM_1300
     * @tc.name testLinkFsm0013
     * @tc.desc Verify action CONNECT moves exactly the expected source stages to one target.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkFsm0013', 0, () => {
      const action = LinkAction.CONNECT;
      const moved: number[] = [];
      for (const stage of ALL_LINK_STAGES) {
        if (nextStage(stage, action) !== stage) {
          moved.push(stage);
        }
      }
      expect(moved.length).assertEqual(1);
      expect(moved.join(',')).assertEqual('4');
      expect(targetsOf(action).join(',')).assertEqual('5');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKFSM_1400
     * @tc.name testLinkFsm0014
     * @tc.desc Verify action PEER_CONNECTED moves exactly the expected source stages to one target.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkFsm0014', 0, () => {
      const action = LinkAction.PEER_CONNECTED;
      const moved: number[] = [];
      for (const stage of ALL_LINK_STAGES) {
        if (nextStage(stage, action) !== stage) {
          moved.push(stage);
        }
      }
      expect(moved.length).assertEqual(1);
      expect(moved.join(',')).assertEqual('5');
      expect(targetsOf(action).join(',')).assertEqual('6');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKFSM_1500
     * @tc.name testLinkFsm0015
     * @tc.desc Verify action DISCONNECT moves exactly the expected source stages to one target.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkFsm0015', 0, () => {
      const action = LinkAction.DISCONNECT;
      const moved: number[] = [];
      for (const stage of ALL_LINK_STAGES) {
        if (nextStage(stage, action) !== stage) {
          moved.push(stage);
        }
      }
      expect(moved.length).assertEqual(2);
      expect(moved.join(',')).assertEqual('5,6');
      expect(targetsOf(action).join(',')).assertEqual('4');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKFSM_1600
     * @tc.name testLinkFsm0016
     * @tc.desc Verify action CLOSE moves exactly the expected source stages to one target.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkFsm0016', 0, () => {
      const action = LinkAction.CLOSE;
      const moved: number[] = [];
      for (const stage of ALL_LINK_STAGES) {
        if (nextStage(stage, action) !== stage) {
          moved.push(stage);
        }
      }
      expect(moved.length).assertEqual(6);
      expect(moved.join(',')).assertEqual('1,2,3,4,5,6');
      expect(targetsOf(action).join(',')).assertEqual('7');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKFSM_1700
     * @tc.name testLinkFsm0017
     * @tc.desc Verify the server lifecycle start stop restart and close.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkFsm0017', 0, () => {
      const actions: LinkAction[] = [
        LinkAction.CREATE_SERVER, LinkAction.START, LinkAction.STOP, LinkAction.START, LinkAction.STOP,
        LinkAction.CLOSE
      ];
      const trail = walkLink(actions);
      expect(trail.length).assertEqual(6);
      expect(trail[trail.length - 1]).assertEqual('已关闭');
      expect(trail.join('>')).assertEqual('服务端已创建>服务端已启动>服务端已停止>服务端已启动>服务端已停止>已关闭');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKFSM_1800
     * @tc.name testLinkFsm0018
     * @tc.desc Verify the connection lifecycle connect, drop and reconnect before close.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkFsm0018', 0, () => {
      const actions: LinkAction[] = [
        LinkAction.CREATE_CONNECTION, LinkAction.CONNECT, LinkAction.PEER_CONNECTED,
        LinkAction.DISCONNECT, LinkAction.CONNECT, LinkAction.PEER_CONNECTED, LinkAction.CLOSE
      ];
      const trail = walkLink(actions);
      expect(trail.length).assertEqual(7);
      expect(trail[trail.length - 1]).assertEqual('已关闭');
      expect(trail.join('>')).assertEqual('连接对象已创建>正在连接>已连接>连接对象已创建>正在连接>已连接>已关闭');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKFSM_1900
     * @tc.name testLinkFsm0019
     * @tc.desc Verify the stopped server handing over to a new connection object.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkFsm0019', 0, () => {
      const actions: LinkAction[] = [
        LinkAction.CREATE_SERVER, LinkAction.START, LinkAction.STOP, LinkAction.CREATE_CONNECTION
      ];
      const trail = walkLink(actions);
      expect(trail.length).assertEqual(4);
      expect(trail[trail.length - 1]).assertEqual('连接对象已创建');
      expect(trail.join('>')).assertEqual('服务端已创建>服务端已启动>服务端已停止>连接对象已创建');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKFSM_2000
     * @tc.name testLinkFsm0020
     * @tc.desc Verify the create close create close cycle ending on a connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkFsm0020', 0, () => {
      const actions: LinkAction[] = [
        LinkAction.CREATE_SERVER, LinkAction.CLOSE, LinkAction.CREATE_SERVER, LinkAction.CLOSE,
        LinkAction.CREATE_CONNECTION
      ];
      const trail = walkLink(actions);
      expect(trail.length).assertEqual(5);
      expect(trail[trail.length - 1]).assertEqual('连接对象已创建');
      expect(trail.join('>')).assertEqual('服务端已创建>已关闭>服务端已创建>已关闭>连接对象已创建');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKFSM_2100
     * @tc.name testLinkFsm0021
     * @tc.desc Verify the every illegal action from EMPTY leaving the stage untouched.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkFsm0021', 0, () => {
      const actions: LinkAction[] = [
        LinkAction.START, LinkAction.STOP, LinkAction.CONNECT, LinkAction.PEER_CONNECTED,
        LinkAction.DISCONNECT, LinkAction.CLOSE
      ];
      const trail = walkLink(actions);
      expect(trail.length).assertEqual(6);
      expect(trail[trail.length - 1]).assertEqual('未创建');
      expect(trail.join('>')).assertEqual('未创建>未创建>未创建>未创建>未创建>未创建');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKFSM_2200
     * @tc.name testLinkFsm0022
     * @tc.desc Verify the cancel while connecting returning to the created connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkFsm0022', 0, () => {
      const actions: LinkAction[] = [
        LinkAction.CREATE_CONNECTION, LinkAction.CONNECT, LinkAction.DISCONNECT
      ];
      const trail = walkLink(actions);
      expect(trail.length).assertEqual(3);
      expect(trail[trail.length - 1]).assertEqual('连接对象已创建');
      expect(trail.join('>')).assertEqual('连接对象已创建>正在连接>连接对象已创建');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKFSM_2300
     * @tc.name testLinkFsm0023
     * @tc.desc Verify the duplicate start and stop being ignored.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkFsm0023', 0, () => {
      const actions: LinkAction[] = [
        LinkAction.CREATE_SERVER, LinkAction.START, LinkAction.START, LinkAction.STOP, LinkAction.STOP
      ];
      const trail = walkLink(actions);
      expect(trail.length).assertEqual(5);
      expect(trail[trail.length - 1]).assertEqual('服务端已停止');
      expect(trail.join('>')).assertEqual('服务端已创建>服务端已启动>服务端已启动>服务端已停止>服务端已停止');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKFSM_2400
     * @tc.name testLinkFsm0024
     * @tc.desc Verify the peer connected arriving before connect being ignored.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkFsm0024', 0, () => {
      const actions: LinkAction[] = [
        LinkAction.CREATE_CONNECTION, LinkAction.PEER_CONNECTED, LinkAction.PEER_CONNECTED,
        LinkAction.CONNECT, LinkAction.PEER_CONNECTED
      ];
      const trail = walkLink(actions);
      expect(trail.length).assertEqual(5);
      expect(trail[trail.length - 1]).assertEqual('已连接');
      expect(trail.join('>')).assertEqual('连接对象已创建>连接对象已创建>连接对象已创建>正在连接>已连接');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKFSM_2500
     * @tc.name testLinkFsm0025
     * @tc.desc Verify the create server ignored while a connection is connected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkFsm0025', 0, () => {
      const actions: LinkAction[] = [
        LinkAction.CREATE_CONNECTION, LinkAction.CONNECT, LinkAction.PEER_CONNECTED,
        LinkAction.CREATE_SERVER, LinkAction.START, LinkAction.DISCONNECT
      ];
      const trail = walkLink(actions);
      expect(trail.length).assertEqual(6);
      expect(trail[trail.length - 1]).assertEqual('连接对象已创建');
      expect(trail.join('>')).assertEqual('连接对象已创建>正在连接>已连接>已连接>已连接>连接对象已创建');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKFSM_2600
     * @tc.name testLinkFsm0026
     * @tc.desc Verify the histogram of final stages over all sixty four two step paths from EMPTY.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkFsm0026', 0, () => {
      const histogram: number[] = [0, 0, 0, 0, 0, 0, 0, 0];
      for (const first of ALL_LINK_ACTIONS) {
        for (const second of ALL_LINK_ACTIONS) {
          const end: number = nextStage(nextStage(LinkStage.EMPTY, first), second);
          histogram[end] = histogram[end] + 1;
        }
      }
      expect(histogram.join(',')).assertEqual('36,12,1,0,12,1,0,2');
      expect(histogram.reduce((sum: number, value: number) => sum + value, 0)).assertEqual(64);
      expect(histogram[6]).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKFSM_2700
     * @tc.name testLinkFsm0027
     * @tc.desc Verify every link stage becomes reachable from EMPTY within three actions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkFsm0027', 0, () => {
      let frontier: LinkStage[] = [LinkStage.EMPTY];
      const reached = new Set<number>([LinkStage.EMPTY]);
      for (let step = 0; step < 3; step++) {
        const next: LinkStage[] = [];
        for (const stage of frontier) {
          for (const action of ALL_LINK_ACTIONS) {
            const target = nextStage(stage, action);
            reached.add(target);
            next.push(target);
          }
        }
        frontier = next;
      }
      expect(reached.size).assertEqual(8);
      expect(reached.has(LinkStage.CONNECTED)).assertTrue();
      expect(reached.has(LinkStage.CLOSED)).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKFSM_2800
     * @tc.name testLinkFsm0028
     * @tc.desc Verify no action ever leads a non empty stage back to EMPTY across the full table.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkFsm0028', 0, () => {
      let toEmpty = 0;
      let selfLoops = 0;
      for (const stage of ALL_LINK_STAGES) {
        for (const action of ALL_LINK_ACTIONS) {
          const target = nextStage(stage, action);
          toEmpty += stage !== LinkStage.EMPTY && target === LinkStage.EMPTY ? 1 : 0;
          selfLoops += target === stage ? 1 : 0;
        }
      }
      expect(toEmpty).assertEqual(0);
      expect(selfLoops).assertEqual(45);
      expect(ALL_LINK_STAGES.length * ALL_LINK_ACTIONS.length).assertEqual(64);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKFSM_2900
     * @tc.name testLinkFsm0029
     * @tc.desc Verify the can predicates agree with allowedActions for every stage.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkFsm0029', 0, () => {
      for (const stage of ALL_LINK_STAGES) {
        const actions = allowedActions(stage);
        expect(actions.includes('start')).assertEqual(canStart(stage));
        expect(actions.includes('stop')).assertEqual(canStop(stage));
        expect(actions.includes('connect')).assertEqual(canConnect(stage));
        expect(actions.includes('sendData')).assertEqual(canSend(stage));
        expect(actions.includes('close')).assertEqual(canClose(stage));
      }
      expect(allowedActions(LinkStage.EMPTY).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LINKFSM_3000
     * @tc.name testLinkFsm0030
     * @tc.desc Verify each allowed button really changes the stage when the matching action is applied.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkFsm0030', 0, () => {
      let applied = 0;
      for (const stage of ALL_LINK_STAGES) {
        if (canStart(stage)) {
          expect(nextStage(stage, LinkAction.START)).assertEqual(LinkStage.SERVER_STARTED);
          applied++;
        }
        if (canStop(stage)) {
          expect(nextStage(stage, LinkAction.STOP)).assertEqual(LinkStage.SERVER_STOPPED);
          applied++;
        }
        if (canConnect(stage)) {
          expect(nextStage(stage, LinkAction.CONNECT)).assertEqual(LinkStage.CONNECTING);
          applied++;
        }
      }
      expect(applied).assertEqual(4);
    });
  });
}
