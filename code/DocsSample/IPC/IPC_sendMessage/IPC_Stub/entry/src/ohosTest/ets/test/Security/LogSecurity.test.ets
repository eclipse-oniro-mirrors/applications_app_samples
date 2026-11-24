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
import { LEVEL_INFO, LEVEL_WARN, LEVEL_ERROR, LogBuffer, textFingerprint } from '../Shared/SharedDriver';

const MAX_LINE: number = 64;
const ELLIPSIS: string = '...';

class SafeLine {
  public text: string;
  public injections: number;
  public escapes: number;
  public formatMarks: number;
  public truncated: boolean;
  public digest: number;

  constructor(text: string, injections: number, escapes: number, formatMarks: number, truncated: boolean) {
    this.text = text;
    this.injections = injections;
    this.escapes = escapes;
    this.formatMarks = formatMarks;
    this.truncated = truncated;
    this.digest = textFingerprint(text);
  }

  public token(): string {
    return String(this.injections) + '/' + String(this.escapes) + '/' + String(this.formatMarks) + '/' +
      String(this.truncated);
  }
}

const HEX_DIGITS: string = '0123456789ABCDEF';

function hex2(code: number): string {
  const high: number = Math.floor(code / 16);
  const low: number = code % 16;
  return HEX_DIGITS.charAt(high) + HEX_DIGITS.charAt(low);
}

function hasRawControl(text: string): boolean {
  for (let index = 0; index < text.length; index++) {
    const code: number = text.charCodeAt(index);
    if ((code < 32 && code !== 9) || code === 127) {
      return true;
    }
  }
  return false;
}

function sanitizeLine(raw: string): SafeLine {
  let text = '';
  let injections = 0;
  let escapes = 0;
  let formatMarks = 0;
  for (let index = 0; index < raw.length; index++) {
    const symbol: string = raw.charAt(index);
    const code: number = raw.charCodeAt(index);
    if (symbol === '\n' || symbol === '\r' || symbol === '\t' || code === 8232 || code === 8233) {
      text = text + ' ';
      injections = injections + 1;
    } else if (code < 32 || code === 127) {
      text = text + '\\x' + hex2(code);
      escapes = escapes + 1;
    } else if (symbol === '%') {
      text = text + '%%';
      formatMarks = formatMarks + 1;
    } else {
      text = text + symbol;
    }
  }
  text = text.trim();
  let truncated = false;
  if (text.length > MAX_LINE) {
    text = text.substring(0, MAX_LINE - ELLIPSIS.length) + ELLIPSIS;
    truncated = true;
  }
  return new SafeLine(text, injections, escapes, formatMarks, truncated);
}

function buildLongText(size: number): string {
  let text = 'log';
  while (text.length < size) {
    text = text + 'q';
  }
  return text;
}

function makeBuffer(limit: number = 16): LogBuffer {
  return new LogBuffer(limit);
}

