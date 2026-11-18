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
  BLUETOOTH_PERMISSION, FEATURE_COUNT, appSubtitle, defaultNavTitle
} from '../../../main/ets/common/AppConstants';
import {
  ChannelStage, channelStageHint, channelStageName, describeChannel
} from '../../../main/ets/model/ChannelSession';
import {
  COLLABORATE_INDEX_KEY, buildRequest, mockRequest, summarizeRequest
} from '../../../main/ets/model/CollabModel';
import { FEATURE_METAS, noteText, summaryText, titleText } from '../../../main/ets/model/DistributedCatalog';
import { contextSnapshot } from '../../../main/ets/model/ExtensionContextInfo';
import { LinkStage, stageHint, stageName, summarizeStage } from '../../../main/ets/model/LinkSession';
import { LogItem, LogLevel } from '../../../main/ets/model/LogStore';
import {
  CHANNEL_STATE_BR_NO_PAIRED, CHANNEL_STATE_RESUME, CHANNEL_STATE_SOFTWARE_FAILED, CHANNEL_STATE_WAIT_RESUME,
  ProbeStatus, channelStateName, collaborateResultName, probeStatusHint, probeStatusName
} from '../../../main/ets/model/ProbeState';
import { BtPeer } from '../../../main/ets/utils/BtPeerScanner';
import { describeThrown, distributedErrorHint, errorInfo, formatError } from '../../../main/ets/utils/ErrorUtil';
import { PermissionOutcome } from '../../../main/ets/utils/PermissionUtil';

const PROBE_STATUSES: ProbeStatus[] = [
  ProbeStatus.IDLE, ProbeStatus.READY, ProbeStatus.PERMISSION_DENIED, ProbeStatus.CAPABILITY_UNSUPPORTED,
  ProbeStatus.UNPAIRED, ProbeStatus.BR_DISABLED, ProbeStatus.DUPLICATE_NAME, ProbeStatus.LIMIT_EXCEEDED,
  ProbeStatus.NOT_READY, ProbeStatus.INVALID_PARAM, ProbeStatus.CHANNEL_INVALID, ProbeStatus.RESTRICTED,
  ProbeStatus.DATA_TOO_LONG, ProbeStatus.SEND_FAILED, ProbeStatus.INTERNAL, ProbeStatus.FAILED
];

const LINK_STAGES: LinkStage[] = [
  LinkStage.EMPTY, LinkStage.SERVER_CREATED, LinkStage.SERVER_STARTED, LinkStage.SERVER_STOPPED,
  LinkStage.CONNECTION_CREATED, LinkStage.CONNECTING, LinkStage.CONNECTED, LinkStage.CLOSED
];

const CHANNEL_STAGES: ChannelStage[] = [
  ChannelStage.CLOSED, ChannelStage.OPENING, ChannelStage.OPEN, ChannelStage.FAILED
];

const REGISTERED_CODES: number[] = [
  201, 801, 32390001, 32390002, 32390004, 32390006, 32390100, 32390101,
  32390102, 32390103, 32390104, 32390200, 32390201, 32390202, 32390203, 32390204,
  32390205, 32390206, 32390300
];

const HYGIENE_WORDS: string[] = ['undefined', 'null', 'NaN', '\n', '\t'];

function uniqueCount(values: string[]): number {
  const seen: string[] = [];
  for (const value of values) {
    if (seen.indexOf(value) < 0) {
      seen.push(value);
    }
  }
  return seen.length;
}

function dirty(text: string): boolean {
  for (const word of HYGIENE_WORDS) {
    if (text.includes(word)) {
      return true;
    }
  }
  return false;
}

function isBadgeName(text: string): boolean {
  return text.length > 0 && text.length <= 6 && !text.endsWith('。');
}

function isReadableHint(text: string): boolean {
  return text.length >= 8 && !text.endsWith(' ') && !text.endsWith('；');
}

/**
 * 国际化与文案契约（质量轴）：界面上每一段错误提示、状态名、按钮提示都来自这些纯函数。
 * 这里不核对"翻译得好不好"，而是核对"文案齐全、互不串味、兜底不把 undefined 漏到界面"。
 */
