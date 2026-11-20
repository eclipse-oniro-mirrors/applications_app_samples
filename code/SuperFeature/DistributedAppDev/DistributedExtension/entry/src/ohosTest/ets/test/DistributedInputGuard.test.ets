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
  ChannelStage, describeChannel, isMacAddress, isServiceUuid
} from '../../../main/ets/model/ChannelSession';
import { COLLABORATE_INDEX_KEY, buildRequest, mockRequest } from '../../../main/ets/model/CollabModel';
import { filterFeatures } from '../../../main/ets/model/DistributedCatalog';
import { LogItem, LogLevel, queryLogs } from '../../../main/ets/model/LogStore';
import {
  ProbeStatus, channelStateName, classifyErrorCode, collaborateResultName
} from '../../../main/ets/model/ProbeState';
import { clampPayload, decodeUtf8, encodeUtf8, toHexPreview, utf8Length } from '../../../main/ets/model/TextCodec';
import {
  codeOfThrown, errorInfo, formatError, isKnownDistributedCode, messageOfThrown
} from '../../../main/ets/utils/ErrorUtil';
import { formatDateTime, formatDuration, formatTime, truncateMiddle } from '../../../main/ets/utils/FormatUtil';

/** 合法 MAC 的两种写法与一组非法写法：逐字符校验，长度、冒号位置、十六进制范围都要对 */
const VALID_MACS: string[] = ['12:34:56:78:9A:BC', '12:34:56:78:9a:bc', '1a:2b:3c:4d:5e:6f'];
const INVALID_MACS: string[] = [
  '', '1', '12:34:56:78:9A:B', '12:34:56:78:9A:BC:', '12-34-56-78-9A-BC',
  '12:34:56:78:9A:GG', '12:34:56:78:9A: C', ' 2:34:56:78:9A:BC'
];

const VALID_UUIDS: string[] = [
  '0000A002-0000-1000-8000-00805F9B34FB',
  '0000a002-0000-1000-8000-00805f9b34fb',
  'ffffffff-ffff-ffff-ffff-ffffffffffff'
];
const INVALID_UUIDS: string[] = [
  '',
  '0000A002-0000-1000-8000-00805F9B34F',
  '0000A002-0000-1000-8000-00805F9B34FB0',
  '0000A0020000-1000-8000-00805F9B34FB',
  '0000A002-0000-1000-8000-00805F9B34FG',
  '0000A002-0000-1000-8000-00805F9B34F '
];

class NumericThrown {
  public code: number;
  public message: string;

  constructor(code: number, message: string) {
    this.code = code;
    this.message = message;
  }
}

class StringThrown {
  public code: string;
  public message: string;

  constructor(code: string, message: string) {
    this.code = code;
    this.message = message;
  }
}

class MessageThrown {
  public message: string;

  constructor(message: string) {
    this.message = message;
  }
}

class NameThrown {
  public name: string;

  constructor(name: string) {
    this.name = name;
  }
}

class OpaqueThrown {
  toString(): string {
    return 'opaque thrown';
  }
}

