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
 * LogSecurity: log safety for bounded client diagnostics.
 *
 * Every diagnostic line in the production page is a single hilog call with a
 * public format string. This suite reconstructs those lines through LogBuffer
 * and pins newline, control character and capacity behaviour.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  LOG_TAG,
  LEVEL_INFO,
  LEVEL_WARN,
  LEVEL_ERROR,
  EventRecorder,
  LogBuffer,
  RemoteProxyModel,
  ConnectionModel,
  createConnectedSession,
  joined,
  countOf,
  uniqueStrings,
  textFingerprint
} from '../Shared/SharedDriver';

function isControl(code: number): boolean {
  return code < 32 || code === 127;
}

function sanitizeLine(line: string): string {
  let output = '';
  for (let index = 0; index < line.length; index++) {
    const code = line.charCodeAt(index);
    output = output + (isControl(code) ? '_' : line.charAt(index));
  }
  return output;
}

function lineCount(line: string): number {
  let total = 1;
  for (let index = 0; index < line.length; index++) {
    if (line.charCodeAt(index) === 10) {
      total = total + 1;
    }
  }
  return total;
}

function levelRank(level: string): number {
  if (level === LEVEL_INFO) {
    return 1;
  }
  if (level === LEVEL_WARN) {
    return 2;
  }
  if (level === LEVEL_ERROR) {
    return 3;
  }
  return 0;
}

function allLevelsKnown(buffer: LogBuffer): boolean {
  for (let index = 0; index < buffer.levels.length; index++) {
    if (levelRank(buffer.levels[index]) === 0) {
      return false;
    }
  }
  return true;
}

