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
import { LOG_STORE_CAPACITY } from '../../../main/ets/common/AppConstants';
import {
  ApiStatus,
  CallOutcome,
  ERROR_CODE_LOCAL_EMPTY_RESULT,
  ERROR_CODE_LOCAL_TIMEOUT,
  ERROR_CODE_SYSCAP,
  ERROR_CODE_UNSUPPORTED,
  apiStatusName,
  classifyErrorCode,
  emptyOutcome,
  failedOutcome,
  invalidOutcome,
  okOutcome
} from '../../../main/ets/model/CallOutcome';
import {
  FEATURES,
  FeatureEntry,
  FeatureId,
  UNCOVERED_APIS,
  declaredApiCount,
  featureById,
  filterFeatures,
  uncoveredSummary
} from '../../../main/ets/model/FeatureCatalog';
import {
  LogItem,
  LogLevel,
  appendLog,
  clearLogs,
  countByTag,
  logLevelName,
  queryLogs
} from '../../../main/ets/model/LogStore';
import {
  TIMEOUT_FLAG,
  isTimeoutError,
  timeoutText,
  withTimeout
} from '../../../main/ets/utils/AsyncUtil';
import {
  apiStatusHint,
  codeOfThrown,
  formatError,
  messageOfThrown
} from '../../../main/ets/utils/ErrorUtil';
import {
  describeStatusWithCode,
  formatDateTime,
  formatDuration,
  formatTime,
  pad2,
  truncateMiddle
} from '../../../main/ets/utils/FormatUtil';

/** 只带 message（可选 code）的对象：复现"错误对象里没有数值码"的最小形状 */
class CodedLike {
  public code?: number;
  public message: string;

  constructor(message: string, code?: number) {
    this.message = message;
    this.code = code;
  }
}

