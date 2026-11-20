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
import { ChannelAction, ChannelStage, canSendData, nextChannelStage } from '../../../main/ets/model/ChannelSession';
import {
  COLLABORATE_INDEX_KEY, buildRequest, wantParamKeys
} from '../../../main/ets/model/CollabModel';
import { FEATURE_METAS, filterFeatures } from '../../../main/ets/model/DistributedCatalog';
import { contextSnapshot } from '../../../main/ets/model/ExtensionContextInfo';
import { LinkAction, LinkStage, nextStage } from '../../../main/ets/model/LinkSession';
import {
  LogItem, LogLevel, appendLog, clearLogs, countByTag, queryLogs
} from '../../../main/ets/model/LogStore';
import { ProbeStatus, classifyErrorCode, probeStatusName } from '../../../main/ets/model/ProbeState';
import { clampPayload, decodeUtf8, encodeUtf8, toHexPreview, utf8Length } from '../../../main/ets/model/TextCodec';
import { formatDuration, truncateMiddle } from '../../../main/ets/utils/FormatUtil';
import { Logger } from '../../../main/ets/utils/Logger';

/** 重复轮数：页面反复进出、反复点击时的量级，够暴露状态残留又不拖长整套用例 */
const ROUNDS: number = 20;

const PROBE_STATUSES: ProbeStatus[] = [
  ProbeStatus.IDLE, ProbeStatus.READY, ProbeStatus.PERMISSION_DENIED, ProbeStatus.CAPABILITY_UNSUPPORTED,
  ProbeStatus.UNPAIRED, ProbeStatus.BR_DISABLED, ProbeStatus.DUPLICATE_NAME, ProbeStatus.LIMIT_EXCEEDED,
  ProbeStatus.NOT_READY, ProbeStatus.INVALID_PARAM, ProbeStatus.CHANNEL_INVALID, ProbeStatus.RESTRICTED,
  ProbeStatus.DATA_TOO_LONG, ProbeStatus.SEND_FAILED, ProbeStatus.INTERNAL, ProbeStatus.FAILED
];

const DURATION_SAMPLES: number[] = [0, 999, 1000, 1500, 59999, 60000, 61000, 3599999];

const ENCODE_SAMPLES: string[] = ['', 'a', '分布式', '😀', '混合abc 链路', '分'.repeat(341)];

const TRUNCATE_SAMPLES: string[] = ['ABCDEFGHIJ', '分布式链路示例', 'abc', 'ABCD'];

/** 造 count 条日志：来源固定，tag 在 4 个值间轮转 */
function bulkLogs(count: number): LogItem[] {
  const logs: LogItem[] = [];
  for (let i = 0; i < count; i++) {
    logs.push(new LogItem('StabSrc', `T${i % 4}`, `第 ${i} 条事件`, LogLevel.DEBUG));
  }
  return logs;
}

function uniqueCount(values: string[]): number {
  const seen: string[] = [];
  for (const value of values) {
    if (seen.indexOf(value) < 0) {
      seen.push(value);
    }
  }
  return seen.length;
}

function storedLogs(): LogItem[] {
  return AppStorage.get<LogItem[]>(StorageKeys.APP_LOGS) ?? [];
}

/**
 * 稳定性（质量轴）：每个用例把同一操作连续做 20 轮，断言"第 20 轮的结果与第 1 轮一致、
 * 中间没有残留"。纯函数看返回数组长度与顺序，AppStorage 看写入后能否被清空。
 */
