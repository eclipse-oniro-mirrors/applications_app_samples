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
 * PayloadSecurity: payload redaction rules for the IPC client.
 *
 * The client sends 'hello world' and logs the reply. Any diagnostic line that
 * carries caller supplied text must be redacted before it reaches a bounded
 * log buffer. This suite pins the redaction helpers and their invariants.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  SEND_SUCCESS_TOAST,
  SEND_FAIL_TOAST,
  LEVEL_INFO,
  LEVEL_ERROR,
  LEVEL_WARN,
  ERROR_NONE,
  MessageSequenceModel,
  RemoteProxyModel,
  LogBuffer,
  ConnectionModel,
  createConnectedSession,
  joined,
  countOf,
  uniqueStrings,
  textFingerprint
} from '../Shared/SharedDriver';

function maskSecret(value: string): string {
  if (value.length === 0) {
    return '';
  }
  if (value.length <= 4) {
    return '****';
  }
  return value.substring(0, 2) + '****' + value.substring(value.length - 2);
}

function redactAssignment(line: string): string {
  const marker: string = 'secret=';
  const index = line.indexOf(marker);
  if (index < 0) {
    return line;
  }
  const start = index + marker.length;
  let end = line.indexOf(' ', start);
  if (end < 0) {
    end = line.length;
  }
  const value = line.substring(start, end);
  return line.substring(0, start) + maskSecret(value) + line.substring(end);
}

function leaksPlaintext(line: string, plaintext: string): boolean {
  if (plaintext.length < 4) {
    return false;
  }
  return line.indexOf(plaintext) >= 0;
}

function redactedFingerprint(values: string[]): number {
  const out: string[] = [];
  for (let index = 0; index < values.length; index++) {
    out.push(redactAssignment(values[index]));
  }
  return textFingerprint(joined(out, '|'));
}