/** 工具层用例：结果对象、错误翻译、异步超时、格式化、日志存储与目录，全部 import 正式实现 */
export default function inputMethodUtilTest() {
  describe('InputMethodUtilTest', () => {
    /**
     * @tc.number SUB_INPUT_METHOD_UTIL_0100
     * @tc.name testUtil0001
     * @tc.desc Verify the documented codes map to their categories and every other code falls into internal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUtil0001', 0, () => {
      expect(classifyErrorCode(ERROR_CODE_SYSCAP)).assertEqual(ApiStatus.UNSUPPORTED);
      expect(classifyErrorCode(ERROR_CODE_UNSUPPORTED)).assertEqual(ApiStatus.UNSUPPORTED);
      expect(classifyErrorCode(ERROR_CODE_LOCAL_EMPTY_RESULT)).assertEqual(ApiStatus.EMPTY_RESULT);
      expect(classifyErrorCode(ERROR_CODE_LOCAL_TIMEOUT)).assertEqual(ApiStatus.INTERNAL);
      expect(classifyErrorCode(12800008)).assertEqual(ApiStatus.INTERNAL);
      expect(classifyErrorCode(12800010)).assertEqual(ApiStatus.INTERNAL);
      expect(classifyErrorCode(123)).assertEqual(ApiStatus.INTERNAL);
      expect(classifyErrorCode(-1)).assertEqual(ApiStatus.INTERNAL);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UTIL_0200
     * @tc.name testUtil0002
     * @tc.desc Verify every status has its own display name.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUtil0002', 0, () => {
      expect(apiStatusName(ApiStatus.OK)).assertEqual('成功');
      expect(apiStatusName(ApiStatus.INVALID_INPUT)).assertEqual('入参无效');
      expect(apiStatusName(ApiStatus.UNSUPPORTED)).assertEqual('能力不支持');
      expect(apiStatusName(ApiStatus.INPUT_METHOD)).assertEqual('输入法身份不符');
      expect(apiStatusName(ApiStatus.EMPTY_RESULT)).assertEqual('无返回结果');
      expect(apiStatusName(ApiStatus.INTERNAL)).assertEqual('内部错误');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UTIL_0300
     * @tc.name testUtil0003
     * @tc.desc Verify each status carries a distinct actionable hint and success stays a plain sentence.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUtil0003', 0, () => {
      const hints: string[] = [ApiStatus.OK, ApiStatus.INVALID_INPUT, ApiStatus.UNSUPPORTED,
        ApiStatus.INPUT_METHOD, ApiStatus.EMPTY_RESULT, ApiStatus.INTERNAL]
        .map((status: ApiStatus) => apiStatusHint(status));
      expect(hints[0]).assertEqual('调用正常完成');
      expect(hints[1].includes('32KB')).assertTrue();
      expect(hints[2].includes('不支持')).assertTrue();
      expect(hints[3].includes('12800004')).assertTrue();
      expect(hints[4].includes('undefined')).assertTrue();
      expect(hints[5].includes('hilog')).assertTrue();
      expect(new Set<string>(hints).size).assertEqual(6);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UTIL_0400
     * @tc.name testUtil0004
     * @tc.desc Verify a blank message becomes a placeholder and a zero code is left out of the text.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUtil0004', 0, () => {
      const blank = formatError('createPanel', 401, '');
      expect(blank.includes('未知错误')).assertTrue();
      expect(blank.includes('（401）')).assertTrue();
      expect(formatError('build', 0, 'oops')).assertEqual('build失败：oops');
      expect(messageOfThrown(new Error('直接消息'))).assertEqual('直接消息');
      expect(messageOfThrown(new Object())).assertEqual('[object Object]');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UTIL_0500
     * @tc.name testUtil0005
     * @tc.desc Verify codes are read from the field first and then from the first run of three digits.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUtil0005', 0, () => {
      expect(codeOfThrown(new CodedLike('x', 401))).assertEqual(401);
      expect(codeOfThrown(new Error('error 40 happened'))).assertEqual(-1);
      expect(codeOfThrown(new Error('code 401 and 999'))).assertEqual(401);
      expect(codeOfThrown(new Error('first 999 then 401'))).assertEqual(999);
      expect(codeOfThrown(new CodedLike('no number here'))).assertEqual(-1);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UTIL_0600
     * @tc.name testUtil0006
     * @tc.desc Verify the four outcome factories set status, code and duration as declared.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUtil0006', 0, () => {
      const ok = okOutcome('buildExtraConfig', '4 个键', 'detail', 12);
      expect(ok.isOk()).assertTrue();
      expect(ok.code).assertEqual(0);
      expect(ok.describe()).assertEqual('buildExtraConfig → 成功：4 个键');
      expect(ok.describeDetail()).assertEqual('detail');
      expect(ok.durationMs).assertEqual(12);
      const failed = failedOutcome('createPanel', ApiStatus.INVALID_INPUT, 401, '入参无效', 'd', 5);
      expect(failed.isOk()).assertFalse();
      expect(failed.describe().endsWith('（401）')).assertTrue();
      const empty = emptyOutcome('probe', 'd', 3);
      expect(empty.status).assertEqual(ApiStatus.EMPTY_RESULT);
      expect(empty.code).assertEqual(ERROR_CODE_LOCAL_EMPTY_RESULT);
      expect(empty.summary.includes('undefined')).assertTrue();
      const invalid = invalidOutcome('local', 'd');
      expect(invalid.status).assertEqual(ApiStatus.INVALID_INPUT);
      expect(invalid.code).assertEqual(401);
      expect(invalid.durationMs).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UTIL_0700
     * @tc.name testUtil0007
     * @tc.desc Verify an empty summary leaves no colon and a local timeout code is shown in brackets.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUtil0007', 0, () => {
      const bare = new CallOutcome('probe', ApiStatus.OK, 0, '', '', 0);
      expect(bare.describe()).assertEqual('probe → 成功');
      expect(bare.describeDetail()).assertEqual('');
      const timedOut = failedOutcome('probe', ApiStatus.EMPTY_RESULT, ERROR_CODE_LOCAL_TIMEOUT, '超时', 'd', 8000);
      expect(timedOut.describe().includes('（-3）')).assertTrue();
      expect(timedOut.isOk()).assertFalse();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UTIL_0800
     * @tc.name testUtil0008
     * @tc.desc Verify a never settling promise is cut off by the wait limit with the local flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUtil0008', 0, async (done: Function) => {
      const start = Date.now();
      let timedOut = false;
      try {
        const never = new Promise<number>((_resolve: (value: number) => void) => {
          // 故意不 resolve：验证等待上限生效
        });
        await withTimeout(never, 30);
      } catch (err) {
        const error = err as Error;
        timedOut = isTimeoutError(error);
        expect(error.message.includes(TIMEOUT_FLAG)).assertTrue();
      }
      expect(timedOut).assertTrue();
      expect(Date.now() - start >= 25).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UTIL_0900
     * @tc.name testUtil0009
     * @tc.desc Verify the timeout flag, its text and the recognition helper agree with each other.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUtil0009', 0, () => {
      expect(TIMEOUT_FLAG).assertEqual('LOCAL_TIMEOUT');
      expect(timeoutText(8000)).assertEqual('等待超过 8000 ms 仍未回调');
      expect(isTimeoutError(new Error('LOCAL_TIMEOUT'))).assertTrue();
      expect(isTimeoutError(new Error('other'))).assertFalse();
      expect(isTimeoutError(new Object())).assertFalse();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UTIL_1000
     * @tc.name testUtil0010
     * @tc.desc Verify padding, time text, duration buckets, middle truncation and the status with code.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUtil0010', 0, () => {
      expect(pad2(0)).assertEqual('00');
      expect(pad2(9)).assertEqual('09');
      expect(pad2(10)).assertEqual('10');
      const sample = new Date(2026, 9, 30, 8, 5, 3);
      expect(formatTime(sample)).assertEqual('08:05:03');
      expect(formatDateTime(sample)).assertEqual('2026-10-30 08:05:03');
      expect(formatDuration(-5)).assertEqual('0 ms');
      expect(formatDuration(999)).assertEqual('999 ms');
      expect(formatDuration(1500)).assertEqual('1.5 s');
      expect(formatDuration(61000)).assertEqual('1 min 1 s');
      expect(truncateMiddle('abcdefgh', 5)).assertEqual('ab…gh');
      expect(truncateMiddle('abc', 3)).assertEqual('abc');
      expect(truncateMiddle('abcdefgh', 10)).assertEqual('abcdefgh');
      expect(describeStatusWithCode('未开始', 0)).assertEqual('未开始');
      expect(describeStatusWithCode('调用失败', 401)).assertEqual('调用失败（401）');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UTIL_1100
     * @tc.name testUtil0011
     * @tc.desc Verify capacity trimming, newest first order, source level keyword filters and tag counting.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUtil0011', 0, () => {
      const first = new LogItem('panel', 'tagA', 'createPanel 成功', LogLevel.INFO);
      const second = new LogItem('list', 'tagB', 'action callback', LogLevel.ERROR);
      const third = new LogItem('panel', 'tagB', 'ERROR in panel', LogLevel.WARN);
      expect(logLevelName(LogLevel.DEBUG)).assertEqual('DEBUG');
      expect(logLevelName(LogLevel.WARN)).assertEqual('WARN');
      expect(logLevelName(LogLevel.ERROR)).assertEqual('ERROR');
      expect(logLevelName(LogLevel.INFO)).assertEqual('INFO');
      const logs = appendLog(appendLog(appendLog([], first, 3), second, 3), third, 3);
      expect(logs.length).assertEqual(3);
      expect(logs[0].detail).assertEqual('ERROR in panel');
      expect(logs[2].detail).assertEqual('createPanel 成功');
      const capped = appendLog(appendLog([], first, 1), second, 1);
      expect(capped.length).assertEqual(1);
      expect(capped[0].detail).assertEqual('action callback');
      expect(LOG_STORE_CAPACITY).assertEqual(200);
      expect(queryLogs(logs, 'panel').length).assertEqual(2);
      expect(queryLogs(logs, '', LogLevel.WARN).length).assertEqual(2);
      expect(queryLogs(logs, '', LogLevel.DEBUG, 'TAGB').length).assertEqual(2);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 1).length).assertEqual(1);
      expect(countByTag(logs, 'tagB')).assertEqual(2);
      expect(clearLogs().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UTIL_1200
     * @tc.name testUtil0012
     * @tc.desc Verify lookup, api counting, uncovered reasons and keyword search handling of blank input.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUtil0012', 0, () => {
      expect(featureById(FeatureId.LIST).titleText()).assertEqual('输入法列表');
      expect(featureById(FeatureId.PANEL).apis.includes('createPanel')).assertTrue();
      let sum = 0;
      FEATURES.forEach((item: FeatureEntry) => {
        sum += item.apiCount();
      });
      expect(declaredApiCount()).assertEqual(sum);
      expect(declaredApiCount()).assertEqual(11);
      expect(UNCOVERED_APIS.length).assertEqual(2);
      expect(uncoveredSummary().includes('InputMethodExtensionAbility 真实输入')).assertTrue();
      expect(filterFeatures('  ').length).assertEqual(3);
      expect(filterFeatures('panel').length).assertEqual(1);
    });
  });
}
