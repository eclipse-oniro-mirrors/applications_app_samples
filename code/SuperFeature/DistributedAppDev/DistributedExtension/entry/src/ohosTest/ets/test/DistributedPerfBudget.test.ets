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
  BT_PEER_LIMIT, CHANNEL_API_PAYLOAD_LIMIT, CHANNEL_PAYLOAD_LIMIT, FEATURE_COUNT, HOME_LOG_LIMIT, LINK_PAYLOAD_LIMIT,
  LOG_STORE_CAPACITY, PAGE_LOG_LIMIT, StorageKeys
} from '../../../main/ets/common/AppConstants';
import {
  ChannelAction, ChannelStage, isMacAddress, isServiceUuid, nextChannelStage
} from '../../../main/ets/model/ChannelSession';
import { COLLABORATE_INDEX_KEY, buildRequest } from '../../../main/ets/model/CollabModel';
import {
  FEATURE_METAS, FeatureKind, filterFeatures, metaOf, titleText
} from '../../../main/ets/model/DistributedCatalog';
import { contextSnapshot } from '../../../main/ets/model/ExtensionContextInfo';
import { LinkAction, LinkStage, nextStage } from '../../../main/ets/model/LinkSession';
import { LogItem, LogLevel, appendLog, countByTag, queryLogs } from '../../../main/ets/model/LogStore';
import { ProbeStatus, classifyErrorCode, probeStatusName } from '../../../main/ets/model/ProbeState';
import { clampPayload, decodeUtf8, encodeUtf8, toHexPreview, utf8Length } from '../../../main/ets/model/TextCodec';
import { distributedErrorHint } from '../../../main/ets/utils/ErrorUtil';
import { formatDateTime, formatDuration, truncateMiddle } from '../../../main/ets/utils/FormatUtil';
import { Logger } from '../../../main/ets/utils/Logger';

/**
 * 性能预算：本机实测均在毫秒量级，取 2 s 作宽松上界，只拦截"退化成秒级"的回归。
 * 循环规模刻意压在百次级：用例回调在主线程同步执行，整套连续占用超过 6 s 会被系统判定为
 * THREAD_BLOCK_6S 并结束进程，所以这里用"小规模 + 预算断言"而不是跑满几万次。
 */
const BUDGET_MS: number = 2000;

const PROBE_STATUSES: ProbeStatus[] = [
  ProbeStatus.IDLE, ProbeStatus.READY, ProbeStatus.PERMISSION_DENIED, ProbeStatus.CAPABILITY_UNSUPPORTED,
  ProbeStatus.UNPAIRED, ProbeStatus.BR_DISABLED, ProbeStatus.DUPLICATE_NAME, ProbeStatus.LIMIT_EXCEEDED,
  ProbeStatus.NOT_READY, ProbeStatus.INVALID_PARAM, ProbeStatus.CHANNEL_INVALID, ProbeStatus.RESTRICTED,
  ProbeStatus.DATA_TOO_LONG, ProbeStatus.SEND_FAILED, ProbeStatus.INTERNAL, ProbeStatus.FAILED
];

const REGISTERED_CODES: number[] = [
  201, 401, 801, 32390001, 32390002, 32390004, 32390006, 32390100,
  32390101, 32390102, 32390103, 32390104, 32390200, 32390201, 32390202, 32390203,
  32390204, 32390205, 32390206, 32390300
];

const DURATION_INPUTS: number[] = [0, 999, 1000, 1500, 59999, 60000, 61000, 3599999];

const TRUNCATE_INPUTS: string[] = ['ABCDEFGHIJ', 'ABCDEFGHIJ', '分布式链路示例', 'abc', 'ABCD', 'ABCDE'];
const TRUNCATE_LIMITS: number[] = [5, 6, 4, 3, 4, 4];

function elapsed(run: () => void): number {
  const start = Date.now();
  run();
  return Date.now() - start;
}

function storedLogs(): LogItem[] {
  return AppStorage.get<LogItem[]>(StorageKeys.APP_LOGS) ?? [];
}

/** 200 条日志：来源固定，tag 在 5 个值间轮转，级别与序号按位置决定 */
function simulatedLogs(): LogItem[] {
  const logs: LogItem[] = [];
  for (let i = 0; i < 200; i++) {
    const level = i % 2 === 0 ? LogLevel.DEBUG : LogLevel.ERROR;
    logs.push(new LogItem('PerfSrc', `T${i % 5}`, `第 ${i} 条事件`, level));
  }
  return logs;
}

