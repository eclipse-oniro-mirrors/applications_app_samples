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
  BLUETOOTH_PERMISSION, CHANNEL_API_PAYLOAD_LIMIT, CHANNEL_PAYLOAD_LIMIT, DATASYNC_PERMISSION,
  DEFAULT_PEER_ADDRESS, DEFAULT_PEER_UUID, LINK_PAYLOAD_LIMIT, StorageKeys, isRouteKey
} from '../../../main/ets/common/AppConstants';
import {
  ChannelAction, ChannelStage, canSendData, channelStageHint, describeChannel, isMacAddress, isServiceUuid,
  nextChannelStage
} from '../../../main/ets/model/ChannelSession';
import {
  COLLABORATE_INDEX_KEY, CollaborateRequest, buildRequest, summarizeRequest
} from '../../../main/ets/model/CollabModel';
import {
  FEATURE_METAS, FeatureKind, entryFunctionOf, filterFeatures, isFeatureKind
} from '../../../main/ets/model/DistributedCatalog';
import { contextSnapshot } from '../../../main/ets/model/ExtensionContextInfo';
import {
  LinkAction, LinkStage, allowedActions, canConnect, canStart, canStop, nextStage, stageHint, stageName,
  summarizeStage
} from '../../../main/ets/model/LinkSession';
import { LogItem, LogLevel, appendLog, countByTag, queryLogs } from '../../../main/ets/model/LogStore';
import {
  COLLABORATE_ACCEPT, COLLABORATE_REJECT, ProbeStatus, channelStateName, collaborateResultName,
  isChannelUsable, probeStatusName
} from '../../../main/ets/model/ProbeState';
import { clampPayload, decodeUtf8, encodeUtf8, toHexPreview } from '../../../main/ets/model/TextCodec';
import {
  ChannelRunner, LOCAL_GUARD_CODE, LinkRunner, ProbeOutcome
} from '../../../main/ets/utils/DistributedProbe';
import {
  describeThrown, distributedErrorHint, errorInfo, formatError, isKnownDistributedCode
} from '../../../main/ets/utils/ErrorUtil';
import { formatDateTime, formatDuration, truncateMiddle } from '../../../main/ets/utils/FormatUtil';
import { Logger } from '../../../main/ets/utils/Logger';

/** d.ts 里登记过的 20 个错误码：通用 3 个 + 代理通道 9 个 + 链路增强 8 个 */
const REGISTERED_CODES: number[] = [
  201, 401, 801, 32390001, 32390002, 32390004, 32390006, 32390100, 32390101, 32390102,
  32390103, 32390104, 32390200, 32390201, 32390202, 32390203, 32390204, 32390205, 32390206, 32390300
];

const LINK_ACTIONS: LinkAction[] = [
  LinkAction.CREATE_SERVER, LinkAction.START, LinkAction.STOP, LinkAction.CREATE_CONNECTION,
  LinkAction.CONNECT, LinkAction.PEER_CONNECTED, LinkAction.DISCONNECT, LinkAction.CLOSE
];

const LINK_ACTION_TAGS: string[] = [
  'createServer', 'start', 'stop', 'createConnection', 'connect', 'peerConnected', 'disconnect', 'close'
];

const CHANNEL_ACTIONS: ChannelAction[] = [
  ChannelAction.OPEN, ChannelAction.OPEN_OK, ChannelAction.OPEN_FAIL, ChannelAction.SEND, ChannelAction.CLOSE
];

const CHANNEL_ACTION_TAGS: string[] = ['open', 'openOk', 'openFail', 'send', 'close'];

/** 链路正常路径：服务端两次启停后关闭，再走连接端两次连上、一次断开，最后关闭 */
const LINK_SCRIPT: number[] = [0, 1, 2, 1, 2, 7, 3, 4, 5, 6, 4, 5, 7];

/** 通道路径：打开失败一次，重开成功，连发三次后关闭 */
const CHANNEL_SCRIPT: number[] = [0, 2, 0, 1, 3, 3, 3, 4];

/** 模拟打开成功后系统回的 channelId */
const SIM_CHANNEL_ID: number = 7;

const SIM_SERVER_NAME: string = 'sim_server';

const PAYLOAD_TEXTS: string[] = ['hello', '分布式链路', 'mix中文abc', '\uD83D\uDE00ok', '\u00C0\u00C9\u00CE'];
const PAYLOAD_LIMITS: number[] = [0, 1, 3, 4, 7, 16];
const RECEIVE_TEXTS: string[] = ['hi', '你好', 'ABCDEFGHIJKLMNOPQRST'];

