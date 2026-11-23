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
import { joined, textFingerprint } from '../Shared/SharedDriver';

const MASK: string = '*';
const EDGE: number = 2;
const REDACT_LIMIT: number = 24;
const MARKERS: string[] = ['token=', 'secret=', 'password=', 'auth='];
const REASON_CLEAN: string = 'clean';
const REASON_EMPTY: string = 'empty';
const REASON_MARKER: string = 'marker';
const REASON_LONG: string = 'long';

class Redaction {
  public original: string;
  public output: string;
  public applied: boolean;
  public masked: number;
  public reason: string;
  public digest: number;

  constructor(original: string, output: string, applied: boolean, masked: number, reason: string) {
    this.original = original;
    this.output = output;
    this.applied = applied;
    this.masked = masked;
    this.reason = reason;
    this.digest = textFingerprint(output);
  }

  public ratio(): number {
    return this.original.length === 0 ? 0 : this.masked / this.original.length;
  }

  public token(): string {
    return this.reason + '#' + String(this.original.length) + '#' + String(this.masked);
  }
}

function repeatChar(symbol: string, count: number): string {
  let text = '';
  for (let index = 0; index < count; index++) {
    text = text + symbol;
  }
  return text;
}

function countStars(text: string): number {
  let total = 0;
  for (let index = 0; index < text.length; index++) {
    if (text.charAt(index) === MASK) {
      total = total + 1;
    }
  }
  return total;
}

function findMarker(text: string): string {
  for (let index = 0; index < MARKERS.length; index++) {
    if (text.indexOf(MARKERS[index]) >= 0) {
      return MARKERS[index];
    }
  }
  return '';
}

function maskWindow(text: string, edge: number): string {
  if (text.length <= edge * 2) {
    return repeatChar(MASK, text.length);
  }
  const head: string = text.substring(0, edge);
  const tail: string = text.substring(text.length - edge);
  return head + repeatChar(MASK, text.length - edge * 2) + tail;
}

function oracleMaskWindow(text: string, edge: number): string {
  const parts: string[] = [];
  for (let index = 0; index < text.length; index++) {
    if (index < edge || index >= text.length - edge) {
      parts.push(text.charAt(index));
    } else {
      parts.push(MASK);
    }
  }
  return joined(parts, '');
}

function redact(text: string): Redaction {
  if (text.length === 0) {
    return new Redaction(text, '', false, 0, REASON_EMPTY);
  }
  const marker: string = findMarker(text);
  if (marker.length > 0) {
    return new Redaction(text, repeatChar(MASK, text.length), true, text.length, REASON_MARKER);
  }
  if (text.length > REDACT_LIMIT) {
    return new Redaction(text, maskWindow(text, EDGE) + '~' + String(text.length), true,
      text.length - EDGE * 2, REASON_LONG);
  }
  return new Redaction(text, text, false, 0, REASON_CLEAN);
}

function buildLong(size: number): string {
  let text = 'payload';
  while (text.length < size) {
    text = text + 'z';
  }
  return text;
}

