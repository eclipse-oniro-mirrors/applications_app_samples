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
  CHANNEL_STATE_BR_NO_PAIRED, CHANNEL_STATE_RESUME, CHANNEL_STATE_SOFTWARE_FAILED, CHANNEL_STATE_WAIT_RESUME,
  COLLABORATE_ACCEPT, COLLABORATE_REJECT, ERROR_CODE_BR_DISABLED, ERROR_CODE_CALL_RESTRICTED,
  ERROR_CODE_CAPABILITY_UNSUPPORTED, ERROR_CODE_CHANNEL_INTERNAL, ERROR_CODE_CHANNEL_INVALID,
  ERROR_CODE_CHANNEL_PARAM, ERROR_CODE_CONNECT_TIMEOUT, ERROR_CODE_DATA_TOO_LONG,
  ERROR_CODE_INVALID_PARAM, ERROR_CODE_LINK_CONNECTION_LIMIT, ERROR_CODE_LINK_DUPLICATE_NAME,
  ERROR_CODE_LINK_INTERNAL, ERROR_CODE_LINK_INVALID_PARAM, ERROR_CODE_LINK_NOT_READY,
  ERROR_CODE_LINK_SERVER_LIMIT, ERROR_CODE_OPERATION_FAILED, ERROR_CODE_PERMISSION_DENIED,
  ERROR_CODE_SEND_FAILED, ERROR_CODE_SERVER_NOT_STARTED, ERROR_CODE_NOT_PAIRED, LINK_TYPE_BR, ProbeStatus,
  channelStateName, classifyErrorCode, collaborateResultName, isChannelUsable, isReadyStatus, isSuccessCode,
  probeStatusHint, probeStatusName
} from '../../../main/ets/model/ProbeState';

/** 16 个状态的枚举值，按声明顺序排列：用于一次性遍历文案 */
function allStatuses(): ProbeStatus[] {
  return [
    ProbeStatus.IDLE, ProbeStatus.READY, ProbeStatus.PERMISSION_DENIED, ProbeStatus.CAPABILITY_UNSUPPORTED,
    ProbeStatus.UNPAIRED, ProbeStatus.BR_DISABLED, ProbeStatus.DUPLICATE_NAME, ProbeStatus.LIMIT_EXCEEDED,
    ProbeStatus.NOT_READY, ProbeStatus.INVALID_PARAM, ProbeStatus.CHANNEL_INVALID, ProbeStatus.RESTRICTED,
    ProbeStatus.DATA_TOO_LONG, ProbeStatus.SEND_FAILED, ProbeStatus.INTERNAL, ProbeStatus.FAILED
  ];
}

/** 与 allStatuses 一一对应的期望名称 */
function allStatusNames(): string[] {
  return [
    '未探测', '可用', '缺少权限', '设备不支持', '对端未配对', '蓝牙未开启', '服务名重复', '数量超限',
    '连接未就绪', '参数无效', '通道不可用', '调用受限', '数据过长', '发送失败', '内部错误', '操作失败'
  ];
}

/** 文档登记的全部错误码：20 个（3 个通用 + 8 个链路 + 9 个通道） */
function documentedCodes(): number[] {
  return [
    ERROR_CODE_PERMISSION_DENIED, ERROR_CODE_INVALID_PARAM, ERROR_CODE_CAPABILITY_UNSUPPORTED,
    ERROR_CODE_CONNECT_TIMEOUT, ERROR_CODE_SERVER_NOT_STARTED, ERROR_CODE_LINK_SERVER_LIMIT,
    ERROR_CODE_LINK_DUPLICATE_NAME, ERROR_CODE_LINK_CONNECTION_LIMIT, ERROR_CODE_LINK_NOT_READY,
    ERROR_CODE_LINK_INVALID_PARAM, ERROR_CODE_LINK_INTERNAL, ERROR_CODE_BR_DISABLED, ERROR_CODE_NOT_PAIRED,
    ERROR_CODE_CHANNEL_INVALID, ERROR_CODE_CHANNEL_PARAM, ERROR_CODE_CHANNEL_INTERNAL,
    ERROR_CODE_CALL_RESTRICTED, ERROR_CODE_OPERATION_FAILED, ERROR_CODE_DATA_TOO_LONG, ERROR_CODE_SEND_FAILED
  ];
}

