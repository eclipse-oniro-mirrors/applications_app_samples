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

/**
 * ResourceNotice suite.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   127      hilog.info after onCompleted fires
 *   131      hilog.info inside the onProgress callback
 *   135-136  hilog.error when task.start reports a business error
 *   145-146  hilog.error when agent.create rejects
 *   944-1000 LogBuffer: level prefixes, bounded eviction, counting, contains and trace
 *   182-201  redactQuery / redactCredentials used before a URL reaches a notice line
 *
 * The suite models the notice path of the sample: every download callback writes
 * one line, the buffer is bounded, and any URL copied into a notice must be
 * stripped of its query and user info first. Level accounting is asserted after
 * mixed bursts and after eviction, so a buffer that only stores the newest text
 * without its level cannot pass.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  URL_TASK_A,
  URL_TASK_B,
  URL_TASK_C,
  LEVEL_INFO,
  LEVEL_WARN,
  LEVEL_ERROR,
  LogBuffer,
  redactQuery,
  redactCredentials,
  hasQuery,
  countOf,
  joined,
  sameStringArray,
  fileNameOf,
  textFingerprint,
  progressLabel
} from '../Shared/SharedDriver';

const NOTICE_STARTED: string = '下载任务 A started';
const NOTICE_COMPLETED: string = '下载完成 A';

export default function resourceNoticeTest(): void {
  describe('ResourceNotice', () => {
    let buffer: LogBuffer = new LogBuffer();

    beforeAll(() => {
      logSuite('ResourceNotice', 'begin');
    });
    beforeEach(async () => {
      buffer = new LogBuffer();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('ResourceNotice', 'end');
    });

    /**
     * @tc.name   logBufferRecordsInfoLevel
     * @tc.desc   An info notice is stored with the INFO prefix and counted under that level only.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('logBufferRecordsInfoLevel', 0, () => {
      buffer.info(NOTICE_STARTED);
      logStep('logBufferRecordsInfoLevel', buffer.trace());
      expect(buffer.size()).assertEqual(1);
      expect(buffer.levels[0]).assertEqual(LEVEL_INFO);
      expect(buffer.lines[0]).assertEqual('INFO ' + NOTICE_STARTED);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(buffer.trace()).assertEqual('INFO ' + NOTICE_STARTED);
      expect(buffer.contains('下载任务')).assertTrue();
    });

    /**
     * @tc.name   logBufferRecordsWarnLevel
     * @tc.desc   A warning notice keeps the WARN prefix and does not count as info or error.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('logBufferRecordsWarnLevel', 0, () => {
      buffer.warn('retry scheduled for task B');
      logStep('logBufferRecordsWarnLevel', buffer.lines[0]);
      expect(buffer.size()).assertEqual(1);
      expect(buffer.levels[0]).assertEqual(LEVEL_WARN);
      expect(buffer.lines[0]).assertEqual('WARN retry scheduled for task B');
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(buffer.lines[0].startsWith('WARN ')).assertTrue();
      expect(buffer.contains('retry scheduled')).assertTrue();
      expect(LEVEL_WARN).assertEqual('WARN');
    });

    /**
     * @tc.name   logBufferRecordsErrorLevel
     * @tc.desc   A start failure notice is stored as ERROR and its message stays intact after the prefix.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('logBufferRecordsErrorLevel', 0, () => {
      buffer.error('Failed to task start with error code: 13400002');
      logStep('logBufferRecordsErrorLevel', buffer.lines[0]);
      expect(buffer.size()).assertEqual(1);
      expect(buffer.levels[0]).assertEqual(LEVEL_ERROR);
      expect(buffer.lines[0]).assertEqual('ERROR Failed to task start with error code: 13400002');
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(buffer.lines[0].indexOf('13400002')).assertLarger(0);
      expect(buffer.contains('error code')).assertTrue();
      expect(LEVEL_ERROR).assertEqual('ERROR');
    });

    /**
     * @tc.name   logBufferPrefixesEachLineWithLevel
     * @tc.desc   Every stored line begins with its own level word followed by a single space.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('logBufferPrefixesEachLineWithLevel', 0, () => {
      buffer.info(NOTICE_COMPLETED);
      buffer.warn('progress rollback ignored for B');
      buffer.error('create rejected for C');
      logStep('logBufferPrefixesEachLineWithLevel', buffer.trace());
      expect(buffer.size()).assertEqual(3);
      expect(buffer.lines[0].startsWith(LEVEL_INFO + ' ')).assertTrue();
      expect(buffer.lines[1].startsWith(LEVEL_WARN + ' ')).assertTrue();
      expect(buffer.lines[2].startsWith(LEVEL_ERROR + ' ')).assertTrue();
      expect(buffer.lines[0].indexOf(LEVEL_WARN)).assertEqual(-1);
      expect(buffer.lines[1].indexOf(LEVEL_ERROR)).assertEqual(-1);
      expect(sameStringArray(buffer.levels, [LEVEL_INFO, LEVEL_WARN, LEVEL_ERROR])).assertTrue();
      expect(buffer.lines[2].endsWith('for C')).assertTrue();
    });

    /**
     * @tc.name   logBufferCountsLevelsSeparately
     * @tc.desc   A mixed burst of six notices is counted per level without cross counting.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('logBufferCountsLevelsSeparately', 0, () => {
      buffer.info(NOTICE_STARTED);
      buffer.info(NOTICE_COMPLETED);
      buffer.warn('poll tick 1 without gate');
      buffer.error('start failed with 13400002');
      buffer.error('create failed with 13400001');
      buffer.error('timeout on task C');
      logStep('logBufferCountsLevelsSeparately', buffer.trace());
      expect(buffer.size()).assertEqual(6);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(3);
      expect(countOf(buffer.levels, LEVEL_ERROR)).assertEqual(3);
      expect(buffer.countLevel('DEBUG')).assertEqual(0);
      expect(buffer.countLevel(LEVEL_INFO) + buffer.countLevel(LEVEL_ERROR)).assertEqual(5);
      expect(buffer.levels.length).assertEqual(6);
    });

    /**
     * @tc.name   logBufferSizeGrowsWithEntries
     * @tc.desc   Five notices below the default limit produce five lines and five level entries.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('logBufferSizeGrowsWithEntries', 0, () => {
      for (let index = 0; index < 5; index++) {
        buffer.info('progress notice ' + String(index));
      }
      logStep('logBufferSizeGrowsWithEntries', String(buffer.size()));
      expect(buffer.size()).assertEqual(5);
      expect(buffer.lines.length).assertEqual(5);
      expect(buffer.levels.length).assertEqual(5);
      expect(buffer.trace().split('|').length).assertEqual(5);
      expect(buffer.limit).assertEqual(64);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(5);
      expect(buffer.contains('progress notice 4')).assertTrue();
      expect(buffer.contains('progress notice 5')).assertFalse();
    });

    /**
     * @tc.name   logBufferLimitsToConfiguredBound
     * @tc.desc   A buffer with limit four keeps exactly four lines after ten notices.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('logBufferLimitsToConfiguredBound', 0, () => {
      const bounded: LogBuffer = new LogBuffer(4);
      for (let index = 0; index < 10; index++) {
        bounded.info('notice ' + String(index));
      }
      logStep('logBufferLimitsToConfiguredBound', String(bounded.size()));
      expect(bounded.limit).assertEqual(4);
      expect(bounded.size()).assertEqual(4);
      expect(bounded.lines.length).assertEqual(4);
      expect(bounded.levels.length).assertEqual(4);
      expect(bounded.trace().split('|').length).assertEqual(4);
      expect(bounded.contains('notice 9')).assertTrue();
      expect(bounded.contains('notice 0')).assertFalse();
      expect(bounded.countLevel(LEVEL_INFO)).assertEqual(4);
    });

    /**
     * @tc.name   boundedBufferEvictsOldestEntries
     * @tc.desc   Overflow drops from the front, so the oldest message disappears before the second oldest.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('boundedBufferEvictsOldestEntries', 0, () => {
      const bounded: LogBuffer = new LogBuffer(3);
      bounded.info('first notice');
      bounded.info('second notice');
      bounded.info('third notice');
      bounded.info('fourth notice');
      logStep('boundedBufferEvictsOldestEntries', bounded.trace());
      expect(bounded.size()).assertEqual(3);
      expect(bounded.contains('first notice')).assertFalse();
      expect(bounded.contains('second notice')).assertTrue();
      expect(bounded.contains('third notice')).assertTrue();
      expect(bounded.contains('fourth notice')).assertTrue();
      expect(bounded.lines[0].indexOf('second notice')).assertLarger(0);
      expect(bounded.lines[2].endsWith('fourth notice')).assertTrue();
      expect(bounded.countLevel(LEVEL_INFO)).assertEqual(3);
    });

    /**
     * @tc.name   boundedBufferKeepsNewestAfterOverflow
     * @tc.desc   Eviction keeps the level array aligned with the surviving lines.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('boundedBufferKeepsNewestAfterOverflow', 0, () => {
      const bounded: LogBuffer = new LogBuffer(2);
      bounded.warn('old warning about task B');
      bounded.error('older error about task C');
      bounded.info('newest info about task A');
      logStep('boundedBufferKeepsNewestAfterOverflow', bounded.trace());
      expect(bounded.size()).assertEqual(2);
      expect(bounded.lines[0].startsWith(LEVEL_ERROR)).assertTrue();
      expect(bounded.lines[1].startsWith(LEVEL_INFO)).assertTrue();
      expect(bounded.levels[0]).assertEqual(LEVEL_ERROR);
      expect(bounded.levels[1]).assertEqual(LEVEL_INFO);
      expect(bounded.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(bounded.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(bounded.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(bounded.contains('old warning')).assertFalse();
    });

    /**
     * @tc.name   logBufferContainsMatchesFragment
     * @tc.desc   Substring search works inside the message body and across the level prefix.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('logBufferContainsMatchesFragment', 0, () => {
      buffer.info('task A ' + NOTICE_COMPLETED);
      buffer.warn('gate still closed after 3 polls');
      logStep('logBufferContainsMatchesFragment', String(buffer.size()));
      expect(buffer.contains('完成')).assertTrue();
      expect(buffer.contains('INFO ')).assertTrue();
      expect(buffer.contains('gate still closed')).assertTrue();
      expect(buffer.contains('after 3 polls')).assertTrue();
      expect(buffer.contains('WARN')).assertTrue();
      expect(buffer.contains('polls')).assertTrue();
      expect(buffer.contains('')).assertTrue();
      expect(buffer.contains('task A')).assertTrue();
    });

    /**
     * @tc.name   logBufferContainsRejectsMissingFragment
     * @tc.desc   Fragments that were never written, or differ only in case, are not found.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logBufferContainsRejectsMissingFragment', 0, () => {
      buffer.info('progress 40 percent');
      logStep('logBufferContainsRejectsMissingFragment', String(buffer.contains('ERROR')));
      expect(buffer.contains('ERROR')).assertFalse();
      expect(buffer.contains('WARN')).assertFalse();
      expect(buffer.contains('progress 41')).assertFalse();
      expect(buffer.contains('Progress')).assertFalse();
      expect(buffer.contains('percent ')).assertFalse();
      expect(buffer.contains('40 PERCENT')).assertFalse();
      expect(buffer.contains('下载')).assertFalse();
      expect(buffer.size()).assertEqual(1);
    });

    /**
     * @tc.name   logBufferTraceJoinsWithPipe
     * @tc.desc   The trace joins the stored lines with a single pipe in insertion order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('logBufferTraceJoinsWithPipe', 0, () => {
      buffer.info('alpha');
      buffer.warn('beta');
      buffer.error('gamma');
      logStep('logBufferTraceJoinsWithPipe', buffer.trace());
      expect(buffer.trace()).assertEqual('INFO alpha|WARN beta|ERROR gamma');
      expect(buffer.trace().split('|').length).assertEqual(3);
      expect(buffer.trace().indexOf('|')).assertEqual(10);
      expect(buffer.trace().startsWith('INFO alpha')).assertTrue();
      expect(buffer.trace().endsWith('ERROR gamma')).assertTrue();
      expect(buffer.trace().indexOf('beta')).assertLarger(0);
      expect(buffer.trace()).assertEqual(joined(buffer.lines, '|'));
      expect(buffer.lines.length).assertEqual(3);
    });

    /**
     * @tc.name   logBufferTraceOfEmptyIsEmpty
     * @tc.desc   An unused buffer traces to the empty string, matching the fingerprint seed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logBufferTraceOfEmptyIsEmpty', 0, () => {
      const empty: LogBuffer = new LogBuffer();
      logStep('logBufferTraceOfEmptyIsEmpty', String(empty.size()));
      expect(empty.trace()).assertEqual('');
      expect(empty.size()).assertEqual(0);
      expect(empty.lines.length).assertEqual(0);
      expect(empty.levels.length).assertEqual(0);
      expect(empty.trace().length).assertEqual(0);
      expect(textFingerprint(empty.trace())).assertEqual(216613);
      expect(empty.contains('anything')).assertFalse();
      expect(empty.countLevel(LEVEL_INFO)).assertEqual(0);
    });

    /**
     * @tc.name   logBufferClearResetsLinesAndLevels
     * @tc.desc   clear() empties both arrays so no stale level survives without a matching line.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('logBufferClearResetsLinesAndLevels', 0, () => {
      buffer.info(NOTICE_STARTED);
      buffer.error('create rejected');
      expect(buffer.size()).assertEqual(2);
      buffer.clear();
      logStep('logBufferClearResetsLinesAndLevels', buffer.trace());
      expect(buffer.size()).assertEqual(0);
      expect(buffer.lines.length).assertEqual(0);
      expect(buffer.levels.length).assertEqual(0);
      expect(buffer.trace()).assertEqual('');
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(buffer.contains('create rejected')).assertFalse();
      expect(buffer.limit).assertEqual(64);
    });

    /**
     * @tc.name   logBufferClearAllowsReuse
     * @tc.desc   After clear() the same buffer instance accepts a new session notice with a clean level count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('logBufferClearAllowsReuse', 0, () => {
      buffer.info(NOTICE_STARTED);
      buffer.info(NOTICE_COMPLETED);
      buffer.clear();
      buffer.warn('session restarted by the user');
      logStep('logBufferClearAllowsReuse', buffer.trace());
      expect(buffer.size()).assertEqual(1);
      expect(buffer.levels[0]).assertEqual(LEVEL_WARN);
      expect(buffer.lines[0]).assertEqual('WARN session restarted by the user');
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(buffer.contains(NOTICE_STARTED)).assertFalse();
      expect(buffer.trace().split('|').length).assertEqual(1);
      expect(buffer.limit).assertEqual(64);
    });

    /**
     * @tc.name   redactedTokenNeverAppearsInWarnLine
     * @tc.desc   A signed source is redacted before it reaches the buffer, so the token cannot be read back.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('redactedTokenNeverAppearsInWarnLine', 0, () => {
      const signed: string = URL_TASK_A + '?token=super-secret-token';
      expect(hasQuery(signed)).assertTrue();
      buffer.warn('slow source ' + redactQuery(signed));
      logStep('redactedTokenNeverAppearsInWarnLine', String(buffer.size()));
      expect(buffer.size()).assertEqual(1);
      expect(buffer.contains('super-secret-token')).assertFalse();
      expect(buffer.contains('token=')).assertFalse();
      expect(buffer.contains(redactQuery(signed))).assertTrue();
      expect(buffer.contains('favor_list_tea.png')).assertTrue();
      expect(buffer.lines[0].indexOf('?')).assertLess(0);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(signed.indexOf('super-secret-token')).assertLarger(0);
    });

    /**
     * @tc.name   redactedCredentialsLineMasksUserInfo
     * @tc.desc   A credentialed source is masked as ***@ before the error line is stored.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('redactedCredentialsLineMasksUserInfo', 0, () => {
      const guarded: string = 'https://robot:passw0rd@gitee.com/a/after_cache.png';
      buffer.error('create rejected for ' + redactCredentials(guarded));
      logStep('redactedCredentialsLineMasksUserInfo', buffer.lines[0]);
      expect(buffer.contains('passw0rd')).assertFalse();
      expect(buffer.contains('robot')).assertFalse();
      expect(buffer.contains('***@gitee.com')).assertTrue();
      expect(buffer.lines[0].startsWith('ERROR ')).assertTrue();
      expect(buffer.lines[0].endsWith('after_cache.png')).assertTrue();
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(buffer.lines[0].indexOf('://***@')).assertLarger(0);
    });

    /**
     * @tc.name   queryRedactionKeepsOriginVisible
     * @tc.desc   Redaction removes signature parameters while the host and drawable name stay in the notice.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryRedactionKeepsOriginVisible', 0, () => {
      const signed: string = URL_TASK_B + '?expires=1700&signature=abc';
      const clean: string = redactQuery(signed);
      buffer.info('source ' + clean);
      logStep('queryRedactionKeepsOriginVisible', buffer.lines[0]);
      expect(buffer.contains('gitee.com')).assertTrue();
      expect(buffer.contains('after_cache.png')).assertTrue();
      expect(buffer.contains('expires')).assertFalse();
      expect(buffer.contains('signature')).assertFalse();
      expect(buffer.contains('https://')).assertTrue();
      expect(fileNameOf(clean)).assertEqual('after_cache.png');
      expect(buffer.trace().indexOf('|')).assertLess(0);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
    });

    /**
     * @tc.name   warningAndErrorAccountingDiffer
     * @tc.desc   Two warnings and one error keep separate counters even though the buffer size is three.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('warningAndErrorAccountingDiffer', 0, () => {
      buffer.warn('poll without gate');
      buffer.warn('progress ignored');
      buffer.error('start failed');
      logStep('warningAndErrorAccountingDiffer', buffer.trace());
      expect(buffer.size()).assertEqual(3);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(2);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(buffer.countLevel(LEVEL_WARN) === buffer.countLevel(LEVEL_ERROR)).assertFalse();
      expect(buffer.lines[2].startsWith(LEVEL_ERROR)).assertTrue();
      expect(buffer.lines[0].startsWith(LEVEL_WARN)).assertTrue();
      expect(buffer.countLevel(LEVEL_WARN) - buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
    });

    /**
     * @tc.name   errorAccountingAfterMixedBurst
     * @tc.desc   A five notice burst with two errors and two infos sums back to the buffer size.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('errorAccountingAfterMixedBurst', 0, () => {
      buffer.info(NOTICE_STARTED);
      buffer.warn('gate closed after first poll');
      buffer.error('start failed with 13400002');
      buffer.error('create failed with 13400001');
      buffer.info(NOTICE_COMPLETED);
      logStep('errorAccountingAfterMixedBurst', String(buffer.size()));
      expect(buffer.size()).assertEqual(5);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(2);
      expect(buffer.countLevel(LEVEL_INFO) + buffer.countLevel(LEVEL_WARN) + buffer.countLevel(LEVEL_ERROR))
        .assertEqual(buffer.size());
      expect(buffer.levels.length).assertEqual(buffer.lines.length);
      expect(buffer.trace().split('|').length).assertEqual(5);
      expect(buffer.contains('13400001')).assertTrue();
    });

    /**
     * @tc.name   infoBurstDoesNotRaiseWarnCount
     * @tc.desc   Eight consecutive info notices leave the warn and error counters at zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('infoBurstDoesNotRaiseWarnCount', 0, () => {
      for (let index = 0; index < 8; index++) {
        buffer.info('progress callback ' + String(index));
      }
      logStep('infoBurstDoesNotRaiseWarnCount', String(buffer.countLevel(LEVEL_INFO)));
      expect(buffer.size()).assertEqual(8);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(8);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(buffer.countLevel('INFO ') ).assertEqual(0);
      expect(buffer.contains('progress callback 7')).assertTrue();
      expect(buffer.trace().split('|').length).assertEqual(8);
      expect(buffer.levels[0]).assertEqual(LEVEL_INFO);
    });

    /**
     * @tc.name   evictionKeepsLevelAlignment
     * @tc.desc   After eviction every surviving line still starts with the level stored at the same index.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('evictionKeepsLevelAlignment', 0, () => {
      const bounded: LogBuffer = new LogBuffer(3);
      bounded.error('first error dropped');
      bounded.info('second info kept');
      bounded.warn('third warning kept');
      bounded.error('fourth error kept');
      let aligned: number = 0;
      for (let index = 0; index < bounded.size(); index++) {
        if (bounded.lines[index].startsWith(bounded.levels[index] + ' ')) {
          aligned = aligned + 1;
        }
      }
      logStep('evictionKeepsLevelAlignment', String(aligned));
      expect(aligned).assertEqual(3);
      expect(bounded.size()).assertEqual(3);
      expect(bounded.levels.length).assertEqual(bounded.lines.length);
      expect(bounded.levels[0]).assertEqual(LEVEL_INFO);
      expect(bounded.levels[1]).assertEqual(LEVEL_WARN);
      expect(bounded.levels[2]).assertEqual(LEVEL_ERROR);
      expect(bounded.contains('first error dropped')).assertFalse();
      expect(bounded.contains('fourth error kept')).assertTrue();
    });

    /**
     * @tc.name   evictionDropsOldestLevelEntries
     * @tc.desc   When old lines leave the buffer their level entries leave the mirrored array as well.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('evictionDropsOldestLevelEntries', 0, () => {
      const bounded: LogBuffer = new LogBuffer(2);
      bounded.error('error one');
      bounded.error('error two');
      bounded.error('error three');
      bounded.info('info four');
      logStep('evictionDropsOldestLevelEntries', bounded.trace());
      expect(bounded.size()).assertEqual(2);
      expect(bounded.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(bounded.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(bounded.levels[0]).assertEqual(LEVEL_ERROR);
      expect(bounded.levels[1]).assertEqual(LEVEL_INFO);
      expect(bounded.contains('error one')).assertFalse();
      expect(bounded.contains('error two')).assertFalse();
      expect(bounded.lines[0].endsWith('error three')).assertTrue();
    });

    /**
     * @tc.name   limitOfOneKeepsOnlyLastLine
     * @tc.desc   A buffer with limit one behaves like a single slot and only reports the newest level.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('limitOfOneKeepsOnlyLastLine', 0, () => {
      const single: LogBuffer = new LogBuffer(1);
      single.info('info one');
      single.warn('warn two');
      single.error('error three');
      logStep('limitOfOneKeepsOnlyLastLine', single.trace());
      expect(single.size()).assertEqual(1);
      expect(single.lines.length).assertEqual(1);
      expect(single.levels.length).assertEqual(1);
      expect(single.levels[0]).assertEqual(LEVEL_ERROR);
      expect(single.lines[0]).assertEqual('ERROR error three');
      expect(single.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(single.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(single.contains('info one')).assertFalse();
    });

    /**
     * @tc.name   zeroLimitKeepsNothing
     * @tc.desc   A zero limit evicts the line immediately, so the buffer stays empty and consistent.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('zeroLimitKeepsNothing', 0, () => {
      const none: LogBuffer = new LogBuffer(0);
      none.info('dropped immediately');
      logStep('zeroLimitKeepsNothing', String(none.size()));
      expect(none.limit).assertEqual(0);
      expect(none.size()).assertEqual(0);
      expect(none.lines.length).assertEqual(0);
      expect(none.levels.length).assertEqual(0);
      expect(none.trace()).assertEqual('');
      expect(none.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(none.contains('dropped')).assertFalse();
      expect(none.trace().split('|').length).assertEqual(1);
    });

    /**
     * @tc.name   logBufferKeepsChineseNoticeText
     * @tc.desc   The production notice text is stored verbatim after the level prefix.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logBufferKeepsChineseNoticeText', 0, () => {
      buffer.info('下载完成 B');
      logStep('logBufferKeepsChineseNoticeText', buffer.lines[0]);
      expect(buffer.lines[0]).assertEqual('INFO 下载完成 B');
      expect(buffer.contains('下载完成')).assertTrue();
      expect(buffer.contains('B')).assertTrue();
      expect(buffer.lines[0].indexOf('下载完成')).assertEqual(5);
      expect(buffer.lines[0].length).assertEqual(11);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(buffer.trace()).assertEqual('INFO 下载完成 B');
      expect(buffer.size()).assertEqual(1);
    });

    /**
     * @tc.name   traceOrderPreservesInsertion
     * @tc.desc   The trace keeps call order instead of sorting lines by level or by text.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('traceOrderPreservesInsertion', 0, () => {
      buffer.error('zeta first');
      buffer.info('alpha second');
      buffer.warn('mu third');
      const trace: string = buffer.trace();
      logStep('traceOrderPreservesInsertion', trace);
      expect(trace.indexOf('zeta first')).assertLess(trace.indexOf('alpha second'));
      expect(trace.indexOf('alpha second')).assertLess(trace.indexOf('mu third'));
      expect(trace.split('|')[0]).assertEqual('ERROR zeta first');
      expect(trace.split('|')[2]).assertEqual('WARN mu third');
      expect(trace.startsWith('ERROR')).assertTrue();
      expect(trace.endsWith('mu third')).assertTrue();
      expect(buffer.levels[2]).assertEqual(LEVEL_WARN);
      expect(trace.indexOf('|')).assertLarger(0);
    });

    /**
     * @tc.name   logBufferLineCountsMatchTraceSegments
     * @tc.desc   The number of pipe separated trace segments always equals the reported buffer size.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('logBufferLineCountsMatchTraceSegments', 0, () => {
      buffer.info('one');
      buffer.warn('two');
      buffer.info('three');
      buffer.error('four');
      logStep('logBufferLineCountsMatchTraceSegments', String(buffer.size()));
      expect(buffer.size()).assertEqual(4);
      expect(buffer.trace().split('|').length).assertEqual(buffer.size());
      expect(buffer.lines.length).assertEqual(buffer.size());
      expect(buffer.levels.length).assertEqual(buffer.size());
      expect(buffer.trace()).assertEqual(joined(buffer.lines, '|'));
      expect(buffer.size()).assertEqual(buffer.lines.length);
      expect(buffer.countLevel(LEVEL_INFO) + buffer.countLevel(LEVEL_WARN) + buffer.countLevel(LEVEL_ERROR))
        .assertEqual(4);
      expect(buffer.trace().split('|')[3]).assertEqual('ERROR four');
    });

    /**
     * @tc.name   redactQueryOfNoticeUrlDropsSignature
     * @tc.desc   Logging the redacted form changes the trace fingerprint compared with the signed form.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('redactQueryOfNoticeUrlDropsSignature', 0, () => {
      const signed: string = URL_TASK_C + '?signature=deadbeef';
      const clean: string = redactQuery(signed);
      const before: number = textFingerprint('source ' + signed);
      buffer.info('source ' + clean);
      const after: number = textFingerprint(buffer.lines[0]);
      logStep('redactQueryOfNoticeUrlDropsSignature', String(before === after));
      expect(before === after).assertFalse();
      expect(buffer.contains('deadbeef')).assertFalse();
      expect(buffer.contains('signature')).assertFalse();
      expect(buffer.contains('icon_main_color.png')).assertTrue();
      expect(clean.length < signed.length).assertTrue();
      expect(buffer.trace().indexOf('?')).assertLess(0);
      expect(after).assertEqual(textFingerprint(buffer.trace()));
      expect(buffer.size()).assertEqual(1);
    });

    /**
     * @tc.name   credentialAndQueryRedactionCompose
     * @tc.desc   Query redaction followed by credential masking leaves a notice that exposes only origin and file.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('credentialAndQueryRedactionCompose', 0, () => {
      const guarded: string = 'https://builder:secret@gitee.com/a/after_cache.png?token=abc';
      const withoutQuery: string = redactQuery(guarded);
      const masked: string = redactCredentials(withoutQuery);
      buffer.warn('slow source ' + masked);
      logStep('credentialAndQueryRedactionCompose', masked);
      expect(masked).assertEqual('https://***@gitee.com/a/after_cache.png');
      expect(buffer.contains('secret')).assertFalse();
      expect(buffer.contains('builder')).assertFalse();
      expect(buffer.contains('token')).assertFalse();
      expect(buffer.contains('***@gitee.com')).assertTrue();
      expect(buffer.contains('after_cache.png')).assertTrue();
      expect(buffer.lines[0].indexOf('?')).assertLess(0);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
    });

    /**
     * @tc.name   noticeLevelConstantsAreDistinct
     * @tc.desc   The three level words differ, so per level counts can never collide.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('noticeLevelConstantsAreDistinct', 0, () => {
      logStep('noticeLevelConstantsAreDistinct', LEVEL_INFO + '/' + LEVEL_WARN + '/' + LEVEL_ERROR);
      expect(LEVEL_INFO === LEVEL_WARN).assertFalse();
      expect(LEVEL_WARN === LEVEL_ERROR).assertFalse();
      expect(LEVEL_INFO === LEVEL_ERROR).assertFalse();
      expect(LEVEL_INFO).assertEqual('INFO');
      expect(LEVEL_WARN).assertEqual('WARN');
      expect(LEVEL_ERROR).assertEqual('ERROR');
      expect(sameStringArray([LEVEL_INFO, LEVEL_WARN, LEVEL_ERROR], ['INFO', 'WARN', 'ERROR'])).assertTrue();
      expect(countOf([LEVEL_INFO, LEVEL_ERROR, LEVEL_INFO], LEVEL_INFO)).assertEqual(2);
    });

    /**
     * @tc.name   highVolumeLogKeepsBoundAndLatestMessage
     * @tc.desc   Fifty notices against a limit of ten keep exactly the last ten lines with their levels.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('highVolumeLogKeepsBoundAndLatestMessage', 0, () => {
      const bounded: LogBuffer = new LogBuffer(10);
      for (let index = 0; index < 40; index++) {
        bounded.info('poll tick ' + String(index));
      }
      for (let index = 0; index < 10; index++) {
        bounded.error('final error ' + String(index));
      }
      logStep('highVolumeLogKeepsBoundAndLatestMessage', bounded.trace());
      expect(bounded.size()).assertEqual(10);
      expect(bounded.countLevel(LEVEL_ERROR)).assertEqual(10);
      expect(bounded.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(bounded.contains('final error 9')).assertTrue();
      expect(bounded.contains('final error 10')).assertFalse();
      expect(bounded.contains('poll tick 39')).assertFalse();
      expect(bounded.levels.length).assertEqual(10);
      expect(bounded.lines[9]).assertEqual('ERROR final error 9');
    });

    /**
     * @tc.name   warnAndErrorShareTheSameBufferLimit
     * @tc.desc   Mixed severities share one bound, so warnings are evicted by later errors.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('warnAndErrorShareTheSameBufferLimit', 0, () => {
      const bounded: LogBuffer = new LogBuffer(3);
      bounded.warn('warn one');
      bounded.warn('warn two');
      bounded.error('error three');
      bounded.error('error four');
      logStep('warnAndErrorShareTheSameBufferLimit', bounded.trace());
      expect(bounded.size()).assertEqual(3);
      expect(bounded.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(bounded.countLevel(LEVEL_ERROR)).assertEqual(2);
      expect(bounded.contains('warn one')).assertFalse();
      expect(bounded.contains('warn two')).assertTrue();
      expect(bounded.trace().startsWith('WARN')).assertTrue();
      expect(bounded.trace().split('|').length).assertEqual(3);
      expect(bounded.limit).assertEqual(3);
    });

    /**
     * @tc.name   progressNoticeLinesUseTheRenderedLabel
     * @tc.desc   A progress row label is copied into the notice verbatim after the INFO prefix.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressNoticeLinesUseTheRenderedLabel', 0, () => {
      const label: string = progressLabel('A', 40);
      buffer.info(label);
      logStep('progressNoticeLinesUseTheRenderedLabel', buffer.lines[0]);
      expect(buffer.lines[0]).assertEqual('INFO ' + label);
      expect(buffer.contains('任务A当前进度 40%')).assertTrue();
      expect(buffer.contains('40%')).assertTrue();
      expect(buffer.lines[0].endsWith('%')).assertTrue();
      expect(buffer.lines[0].indexOf('任务A')).assertEqual(5);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(buffer.size()).assertEqual(1);
      expect(label.length).assertEqual(11);
    });

    /**
     * @tc.name   traceFingerprintChangesAfterNewNotice
     * @tc.desc   Each new notice changes the rolling fingerprint, and an unchanged buffer keeps it stable.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('traceFingerprintChangesAfterNewNotice', 0, () => {
      const empty: number = textFingerprint(buffer.trace());
      buffer.info('first notice');
      const first: number = textFingerprint(buffer.trace());
      const stable: number = textFingerprint(buffer.trace());
      buffer.warn('second notice');
      const second: number = textFingerprint(buffer.trace());
      logStep('traceFingerprintChangesAfterNewNotice', String(second));
      expect(empty).assertEqual(216613);
      expect(first === empty).assertFalse();
      expect(first).assertEqual(stable);
      expect(second === first).assertFalse();
      expect(second >= 0).assertTrue();
      expect(second < 1000003).assertTrue();
      expect(buffer.size()).assertEqual(2);
      expect(textFingerprint(buffer.trace())).assertEqual(second);
    });

    /**
     * @tc.name   logBufferLimitSurvivesTraffic
     * @tc.desc   The configured bound is readable before, during and after clear(), independent of content.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceNotice scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logBufferLimitSurvivesTraffic', 0, () => {
      const bounded: LogBuffer = new LogBuffer(5);
      for (let index = 0; index < 12; index++) {
        bounded.info('traffic ' + String(index));
      }
      expect(bounded.size()).assertEqual(5);
      expect(bounded.limit).assertEqual(5);
      bounded.clear();
      expect(bounded.size()).assertEqual(0);
      logStep('logBufferLimitSurvivesTraffic', String(bounded.limit));
      expect(bounded.limit).assertEqual(5);
      expect(bounded.trace()).assertEqual('');
      for (let index = 0; index < 8; index++) {
        bounded.warn('after clear ' + String(index));
      }
      expect(bounded.size()).assertEqual(5);
      expect(bounded.countLevel(LEVEL_WARN)).assertEqual(5);
      expect(bounded.contains('after clear 7')).assertTrue();
      expect(bounded.contains('traffic 11')).assertFalse();
      expect(bounded.limit).assertEqual(5);
    });
  });
}