function statusHistogram(values: ProbeStatus[]): string {
  const names: string[] = [];
  const counts: number[] = [];
  for (const value of values) {
    const name = probeStatusName(value);
    const index = names.indexOf(name);
    if (index < 0) {
      names.push(name);
      counts.push(1);
    } else {
      counts[index] = counts[index] + 1;
    }
  }
  const parts: string[] = [];
  for (let i = 0; i < names.length; i++) {
    parts.push(`${names[i]}=${counts[i]}`);
  }
  return parts.join(',');
}

/**
 * 性能预算（质量轴）：把编解码、日志检索、状态机、格式化、模型装配这些热路径按固定次数跑一遍，
 * 断言"宽松上界 + 结果完全正确"。上界只用来发现数量级的退化，正确性断言保证用例本身不会假绿。
 */
export default function distributedPerfBudgetTest() {
  describe('DistributedPerfBudgetTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERF_0100
     * @tc.name testPerf0001
     * @tc.desc Verify encoding one kilobyte of ASCII stays exact and within the time budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerf0001', 0, () => {
      const text = 'a'.repeat(1024);
      let buffer = encodeUtf8('');
      const cost = elapsed(() => {
        buffer = encodeUtf8(text);
      });
      expect(buffer.byteLength).assertEqual(1024);
      expect(text.length).assertEqual(1024);
      expect(cost < BUDGET_MS).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERF_0200
     * @tc.name testPerf0002
     * @tc.desc Verify encoding 341 Chinese characters yields 1023 bytes within the time budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerf0002', 0, () => {
      const text = '分'.repeat(341);
      let buffer = encodeUtf8('');
      const cost = elapsed(() => {
        buffer = encodeUtf8(text);
      });
      expect(buffer.byteLength).assertEqual(1023);
      expect(text.length).assertEqual(341);
      expect(utf8Length(text)).assertEqual(1023);
      expect(cost < BUDGET_MS).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERF_0300
     * @tc.name testPerf0003
     * @tc.desc Verify clamping 400 Chinese characters to 1024 bytes keeps 341 characters in budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerf0003', 0, () => {
      const text = '链'.repeat(400);
      let clamped = '';
      const cost = elapsed(() => {
        clamped = clampPayload(text, 1024);
      });
      expect(clamped.length).assertEqual(341);
      expect(utf8Length(clamped)).assertEqual(1023);
      expect(clamped).assertEqual('链'.repeat(341));
      expect(cost < BUDGET_MS).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERF_0400
     * @tc.name testPerf0004
     * @tc.desc Verify decoding a four kilobyte buffer returns the same length within the budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerf0004', 0, () => {
      const buffer = new ArrayBuffer(4096);
      const view = new Uint8Array(buffer);
      for (let i = 0; i < view.length; i++) {
        view[i] = 0x61;
      }
      let decoded = '';
      const cost = elapsed(() => {
        decoded = decodeUtf8(buffer);
      });
      expect(decoded.length).assertEqual(4096);
      expect(decoded.startsWith('aaaa')).assertTrue();
      expect(decoded.endsWith('aaaa')).assertTrue();
      expect(cost < BUDGET_MS).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERF_0500
     * @tc.name testPerf0005
     * @tc.desc Verify the hex preview of a four kilobyte buffer is built within the budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerf0005', 0, () => {
      const buffer = new ArrayBuffer(4096);
      let preview = '';
      const cost = elapsed(() => {
        preview = toHexPreview(buffer, 16);
      });
      expect(preview).assertEqual('00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 …');
      expect(preview.length).assertEqual(49);
      expect(cost < BUDGET_MS).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERF_0600
     * @tc.name testPerf0006
     * @tc.desc Verify twenty byte length queries over a two thousand character text stay in budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerf0006', 0, () => {
      const text = 'a'.repeat(2048);
      let last = 0;
      const cost = elapsed(() => {
        for (let i = 0; i < 20; i++) {
          last = utf8Length(text);
        }
      });
      expect(last).assertEqual(2048);
      expect(cost < BUDGET_MS).assertTrue();
      expect(utf8Length('')).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERF_0700
     * @tc.name testPerf0007
     * @tc.desc Verify twenty queries over two hundred logs keep every result within budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerf0007', 0, () => {
      const logs = simulatedLogs();
      let total = 0;
      const cost = elapsed(() => {
        for (let i = 0; i < 20; i++) {
          total += queryLogs(logs, '', LogLevel.DEBUG, '', 0).length;
        }
      });
      expect(total).assertEqual(4000);
      expect(queryLogs(logs, 'PerfSrc', LogLevel.ERROR, '', 0).length).assertEqual(100);
      expect(queryLogs(logs, 'PerfSrc', LogLevel.DEBUG, '第 19', 0).length).assertEqual(11);
      expect(cost < BUDGET_MS).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERF_0800
     * @tc.name testPerf0008
     * @tc.desc Verify four hundred appends keep the newest two hundred entries within budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerf0008', 0, () => {
      let logs: LogItem[] = [];
      const cost = elapsed(() => {
        for (let i = 0; i < 400; i++) {
          logs = appendLog(logs, new LogItem('PerfAppend', 'append', `事件 ${i}`));
        }
      });
      expect(logs.length).assertEqual(LOG_STORE_CAPACITY);
      expect(logs[0].detail).assertEqual('事件 399');
      expect(logs[199].detail).assertEqual('事件 200');
      expect(cost < BUDGET_MS).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERF_0900
     * @tc.name testPerf0009
     * @tc.desc Verify twenty tag counts over two hundred logs return the exact buckets in budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerf0009', 0, () => {
      const logs = simulatedLogs();
      let total = 0;
      let first = 0;
      const cost = elapsed(() => {
        for (let i = 0; i < 20; i++) {
          total += countByTag(logs, `T${i % 5}`);
          first = countByTag(logs, 'T0');
        }
      });
      expect(total).assertEqual(800);
      expect(first).assertEqual(40);
      expect(countByTag(logs, 'T9')).assertEqual(0);
      expect(cost < BUDGET_MS).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERF_1000
     * @tc.name testPerf0010
     * @tc.desc Verify one hundred catalogue searches always return the same three features in budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerf0010', 0, () => {
      let last = 0;
      let empty = 0;
      const cost = elapsed(() => {
        for (let i = 0; i < 100; i++) {
          last = filterFeatures(`  ${i % 2 === 0 ? 'LINK' : '链路'}  `).length;
          empty = filterFeatures('no-such-feature').length;
        }
      });
      expect(last).assertEqual(1);
      expect(empty).assertEqual(0);
      expect(filterFeatures('').length).assertEqual(FEATURE_COUNT);
      expect(cost < BUDGET_MS).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERF_1100
     * @tc.name testPerf0011
     * @tc.desc Verify eight hundred link transitions end on CLOSED and stay within budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerf0011', 0, () => {
      const cycle: LinkAction[] = [
        LinkAction.CREATE_SERVER, LinkAction.START, LinkAction.STOP, LinkAction.CLOSE
      ];
      let stage = LinkStage.EMPTY;
      const cost = elapsed(() => {
        for (let i = 0; i < 200; i++) {
          for (const action of cycle) {
            stage = nextStage(stage, action);
          }
        }
      });
      expect(stage).assertEqual(LinkStage.CLOSED);
      expect(cost < BUDGET_MS).assertTrue();
      expect(nextStage(stage, LinkAction.START)).assertEqual(LinkStage.CLOSED);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERF_1200
     * @tc.name testPerf0012
     * @tc.desc Verify eight hundred channel transitions end on CLOSED and stay within budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerf0012', 0, () => {
      const cycle: ChannelAction[] = [
        ChannelAction.OPEN, ChannelAction.OPEN_OK, ChannelAction.SEND, ChannelAction.CLOSE
      ];
      let stage = ChannelStage.CLOSED;
      const cost = elapsed(() => {
        for (let i = 0; i < 200; i++) {
          for (const action of cycle) {
            stage = nextChannelStage(stage, action);
          }
        }
      });
      expect(stage).assertEqual(ChannelStage.CLOSED);
      expect(cost < BUDGET_MS).assertTrue();
      expect(nextChannelStage(stage, ChannelAction.SEND)).assertEqual(ChannelStage.CLOSED);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERF_1300
     * @tc.name testPerf0013
     * @tc.desc Verify two thousand error classifications keep the same histogram in budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerf0013', 0, () => {
      const statuses: ProbeStatus[] = [];
      const cost = elapsed(() => {
        for (let i = 0; i < 100; i++) {
          for (const code of REGISTERED_CODES) {
            statuses.push(classifyErrorCode(code));
          }
        }
      });
      expect(statuses.length).assertEqual(2000);
      expect(statusHistogram(statuses)).assertEqual(
        '缺少权限=100,参数无效=300,设备不支持=100,蓝牙未开启=100,对端未配对=100,通道不可用=100,' +
        '内部错误=200,调用受限=100,操作失败=200,数据过长=100,发送失败=100,连接未就绪=200,' +
        '数量超限=200,服务名重复=100');
      expect(cost < BUDGET_MS).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERF_1400
     * @tc.name testPerf0014
     * @tc.desc Verify two thousand hint lookups keep twenty distinct texts and stay within budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerf0014', 0, () => {
      const hints: string[] = [];
      const cost = elapsed(() => {
        for (let i = 0; i < 100; i++) {
          for (const code of REGISTERED_CODES) {
            hints.push(distributedErrorHint(code));
          }
        }
      });
      const distinct: string[] = [];
      for (const hint of hints) {
        if (distinct.indexOf(hint) < 0) {
          distinct.push(hint);
        }
      }
      expect(hints.length).assertEqual(2000);
      expect(distinct.length).assertEqual(20);
      expect(distinct[0].startsWith('缺少 ohos.permission.')).assertTrue();
      expect(cost < BUDGET_MS).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERF_1500
     * @tc.name testPerf0015
     * @tc.desc Verify one thousand six hundred status name lookups return the sixteen texts in budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerf0015', 0, () => {
      const names: string[] = [];
      const cost = elapsed(() => {
        for (let i = 0; i < 100; i++) {
          for (const status of PROBE_STATUSES) {
            names.push(probeStatusName(status));
          }
        }
      });
      expect(names.length).assertEqual(1600);
      expect(names.slice(0, 16).join('|')).assertEqual(
        '未探测|可用|缺少权限|设备不支持|对端未配对|蓝牙未开启|服务名重复|数量超限|' +
        '连接未就绪|参数无效|通道不可用|调用受限|数据过长|发送失败|内部错误|操作失败');
      expect(new Set<string>(names).size).assertEqual(16);
      expect(cost < BUDGET_MS).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERF_1600
     * @tc.name testPerf0016
     * @tc.desc Verify two thousand MAC validations accept the default peer address in budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerf0016', 0, () => {
      const mac = '12:34:56:78:9A:BC';
      let accepted = 0;
      const cost = elapsed(() => {
        for (let i = 0; i < 2000; i++) {
          accepted += isMacAddress(mac) ? 1 : 0;
        }
      });
      expect(accepted).assertEqual(2000);
      expect(isMacAddress(mac.toLowerCase())).assertTrue();
      expect(isMacAddress('12:34:56:78:9A:B')).assertFalse();
      expect(cost < BUDGET_MS).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERF_1700
     * @tc.name testPerf0017
     * @tc.desc Verify one thousand service UUID validations accept the default UUID in budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerf0017', 0, () => {
      const uuid = '0000A002-0000-1000-8000-00805F9B34FB';
      let accepted = 0;
      const cost = elapsed(() => {
        for (let i = 0; i < 1000; i++) {
          accepted += isServiceUuid(uuid) ? 1 : 0;
        }
      });
      expect(accepted).assertEqual(1000);
      expect(uuid.length).assertEqual(36);
      expect(isServiceUuid(uuid.toLowerCase())).assertTrue();
      expect(cost < BUDGET_MS).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERF_1800
     * @tc.name testPerf0018
     * @tc.desc Verify eight hundred duration formats across four branches keep the exact texts in budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerf0018', 0, () => {
      const parts: string[] = [];
      const cost = elapsed(() => {
        for (let i = 0; i < 100; i++) {
          for (const ms of DURATION_INPUTS) {
            parts.push(formatDuration(ms));
          }
        }
      });
      expect(parts.length).assertEqual(800);
      expect(parts.slice(0, 8).join('|')).assertEqual(
        '0 ms|999 ms|1.0 s|1.5 s|60.0 s|1 min 0 s|1 min 1 s|59 min 59 s');
      expect(formatDuration(-1)).assertEqual('0 ms');
      expect(cost < BUDGET_MS).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERF_1900
     * @tc.name testPerf0019
     * @tc.desc Verify five hundred date time formats keep zero padding and stay within budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerf0019', 0, () => {
      const date = new Date(2027, 0, 1, 0, 0, 0);
      let last = '';
      const cost = elapsed(() => {
        for (let i = 0; i < 500; i++) {
          last = formatDateTime(date);
        }
      });
      expect(last).assertEqual('2027-01-01 00:00:00');
      expect(last.length).assertEqual(19);
      expect(cost < BUDGET_MS).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERF_2000
     * @tc.name testPerf0020
     * @tc.desc Verify five hundred middle truncations keep the six expected results in budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerf0020', 0, () => {
      const parts: string[] = [];
      const cost = elapsed(() => {
        for (let i = 0; i < 500; i++) {
          const index = i % TRUNCATE_INPUTS.length;
          parts.push(truncateMiddle(TRUNCATE_INPUTS[index], TRUNCATE_LIMITS[index]));
        }
      });
      expect(parts.slice(0, 6).join('|')).assertEqual('AB…IJ|ABC…IJ|分布…例|abc|ABCD|AB…E');
      expect(truncateMiddle('ABCDE', 3)).assertEqual('ABCDE');
      expect(cost < BUDGET_MS).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERF_2100
     * @tc.name testPerf0021
     * @tc.desc Verify five hundred collaborate requests keep the same description in budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerf0021', 0, () => {
      const want: Record<string, Object> = {};
      want[COLLABORATE_INDEX_KEY] = '3';
      want['ohos.extra.param.key.extra1'] = 'a';
      want['ohos.extra.param.key.extra2'] = 'b';
      let describe = '';
      const cost = elapsed(() => {
        for (let i = 0; i < 500; i++) {
          describe = buildRequest(want).describe();
        }
      });
      expect(describe).assertEqual('协同下标 "3"，参数 3 个 → ACCEPT');
      const empty: Record<string, Object> = {};
      expect(buildRequest(empty).describe()).assertEqual('协同下标 "（空）"，参数 0 个 → REJECT');
      expect(cost < BUDGET_MS).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERF_2200
     * @tc.name testPerf0022
     * @tc.desc Verify five hundred context snapshots keep the same description in budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerf0022', 0, () => {
      let describe = '';
      const cost = elapsed(() => {
        for (let i = 0; i < 500; i++) {
          describe = contextSnapshot('DistributedExtAbility', 28, 'entry', 'zh').describe();
        }
      });
      expect(describe).assertEqual('context 可用：DistributedExtAbility，type=28（distributed），模块 entry，语言 zh');
      expect(contextSnapshot('', 27, '', '').describe()).assertEqual(
        'context 可用：（未提供），type=27（非 distributed），模块 （未提供），语言 （未提供）');
      expect(cost < BUDGET_MS).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERF_2300
     * @tc.name testPerf0023
     * @tc.desc Verify five hundred log items get consecutive ids within the time budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerf0023', 0, () => {
      const items: LogItem[] = [];
      const cost = elapsed(() => {
        for (let i = 0; i < 500; i++) {
          items.push(new LogItem('PerfSeq', 'seq', `序号 ${i}`));
        }
      });
      const step = items[1].id - items[0].id;
      expect(items.length).assertEqual(500);
      expect(step).assertEqual(1);
      expect(items[499].id - items[0].id).assertEqual(499);
      expect(cost < BUDGET_MS).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERF_2400
     * @tc.name testPerf0024
     * @tc.desc Verify sixty log records all land in the shared store while staying within budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerf0024', 0, () => {
      Logger.clear();
      const cost = elapsed(() => {
        for (let i = 0; i < 60; i++) {
          Logger.info('PerfLog', 'perf', `事件 ${i}`);
        }
      });
      const logs = queryLogs(storedLogs(), 'PerfLog', LogLevel.DEBUG, '', 0);
      expect(logs.length).assertEqual(60);
      expect(logs[0].detail).assertEqual('事件 59');
      expect(Logger.count('PerfLog', 'perf')).assertEqual(60);
      expect(cost < BUDGET_MS).assertTrue();
      Logger.clear();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERF_2500
     * @tc.name testPerf0025
     * @tc.desc Verify two hundred encode decode round trips stay lossless and within the budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerf0025', 0, () => {
      const text = '混合abc 分布式链路 😀';
      let roundTrip = 0;
      let totalBytes = 0;
      const cost = elapsed(() => {
        for (let i = 0; i < 200; i++) {
          const buffer = encodeUtf8(text);
          totalBytes += buffer.byteLength;
          roundTrip += decodeUtf8(buffer) === text ? 1 : 0;
        }
      });
      expect(roundTrip).assertEqual(200);
      expect(totalBytes).assertEqual(200 * utf8Length(text));
      expect(utf8Length(text)).assertEqual(30);
      expect(cost < BUDGET_MS).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERF_2600
     * @tc.name testPerf0026
     * @tc.desc Verify clamping a long text over twenty limits never yields decreasing byte counts in budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerf0026', 0, () => {
      const text = '分'.repeat(340);
      const sizes: number[] = [];
      const cost = elapsed(() => {
        for (let i = 0; i < 4; i++) {
          for (let limit = 0; limit < 20; limit++) {
            sizes.push(utf8Length(clampPayload(text, limit * 100)));
          }
        }
      });
      let monotonic = 0;
      for (let round = 0; round < 4; round++) {
        for (let limit = 1; limit < 20; limit++) {
          const prev = sizes[round * 20 + limit - 1];
          const next = sizes[round * 20 + limit];
          monotonic += next >= prev ? 1 : 0;
        }
      }
      expect(sizes.length).assertEqual(80);
      expect(monotonic).assertEqual(76);
      expect(sizes[19]).assertEqual(1020);
      expect(cost < BUDGET_MS).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERF_2700
     * @tc.name testPerf0027
     * @tc.desc Verify one hundred encode clamp preview decode pipelines keep the exact payload in budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerf0027', 0, () => {
      let preview = '';
      let decoded = '';
      const cost = elapsed(() => {
        for (let i = 0; i < 100; i++) {
          const buffer = encodeUtf8(clampPayload('分布式链路', 9));
          preview = toHexPreview(buffer);
          decoded = decodeUtf8(buffer);
        }
      });
      expect(preview).assertEqual('E5 88 86 E5 B8 83 E5 BC 8F');
      expect(decoded).assertEqual('分布式');
      expect(preview.split(' ').length).assertEqual(9);
      expect(cost < BUDGET_MS).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERF_2800
     * @tc.name testPerf0028
     * @tc.desc Verify six hundred metadata lookups keep the three titles and permissions in budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerf0028', 0, () => {
      let titles = 0;
      let permissions = 0;
      const cost = elapsed(() => {
        for (let i = 0; i < 200; i++) {
          titles += titleText(metaOf(FeatureKind.EXTENSION)).length;
          titles += titleText(metaOf(FeatureKind.LINK)).length;
          titles += titleText(metaOf(FeatureKind.CHANNEL)).length;
          permissions += metaOf(FeatureKind.LINK).permission.length;
        }
      });
      expect(titles).assertEqual(200 * ('分布式扩展'.length + '链路增强'.length + '代理通道'.length));
      expect(permissions).assertEqual(200 * 'ohos.permission.DISTRIBUTED_DATASYNC'.length);
      expect(FEATURE_METAS.length).assertEqual(FEATURE_COUNT);
      expect(cost < BUDGET_MS).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERF_2900
     * @tc.name testPerf0029
     * @tc.desc Verify ten sampling rounds of the encoder stay under the budget and the spread bound.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerf0029', 0, () => {
      const text = 'a'.repeat(1024);
      const rounds: number[] = [];
      for (let round = 0; round < 10; round++) {
        const cost = elapsed(() => {
          for (let i = 0; i < 5; i++) {
            encodeUtf8(text);
          }
        });
        rounds.push(cost);
      }
      let total = 0;
      let max = 0;
      let under = 0;
      for (const value of rounds) {
        total += value;
        max = value > max ? value : max;
        under += value < BUDGET_MS ? 1 : 0;
      }
      const mean = total / rounds.length;
      expect(rounds.length).assertEqual(10);
      expect(under).assertEqual(10);
      expect(max < BUDGET_MS).assertTrue();
      expect(max <= mean * 20 + 50).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERF_3000
     * @tc.name testPerf0030
     * @tc.desc Verify the payload and capacity budgets are ordered the way the pages assume.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerf0030', 0, () => {
      expect(LINK_PAYLOAD_LIMIT).assertEqual(1024);
      expect(CHANNEL_API_PAYLOAD_LIMIT).assertEqual(4096);
      expect(CHANNEL_PAYLOAD_LIMIT).assertEqual(256);
      expect(CHANNEL_PAYLOAD_LIMIT < LINK_PAYLOAD_LIMIT).assertTrue();
      expect(LINK_PAYLOAD_LIMIT < CHANNEL_API_PAYLOAD_LIMIT).assertTrue();
      expect(PAGE_LOG_LIMIT < HOME_LOG_LIMIT).assertTrue();
      expect(HOME_LOG_LIMIT < LOG_STORE_CAPACITY).assertTrue();
      expect(LOG_STORE_CAPACITY).assertEqual(200);
      expect(BT_PEER_LIMIT).assertEqual(8);
    });
  });
}