/** 数组去重后的条数：用来证明 16 个状态各自有独立文案 */
function uniqueCount(values: string[]): number {
  const seen: string[] = [];
  for (let i = 0; i < values.length; i++) {
    if (seen.indexOf(values[i]) < 0) {
      seen.push(values[i]);
    }
  }
  return seen.length;
}

/**
 * 探测状态与错误码映射：24 个文档错误码、16 个状态的文案与提示、通道状态与协同结果常数。
 * 这部分决定页面上"这句失败到底在说什么"，所以按码逐个验证，不做抽样。
 */
export default function distributedProbeStateMatrixTest() {
  describe('DistributedProbeStateMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STATE_0100
     * @tc.name testProbeState0001
     * @tc.desc Verify each of the sixteen statuses reports its own Chinese name.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProbeState0001', 0, () => {
      const statuses = allStatuses();
      const expected = allStatusNames();
      expect(statuses.length).assertEqual(16);
      for (let i = 0; i < statuses.length; i++) {
        expect(probeStatusName(statuses[i])).assertEqual(expected[i]);
      }
      // 名字表与状态表必须一一对应：'未探测' 是 IDLE(0) 的文案，它跑偏就说明两张表错位
      expect(expected.length).assertEqual(statuses.length);
      expect(expected.indexOf('未探测')).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STATE_0200
     * @tc.name testProbeState0002
     * @tc.desc Verify the sixteen names are pairwise distinct so a chip cannot show the wrong state.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProbeState0002', 0, () => {
      const names: string[] = [];
      const statuses = allStatuses();
      for (let i = 0; i < statuses.length; i++) {
        names.push(probeStatusName(statuses[i]));
      }
      expect(uniqueCount(names)).assertEqual(16);
      expect(names.indexOf('可用')).assertEqual(1);
      expect(names.indexOf('未探测')).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STATE_0300
     * @tc.name testProbeState0003
     * @tc.desc Verify every status carries a non empty handling hint and the two fallbacks share one text.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProbeState0003', 0, () => {
      const statuses = allStatuses();
      for (let i = 0; i < statuses.length; i++) {
        expect(probeStatusHint(statuses[i]).length > 8).assertTrue();
      }
      expect(probeStatusHint(ProbeStatus.IDLE)).assertEqual('查看日志面板里的错误码与原始描述');
      expect(probeStatusHint(ProbeStatus.FAILED)).assertEqual(probeStatusHint(ProbeStatus.IDLE));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STATE_0400
     * @tc.name testProbeState0004
     * @tc.desc Verify the permission, capability and pairing hints name the concrete action to take.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProbeState0004', 0, () => {
      expect(probeStatusHint(ProbeStatus.PERMISSION_DENIED).includes('DISTRIBUTED_DATASYNC')).assertTrue();
      expect(probeStatusHint(ProbeStatus.PERMISSION_DENIED).includes('ACCESS_BLUETOOTH')).assertTrue();
      expect(probeStatusHint(ProbeStatus.CAPABILITY_UNSUPPORTED).includes('AppCollaboration')).assertTrue();
      expect(probeStatusHint(ProbeStatus.UNPAIRED).includes('设置里配对')).assertTrue();
      expect(probeStatusHint(ProbeStatus.BR_DISABLED).includes('蓝牙开关')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STATE_0500
     * @tc.name testProbeState0005
     * @tc.desc Verify the object lifecycle hints mention the next API to call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testProbeState0005', 0, () => {
      expect(probeStatusHint(ProbeStatus.NOT_READY).includes('connectResult')).assertTrue();
      expect(probeStatusHint(ProbeStatus.DUPLICATE_NAME).includes('服务名')).assertTrue();
      expect(probeStatusHint(ProbeStatus.LIMIT_EXCEEDED).includes('上限')).assertTrue();
      expect(probeStatusHint(ProbeStatus.CHANNEL_INVALID).includes('openProxyChannel')).assertTrue();
      expect(probeStatusHint(ProbeStatus.READY).includes('下一步')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STATE_0600
     * @tc.name testProbeState0006
     * @tc.desc Verify the payload and transport hints avoid promising a retry that cannot work.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testProbeState0006', 0, () => {
      expect(probeStatusHint(ProbeStatus.DATA_TOO_LONG).includes('拆分')).assertTrue();
      expect(probeStatusHint(ProbeStatus.SEND_FAILED).includes('对端')).assertTrue();
      expect(probeStatusHint(ProbeStatus.RESTRICTED).includes('前台')).assertTrue();
      expect(probeStatusHint(ProbeStatus.INTERNAL).includes('hilog')).assertTrue();
      expect(probeStatusHint(ProbeStatus.INVALID_PARAM).includes('12:34:56:78:9A:BC')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STATE_0700
     * @tc.name testProbeState0007
     * @tc.desc Verify the three common SDK codes map to their own statuses.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProbeState0007', 0, () => {
      expect(classifyErrorCode(ERROR_CODE_PERMISSION_DENIED)).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(classifyErrorCode(ERROR_CODE_INVALID_PARAM)).assertEqual(ProbeStatus.INVALID_PARAM);
      expect(classifyErrorCode(ERROR_CODE_CAPABILITY_UNSUPPORTED)).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(ERROR_CODE_PERMISSION_DENIED).assertEqual(201);
      expect(ERROR_CODE_CAPABILITY_UNSUPPORTED).assertEqual(801);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STATE_0800
     * @tc.name testProbeState0008
     * @tc.desc Verify all eight link error codes map to distinct documented statuses.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProbeState0008', 0, () => {
      expect(classifyErrorCode(ERROR_CODE_CONNECT_TIMEOUT)).assertEqual(ProbeStatus.FAILED);
      expect(classifyErrorCode(ERROR_CODE_SERVER_NOT_STARTED)).assertEqual(ProbeStatus.NOT_READY);
      expect(classifyErrorCode(ERROR_CODE_LINK_SERVER_LIMIT)).assertEqual(ProbeStatus.LIMIT_EXCEEDED);
      expect(classifyErrorCode(ERROR_CODE_LINK_DUPLICATE_NAME)).assertEqual(ProbeStatus.DUPLICATE_NAME);
      expect(classifyErrorCode(ERROR_CODE_LINK_CONNECTION_LIMIT)).assertEqual(ProbeStatus.LIMIT_EXCEEDED);
      expect(classifyErrorCode(ERROR_CODE_LINK_NOT_READY)).assertEqual(ProbeStatus.NOT_READY);
      expect(classifyErrorCode(ERROR_CODE_LINK_INVALID_PARAM)).assertEqual(ProbeStatus.INVALID_PARAM);
      expect(classifyErrorCode(ERROR_CODE_LINK_INTERNAL)).assertEqual(ProbeStatus.INTERNAL);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STATE_0900
     * @tc.name testProbeState0009
     * @tc.desc Verify all nine channel error codes map to distinct documented statuses.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProbeState0009', 0, () => {
      expect(classifyErrorCode(ERROR_CODE_BR_DISABLED)).assertEqual(ProbeStatus.BR_DISABLED);
      expect(classifyErrorCode(ERROR_CODE_NOT_PAIRED)).assertEqual(ProbeStatus.UNPAIRED);
      expect(classifyErrorCode(ERROR_CODE_CHANNEL_INVALID)).assertEqual(ProbeStatus.CHANNEL_INVALID);
      expect(classifyErrorCode(ERROR_CODE_CHANNEL_PARAM)).assertEqual(ProbeStatus.INVALID_PARAM);
      expect(classifyErrorCode(ERROR_CODE_CHANNEL_INTERNAL)).assertEqual(ProbeStatus.INTERNAL);
      expect(classifyErrorCode(ERROR_CODE_CALL_RESTRICTED)).assertEqual(ProbeStatus.RESTRICTED);
      expect(classifyErrorCode(ERROR_CODE_OPERATION_FAILED)).assertEqual(ProbeStatus.FAILED);
      expect(classifyErrorCode(ERROR_CODE_DATA_TOO_LONG)).assertEqual(ProbeStatus.DATA_TOO_LONG);
      expect(classifyErrorCode(ERROR_CODE_SEND_FAILED)).assertEqual(ProbeStatus.SEND_FAILED);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STATE_1000
     * @tc.name testProbeState0010
     * @tc.desc Verify codes inside the two reserved ranges but not listed still classify as a failure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testProbeState0010', 0, () => {
      expect(classifyErrorCode(32390003)).assertEqual(ProbeStatus.FAILED);
      expect(classifyErrorCode(32390005)).assertEqual(ProbeStatus.FAILED);
      expect(classifyErrorCode(32390105)).assertEqual(ProbeStatus.FAILED);
      expect(classifyErrorCode(32390199)).assertEqual(ProbeStatus.FAILED);
      expect(classifyErrorCode(32390299)).assertEqual(ProbeStatus.FAILED);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STATE_1100
     * @tc.name testProbeState0011
     * @tc.desc Verify zero and negative codes are treated as idle rather than as an internal error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProbeState0011', 0, () => {
      expect(classifyErrorCode(0)).assertEqual(ProbeStatus.IDLE);
      expect(classifyErrorCode(-1)).assertEqual(ProbeStatus.IDLE);
      expect(classifyErrorCode(-2)).assertEqual(ProbeStatus.IDLE);
      expect(classifyErrorCode(-9001)).assertEqual(ProbeStatus.IDLE);
      expect(probeStatusName(classifyErrorCode(-1))).assertEqual('未探测');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STATE_1200
     * @tc.name testProbeState0012
     * @tc.desc Verify every documented code classifies to something other than idle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testProbeState0012', 0, () => {
      const codes = documentedCodes();
      expect(codes.length).assertEqual(20);
      for (let i = 0; i < codes.length; i++) {
        expect(classifyErrorCode(codes[i]) === ProbeStatus.IDLE).assertFalse();
      }
      expect(classifyErrorCode(codes[0])).assertEqual(ProbeStatus.PERMISSION_DENIED);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STATE_1300
     * @tc.name testProbeState0013
     * @tc.desc Verify only code zero counts as success and only the ready status counts as prepared.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProbeState0013', 0, () => {
      expect(isSuccessCode(0)).assertTrue();
      expect(isSuccessCode(1)).assertFalse();
      expect(isSuccessCode(-1)).assertFalse();
      expect(isSuccessCode(ERROR_CODE_NOT_PAIRED)).assertFalse();
      expect(isReadyStatus(ProbeStatus.READY)).assertTrue();
      expect(isReadyStatus(ProbeStatus.IDLE)).assertFalse();
      expect(isReadyStatus(ProbeStatus.INTERNAL)).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STATE_1400
     * @tc.name testProbeState0014
     * @tc.desc Verify the four channel states each carry their own text and only resume is usable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProbeState0014', 0, () => {
      expect(channelStateName(CHANNEL_STATE_WAIT_RESUME)).assertEqual('通道不可用，等待恢复');
      expect(channelStateName(CHANNEL_STATE_RESUME)).assertEqual('通道已恢复');
      expect(channelStateName(CHANNEL_STATE_SOFTWARE_FAILED)).assertEqual('软件异常，通道不可用');
      expect(channelStateName(CHANNEL_STATE_BR_NO_PAIRED)).assertEqual('蓝牙配对被删除，通道不可用');
      expect(isChannelUsable(CHANNEL_STATE_RESUME)).assertTrue();
      expect(isChannelUsable(CHANNEL_STATE_WAIT_RESUME)).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STATE_1500
     * @tc.name testProbeState0015
     * @tc.desc Verify an out of range channel state is reported as unknown and never as usable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProbeState0015', 0, () => {
      expect(channelStateName(4)).assertEqual('未知通道状态');
      expect(channelStateName(-1)).assertEqual('未知通道状态');
      expect(channelStateName(99)).assertEqual('未知通道状态');
      expect(isChannelUsable(4)).assertFalse();
      expect(isChannelUsable(-1)).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STATE_1600
     * @tc.name testProbeState0016
     * @tc.desc Verify the collaboration result text spells out both the code and the verdict.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProbeState0016', 0, () => {
      expect(collaborateResultName(COLLABORATE_ACCEPT)).assertEqual('ACCEPT（0）：接受协同');
      expect(collaborateResultName(COLLABORATE_REJECT)).assertEqual('REJECT（1）：拒绝协同');
      expect(collaborateResultName(201).includes('未知协同结果')).assertTrue();
      expect(collaborateResultName(201).includes('201')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STATE_1700
     * @tc.name testProbeState0017
     * @tc.desc Verify the exported constants keep the values declared by the two d.ts files.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProbeState0017', 0, () => {
      expect(CHANNEL_STATE_WAIT_RESUME).assertEqual(0);
      expect(CHANNEL_STATE_RESUME).assertEqual(1);
      expect(CHANNEL_STATE_SOFTWARE_FAILED).assertEqual(2);
      expect(CHANNEL_STATE_BR_NO_PAIRED).assertEqual(3);
      expect(LINK_TYPE_BR).assertEqual(0);
      expect(COLLABORATE_ACCEPT).assertEqual(0);
      expect(COLLABORATE_REJECT).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STATE_1800
     * @tc.name testProbeState0018
     * @tc.desc Verify the six 32390xxx families stay inside their declared decimal ranges.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testProbeState0018', 0, () => {
      expect(ERROR_CODE_BR_DISABLED >= 32390001).assertTrue();
      expect(ERROR_CODE_CHANNEL_INTERNAL <= 32390104).assertTrue();
      expect(ERROR_CODE_CALL_RESTRICTED > ERROR_CODE_CHANNEL_INTERNAL).assertTrue();
      expect(ERROR_CODE_CONNECT_TIMEOUT >= 32390200).assertTrue();
      expect(ERROR_CODE_LINK_INTERNAL <= 32390300).assertTrue();
      expect(ERROR_CODE_LINK_INTERNAL > ERROR_CODE_LINK_INVALID_PARAM).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STATE_1900
     * @tc.name testProbeState0019
     * @tc.desc Verify the status enum keeps its declared numeric values so AppStorage round trips stay stable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testProbeState0019', 0, () => {
      expect(ProbeStatus.IDLE).assertEqual(0);
      expect(ProbeStatus.READY).assertEqual(1);
      expect(ProbeStatus.UNPAIRED).assertEqual(4);
      expect(ProbeStatus.RESTRICTED).assertEqual(11);
      expect(ProbeStatus.FAILED).assertEqual(15);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STATE_2000
     * @tc.name testProbeState0020
     * @tc.desc Verify two codes sharing one status stay distinguishable by their own numeric values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testProbeState0020', 0, () => {
      // 32390202 与 32390204 同属数量超限，但两个码本身不能被合并
      expect(ERROR_CODE_LINK_SERVER_LIMIT === ERROR_CODE_LINK_CONNECTION_LIMIT).assertFalse();
      expect(classifyErrorCode(ERROR_CODE_LINK_SERVER_LIMIT))
        .assertEqual(classifyErrorCode(ERROR_CODE_LINK_CONNECTION_LIMIT));
      expect(probeStatusHint(ProbeStatus.LIMIT_EXCEEDED).includes('关闭')).assertTrue();
    });
  });
}