/** 造 count 条日志：detail 与 tag 都可控，用于关键字与级别过滤 */
function logsWith(details: string[], levels: LogLevel[]): LogItem[] {
  const logs: LogItem[] = [];
  for (let i = 0; i < details.length; i++) {
    logs.push(new LogItem('GuardSrc', `tag${i}`, details[i], levels[i]));
  }
  return logs;
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
 * 非法输入与边界（质量轴）：对端参数校验、日志过滤、编解码截断、异常解析、文案兜底
 * 这几处输入完全来自用户或系统，逐项喂非法值，断言"不抛异常且给出的结果可解释"。
 */
export default function distributedInputGuardTest() {
  describe('DistributedInputGuardTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_INGUARD_0100
     * @tc.name testGuard0001
     * @tc.desc Verify every valid MAC sample is accepted regardless of letter case.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGuard0001', 0, () => {
      let accepted = 0;
      for (const mac of VALID_MACS) {
        accepted += isMacAddress(mac) ? 1 : 0;
      }
      expect(accepted).assertEqual(VALID_MACS.length);
      expect(isMacAddress(VALID_MACS[0])).assertTrue();
      expect(VALID_MACS[0].length).assertEqual(17);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_INGUARD_0200
     * @tc.name testGuard0002
     * @tc.desc Verify short, long and long tail MAC samples are all rejected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGuard0002', 0, () => {
      expect(isMacAddress(INVALID_MACS[0])).assertFalse();
      expect(isMacAddress(INVALID_MACS[1])).assertFalse();
      expect(isMacAddress(INVALID_MACS[2])).assertFalse();
      expect(isMacAddress(INVALID_MACS[3])).assertFalse();
      expect(isMacAddress(INVALID_MACS[7])).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_INGUARD_0300
     * @tc.name testGuard0003
     * @tc.desc Verify a dash separated or non hex MAC is rejected at the misplaced character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGuard0003', 0, () => {
      const dash = INVALID_MACS[4];
      const nonHex = INVALID_MACS[5];
      const space = INVALID_MACS[6];
      expect(dash.length).assertEqual(17);
      expect(isMacAddress(dash)).assertFalse();
      expect(isMacAddress(nonHex)).assertFalse();
      expect(isMacAddress(space)).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_INGUARD_0400
     * @tc.name testGuard0004
     * @tc.desc Verify every invalid MAC sample is rejected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGuard0004', 0, () => {
      let rejected = 0;
      for (const mac of INVALID_MACS) {
        rejected += isMacAddress(mac) ? 0 : 1;
      }
      expect(rejected).assertEqual(INVALID_MACS.length);
      expect(INVALID_MACS.length).assertEqual(8);
      expect(isMacAddress('12:34:56:78:9A:BC')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_INGUARD_0500
     * @tc.name testGuard0005
     * @tc.desc Verify the three valid UUID samples are accepted and all are thirty six characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGuard0005', 0, () => {
      let accepted = 0;
      for (const uuid of VALID_UUIDS) {
        accepted += isServiceUuid(uuid) ? 1 : 0;
      }
      expect(accepted).assertEqual(VALID_UUIDS.length);
      expect(VALID_UUIDS[0].length).assertEqual(36);
      expect(isServiceUuid(VALID_UUIDS[1])).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_INGUARD_0600
     * @tc.name testGuard0006
     * @tc.desc Verify six malformed UUID samples are rejected, including a full length trailing space sample.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGuard0006', 0, () => {
      let rejected = 0;
      for (const uuid of INVALID_UUIDS) {
        rejected += isServiceUuid(uuid) ? 0 : 1;
      }
      expect(rejected).assertEqual(INVALID_UUIDS.length);
      expect(INVALID_UUIDS[1].length).assertEqual(35);
      expect(INVALID_UUIDS[2].length).assertEqual(37);
      expect(INVALID_UUIDS[5].length).assertEqual(36);
      expect(INVALID_UUIDS[5].endsWith(' ')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_INGUARD_0700
     * @tc.name testGuard0007
     * @tc.desc Verify log keywords are matched literally instead of as regular expressions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGuard0007', 0, () => {
      const logs = logsWith(
        ['a.*b', 'a|b', 'a[b', 'a\\b'],
        [LogLevel.DEBUG, LogLevel.DEBUG, LogLevel.DEBUG, LogLevel.DEBUG]);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '.*', 0).length).assertEqual(1);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '|', 0).length).assertEqual(1);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '[', 0).length).assertEqual(1);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '\\', 0).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_INGUARD_0800
     * @tc.name testGuard0008
     * @tc.desc Verify the keyword is trimmed and lower cased before matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGuard0008', 0, () => {
      const logs = logsWith(
        ['error happens', 'ERROR HAPPENS', 'all good'],
        [LogLevel.ERROR, LogLevel.ERROR, LogLevel.INFO]);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '  ERROR  ', 0).length).assertEqual(2);
      expect(queryLogs(logs, '', LogLevel.DEBUG, 'Error', 0).length).assertEqual(2);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '   ', 0).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_INGUARD_0900
     * @tc.name testGuard0009
     * @tc.desc Verify a zero or negative limit means no truncation while a positive one slices.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGuard0009', 0, () => {
      const logs = logsWith(
        ['第 1 条', '第 2 条', '第 3 条', '第 4 条', '第 5 条'],
        [LogLevel.INFO, LogLevel.INFO, LogLevel.INFO, LogLevel.INFO, LogLevel.INFO]);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 0).length).assertEqual(5);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', -1).length).assertEqual(5);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 1).length).assertEqual(1);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '').length).assertEqual(5);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_INGUARD_1000
     * @tc.name testGuard0010
     * @tc.desc Verify the minimum level filter drops the lower levels.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGuard0010', 0, () => {
      const logs = logsWith(
        ['debug', 'info', 'warn', 'error'],
        [LogLevel.DEBUG, LogLevel.INFO, LogLevel.WARN, LogLevel.ERROR]);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 0).length).assertEqual(4);
      expect(queryLogs(logs, '', LogLevel.WARN, '', 0).length).assertEqual(2);
      expect(queryLogs(logs, '', LogLevel.ERROR, '', 0).length).assertEqual(1);
      expect(queryLogs(logs, 'GuardSrc', LogLevel.INFO, '', 0).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_INGUARD_1100
     * @tc.name testGuard0011
     * @tc.desc Verify the hex preview handles zero, negative and empty inputs.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGuard0011', 0, () => {
      const buffer = bytesOf([1, 2, 3]);
      expect(toHexPreview(buffer, 0)).assertEqual(' …');
      expect(toHexPreview(buffer, -1)).assertEqual(' …');
      expect(toHexPreview(bytesOf([]), 16)).assertEqual('');
      expect(toHexPreview(buffer, 16)).assertEqual('01 02 03');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_INGUARD_1200
     * @tc.name testGuard0012
     * @tc.desc Verify the ellipsis only appears when the buffer is longer than the limit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGuard0012', 0, () => {
      const buffer = bytesOf([0x0F, 0x10, 0xFF]);
      expect(toHexPreview(buffer, 2)).assertEqual('0F 10 …');
      expect(toHexPreview(buffer, 3)).assertEqual('0F 10 FF');
      expect(toHexPreview(buffer, 2).length).assertEqual(7);
      expect(toHexPreview(buffer, 3).length).assertEqual(8);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_INGUARD_1300
     * @tc.name testGuard0013
     * @tc.desc Verify a truncated three byte character decodes to an empty string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGuard0013', 0, () => {
      const full = encodeUtf8('分');
      expect(full.byteLength).assertEqual(3);
      expect(decodeUtf8(bytesOf([0xE5, 0x88]))).assertEqual('');
      expect(decodeUtf8(full)).assertEqual('分');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_INGUARD_1400
     * @tc.name testGuard0014
     * @tc.desc Verify illegal leading bytes are skipped and decoding continues with the next byte.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGuard0014', 0, () => {
      expect(decodeUtf8(bytesOf([0x80, 0x61]))).assertEqual('a');
      expect(decodeUtf8(bytesOf([0xFF, 0x62]))).assertEqual('b');
      expect(decodeUtf8(bytesOf([0x80, 0x80, 0x63]))).assertEqual('c');
      expect(decodeUtf8(bytesOf([0xF8, 0x64]))).assertEqual('d');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_INGUARD_1500
     * @tc.name testGuard0015
     * @tc.desc Verify a truncated four byte character stops decoding instead of producing garbage.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGuard0015', 0, () => {
      const full = encodeUtf8('😀');
      expect(full.byteLength).assertEqual(4);
      expect(decodeUtf8(bytesOf([0xF0, 0x9F, 0x98]))).assertEqual('');
      expect(decodeUtf8(full)).assertEqual('😀');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_INGUARD_1600
     * @tc.name testGuard0016
     * @tc.desc Verify clamping with a non positive byte budget always returns an empty string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGuard0016', 0, () => {
      expect(clampPayload('分布式链路', 0)).assertEqual('');
      expect(clampPayload('分布式链路', -1)).assertEqual('');
      expect(clampPayload('分布式链路', -1024)).assertEqual('');
      expect(clampPayload('', 1024)).assertEqual('');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_INGUARD_1700
     * @tc.name testGuard0017
     * @tc.desc Verify clamping a surrogate pair drops the whole character instead of half of it.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGuard0017', 0, () => {
      const text = '😀ok';
      expect(clampPayload(text, 2)).assertEqual('');
      expect(clampPayload(text, 3).length).assertEqual(1);
      expect(utf8Length(clampPayload(text, 3))).assertEqual(3);
      expect(toHexPreview(encodeUtf8(clampPayload(text, 3)))).assertEqual('ED A0 BD');
      expect(clampPayload(text, 5).length).assertEqual(1);
      expect(clampPayload(text, 6)).assertEqual('😀');
      expect(clampPayload(text, 7)).assertEqual('😀o');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_INGUARD_1800
     * @tc.name testGuard0018
     * @tc.desc Verify clamping at the exact byte boundary keeps every complete character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGuard0018', 0, () => {
      expect(clampPayload('abc', 3)).assertEqual('abc');
      expect(clampPayload('abc', 2)).assertEqual('ab');
      expect(clampPayload('分', 3)).assertEqual('分');
      expect(clampPayload('分', 2)).assertEqual('');
      expect(clampPayload('分a', 4)).assertEqual('分a');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_INGUARD_1900
     * @tc.name testGuard0019
     * @tc.desc Verify a truncate limit of three or less leaves the text unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGuard0019', 0, () => {
      expect(truncateMiddle('ABCDEFGHIJ', 3)).assertEqual('ABCDEFGHIJ');
      expect(truncateMiddle('ABCDEFGHIJ', 0)).assertEqual('ABCDEFGHIJ');
      expect(truncateMiddle('ABCDEFGHIJ', -1)).assertEqual('ABCDEFGHIJ');
      expect(truncateMiddle('ABCDEFGHIJ', 4)).assertEqual('AB…J');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_INGUARD_2000
     * @tc.name testGuard0020
     * @tc.desc Verify duration formatting at both sides of every branch boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGuard0020', 0, () => {
      expect(formatDuration(-1)).assertEqual('0 ms');
      expect(formatDuration(0)).assertEqual('0 ms');
      expect(formatDuration(999)).assertEqual('999 ms');
      expect(formatDuration(1000)).assertEqual('1.0 s');
      expect(formatDuration(59999)).assertEqual('60.0 s');
      expect(formatDuration(60000)).assertEqual('1 min 0 s');
      expect(formatDuration(3600000)).assertEqual('60 min 0 s');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_INGUARD_2100
     * @tc.name testGuard0021
     * @tc.desc Verify date and time formatting pads month, day, hour, minute and second.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGuard0021', 0, () => {
      expect(formatDateTime(new Date(2026, 11, 31, 23, 59, 59))).assertEqual('2026-12-31 23:59:59');
      expect(formatDateTime(new Date(2028, 1, 29, 0, 0, 0))).assertEqual('2028-02-29 00:00:00');
      expect(formatDateTime(new Date(2027, 0, 5, 9, 5, 4))).assertEqual('2027-01-05 09:05:04');
      expect(formatTime(new Date(2027, 0, 5, 0, 0, 0))).assertEqual('00:00:00');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_INGUARD_2200
     * @tc.name testGuard0022
     * @tc.desc Verify a numeric code on the thrown object wins over digits in the message.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGuard0022', 0, () => {
      expect(codeOfThrown(new NumericThrown(201, 'BusinessError 801: x'))).assertEqual(201);
      expect(codeOfThrown(new NumericThrown(0, 'BusinessError 801: x'))).assertEqual(0);
      expect(codeOfThrown(new NumericThrown(-7, ''))).assertEqual(-7);
      expect(codeOfThrown(new StringThrown('32390001', 'no digits here'))).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_INGUARD_2300
     * @tc.name testGuard0023
     * @tc.desc Verify codes shorter than three digits inside the message are ignored.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGuard0023', 0, () => {
      expect(codeOfThrown(new MessageThrown('code 42 failed'))).assertEqual(0);
      expect(codeOfThrown(new MessageThrown('BusinessError 401: x'))).assertEqual(401);
      expect(codeOfThrown(new MessageThrown('ret=-426115026'))).assertEqual(426115026);
      expect(codeOfThrown(new MessageThrown('no digits'))).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_INGUARD_2400
     * @tc.name testGuard0024
     * @tc.desc Verify the thrown message falls back from message to name to string form.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGuard0024', 0, () => {
      expect(messageOfThrown(new MessageThrown('boom'))).assertEqual('boom');
      expect(messageOfThrown(new NameThrown('TypeError'))).assertEqual('TypeError');
      expect(messageOfThrown(new OpaqueThrown())).assertEqual('opaque thrown');
      expect(messageOfThrown(new NumericThrown(1, ''))).assertEqual('[object Object]');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_INGUARD_2500
     * @tc.name testGuard0025
     * @tc.desc Verify the formatted error text keeps or drops the code parenthesis as documented.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGuard0025', 0, () => {
      expect(formatError('createServer', 201, 'denied')).assertEqual('createServer失败（201）：denied');
      expect(formatError('createServer', 0, 'denied')).assertEqual('createServer失败：denied');
      expect(formatError('createServer', 201, '')).assertEqual('createServer失败（201）：未知错误');
      expect(formatError('closeProxyChannel', -1, '')).assertEqual('closeProxyChannel失败：未知错误');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_INGUARD_2600
     * @tc.name testGuard0026
     * @tc.desc Verify the error info description uses the bracketed code only for positive codes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGuard0026', 0, () => {
      expect(errorInfo(32390002, 'not paired').describe()).assertEqual('[32390002] not paired');
      expect(errorInfo(0, 'ok').describe()).assertEqual('ok');
      expect(errorInfo(201, '').message).assertEqual('未知错误');
      expect(errorInfo(32390002, 'not paired').hint).assertEqual('对端设备未与本机配对，先在系统设置里完成配对');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_INGUARD_2700
     * @tc.name testGuard0027
     * @tc.desc Verify the known code range accepts the boundaries and rejects the gaps.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGuard0027', 0, () => {
      expect(isKnownDistributedCode(201)).assertTrue();
      expect(isKnownDistributedCode(801)).assertTrue();
      expect(isKnownDistributedCode(200)).assertFalse();
      expect(isKnownDistributedCode(32390000)).assertFalse();
      expect(isKnownDistributedCode(32390001)).assertTrue();
      expect(isKnownDistributedCode(32390104)).assertTrue();
      expect(isKnownDistributedCode(32390105)).assertFalse();
      expect(isKnownDistributedCode(32390199)).assertFalse();
      expect(isKnownDistributedCode(32390200)).assertTrue();
      expect(isKnownDistributedCode(32390300)).assertTrue();
      expect(isKnownDistributedCode(32390301)).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_INGUARD_2800
     * @tc.name testGuard0028
     * @tc.desc Verify unregistered codes fall back to failure unless they are not positive.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGuard0028', 0, () => {
      expect(classifyErrorCode(1)).assertEqual(ProbeStatus.FAILED);
      expect(classifyErrorCode(32390999)).assertEqual(ProbeStatus.FAILED);
      expect(classifyErrorCode(0)).assertEqual(ProbeStatus.IDLE);
      expect(classifyErrorCode(-1)).assertEqual(ProbeStatus.IDLE);
      expect(classifyErrorCode(801)).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_INGUARD_2900
     * @tc.name testGuard0029
     * @tc.desc Verify unknown channel states and collaborate results get an explicit fallback text.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGuard0029', 0, () => {
      expect(channelStateName(99)).assertEqual('未知通道状态');
      expect(channelStateName(-1)).assertEqual('未知通道状态');
      expect(collaborateResultName(7)).assertEqual('未知协同结果（7）');
      expect(collaborateResultName(-1)).assertEqual('未知协同结果（-1）');
      expect(describeChannel(-1, ChannelStage.CLOSED)).assertEqual('未打开；尚无 channelId');
      expect(describeChannel(0, ChannelStage.OPEN)).assertEqual('通道已打开；channelId=0');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_INGUARD_3000
     * @tc.name testGuard0030
     * @tc.desc Verify blank collaborate indexes are rejected and the note field is not searched.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGuard0030', 0, () => {
      const blank: Record<string, Object> = {};
      blank[COLLABORATE_INDEX_KEY] = '   ';
      expect(buildRequest(blank).accepted).assertFalse();
      expect(mockRequest('').describe()).assertEqual('协同下标 "（空）"，参数 0 个 → REJECT');
      expect(mockRequest('  ').accepted).assertFalse();
      expect(filterFeatures('ACL').length).assertEqual(0);
      expect(filterFeatures('distributedextensionability').length).assertEqual(1);
    });
  });
}
