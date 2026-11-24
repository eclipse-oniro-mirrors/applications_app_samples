'use static';
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
  LEVEL_INFO,
  LEVEL_WARN,
  LEVEL_ERROR,
  redactQuery,
  redactCredentials,
  hostOf,
  pathOf,
  textFingerprint,
  joined,
  sameStringArray,
  uniqueStrings,
  URL_TASK_A
} from '../Shared/SharedDriver';

/**
 * Logging suite for the hilog lines emitted around the download callbacks.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   127      completion line: download finished for a task number
 *   130-132  onProgress line that serialises the progress object
 *   133-147  start and create failure lines, including err.code and err.message
 *
 * The buffer is a pure model of bounded hilog retention: it keeps at most `limit`
 * lines, counts levels, and can be fingerprinted so two runs can be compared
 * without printing a URL that may carry a token.
 */
export default function transferLoggingTest(): void {
  describe('TransferLogging', () => {
    beforeAll(() => {
      logSuite('TransferLogging', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('TransferLogging', 'end');
    });

    /**
     * @tc.name   freshBufferIsEmpty
     * @tc.desc   A new buffer holds no lines, no levels and an empty trace.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('freshBufferIsEmpty', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      expect(buffer.size()).assertEqual(0);
      expect(buffer.lines.length).assertEqual(0);
      expect(buffer.levels.length).assertEqual(0);
      expect(buffer.trace()).assertEqual('');
      expect(buffer.contains('')).assertFalse();
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(buffer.limit).assertEqual(64);
    });

    /**
     * @tc.name   infoAppendsOneLine
     * @tc.desc   An info call appends one line prefixed with the INFO level.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('infoAppendsOneLine', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('start download A');
      expect(buffer.size()).assertEqual(1);
      expect(buffer.lines[0]).assertEqual('INFO start download A');
      expect(buffer.lines[0].startsWith('INFO ')).assertTrue();
      expect(buffer.levels[0]).assertEqual(LEVEL_INFO);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(buffer.trace()).assertEqual('INFO start download A');
    });

    /**
     * @tc.name   warnAppendsOneLine
     * @tc.desc   A warn call appends one line prefixed with the WARN level.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('warnAppendsOneLine', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.warn('retry budget is low');
      expect(buffer.size()).assertEqual(1);
      expect(buffer.lines[0]).assertEqual('WARN retry budget is low');
      expect(buffer.lines[0].startsWith('WARN ')).assertTrue();
      expect(buffer.levels[0]).assertEqual(LEVEL_WARN);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
    });

    /**
     * @tc.name   errorAppendsOneLine
     * @tc.desc   An error call appends one line prefixed with the ERROR level.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('errorAppendsOneLine', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.error('create failed with code 13400001');
      expect(buffer.size()).assertEqual(1);
      expect(buffer.lines[0]).assertEqual('ERROR create failed with code 13400001');
      expect(buffer.lines[0].startsWith('ERROR ')).assertTrue();
      expect(buffer.levels[0]).assertEqual(LEVEL_ERROR);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(0);
    });

    /**
     * @tc.name   levelsTrackLinesInParallel
     * @tc.desc   The level array stays index aligned with the rendered line array.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('levelsTrackLinesInParallel', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('one');
      buffer.warn('two');
      buffer.error('three');
      expect(buffer.levels.length).assertEqual(buffer.lines.length);
      expect(buffer.levels.length).assertEqual(3);
      expect(buffer.levels[0]).assertEqual(LEVEL_INFO);
      expect(buffer.levels[1]).assertEqual(LEVEL_WARN);
      expect(buffer.levels[2]).assertEqual(LEVEL_ERROR);
      expect(buffer.lines[1].startsWith(buffer.levels[1])).assertTrue();
      expect(buffer.lines[2].startsWith(buffer.levels[2])).assertTrue();
    });

    /**
     * @tc.name   sizeReflectsRetainedLines
     * @tc.desc   size() counts the retained lines, not every call ever made.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sizeReflectsRetainedLines', 0, () => {
      const buffer: LogBuffer = new LogBuffer(3);
      buffer.info('a');
      buffer.info('b');
      expect(buffer.size()).assertEqual(2);
      buffer.info('c');
      expect(buffer.size()).assertEqual(3);
      buffer.info('d');
      expect(buffer.size()).assertEqual(3);
      expect(buffer.size()).assertEqual(buffer.lines.length);
      expect(buffer.lines[2]).assertEqual('INFO d');
      expect(buffer.trace().split('|').length).assertEqual(3);
    });

    /**
     * @tc.name   countLevelCountsInfoLines
     * @tc.desc   The info counter ignores the other two levels.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('countLevelCountsInfoLines', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('a');
      buffer.info('b');
      buffer.info('c');
      buffer.warn('d');
      buffer.error('e');
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(3);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.size()).assertEqual(5);
      expect(buffer.countLevel('info')).assertEqual(0);
      expect(buffer.countLevel('INFO ')).assertEqual(0);
    });

    /**
     * @tc.name   countLevelCountsWarnLines
     * @tc.desc   Warn lines are counted independently of how many info lines precede them.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('countLevelCountsWarnLines', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      for (let index = 0; index < 4; index++) {
        buffer.info('progress tick');
      }
      buffer.warn('slow progress');
      buffer.warn('retry scheduled');
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(2);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(4);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(buffer.size()).assertEqual(6);
      expect(uniqueStrings(buffer.levels).length).assertEqual(2);
    });

    /**
     * @tc.name   countLevelCountsErrorLines
     * @tc.desc   Error lines are counted independently and survive alongside info lines.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('countLevelCountsErrorLines', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('start A');
      buffer.error('start failed');
      buffer.info('start B');
      buffer.error('create failed');
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(2);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(buffer.lines[1]).assertEqual('ERROR start failed');
      expect(buffer.lines[3]).assertEqual('ERROR create failed');
      expect(buffer.contains('create failed')).assertTrue();
    });

    /**
     * @tc.name   countLevelOfAbsentLevelIsZero
     * @tc.desc   A level that was never written reports zero instead of an error.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('countLevelOfAbsentLevelIsZero', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('only info');
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(buffer.countLevel('DEBUG')).assertEqual(0);
      expect(buffer.countLevel('')).assertEqual(0);
      expect(buffer.size()).assertEqual(1);
    });

    /**
     * @tc.name   countLevelIsCaseSensitive
     * @tc.desc   Lowercase or mixed case level strings never match the stored uppercase levels.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('countLevelIsCaseSensitive', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('line one');
      buffer.warn('line two');
      buffer.error('line three');
      expect(buffer.countLevel('INFO')).assertEqual(1);
      expect(buffer.countLevel('Info')).assertEqual(0);
      expect(buffer.countLevel('info')).assertEqual(0);
      expect(buffer.countLevel('WARN')).assertEqual(1);
      expect(buffer.countLevel('warn')).assertEqual(0);
      expect(buffer.countLevel('ERROR')).assertEqual(1);
      expect(buffer.countLevel('Error')).assertEqual(0);
    });

    /**
     * @tc.name   containsFindsLevelPrefix
     * @tc.desc   The contains reader matches the rendered level prefix of every line.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('containsFindsLevelPrefix', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      expect(buffer.contains('INFO')).assertFalse();
      buffer.info('download started');
      expect(buffer.contains('INFO')).assertTrue();
      buffer.warn('download slow');
      expect(buffer.contains('WARN')).assertTrue();
      buffer.error('download failed');
      expect(buffer.contains('ERROR')).assertTrue();
      expect(buffer.contains('DEBUG')).assertFalse();
      expect(buffer.contains('INFO download started')).assertTrue();
      expect(buffer.contains('WARN download started')).assertFalse();
    });

    /**
     * @tc.name   containsFindsMessageBody
     * @tc.desc   Any fragment of the message body is found by the contains reader.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('containsFindsMessageBody', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('task A reached 100 percent');
      expect(buffer.contains('reached 100')).assertTrue();
      expect(buffer.contains('task A')).assertTrue();
      expect(buffer.contains('percent')).assertTrue();
      expect(buffer.contains('100 percent')).assertTrue();
      expect(buffer.contains('task B')).assertFalse();
      expect(buffer.contains('')).assertTrue();
      expect(buffer.contains('task A reached 100 percent')).assertTrue();
    });

    /**
     * @tc.name   containsIsFalseForAbsentFragment
     * @tc.desc   A fragment that appears in no retained line reports false even after eviction.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('containsIsFalseForAbsentFragment', 0, () => {
      const buffer: LogBuffer = new LogBuffer(2);
      buffer.info('first marker');
      buffer.info('second marker');
      buffer.info('third marker');
      expect(buffer.contains('first marker')).assertFalse();
      expect(buffer.contains('second marker')).assertTrue();
      expect(buffer.contains('third marker')).assertTrue();
      expect(buffer.contains('fourth marker')).assertFalse();
      expect(buffer.contains('marker')).assertTrue();
      expect(buffer.size()).assertEqual(2);
    });

    /**
     * @tc.name   orderIsInsertionOrder
     * @tc.desc   The buffer never sorts or reorders the lines it retains.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('orderIsInsertionOrder', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.warn('zeta');
      buffer.info('alpha');
      buffer.error('mu');
      expect(buffer.lines[0]).assertEqual('WARN zeta');
      expect(buffer.lines[1]).assertEqual('INFO alpha');
      expect(buffer.lines[2]).assertEqual('ERROR mu');
      expect(buffer.trace()).assertEqual('WARN zeta|INFO alpha|ERROR mu');
      expect(buffer.trace().split('|')[0]).assertEqual('WARN zeta');
      expect(buffer.trace().split('|')[2]).assertEqual('ERROR mu');
      expect(sameStringArray(buffer.levels, [LEVEL_WARN, LEVEL_INFO, LEVEL_ERROR])).assertTrue();
    });

    /**
     * @tc.name   defaultLimitIsSixtyFour
     * @tc.desc   Without an argument the buffer retains at most sixty four lines.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('defaultLimitIsSixtyFour', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      expect(buffer.limit).assertEqual(64);
      for (let index = 0; index < 64; index++) {
        buffer.info('line ' + String(index));
      }
      expect(buffer.size()).assertEqual(64);
      expect(buffer.lines[0]).assertEqual('INFO line 0');
      expect(buffer.lines[63]).assertEqual('INFO line 63');
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(64);
      expect(buffer.trace().split('|').length).assertEqual(64);
    });

    /**
     * @tc.name   customLimitIsRespected
     * @tc.desc   A custom limit is stored and enforced from the first overflow onwards.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('customLimitIsRespected', 0, () => {
      const buffer: LogBuffer = new LogBuffer(5);
      expect(buffer.limit).assertEqual(5);
      for (let index = 0; index < 8; index++) {
        buffer.info('tick ' + String(index));
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.lines[0]).assertEqual('INFO tick 3');
      expect(buffer.lines[4]).assertEqual('INFO tick 7');
      expect(buffer.contains('tick 2')).assertFalse();
      expect(buffer.contains('tick 3')).assertTrue();
      expect(buffer.levels.length).assertEqual(5);
    });

    /**
     * @tc.name   retentionKeepsLastLines
     * @tc.desc   The retained window always ends on the newest line written.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('retentionKeepsLastLines', 0, () => {
      const buffer: LogBuffer = new LogBuffer(3);
      const messages: string[] = ['alpha', 'bravo', 'charlie', 'delta', 'echo'];
      for (let index = 0; index < messages.length; index++) {
        buffer.info(messages[index]);
      }
      expect(buffer.size()).assertEqual(3);
      expect(buffer.lines[0]).assertEqual('INFO charlie');
      expect(buffer.lines[1]).assertEqual('INFO delta');
      expect(buffer.lines[2]).assertEqual('INFO echo');
      expect(buffer.trace()).assertEqual('INFO charlie|INFO delta|INFO echo');
      expect(buffer.contains('bravo')).assertFalse();
      expect(buffer.contains('echo')).assertTrue();
    });

    /**
     * @tc.name   retentionDropsOldestLevels
     * @tc.desc   Eviction removes levels and lines from the same oldest indexes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('retentionDropsOldestLevels', 0, () => {
      const buffer: LogBuffer = new LogBuffer(2);
      buffer.info('first');
      buffer.error('second');
      buffer.warn('third');
      expect(buffer.size()).assertEqual(2);
      expect(buffer.levels.length).assertEqual(2);
      expect(sameStringArray(buffer.levels, [LEVEL_ERROR, LEVEL_WARN])).assertTrue();
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(buffer.lines[0].startsWith(LEVEL_ERROR)).assertTrue();
    });

    /**
     * @tc.name   exactlyAtLimitKeepsAll
     * @tc.desc   Filling the buffer to its limit exactly triggers no eviction.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('exactlyAtLimitKeepsAll', 0, () => {
      const buffer: LogBuffer = new LogBuffer(4);
      buffer.info('one');
      buffer.info('two');
      buffer.info('three');
      buffer.info('four');
      expect(buffer.size()).assertEqual(4);
      expect(buffer.size()).assertEqual(buffer.limit);
      expect(buffer.lines[0]).assertEqual('INFO one');
      expect(buffer.lines[3]).assertEqual('INFO four');
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(4);
      expect(buffer.contains('one')).assertTrue();
      expect(buffer.trace().split('|').length).assertEqual(4);
    });

    /**
     * @tc.name   oneOverLimitDropsExactlyOne
     * @tc.desc   A single line beyond the limit evicts only the oldest entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('oneOverLimitDropsExactlyOne', 0, () => {
      const buffer: LogBuffer = new LogBuffer(4);
      buffer.info('one');
      buffer.info('two');
      buffer.info('three');
      buffer.info('four');
      buffer.info('five');
      expect(buffer.size()).assertEqual(4);
      expect(buffer.contains('one')).assertFalse();
      expect(buffer.contains('two')).assertTrue();
      expect(buffer.lines[0]).assertEqual('INFO two');
      expect(buffer.lines[3]).assertEqual('INFO five');
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(4);
      expect(buffer.trace().split('|')[0]).assertEqual('INFO two');
    });

    /**
     * @tc.name   largeOverflowKeepsLimitWindow
     * @tc.desc   Hundreds of writes leave exactly the newest window of the configured size.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('largeOverflowKeepsLimitWindow', 0, () => {
      const buffer: LogBuffer = new LogBuffer(8);
      for (let index = 0; index < 200; index++) {
        buffer.info('event ' + String(index));
      }
      expect(buffer.size()).assertEqual(8);
      expect(buffer.lines[0]).assertEqual('INFO event 192');
      expect(buffer.lines[7]).assertEqual('INFO event 199');
      expect(buffer.contains('event 191')).assertFalse();
      expect(buffer.contains('event 192')).assertTrue();
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(8);
      expect(buffer.trace().split('|').length).assertEqual(8);
    });

    /**
     * @tc.name   countLevelAfterEvictionIsRetainedCount
     * @tc.desc   Level counts describe the retained window, so evicted levels are no longer counted.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('countLevelAfterEvictionIsRetainedCount', 0, () => {
      const buffer: LogBuffer = new LogBuffer(3);
      buffer.error('oldest');
      buffer.error('older');
      buffer.info('newer');
      buffer.warn('newest');
      expect(buffer.size()).assertEqual(3);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(buffer.contains('oldest')).assertFalse();
      expect(buffer.lines[0]).assertEqual('ERROR older');
      expect(buffer.lines[2]).assertEqual('WARN newest');
    });

    /**
     * @tc.name   clearResetsBothArrays
     * @tc.desc   clear() empties the line array, the level array and the trace together.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('clearResetsBothArrays', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('one');
      buffer.warn('two');
      buffer.error('three');
      expect(buffer.size()).assertEqual(3);
      buffer.clear();
      expect(buffer.size()).assertEqual(0);
      expect(buffer.lines.length).assertEqual(0);
      expect(buffer.levels.length).assertEqual(0);
      expect(buffer.trace()).assertEqual('');
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(buffer.contains('one')).assertFalse();
    });

    /**
     * @tc.name   bufferReusableAfterClear
     * @tc.desc   After a clear the buffer accepts a fresh sequence without stale entries.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('bufferReusableAfterClear', 0, () => {
      const buffer: LogBuffer = new LogBuffer(2);
      buffer.error('old failure');
      buffer.clear();
      buffer.info('fresh start');
      expect(buffer.size()).assertEqual(1);
      expect(buffer.lines[0]).assertEqual('INFO fresh start');
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(buffer.contains('old failure')).assertFalse();
      expect(buffer.contains('fresh start')).assertTrue();
      expect(buffer.trace()).assertEqual('INFO fresh start');
    });

    /**
     * @tc.name   clearKeepsConfiguredLimit
     * @tc.desc   Clearing the content does not restore the default limit of the buffer.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clearKeepsConfiguredLimit', 0, () => {
      const buffer: LogBuffer = new LogBuffer(3);
      buffer.limit = 2;
      buffer.info('one');
      buffer.info('two');
      buffer.info('three');
      expect(buffer.size()).assertEqual(2);
      buffer.clear();
      expect(buffer.limit).assertEqual(2);
      buffer.info('four');
      buffer.info('five');
      buffer.info('six');
      expect(buffer.size()).assertEqual(2);
      expect(buffer.lines[0]).assertEqual('INFO five');
      expect(buffer.contains('four')).assertFalse();
    });

    /**
     * @tc.name   traceJoinsLinesWithPipe
     * @tc.desc   The trace is the retained lines joined by one pipe in insertion order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('traceJoinsLinesWithPipe', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('start A');
      buffer.info('start B');
      buffer.warn('wait for gate');
      expect(buffer.trace()).assertEqual('INFO start A|INFO start B|WARN wait for gate');
      expect(buffer.trace()).assertEqual(joined(buffer.lines, '|'));
      expect(buffer.trace().split('|').length).assertEqual(3);
      expect(buffer.trace().endsWith('|')).assertFalse();
      expect(buffer.trace().startsWith('INFO')).assertTrue();
      expect(buffer.trace().indexOf('||')).assertEqual(-1);
    });

    /**
     * @tc.name   traceAfterEvictionHasNewestOnly
     * @tc.desc   The trace never resurrects an evicted line.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('traceAfterEvictionHasNewestOnly', 0, () => {
      const buffer: LogBuffer = new LogBuffer(2);
      buffer.info('evicted');
      buffer.warn('kept one');
      buffer.error('kept two');
      expect(buffer.trace()).assertEqual('WARN kept one|ERROR kept two');
      expect(buffer.trace().indexOf('evicted')).assertEqual(-1);
      expect(buffer.trace().split('|').length).assertEqual(2);
      expect(buffer.trace().startsWith('WARN')).assertTrue();
      expect(buffer.trace().endsWith('kept two')).assertTrue();
    });

    /**
     * @tc.name   traceOfSingleLine
     * @tc.desc   A singleton buffer traces exactly one line without separators.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('traceOfSingleLine', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.error('create failed');
      expect(buffer.trace()).assertEqual('ERROR create failed');
      expect(buffer.trace().indexOf('|')).assertEqual(-1);
      expect(buffer.trace()).assertEqual(buffer.lines[0]);
      expect(buffer.trace().length).assertEqual(buffer.lines[0].length);
      expect(buffer.contains('ERROR create failed')).assertTrue();
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
    });

    /**
     * @tc.name   fingerprintStableForSameSequence
     * @tc.desc   Two buffers fed identical lines produce identical trace fingerprints.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fingerprintStableForSameSequence', 0, () => {
      const left: LogBuffer = new LogBuffer();
      const right: LogBuffer = new LogBuffer();
      left.info('start A');
      left.info('start B');
      right.info('start A');
      right.info('start B');
      expect(left.trace()).assertEqual(right.trace());
      expect(textFingerprint(left.trace())).assertEqual(textFingerprint(right.trace()));
      expect(textFingerprint(left.trace())).assertLarger(0);
      expect(left.size()).assertEqual(right.size());
      expect(textFingerprint(left.trace())).assertLess(1000003);
      logStep('transferLogging', 'identical sequences share a fingerprint');
    });

    /**
     * @tc.name   fingerprintChangesWithLevel
     * @tc.desc   The same message logged at a different level changes the trace fingerprint.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintChangesWithLevel', 0, () => {
      const info: LogBuffer = new LogBuffer();
      const warn: LogBuffer = new LogBuffer();
      info.info('download finished');
      warn.warn('download finished');
      expect(info.trace() === warn.trace()).assertFalse();
      expect(textFingerprint(info.trace()) === textFingerprint(warn.trace())).assertFalse();
      expect(info.lines[0]).assertEqual('INFO download finished');
      expect(warn.lines[0]).assertEqual('WARN download finished');
      expect(info.contains('WARN')).assertFalse();
      expect(warn.contains('INFO')).assertFalse();
    });

    /**
     * @tc.name   fingerprintChangesWithOrder
     * @tc.desc   Reordering two retained lines changes the fingerprint while counts stay equal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintChangesWithOrder', 0, () => {
      const left: LogBuffer = new LogBuffer();
      const right: LogBuffer = new LogBuffer();
      left.info('task A');
      left.info('task B');
      right.info('task B');
      right.info('task A');
      expect(left.size()).assertEqual(right.size());
      expect(left.countLevel(LEVEL_INFO)).assertEqual(right.countLevel(LEVEL_INFO));
      expect(left.trace() === right.trace()).assertFalse();
      expect(textFingerprint(left.trace()) === textFingerprint(right.trace())).assertFalse();
      expect(left.trace().startsWith('INFO task A')).assertTrue();
      expect(right.trace().startsWith('INFO task B')).assertTrue();
    });

    /**
     * @tc.name   emptyTraceFingerprintMatchesHash
     * @tc.desc   The empty buffer fingerprints the empty trace through the shared text hash.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('emptyTraceFingerprintMatchesHash', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      expect(buffer.trace()).assertEqual('');
      expect(textFingerprint(buffer.trace())).assertEqual(textFingerprint(''));
      expect(textFingerprint(buffer.trace())).assertEqual(216613);
      expect(textFingerprint(buffer.trace())).assertLarger(0);
      expect(buffer.size()).assertEqual(0);
      expect(textFingerprint(buffer.trace())).assertLess(1000003);
      buffer.info('first');
      expect(textFingerprint(buffer.trace()) === 216613).assertFalse();
    });

    /**
     * @tc.name   fingerprintMatchesRetainedTrace
     * @tc.desc   The fingerprint always describes the retained window, not the evicted prefix.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintMatchesRetainedTrace', 0, () => {
      const buffer: LogBuffer = new LogBuffer(2);
      buffer.info('a');
      buffer.info('b');
      buffer.info('c');
      const retained: string = buffer.trace();
      expect(retained).assertEqual('INFO b|INFO c');
      expect(textFingerprint(retained)).assertEqual(textFingerprint(joined(buffer.lines, '|')));
      expect(textFingerprint(retained) === textFingerprint('INFO a|INFO b')).assertFalse();
      expect(buffer.size()).assertEqual(2);
      expect(buffer.contains('a')).assertFalse();
      expect(textFingerprint(retained)).assertLess(1000003);
    });

    /**
     * @tc.name   redactedQueryLineHasNoToken
     * @tc.desc   A URL logged through redactQuery keeps the host and drops the token parameter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('redactedQueryLineHasNoToken', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      const url: string = URL_TASK_A + '?token=secret';
      buffer.info('GET ' + redactQuery(url));
      expect(buffer.size()).assertEqual(1);
      expect(buffer.contains('token')).assertFalse();
      expect(buffer.contains('secret')).assertFalse();
      expect(buffer.contains('?')).assertFalse();
      expect(buffer.lines[0]).assertEqual('INFO GET ' + URL_TASK_A);
      expect(buffer.lines[0].startsWith('INFO ')).assertTrue();
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
    });

    /**
     * @tc.name   redactedCredentialsLineHasNoPassword
     * @tc.desc   A URL logged through redactCredentials never shows the user or password text.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('redactedCredentialsLineHasNoPassword', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      const url: string = 'https://alice:hunter2@gitee.com/cases/a.png';
      buffer.warn('fetch ' + redactCredentials(url));
      expect(buffer.size()).assertEqual(1);
      expect(buffer.contains('hunter2')).assertFalse();
      expect(buffer.contains('alice')).assertFalse();
      expect(buffer.contains('***@gitee.com')).assertTrue();
      expect(buffer.lines[0]).assertEqual('WARN fetch https://***@gitee.com/cases/a.png');
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
    });

    /**
     * @tc.name   redactionKeepsHostAndPath
     * @tc.desc   Redacted logging still identifies the host and the file path for diagnosis.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('redactionKeepsHostAndPath', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      const url: string = 'https://user:pass@example.com/media/after_cache.png?x=1';
      const safe: string = redactQuery(redactCredentials(url));
      buffer.error('download failed for ' + safe);
      expect(buffer.contains('example.com')).assertTrue();
      expect(buffer.contains('/media/after_cache.png')).assertTrue();
      expect(buffer.contains('pass')).assertFalse();
      expect(buffer.contains('?x=1')).assertFalse();
      expect(hostOf(safe)).assertEqual('***@example.com');
      expect(pathOf(safe)).assertEqual('/media/after_cache.png');
      expect(buffer.lines[0].endsWith('/media/after_cache.png')).assertTrue();
    });

    /**
     * @tc.name   englishOnlyInfoLine
     * @tc.desc   The info message and its level prefix contain only ASCII characters.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('englishOnlyInfoLine', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('download finished for task A');
      const line: string = buffer.lines[0];
      let nonAscii: number = 0;
      for (let index = 0; index < line.length; index++) {
        if (line.charCodeAt(index) > 127) {
          nonAscii = nonAscii + 1;
        }
      }
      expect(nonAscii).assertEqual(0);
      expect(line).assertEqual('INFO download finished for task A');
      expect(line.indexOf('下载')).assertEqual(-1);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(buffer.contains('task A')).assertTrue();
      expect(line.length).assertEqual(33);
    });

    /**
     * @tc.name   englishOnlyWarnAndErrorLines
     * @tc.desc   The warn and error messages and the whole trace stay inside the ASCII range.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('englishOnlyWarnAndErrorLines', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.warn('gate still closed after poll');
      buffer.error('start failed with code 13400002');
      const trace: string = buffer.trace();
      let nonAscii: number = 0;
      for (let index = 0; index < trace.length; index++) {
        if (trace.charCodeAt(index) > 127) {
          nonAscii = nonAscii + 1;
        }
      }
      expect(nonAscii).assertEqual(0);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.contains('gate still closed')).assertTrue();
      expect(trace.indexOf('错误')).assertEqual(-1);
      expect(trace.split('|').length).assertEqual(2);
    });

    /**
     * @tc.name   errorLineCarriesNumericCode
     * @tc.desc   The failure line keeps the numeric BusinessError code for the incident report.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('errorLineCarriesNumericCode', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.error('start failed with code ' + String(13400002));
      expect(buffer.size()).assertEqual(1);
      expect(buffer.contains('13400002')).assertTrue();
      expect(buffer.contains('start failed')).assertTrue();
      expect(buffer.lines[0].endsWith('13400002')).assertTrue();
      expect(buffer.lines[0].indexOf('ERROR')).assertEqual(0);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
    });

    /**
     * @tc.name   limitOneKeepsLatestOnly
     * @tc.desc   A buffer limited to one line always exposes the most recent write.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferLogging scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('limitOneKeepsLatestOnly', 0, () => {
      const buffer: LogBuffer = new LogBuffer(1);
      buffer.info('old');
      expect(buffer.size()).assertEqual(1);
      buffer.warn('new');
      expect(buffer.size()).assertEqual(1);
      expect(buffer.lines[0]).assertEqual('WARN new');
      expect(buffer.levels[0]).assertEqual(LEVEL_WARN);
      expect(buffer.contains('old')).assertFalse();
      expect(buffer.trace()).assertEqual('WARN new');
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
    });

  });
}
