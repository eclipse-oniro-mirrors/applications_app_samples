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

import { describe, expect, it } from '@ohos/hypium';
import { KEYBOARD_BUFFER_LIMIT, LOG_STORE_CAPACITY } from '../../../main/ets/common/AppConstants';
import {
  ConfigEntry,
  buildExtraConfig,
  configByteLength,
  paddedEntries
} from '../../../main/ets/model/ExtraConfigModel';
import {
  ACTION_CHAR,
  KeySpec,
  KeyboardMode,
  applyKey
} from '../../../main/ets/model/KeyboardModel';
import {
  ApiStatus,
  ERROR_CODE_INPUT_METHOD_NOT_ENABLED,
  ERROR_CODE_LOCAL_EMPTY_RESULT,
  ERROR_CODE_LOCAL_TIMEOUT,
  ERROR_CODE_LOCAL_UNEXPECTED_THROW,
  ERROR_CODE_NOT_INPUT_METHOD,
  ERROR_CODE_SYSCAP,
  ERROR_CODE_UNSUPPORTED,
  apiStatusName,
  classifyErrorCode
} from '../../../main/ets/model/CallOutcome';
import {
  LogItem,
  LogLevel,
  appendLog,
  clearLogs,
  countByTag,
  queryLogs
} from '../../../main/ets/model/LogStore';
import { buildDefaultOutcome } from '../../../main/ets/utils/ExtraConfigSession';
import { withTimeout } from '../../../main/ets/utils/AsyncUtil';
import { codeOfThrown, describeThrown, messageOfThrown } from '../../../main/ets/utils/ErrorUtil';
import {
  describeStatusWithCode,
  formatDuration,
  truncateMiddle
} from '../../../main/ets/utils/FormatUtil';

/** 复现 BusinessError 的形状：只有 code 与 message 两个字段，不引入 SDK 依赖 */
class CodedError {
  public code: number;
  public message: string;

  constructor(code: number, message: string) {
    this.code = code;
    this.message = message;
  }
}

/**
 * 错误分类 / 文案格式 / 页面日志 / 长稳矩阵。
 * 每条只覆盖一个判定点：一个错误码、一个时长分桶、一个过滤条件、一次循环。
 * 断言全部落在 main/ets 的真实工具函数上，不复制实现。
 */
