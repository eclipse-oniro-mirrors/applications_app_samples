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
import { StorageKeys } from '../../../main/ets/common/AppConstants';
import {
  ChannelAction, ChannelStage, canSendData, describeChannel, nextChannelStage
} from '../../../main/ets/model/ChannelSession';
import { COLLABORATE_INDEX_KEY, buildRequest } from '../../../main/ets/model/CollabModel';
import {
  FEATURE_METAS, FeatureKind, filterFeatures, metaOf, titleText
} from '../../../main/ets/model/DistributedCatalog';
import { contextSnapshot } from '../../../main/ets/model/ExtensionContextInfo';
import {
  LinkAction, LinkStage, allowedActions, nextStage, summarizeStage
} from '../../../main/ets/model/LinkSession';
import {
  LogItem, LogLevel, appendLog, clearLogs, countByTag, queryLogs
} from '../../../main/ets/model/LogStore';
import { ProbeStatus, classifyErrorCode, probeStatusName } from '../../../main/ets/model/ProbeState';
import { clampPayload, decodeUtf8, encodeUtf8, utf8Length } from '../../../main/ets/model/TextCodec';
import { errorInfo } from '../../../main/ets/utils/ErrorUtil';
import { Logger } from '../../../main/ets/utils/Logger';
import { PermissionOutcome } from '../../../main/ets/utils/PermissionUtil';

function bulkLogs(count: number): LogItem[] {
  const logs: LogItem[] = [];
  for (let i = 0; i < count; i++) {
    logs.push(new LogItem('RecoverSrc', `T${i % 4}`, `第 ${i} 条事件`, LogLevel.INFO));
  }
  return logs;
}

function storedLogs(): LogItem[] {
  return AppStorage.get<LogItem[]>(StorageKeys.APP_LOGS) ?? [];
}

function bytesOf(values: number[]): ArrayBuffer {
  const buffer = new ArrayBuffer(values.length);
  const view = new Uint8Array(buffer);
  for (let i = 0; i < values.length; i++) {
    view[i] = values[i];
  }
  return buffer;
}

/**
 * 失败恢复（质量轴）：把"调用失败 → 用户重试 → 状态回到可用"这条路径逐条走一遍。
 * 页面不给用户死路：通道打开失败后能重开，链路断开后能重连，日志写满后能被挤掉，
 * 过滤条件清空后能回到全量。这里断言的就是这些回退与重来的结果。
 */
