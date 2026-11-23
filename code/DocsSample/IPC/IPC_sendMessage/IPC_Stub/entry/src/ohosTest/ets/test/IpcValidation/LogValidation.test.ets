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
  LEVEL_INFO,
  LEVEL_WARN,
  LEVEL_ERROR,
  REQUEST_CODE,
  REQUEST_PAYLOAD,
  joined,
  countOf,
  uniqueStrings,
  textFingerprint,
  clampInt,
  LogBuffer,
  ServiceLifecycleModel,
  StubRemoteObjectModel,
  InProcessClient
} from '../Shared/SharedDriver';

const ALL_LEVELS: string[] = [LEVEL_INFO, LEVEL_WARN, LEVEL_ERROR];

function fillBuffer(buffer: LogBuffer, count: number, level: string = LEVEL_INFO): void {
  for (let index = 0; index < count; index++) {
    const line: string = 'line-' + String(index);
    if (level === LEVEL_WARN) {
      buffer.warn(line);
    } else if (level === LEVEL_ERROR) {
      buffer.error(line);
    } else {
      buffer.info(line);
    }
  }
}

function levelOf(line: string): string {
  const separator: number = line.indexOf(' ');
  return separator < 0 ? line : line.substring(0, separator);
}

function messageOf(line: string): string {
  const separator: number = line.indexOf(' ');
  return separator < 0 ? '' : line.substring(separator + 1);
}