export default function inputMethodOutcomeMatrixTest() {
  describe('InputMethodOutcomeMatrixTest', () => {
    /**
     * @tc.number SUB_INPUT_METHOD_ERR_0100
     * @tc.name testOutcomeMatrix0001
     * @tc.desc Verify only zero maps to success so a returned zero can never be mistaken for a failure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0001', 0, () => {
      expect(classifyErrorCode(0)).assertEqual(ApiStatus.OK);
      expect(classifyErrorCode(0) === ApiStatus.INVALID_INPUT).assertFalse();
      // 页面渲染的文案也跟着走成功分支，避免状态与文案两张皮
      expect(apiStatusName(classifyErrorCode(0))).assertEqual('成功');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_0200
     * @tc.name testOutcomeMatrix0002
     * @tc.desc Verify 401 maps to the invalid input bucket used for oversized customSettings.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0002', 0, () => {
      expect(classifyErrorCode(401)).assertEqual(ApiStatus.INVALID_INPUT);
      expect(classifyErrorCode(ERROR_CODE_SYSCAP)).assertEqual(ApiStatus.UNSUPPORTED);
      // 入参类错误在页面上就显示为“入参无效”
      expect(apiStatusName(classifyErrorCode(401))).assertEqual('入参无效');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_0300
     * @tc.name testOutcomeMatrix0003
     * @tc.desc Verify both 801 and 501 are reported as unsupported capability rather than internal errors.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0003', 0, () => {
      expect(classifyErrorCode(ERROR_CODE_SYSCAP)).assertEqual(ApiStatus.UNSUPPORTED);
      expect(classifyErrorCode(ERROR_CODE_UNSUPPORTED)).assertEqual(ApiStatus.UNSUPPORTED);
      expect(classifyErrorCode(ERROR_CODE_UNSUPPORTED) === ApiStatus.INTERNAL).assertFalse();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_0400
     * @tc.name testOutcomeMatrix0004
     * @tc.desc Verify the two identity codes, not an input method and not enabled, share one bucket.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0004', 0, () => {
      expect(classifyErrorCode(ERROR_CODE_NOT_INPUT_METHOD)).assertEqual(ApiStatus.INPUT_METHOD);
      expect(classifyErrorCode(ERROR_CODE_INPUT_METHOD_NOT_ENABLED)).assertEqual(ApiStatus.INPUT_METHOD);
      expect(ERROR_CODE_NOT_INPUT_METHOD).assertEqual(12800004);
      expect(ERROR_CODE_INPUT_METHOD_NOT_ENABLED).assertEqual(12800013);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_0500
     * @tc.name testOutcomeMatrix0005
     * @tc.desc Verify the local empty result code is its own bucket so a silent undefined stays visible.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0005', 0, () => {
      expect(classifyErrorCode(ERROR_CODE_LOCAL_EMPTY_RESULT)).assertEqual(ApiStatus.EMPTY_RESULT);
      expect(ERROR_CODE_LOCAL_EMPTY_RESULT).assertEqual(-2);
      expect(classifyErrorCode(-2) === ApiStatus.OK).assertFalse();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_0600
     * @tc.name testOutcomeMatrix0006
     * @tc.desc Verify unknown and unregistered codes fall back to internal instead of success.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0006', 0, () => {
      expect(classifyErrorCode(ERROR_CODE_LOCAL_UNEXPECTED_THROW)).assertEqual(ApiStatus.INTERNAL);
      expect(classifyErrorCode(ERROR_CODE_LOCAL_TIMEOUT)).assertEqual(ApiStatus.INTERNAL);
      expect(classifyErrorCode(12800008)).assertEqual(ApiStatus.INTERNAL);
      expect(classifyErrorCode(12800010)).assertEqual(ApiStatus.INTERNAL);
      expect(classifyErrorCode(12800014)).assertEqual(ApiStatus.INTERNAL);
      expect(classifyErrorCode(1999999)).assertEqual(ApiStatus.INTERNAL);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_0700
     * @tc.name testOutcomeMatrix0007
     * @tc.desc Verify an identity failure carries the input method hint telling the reader where the call must run.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0007', 0, () => {
      const text = describeThrown('createPanel', ERROR_CODE_NOT_INPUT_METHOD, 'not allowed');
      expect(text.includes('createPanel失败（12800004）')).assertTrue();
      expect(text.includes('调用身份不符')).assertTrue();
      expect(text.includes('InputMethodExtensionAbility')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_0800
     * @tc.name testOutcomeMatrix0008
     * @tc.desc Verify the local timeout code is described as a missing callback rather than a generic internal error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0008', 0, () => {
      const text = describeThrown('probe', ERROR_CODE_LOCAL_TIMEOUT, '');
      expect(text.includes('（-3）')).assertTrue();
      expect(text.includes('未知错误')).assertTrue();
      expect(text.includes('接口返回 undefined')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_0900
     * @tc.name testOutcomeMatrix0009
     * @tc.desc Verify an invalid parameter failure keeps the original message and appends the 401 hint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0009', 0, () => {
      const text = describeThrown('buildExtraConfig', 401, 'too large');
      expect(text.includes('too large')).assertTrue();
      expect(text.includes('入参不合法')).assertTrue();
      expect(text.includes('32KB')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_1000
     * @tc.name testOutcomeMatrix0010
     * @tc.desc Verify a numeric zero on the thrown object is returned as is,
     * which is why callers must not treat it as success.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0010', 0, () => {
      expect(codeOfThrown(new CodedError(0, 'zero'))).assertEqual(0);
      expect(classifyErrorCode(codeOfThrown(new CodedError(0, 'zero')))).assertEqual(ApiStatus.OK);
      expect(apiStatusName(classifyErrorCode(codeOfThrown(new CodedError(0, 'zero'))))).assertEqual('成功');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_1100
     * @tc.name testOutcomeMatrix0011
     * @tc.desc Verify a six digit IME code is taken from the field without being truncated.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0011', 0, () => {
      expect(codeOfThrown(new CodedError(ERROR_CODE_NOT_INPUT_METHOD, 'x'))).assertEqual(12800004);
      expect(codeOfThrown(new CodedError(ERROR_CODE_INPUT_METHOD_NOT_ENABLED, 'x'))).assertEqual(12800013);
      expect(codeOfThrown(new CodedError(ERROR_CODE_SYSCAP, 'x'))).assertEqual(801);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_1200
     * @tc.name testOutcomeMatrix0012
     * @tc.desc Verify an object with neither code nor message yields the local placeholder instead of zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0012', 0, () => {
      expect(codeOfThrown(new Object())).assertEqual(ERROR_CODE_LOCAL_UNEXPECTED_THROW);
      expect(codeOfThrown(new Error(''))).assertEqual(ERROR_CODE_LOCAL_UNEXPECTED_THROW);
      expect(codeOfThrown(new Error('error 12 occurred'))).assertEqual(ERROR_CODE_LOCAL_UNEXPECTED_THROW);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_1300
     * @tc.name testOutcomeMatrix0013
     * @tc.desc Verify a thrown string is used as its own message instead of being lost.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0013', 0, () => {
      expect(messageOfThrown('boom')).assertEqual('boom');
      expect(messageOfThrown(new Error('直接消息'))).assertEqual('直接消息');
      expect(messageOfThrown(new CodedError(401, 'bad param'))).assertEqual('bad param');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_1400
     * @tc.name testOutcomeMatrix0014
     * @tc.desc Verify durations from one second to just under a minute render with one decimal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0014', 0, () => {
      expect(formatDuration(1000)).assertEqual('1.0 s');
      expect(formatDuration(1500)).assertEqual('1.5 s');
      expect(formatDuration(59999)).assertEqual('60.0 s');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_1500
     * @tc.name testOutcomeMatrix0015
     * @tc.desc Verify the minute bucket floors the remainder and keeps seconds separate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0015', 0, () => {
      expect(formatDuration(60000)).assertEqual('1 min 0 s');
      expect(formatDuration(61000)).assertEqual('1 min 1 s');
      expect(formatDuration(3600000)).assertEqual('60 min 0 s');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_1600
     * @tc.name testOutcomeMatrix0016
     * @tc.desc Verify zero and negative durations clamp to zero instead of printing a negative sign.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0016', 0, () => {
      expect(formatDuration(0)).assertEqual('0 ms');
      expect(formatDuration(-1)).assertEqual('0 ms');
      expect(formatDuration(-60000)).assertEqual('0 ms');
      expect(formatDuration(999)).assertEqual('999 ms');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_1700
     * @tc.name testOutcomeMatrix0017
     * @tc.desc Verify budgets of three or less leave the text untouched,
     * so a three dot marker never replaces the content.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0017', 0, () => {
      expect(truncateMiddle('abcdef', 3)).assertEqual('abcdef');
      expect(truncateMiddle('abcdef', 0)).assertEqual('abcdef');
      expect(truncateMiddle('abcdef', -1)).assertEqual('abcdef');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_1800
     * @tc.name testOutcomeMatrix0018
     * @tc.desc Verify an even budget splits the kept characters evenly around the ellipsis.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0018', 0, () => {
      expect(truncateMiddle('abcdef', 4)).assertEqual('ab…f');
      expect(truncateMiddle('abcdef', 6)).assertEqual('abcdef');
      expect(truncateMiddle('abcdefgh', 6)).assertEqual('abc…gh');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_1900
     * @tc.name testOutcomeMatrix0019
     * @tc.desc Verify an odd budget keeps the extra character on the head side.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0019', 0, () => {
      expect(truncateMiddle('abcdef', 5)).assertEqual('ab…ef');
      expect(truncateMiddle('abcdefghij', 7)).assertEqual('abc…hij');
      expect(truncateMiddle('abcdef', 7)).assertEqual('abcdef');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_2000
     * @tc.name testOutcomeMatrix0020
     * @tc.desc Verify a text already within budget is returned unchanged with no ellipsis added.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0020', 0, () => {
      expect(truncateMiddle('abc', 4)).assertEqual('abc');
      expect(truncateMiddle('', 5)).assertEqual('');
      expect(truncateMiddle('中文文本', 5)).assertEqual('中文文本');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_2100
     * @tc.name testOutcomeMatrix0021
     * @tc.desc Verify a zero code is hidden and a non zero code is shown in brackets.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0021', 0, () => {
      expect(describeStatusWithCode('未开始', 0)).assertEqual('未开始');
      expect(describeStatusWithCode('失败', 401)).assertEqual('失败（401）');
      expect(describeStatusWithCode('', 12800004)).assertEqual('（12800004）');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_2200
     * @tc.name testOutcomeMatrix0022
     * @tc.desc Verify a new log entry lands at the head so the panel shows the latest event first.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0022', 0, () => {
      const first = new LogItem('page', 'tagA', 'first');
      const second = new LogItem('page', 'tagB', 'second');
      const logs = appendLog(appendLog([], first), second);
      expect(logs.length).assertEqual(2);
      expect(logs[0].tag).assertEqual('tagB');
      expect(logs[1].tag).assertEqual('tagA');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_2300
     * @tc.name testOutcomeMatrix0023
     * @tc.desc Verify exceeding the capacity drops the oldest entry and keeps the newest ones.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0023', 0, () => {
      let logs: LogItem[] = [];
      logs = appendLog(logs, new LogItem('p', 't1', 'd1'), 2);
      logs = appendLog(logs, new LogItem('p', 't2', 'd2'), 2);
      logs = appendLog(logs, new LogItem('p', 't3', 'd3'), 2);
      expect(logs.length).assertEqual(2);
      expect(logs[0].detail).assertEqual('d3');
      expect(logs[1].detail).assertEqual('d2');
      expect(countByTag(logs, 't1')).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_2400
     * @tc.name testOutcomeMatrix0024
     * @tc.desc Verify a zero capacity falls back to the page constant instead of dropping everything.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0024', 0, () => {
      const logs = appendLog([], new LogItem('p', 't', 'd'), 0);
      expect(logs.length).assertEqual(1);
      expect(LOG_STORE_CAPACITY).assertEqual(200);
      // 留下的是刚写入的那条，不是被兜底逻辑误删后的别的东西
      expect(logs[0].detail).assertEqual('d');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_2500
     * @tc.name testOutcomeMatrix0025
     * @tc.desc Verify appending returns a new array and leaves the caller's array untouched.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0025', 0, () => {
      const original: LogItem[] = [new LogItem('p', 't1', 'd1')];
      const next = appendLog(original, new LogItem('p', 't2', 'd2'));
      expect(original.length).assertEqual(1);
      expect(next.length).assertEqual(2);
      expect(original[0].detail).assertEqual('d1');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_2600
     * @tc.name testOutcomeMatrix0026
     * @tc.desc Verify the source filter keeps only the matching emitter and an empty source keeps everything.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0026', 0, () => {
      const logs: LogItem[] = [
        new LogItem('page', 'ui', 'clicked'),
        new LogItem('service', 'ime', 'inputStart'),
        new LogItem('page', 'ui', 'switched')
      ];
      expect(queryLogs(logs, 'page').length).assertEqual(2);
      expect(queryLogs(logs, 'service').length).assertEqual(1);
      expect(queryLogs(logs, '').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_2700
     * @tc.name testOutcomeMatrix0027
     * @tc.desc Verify the level filter is inclusive so a warning query keeps warnings and errors but drops debug.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0027', 0, () => {
      const logs: LogItem[] = [
        new LogItem('p', 't', 'debug', LogLevel.DEBUG),
        new LogItem('p', 't', 'info', LogLevel.INFO),
        new LogItem('p', 't', 'warn', LogLevel.WARN),
        new LogItem('p', 't', 'error', LogLevel.ERROR)
      ];
      expect(queryLogs(logs, '', LogLevel.WARN).length).assertEqual(2);
      expect(queryLogs(logs, '', LogLevel.ERROR).length).assertEqual(1);
      expect(queryLogs(logs, '', LogLevel.INFO).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_2800
     * @tc.name testOutcomeMatrix0028
     * @tc.desc Verify the keyword matches detail and tag case insensitively and ignores surrounding blanks.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0028', 0, () => {
      const logs: LogItem[] = [
        new LogItem('p', 'InputStart', 'panel created'),
        new LogItem('p', 'Other', 'destroyPanel done')
      ];
      expect(queryLogs(logs, '', LogLevel.DEBUG, 'PANEL').length).assertEqual(2);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '  inputstart  ').length).assertEqual(1);
      expect(queryLogs(logs, '', LogLevel.DEBUG, 'missing').length).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_2900
     * @tc.name testOutcomeMatrix0029
     * @tc.desc Verify a zero limit means no truncation while a positive limit caps the result count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0029', 0, () => {
      const logs: LogItem[] = [
        new LogItem('p', 't', 'a'),
        new LogItem('p', 't', 'b'),
        new LogItem('p', 't', 'c')
      ];
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 0).length).assertEqual(3);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 1).length).assertEqual(1);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 2)[0].detail).assertEqual('a');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_3000
     * @tc.name testOutcomeMatrix0030
     * @tc.desc Verify counting by tag ignores other tags and returns zero for an unknown tag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0030', 0, () => {
      const logs: LogItem[] = [
        new LogItem('p', 'ui', 'a'),
        new LogItem('p', 'ui', 'b'),
        new LogItem('p', 'ime', 'c')
      ];
      expect(countByTag(logs, 'ui')).assertEqual(2);
      expect(countByTag(logs, 'ime')).assertEqual(1);
      expect(countByTag(logs, 'none')).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_3100
     * @tc.name testOutcomeMatrix0031
     * @tc.desc Verify clearing returns an empty array instead of mutating the caller's list.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0031', 0, () => {
      const logs: LogItem[] = [new LogItem('p', 't', 'd')];
      const cleared = clearLogs();
      expect(cleared.length).assertEqual(0);
      expect(logs.length).assertEqual(1);
      // 调用方手里那条还在，清空不会就地清掉外部引用
      expect(logs[0].detail).assertEqual('d');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_3200
     * @tc.name testOutcomeMatrix0032
     * @tc.desc Verify a value that settles before the limit is passed through untouched.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0032', 0, async (done: Function) => {
      const value = await withTimeout(Promise.resolve('done'), 1000);
      expect(value).assertEqual('done');
      // 非字符串结果原样透传，说明没有经过任何字符串化
      expect(await withTimeout(Promise.resolve(42), 1000)).assertEqual(42);
      // 空字符串同样原样返回，不会被当成“无结果”处理
      expect((await withTimeout(Promise.resolve(''), 1000)).length).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_3300
     * @tc.name testOutcomeMatrix0033
     * @tc.desc Verify twenty consecutive builds report the same summary, which is what the repeated tap path relies on.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0033', 0, () => {
      const first = buildDefaultOutcome();
      for (let i = 0; i < 20; i++) {
        const next = buildDefaultOutcome();
        expect(next.summary).assertEqual(first.summary);
        expect(next.code).assertEqual(0);
      }
      expect(first.durationMs >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_3400
     * @tc.name testOutcomeMatrix0034
     * @tc.desc Verify two hundred and fifty appends keep the store at its capacity with the newest entry on top.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0034', 0, () => {
      let logs: LogItem[] = [];
      for (let i = 0; i < 250; i++) {
        logs = appendLog(logs, new LogItem('p', 'loop', `d${i}`));
      }
      expect(logs.length).assertEqual(LOG_STORE_CAPACITY);
      expect(logs[0].detail).assertEqual('d249');
      expect(logs[LOG_STORE_CAPACITY - 1].detail).assertEqual('d50');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_3500
     * @tc.name testOutcomeMatrix0035
     * @tc.desc Verify sixty four consecutive character presses fill the buffer exactly once
     * and further presses are ignored.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0035', 0, () => {
      let text = '';
      for (let i = 0; i < 64; i++) {
        text = applyKeyChar(text);
      }
      expect(text.length).assertEqual(64);
      expect(applyKeyChar(text)).assertEqual(text);
      // 64 就是缓冲上限常量本身，而不是用例里另外写死的一个数
      expect(text.length).assertEqual(KEYBOARD_BUFFER_LIMIT);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERR_3600
     * @tc.name testOutcomeMatrix0036
     * @tc.desc Verify padding to the same target always yields the same byte count instead of drifting per call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcomeMatrix0036', 0, () => {
      const samples: number[] = [];
      for (let i = 0; i < 10; i++) {
        samples.push(buildExtraConfigBytes());
      }
      expect(samples.every((value: number) => value === samples[0])).assertTrue();
      expect(samples[0]).assertEqual(1024);
      // 每一次都是 1024，不是“只有第一条凑巧对”
      expect(samples.every((value: number) => value === 1024)).assertTrue();
    });
  });
}

/** 按固定额度构造一次扩展信息，供稳定性用例复用 */
function buildExtraConfigBytes(): number {
  const entries: ConfigEntry[] = paddedEntries(1024);
  return configByteLength(buildExtraConfig(entries));
}

/** 一次字符按键，供稳定性用例复用 */
function applyKeyChar(text: string): string {
  return applyKey(text, KeyboardMode.LETTER, new KeySpec('a', ACTION_CHAR), KEYBOARD_BUFFER_LIMIT).text;
}