/** 与 main 里 thrownCode 无关的线性同余序列：只用来生成可复现的动作序列 */
function nextSeed(seed: number): number {
  return (seed * 75 + 74) % 65537;
}

function storedLogs(): LogItem[] {
  return AppStorage.get<LogItem[]>(StorageKeys.APP_LOGS) ?? [];
}

function tagsOf(logs: LogItem[]): string {
  const parts: string[] = [];
  for (const item of logs) {
    parts.push(item.tag);
  }
  return parts.join(',');
}

function wantOf(index: Object | undefined, extra: number): Record<string, Object> {
  const want: Record<string, Object> = {};
  if (index !== undefined) {
    want[COLLABORATE_INDEX_KEY] = index;
  }
  for (let i = 0; i < extra; i++) {
    want[`ohos.extra.param.key.pipe${i}`] = `${i}`;
  }
  return want;
}

/** 链路脚本 + 通道脚本 + 三次收发写进同一份日志：按真实页面的顺序拼出一次完整会话 */
function simulateSession(capacity: number): LogItem[] {
  let logs: LogItem[] = [];
  let link = LinkStage.EMPTY;
  for (const index of LINK_SCRIPT) {
    link = nextStage(link, LINK_ACTIONS[index]);
    logs = appendLog(logs, new LogItem('SimLink', LINK_ACTION_TAGS[index], summarizeStage(link, SIM_SERVER_NAME)),
      capacity);
  }
  let channel = ChannelStage.CLOSED;
  let channelId = -1;
  for (const index of CHANNEL_SCRIPT) {
    const action = CHANNEL_ACTIONS[index];
    channel = nextChannelStage(channel, action);
    if (action === ChannelAction.OPEN_OK) {
      channelId = SIM_CHANNEL_ID;
    }
    if (action === ChannelAction.CLOSE) {
      channelId = -1;
    }
    logs = appendLog(logs, new LogItem('SimChan', CHANNEL_ACTION_TAGS[index], describeChannel(channelId, channel)),
      capacity);
  }
  for (const text of RECEIVE_TEXTS) {
    const buffer = encodeUtf8(text);
    const detail = `${buffer.byteLength} 字节：${toHexPreview(buffer)}`;
    logs = appendLog(logs, new LogItem('SimChan', 'sendData', detail), capacity);
  }
  return logs;
}

/**
 * 跨模块流水线（总）：把错误码表、日志存储、编解码、两条状态机、协同模型、目录与两个 Runner 的守卫
 * 串成页面真实会走的链路，每条用例覆盖不少于三个模块，并用可复现的序列做大规模组合。
 */