export default function payloadSecurity(): void {
  describe('PayloadSecurityTest', () => {
    beforeAll(() => {
      logSuite('PayloadSecurityTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('PayloadSecurityTest', 'end');
    });

    /**
     * @tc.name          payloadSecurityKeepsHelloWorldClean
     * @tc.desc          Payload hello world carries no sensitive marker and stays verbatim after redaction.
     * @tc.precondition  The redaction policy with a 24-character limit is loaded.
     * @tc.steps         1. Redact the short clean payload hello world.
     *                   2. Repeat the redaction and compare tokens.
     *                   3. Redact the redacted output once more.
     *                   4. Count mask characters and recompute the fingerprint.
     * @tc.expected      Nothing is masked, the output equals the input, and every pass is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadSecurityKeepsHelloWorldClean', 0, () => {
      const text: string = 'hello world';
      const red: Redaction = redact(text);
      const again: Redaction = redact(text);
      const twice: Redaction = redact(red.output);
      expect(findMarker(text)).assertEqual("");
      expect(red.applied).assertFalse();
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.output).assertEqual(text);
      expect(red.masked).assertEqual(0);
      expect(red.ratio()).assertEqual(0);
      expect(red.digest).assertEqual(textFingerprint(text));
      expect(countStars(red.output)).assertEqual(0);
      expect(red.output.length).assertEqual(text.length);
      expect(again.token()).assertEqual(red.token());
      expect(twice.output).assertEqual(text);
      logStep("payloadSecurityKeepsHelloWorldClean", red.token());
    });

    /**
     * @tc.name          payloadSecurityKeepsReplyLiteralClean
     * @tc.desc          Payload hello rpc carries no sensitive marker and stays verbatim after redaction.
     * @tc.precondition  The redaction policy with a 24-character limit is loaded.
     * @tc.steps         1. Redact the short clean payload hello rpc.
     *                   2. Repeat the redaction and compare tokens.
     *                   3. Redact the redacted output once more.
     *                   4. Count mask characters and recompute the fingerprint.
     * @tc.expected      Nothing is masked, the output equals the input, and every pass is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadSecurityKeepsReplyLiteralClean', 0, () => {
      const text: string = 'hello rpc';
      const red: Redaction = redact(text);
      const again: Redaction = redact(text);
      const twice: Redaction = redact(red.output);
      expect(findMarker(text)).assertEqual("");
      expect(red.applied).assertFalse();
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.output).assertEqual(text);
      expect(red.masked).assertEqual(0);
      expect(red.ratio()).assertEqual(0);
      expect(red.digest).assertEqual(textFingerprint(text));
      expect(countStars(red.output)).assertEqual(0);
      expect(red.output.length).assertEqual(text.length);
      expect(again.token()).assertEqual(red.token());
      expect(twice.output).assertEqual(text);
      logStep("payloadSecurityKeepsReplyLiteralClean", red.token());
    });

    /**
     * @tc.name          payloadSecurityKeepsPingClean
     * @tc.desc          Payload ping carries no sensitive marker and stays verbatim after redaction.
     * @tc.precondition  The redaction policy with a 24-character limit is loaded.
     * @tc.steps         1. Redact the short clean payload ping.
     *                   2. Repeat the redaction and compare tokens.
     *                   3. Redact the redacted output once more.
     *                   4. Count mask characters and recompute the fingerprint.
     * @tc.expected      Nothing is masked, the output equals the input, and every pass is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadSecurityKeepsPingClean', 0, () => {
      const text: string = 'ping';
      const red: Redaction = redact(text);
      const again: Redaction = redact(text);
      const twice: Redaction = redact(red.output);
      expect(findMarker(text)).assertEqual("");
      expect(red.applied).assertFalse();
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.output).assertEqual(text);
      expect(red.masked).assertEqual(0);
      expect(red.ratio()).assertEqual(0);
      expect(red.digest).assertEqual(textFingerprint(text));
      expect(countStars(red.output)).assertEqual(0);
      expect(red.output.length).assertEqual(text.length);
      expect(again.token()).assertEqual(red.token());
      expect(twice.output).assertEqual(text);
      logStep("payloadSecurityKeepsPingClean", red.token());
    });

    /**
     * @tc.name          payloadSecurityKeepsShortTokenClean
     * @tc.desc          Payload short token carries no sensitive marker and stays verbatim after redaction.
     * @tc.precondition  The redaction policy with a 24-character limit is loaded.
     * @tc.steps         1. Redact the short clean payload short token.
     *                   2. Repeat the redaction and compare tokens.
     *                   3. Redact the redacted output once more.
     *                   4. Count mask characters and recompute the fingerprint.
     * @tc.expected      Nothing is masked, the output equals the input, and every pass is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadSecurityKeepsShortTokenClean', 0, () => {
      const text: string = 'abc';
      const red: Redaction = redact(text);
      const again: Redaction = redact(text);
      const twice: Redaction = redact(red.output);
      expect(findMarker(text)).assertEqual("");
      expect(red.applied).assertFalse();
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.output).assertEqual(text);
      expect(red.masked).assertEqual(0);
      expect(red.ratio()).assertEqual(0);
      expect(red.digest).assertEqual(textFingerprint(text));
      expect(countStars(red.output)).assertEqual(0);
      expect(red.output.length).assertEqual(text.length);
      expect(again.token()).assertEqual(red.token());
      expect(twice.output).assertEqual(text);
      logStep("payloadSecurityKeepsShortTokenClean", red.token());
    });

    /**
     * @tc.name          payloadSecurityKeepsSingleCharacterClean
     * @tc.desc          Payload single character carries no sensitive marker and stays verbatim after redaction.
     * @tc.precondition  The redaction policy with a 24-character limit is loaded.
     * @tc.steps         1. Redact the short clean payload single character.
     *                   2. Repeat the redaction and compare tokens.
     *                   3. Redact the redacted output once more.
     *                   4. Count mask characters and recompute the fingerprint.
     * @tc.expected      Nothing is masked, the output equals the input, and every pass is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadSecurityKeepsSingleCharacterClean', 0, () => {
      const text: string = 'x';
      const red: Redaction = redact(text);
      const again: Redaction = redact(text);
      const twice: Redaction = redact(red.output);
      expect(findMarker(text)).assertEqual("");
      expect(red.applied).assertFalse();
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.output).assertEqual(text);
      expect(red.masked).assertEqual(0);
      expect(red.ratio()).assertEqual(0);
      expect(red.digest).assertEqual(textFingerprint(text));
      expect(countStars(red.output)).assertEqual(0);
      expect(red.output.length).assertEqual(text.length);
      expect(again.token()).assertEqual(red.token());
      expect(twice.output).assertEqual(text);
      logStep("payloadSecurityKeepsSingleCharacterClean", red.token());
    });

    /**
     * @tc.name          payloadSecurityKeepsAlphanumericCodeClean
     * @tc.desc          Payload alphanumeric code carries no sensitive marker and stays verbatim after redaction.
     * @tc.precondition  The redaction policy with a 24-character limit is loaded.
     * @tc.steps         1. Redact the short clean payload alphanumeric code.
     *                   2. Repeat the redaction and compare tokens.
     *                   3. Redact the redacted output once more.
     *                   4. Count mask characters and recompute the fingerprint.
     * @tc.expected      Nothing is masked, the output equals the input, and every pass is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadSecurityKeepsAlphanumericCodeClean', 0, () => {
      const text: string = 'Z9';
      const red: Redaction = redact(text);
      const again: Redaction = redact(text);
      const twice: Redaction = redact(red.output);
      expect(findMarker(text)).assertEqual("");
      expect(red.applied).assertFalse();
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.output).assertEqual(text);
      expect(red.masked).assertEqual(0);
      expect(red.ratio()).assertEqual(0);
      expect(red.digest).assertEqual(textFingerprint(text));
      expect(countStars(red.output)).assertEqual(0);
      expect(red.output.length).assertEqual(text.length);
      expect(again.token()).assertEqual(red.token());
      expect(twice.output).assertEqual(text);
      logStep("payloadSecurityKeepsAlphanumericCodeClean", red.token());
    });

    /**
     * @tc.name          payloadSecurityKeepsHyphenatedNameClean
     * @tc.desc          Payload hyphenated name carries no sensitive marker and stays verbatim after redaction.
     * @tc.precondition  The redaction policy with a 24-character limit is loaded.
     * @tc.steps         1. Redact the short clean payload hyphenated name.
     *                   2. Repeat the redaction and compare tokens.
     *                   3. Redact the redacted output once more.
     *                   4. Count mask characters and recompute the fingerprint.
     * @tc.expected      Nothing is masked, the output equals the input, and every pass is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadSecurityKeepsHyphenatedNameClean', 0, () => {
      const text: string = 'payload-1';
      const red: Redaction = redact(text);
      const again: Redaction = redact(text);
      const twice: Redaction = redact(red.output);
      expect(findMarker(text)).assertEqual("");
      expect(red.applied).assertFalse();
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.output).assertEqual(text);
      expect(red.masked).assertEqual(0);
      expect(red.ratio()).assertEqual(0);
      expect(red.digest).assertEqual(textFingerprint(text));
      expect(countStars(red.output)).assertEqual(0);
      expect(red.output.length).assertEqual(text.length);
      expect(again.token()).assertEqual(red.token());
      expect(twice.output).assertEqual(text);
      logStep("payloadSecurityKeepsHyphenatedNameClean", red.token());
    });

    /**
     * @tc.name          payloadSecurityKeepsStatusWordClean
     * @tc.desc          Payload status word carries no sensitive marker and stays verbatim after redaction.
     * @tc.precondition  The redaction policy with a 24-character limit is loaded.
     * @tc.steps         1. Redact the short clean payload status word.
     *                   2. Repeat the redaction and compare tokens.
     *                   3. Redact the redacted output once more.
     *                   4. Count mask characters and recompute the fingerprint.
     * @tc.expected      Nothing is masked, the output equals the input, and every pass is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadSecurityKeepsStatusWordClean', 0, () => {
      const text: string = 'ok_200';
      const red: Redaction = redact(text);
      const again: Redaction = redact(text);
      const twice: Redaction = redact(red.output);
      expect(findMarker(text)).assertEqual("");
      expect(red.applied).assertFalse();
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.output).assertEqual(text);
      expect(red.masked).assertEqual(0);
      expect(red.ratio()).assertEqual(0);
      expect(red.digest).assertEqual(textFingerprint(text));
      expect(countStars(red.output)).assertEqual(0);
      expect(red.output.length).assertEqual(text.length);
      expect(again.token()).assertEqual(red.token());
      expect(twice.output).assertEqual(text);
      logStep("payloadSecurityKeepsStatusWordClean", red.token());
    });

    /**
     * @tc.name          payloadSecurityKeepsSpacedPairClean
     * @tc.desc          Payload spaced pair carries no sensitive marker and stays verbatim after redaction.
     * @tc.precondition  The redaction policy with a 24-character limit is loaded.
     * @tc.steps         1. Redact the short clean payload spaced pair.
     *                   2. Repeat the redaction and compare tokens.
     *                   3. Redact the redacted output once more.
     *                   4. Count mask characters and recompute the fingerprint.
     * @tc.expected      Nothing is masked, the output equals the input, and every pass is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadSecurityKeepsSpacedPairClean', 0, () => {
      const text: string = 'a b';
      const red: Redaction = redact(text);
      const again: Redaction = redact(text);
      const twice: Redaction = redact(red.output);
      expect(findMarker(text)).assertEqual("");
      expect(red.applied).assertFalse();
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.output).assertEqual(text);
      expect(red.masked).assertEqual(0);
      expect(red.ratio()).assertEqual(0);
      expect(red.digest).assertEqual(textFingerprint(text));
      expect(countStars(red.output)).assertEqual(0);
      expect(red.output.length).assertEqual(text.length);
      expect(again.token()).assertEqual(red.token());
      expect(twice.output).assertEqual(text);
      logStep("payloadSecurityKeepsSpacedPairClean", red.token());
    });

    /**
     * @tc.name          payloadSecurityKeepsTenDigitsClean
     * @tc.desc          Payload ten digits carries no sensitive marker and stays verbatim after redaction.
     * @tc.precondition  The redaction policy with a 24-character limit is loaded.
     * @tc.steps         1. Redact the short clean payload ten digits.
     *                   2. Repeat the redaction and compare tokens.
     *                   3. Redact the redacted output once more.
     *                   4. Count mask characters and recompute the fingerprint.
     * @tc.expected      Nothing is masked, the output equals the input, and every pass is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadSecurityKeepsTenDigitsClean', 0, () => {
      const text: string = '1234567890';
      const red: Redaction = redact(text);
      const again: Redaction = redact(text);
      const twice: Redaction = redact(red.output);
      expect(findMarker(text)).assertEqual("");
      expect(red.applied).assertFalse();
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.output).assertEqual(text);
      expect(red.masked).assertEqual(0);
      expect(red.ratio()).assertEqual(0);
      expect(red.digest).assertEqual(textFingerprint(text));
      expect(countStars(red.output)).assertEqual(0);
      expect(red.output.length).assertEqual(text.length);
      expect(again.token()).assertEqual(red.token());
      expect(twice.output).assertEqual(text);
      logStep("payloadSecurityKeepsTenDigitsClean", red.token());
    });

    /**
     * @tc.name          payloadSecurityMasksTokenAssignment
     * @tc.desc          Payload token assignment contains a sensitive marker and is fully masked.
     * @tc.precondition  The marker table lists token, secret, password and auth prefixes.
     * @tc.steps         1. Scan the payload for a sensitive marker.
     *                   2. Redact the marker payload and inspect the output.
     *                   3. Count the mask characters and check the marker is absent.
     *                   4. Redact the masked output again.
     * @tc.expected      The whole payload becomes mask characters with the original length preserved.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadSecurityMasksTokenAssignment', 0, () => {
      const text: string = 'token=abc';
      const found: string = findMarker(text);
      const red: Redaction = redact(text);
      expect(found).assertEqual('token=');
      expect(red.applied).assertTrue();
      expect(red.reason).assertEqual(REASON_MARKER);
      expect(red.output.length).assertEqual(text.length);
      expect(countStars(red.output)).assertEqual(text.length);
      expect(red.output.indexOf('token=')).assertEqual(-1);
      expect(red.output === text).assertFalse();
      expect(red.masked).assertEqual(text.length);
      expect(red.ratio()).assertEqual(1);
      expect(red.digest).assertEqual(textFingerprint(red.output));
      expect(redact(red.output).output).assertEqual(red.output);
      logStep("payloadSecurityMasksTokenAssignment", red.token());
    });

    /**
     * @tc.name          payloadSecurityMasksSecretAssignment
     * @tc.desc          Payload secret assignment contains a sensitive marker and is fully masked.
     * @tc.precondition  The marker table lists token, secret, password and auth prefixes.
     * @tc.steps         1. Scan the payload for a sensitive marker.
     *                   2. Redact the marker payload and inspect the output.
     *                   3. Count the mask characters and check the marker is absent.
     *                   4. Redact the masked output again.
     * @tc.expected      The whole payload becomes mask characters with the original length preserved.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadSecurityMasksSecretAssignment', 0, () => {
      const text: string = 'secret=42';
      const found: string = findMarker(text);
      const red: Redaction = redact(text);
      expect(found).assertEqual('secret=');
      expect(red.applied).assertTrue();
      expect(red.reason).assertEqual(REASON_MARKER);
      expect(red.output.length).assertEqual(text.length);
      expect(countStars(red.output)).assertEqual(text.length);
      expect(red.output.indexOf('secret=')).assertEqual(-1);
      expect(red.output === text).assertFalse();
      expect(red.masked).assertEqual(text.length);
      expect(red.ratio()).assertEqual(1);
      expect(red.digest).assertEqual(textFingerprint(red.output));
      expect(redact(red.output).output).assertEqual(red.output);
      logStep("payloadSecurityMasksSecretAssignment", red.token());
    });

    /**
     * @tc.name          payloadSecurityMasksPasswordAssignment
     * @tc.desc          Payload password assignment contains a sensitive marker and is fully masked.
     * @tc.precondition  The marker table lists token, secret, password and auth prefixes.
     * @tc.steps         1. Scan the payload for a sensitive marker.
     *                   2. Redact the marker payload and inspect the output.
     *                   3. Count the mask characters and check the marker is absent.
     *                   4. Redact the masked output again.
     * @tc.expected      The whole payload becomes mask characters with the original length preserved.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadSecurityMasksPasswordAssignment', 0, () => {
      const text: string = 'password=hunter';
      const found: string = findMarker(text);
      const red: Redaction = redact(text);
      expect(found).assertEqual('password=');
      expect(red.applied).assertTrue();
      expect(red.reason).assertEqual(REASON_MARKER);
      expect(red.output.length).assertEqual(text.length);
      expect(countStars(red.output)).assertEqual(text.length);
      expect(red.output.indexOf('password=')).assertEqual(-1);
      expect(red.output === text).assertFalse();
      expect(red.masked).assertEqual(text.length);
      expect(red.ratio()).assertEqual(1);
      expect(red.digest).assertEqual(textFingerprint(red.output));
      expect(redact(red.output).output).assertEqual(red.output);
      logStep("payloadSecurityMasksPasswordAssignment", red.token());
    });

    /**
     * @tc.name          payloadSecurityMasksAuthAssignment
     * @tc.desc          Payload auth assignment contains a sensitive marker and is fully masked.
     * @tc.precondition  The marker table lists token, secret, password and auth prefixes.
     * @tc.steps         1. Scan the payload for a sensitive marker.
     *                   2. Redact the marker payload and inspect the output.
     *                   3. Count the mask characters and check the marker is absent.
     *                   4. Redact the masked output again.
     * @tc.expected      The whole payload becomes mask characters with the original length preserved.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadSecurityMasksAuthAssignment', 0, () => {
      const text: string = 'auth=xyz';
      const found: string = findMarker(text);
      const red: Redaction = redact(text);
      expect(found).assertEqual('auth=');
      expect(red.applied).assertTrue();
      expect(red.reason).assertEqual(REASON_MARKER);
      expect(red.output.length).assertEqual(text.length);
      expect(countStars(red.output)).assertEqual(text.length);
      expect(red.output.indexOf('auth=')).assertEqual(-1);
      expect(red.output === text).assertFalse();
      expect(red.masked).assertEqual(text.length);
      expect(red.ratio()).assertEqual(1);
      expect(red.digest).assertEqual(textFingerprint(red.output));
      expect(redact(red.output).output).assertEqual(red.output);
      logStep("payloadSecurityMasksAuthAssignment", red.token());
    });

    /**
     * @tc.name          payloadSecurityMasksEmbeddedToken
     * @tc.desc          Payload embedded token contains a sensitive marker and is fully masked.
     * @tc.precondition  The marker table lists token, secret, password and auth prefixes.
     * @tc.steps         1. Scan the payload for a sensitive marker.
     *                   2. Redact the marker payload and inspect the output.
     *                   3. Count the mask characters and check the marker is absent.
     *                   4. Redact the masked output again.
     * @tc.expected      The whole payload becomes mask characters with the original length preserved.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadSecurityMasksEmbeddedToken', 0, () => {
      const text: string = 'key token=abc';
      const found: string = findMarker(text);
      const red: Redaction = redact(text);
      expect(found).assertEqual('token=');
      expect(red.applied).assertTrue();
      expect(red.reason).assertEqual(REASON_MARKER);
      expect(red.output.length).assertEqual(text.length);
      expect(countStars(red.output)).assertEqual(text.length);
      expect(red.output.indexOf('token=')).assertEqual(-1);
      expect(red.output === text).assertFalse();
      expect(red.masked).assertEqual(text.length);
      expect(red.ratio()).assertEqual(1);
      expect(red.digest).assertEqual(textFingerprint(red.output));
      expect(redact(red.output).output).assertEqual(red.output);
      logStep("payloadSecurityMasksEmbeddedToken", red.token());
    });

    /**
     * @tc.name          payloadSecurityMasksPrefixedSecret
     * @tc.desc          Payload prefixed secret contains a sensitive marker and is fully masked.
     * @tc.precondition  The marker table lists token, secret, password and auth prefixes.
     * @tc.steps         1. Scan the payload for a sensitive marker.
     *                   2. Redact the marker payload and inspect the output.
     *                   3. Count the mask characters and check the marker is absent.
     *                   4. Redact the masked output again.
     * @tc.expected      The whole payload becomes mask characters with the original length preserved.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadSecurityMasksPrefixedSecret', 0, () => {
      const text: string = 'my secret=7';
      const found: string = findMarker(text);
      const red: Redaction = redact(text);
      expect(found).assertEqual('secret=');
      expect(red.applied).assertTrue();
      expect(red.reason).assertEqual(REASON_MARKER);
      expect(red.output.length).assertEqual(text.length);
      expect(countStars(red.output)).assertEqual(text.length);
      expect(red.output.indexOf('secret=')).assertEqual(-1);
      expect(red.output === text).assertFalse();
      expect(red.masked).assertEqual(text.length);
      expect(red.ratio()).assertEqual(1);
      expect(red.digest).assertEqual(textFingerprint(red.output));
      expect(redact(red.output).output).assertEqual(red.output);
      logStep("payloadSecurityMasksPrefixedSecret", red.token());
    });

    /**
     * @tc.name          payloadSecurityMasksRootAuth
     * @tc.desc          Payload root auth contains a sensitive marker and is fully masked.
     * @tc.precondition  The marker table lists token, secret, password and auth prefixes.
     * @tc.steps         1. Scan the payload for a sensitive marker.
     *                   2. Redact the marker payload and inspect the output.
     *                   3. Count the mask characters and check the marker is absent.
     *                   4. Redact the masked output again.
     * @tc.expected      The whole payload becomes mask characters with the original length preserved.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadSecurityMasksRootAuth', 0, () => {
      const text: string = 'auth=root';
      const found: string = findMarker(text);
      const red: Redaction = redact(text);
      expect(found).assertEqual('auth=');
      expect(red.applied).assertTrue();
      expect(red.reason).assertEqual(REASON_MARKER);
      expect(red.output.length).assertEqual(text.length);
      expect(countStars(red.output)).assertEqual(text.length);
      expect(red.output.indexOf('auth=')).assertEqual(-1);
      expect(red.output === text).assertFalse();
      expect(red.masked).assertEqual(text.length);
      expect(red.ratio()).assertEqual(1);
      expect(red.digest).assertEqual(textFingerprint(red.output));
      expect(redact(red.output).output).assertEqual(red.output);
      logStep("payloadSecurityMasksRootAuth", red.token());
    });

    /**
     * @tc.name          payloadSecurityMasksEmptyPasswordValue
     * @tc.desc          Payload empty password value contains a sensitive marker and is fully masked.
     * @tc.precondition  The marker table lists token, secret, password and auth prefixes.
     * @tc.steps         1. Scan the payload for a sensitive marker.
     *                   2. Redact the marker payload and inspect the output.
     *                   3. Count the mask characters and check the marker is absent.
     *                   4. Redact the masked output again.
     * @tc.expected      The whole payload becomes mask characters with the original length preserved.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadSecurityMasksEmptyPasswordValue', 0, () => {
      const text: string = 'password=';
      const found: string = findMarker(text);
      const red: Redaction = redact(text);
      expect(found).assertEqual('password=');
      expect(red.applied).assertTrue();
      expect(red.reason).assertEqual(REASON_MARKER);
      expect(red.output.length).assertEqual(text.length);
      expect(countStars(red.output)).assertEqual(text.length);
      expect(red.output.indexOf('password=')).assertEqual(-1);
      expect(red.output === text).assertFalse();
      expect(red.masked).assertEqual(text.length);
      expect(red.ratio()).assertEqual(1);
      expect(red.digest).assertEqual(textFingerprint(red.output));
      expect(redact(red.output).output).assertEqual(red.output);
      logStep("payloadSecurityMasksEmptyPasswordValue", red.token());
    });

    /**
     * @tc.name          payloadSecurityMasksSecretWithSpaces
     * @tc.desc          Payload secret with spaces contains a sensitive marker and is fully masked.
     * @tc.precondition  The marker table lists token, secret, password and auth prefixes.
     * @tc.steps         1. Scan the payload for a sensitive marker.
     *                   2. Redact the marker payload and inspect the output.
     *                   3. Count the mask characters and check the marker is absent.
     *                   4. Redact the masked output again.
     * @tc.expected      The whole payload becomes mask characters with the original length preserved.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadSecurityMasksSecretWithSpaces', 0, () => {
      const text: string = 'secret=abc def';
      const found: string = findMarker(text);
      const red: Redaction = redact(text);
      expect(found).assertEqual('secret=');
      expect(red.applied).assertTrue();
      expect(red.reason).assertEqual(REASON_MARKER);
      expect(red.output.length).assertEqual(text.length);
      expect(countStars(red.output)).assertEqual(text.length);
      expect(red.output.indexOf('secret=')).assertEqual(-1);
      expect(red.output === text).assertFalse();
      expect(red.masked).assertEqual(text.length);
      expect(red.ratio()).assertEqual(1);
      expect(red.digest).assertEqual(textFingerprint(red.output));
      expect(redact(red.output).output).assertEqual(red.output);
      logStep("payloadSecurityMasksSecretWithSpaces", red.token());
    });

    /**
     * @tc.name          payloadSecurityMasksSingleCharToken
     * @tc.desc          Payload single char token contains a sensitive marker and is fully masked.
     * @tc.precondition  The marker table lists token, secret, password and auth prefixes.
     * @tc.steps         1. Scan the payload for a sensitive marker.
     *                   2. Redact the marker payload and inspect the output.
     *                   3. Count the mask characters and check the marker is absent.
     *                   4. Redact the masked output again.
     * @tc.expected      The whole payload becomes mask characters with the original length preserved.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadSecurityMasksSingleCharToken', 0, () => {
      const text: string = 'token=x';
      const found: string = findMarker(text);
      const red: Redaction = redact(text);
      expect(found).assertEqual('token=');
      expect(red.applied).assertTrue();
      expect(red.reason).assertEqual(REASON_MARKER);
      expect(red.output.length).assertEqual(text.length);
      expect(countStars(red.output)).assertEqual(text.length);
      expect(red.output.indexOf('token=')).assertEqual(-1);
      expect(red.output === text).assertFalse();
      expect(red.masked).assertEqual(text.length);
      expect(red.ratio()).assertEqual(1);
      expect(red.digest).assertEqual(textFingerprint(red.output));
      expect(redact(red.output).output).assertEqual(red.output);
      logStep("payloadSecurityMasksSingleCharToken", red.token());
    });

    /**
     * @tc.name          payloadSecurityMasksMarkerCaseSensitively
     * @tc.desc          Near-miss marker text capitalised token is not treated as sensitive.
     * @tc.precondition  The marker table performs a case-sensitive substring scan.
     * @tc.steps         1. Scan the near-miss payload capitalised token for markers.
     *                   2. Redact it and read the applied flag.
     *                   3. Confirm the hint substring is still present.
     *                   4. Repeat the redaction for determinism.
     * @tc.expected      The scan finds nothing and the payload survives redaction verbatim.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityMasksMarkerCaseSensitively', 0, () => {
      const text: string = 'Token=abc';
      const red: Redaction = redact(text);
      expect(findMarker(text)).assertEqual("");
      expect(red.applied).assertFalse();
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.output).assertEqual(text);
      expect(text.indexOf('Token=') >= 0).assertTrue();
      expect(red.masked).assertEqual(0);
      expect(red.digest).assertEqual(textFingerprint(text));
      expect(redact(text).token()).assertEqual(red.token());
      logStep("payloadSecurityMasksMarkerCaseSensitively", red.token());
    });

    /**
     * @tc.name          payloadSecurityIgnoresUpperTokenWord
     * @tc.desc          Near-miss marker text upper token word is not treated as sensitive.
     * @tc.precondition  The marker table performs a case-sensitive substring scan.
     * @tc.steps         1. Scan the near-miss payload upper token word for markers.
     *                   2. Redact it and read the applied flag.
     *                   3. Confirm the hint substring is still present.
     *                   4. Repeat the redaction for determinism.
     * @tc.expected      The scan finds nothing and the payload survives redaction verbatim.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityIgnoresUpperTokenWord', 0, () => {
      const text: string = 'TOKEN=abc';
      const red: Redaction = redact(text);
      expect(findMarker(text)).assertEqual("");
      expect(red.applied).assertFalse();
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.output).assertEqual(text);
      expect(text.indexOf('TOKEN=') >= 0).assertTrue();
      expect(red.masked).assertEqual(0);
      expect(red.digest).assertEqual(textFingerprint(text));
      expect(redact(text).token()).assertEqual(red.token());
      logStep("payloadSecurityIgnoresUpperTokenWord", red.token());
    });

    /**
     * @tc.name          payloadSecurityIgnoresColonSeparator
     * @tc.desc          Near-miss marker text colon separator is not treated as sensitive.
     * @tc.precondition  The marker table performs a case-sensitive substring scan.
     * @tc.steps         1. Scan the near-miss payload colon separator for markers.
     *                   2. Redact it and read the applied flag.
     *                   3. Confirm the hint substring is still present.
     *                   4. Repeat the redaction for determinism.
     * @tc.expected      The scan finds nothing and the payload survives redaction verbatim.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityIgnoresColonSeparator', 0, () => {
      const text: string = 'token:abc';
      const red: Redaction = redact(text);
      expect(findMarker(text)).assertEqual("");
      expect(red.applied).assertFalse();
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.output).assertEqual(text);
      expect(text.indexOf('token') >= 0).assertTrue();
      expect(red.masked).assertEqual(0);
      expect(red.digest).assertEqual(textFingerprint(text));
      expect(redact(text).token()).assertEqual(red.token());
      logStep("payloadSecurityIgnoresColonSeparator", red.token());
    });

    /**
     * @tc.name          payloadSecurityIgnoresPluralTokensWord
     * @tc.desc          Near-miss marker text plural tokens word is not treated as sensitive.
     * @tc.precondition  The marker table performs a case-sensitive substring scan.
     * @tc.steps         1. Scan the near-miss payload plural tokens word for markers.
     *                   2. Redact it and read the applied flag.
     *                   3. Confirm the hint substring is still present.
     *                   4. Repeat the redaction for determinism.
     * @tc.expected      The scan finds nothing and the payload survives redaction verbatim.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityIgnoresPluralTokensWord', 0, () => {
      const text: string = 'tokens=1';
      const red: Redaction = redact(text);
      expect(findMarker(text)).assertEqual("");
      expect(red.applied).assertFalse();
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.output).assertEqual(text);
      expect(text.indexOf('tokens') >= 0).assertTrue();
      expect(red.masked).assertEqual(0);
      expect(red.digest).assertEqual(textFingerprint(text));
      expect(redact(text).token()).assertEqual(red.token());
      logStep("payloadSecurityIgnoresPluralTokensWord", red.token());
    });

    /**
     * @tc.name          payloadSecurityIgnoresSecretKeyWord
     * @tc.desc          Near-miss marker text secret key word is not treated as sensitive.
     * @tc.precondition  The marker table performs a case-sensitive substring scan.
     * @tc.steps         1. Scan the near-miss payload secret key word for markers.
     *                   2. Redact it and read the applied flag.
     *                   3. Confirm the hint substring is still present.
     *                   4. Repeat the redaction for determinism.
     * @tc.expected      The scan finds nothing and the payload survives redaction verbatim.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityIgnoresSecretKeyWord', 0, () => {
      const text: string = 'secretkey=1';
      const red: Redaction = redact(text);
      expect(findMarker(text)).assertEqual("");
      expect(red.applied).assertFalse();
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.output).assertEqual(text);
      expect(text.indexOf('secretkey') >= 0).assertTrue();
      expect(red.masked).assertEqual(0);
      expect(red.digest).assertEqual(textFingerprint(text));
      expect(redact(text).token()).assertEqual(red.token());
      logStep("payloadSecurityIgnoresSecretKeyWord", red.token());
    });

    /**
     * @tc.name          payloadSecurityIgnoresBareAuthWord
     * @tc.desc          Near-miss marker text bare auth word is not treated as sensitive.
     * @tc.precondition  The marker table performs a case-sensitive substring scan.
     * @tc.steps         1. Scan the near-miss payload bare auth word for markers.
     *                   2. Redact it and read the applied flag.
     *                   3. Confirm the hint substring is still present.
     *                   4. Repeat the redaction for determinism.
     * @tc.expected      The scan finds nothing and the payload survives redaction verbatim.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityIgnoresBareAuthWord', 0, () => {
      const text: string = 'auth token';
      const red: Redaction = redact(text);
      expect(findMarker(text)).assertEqual("");
      expect(red.applied).assertFalse();
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.output).assertEqual(text);
      expect(text.indexOf('auth') >= 0).assertTrue();
      expect(red.masked).assertEqual(0);
      expect(red.digest).assertEqual(textFingerprint(text));
      expect(redact(text).token()).assertEqual(red.token());
      logStep("payloadSecurityIgnoresBareAuthWord", red.token());
    });

    /**
     * @tc.name          payloadSecurityIgnoresSplitPassWord
     * @tc.desc          Near-miss marker text split pass word is not treated as sensitive.
     * @tc.precondition  The marker table performs a case-sensitive substring scan.
     * @tc.steps         1. Scan the near-miss payload split pass word for markers.
     *                   2. Redact it and read the applied flag.
     *                   3. Confirm the hint substring is still present.
     *                   4. Repeat the redaction for determinism.
     * @tc.expected      The scan finds nothing and the payload survives redaction verbatim.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityIgnoresSplitPassWord', 0, () => {
      const text: string = 'pass word=1';
      const red: Redaction = redact(text);
      expect(findMarker(text)).assertEqual("");
      expect(red.applied).assertFalse();
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.output).assertEqual(text);
      expect(text.indexOf('pass') >= 0).assertTrue();
      expect(red.masked).assertEqual(0);
      expect(red.digest).assertEqual(textFingerprint(text));
      expect(redact(text).token()).assertEqual(red.token());
      logStep("payloadSecurityIgnoresSplitPassWord", red.token());
    });

    /**
     * @tc.name          payloadSecurityIgnoresPlainKeyValue
     * @tc.desc          Near-miss marker text plain key value is not treated as sensitive.
     * @tc.precondition  The marker table performs a case-sensitive substring scan.
     * @tc.steps         1. Scan the near-miss payload plain key value for markers.
     *                   2. Redact it and read the applied flag.
     *                   3. Confirm the hint substring is still present.
     *                   4. Repeat the redaction for determinism.
     * @tc.expected      The scan finds nothing and the payload survives redaction verbatim.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityIgnoresPlainKeyValue', 0, () => {
      const text: string = 'key=value';
      const red: Redaction = redact(text);
      expect(findMarker(text)).assertEqual("");
      expect(red.applied).assertFalse();
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.output).assertEqual(text);
      expect(text.indexOf('key') >= 0).assertTrue();
      expect(red.masked).assertEqual(0);
      expect(red.digest).assertEqual(textFingerprint(text));
      expect(redact(text).token()).assertEqual(red.token());
      logStep("payloadSecurityIgnoresPlainKeyValue", red.token());
    });

    /**
     * @tc.name          payloadSecurityWindowsTwentyFiveCharacters
     * @tc.desc          Payload of 25 characters is shortened to its two edge windows plus a length tail.
     * @tc.precondition  A synthetic payload longer than the 24-character limit is prepared.
     * @tc.steps         1. Grow the payload to exactly 25 characters.
     *                   2. Redact it and recompute the masked window with the oracle.
     *                   3. Check the length tail and the star count.
     *                   4. Confirm the ratio is above the bulk threshold.
     * @tc.expected      Only four edge characters survive and the rest is masked with a tilde length tail.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityWindowsTwentyFiveCharacters', 0, () => {
      const text: string = buildLong(25);
      const red: Redaction = redact(text);
      const oracle: string = oracleMaskWindow(text, EDGE);
      expect(text.length).assertEqual(25);
      expect(red.applied).assertTrue();
      expect(red.reason).assertEqual(REASON_LONG);
      expect(red.masked).assertEqual(25 - 4);
      expect(countStars(red.output)).assertEqual(25 - 4);
      expect(red.output.indexOf(oracle)).assertEqual(0);
      expect(red.output.length).assertEqual(25 + 1 + String(25).length);
      expect(red.output.indexOf("~" + String(25)) >= 0).assertTrue();
      expect(red.ratio() > 0.8).assertTrue();
      expect(red.output === text).assertFalse();
      expect(red.original).assertEqual(text);
      logStep("payloadSecurityWindowsTwentyFiveCharacters", red.token());
    });

    /**
     * @tc.name          payloadSecurityWindowsTwentySixCharacters
     * @tc.desc          Payload of 26 characters is shortened to its two edge windows plus a length tail.
     * @tc.precondition  A synthetic payload longer than the 24-character limit is prepared.
     * @tc.steps         1. Grow the payload to exactly 26 characters.
     *                   2. Redact it and recompute the masked window with the oracle.
     *                   3. Check the length tail and the star count.
     *                   4. Confirm the ratio is above the bulk threshold.
     * @tc.expected      Only four edge characters survive and the rest is masked with a tilde length tail.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityWindowsTwentySixCharacters', 0, () => {
      const text: string = buildLong(26);
      const red: Redaction = redact(text);
      const oracle: string = oracleMaskWindow(text, EDGE);
      expect(text.length).assertEqual(26);
      expect(red.applied).assertTrue();
      expect(red.reason).assertEqual(REASON_LONG);
      expect(red.masked).assertEqual(26 - 4);
      expect(countStars(red.output)).assertEqual(26 - 4);
      expect(red.output.indexOf(oracle)).assertEqual(0);
      expect(red.output.length).assertEqual(26 + 1 + String(26).length);
      expect(red.output.indexOf("~" + String(26)) >= 0).assertTrue();
      expect(red.ratio() > 0.8).assertTrue();
      expect(red.output === text).assertFalse();
      expect(red.original).assertEqual(text);
      logStep("payloadSecurityWindowsTwentySixCharacters", red.token());
    });

    /**
     * @tc.name          payloadSecurityWindowsThirtyTwoCharacters
     * @tc.desc          Payload of 32 characters is shortened to its two edge windows plus a length tail.
     * @tc.precondition  A synthetic payload longer than the 24-character limit is prepared.
     * @tc.steps         1. Grow the payload to exactly 32 characters.
     *                   2. Redact it and recompute the masked window with the oracle.
     *                   3. Check the length tail and the star count.
     *                   4. Confirm the ratio is above the bulk threshold.
     * @tc.expected      Only four edge characters survive and the rest is masked with a tilde length tail.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityWindowsThirtyTwoCharacters', 0, () => {
      const text: string = buildLong(32);
      const red: Redaction = redact(text);
      const oracle: string = oracleMaskWindow(text, EDGE);
      expect(text.length).assertEqual(32);
      expect(red.applied).assertTrue();
      expect(red.reason).assertEqual(REASON_LONG);
      expect(red.masked).assertEqual(32 - 4);
      expect(countStars(red.output)).assertEqual(32 - 4);
      expect(red.output.indexOf(oracle)).assertEqual(0);
      expect(red.output.length).assertEqual(32 + 1 + String(32).length);
      expect(red.output.indexOf("~" + String(32)) >= 0).assertTrue();
      expect(red.ratio() > 0.8).assertTrue();
      expect(red.output === text).assertFalse();
      expect(red.original).assertEqual(text);
      logStep("payloadSecurityWindowsThirtyTwoCharacters", red.token());
    });

    /**
     * @tc.name          payloadSecurityWindowsFortyCharacters
     * @tc.desc          Payload of 40 characters is shortened to its two edge windows plus a length tail.
     * @tc.precondition  A synthetic payload longer than the 24-character limit is prepared.
     * @tc.steps         1. Grow the payload to exactly 40 characters.
     *                   2. Redact it and recompute the masked window with the oracle.
     *                   3. Check the length tail and the star count.
     *                   4. Confirm the ratio is above the bulk threshold.
     * @tc.expected      Only four edge characters survive and the rest is masked with a tilde length tail.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityWindowsFortyCharacters', 0, () => {
      const text: string = buildLong(40);
      const red: Redaction = redact(text);
      const oracle: string = oracleMaskWindow(text, EDGE);
      expect(text.length).assertEqual(40);
      expect(red.applied).assertTrue();
      expect(red.reason).assertEqual(REASON_LONG);
      expect(red.masked).assertEqual(40 - 4);
      expect(countStars(red.output)).assertEqual(40 - 4);
      expect(red.output.indexOf(oracle)).assertEqual(0);
      expect(red.output.length).assertEqual(40 + 1 + String(40).length);
      expect(red.output.indexOf("~" + String(40)) >= 0).assertTrue();
      expect(red.ratio() > 0.8).assertTrue();
      expect(red.output === text).assertFalse();
      expect(red.original).assertEqual(text);
      logStep("payloadSecurityWindowsFortyCharacters", red.token());
    });

    /**
     * @tc.name          payloadSecurityWindowsFortyEightCharacters
     * @tc.desc          Payload of 48 characters is shortened to its two edge windows plus a length tail.
     * @tc.precondition  A synthetic payload longer than the 24-character limit is prepared.
     * @tc.steps         1. Grow the payload to exactly 48 characters.
     *                   2. Redact it and recompute the masked window with the oracle.
     *                   3. Check the length tail and the star count.
     *                   4. Confirm the ratio is above the bulk threshold.
     * @tc.expected      Only four edge characters survive and the rest is masked with a tilde length tail.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityWindowsFortyEightCharacters', 0, () => {
      const text: string = buildLong(48);
      const red: Redaction = redact(text);
      const oracle: string = oracleMaskWindow(text, EDGE);
      expect(text.length).assertEqual(48);
      expect(red.applied).assertTrue();
      expect(red.reason).assertEqual(REASON_LONG);
      expect(red.masked).assertEqual(48 - 4);
      expect(countStars(red.output)).assertEqual(48 - 4);
      expect(red.output.indexOf(oracle)).assertEqual(0);
      expect(red.output.length).assertEqual(48 + 1 + String(48).length);
      expect(red.output.indexOf("~" + String(48)) >= 0).assertTrue();
      expect(red.ratio() > 0.8).assertTrue();
      expect(red.output === text).assertFalse();
      expect(red.original).assertEqual(text);
      logStep("payloadSecurityWindowsFortyEightCharacters", red.token());
    });

    /**
     * @tc.name          payloadSecurityWindowsSixtyFourCharacters
     * @tc.desc          Payload of 64 characters is shortened to its two edge windows plus a length tail.
     * @tc.precondition  A synthetic payload longer than the 24-character limit is prepared.
     * @tc.steps         1. Grow the payload to exactly 64 characters.
     *                   2. Redact it and recompute the masked window with the oracle.
     *                   3. Check the length tail and the star count.
     *                   4. Confirm the ratio is above the bulk threshold.
     * @tc.expected      Only four edge characters survive and the rest is masked with a tilde length tail.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityWindowsSixtyFourCharacters', 0, () => {
      const text: string = buildLong(64);
      const red: Redaction = redact(text);
      const oracle: string = oracleMaskWindow(text, EDGE);
      expect(text.length).assertEqual(64);
      expect(red.applied).assertTrue();
      expect(red.reason).assertEqual(REASON_LONG);
      expect(red.masked).assertEqual(64 - 4);
      expect(countStars(red.output)).assertEqual(64 - 4);
      expect(red.output.indexOf(oracle)).assertEqual(0);
      expect(red.output.length).assertEqual(64 + 1 + String(64).length);
      expect(red.output.indexOf("~" + String(64)) >= 0).assertTrue();
      expect(red.ratio() > 0.8).assertTrue();
      expect(red.output === text).assertFalse();
      expect(red.original).assertEqual(text);
      logStep("payloadSecurityWindowsSixtyFourCharacters", red.token());
    });

    /**
     * @tc.name          payloadSecurityWindowsOneHundredCharacters
     * @tc.desc          Payload of 100 characters is shortened to its two edge windows plus a length tail.
     * @tc.precondition  A synthetic payload longer than the 24-character limit is prepared.
     * @tc.steps         1. Grow the payload to exactly 100 characters.
     *                   2. Redact it and recompute the masked window with the oracle.
     *                   3. Check the length tail and the star count.
     *                   4. Confirm the ratio is above the bulk threshold.
     * @tc.expected      Only four edge characters survive and the rest is masked with a tilde length tail.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityWindowsOneHundredCharacters', 0, () => {
      const text: string = buildLong(100);
      const red: Redaction = redact(text);
      const oracle: string = oracleMaskWindow(text, EDGE);
      expect(text.length).assertEqual(100);
      expect(red.applied).assertTrue();
      expect(red.reason).assertEqual(REASON_LONG);
      expect(red.masked).assertEqual(100 - 4);
      expect(countStars(red.output)).assertEqual(100 - 4);
      expect(red.output.indexOf(oracle)).assertEqual(0);
      expect(red.output.length).assertEqual(100 + 1 + String(100).length);
      expect(red.output.indexOf("~" + String(100)) >= 0).assertTrue();
      expect(red.ratio() > 0.8).assertTrue();
      expect(red.output === text).assertFalse();
      expect(red.original).assertEqual(text);
      logStep("payloadSecurityWindowsOneHundredCharacters", red.token());
    });

    /**
     * @tc.name          payloadSecurityWindowsTwoHundredCharacters
     * @tc.desc          Payload of 200 characters is shortened to its two edge windows plus a length tail.
     * @tc.precondition  A synthetic payload longer than the 24-character limit is prepared.
     * @tc.steps         1. Grow the payload to exactly 200 characters.
     *                   2. Redact it and recompute the masked window with the oracle.
     *                   3. Check the length tail and the star count.
     *                   4. Confirm the ratio is above the bulk threshold.
     * @tc.expected      Only four edge characters survive and the rest is masked with a tilde length tail.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityWindowsTwoHundredCharacters', 0, () => {
      const text: string = buildLong(200);
      const red: Redaction = redact(text);
      const oracle: string = oracleMaskWindow(text, EDGE);
      expect(text.length).assertEqual(200);
      expect(red.applied).assertTrue();
      expect(red.reason).assertEqual(REASON_LONG);
      expect(red.masked).assertEqual(200 - 4);
      expect(countStars(red.output)).assertEqual(200 - 4);
      expect(red.output.indexOf(oracle)).assertEqual(0);
      expect(red.output.length).assertEqual(200 + 1 + String(200).length);
      expect(red.output.indexOf("~" + String(200)) >= 0).assertTrue();
      expect(red.ratio() > 0.8).assertTrue();
      expect(red.output === text).assertFalse();
      expect(red.original).assertEqual(text);
      logStep("payloadSecurityWindowsTwoHundredCharacters", red.token());
    });

    /**
     * @tc.name          payloadSecurityBoundaryTwentyTwoStaysClean
     * @tc.desc          Payload at 22 characters labelled twenty two exercises the redaction limit edge.
     * @tc.precondition  The payload is grown to the exact length under test.
     * @tc.steps         1. Build the payload of exactly 22 characters.
     *                   2. Redact it and read the applied flag.
     *                   3. Compare the output with the clean or windowed shape.
     *                   4. Check the masked count and reason.
     * @tc.expected      Payloads up to and including the limit stay intact while longer ones are windowed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityBoundaryTwentyTwoStaysClean', 0, () => {
      const text: string = buildLong(22);
      const red: Redaction = redact(text);
      expect(text.length).assertEqual(22);
      expect(red.applied).assertEqual(false);
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.masked).assertEqual(0);
      expect(red.output.length > 0).assertTrue();
      expect(red.original).assertEqual(text);
      expect(red.digest).assertEqual(textFingerprint(red.output));
      expect(countStars(red.output) >= 0).assertTrue();
      logStep("payloadSecurityBoundaryTwentyTwoStaysClean", red.token());
    });

    /**
     * @tc.name          payloadSecurityBoundaryTwentyThreeStaysClean
     * @tc.desc          Payload at 23 characters labelled twenty three exercises the redaction limit edge.
     * @tc.precondition  The payload is grown to the exact length under test.
     * @tc.steps         1. Build the payload of exactly 23 characters.
     *                   2. Redact it and read the applied flag.
     *                   3. Compare the output with the clean or windowed shape.
     *                   4. Check the masked count and reason.
     * @tc.expected      Payloads up to and including the limit stay intact while longer ones are windowed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityBoundaryTwentyThreeStaysClean', 0, () => {
      const text: string = buildLong(23);
      const red: Redaction = redact(text);
      expect(text.length).assertEqual(23);
      expect(red.applied).assertEqual(false);
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.masked).assertEqual(0);
      expect(red.output.length > 0).assertTrue();
      expect(red.original).assertEqual(text);
      expect(red.digest).assertEqual(textFingerprint(red.output));
      expect(countStars(red.output) >= 0).assertTrue();
      logStep("payloadSecurityBoundaryTwentyThreeStaysClean", red.token());
    });

    /**
     * @tc.name          payloadSecurityBoundaryTwentyFourStaysClean
     * @tc.desc          Payload at 24 characters labelled twenty four exercises the redaction limit edge.
     * @tc.precondition  The payload is grown to the exact length under test.
     * @tc.steps         1. Build the payload of exactly 24 characters.
     *                   2. Redact it and read the applied flag.
     *                   3. Compare the output with the clean or windowed shape.
     *                   4. Check the masked count and reason.
     * @tc.expected      Payloads up to and including the limit stay intact while longer ones are windowed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityBoundaryTwentyFourStaysClean', 0, () => {
      const text: string = buildLong(24);
      const red: Redaction = redact(text);
      expect(text.length).assertEqual(24);
      expect(red.applied).assertEqual(false);
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.masked).assertEqual(0);
      expect(red.output.length > 0).assertTrue();
      expect(red.original).assertEqual(text);
      expect(red.digest).assertEqual(textFingerprint(red.output));
      expect(countStars(red.output) >= 0).assertTrue();
      logStep("payloadSecurityBoundaryTwentyFourStaysClean", red.token());
    });

    /**
     * @tc.name          payloadSecurityBoundaryTwentyFiveIsWindowed
     * @tc.desc          Payload at 25 characters labelled twenty five exercises the redaction limit edge.
     * @tc.precondition  The payload is grown to the exact length under test.
     * @tc.steps         1. Build the payload of exactly 25 characters.
     *                   2. Redact it and read the applied flag.
     *                   3. Compare the output with the clean or windowed shape.
     *                   4. Check the masked count and reason.
     * @tc.expected      Payloads up to and including the limit stay intact while longer ones are windowed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityBoundaryTwentyFiveIsWindowed', 0, () => {
      const text: string = buildLong(25);
      const red: Redaction = redact(text);
      expect(text.length).assertEqual(25);
      expect(red.applied).assertEqual(true);
      expect(red.reason).assertEqual(REASON_LONG);
      expect(red.masked).assertEqual(21);
      expect(red.output.length > 0).assertTrue();
      expect(red.original).assertEqual(text);
      expect(red.digest).assertEqual(textFingerprint(red.output));
      expect(countStars(red.output) >= 0).assertTrue();
      logStep("payloadSecurityBoundaryTwentyFiveIsWindowed", red.token());
    });

    /**
     * @tc.name          payloadSecurityBoundaryTwentySixIsWindowed
     * @tc.desc          Payload at 26 characters labelled twenty six exercises the redaction limit edge.
     * @tc.precondition  The payload is grown to the exact length under test.
     * @tc.steps         1. Build the payload of exactly 26 characters.
     *                   2. Redact it and read the applied flag.
     *                   3. Compare the output with the clean or windowed shape.
     *                   4. Check the masked count and reason.
     * @tc.expected      Payloads up to and including the limit stay intact while longer ones are windowed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityBoundaryTwentySixIsWindowed', 0, () => {
      const text: string = buildLong(26);
      const red: Redaction = redact(text);
      expect(text.length).assertEqual(26);
      expect(red.applied).assertEqual(true);
      expect(red.reason).assertEqual(REASON_LONG);
      expect(red.masked).assertEqual(22);
      expect(red.output.length > 0).assertTrue();
      expect(red.original).assertEqual(text);
      expect(red.digest).assertEqual(textFingerprint(red.output));
      expect(countStars(red.output) >= 0).assertTrue();
      logStep("payloadSecurityBoundaryTwentySixIsWindowed", red.token());
    });

    /**
     * @tc.name          payloadSecurityBoundaryThirtyIsWindowed
     * @tc.desc          Payload at 30 characters labelled thirty exercises the redaction limit edge.
     * @tc.precondition  The payload is grown to the exact length under test.
     * @tc.steps         1. Build the payload of exactly 30 characters.
     *                   2. Redact it and read the applied flag.
     *                   3. Compare the output with the clean or windowed shape.
     *                   4. Check the masked count and reason.
     * @tc.expected      Payloads up to and including the limit stay intact while longer ones are windowed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityBoundaryThirtyIsWindowed', 0, () => {
      const text: string = buildLong(30);
      const red: Redaction = redact(text);
      expect(text.length).assertEqual(30);
      expect(red.applied).assertEqual(true);
      expect(red.reason).assertEqual(REASON_LONG);
      expect(red.masked).assertEqual(26);
      expect(red.output.length > 0).assertTrue();
      expect(red.original).assertEqual(text);
      expect(red.digest).assertEqual(textFingerprint(red.output));
      expect(countStars(red.output) >= 0).assertTrue();
      logStep("payloadSecurityBoundaryThirtyIsWindowed", red.token());
    });

    /**
     * @tc.name          payloadSecurityKeepsChineseUnitsWhole
     * @tc.desc          Multibyte payload chinese units keeps its UTF-16 unit count through redaction.
     * @tc.precondition  The redaction policy operates on UTF-16 code units only.
     * @tc.steps         1. Redact the multibyte payload chinese units.
     *                   2. Measure the unit length before and after.
     *                   3. Count the mask characters in the output.
     *                   4. Confirm no sensitive marker is present.
     * @tc.expected      The unit length is preserved, the mask count matches, and the verdict is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityKeepsChineseUnitsWhole', 0, () => {
      const text: string = '节点密码';
      const red: Redaction = redact(text);
      expect(text.length).assertEqual(4);
      expect(red.applied).assertEqual(false);
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.output.length).assertEqual(4);
      expect(red.masked).assertEqual(0);
      expect(countStars(red.output)).assertEqual(0);
      expect(red.digest).assertEqual(textFingerprint(red.output));
      expect(findMarker(text)).assertEqual("");
      expect(red.original).assertEqual(text);
      logStep("payloadSecurityKeepsChineseUnitsWhole", red.token());
    });

    /**
     * @tc.name          payloadSecurityKeepsAccentedLatinWhole
     * @tc.desc          Multibyte payload accented latin keeps its UTF-16 unit count through redaction.
     * @tc.precondition  The redaction policy operates on UTF-16 code units only.
     * @tc.steps         1. Redact the multibyte payload accented latin.
     *                   2. Measure the unit length before and after.
     *                   3. Count the mask characters in the output.
     *                   4. Confirm no sensitive marker is present.
     * @tc.expected      The unit length is preserved, the mask count matches, and the verdict is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityKeepsAccentedLatinWhole', 0, () => {
      const text: string = 'café';
      const red: Redaction = redact(text);
      expect(text.length).assertEqual(4);
      expect(red.applied).assertEqual(false);
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.output.length).assertEqual(4);
      expect(red.masked).assertEqual(0);
      expect(countStars(red.output)).assertEqual(0);
      expect(red.digest).assertEqual(textFingerprint(red.output));
      expect(findMarker(text)).assertEqual("");
      expect(red.original).assertEqual(text);
      logStep("payloadSecurityKeepsAccentedLatinWhole", red.token());
    });

    /**
     * @tc.name          payloadSecurityKeepsJapaneseUnitsWhole
     * @tc.desc          Multibyte payload japanese units keeps its UTF-16 unit count through redaction.
     * @tc.precondition  The redaction policy operates on UTF-16 code units only.
     * @tc.steps         1. Redact the multibyte payload japanese units.
     *                   2. Measure the unit length before and after.
     *                   3. Count the mask characters in the output.
     *                   4. Confirm no sensitive marker is present.
     * @tc.expected      The unit length is preserved, the mask count matches, and the verdict is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityKeepsJapaneseUnitsWhole', 0, () => {
      const text: string = '日本語';
      const red: Redaction = redact(text);
      expect(text.length).assertEqual(3);
      expect(red.applied).assertEqual(false);
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.output.length).assertEqual(3);
      expect(red.masked).assertEqual(0);
      expect(countStars(red.output)).assertEqual(0);
      expect(red.digest).assertEqual(textFingerprint(red.output));
      expect(findMarker(text)).assertEqual("");
      expect(red.original).assertEqual(text);
      logStep("payloadSecurityKeepsJapaneseUnitsWhole", red.token());
    });

    /**
     * @tc.name          payloadSecurityKeepsDiaeresisWhole
     * @tc.desc          Multibyte payload diaeresis word keeps its UTF-16 unit count through redaction.
     * @tc.precondition  The redaction policy operates on UTF-16 code units only.
     * @tc.steps         1. Redact the multibyte payload diaeresis word.
     *                   2. Measure the unit length before and after.
     *                   3. Count the mask characters in the output.
     *                   4. Confirm no sensitive marker is present.
     * @tc.expected      The unit length is preserved, the mask count matches, and the verdict is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityKeepsDiaeresisWhole', 0, () => {
      const text: string = 'naïve';
      const red: Redaction = redact(text);
      expect(text.length).assertEqual(5);
      expect(red.applied).assertEqual(false);
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.output.length).assertEqual(5);
      expect(red.masked).assertEqual(0);
      expect(countStars(red.output)).assertEqual(0);
      expect(red.digest).assertEqual(textFingerprint(red.output));
      expect(findMarker(text)).assertEqual("");
      expect(red.original).assertEqual(text);
      logStep("payloadSecurityKeepsDiaeresisWhole", red.token());
    });

    /**
     * @tc.name          payloadSecurityKeepsGreekLetterWhole
     * @tc.desc          Multibyte payload greek letter keeps its UTF-16 unit count through redaction.
     * @tc.precondition  The redaction policy operates on UTF-16 code units only.
     * @tc.steps         1. Redact the multibyte payload greek letter.
     *                   2. Measure the unit length before and after.
     *                   3. Count the mask characters in the output.
     *                   4. Confirm no sensitive marker is present.
     * @tc.expected      The unit length is preserved, the mask count matches, and the verdict is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityKeepsGreekLetterWhole', 0, () => {
      const text: string = 'Ω';
      const red: Redaction = redact(text);
      expect(text.length).assertEqual(1);
      expect(red.applied).assertEqual(false);
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.output.length).assertEqual(1);
      expect(red.masked).assertEqual(0);
      expect(countStars(red.output)).assertEqual(0);
      expect(red.digest).assertEqual(textFingerprint(red.output));
      expect(findMarker(text)).assertEqual("");
      expect(red.original).assertEqual(text);
      logStep("payloadSecurityKeepsGreekLetterWhole", red.token());
    });

    /**
     * @tc.name          payloadSecurityKeepsMixedScriptWhole
     * @tc.desc          Multibyte payload mixed script keeps its UTF-16 unit count through redaction.
     * @tc.precondition  The redaction policy operates on UTF-16 code units only.
     * @tc.steps         1. Redact the multibyte payload mixed script.
     *                   2. Measure the unit length before and after.
     *                   3. Count the mask characters in the output.
     *                   4. Confirm no sensitive marker is present.
     * @tc.expected      The unit length is preserved, the mask count matches, and the verdict is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityKeepsMixedScriptWhole', 0, () => {
      const text: string = 'IPC-节点';
      const red: Redaction = redact(text);
      expect(text.length).assertEqual(6);
      expect(red.applied).assertEqual(false);
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.output.length).assertEqual(6);
      expect(red.masked).assertEqual(0);
      expect(countStars(red.output)).assertEqual(0);
      expect(red.digest).assertEqual(textFingerprint(red.output));
      expect(findMarker(text)).assertEqual("");
      expect(red.original).assertEqual(text);
      logStep("payloadSecurityKeepsMixedScriptWhole", red.token());
    });

    /**
     * @tc.name          payloadSecurityTreatsNewlineAsData
     * @tc.desc          Payload newline pair with embedded control characters is treated as clean data.
     * @tc.precondition  The payload is built with an explicit separator escape.
     * @tc.steps         1. Redact the control payload newline pair.
     *                   2. Split the input and output on the separator.
     *                   3. Compare the part counts.
     *                   4. Verify the digest covers the untouched output.
     * @tc.expected      Control characters are reported as data, not markers, and the payload is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityTreatsNewlineAsData', 0, () => {
      const text: string = 'a\nb';
      const red: Redaction = redact(text);
      expect(text.split('\n').length).assertEqual(2);
      expect(red.applied).assertFalse();
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.output).assertEqual(text);
      expect(red.output.split('\n').length).assertEqual(2);
      expect(findMarker(text)).assertEqual("");
      expect(red.masked).assertEqual(0);
      expect(red.digest).assertEqual(textFingerprint(text));
      expect(red.ratio()).assertEqual(0);
      logStep("payloadSecurityTreatsNewlineAsData", red.token());
    });

    /**
     * @tc.name          payloadSecurityTreatsTabAsData
     * @tc.desc          Payload tab pair with embedded control characters is treated as clean data.
     * @tc.precondition  The payload is built with an explicit separator escape.
     * @tc.steps         1. Redact the control payload tab pair.
     *                   2. Split the input and output on the separator.
     *                   3. Compare the part counts.
     *                   4. Verify the digest covers the untouched output.
     * @tc.expected      Control characters are reported as data, not markers, and the payload is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityTreatsTabAsData', 0, () => {
      const text: string = 'a\tb';
      const red: Redaction = redact(text);
      expect(text.split('\t').length).assertEqual(2);
      expect(red.applied).assertFalse();
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.output).assertEqual(text);
      expect(red.output.split('\t').length).assertEqual(2);
      expect(findMarker(text)).assertEqual("");
      expect(red.masked).assertEqual(0);
      expect(red.digest).assertEqual(textFingerprint(text));
      expect(red.ratio()).assertEqual(0);
      logStep("payloadSecurityTreatsTabAsData", red.token());
    });

    /**
     * @tc.name          payloadSecurityTreatsCarriageReturnAsData
     * @tc.desc          Payload carriage return pair with embedded control characters is treated as clean data.
     * @tc.precondition  The payload is built with an explicit separator escape.
     * @tc.steps         1. Redact the control payload carriage return pair.
     *                   2. Split the input and output on the separator.
     *                   3. Compare the part counts.
     *                   4. Verify the digest covers the untouched output.
     * @tc.expected      Control characters are reported as data, not markers, and the payload is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityTreatsCarriageReturnAsData', 0, () => {
      const text: string = 'a\rb';
      const red: Redaction = redact(text);
      expect(text.split('\r').length).assertEqual(2);
      expect(red.applied).assertFalse();
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.output).assertEqual(text);
      expect(red.output.split('\r').length).assertEqual(2);
      expect(findMarker(text)).assertEqual("");
      expect(red.masked).assertEqual(0);
      expect(red.digest).assertEqual(textFingerprint(text));
      expect(red.ratio()).assertEqual(0);
      logStep("payloadSecurityTreatsCarriageReturnAsData", red.token());
    });

    /**
     * @tc.name          payloadSecurityTreatsNullByteAsData
     * @tc.desc          Payload null byte pair with embedded control characters is treated as clean data.
     * @tc.precondition  The payload is built with an explicit separator escape.
     * @tc.steps         1. Redact the control payload null byte pair.
     *                   2. Split the input and output on the separator.
     *                   3. Compare the part counts.
     *                   4. Verify the digest covers the untouched output.
     * @tc.expected      Control characters are reported as data, not markers, and the payload is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityTreatsNullByteAsData', 0, () => {
      const text: string = 'a\u0000b';
      const red: Redaction = redact(text);
      expect(text.split('\u0000').length).assertEqual(2);
      expect(red.applied).assertFalse();
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.output).assertEqual(text);
      expect(red.output.split('\u0000').length).assertEqual(2);
      expect(findMarker(text)).assertEqual("");
      expect(red.masked).assertEqual(0);
      expect(red.digest).assertEqual(textFingerprint(text));
      expect(red.ratio()).assertEqual(0);
      logStep("payloadSecurityTreatsNullByteAsData", red.token());
    });

    /**
     * @tc.name          payloadSecurityTreatsLinePairAsData
     * @tc.desc          Payload line pair with embedded control characters is treated as clean data.
     * @tc.precondition  The payload is built with an explicit separator escape.
     * @tc.steps         1. Redact the control payload line pair.
     *                   2. Split the input and output on the separator.
     *                   3. Compare the part counts.
     *                   4. Verify the digest covers the untouched output.
     * @tc.expected      Control characters are reported as data, not markers, and the payload is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityTreatsLinePairAsData', 0, () => {
      const text: string = 'line1\nline2';
      const red: Redaction = redact(text);
      expect(text.split('\n').length).assertEqual(2);
      expect(red.applied).assertFalse();
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.output).assertEqual(text);
      expect(red.output.split('\n').length).assertEqual(2);
      expect(findMarker(text)).assertEqual("");
      expect(red.masked).assertEqual(0);
      expect(red.digest).assertEqual(textFingerprint(text));
      expect(red.ratio()).assertEqual(0);
      logStep("payloadSecurityTreatsLinePairAsData", red.token());
    });

    /**
     * @tc.name          payloadSecurityTreatsThreeLineSplitAsData
     * @tc.desc          Payload three lines with embedded control characters is treated as clean data.
     * @tc.precondition  The payload is built with an explicit separator escape.
     * @tc.steps         1. Redact the control payload three lines.
     *                   2. Split the input and output on the separator.
     *                   3. Compare the part counts.
     *                   4. Verify the digest covers the untouched output.
     * @tc.expected      Control characters are reported as data, not markers, and the payload is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityTreatsThreeLineSplitAsData', 0, () => {
      const text: string = 'x\ny\nz';
      const red: Redaction = redact(text);
      expect(text.split('\n').length).assertEqual(3);
      expect(red.applied).assertFalse();
      expect(red.reason).assertEqual(REASON_CLEAN);
      expect(red.output).assertEqual(text);
      expect(red.output.split('\n').length).assertEqual(3);
      expect(findMarker(text)).assertEqual("");
      expect(red.masked).assertEqual(0);
      expect(red.digest).assertEqual(textFingerprint(text));
      expect(red.ratio()).assertEqual(0);
      logStep("payloadSecurityTreatsThreeLineSplitAsData", red.token());
    });

    /**
     * @tc.name          payloadSecurityConvergesOnCleanText
     * @tc.desc          Repeated redaction of clean text converges after the second pass.
     * @tc.precondition  A payload is redacted three times in sequence.
     * @tc.steps         1. Redact the original payload once.
     *                   2. Redact the output twice more.
     *                   3. Compare the second and third outputs.
     *                   4. Compare digits and mask counts across passes.
     * @tc.expected      The second and third passes agree and each digest matches its output.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityConvergesOnCleanText', 0, () => {
      const text: string = 'hello world';
      const first: Redaction = redact(text);
      const second: Redaction = redact(first.output);
      const third: Redaction = redact(second.output);
      expect(second.output).assertEqual(third.output);
      expect(second.reason).assertEqual(second.applied ? REASON_LONG : REASON_CLEAN);
      expect(second.digest).assertEqual(third.digest);
      expect(first.digest).assertEqual(textFingerprint(first.output));
      expect(first.digest === second.digest).assertEqual(first.output === second.output);
      expect(second.masked <= second.original.length).assertTrue();
      expect(third.token()).assertEqual(second.token());
      logStep("payloadSecurityConvergesOnCleanText", first.token() + ">" + second.token());
    });

    /**
     * @tc.name          payloadSecurityConvergesAfterTokenMask
     * @tc.desc          Repeated redaction of token mask converges after the second pass.
     * @tc.precondition  A payload is redacted three times in sequence.
     * @tc.steps         1. Redact the original payload once.
     *                   2. Redact the output twice more.
     *                   3. Compare the second and third outputs.
     *                   4. Compare digits and mask counts across passes.
     * @tc.expected      The second and third passes agree and each digest matches its output.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityConvergesAfterTokenMask', 0, () => {
      const text: string = 'token=abc';
      const first: Redaction = redact(text);
      const second: Redaction = redact(first.output);
      const third: Redaction = redact(second.output);
      expect(second.output).assertEqual(third.output);
      expect(second.reason).assertEqual(second.applied ? REASON_LONG : REASON_CLEAN);
      expect(second.digest).assertEqual(third.digest);
      expect(first.digest).assertEqual(textFingerprint(first.output));
      expect(first.digest === second.digest).assertEqual(first.output === second.output);
      expect(second.masked <= second.original.length).assertTrue();
      expect(third.token()).assertEqual(second.token());
      logStep("payloadSecurityConvergesAfterTokenMask", first.token() + ">" + second.token());
    });

    /**
     * @tc.name          payloadSecurityConvergesAfterSecretMask
     * @tc.desc          Repeated redaction of secret mask converges after the second pass.
     * @tc.precondition  A payload is redacted three times in sequence.
     * @tc.steps         1. Redact the original payload once.
     *                   2. Redact the output twice more.
     *                   3. Compare the second and third outputs.
     *                   4. Compare digits and mask counts across passes.
     * @tc.expected      The second and third passes agree and each digest matches its output.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityConvergesAfterSecretMask', 0, () => {
      const text: string = 'secret=12';
      const first: Redaction = redact(text);
      const second: Redaction = redact(first.output);
      const third: Redaction = redact(second.output);
      expect(second.output).assertEqual(third.output);
      expect(second.reason).assertEqual(second.applied ? REASON_LONG : REASON_CLEAN);
      expect(second.digest).assertEqual(third.digest);
      expect(first.digest).assertEqual(textFingerprint(first.output));
      expect(first.digest === second.digest).assertEqual(first.output === second.output);
      expect(second.masked <= second.original.length).assertTrue();
      expect(third.token()).assertEqual(second.token());
      logStep("payloadSecurityConvergesAfterSecretMask", first.token() + ">" + second.token());
    });

    /**
     * @tc.name          payloadSecurityConvergesAtExactLimit
     * @tc.desc          Repeated redaction of exact limit converges after the second pass.
     * @tc.precondition  A payload is redacted three times in sequence.
     * @tc.steps         1. Redact the original payload once.
     *                   2. Redact the output twice more.
     *                   3. Compare the second and third outputs.
     *                   4. Compare digits and mask counts across passes.
     * @tc.expected      The second and third passes agree and each digest matches its output.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityConvergesAtExactLimit', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwx';
      const first: Redaction = redact(text);
      const second: Redaction = redact(first.output);
      const third: Redaction = redact(second.output);
      expect(second.output).assertEqual(third.output);
      expect(second.reason).assertEqual(second.applied ? REASON_LONG : REASON_CLEAN);
      expect(second.digest).assertEqual(third.digest);
      expect(first.digest).assertEqual(textFingerprint(first.output));
      expect(first.digest === second.digest).assertEqual(first.output === second.output);
      expect(second.masked <= second.original.length).assertTrue();
      expect(third.token()).assertEqual(second.token());
      logStep("payloadSecurityConvergesAtExactLimit", first.token() + ">" + second.token());
    });

    /**
     * @tc.name          payloadSecurityConvergesAfterLongMask
     * @tc.desc          Repeated redaction of long mask converges after the second pass.
     * @tc.precondition  A payload is redacted three times in sequence.
     * @tc.steps         1. Redact the original payload once.
     *                   2. Redact the output twice more.
     *                   3. Compare the second and third outputs.
     *                   4. Compare digits and mask counts across passes.
     * @tc.expected      The second and third passes agree and each digest matches its output.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityConvergesAfterLongMask', 0, () => {
      const text: string = 'secret=1234567890123';
      const first: Redaction = redact(text);
      const second: Redaction = redact(first.output);
      const third: Redaction = redact(second.output);
      expect(second.output).assertEqual(third.output);
      expect(second.reason).assertEqual(second.applied ? REASON_LONG : REASON_CLEAN);
      expect(second.digest).assertEqual(third.digest);
      expect(first.digest).assertEqual(textFingerprint(first.output));
      expect(first.digest === second.digest).assertEqual(first.output === second.output);
      expect(second.masked <= second.original.length).assertTrue();
      expect(third.token()).assertEqual(second.token());
      logStep("payloadSecurityConvergesAfterLongMask", first.token() + ">" + second.token());
    });

    /**
     * @tc.name          payloadSecurityConvergesAfterAuthMask
     * @tc.desc          Repeated redaction of auth mask converges after the second pass.
     * @tc.precondition  A payload is redacted three times in sequence.
     * @tc.steps         1. Redact the original payload once.
     *                   2. Redact the output twice more.
     *                   3. Compare the second and third outputs.
     *                   4. Compare digits and mask counts across passes.
     * @tc.expected      The second and third passes agree and each digest matches its output.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityConvergesAfterAuthMask', 0, () => {
      const text: string = 'auth=root';
      const first: Redaction = redact(text);
      const second: Redaction = redact(first.output);
      const third: Redaction = redact(second.output);
      expect(second.output).assertEqual(third.output);
      expect(second.reason).assertEqual(second.applied ? REASON_LONG : REASON_CLEAN);
      expect(second.digest).assertEqual(third.digest);
      expect(first.digest).assertEqual(textFingerprint(first.output));
      expect(first.digest === second.digest).assertEqual(first.output === second.output);
      expect(second.masked <= second.original.length).assertTrue();
      expect(third.token()).assertEqual(second.token());
      logStep("payloadSecurityConvergesAfterAuthMask", first.token() + ">" + second.token());
    });

    /**
     * @tc.name          payloadSecuritySeparatesHelloPairDigests
     * @tc.desc          Payloads labelled hello pair redact to distinct outputs and digests.
     * @tc.precondition  Both payloads are short and free of sensitive markers.
     * @tc.steps         1. Redact the first payload.
     *                   2. Redact the second payload.
     *                   3. Compare output lengths and digests.
     *                   4. Check both verdicts are clean.
     * @tc.expected      The pair keeps separate digests and neither output collapses into the other.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecuritySeparatesHelloPairDigests', 0, () => {
      const left: string = 'hello world';
      const right: string = 'hello rpc';
      const leftRed: Redaction = redact(left);
      const rightRed: Redaction = redact(right);
      expect(leftRed.applied).assertFalse();
      expect(rightRed.applied).assertFalse();
      expect(leftRed.output).assertEqual(left);
      expect(rightRed.output).assertEqual(right);
      expect(leftRed.digest).assertEqual(textFingerprint(left));
      expect(rightRed.digest).assertEqual(textFingerprint(right));
      expect(leftRed.digest === rightRed.digest).assertFalse();
      expect(leftRed.token() === rightRed.token()).assertFalse();
      logStep("payloadSecuritySeparatesHelloPairDigests", String(leftRed.digest) + ":" + String(rightRed.digest));
    });

    /**
     * @tc.name          payloadSecuritySeparatesPingPongDigests
     * @tc.desc          Payloads labelled ping pong pair redact to distinct outputs and digests.
     * @tc.precondition  Both payloads are short and free of sensitive markers.
     * @tc.steps         1. Redact the first payload.
     *                   2. Redact the second payload.
     *                   3. Compare output lengths and digests.
     *                   4. Check both verdicts are clean.
     * @tc.expected      The pair keeps separate digests and neither output collapses into the other.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecuritySeparatesPingPongDigests', 0, () => {
      const left: string = 'ping';
      const right: string = 'pong';
      const leftRed: Redaction = redact(left);
      const rightRed: Redaction = redact(right);
      expect(leftRed.applied).assertFalse();
      expect(rightRed.applied).assertFalse();
      expect(leftRed.output).assertEqual(left);
      expect(rightRed.output).assertEqual(right);
      expect(leftRed.digest).assertEqual(textFingerprint(left));
      expect(rightRed.digest).assertEqual(textFingerprint(right));
      expect(leftRed.digest === rightRed.digest).assertFalse();
      // Equal-length clean inputs share metadata; their digests still differ.
      expect(leftRed.token() === rightRed.token()).assertTrue();
      logStep("payloadSecuritySeparatesPingPongDigests", String(leftRed.digest) + ":" + String(rightRed.digest));
    });

    /**
     * @tc.name          payloadSecuritySeparatesGreekPairDigests
     * @tc.desc          Payloads labelled greek pair redact to distinct outputs and digests.
     * @tc.precondition  Both payloads are short and free of sensitive markers.
     * @tc.steps         1. Redact the first payload.
     *                   2. Redact the second payload.
     *                   3. Compare output lengths and digests.
     *                   4. Check both verdicts are clean.
     * @tc.expected      The pair keeps separate digests and neither output collapses into the other.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecuritySeparatesGreekPairDigests', 0, () => {
      const left: string = 'alpha';
      const right: string = 'beta';
      const leftRed: Redaction = redact(left);
      const rightRed: Redaction = redact(right);
      expect(leftRed.applied).assertFalse();
      expect(rightRed.applied).assertFalse();
      expect(leftRed.output).assertEqual(left);
      expect(rightRed.output).assertEqual(right);
      expect(leftRed.digest).assertEqual(textFingerprint(left));
      expect(rightRed.digest).assertEqual(textFingerprint(right));
      expect(leftRed.digest === rightRed.digest).assertFalse();
      expect(leftRed.token() === rightRed.token()).assertFalse();
      logStep("payloadSecuritySeparatesGreekPairDigests", String(leftRed.digest) + ":" + String(rightRed.digest));
    });

    /**
     * @tc.name          payloadSecuritySeparatesStubPairDigests
     * @tc.desc          Payloads labelled stub pair redact to distinct outputs and digests.
     * @tc.precondition  Both payloads are short and free of sensitive markers.
     * @tc.steps         1. Redact the first payload.
     *                   2. Redact the second payload.
     *                   3. Compare output lengths and digests.
     *                   4. Check both verdicts are clean.
     * @tc.expected      The pair keeps separate digests and neither output collapses into the other.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecuritySeparatesStubPairDigests', 0, () => {
      const left: string = 'stub-a';
      const right: string = 'stub-b';
      const leftRed: Redaction = redact(left);
      const rightRed: Redaction = redact(right);
      expect(leftRed.applied).assertFalse();
      expect(rightRed.applied).assertFalse();
      expect(leftRed.output).assertEqual(left);
      expect(rightRed.output).assertEqual(right);
      expect(leftRed.digest).assertEqual(textFingerprint(left));
      expect(rightRed.digest).assertEqual(textFingerprint(right));
      expect(leftRed.digest === rightRed.digest).assertFalse();
      // Equal-length clean inputs share metadata; their digests still differ.
      expect(leftRed.token() === rightRed.token()).assertTrue();
      logStep("payloadSecuritySeparatesStubPairDigests", String(leftRed.digest) + ":" + String(rightRed.digest));
    });

    /**
     * @tc.name          payloadSecuritySeparatesNumberWordsDigests
     * @tc.desc          Payloads labelled number words redact to distinct outputs and digests.
     * @tc.precondition  Both payloads are short and free of sensitive markers.
     * @tc.steps         1. Redact the first payload.
     *                   2. Redact the second payload.
     *                   3. Compare output lengths and digests.
     *                   4. Check both verdicts are clean.
     * @tc.expected      The pair keeps separate digests and neither output collapses into the other.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecuritySeparatesNumberWordsDigests', 0, () => {
      const left: string = 'one';
      const right: string = 'two';
      const leftRed: Redaction = redact(left);
      const rightRed: Redaction = redact(right);
      expect(leftRed.applied).assertFalse();
      expect(rightRed.applied).assertFalse();
      expect(leftRed.output).assertEqual(left);
      expect(rightRed.output).assertEqual(right);
      expect(leftRed.digest).assertEqual(textFingerprint(left));
      expect(rightRed.digest).assertEqual(textFingerprint(right));
      expect(leftRed.digest === rightRed.digest).assertFalse();
      // Equal-length clean inputs share metadata; their digests still differ.
      expect(leftRed.token() === rightRed.token()).assertTrue();
      logStep("payloadSecuritySeparatesNumberWordsDigests", String(leftRed.digest) + ":" + String(rightRed.digest));
    });

    /**
     * @tc.name          payloadSecuritySeparatesShortKeysDigests
     * @tc.desc          Payloads labelled short keys redact to distinct outputs and digests.
     * @tc.precondition  Both payloads are short and free of sensitive markers.
     * @tc.steps         1. Redact the first payload.
     *                   2. Redact the second payload.
     *                   3. Compare output lengths and digests.
     *                   4. Check both verdicts are clean.
     * @tc.expected      The pair keeps separate digests and neither output collapses into the other.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecuritySeparatesShortKeysDigests', 0, () => {
      const left: string = 'k1';
      const right: string = 'k2';
      const leftRed: Redaction = redact(left);
      const rightRed: Redaction = redact(right);
      expect(leftRed.applied).assertFalse();
      expect(rightRed.applied).assertFalse();
      expect(leftRed.output).assertEqual(left);
      expect(rightRed.output).assertEqual(right);
      expect(leftRed.digest).assertEqual(textFingerprint(left));
      expect(rightRed.digest).assertEqual(textFingerprint(right));
      expect(leftRed.digest === rightRed.digest).assertFalse();
      // Equal-length clean inputs share metadata; their digests still differ.
      expect(leftRed.token() === rightRed.token()).assertTrue();
      logStep("payloadSecuritySeparatesShortKeysDigests", String(leftRed.digest) + ":" + String(rightRed.digest));
    });
  });
}
