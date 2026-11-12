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
import {
  ErrorInfo, describeThrown, distributedErrorHint, errorInfo, formatError, isKnownDistributedCode
} from '../../../main/ets/utils/ErrorUtil';

/** 文档登记的错误码：逐条走一遍 distributedErrorHint */
function knownCodes(): number[] {
  return [
    201, 801,
    32390001, 32390002, 32390004, 32390006, 32390100, 32390101, 32390102, 32390103, 32390104,
    32390200, 32390201, 32390202, 32390203, 32390204, 32390205, 32390206, 32390300
  ];
}

/**
 * 错误码文案：每个码给出的处理建议、码表判定的边界、以及 catch 到异常后的统一描述。
 * 页面把这段文案原样渲染，写错会让读者按错误的步骤排查，所以逐码断言关键字。
 */
export default function distributedErrorMapMatrixTest() {
  describe('DistributedErrorMapMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMAP_0100
     * @tc.name testErrorMap0001
     * @tc.desc Verify every documented code returns a hint that names a concrete next step.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorMap0001', 0, () => {
      const codes = knownCodes();
      expect(codes.length).assertEqual(19);
      for (let i = 0; i < codes.length; i++) {
        expect(distributedErrorHint(codes[i]).length > 8).assertTrue();
      }
      expect(distributedErrorHint(201)).assertEqual('缺少 ohos.permission.DISTRIBUTED_DATASYNC / ACCESS_BLUETOOTH 授权，请先申请权限');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMAP_0200
     * @tc.name testErrorMap0002
     * @tc.desc Verify the permission and capability hints name the permission and the syscap.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorMap0002', 0, () => {
      expect(distributedErrorHint(201).includes('DISTRIBUTED_DATASYNC')).assertTrue();
      expect(distributedErrorHint(201).includes('ACCESS_BLUETOOTH')).assertTrue();
      expect(distributedErrorHint(801).includes('AppCollaboration')).assertTrue();
      expect(distributedErrorHint(801).includes('镜像')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMAP_0300
     * @tc.name testErrorMap0003
     * @tc.desc Verify the bluetooth and pairing hints point at the system settings entry.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorMap0003', 0, () => {
      expect(distributedErrorHint(32390001).includes('经典蓝牙未开启')).assertTrue();
      expect(distributedErrorHint(32390001).includes('设置')).assertTrue();
      expect(distributedErrorHint(32390002).includes('配对')).assertTrue();
      expect(distributedErrorHint(32390002).includes('设置')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMAP_0400
     * @tc.name testErrorMap0004
     * @tc.desc Verify the channel identifier and parameter hints name the field to recheck.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorMap0004', 0, () => {
      expect(distributedErrorHint(32390004).includes('channelId')).assertTrue();
      expect(distributedErrorHint(32390004).includes('openProxyChannel')).assertTrue();
      expect(distributedErrorHint(32390006).includes('MAC')).assertTrue();
      expect(distributedErrorHint(32390006).includes('UUID')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMAP_0500
     * @tc.name testErrorMap0005
     * @tc.desc Verify 32390100 keeps the measured action declaration cause instead of blaming the peer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorMap0005', 0, () => {
      expect(distributedErrorHint(32390100).includes('action.ohos.pull.listener')).assertTrue();
      expect(distributedErrorHint(32390100).includes('8521221')).assertTrue();
      expect(distributedErrorHint(32390100).includes('配对')).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMAP_0600
     * @tc.name testErrorMap0006
     * @tc.desc Verify 32390101 records the push service verification failure and its code.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorMap0006', 0, () => {
      expect(distributedErrorHint(32390101).includes('推送服务')).assertTrue();
      expect(distributedErrorHint(32390101).includes('Remote is nullptr')).assertTrue();
      expect(distributedErrorHint(32390101).includes('-426115026')).assertTrue();
      expect(distributedErrorHint(32390101).includes('镜像')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMAP_0700
     * @tc.name testErrorMap0007
     * @tc.desc Verify the send side hints distinguish an over long payload from a broken channel.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorMap0007', 0, () => {
      expect(distributedErrorHint(32390103).includes('拆包')).assertTrue();
      expect(distributedErrorHint(32390104).includes('通道')).assertTrue();
      expect(distributedErrorHint(32390102).includes('超时')).assertTrue();
      expect(distributedErrorHint(32390104) === distributedErrorHint(32390103)).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMAP_0800
     * @tc.name testErrorMap0008
     * @tc.desc Verify the link side hints name the server call that has to happen first.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorMap0008', 0, () => {
      expect(distributedErrorHint(32390200).includes('超时')).assertTrue();
      expect(distributedErrorHint(32390201).includes('createServer')).assertTrue();
      expect(distributedErrorHint(32390205).includes('connectResult')).assertTrue();
      expect(distributedErrorHint(32390206).includes('255')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMAP_0900
     * @tc.name testErrorMap0009
     * @tc.desc Verify the server and connection limits are told apart instead of sharing one advice.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testErrorMap0009', 0, () => {
      expect(distributedErrorHint(32390202).includes('关闭')).assertTrue();
      expect(distributedErrorHint(32390203).includes('同名')).assertTrue();
      expect(distributedErrorHint(32390204).includes('关闭')).assertTrue();
      // 服务端超限与连接超限是两种对象，建议必须能区分是谁被占满了
      expect(distributedErrorHint(32390202)).assertEqual('服务端数量超过上限，先关闭不用的 Server');
      expect(distributedErrorHint(32390204)).assertEqual('连接数量超过上限，先关闭不用的 Connection');
      expect(distributedErrorHint(32390202) === distributedErrorHint(32390204)).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMAP_1000
     * @tc.name testErrorMap0010
     * @tc.desc Verify the two internal error codes name their own next step instead of one advice.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testErrorMap0010', 0, () => {
      // 32390100 的实测根因是 module.json5 少了 action，建议必须指到这个 action，而不是泛泛说看 hilog
      expect(distributedErrorHint(32390100).includes('action.ohos.pull.listener')).assertTrue();
      expect(distributedErrorHint(32390100).includes('8521221')).assertTrue();
      expect(distributedErrorHint(32390300).includes('hilog')).assertTrue();
      expect(distributedErrorHint(32390004) === distributedErrorHint(32390300)).assertFalse();
      expect(distributedErrorHint(32390300).includes('链路增强')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMAP_1100
     * @tc.name testErrorMap0011
     * @tc.desc Verify an unregistered positive code falls back to the failed status hint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorMap0011', 0, () => {
      // 未登记的正数错误码按 classifyErrorCode 归到 FAILED，最终落到「查看日志面板」这条通用建议
      expect(distributedErrorHint(999)).assertEqual('查看日志面板里的错误码与原始描述');
      expect(distributedErrorHint(998)).assertEqual(distributedErrorHint(999));
      expect(distributedErrorHint(999) === distributedErrorHint(201)).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMAP_1200
     * @tc.name testErrorMap0012
     * @tc.desc Verify zero and negative codes are described as a completed call, not as a failure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorMap0012', 0, () => {
      expect(distributedErrorHint(0)).assertEqual('操作已正常完成');
      expect(distributedErrorHint(-1)).assertEqual('操作已正常完成');
      expect(distributedErrorHint(-2)).assertEqual('操作已正常完成');
      expect(distributedErrorHint(-9001) === distributedErrorHint(0)).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMAP_1300
     * @tc.name testErrorMap0013
     * @tc.desc Verify the code table accepts the documented codes and rejects the gap values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorMap0013', 0, () => {
      expect(isKnownDistributedCode(201)).assertTrue();
      expect(isKnownDistributedCode(801)).assertTrue();
      expect(isKnownDistributedCode(32390001)).assertTrue();
      expect(isKnownDistributedCode(32390300)).assertTrue();
      expect(isKnownDistributedCode(0)).assertFalse();
      expect(isKnownDistributedCode(202)).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMAP_1400
     * @tc.name testErrorMap0014
     * @tc.desc Verify the four range boundaries are inclusive on both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testErrorMap0014', 0, () => {
      expect(isKnownDistributedCode(32390000)).assertFalse();
      expect(isKnownDistributedCode(32390001)).assertTrue();
      expect(isKnownDistributedCode(32390104)).assertTrue();
      expect(isKnownDistributedCode(32390105)).assertFalse();
      expect(isKnownDistributedCode(32390200)).assertTrue();
      expect(isKnownDistributedCode(32390300)).assertTrue();
      expect(isKnownDistributedCode(32390301)).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMAP_1500
     * @tc.name testErrorMap0015
     * @tc.desc Verify the failure line keeps the action, the code and the original message.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorMap0015', 0, () => {
      expect(formatError('createServer', 32390201, 'server not started'))
        .assertEqual('createServer失败（32390201）：server not started');
      expect(formatError('sendData', 32390103, 'too long')).assertEqual('sendData失败（32390103）：too long');
      expect(formatError('connect', 0, 'boom')).assertEqual('connect失败：boom');
      expect(formatError('connect', -1, 'guard')).assertEqual('connect失败：guard');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMAP_1600
     * @tc.name testErrorMap0016
     * @tc.desc Verify an empty message is replaced by the generic text instead of leaving a dangling colon.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorMap0016', 0, () => {
      expect(formatError('openProxyChannel', 0, '')).assertEqual('openProxyChannel失败：未知错误');
      expect(formatError('openProxyChannel', 32390101, '')).assertEqual('openProxyChannel失败（32390101）：未知错误');
      expect(formatError('openProxyChannel', 32390101, '').includes('：')).assertTrue();
      expect(formatError('x', 0, '').endsWith('未知错误')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMAP_1700
     * @tc.name testErrorMap0017
     * @tc.desc Verify the one line description joins the failure text and the handling hint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorMap0017', 0, () => {
      const text = describeThrown('sendData', 32390205, 'not ready');
      expect(text).assertEqual(`${formatError('sendData', 32390205, 'not ready')}；${distributedErrorHint(32390205)}`);
      expect(text.includes('connectResult')).assertTrue();
      expect(text.startsWith('sendData失败（32390205）')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMAP_1800
     * @tc.name testErrorMap0018
     * @tc.desc Verify the error holder exposes the classified status and a bracketed code prefix.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorMap0018', 0, () => {
      const denied: ErrorInfo = errorInfo(201, 'Permission denied');
      expect(denied.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(denied.describe()).assertEqual('[201] Permission denied');
      expect(denied.hint).assertEqual(distributedErrorHint(201));
      const channel: ErrorInfo = errorInfo(32390002, 'not paired');
      expect(channel.status).assertEqual(ProbeStatus.UNPAIRED);
      expect(channel.describe()).assertEqual('[32390002] not paired');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMAP_1900
     * @tc.name testErrorMap0019
     * @tc.desc Verify a zero code drops the bracket prefix and an empty message becomes the generic text.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testErrorMap0019', 0, () => {
      const done: ErrorInfo = errorInfo(0, '');
      expect(done.message).assertEqual('未知错误');
      expect(done.describe()).assertEqual('未知错误');
      expect(done.describe().includes('[')).assertFalse();
      expect(done.status).assertEqual(ProbeStatus.IDLE);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMAP_2000
     * @tc.name testErrorMap0020
     * @tc.desc Verify the nineteen documented codes each own a distinct hint so no advice is ambiguous.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testErrorMap0020', 0, () => {
      const codes = knownCodes();
      const hints: string[] = [];
      for (let i = 0; i < codes.length; i++) {
        hints.push(distributedErrorHint(codes[i]));
      }
      let unique = 0;
      for (let i = 0; i < hints.length; i++) {
        if (hints.indexOf(hints[i]) === i) {
          unique++;
        }
      }
      // 19 个登记码的建议两两不同：任何两条共用一个说法都会让读者分不清是哪个错误
      expect(unique).assertEqual(19);
      expect(codes.length).assertEqual(19);
      expect(hints.indexOf(distributedErrorHint(32390202))).assertEqual(hints.lastIndexOf(distributedErrorHint(32390202)));
    });
  });
}