export default function logSecurity(): void {
  describe('LogSecurity', () => {
    beforeAll(() => {
      logSuite('LogSecurity', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('LogSecurity', 'end');
    });

    /**
     * @tc.name          logSecurityInfoLineKeepsSinglePhysicalLine
     * @tc.desc          An info line without newlines stays one physical line.
     * @tc.precondition  A bounded LogBuffer is available.
     * @tc.steps         1. Write one info line. 2. Count embedded newlines.
     *                   3. Sanitize the line and compare.
     * @tc.expected      The buffer holds one line with a known level.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logSecurityInfoLineKeepsSinglePhysicalLine', 0, () => {
      logStep('logSecurity', 'single line');
      const buffer = new LogBuffer(8);
      buffer.info('connectAbility start');
      expect(buffer.size()).assertEqual(1);
      expect(lineCount(buffer.lines[0])).assertEqual(1);
      expect(sanitizeLine(buffer.lines[0])).assertEqual(buffer.lines[0]);
      expect(buffer.levels[0]).assertEqual(LEVEL_INFO);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(allLevelsKnown(buffer)).assertTrue();
    });

    /**
     * @tc.name          logSecurityNewlineInjectionIsFlattened
     * @tc.desc          A caller supplied newline is neutralized by sanitizing.
     * @tc.precondition  The local sanitize helper is defined.
     * @tc.steps         1. Build an injected line. 2. Count raw newlines.
     *                   3. Sanitize and count again.
     * @tc.expected      Sanitizing removes all embedded newlines.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logSecurityNewlineInjectionIsFlattened', 0, () => {
      logStep('logSecurity', 'newline injection');
      const injected = 'onConnect\nfake INFO forged line';
      const clean = sanitizeLine(injected);
      expect(lineCount(injected)).assertEqual(2);
      expect(lineCount(clean)).assertEqual(1);
      expect(clean.indexOf('_')).assertEqual(9);
      expect(clean.indexOf('\n')).assertEqual(-1);
      expect(clean.indexOf('forged')).assertEqual(20);
      expect(clean.endsWith('line')).assertTrue();
    });

    /**
     * @tc.name          logSecurityCarriageReturnIsNeutralized
     * @tc.desc          A carriage return cannot split a log record.
     * @tc.precondition  The local sanitize helper is defined.
     * @tc.steps         1. Sanitize a CRLF pair. 2. Sanitize a lone CR.
     *                   3. Compare lengths after sanitizing.
     * @tc.expected      CR and LF both become underscores and length is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityCarriageReturnIsNeutralized', 0, () => {
      logStep('logSecurity', 'carriage return');
      const crlf = sanitizeLine('a\r\nb');
      const lone = sanitizeLine('x\ry');
      expect(crlf).assertEqual('a__b');
      expect(lone).assertEqual('x_y');
      expect(crlf.length).assertEqual(4);
      expect(lone.length).assertEqual(3);
      expect(sanitizeLine('x\ry').indexOf('\r')).assertEqual(-1);
      expect(sanitizeLine('x\ry').indexOf('\n')).assertEqual(-1);
    });

    /**
     * @tc.name          logSecurityControlCharactersBecomePlaceholders
     * @tc.desc          Bell, tab and delete characters are replaced.
     * @tc.precondition  The local sanitize helper treats code points below 32
     *                   and code 127 as control characters.
     * @tc.steps         1. Sanitize a bell. 2. Sanitize a tab. 3. Sanitize
     *                   a delete character.
     * @tc.expected      Every control character becomes one underscore.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityControlCharactersBecomePlaceholders', 0, () => {
      logStep('logSecurity', 'control characters');
      expect(sanitizeLine('a\u0007b')).assertEqual('a_b');
      expect(sanitizeLine('a\tb')).assertEqual('a_b');
      expect(sanitizeLine('a\u007Fb')).assertEqual('a_b');
      expect(isControl(7)).assertTrue();
      expect(isControl(9)).assertTrue();
      expect(isControl(127)).assertTrue();
      expect(isControl(32)).assertFalse();
      expect(sanitizeLine('\u0001\u0002\u0003')).assertEqual('___');
    });

    /**
     * @tc.name          logSecurityUnicodeTextSurvivesSanitizing
     * @tc.desc          Printable non-ASCII text is not treated as control.
     * @tc.precondition  The local sanitize helper is defined.
     * @tc.steps         1. Sanitize a Chinese phrase. 2. Sanitize an emoji.
     *                   3. Compare fingerprints before and after.
     * @tc.expected      Printable unicode survives the sanitizer unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityUnicodeTextSurvivesSanitizing', 0, () => {
      logStep('logSecurity', 'unicode text');
      const chinese = '连接成功';
      const emoji = 'reply-ok';
      expect(sanitizeLine(chinese)).assertEqual(chinese);
      expect(sanitizeLine(emoji)).assertEqual(emoji);
      expect(chinese.length).assertEqual(4);
      expect(chinese.charCodeAt(0) > 127).assertTrue();
      expect(textFingerprint(sanitizeLine(chinese))).assertEqual(textFingerprint(chinese));
      expect(sanitizeLine(chinese).indexOf('_')).assertEqual(-1);
    });

    /**
     * @tc.name          logSecurityBufferTrimDropsOldestLine
     * @tc.desc          Exceeding the limit drops the oldest record.
     * @tc.precondition  A LogBuffer with limit three exists.
     * @tc.steps         1. Write four records. 2. Inspect size and order.
     *                   3. Compare the first and last records.
     * @tc.expected      The buffer keeps the newest three records in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityBufferTrimDropsOldestLine', 0, () => {
      logStep('logSecurity', 'buffer trim');
      const buffer = new LogBuffer(3);
      buffer.info('one');
      buffer.info('two');
      buffer.warn('three');
      buffer.error('four');
      expect(buffer.size()).assertEqual(3);
      expect(buffer.lines[0]).assertEqual('INFO two');
      expect(buffer.lines[1]).assertEqual('WARN three');
      expect(buffer.lines[2]).assertEqual('ERROR four');
      expect(buffer.contains('one')).assertFalse();
      expect(buffer.contains('four')).assertTrue();
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
    });

    /**
     * @tc.name          logSecurityMixedLevelsAreCounted
     * @tc.desc          The buffer counts each level independently.
     * @tc.precondition  A buffer with a generous limit exists.
     * @tc.steps         1. Write two info, one warn, three error records.
     *                   2. Count each level. 3. Check the total.
     * @tc.expected      Counts are 2, 1 and 3 with six total records.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityMixedLevelsAreCounted', 0, () => {
      logStep('logSecurity', 'mixed levels');
      const buffer = new LogBuffer(16);
      buffer.info('a');
      buffer.info('b');
      buffer.warn('c');
      buffer.error('d');
      buffer.error('e');
      buffer.error('f');
      expect(buffer.size()).assertEqual(6);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(3);
      expect(buffer.countLevel('DEBUG')).assertEqual(0);
      expect(buffer.levels.length).assertEqual(6);
      expect(allLevelsKnown(buffer)).assertTrue();
    });

    /**
     * @tc.name          logSecurityTraceAndClearAreConsistent
     * @tc.desc          trace joins records and clear resets all storage.
     * @tc.precondition  A buffer holds three records.
     * @tc.steps         1. Read the trace. 2. Read its fingerprint. 3. Clear.
     * @tc.expected      The trace joins with pipes and clear empties the buffer.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityTraceAndClearAreConsistent', 0, () => {
      logStep('logSecurity', 'trace and clear');
      const buffer = new LogBuffer(8);
      buffer.info('one');
      buffer.warn('two');
      buffer.error('three');
      expect(buffer.trace()).assertEqual('INFO one|WARN two|ERROR three');
      expect(buffer.trace().split('|').length).assertEqual(3);
      expect(textFingerprint(buffer.trace())).assertEqual(textFingerprint('INFO one|WARN two|ERROR three'));
      expect(buffer.contains('two')).assertTrue();
      buffer.clear();
      expect(buffer.size()).assertEqual(0);
      expect(buffer.trace()).assertEqual('');
      expect(buffer.levels.length).assertEqual(0);
      expect(buffer.contains('one')).assertFalse();
    });

    /**
     * @tc.name          logSecurityLimitOneKeepsLastRecord
     * @tc.desc          A single slot buffer always holds the newest record.
     * @tc.precondition  A LogBuffer with limit one exists.
     * @tc.steps         1. Write three records. 2. Inspect the only record.
     *                   3. Compare level and count.
     * @tc.expected      Only the last error record remains.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityLimitOneKeepsLastRecord', 0, () => {
      logStep('logSecurity', 'limit one');
      const buffer = new LogBuffer(1);
      buffer.info('first');
      buffer.warn('second');
      buffer.error('third');
      expect(buffer.size()).assertEqual(1);
      expect(buffer.lines[0]).assertEqual('ERROR third');
      expect(buffer.levels[0]).assertEqual(LEVEL_ERROR);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.contains('first')).assertFalse();
      expect(buffer.contains('third')).assertTrue();
    });

    /**
     * @tc.name          logSecurityLimitZeroStaysEmpty
     * @tc.desc          A zero capacity buffer discards every record.
     * @tc.precondition  LogBuffer accepts a zero limit.
     * @tc.steps         1. Write two records. 2. Inspect size and trace.
     *                   3. Compare counts.
     * @tc.expected      The buffer stays empty and counts are zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logSecurityLimitZeroStaysEmpty', 0, () => {
      logStep('logSecurity', 'limit zero');
      const buffer = new LogBuffer(0);
      buffer.info('discarded');
      buffer.error('also-discarded');
      expect(buffer.size()).assertEqual(0);
      expect(buffer.lines.length).assertEqual(0);
      expect(buffer.levels.length).assertEqual(0);
      expect(buffer.trace()).assertEqual('');
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(buffer.contains('discarded')).assertFalse();
    });

    /**
     * @tc.name          logSecurityEmptyLineIsRecorded
     * @tc.desc          An empty message still produces a leveled record.
     * @tc.precondition  A bounded buffer exists.
     * @tc.steps         1. Write an empty info line. 2. Inspect the stored line.
     *                   3. Compare it to the level plus space.
     * @tc.expected      The stored line is 'INFO ' with a trailing space.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logSecurityEmptyLineIsRecorded', 0, () => {
      logStep('logSecurity', 'empty line');
      const buffer = new LogBuffer(4);
      buffer.info('');
      expect(buffer.size()).assertEqual(1);
      expect(buffer.lines[0]).assertEqual('INFO ');
      expect(buffer.lines[0].length).assertEqual(5);
      expect(buffer.lines[0].endsWith(' ')).assertTrue();
      expect(buffer.levels[0]).assertEqual(LEVEL_INFO);
      expect(buffer.contains('INFO')).assertTrue();
      expect(buffer.trace()).assertEqual('INFO ');
    });

    /**
     * @tc.name          logSecurityPunctuationIsHarmless
     * @tc.desc          Semicolons, percent signs and braces are ordinary data.
     * @tc.precondition  The local sanitize helper is defined.
     * @tc.steps         1. Sanitize a punctuated line. 2. Compare it to input.
     *                   3. Store it and compare the trace.
     * @tc.expected      Printable punctuation is preserved exactly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logSecurityPunctuationIsHarmless', 0, () => {
      logStep('logSecurity', 'punctuation');
      const line = 'fmt %{public}s; {} [x] <y> "q" \\ end';
      const buffer = new LogBuffer(4);
      expect(sanitizeLine(line)).assertEqual(line);
      expect(line.indexOf('%{public}s')).assertEqual(4);
      expect(line.indexOf(';')).assertEqual(14);
      buffer.info(line);
      expect(buffer.trace()).assertEqual('INFO ' + line);
      expect(buffer.size()).assertEqual(1);
    });

    /**
     * @tc.name          logSecuritySanitizeIsIdempotent
     * @tc.desc          Sanitizing twice equals sanitizing once.
     * @tc.precondition  The sanitize helper replaces control chars with '_'.
     * @tc.steps         1. Sanitize a mixed line once. 2. Sanitize it again.
     *                   3. Compare both results.
     * @tc.expected      The second pass changes nothing.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecuritySanitizeIsIdempotent', 0, () => {
      logStep('logSecurity', 'idempotent sanitize');
      const dirty = 'a\nb\tc\rd\u0001e';
      const once = sanitizeLine(dirty);
      const twice = sanitizeLine(once);
      expect(once).assertEqual('a_b_c_d_e');
      expect(twice).assertEqual(once);
      expect(textFingerprint(twice)).assertEqual(textFingerprint(once));
      expect(once.indexOf('\n')).assertEqual(-1);
      expect(once.length).assertEqual(dirty.length);
      expect(once.split('_').length).assertEqual(5);
    });

    /**
     * @tc.name          logSecuritySanitizePreservesLength
     * @tc.desc          Replacing control chars never changes string length.
     * @tc.precondition  The sanitize helper uses a one for one replacement.
     * @tc.steps         1. Build a line of ten controls. 2. Sanitize it.
     *                   3. Compare lengths and content.
     * @tc.expected      The sanitized value has the same length and all underscores.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecuritySanitizePreservesLength', 0, () => {
      logStep('logSecurity', 'sanitize length');
      let dirty = '';
      for (let index = 0; index < 10; index++) {
        dirty = dirty + String.fromCharCode(index);
      }
      const clean = sanitizeLine(dirty);
      expect(dirty.length).assertEqual(10);
      expect(clean.length).assertEqual(10);
      expect(clean).assertEqual('__________');
      expect(clean.indexOf(String.fromCharCode(0))).assertEqual(-1);
      expect(countOf(clean.split(''), '_')).assertEqual(10);
      expect(sanitizeLine(clean)).assertEqual(clean);
    });

    /**
     * @tc.name          logSecurityFingerprintChangesAfterAppend
     * @tc.desc          Appending a record changes the trace fingerprint.
     * @tc.precondition  A buffer holds one record.
     * @tc.steps         1. Fingerprint the trace. 2. Append an error. 3. Fingerprint
     *                   again and compare.
     * @tc.expected      The fingerprint differs after the append.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityFingerprintChangesAfterAppend', 0, () => {
      logStep('logSecurity', 'fingerprint changes');
      const buffer = new LogBuffer(8);
      buffer.info('one');
      const before = textFingerprint(buffer.trace());
      buffer.error('two');
      const after = textFingerprint(buffer.trace());
      expect(before).assertEqual(textFingerprint('INFO one'));
      expect(after).assertEqual(textFingerprint('INFO one|ERROR two'));
      expect(before === after).assertFalse();
      expect(buffer.size()).assertEqual(2);
      expect(buffer.contains('ERROR two')).assertTrue();
      expect(buffer.trace().split('|').length).assertEqual(2);
    });

    /**
     * @tc.name          logSecurityTraceOrderMatchesInsertion
     * @tc.desc          The trace preserves insertion order across levels.
     * @tc.precondition  A buffer with four slots exists.
     * @tc.steps         1. Write four mixed records. 2. Join the lines manually.
     *                   3. Compare with trace.
     * @tc.expected      The manual join equals the buffer trace.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityTraceOrderMatchesInsertion', 0, () => {
      logStep('logSecurity', 'trace order');
      const buffer = new LogBuffer(4);
      buffer.error('first');
      buffer.info('second');
      buffer.warn('third');
      buffer.error('fourth');
      expect(buffer.trace()).assertEqual('ERROR first|INFO second|WARN third|ERROR fourth');
      expect(joined(buffer.lines, '|')).assertEqual(buffer.trace());
      expect(buffer.lines[0]).assertEqual('ERROR first');
      expect(buffer.lines[3]).assertEqual('ERROR fourth');
      expect(buffer.trace().split('|')[1]).assertEqual('INFO second');
      expect(textFingerprint(buffer.trace())).assertEqual(textFingerprint(joined(buffer.lines, '|')));
      expect(buffer.size()).assertEqual(4);
    });

    /**
     * @tc.name          logSecurityContainsIsCaseSensitive
     * @tc.desc          Substring search does not fold case.
     * @tc.precondition  A buffer holds a mixed case line.
     * @tc.steps         1. Store the line. 2. Search the exact case. 3. Search
     *                   two other cases.
     * @tc.expected      Only the exact case is found.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityContainsIsCaseSensitive', 0, () => {
      logStep('logSecurity', 'case sensitivity');
      const buffer = new LogBuffer(4);
      buffer.info('Proxy is invalid');
      expect(buffer.contains('Proxy')).assertTrue();
      expect(buffer.contains('proxy')).assertFalse();
      expect(buffer.contains('PROXY')).assertFalse();
      expect(buffer.contains('is invalid')).assertTrue();
      expect(buffer.contains('invalid is')).assertFalse();
      expect(buffer.trace()).assertEqual('INFO Proxy is invalid');
      expect(buffer.trace().toLowerCase().indexOf('proxy')).assertEqual(5);
    });

    /**
     * @tc.name          logSecurityErrorLineKeepsCode
     * @tc.desc          An error record keeps its numeric code and level.
     * @tc.precondition  A buffer exists.
     * @tc.steps         1. Store the production send failure line. 2. Check the
     *                   code. 3. Check the level count.
     * @tc.expected      The code 16000003 appears under the ERROR level.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logSecurityErrorLineKeepsCode', 0, () => {
      logStep('logSecurity', 'error code line');
      const buffer = new LogBuffer(4);
      buffer.error('sendMessageRequest failed, errCode is 16000003');
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.levels[0]).assertEqual(LEVEL_ERROR);
      expect(buffer.contains('16000003')).assertTrue();
      expect(buffer.contains('sendMessageRequest failed')).assertTrue();
      expect(buffer.trace().startsWith('ERROR ')).assertTrue();
      expect(buffer.trace().endsWith('16000003')).assertTrue();
      expect(buffer.trace().indexOf('errCode is')).assertEqual(33);
    });

    /**
     * @tc.name          logSecurityWarnLineIsFlagged
     * @tc.desc          A warning record is distinguishable from info.
     * @tc.precondition  A buffer exists.
     * @tc.steps         1. Store the connect skip warning. 2. Count the level.
     *                   3. Compare the prefix.
     * @tc.expected      One WARN record exists and no error is counted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logSecurityWarnLineIsFlagged', 0, () => {
      logStep('logSecurity', 'warn line');
      const buffer = new LogBuffer(4);
      buffer.warn('connect skipped in state connected');
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(buffer.lines[0].startsWith('WARN ')).assertTrue();
      expect(buffer.contains('connect skipped')).assertTrue();
      expect(levelRank(buffer.levels[0])).assertEqual(2);
      expect(allLevelsKnown(buffer)).assertTrue();
    });

    /**
     * @tc.name          logSecurityLimitFiveTrimsOnlyOnce
     * @tc.desc          A six record burst into five slots drops one record.
     * @tc.precondition  A buffer with limit five exists.
     * @tc.steps         1. Write six alternating records. 2. Inspect the first
     *                   remaining record. 3. Count the levels.
     * @tc.expected      Five records remain starting with the second write.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityLimitFiveTrimsOnlyOnce', 0, () => {
      logStep('logSecurity', 'limit five');
      const buffer = new LogBuffer(5);
      buffer.info('one');
      buffer.warn('two');
      buffer.error('three');
      buffer.info('four');
      buffer.warn('five');
      buffer.error('six');
      expect(buffer.size()).assertEqual(5);
      expect(buffer.lines[0]).assertEqual('WARN two');
      expect(buffer.lines[4]).assertEqual('ERROR six');
      expect(buffer.contains('one')).assertFalse();
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(2);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(2);
      expect(buffer.levels.length).assertEqual(5);
    });

    /**
     * @tc.name          logSecuritySanitizedInjectionKeepsOneRecord
     * @tc.desc          A sanitized injection stays inside one buffer record.
     * @tc.precondition  The sanitize helper and a buffer exist.
     * @tc.steps         1. Sanitize an injected line. 2. Store it. 3. Check the
     *                   buffer and the trace.
     * @tc.expected      One record exists and the trace has no newline.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecuritySanitizedInjectionKeepsOneRecord', 0, () => {
      logStep('logSecurity', 'sanitized injection');
      const injected = 'onConnect\nERROR forged\tline';
      const clean = sanitizeLine(injected);
      const buffer = new LogBuffer(8);
      buffer.info(clean);
      expect(buffer.size()).assertEqual(1);
      expect(buffer.trace().indexOf('\n')).assertEqual(-1);
      expect(buffer.trace().indexOf('\t')).assertEqual(-1);
      expect(buffer.trace()).assertEqual('INFO onConnect_ERROR forged_line');
      expect(lineCount(buffer.trace())).assertEqual(1);
      expect(buffer.contains('forged')).assertTrue();
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
    });

    /**
     * @tc.name          logSecurityClearedBufferKeepsFingerprintOfEmpty
     * @tc.desc          A cleared buffer fingerprints like the empty string.
     * @tc.precondition  A buffer with two records exists.
     * @tc.steps         1. Clear the buffer. 2. Fingerprint its trace. 3. Compare
     *                   to the empty fingerprint.
     * @tc.expected      The cleared trace is empty and its fingerprint is 216613.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logSecurityClearedBufferKeepsFingerprintOfEmpty', 0, () => {
      logStep('logSecurity', 'cleared fingerprint');
      const buffer = new LogBuffer(4);
      buffer.info('one');
      buffer.error('two');
      const busy = textFingerprint(buffer.trace());
      buffer.clear();
      expect(buffer.trace()).assertEqual('');
      expect(textFingerprint(buffer.trace())).assertEqual(216613);
      expect(textFingerprint(buffer.trace()) === busy).assertFalse();
      expect(buffer.size()).assertEqual(0);
      expect(buffer.contains('one')).assertFalse();
      expect(buffer.countLevel('DEBUG')).assertEqual(0);
    });

    /**
     * @tc.name          logSecurityConnectionLogsUseKnownLevels
     * @tc.desc          A connected session emits only known info levels.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Read the buffer. 2. Count the info lines. 3. Check the
     *                   level vocabulary.
     * @tc.expected      Two info lines exist and all levels are known.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityConnectionLogsUseKnownLevels', 0, () => {
      logStep('logSecurity', 'connection logs');
      const client = createConnectedSession();
      expect(client.logs.size()).assertEqual(2);
      expect(client.logs.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(client.logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(allLevelsKnown(client.logs)).assertTrue();
      expect(client.logs.lines[0]).assertEqual('INFO registerDeathRecipient success');
      expect(client.logs.lines[1]).assertEqual('INFO onConnect');
    });

    /**
     * @tc.name          logSecurityConnectSkipWarningIsRecorded
     * @tc.desc          A duplicate connect records one warning.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Attempt a second connect. 2. Count the warnings. 3. Read
     *                   the warning detail.
     * @tc.expected      One warning names the current state.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityConnectSkipWarningIsRecorded', 0, () => {
      logStep('logSecurity', 'connect skip warning');
      const client = createConnectedSession();
      expect(client.connect(8)).assertFalse();
      expect(client.logs.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(client.logs.lines[2]).assertEqual('WARN connect skipped in state connected');
      expect(client.logs.contains('state connected')).assertTrue();
      expect(client.logs.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(allLevelsKnown(client.logs)).assertTrue();
      expect(client.logs.size()).assertEqual(3);
      expect(client.logs.trace().split('|').length).assertEqual(3);
    });

    /**
     * @tc.name          logSecurityOnFailedErrorIsRecorded
     * @tc.desc          onFailed records the code in one error line.
     * @tc.precondition  A fresh client is available.
     * @tc.steps         1. Deliver onFailed. 2. Read the error line. 3. Compare the
     *                   suffix.
     * @tc.expected      The error line ends with the failure code.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityOnFailedErrorIsRecorded', 0, () => {
      logStep('logSecurity', 'onFailed log');
      const client = new ConnectionModel();
      client.onFailed(16000001);
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(client.logs.lines[0]).assertEqual('ERROR onFailed code 16000001');
      expect(client.logs.contains('onFailed code')).assertTrue();
      expect(client.logs.trace().endsWith('16000001')).assertTrue();
      expect(allLevelsKnown(client.logs)).assertTrue();
      expect(client.logs.size()).assertEqual(1);
      expect(client.logs.trace().indexOf('INFO')).assertEqual(-1);
    });

    /**
     * @tc.name          logSecuritySendFailureErrorIsRecorded
     * @tc.desc          A dead stub send records one error with the errCode.
     * @tc.precondition  A connected session whose stub was killed.
     * @tc.steps         1. Kill the stub. 2. Send. 3. Read the last log line.
     * @tc.expected      The last line is the send failure with code 16000003.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecuritySendFailureErrorIsRecorded', 0, () => {
      logStep('logSecurity', 'send failure log');
      const client = createConnectedSession();
      (client.proxy as RemoteProxyModel).stub.kill();
      client.sendString('hello world');
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(client.logs.lines[2]).assertEqual('ERROR sendMessageRequest failed, errCode is 16000003');
      expect(client.logs.contains('errCode is 16000003')).assertTrue();
      expect(client.logs.trace().startsWith('INFO ')).assertTrue();
      expect(allLevelsKnown(client.logs)).assertTrue();
      expect(client.logs.size()).assertEqual(3);
      expect(client.logs.lines[2].startsWith('ERROR ')).assertTrue();
    });

    /**
     * @tc.name          logSecurityTagIsNotStoredInLines
     * @tc.desc          Records store only level and message, not the hilog tag.
     * @tc.precondition  LOG_TAG is known and a buffer has records.
     * @tc.steps         1. Store two lines. 2. Search for the tag. 3. Compare the
     *                   prefix structure.
     * @tc.expected      The tag never appears inside the stored lines.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logSecurityTagIsNotStoredInLines', 0, () => {
      logStep('logSecurity', 'tag isolation');
      const buffer = new LogBuffer(4);
      buffer.info('onConnect');
      buffer.error('proxy is invalid');
      expect(LOG_TAG).assertEqual('testTag');
      expect(buffer.trace().indexOf(LOG_TAG)).assertEqual(-1);
      expect(buffer.contains(LOG_TAG)).assertFalse();
      expect(buffer.lines[0].startsWith('INFO ')).assertTrue();
      expect(buffer.lines[1].startsWith('ERROR ')).assertTrue();
      expect(buffer.lines[0].split(' ')[0]).assertEqual(LEVEL_INFO);
      expect(buffer.trace().startsWith('INFO onConnect|ERROR')).assertTrue();
    });

    /**
     * @tc.name          logSecurityLongLineSurvivesSanitizing
     * @tc.desc          A two thousand char printable line is unchanged.
     * @tc.precondition  The sanitize helper and a buffer exist.
     * @tc.steps         1. Build a long line. 2. Sanitize it. 3. Store and compare
     *                   lengths.
     * @tc.expected      The long line keeps its length end to end.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityLongLineSurvivesSanitizing', 0, () => {
      logStep('logSecurity', 'long line');
      let long = '';
      for (let index = 0; index < 200; index++) {
        long = long + '0123456789';
      }
      const clean = sanitizeLine(long);
      const buffer = new LogBuffer(2);
      buffer.info(clean);
      expect(long.length).assertEqual(2000);
      expect(clean.length).assertEqual(2000);
      expect(clean).assertEqual(long);
      expect(buffer.size()).assertEqual(1);
      expect(buffer.lines[0].length).assertEqual(2005);
      expect(buffer.contains('0123456789')).assertTrue();
      expect(lineCount(buffer.trace())).assertEqual(1);
    });

    /**
     * @tc.name          logSecurityTabInjectionHasSinglePrefix
     * @tc.desc          A sanitized tab cannot forge a second level prefix.
     * @tc.precondition  The sanitize helper is defined.
     * @tc.steps         1. Sanitize a payload with a tab and fake level. 2. Store it.
     *                   3. Count level prefixes.
     * @tc.expected      Exactly one INFO prefix exists in the stored record.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logSecurityTabInjectionHasSinglePrefix', 0, () => {
      logStep('logSecurity', 'tab injection');
      const injected = 'ok\tERROR forged';
      const clean = sanitizeLine(injected);
      const buffer = new LogBuffer(4);
      buffer.info(clean);
      expect(clean).assertEqual('ok_ERROR forged');
      expect(buffer.lines[0]).assertEqual('INFO ok_ERROR forged');
      expect(countOf(buffer.lines[0].split(' '), 'ERROR')).assertEqual(0);
      expect(buffer.lines[0].startsWith('INFO ')).assertTrue();
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(buffer.contains('forged')).assertTrue();
      expect(buffer.trace().indexOf('\t')).assertEqual(-1);
    });

    /**
     * @tc.name          logSecurityEmbeddedLevelIsNotPromoted
     * @tc.desc          An ERROR word inside an info message is not a level.
     * @tc.precondition  A buffer exists.
     * @tc.steps         1. Store a message containing ERROR. 2. Count the levels.
     *                   3. Inspect the stored prefix.
     * @tc.expected      The record stays INFO and the word ERROR is only text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logSecurityEmbeddedLevelIsNotPromoted', 0, () => {
      logStep('logSecurity', 'embedded level');
      const buffer = new LogBuffer(4);
      buffer.info('state ERROR was observed');
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(buffer.lines[0]).assertEqual('INFO state ERROR was observed');
      expect(buffer.lines[0].indexOf('ERROR')).assertEqual(11);
      expect(buffer.contains('ERROR')).assertTrue();
      expect(buffer.trace().startsWith('INFO ')).assertTrue();
      expect(buffer.size()).assertEqual(1);
    });

    /**
     * @tc.name          logSecurityWarningBeforeInfoKeepsOrder
     * @tc.desc          Insertion order is independent of level severity.
     * @tc.precondition  A buffer with four slots exists.
     * @tc.steps         1. Write a warning. 2. Write an info. 3. Compare the lines.
     * @tc.expected      The warning stays first even though info is less severe.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityWarningBeforeInfoKeepsOrder', 0, () => {
      logStep('logSecurity', 'warning before info');
      const buffer = new LogBuffer(4);
      buffer.warn('first warning');
      buffer.info('second info');
      expect(buffer.lines[0]).assertEqual('WARN first warning');
      expect(buffer.lines[1]).assertEqual('INFO second info');
      expect(buffer.levels[0]).assertEqual(LEVEL_WARN);
      expect(buffer.levels[1]).assertEqual(LEVEL_INFO);
      expect(buffer.trace().indexOf('WARN')).assertEqual(0);
      expect(buffer.trace().indexOf('INFO')).assertEqual(19);
      expect(buffer.size()).assertEqual(2);
    });

    /**
     * @tc.name          logSecurityLevelRanksAreOrdered
     * @tc.desc          The local rank order is info, warn then error.
     * @tc.precondition  The local levelRank helper is defined.
     * @tc.steps         1. Rank each level. 2. Compare adjacent ranks. 3. Rank an
     *                   unknown label.
     * @tc.expected      Ranks are 1, 2, 3 and 0 for unknown labels.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityLevelRanksAreOrdered', 0, () => {
      logStep('logSecurity', 'level ranks');
      expect(levelRank(LEVEL_INFO)).assertEqual(1);
      expect(levelRank(LEVEL_WARN)).assertEqual(2);
      expect(levelRank(LEVEL_ERROR)).assertEqual(3);
      expect(levelRank(LEVEL_WARN) - levelRank(LEVEL_INFO)).assertEqual(1);
      expect(levelRank(LEVEL_ERROR) - levelRank(LEVEL_WARN)).assertEqual(1);
      expect(levelRank('TRACE')).assertEqual(0);
      expect(levelRank('')).assertEqual(0);
      expect(levelRank(LEVEL_INFO) < levelRank(LEVEL_ERROR)).assertTrue();
    });

    /**
     * @tc.name          logSecurityUnknownLevelIsDetected
     * @tc.desc          allLevelsKnown flags a synthetic unknown label.
     * @tc.precondition  A buffer exposes its level array.
     * @tc.steps         1. Write one info line. 2. Check the flag. 3. Inject an unknown
     *                   label and check again.
     * @tc.expected      The flag flips from true to false after the injection.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logSecurityUnknownLevelIsDetected', 0, () => {
      logStep('logSecurity', 'unknown level detected');
      const buffer = new LogBuffer(8);
      buffer.info('known');
      expect(allLevelsKnown(buffer)).assertTrue();
      buffer.levels.push('TRACE');
      expect(allLevelsKnown(buffer)).assertFalse();
      expect(levelRank(buffer.levels[1])).assertEqual(0);
      expect(buffer.levels.length).assertEqual(2);
      expect(buffer.countLevel('TRACE')).assertEqual(1);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(buffer.lines.length).assertEqual(1);
    });

    /**
     * @tc.name          logSecurityLimitTenAcrossManyWrites
     * @tc.desc          Twenty five writes leave the newest ten records.
     * @tc.precondition  A buffer with limit ten exists.
     * @tc.steps         1. Write records zero to twenty four. 2. Inspect the first and
     *                   last. 3. Count the size.
     * @tc.expected      The buffer holds records fifteen through twenty four.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityLimitTenAcrossManyWrites', 0, () => {
      logStep('logSecurity', 'limit ten burst');
      const buffer = new LogBuffer(10);
      for (let index = 0; index < 25; index++) {
        buffer.info('line-' + String(index));
      }
      expect(buffer.size()).assertEqual(10);
      expect(buffer.lines[0]).assertEqual('INFO line-15');
      expect(buffer.lines[9]).assertEqual('INFO line-24');
      expect(buffer.contains('line-14')).assertFalse();
      expect(buffer.contains('line-15')).assertTrue();
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(10);
      expect(buffer.trace().split('|').length).assertEqual(10);
      expect(buffer.lines[0].indexOf('line-15')).assertEqual(5);
    });

    /**
     * @tc.name          logSecuritySingleLineTraceHasNoPipe
     * @tc.desc          A one record trace contains no pipe separator.
     * @tc.precondition  A buffer holds one record.
     * @tc.steps         1. Read the trace. 2. Count the pipes. 3. Split the trace.
     * @tc.expected      The trace is one segment with zero pipes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logSecuritySingleLineTraceHasNoPipe', 0, () => {
      logStep('logSecurity', 'single line trace');
      const buffer = new LogBuffer(4);
      buffer.info('only');
      expect(buffer.trace()).assertEqual('INFO only');
      expect(buffer.trace().indexOf('|')).assertEqual(-1);
      expect(buffer.trace().split('|').length).assertEqual(1);
      expect(countOf(buffer.trace().split('|'), 'INFO only')).assertEqual(1);
      expect(buffer.trace().length).assertEqual(9);
      expect(buffer.size()).assertEqual(1);
    });

    /**
     * @tc.name          logSecurityEmptyFragmentMatchesEveryLine
     * @tc.desc          Searching for the empty string always succeeds.
     * @tc.precondition  A buffer holds two records.
     * @tc.steps         1. Search the empty fragment. 2. Search a real fragment. 3.
     *                   Search an absent one.
     * @tc.expected      The empty search is true and the absent search is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logSecurityEmptyFragmentMatchesEveryLine', 0, () => {
      logStep('logSecurity', 'empty fragment');
      const buffer = new LogBuffer(4);
      buffer.info('alpha');
      buffer.error('beta');
      expect(buffer.contains('')).assertTrue();
      expect(buffer.contains('alpha')).assertTrue();
      expect(buffer.contains('gamma')).assertFalse();
      expect(buffer.trace().indexOf('') === 0).assertTrue();
      expect(buffer.size()).assertEqual(2);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.trace().split('|').length).assertEqual(2);
    });

    /**
     * @tc.name          logSecurityCountLevelIsCaseSensitive
     * @tc.desc          Level counting does not fold case.
     * @tc.precondition  A buffer holds an info record.
     * @tc.steps         1. Count the exact level. 2. Count lower and title case. 3.
     *                   Compare the results.
     * @tc.expected      Only the exact upper case level is counted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityCountLevelIsCaseSensitive', 0, () => {
      logStep('logSecurity', 'count case sensitive');
      const buffer = new LogBuffer(4);
      buffer.info('alpha');
      expect(buffer.countLevel('INFO')).assertEqual(1);
      expect(buffer.countLevel('info')).assertEqual(0);
      expect(buffer.countLevel('Info')).assertEqual(0);
      expect(buffer.countLevel('')).assertEqual(0);
      expect(buffer.levels[0]).assertEqual('INFO');
      expect(buffer.levels[0].toLowerCase()).assertEqual('info');
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
    });

    /**
     * @tc.name          logSecurityRepeatedLevelsKeepCounts
     * @tc.desc          Ten error writes produce ten counted errors.
     * @tc.precondition  A buffer with twenty slots exists.
     * @tc.steps         1. Write ten errors. 2. Count them. 3. Check the trace tail.
     * @tc.expected      The error count and line count both reach ten.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityRepeatedLevelsKeepCounts', 0, () => {
      logStep('logSecurity', 'repeated levels');
      const buffer = new LogBuffer(20);
      for (let index = 0; index < 10; index++) {
        buffer.error('failure-' + String(index));
      }
      expect(buffer.size()).assertEqual(10);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(10);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(buffer.trace().endsWith('ERROR failure-9')).assertTrue();
      expect(buffer.trace().startsWith('ERROR failure-0')).assertTrue();
      expect(buffer.trace().split('|').length).assertEqual(10);
      expect(buffer.lines[5]).assertEqual('ERROR failure-5');
    });

    /**
     * @tc.name          logSecurityThreeLevelTraceIsGolden
     * @tc.desc          One record per level yields a pinned three line trace.
     * @tc.precondition  A buffer with four slots exists.
     * @tc.steps         1. Write info, warn and error. 2. Read the trace. 3. Compare the
     *                   golden fingerprint.
     * @tc.expected      The trace reads INFO, WARN, ERROR with their messages.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityThreeLevelTraceIsGolden', 0, () => {
      logStep('logSecurity', 'three level trace');
      const buffer = new LogBuffer(4);
      buffer.info('alpha');
      buffer.warn('beta');
      buffer.error('gamma');
      const golden = 'INFO alpha|WARN beta|ERROR gamma';
      expect(buffer.trace()).assertEqual(golden);
      expect(textFingerprint(buffer.trace())).assertEqual(textFingerprint(golden));
      expect(buffer.trace().split('|').length).assertEqual(3);
      expect(buffer.levels[0]).assertEqual(LEVEL_INFO);
      expect(buffer.levels[1]).assertEqual(LEVEL_WARN);
      expect(buffer.levels[2]).assertEqual(LEVEL_ERROR);
      expect(allLevelsKnown(buffer)).assertTrue();
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
    });

    /**
     * @tc.name          logSecurityAllControlCodesBecomeUnderscores
     * @tc.desc          Every ASCII control code maps to one underscore.
     * @tc.precondition  The sanitize helper is defined.
     * @tc.steps         1. Sanitize codes zero to thirty one. 2. Sanitize delete. 3. Count
     *                   the underscores.
     * @tc.expected      Every control code is replaced exactly once.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logSecurityAllControlCodesBecomeUnderscores', 0, () => {
      logStep('logSecurity', 'all control codes');
      let dirty = '';
      for (let code = 0; code < 32; code++) {
        dirty = dirty + String.fromCharCode(code);
      }
      const clean = sanitizeLine(dirty);
      expect(dirty.length).assertEqual(32);
      expect(clean.length).assertEqual(32);
      expect(countOf(clean.split(''), '_')).assertEqual(32);
      expect(clean.indexOf('\n')).assertEqual(-1);
      expect(clean.indexOf('\r')).assertEqual(-1);
      expect(clean.indexOf('\t')).assertEqual(-1);
      expect(sanitizeLine(String.fromCharCode(127))).assertEqual('_');
    });

    /**
     * @tc.name          logSecurityInfoAfterClearWorks
     * @tc.desc          A cleared buffer accepts new records normally.
     * @tc.precondition  A buffer with two records was cleared.
     * @tc.steps         1. Clear. 2. Write a new info line. 3. Read the size and trace.
     * @tc.expected      The buffer restarts at one record.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityInfoAfterClearWorks', 0, () => {
      logStep('logSecurity', 'info after clear');
      const buffer = new LogBuffer(4);
      buffer.info('old-one');
      buffer.error('old-two');
      buffer.clear();
      buffer.info('new-one');
      expect(buffer.size()).assertEqual(1);
      expect(buffer.trace()).assertEqual('INFO new-one');
      expect(buffer.contains('old-one')).assertFalse();
      expect(buffer.contains('new-one')).assertTrue();
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(allLevelsKnown(buffer)).assertTrue();
    });

    /**
     * @tc.name          logSecurityEmptyAndNormalRecordsCoexist
     * @tc.desc          An empty message does not disturb a following record.
     * @tc.precondition  A buffer with four slots exists.
     * @tc.steps         1. Write an empty info. 2. Write a normal error. 3. Read both lines.
     * @tc.expected      Both records are stored in order with their levels.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logSecurityEmptyAndNormalRecordsCoexist', 0, () => {
      logStep('logSecurity', 'empty and normal');
      const buffer = new LogBuffer(4);
      buffer.info('');
      buffer.error('real');
      expect(buffer.size()).assertEqual(2);
      expect(buffer.lines[0]).assertEqual('INFO ');
      expect(buffer.lines[1]).assertEqual('ERROR real');
      expect(buffer.levels.length).assertEqual(2);
      expect(buffer.trace()).assertEqual('INFO |ERROR real');
      expect(buffer.trace().split('|').length).assertEqual(2);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
    });

    /**
     * @tc.name          logSecurityFingerprintIncludesLevel
     * @tc.desc          The same message under two levels fingerprints differently.
     * @tc.precondition  Two buffers exist.
     * @tc.steps         1. Store the message as info. 2. Store it as error. 3. Compare the
     *                   two traces.
     * @tc.expected      The traces differ only by the level prefix.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityFingerprintIncludesLevel', 0, () => {
      logStep('logSecurity', 'fingerprint includes level');
      const infoBuffer = new LogBuffer(4);
      const errorBuffer = new LogBuffer(4);
      infoBuffer.info('same message');
      errorBuffer.error('same message');
      expect(infoBuffer.trace()).assertEqual('INFO same message');
      expect(errorBuffer.trace()).assertEqual('ERROR same message');
      expect(textFingerprint(infoBuffer.trace()) === textFingerprint(errorBuffer.trace())).assertFalse();
      expect(infoBuffer.trace().substring(5)).assertEqual(errorBuffer.trace().substring(6));
      expect(infoBuffer.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(errorBuffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(allLevelsKnown(infoBuffer) && allLevelsKnown(errorBuffer)).assertTrue();
    });

    /**
     * @tc.name          logSecurityConnectionTraceIsGolden
     * @tc.desc          A connected session stores two fixed info lines.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Read the trace. 2. Compare the golden. 3. Compare the level
     *                   count.
     * @tc.expected      The trace is register success then onConnect.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityConnectionTraceIsGolden', 0, () => {
      logStep('logSecurity', 'connection trace golden');
      const client = createConnectedSession();
      const golden = 'INFO registerDeathRecipient success|INFO onConnect';
      expect(client.logs.trace()).assertEqual(golden);
      expect(textFingerprint(client.logs.trace())).assertEqual(textFingerprint(golden));
      expect(client.logs.size()).assertEqual(2);
      expect(client.logs.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(client.logs.contains('registerDeathRecipient success')).assertTrue();
      expect(client.logs.contains('onConnect')).assertTrue();
      expect(client.logs.contains('WARN')).assertFalse();
      expect(allLevelsKnown(client.logs)).assertTrue();
    });

    /**
     * @tc.name          logSecurityWarnAndErrorCountsDisjoint
     * @tc.desc          Warn and error counters never overlap.
     * @tc.precondition  A buffer holds mixed records.
     * @tc.steps         1. Write two warns and three errors. 2. Count each. 3. Compare the
     *                   sum.
     * @tc.expected      The counts are two and three with a sum of five.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityWarnAndErrorCountsDisjoint', 0, () => {
      logStep('logSecurity', 'warn error disjoint');
      const buffer = new LogBuffer(8);
      buffer.warn('w1');
      buffer.warn('w2');
      buffer.error('e1');
      buffer.error('e2');
      buffer.error('e3');
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(2);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(3);
      expect(buffer.size()).assertEqual(5);
      expect(buffer.countLevel(LEVEL_WARN) + buffer.countLevel(LEVEL_ERROR)).assertEqual(5);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(buffer.lines[0]).assertEqual('WARN w1');
      expect(buffer.lines[4]).assertEqual('ERROR e3');
      expect(buffer.trace().split('|').length).assertEqual(5);
    });

    /**
     * @tc.name          logSecurityExactLimitDoesNotTrim
     * @tc.desc          Filling a buffer to its limit keeps the first record.
     * @tc.precondition  A buffer with limit three exists.
     * @tc.steps         1. Write three records. 2. Check the size. 3. Confirm the first
     *                   record survives.
     * @tc.expected      All three records remain without trimming.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityExactLimitDoesNotTrim', 0, () => {
      logStep('logSecurity', 'exact limit');
      const buffer = new LogBuffer(3);
      buffer.info('first');
      buffer.warn('second');
      buffer.error('third');
      expect(buffer.size()).assertEqual(3);
      expect(buffer.contains('first')).assertTrue();
      expect(buffer.contains('third')).assertTrue();
      expect(buffer.lines[0]).assertEqual('INFO first');
      expect(buffer.lines[1]).assertEqual('WARN second');
      expect(buffer.lines[2]).assertEqual('ERROR third');
      expect(buffer.trace().split('|').length).assertEqual(3);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
    });

    /**
     * @tc.name          logSecuritySixthWriteDropsFirst
     * @tc.desc          A sixth write into five slots drops the first record.
     * @tc.precondition  A buffer with limit five exists.
     * @tc.steps         1. Write five records. 2. Check the first. 3. Write a sixth and
     *                   check again.
     * @tc.expected      The first record is present before and absent after the sixth.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecuritySixthWriteDropsFirst', 0, () => {
      logStep('logSecurity', 'sixth write drops first');
      const buffer = new LogBuffer(5);
      buffer.info('one');
      buffer.info('two');
      buffer.info('three');
      buffer.info('four');
      buffer.info('five');
      expect(buffer.contains('one')).assertTrue();
      expect(buffer.size()).assertEqual(5);
      buffer.info('six');
      expect(buffer.contains('one')).assertFalse();
      expect(buffer.contains('two')).assertTrue();
      expect(buffer.size()).assertEqual(5);
      expect(buffer.lines[0]).assertEqual('INFO two');
      expect(buffer.lines[4]).assertEqual('INFO six');
      expect(buffer.trace().split('|').length).assertEqual(5);
    });

    /**
     * @tc.name          logSecurityPipeInsideMessageExtendsTrace
     * @tc.desc          A pipe in the message increases the trace split count.
     * @tc.precondition  A buffer holds one message with a pipe.
     * @tc.steps         1. Store the message. 2. Split the trace. 3. Compare the size.
     * @tc.expected      The trace splits into two parts for one record.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logSecurityPipeInsideMessageExtendsTrace', 0, () => {
      logStep('logSecurity', 'pipe inside message');
      const buffer = new LogBuffer(4);
      buffer.info('left|right');
      expect(buffer.size()).assertEqual(1);
      expect(buffer.trace()).assertEqual('INFO left|right');
      expect(buffer.trace().split('|').length).assertEqual(2);
      expect(buffer.lines.length).assertEqual(1);
      expect(buffer.contains('left|right')).assertTrue();
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(buffer.lines[0].indexOf('|')).assertEqual(9);
      expect(buffer.trace().indexOf('INFO')).assertEqual(0);
    });

    /**
     * @tc.name          logSecurityLevelsAlignAfterTrim
     * @tc.desc          The level array stays aligned with the line array after trimming.
     * @tc.precondition  A buffer with limit three exists.
     * @tc.steps         1. Write four mixed records. 2. Compare each line prefix to its level.
     *                   3. Check the lengths.
     * @tc.expected      Every remaining line prefix matches its stored level.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logSecurityLevelsAlignAfterTrim', 0, () => {
      logStep('logSecurity', 'levels align');
      const buffer = new LogBuffer(3);
      buffer.error('e1');
      buffer.warn('w1');
      buffer.info('i1');
      buffer.error('e2');
      expect(buffer.lines.length).assertEqual(buffer.levels.length);
      expect(buffer.levels.length).assertEqual(3);
      for (let index = 0; index < buffer.levels.length; index++) {
        expect(buffer.lines[index].startsWith(buffer.levels[index])).assertTrue();
      }
      expect(buffer.lines[0]).assertEqual('WARN w1');
      expect(buffer.levels[0]).assertEqual(LEVEL_WARN);
      expect(buffer.lines[2]).assertEqual('ERROR e2');
      expect(buffer.levels[2]).assertEqual(LEVEL_ERROR);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
    });

    /**
     * @tc.name          logSecurityInfoCountAfterErrorBurst
     * @tc.desc          An error burst crowding out info leaves zero info counts.
     * @tc.precondition  A buffer with limit three exists.
     * @tc.steps         1. Write one info. 2. Write three errors. 3. Count each level.
     * @tc.expected      The info count drops to zero and errors stay three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityInfoCountAfterErrorBurst', 0, () => {
      logStep('logSecurity', 'error burst');
      const buffer = new LogBuffer(3);
      buffer.info('start');
      buffer.error('e1');
      buffer.error('e2');
      buffer.error('e3');
      expect(buffer.size()).assertEqual(3);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(3);
      expect(buffer.contains('start')).assertFalse();
      expect(buffer.lines[0]).assertEqual('ERROR e1');
      expect(buffer.lines[2]).assertEqual('ERROR e3');
      expect(allLevelsKnown(buffer)).assertTrue();
      expect(buffer.trace().split('|').length).assertEqual(3);
    });

    /**
     * @tc.name          logSecurityDroppedFragmentIsGone
     * @tc.desc          A trimmed record cannot be found by contains.
     * @tc.precondition  A capacity one buffer exists.
     * @tc.steps         1. Store one record. 2. Store a second. 3. Search for the first.
     * @tc.expected      The first fragment is absent from lines and trace.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityDroppedFragmentIsGone', 0, () => {
      logStep('logSecurity', 'dropped fragment');
      const buffer = new LogBuffer(1);
      buffer.info('vanished-fragment');
      expect(buffer.contains('vanished-fragment')).assertTrue();
      buffer.warn('survivor');
      expect(buffer.contains('vanished-fragment')).assertFalse();
      expect(buffer.contains('survivor')).assertTrue();
      expect(buffer.trace().indexOf('vanished')).assertEqual(-1);
      expect(buffer.size()).assertEqual(1);
      expect(buffer.levels[0]).assertEqual(LEVEL_WARN);
      expect(buffer.trace()).assertEqual('WARN survivor');
    });

    /**
     * @tc.name          logSecurityClearTwiceIsSafe
     * @tc.desc          Calling clear twice leaves an empty buffer.
     * @tc.precondition  A buffer with one record exists.
     * @tc.steps         1. Clear. 2. Clear again. 3. Write a new record.
     * @tc.expected      Both clears succeed and a new record is accepted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityClearTwiceIsSafe', 0, () => {
      logStep('logSecurity', 'clear twice');
      const buffer = new LogBuffer(4);
      buffer.info('record');
      buffer.clear();
      buffer.clear();
      expect(buffer.size()).assertEqual(0);
      expect(buffer.trace()).assertEqual('');
      expect(buffer.levels.length).assertEqual(0);
      buffer.error('new');
      expect(buffer.size()).assertEqual(1);
      expect(buffer.trace()).assertEqual('ERROR new');
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.contains('record')).assertFalse();
      expect(allLevelsKnown(buffer)).assertTrue();
    });

    /**
     * @tc.name          logSecuritySingleErrorLineGolden
     * @tc.desc          One error record produces a pinned golden trace.
     * @tc.precondition  A buffer exists.
     * @tc.steps         1. Store the invalid proxy error. 2. Read the trace. 3. Compare the
     *                   fingerprint.
     * @tc.expected      The trace is ERROR proxy is invalid.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logSecuritySingleErrorLineGolden', 0, () => {
      logStep('logSecurity', 'single error golden');
      const buffer = new LogBuffer(4);
      buffer.error('proxy is invalid');
      expect(buffer.trace()).assertEqual('ERROR proxy is invalid');
      expect(textFingerprint(buffer.trace())).assertEqual(textFingerprint('ERROR proxy is invalid'));
      expect(buffer.trace().length).assertEqual(22);
      expect(buffer.trace().startsWith('ERROR ')).assertTrue();
      expect(buffer.contains('proxy is invalid')).assertTrue();
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.lines.length).assertEqual(1);
      expect(buffer.levels.length).assertEqual(1);
    });

    /**
     * @tc.name          logSecuritySizeNeverExceedsLimit
     * @tc.desc          Twenty writes never push the size above the limit.
     * @tc.precondition  A buffer with limit five exists.
     * @tc.steps         1. Write twenty records. 2. Check the size after every write. 3.
     *                   Confirm the final state.
     * @tc.expected      The size never exceeds five.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecuritySizeNeverExceedsLimit', 0, () => {
      logStep('logSecurity', 'size never exceeds');
      const buffer = new LogBuffer(5);
      for (let index = 0; index < 20; index++) {
        buffer.info('record-' + String(index));
        expect(buffer.size() <= 5).assertTrue();
        expect(buffer.lines.length <= 5).assertTrue();
        expect(buffer.levels.length <= 5).assertTrue();
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.contains('record-15')).assertTrue();
      expect(buffer.contains('record-14')).assertFalse();
      expect(buffer.lines[4]).assertEqual('INFO record-19');
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(5);
      expect(buffer.trace().split('|').length).assertEqual(5);
    });

    /**
     * @tc.name          logSecurityCountAfterClearThenWrite
     * @tc.desc          Counts restart after a clear followed by a write.
     * @tc.precondition  A buffer held two errors and was cleared.
     * @tc.steps         1. Clear. 2. Write one warn. 3. Count both levels.
     * @tc.expected      The error count drops to zero and the warn count is one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityCountAfterClearThenWrite', 0, () => {
      logStep('logSecurity', 'count after clear');
      const buffer = new LogBuffer(4);
      buffer.error('e1');
      buffer.error('e2');
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(2);
      buffer.clear();
      buffer.warn('w1');
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(buffer.size()).assertEqual(1);
      expect(buffer.trace()).assertEqual('WARN w1');
      expect(allLevelsKnown(buffer)).assertTrue();
      expect(levelRank(buffer.levels[0])).assertEqual(2);
    });

    /**
     * @tc.name          logSecurityContainsLevelPrefix
     * @tc.desc          Level prefixes are searchable substrings.
     * @tc.precondition  A buffer holds one record per level.
     * @tc.steps         1. Search each prefix. 2. Search a lower case prefix. 3. Compare the
     *                   results.
     * @tc.expected      Upper case prefixes are found and lower case is not.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityContainsLevelPrefix', 0, () => {
      logStep('logSecurity', 'contains prefix');
      const buffer = new LogBuffer(4);
      buffer.info('a');
      buffer.warn('b');
      buffer.error('c');
      expect(buffer.contains('INFO')).assertTrue();
      expect(buffer.contains('WARN')).assertTrue();
      expect(buffer.contains('ERROR')).assertTrue();
      expect(buffer.contains('info')).assertFalse();
      expect(buffer.contains('warn')).assertFalse();
      expect(buffer.contains('error')).assertFalse();
      expect(buffer.trace().split('|').length).assertEqual(3);
      expect(buffer.size()).assertEqual(3);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
    });

    /**
     * @tc.name          logSecuritySurrogateLengthIsPreserved
     * @tc.desc          Sanitizing an emoji keeps both code units.
     * @tc.precondition  The sanitize helper is defined.
     * @tc.steps         1. Sanitize an emoji. 2. Compare its length. 3. Store it.
     * @tc.expected      The emoji length and value are unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logSecuritySurrogateLengthIsPreserved', 0, () => {
      logStep('logSecurity', 'surrogate length');
      const emoji = '😀';
      const clean = sanitizeLine(emoji);
      const buffer = new LogBuffer(4);
      expect(emoji.length).assertEqual(2);
      expect(clean.length).assertEqual(2);
      expect(clean).assertEqual(emoji);
      expect(clean.charCodeAt(0) > 55295).assertTrue();
      buffer.info(clean);
      expect(buffer.size()).assertEqual(1);
      expect(buffer.contains(emoji)).assertTrue();
      expect(buffer.lines[0]).assertEqual('INFO ' + emoji);
      expect(lineCount(buffer.trace())).assertEqual(1);
    });

    /**
     * @tc.name          logSecurityDefaultLimitIsSixtyFour
     * @tc.desc          The default buffer keeps the newest sixty four records.
     * @tc.precondition  A LogBuffer is built without an explicit limit.
     * @tc.steps         1. Write seventy records. 2. Check the size. 3. Read the first record.
     * @tc.expected      The size is sixty four and the first record is number six.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityDefaultLimitIsSixtyFour', 0, () => {
      logStep('logSecurity', 'default limit');
      const buffer = new LogBuffer();
      expect(buffer.limit).assertEqual(64);
      for (let index = 0; index < 70; index++) {
        buffer.info('r' + String(index));
      }
      expect(buffer.size()).assertEqual(64);
      expect(buffer.lines[0]).assertEqual('INFO r6');
      expect(buffer.lines[63]).assertEqual('INFO r69');
      expect(countOf(buffer.lines, 'INFO r6')).assertEqual(1);
      expect(countOf(buffer.lines, 'INFO r5')).assertEqual(0);
      expect(buffer.contains('INFO r6')).assertTrue();
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(64);
      expect(buffer.trace().split('|').length).assertEqual(64);
    });

  });
}