export default function distributedPipelineScenarioTest() {
  describe('DistributedPipelineScenarioTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PIPE_0100
     * @tc.name testPipe0001
     * @tc.desc Verify twenty registered codes flow through outcome, status name and the log store intact.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPipe0001', 0, () => {
      let logs: LogItem[] = [];
      for (const code of REGISTERED_CODES) {
        const outcome = new ProbeOutcome('pipe', code, `m${code}`);
        logs = appendLog(logs, new LogItem('Pipe', probeStatusName(outcome.status), outcome.describe(),
          LogLevel.ERROR));
      }
      expect(logs.length).assertEqual(20);
      expect(logs[0].detail).assertEqual('pipe失败（32390300）：m32390300');
      expect(logs[19].detail).assertEqual('pipe失败（201）：m201');
      expect(countByTag(logs, '参数无效')).assertEqual(3);
      expect(countByTag(logs, '内部错误')).assertEqual(2);
      expect(countByTag(logs, '操作失败')).assertEqual(2);
      expect(countByTag(logs, '连接未就绪')).assertEqual(2);
      expect(countByTag(logs, '数量超限')).assertEqual(2);
      expect(countByTag(logs, '缺少权限')).assertEqual(1);
      expect(countByTag(logs, '未探测')).assertEqual(0);
      expect(queryLogs(logs, 'Pipe', LogLevel.ERROR, '3239', 0).length).assertEqual(17);
      expect(queryLogs(logs, 'Pipe', LogLevel.ERROR, '失败（2', 0).length).assertEqual(1);
      expect(queryLogs(logs, 'Other', LogLevel.DEBUG, '', 0).length).assertEqual(0);
      expect(new Set<string>(logs.map((item: LogItem) => item.tag)).size).assertEqual(14);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PIPE_0200
     * @tc.name testPipe0002
     * @tc.desc Verify outcome hints, error info and thrown descriptions agree for every registered code.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPipe0002', 0, () => {
      const hints = new Set<string>();
      let aligned = 0;
      let described = 0;
      let known = 0;
      for (const code of REGISTERED_CODES) {
        const outcome = new ProbeOutcome('pipe', code, 'raw');
        const hint = distributedErrorHint(code);
        hints.add(hint);
        if (outcome.hint() === hint && errorInfo(code, 'raw').hint === hint) {
          aligned++;
        }
        if (describeThrown('pipe', code, 'raw') === `${formatError('pipe', code, 'raw')}；${hint}`) {
          described++;
        }
        if (isKnownDistributedCode(code) && errorInfo(code, '').describe() === `[${code}] 未知错误`) {
          known++;
        }
      }
      expect(hints.size).assertEqual(20);
      expect(aligned).assertEqual(20);
      expect(described).assertEqual(20);
      // 401 是通用参数码，不在 isKnownDistributedCode 登记的 201 / 801 / 3239xxxx 范围内
      expect(known).assertEqual(19);
      expect(isKnownDistributedCode(401)).assertFalse();
      expect(describeThrown('pipe', 401, 'raw')).assertEqual(
        'pipe失败（401）：raw；检查服务名（不超过 255 字节）与对端参数（MAC 形如 12:34:56:78:9A:BC）');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PIPE_0300
     * @tc.name testPipe0003
     * @tc.desc Verify five texts across six byte limits keep clamp, encode and decode consistent.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPipe0003', 0, () => {
      const bytes: number[] = [];
      const chars: number[] = [];
      let withinLimit = 0;
      let roundTrip = 0;
      for (const text of PAYLOAD_TEXTS) {
        for (const limit of PAYLOAD_LIMITS) {
          const clamped = clampPayload(text, limit);
          const buffer = encodeUtf8(clamped);
          bytes.push(buffer.byteLength);
          chars.push(clamped.length);
          withinLimit += buffer.byteLength <= limit ? 1 : 0;
          roundTrip += decodeUtf8(buffer) === clamped ? 1 : 0;
        }
      }
      expect(bytes.join(',')).assertEqual('0,1,3,4,5,5,0,0,3,3,6,15,0,1,3,3,6,12,0,0,3,3,5,6,0,0,2,4,6,6');
      expect(chars.join(',')).assertEqual('0,1,3,4,5,5,0,0,1,1,2,5,0,1,3,3,4,8,0,0,1,1,3,4,0,0,1,2,3,3');
      expect(withinLimit).assertEqual(30);
      expect(roundTrip).assertEqual(30);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PIPE_0400
     * @tc.name testPipe0004
     * @tc.desc Verify the hex preview and middle truncation of each text clamped to sixteen bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPipe0004', 0, () => {
      const previews: string[] = [];
      const shortened: string[] = [];
      for (const text of PAYLOAD_TEXTS) {
        const clamped = clampPayload(text, 16);
        previews.push(toHexPreview(encodeUtf8(clamped), 4));
        shortened.push(truncateMiddle(clamped, 5));
      }
      expect(previews[0]).assertEqual('68 65 6C 6C …');
      expect(previews[1]).assertEqual('E5 88 86 E5 …');
      expect(previews[2]).assertEqual('6D 69 78 E4 …');
      expect(previews[3]).assertEqual('F0 9F 98 80 …');
      expect(previews[4]).assertEqual('C3 80 C3 89 …');
      expect(shortened[2]).assertEqual('mi…bc');
      expect(shortened.join('|')).assertEqual(`hello|分布式链路|mi…bc|${PAYLOAD_TEXTS[3]}|${PAYLOAD_TEXTS[4]}`);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PIPE_0500
     * @tc.name testPipe0005
     * @tc.desc Verify the link happy path script records stage names and enabled buttons at every step.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPipe0005', 0, () => {
      let stage = LinkStage.EMPTY;
      const stages: number[] = [stage];
      const names: string[] = [stageName(stage)];
      const buttons: string[] = [allowedActions(stage).join(',')];
      for (const index of LINK_SCRIPT) {
        stage = nextStage(stage, LINK_ACTIONS[index]);
        stages.push(stage);
        names.push(stageName(stage));
        buttons.push(allowedActions(stage).join(','));
      }
      expect(stages.join(',')).assertEqual('0,1,2,3,2,3,7,4,5,6,4,5,6,7');
      expect(names.join('>')).assertEqual('未创建>服务端已创建>服务端已启动>服务端已停止>服务端已启动>服务端已停止>' +
        '已关闭>连接对象已创建>正在连接>已连接>连接对象已创建>正在连接>已连接>已关闭');
      expect(buttons.join('|')).assertEqual('|start,close|stop,close|start,close|stop,close|start,close|close|' +
        'connect,close|close|sendData,close|connect,close|close|sendData,close|close');
      expect(summarizeStage(stage, '  ')).assertEqual('已关闭；服务名 （未填写服务名）');
      expect(summarizeStage(stage, SIM_SERVER_NAME)).assertEqual('已关闭；服务名 sim_server');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PIPE_0600
     * @tc.name testPipe0006
     * @tc.desc Verify the channel script fails once, reopens, sends three times and closes with matching text.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPipe0006', 0, () => {
      let stage = ChannelStage.CLOSED;
      let channelId = -1;
      const stages: number[] = [stage];
      const texts: string[] = [];
      const sendable: string[] = [];
      for (const index of CHANNEL_SCRIPT) {
        const action = CHANNEL_ACTIONS[index];
        stage = nextChannelStage(stage, action);
        channelId = action === ChannelAction.OPEN_OK ? SIM_CHANNEL_ID : channelId;
        channelId = action === ChannelAction.CLOSE ? -1 : channelId;
        stages.push(stage);
        texts.push(describeChannel(channelId, stage));
        sendable.push(canSendData(stage) ? 'Y' : 'N');
      }
      expect(stages.join(',')).assertEqual('0,1,3,1,2,2,2,2,0');
      expect(texts[1]).assertEqual('打开失败；尚无 channelId');
      expect(texts[3]).assertEqual('通道已打开；channelId=7');
      expect(texts[7]).assertEqual('未打开；尚无 channelId');
      expect(sendable.join('')).assertEqual('NNNYYYYN');
      expect(channelStageHint(stage)).assertEqual('先 openProxyChannel({ linkType: LINK_BR, peerDevAddr, peerUuid })');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PIPE_0700
     * @tc.name testPipe0007
     * @tc.desc Verify the MAC and UUID checks gate the open transition across a four by four grid.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPipe0007', 0, () => {
      const macs: string[] = [DEFAULT_PEER_ADDRESS, '12:34:56:78:9a:bc', '12-34-56-78-9A-BC', '12:34:56:78:9A'];
      const uuids: string[] = [
        DEFAULT_PEER_UUID, '0000a002-0000-1000-8000-00805f9b34fb', '0000A002', 'zzzzzzzz-0000-1000-8000-00805F9B34FB'
      ];
      const grid: number[] = [];
      let rejected = 0;
      for (const mac of macs) {
        for (const uuid of uuids) {
          const valid = isMacAddress(mac) && isServiceUuid(uuid);
          const stage = valid ? nextChannelStage(ChannelStage.CLOSED, ChannelAction.OPEN) : ChannelStage.CLOSED;
          grid.push(stage);
          if (!valid) {
            const outcome = new ProbeOutcome('openProxyChannel', 32390006, 'Parameter error.');
            rejected += outcome.status === ProbeStatus.INVALID_PARAM ? 1 : 0;
          }
        }
      }
      expect(grid.join('')).assertEqual('1100110000000000');
      expect(grid.filter((value: number) => value === ChannelStage.OPENING).length).assertEqual(4);
      expect(rejected).assertEqual(12);
      expect(probeStatusName(ProbeStatus.INVALID_PARAM)).assertEqual('参数无效');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PIPE_0800
     * @tc.name testPipe0008
     * @tc.desc Verify nine link runner guards leave nine warnings in the shared log with the documented tags.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPipe0008', 0, () => {
      Logger.clear();
      const runner = new LinkRunner('PipeLink');
      const outcomes: ProbeOutcome[] = [
        runner.startServer(), runner.stopServer(), runner.connect(), runner.sendData('x'), runner.disconnect(),
        runner.closeConnection(), runner.closeServer(), runner.createServer('  '), runner.createConnection('', 'x')
      ];
      const own = queryLogs(storedLogs(), 'PipeLink', LogLevel.DEBUG, '', 0);
      expect(outcomes.filter((item: ProbeOutcome) => item.code === LOCAL_GUARD_CODE).length).assertEqual(9);
      expect(own.length).assertEqual(9);
      expect(queryLogs(own, 'PipeLink', LogLevel.WARN, '', 0).length).assertEqual(9);
      expect(queryLogs(own, 'PipeLink', LogLevel.ERROR, '', 0).length).assertEqual(0);
      expect(tagsOf(own)).assertEqual('createConnection,createServer,close,close,disconnect,sendData,connect,stop,start');
      expect(Logger.count('PipeLink', 'close')).assertEqual(2);
      expect(queryLogs(own, 'PipeLink', LogLevel.WARN, 'connection', 0).length).assertEqual(5);
      expect(queryLogs(own, 'PipeLink', LogLevel.WARN, '服务端', 0).length).assertEqual(3);
      expect(outcomes[7].describe()).assertEqual('createServer未执行：服务名不能为空（d.ts：不能为空且不超过 255 字节）');
      expect(runner.hasServer() || runner.hasConnection()).assertFalse();
      Logger.clear();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PIPE_0900
     * @tc.name testPipe0009
     * @tc.desc Verify five channel runner guards are logged as warnings and never reach the system.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPipe0009', 0, async (done: Function) => {
      Logger.clear();
      const runner = new ChannelRunner('PipeChan');
      const outcomes: ProbeOutcome[] = [
        await runner.open('', DEFAULT_PEER_UUID), await runner.open(DEFAULT_PEER_ADDRESS, '  '),
        await runner.send('x'), await runner.send(''), runner.close()
      ];
      runner.release();
      const own = queryLogs(storedLogs(), 'PipeChan', LogLevel.DEBUG, '', 0);
      expect(outcomes.filter((item: ProbeOutcome) => item.code === LOCAL_GUARD_CODE).length).assertEqual(5);
      expect(own.length).assertEqual(5);
      expect(tagsOf(own)).assertEqual('closeProxyChannel,sendData,sendData,openProxyChannel,openProxyChannel');
      expect(countByTag(own, 'sendData')).assertEqual(2);
      expect(outcomes[3].message).assertEqual('尚未打开通道');
      expect(outcomes[4].describe()).assertEqual('closeProxyChannel未执行：当前没有打开的通道');
      expect(outcomes[0].hint()).assertEqual('按顺序完成前一步再调用该接口');
      expect(outcomes[0].status).assertEqual(ProbeStatus.IDLE);
      expect(runner.channelIdValue()).assertEqual(-1);
      Logger.clear();
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PIPE_1000
     * @tc.name testPipe0010
     * @tc.desc Verify eight collaborate requests are decided and logged by verdict through the shared logger.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPipe0010', 0, () => {
      Logger.clear();
      const wants: Record<string, Object>[] = [
        wantOf('0', 0), wantOf('  ', 0), wantOf('', 0), wantOf(undefined, 0),
        wantOf(3, 0), wantOf('1', 1), wantOf(undefined, 1), wantOf(true, 0)
      ];
      const results: string[] = [];
      for (const want of wants) {
        const request: CollaborateRequest = buildRequest(want);
        const level = request.accepted ? LogLevel.INFO : LogLevel.WARN;
        Logger.record(level, 'PipeCollab', request.accepted ? 'ACCEPT' : 'REJECT', summarizeRequest(request));
        results.push(collaborateResultName(request.accepted ? COLLABORATE_ACCEPT : COLLABORATE_REJECT));
      }
      const own = queryLogs(storedLogs(), 'PipeCollab', LogLevel.DEBUG, '', 0);
      expect(own.length).assertEqual(8);
      expect(Logger.count('PipeCollab', 'ACCEPT')).assertEqual(4);
      expect(queryLogs(own, 'PipeCollab', LogLevel.WARN, '', 0).length).assertEqual(4);
      expect(queryLogs(own, 'PipeCollab', LogLevel.DEBUG, 'supportcollaborateindex', 0).length).assertEqual(4);
      expect(queryLogs(own, 'PipeCollab', LogLevel.DEBUG, '参数 2 个', 0).length).assertEqual(1);
      expect(queryLogs(own, 'PipeCollab', LogLevel.DEBUG, '"（空）"', 0).length).assertEqual(3);
      expect(results.filter((text: string) => text === 'ACCEPT（0）：接受协同').length).assertEqual(4);
      expect(own[0].detail).assertEqual('协同下标 "true"，参数 1 个 → ACCEPT；扩展按 demo 规则接受协同');
      Logger.clear();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PIPE_1100
     * @tc.name testPipe0011
     * @tc.desc Verify each catalog entry routes to a page whose initial hint names its entry function.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPipe0011', 0, () => {
      let routed = 0;
      let searched = 0;
      for (const meta of FEATURE_METAS) {
        routed += isRouteKey(meta.kind) && isFeatureKind(meta.kind) ? 1 : 0;
        const hits = filterFeatures(meta.code);
        searched += hits.length === 1 && hits[0].kind === meta.kind ? 1 : 0;
      }
      const ext = contextSnapshot('DistributedExtAbility', 28, 'entry', 'zh-Hans');
      expect(routed).assertEqual(3);
      expect(searched).assertEqual(3);
      expect(ext.describe()).assertEqual('context 可用：DistributedExtAbility，type=28（distributed），模块 entry，语言 zh-Hans');
      expect(stageHint(LinkStage.EMPTY).includes('createServer')).assertTrue();
      expect(entryFunctionOf(FeatureKind.LINK)).assertEqual('linkEnhance.createServer() / createConnection()');
      expect(channelStageHint(ChannelStage.CLOSED).includes('openProxyChannel')).assertTrue();
      expect(entryFunctionOf(FeatureKind.CHANNEL)).assertEqual('proxyChannelManager.openProxyChannel()');
      expect(FEATURE_METAS[1].permission).assertEqual(DATASYNC_PERMISSION);
      expect(FEATURE_METAS[2].permission).assertEqual(BLUETOOTH_PERMISSION);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PIPE_1200
     * @tc.name testPipe0012
     * @tc.desc Verify eight open failure codes all drive the channel to FAILED and allow a fresh open.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPipe0012', 0, () => {
      const codes: number[] = [32390001, 32390002, 32390006, 32390100, 32390101, 32390102, 801, 201];
      const names: string[] = [];
      let failed = 0;
      let reopened = 0;
      for (const code of codes) {
        const outcome = new ProbeOutcome('openProxyChannel', code, 'sim');
        const opening = nextChannelStage(ChannelStage.CLOSED, ChannelAction.OPEN);
        const stage = nextChannelStage(opening, outcome.succeeded() ? ChannelAction.OPEN_OK : ChannelAction.OPEN_FAIL);
        failed += describeChannel(-1, stage) === '打开失败；尚无 channelId' && !canSendData(stage) ? 1 : 0;
        reopened += nextChannelStage(stage, ChannelAction.OPEN) === ChannelStage.OPENING ? 1 : 0;
        names.push(probeStatusName(outcome.status));
      }
      const ok = new ProbeOutcome('openProxyChannel', 0, `channelId=${SIM_CHANNEL_ID}`);
      const opened = nextChannelStage(ChannelStage.OPENING,
        ok.succeeded() ? ChannelAction.OPEN_OK : ChannelAction.OPEN_FAIL);
      expect(failed).assertEqual(8);
      expect(reopened).assertEqual(8);
      expect(names.join(',')).assertEqual('蓝牙未开启,对端未配对,参数无效,内部错误,调用受限,操作失败,设备不支持,缺少权限');
      expect(opened).assertEqual(ChannelStage.OPEN);
      expect(describeChannel(SIM_CHANNEL_ID, opened)).assertEqual('通道已打开；channelId=7');
      expect(ok.describe()).assertEqual('openProxyChannel成功：channelId=7');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PIPE_1300
     * @tc.name testPipe0013
     * @tc.desc Verify the channel state callback text built from six raw states marks only RESUME usable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPipe0013', 0, () => {
      const states: number[] = [-1, 0, 1, 2, 3, 4];
      const events: string[] = [];
      for (const state of states) {
        const stateText = `${channelStateName(state)}（${state}）`;
        events.push(`channelId=9，${stateText}，可用=${isChannelUsable(state)}`);
      }
      expect(events[0]).assertEqual('channelId=9，未知通道状态（-1），可用=false');
      expect(events[1]).assertEqual('channelId=9，通道不可用，等待恢复（0），可用=false');
      expect(events[2]).assertEqual('channelId=9，通道已恢复（1），可用=true');
      expect(events[3]).assertEqual('channelId=9，软件异常，通道不可用（2），可用=false');
      expect(events[4]).assertEqual('channelId=9，蓝牙配对被删除，通道不可用（3），可用=false');
      expect(events[5]).assertEqual('channelId=9，未知通道状态（4），可用=false');
      expect(events.filter((text: string) => text.endsWith('可用=true')).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PIPE_1400
     * @tc.name testPipe0014
     * @tc.desc Verify the received text and event detail a runner builds from three incoming payloads.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPipe0014', 0, () => {
      const received: string[] = [];
      const details: string[] = [];
      for (const text of RECEIVE_TEXTS) {
        const buffer = encodeUtf8(text);
        received.push(`${decodeUtf8(buffer)}（${toHexPreview(buffer)}）`);
        details.push(`${buffer.byteLength} 字节：${toHexPreview(buffer)}`);
      }
      expect(received[0]).assertEqual('hi（68 69）');
      expect(received[1]).assertEqual('你好（E4 BD A0 E5 A5 BD）');
      expect(received[2]).assertEqual('ABCDEFGHIJKLMNOPQRST（41 42 43 44 45 46 47 48 49 4A 4B 4C 4D 4E 4F 50 …）');
      expect(details[0]).assertEqual('2 字节：68 69');
      expect(details[1]).assertEqual('6 字节：E4 BD A0 E5 A5 BD');
      expect(details[2]).assertEqual('20 字节：41 42 43 44 45 46 47 48 49 4A 4B 4C 4D 4E 4F 50 …');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PIPE_1500
     * @tc.name testPipe0015
     * @tc.desc Verify five hundred pseudo random link walks never break the button rules of the stage machine.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPipe0015', 0, () => {
      let seed = 1;
      let violations = 0;
      let changes = 0;
      const histogram: number[] = [0, 0, 0, 0, 0, 0, 0, 0];
      const visited = new Set<number>();
      for (let walk = 0; walk < 500; walk++) {
        let stage = LinkStage.EMPTY;
        visited.add(stage);
        for (let step = 0; step < 6; step++) {
          seed = nextSeed(seed);
          const action = LINK_ACTIONS[seed % 8];
          const next = nextStage(stage, action);
          const moved = next !== stage;
          violations += action === LinkAction.START && moved !== canStart(stage) ? 1 : 0;
          violations += action === LinkAction.STOP && moved !== canStop(stage) ? 1 : 0;
          violations += action === LinkAction.CONNECT && moved !== canConnect(stage) ? 1 : 0;
          violations += action === LinkAction.CLOSE && stage === LinkStage.EMPTY && moved ? 1 : 0;
          changes += moved ? 1 : 0;
          stage = next;
          visited.add(stage);
        }
        const end: number = stage;
        histogram[end] = histogram[end] + 1;
      }
      expect(violations).assertEqual(0);
      expect(changes).assertEqual(737);
      expect(histogram.join(',')).assertEqual('96,118,40,4,113,24,6,99');
      expect(visited.size).assertEqual(8);
      expect(seed).assertEqual(39438);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PIPE_1600
     * @tc.name testPipe0016
     * @tc.desc Verify five hundred pseudo random channel walks keep SEND neutral and CLOSE terminal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPipe0016', 0, () => {
      let seed = 1;
      let violations = 0;
      let changes = 0;
      let sends = 0;
      const histogram: number[] = [0, 0, 0, 0];
      const visited = new Set<number>();
      for (let walk = 0; walk < 500; walk++) {
        let stage = ChannelStage.CLOSED;
        visited.add(stage);
        for (let step = 0; step < 8; step++) {
          seed = nextSeed(seed);
          const action = CHANNEL_ACTIONS[seed % 5];
          const next = nextChannelStage(stage, action);
          violations += action === ChannelAction.SEND && next !== stage ? 1 : 0;
          violations += action === ChannelAction.CLOSE && next !== ChannelStage.CLOSED ? 1 : 0;
          sends += action === ChannelAction.SEND && canSendData(stage) ? 1 : 0;
          changes += next !== stage ? 1 : 0;
          stage = next;
          visited.add(stage);
        }
        const end: number = stage;
        histogram[end] = histogram[end] + 1;
      }
      expect(violations).assertEqual(0);
      expect(changes).assertEqual(1176);
      expect(sends).assertEqual(71);
      expect(histogram.join(',')).assertEqual('244,110,91,55');
      expect(visited.size).assertEqual(4);
      expect(seed).assertEqual(54291);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PIPE_1700
     * @tc.name testPipe0017
     * @tc.desc Verify a full simulated session writes link, channel and payload steps into one log store.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPipe0017', 0, () => {
      const logs = simulateSession(30);
      expect(logs.length).assertEqual(24);
      expect(queryLogs(logs, 'SimLink', LogLevel.DEBUG, '', 0).length).assertEqual(13);
      expect(queryLogs(logs, 'SimChan', LogLevel.DEBUG, '', 0).length).assertEqual(11);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '已关闭', 0).length).assertEqual(2);
      expect(queryLogs(logs, '', LogLevel.DEBUG, 'channelid=7', 0).length).assertEqual(4);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '字节', 0).length).assertEqual(3);
      expect(queryLogs(logs, 'SimLink', LogLevel.DEBUG, SIM_SERVER_NAME, 0).length).assertEqual(13);
      expect(queryLogs(logs, 'SimLink', LogLevel.DEBUG, '服务端已启动', 0).length).assertEqual(2);
      expect(countByTag(logs, 'close')).assertEqual(3);
      expect(countByTag(logs, 'start')).assertEqual(2);
      expect(countByTag(logs, 'open')).assertEqual(2);
      expect(countByTag(logs, 'sendData')).assertEqual(3);
      expect(logs[0].detail).assertEqual('20 字节：41 42 43 44 45 46 47 48 49 4A 4B 4C 4D 4E 4F 50 …');
      expect(logs[23].detail).assertEqual('服务端已创建；服务名 sim_server');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PIPE_1800
     * @tc.name testPipe0018
     * @tc.desc Verify a capped store keeps only the newest ten steps of the simulated session.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPipe0018', 0, () => {
      const logs = simulateSession(10);
      const ids: number[] = logs.map((item: LogItem) => item.id);
      let descending = 0;
      for (let i = 1; i < ids.length; i++) {
        descending += ids[i - 1] > ids[i] ? 1 : 0;
      }
      expect(logs.length).assertEqual(10);
      expect(queryLogs(logs, 'SimLink', LogLevel.DEBUG, '', 0).length).assertEqual(0);
      expect(queryLogs(logs, 'SimChan', LogLevel.DEBUG, '', 0).length).assertEqual(10);
      expect(tagsOf(logs)).assertEqual('sendData,sendData,sendData,close,send,send,send,openOk,open,openFail');
      expect(descending).assertEqual(9);
      expect(queryLogs(logs, 'SimChan', LogLevel.DEBUG, '', 4).length).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PIPE_1900
     * @tc.name testPipe0019
     * @tc.desc Verify one long text clamped to the three payload limits keeps whole characters and readable text.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPipe0019', 0, () => {
      const big = '链'.repeat(400);
      const linkPart = clampPayload(big, LINK_PAYLOAD_LIMIT);
      const demoPart = clampPayload(big, CHANNEL_PAYLOAD_LIMIT);
      const apiPart = clampPayload(big, CHANNEL_API_PAYLOAD_LIMIT);
      expect(`${linkPart.length}/${encodeUtf8(linkPart).byteLength}`).assertEqual('341/1023');
      expect(`${demoPart.length}/${encodeUtf8(demoPart).byteLength}`).assertEqual('85/255');
      expect(`${apiPart.length}/${encodeUtf8(apiPart).byteLength}`).assertEqual('400/1200');
      expect(toHexPreview(encodeUtf8(demoPart), 3)).assertEqual('E9 93 BE …');
      expect(truncateMiddle(linkPart, 9)).assertEqual('链链链链…链链链链');
      expect(decodeUtf8(encodeUtf8(apiPart))).assertEqual(big);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PIPE_2000
     * @tc.name testPipe0020
     * @tc.desc Verify synthetic call durations and a fixed log date render through the format helpers.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPipe0020', 0, () => {
      const durations: number[] = [-5, 0, 999, 1000, 1500, 59999, 60000, 61500];
      const texts: string[] = durations.map((ms: number) => formatDuration(ms));
      const date = new Date(2026, 0, 2, 3, 4, 5);
      const item = new LogItem('PipeTime', 'tick', texts.join('|'), LogLevel.DEBUG, date);
      expect(texts.join('|')).assertEqual('0 ms|0 ms|999 ms|1.0 s|1.5 s|60.0 s|1 min 0 s|1 min 1 s');
      expect(item.time).assertEqual('03:04:05');
      expect(formatDateTime(date)).assertEqual('2026-01-02 03:04:05');
      expect(queryLogs([item], 'PipeTime', LogLevel.DEBUG, '1 MIN', 0).length).assertEqual(1);
      expect(queryLogs([item], 'PipeTime', LogLevel.INFO, '', 0).length).assertEqual(0);
    });
  });
}