export default function distributedTextContractTest() {
  describe('DistributedTextContractTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_I18N_0100
     * @tc.name testI18n0001
     * @tc.desc Verify the sixteen probe status names are short badges and all different.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testI18n0001', 0, () => {
      const names: string[] = [];
      let badge = 0;
      for (const status of PROBE_STATUSES) {
        const name = probeStatusName(status);
        names.push(name);
        badge += isBadgeName(name) ? 1 : 0;
      }
      expect(names.length).assertEqual(16);
      expect(badge).assertEqual(16);
      expect(uniqueCount(names)).assertEqual(16);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_I18N_0200
     * @tc.name testI18n0002
     * @tc.desc Verify the sixteen probe status names keep their declaration order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testI18n0002', 0, () => {
      const names: string[] = [];
      for (const status of PROBE_STATUSES) {
        names.push(probeStatusName(status));
      }
      expect(names.join('|')).assertEqual(
        '未探测|可用|缺少权限|设备不支持|对端未配对|蓝牙未开启|服务名重复|数量超限|' +
        '连接未就绪|参数无效|通道不可用|调用受限|数据过长|发送失败|内部错误|操作失败');
      expect(names[0]).assertEqual('未探测');
      expect(names[15]).assertEqual('操作失败');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_I18N_0300
     * @tc.name testI18n0003
     * @tc.desc Verify every probe hint is a full sentence and none leaks an empty value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testI18n0003', 0, () => {
      let readable = 0;
      let clean = 0;
      for (const status of PROBE_STATUSES) {
        const hint = probeStatusHint(status);
        readable += isReadableHint(hint) ? 1 : 0;
        clean += dirty(hint) ? 0 : 1;
      }
      expect(readable).assertEqual(16);
      expect(clean).assertEqual(16);
      expect(probeStatusHint(ProbeStatus.READY)).assertEqual('对象已创建，可以继续下一步调用');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_I18N_0400
     * @tc.name testI18n0004
     * @tc.desc Verify the idle and failed statuses share the generic log hint on purpose.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testI18n0004', 0, () => {
      const hints: string[] = [];
      for (const status of PROBE_STATUSES) {
        hints.push(probeStatusHint(status));
      }
      expect(uniqueCount(hints)).assertEqual(15);
      expect(probeStatusHint(ProbeStatus.IDLE)).assertEqual('查看日志面板里的错误码与原始描述');
      expect(probeStatusHint(ProbeStatus.FAILED)).assertEqual(probeStatusHint(ProbeStatus.IDLE));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_I18N_0500
     * @tc.name testI18n0005
     * @tc.desc Verify the permission and capability hints name the exact permission strings.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testI18n0005', 0, () => {
      expect(probeStatusHint(ProbeStatus.PERMISSION_DENIED)).assertEqual(
        '先在页面里授予 DISTRIBUTED_DATASYNC / ACCESS_BLUETOOTH 再重试');
      expect(probeStatusHint(ProbeStatus.CAPABILITY_UNSUPPORTED).includes(
        'SystemCapability.DistributedSched.AppCollaboration')).assertTrue();
      expect(probeStatusHint(ProbeStatus.INVALID_PARAM).includes('12:34:56:78:9A:BC')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_I18N_0600
     * @tc.name testI18n0006
     * @tc.desc Verify the bluetooth and pairing hints tell the user where to fix the system setting.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testI18n0006', 0, () => {
      expect(probeStatusHint(ProbeStatus.BR_DISABLED)).assertEqual('经典蓝牙处于关闭状态，先打开系统蓝牙开关');
      expect(probeStatusHint(ProbeStatus.UNPAIRED)).assertEqual('系统蓝牙里没有与对端配对，先在设置里配对再打开通道');
      expect(probeStatusHint(ProbeStatus.NOT_READY).includes('connectResult')).assertTrue();
      expect(probeStatusHint(ProbeStatus.DUPLICATE_NAME).includes('服务名')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_I18N_0700
     * @tc.name testI18n0007
     * @tc.desc Verify the nineteen registered codes give nineteen distinct hints.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testI18n0007', 0, () => {
      const hints: string[] = [];
      for (const code of REGISTERED_CODES) {
        hints.push(hintOf(code));
      }
      expect(REGISTERED_CODES.length).assertEqual(19);
      expect(hints.length).assertEqual(19);
      expect(uniqueCount(hints)).assertEqual(19);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_I18N_0800
     * @tc.name testI18n0008
     * @tc.desc Verify the unregistered positive code falls back to the failure hint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testI18n0008', 0, () => {
      expect(hintOf(32390999)).assertEqual(probeStatusHint(ProbeStatus.FAILED));
      expect(hintOf(0)).assertEqual('操作已正常完成');
      expect(hintOf(-1)).assertEqual('操作已正常完成');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_I18N_0900
     * @tc.name testI18n0009
     * @tc.desc Verify the proxy channel code hints name the concrete recovery action.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testI18n0009', 0, () => {
      expect(hintOf(32390001)).assertEqual('经典蓝牙未开启，先在系统设置里打开蓝牙');
      expect(hintOf(32390002)).assertEqual('对端设备未与本机配对，先在系统设置里完成配对');
      expect(hintOf(32390004).includes('openProxyChannel')).assertTrue();
      expect(hintOf(32390006).includes('MAC 地址与 UUID')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_I18N_1000
     * @tc.name testI18n0010
     * @tc.desc Verify the link enhance timeout and server hints are distinct.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testI18n0010', 0, () => {
      expect(hintOf(32390200)).assertEqual('客户端连接超时，确认对端服务已启动且两台设备同组网');
      expect(hintOf(32390201)).assertEqual('对端服务端未启动，先在另一台设备上 createServer 并 start');
      expect(hintOf(32390205).includes('connectResult')).assertTrue();
      expect(hintOf(32390300).includes('hilog')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_I18N_1100
     * @tc.name testI18n0011
     * @tc.desc Verify the eight link stage names keep their order and stay short.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testI18n0011', 0, () => {
      const names: string[] = [];
      for (const stage of LINK_STAGES) {
        names.push(stageName(stage));
      }
      expect(names.join('|')).assertEqual('未创建|服务端已创建|服务端已启动|服务端已停止|连接对象已创建|正在连接|已连接|已关闭');
      expect(uniqueCount(names)).assertEqual(8);
      expect(stageName(LinkStage.EMPTY)).assertEqual('未创建');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_I18N_1200
     * @tc.name testI18n0012
     * @tc.desc Verify the eight link stage hints each name the next call to make.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testI18n0012', 0, () => {
      expect(stageHint(LinkStage.EMPTY).includes('createServer')).assertTrue();
      expect(stageHint(LinkStage.SERVER_CREATED).includes('start()')).assertTrue();
      expect(stageHint(LinkStage.SERVER_STARTED).includes('对端连接')).assertTrue();
      expect(stageHint(LinkStage.CONNECTION_CREATED).includes('connect()')).assertTrue();
      expect(stageHint(LinkStage.CONNECTING).includes('32390205')).assertTrue();
      expect(stageHint(LinkStage.CONNECTED).includes('sendData()')).assertTrue();
      expect(stageHint(LinkStage.CLOSED).includes('重新创建')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_I18N_1300
     * @tc.name testI18n0013
     * @tc.desc Verify the four channel stage names and their order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testI18n0013', 0, () => {
      const names: string[] = [];
      for (const stage of CHANNEL_STAGES) {
        names.push(channelStageName(stage));
      }
      expect(names.join('|')).assertEqual('未打开|正在打开|通道已打开|打开失败');
      expect(uniqueCount(names)).assertEqual(4);
      expect(channelStageName(ChannelStage.OPEN)).assertEqual('通道已打开');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_I18N_1400
     * @tc.name testI18n0014
     * @tc.desc Verify the channel stage hints mention the concrete method or error code.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testI18n0014', 0, () => {
      expect(channelStageHint(ChannelStage.CLOSED).includes('openProxyChannel')).assertTrue();
      expect(channelStageHint(ChannelStage.OPENING).includes('channelId')).assertTrue();
      expect(channelStageHint(ChannelStage.OPEN).includes('sendData')).assertTrue();
      expect(channelStageHint(ChannelStage.FAILED).includes('32390002')).assertTrue();
      expect(channelStageHint(ChannelStage.FAILED).includes('801')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_I18N_1500
     * @tc.name testI18n0015
     * @tc.desc Verify the four channel state texts describe the usability of the channel.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testI18n0015', 0, () => {
      expect(channelStateName(CHANNEL_STATE_WAIT_RESUME)).assertEqual('通道不可用，等待恢复');
      expect(channelStateName(CHANNEL_STATE_RESUME)).assertEqual('通道已恢复');
      expect(channelStateName(CHANNEL_STATE_SOFTWARE_FAILED)).assertEqual('软件异常，通道不可用');
      expect(channelStateName(CHANNEL_STATE_BR_NO_PAIRED)).assertEqual('蓝牙配对被删除，通道不可用');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_I18N_1600
     * @tc.name testI18n0016
     * @tc.desc Verify the collaborate result text carries both the enum name and the Chinese verdict.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testI18n0016', 0, () => {
      expect(collaborateResultName(0)).assertEqual('ACCEPT（0）：接受协同');
      expect(collaborateResultName(1)).assertEqual('REJECT（1）：拒绝协同');
      expect(collaborateResultName(2)).assertEqual('未知协同结果（2）');
      expect(collaborateResultName(0).includes('接受协同')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_I18N_1700
     * @tc.name testI18n0017
     * @tc.desc Verify the granted permission text drops the code parenthesis.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testI18n0017', 0, () => {
      const granted = new PermissionOutcome('ohos.permission.DISTRIBUTED_DATASYNC', true, 0, '已授权');
      expect(granted.describe()).assertEqual('DISTRIBUTED_DATASYNC 已授权');
      expect(granted.describe().includes('（')).assertFalse();
      expect(granted.describe().startsWith('ohos.permission.')).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_I18N_1800
     * @tc.name testI18n0018
     * @tc.desc Verify the denied permission text keeps the short name, the code and the message.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testI18n0018', 0, () => {
      const denied = new PermissionOutcome('ohos.permission.ACCESS_BLUETOOTH', false, 201, 'denied');
      expect(denied.describe()).assertEqual('ACCESS_BLUETOOTH 未授权（201）：denied');
      expect(denied.describe().includes(BLUETOOTH_PERMISSION)).assertFalse();
      expect(denied.describe().endsWith('denied')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_I18N_1900
     * @tc.name testI18n0019
     * @tc.desc Verify the peer label falls back when the system gives no device name.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testI18n0019', 0, () => {
      const anonymous = new BtPeer('12:34:56:78:9A:BC', '', true);
      const named = new BtPeer('12:34:56:78:9A:BC', '演示耳机', false);
      expect(anonymous.label()).assertEqual('（系统没给出名称） · 12:34:56:78:9A:BC');
      expect(named.label()).assertEqual('演示耳机 · 12:34:56:78:9A:BC');
      expect(anonymous.sourceName()).assertEqual('已配对');
      expect(named.sourceName()).assertEqual('本次发现');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_I18N_2000
     * @tc.name testI18n0020
     * @tc.desc Verify the log entry time is an eight character clock string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testI18n0020', 0, () => {
      const item = new LogItem('I18nSrc', 'time', '事件', LogLevel.INFO, new Date(2027, 0, 5, 9, 5, 4));
      expect(item.time).assertEqual('09:05:04');
      expect(item.time.length).assertEqual(8);
      expect(item.time.charAt(2)).assertEqual(':');
      expect(item.time.charAt(5)).assertEqual(':');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_I18N_2100
     * @tc.name testI18n0021
     * @tc.desc Verify the error line combines the action, the code and the hint with a separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testI18n0021', 0, () => {
      const line = describeThrown('createServer', 201, 'denied');
      expect(line.startsWith('createServer失败（201）：denied；缺少 ohos.permission.')).assertTrue();
      expect(line.split('；').length).assertEqual(2);
      expect(formatError('createServer', 201, 'denied')).assertEqual('createServer失败（201）：denied');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_I18N_2200
     * @tc.name testI18n0022
     * @tc.desc Verify the error info text brackets the code only for positive codes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testI18n0022', 0, () => {
      expect(errorInfo(32390002, 'not paired').describe()).assertEqual('[32390002] not paired');
      expect(errorInfo(0, '正常').describe()).assertEqual('正常');
      expect(errorInfo(0, '').describe()).assertEqual('未知错误');
      expect(errorInfo(801, 'unsupported').hint.includes('SystemCapability')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_I18N_2300
     * @tc.name testI18n0023
     * @tc.desc Verify the context description shows the placeholder for every empty field.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testI18n0023', 0, () => {
      const described = contextSnapshot('', 28, '', '').describe();
      expect(described.split('（未提供）').length - 1).assertEqual(3);
      expect(described.startsWith('context 可用：')).assertTrue();
      expect(described.includes('type=28（distributed）')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_I18N_2400
     * @tc.name testI18n0024
     * @tc.desc Verify the collaborate description marks an empty index and the accept verdict.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testI18n0024', 0, () => {
      expect(mockRequest('').describe()).assertEqual('协同下标 "（空）"，参数 0 个 → REJECT');
      expect(mockRequest('5').describe()).assertEqual('协同下标 "5"，参数 1 个 → ACCEPT');
      const want: Record<string, Object> = {};
      want[COLLABORATE_INDEX_KEY] = '5';
      want['extra'] = 'x';
      expect(buildRequest(want).describe()).assertEqual('协同下标 "5"，参数 2 个 → ACCEPT');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_I18N_2500
     * @tc.name testI18n0025
     * @tc.desc Verify the summarized collaborate request explains the demo rule.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testI18n0025', 0, () => {
      expect(summarizeRequest(mockRequest('2'))).assertEqual(
        '协同下标 "2"，参数 1 个 → ACCEPT；扩展按 demo 规则接受协同');
      expect(summarizeRequest(mockRequest('')).endsWith('扩展按 demo 规则拒绝协同（缺少 supportCollaborateIndex）'))
        .assertTrue();
      expect(summarizeRequest(mockRequest('2')).split('；').length).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_I18N_2600
     * @tc.name testI18n0026
     * @tc.desc Verify the link summary falls back when the server name is blank.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testI18n0026', 0, () => {
      expect(summarizeStage(LinkStage.EMPTY, '')).assertEqual('未创建；服务名 （未填写服务名）');
      expect(summarizeStage(LinkStage.EMPTY, '   ')).assertEqual('未创建；服务名 （未填写服务名）');
      expect(summarizeStage(LinkStage.CONNECTED, ' sample_link_server ')).assertEqual('已连接；服务名  sample_link_server ');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_I18N_2700
     * @tc.name testI18n0027
     * @tc.desc Verify the channel description distinguishes a missing channel id from channel zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testI18n0027', 0, () => {
      expect(describeChannel(-1, ChannelStage.CLOSED)).assertEqual('未打开；尚无 channelId');
      expect(describeChannel(0, ChannelStage.OPEN)).assertEqual('通道已打开；channelId=0');
      expect(describeChannel(7, ChannelStage.FAILED)).assertEqual('打开失败；channelId=7');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_I18N_2800
     * @tc.name testI18n0028
     * @tc.desc Verify every catalogue page has a title, a summary and a note to render.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testI18n0028', 0, () => {
      let renderable = 0;
      for (const meta of FEATURE_METAS) {
        renderable += titleText(meta).length > 0 && summaryText(meta).length > 10 && noteText(meta).length > 10 ?
          1 : 0;
      }
      expect(FEATURE_METAS.length).assertEqual(FEATURE_COUNT);
      expect(renderable).assertEqual(FEATURE_COUNT);
      expect(summaryText(FEATURE_METAS[0]).startsWith('以扩展形式')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_I18N_2900
     * @tc.name testI18n0029
     * @tc.desc Verify the shell title and subtitle are non empty and describe the three samples.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testI18n0029', 0, () => {
      expect(defaultNavTitle().length).assertEqual(10);
      expect(defaultNavTitle().includes('分布式')).assertTrue();
      expect(appSubtitle().includes('Extension')).assertTrue();
      expect(appSubtitle().includes('代理通道')).assertTrue();
      expect(dirty(defaultNavTitle()) || dirty(appSubtitle())).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_I18N_3000
     * @tc.name testI18n0030
     * @tc.desc Verify no user visible status or hint text leaks a language runtime marker.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testI18n0030', 0, () => {
      const texts: string[] = [];
      for (const status of PROBE_STATUSES) {
        texts.push(probeStatusName(status));
        texts.push(probeStatusHint(status));
      }
      for (const stage of LINK_STAGES) {
        texts.push(stageName(stage));
        texts.push(stageHint(stage));
      }
      for (const stage of CHANNEL_STAGES) {
        texts.push(channelStageName(stage));
        texts.push(channelStageHint(stage));
      }
      let clean = 0;
      for (const text of texts) {
        clean += dirty(text) ? 0 : 1;
      }
      expect(texts.length).assertEqual(56);
      expect(clean).assertEqual(56);
      expect(uniqueCount(texts)).assertEqual(55);
    });
  });
}

/** 走页面上真正使用的错误码提示出口，避免用例自己另写一份 switch */
function hintOf(code: number): string {
  return distributedErrorHint(code);
}