export default function logSecurity(): void {
  describe('LogSecurityTest', () => {
    beforeAll(() => {
      logSuite('LogSecurityTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('LogSecurityTest', 'end');
    });

    /**
     * @tc.name          logSecurityKeepsHelloLineClean
     * @tc.desc          Clean log text hello line passes through the sanitizer untouched.
     * @tc.precondition  The sanitizer with a 64-character ceiling is loaded.
     * @tc.steps         1. Sanitize the clean line hello line.
     *                   2. Compare the output with the input.
     *                   3. Check every counter and the raw control probe.
     *                   4. Recompute the digest.
     * @tc.expected      The line is identical, no counter moves, and the digest covers the text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logSecurityKeepsHelloLineClean', 0, () => {
      const raw: string = 'hello';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.text).assertEqual(raw);
      expect(line.injections).assertEqual(0);
      expect(line.escapes).assertEqual(0);
      expect(line.formatMarks).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(hasRawControl(line.text)).assertFalse();
      expect(line.digest).assertEqual(textFingerprint(raw));
      expect(line.token()).assertEqual("0/0/0/false");
      expect(sanitizeLine(line.text).text).assertEqual(line.text);
      logStep("logSecurityKeepsHelloLineClean", line.token() + "|" + line.text);
    });

    /**
     * @tc.name          logSecurityKeepsLifecycleLineClean
     * @tc.desc          Clean log text lifecycle line passes through the sanitizer untouched.
     * @tc.precondition  The sanitizer with a 64-character ceiling is loaded.
     * @tc.steps         1. Sanitize the clean line lifecycle line.
     *                   2. Compare the output with the input.
     *                   3. Check every counter and the raw control probe.
     *                   4. Recompute the digest.
     * @tc.expected      The line is identical, no counter moves, and the digest covers the text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logSecurityKeepsLifecycleLineClean', 0, () => {
      const raw: string = 'onCreate';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.text).assertEqual(raw);
      expect(line.injections).assertEqual(0);
      expect(line.escapes).assertEqual(0);
      expect(line.formatMarks).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(hasRawControl(line.text)).assertFalse();
      expect(line.digest).assertEqual(textFingerprint(raw));
      expect(line.token()).assertEqual("0/0/0/false");
      expect(sanitizeLine(line.text).text).assertEqual(line.text);
      logStep("logSecurityKeepsLifecycleLineClean", line.token() + "|" + line.text);
    });

    /**
     * @tc.name          logSecurityKeepsStartIdLineClean
     * @tc.desc          Clean log text start id line passes through the sanitizer untouched.
     * @tc.precondition  The sanitizer with a 64-character ceiling is loaded.
     * @tc.steps         1. Sanitize the clean line start id line.
     *                   2. Compare the output with the input.
     *                   3. Check every counter and the raw control probe.
     *                   4. Recompute the digest.
     * @tc.expected      The line is identical, no counter moves, and the digest covers the text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logSecurityKeepsStartIdLineClean', 0, () => {
      const raw: string = 'onRequest 1';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.text).assertEqual(raw);
      expect(line.injections).assertEqual(0);
      expect(line.escapes).assertEqual(0);
      expect(line.formatMarks).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(hasRawControl(line.text)).assertFalse();
      expect(line.digest).assertEqual(textFingerprint(raw));
      expect(line.token()).assertEqual("0/0/0/false");
      expect(sanitizeLine(line.text).text).assertEqual(line.text);
      logStep("logSecurityKeepsStartIdLineClean", line.token() + "|" + line.text);
    });

    /**
     * @tc.name          logSecurityKeepsReceiveLineClean
     * @tc.desc          Clean log text receive line passes through the sanitizer untouched.
     * @tc.precondition  The sanitizer with a 64-character ceiling is loaded.
     * @tc.steps         1. Sanitize the clean line receive line.
     *                   2. Compare the output with the input.
     *                   3. Check every counter and the raw control probe.
     *                   4. Recompute the digest.
     * @tc.expected      The line is identical, no counter moves, and the digest covers the text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logSecurityKeepsReceiveLineClean', 0, () => {
      const raw: string = 'stub receive str is hello world';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.text).assertEqual(raw);
      expect(line.injections).assertEqual(0);
      expect(line.escapes).assertEqual(0);
      expect(line.formatMarks).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(hasRawControl(line.text)).assertFalse();
      expect(line.digest).assertEqual(textFingerprint(raw));
      expect(line.token()).assertEqual("0/0/0/false");
      expect(sanitizeLine(line.text).text).assertEqual(line.text);
      logStep("logSecurityKeepsReceiveLineClean", line.token() + "|" + line.text);
    });

    /**
     * @tc.name          logSecurityKeepsCodeAssignmentClean
     * @tc.desc          Clean log text code assignment passes through the sanitizer untouched.
     * @tc.precondition  The sanitizer with a 64-character ceiling is loaded.
     * @tc.steps         1. Sanitize the clean line code assignment.
     *                   2. Compare the output with the input.
     *                   3. Check every counter and the raw control probe.
     *                   4. Recompute the digest.
     * @tc.expected      The line is identical, no counter moves, and the digest covers the text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logSecurityKeepsCodeAssignmentClean', 0, () => {
      const raw: string = 'code=1';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.text).assertEqual(raw);
      expect(line.injections).assertEqual(0);
      expect(line.escapes).assertEqual(0);
      expect(line.formatMarks).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(hasRawControl(line.text)).assertFalse();
      expect(line.digest).assertEqual(textFingerprint(raw));
      expect(line.token()).assertEqual("0/0/0/false");
      expect(sanitizeLine(line.text).text).assertEqual(line.text);
      logStep("logSecurityKeepsCodeAssignmentClean", line.token() + "|" + line.text);
    });

    /**
     * @tc.name          logSecurityKeepsDescriptorClean
     * @tc.desc          Clean log text descriptor line passes through the sanitizer untouched.
     * @tc.precondition  The sanitizer with a 64-character ceiling is loaded.
     * @tc.steps         1. Sanitize the clean line descriptor line.
     *                   2. Compare the output with the input.
     *                   3. Check every counter and the raw control probe.
     *                   4. Recompute the digest.
     * @tc.expected      The line is identical, no counter moves, and the digest covers the text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logSecurityKeepsDescriptorClean', 0, () => {
      const raw: string = 'IPCStubTest';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.text).assertEqual(raw);
      expect(line.injections).assertEqual(0);
      expect(line.escapes).assertEqual(0);
      expect(line.formatMarks).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(hasRawControl(line.text)).assertFalse();
      expect(line.digest).assertEqual(textFingerprint(raw));
      expect(line.token()).assertEqual("0/0/0/false");
      expect(sanitizeLine(line.text).text).assertEqual(line.text);
      logStep("logSecurityKeepsDescriptorClean", line.token() + "|" + line.text);
    });

    /**
     * @tc.name          logSecurityKeepsDotNameClean
     * @tc.desc          Clean log text dot name line passes through the sanitizer untouched.
     * @tc.precondition  The sanitizer with a 64-character ceiling is loaded.
     * @tc.steps         1. Sanitize the clean line dot name line.
     *                   2. Compare the output with the input.
     *                   3. Check every counter and the raw control probe.
     *                   4. Recompute the digest.
     * @tc.expected      The line is identical, no counter moves, and the digest covers the text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logSecurityKeepsDotNameClean', 0, () => {
      const raw: string = 'rpc.stub';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.text).assertEqual(raw);
      expect(line.injections).assertEqual(0);
      expect(line.escapes).assertEqual(0);
      expect(line.formatMarks).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(hasRawControl(line.text)).assertFalse();
      expect(line.digest).assertEqual(textFingerprint(raw));
      expect(line.token()).assertEqual("0/0/0/false");
      expect(sanitizeLine(line.text).text).assertEqual(line.text);
      logStep("logSecurityKeepsDotNameClean", line.token() + "|" + line.text);
    });

    /**
     * @tc.name          logSecurityKeepsLevelWordClean
     * @tc.desc          Clean log text level word line passes through the sanitizer untouched.
     * @tc.precondition  The sanitizer with a 64-character ceiling is loaded.
     * @tc.steps         1. Sanitize the clean line level word line.
     *                   2. Compare the output with the input.
     *                   3. Check every counter and the raw control probe.
     *                   4. Recompute the digest.
     * @tc.expected      The line is identical, no counter moves, and the digest covers the text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logSecurityKeepsLevelWordClean', 0, () => {
      const raw: string = 'level INFO';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.text).assertEqual(raw);
      expect(line.injections).assertEqual(0);
      expect(line.escapes).assertEqual(0);
      expect(line.formatMarks).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(hasRawControl(line.text)).assertFalse();
      expect(line.digest).assertEqual(textFingerprint(raw));
      expect(line.token()).assertEqual("0/0/0/false");
      expect(sanitizeLine(line.text).text).assertEqual(line.text);
      logStep("logSecurityKeepsLevelWordClean", line.token() + "|" + line.text);
    });

    /**
     * @tc.name          logSecurityKeepsPlainSentenceClean
     * @tc.desc          Clean log text plain sentence passes through the sanitizer untouched.
     * @tc.precondition  The sanitizer with a 64-character ceiling is loaded.
     * @tc.steps         1. Sanitize the clean line plain sentence.
     *                   2. Compare the output with the input.
     *                   3. Check every counter and the raw control probe.
     *                   4. Recompute the digest.
     * @tc.expected      The line is identical, no counter moves, and the digest covers the text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logSecurityKeepsPlainSentenceClean', 0, () => {
      const raw: string = 'line without breaks';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.text).assertEqual(raw);
      expect(line.injections).assertEqual(0);
      expect(line.escapes).assertEqual(0);
      expect(line.formatMarks).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(hasRawControl(line.text)).assertFalse();
      expect(line.digest).assertEqual(textFingerprint(raw));
      expect(line.token()).assertEqual("0/0/0/false");
      expect(sanitizeLine(line.text).text).assertEqual(line.text);
      logStep("logSecurityKeepsPlainSentenceClean", line.token() + "|" + line.text);
    });

    /**
     * @tc.name          logSecurityKeepsAlphanumericClean
     * @tc.desc          Clean log text alphanumeric line passes through the sanitizer untouched.
     * @tc.precondition  The sanitizer with a 64-character ceiling is loaded.
     * @tc.steps         1. Sanitize the clean line alphanumeric line.
     *                   2. Compare the output with the input.
     *                   3. Check every counter and the raw control probe.
     *                   4. Recompute the digest.
     * @tc.expected      The line is identical, no counter moves, and the digest covers the text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logSecurityKeepsAlphanumericClean', 0, () => {
      const raw: string = 'abc123';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.text).assertEqual(raw);
      expect(line.injections).assertEqual(0);
      expect(line.escapes).assertEqual(0);
      expect(line.formatMarks).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(hasRawControl(line.text)).assertFalse();
      expect(line.digest).assertEqual(textFingerprint(raw));
      expect(line.token()).assertEqual("0/0/0/false");
      expect(sanitizeLine(line.text).text).assertEqual(line.text);
      logStep("logSecurityKeepsAlphanumericClean", line.token() + "|" + line.text);
    });

    /**
     * @tc.name          logSecurityFlattensSingleNewline
     * @tc.desc          Line break injection in single newline is flattened to a single space.
     * @tc.precondition  The sanitizer replaces newline, carriage return and tab with spaces.
     * @tc.steps         1. Sanitize the injected text single newline.
     *                   2. Count the injection replacements.
     *                   3. Verify no break character survives.
     *                   4. Compare the output with the expected flattened text.
     * @tc.expected      Every break becomes one space and the counters record the replacements.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logSecurityFlattensSingleNewline', 0, () => {
      const raw: string = 'a\nb';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.text).assertEqual('a b');
      expect(line.injections).assertEqual(1);
      expect(line.text.indexOf("\n")).assertEqual(-1);
      expect(line.text.indexOf("\r")).assertEqual(-1);
      expect(line.text.indexOf("\t")).assertEqual(-1);
      expect(line.escapes).assertEqual(0);
      expect(line.formatMarks).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(line.digest).assertEqual(textFingerprint(line.text));
      expect(line.text.split(" ").length > 1).assertTrue();
      logStep("logSecurityFlattensSingleNewline", line.text);
    });

    /**
     * @tc.name          logSecurityFlattensSingleCarriageReturn
     * @tc.desc          Line break injection in single carriage return is flattened to a single space.
     * @tc.precondition  The sanitizer replaces newline, carriage return and tab with spaces.
     * @tc.steps         1. Sanitize the injected text single carriage return.
     *                   2. Count the injection replacements.
     *                   3. Verify no break character survives.
     *                   4. Compare the output with the expected flattened text.
     * @tc.expected      Every break becomes one space and the counters record the replacements.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logSecurityFlattensSingleCarriageReturn', 0, () => {
      const raw: string = 'a\rb';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.text).assertEqual('a b');
      expect(line.injections).assertEqual(1);
      expect(line.text.indexOf("\n")).assertEqual(-1);
      expect(line.text.indexOf("\r")).assertEqual(-1);
      expect(line.text.indexOf("\t")).assertEqual(-1);
      expect(line.escapes).assertEqual(0);
      expect(line.formatMarks).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(line.digest).assertEqual(textFingerprint(line.text));
      expect(line.text.split(" ").length > 1).assertTrue();
      logStep("logSecurityFlattensSingleCarriageReturn", line.text);
    });

    /**
     * @tc.name          logSecurityFlattensSingleTab
     * @tc.desc          Line break injection in single tab is flattened to a single space.
     * @tc.precondition  The sanitizer replaces newline, carriage return and tab with spaces.
     * @tc.steps         1. Sanitize the injected text single tab.
     *                   2. Count the injection replacements.
     *                   3. Verify no break character survives.
     *                   4. Compare the output with the expected flattened text.
     * @tc.expected      Every break becomes one space and the counters record the replacements.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logSecurityFlattensSingleTab', 0, () => {
      const raw: string = 'a\tb';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.text).assertEqual('a b');
      expect(line.injections).assertEqual(1);
      expect(line.text.indexOf("\n")).assertEqual(-1);
      expect(line.text.indexOf("\r")).assertEqual(-1);
      expect(line.text.indexOf("\t")).assertEqual(-1);
      expect(line.escapes).assertEqual(0);
      expect(line.formatMarks).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(line.digest).assertEqual(textFingerprint(line.text));
      expect(line.text.split(" ").length > 1).assertTrue();
      logStep("logSecurityFlattensSingleTab", line.text);
    });

    /**
     * @tc.name          logSecurityFlattensWordBreak
     * @tc.desc          Line break injection in word break is flattened to a single space.
     * @tc.precondition  The sanitizer replaces newline, carriage return and tab with spaces.
     * @tc.steps         1. Sanitize the injected text word break.
     *                   2. Count the injection replacements.
     *                   3. Verify no break character survives.
     *                   4. Compare the output with the expected flattened text.
     * @tc.expected      Every break becomes one space and the counters record the replacements.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logSecurityFlattensWordBreak', 0, () => {
      const raw: string = 'one\ntwo';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.text).assertEqual('one two');
      expect(line.injections).assertEqual(1);
      expect(line.text.indexOf("\n")).assertEqual(-1);
      expect(line.text.indexOf("\r")).assertEqual(-1);
      expect(line.text.indexOf("\t")).assertEqual(-1);
      expect(line.escapes).assertEqual(0);
      expect(line.formatMarks).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(line.digest).assertEqual(textFingerprint(line.text));
      expect(line.text.split(" ").length > 1).assertTrue();
      logStep("logSecurityFlattensWordBreak", line.text);
    });

    /**
     * @tc.name          logSecurityFlattensTwoNewlines
     * @tc.desc          Line break injection in two newlines is flattened to a single space.
     * @tc.precondition  The sanitizer replaces newline, carriage return and tab with spaces.
     * @tc.steps         1. Sanitize the injected text two newlines.
     *                   2. Count the injection replacements.
     *                   3. Verify no break character survives.
     *                   4. Compare the output with the expected flattened text.
     * @tc.expected      Every break becomes one space and the counters record the replacements.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logSecurityFlattensTwoNewlines', 0, () => {
      const raw: string = 'a\nb\nc';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.text).assertEqual('a b c');
      expect(line.injections).assertEqual(2);
      expect(line.text.indexOf("\n")).assertEqual(-1);
      expect(line.text.indexOf("\r")).assertEqual(-1);
      expect(line.text.indexOf("\t")).assertEqual(-1);
      expect(line.escapes).assertEqual(0);
      expect(line.formatMarks).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(line.digest).assertEqual(textFingerprint(line.text));
      expect(line.text.split(" ").length > 1).assertTrue();
      logStep("logSecurityFlattensTwoNewlines", line.text);
    });

    /**
     * @tc.name          logSecurityFlattensDoubleBreak
     * @tc.desc          Line break injection in double break is flattened to a single space.
     * @tc.precondition  The sanitizer replaces newline, carriage return and tab with spaces.
     * @tc.steps         1. Sanitize the injected text double break.
     *                   2. Count the injection replacements.
     *                   3. Verify no break character survives.
     *                   4. Compare the output with the expected flattened text.
     * @tc.expected      Every break becomes one space and the counters record the replacements.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logSecurityFlattensDoubleBreak', 0, () => {
      const raw: string = 'x\n\ny';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.text).assertEqual('x  y');
      expect(line.injections).assertEqual(2);
      expect(line.text.indexOf("\n")).assertEqual(-1);
      expect(line.text.indexOf("\r")).assertEqual(-1);
      expect(line.text.indexOf("\t")).assertEqual(-1);
      expect(line.escapes).assertEqual(0);
      expect(line.formatMarks).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(line.digest).assertEqual(textFingerprint(line.text));
      expect(line.text.split(" ").length > 1).assertTrue();
      logStep("logSecurityFlattensDoubleBreak", line.text);
    });

    /**
     * @tc.name          logSecurityFlattensCrLfPair
     * @tc.desc          Line break injection in crlf pair is flattened to a single space.
     * @tc.precondition  The sanitizer replaces newline, carriage return and tab with spaces.
     * @tc.steps         1. Sanitize the injected text crlf pair.
     *                   2. Count the injection replacements.
     *                   3. Verify no break character survives.
     *                   4. Compare the output with the expected flattened text.
     * @tc.expected      Every break becomes one space and the counters record the replacements.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logSecurityFlattensCrLfPair', 0, () => {
      const raw: string = 'begin\r\nend';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.text).assertEqual('begin  end');
      expect(line.injections).assertEqual(2);
      expect(line.text.indexOf("\n")).assertEqual(-1);
      expect(line.text.indexOf("\r")).assertEqual(-1);
      expect(line.text.indexOf("\t")).assertEqual(-1);
      expect(line.escapes).assertEqual(0);
      expect(line.formatMarks).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(line.digest).assertEqual(textFingerprint(line.text));
      expect(line.text.split(" ").length > 1).assertTrue();
      logStep("logSecurityFlattensCrLfPair", line.text);
    });

    /**
     * @tc.name          logSecurityFlattensThreeWords
     * @tc.desc          Line break injection in three words is flattened to a single space.
     * @tc.precondition  The sanitizer replaces newline, carriage return and tab with spaces.
     * @tc.steps         1. Sanitize the injected text three words.
     *                   2. Count the injection replacements.
     *                   3. Verify no break character survives.
     *                   4. Compare the output with the expected flattened text.
     * @tc.expected      Every break becomes one space and the counters record the replacements.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('logSecurityFlattensThreeWords', 0, () => {
      const raw: string = 'payload\nwith\nbreaks';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.text).assertEqual('payload with breaks');
      expect(line.injections).assertEqual(2);
      expect(line.text.indexOf("\n")).assertEqual(-1);
      expect(line.text.indexOf("\r")).assertEqual(-1);
      expect(line.text.indexOf("\t")).assertEqual(-1);
      expect(line.escapes).assertEqual(0);
      expect(line.formatMarks).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(line.digest).assertEqual(textFingerprint(line.text));
      expect(line.text.split(" ").length > 1).assertTrue();
      logStep("logSecurityFlattensThreeWords", line.text);
    });

    /**
     * @tc.name          logSecurityEscapesNullByte
     * @tc.desc          Raw control bytes in null byte are hex escaped, never emitted.
     * @tc.precondition  The sanitizer rewrites bytes below 32 as backslash-x uppercase hex pairs.
     * @tc.steps         1. Sanitize the control sequence null byte.
     *                   2. Read the escape counter.
     *                   3. Search for the escaped uppercase pair.
     *                   4. Verify no raw control byte remains.
     * @tc.expected      Each control byte becomes a four-character escape and the counter matches.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityEscapesNullByte', 0, () => {
      const raw: string = '\u0000';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.escapes).assertEqual(1);
      expect(line.injections).assertEqual(0);
      expect(line.text.indexOf('x00') >= 0).assertTrue();
      expect(line.text.indexOf("x") >= 0).assertTrue();
      expect(line.text.length).assertEqual(4);
      expect(hasRawControl(line.text)).assertFalse();
      expect(line.formatMarks).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(line.digest).assertEqual(textFingerprint(line.text));
      logStep("logSecurityEscapesNullByte", line.token() + "|" + line.text);
    });

    /**
     * @tc.name          logSecurityEscapesEmbeddedNull
     * @tc.desc          Raw control bytes in embedded null are hex escaped, never emitted.
     * @tc.precondition  The sanitizer rewrites bytes below 32 as backslash-x uppercase hex pairs.
     * @tc.steps         1. Sanitize the control sequence embedded null.
     *                   2. Read the escape counter.
     *                   3. Search for the escaped uppercase pair.
     *                   4. Verify no raw control byte remains.
     * @tc.expected      Each control byte becomes a four-character escape and the counter matches.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityEscapesEmbeddedNull', 0, () => {
      const raw: string = 'a\u0000b';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.escapes).assertEqual(1);
      expect(line.injections).assertEqual(0);
      expect(line.text.indexOf('x00') >= 0).assertTrue();
      expect(line.text.indexOf("x") >= 0).assertTrue();
      expect(line.text.length).assertEqual(6);
      expect(hasRawControl(line.text)).assertFalse();
      expect(line.formatMarks).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(line.digest).assertEqual(textFingerprint(line.text));
      logStep("logSecurityEscapesEmbeddedNull", line.token() + "|" + line.text);
    });

    /**
     * @tc.name          logSecurityEscapesEscapeByte
     * @tc.desc          Raw control bytes in escape byte are hex escaped, never emitted.
     * @tc.precondition  The sanitizer rewrites bytes below 32 as backslash-x uppercase hex pairs.
     * @tc.steps         1. Sanitize the control sequence escape byte.
     *                   2. Read the escape counter.
     *                   3. Search for the escaped uppercase pair.
     *                   4. Verify no raw control byte remains.
     * @tc.expected      Each control byte becomes a four-character escape and the counter matches.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityEscapesEscapeByte', 0, () => {
      const raw: string = '\u001b';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.escapes).assertEqual(1);
      expect(line.injections).assertEqual(0);
      expect(line.text.indexOf('x1B') >= 0).assertTrue();
      expect(line.text.indexOf("x") >= 0).assertTrue();
      expect(line.text.length).assertEqual(4);
      expect(hasRawControl(line.text)).assertFalse();
      expect(line.formatMarks).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(line.digest).assertEqual(textFingerprint(line.text));
      logStep("logSecurityEscapesEscapeByte", line.token() + "|" + line.text);
    });

    /**
     * @tc.name          logSecurityEscapesBytePair
     * @tc.desc          Raw control bytes in byte pair are hex escaped, never emitted.
     * @tc.precondition  The sanitizer rewrites bytes below 32 as backslash-x uppercase hex pairs.
     * @tc.steps         1. Sanitize the control sequence byte pair.
     *                   2. Read the escape counter.
     *                   3. Search for the escaped uppercase pair.
     *                   4. Verify no raw control byte remains.
     * @tc.expected      Each control byte becomes a four-character escape and the counter matches.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityEscapesBytePair', 0, () => {
      const raw: string = '\u0001\u0002';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.escapes).assertEqual(2);
      expect(line.injections).assertEqual(0);
      expect(line.text.indexOf('x01') >= 0).assertTrue();
      expect(line.text.indexOf("x") >= 0).assertTrue();
      expect(line.text.length).assertEqual(8);
      expect(hasRawControl(line.text)).assertFalse();
      expect(line.formatMarks).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(line.digest).assertEqual(textFingerprint(line.text));
      logStep("logSecurityEscapesBytePair", line.token() + "|" + line.text);
    });

    /**
     * @tc.name          logSecurityEscapesDeleteByte
     * @tc.desc          Raw control bytes in delete byte are hex escaped, never emitted.
     * @tc.precondition  The sanitizer rewrites bytes below 32 as backslash-x uppercase hex pairs.
     * @tc.steps         1. Sanitize the control sequence delete byte.
     *                   2. Read the escape counter.
     *                   3. Search for the escaped uppercase pair.
     *                   4. Verify no raw control byte remains.
     * @tc.expected      Each control byte becomes a four-character escape and the counter matches.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityEscapesDeleteByte', 0, () => {
      const raw: string = '\u007f';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.escapes).assertEqual(1);
      expect(line.injections).assertEqual(0);
      expect(line.text.indexOf('x7F') >= 0).assertTrue();
      expect(line.text.indexOf("x") >= 0).assertTrue();
      expect(line.text.length).assertEqual(4);
      expect(hasRawControl(line.text)).assertFalse();
      expect(line.formatMarks).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(line.digest).assertEqual(textFingerprint(line.text));
      logStep("logSecurityEscapesDeleteByte", line.token() + "|" + line.text);
    });

    /**
     * @tc.name          logSecurityEscapesBellByte
     * @tc.desc          Raw control bytes in bell byte are hex escaped, never emitted.
     * @tc.precondition  The sanitizer rewrites bytes below 32 as backslash-x uppercase hex pairs.
     * @tc.steps         1. Sanitize the control sequence bell byte.
     *                   2. Read the escape counter.
     *                   3. Search for the escaped uppercase pair.
     *                   4. Verify no raw control byte remains.
     * @tc.expected      Each control byte becomes a four-character escape and the counter matches.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityEscapesBellByte', 0, () => {
      const raw: string = 'a\u0007b';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.escapes).assertEqual(1);
      expect(line.injections).assertEqual(0);
      expect(line.text.indexOf('x07') >= 0).assertTrue();
      expect(line.text.indexOf("x") >= 0).assertTrue();
      expect(line.text.length).assertEqual(6);
      expect(hasRawControl(line.text)).assertFalse();
      expect(line.formatMarks).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(line.digest).assertEqual(textFingerprint(line.text));
      logStep("logSecurityEscapesBellByte", line.token() + "|" + line.text);
    });

    /**
     * @tc.name          logSecurityEscapesUnitSeparator
     * @tc.desc          Raw control bytes in unit separator are hex escaped, never emitted.
     * @tc.precondition  The sanitizer rewrites bytes below 32 as backslash-x uppercase hex pairs.
     * @tc.steps         1. Sanitize the control sequence unit separator.
     *                   2. Read the escape counter.
     *                   3. Search for the escaped uppercase pair.
     *                   4. Verify no raw control byte remains.
     * @tc.expected      Each control byte becomes a four-character escape and the counter matches.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityEscapesUnitSeparator', 0, () => {
      const raw: string = '\u001f';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.escapes).assertEqual(1);
      expect(line.injections).assertEqual(0);
      expect(line.text.indexOf('x1F') >= 0).assertTrue();
      expect(line.text.indexOf("x") >= 0).assertTrue();
      expect(line.text.length).assertEqual(4);
      expect(hasRawControl(line.text)).assertFalse();
      expect(line.formatMarks).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(line.digest).assertEqual(textFingerprint(line.text));
      logStep("logSecurityEscapesUnitSeparator", line.token() + "|" + line.text);
    });

    /**
     * @tc.name          logSecurityEscapesLeadingNull
     * @tc.desc          Raw control bytes in leading null are hex escaped, never emitted.
     * @tc.precondition  The sanitizer rewrites bytes below 32 as backslash-x uppercase hex pairs.
     * @tc.steps         1. Sanitize the control sequence leading null.
     *                   2. Read the escape counter.
     *                   3. Search for the escaped uppercase pair.
     *                   4. Verify no raw control byte remains.
     * @tc.expected      Each control byte becomes a four-character escape and the counter matches.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityEscapesLeadingNull', 0, () => {
      const raw: string = '\u0000ab';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.escapes).assertEqual(1);
      expect(line.injections).assertEqual(0);
      expect(line.text.indexOf('x00') >= 0).assertTrue();
      expect(line.text.indexOf("x") >= 0).assertTrue();
      expect(line.text.length).assertEqual(6);
      expect(hasRawControl(line.text)).assertFalse();
      expect(line.formatMarks).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(line.digest).assertEqual(textFingerprint(line.text));
      logStep("logSecurityEscapesLeadingNull", line.token() + "|" + line.text);
    });

    /**
     * @tc.name          logSecurityDoublesPublicFormatMarker
     * @tc.desc          Format markers in public format marker are doubled so the logger cannot expand them.
     * @tc.precondition  The sanitizer doubles every percent sign before the line is emitted.
     * @tc.steps         1. Sanitize the format text public format marker.
     *                   2. Count the percent characters in the output.
     *                   3. Check the format marker counter.
     *                   4. Verify no single marker survives.
     * @tc.expected      Every percent sign is doubled and the marker counter equals the input count.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityDoublesPublicFormatMarker', 0, () => {
      const raw: string = '%{public}s';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.formatMarks).assertEqual(1);
      expect(line.text.split("%").length - 1).assertEqual(2);
      expect(line.injections).assertEqual(0);
      expect(line.escapes).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(line.text.length).assertEqual(11);
      expect(line.digest).assertEqual(textFingerprint(line.text));
      expect(line.token().startsWith("0/0/")).assertTrue();
      logStep("logSecurityDoublesPublicFormatMarker", line.text);
    });

    /**
     * @tc.name          logSecurityDoublesPlainStringMarker
     * @tc.desc          Format markers in plain string marker are doubled so the logger cannot expand them.
     * @tc.precondition  The sanitizer doubles every percent sign before the line is emitted.
     * @tc.steps         1. Sanitize the format text plain string marker.
     *                   2. Count the percent characters in the output.
     *                   3. Check the format marker counter.
     *                   4. Verify no single marker survives.
     * @tc.expected      Every percent sign is doubled and the marker counter equals the input count.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityDoublesPlainStringMarker', 0, () => {
      const raw: string = '%s';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.formatMarks).assertEqual(1);
      expect(line.text.split("%").length - 1).assertEqual(2);
      expect(line.injections).assertEqual(0);
      expect(line.escapes).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(line.text.length).assertEqual(3);
      expect(line.digest).assertEqual(textFingerprint(line.text));
      expect(line.token().startsWith("0/0/")).assertTrue();
      logStep("logSecurityDoublesPlainStringMarker", line.text);
    });

    /**
     * @tc.name          logSecurityDoublesPercentSuffix
     * @tc.desc          Format markers in percent suffix are doubled so the logger cannot expand them.
     * @tc.precondition  The sanitizer doubles every percent sign before the line is emitted.
     * @tc.steps         1. Sanitize the format text percent suffix.
     *                   2. Count the percent characters in the output.
     *                   3. Check the format marker counter.
     *                   4. Verify no single marker survives.
     * @tc.expected      Every percent sign is doubled and the marker counter equals the input count.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityDoublesPercentSuffix', 0, () => {
      const raw: string = '100%';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.formatMarks).assertEqual(1);
      expect(line.text.split("%").length - 1).assertEqual(2);
      expect(line.injections).assertEqual(0);
      expect(line.escapes).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(line.text.length).assertEqual(5);
      expect(line.digest).assertEqual(textFingerprint(line.text));
      expect(line.token().startsWith("0/0/")).assertTrue();
      logStep("logSecurityDoublesPercentSuffix", line.text);
    });

    /**
     * @tc.name          logSecurityDoublesMixedMarkers
     * @tc.desc          Format markers in mixed markers are doubled so the logger cannot expand them.
     * @tc.precondition  The sanitizer doubles every percent sign before the line is emitted.
     * @tc.steps         1. Sanitize the format text mixed markers.
     *                   2. Count the percent characters in the output.
     *                   3. Check the format marker counter.
     *                   4. Verify no single marker survives.
     * @tc.expected      Every percent sign is doubled and the marker counter equals the input count.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityDoublesMixedMarkers', 0, () => {
      const raw: string = '%d%%';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.formatMarks).assertEqual(3);
      expect(line.text.split("%").length - 1).assertEqual(6);
      expect(line.injections).assertEqual(0);
      expect(line.escapes).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(line.text.length).assertEqual(7);
      expect(line.digest).assertEqual(textFingerprint(line.text));
      expect(line.token().startsWith("0/0/")).assertTrue();
      logStep("logSecurityDoublesMixedMarkers", line.text);
    });

    /**
     * @tc.name          logSecurityDoublesProgressMarker
     * @tc.desc          Format markers in progress marker are doubled so the logger cannot expand them.
     * @tc.precondition  The sanitizer doubles every percent sign before the line is emitted.
     * @tc.steps         1. Sanitize the format text progress marker.
     *                   2. Count the percent characters in the output.
     *                   3. Check the format marker counter.
     *                   4. Verify no single marker survives.
     * @tc.expected      Every percent sign is doubled and the marker counter equals the input count.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityDoublesProgressMarker', 0, () => {
      const raw: string = 'progress 50%';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.formatMarks).assertEqual(1);
      expect(line.text.split("%").length - 1).assertEqual(2);
      expect(line.injections).assertEqual(0);
      expect(line.escapes).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(line.text.length).assertEqual(13);
      expect(line.digest).assertEqual(textFingerprint(line.text));
      expect(line.token().startsWith("0/0/")).assertTrue();
      logStep("logSecurityDoublesProgressMarker", line.text);
    });

    /**
     * @tc.name          logSecurityDoublesPrivateFormatMarker
     * @tc.desc          Format markers in private format marker are doubled so the logger cannot expand them.
     * @tc.precondition  The sanitizer doubles every percent sign before the line is emitted.
     * @tc.steps         1. Sanitize the format text private format marker.
     *                   2. Count the percent characters in the output.
     *                   3. Check the format marker counter.
     *                   4. Verify no single marker survives.
     * @tc.expected      Every percent sign is doubled and the marker counter equals the input count.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityDoublesPrivateFormatMarker', 0, () => {
      const raw: string = '%{private}s';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.formatMarks).assertEqual(1);
      expect(line.text.split("%").length - 1).assertEqual(2);
      expect(line.injections).assertEqual(0);
      expect(line.escapes).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(line.text.length).assertEqual(12);
      expect(line.digest).assertEqual(textFingerprint(line.text));
      expect(line.token().startsWith("0/0/")).assertTrue();
      logStep("logSecurityDoublesPrivateFormatMarker", line.text);
    });

    /**
     * @tc.name          logSecurityDoublesTwoFormatMarkers
     * @tc.desc          Format markers in two format markers are doubled so the logger cannot expand them.
     * @tc.precondition  The sanitizer doubles every percent sign before the line is emitted.
     * @tc.steps         1. Sanitize the format text two format markers.
     *                   2. Count the percent characters in the output.
     *                   3. Check the format marker counter.
     *                   4. Verify no single marker survives.
     * @tc.expected      Every percent sign is doubled and the marker counter equals the input count.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityDoublesTwoFormatMarkers', 0, () => {
      const raw: string = 'two %{public}s args';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.formatMarks).assertEqual(1);
      expect(line.text.split("%").length - 1).assertEqual(2);
      expect(line.injections).assertEqual(0);
      expect(line.escapes).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(line.text.length).assertEqual(20);
      expect(line.digest).assertEqual(textFingerprint(line.text));
      expect(line.token().startsWith("0/0/")).assertTrue();
      logStep("logSecurityDoublesTwoFormatMarkers", line.text);
    });

    /**
     * @tc.name          logSecurityDoublesFourPercents
     * @tc.desc          Format markers in four percents are doubled so the logger cannot expand them.
     * @tc.precondition  The sanitizer doubles every percent sign before the line is emitted.
     * @tc.steps         1. Sanitize the format text four percents.
     *                   2. Count the percent characters in the output.
     *                   3. Check the format marker counter.
     *                   4. Verify no single marker survives.
     * @tc.expected      Every percent sign is doubled and the marker counter equals the input count.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityDoublesFourPercents', 0, () => {
      const raw: string = '%%%%';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.formatMarks).assertEqual(4);
      expect(line.text.split("%").length - 1).assertEqual(8);
      expect(line.injections).assertEqual(0);
      expect(line.escapes).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(line.text.length).assertEqual(8);
      expect(line.digest).assertEqual(textFingerprint(line.text));
      expect(line.token().startsWith("0/0/")).assertTrue();
      logStep("logSecurityDoublesFourPercents", line.text);
    });

    /**
     * @tc.name          logSecurityEscapesAnsiColourStart
     * @tc.desc          Terminal escape bytes in ansi colour start are neutralised before logging.
     * @tc.precondition  The raw escape byte is below 32 and must be hex escaped.
     * @tc.steps         1. Sanitize the ANSI payload ansi colour start.
     *                   2. Locate the escaped escape byte.
     *                   3. Count escapes and injections.
     *                   4. Confirm no raw escape byte remains.
     * @tc.expected      The escape byte becomes an uppercase hex pair and the printable tail survives.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityEscapesAnsiColourStart', 0, () => {
      const raw: string = '\u001b[31mred';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.escapes).assertEqual(1);
      expect(line.text.indexOf('x1B') >= 0).assertTrue();
      expect(line.text.indexOf("[")).assertEqual(4);
      expect(hasRawControl(line.text)).assertFalse();
      expect(line.injections).assertEqual(0);
      expect(line.formatMarks).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(line.digest).assertEqual(textFingerprint(line.text));
      logStep("logSecurityEscapesAnsiColourStart", line.text);
    });

    /**
     * @tc.name          logSecurityEscapesAnsiReset
     * @tc.desc          Terminal escape bytes in ansi reset are neutralised before logging.
     * @tc.precondition  The raw escape byte is below 32 and must be hex escaped.
     * @tc.steps         1. Sanitize the ANSI payload ansi reset.
     *                   2. Locate the escaped escape byte.
     *                   3. Count escapes and injections.
     *                   4. Confirm no raw escape byte remains.
     * @tc.expected      The escape byte becomes an uppercase hex pair and the printable tail survives.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityEscapesAnsiReset', 0, () => {
      const raw: string = '\u001b[0mreset';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.escapes).assertEqual(1);
      expect(line.text.indexOf('x1B') >= 0).assertTrue();
      expect(line.text.indexOf("[")).assertEqual(4);
      expect(hasRawControl(line.text)).assertFalse();
      expect(line.injections).assertEqual(0);
      expect(line.formatMarks).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(line.digest).assertEqual(textFingerprint(line.text));
      logStep("logSecurityEscapesAnsiReset", line.text);
    });

    /**
     * @tc.name          logSecurityEscapesAnsiBold
     * @tc.desc          Terminal escape bytes in ansi bold are neutralised before logging.
     * @tc.precondition  The raw escape byte is below 32 and must be hex escaped.
     * @tc.steps         1. Sanitize the ANSI payload ansi bold.
     *                   2. Locate the escaped escape byte.
     *                   3. Count escapes and injections.
     *                   4. Confirm no raw escape byte remains.
     * @tc.expected      The escape byte becomes an uppercase hex pair and the printable tail survives.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityEscapesAnsiBold', 0, () => {
      const raw: string = 'plain\u001b[1mbold';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.escapes).assertEqual(1);
      expect(line.text.indexOf('x1B') >= 0).assertTrue();
      expect(line.text.indexOf("[")).assertEqual(9);
      expect(hasRawControl(line.text)).assertFalse();
      expect(line.injections).assertEqual(0);
      expect(line.formatMarks).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(line.digest).assertEqual(textFingerprint(line.text));
      logStep("logSecurityEscapesAnsiBold", line.text);
    });

    /**
     * @tc.name          logSecurityEscapesDoubleEscape
     * @tc.desc          Terminal escape bytes in double escape are neutralised before logging.
     * @tc.precondition  The raw escape byte is below 32 and must be hex escaped.
     * @tc.steps         1. Sanitize the ANSI payload double escape.
     *                   2. Locate the escaped escape byte.
     *                   3. Count escapes and injections.
     *                   4. Confirm no raw escape byte remains.
     * @tc.expected      The escape byte becomes an uppercase hex pair and the printable tail survives.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityEscapesDoubleEscape', 0, () => {
      const raw: string = '\u001b\u001b';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.escapes).assertEqual(2);
      expect(line.text.indexOf('x1B') >= 0).assertTrue();
      expect(line.text.indexOf("[")).assertEqual(-1);
      expect(hasRawControl(line.text)).assertFalse();
      expect(line.injections).assertEqual(0);
      expect(line.formatMarks).assertEqual(0);
      expect(line.truncated).assertFalse();
      expect(line.digest).assertEqual(textFingerprint(line.text));
      logStep("logSecurityEscapesDoubleEscape", line.text);
    });

    /**
     * @tc.name          logSecurityTruncatesSixtyFive
     * @tc.desc          A line of 65 printable characters is clipped at the ceiling.
     * @tc.precondition  The sanitizer enforces a 64-character output budget.
     * @tc.steps         1. Grow a printable line to 65 characters.
     *                   2. Sanitize it and measure the output.
     *                   3. Check the ellipsis tail and the truncated flag.
     *                   4. Verify the prefix is preserved.
     * @tc.expected      The output stops at the ceiling, ends with three dots, and flags truncation.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityTruncatesSixtyFive', 0, () => {
      const raw: string = buildLongText(65);
      const line: SafeLine = sanitizeLine(raw);
      expect(raw.length).assertEqual(65);
      expect(line.text.length).assertEqual(MAX_LINE);
      expect(line.text.endsWith(ELLIPSIS)).assertTrue();
      expect(line.truncated).assertTrue();
      expect(line.injections).assertEqual(0);
      expect(line.escapes).assertEqual(0);
      expect(raw.startsWith(line.text.substring(0, 8))).assertTrue();
      expect(line.digest).assertEqual(textFingerprint(line.text));
      expect(line.token().endsWith("true")).assertTrue();
      logStep("logSecurityTruncatesSixtyFive", String(line.text.length));
    });

    /**
     * @tc.name          logSecurityTruncatesSeventy
     * @tc.desc          A line of 70 printable characters is clipped at the ceiling.
     * @tc.precondition  The sanitizer enforces a 64-character output budget.
     * @tc.steps         1. Grow a printable line to 70 characters.
     *                   2. Sanitize it and measure the output.
     *                   3. Check the ellipsis tail and the truncated flag.
     *                   4. Verify the prefix is preserved.
     * @tc.expected      The output stops at the ceiling, ends with three dots, and flags truncation.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityTruncatesSeventy', 0, () => {
      const raw: string = buildLongText(70);
      const line: SafeLine = sanitizeLine(raw);
      expect(raw.length).assertEqual(70);
      expect(line.text.length).assertEqual(MAX_LINE);
      expect(line.text.endsWith(ELLIPSIS)).assertTrue();
      expect(line.truncated).assertTrue();
      expect(line.injections).assertEqual(0);
      expect(line.escapes).assertEqual(0);
      expect(raw.startsWith(line.text.substring(0, 8))).assertTrue();
      expect(line.digest).assertEqual(textFingerprint(line.text));
      expect(line.token().endsWith("true")).assertTrue();
      logStep("logSecurityTruncatesSeventy", String(line.text.length));
    });

    /**
     * @tc.name          logSecurityTruncatesEighty
     * @tc.desc          A line of 80 printable characters is clipped at the ceiling.
     * @tc.precondition  The sanitizer enforces a 64-character output budget.
     * @tc.steps         1. Grow a printable line to 80 characters.
     *                   2. Sanitize it and measure the output.
     *                   3. Check the ellipsis tail and the truncated flag.
     *                   4. Verify the prefix is preserved.
     * @tc.expected      The output stops at the ceiling, ends with three dots, and flags truncation.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityTruncatesEighty', 0, () => {
      const raw: string = buildLongText(80);
      const line: SafeLine = sanitizeLine(raw);
      expect(raw.length).assertEqual(80);
      expect(line.text.length).assertEqual(MAX_LINE);
      expect(line.text.endsWith(ELLIPSIS)).assertTrue();
      expect(line.truncated).assertTrue();
      expect(line.injections).assertEqual(0);
      expect(line.escapes).assertEqual(0);
      expect(raw.startsWith(line.text.substring(0, 8))).assertTrue();
      expect(line.digest).assertEqual(textFingerprint(line.text));
      expect(line.token().endsWith("true")).assertTrue();
      logStep("logSecurityTruncatesEighty", String(line.text.length));
    });

    /**
     * @tc.name          logSecurityTruncatesNinetySix
     * @tc.desc          A line of 96 printable characters is clipped at the ceiling.
     * @tc.precondition  The sanitizer enforces a 64-character output budget.
     * @tc.steps         1. Grow a printable line to 96 characters.
     *                   2. Sanitize it and measure the output.
     *                   3. Check the ellipsis tail and the truncated flag.
     *                   4. Verify the prefix is preserved.
     * @tc.expected      The output stops at the ceiling, ends with three dots, and flags truncation.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityTruncatesNinetySix', 0, () => {
      const raw: string = buildLongText(96);
      const line: SafeLine = sanitizeLine(raw);
      expect(raw.length).assertEqual(96);
      expect(line.text.length).assertEqual(MAX_LINE);
      expect(line.text.endsWith(ELLIPSIS)).assertTrue();
      expect(line.truncated).assertTrue();
      expect(line.injections).assertEqual(0);
      expect(line.escapes).assertEqual(0);
      expect(raw.startsWith(line.text.substring(0, 8))).assertTrue();
      expect(line.digest).assertEqual(textFingerprint(line.text));
      expect(line.token().endsWith("true")).assertTrue();
      logStep("logSecurityTruncatesNinetySix", String(line.text.length));
    });

    /**
     * @tc.name          logSecurityTruncatesOneTwentyEight
     * @tc.desc          A line of 128 printable characters is clipped at the ceiling.
     * @tc.precondition  The sanitizer enforces a 64-character output budget.
     * @tc.steps         1. Grow a printable line to 128 characters.
     *                   2. Sanitize it and measure the output.
     *                   3. Check the ellipsis tail and the truncated flag.
     *                   4. Verify the prefix is preserved.
     * @tc.expected      The output stops at the ceiling, ends with three dots, and flags truncation.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityTruncatesOneTwentyEight', 0, () => {
      const raw: string = buildLongText(128);
      const line: SafeLine = sanitizeLine(raw);
      expect(raw.length).assertEqual(128);
      expect(line.text.length).assertEqual(MAX_LINE);
      expect(line.text.endsWith(ELLIPSIS)).assertTrue();
      expect(line.truncated).assertTrue();
      expect(line.injections).assertEqual(0);
      expect(line.escapes).assertEqual(0);
      expect(raw.startsWith(line.text.substring(0, 8))).assertTrue();
      expect(line.digest).assertEqual(textFingerprint(line.text));
      expect(line.token().endsWith("true")).assertTrue();
      logStep("logSecurityTruncatesOneTwentyEight", String(line.text.length));
    });

    /**
     * @tc.name          logSecurityTruncatesTwoHundred
     * @tc.desc          A line of 200 printable characters is clipped at the ceiling.
     * @tc.precondition  The sanitizer enforces a 64-character output budget.
     * @tc.steps         1. Grow a printable line to 200 characters.
     *                   2. Sanitize it and measure the output.
     *                   3. Check the ellipsis tail and the truncated flag.
     *                   4. Verify the prefix is preserved.
     * @tc.expected      The output stops at the ceiling, ends with three dots, and flags truncation.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityTruncatesTwoHundred', 0, () => {
      const raw: string = buildLongText(200);
      const line: SafeLine = sanitizeLine(raw);
      expect(raw.length).assertEqual(200);
      expect(line.text.length).assertEqual(MAX_LINE);
      expect(line.text.endsWith(ELLIPSIS)).assertTrue();
      expect(line.truncated).assertTrue();
      expect(line.injections).assertEqual(0);
      expect(line.escapes).assertEqual(0);
      expect(raw.startsWith(line.text.substring(0, 8))).assertTrue();
      expect(line.digest).assertEqual(textFingerprint(line.text));
      expect(line.token().endsWith("true")).assertTrue();
      logStep("logSecurityTruncatesTwoHundred", String(line.text.length));
    });

    /**
     * @tc.name          logSecurityTruncatesThreeHundred
     * @tc.desc          A line of 300 printable characters is clipped at the ceiling.
     * @tc.precondition  The sanitizer enforces a 64-character output budget.
     * @tc.steps         1. Grow a printable line to 300 characters.
     *                   2. Sanitize it and measure the output.
     *                   3. Check the ellipsis tail and the truncated flag.
     *                   4. Verify the prefix is preserved.
     * @tc.expected      The output stops at the ceiling, ends with three dots, and flags truncation.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityTruncatesThreeHundred', 0, () => {
      const raw: string = buildLongText(300);
      const line: SafeLine = sanitizeLine(raw);
      expect(raw.length).assertEqual(300);
      expect(line.text.length).assertEqual(MAX_LINE);
      expect(line.text.endsWith(ELLIPSIS)).assertTrue();
      expect(line.truncated).assertTrue();
      expect(line.injections).assertEqual(0);
      expect(line.escapes).assertEqual(0);
      expect(raw.startsWith(line.text.substring(0, 8))).assertTrue();
      expect(line.digest).assertEqual(textFingerprint(line.text));
      expect(line.token().endsWith("true")).assertTrue();
      logStep("logSecurityTruncatesThreeHundred", String(line.text.length));
    });

    /**
     * @tc.name          logSecurityTruncatesFiveHundred
     * @tc.desc          A line of 500 printable characters is clipped at the ceiling.
     * @tc.precondition  The sanitizer enforces a 64-character output budget.
     * @tc.steps         1. Grow a printable line to 500 characters.
     *                   2. Sanitize it and measure the output.
     *                   3. Check the ellipsis tail and the truncated flag.
     *                   4. Verify the prefix is preserved.
     * @tc.expected      The output stops at the ceiling, ends with three dots, and flags truncation.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityTruncatesFiveHundred', 0, () => {
      const raw: string = buildLongText(500);
      const line: SafeLine = sanitizeLine(raw);
      expect(raw.length).assertEqual(500);
      expect(line.text.length).assertEqual(MAX_LINE);
      expect(line.text.endsWith(ELLIPSIS)).assertTrue();
      expect(line.truncated).assertTrue();
      expect(line.injections).assertEqual(0);
      expect(line.escapes).assertEqual(0);
      expect(raw.startsWith(line.text.substring(0, 8))).assertTrue();
      expect(line.digest).assertEqual(textFingerprint(line.text));
      expect(line.token().endsWith("true")).assertTrue();
      logStep("logSecurityTruncatesFiveHundred", String(line.text.length));
    });

    /**
     * @tc.name          logSecurityBuffersInfoHello
     * @tc.desc          Sanitized info hello is stored under the LEVEL_INFO level.
     * @tc.precondition  A bounded LogBuffer with an eight-line limit is available.
     * @tc.steps         1. Sanitize the payload and store it in the buffer.
     *                   2. Read the level counters and trace.
     *                   3. Check the stored prefix and fragment.
     *                   4. Repeat the store and confirm the count.
     * @tc.expected      One sanitized entry is stored under the requested level with no break characters.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityBuffersInfoHello', 0, () => {
      const buffer: LogBuffer = makeBuffer(8);
      const line: SafeLine = sanitizeLine('hello');
      buffer.info(line.text);
      buffer.info(line.text);
      expect(buffer.size()).assertEqual(2);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(buffer.levels[0]).assertEqual(LEVEL_INFO);
      expect(buffer.lines[0].startsWith(LEVEL_INFO + " ")).assertTrue();
      expect(buffer.contains(line.text)).assertTrue();
      expect(buffer.trace().indexOf("\n")).assertEqual(-1);
      expect(line.injections).assertEqual(0);
      expect(buffer.trace().split("|").length).assertEqual(2);
      logStep("logSecurityBuffersInfoHello", buffer.trace());
    });

    /**
     * @tc.name          logSecurityBuffersInfoLifecycle
     * @tc.desc          Sanitized info lifecycle is stored under the LEVEL_INFO level.
     * @tc.precondition  A bounded LogBuffer with an eight-line limit is available.
     * @tc.steps         1. Sanitize the payload and store it in the buffer.
     *                   2. Read the level counters and trace.
     *                   3. Check the stored prefix and fragment.
     *                   4. Repeat the store and confirm the count.
     * @tc.expected      One sanitized entry is stored under the requested level with no break characters.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityBuffersInfoLifecycle', 0, () => {
      const buffer: LogBuffer = makeBuffer(8);
      const line: SafeLine = sanitizeLine('onCreate');
      buffer.info(line.text);
      buffer.info(line.text);
      expect(buffer.size()).assertEqual(2);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(buffer.levels[0]).assertEqual(LEVEL_INFO);
      expect(buffer.lines[0].startsWith(LEVEL_INFO + " ")).assertTrue();
      expect(buffer.contains(line.text)).assertTrue();
      expect(buffer.trace().indexOf("\n")).assertEqual(-1);
      expect(line.injections).assertEqual(0);
      expect(buffer.trace().split("|").length).assertEqual(2);
      logStep("logSecurityBuffersInfoLifecycle", buffer.trace());
    });

    /**
     * @tc.name          logSecurityBuffersWarnRejection
     * @tc.desc          Sanitized warn rejection is stored under the LEVEL_WARN level.
     * @tc.precondition  A bounded LogBuffer with an eight-line limit is available.
     * @tc.steps         1. Sanitize the payload and store it in the buffer.
     *                   2. Read the level counters and trace.
     *                   3. Check the stored prefix and fragment.
     *                   4. Repeat the store and confirm the count.
     * @tc.expected      One sanitized entry is stored under the requested level with no break characters.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityBuffersWarnRejection', 0, () => {
      const buffer: LogBuffer = makeBuffer(8);
      const line: SafeLine = sanitizeLine('code 2 rejected');
      buffer.warn(line.text);
      buffer.warn(line.text);
      expect(buffer.size()).assertEqual(2);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(2);
      expect(buffer.levels[0]).assertEqual(LEVEL_WARN);
      expect(buffer.lines[0].startsWith(LEVEL_WARN + " ")).assertTrue();
      expect(buffer.contains(line.text)).assertTrue();
      expect(buffer.trace().indexOf("\n")).assertEqual(-1);
      expect(line.injections).assertEqual(0);
      expect(buffer.trace().split("|").length).assertEqual(2);
      logStep("logSecurityBuffersWarnRejection", buffer.trace());
    });

    /**
     * @tc.name          logSecurityBuffersWarnSlow
     * @tc.desc          Sanitized warn slow request is stored under the LEVEL_WARN level.
     * @tc.precondition  A bounded LogBuffer with an eight-line limit is available.
     * @tc.steps         1. Sanitize the payload and store it in the buffer.
     *                   2. Read the level counters and trace.
     *                   3. Check the stored prefix and fragment.
     *                   4. Repeat the store and confirm the count.
     * @tc.expected      One sanitized entry is stored under the requested level with no break characters.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityBuffersWarnSlow', 0, () => {
      const buffer: LogBuffer = makeBuffer(8);
      const line: SafeLine = sanitizeLine('slow request');
      buffer.warn(line.text);
      buffer.warn(line.text);
      expect(buffer.size()).assertEqual(2);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(2);
      expect(buffer.levels[0]).assertEqual(LEVEL_WARN);
      expect(buffer.lines[0].startsWith(LEVEL_WARN + " ")).assertTrue();
      expect(buffer.contains(line.text)).assertTrue();
      expect(buffer.trace().indexOf("\n")).assertEqual(-1);
      expect(line.injections).assertEqual(0);
      expect(buffer.trace().split("|").length).assertEqual(2);
      logStep("logSecurityBuffersWarnSlow", buffer.trace());
    });

    /**
     * @tc.name          logSecurityBuffersErrorRejection
     * @tc.desc          Sanitized error rejection is stored under the LEVEL_ERROR level.
     * @tc.precondition  A bounded LogBuffer with an eight-line limit is available.
     * @tc.steps         1. Sanitize the payload and store it in the buffer.
     *                   2. Read the level counters and trace.
     *                   3. Check the stored prefix and fragment.
     *                   4. Repeat the store and confirm the count.
     * @tc.expected      One sanitized entry is stored under the requested level with no break characters.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityBuffersErrorRejection', 0, () => {
      const buffer: LogBuffer = makeBuffer(8);
      const line: SafeLine = sanitizeLine('stub rejected');
      buffer.error(line.text);
      buffer.error(line.text);
      expect(buffer.size()).assertEqual(2);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(2);
      expect(buffer.levels[0]).assertEqual(LEVEL_ERROR);
      expect(buffer.lines[0].startsWith(LEVEL_ERROR + " ")).assertTrue();
      expect(buffer.contains(line.text)).assertTrue();
      expect(buffer.trace().indexOf("\n")).assertEqual(-1);
      expect(line.injections).assertEqual(0);
      expect(buffer.trace().split("|").length).assertEqual(2);
      logStep("logSecurityBuffersErrorRejection", buffer.trace());
    });

    /**
     * @tc.name          logSecurityBuffersErrorPin
     * @tc.desc          Sanitized error pin mismatch is stored under the LEVEL_ERROR level.
     * @tc.precondition  A bounded LogBuffer with an eight-line limit is available.
     * @tc.steps         1. Sanitize the payload and store it in the buffer.
     *                   2. Read the level counters and trace.
     *                   3. Check the stored prefix and fragment.
     *                   4. Repeat the store and confirm the count.
     * @tc.expected      One sanitized entry is stored under the requested level with no break characters.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityBuffersErrorPin', 0, () => {
      const buffer: LogBuffer = makeBuffer(8);
      const line: SafeLine = sanitizeLine('pin mismatch');
      buffer.error(line.text);
      buffer.error(line.text);
      expect(buffer.size()).assertEqual(2);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(2);
      expect(buffer.levels[0]).assertEqual(LEVEL_ERROR);
      expect(buffer.lines[0].startsWith(LEVEL_ERROR + " ")).assertTrue();
      expect(buffer.contains(line.text)).assertTrue();
      expect(buffer.trace().indexOf("\n")).assertEqual(-1);
      expect(line.injections).assertEqual(0);
      expect(buffer.trace().split("|").length).assertEqual(2);
      logStep("logSecurityBuffersErrorPin", buffer.trace());
    });

    /**
     * @tc.name          logSecurityBuffersInfoMarker
     * @tc.desc          Sanitized info marker text is stored under the LEVEL_INFO level.
     * @tc.precondition  A bounded LogBuffer with an eight-line limit is available.
     * @tc.steps         1. Sanitize the payload and store it in the buffer.
     *                   2. Read the level counters and trace.
     *                   3. Check the stored prefix and fragment.
     *                   4. Repeat the store and confirm the count.
     * @tc.expected      One sanitized entry is stored under the requested level with no break characters.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityBuffersInfoMarker', 0, () => {
      const buffer: LogBuffer = makeBuffer(8);
      const line: SafeLine = sanitizeLine('token=abc');
      buffer.info(line.text);
      buffer.info(line.text);
      expect(buffer.size()).assertEqual(2);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(buffer.levels[0]).assertEqual(LEVEL_INFO);
      expect(buffer.lines[0].startsWith(LEVEL_INFO + " ")).assertTrue();
      expect(buffer.contains(line.text)).assertTrue();
      expect(buffer.trace().indexOf("\n")).assertEqual(-1);
      expect(line.injections).assertEqual(0);
      expect(buffer.trace().split("|").length).assertEqual(2);
      logStep("logSecurityBuffersInfoMarker", buffer.trace());
    });

    /**
     * @tc.name          logSecurityBuffersWarnFlattened
     * @tc.desc          Sanitized warn flattened is stored under the LEVEL_WARN level.
     * @tc.precondition  A bounded LogBuffer with an eight-line limit is available.
     * @tc.steps         1. Sanitize the payload and store it in the buffer.
     *                   2. Read the level counters and trace.
     *                   3. Check the stored prefix and fragment.
     *                   4. Repeat the store and confirm the count.
     * @tc.expected      One sanitized entry is stored under the requested level with no break characters.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityBuffersWarnFlattened', 0, () => {
      const buffer: LogBuffer = makeBuffer(8);
      const line: SafeLine = sanitizeLine('a\nb');
      buffer.warn(line.text);
      buffer.warn(line.text);
      expect(buffer.size()).assertEqual(2);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(2);
      expect(buffer.levels[0]).assertEqual(LEVEL_WARN);
      expect(buffer.lines[0].startsWith(LEVEL_WARN + " ")).assertTrue();
      expect(buffer.contains(line.text)).assertTrue();
      expect(buffer.trace().indexOf("\n")).assertEqual(-1);
      expect(line.injections).assertEqual(1);
      expect(buffer.trace().split("|").length).assertEqual(2);
      logStep("logSecurityBuffersWarnFlattened", buffer.trace());
    });

    /**
     * @tc.name          logSecurityFlattensLineSeparator
     * @tc.desc          Unicode line separator in line separator is treated as an injection.
     * @tc.precondition  Code points 8232 and 8233 are flattened alongside ASCII breaks.
     * @tc.steps         1. Sanitize the unicode separated payload.
     *                   2. Count the injection replacements.
     *                   3. Compare the flattened text with the expectation.
     *                   4. Check the escaped-byte counter stays zero.
     * @tc.expected      The separator becomes a space and the payload remains on one line.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityFlattensLineSeparator', 0, () => {
      const raw: string = 'a\u2028b';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.text).assertEqual('a b');
      expect(line.injections).assertEqual(1);
      expect(line.escapes).assertEqual(0);
      expect(line.text.indexOf("\u2028")).assertEqual(-1);
      expect(line.text.indexOf("\u2029")).assertEqual(-1);
      expect(line.text.length).assertEqual(3);
      expect(line.digest).assertEqual(textFingerprint(line.text));
      expect(line.truncated).assertFalse();
      logStep("logSecurityFlattensLineSeparator", line.text);
    });

    /**
     * @tc.name          logSecurityFlattensParagraphSeparator
     * @tc.desc          Unicode line separator in paragraph separator is treated as an injection.
     * @tc.precondition  Code points 8232 and 8233 are flattened alongside ASCII breaks.
     * @tc.steps         1. Sanitize the unicode separated payload.
     *                   2. Count the injection replacements.
     *                   3. Compare the flattened text with the expectation.
     *                   4. Check the escaped-byte counter stays zero.
     * @tc.expected      The separator becomes a space and the payload remains on one line.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityFlattensParagraphSeparator', 0, () => {
      const raw: string = 'a\u2029b';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.text).assertEqual('a b');
      expect(line.injections).assertEqual(1);
      expect(line.escapes).assertEqual(0);
      expect(line.text.indexOf("\u2028")).assertEqual(-1);
      expect(line.text.indexOf("\u2029")).assertEqual(-1);
      expect(line.text.length).assertEqual(3);
      expect(line.digest).assertEqual(textFingerprint(line.text));
      expect(line.truncated).assertFalse();
      logStep("logSecurityFlattensParagraphSeparator", line.text);
    });

    /**
     * @tc.name          logSecurityFlattensUpperSeparator
     * @tc.desc          Unicode line separator in upper separator is treated as an injection.
     * @tc.precondition  Code points 8232 and 8233 are flattened alongside ASCII breaks.
     * @tc.steps         1. Sanitize the unicode separated payload.
     *                   2. Count the injection replacements.
     *                   3. Compare the flattened text with the expectation.
     *                   4. Check the escaped-byte counter stays zero.
     * @tc.expected      The separator becomes a space and the payload remains on one line.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityFlattensUpperSeparator', 0, () => {
      const raw: string = 'X\u2028Y';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.text).assertEqual('X Y');
      expect(line.injections).assertEqual(1);
      expect(line.escapes).assertEqual(0);
      expect(line.text.indexOf("\u2028")).assertEqual(-1);
      expect(line.text.indexOf("\u2029")).assertEqual(-1);
      expect(line.text.length).assertEqual(3);
      expect(line.digest).assertEqual(textFingerprint(line.text));
      expect(line.truncated).assertFalse();
      logStep("logSecurityFlattensUpperSeparator", line.text);
    });

    /**
     * @tc.name          logSecurityFlattensDigitSeparator
     * @tc.desc          Unicode line separator in digit separator is treated as an injection.
     * @tc.precondition  Code points 8232 and 8233 are flattened alongside ASCII breaks.
     * @tc.steps         1. Sanitize the unicode separated payload.
     *                   2. Count the injection replacements.
     *                   3. Compare the flattened text with the expectation.
     *                   4. Check the escaped-byte counter stays zero.
     * @tc.expected      The separator becomes a space and the payload remains on one line.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('logSecurityFlattensDigitSeparator', 0, () => {
      const raw: string = '1\u2029Z';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.text).assertEqual('1 Z');
      expect(line.injections).assertEqual(1);
      expect(line.escapes).assertEqual(0);
      expect(line.text.indexOf("\u2028")).assertEqual(-1);
      expect(line.text.indexOf("\u2029")).assertEqual(-1);
      expect(line.text.length).assertEqual(3);
      expect(line.digest).assertEqual(textFingerprint(line.text));
      expect(line.truncated).assertFalse();
      logStep("logSecurityFlattensDigitSeparator", line.text);
    });

    /**
     * @tc.name          logSecurityCountsMixedBreaks
     * @tc.desc          Combined hostile input mixed breaks reports every sanitizer counter.
     * @tc.precondition  The payload mixes breaks, control bytes and format markers.
     * @tc.steps         1. Sanitize the combined payload mixed breaks.
     *                   2. Read all four counters.
     *                   3. Verify raw control bytes are gone.
     *                   4. Recompute the digest of the output.
     * @tc.expected      Each hostile class is counted separately and the output is printable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logSecurityCountsMixedBreaks', 0, () => {
      const raw: string = 'a\nb\tc';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.injections).assertEqual(2);
      expect(line.escapes).assertEqual(0);
      expect(line.formatMarks).assertEqual(0);
      expect(line.truncated).assertEqual(false);
      expect(hasRawControl(line.text)).assertFalse();
      expect(line.text.indexOf("\n")).assertEqual(-1);
      expect(line.text.indexOf("\t")).assertEqual(-1);
      expect(line.text.split("%").length - 1).assertEqual(0);
      expect(line.digest).assertEqual(textFingerprint(line.text));
      expect(line.text.length > 0).assertTrue();
      logStep("logSecurityCountsMixedBreaks", line.token());
    });

    /**
     * @tc.name          logSecurityCountsEscapeBreakMarker
     * @tc.desc          Combined hostile input escape break marker reports every sanitizer counter.
     * @tc.precondition  The payload mixes breaks, control bytes and format markers.
     * @tc.steps         1. Sanitize the combined payload escape break marker.
     *                   2. Read all four counters.
     *                   3. Verify raw control bytes are gone.
     *                   4. Recompute the digest of the output.
     * @tc.expected      Each hostile class is counted separately and the output is printable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logSecurityCountsEscapeBreakMarker', 0, () => {
      const raw: string = '\u001b\n%';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.injections).assertEqual(1);
      expect(line.escapes).assertEqual(1);
      expect(line.formatMarks).assertEqual(1);
      expect(line.truncated).assertEqual(false);
      expect(hasRawControl(line.text)).assertFalse();
      expect(line.text.indexOf("\n")).assertEqual(-1);
      expect(line.text.indexOf("\t")).assertEqual(-1);
      expect(line.text.split("%").length - 1).assertEqual(2);
      expect(line.digest).assertEqual(textFingerprint(line.text));
      expect(line.text.length > 0).assertTrue();
      logStep("logSecurityCountsEscapeBreakMarker", line.token());
    });

    /**
     * @tc.name          logSecurityCountsTruncatedInjection
     * @tc.desc          Combined hostile input truncated injection reports every sanitizer counter.
     * @tc.precondition  The payload mixes breaks, control bytes and format markers.
     * @tc.steps         1. Sanitize the combined payload truncated injection.
     *                   2. Read all four counters.
     *                   3. Verify raw control bytes are gone.
     *                   4. Recompute the digest of the output.
     * @tc.expected      Each hostile class is counted separately and the output is printable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logSecurityCountsTruncatedInjection', 0, () => {
      const raw: string = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\ny';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.injections).assertEqual(1);
      expect(line.escapes).assertEqual(0);
      expect(line.formatMarks).assertEqual(0);
      expect(line.truncated).assertEqual(true);
      expect(hasRawControl(line.text)).assertFalse();
      expect(line.text.indexOf("\n")).assertEqual(-1);
      expect(line.text.indexOf("\t")).assertEqual(-1);
      expect(line.text.split("%").length - 1).assertEqual(0);
      expect(line.digest).assertEqual(textFingerprint(line.text));
      expect(line.text.length > 0).assertTrue();
      logStep("logSecurityCountsTruncatedInjection", line.token());
    });

    /**
     * @tc.name          logSecurityCountsNullWithMarker
     * @tc.desc          Combined hostile input null with marker reports every sanitizer counter.
     * @tc.precondition  The payload mixes breaks, control bytes and format markers.
     * @tc.steps         1. Sanitize the combined payload null with marker.
     *                   2. Read all four counters.
     *                   3. Verify raw control bytes are gone.
     *                   4. Recompute the digest of the output.
     * @tc.expected      Each hostile class is counted separately and the output is printable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('logSecurityCountsNullWithMarker', 0, () => {
      const raw: string = '%\u0000';
      const line: SafeLine = sanitizeLine(raw);
      expect(line.injections).assertEqual(0);
      expect(line.escapes).assertEqual(1);
      expect(line.formatMarks).assertEqual(1);
      expect(line.truncated).assertEqual(false);
      expect(hasRawControl(line.text)).assertFalse();
      expect(line.text.indexOf("\n")).assertEqual(-1);
      expect(line.text.indexOf("\t")).assertEqual(-1);
      expect(line.text.split("%").length - 1).assertEqual(2);
      expect(line.digest).assertEqual(textFingerprint(line.text));
      expect(line.text.length > 0).assertTrue();
      logStep("logSecurityCountsNullWithMarker", line.token());
    });
  });
}