function lineNumbers(buffer: LogBuffer): string {
  const messages: string[] = [];
  for (let index = 0; index < buffer.lines.length; index++) {
    messages.push(messageOf(buffer.lines[index]));
  }
  return joined(messages, ',');
}

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
     * @tc.name          logValidationEmptyBuffer
     * @tc.desc          A new log buffer is empty at every level.
     * @tc.precondition  The log buffer model is available.
     * @tc.steps         1. Construct a buffer.
     *                   2. Read the size and trace.
     *                   3. Count every level.
     * @tc.expected      The buffer reports zero for all accessors.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logValidationEmptyBuffer', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      logStep('logValidationEmptyBuffer', buffer.trace());
      expect(buffer.size()).assertEqual(0);
      expect(buffer.trace()).assertEqual('');
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(buffer.contains('anything')).assertFalse();
      expect(buffer.lines.length).assertEqual(0);
      expect(buffer.levels.length).assertEqual(0);
      expect(buffer.limit).assertEqual(64);
    });

    /**
     * @tc.name          logValidationInfoLineFormat
     * @tc.desc          An info line carries the INFO prefix and message.
     * @tc.precondition  A fresh log buffer exists.
     * @tc.steps         1. Write one info line.
     *                   2. Read the stored line.
     *                   3. Split the level and message.
     * @tc.expected      The line reads INFO followed by the message.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logValidationInfoLineFormat', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('service started');
      logStep('logValidationInfoLineFormat', buffer.trace());
      expect(buffer.size()).assertEqual(1);
      expect(buffer.lines[0]).assertEqual('INFO service started');
      expect(buffer.levels[0]).assertEqual(LEVEL_INFO);
      expect(levelOf(buffer.lines[0])).assertEqual('INFO');
      expect(messageOf(buffer.lines[0])).assertEqual('service started');
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(buffer.contains('service')).assertTrue();
      expect(buffer.lines[0].startsWith('INFO ')).assertTrue();
    });

    /**
     * @tc.name          logValidationWarnLineFormat
     * @tc.desc          A warn line carries the WARN prefix and message.
     * @tc.precondition  A fresh log buffer exists.
     * @tc.steps         1. Write one warn line.
     *                   2. Read the stored line.
     *                   3. Compare with the info format.
     * @tc.expected      The line reads WARN followed by the message.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logValidationWarnLineFormat', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.warn('slow request');
      logStep('logValidationWarnLineFormat', buffer.trace());
      expect(buffer.lines[0]).assertEqual('WARN slow request');
      expect(buffer.levels[0]).assertEqual(LEVEL_WARN);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(levelOf(buffer.lines[0])).assertEqual('WARN');
      expect(messageOf(buffer.lines[0])).assertEqual('slow request');
      expect(buffer.contains('slow')).assertTrue();
      expect(buffer.contains('INFO')).assertFalse();
    });

    /**
     * @tc.name          logValidationErrorLineFormat
     * @tc.desc          An error line carries the ERROR prefix and message.
     * @tc.precondition  A fresh log buffer exists.
     * @tc.steps         1. Write one error line.
     *                   2. Read the stored line.
     *                   3. Compare with the error constant.
     * @tc.expected      The line reads ERROR followed by the message.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logValidationErrorLineFormat', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.error('stub rejected request');
      logStep('logValidationErrorLineFormat', buffer.trace());
      expect(buffer.lines[0]).assertEqual('ERROR stub rejected request');
      expect(buffer.levels[0]).assertEqual(LEVEL_ERROR);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(levelOf(buffer.lines[0])).assertEqual('ERROR');
      expect(messageOf(buffer.lines[0])).assertEqual('stub rejected request');
      expect(buffer.contains('rejected')).assertTrue();
      expect(buffer.contains('WARN')).assertFalse();
    });

    /**
     * @tc.name          logValidationMixedLevelCounts
     * @tc.desc          Mixed writes are counted per level.
     * @tc.precondition  A fresh buffer exists.
     * @tc.steps         1. Write two info, two warn and one error line.
     *                   2. Count each level.
     *                   3. Compare the total size.
     * @tc.expected      Counts are two, two and one with a total of five.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationMixedLevelCounts', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('a');
      buffer.info('b');
      buffer.warn('c');
      buffer.warn('d');
      buffer.error('e');
      logStep('logValidationMixedLevelCounts', buffer.trace());
      expect(buffer.size()).assertEqual(5);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(2);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.countLevel('TRACE')).assertEqual(0);
      expect(buffer.levels.length).assertEqual(5);
      expect(buffer.lines.length).assertEqual(5);
      expect(buffer.countLevel(LEVEL_INFO) + buffer.countLevel(LEVEL_WARN) + buffer.countLevel(LEVEL_ERROR))
        .assertEqual(buffer.size());
      expect(buffer.contains('INFO a')).assertTrue();
      expect(buffer.contains('ERROR e')).assertTrue();
    });

    /**
     * @tc.name          logValidationTraceJoin
     * @tc.desc          The trace joins lines with a pipe separator.
     * @tc.precondition  A buffer with three lines exists.
     * @tc.steps         1. Write three lines.
     *                   2. Read the trace.
     *                   3. Split and compare segments.
     * @tc.expected      The trace has three ordered segments.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationTraceJoin', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('one');
      buffer.warn('two');
      buffer.error('three');
      const trace: string = buffer.trace();
      logStep('logValidationTraceJoin', trace);
      expect(trace.split('|').length).assertEqual(3);
      expect(trace.split('|')[0]).assertEqual('INFO one');
      expect(trace.split('|')[1]).assertEqual('WARN two');
      expect(trace.split('|')[2]).assertEqual('ERROR three');
      expect(trace.startsWith('INFO')).assertTrue();
      expect(trace.endsWith('three')).assertTrue();
      expect(buffer.size()).assertEqual(3);
      expect(joined(buffer.lines, '|')).assertEqual(trace);
    });

    /**
     * @tc.name          logValidationContainsFragments
     * @tc.desc          Fragment searches match inside messages and levels.
     * @tc.precondition  A buffer with known lines exists.
     * @tc.steps         1. Search for a message fragment.
     *                   2. Search for a level fragment.
     *                   3. Search for an absent fragment.
     * @tc.expected      Present fragments match and absent ones do not.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationContainsFragments', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('stub receive str is hello world');
      buffer.error('stub unknown code is 2');
      logStep('logValidationContainsFragments', buffer.trace());
      expect(buffer.contains('stub receive')).assertTrue();
      expect(buffer.contains('hello world')).assertTrue();
      expect(buffer.contains('unknown code')).assertTrue();
      expect(buffer.contains('ERROR')).assertTrue();
      expect(buffer.contains('INFO')).assertTrue();
      expect(buffer.contains('WARN')).assertFalse();
      expect(buffer.contains('missing')).assertFalse();
      expect(buffer.contains('code is 2')).assertTrue();
    });

    /**
     * @tc.name          logValidationClearEmpties
     * @tc.desc          clear empties both the level and line arrays.
     * @tc.precondition  A populated buffer exists.
     * @tc.steps         1. Write three lines.
     *                   2. Clear the buffer.
     *                   3. Read every accessor.
     * @tc.expected      The buffer reports empty after clear.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationClearEmpties', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('a');
      buffer.warn('b');
      buffer.error('c');
      const before: number = buffer.size();
      buffer.clear();
      logStep('logValidationClearEmpties', buffer.trace());
      expect(before).assertEqual(3);
      expect(buffer.size()).assertEqual(0);
      expect(buffer.lines.length).assertEqual(0);
      expect(buffer.levels.length).assertEqual(0);
      expect(buffer.trace()).assertEqual('');
      expect(buffer.contains('a')).assertFalse();
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(buffer.limit).assertEqual(64);
    });

    /**
     * @tc.name          logValidationLimitTrimming
     * @tc.desc          A full buffer drops the oldest lines when it overflows.
     * @tc.precondition  A buffer with a limit of four exists.
     * @tc.steps         1. Write six lines.
     *                   2. Read the stored lines.
     *                   3. Compare the retained messages.
     * @tc.expected      Only the last four lines remain.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationLimitTrimming', 0, () => {
      const buffer: LogBuffer = new LogBuffer(4);
      fillBuffer(buffer, 6);
      logStep('logValidationLimitTrimming', buffer.trace());
      expect(buffer.limit).assertEqual(4);
      expect(buffer.size()).assertEqual(4);
      expect(buffer.lines[0]).assertEqual('INFO line-2');
      expect(buffer.lines[3]).assertEqual('INFO line-5');
      expect(buffer.contains('line-0')).assertFalse();
      expect(buffer.contains('line-1')).assertFalse();
      expect(buffer.contains('line-5')).assertTrue();
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(4);
      expect(lineNumbers(buffer)).assertEqual('line-2,line-3,line-4,line-5');
    });

    /**
     * @tc.name          logValidationLimitOne
     * @tc.desc          A buffer with a limit of one keeps only the newest line.
     * @tc.precondition  A buffer with a limit of one exists.
     * @tc.steps         1. Write three lines.
     *                   2. Read the single stored line.
     *                   3. Confirm the level array size.
     * @tc.expected      Only line two remains.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationLimitOne', 0, () => {
      const buffer: LogBuffer = new LogBuffer(1);
      fillBuffer(buffer, 3);
      logStep('logValidationLimitOne', buffer.trace());
      expect(buffer.size()).assertEqual(1);
      expect(buffer.lines.length).assertEqual(1);
      expect(buffer.levels.length).assertEqual(1);
      expect(buffer.lines[0]).assertEqual('INFO line-2');
      expect(buffer.contains('line-0')).assertFalse();
      expect(buffer.contains('line-2')).assertTrue();
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(buffer.limit).assertEqual(1);
      expect(messageOf(buffer.lines[0])).assertEqual('line-2');
    });

    /**
     * @tc.name          logValidationLevelsParallel
     * @tc.desc          The level and line arrays stay index aligned.
     * @tc.precondition  A buffer with mixed levels exists.
     * @tc.steps         1. Write four lines.
     *                   2. Compare each level with its line prefix.
     *                   3. Confirm equal lengths.
     * @tc.expected      Each level matches the prefix of its line.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationLevelsParallel', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('i1');
      buffer.warn('w1');
      buffer.error('e1');
      buffer.info('i2');
      logStep('logValidationLevelsParallel', buffer.trace());
      expect(buffer.levels.length).assertEqual(buffer.lines.length);
      expect(buffer.levels[0]).assertEqual(levelOf(buffer.lines[0]));
      expect(buffer.levels[1]).assertEqual(levelOf(buffer.lines[1]));
      expect(buffer.levels[2]).assertEqual(levelOf(buffer.lines[2]));
      expect(buffer.levels[3]).assertEqual(levelOf(buffer.lines[3]));
      expect(buffer.levels[0]).assertEqual(LEVEL_INFO);
      expect(buffer.levels[1]).assertEqual(LEVEL_WARN);
      expect(buffer.levels[2]).assertEqual(LEVEL_ERROR);
      expect(countOf(buffer.levels, LEVEL_INFO)).assertEqual(2);
      expect(buffer.size()).assertEqual(4);
    });

    /**
     * @tc.name          logValidationCustomLimit
     * @tc.desc          A custom limit is honored exactly at its boundary.
     * @tc.precondition  A buffer with a limit of eight exists.
     * @tc.steps         1. Write eight lines.
     *                   2. Write a ninth line.
     *                   3. Compare the retained window.
     * @tc.expected      The buffer holds eight lines starting at line one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logValidationCustomLimit', 0, () => {
      const buffer: LogBuffer = new LogBuffer(8);
      fillBuffer(buffer, 8);
      const full: number = buffer.size();
      buffer.info('line-8');
      logStep('logValidationCustomLimit', buffer.trace());
      expect(full).assertEqual(8);
      expect(buffer.size()).assertEqual(8);
      expect(buffer.lines[0]).assertEqual('INFO line-1');
      expect(buffer.lines[7]).assertEqual('INFO line-8');
      expect(buffer.contains('line-0')).assertFalse();
      expect(buffer.contains('line-8')).assertTrue();
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(8);
      expect(buffer.limit).assertEqual(8);
      expect(buffer.levels.length).assertEqual(8);
    });

    /**
     * @tc.name          logValidationCountAfterTrim
     * @tc.desc          Level counts follow the retained window after trimming.
     * @tc.precondition  A small buffer exists.
     * @tc.steps         1. Write mixed levels beyond the limit.
     *                   2. Count each level.
     *                   3. Compare with the retained lines.
     * @tc.expected      Only retained levels are counted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logValidationCountAfterTrim', 0, () => {
      const buffer: LogBuffer = new LogBuffer(3);
      buffer.info('i0');
      buffer.warn('w1');
      buffer.error('e2');
      buffer.info('i3');
      buffer.info('i4');
      logStep('logValidationCountAfterTrim', buffer.trace());
      expect(buffer.size()).assertEqual(3);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.contains('e2')).assertTrue();
      expect(buffer.contains('i0')).assertFalse();
      expect(buffer.contains('w1')).assertFalse();
      expect(buffer.lines[0]).assertEqual('ERROR e2');
      expect(buffer.lines[2]).assertEqual('INFO i4');
      expect(buffer.levels[0]).assertEqual(LEVEL_ERROR);
    });

    /**
     * @tc.name          logValidationServiceLifecycleLogs
     * @tc.desc          The lifecycle model logs every transition.
     * @tc.precondition  A lifecycle model is available.
     * @tc.steps         1. Create, request, connect, disconnect and destroy.
     *                   2. Read the log buffer.
     *                   3. Compare the log lines.
     * @tc.expected      Five INFO lines reflect the five transitions.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationServiceLifecycleLogs', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(3);
      service.onConnect();
      service.onDisconnect();
      service.onDestroy();
      logStep('logValidationServiceLifecycleLogs', service.logs.trace());
      expect(service.logs.size()).assertEqual(5);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(5);
      expect(service.logs.lines[0]).assertEqual('INFO onCreate');
      expect(service.logs.lines[1]).assertEqual('INFO onRequest 3');
      expect(service.logs.lines[2]).assertEqual('INFO onConnect');
      expect(service.logs.lines[3]).assertEqual('INFO onDisconnect');
      expect(service.logs.lines[4]).assertEqual('INFO onDestroy');
      expect(service.logs.contains('onRequest 3')).assertTrue();
      expect(service.logs.limit).assertEqual(128);
    });

    /**
     * @tc.name          logValidationRequestIdInLog
     * @tc.desc          Request start identifiers appear in the log line.
     * @tc.precondition  A created lifecycle model exists.
     * @tc.steps         1. Request with identifier 17.
     *                   2. Read the log line.
     *                   3. Split the message text.
     * @tc.expected      The log line ends with the identifier.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationRequestIdInLog', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(17);
      const line: string = service.logs.lines[1];
      logStep('logValidationRequestIdInLog', line);
      expect(line).assertEqual('INFO onRequest 17');
      expect(line.endsWith('17')).assertTrue();
      expect(line.indexOf('onRequest')).assertLarger(0);
      expect(messageOf(line)).assertEqual('onRequest 17');
      expect(messageOf(line).split(' ').length).assertEqual(2);
      expect(messageOf(line).split(' ')[1]).assertEqual('17');
      expect(service.logs.contains('onRequest 17')).assertTrue();
      expect(service.logs.size()).assertEqual(2);
      expect(levelOf(line)).assertEqual(LEVEL_INFO);
    });

    /**
     * @tc.name          logValidationStubRejectionLogLines
     * @tc.desc          Stub rejections can be mirrored as warn and error lines.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send an unknown code.
     *                   2. Mirror the rejection into a buffer.
     *                   3. Inspect the buffer levels.
     * @tc.expected      The rejection is recorded at the requested level.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationStubRejectionLogLines', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      const buffer: LogBuffer = new LogBuffer(16);
      const result = client.send(2, REQUEST_PAYLOAD);
      buffer.warn('rejected code 2');
      buffer.error('handled=' + String(result.handled));
      logStep('logValidationStubRejectionLogLines', buffer.trace());
      expect(buffer.size()).assertEqual(2);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.lines[1]).assertEqual('ERROR handled=false');
      expect(buffer.contains('code 2')).assertTrue();
      expect(result.handled).assertFalse();
      expect(stub.requestCount()).assertEqual(1);
      expect(buffer.contains('INFO')).assertFalse();
    });

    /**
     * @tc.name          logValidationDuplicateLines
     * @tc.desc          Duplicate log lines are counted individually.
     * @tc.precondition  A fresh buffer exists.
     * @tc.steps         1. Write the same line three times.
     *                   2. Count the level and messages.
     *                   3. Deduplicate the lines.
     * @tc.expected      Three entries remain with one unique line.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationDuplicateLines', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('repeat');
      buffer.info('repeat');
      buffer.info('repeat');
      logStep('logValidationDuplicateLines', buffer.trace());
      expect(buffer.size()).assertEqual(3);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(3);
      expect(countOf(buffer.lines, 'INFO repeat')).assertEqual(3);
      expect(uniqueStrings(buffer.lines).length).assertEqual(1);
      expect(uniqueStrings(buffer.lines)[0]).assertEqual('INFO repeat');
      expect(buffer.contains('repeat')).assertTrue();
      expect(buffer.lines[0]).assertEqual(buffer.lines[2]);
      expect(buffer.levels[0]).assertEqual(buffer.levels[2]);
    });

    /**
     * @tc.name          logValidationUniqueMessages
     * @tc.desc          Distinct messages remain distinct after deduplication.
     * @tc.precondition  A buffer with distinct messages exists.
     * @tc.steps         1. Write three distinct messages.
     *                   2. Deduplicate the lines.
     *                   3. Compare the count.
     * @tc.expected      Three unique lines remain.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationUniqueMessages', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('alpha');
      buffer.info('beta');
      buffer.info('gamma');
      logStep('logValidationUniqueMessages', buffer.trace());
      expect(buffer.size()).assertEqual(3);
      expect(uniqueStrings(buffer.lines).length).assertEqual(3);
      expect(buffer.contains('alpha')).assertTrue();
      expect(buffer.contains('beta')).assertTrue();
      expect(buffer.contains('gamma')).assertTrue();
      expect(lineNumbers(buffer)).assertEqual('alpha,beta,gamma');
      expect(buffer.lines[0] === buffer.lines[1]).assertFalse();
      expect(buffer.levels.length).assertEqual(3);
    });

    /**
     * @tc.name          logValidationEmptyMessage
     * @tc.desc          An empty message still produces a level prefixed line.
     * @tc.precondition  A fresh buffer exists.
     * @tc.steps         1. Write an empty info message.
     *                   2. Read the stored line.
     *                   3. Check the message length.
     * @tc.expected      The line is INFO plus a trailing space.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logValidationEmptyMessage', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('');
      logStep('logValidationEmptyMessage', '[' + buffer.trace() + ']');
      expect(buffer.size()).assertEqual(1);
      expect(buffer.lines[0]).assertEqual('INFO ');
      expect(buffer.lines[0].length).assertEqual(5);
      expect(messageOf(buffer.lines[0])).assertEqual('');
      expect(levelOf(buffer.lines[0])).assertEqual('INFO');
      expect(buffer.contains('INFO')).assertTrue();
      expect(buffer.contains('WARN')).assertFalse();
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(buffer.lines[0].endsWith(' ')).assertTrue();
    });

    /**
     * @tc.name          logValidationMessageWithSpaces
     * @tc.desc          Messages with inner spaces keep the full text.
     * @tc.precondition  A fresh buffer exists.
     * @tc.steps         1. Write a spaced message.
     *                   2. Split the line once.
     *                   3. Compare the message fragment.
     * @tc.expected      Only the first space separates the level.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logValidationMessageWithSpaces', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.warn('stub receive str is hello world');
      logStep('logValidationMessageWithSpaces', buffer.trace());
      expect(buffer.lines[0]).assertEqual('WARN stub receive str is hello world');
      expect(messageOf(buffer.lines[0])).assertEqual('stub receive str is hello world');
      expect(messageOf(buffer.lines[0]).split(' ').length).assertEqual(6);
      expect(messageOf(buffer.lines[0]).startsWith('stub')).assertTrue();
      expect(messageOf(buffer.lines[0]).endsWith('world')).assertTrue();
      expect(levelOf(buffer.lines[0])).assertEqual('WARN');
      expect(buffer.lines[0].split(' ').length).assertEqual(7);
      expect(buffer.contains('hello world')).assertTrue();
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
    });

    /**
     * @tc.name          logValidationFingerprint
     * @tc.desc          Log traces fingerprint deterministically.
     * @tc.precondition  The textFingerprint helper is available.
     * @tc.steps         1. Build two identical buffers.
     *                   2. Compare fingerprints.
     *                   3. Diverge one buffer.
     * @tc.expected      Identical traces match and diverged ones do not.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logValidationFingerprint', 0, () => {
      const first: LogBuffer = new LogBuffer();
      const second: LogBuffer = new LogBuffer();
      first.info('a');
      first.warn('b');
      second.info('a');
      second.warn('b');
      const baseline: number = textFingerprint(first.trace());
      second.error('c');
      logStep('logValidationFingerprint', String(baseline));
      expect(baseline).assertEqual(textFingerprint(second.trace().split('|')[0] + '|' + second.trace().split('|')[1]));
      expect(baseline === textFingerprint(second.trace())).assertFalse();
      expect(baseline).assertLarger(0);
      expect(baseline).assertLess(1000003);
      expect(textFingerprint('')).assertEqual(216613);
      expect(textFingerprint(first.trace())).assertEqual(baseline);
      expect(second.size()).assertEqual(3);
      expect(first.size()).assertEqual(2);
      expect(first.trace()).assertEqual('INFO a|WARN b');
    });

    /**
     * @tc.name          logValidationLevelConstants
     * @tc.desc          The level constants are the documented upper case tokens.
     * @tc.precondition  The level constants are loaded.
     * @tc.steps         1. Compare each constant with a literal.
     *                   2. Compare their lengths.
     *                   3. Confirm uniqueness.
     * @tc.expected      INFO, WARN and ERROR are distinct literals.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationLevelConstants', 0, () => {
      logStep('logValidationLevelConstants', joined(ALL_LEVELS, ','));
      expect(LEVEL_INFO).assertEqual('INFO');
      expect(LEVEL_WARN).assertEqual('WARN');
      expect(LEVEL_ERROR).assertEqual('ERROR');
      expect(LEVEL_INFO.length).assertEqual(4);
      expect(LEVEL_WARN.length).assertEqual(4);
      expect(LEVEL_ERROR.length).assertEqual(5);
      expect(uniqueStrings(ALL_LEVELS).length).assertEqual(3);
      expect(countOf(ALL_LEVELS, LEVEL_INFO)).assertEqual(1);
      expect(ALL_LEVELS[2]).assertEqual(LEVEL_ERROR);
    });

    /**
     * @tc.name          logValidationLifecycleLogLimit
     * @tc.desc          The lifecycle log buffer keeps the newest 128 lines.
     * @tc.precondition  A lifecycle model with a large log limit exists.
     * @tc.steps         1. Exceed the log limit with requests.
     *                   2. Read the size and limit.
     *                   3. Confirm the oldest lines are gone.
     * @tc.expected      The buffer holds 128 lines and the first line is recent.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logValidationLifecycleLogLimit', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      for (let index = 0; index < 130; index++) {
        service.onRequest(index);
      }
      logStep('logValidationLifecycleLogLimit', String(service.logs.size()));
      expect(service.logs.limit).assertEqual(128);
      expect(service.logs.size()).assertEqual(128);
      expect(service.logs.lines.length).assertEqual(128);
      expect(service.logs.levels.length).assertEqual(128);
      expect(service.logs.lines.indexOf('INFO onRequest 1') >= 0).assertFalse();
      expect(service.logs.contains('onRequest 129')).assertTrue();
      expect(service.logs.lines[0]).assertEqual('INFO onRequest 2');
      expect(service.logs.lines[127]).assertEqual('INFO onRequest 129');
      expect(service.requestCount).assertEqual(130);
    });

    /**
     * @tc.name          logValidationAlternateLevelsTrace
     * @tc.desc          Alternating levels produce an ordered level trace.
     * @tc.precondition  A fresh buffer exists.
     * @tc.steps         1. Write alternating levels.
     *                   2. Read the level array.
     *                   3. Compare with expectations.
     * @tc.expected      Levels alternate INFO, WARN, ERROR.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationAlternateLevelsTrace', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('one');
      buffer.warn('two');
      buffer.error('three');
      buffer.info('four');
      buffer.warn('five');
      buffer.error('six');
      logStep('logValidationAlternateLevelsTrace', joined(buffer.levels, '>'));
      expect(buffer.levels.length).assertEqual(6);
      expect(buffer.levels[0]).assertEqual(LEVEL_INFO);
      expect(buffer.levels[1]).assertEqual(LEVEL_WARN);
      expect(buffer.levels[2]).assertEqual(LEVEL_ERROR);
      expect(buffer.levels[3]).assertEqual(LEVEL_INFO);
      expect(countOf(buffer.levels, LEVEL_INFO)).assertEqual(2);
      expect(countOf(buffer.levels, LEVEL_WARN)).assertEqual(2);
      expect(countOf(buffer.levels, LEVEL_ERROR)).assertEqual(2);
      expect(buffer.size()).assertEqual(6);
    });

    /**
     * @tc.name          logValidationClearThenWrite
     * @tc.desc          Writing after a clear starts a fresh buffer.
     * @tc.precondition  A cleared buffer exists.
     * @tc.steps         1. Write, clear and write again.
     *                   2. Read the line.
     *                   3. Confirm the level counts.
     * @tc.expected      Only the post clear line remains.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationClearThenWrite', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('old');
      buffer.clear();
      buffer.error('new');
      logStep('logValidationClearThenWrite', buffer.trace());
      expect(buffer.size()).assertEqual(1);
      expect(buffer.lines[0]).assertEqual('ERROR new');
      expect(buffer.levels[0]).assertEqual(LEVEL_ERROR);
      expect(buffer.contains('old')).assertFalse();
      expect(buffer.contains('new')).assertTrue();
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.trace()).assertEqual('ERROR new');
      expect(buffer.limit).assertEqual(64);
    });

    /**
     * @tc.name          logValidationInfoAfterError
     * @tc.desc          Order is preserved across different levels.
     * @tc.precondition  A fresh buffer exists.
     * @tc.steps         1. Write error then info.
     *                   2. Read both lines.
     *                   3. Confirm the order.
     * @tc.expected      The error line precedes the info line.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationInfoAfterError', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.error('first');
      buffer.info('second');
      logStep('logValidationInfoAfterError', buffer.trace());
      expect(buffer.lines[0]).assertEqual('ERROR first');
      expect(buffer.lines[1]).assertEqual('INFO second');
      expect(buffer.levels[0]).assertEqual(LEVEL_ERROR);
      expect(buffer.levels[1]).assertEqual(LEVEL_INFO);
      expect(buffer.trace().indexOf('ERROR')).assertEqual(0);
      expect(buffer.trace().indexOf('INFO')).assertLarger(0);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(buffer.size()).assertEqual(2);
    });

    /**
     * @tc.name          logValidationLongMessage
     * @tc.desc          A long message is stored without truncation.
     * @tc.precondition  A fresh buffer exists.
     * @tc.steps         1. Build a 200 character message.
     *                   2. Write it as an info line.
     *                   3. Compare the lengths.
     * @tc.expected      The stored line length equals the prefix plus message.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logValidationLongMessage', 0, () => {
      let message = '';
      for (let index = 0; index < 20; index++) {
        message = message + '0123456789';
      }
      const buffer: LogBuffer = new LogBuffer();
      buffer.info(message);
      logStep('logValidationLongMessage', String(buffer.lines[0].length));
      expect(message.length).assertEqual(200);
      expect(buffer.size()).assertEqual(1);
      expect(buffer.lines[0].length).assertEqual(205);
      expect(buffer.lines[0].startsWith('INFO ')).assertTrue();
      expect(messageOf(buffer.lines[0])).assertEqual(message);
      expect(messageOf(buffer.lines[0]).length).assertEqual(200);
      expect(buffer.contains('0123456789')).assertTrue();
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(clampInt(buffer.lines[0].length, 0, 205)).assertEqual(205);
    });

    /**
     * @tc.name          logValidationUnicodeMessage
     * @tc.desc          A unicode message is stored without loss.
     * @tc.precondition  A fresh buffer exists.
     * @tc.steps         1. Write a unicode message at warn level.
     *                   2. Read the line.
     *                   3. Compare with the source message.
     * @tc.expected      The message fragment equals the unicode source.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logValidationUnicodeMessage', 0, () => {
      const message: string = '收到消息 hello 世界';
      const buffer: LogBuffer = new LogBuffer();
      buffer.warn(message);
      logStep('logValidationUnicodeMessage', buffer.trace());
      expect(buffer.size()).assertEqual(1);
      expect(messageOf(buffer.lines[0])).assertEqual(message);
      expect(buffer.lines[0]).assertEqual('WARN ' + message);
      expect(buffer.contains('世界')).assertTrue();
      expect(buffer.contains('hello')).assertTrue();
      expect(levelOf(buffer.lines[0])).assertEqual(LEVEL_WARN);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(message.length).assertLarger(10);
      expect(buffer.lines[0].length).assertEqual(message.length + 5);
    });

    /**
     * @tc.name          logValidationLevelOrderIndependent
     * @tc.desc          Counting a level is independent of write order.
     * @tc.precondition  Two buffers with the same lines exist.
     * @tc.steps         1. Write the same lines in different orders.
     *                   2. Compare the level counts.
     *                   3. Compare the traces.
     * @tc.expected      Counts match while traces differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logValidationLevelOrderIndependent', 0, () => {
      const first: LogBuffer = new LogBuffer();
      const second: LogBuffer = new LogBuffer();
      first.info('a');
      first.error('b');
      second.error('b');
      second.info('a');
      logStep('logValidationLevelOrderIndependent', first.trace());
      expect(first.countLevel(LEVEL_INFO)).assertEqual(second.countLevel(LEVEL_INFO));
      expect(first.countLevel(LEVEL_ERROR)).assertEqual(second.countLevel(LEVEL_ERROR));
      expect(first.countLevel(LEVEL_WARN)).assertEqual(second.countLevel(LEVEL_WARN));
      expect(first.trace() === second.trace()).assertFalse();
      expect(first.size()).assertEqual(second.size());
      expect(first.lines[0]).assertEqual('INFO a');
      expect(second.lines[0]).assertEqual('ERROR b');
      expect(textFingerprint(first.trace()) === textFingerprint(second.trace())).assertFalse();
    });

    /**
     * @tc.name          logValidationCountUnknownLevel
     * @tc.desc          Counting an unrecorded level returns zero.
     * @tc.precondition  A buffer with info lines exists.
     * @tc.steps         1. Count TRACE, DEBUG and FATAL.
     *                   2. Count INFO again.
     *                   3. Compare the results.
     * @tc.expected      Unknown levels count zero while INFO counts its lines.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationCountUnknownLevel', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('a');
      buffer.info('b');
      logStep('logValidationCountUnknownLevel', String(buffer.countLevel('TRACE')));
      expect(buffer.countLevel('TRACE')).assertEqual(0);
      expect(buffer.countLevel('DEBUG')).assertEqual(0);
      expect(buffer.countLevel('FATAL')).assertEqual(0);
      expect(buffer.countLevel('info')).assertEqual(0);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(buffer.countLevel('')).assertEqual(0);
      expect(buffer.size()).assertEqual(2);
      expect(buffer.levels[0]).assertEqual(LEVEL_INFO);
      expect(countOf(buffer.levels, LEVEL_INFO)).assertEqual(2);
    });

    /**
     * @tc.name          logValidationPipelineLevels
     * @tc.desc          A pipeline of levels tracks each stage separately.
     * @tc.precondition  A fresh buffer exists.
     * @tc.steps         1. Log receive, warn and error stages.
     *                   2. Count each level.
     *                   3. Confirm the stage order.
     * @tc.expected      The stages appear in order with one entry each.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationPipelineLevels', 0, () => {
      const buffer: LogBuffer = new LogBuffer(8);
      buffer.info('receive hello world');
      buffer.info('dispatch code 1');
      buffer.warn('reply slow');
      buffer.error('reply failed');
      logStep('logValidationPipelineLevels', buffer.trace());
      expect(buffer.size()).assertEqual(4);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.lines[0]).assertEqual('INFO receive hello world');
      expect(buffer.lines[2]).assertEqual('WARN reply slow');
      expect(buffer.lines[3]).assertEqual('ERROR reply failed');
      expect(buffer.contains('dispatch')).assertTrue();
      expect(buffer.contains('failed')).assertTrue();
    });

    /**
     * @tc.name          logValidationBufferReuse
     * @tc.desc          A cleared buffer can be reused repeatedly.
     * @tc.precondition  A reusable buffer exists.
     * @tc.steps         1. Fill, clear and refill the buffer twice.
     *                   2. Confirm the size after each cycle.
     *                   3. Check the final trace.
     * @tc.expected      Each cycle starts from an empty buffer.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logValidationBufferReuse', 0, () => {
      const buffer: LogBuffer = new LogBuffer(4);
      fillBuffer(buffer, 3);
      const firstCycle: number = buffer.size();
      buffer.clear();
      const cleared: number = buffer.size();
      fillBuffer(buffer, 2, LEVEL_WARN);
      logStep('logValidationBufferReuse', buffer.trace());
      expect(firstCycle).assertEqual(3);
      expect(cleared).assertEqual(0);
      expect(buffer.size()).assertEqual(2);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(2);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(buffer.lines[0]).assertEqual('WARN line-0');
      expect(buffer.lines[1]).assertEqual('WARN line-1');
      expect(buffer.limit).assertEqual(4);
      expect(buffer.levels.length).assertEqual(2);
    });

    /**
     * @tc.name          logValidationLimitMatrix
     * @tc.desc          Different limits retain the expected window sizes.
     * @tc.precondition  The log buffer constructor accepts a limit.
     * @tc.steps         1. Build buffers with limits two, three and five.
     *                   2. Fill each with six lines.
     *                   3. Compare the sizes.
     * @tc.expected      Sizes equal the configured limits.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logValidationLimitMatrix', 0, () => {
      const two: LogBuffer = new LogBuffer(2);
      const three: LogBuffer = new LogBuffer(3);
      const five: LogBuffer = new LogBuffer(5);
      fillBuffer(two, 6);
      fillBuffer(three, 6);
      fillBuffer(five, 6);
      logStep('logValidationLimitMatrix', String(two.size()) + '/' + String(five.size()));
      expect(two.size()).assertEqual(2);
      expect(three.size()).assertEqual(3);
      expect(five.size()).assertEqual(5);
      expect(two.lines[0]).assertEqual('INFO line-4');
      expect(three.lines[0]).assertEqual('INFO line-3');
      expect(five.lines[0]).assertEqual('INFO line-1');
      expect(two.limit).assertEqual(2);
      expect(five.limit).assertEqual(5);
      expect(countOf([String(two.size()), String(three.size()), String(five.size())], '5')).assertEqual(1);
    });

    /**
     * @tc.name          logValidationTrimBoundaryExact
     * @tc.desc          Writing exactly to the limit does not trim.
     * @tc.precondition  A buffer with a limit of three exists.
     * @tc.steps         1. Write exactly three lines.
     *                   2. Write a fourth line.
     *                   3. Compare the retained windows.
     * @tc.expected      The exact fill keeps all lines and the fourth trims one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logValidationTrimBoundaryExact', 0, () => {
      const buffer: LogBuffer = new LogBuffer(3);
      fillBuffer(buffer, 3);
      const exact: string = buffer.trace();
      buffer.info('line-3');
      logStep('logValidationTrimBoundaryExact', buffer.trace());
      expect(exact).assertEqual('INFO line-0|INFO line-1|INFO line-2');
      expect(buffer.size()).assertEqual(3);
      expect(buffer.contains('line-0')).assertFalse();
      expect(buffer.contains('line-1')).assertTrue();
      expect(buffer.contains('line-3')).assertTrue();
      expect(buffer.lines[2]).assertEqual('INFO line-3');
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(3);
      expect(buffer.trace().split('|').length).assertEqual(3);
      expect(buffer.limit).assertEqual(3);
    });

    /**
     * @tc.name          logValidationTraceSplitCount
     * @tc.desc          The trace segment count equals the buffer size.
     * @tc.precondition  A buffer with five lines exists.
     * @tc.steps         1. Write five lines.
     *                   2. Split the trace.
     *                   3. Compare the count with size.
     * @tc.expected      The split count equals the buffer size.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationTraceSplitCount', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('a');
      buffer.info('b');
      buffer.warn('c');
      buffer.error('d');
      buffer.warn('e');
      logStep('logValidationTraceSplitCount', buffer.trace());
      expect(buffer.size()).assertEqual(5);
      expect(buffer.trace().split('|').length).assertEqual(5);
      expect(buffer.trace().split('|')[4]).assertEqual('WARN e');
      expect(countOf(buffer.trace().split('|'), 'WARN c')).assertEqual(1);
      expect(buffer.levels.length).assertEqual(5);
      expect(buffer.lines.length).assertEqual(5);
      expect(buffer.trace().indexOf('ERROR')).assertLarger(0);
      expect(buffer.trace().startsWith('INFO a')).assertTrue();
      expect(buffer.trace().endsWith('WARN e')).assertTrue();
    });

    /**
     * @tc.name          logValidationLifecycleWarnErrors
     * @tc.desc          The lifecycle log buffer accepts manual warn entries.
     * @tc.precondition  A lifecycle model exists.
     * @tc.steps         1. Log a manual warn and error.
     *                   2. Count each level.
     *                   3. Compare with the lifecycle info lines.
     * @tc.expected      Manual entries coexist with lifecycle info lines.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logValidationLifecycleWarnErrors', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      service.logs.warn('stub slow');
      service.logs.error('stub failed');
      logStep('logValidationLifecycleWarnErrors', service.logs.trace());
      expect(service.logs.size()).assertEqual(3);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(service.logs.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(service.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(service.logs.contains('onCreate')).assertTrue();
      expect(service.logs.contains('stub slow')).assertTrue();
      expect(service.logs.contains('stub failed')).assertTrue();
      expect(service.logs.lines[1]).assertEqual('WARN stub slow');
      expect(service.logs.lines[2]).assertEqual('ERROR stub failed');
    });

    /**
     * @tc.name          logValidationServiceLogClear
     * @tc.desc          Clearing the lifecycle log buffer keeps counters intact.
     * @tc.precondition  A lifecycle model with logs exists.
     * @tc.steps         1. Create and connect.
     *                   2. Clear the logs.
     *                   3. Compare logs with counters.
     * @tc.expected      Logs clear while the lifecycle counters persist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logValidationServiceLogClear', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      const before: number = service.logs.size();
      service.logs.clear();
      logStep('logValidationServiceLogClear', String(service.logs.size()));
      expect(before).assertEqual(2);
      expect(service.logs.size()).assertEqual(0);
      expect(service.logs.trace()).assertEqual('');
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(service.connectCount).assertEqual(1);
      expect(service.events.size()).assertEqual(2);
      expect(service.state).assertEqual('connected');
      expect(service.isAlive()).assertTrue();
      expect(service.logs.limit).assertEqual(128);
    });

    /**
     * @tc.name          logValidationRecordingStubRequests
     * @tc.desc          Stub request traffic can be recorded as info lines.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send two requests.
     *                   2. Record each text as an info line.
     *                   3. Compare counts.
     * @tc.expected      Two info lines mirror two handled requests.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationRecordingStubRequests', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      const buffer: LogBuffer = new LogBuffer(32);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      buffer.info('request ' + String(stub.requestCount()));
      buffer.info('replies ' + String(client.replies.length));
      logStep('logValidationRecordingStubRequests', buffer.trace());
      expect(buffer.size()).assertEqual(2);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(buffer.contains('request 2')).assertTrue();
      expect(buffer.contains('replies 2')).assertTrue();
      expect(stub.requestCount()).assertEqual(2);
      expect(client.replies.length).assertEqual(2);
      expect(buffer.lines[0]).assertEqual('INFO request 2');
      expect(buffer.lines[1]).assertEqual('INFO replies 2');
      expect(buffer.limit).assertEqual(32);
    });

    /**
     * @tc.name          logValidationSummaryCounts
     * @tc.desc          A summary line reports the three level counts.
     * @tc.precondition  A buffer with mixed levels exists.
     * @tc.steps         1. Write known levels.
     *                   2. Compose the summary.
     *                   3. Compare each field.
     * @tc.expected      The summary reports two, one and one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationSummaryCounts', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('a');
      buffer.info('b');
      buffer.warn('c');
      buffer.error('d');
      const summary: string = String(buffer.countLevel(LEVEL_INFO)) + '/' + String(buffer.countLevel(LEVEL_WARN)) + '/' +
        String(buffer.countLevel(LEVEL_ERROR));
      logStep('logValidationSummaryCounts', summary);
      expect(summary).assertEqual('2/1/1');
      expect(summary.split('/').length).assertEqual(3);
      expect(summary.split('/')[0]).assertEqual('2');
      expect(summary.split('/')[2]).assertEqual('1');
      expect(buffer.size()).assertEqual(4);
      expect(buffer.levels.length).assertEqual(4);
      expect(buffer.contains('ERROR d')).assertTrue();
      expect(buffer.contains('WARN c')).assertTrue();
      expect(uniqueStrings(buffer.lines).length).assertEqual(4);
    });

    /**
     * @tc.name          logValidationMessageBoundaries
     * @tc.desc          Single character and long messages are stored exactly.
     * @tc.precondition  A fresh buffer exists.
     * @tc.steps         1. Write a single character message.
     *                   2. Write a 64 character message.
     *                   3. Compare the message lengths.
     * @tc.expected      Both message fragments match their lengths.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logValidationMessageBoundaries', 0, () => {
      const single: string = 'x';
      let longMessage = '';
      for (let index = 0; index < 8; index++) {
        longMessage = longMessage + 'abcdefgh';
      }
      const buffer: LogBuffer = new LogBuffer();
      buffer.info(single);
      buffer.info(longMessage);
      logStep('logValidationMessageBoundaries', String(messageOf(buffer.lines[1]).length));
      expect(single.length).assertEqual(1);
      expect(longMessage.length).assertEqual(64);
      expect(messageOf(buffer.lines[0])).assertEqual(single);
      expect(messageOf(buffer.lines[1])).assertEqual(longMessage);
      expect(messageOf(buffer.lines[1]).length).assertEqual(64);
      expect(buffer.lines[0].length).assertEqual(6);
      expect(buffer.lines[1].length).assertEqual(69);
      expect(buffer.contains('abcdefgh')).assertTrue();
      expect(buffer.size()).assertEqual(2);
    });

    /**
     * @tc.name          logValidationEmptyTraceFingerprint
     * @tc.desc          An empty trace fingerprints to the documented seed.
     * @tc.precondition  A fresh buffer exists.
     * @tc.steps         1. Fingerprint the empty trace.
     *                   2. Fingerprint the empty string.
     *                   3. Compare both values.
     * @tc.expected      Both fingerprints equal 216613.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logValidationEmptyTraceFingerprint', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      logStep('logValidationEmptyTraceFingerprint', String(textFingerprint(buffer.trace())));
      expect(textFingerprint(buffer.trace())).assertEqual(216613);
      expect(textFingerprint('')).assertEqual(216613);
      expect(textFingerprint(buffer.trace())).assertEqual(textFingerprint(''));
      expect(buffer.size()).assertEqual(0);
      expect(buffer.trace()).assertEqual('');
      expect(buffer.contains('')).assertFalse();
      expect(buffer.limit).assertEqual(64);
      expect(buffer.levels.length).assertEqual(0);
      expect(buffer.lines.length).assertEqual(0);
    });

    /**
     * @tc.name          logValidationLevelPrefixes
     * @tc.desc          Every stored line begins with its level token.
     * @tc.precondition  A buffer with all levels exists.
     * @tc.steps         1. Write one line per level.
     *                   2. Compare each prefix.
     *                   3. Compare the prefix lengths.
     * @tc.expected      Prefixes are INFO, WARN and ERROR in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationLevelPrefixes', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('msg');
      buffer.warn('msg');
      buffer.error('msg');
      logStep('logValidationLevelPrefixes', buffer.trace());
      expect(levelOf(buffer.lines[0])).assertEqual('INFO');
      expect(levelOf(buffer.lines[1])).assertEqual('WARN');
      expect(levelOf(buffer.lines[2])).assertEqual('ERROR');
      expect(levelOf(buffer.lines[0]).length).assertEqual(4);
      expect(levelOf(buffer.lines[2]).length).assertEqual(5);
      expect(messageOf(buffer.lines[0])).assertEqual('msg');
      expect(messageOf(buffer.lines[2])).assertEqual('msg');
      expect(buffer.lines[0]).assertEqual('INFO msg');
      expect(buffer.lines[2]).assertEqual('ERROR msg');
    });

    /**
     * @tc.name          logValidationLongestLine
     * @tc.desc          The longest line can be found by length comparison.
     * @tc.precondition  A buffer with varied messages exists.
     * @tc.steps         1. Write short, medium and long lines.
     *                   2. Compare the lengths pairwise.
     *                   3. Identify the longest index.
     * @tc.expected      The long line has the greatest length.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logValidationLongestLine', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('a');
      buffer.warn('medium message');
      buffer.error('the longest message in this buffer');
      let longest: number = 0;
      for (let index = 1; index < buffer.lines.length; index++) {
        if (buffer.lines[index].length > buffer.lines[longest].length) {
          longest = index;
        }
      }
      logStep('logValidationLongestLine', String(longest));
      expect(buffer.lines.length).assertEqual(3);
      expect(longest).assertEqual(2);
      expect(buffer.lines[2].length).assertLarger(buffer.lines[1].length);
      expect(buffer.lines[1].length).assertLarger(buffer.lines[0].length);
      expect(buffer.lines[longest]).assertEqual('ERROR the longest message in this buffer');
      expect(levelOf(buffer.lines[longest])).assertEqual('ERROR');
      expect(buffer.size()).assertEqual(3);
      expect(buffer.contains('longest')).assertTrue();
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
    });

    /**
     * @tc.name          logValidationRepeatedClear
     * @tc.desc          Repeated clears are idempotent.
     * @tc.precondition  A buffer with lines exists.
     * @tc.steps         1. Clear three times.
     *                   2. Read the size after each clear.
     *                   3. Write one line after the clears.
     * @tc.expected      Every clear leaves an empty buffer.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationRepeatedClear', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      fillBuffer(buffer, 3);
      buffer.clear();
      const first: number = buffer.size();
      buffer.clear();
      const second: number = buffer.size();
      buffer.clear();
      const third: number = buffer.size();
      buffer.info('fresh');
      logStep('logValidationRepeatedClear', buffer.trace());
      expect(first).assertEqual(0);
      expect(second).assertEqual(0);
      expect(third).assertEqual(0);
      expect(buffer.size()).assertEqual(1);
      expect(buffer.lines[0]).assertEqual('INFO fresh');
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(buffer.trace()).assertEqual('INFO fresh');
      expect(buffer.limit).assertEqual(64);
      expect(buffer.levels.length).assertEqual(1);
    });

    /**
     * @tc.name          logValidationFinalReport
     * @tc.desc          A final report combines size, limit and level counts.
     * @tc.precondition  A buffer with mixed levels exists.
     * @tc.steps         1. Write four lines into a limited buffer.
     *                   2. Compose the report.
     *                   3. Inspect each field.
     * @tc.expected      The report lists size four, limit four and the counts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationFinalReport', 0, () => {
      const buffer: LogBuffer = new LogBuffer(4);
      buffer.info('a');
      buffer.warn('b');
      buffer.error('c');
      buffer.info('d');
      const report: string = String(buffer.size()) + ',' + String(buffer.limit) + ',' +
        String(buffer.countLevel(LEVEL_INFO)) + ',' + String(buffer.countLevel(LEVEL_WARN)) + ',' +
        String(buffer.countLevel(LEVEL_ERROR));
      logStep('logValidationFinalReport', report);
      expect(report).assertEqual('4,4,2,1,1');
      expect(report.split(',').length).assertEqual(5);
      expect(report.split(',')[0]).assertEqual(String(buffer.size()));
      expect(report.split(',')[1]).assertEqual(String(buffer.limit));
      expect(buffer.contains('ERROR c')).assertTrue();
      expect(buffer.trace().split('|').length).assertEqual(4);
      expect(buffer.levels.length).assertEqual(4);
      expect(buffer.lines.length).assertEqual(4);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(2);
    });

    /**
     * @tc.name          logValidationStubLifecycleLogMirror
     * @tc.desc          Stub request text can be mirrored into the service logs.
     * @tc.precondition  A connected service with a client exists.
     * @tc.steps         1. Send a request.
     *                   2. Log the recorded text.
     *                   3. Compare the log line with the record.
     * @tc.expected      The log line carries the recorded request text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logValidationStubLifecycleLogMirror', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      const stub: StubRemoteObjectModel = service.onConnect();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const record = stub.lastRequest();
      const text: string = record === undefined ? '' : record.text;
      service.logs.info('stub receive str is ' + text);
      logStep('logValidationStubLifecycleLogMirror', service.logs.trace());
      expect(text).assertEqual(REQUEST_PAYLOAD);
      expect(service.logs.contains('stub receive str is hello world')).assertTrue();
      expect(service.logs.contains('onConnect')).assertTrue();
      expect(service.logs.size()).assertEqual(2);
      expect(service.logs.lines[1]).assertEqual('INFO stub receive str is hello world');
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(stub.requestCount()).assertEqual(1);
      expect(client.replies.length).assertEqual(1);
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name          logValidationLevelTransitionCounts
     * @tc.desc          Level counts stay consistent across level transitions.
     * @tc.precondition  A buffer with transitions exists.
     * @tc.steps         1. Write info, warn and error pairs.
     *                   2. Count each level.
     *                   3. Compare the total.
     * @tc.expected      Each level count is two and the total is six.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logValidationLevelTransitionCounts', 0, () => {
      const buffer: LogBuffer = new LogBuffer(16);
      buffer.info('i1');
      buffer.warn('w1');
      buffer.error('e1');
      buffer.warn('w2');
      buffer.info('i2');
      buffer.error('e2');
      logStep('logValidationLevelTransitionCounts', buffer.trace());
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(2);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(2);
      expect(buffer.countLevel(LEVEL_INFO) + buffer.countLevel(LEVEL_WARN) + buffer.countLevel(LEVEL_ERROR))
        .assertEqual(6);
      expect(buffer.size()).assertEqual(6);
      expect(buffer.lines[1]).assertEqual('WARN w1');
      expect(buffer.lines[3]).assertEqual('WARN w2');
      expect(buffer.contains('w2')).assertTrue();
      expect(buffer.contains('e2')).assertTrue();
    });

    /**
     * @tc.name          logValidationBufferResetByClear
     * @tc.desc          Clear restores the buffer to its initial observable state.
     * @tc.precondition  A buffer with lines exists.
     * @tc.steps         1. Fill the buffer near its limit.
     *                   2. Clear it.
     *                   3. Compare with a fresh buffer.
     * @tc.expected      The cleared buffer matches a fresh buffer.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logValidationBufferResetByClear', 0, () => {
      const buffer: LogBuffer = new LogBuffer(3);
      const fresh: LogBuffer = new LogBuffer(3);
      fillBuffer(buffer, 3);
      buffer.clear();
      logStep('logValidationBufferResetByClear', buffer.trace());
      expect(buffer.size()).assertEqual(fresh.size());
      expect(buffer.trace()).assertEqual(fresh.trace());
      expect(buffer.levels.length).assertEqual(fresh.levels.length);
      expect(buffer.lines.length).assertEqual(fresh.lines.length);
      expect(buffer.limit).assertEqual(fresh.limit);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(fresh.countLevel(LEVEL_INFO));
      expect(buffer.contains('line')).assertFalse();
      expect(fresh.contains('line')).assertFalse();
      expect(buffer.trace()).assertEqual('');
    });

    /**
     * @tc.name          logValidationTraceCaseSensitivity
     * @tc.desc          Trace comparison is case sensitive.
     * @tc.precondition  Two buffers with different message cases exist.
     * @tc.steps         1. Write lower and upper case messages.
     *                   2. Compare the traces.
     *                   3. Compare folded traces.
     * @tc.expected      Raw traces differ while folded traces match.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logValidationTraceCaseSensitivity', 0, () => {
      const lower: LogBuffer = new LogBuffer();
      const upper: LogBuffer = new LogBuffer();
      lower.info('stub ready');
      upper.info('STUB READY');
      logStep('logValidationTraceCaseSensitivity', lower.trace());
      expect(lower.trace() === upper.trace()).assertFalse();
      expect(lower.trace().toLowerCase()).assertEqual(upper.trace().toLowerCase());
      expect(lower.lines[0]).assertEqual('INFO stub ready');
      expect(upper.lines[0]).assertEqual('INFO STUB READY');
      expect(lower.countLevel(LEVEL_INFO)).assertEqual(upper.countLevel(LEVEL_INFO));
      expect(lower.size()).assertEqual(upper.size());
      expect(textFingerprint(lower.trace()) === textFingerprint(upper.trace())).assertFalse();
      expect(lower.contains('stub')).assertTrue();
      expect(upper.contains('stub')).assertFalse();
    });

    /**
     * @tc.name          logValidationContractSummary
     * @tc.desc          A closing contract summary checks every log invariant.
     * @tc.precondition  A buffer with mixed levels and a limit exists.
     * @tc.steps         1. Write four lines into a limit of four.
     *                   2. Write one more line.
     *                   3. Check the invariants.
     * @tc.expected      The buffer holds four lines with aligned level arrays.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logValidationContractSummary', 0, () => {
      const buffer: LogBuffer = new LogBuffer(4);
      buffer.info('a');
      buffer.warn('b');
      buffer.error('c');
      buffer.info('d');
      buffer.warn('e');
      logStep('logValidationContractSummary', buffer.trace());
      expect(buffer.size()).assertEqual(4);
      expect(buffer.lines.length).assertEqual(buffer.levels.length);
      expect(buffer.lines[0]).assertEqual('WARN b');
      expect(buffer.lines[3]).assertEqual('WARN e');
      expect(buffer.contains('a')).assertFalse();
      expect(buffer.contains('e')).assertTrue();
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(2);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.trace().split('|').length).assertEqual(buffer.size());
    });
  });
}