export default function payloadSecurity(): void {
  describe('PayloadSecurity', () => {
    beforeAll(() => {
      logSuite('PayloadSecurity', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('PayloadSecurity', 'end');
    });

    /**
     * @tc.name          payloadSecurityShortSecretIsFullyMasked
     * @tc.desc          Secrets shorter than five characters are fully masked.
     * @tc.precondition  The local mask helper is defined.
     * @tc.steps         1. Mask the empty string. 2. Mask one to four chars.
     *                   3. Mask a five char value.
     * @tc.expected      Short values become four stars; the empty one stays empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadSecurityShortSecretIsFullyMasked', 0, () => {
      logStep('payloadSecurity', 'short secret');
      expect(maskSecret('')).assertEqual('');
      expect(maskSecret('a')).assertEqual('****');
      expect(maskSecret('ab')).assertEqual('****');
      expect(maskSecret('abcd')).assertEqual('****');
      expect(maskSecret('abcde')).assertEqual('ab****de');
      expect(maskSecret('abcd').indexOf('abcd')).assertEqual(-1);
      expect(maskSecret('abcd').length).assertEqual(4);
    });

    /**
     * @tc.name          payloadSecurityLongSecretKeepsOnlyEdges
     * @tc.desc          A long secret keeps two leading and two trailing chars.
     * @tc.precondition  The local mask helper is defined.
     * @tc.steps         1. Mask a token. 2. Check the prefix and suffix.
     *                   3. Confirm the middle is gone.
     * @tc.expected      Only the two char edges survive the mask.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadSecurityLongSecretKeepsOnlyEdges', 0, () => {
      logStep('payloadSecurity', 'long secret');
      const masked = maskSecret('token-abcdef-123456');
      expect(masked.startsWith('to')).assertTrue();
      expect(masked.endsWith('56')).assertTrue();
      expect(masked.indexOf('****')).assertEqual(2);
      expect(masked.indexOf('abcdef')).assertEqual(-1);
      expect(masked.length).assertEqual(8);
      expect(masked).assertEqual('to****56');
    });

    /**
     * @tc.name          payloadSecurityAssignmentLineIsRedacted
     * @tc.desc          A secret=value assignment is redacted in place.
     * @tc.precondition  The local redaction helper is defined.
     * @tc.steps         1. Redact a complete assignment line. 2. Redact a line
     *                   with a trailing field. 3. Confirm both keep the key.
     * @tc.expected      The key survives and the value is masked.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadSecurityAssignmentLineIsRedacted', 0, () => {
      logStep('payloadSecurity', 'assignment line');
      const single = redactAssignment('secret=hunter2hunter2');
      const trailing = redactAssignment('auth secret=abcdefgh123456 path=/rpc');
      expect(single.startsWith('secret=')).assertTrue();
      expect(single.indexOf('hunter2')).assertEqual(-1);
      expect(trailing.endsWith(' path=/rpc')).assertTrue();
      expect(trailing.indexOf('abcdefgh')).assertEqual(-1);
      expect(trailing.indexOf('secret=')).assertEqual(5);
      expect(leaksPlaintext(trailing, 'abcdefgh123456')).assertFalse();
    });

    /**
     * @tc.name          payloadSecuritySampledPayloadsStayIntact
     * @tc.desc          Ordinary payload text is not redacted by accident.
     * @tc.precondition  A connected session and a bounded log buffer exist.
     * @tc.steps         1. Send the sample payload. 2. Write an info line.
     *                   3. Redact the line and compare.
     * @tc.expected      Payloads without a secret marker are unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadSecuritySampledPayloadsStayIntact', 0, () => {
      logStep('payloadSecurity', 'plain payload');
      const session = createConnectedSession();
      const result = session.sendString(REQUEST_PAYLOAD);
      const buffer = new LogBuffer(16);
      const line = 'reply ' + REPLY_PAYLOAD;
      buffer.info(line);
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.cursor).assertEqual(0);
      expect(session.logs.contains('reply ' + REPLY_PAYLOAD)).assertTrue();
      expect(redactAssignment(line)).assertEqual(line);
      expect(redactAssignment(line).indexOf(REPLY_PAYLOAD) >= 0).assertTrue();
      expect(buffer.contains(REPLY_PAYLOAD)).assertTrue();
      expect(session.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
    });

    /**
     * @tc.name          payloadSecurityMarkerOnlyRedactsFirstValue
     * @tc.desc          Only the first secret= value on a line is redacted.
     * @tc.precondition  The redaction helper scans once from the left.
     * @tc.steps         1. Redact a line with two assignments. 2. Compare the
     *                   tail. 3. Check the first value is gone.
     * @tc.expected      The first value is masked and the second is untouched.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityMarkerOnlyRedactsFirstValue', 0, () => {
      logStep('payloadSecurity', 'first marker only');
      const line = 'secret=aaa secret=bbb';
      const masked = redactAssignment(line);
      expect(masked).assertEqual('secret=**** secret=bbb');
      expect(masked.indexOf('aaa')).assertEqual(-1);
      expect(masked.indexOf('secret=')).assertEqual(0);
      expect(masked.endsWith('secret=bbb')).assertTrue();
      expect(masked.length).assertEqual(line.length + 1);
      expect(countOf(masked.split(' '), 'secret=bbb')).assertEqual(1);
    });

    /**
     * @tc.name          payloadSecurityLineWithoutMarkerIsUntouched
     * @tc.desc          A line without the secret marker is returned as is.
     * @tc.precondition  The redaction helper is defined.
     * @tc.steps         1. Redact three marker free lines. 2. Compare identities.
     *                   3. Compare fingerprints.
     * @tc.expected      Every marker free line is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadSecurityLineWithoutMarkerIsUntouched', 0, () => {
      logStep('payloadSecurity', 'no marker');
      const lines: string[] = ['reply hello rpc', 'proxy is invalid', 'errCode 16000003'];
      for (let index = 0; index < lines.length; index++) {
        expect(redactAssignment(lines[index])).assertEqual(lines[index]);
        expect(redactAssignment(lines[index]).length).assertEqual(lines[index].length);
      }
      expect(redactAssignment(lines[0])).assertEqual('reply hello rpc');
      expect(textFingerprint(redactAssignment(lines[1]))).assertEqual(textFingerprint(lines[1]));
      expect(joined(lines, '|')).assertEqual('reply hello rpc|proxy is invalid|errCode 16000003');
    });

    /**
     * @tc.name          payloadSecurityEmptySecretValueStaysEmpty
     * @tc.desc          A trailing marker with no value produces no mask.
     * @tc.precondition  The redaction helper handles an empty value.
     * @tc.steps         1. Redact a bare marker. 2. Redact a marker then space.
     *                   3. Compare both lengths.
     * @tc.expected      Bare markers are returned unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityEmptySecretValueStaysEmpty', 0, () => {
      logStep('payloadSecurity', 'empty secret');
      expect(redactAssignment('secret=')).assertEqual('secret=');
      expect(redactAssignment('secret= ')).assertEqual('secret= ');
      expect(redactAssignment('secret=').length).assertEqual(7);
      expect(maskSecret('')).assertEqual('');
      expect(redactAssignment('secret=').indexOf('****')).assertEqual(-1);
      expect(redactAssignment('x secret=')).assertEqual('x secret=');
    });

    /**
     * @tc.name          payloadSecurityMaskedLengthIsStable
     * @tc.desc          All secrets longer than four chars mask to eight chars.
     * @tc.precondition  The mask helper keeps two chars on each edge.
     * @tc.steps         1. Mask values of length five, eight and twenty.
     *                   2. Compare their lengths. 3. Compare their centers.
     * @tc.expected      Every masked value is eight characters wide.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityMaskedLengthIsStable', 0, () => {
      logStep('payloadSecurity', 'mask length');
      const five = maskSecret('abcde');
      const eight = maskSecret('abcdefgh');
      const twenty = maskSecret('abcdefghijklmnopqrst');
      expect(five.length).assertEqual(8);
      expect(eight.length).assertEqual(8);
      expect(twenty.length).assertEqual(8);
      expect(five).assertEqual('ab****de');
      expect(eight).assertEqual('ab****gh');
      expect(twenty).assertEqual('ab****st');
      expect(eight.substring(2, 6)).assertEqual('****');
    });

    /**
     * @tc.name          payloadSecurityUnicodeSecretIsMasked
     * @tc.desc          Masking keeps code units rather than bytes.
     * @tc.precondition  The mask helper slices by string index.
     * @tc.steps         1. Mask a Chinese key. 2. Check the edges. 3. Check the
     *                   middle is gone.
     * @tc.expected      The first and last two code units survive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityUnicodeSecretIsMasked', 0, () => {
      logStep('payloadSecurity', 'unicode secret');
      const value = '密钥abcdef';
      const masked = maskSecret(value);
      expect(masked.startsWith('密钥')).assertTrue();
      expect(masked.endsWith('ef')).assertTrue();
      expect(masked).assertEqual('密钥****ef');
      expect(masked.indexOf('abcd')).assertEqual(-1);
      expect(masked.length).assertEqual(8);
      expect(value.length).assertEqual(8);
      expect(textFingerprint(masked) === textFingerprint(value)).assertFalse();
    });

    /**
     * @tc.name          payloadSecuritySuccessLogOmitsRequestPayload
     * @tc.desc          A successful send logs the reply, never the request.
     * @tc.precondition  A connected session and a live stub exist.
     * @tc.steps         1. Send the request payload. 2. Inspect the log buffer.
     *                   3. Inspect the events and toast.
     * @tc.expected      The reply is logged but the request payload is not.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadSecuritySuccessLogOmitsRequestPayload', 0, () => {
      logStep('payloadSecurity', 'success log');
      const client = createConnectedSession();
      const result = client.sendString(REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(client.logs.contains(REPLY_PAYLOAD)).assertTrue();
      expect(client.logs.contains(REQUEST_PAYLOAD)).assertFalse();
      expect(client.logs.contains('reply ' + REPLY_PAYLOAD)).assertTrue();
      expect(client.events.last()).assertEqual('send-ok:' + REPLY_PAYLOAD);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.logs.countLevel(LEVEL_INFO) > 0).assertTrue();
    });

    /**
     * @tc.name          payloadSecurityNoProxyLogOmitsPayload
     * @tc.desc          The invalid proxy error line carries no caller payload.
     * @tc.precondition  A fresh client has no proxy.
     * @tc.steps         1. Send a marked payload. 2. Read the error log.
     *                   3. Compare the log and the event record.
     * @tc.expected      The log omits the payload while the event keeps it.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityNoProxyLogOmitsPayload', 0, () => {
      logStep('payloadSecurity', 'no proxy log');
      const marked = 'payload-marker-77';
      const client = new ConnectionModel();
      const result = client.sendString(marked);
      expect(result.errCode).assertEqual(16000004);
      expect(client.logs.contains('proxy is invalid')).assertTrue();
      expect(client.logs.contains(marked)).assertFalse();
      expect(client.events.last()).assertEqual('send-no-proxy:' + marked);
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.toasts.join(',')).assertEqual(SEND_FAIL_TOAST);
    });

    /**
     * @tc.name          payloadSecurityFailureLogHasOnlyErrorCode
     * @tc.desc          A failed send logs its errCode without the request text.
     * @tc.precondition  A connected session whose stub has been killed.
     * @tc.steps         1. Kill the stub. 2. Send a marked payload. 3. Read the
     *                   error line.
     * @tc.expected      The error code appears and the payload does not.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityFailureLogHasOnlyErrorCode', 0, () => {
      logStep('payloadSecurity', 'failure log');
      const marked = 'payload-marker-88';
      const client = createConnectedSession();
      (client.proxy as RemoteProxyModel).stub.kill();
      const result = client.sendString(marked);
      expect(result.errCode).assertEqual(16000003);
      expect(client.logs.contains('16000003')).assertTrue();
      expect(client.logs.contains(marked)).assertFalse();
      expect(client.logs.contains('sendMessageRequest failed')).assertTrue();
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.events.last()).assertEqual('send-failed:16000003');
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
    });

    /**
     * @tc.name          payloadSecurityToastTextCarriesNoPayload
     * @tc.desc          Toast literals are constant and payload free.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send two different payloads. 2. Compare the toasts.
     *                   3. Confirm neither toast contains either payload.
     * @tc.expected      Both toasts are the same constant success text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityToastTextCarriesNoPayload', 0, () => {
      logStep('payloadSecurity', 'toast text');
      const client = createConnectedSession();
      client.sendString('first-payload');
      client.sendString('second-payload');
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[1]).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.toasts[2]).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.toasts[2].indexOf('first-payload')).assertEqual(-1);
      expect(client.toasts[2].indexOf('second-payload')).assertEqual(-1);
      expect(uniqueStrings(client.toasts).length).assertEqual(2);
      expect(client.lastToast()).assertEqual('sendRequest success');
    });

    /**
     * @tc.name          payloadSecurityRedactedTraceIsStable
     * @tc.desc          Redacting a fixed line set yields a stable fingerprint.
     * @tc.precondition  The redacted fingerprint helper is defined.
     * @tc.steps         1. Redact three lines twice. 2. Compare fingerprints.
     *                   3. Compare the individual outputs.
     * @tc.expected      The redacted set is deterministic and marker free.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityRedactedTraceIsStable', 0, () => {
      logStep('payloadSecurity', 'redacted trace');
      const lines: string[] = ['secret=alpha123', 'reply hello rpc', 'secret=beta456'];
      const first = redactedFingerprint(lines);
      const second = redactedFingerprint(lines);
      expect(first).assertEqual(second);
      expect(first === textFingerprint(joined(lines, '|'))).assertFalse();
      expect(redactAssignment(lines[0])).assertEqual('secret=al****23');
      expect(redactAssignment(lines[2])).assertEqual('secret=be****56');
      expect(redactAssignment(lines[1])).assertEqual(lines[1]);
    });

    /**
     * @tc.name          payloadSecurityMultipleLinesRedactIndependently
     * @tc.desc          Each line is redacted with its own secret value.
     * @tc.precondition  The redaction helper is defined.
     * @tc.steps         1. Redact four distinct assignment lines. 2. Compare
     *                   the results. 3. Count the masks.
     * @tc.expected      Every value is masked and every key is kept.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityMultipleLinesRedactIndependently', 0, () => {
      logStep('payloadSecurity', 'multiple lines');
      const lines: string[] = ['secret=aaaa11', 'secret=bbbb22', 'secret=cccc33', 'secret=dddd44'];
      const out: string[] = [];
      for (let index = 0; index < lines.length; index++) {
        out.push(redactAssignment(lines[index]));
      }
      expect(out.length).assertEqual(4);
      expect(out[0]).assertEqual('secret=aa****11');
      expect(out[3]).assertEqual('secret=dd****44');
      expect(joined(out, '|')).assertEqual('secret=aa****11|secret=bb****22|secret=cc****33|secret=dd****44');
      expect(countOf(out, 'secret=aa****11')).assertEqual(1);
      expect(uniqueStrings(out).length).assertEqual(4);
      expect(leaksPlaintext(joined(out, '|'), 'aaaa11')).assertFalse();
    });

    /**
     * @tc.name          payloadSecurityMaskHidesMiddleText
     * @tc.desc          The masked middle is never a reversible substring.
     * @tc.precondition  The mask helper replaces the middle with four stars.
     * @tc.steps         1. Mask a numeric token. 2. Check every middle slice is
     *                   absent. 3. Check the star run.
     * @tc.expected      No interior three character slice survives.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadSecurityMaskHidesMiddleText', 0, () => {
      logStep('payloadSecurity', 'mask hides middle');
      const value = '9876543210';
      const masked = maskSecret(value);
      expect(masked).assertEqual('98****10');
      expect(masked.indexOf('765')).assertEqual(-1);
      expect(masked.indexOf('654')).assertEqual(-1);
      expect(masked.indexOf('****')).assertEqual(2);
      expect(masked.substring(0, 2)).assertEqual('98');
      expect(masked.substring(6)).assertEqual('10');
      expect(leaksPlaintext(masked, '9876')).assertFalse();
    });

    /**
     * @tc.name          payloadSecurityDigitSecretIsMasked
     * @tc.desc          Purely numeric secrets are masked like any other value.
     * @tc.precondition  The redaction helper is defined.
     * @tc.steps         1. Redact a four digit value. 2. Redact a ten digit
     *                   value. 3. Compare their masks.
     * @tc.expected      The short value becomes stars and the long one keeps edges.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityDigitSecretIsMasked', 0, () => {
      logStep('payloadSecurity', 'digit secret');
      expect(redactAssignment('secret=1234')).assertEqual('secret=****');
      expect(redactAssignment('secret=1234567890')).assertEqual('secret=12****90');
      expect(redactAssignment('secret=1234').indexOf('1234')).assertEqual(-1);
      expect(redactAssignment('secret=1234567890').length).assertEqual(15);
      expect(redactAssignment('x secret=1234 y')).assertEqual('x secret=**** y');
      expect(countOf(redactAssignment('x secret=1234 y').split(' '), 'secret=****')).assertEqual(1);
    });

    /**
     * @tc.name          payloadSecurityMarkerInsideWordIsRedacted
     * @tc.desc          The marker is found even when prefixed by a word.
     * @tc.precondition  The helper scans for the marker at any offset.
     * @tc.steps         1. Redact a prefixed marker. 2. Check the preserved
     *                   prefix. 3. Check the masked value.
     * @tc.expected      The prefix is kept and the value is masked.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadSecurityMarkerInsideWordIsRedacted', 0, () => {
      logStep('payloadSecurity', 'marker inside word');
      const line = 'mysecret=abcdef';
      const masked = redactAssignment(line);
      expect(masked).assertEqual('mysecret=ab****ef');
      expect(masked.startsWith('my')).assertTrue();
      expect(masked.indexOf('abcdef')).assertEqual(-1);
      expect(masked.length).assertEqual(line.length + 2);
      expect(masked.indexOf('cde')).assertEqual(-1);
      expect(textFingerprint(masked) === textFingerprint(line)).assertFalse();
    });

    /**
     * @tc.name          payloadSecurityRedactionKeepsNeighbourFields
     * @tc.desc          Fields before and after the secret are preserved.
     * @tc.precondition  The helper only replaces the value slice.
     * @tc.steps         1. Redact a line with a path prefix. 2. Redact one with a
     *                   suffix. 3. Compare the retained fields.
     * @tc.expected      Both neighbours survive with their spaces.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityRedactionKeepsNeighbourFields', 0, () => {
      logStep('payloadSecurity', 'neighbour fields');
      const prefixed = 'path=/rpc secret=abcdef12 done';
      const suffixed = 'secret=abcdef12 path=/rpc';
      expect(redactAssignment(prefixed)).assertEqual('path=/rpc secret=ab****12 done');
      expect(redactAssignment(suffixed)).assertEqual('secret=ab****12 path=/rpc');
      expect(redactAssignment(prefixed).startsWith('path=/rpc ')).assertTrue();
      expect(redactAssignment(prefixed).endsWith(' done')).assertTrue();
      expect(redactAssignment(suffixed).endsWith(' path=/rpc')).assertTrue();
      expect(redactAssignment(prefixed).indexOf('abcdef12')).assertEqual(-1);
      expect(countOf(redactAssignment(prefixed).split(' '), 'path=/rpc')).assertEqual(1);
    });

    /**
     * @tc.name          payloadSecurityEmptyPayloadSendsCleanly
     * @tc.desc          An empty payload is accepted by the request path.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send the empty payload. 2. Read the reply. 3. Inspect
     *                   the received history and logs.
     * @tc.expected      The request succeeds and the stub records one empty text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityEmptyPayloadSendsCleanly', 0, () => {
      logStep('payloadSecurity', 'empty payload');
      const client = createConnectedSession();
      const result = client.sendString('');
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.cursor).assertEqual(0);
      expect((client.proxy as RemoteProxyModel).stub.receivedTexts.length).assertEqual(1);
      expect((client.proxy as RemoteProxyModel).stub.receivedTexts[0]).assertEqual('');
      expect(client.logs.contains('reply ' + REPLY_PAYLOAD)).assertTrue();
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.events.last()).assertEqual('send-ok:' + REPLY_PAYLOAD);
    });

    /**
     * @tc.name          payloadSecurityBurstLogKeepsNoSecret
     * @tc.desc          A trimmed burst buffer still contains no raw secret.
     * @tc.precondition  A four slot buffer receives ten redacted lines.
     * @tc.steps         1. Redact and store ten lines. 2. Check the size. 3. Scan
     *                   the trace for any raw token.
     * @tc.expected      Four redacted lines remain and no token prefix survives.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityBurstLogKeepsNoSecret', 0, () => {
      logStep('payloadSecurity', 'burst log');
      const buffer = new LogBuffer(4);
      for (let index = 0; index < 10; index++) {
        buffer.info(redactAssignment('secret=token-' + String(index)));
      }
      expect(buffer.size()).assertEqual(4);
      expect(buffer.trace().indexOf('token-')).assertEqual(-1);
      expect(buffer.contains('token-3')).assertFalse();
      expect(buffer.contains('****')).assertTrue();
      expect(buffer.trace().split('|').length).assertEqual(4);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(4);
      expect(buffer.lines[3]).assertEqual('INFO secret=to****-9');
    });

    /**
     * @tc.name          payloadSecurityEmptyRedactionSetFingerprintsEmpty
     * @tc.desc          Redacting an empty line set yields the empty fingerprint.
     * @tc.precondition  The redacted fingerprint helper is defined.
     * @tc.steps         1. Fingerprint an empty set. 2. Fingerprint one empty line.
     *                   3. Compare both.
     * @tc.expected      Both fingerprints equal the empty text fingerprint.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadSecurityEmptyRedactionSetFingerprintsEmpty', 0, () => {
      logStep('payloadSecurity', 'empty redaction set');
      expect(redactedFingerprint([])).assertEqual(216613);
      expect(redactedFingerprint([''])).assertEqual(textFingerprint(''));
      expect(redactedFingerprint([''])).assertEqual(216613);
      expect(redactedFingerprint(['secret='])).assertEqual(textFingerprint('secret='));
      expect(redactedFingerprint([]) === redactedFingerprint(['x'])).assertFalse();
      expect(redactedFingerprint(['a', 'b'])).assertEqual(textFingerprint('a|b'));
    });

    /**
     * @tc.name          payloadSecurityRedactionKeepsLineCount
     * @tc.desc          Redacting each line does not add or drop separators.
     * @tc.precondition  Three marker-bearing lines exist.
     * @tc.steps         1. Redact and join. 2. Count the pipe separators. 3. Compare
     *                   to the source separator count.
     * @tc.expected      The redacted set still has three lines.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityRedactionKeepsLineCount', 0, () => {
      logStep('payloadSecurity', 'line count');
      const lines: string[] = ['secret=aaaa11', 'plain line', 'secret=bbbb22'];
      const out: string[] = [];
      for (let index = 0; index < lines.length; index++) {
        out.push(redactAssignment(lines[index]));
      }
      expect(out.length).assertEqual(lines.length);
      expect(joined(out, '|').split('|').length).assertEqual(3);
      expect(joined(lines, '|').split('|').length).assertEqual(3);
      expect(out[1]).assertEqual('plain line');
      expect(out[0]).assertEqual('secret=aa****11');
      expect(out[2]).assertEqual('secret=bb****22');
      expect(countOf(out, 'plain line')).assertEqual(1);
    });

    /**
     * @tc.name          payloadSecurityFailureEventKeepsOnlyCode
     * @tc.desc          The failed send event stores the code, not the payload.
     * @tc.precondition  A connected session whose stub is dead.
     * @tc.steps         1. Kill the stub. 2. Send a marked payload. 3. Read the last
     *                   event.
     * @tc.expected      The event detail is the numeric code only.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityFailureEventKeepsOnlyCode', 0, () => {
      logStep('payloadSecurity', 'failure event code');
      const marked = 'marker-31415';
      const client = createConnectedSession();
      (client.proxy as RemoteProxyModel).stub.kill();
      client.sendString(marked);
      const last = client.events.last();
      expect(last).assertEqual('send-failed:16000003');
      expect(last.indexOf(marked)).assertEqual(-1);
      expect(last.startsWith('send-failed:')).assertTrue();
      expect(last.substring(12)).assertEqual('16000003');
      expect(client.events.countOf('send-failed')).assertEqual(1);
      expect(client.logs.contains(marked)).assertFalse();
      expect(client.logs.contains('16000003')).assertTrue();
    });

    /**
     * @tc.name          payloadSecurityConnectToastIsPayloadFree
     * @tc.desc          The connect success toast is a fixed public string.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Read the connect toast. 2. Compare it to the constant.
     *                   3. Check for payload fragments.
     * @tc.expected      The toast is the constant success text without payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadSecurityConnectToastIsPayloadFree', 0, () => {
      logStep('payloadSecurity', 'connect toast');
      const client = createConnectedSession();
      expect(client.toasts.length).assertEqual(1);
      expect(client.toasts[0]).assertEqual('connectAbility success');
      expect(client.toasts[0].indexOf(REQUEST_PAYLOAD)).assertEqual(-1);
      expect(client.toasts[0].indexOf(REPLY_PAYLOAD)).assertEqual(-1);
      expect(client.toasts[0].length).assertEqual(22);
      expect(client.lastToast()).assertEqual(client.toasts[0]);
      expect(client.toasts[0].startsWith('connectAbility')).assertTrue();
    });

    /**
     * @tc.name          payloadSecurityManySendsDoNotLogRequestText
     * @tc.desc          Five sends log five replies and zero request payloads.
     * @tc.precondition  A connected session can serve five sends.
     * @tc.steps         1. Send five distinct payloads. 2. Count reply log lines.
     *                   3. Count request payload leaks.
     * @tc.expected      Five reply lines exist and no request text is logged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityManySendsDoNotLogRequestText', 0, () => {
      logStep('payloadSecurity', 'many sends');
      const client = createConnectedSession();
      const payloads: string[] = ['p-one', 'p-two', 'p-three', 'p-four', 'p-five'];
      for (let index = 0; index < payloads.length; index++) {
        expect(client.sendString(payloads[index]).errCode).assertEqual(ERROR_NONE);
      }
      expect(countOf(client.logs.lines, 'INFO reply ' + REPLY_PAYLOAD)).assertEqual(5);
      expect(client.logs.contains('p-one')).assertFalse();
      expect(client.logs.contains('p-five')).assertFalse();
      expect(client.toasts.length).assertEqual(6);
      expect(client.events.countOf('send-ok')).assertEqual(5);
      expect(client.events.size()).assertEqual(8);
    });

    /**
     * @tc.name          payloadSecurityEmojiSecretKeepsSurrogateEdges
     * @tc.desc          Masking an emoji secret keeps two code units per edge.
     * @tc.precondition  The mask helper slices by UTF-16 index.
     * @tc.steps         1. Mask three emoji. 2. Check the length and stars. 3. Compare
     *                   it to the source.
     * @tc.expected      The masked value is eight code units with all stars inside.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadSecurityEmojiSecretKeepsSurrogateEdges', 0, () => {
      logStep('payloadSecurity', 'emoji secret');
      const value = '😀😀😀';
      const masked = maskSecret(value);
      expect(value.length).assertEqual(6);
      expect(masked.length).assertEqual(8);
      expect(masked.substring(0, 2)).assertEqual('😀');
      expect(masked.substring(6)).assertEqual('😀');
      expect(masked.substring(2, 6)).assertEqual('****');
      expect(masked === value).assertFalse();
      expect(masked.indexOf('****')).assertEqual(2);
    });

    /**
     * @tc.name          payloadSecurityDistinctEdgesGiveDistinctMasks
     * @tc.desc          Masks differ when the visible edges differ.
     * @tc.precondition  The mask helper keeps the two char edges.
     * @tc.steps         1. Mask three secrets with distinct edges. 2. Compare them.
     *                   3. Count the unique masks.
     * @tc.expected      Three distinct secrets yield three distinct masks.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityDistinctEdgesGiveDistinctMasks', 0, () => {
      logStep('payloadSecurity', 'distinct masks');
      const values: string[] = ['alphaXX', 'betaXX', 'gammaXY'];
      const masks: string[] = [];
      for (let index = 0; index < values.length; index++) {
        masks.push(maskSecret(values[index]));
      }
      expect(masks[0]).assertEqual('al****XX');
      expect(masks[1]).assertEqual('be****XX');
      expect(masks[2]).assertEqual('ga****XY');
      expect(uniqueStrings(masks).length).assertEqual(3);
      expect(masks[0] === masks[1]).assertFalse();
      expect(countOf(masks, 'be****XX')).assertEqual(1);
      expect(joined(masks, '|').split('|').length).assertEqual(3);
    });

    /**
     * @tc.name          payloadSecurityRedactedBufferKeepsLevels
     * @tc.desc          Redacting before storing does not alter log levels.
     * @tc.precondition  A buffer with four slots exists.
     * @tc.steps         1. Store redacted info, warn and error lines. 2. Count each
     *                   level. 3. Check the trace.
     * @tc.expected      Each level is preserved and no raw secret is present.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityRedactedBufferKeepsLevels', 0, () => {
      logStep('payloadSecurity', 'buffer levels');
      const buffer = new LogBuffer(4);
      buffer.info(redactAssignment('secret=alpha123'));
      buffer.warn(redactAssignment('secret=beta456'));
      buffer.error(redactAssignment('secret=gamma789'));
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.trace()).assertEqual('INFO secret=al****23|WARN secret=be****56|ERROR secret=ga****89');
      expect(buffer.trace().indexOf('alpha123')).assertEqual(-1);
      expect(buffer.contains('gamma789')).assertFalse();
      expect(buffer.size()).assertEqual(3);
    });

    /**
     * @tc.name          payloadSecurityEqualsInPrefixIsPreserved
     * @tc.desc          An equals sign before the marker is ordinary text.
     * @tc.precondition  The redaction helper only looks for secret=.
     * @tc.steps         1. Redact a line with a leading assignment. 2. Check the
     *                   prefix. 3. Check the masked value.
     * @tc.expected      The prefix assignment survives and the secret is masked.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadSecurityEqualsInPrefixIsPreserved', 0, () => {
      logStep('payloadSecurity', 'equals in prefix');
      const line = 'a=b secret=xyz9';
      const masked = redactAssignment(line);
      expect(masked).assertEqual('a=b secret=****');
      expect(masked.startsWith('a=b ')).assertTrue();
      expect(masked.indexOf('xyz9')).assertEqual(-1);
      expect(masked.indexOf('secret=')).assertEqual(4);
      expect(line.indexOf('=')).assertEqual(1);
      expect(masked.split('=').length).assertEqual(3);
      expect(masked.length).assertEqual(line.length);
    });

    /**
     * @tc.name          payloadSecurityMaskHasOneStarRun
     * @tc.desc          The masked middle is exactly one run of four stars.
     * @tc.precondition  The mask helper is defined.
     * @tc.steps         1. Mask a long value. 2. Split on the star run. 3. Count the
     *                   parts.
     * @tc.expected      The masked value has one star run with two edges.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityMaskHasOneStarRun', 0, () => {
      logStep('payloadSecurity', 'one star run');
      const masked = maskSecret('abcdefghij');
      expect(masked).assertEqual('ab****ij');
      expect(masked.split('****').length).assertEqual(2);
      expect(masked.split('*').length).assertEqual(5);
      expect(countOf(masked.split(''), '*')).assertEqual(4);
      expect(masked.indexOf('****')).assertEqual(2);
      expect(masked.substring(6)).assertEqual('ij');
      expect(masked.substring(0, 2)).assertEqual('ab');
    });

    /**
     * @tc.name          payloadSecurityRedactBeforeStoreRecipe
     * @tc.desc          Redact then store leaves no raw secret in the buffer.
     * @tc.precondition  A buffer and the helper exist.
     * @tc.steps         1. Redact one assignment. 2. Store it. 3. Scan the trace.
     * @tc.expected      The trace keeps the key and drops the raw value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityRedactBeforeStoreRecipe', 0, () => {
      logStep('payloadSecurity', 'redact before store');
      const raw = 'connect secret=supersecret99 path=/rpc';
      const buffer = new LogBuffer(4);
      buffer.info(redactAssignment(raw));
      expect(buffer.contains('supersecret99')).assertFalse();
      expect(buffer.contains('secret=')).assertTrue();
      expect(buffer.contains('path=/rpc')).assertTrue();
      expect(buffer.lines[0]).assertEqual('INFO connect secret=su****99 path=/rpc');
      expect(buffer.trace().indexOf('supersecret99')).assertEqual(-1);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(buffer.size()).assertEqual(1);
    });

    /**
     * @tc.name          payloadSecurityRequestPayloadMasked
     * @tc.desc          The sample request payload can be masked as a secret value.
     * @tc.precondition  REQUEST_PAYLOAD and the helper are defined.
     * @tc.steps         1. Build an assignment with the payload. 2. Redact it. 3. Scan
     *                   for the plaintext.
     * @tc.expected      The payload is masked and only its edges survive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityRequestPayloadMasked', 0, () => {
      logStep('payloadSecurity', 'request payload masked');
      const line = 'secret=' + REQUEST_PAYLOAD;
      const masked = redactAssignment(line);
      expect(REQUEST_PAYLOAD).assertEqual('hello world');
      expect(masked).assertEqual('secret=he****lo world');
      expect(masked.indexOf('hello')).assertEqual(-1);
      expect(masked.endsWith(' world')).assertTrue();
      expect(masked.startsWith('secret=he')).assertTrue();
      expect(masked.length).assertEqual(line.length + 3);
      expect(leaksPlaintext(masked, 'hello')).assertFalse();
    });

    /**
     * @tc.name          payloadSecurityReplyWordIsMaskedBeforeSpace
     * @tc.desc          Only the first word after the marker is the secret value.
     * @tc.precondition  The helper stops at the next space.
     * @tc.steps         1. Redact a two word secret. 2. Check the first word. 3. Check
     *                   the preserved second word.
     * @tc.expected      The first word is masked and the second remains.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadSecurityReplyWordIsMaskedBeforeSpace', 0, () => {
      logStep('payloadSecurity', 'reply word split');
      const line = 'secret=hello rpc';
      const masked = redactAssignment(line);
      expect(masked).assertEqual('secret=he****lo rpc');
      expect(masked.endsWith(' rpc')).assertTrue();
      expect(masked.indexOf('hello')).assertEqual(-1);
      expect(masked.indexOf('rpc')).assertEqual(16);
      expect(masked.split(' ').length).assertEqual(2);
      expect(masked.length).assertEqual(line.length + 3);
      expect(masked.startsWith('secret=')).assertTrue();
    });

    /**
     * @tc.name          payloadSecurityToastsNeverCarrySecretMarker
     * @tc.desc          Toast constants contain no secret assignment marker.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send once. 2. Scan every toast for the marker. 3. Compare
     *                   the count.
     * @tc.expected      No toast contains secret= and three toasts exist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityToastsNeverCarrySecretMarker', 0, () => {
      logStep('payloadSecurity', 'toasts no marker');
      const client = createConnectedSession();
      client.sendString('hello world');
      let markers = 0;
      for (let index = 0; index < client.toasts.length; index++) {
        if (client.toasts[index].indexOf('secret=') >= 0) {
          markers = markers + 1;
        }
      }
      expect(client.toasts.length).assertEqual(2);
      expect(markers).assertEqual(0);
      expect(client.toasts[0].indexOf('=')).assertEqual(-1);
      expect(client.toasts[1].indexOf('=')).assertEqual(-1);
      expect(client.toasts[1]).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.logs.contains('secret=')).assertFalse();
      expect(countOf(client.toasts, SEND_SUCCESS_TOAST)).assertEqual(1);
    });

    /**
     * @tc.name          payloadSecuritySuccessLogFingerprintIsGolden
     * @tc.desc          The connected session log trace has a fixed fingerprint.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send one payload. 2. Read the trace. 3. Compare the golden
     *                   text and fingerprint.
     * @tc.expected      The trace is two connect lines plus one reply line.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadSecuritySuccessLogFingerprintIsGolden', 0, () => {
      logStep('payloadSecurity', 'log fingerprint golden');
      const client = createConnectedSession();
      client.sendString(REQUEST_PAYLOAD);
      const golden = 'INFO registerDeathRecipient success|INFO onConnect|INFO reply hello rpc';
      expect(client.logs.trace()).assertEqual(golden);
      expect(textFingerprint(client.logs.trace())).assertEqual(textFingerprint(golden));
      expect(client.logs.trace().split('|').length).assertEqual(3);
      expect(client.logs.trace().startsWith('INFO ')).assertTrue();
      expect(client.logs.trace().endsWith('hello rpc')).assertTrue();
      expect(client.logs.contains(REQUEST_PAYLOAD)).assertFalse();
      expect(client.logs.size()).assertEqual(3);
    });

    /**
     * @tc.name          payloadSecurityVeryShortSecretsAreFullyHidden
     * @tc.desc          Secrets up to four chars reveal nothing.
     * @tc.precondition  The mask helper is defined.
     * @tc.steps         1. Mask one to four char values. 2. Compare each to stars. 3.
     *                   Scan for the original characters.
     * @tc.expected      Each short secret becomes exactly four stars.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityVeryShortSecretsAreFullyHidden', 0, () => {
      logStep('payloadSecurity', 'very short secrets');
      const values: string[] = ['a', 'ab', 'abc', 'abcd'];
      for (let index = 0; index < values.length; index++) {
        expect(maskSecret(values[index])).assertEqual('****');
        expect(maskSecret(values[index]).indexOf(values[index])).assertEqual(-1);
      }
      expect(uniqueStrings(['a', 'ab', 'abc', 'abcd']).length).assertEqual(4);
      expect(maskSecret('abcd').length).assertEqual(4);
      expect(maskSecret('abcde')).assertEqual('ab****de');
      expect(countOf(maskSecret('abcd').split(''), '*')).assertEqual(4);
      expect(leaksPlaintext(maskSecret('abcd'), 'abcd')).assertFalse();
    });

    /**
     * @tc.name          payloadSecurityEmptyLineRedactionIsIdentical
     * @tc.desc          Redacting the empty line returns the empty line.
     * @tc.precondition  The helper is defined.
     * @tc.steps         1. Redact the empty string. 2. Redact a bare marker. 3. Compare
     *                   both outputs.
     * @tc.expected      Both degenerate inputs are unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityEmptyLineRedactionIsIdentical', 0, () => {
      logStep('payloadSecurity', 'empty line redaction');
      expect(redactAssignment('')).assertEqual('');
      expect(redactAssignment('secret=')).assertEqual('secret=');
      expect(redactAssignment('').length).assertEqual(0);
      expect(redactAssignment('secret=').indexOf('****')).assertEqual(-1);
      expect(redactedFingerprint([''])).assertEqual(textFingerprint(''));
      expect(maskSecret('').length).assertEqual(0);
      expect(redactAssignment(' ')).assertEqual(' ');
    });

    /**
     * @tc.name          payloadSecurityMarkerIsCaseSensitive
     * @tc.desc          Upper case SECRET= is not treated as the marker.
     * @tc.precondition  The helper searches for the lower case marker.
     * @tc.steps         1. Redact an upper case marker. 2. Redact a mixed case marker.
     *                   3. Compare both to their inputs.
     * @tc.expected      Only the exact lower case marker triggers masking.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityMarkerIsCaseSensitive', 0, () => {
      logStep('payloadSecurity', 'marker case');
      const upper = 'SECRET=abcdef';
      const mixed = 'Secret=abcdef';
      expect(redactAssignment(upper)).assertEqual(upper);
      expect(redactAssignment(mixed)).assertEqual(mixed);
      expect(redactAssignment(upper).indexOf('****')).assertEqual(-1);
      expect(redactAssignment('secret=abcdef')).assertEqual('secret=ab****ef');
      expect(redactAssignment('secret=abcdef').indexOf('****')).assertEqual(9);
      expect(upper.length).assertEqual(13);
      expect(mixed.length).assertEqual(13);
    });

    /**
     * @tc.name          payloadSecurityTabInsideValueIsMasked
     * @tc.desc          A tab does not terminate the value slice.
     * @tc.precondition  The helper only stops at a space.
     * @tc.steps         1. Redact a tabbed assignment. 2. Check the mask span. 3. Scan for
     *                   the plaintext.
     * @tc.expected      The whole tabbed value is masked as one secret.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadSecurityTabInsideValueIsMasked', 0, () => {
      logStep('payloadSecurity', 'tab inside value');
      const line = 'secret=abc\tdef';
      const masked = redactAssignment(line);
      expect(masked).assertEqual('secret=ab****ef');
      expect(masked.indexOf('abc')).assertEqual(-1);
      expect(masked.indexOf('def')).assertEqual(-1);
      expect(masked.indexOf('\t')).assertEqual(-1);
      expect(masked.length).assertEqual(15);
      expect(line.length).assertEqual(14);
      expect(masked.startsWith('secret=')).assertTrue();
    });

    /**
     * @tc.name          payloadSecurityPrefixedMarkerIsRedacted
     * @tc.desc          A word immediately before the marker is preserved.
     * @tc.precondition  The helper searches for the marker at any offset.
     * @tc.steps         1. Redact xsecret=. 2. Check the prefix. 3. Check the masked value.
     * @tc.expected      The prefix x survives and the value is masked.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadSecurityPrefixedMarkerIsRedacted', 0, () => {
      logStep('payloadSecurity', 'prefixed marker');
      const masked = redactAssignment('xsecret=abcdef');
      expect(masked).assertEqual('xsecret=ab****ef');
      expect(masked.startsWith('x')).assertTrue();
      expect(masked.indexOf('secret=')).assertEqual(1);
      expect(masked.indexOf('cde')).assertEqual(-1);
      expect(masked.length).assertEqual(16);
      expect(masked.substring(0, 1)).assertEqual('x');
      expect(masked.endsWith('ef')).assertTrue();
    });

    /**
     * @tc.name          payloadSecurityRepeatedLinesRedactEqually
     * @tc.desc          Redacting the same line twice gives the same output.
     * @tc.precondition  The helper is pure.
     * @tc.steps         1. Redact a line twice. 2. Compare outputs. 3. Count the results in
     *                   a repeated list.
     * @tc.expected      Both outputs are identical and count to two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityRepeatedLinesRedactEqually', 0, () => {
      logStep('payloadSecurity', 'repeated lines');
      const line = 'secret=repeat99';
      const first = redactAssignment(line);
      const second = redactAssignment(line);
      const outputs: string[] = [first, second];
      expect(first).assertEqual(second);
      expect(first).assertEqual('secret=re****99');
      expect(countOf(outputs, first)).assertEqual(2);
      expect(uniqueStrings(outputs).length).assertEqual(1);
      expect(textFingerprint(first)).assertEqual(textFingerprint(second));
      expect(first === line).assertFalse();
      expect(outputs.join('|').split('|').length).assertEqual(2);
    });

    /**
     * @tc.name          payloadSecurityShortMaskCollidesByDesign
     * @tc.desc          Two short secrets mask to the same star string.
     * @tc.precondition  Secrets of length four are fully masked.
     * @tc.steps         1. Mask two different four char values. 2. Compare the masks. 3.
     *                   Compare their fingerprints.
     * @tc.expected      The masks collide because both become four stars.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadSecurityShortMaskCollidesByDesign', 0, () => {
      logStep('payloadSecurity', 'short mask collision');
      const first = maskSecret('abcd');
      const second = maskSecret('wxyz');
      expect(first).assertEqual('****');
      expect(second).assertEqual('****');
      expect(first).assertEqual(second);
      expect(textFingerprint(first)).assertEqual(textFingerprint(second));
      expect(first.indexOf('abcd')).assertEqual(-1);
      expect(second.indexOf('wxyz')).assertEqual(-1);
      expect(maskSecret('abcde') === maskSecret('vwxyz')).assertFalse();
      expect(uniqueStrings([first, second]).length).assertEqual(1);
    });

    /**
     * @tc.name          payloadSecurityDisconnectLogKeepsNoPayload
     * @tc.desc          A post-send disconnect adds no payload to the logs.
     * @tc.precondition  A connected session has sent one payload.
     * @tc.steps         1. Send. 2. Disconnect. 3. Scan the logs for the request text.
     * @tc.expected      The request payload never reaches the log buffer.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityDisconnectLogKeepsNoPayload', 0, () => {
      logStep('payloadSecurity', 'disconnect log');
      const client = createConnectedSession();
      client.sendString('private-request');
      client.onDisconnect();
      expect(client.logs.contains('private-request')).assertFalse();
      expect(client.logs.contains('onDisconnect')).assertTrue();
      expect(client.logs.size()).assertEqual(4);
      expect(client.logs.countLevel(LEVEL_INFO)).assertEqual(4);
      expect(client.logs.trace().endsWith('INFO onDisconnect')).assertTrue();
      expect(client.toasts.length).assertEqual(3);
      expect(client.logs.contains(REPLY_PAYLOAD)).assertTrue();
    });

    /**
     * @tc.name          payloadSecurityMarkerKeyIsPreserved
     * @tc.desc          Redaction keeps the secret marker key visible.
     * @tc.precondition  The helper replaces only the value slice.
     * @tc.steps         1. Redact an assignment. 2. Check the key. 3. Count the key
     *                   occurrences.
     * @tc.expected      The key survives exactly once.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityMarkerKeyIsPreserved', 0, () => {
      logStep('payloadSecurity', 'marker key preserved');
      const masked = redactAssignment('secret=value123');
      expect(masked.startsWith('secret=')).assertTrue();
      expect(countOf(masked.split('='), 'secret')).assertEqual(1);
      expect(masked.indexOf('secret')).assertEqual(0);
      expect(masked.endsWith('23')).assertTrue();
      expect(masked.length).assertEqual(15);
      expect(masked.indexOf('value123')).assertEqual(-1);
      expect(masked.split('=').length).assertEqual(2);
      expect(masked.charAt(6)).assertEqual('=');
    });

    /**
     * @tc.name          payloadSecuritySpaceOnlyLineIsUntouched
     * @tc.desc          A whitespace line has no marker and is returned unchanged.
     * @tc.precondition  The helper is defined.
     * @tc.steps         1. Redact one space. 2. Redact four spaces. 3. Compare lengths.
     * @tc.expected      Both whitespace lines are unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecuritySpaceOnlyLineIsUntouched', 0, () => {
      logStep('payloadSecurity', 'space only line');
      const one = ' ';
      const four = '    ';
      expect(redactAssignment(one)).assertEqual(one);
      expect(redactAssignment(four)).assertEqual(four);
      expect(redactAssignment(one).length).assertEqual(1);
      expect(redactAssignment(four).length).assertEqual(4);
      expect(redactAssignment(four).indexOf('****')).assertEqual(-1);
      expect(textFingerprint(redactAssignment(one))).assertEqual(textFingerprint(one));
      expect(redactAssignment(four).split(' ').length).assertEqual(5);
    });

    /**
     * @tc.name          payloadSecuritySixCharSecretMask
     * @tc.desc          A six char secret keeps two chars on each edge.
     * @tc.precondition  The mask helper is defined.
     * @tc.steps         1. Mask abcdef. 2. Compare the edges. 3. Compare the length.
     * @tc.expected      The mask is ab****ef with length eight.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecuritySixCharSecretMask', 0, () => {
      logStep('payloadSecurity', 'six char secret');
      const masked = maskSecret('abcdef');
      expect(masked).assertEqual('ab****ef');
      expect(masked.startsWith('ab')).assertTrue();
      expect(masked.endsWith('ef')).assertTrue();
      expect(masked.length).assertEqual(8);
      expect(masked.indexOf('cd')).assertEqual(-1);
      expect(masked === 'abcdef').assertFalse();
      expect(masked.substring(2, 6)).assertEqual('****');
      expect(textFingerprint(masked) === textFingerprint('abcdef')).assertFalse();
    });

    /**
     * @tc.name          payloadSecurityMaskGrowthRule
     * @tc.desc          Masks add three chars for values longer than four.
     * @tc.precondition  The mask helper is defined.
     * @tc.steps         1. Mask lengths five and nine. 2. Compare growth. 3. Mask a four
     *                   char value.
     * @tc.expected      Long values grow by three and short ones stay four chars.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadSecurityMaskGrowthRule', 0, () => {
      logStep('payloadSecurity', 'mask growth');
      const five = maskSecret('abcde');
      const nine = maskSecret('abcdefghi');
      const four = maskSecret('abcd');
      expect(five.length - 5).assertEqual(3);
      expect(nine.length - 9).assertEqual(-1);
      expect(four.length).assertEqual(4);
      expect(five.length).assertEqual(8);
      expect(nine.length).assertEqual(8);
      expect(five).assertEqual('ab****de');
      expect(nine).assertEqual('ab****hi');
      expect(uniqueStrings([five, nine, four]).length).assertEqual(3);
    });

    /**
     * @tc.name          payloadSecurityErrorLineRedaction
     * @tc.desc          An error line with a secret is redacted before storage.
     * @tc.precondition  A buffer and the helper exist.
     * @tc.steps         1. Redact an error line. 2. Store it as an error. 3. Check the level
     *                   and content.
     * @tc.expected      The line keeps its error level and loses the raw value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityErrorLineRedaction', 0, () => {
      logStep('payloadSecurity', 'error line redaction');
      const buffer = new LogBuffer(4);
      const line = redactAssignment('send failed secret=abcdef12 code=16000003');
      buffer.error(line);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.contains('abcdef12')).assertFalse();
      expect(buffer.contains('16000003')).assertTrue();
      expect(buffer.contains('secret=ab****12')).assertTrue();
      expect(buffer.lines[0].startsWith('ERROR ')).assertTrue();
      expect(buffer.trace().indexOf('****')).assertEqual(27);
      expect(buffer.size()).assertEqual(1);
    });

    /**
     * @tc.name          payloadSecurityFiveCharEdgesArePinned
     * @tc.desc          A five char secret keeps exactly two chars per edge.
     * @tc.precondition  The mask helper is defined.
     * @tc.steps         1. Mask abcde. 2. Compare the edges. 3. Compare the star position.
     * @tc.expected      The mask is ab****de with stars at index two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityFiveCharEdgesArePinned', 0, () => {
      logStep('payloadSecurity', 'five char edges');
      const masked = maskSecret('abcde');
      expect(masked).assertEqual('ab****de');
      expect(masked.indexOf('****')).assertEqual(2);
      expect(masked.substring(0, 2)).assertEqual('ab');
      expect(masked.substring(6)).assertEqual('de');
      expect(masked.length).assertEqual(8);
      expect(masked.indexOf('c')).assertEqual(-1);
      expect(masked.split('*').length).assertEqual(5);
      expect(masked.charAt(2)).assertEqual('*');
    });

    /**
     * @tc.name          payloadSecurityTwoLineBufferRedaction
     * @tc.desc          Two redacted lines keep their level prefixes in the buffer.
     * @tc.precondition  A buffer and the helper exist.
     * @tc.steps         1. Store two redacted lines. 2. Read the trace. 3. Count the levels.
     * @tc.expected      The trace keeps both levels and no raw value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityTwoLineBufferRedaction', 0, () => {
      logStep('payloadSecurity', 'two line buffer');
      const buffer = new LogBuffer(4);
      buffer.info(redactAssignment('secret=first123'));
      buffer.error(redactAssignment('secret=second45'));
      expect(buffer.size()).assertEqual(2);
      expect(buffer.trace()).assertEqual('INFO secret=fi****23|ERROR secret=se****45');
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.contains('first123')).assertFalse();
      expect(buffer.contains('second45')).assertFalse();
      expect(buffer.trace().split('|').length).assertEqual(2);
      expect(buffer.contains('****')).assertTrue();
    });

    /**
     * @tc.name          payloadSecurityBufferFingerprintChangesWhenRedacted
     * @tc.desc          Redacting a stored value changes the buffer fingerprint.
     * @tc.precondition  Two buffers are available.
     * @tc.steps         1. Store a raw line in one. 2. Store the redacted line in the other.
     *                   3. Compare fingerprints.
     * @tc.expected      The two fingerprints differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadSecurityBufferFingerprintChangesWhenRedacted', 0, () => {
      logStep('payloadSecurity', 'buffer fingerprint redacted');
      const rawBuffer = new LogBuffer(4);
      const safeBuffer = new LogBuffer(4);
      const raw = 'secret=abcdefgh';
      rawBuffer.info(raw);
      safeBuffer.info(redactAssignment(raw));
      expect(rawBuffer.trace()).assertEqual('INFO secret=abcdefgh');
      expect(safeBuffer.trace()).assertEqual('INFO secret=ab****gh');
      expect(textFingerprint(rawBuffer.trace()) === textFingerprint(safeBuffer.trace())).assertFalse();
      expect(rawBuffer.contains('abcdefgh')).assertTrue();
      expect(safeBuffer.contains('abcdefgh')).assertFalse();
      expect(textFingerprint(safeBuffer.trace())).assertEqual(textFingerprint('INFO secret=ab****gh'));
      expect(rawBuffer.size()).assertEqual(safeBuffer.size());
    });

    /**
     * @tc.name          payloadSecurityReplyTextIsNotSecret
     * @tc.desc          The stub reply contains no secret marker.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send one payload. 2. Read the reply. 3. Scan it for the marker.
     * @tc.expected      The reply is the plain stub text without a marker.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityReplyTextIsNotSecret', 0, () => {
      logStep('payloadSecurity', 'reply not secret');
      const client = createConnectedSession();
      const result = client.sendString(REQUEST_PAYLOAD);
      const reply = (client.proxy as RemoteProxyModel).stub.replyText;
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.cursor).assertEqual(0);
      expect(reply).assertEqual(REPLY_PAYLOAD);
      expect(reply.indexOf('secret=')).assertEqual(-1);
      expect(reply.indexOf('****')).assertEqual(-1);
      expect(redactAssignment(reply)).assertEqual(reply);
      expect(client.logs.contains('secret=')).assertFalse();
      expect(redactAssignment('reply ' + reply)).assertEqual('reply ' + reply);
      expect(reply.length).assertEqual(9);
      expect(leaksPlaintext(reply, REQUEST_PAYLOAD)).assertFalse();
    });

    /**
     * @tc.name          payloadSecurityFailureToastHasNoSecret
     * @tc.desc          A failure toast never carries a secret marker.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Send without a proxy. 2. Read the toast. 3. Scan it.
     * @tc.expected      The failure toast is the constant failure text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityFailureToastHasNoSecret', 0, () => {
      logStep('payloadSecurity', 'failure toast no secret');
      const client = new ConnectionModel();
      client.sendString('secret=shouldnotleak');
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.lastToast().indexOf('secret=')).assertEqual(-1);
      expect(client.lastToast().indexOf('shouldnotleak')).assertEqual(-1);
      expect(client.toasts.length).assertEqual(1);
      expect(redactAssignment(client.lastToast())).assertEqual(client.lastToast());
      expect(client.logs.contains('shouldnotleak')).assertFalse();
      expect(client.events.last()).assertEqual('send-no-proxy:secret=shouldnotleak');
      expect(uniqueStrings(client.toasts).length).assertEqual(1);
    });

    /**
     * @tc.name          payloadSecurityAllDigitSecretMasked
     * @tc.desc          A digit only secret keeps only its first and last two digits.
     * @tc.precondition  The mask helper is defined.
     * @tc.steps         1. Mask a ten digit value. 2. Check the digits. 3. Compare lengths.
     * @tc.expected      The mask is 12****90 with eight chars.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityAllDigitSecretMasked', 0, () => {
      logStep('payloadSecurity', 'digit only secret');
      const masked = maskSecret('1234567890');
      expect(masked).assertEqual('12****90');
      expect(masked.length).assertEqual(8);
      expect(masked.substring(0, 2)).assertEqual('12');
      expect(masked.substring(6)).assertEqual('90');
      expect(masked.indexOf('3456')).assertEqual(-1);
      expect(countOf(masked.split(''), '*')).assertEqual(4);
      expect(textFingerprint(masked)).assertEqual(textFingerprint('12****90'));
      expect(masked === '1234567890').assertFalse();
    });

    /**
     * @tc.name          payloadSecurityThreeCharSecretFullyMasked
     * @tc.desc          A three char value after the marker becomes four stars.
     * @tc.precondition  The helper is defined.
     * @tc.steps         1. Redact a three char secret. 2. Check the key. 3. Check the length
     *                   rule.
     * @tc.expected      The whole value is replaced by four stars.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityThreeCharSecretFullyMasked', 0, () => {
      logStep('payloadSecurity', 'three char secret');
      const masked = redactAssignment('secret=abc');
      expect(masked).assertEqual('secret=****');
      expect(masked.length).assertEqual(11);
      expect(masked.indexOf('abc')).assertEqual(-1);
      expect(masked.startsWith('secret=')).assertTrue();
      expect(countOf(masked.split(''), '*')).assertEqual(4);
      expect(maskSecret('abc')).assertEqual('****');
      expect(redactAssignment('secret=abc').length).assertEqual('secret=abc'.length + 1);
      expect(masked.endsWith('****')).assertTrue();
    });

    /**
     * @tc.name          payloadSecurityUnicodePrefixIsPreserved
     * @tc.desc          A non-ASCII prefix before the marker survives.
     * @tc.precondition  The helper scans by code unit index.
     * @tc.steps         1. Redact a line with a Chinese prefix. 2. Check the prefix. 3. Check
     *                   the mask.
     * @tc.expected      The prefix is intact and the value is masked.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadSecurityUnicodePrefixIsPreserved', 0, () => {
      logStep('payloadSecurity', 'unicode prefix');
      const masked = redactAssignment('前缀 secret=abcdef');
      expect(masked.startsWith('前缀 ')).assertTrue();
      expect(masked.endsWith('ef')).assertTrue();
      expect(masked.indexOf('secret=')).assertEqual(3);
      expect(masked.indexOf('cde')).assertEqual(-1);
      expect(masked).assertEqual('前缀 secret=ab****ef');
      expect(masked.length).assertEqual('前缀 secret=abcdef'.length + 2);
      expect(textFingerprint(masked) === textFingerprint('前缀 secret=abcdef')).assertFalse();
      expect(masked.split(' ').length).assertEqual(2);
    });

    /**
     * @tc.name          payloadSecurityRedactedTraceEndToEnd
     * @tc.desc          Redacting before storage yields a stable safe fingerprint.
     * @tc.precondition  The helper and a buffer exist.
     * @tc.steps         1. Redact three lines. 2. Store them at mixed levels. 3. Compare the
     *                   fingerprint to a rebuilt buffer.
     * @tc.expected      Both buffers produce the same safe fingerprint.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadSecurityRedactedTraceEndToEnd', 0, () => {
      logStep('payloadSecurity', 'trace end to end');
      const lines: string[] = ['secret=alpha11', 'plain middle', 'secret=omega22'];
      const first = new LogBuffer(4);
      first.info(redactAssignment(lines[0]));
      first.warn(lines[1]);
      first.error(redactAssignment(lines[2]));
      const second = new LogBuffer(4);
      second.info(redactAssignment(lines[0]));
      second.warn(lines[1]);
      second.error(redactAssignment(lines[2]));
      expect(first.trace()).assertEqual(second.trace());
      expect(textFingerprint(first.trace())).assertEqual(textFingerprint(second.trace()));
      expect(first.contains('alpha11')).assertFalse();
      expect(first.contains('omega22')).assertFalse();
      expect(first.trace().indexOf('****')).assertEqual(14);
      expect(first.size()).assertEqual(3);
      expect(first.countLevel(LEVEL_WARN)).assertEqual(1);
    });

    /**
     * @tc.name          payloadSecurityTraceMaskCount
     * @tc.desc          Two redacted values produce exactly two star runs.
     * @tc.precondition  A buffer holds two redacted lines.
     * @tc.steps         1. Store two redacted lines. 2. Split the trace on stars. 3. Count the
     *                   star characters.
     * @tc.expected      The trace has eight stars across two runs.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadSecurityTraceMaskCount', 0, () => {
      logStep('payloadSecurity', 'trace mask count');
      const buffer = new LogBuffer(4);
      buffer.info(redactAssignment('secret=aaaa11'));
      buffer.error(redactAssignment('secret=bbbb22'));
      expect(buffer.trace()).assertEqual('INFO secret=aa****11|ERROR secret=bb****22');
      expect(countOf(buffer.trace().split(''), '*')).assertEqual(8);
      expect(buffer.trace().split('****').length).assertEqual(3);
      expect(countOf(buffer.trace().split('|'), 'INFO secret=aa****11')).assertEqual(1);
      expect(buffer.trace().split('|').length).assertEqual(2);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.size()).assertEqual(2);
      expect(buffer.contains('aaaa11')).assertFalse();
    });

    /**
     * @tc.name          payloadSecuritySecondMarkerIsVisible
     * @tc.desc          A second marker on the same line is not redacted.
     * @tc.precondition  The helper redacts only the first assignment.
     * @tc.steps         1. Redact a line with two markers. 2. Count the markers. 3. Count the
     *                   star runs.
     * @tc.expected      Both keys remain but only the first value is masked.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadSecuritySecondMarkerIsVisible', 0, () => {
      logStep('payloadSecurity', 'second marker visible');
      const masked = redactAssignment('secret=aaaa11 secret=bbbb22');
      expect(countOf(masked.split(' '), 'secret=aa****11')).assertEqual(1);
      expect(masked.endsWith('secret=bbbb22')).assertTrue();
      expect(masked.indexOf('aaaa11')).assertEqual(-1);
      expect(masked.indexOf('bbbb22')).assertEqual(23);
      expect(masked.split('secret=').length).assertEqual(3);
      expect(countOf(masked.split(''), '*')).assertEqual(4);
      expect(masked.length).assertEqual(29);
      expect(masked.startsWith('secret=aa****11 ')).assertTrue();
    });

    /**
     * @tc.name          payloadSecurityRedactedEmptyBuffer
     * @tc.desc          Redacting an empty buffer keeps its empty fingerprint.
     * @tc.precondition  An empty buffer exists.
     * @tc.steps         1. Read the trace. 2. Fingerprint it. 3. Compare to the empty value.
     * @tc.expected      The empty buffer fingerprint is 216613 with no stars.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadSecurityRedactedEmptyBuffer', 0, () => {
      logStep('payloadSecurity', 'redacted empty buffer');
      const buffer = new LogBuffer(4);
      expect(buffer.trace()).assertEqual('');
      expect(buffer.contains('****')).assertFalse();
      expect(buffer.size()).assertEqual(0);
      expect(textFingerprint(buffer.trace())).assertEqual(216613);
      expect(redactedFingerprint([])).assertEqual(textFingerprint(buffer.trace()));
      buffer.info(redactAssignment('secret=ffff66'));
      expect(buffer.size()).assertEqual(1);
      expect(buffer.contains('ffff66')).assertFalse();
      expect(buffer.trace()).assertEqual('INFO secret=ff****66');
    });

  });
}
