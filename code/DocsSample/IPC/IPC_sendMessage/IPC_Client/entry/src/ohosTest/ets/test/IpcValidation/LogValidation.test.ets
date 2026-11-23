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

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  LogBuffer,
  ConnectionModel,
  RemoteProxyModel,
  RemoteStubModel,
  createConnectedSession,
  LEVEL_INFO,
  LEVEL_WARN,
  LEVEL_ERROR,
  LOG_TAG,
  joined,
  countOf,
  uniqueStrings,
  textFingerprint
} from '../Shared/SharedDriver';

export default function logValidation(): void {
  describe('LogValidation', () => {
    beforeAll(() => {
      logSuite('LogValidation', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('LogValidation', 'end');
    });

    /**
     * @tc.name          logValidationLevelLiterals
     * @tc.desc          The three log level literals match the production tags.
     * @tc.precondition  The level constants are exported.
     * @tc.steps         1. Read each level.
     *                   2. Compare with the expected words.
     *                   3. Deduplicate the list.
     * @tc.expected      The levels are INFO, WARN and ERROR.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logValidationLevelLiterals', 0, () => {
      logStep('logValidation', 'levels');
      expect(LEVEL_INFO).assertEqual('INFO');
      expect(LEVEL_WARN).assertEqual('WARN');
      expect(LEVEL_ERROR).assertEqual('ERROR');
      expect(LEVEL_INFO.length).assertEqual(4);
      expect(LEVEL_WARN.length).assertEqual(4);
      expect(LEVEL_ERROR.length).assertEqual(5);
      expect(uniqueStrings([LEVEL_INFO, LEVEL_WARN, LEVEL_ERROR]).length).assertEqual(3);
      expect(joined([LEVEL_INFO, LEVEL_WARN, LEVEL_ERROR], '/')).assertEqual('INFO/WARN/ERROR');
    });

    /**
     * @tc.name          logValidationTagLiteral
     * @tc.desc          The production log tag is the testTag literal.
     * @tc.precondition  LOG_TAG is exported.
     * @tc.steps         1. Read the tag.
     *                   2. Compare with the literal.
     *                   3. Inspect its casing.
     * @tc.expected      The tag is testTag with an uppercase T.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logValidationTagLiteral', 0, () => {
      expect(LOG_TAG).assertEqual('testTag');
      expect(LOG_TAG.length).assertEqual(7);
      expect(LOG_TAG.charAt(0)).assertEqual('t');
      expect(LOG_TAG.charAt(4)).assertEqual('T');
      expect(LOG_TAG.endsWith('Tag')).assertTrue();
      expect(LOG_TAG.indexOf(' ')).assertLess(0);
      expect(LOG_TAG).assertEqual(LOG_TAG.trim());
      expect(LOG_TAG === 'testtag').assertFalse();
    });

    /**
     * @tc.name          logValidationDefaultLimit
     * @tc.desc          A new buffer defaults to a limit of sixty-four lines.
     * @tc.precondition  A LogBuffer is constructed without an argument.
     * @tc.steps         1. Construct the buffer.
     *                   2. Read the limit.
     *                   3. Check the initial size.
     * @tc.expected      The limit is sixty-four and the buffer is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logValidationDefaultLimit', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      expect(buffer.limit).assertEqual(64);
      expect(buffer.size()).assertEqual(0);
      expect(buffer.lines.length).assertEqual(0);
      expect(buffer.levels.length).assertEqual(0);
      expect(buffer.trace()).assertEqual('');
      expect(buffer.contains('anything')).assertFalse();
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(0);
    });

    /**
     * @tc.name          logValidationInfoAppendsLevel
     * @tc.desc          The info method appends one INFO level and one prefixed line.
     * @tc.precondition  A fresh buffer exists.
     * @tc.steps         1. Log one info message.
     *                   2. Read the levels and lines.
     *                   3. Compare the formatting.
     * @tc.expected      The line starts with INFO and a space.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logValidationInfoAppendsLevel', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('startup');
      expect(buffer.size()).assertEqual(1);
      expect(buffer.levels[0]).assertEqual(LEVEL_INFO);
      expect(buffer.lines[0]).assertEqual('INFO startup');
      expect(buffer.lines[0].startsWith('INFO ')).assertTrue();
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(buffer.contains('startup')).assertTrue();
    });

    /**
     * @tc.name          logValidationWarnAppendsLevel
     * @tc.desc          The warn method appends one WARN level.
     * @tc.precondition  A fresh buffer exists.
     * @tc.steps         1. Log one warning.
     *                   2. Read the level array.
     *                   3. Compare the line text.
     * @tc.expected      The warning is recorded with the WARN prefix.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logValidationWarnAppendsLevel', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.warn('slow path');
      expect(buffer.size()).assertEqual(1);
      expect(buffer.levels[0]).assertEqual(LEVEL_WARN);
      expect(buffer.lines[0]).assertEqual('WARN slow path');
      expect(buffer.lines[0].charAt(0)).assertEqual('W');
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(buffer.contains('slow')).assertTrue();
      expect(buffer.contains('fast')).assertFalse();
    });

    /**
     * @tc.name          logValidationErrorAppendsLevel
     * @tc.desc          The error method appends one ERROR level.
     * @tc.precondition  A fresh buffer exists.
     * @tc.steps         1. Log one error.
     *                   2. Read the level array.
     *                   3. Compare the line text.
     * @tc.expected      The error is recorded with the ERROR prefix.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logValidationErrorAppendsLevel', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.error('boom');
      expect(buffer.size()).assertEqual(1);
      expect(buffer.levels[0]).assertEqual(LEVEL_ERROR);
      expect(buffer.lines[0]).assertEqual('ERROR boom');
      expect(buffer.lines[0].length).assertEqual(10);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(buffer.contains('boom')).assertTrue();
      expect(buffer.trace().startsWith('ERROR ')).assertTrue();
    });

    /**
     * @tc.name          logValidationMixedLevelCounts
     * @tc.desc          Mixed logging keeps per-level counts accurate.
     * @tc.precondition  A fresh buffer exists.
     * @tc.steps         1. Log four mixed entries.
     *                   2. Count each level.
     *                   3. Compare the total size.
     * @tc.expected      The counts are two INFO, one WARN and one ERROR.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationMixedLevelCounts', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('one');
      buffer.warn('two');
      buffer.info('three');
      buffer.error('four');
      expect(buffer.size()).assertEqual(4);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.countLevel('DEBUG')).assertEqual(0);
      expect(buffer.levels.length).assertEqual(4);
      expect(buffer.lines.length).assertEqual(4);
      expect(buffer.trace().split('|').length).assertEqual(4);
      expect(buffer.trace()).assertEqual('INFO one|WARN two|INFO three|ERROR four');
    });

    /**
     * @tc.name          logValidationTraceJoinOrder
     * @tc.desc          trace() joins lines with pipes in insertion order.
     * @tc.precondition  A buffer with three entries exists.
     * @tc.steps         1. Log three ordered messages.
     *                   2. Read the trace.
     *                   3. Split and compare.
     * @tc.expected      The trace preserves insertion order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationTraceJoinOrder', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('first');
      buffer.warn('second');
      buffer.error('third');
      const parts: string[] = buffer.trace().split('|');
      expect(parts.length).assertEqual(3);
      expect(parts[0]).assertEqual('INFO first');
      expect(parts[1]).assertEqual('WARN second');
      expect(parts[2]).assertEqual('ERROR third');
      expect(buffer.trace().indexOf('first')).assertLess(buffer.trace().indexOf('second'));
      expect(buffer.trace()).assertEqual(joined(buffer.lines, '|'));
      expect(buffer.trace().endsWith('third')).assertTrue();
    });

    /**
     * @tc.name          logValidationClearEmptiesBuffer
     * @tc.desc          clear() removes lines and levels together.
     * @tc.precondition  A buffer with entries exists.
     * @tc.steps         1. Log three entries.
     *                   2. Clear the buffer.
     *                   3. Read every accessor.
     * @tc.expected      Size, arrays and counts are all zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationClearEmptiesBuffer', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('a');
      buffer.warn('b');
      buffer.error('c');
      expect(buffer.size()).assertEqual(3);
      buffer.clear();
      expect(buffer.size()).assertEqual(0);
      expect(buffer.lines.length).assertEqual(0);
      expect(buffer.levels.length).assertEqual(0);
      expect(buffer.trace()).assertEqual('');
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(buffer.contains('a')).assertFalse();
      expect(buffer.limit).assertEqual(64);
    });

    /**
     * @tc.name          logValidationBoundedDefaultLimit
     * @tc.desc          Logging past sixty-four lines drops the oldest entries.
     * @tc.precondition  A default buffer exists.
     * @tc.steps         1. Log seventy messages.
     *                   2. Read the size and first line.
     *                   3. Compare the retained tail.
     * @tc.expected      The buffer holds the last sixty-four messages.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationBoundedDefaultLimit', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      for (let index = 0; index < 70; index++) {
        buffer.info('line-' + String(index));
      }
      expect(buffer.size()).assertEqual(64);
      expect(buffer.lines.length).assertEqual(64);
      expect(buffer.levels.length).assertEqual(64);
      expect(buffer.lines[0]).assertEqual('INFO line-6');
      expect(buffer.lines[63]).assertEqual('INFO line-69');
      expect(buffer.lines.indexOf('INFO line-5') >= 0).assertFalse();
      expect(buffer.contains('line-6')).assertTrue();
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(64);
    });

    /**
     * @tc.name          logValidationCustomLimitThree
     * @tc.desc          A limit of three retains only the newest three lines.
     * @tc.precondition  A buffer with limit three exists.
     * @tc.steps         1. Log five messages.
     *                   2. Read the size and lines.
     *                   3. Compare the trace.
     * @tc.expected      Only lines three to five remain.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationCustomLimitThree', 0, () => {
      const buffer: LogBuffer = new LogBuffer(3);
      buffer.info('one');
      buffer.info('two');
      buffer.info('three');
      buffer.info('four');
      buffer.info('five');
      expect(buffer.limit).assertEqual(3);
      expect(buffer.size()).assertEqual(3);
      expect(buffer.trace()).assertEqual('INFO three|INFO four|INFO five');
      expect(buffer.lines[0]).assertEqual('INFO three');
      expect(buffer.contains('two')).assertFalse();
      expect(buffer.contains('three')).assertTrue();
      expect(buffer.levels.length).assertEqual(3);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(3);
    });

    /**
     * @tc.name          logValidationLimitOne
     * @tc.desc          A limit of one keeps only the latest line.
     * @tc.precondition  A buffer with limit one exists.
     * @tc.steps         1. Log three different levels.
     *                   2. Read the remaining line.
     *                   3. Compare the level counts.
     * @tc.expected      Only the last error remains.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationLimitOne', 0, () => {
      const buffer: LogBuffer = new LogBuffer(1);
      buffer.info('first');
      buffer.warn('second');
      buffer.error('third');
      expect(buffer.size()).assertEqual(1);
      expect(buffer.lines[0]).assertEqual('ERROR third');
      expect(buffer.levels[0]).assertEqual(LEVEL_ERROR);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.trace()).assertEqual('ERROR third');
      expect(buffer.contains('first')).assertFalse();
      expect(buffer.contains('third')).assertTrue();
    });

    /**
     * @tc.name          logValidationLimitZeroHoldsNothing
     * @tc.desc          A zero limit keeps no lines at all.
     * @tc.precondition  A buffer with limit zero exists.
     * @tc.steps         1. Log two messages.
     *                   2. Read the size.
     *                   3. Read the trace.
     * @tc.expected      The buffer stays empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logValidationLimitZeroHoldsNothing', 0, () => {
      const buffer: LogBuffer = new LogBuffer(0);
      buffer.info('dropped');
      buffer.error('also dropped');
      expect(buffer.limit).assertEqual(0);
      expect(buffer.size()).assertEqual(0);
      expect(buffer.lines.length).assertEqual(0);
      expect(buffer.levels.length).assertEqual(0);
      expect(buffer.trace()).assertEqual('');
      expect(buffer.contains('dropped')).assertFalse();
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(buffer.size()).assertLess(1);
    });

    /**
     * @tc.name          logValidationTrimKeepsLevelsAligned
     * @tc.desc          Trimming removes the same indexes from lines and levels.
     * @tc.precondition  A buffer with limit four exists.
     * @tc.steps         1. Log six entries with mixed levels.
     *                   2. Compare the level array length.
     *                   3. Check the retained prefix words.
     * @tc.expected      The level array matches the retained line count.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationTrimKeepsLevelsAligned', 0, () => {
      const buffer: LogBuffer = new LogBuffer(4);
      buffer.info('i1');
      buffer.warn('w1');
      buffer.error('e1');
      buffer.info('i2');
      buffer.warn('w2');
      buffer.error('e2');
      expect(buffer.size()).assertEqual(4);
      expect(buffer.levels.length).assertEqual(4);
      expect(buffer.lines[0].startsWith('ERROR')).assertTrue();
      expect(buffer.lines[0]).assertEqual('ERROR e1');
      expect(buffer.lines[3]).assertEqual('ERROR e2');
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(2);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(buffer.trace().split('|').length).assertEqual(4);
    });

    /**
     * @tc.name          logValidationContainsPartialFragment
     * @tc.desc          contains() matches an inner fragment of any line.
     * @tc.precondition  A buffer with three entries exists.
     * @tc.steps         1. Log messages with a shared fragment.
     *                   2. Search for the fragment.
     *                   3. Search for an absent fragment.
     * @tc.expected      Only present fragments match.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logValidationContainsPartialFragment', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('connect request accepted');
      buffer.warn('connect attempt delayed');
      buffer.error('disconnect failed');
      expect(buffer.contains('connect')).assertTrue();
      expect(buffer.contains('request accepted')).assertTrue();
      expect(buffer.contains('delayed')).assertTrue();
      expect(buffer.contains('missing')).assertFalse();
      expect(buffer.contains('disconnect failed')).assertTrue();
      expect(buffer.contains('disconnect failed now')).assertFalse();
      expect(buffer.contains('')).assertTrue();
      expect(buffer.contains('INFO')).assertTrue();
    });

    /**
     * @tc.name          logValidationContainsCaseSensitive
     * @tc.desc          Fragment matching is case sensitive.
     * @tc.precondition  A buffer with one message exists.
     * @tc.steps         1. Log a lowercase message.
     *                   2. Search lowercase and uppercase forms.
     *                   3. Compare results.
     * @tc.expected      Only the exact case matches.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationContainsCaseSensitive', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('lowercase only');
      expect(buffer.contains('lowercase')).assertTrue();
      expect(buffer.contains('LOWERCASE')).assertFalse();
      expect(buffer.contains('Lowercase')).assertFalse();
      expect(buffer.contains('INFO')).assertTrue();
      expect(buffer.contains('info')).assertFalse();
      expect(buffer.contains('WARN')).assertFalse();
      expect(buffer.lines[0]).assertEqual('INFO lowercase only');
      expect(buffer.lines[0].indexOf('LOWERCASE')).assertLess(0);
    });

    /**
     * @tc.name          logValidationTraceFingerprintStable
     * @tc.desc          Identically built buffers share a trace fingerprint.
     * @tc.precondition  Two independent buffers exist.
     * @tc.steps         1. Log the same messages into both.
     *                   2. Hash both traces.
     *                   3. Compare with a variant.
     * @tc.expected      Equal buffers hash equally and a variant differs.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationTraceFingerprintStable', 0, () => {
      const first: LogBuffer = new LogBuffer();
      const second: LogBuffer = new LogBuffer();
      first.info('a');
      first.warn('b');
      second.info('a');
      second.warn('b');
      expect(first.trace()).assertEqual(second.trace());
      expect(textFingerprint(first.trace())).assertEqual(textFingerprint(second.trace()));
      second.error('c');
      expect(textFingerprint(first.trace()) === textFingerprint(second.trace())).assertFalse();
      expect(first.size()).assertEqual(2);
      expect(second.size()).assertEqual(3);
      expect(textFingerprint(first.trace())).assertLarger(0);
      expect(textFingerprint('')).assertEqual(216613);
    });

    /**
     * @tc.name          logValidationLongLinePreserved
     * @tc.desc          A long log line is stored without truncation.
     * @tc.precondition  A fresh buffer exists.
     * @tc.steps         1. Build a five hundred character message.
     *                   2. Log it.
     *                   3. Compare the stored length.
     * @tc.expected      The stored line is five hundred characters after the prefix.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logValidationLongLinePreserved', 0, () => {
      let message: string = '';
      while (message.length < 500) {
        message = message + 'segment-';
      }
      const buffer: LogBuffer = new LogBuffer();
      buffer.info(message);
      expect(message.length).assertEqual(504);
      expect(buffer.size()).assertEqual(1);
      expect(buffer.lines[0].length).assertEqual(504 + 5);
      expect(buffer.lines[0].startsWith('INFO segment-')).assertTrue();
      expect(buffer.contains('segment-segment-')).assertTrue();
      expect(buffer.lines[0].endsWith('segment-')).assertTrue();
      expect(buffer.trace().length).assertEqual(509);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
    });

    /**
     * @tc.name          logValidationUnicodeLineStored
     * @tc.desc          A unicode log line keeps its characters.
     * @tc.precondition  A fresh buffer exists.
     * @tc.steps         1. Log a Chinese message.
     *                   2. Read the stored line.
     *                   3. Compare lengths.
     * @tc.expected      The line holds the prefix and the unicode text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logValidationUnicodeLineStored', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.warn('连接失败');
      expect(buffer.size()).assertEqual(1);
      expect(buffer.lines[0]).assertEqual('WARN 连接失败');
      expect(buffer.lines[0].length).assertEqual(9);
      expect(buffer.lines[0].startsWith('WARN ')).assertTrue();
      expect(buffer.contains('连接')).assertTrue();
      expect(buffer.contains('失败')).assertTrue();
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(buffer.trace()).assertEqual('WARN 连接失败');
    });

    /**
     * @tc.name          logValidationClientLogsEnglishOnly
     * @tc.desc          The connection model writes english ASCII log lines.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send one payload.
     *                   2. Scan every log line.
     *                   3. Check character codes.
     * @tc.expected      Every code unit is printable ASCII.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationClientLogsEnglishOnly', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString();
      expect(client.logs.size()).assertEqual(3);
      let maxCode: number = 0;
      for (let index = 0; index < client.logs.lines.length; index++) {
        const line: string = client.logs.lines[index];
        for (let offset = 0; offset < line.length; offset++) {
          if (line.charCodeAt(offset) > maxCode) {
            maxCode = line.charCodeAt(offset);
          }
        }
      }
      expect(maxCode).assertLess(127);
      expect(client.logs.countLevel(LEVEL_INFO)).assertEqual(3);
      expect(client.logs.contains('reply hello rpc')).assertTrue();
      expect(client.logs.contains('onConnect')).assertTrue();
      expect(client.logs.contains('registerDeathRecipient success')).assertTrue();
      expect(client.logs.trace().indexOf('|')).assertLarger(0);
    });

    /**
     * @tc.name          logValidationClientLogsDisconnect
     * @tc.desc          Disconnecting writes one info line.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Disconnect the session.
     *                   2. Read the last log.
     *         3. Compare the text.
     * @tc.expected      The last line is the onDisconnect info message.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationClientLogsDisconnect', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.onDisconnect();
      expect(client.logs.size()).assertEqual(3);
      expect(client.logs.lines[2]).assertEqual('INFO onDisconnect');
      expect(client.logs.countLevel(LEVEL_INFO)).assertEqual(3);
      expect(client.logs.contains('onDisconnect')).assertTrue();
      expect(client.logs.trace().endsWith('INFO onDisconnect')).assertTrue();
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(client.logs.trace().split('|').length).assertEqual(3);
      expect(client.logs.limit).assertEqual(128);
    });

    /**
     * @tc.name          logValidationClientLogsFailureCode
     * @tc.desc          A failed connection writes one error line with the code.
     * @tc.precondition  A connecting client exists.
     * @tc.steps         1. Fail with the send error code.
     *                   2. Read the log trace.
     *                   3. Count the levels.
     * @tc.expected      One error line carries the decimal code.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationClientLogsFailureCode', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(1);
      client.onFailed(16000003);
      expect(client.logs.size()).assertEqual(1);
      expect(client.logs.levels[0]).assertEqual(LEVEL_ERROR);
      expect(client.logs.lines[0]).assertEqual('ERROR onFailed code 16000003');
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(client.logs.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(client.logs.contains('16000003')).assertTrue();
      expect(client.logs.trace().length).assertEqual(28);
      expect(client.logs.trace().startsWith('ERROR ')).assertTrue();
    });

    /**
     * @tc.name          logValidationClientLogsSkipWarning
     * @tc.desc          A skipped connect writes one warning with the current state.
     * @tc.precondition  A connecting client exists.
     * @tc.steps         1. Connect twice.
     *                   2. Read the log trace.
     *                   3. Compare the warning text.
     * @tc.expected      The warning names the connecting state.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationClientLogsSkipWarning', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(1);
      client.connect(2);
      expect(client.logs.size()).assertEqual(1);
      expect(client.logs.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(client.logs.lines[0]).assertEqual('WARN connect skipped in state connecting');
      expect(client.logs.contains('connect skipped in state connecting')).assertTrue();
      expect(client.logs.trace().startsWith('WARN ')).assertTrue();
      expect(client.logs.contains('ERROR')).assertFalse();
      expect(client.logs.levels.length).assertEqual(1);
      expect(client.logs.lines.length).assertEqual(1);
    });

    /**
     * @tc.name          logValidationBlockedDisconnectLogsError
     * @tc.desc          A blocked disconnect request writes one error line.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Request a disconnect while disconnected.
     *                   2. Read the log.
     *                   3. Compare the message.
     * @tc.expected      The error explains the missing connect id.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationBlockedDisconnectLogsError', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      expect(client.disconnectRequested()).assertFalse();
      expect(client.logs.size()).assertEqual(1);
      expect(client.logs.lines[0]).assertEqual('ERROR disconnect without connectId');
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(client.logs.contains('connectId')).assertTrue();
      expect(client.logs.contains('without')).assertTrue();
      expect(client.logs.trace()).assertEqual('ERROR disconnect without connectId');
      expect(client.logs.trace().length).assertEqual(34);
      expect(client.logs.size()).assertLess(2);
    });

    /**
     * @tc.name          logValidationResetClearsClientLogs
     * @tc.desc          reset() removes all client log entries.
     * @tc.precondition  A session with logs exists.
     * @tc.steps         1. Build the session and send.
     *                   2. Reset the client.
     *                   3. Read the log buffer.
     * @tc.expected      The log buffer is empty after the reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationResetClearsClientLogs', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString();
      expect(client.logs.size()).assertEqual(3);
      client.reset();
      expect(client.logs.size()).assertEqual(0);
      expect(client.logs.lines.length).assertEqual(0);
      expect(client.logs.levels.length).assertEqual(0);
      expect(client.logs.trace()).assertEqual('');
      expect(client.logs.contains('onConnect')).assertFalse();
      expect(client.logs.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(client.logs.limit).assertEqual(128);
    });

    /**
     * @tc.name          logValidationClientBoundIsOneTwentyEight
     * @tc.desc          The client log buffer is bounded at one hundred twenty-eight lines.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send one hundred forty payloads.
     *                   2. Read the buffer size.
     *                   3. Compare with the limit.
     * @tc.expected      The buffer holds exactly the limit count.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationClientBoundIsOneTwentyEight', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      for (let index = 0; index < 140; index++) {
        client.sendString('bulk');
      }
      expect(client.logs.limit).assertEqual(128);
      expect(client.logs.size()).assertEqual(128);
      expect(client.logs.lines.length).assertEqual(128);
      expect(client.logs.levels.length).assertEqual(128);
      expect(client.logs.contains('INFO onConnect')).assertFalse();
      expect(client.logs.contains('reply hello rpc')).assertTrue();
      expect(client.logs.countLevel(LEVEL_INFO)).assertEqual(128);
      expect(client.events.countOf('send-ok')).assertEqual(140);
    });

    /**
     * @tc.name          logValidationClientLevelCountsMixed
     * @tc.desc          Client log level counts reflect mixed success and failure paths.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send a success and force a failure.
     *                   2. Trigger a connect skip.
     *                   3. Count each level.
     * @tc.expected      Two info, one warning and one error are recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationClientLevelCountsMixed', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString('good');
      if (client.proxy !== undefined) {
        client.proxy.failNextSend = 16000003;
      }
      client.sendString('bad');
      client.connect(99);
      expect(client.logs.countLevel(LEVEL_INFO)).assertEqual(3);
      expect(client.logs.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(client.logs.size()).assertEqual(5);
      expect(client.logs.contains('connect skipped in state connected')).assertTrue();
      expect(client.logs.contains('errCode is 16000003')).assertTrue();
      expect(client.logs.trace().split('|').length).assertEqual(5);
    });

    /**
     * @tc.name          logValidationFailureThenInfoOrdering
     * @tc.desc          A failure line precedes a later success line.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Force a failure.
     *                   2. Send a success.
     *                   3. Compare the last two lines.
     * @tc.expected      The error line is directly before the success line.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationFailureThenInfoOrdering', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      if (client.proxy !== undefined) {
        client.proxy.failNextSend = 16000003;
      }
      client.sendString('bad');
      client.sendString('good');
      expect(client.logs.size()).assertEqual(4);
      expect(client.logs.lines[2].startsWith('ERROR ')).assertTrue();
      expect(client.logs.lines[3].startsWith('INFO ')).assertTrue();
      expect(client.logs.lines[3]).assertEqual('INFO reply hello rpc');
      expect(client.logs.levels[2]).assertEqual(LEVEL_ERROR);
      expect(client.logs.levels[3]).assertEqual(LEVEL_INFO);
      expect(client.logs.trace().indexOf('ERROR')).assertLess(client.logs.trace().lastIndexOf('INFO'));
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(client.logs.countLevel(LEVEL_INFO)).assertEqual(3);
    });

    /**
     * @tc.name          logValidationClientArraysAligned
     * @tc.desc          Client line and level arrays always share one length.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Run five mixed operations.
     *                   2. Compare both array lengths.
     *                   3. Check matching prefixes.
     * @tc.expected      Every line prefix equals its level entry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationClientArraysAligned', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString();
      client.onFailed(16000001);
      client.onDisconnect();
      expect(client.logs.lines.length).assertEqual(client.logs.levels.length);
      for (let index = 0; index < client.logs.lines.length; index++) {
        expect(client.logs.lines[index].startsWith(client.logs.levels[index] + ' ')).assertTrue();
        expect(client.logs.lines[index].indexOf(' ')).assertLarger(0);
      }
      expect(client.logs.size()).assertEqual(5);
      expect(client.logs.levels[0]).assertEqual(LEVEL_INFO);
      expect(client.logs.levels[3]).assertEqual(LEVEL_ERROR);
      expect(client.logs.levels[4]).assertEqual(LEVEL_INFO);
      expect(client.logs.contains('onDisconnect')).assertTrue();
    });

    /**
     * @tc.name          logValidationTraceTailAfterTrim
     * @tc.desc          After trimming, the trace starts at the retained boundary.
     * @tc.precondition  A buffer with limit two exists.
     * @tc.steps         1. Log four numbered messages.
     *                   2. Read the trace.
     *                   3. Compare with the expected tail.
     * @tc.expected      The trace holds messages three and four only.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logValidationTraceTailAfterTrim', 0, () => {
      const buffer: LogBuffer = new LogBuffer(2);
      for (let index = 0; index < 4; index++) {
        buffer.info('m' + String(index));
      }
      expect(buffer.trace()).assertEqual('INFO m2|INFO m3');
      expect(buffer.trace().startsWith('INFO m2')).assertTrue();
      expect(buffer.contains('m1')).assertFalse();
      expect(buffer.contains('m2')).assertTrue();
      expect(buffer.size()).assertEqual(2);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(buffer.lines[1]).assertEqual('INFO m3');
      expect(buffer.levels[1]).assertEqual(LEVEL_INFO);
    });

    /**
     * @tc.name          logValidationDirectLineMutation
     * @tc.desc          lastToast-style tail reads follow the lines array directly.
     * @tc.precondition  A buffer with two entries exists.
     * @tc.steps         1. Push a manual line.
     *                   2. Read size and trace.
     *                   3. Remove it and read again.
     * @tc.expected      Accessors reflect the manual array change.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logValidationDirectLineMutation', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('a');
      buffer.info('b');
      buffer.lines.push('MANUAL injected');
      buffer.levels.push('MANUAL');
      expect(buffer.size()).assertEqual(3);
      expect(buffer.trace()).assertEqual('INFO a|INFO b|MANUAL injected');
      expect(buffer.contains('injected')).assertTrue();
      expect(buffer.countLevel('MANUAL')).assertEqual(1);
      buffer.lines.pop();
      buffer.levels.pop();
      expect(buffer.size()).assertEqual(2);
      expect(buffer.trace()).assertEqual('INFO a|INFO b');
      expect(buffer.contains('injected')).assertFalse();
    });

    /**
     * @tc.name          logValidationUnknownLevelCountZero
     * @tc.desc          countLevel returns zero for levels never logged.
     * @tc.precondition  A buffer with info entries exists.
     * @tc.steps         1. Log two info entries.
     *                   2. Count unknown levels.
     *                   3. Compare with the known count.
     * @tc.expected      Unknown levels count as zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationUnknownLevelCountZero', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('one');
      buffer.info('two');
      expect(buffer.countLevel('TRACE')).assertEqual(0);
      expect(buffer.countLevel('DEBUG')).assertEqual(0);
      expect(buffer.countLevel('')).assertEqual(0);
      expect(buffer.countLevel('info')).assertEqual(0);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(buffer.size()).assertEqual(2);
    });

    /**
     * @tc.name          logValidationTraceAfterClearEmpty
     * @tc.desc          The trace is empty after clear and rebuilds on new logs.
     * @tc.precondition  A buffer was cleared.
     * @tc.steps         1. Log and clear.
     *                   2. Read the trace.
     *                   3. Log again and read.
     * @tc.expected      The trace is empty then holds only the new entry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationTraceAfterClearEmpty', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.warn('old');
      buffer.clear();
      expect(buffer.trace()).assertEqual('');
      expect(textFingerprint(buffer.trace())).assertEqual(textFingerprint(''));
      buffer.error('new');
      expect(buffer.trace()).assertEqual('ERROR new');
      expect(buffer.size()).assertEqual(1);
      expect(buffer.contains('old')).assertFalse();
      expect(buffer.contains('new')).assertTrue();
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(0);
    });

    /**
     * @tc.name          logValidationLimitChangedLater
     * @tc.desc          Lowering the public limit field trims on the next push.
     * @tc.precondition  A buffer with four entries exists.
     * @tc.steps         1. Log four entries.
     *                   2. Lower the limit to two.
     *                   3. Push one more entry.
     * @tc.expected      The buffer keeps only the newest two entries.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logValidationLimitChangedLater', 0, () => {
      const buffer: LogBuffer = new LogBuffer(10);
      buffer.info('a');
      buffer.info('b');
      buffer.info('c');
      buffer.info('d');
      expect(buffer.size()).assertEqual(4);
      buffer.limit = 2;
      buffer.info('e');
      expect(buffer.size()).assertEqual(2);
      expect(buffer.trace()).assertEqual('INFO d|INFO e');
      expect(buffer.contains('c')).assertFalse();
      expect(buffer.contains('d')).assertTrue();
      expect(buffer.contains('e')).assertTrue();
      expect(buffer.limit).assertEqual(2);
    });

    /**
     * @tc.name          logValidationBufferEnglishFragments
     * @tc.desc          Common english fragments are searchable in a buffer.
     * @tc.precondition  A buffer with protocol lines exists.
     * @tc.steps         1. Log three protocol-like lines.
     *                   2. Search each fragment.
     *                   3. Count the matches.
     * @tc.expected      Every logged fragment is found.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationBufferEnglishFragments', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('registerDeathRecipient success');
      buffer.error('showToast failed');
      buffer.warn('connect skipped');
      expect(buffer.contains('registerDeathRecipient')).assertTrue();
      expect(buffer.contains('success')).assertTrue();
      expect(buffer.contains('showToast failed')).assertTrue();
      expect(buffer.contains('skipped')).assertTrue();
      let found: number = 0;
      const fragments: string[] = ['registerDeathRecipient', 'showToast', 'skipped', 'absent'];
      for (let index = 0; index < fragments.length; index++) {
        if (buffer.contains(fragments[index])) {
          found = found + 1;
        }
      }
      expect(found).assertEqual(3);
      expect(buffer.size()).assertEqual(3);
    });

    /**
     * @tc.name          logValidationClientTrimBoundary
     * @tc.desc          Exactly one hundred twenty-nine lines trim to the limit.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send one hundred twenty-seven payloads.
     *                   2. Send two more.
     *                   3. Compare the size with the limit.
     * @tc.expected      The buffer size never exceeds one hundred twenty-eight.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationClientTrimBoundary', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      for (let index = 0; index < 127; index++) {
        client.sendString('x');
      }
      expect(client.logs.size()).assertEqual(128);
      client.sendString('y');
      expect(client.logs.size()).assertEqual(128);
      client.sendString('z');
      expect(client.logs.size()).assertEqual(128);
      expect(client.logs.limit).assertEqual(128);
      expect(client.logs.contains('registerDeathRecipient')).assertFalse();
      expect(client.logs.countLevel(LEVEL_INFO)).assertEqual(128);
      expect(client.events.countOf('send-ok')).assertEqual(129);
      expect(client.logs.trace().split('|').length).assertEqual(128);
    });

    /**
     * @tc.name          logValidationFingerprintOfFiveLines
     * @tc.desc          Five lines produce a reproducible trace fingerprint.
     * @tc.precondition  A buffer with five lines exists.
     * @tc.steps         1. Rebuild the same buffer.
     *                   2. Compare fingerprints.
     *                   3. Change the last line and compare.
     * @tc.expected      The identical rebuild matches and the variant differs.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logValidationFingerprintOfFiveLines', 0, () => {
      const first: LogBuffer = new LogBuffer(8);
      const second: LogBuffer = new LogBuffer(8);
      for (let index = 0; index < 5; index++) {
        first.info('entry-' + String(index));
        second.info('entry-' + String(index));
      }
      first.warn('entry-0');
      expect(second.size()).assertEqual(5);
      expect(first.size()).assertEqual(6);
      expect(first.trace().startsWith('INFO entry-0|INFO entry-1')).assertTrue();
      expect(textFingerprint(first.trace()) === textFingerprint(second.trace())).assertFalse();
      second.warn('entry-0');
      expect(textFingerprint(first.trace())).assertEqual(textFingerprint(second.trace()));
      expect(first.trace().split('|').length).assertEqual(6);
      expect(second.trace().split('|').length).assertEqual(6);
    });

    /**
     * @tc.name          logValidationWarnMentionsStateText
     * @tc.desc          The skipped-connect warning embeds the current state word.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Attempt connect while connected.
     *                   2. Read the warning line.
     *                   3. Compare with the state constant.
     * @tc.expected      The warning contains the connected word.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationWarnMentionsStateText', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.connect(3);
      expect(client.logs.size()).assertEqual(3);
      expect(client.logs.lines[2]).assertEqual('WARN connect skipped in state connected');
      expect(client.logs.lines[2].indexOf('connected')).assertLarger(0);
      expect(client.logs.levels[2]).assertEqual(LEVEL_WARN);
      expect(client.logs.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(client.logs.contains('state connected')).assertTrue();
      expect(client.logs.contains('state failed')).assertFalse();
      expect(client.logs.trace().endsWith('connected')).assertTrue();
    });

    /**
     * @tc.name          logValidationThreeLevelsDistinct
     * @tc.desc          Three distinct level entries stay distinct in the arrays.
     * @tc.precondition  A buffer with one entry per level exists.
     * @tc.steps         1. Log info, warn and error.
     *                   2. Read the level array.
     *                   3. Deduplicate and compare.
     * @tc.expected      The array holds three unique level tokens.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationThreeLevelsDistinct', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('i');
      buffer.warn('w');
      buffer.error('e');
      expect(buffer.levels.length).assertEqual(3);
      expect(uniqueStrings(buffer.levels).length).assertEqual(3);
      expect(buffer.levels[0]).assertEqual('INFO');
      expect(buffer.levels[1]).assertEqual('WARN');
      expect(buffer.levels[2]).assertEqual('ERROR');
      expect(joined(buffer.levels, '>')).assertEqual('INFO>WARN>ERROR');
      expect(buffer.lines[0].length).assertEqual(6);
      expect(buffer.lines[2].length).assertEqual(7);
      expect(countOf(buffer.levels, LEVEL_INFO)).assertEqual(1);
    });

    /**
     * @tc.name          logValidationDuplicateLinesKept
     * @tc.desc          Identical messages are stored as separate lines.
     * @tc.precondition  A fresh buffer exists.
     * @tc.steps         1. Log the same message three times.
     *                   2. Compare the size and trace.
     *                   3. Count the occurrences.
     * @tc.expected      Three separate identical lines are stored.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationDuplicateLinesKept', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('same');
      buffer.info('same');
      buffer.info('same');
      expect(buffer.size()).assertEqual(3);
      expect(buffer.trace()).assertEqual('INFO same|INFO same|INFO same');
      expect(countOf(buffer.lines, 'INFO same')).assertEqual(3);
      expect(uniqueStrings(buffer.lines).length).assertEqual(1);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(3);
      expect(buffer.contains('same')).assertTrue();
      expect(buffer.trace().split('|').length).assertEqual(3);
    });

    /**
     * @tc.name          logValidationClearKeepsLimit
     * @tc.desc          clear() preserves the configured limit.
     * @tc.precondition  A buffer with a custom limit exists.
     * @tc.steps         1. Fill and clear the buffer.
     *                   2. Push three entries.
     *                   3. Compare the retained size.
     * @tc.expected      The custom limit still applies after the clear.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationClearKeepsLimit', 0, () => {
      const buffer: LogBuffer = new LogBuffer(2);
      buffer.info('one');
      buffer.info('two');
      buffer.clear();
      expect(buffer.limit).assertEqual(2);
      buffer.error('a');
      buffer.error('b');
      buffer.error('c');
      expect(buffer.size()).assertEqual(2);
      expect(buffer.trace()).assertEqual('ERROR b|ERROR c');
      expect(buffer.contains('a')).assertFalse();
      expect(buffer.contains('b')).assertTrue();
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(2);
      expect(buffer.limit).assertEqual(2);
    });

    /**
     * @tc.name          logValidationProxyInvalidClientLog
     * @tc.desc          A send without a proxy leaves one error log line.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Send without connecting.
     *                   2. Read the log buffer.
     *                   3. Compare the message.
     * @tc.expected      The log holds the proxy invalid message.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationProxyInvalidClientLog', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.sendString();
      expect(client.logs.size()).assertEqual(1);
      expect(client.logs.lines[0]).assertEqual('ERROR proxy is invalid');
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(client.logs.contains('proxy')).assertTrue();
      expect(client.logs.contains('invalid')).assertTrue();
      expect(client.logs.trace()).assertEqual('ERROR proxy is invalid');
      expect(client.logs.trace().length).assertEqual(22);
      expect(client.logs.contains('sendMessageRequest')).assertFalse();
    });

    /**
     * @tc.name          logValidationDeathRegisterFailureLogs
     * @tc.desc          A failed registration writes an error and an info entry.
     * @tc.precondition  A killed proxy is handed to a client.
     * @tc.steps         1. Connect and deliver the killed proxy.
     *                   2. Read the log buffer.
     *                   3. Compare both lines.
     * @tc.expected      The failure error precedes the onConnect info.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationDeathRegisterFailureLogs', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(new RemoteStubModel());
      proxy.kill();
      client.connect(1);
      client.onConnect(proxy);
      expect(client.logs.size()).assertEqual(2);
      expect(client.logs.lines[0]).assertEqual('ERROR register failed');
      expect(client.logs.lines[1]).assertEqual('INFO onConnect');
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(client.logs.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(client.logs.trace()).assertEqual('ERROR register failed|INFO onConnect');
      expect(client.logs.contains('register failed')).assertTrue();
      expect(client.logs.trace().indexOf('ERROR')).assertLess(client.logs.trace().indexOf('INFO'));
    });

    /**
     * @tc.name          logValidationAllClientLinesPrefixed
     * @tc.desc          Every client log line begins with one of the three levels.
     * @tc.precondition  A session ran mixed operations.
     * @tc.steps         1. Build the session with failures and sends.
     *                   2. Scan every line prefix.
     *                   3. Count unrecognized prefixes.
     * @tc.expected      No line lacks a known level prefix.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationAllClientLinesPrefixed', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString();
      client.onFailed(16000001);
      client.onDisconnect();
      const levelList: string[] = [LEVEL_INFO, LEVEL_WARN, LEVEL_ERROR];
      let bad: number = 0;
      for (let index = 0; index < client.logs.lines.length; index++) {
        const line: string = client.logs.lines[index];
        let matched: boolean = false;
        for (let offset = 0; offset < levelList.length; offset++) {
          if (line.startsWith(levelList[offset] + ' ')) {
            matched = true;
          }
        }
        if (!matched) {
          bad = bad + 1;
        }
      }
      expect(bad).assertEqual(0);
      expect(client.logs.size()).assertEqual(5);
      expect(client.logs.countLevel(LEVEL_INFO)).assertEqual(4);
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(client.logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(client.logs.lines[0]).assertEqual('INFO registerDeathRecipient success');
    });

    /**
     * @tc.name          logValidationSizeCappedAcrossLevels
     * @tc.desc          Mixed level logging still respects the buffer limit.
     * @tc.precondition  A buffer with limit five exists.
     * @tc.steps         1. Log ten mixed entries.
     *                   2. Read the size.
     *                   3. Count each retained level.
     * @tc.expected      The size is five and the levels match the retained tail.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationSizeCappedAcrossLevels', 0, () => {
      const buffer: LogBuffer = new LogBuffer(5);
      for (let index = 0; index < 10; index++) {
        if (index % 3 === 0) {
          buffer.error('e' + String(index));
        } else if (index % 3 === 1) {
          buffer.warn('w' + String(index));
        } else {
          buffer.info('i' + String(index));
        }
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.trace().startsWith('INFO i5')).assertTrue();
      expect(buffer.contains('e0')).assertFalse();
      expect(buffer.contains('i8')).assertTrue();
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(2);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(buffer.trace().split('|').length).assertEqual(5);
    });

    /**
     * @tc.name          logValidationResetThenRebuildTrace
     * @tc.desc          A reset client rebuilds a log trace from scratch.
     * @tc.precondition  A used client exists.
     * @tc.steps         1. Run a session, reset and reconnect.
     *                   2. Deliver a proxy.
     *                   3. Compare the trace.
     * @tc.expected      The new trace holds only the reconnect lines.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationResetThenRebuildTrace', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString();
      client.reset();
      client.connect(5);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      expect(client.logs.size()).assertEqual(2);
      expect(client.logs.trace()).assertEqual('INFO registerDeathRecipient success|INFO onConnect');
      expect(client.logs.contains('reply')).assertFalse();
      expect(client.logs.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(client.logs.limit).assertEqual(128);
      expect(client.logs.contains('onConnect')).assertTrue();
      expect(client.state).assertEqual('connected');
    });

    /**
     * @tc.name          logValidationLargeLimitRetainsAll
     * @tc.desc          A large limit keeps every logged line.
     * @tc.precondition  A buffer with limit one thousand exists.
     * @tc.steps         1. Log two hundred entries.
     *                   2. Read the size.
     *                   3. Compare the first and last lines.
     * @tc.expected      All two hundred entries remain.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationLargeLimitRetainsAll', 0, () => {
      const buffer: LogBuffer = new LogBuffer(1000);
      for (let index = 0; index < 200; index++) {
        buffer.info('n' + String(index));
      }
      expect(buffer.limit).assertEqual(1000);
      expect(buffer.size()).assertEqual(200);
      expect(buffer.lines[0]).assertEqual('INFO n0');
      expect(buffer.lines[199]).assertEqual('INFO n199');
      expect(buffer.contains('n0')).assertTrue();
      expect(buffer.contains('n199')).assertTrue();
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(200);
      expect(buffer.trace().split('|').length).assertEqual(200);
    });

    /**
     * @tc.name          logValidationLevelsAreUppercaseAscii
     * @tc.desc          Every level literal is uppercase ASCII with no spaces.
     * @tc.precondition  The level constants are exported.
     * @tc.steps         1. Build the level list.
     *                   2. Compare each with its uppercase form.
     *                   3. Scan the character codes.
     * @tc.expected      All levels are uppercase letters between A and Z.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationLevelsAreUppercaseAscii', 0, () => {
      const levels: string[] = [LEVEL_INFO, LEVEL_WARN, LEVEL_ERROR];
      for (let index = 0; index < levels.length; index++) {
        expect(levels[index]).assertEqual(levels[index].toUpperCase());
        expect(levels[index].indexOf(' ')).assertLess(0);
        expect(levels[index].charCodeAt(0)).assertLarger(64);
        expect(levels[index].charCodeAt(0)).assertLess(91);
      }
      expect(levels[0].charAt(0)).assertEqual('I');
      expect(levels[1].charAt(0)).assertEqual('W');
      expect(levels[2].charAt(0)).assertEqual('E');
      expect(levels[0].length + levels[1].length + levels[2].length).assertEqual(13);
    });

    /**
     * @tc.name          logValidationFingerprintChangesAfterTrim
     * @tc.desc          Trimming changes the trace fingerprint.
     * @tc.precondition  A buffer with limit two exists.
     * @tc.steps         1. Log two entries and hash.
     *                   2. Log two more entries.
     *                   3. Rehash and compare.
     * @tc.expected      The fingerprint differs after the trim.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logValidationFingerprintChangesAfterTrim', 0, () => {
      const buffer: LogBuffer = new LogBuffer(2);
      buffer.info('a');
      buffer.info('b');
      const before: number = textFingerprint(buffer.trace());
      buffer.info('c');
      buffer.info('d');
      const after: number = textFingerprint(buffer.trace());
      expect(before === after).assertFalse();
      expect(buffer.trace()).assertEqual('INFO c|INFO d');
      expect(after).assertEqual(textFingerprint('INFO c|INFO d'));
      expect(before).assertEqual(textFingerprint('INFO a|INFO b'));
      expect(after).assertLarger(0);
      expect(buffer.contains('a')).assertFalse();
      expect(buffer.size()).assertEqual(2);
    });

    /**
     * @tc.name          logValidationSingleLineHasNoPipe
     * @tc.desc          A one line trace contains no pipe separator.
     * @tc.precondition  A buffer with one entry exists.
     * @tc.steps         1. Log one message.
     *                   2. Read the trace.
     *                   3. Count the separators.
     * @tc.expected      The trace has no pipe.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationSingleLineHasNoPipe', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.error('only');
      expect(buffer.size()).assertEqual(1);
      expect(buffer.trace()).assertEqual('ERROR only');
      expect(buffer.trace().indexOf('|')).assertLess(0);
      expect(countOf(buffer.trace().split(''), '|')).assertEqual(0);
      expect(buffer.trace().split('|').length).assertEqual(1);
      expect(buffer.trace().startsWith('ERROR ')).assertTrue();
      expect(buffer.contains('only')).assertTrue();
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
    });

    /**
     * @tc.name          logValidationDoubleDisconnectLogs
     * @tc.desc          Two disconnects add two info lines.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Disconnect twice.
     *                   2. Count the info lines.
     *                   3. Compare the trace tail.
     * @tc.expected      Two onDisconnect lines are present.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationDoubleDisconnectLogs', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.onDisconnect();
      client.onDisconnect();
      expect(client.logs.size()).assertEqual(4);
      expect(client.logs.countLevel(LEVEL_INFO)).assertEqual(4);
      expect(countOf(client.logs.lines, 'INFO onDisconnect')).assertEqual(2);
      expect(client.logs.lines[2]).assertEqual('INFO onDisconnect');
      expect(client.logs.lines[3]).assertEqual('INFO onDisconnect');
      expect(client.logs.trace().endsWith('INFO onDisconnect|INFO onDisconnect')).assertTrue();
      expect(client.logs.contains('onDisconnect')).assertTrue();
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(0);
    });

    /**
     * @tc.name          logValidationManyDisconnectsTrimLogs
     * @tc.desc          Many disconnects eventually trim the client log buffer.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Disconnect one hundred twenty-seven times.
     *                   2. Read the buffer size.
     *                   3. Check the earliest line.
     * @tc.expected      The buffer holds the limit and drops the first lines.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationManyDisconnectsTrimLogs', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      for (let index = 0; index < 127; index++) {
        client.onDisconnect();
      }
      expect(client.logs.size()).assertEqual(128);
      expect(client.logs.limit).assertEqual(128);
      expect(client.logs.contains('registerDeathRecipient')).assertFalse();
      expect(client.logs.countLevel(LEVEL_INFO)).assertEqual(128);
      expect(client.logs.lines[127]).assertEqual('INFO onDisconnect');
      expect(client.logs.lines[0]).assertEqual('INFO onConnect');
      expect(client.events.countOf('disconnected')).assertEqual(127);
      expect(client.toasts.length).assertEqual(128);
    });

    /**
     * @tc.name          logValidationTraceOfEmptyAndOne
     * @tc.desc          Empty and single line traces bracket the join behavior.
     * @tc.precondition  Two buffers exist.
     * @tc.steps         1. Read the empty trace.
     *                   2. Log one line and read again.
     *                   3. Compare both fingerprints.
     * @tc.expected      The empty trace is blank and the single trace is prefixed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationTraceOfEmptyAndOne', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      expect(buffer.trace()).assertEqual('');
      expect(buffer.trace().length).assertEqual(0);
      expect(joined(buffer.lines, '|')).assertEqual('');
      buffer.info('single');
      expect(buffer.trace()).assertEqual('INFO single');
      expect(buffer.trace().length).assertEqual(11);
      expect(textFingerprint(buffer.trace()) === textFingerprint('')).assertFalse();
      expect(textFingerprint('')).assertEqual(216613);
      expect(buffer.size()).assertEqual(1);
      expect(joined(buffer.lines, '|')).assertEqual(buffer.trace());
    });

    /**
     * @tc.name          logValidationClientWarnOnlyWhenSkipping
     * @tc.desc          Warnings appear only when connect attempts are skipped.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send a payload without skipping.
     *                   2. Read the warn count.
     *                   3. Skip a connect and recount.
     * @tc.expected      The warn count moves from zero to one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationClientWarnOnlyWhenSkipping', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString();
      expect(client.logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(client.logs.contains('connect skipped')).assertFalse();
      client.connect(77);
      expect(client.logs.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(client.logs.contains('connect skipped')).assertTrue();
      expect(client.logs.levels[3]).assertEqual(LEVEL_WARN);
      expect(client.logs.countLevel(LEVEL_INFO)).assertEqual(3);
      expect(client.logs.size()).assertEqual(4);
      expect(client.connectId).assertEqual(7);
    });

    /**
     * @tc.name          logValidationTwoBuffersIndependent
     * @tc.desc          Two buffers never share lines or limits.
     * @tc.precondition  Two buffers with different limits exist.
     * @tc.steps         1. Log into both.
     *                   2. Compare their traces and limits.
     *                   3. Clear one and check the other.
     * @tc.expected      The buffers stay independent.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationTwoBuffersIndependent', 0, () => {
      const small: LogBuffer = new LogBuffer(2);
      const large: LogBuffer = new LogBuffer(10);
      small.info('s1');
      small.info('s2');
      small.info('s3');
      large.info('l1');
      expect(small.size()).assertEqual(2);
      expect(large.size()).assertEqual(1);
      expect(small.trace()).assertEqual('INFO s2|INFO s3');
      expect(large.trace()).assertEqual('INFO l1');
      small.clear();
      expect(large.size()).assertEqual(1);
      expect(large.limit).assertEqual(10);
      expect(small.limit).assertEqual(2);
      expect(large.contains('l1')).assertTrue();
      expect(small.contains('s2')).assertFalse();
    });
  });
}