export default function distributedRecoverPathTest() {
  describe('DistributedRecoverPathTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_RECOVER_0100
     * @tc.name testRecover0001
     * @tc.desc Verify a failed channel open can be retried and ends in OPEN.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecover0001', 0, () => {
      let stage = nextChannelStage(ChannelStage.CLOSED, ChannelAction.OPEN);
      expect(stage).assertEqual(ChannelStage.OPENING);
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      expect(stage).assertEqual(ChannelStage.FAILED);
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      expect(stage).assertEqual(ChannelStage.OPENING);
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      expect(stage).assertEqual(ChannelStage.OPEN);
      expect(canSendData(stage)).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_RECOVER_0200
     * @tc.name testRecover0002
     * @tc.desc Verify sending in the failed state is ignored and closing still works.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecover0002', 0, () => {
      const failed = nextChannelStage(ChannelStage.OPENING, ChannelAction.OPEN_FAIL);
      expect(nextChannelStage(failed, ChannelAction.SEND)).assertEqual(ChannelStage.FAILED);
      expect(canSendData(failed)).assertFalse();
      expect(nextChannelStage(failed, ChannelAction.CLOSE)).assertEqual(ChannelStage.CLOSED);
      expect(nextChannelStage(ChannelStage.CLOSED, ChannelAction.OPEN)).assertEqual(ChannelStage.OPENING);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_RECOVER_0300
     * @tc.name testRecover0003
     * @tc.desc Verify closing while the channel is still opening aborts the attempt.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecover0003', 0, () => {
      const opening = nextChannelStage(ChannelStage.CLOSED, ChannelAction.OPEN);
      expect(opening).assertEqual(ChannelStage.OPENING);
      expect(nextChannelStage(opening, ChannelAction.CLOSE)).assertEqual(ChannelStage.CLOSED);
      expect(nextChannelStage(opening, ChannelAction.OPEN)).assertEqual(ChannelStage.OPENING);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_RECOVER_0400
     * @tc.name testRecover0004
     * @tc.desc Verify three open close cycles end on the same closed stage.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecover0004', 0, () => {
      let stage = ChannelStage.CLOSED;
      let opened = 0;
      let closed = 0;
      for (let round = 0; round < 3; round++) {
        stage = nextChannelStage(stage, ChannelAction.OPEN);
        stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
        opened += stage === ChannelStage.OPEN ? 1 : 0;
        stage = nextChannelStage(stage, ChannelAction.CLOSE);
        closed += stage === ChannelStage.CLOSED ? 1 : 0;
      }
      expect(opened).assertEqual(3);
      expect(closed).assertEqual(3);
      expect(stage).assertEqual(ChannelStage.CLOSED);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_RECOVER_0500
     * @tc.name testRecover0005
     * @tc.desc Verify disconnecting while connecting returns to the connection created stage.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecover0005', 0, () => {
      let stage = nextStage(LinkStage.CONNECTION_CREATED, LinkAction.CONNECT);
      expect(stage).assertEqual(LinkStage.CONNECTING);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      expect(stage).assertEqual(LinkStage.CONNECTION_CREATED);
      expect(nextStage(stage, LinkAction.CONNECT)).assertEqual(LinkStage.CONNECTING);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_RECOVER_0600
     * @tc.name testRecover0006
     * @tc.desc Verify a peer connected event after disconnecting does not revive the connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecover0006', 0, () => {
      let stage = nextStage(LinkStage.CONNECTING, LinkAction.PEER_CONNECTED);
      expect(stage).assertEqual(LinkStage.CONNECTED);
      stage = nextStage(stage, LinkAction.DISCONNECT);
      expect(stage).assertEqual(LinkStage.CONNECTION_CREATED);
      expect(nextStage(stage, LinkAction.PEER_CONNECTED)).assertEqual(LinkStage.CONNECTION_CREATED);
      expect(nextStage(stage, LinkAction.CONNECT)).assertEqual(LinkStage.CONNECTING);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_RECOVER_0700
     * @tc.name testRecover0007
     * @tc.desc Verify a closed link can create a new server and start listening again.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecover0007', 0, () => {
      let stage = nextStage(LinkStage.SERVER_STARTED, LinkAction.CLOSE);
      expect(stage).assertEqual(LinkStage.CLOSED);
      stage = nextStage(stage, LinkAction.CREATE_SERVER);
      expect(stage).assertEqual(LinkStage.SERVER_CREATED);
      expect(nextStage(stage, LinkAction.START)).assertEqual(LinkStage.SERVER_STARTED);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_RECOVER_0800
     * @tc.name testRecover0008
     * @tc.desc Verify a stopped server allows creating a connection without restarting it.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecover0008', 0, () => {
      let stage = nextStage(LinkStage.SERVER_STARTED, LinkAction.STOP);
      expect(stage).assertEqual(LinkStage.SERVER_STOPPED);
      stage = nextStage(stage, LinkAction.CREATE_CONNECTION);
      expect(stage).assertEqual(LinkStage.CONNECTION_CREATED);
      expect(nextStage(stage, LinkAction.CREATE_CONNECTION)).assertEqual(LinkStage.CONNECTION_CREATED);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_RECOVER_0900
     * @tc.name testRecover0009
     * @tc.desc Verify stopping and restarting a server keeps the start action available.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecover0009', 0, () => {
      const stopped = nextStage(LinkStage.SERVER_STARTED, LinkAction.STOP);
      expect(allowedActions(stopped).indexOf('start')).assertEqual(0);
      expect(allowedActions(stopped).indexOf('stop')).assertEqual(-1);
      const restarted = nextStage(stopped, LinkAction.START);
      expect(restarted).assertEqual(LinkStage.SERVER_STARTED);
      expect(allowedActions(restarted).indexOf('stop')).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_RECOVER_1000
     * @tc.name testRecover0010
     * @tc.desc Verify a full log store drops the oldest entry and keeps accepting new ones.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecover0010', 0, () => {
      let logs: LogItem[] = [];
      for (let i = 0; i < 200; i++) {
        logs = appendLog(logs, new LogItem('RecoverFull', 'full', `第 ${i} 条事件`));
      }
      const tailBefore = logs[199].detail;
      logs = appendLog(logs, new LogItem('RecoverFull', 'full', '第 200 条事件'));
      expect(logs.length).assertEqual(200);
      expect(logs[0].detail).assertEqual('第 200 条事件');
      expect(tailBefore).assertEqual('第 0 条事件');
      expect(logs[199].detail).assertEqual('第 1 条事件');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_RECOVER_1100
     * @tc.name testRecover0011
     * @tc.desc Verify appending works again after the store is cleared.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecover0011', 0, () => {
      const old = bulkLogs(5);
      const cleared = clearLogs();
      const rebuilt = appendLog(cleared, new LogItem('RecoverRebuild', 'rebuild', '重建后第一条'));
      expect(old.length).assertEqual(5);
      expect(cleared.length).assertEqual(0);
      expect(rebuilt.length).assertEqual(1);
      expect(rebuilt[0].detail).assertEqual('重建后第一条');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_RECOVER_1200
     * @tc.name testRecover0012
     * @tc.desc Verify a non positive capacity falls back to the default instead of rejecting writes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecover0012', 0, () => {
      let logs: LogItem[] = [];
      for (let i = 0; i < 5; i++) {
        logs = appendLog(logs, new LogItem('RecoverNeg', 'neg', `第 ${i} 条事件`), -3);
      }
      expect(logs.length).assertEqual(5);
      expect(logs[0].detail).assertEqual('第 4 条事件');
      expect(countByTag(logs, 'neg')).assertEqual(5);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_RECOVER_1300
     * @tc.name testRecover0013
     * @tc.desc Verify clearing the shared store resets the count and writing restores it.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecover0013', 0, () => {
      Logger.clear();
      Logger.info('RecoverClear', 'recoverClear', '第一条');
      const before = Logger.count('RecoverClear', 'recoverClear');
      Logger.clear();
      const afterClear = Logger.count('RecoverClear', 'recoverClear');
      Logger.info('RecoverClear', 'recoverClear', '第二条');
      expect(before).assertEqual(1);
      expect(afterClear).assertEqual(0);
      expect(Logger.count('RecoverClear', 'recoverClear')).assertEqual(1);
      expect(storedLogs()[0].detail).assertEqual('第二条');
      Logger.clear();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_RECOVER_1400
     * @tc.name testRecover0014
     * @tc.desc Verify clearing one tag does not leave a stale count on another tag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecover0014', 0, () => {
      Logger.clear();
      Logger.info('RecoverA', 'tagA', 'A 一条');
      Logger.info('RecoverB', 'tagB', 'B 一条');
      const both = Logger.count('RecoverA', 'tagA') + Logger.count('RecoverB', 'tagB');
      Logger.info('RecoverA', 'tagA', 'A 二条');
      expect(both).assertEqual(2);
      expect(Logger.count('RecoverA', 'tagA')).assertEqual(2);
      expect(Logger.count('RecoverB', 'tagB')).assertEqual(1);
      expect(storedLogs().length).assertEqual(3);
      Logger.clear();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_RECOVER_1500
     * @tc.name testRecover0015
     * @tc.desc Verify a keyword that matches no tag can be replaced by one that matches a tag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecover0015', 0, () => {
      const logs = bulkLogs(40);
      const missed = queryLogs(logs, '', LogLevel.DEBUG, '不存在的关键字', 0);
      const hit = queryLogs(logs, '', LogLevel.DEBUG, 't2', 0);
      expect(missed.length).assertEqual(0);
      expect(hit.length).assertEqual(10);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 0).length).assertEqual(40);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_RECOVER_1600
     * @tc.name testRecover0016
     * @tc.desc Verify clearing the catalogue keyword restores the full list.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecover0016', 0, () => {
      expect(filterFeatures('no-such-feature').length).assertEqual(0);
      expect(filterFeatures('').length).assertEqual(3);
      expect(filterFeatures('   ').length).assertEqual(3);
      expect(filterFeatures('').length).assertEqual(FEATURE_METAS.length);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_RECOVER_1700
     * @tc.name testRecover0017
     * @tc.desc Verify a mixed case keyword still finds the feature after a failed attempt.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecover0017', 0, () => {
      expect(filterFeatures('LiNk').length).assertEqual(1);
      expect(filterFeatures('LiNk')[0].kind).assertEqual(FeatureKind.LINK);
      expect(filterFeatures('PROXYCHANNELMANAGER').length).assertEqual(1);
      expect(filterFeatures('proxyChannelManager')[0].kind).assertEqual(FeatureKind.CHANNEL);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_RECOVER_1800
     * @tc.name testRecover0018
     * @tc.desc Verify the permission text switches from denied to granted after the user allows it.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecover0018', 0, () => {
      const denied = new PermissionOutcome('ohos.permission.DISTRIBUTED_DATASYNC', false, 201, 'denied');
      const granted = new PermissionOutcome('ohos.permission.DISTRIBUTED_DATASYNC', true, 0, '已授权');
      expect(denied.describe()).assertEqual('DISTRIBUTED_DATASYNC 未授权（201）：denied');
      expect(granted.describe()).assertEqual('DISTRIBUTED_DATASYNC 已授权');
      expect(granted.describe().includes('201')).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_RECOVER_1900
     * @tc.name testRecover0019
     * @tc.desc Verify a successful call keeps its message while a known failure gets the pair hint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecover0019', 0, () => {
      const ok = errorInfo(0, '调用完成');
      const failed = errorInfo(32390002, 'not paired');
      expect(ok.describe()).assertEqual('调用完成');
      expect(ok.status).assertEqual(ProbeStatus.IDLE);
      expect(failed.status).assertEqual(ProbeStatus.UNPAIRED);
      expect(failed.hint).assertEqual('对端设备未与本机配对，先在系统设置里完成配对');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_RECOVER_2000
     * @tc.name testRecover0020
     * @tc.desc Verify a truncated buffer fails closed and the full buffer still decodes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecover0020', 0, () => {
      const full = encodeUtf8('链路');
      expect(decodeUtf8(bytesOf([0xE9, 0x93]))).assertEqual('');
      expect(decodeUtf8(full)).assertEqual('链路');
      expect(full.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_RECOVER_2100
     * @tc.name testRecover0021
     * @tc.desc Verify clamping an oversized payload keeps whole characters only.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecover0021', 0, () => {
      const clamped = clampPayload('分'.repeat(400), 1000);
      expect(clamped).assertEqual('分'.repeat(333));
      expect(utf8Length(clamped)).assertEqual(999);
      expect(clamped.length).assertEqual(333);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_RECOVER_2200
     * @tc.name testRecover0022
     * @tc.desc Verify the whole pipeline recovers from an empty filter to a full round trip.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecover0022', 0, () => {
      const missed = filterFeatures('无此能力');
      const all = filterFeatures('');
      const meta = metaOf(FeatureKind.LINK);
      const want: Record<string, Object> = {};
      want[COLLABORATE_INDEX_KEY] = '0';
      const request = buildRequest(want);
      const logs = appendLog([], new LogItem('RecoverPipe', 'pipe', titleText(meta)));
      expect(missed.length).assertEqual(0);
      expect(all.length).assertEqual(3);
      expect(request.accepted).assertTrue();
      expect(decodeUtf8(encodeUtf8(titleText(meta)))).assertEqual('链路增强');
      expect(logs[0].detail).assertEqual('链路增强');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_RECOVER_2300
     * @tc.name testRecover0023
     * @tc.desc Verify the empty stage offers no action while the connected stage offers sending.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecover0023', 0, () => {
      expect(allowedActions(LinkStage.EMPTY).length).assertEqual(0);
      expect(allowedActions(LinkStage.CONNECTED).indexOf('sendData')).assertEqual(0);
      expect(allowedActions(LinkStage.CONNECTED).indexOf('close')).assertEqual(1);
      expect(allowedActions(LinkStage.CLOSED).indexOf('start')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_RECOVER_2400
     * @tc.name testRecover0024
     * @tc.desc Verify only the open channel accepts data.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecover0024', 0, () => {
      expect(canSendData(ChannelStage.OPEN)).assertTrue();
      expect(canSendData(ChannelStage.OPENING)).assertFalse();
      expect(canSendData(ChannelStage.FAILED)).assertFalse();
      expect(canSendData(ChannelStage.CLOSED)).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_RECOVER_2500
     * @tc.name testRecover0025
     * @tc.desc Verify the channel description recovers from a missing id to a real one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecover0025', 0, () => {
      expect(describeChannel(-1, ChannelStage.FAILED)).assertEqual('打开失败；尚无 channelId');
      expect(describeChannel(3, ChannelStage.OPENING)).assertEqual('正在打开；channelId=3');
      expect(describeChannel(3, ChannelStage.OPEN)).assertEqual('通道已打开；channelId=3');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_RECOVER_2600
     * @tc.name testRecover0026
     * @tc.desc Verify the link summary falls back for a blank name and shows a filled one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecover0026', 0, () => {
      expect(summarizeStage(LinkStage.SERVER_STARTED, '  ')).assertEqual('服务端已启动；服务名 （未填写服务名）');
      expect(summarizeStage(LinkStage.SERVER_STARTED, 'sample_link_server'))
        .assertEqual('服务端已启动；服务名 sample_link_server');
      expect(summarizeStage(LinkStage.CLOSED, '')).assertEqual('已关闭；服务名 （未填写服务名）');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_RECOVER_2700
     * @tc.name testRecover0027
     * @tc.desc Verify the context snapshot replaces placeholders once the real fields arrive.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecover0027', 0, () => {
      const empty = contextSnapshot('', 28, '', '').describe();
      const filled = contextSnapshot('DistributedExtAbility', 28, 'entry', 'zh').describe();
      expect(empty.split('（未提供）').length - 1).assertEqual(3);
      expect(filled.includes('（未提供）')).assertFalse();
      expect(filled.includes('DistributedExtAbility')).assertTrue();
      expect(filled.includes('语言 zh')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_RECOVER_2800
     * @tc.name testRecover0028
     * @tc.desc Verify log ids keep increasing after the store is cleared.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecover0028', 0, () => {
      const first = new LogItem('RecoverId', 'id', '第一条');
      clearLogs();
      const second = new LogItem('RecoverId', 'id', '第二条');
      clearLogs();
      const third = new LogItem('RecoverId', 'id', '第三条');
      expect(second.id - first.id).assertEqual(1);
      expect(third.id - second.id).assertEqual(1);
      expect(third.id > first.id).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_RECOVER_2900
     * @tc.name testRecover0029
     * @tc.desc Verify a success code classifies as idle and shows the untested name.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecover0029', 0, () => {
      expect(classifyErrorCode(0)).assertEqual(ProbeStatus.IDLE);
      expect(probeStatusName(classifyErrorCode(0))).assertEqual('未探测');
      expect(probeStatusName(ProbeStatus.READY)).assertEqual('可用');
      expect(classifyErrorCode(201)).assertEqual(ProbeStatus.PERMISSION_DENIED);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_RECOVER_3000
     * @tc.name testRecover0030
     * @tc.desc Verify the channel failure recovers through reopen send and close.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecover0030', 0, () => {
      let stage = ChannelStage.CLOSED;
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
      const failed = stage;
      stage = nextChannelStage(stage, ChannelAction.OPEN);
      stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
      const opened = stage;
      stage = nextChannelStage(stage, ChannelAction.SEND);
      const sent = stage;
      stage = nextChannelStage(stage, ChannelAction.CLOSE);
      expect(failed).assertEqual(ChannelStage.FAILED);
      expect(opened).assertEqual(ChannelStage.OPEN);
      expect(sent).assertEqual(ChannelStage.OPEN);
      expect(canSendData(sent)).assertTrue();
      expect(stage).assertEqual(ChannelStage.CLOSED);
    });
  });
}