export default function distributedStabilityLoopTest() {
  describe('DistributedStabilityLoopTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAB_0100
     * @tc.name testStab0001
     * @tc.desc Verify appending in twenty rounds stops at the capacity and keeps the newest entries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStab0001', 0, () => {
      let logs: LogItem[] = [];
      let firstRound = 0;
      for (let round = 0; round < ROUNDS; round++) {
        for (let i = 0; i < 5; i++) {
          logs = appendLog(logs, new LogItem('StabAppend', 'append', `第 ${round * 5 + i} 条事件`), 12);
        }
        firstRound = round === 0 ? logs.length : firstRound;
      }
      expect(firstRound).assertEqual(5);
      expect(logs.length).assertEqual(12);
      expect(logs[0].detail).assertEqual('第 99 条事件');
      expect(logs[11].detail).assertEqual('第 88 条事件');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAB_0200
     * @tc.name testStab0002
     * @tc.desc Verify two hundred and fifty appends keep exactly the default capacity without growth.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStab0002', 0, () => {
      let logs: LogItem[] = [];
      for (let i = 0; i < 250; i++) {
        logs = appendLog(logs, new LogItem('StabBulk', 'bulk', `第 ${i} 条事件`));
      }
      expect(logs.length).assertEqual(200);
      expect(logs[0].detail).assertEqual('第 249 条事件');
      expect(logs[199].detail).assertEqual('第 50 条事件');
      expect(logs[0].id > logs[199].id).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAB_0300
     * @tc.name testStab0003
     * @tc.desc Verify a zero capacity falls back to the default capacity instead of dropping entries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStab0003', 0, () => {
      let zero: LogItem[] = [];
      let negative: LogItem[] = [];
      for (let i = 0; i < 30; i++) {
        zero = appendLog(zero, new LogItem('StabZero', 'zero', `第 ${i} 条事件`), 0);
        negative = appendLog(negative, new LogItem('StabNeg', 'neg', `第 ${i} 条事件`), -5);
      }
      expect(zero.length).assertEqual(30);
      expect(negative.length).assertEqual(30);
      expect(zero[0].detail).assertEqual('第 29 条事件');
      expect(negative[0].detail).assertEqual('第 29 条事件');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAB_0400
     * @tc.name testStab0004
     * @tc.desc Verify clearing the shared log store twice leaves no entry behind.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStab0004', 0, () => {
      Logger.clear();
      Logger.info('StabClear', 'stabClear', '第一条');
      const before = storedLogs().length;
      Logger.clear();
      Logger.clear();
      expect(before).assertEqual(1);
      expect(storedLogs().length).assertEqual(0);
      expect(Logger.count('StabClear', 'stabClear')).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAB_0500
     * @tc.name testStab0005
     * @tc.desc Verify twenty write then clear rounds always end with an empty store.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStab0005', 0, () => {
      let peak = 0;
      let emptyRounds = 0;
      for (let round = 0; round < ROUNDS; round++) {
        Logger.clear();
        for (let i = 0; i < 3; i++) {
          Logger.warn('StabCycle', 'stabCycle', `第 ${i} 条`);
        }
        peak = storedLogs().length > peak ? storedLogs().length : peak;
        Logger.clear();
        emptyRounds += storedLogs().length === 0 ? 1 : 0;
      }
      expect(peak).assertEqual(3);
      expect(emptyRounds).assertEqual(ROUNDS);
      expect(Logger.count('StabCycle', 'stabCycle')).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAB_0600
     * @tc.name testStab0006
     * @tc.desc Verify twenty identical queries return the same count every round.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStab0006', 0, () => {
      const logs = bulkLogs(60);
      const counts: number[] = [];
      for (let round = 0; round < ROUNDS; round++) {
        counts.push(queryLogs(logs, '', LogLevel.DEBUG, '', 0).length);
      }
      expect(counts.length).assertEqual(ROUNDS);
      expect(counts[0]).assertEqual(60);
      expect(uniqueCount(counts.map((value: number) => `${value}`))).assertEqual(1);
      expect(logs.length).assertEqual(60);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAB_0700
     * @tc.name testStab0007
     * @tc.desc Verify twenty catalogue searches keep the declaration order of the three features.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStab0007', 0, () => {
      const orders: string[] = [];
      for (let round = 0; round < ROUNDS; round++) {
        orders.push(filterFeatures('').map((item) => item.code).join('|'));
      }
      expect(orders.length).assertEqual(ROUNDS);
      expect(orders[0]).assertEqual('EXT|LINK|CHAN');
      expect(uniqueCount(orders)).assertEqual(1);
      expect(FEATURE_METAS.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAB_0800
     * @tc.name testStab0008
     * @tc.desc Verify twenty log items receive strictly consecutive ids.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStab0008', 0, () => {
      const items: LogItem[] = [];
      let steps = 0;
      for (let i = 0; i < ROUNDS; i++) {
        items.push(new LogItem('StabSeq', 'seq', `第 ${i} 条`));
        if (i > 0 && items[i].id - items[i - 1].id === 1) {
          steps++;
        }
      }
      expect(items.length).assertEqual(ROUNDS);
      expect(steps).assertEqual(ROUNDS - 1);
      expect(items[ROUNDS - 1].id - items[0].id).assertEqual(ROUNDS - 1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAB_0900
     * @tc.name testStab0009
     * @tc.desc Verify twenty full link lifecycles all finish on CLOSED.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStab0009', 0, () => {
      const cycle: LinkAction[] = [
        LinkAction.CREATE_SERVER, LinkAction.START, LinkAction.STOP, LinkAction.CREATE_CONNECTION,
        LinkAction.CONNECT, LinkAction.PEER_CONNECTED, LinkAction.DISCONNECT, LinkAction.CLOSE
      ];
      let closed = 0;
      let stage = LinkStage.EMPTY;
      for (let round = 0; round < ROUNDS; round++) {
        stage = LinkStage.CLOSED;
        for (const action of cycle) {
          stage = nextStage(stage, action);
        }
        closed += stage === LinkStage.CLOSED ? 1 : 0;
      }
      expect(closed).assertEqual(ROUNDS);
      expect(stage).assertEqual(LinkStage.CLOSED);
      expect(nextStage(stage, LinkAction.CREATE_SERVER)).assertEqual(LinkStage.SERVER_CREATED);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAB_1000
     * @tc.name testStab0010
     * @tc.desc Verify invalid link actions never move the stage out of CONNECTED across twenty rounds.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStab0010', 0, () => {
      const invalid: LinkAction[] = [
        LinkAction.START, LinkAction.STOP, LinkAction.CONNECT, LinkAction.PEER_CONNECTED
      ];
      let unchanged = 0;
      let stage = LinkStage.CONNECTED;
      for (let round = 0; round < ROUNDS; round++) {
        for (const action of invalid) {
          stage = nextStage(stage, action);
          unchanged += stage === LinkStage.CONNECTED ? 1 : 0;
        }
      }
      expect(unchanged).assertEqual(ROUNDS * invalid.length);
      expect(stage).assertEqual(LinkStage.CONNECTED);
      expect(nextStage(stage, LinkAction.CLOSE)).assertEqual(LinkStage.CLOSED);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAB_1100
     * @tc.name testStab0011
     * @tc.desc Verify twenty channel open close cycles always end on CLOSED.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStab0011', 0, () => {
      const cycle: ChannelAction[] = [
        ChannelAction.OPEN, ChannelAction.OPEN_OK, ChannelAction.SEND, ChannelAction.CLOSE
      ];
      let closed = 0;
      let stage = ChannelStage.CLOSED;
      for (let round = 0; round < ROUNDS; round++) {
        for (const action of cycle) {
          stage = nextChannelStage(stage, action);
        }
        closed += stage === ChannelStage.CLOSED ? 1 : 0;
      }
      expect(closed).assertEqual(ROUNDS);
      expect(stage).assertEqual(ChannelStage.CLOSED);
      expect(canSendData(stage)).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAB_1200
     * @tc.name testStab0012
     * @tc.desc Verify a failed channel can be reopened in each of twenty rounds.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStab0012', 0, () => {
      let reopened = 0;
      let stage = ChannelStage.CLOSED;
      for (let round = 0; round < ROUNDS; round++) {
        stage = nextChannelStage(stage, ChannelAction.OPEN);
        stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
        stage = nextChannelStage(stage, ChannelAction.OPEN);
        stage = nextChannelStage(stage, ChannelAction.OPEN_OK);
        reopened += stage === ChannelStage.OPEN ? 1 : 0;
      }
      expect(reopened).assertEqual(ROUNDS);
      expect(stage).assertEqual(ChannelStage.OPEN);
      expect(canSendData(stage)).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAB_1300
     * @tc.name testStab0013
     * @tc.desc Verify twenty encode decode round trips over six samples stay lossless.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStab0013', 0, () => {
      let equal = 0;
      let total = 0;
      for (let round = 0; round < ROUNDS; round++) {
        for (const text of ENCODE_SAMPLES) {
          total++;
          equal += decodeUtf8(encodeUtf8(text)) === text ? 1 : 0;
        }
      }
      expect(total).assertEqual(ROUNDS * ENCODE_SAMPLES.length);
      expect(equal).assertEqual(total);
      expect(utf8Length(ENCODE_SAMPLES[2])).assertEqual(9);
      expect(utf8Length(ENCODE_SAMPLES[3])).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAB_1400
     * @tc.name testStab0014
     * @tc.desc Verify clamping twice in a row gives the same result in twenty rounds.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStab0014', 0, () => {
      const text = '分'.repeat(341) + 'abc';
      const once = clampPayload(text, 300);
      let idempotent = 0;
      for (let round = 0; round < ROUNDS; round++) {
        idempotent += clampPayload(once, 300) === once ? 1 : 0;
      }
      expect(idempotent).assertEqual(ROUNDS);
      expect(utf8Length(once)).assertEqual(300);
      expect(once.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAB_1500
     * @tc.name testStab0015
     * @tc.desc Verify twenty hex previews of the same buffer keep the same text.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStab0015', 0, () => {
      const buffer = new ArrayBuffer(8);
      const view = new Uint8Array(buffer);
      for (let i = 0; i < view.length; i++) {
        view[i] = i;
      }
      const previews: string[] = [];
      for (let round = 0; round < ROUNDS; round++) {
        previews.push(toHexPreview(buffer, 4));
      }
      expect(previews[0]).assertEqual('00 01 02 03 …');
      expect(uniqueCount(previews)).assertEqual(1);
      expect(previews.length).assertEqual(ROUNDS);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAB_1600
     * @tc.name testStab0016
     * @tc.desc Verify twenty rounds of duration formatting keep the eight branch texts.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStab0016', 0, () => {
      const parts: string[] = [];
      for (let round = 0; round < ROUNDS; round++) {
        for (const ms of DURATION_SAMPLES) {
          parts.push(formatDuration(ms));
        }
      }
      expect(parts.length).assertEqual(ROUNDS * DURATION_SAMPLES.length);
      expect(parts.slice(0, 8).join('|')).assertEqual(
        '0 ms|999 ms|1.0 s|1.5 s|60.0 s|1 min 0 s|1 min 1 s|59 min 59 s');
      expect(uniqueCount(parts)).assertEqual(8);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAB_1700
     * @tc.name testStab0017
     * @tc.desc Verify middle truncation is idempotent in twenty rounds.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStab0017', 0, () => {
      let idempotent = 0;
      const first: string[] = [];
      for (let round = 0; round < ROUNDS; round++) {
        for (const text of TRUNCATE_SAMPLES) {
          const once = truncateMiddle(text, 6);
          first.push(once);
          idempotent += truncateMiddle(once, 6) === once ? 1 : 0;
        }
      }
      expect(first[0]).assertEqual('ABC…IJ');
      expect(idempotent).assertEqual(ROUNDS * TRUNCATE_SAMPLES.length);
      expect(first[2]).assertEqual('abc');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAB_1800
     * @tc.name testStab0018
     * @tc.desc Verify twenty collaborate requests keep the same key count and verdict.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStab0018', 0, () => {
      const want: Record<string, Object> = {};
      want[COLLABORATE_INDEX_KEY] = '7';
      want['ohos.extra.param.key.extra1'] = 'x';
      const described: string[] = [];
      for (let round = 0; round < ROUNDS; round++) {
        described.push(buildRequest(want).describe());
      }
      expect(described[0]).assertEqual('协同下标 "7"，参数 2 个 → ACCEPT');
      expect(uniqueCount(described)).assertEqual(1);
      expect(wantParamKeys(want).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAB_1900
     * @tc.name testStab0019
     * @tc.desc Verify twenty context snapshots keep the same description.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStab0019', 0, () => {
      const described: string[] = [];
      for (let round = 0; round < ROUNDS; round++) {
        described.push(contextSnapshot('DistributedExtAbility', 28, 'entry', 'zh').describe());
      }
      expect(described.length).assertEqual(ROUNDS);
      expect(uniqueCount(described)).assertEqual(1);
      expect(described[0]).assertEqual(
        'context 可用：DistributedExtAbility，type=28（distributed），模块 entry，语言 zh');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAB_2000
     * @tc.name testStab0020
     * @tc.desc Verify twenty classifications of four known codes keep the same statuses.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStab0020', 0, () => {
      const codes: number[] = [201, 801, 32390002, 32390300];
      const rounds: string[] = [];
      for (let round = 0; round < ROUNDS; round++) {
        const names: string[] = [];
        for (const code of codes) {
          names.push(probeStatusName(classifyErrorCode(code)));
        }
        rounds.push(names.join('|'));
      }
      expect(rounds[0]).assertEqual('缺少权限|设备不支持|对端未配对|内部错误');
      expect(uniqueCount(rounds)).assertEqual(1);
      expect(rounds.length).assertEqual(ROUNDS);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAB_2100
     * @tc.name testStab0021
     * @tc.desc Verify twenty rounds over the sixteen statuses always yield sixteen distinct names.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStab0021', 0, () => {
      let sixteen = 0;
      for (let round = 0; round < ROUNDS; round++) {
        const names: string[] = [];
        for (const status of PROBE_STATUSES) {
          names.push(probeStatusName(status));
        }
        sixteen += uniqueCount(names) === 16 ? 1 : 0;
      }
      expect(sixteen).assertEqual(ROUNDS);
      expect(PROBE_STATUSES.length).assertEqual(16);
      expect(probeStatusName(ProbeStatus.IDLE)).assertEqual('未探测');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAB_2200
     * @tc.name testStab0022
     * @tc.desc Verify the parameter key order stays stable across twenty rounds.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStab0022', 0, () => {
      const want: Record<string, Object> = {};
      want[COLLABORATE_INDEX_KEY] = '1';
      want['b'] = 2;
      want['a'] = 1;
      const orders: string[] = [];
      for (let round = 0; round < ROUNDS; round++) {
        orders.push(wantParamKeys(want).join('|'));
      }
      expect(orders[0]).assertEqual(`${COLLABORATE_INDEX_KEY}|b|a`);
      expect(uniqueCount(orders)).assertEqual(1);
      expect(wantParamKeys(want).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAB_2300
     * @tc.name testStab0023
     * @tc.desc Verify twenty accumulated tag counts grow linearly without drift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStab0023', 0, () => {
      const logs = bulkLogs(80);
      let total = 0;
      let first = 0;
      for (let round = 0; round < ROUNDS; round++) {
        total += countByTag(logs, 'T0');
        first = countByTag(logs, 'T0');
      }
      expect(first).assertEqual(20);
      expect(total).assertEqual(ROUNDS * 20);
      expect(countByTag(logs, 'T3')).assertEqual(20);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAB_2400
     * @tc.name testStab0024
     * @tc.desc Verify appending a log leaves the caller array untouched.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStab0024', 0, () => {
      const base = bulkLogs(5);
      const extra = new LogItem('StabPure', 'pure', '新增一条');
      const next = appendLog(base, extra, 10);
      expect(base.length).assertEqual(5);
      expect(base[0].detail).assertEqual('第 0 条事件');
      expect(next.length).assertEqual(6);
      expect(next[0].id).assertEqual(extra.id);
      expect(next[5].id).assertEqual(base[4].id);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAB_2500
     * @tc.name testStab0025
     * @tc.desc Verify querying logs leaves the source array and its order untouched.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStab0025', 0, () => {
      const logs = bulkLogs(60);
      const headId = logs[0].id;
      const tailId = logs[59].id;
      const hits = queryLogs(logs, 'StabSrc', LogLevel.DEBUG, 'T2', 0);
      expect(logs.length).assertEqual(60);
      expect(logs[0].id).assertEqual(headId);
      expect(logs[59].id).assertEqual(tailId);
      expect(hits.length).assertEqual(15);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAB_2600
     * @tc.name testStab0026
     * @tc.desc Verify clearing logs returns a new empty array while the old one keeps its items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStab0026', 0, () => {
      const old = bulkLogs(3);
      const cleared = clearLogs();
      expect(cleared.length).assertEqual(0);
      expect(old.length).assertEqual(3);
      expect(old === cleared).assertFalse();
      expect(old[0].detail).assertEqual('第 0 条事件');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAB_2700
     * @tc.name testStab0027
     * @tc.desc Verify twenty start stop rounds on a server keep the stage usable for restart.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStab0027', 0, () => {
      let stage = nextStage(LinkStage.EMPTY, LinkAction.CREATE_SERVER);
      let stopped = 0;
      for (let round = 0; round < ROUNDS; round++) {
        stage = nextStage(stage, LinkAction.START);
        stage = nextStage(stage, LinkAction.STOP);
        stopped += stage === LinkStage.SERVER_STOPPED ? 1 : 0;
      }
      expect(stopped).assertEqual(ROUNDS);
      expect(stage).assertEqual(LinkStage.SERVER_STOPPED);
      expect(nextStage(stage, LinkAction.START)).assertEqual(LinkStage.SERVER_STARTED);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAB_2800
     * @tc.name testStab0028
     * @tc.desc Verify twenty failed channel opens keep the stage at FAILED and closed to sending.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStab0028', 0, () => {
      let failed = 0;
      let stage = ChannelStage.CLOSED;
      for (let round = 0; round < ROUNDS; round++) {
        stage = nextChannelStage(stage, ChannelAction.OPEN);
        stage = nextChannelStage(stage, ChannelAction.OPEN_FAIL);
        failed += stage === ChannelStage.FAILED ? 1 : 0;
      }
      expect(failed).assertEqual(ROUNDS);
      expect(stage).assertEqual(ChannelStage.FAILED);
      expect(canSendData(stage)).assertFalse();
      expect(nextChannelStage(stage, ChannelAction.SEND)).assertEqual(ChannelStage.FAILED);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAB_2900
     * @tc.name testStab0029
     * @tc.desc Verify a twenty round mixed pipeline keeps every round result identical.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStab0029', 0, () => {
      const rounds: string[] = [];
      for (let round = 0; round < ROUNDS; round++) {
        const meta = filterFeatures('link')[0];
        const request = buildRequest(wantParam(round));
        const buffer = encodeUtf8(meta.title);
        rounds.push(`${meta.code}|${request.describe()}|${toHexPreview(buffer)}`);
      }
      expect(rounds.length).assertEqual(ROUNDS);
      expect(uniqueCount(rounds.map((value: string) => value.split('|')[0]))).assertEqual(1);
      expect(rounds[0].startsWith('LINK|协同下标')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAB_3000
     * @tc.name testStab0030
     * @tc.desc Verify twenty log store rebuild cycles always end with one fresh entry.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStab0030', 0, () => {
      let fresh = 0;
      for (let round = 0; round < ROUNDS; round++) {
        Logger.clear();
        Logger.error('StabRebuild', 'rebuild', `第 ${round} 轮`);
        const logs = storedLogs();
        fresh += logs.length === 1 && logs[0].detail === `第 ${round} 轮` ? 1 : 0;
      }
      expect(fresh).assertEqual(ROUNDS);
      expect(storedLogs().length).assertEqual(1);
      expect(Logger.count('StabRebuild', 'rebuild')).assertEqual(1);
      Logger.clear();
    });
  });
}

/** 每轮换一个协同下标，用来验证流水线里只有下标变化、其余环节稳定 */
function wantParam(round: number): Record<string, Object> {
  const want: Record<string, Object> = {};
  want[COLLABORATE_INDEX_KEY] = `${round % 3}`;
  return want;
}
