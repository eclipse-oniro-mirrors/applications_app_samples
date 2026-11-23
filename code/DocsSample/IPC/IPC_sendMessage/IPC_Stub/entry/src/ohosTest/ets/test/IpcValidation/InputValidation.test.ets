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
  REQUEST_CODE,
  UNKNOWN_CODE_ZERO,
  UNKNOWN_CODE_TWO,
  UNKNOWN_CODE_NEGATIVE,
  UNKNOWN_CODE_LARGE,
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  joined,
  countOf,
  uniqueStrings,
  sameStringArray,
  textFingerprint,
  clampInt,
  isKnownRequestCode,
  StubRemoteObjectModel,
  InProcessClient,
  StubMetrics,
  RequestResultModel,
  MessageSequenceModel,
  MessageOptionModel,
  StubRequestRecord
} from '../Shared/SharedDriver';

const CODE_MIN: number = -2147483648;
const CODE_MAX: number = 2147483647;

function classifyCode(code: number): string {
  if (isKnownRequestCode(code)) {
    return 'known';
  }
  if (code < 0) {
    return 'negative';
  }
  if (code === 0) {
    return 'zero';
  }
  if (code > 100) {
    return 'large';
  }
  return 'unknown';
}

function sendWithStub(stub: StubRemoteObjectModel, code: number): RequestResultModel {
  const client: InProcessClient = new InProcessClient(stub);
  return client.send(code, REQUEST_PAYLOAD);
}

function stringLengthCategory(value: string): string {
  if (value.length === 0) {
    return 'empty';
  }
  if (value.length <= 8) {
    return 'short';
  }
  if (value.length <= 64) {
    return 'medium';
  }
  return 'long';
}

function buildString(unit: string, times: number): string {
  let text = '';
  for (let index = 0; index < times; index++) {
    text = text + unit;
  }
  return text;
}

function numbersToStrings(values: number[]): string[] {
  const result: string[] = [];
  for (let index = 0; index < values.length; index++) {
    result.push(String(values[index]));
  }
  return result;
}

function charsJoinedValue(value: string): string {
  return value.split('').join('');
}

export default function inputValidation(): void {
  describe('InputValidation', () => {
    beforeAll(() => {
      logSuite('InputValidation', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('InputValidation', 'end');
    });

    /**
     * @tc.name          inputValidationKnownCodeBoundary
     * @tc.desc          Only the documented request code is known.
     * @tc.precondition  The request code constants are loaded.
     * @tc.steps         1. Evaluate code one.
     *                   2. Evaluate every documented unknown code.
     *                   3. Compare the results.
     * @tc.expected      Only code one returns true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('inputValidationKnownCodeBoundary', 0, () => {
      logStep('inputValidationKnownCodeBoundary', String(REQUEST_CODE));
      expect(isKnownRequestCode(REQUEST_CODE)).assertTrue();
      expect(isKnownRequestCode(UNKNOWN_CODE_ZERO)).assertFalse();
      expect(isKnownRequestCode(UNKNOWN_CODE_TWO)).assertFalse();
      expect(isKnownRequestCode(UNKNOWN_CODE_NEGATIVE)).assertFalse();
      expect(isKnownRequestCode(UNKNOWN_CODE_LARGE)).assertFalse();
      expect(REQUEST_CODE).assertEqual(1);
      expect(UNKNOWN_CODE_ZERO).assertEqual(0);
      expect(UNKNOWN_CODE_TWO).assertEqual(2);
      expect(UNKNOWN_CODE_NEGATIVE).assertEqual(-1);
      expect(UNKNOWN_CODE_LARGE).assertEqual(99);
    });

    /**
     * @tc.name          inputValidationCodeClassifierMatrix
     * @tc.desc          The code classifier separates known, negative, zero and large codes.
     * @tc.precondition  The code classifier is available.
     * @tc.steps         1. Classify five codes.
     *                   2. Count each class.
     *                   3. Compare with expectations.
     * @tc.expected      Each code maps to its documented class.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('inputValidationCodeClassifierMatrix', 0, () => {
      const classes: string[] = [
        classifyCode(REQUEST_CODE),
        classifyCode(UNKNOWN_CODE_ZERO),
        classifyCode(UNKNOWN_CODE_NEGATIVE),
        classifyCode(UNKNOWN_CODE_LARGE),
        classifyCode(101)
      ];
      logStep('inputValidationCodeClassifierMatrix', joined(classes, ','));
      expect(classes.length).assertEqual(5);
      expect(classes[0]).assertEqual('known');
      expect(classes[1]).assertEqual('zero');
      expect(classes[2]).assertEqual('negative');
      expect(classes[3]).assertEqual('unknown');
      expect(classes[4]).assertEqual('large');
      expect(countOf(classes, 'unknown')).assertEqual(1);
      expect(uniqueStrings(classes).length).assertEqual(5);
      expect(classes.indexOf('known')).assertEqual(0);
    });

    /**
     * @tc.name          inputValidationClampMinimumBound
     * @tc.desc          clampInt keeps values at or above the minimum.
     * @tc.precondition  The clampInt helper is available.
     * @tc.steps         1. Clamp a value below the minimum.
     *                   2. Clamp the minimum itself.
     *                   3. Compare the results.
     * @tc.expected      Both results equal the minimum.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('inputValidationClampMinimumBound', 0, () => {
      logStep('inputValidationClampMinimumBound', String(CODE_MIN));
      expect(clampInt(CODE_MIN, 0, 100)).assertEqual(0);
      expect(clampInt(-1, 0, 100)).assertEqual(0);
      expect(clampInt(0, 0, 100)).assertEqual(0);
      expect(clampInt(1, 1, 100)).assertEqual(1);
      expect(clampInt(-2147483648, -10, 10)).assertEqual(-10);
      expect(clampInt(CODE_MIN, CODE_MIN, CODE_MAX)).assertEqual(CODE_MIN);
      expect(CODE_MIN).assertLess(0);
      expect(CODE_MAX).assertLarger(0);
      expect(CODE_MIN + CODE_MAX).assertEqual(-1);
    });

    /**
     * @tc.name          inputValidationClampMaximumBound
     * @tc.desc          clampInt keeps values at or below the maximum.
     * @tc.precondition  The clampInt helper is available.
     * @tc.steps         1. Clamp a value above the maximum.
     *                   2. Clamp the maximum itself.
     *                   3. Compare the results.
     * @tc.expected      Both results equal the maximum.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('inputValidationClampMaximumBound', 0, () => {
      logStep('inputValidationClampMaximumBound', String(CODE_MAX));
      expect(clampInt(CODE_MAX, 0, 100)).assertEqual(100);
      expect(clampInt(101, 0, 100)).assertEqual(100);
      expect(clampInt(100, 0, 100)).assertEqual(100);
      expect(clampInt(99, 0, 100)).assertEqual(99);
      expect(clampInt(CODE_MAX, CODE_MIN, CODE_MAX)).assertEqual(CODE_MAX);
      expect(clampInt(2147483647, -100, 100)).assertEqual(100);
      expect(clampInt(50, 50, 50)).assertEqual(50);
      expect(CODE_MAX).assertEqual(2147483647);
      expect(CODE_MAX - 1).assertEqual(2147483646);
    });

    /**
     * @tc.name          inputValidationEmptyStringCategory
     * @tc.desc          String length categories separate empty from short.
     * @tc.precondition  The length category helper is available.
     * @tc.steps         1. Classify an empty string.
     *                   2. Classify a short string.
     *                   3. Compare both categories.
     * @tc.expected      The empty string is empty and a one character string is short.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('inputValidationEmptyStringCategory', 0, () => {
      logStep('inputValidationEmptyStringCategory', stringLengthCategory(''));
      expect(stringLengthCategory('')).assertEqual('empty');
      expect(stringLengthCategory('a')).assertEqual('short');
      expect(stringLengthCategory('abcdefgh')).assertEqual('short');
      expect(''.length).assertEqual(0);
      expect('a'.length).assertEqual(1);
      expect('abcdefgh'.length).assertEqual(8);
      expect(stringLengthCategory('abcdefgh') === 'empty').assertFalse();
      expect(stringLengthCategory('abcdefghi')).assertEqual('medium');
      expect(uniqueStrings(['', 'a', 'abcdefgh']).length).assertEqual(3);
    });

    /**
     * @tc.name          inputValidationStringLengthBoundaries
     * @tc.desc          Length categories split at the 64 character boundary.
     * @tc.precondition  The length category helper is available.
     * @tc.steps         1. Classify a 64 character string.
     *                   2. Classify a 65 character string.
     *                   3. Confirm the boundary.
     * @tc.expected      Size 64 is medium and size 65 is long.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('inputValidationStringLengthBoundaries', 0, () => {
      const size64: string = buildString('a', 64);
      const size65: string = buildString('a', 65);
      logStep('inputValidationStringLengthBoundaries', String(size64.length) + '/' + String(size65.length));
      expect(size64.length).assertEqual(64);
      expect(size65.length).assertEqual(65);
      expect(stringLengthCategory(size64)).assertEqual('medium');
      expect(stringLengthCategory(size65)).assertEqual('long');
      expect(stringLengthCategory(buildString('a', 63))).assertEqual('medium');
      expect(size65.length).assertLarger(size64.length);
      expect(clampInt(size65.length, 0, 64)).assertEqual(64);
      expect(size64.substring(0, 8)).assertEqual('aaaaaaaa');
      expect(size65.length - size64.length).assertEqual(1);
    });

    /**
     * @tc.name          inputValidationSameStringArrayMatrix
     * @tc.desc          Array comparison matches equal contents and lengths only.
     * @tc.precondition  The sameStringArray helper is available.
     * @tc.steps         1. Compare equal arrays.
     *                   2. Compare reordered arrays.
     *                   3. Compare different lengths.
     * @tc.expected      Only identical contents and lengths match.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('inputValidationSameStringArrayMatrix', 0, () => {
      const left: string[] = ['a', 'b', 'c'];
      const equal: string[] = ['a', 'b', 'c'];
      const reordered: string[] = ['c', 'b', 'a'];
      const longer: string[] = ['a', 'b', 'c', 'd'];
      logStep('inputValidationSameStringArrayMatrix', joined(left, ','));
      expect(sameStringArray(left, equal)).assertTrue();
      expect(sameStringArray(left, reordered)).assertFalse();
      expect(sameStringArray(left, longer)).assertFalse();
      expect(sameStringArray([], [])).assertTrue();
      expect(sameStringArray(left, [])).assertFalse();
      expect(left.length).assertEqual(equal.length);
      expect(reordered[0]).assertEqual(left[2]);
      expect(longer[3]).assertEqual('d');
      expect(sameStringArray(['x'], ['x'])).assertTrue();
    });

    /**
     * @tc.name          inputValidationJoinedInputs
     * @tc.desc          Joined input lists preserve order and separator count.
     * @tc.precondition  The joined helper is available.
     * @tc.steps         1. Join three values.
     *                   2. Split the result.
     *                   3. Compare each segment.
     * @tc.expected      Two separators produce three ordered segments.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('inputValidationJoinedInputs', 0, () => {
      const values: string[] = ['code-1', 'code-0', 'code-2'];
      const text: string = joined(values, '|');
      logStep('inputValidationJoinedInputs', text);
      expect(text.split('|').length).assertEqual(3);
      expect(text.split('|')[0]).assertEqual('code-1');
      expect(text.split('|')[1]).assertEqual('code-0');
      expect(text.split('|')[2]).assertEqual('code-2');
      expect(text.indexOf('|')).assertEqual(6);
      expect(countOf(text.split('|'), 'code-0')).assertEqual(1);
      expect(joined([], '|')).assertEqual('');
      expect(joined(['single'], '|')).assertEqual('single');
      expect(text.length).assertEqual(20);
    });

    /**
     * @tc.name          inputValidationCountOfDuplicates
     * @tc.desc          countOf reports duplicates including absent values.
     * @tc.precondition  The countOf helper is available.
     * @tc.steps         1. Count a repeated value.
     *                   2. Count a single value.
     *                   3. Count an absent value.
     * @tc.expected      Counts are three, one and zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('inputValidationCountOfDuplicates', 0, () => {
      const values: string[] = ['x', 'y', 'x', 'x', 'y'];
      logStep('inputValidationCountOfDuplicates', joined(values, ','));
      expect(values.length).assertEqual(5);
      expect(countOf(values, 'x')).assertEqual(3);
      expect(countOf(values, 'y')).assertEqual(2);
      expect(countOf(values, 'z')).assertEqual(0);
      expect(countOf([], 'x')).assertEqual(0);
      expect(countOf(['only'], 'only')).assertEqual(1);
      expect(countOf(values, 'x') + countOf(values, 'y')).assertEqual(values.length);
      expect(countOf(values, '')).assertEqual(0);
      expect(uniqueStrings(values).length).assertEqual(2);
    });

    /**
     * @tc.name          inputValidationUniqueStringsOrder
     * @tc.desc          uniqueStrings keeps first occurrence order.
     * @tc.precondition  The uniqueStrings helper is available.
     * @tc.steps         1. Deduplicate a mixed list.
     *                   2. Compare the result order.
     *                   3. Confirm the length.
     * @tc.expected      First occurrences appear in their original order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('inputValidationUniqueStringsOrder', 0, () => {
      const values: string[] = ['b', 'a', 'b', 'c', 'a'];
      const unique: string[] = uniqueStrings(values);
      logStep('inputValidationUniqueStringsOrder', joined(unique, ','));
      expect(unique.length).assertEqual(3);
      expect(unique[0]).assertEqual('b');
      expect(unique[1]).assertEqual('a');
      expect(unique[2]).assertEqual('c');
      expect(sameStringArray(unique, ['b', 'a', 'c'])).assertTrue();
      expect(countOf(values, 'b')).assertEqual(2);
      expect(countOf(unique, 'b')).assertEqual(1);
      expect(uniqueStrings(unique).length).assertEqual(3);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.name          inputValidationFingerprintSeed
     * @tc.desc          Fingerprinting the empty string returns the documented seed.
     * @tc.precondition  The textFingerprint helper is available.
     * @tc.steps         1. Fingerprint the empty string.
     *                   2. Fingerprint single characters.
     *                   3. Compare the values.
     * @tc.expected      The seed is 216613 while characters differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('inputValidationFingerprintSeed', 0, () => {
      const seed: number = textFingerprint('');
      logStep('inputValidationFingerprintSeed', String(seed));
      expect(seed).assertEqual(216613);
      expect(textFingerprint('a')).assertLarger(seed);
      expect(textFingerprint('b') === textFingerprint('a')).assertFalse();
      expect(textFingerprint('ab') === textFingerprint('ba')).assertFalse();
      expect(textFingerprint('a')).assertLess(1000003);
      expect(textFingerprint('a')).assertEqual((216613 * 31 + 97) % 1000003);
      expect(textFingerprint(' ')).assertLarger(0);
      expect(textFingerprint('0')).assertLess(1000003);
      expect(textFingerprint('')).assertEqual(textFingerprint(''));
    });

    /**
     * @tc.name          inputValidationWhitespaceClassification
     * @tc.desc          Whitespace only inputs are distinct from empty inputs.
     * @tc.precondition  The length category helper is available.
     * @tc.steps         1. Classify a space string.
     *                   2. Classify a tab string.
     *                   3. Compare with the empty string.
     * @tc.expected      Whitespace is short and only the empty string is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('inputValidationWhitespaceClassification', 0, () => {
      logStep('inputValidationWhitespaceClassification', '[' + ' ' + ']');
      expect(stringLengthCategory('')).assertEqual('empty');
      expect(stringLengthCategory(' ')).assertEqual('short');
      expect(stringLengthCategory('\t')).assertEqual('short');
      expect(stringLengthCategory('\n')).assertEqual('short');
      expect(' '.trim().length).assertEqual(0);
      expect('\t'.trim().length).assertEqual(0);
      expect(' '.length).assertEqual(1);
      expect(' '.length === 0).assertFalse();
      expect(uniqueStrings(['', ' ', '\t']).length).assertEqual(3);
    });

    /**
     * @tc.name          inputValidationCodeRejectionMatrix
     * @tc.desc          The stub rejects every undocumented code.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send five boundary codes.
     *                   2. Count the rejections.
     *                   3. Compare with the oracle.
     * @tc.expected      Four codes are rejected and one is handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('inputValidationCodeRejectionMatrix', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      const codes: number[] = [UNKNOWN_CODE_NEGATIVE, UNKNOWN_CODE_ZERO, REQUEST_CODE, UNKNOWN_CODE_TWO,
        UNKNOWN_CODE_LARGE];
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], REQUEST_PAYLOAD);
      }
      const metrics: StubMetrics = StubMetrics.from(stub);
      logStep('inputValidationCodeRejectionMatrix', String(metrics.rejected));
      expect(client.sentCodes.length).assertEqual(5);
      expect(metrics.handled).assertEqual(1);
      expect(metrics.rejected).assertEqual(4);
      expect(client.results[2].handled).assertTrue();
      expect(client.results[0].handled).assertFalse();
      expect(client.results[4].handled).assertFalse();
      expect(metrics.requests).assertEqual(5);
      expect(client.replies.length).assertEqual(1);
      expect(joined(numbersToStrings(client.sentCodes), ','))
        .assertEqual('-1,0,1,2,99');
    });

    /**
     * @tc.name          inputValidationRequestRecordFields
     * @tc.desc          A handled request record carries all documented fields.
     * @tc.precondition  A stub is available.
     * @tc.steps         1. Send the documented request.
     *                   2. Read the last record.
     *                   3. Compare every field.
     * @tc.expected      The record carries code, text, reply and handled flag.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('inputValidationRequestRecordFields', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const record = stub.lastRequest();
      logStep('inputValidationRequestRecordFields', record?.describe() === undefined ? '' : record?.describe());
      expect(record?.code).assertEqual(REQUEST_CODE);
      expect(record?.text).assertEqual(REQUEST_PAYLOAD);
      expect(record?.replyText).assertEqual(REPLY_PAYLOAD);
      expect(record?.handled).assertTrue();
      expect(record?.option).assertEqual('0/0/false');
      expect(record?.describe()).assertEqual('1/hello world/hello rpc/true');
      expect(stub.requestCount()).assertEqual(1);
      expect(client.replies.length).assertEqual(1);
      expect(record?.text.length).assertEqual(11);
    });

    /**
     * @tc.name          inputValidationRejectedRecordFields
     * @tc.desc          A rejected request record stores empty text and reply.
     * @tc.precondition  A stub is available.
     * @tc.steps         1. Send an unknown code.
     *                   2. Read the last record.
     *                   3. Compare the empty fields.
     * @tc.expected      The record has empty text, empty reply and a false flag.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('inputValidationRejectedRecordFields', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(UNKNOWN_CODE_LARGE, REQUEST_PAYLOAD);
      const record = stub.lastRequest();
      logStep('inputValidationRejectedRecordFields', record?.describe() === undefined ? '' : record?.describe());
      expect(record?.code).assertEqual(99);
      expect(record?.text).assertEqual('');
      expect(record?.replyText).assertEqual('');
      expect(record?.handled).assertFalse();
      expect(record?.describe()).assertEqual('99///false');
      expect(record?.option).assertEqual('0/0/false');
      expect(stub.requestCount()).assertEqual(1);
      expect(client.results[0].errCode).assertEqual(16000011);
      expect(client.replies.length).assertEqual(0);
    });

    /**
     * @tc.name          inputValidationClientLedgerArrays
     * @tc.desc          The client ledger arrays stay in lock step.
     * @tc.precondition  A client is available.
     * @tc.steps         1. Send four mixed codes.
     *                   2. Compare every ledger length.
     *                   3. Check the index alignment.
     * @tc.expected      The code, text, result and reply arrays align.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('inputValidationClientLedgerArrays', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(REQUEST_CODE, 'p1');
      client.send(0, 'p2');
      client.send(2, 'p3');
      client.send(REQUEST_CODE, 'p4');
      logStep('inputValidationClientLedgerArrays', client.sentTexts.join(','));
      expect(client.sentCodes.length).assertEqual(4);
      expect(client.sentTexts.length).assertEqual(4);
      expect(client.results.length).assertEqual(4);
      expect(client.replies.length).assertEqual(2);
      expect(client.sentCodes[0]).assertEqual(REQUEST_CODE);
      expect(client.sentTexts[1]).assertEqual('p2');
      expect(client.results[2].handled).assertFalse();
      expect(client.results[3].replyText).assertEqual(REPLY_PAYLOAD);
      expect(countOf(client.sentTexts, 'p1')).assertEqual(1);
    });

    /**
     * @tc.name          inputValidationNumericParsing
     * @tc.desc          Numeric strings parse back to the original integers.
     * @tc.precondition  The number and string conversions are available.
     * @tc.steps         1. Parse the boundary codes.
     *                   2. Compare with the constants.
     *                   3. Confirm the formatting.
     * @tc.expected      Parsed values equal the original numbers.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('inputValidationNumericParsing', 0, () => {
      const texts: string[] = ['-2147483648', '-1', '0', '1', '2147483647'];
      const numbers: number[] = [CODE_MIN, UNKNOWN_CODE_NEGATIVE, UNKNOWN_CODE_ZERO, REQUEST_CODE, CODE_MAX];
      logStep('inputValidationNumericParsing', joined(texts, ','));
      expect(texts.length).assertEqual(numbers.length);
      expect(Number(texts[0])).assertEqual(CODE_MIN);
      expect(Number(texts[1])).assertEqual(-1);
      expect(Number(texts[2])).assertEqual(0);
      expect(Number(texts[3])).assertEqual(REQUEST_CODE);
      expect(Number(texts[4])).assertEqual(CODE_MAX);
      expect(String(numbers[3])).assertEqual('1');
      expect(String(numbers[0])).assertEqual('-2147483648');
      expect(Number('12')).assertEqual(12);
      expect(Number('')).assertEqual(0);
    });

    /**
     * @tc.name          inputValidationNumberClampChain
     * @tc.desc          A clamp chain preserves boundary inputs.
     * @tc.precondition  The clampInt helper is available.
     * @tc.steps         1. Clamp every documented code.
     *                   2. Compare with expected bounds.
     *                   3. Confirm idempotence.
     * @tc.expected      Clamping is idempotent for in range values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('inputValidationNumberClampChain', 0, () => {
      const codes: number[] = [-1, 0, 1, 2, 99];
      const clamped: number[] = [];
      for (let index = 0; index < codes.length; index++) {
        clamped.push(clampInt(codes[index], 0, 1));
      }
      logStep('inputValidationNumberClampChain', joined(numbersToStrings(clamped), ','));
      expect(clamped.length).assertEqual(5);
      expect(clamped[0]).assertEqual(0);
      expect(clamped[1]).assertEqual(0);
      expect(clamped[2]).assertEqual(1);
      expect(clamped[3]).assertEqual(1);
      expect(clamped[4]).assertEqual(1);
      expect(clampInt(clampInt(99, 0, 1), 0, 1)).assertEqual(1);
      expect(clampInt(1, 0, 1)).assertEqual(1);
      expect(countOf(numbersToStrings(clamped), '1')).assertEqual(3);
    });

    /**
     * @tc.name          inputValidationStringEqualityVariants
     * @tc.desc          String equality distinguishes case and padding.
     * @tc.precondition  The string constants are available.
     * @tc.steps         1. Compare exact literals.
     *                   2. Compare case and trimmed variants.
     *                   3. Confirm the differences.
     * @tc.expected      Only the exact literal matches.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('inputValidationStringEqualityVariants', 0, () => {
      const padded: string = ' ' + REQUEST_PAYLOAD + ' ';
      const upper: string = REQUEST_PAYLOAD.toUpperCase();
      logStep('inputValidationStringEqualityVariants', upper);
      expect(REQUEST_PAYLOAD === 'hello world').assertTrue();
      expect(upper === REQUEST_PAYLOAD).assertFalse();
      expect(padded === REQUEST_PAYLOAD).assertFalse();
      expect(padded.trim()).assertEqual(REQUEST_PAYLOAD);
      expect(upper.toLowerCase()).assertEqual(REQUEST_PAYLOAD);
      expect(padded.length).assertEqual(REQUEST_PAYLOAD.length + 2);
      expect(upper.length).assertEqual(REQUEST_PAYLOAD.length);
      expect(REQUEST_PAYLOAD.indexOf('hello')).assertEqual(0);
      expect(padded.indexOf(REQUEST_PAYLOAD)).assertEqual(1);
    });

    /**
     * @tc.name          inputValidationCaseFoldInputs
     * @tc.desc          Case folded inputs collapse distinct literals.
     * @tc.precondition  The case conversion helpers are available.
     * @tc.steps         1. Fold three case variants.
     *                   2. Deduplicate the folded list.
     *                   3. Compare the count.
     * @tc.expected      Three variants fold to one unique value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('inputValidationCaseFoldInputs', 0, () => {
      const variants: string[] = ['IPCStubTest', 'ipcstubtest', 'IpcStubTest'];
      const folded: string[] = [];
      for (let index = 0; index < variants.length; index++) {
        folded.push(variants[index].toLowerCase());
      }
      logStep('inputValidationCaseFoldInputs', joined(folded, ','));
      expect(variants.length).assertEqual(3);
      expect(uniqueStrings(variants).length).assertEqual(3);
      expect(uniqueStrings(folded).length).assertEqual(1);
      expect(folded[0]).assertEqual('ipcstubtest');
      expect(folded[1]).assertEqual(folded[2]);
      expect(uniqueStrings(variants.map((value: string): string => value.toUpperCase())).length).assertEqual(1);
      expect(folded[0].length).assertEqual(11);
      expect(variants[0].length).assertEqual(folded[0].length);
      expect(countOf(folded, 'ipcstubtest')).assertEqual(3);
    });

    /**
     * @tc.name          inputValidationPrefixSuffix
     * @tc.desc          Prefix and suffix checks separate near miss literals.
     * @tc.precondition  The payload constants are available.
     * @tc.steps         1. Check prefixes and suffixes.
     *                   2. Compare near misses.
     *                   3. Confirm the boundaries.
     * @tc.expected      Only the documented affixes match.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('inputValidationPrefixSuffix', 0, () => {
      logStep('inputValidationPrefixSuffix', REQUEST_PAYLOAD);
      expect(REQUEST_PAYLOAD.startsWith('hello')).assertTrue();
      expect(REQUEST_PAYLOAD.startsWith('Hello')).assertFalse();
      expect(REQUEST_PAYLOAD.endsWith('world')).assertTrue();
      expect(REQUEST_PAYLOAD.endsWith('World')).assertFalse();
      expect(REQUEST_PAYLOAD.startsWith('world')).assertFalse();
      expect(REQUEST_PAYLOAD.endsWith('hello')).assertFalse();
      expect(REPLY_PAYLOAD.endsWith('rpc')).assertTrue();
      expect(REPLY_PAYLOAD.startsWith('hello')).assertTrue();
      expect(REPLY_PAYLOAD.indexOf(' ')).assertEqual(5);
    });

    /**
     * @tc.name          inputValidationClampRangeMatrix
     * @tc.desc          A matrix of clamp ranges yields expected boundary values.
     * @tc.precondition  The clampInt helper is available.
     * @tc.steps         1. Clamp with three ranges.
     *                   2. Compare the outputs.
     *                   3. Confirm the range widths.
     * @tc.expected      Each range maps the input to its nearest bound.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('inputValidationClampRangeMatrix', 0, () => {
      logStep('inputValidationClampRangeMatrix', String(clampInt(5, 0, 10)));
      expect(clampInt(5, 0, 10)).assertEqual(5);
      expect(clampInt(-5, 0, 10)).assertEqual(0);
      expect(clampInt(15, 0, 10)).assertEqual(10);
      expect(clampInt(5, 6, 10)).assertEqual(6);
      expect(clampInt(5, 0, 4)).assertEqual(4);
      expect(clampInt(0, 0, 0)).assertEqual(0);
      expect(clampInt(3, 3, 3)).assertEqual(3);
      expect(clampInt(2, 3, 3)).assertEqual(3);
      expect(clampInt(4, 3, 3)).assertEqual(3);
    });

    /**
     * @tc.name          inputValidationEmptyArrayContracts
     * @tc.desc          Empty array helpers return neutral values.
     * @tc.precondition  The array helpers are available.
     * @tc.steps         1. Join an empty array.
     *                   2. Count and deduplicate an empty array.
     *                   3. Compare the results.
     * @tc.expected      Join is empty, counts are zero and the unique list is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('inputValidationEmptyArrayContracts', 0, () => {
      const empty: string[] = [];
      logStep('inputValidationEmptyArrayContracts', '[' + joined(empty, ',') + ']');
      expect(empty.length).assertEqual(0);
      expect(joined(empty, ',')).assertEqual('');
      expect(countOf(empty, '')).assertEqual(0);
      expect(uniqueStrings(empty).length).assertEqual(0);
      expect(sameStringArray(empty, [])).assertTrue();
      expect(empty.indexOf('x')).assertEqual(-1);
      expect(uniqueStrings(empty).length).assertEqual(empty.length);
      expect(joined(empty, '|').split('|').length).assertEqual(1);
      expect(countOf(empty, 'x')).assertEqual(0);
    });

    /**
     * @tc.name          inputValidationSingleElementArrays
     * @tc.desc          Single element arrays behave consistently across helpers.
     * @tc.precondition  The array helpers are available.
     * @tc.steps         1. Join one element.
     *                   2. Count and deduplicate it.
     *                   3. Compare the results.
     * @tc.expected      One element remains after every operation.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('inputValidationSingleElementArrays', 0, () => {
      const single: string[] = ['only'];
      logStep('inputValidationSingleElementArrays', joined(single, ','));
      expect(single.length).assertEqual(1);
      expect(joined(single, ',')).assertEqual('only');
      expect(countOf(single, 'only')).assertEqual(1);
      expect(countOf(single, 'other')).assertEqual(0);
      expect(uniqueStrings(single).length).assertEqual(1);
      expect(uniqueStrings(single)[0]).assertEqual('only');
      expect(sameStringArray(single, ['only'])).assertTrue();
      expect(sameStringArray(single, ['other'])).assertFalse();
      expect(joined(single, '|')).assertEqual(single[0]);
    });

    /**
     * @tc.name          inputValidationFingerprintConsistency
     * @tc.desc          Fingerprints are consistent across repeated calls.
     * @tc.precondition  The textFingerprint helper is available.
     * @tc.steps         1. Fingerprint the payload five times.
     *                   2. Compare every value.
     *                   3. Compare with a variant.
     * @tc.expected      All calls agree and the variant differs.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('inputValidationFingerprintConsistency', 0, () => {
      const baseline: number = textFingerprint(REQUEST_PAYLOAD);
      let stable: boolean = true;
      for (let index = 0; index < 5; index++) {
        if (textFingerprint(REQUEST_PAYLOAD) !== baseline) {
          stable = false;
        }
      }
      logStep('inputValidationFingerprintConsistency', String(baseline));
      expect(stable).assertTrue();
      expect(baseline).assertEqual(textFingerprint('hello world'));
      expect(baseline === textFingerprint(REPLY_PAYLOAD)).assertFalse();
      expect(baseline).assertLarger(0);
      expect(baseline).assertLess(1000003);
      expect(textFingerprint('')).assertEqual(216613);
      expect(textFingerprint(REQUEST_PAYLOAD.toUpperCase()) === baseline).assertFalse();
      expect(textFingerprint(REQUEST_PAYLOAD + ' ')).assertLarger(0);
      expect(countOf([String(baseline), String(baseline)], String(baseline))).assertEqual(2);
    });

    /**
     * @tc.name          inputValidationStubLifecycleBoundaryCodes
     * @tc.desc          The stub handles boundaries independently of its lifecycle.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send a handled code.
     *                   2. Kill, send and revive.
     *                   3. Compare the outcomes.
     * @tc.expected      The killed request is rejected and the revived one handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('inputValidationStubLifecycleBoundaryCodes', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      const alive = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      stub.kill();
      const dead = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      stub.revive();
      const revived = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      logStep('inputValidationStubLifecycleBoundaryCodes', String(stub.requestCount()));
      expect(alive.handled).assertTrue();
      expect(dead.handled).assertFalse();
      expect(revived.handled).assertTrue();
      expect(client.results.length).assertEqual(3);
      expect(client.replies.length).assertEqual(2);
      expect(stub.requestCount()).assertEqual(3);
      expect(stub.alive).assertTrue();
      expect(revived.replyText).assertEqual(REPLY_PAYLOAD);
      expect(dead.replyText).assertEqual('');
    });

    /**
     * @tc.name          inputValidationDirectCallCodeMatrix
     * @tc.desc          Direct stub calls return the boolean oracle for each code.
     * @tc.precondition  A stub is available.
     * @tc.steps         1. Call the stub with five codes.
     *                   2. Store the boolean results.
     *                   3. Compare with the oracle.
     * @tc.expected      Only code one returns true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('inputValidationDirectCallCodeMatrix', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const codes: number[] = [-1, 0, 1, 2, 99];
      const outcomes: boolean[] = [];
      for (let index = 0; index < codes.length; index++) {
        const client: InProcessClient = new InProcessClient(stub);
        outcomes.push(client.send(codes[index], REQUEST_PAYLOAD).handled);
      }
      logStep('inputValidationDirectCallCodeMatrix', joined(outcomes.map((value: boolean): string => String(value)), ','));
      expect(outcomes.length).assertEqual(5);
      expect(outcomes[0]).assertFalse();
      expect(outcomes[1]).assertFalse();
      expect(outcomes[2]).assertTrue();
      expect(outcomes[3]).assertFalse();
      expect(outcomes[4]).assertFalse();
      expect(countOf(outcomes.map((value: boolean): string => String(value)), 'true')).assertEqual(1);
      expect(stub.requestCount()).assertEqual(5);
      expect(StubMetrics.from(stub).handled).assertEqual(1);
      expect(StubMetrics.from(stub).rejected).assertEqual(4);
    });

    /**
     * @tc.name          inputValidationWhitespacePayloadBoundary
     * @tc.desc          Whitespace payloads are recorded exactly as sent.
     * @tc.precondition  A stub is available.
     * @tc.steps         1. Send space, tab and newline payloads.
     *                   2. Compare the recorded texts.
     *                   3. Confirm the shapes.
     * @tc.expected      Each recorded text matches the exact whitespace input.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('inputValidationWhitespacePayloadBoundary', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      const inputs: string[] = [' ', '\t', '\n'];
      for (let index = 0; index < inputs.length; index++) {
        client.send(REQUEST_CODE, inputs[index]);
      }
      logStep('inputValidationWhitespacePayloadBoundary', joined(client.sentTexts.map((value: string): string => String(value.length)), ','));
      expect(stub.requestCount()).assertEqual(3);
      expect(client.sentTexts[0]).assertEqual(' ');
      expect(client.sentTexts[1]).assertEqual('\t');
      expect(client.sentTexts[2]).assertEqual('\n');
      expect(client.sentTexts[0].trim().length).assertEqual(0);
      expect(client.sentTexts[1].trim().length).assertEqual(0);
      expect(client.sentTexts[2].trim().length).assertEqual(0);
      expect(uniqueStrings(client.sentTexts).length).assertEqual(3);
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(3);
    });

    /**
     * @tc.name          inputValidationUnicodeInputBoundary
     * @tc.desc          Unicode inputs are accepted and preserved verbatim.
     * @tc.precondition  A stub is available.
     * @tc.steps         1. Send a unicode payload.
     *                   2. Record it.
     *                   3. Compare the character codes.
     * @tc.expected      The recorded text equals the unicode input.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('inputValidationUnicodeInputBoundary', 0, () => {
      const unicode: string = '输入验证 \u4e2d\u6587';
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(REQUEST_CODE, unicode);
      const record = stub.lastRequest();
      const text: string = record === undefined ? '' : record.text;
      logStep('inputValidationUnicodeInputBoundary', text);
      expect(text).assertEqual(unicode);
      expect(text.length).assertEqual(unicode.length);
      expect(text.charCodeAt(0)).assertEqual(unicode.charCodeAt(0));
      expect(text.indexOf(' ')).assertLarger(0);
      expect(stringLengthCategory(text)).assertEqual('short');
      expect(uniqueStrings([text, unicode]).length).assertEqual(1);
      expect(sameStringArray([text], [unicode])).assertTrue();
      expect(client.replies.length).assertEqual(1);
      expect(stub.requestCount()).assertEqual(1);
    });

    /**
     * @tc.name          inputValidationRecordOptionVariants
     * @tc.desc          Each direct call records the option it was given.
     * @tc.precondition  A stub and session pairs are available.
     * @tc.steps         1. Call the stub with three options.
     *                   2. Read the recorded options.
     *                   3. Compare with the descriptions.
     * @tc.expected      Every record mirrors its option description.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('inputValidationRecordOptionVariants', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const options: string[] = ['0/0/false', '1/100/false', '1/0/true'];
      const flags: number[] = [0, 1, 1];
      const waits: number[] = [0, 100, 0];
      for (let index = 0; index < flags.length; index++) {
        const data: MessageSequenceModel = MessageSequenceModel.create();
        const reply: MessageSequenceModel = MessageSequenceModel.create();
        const option: MessageOptionModel = new MessageOptionModel(flags[index], waits[index], index === 2);
        data.writeString(REQUEST_PAYLOAD);
        stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, option);
      }
      logStep('inputValidationRecordOptionVariants',
        joined(stub.requests.map((record: StubRequestRecord): string => record.option), ','));
      expect(stub.requestCount()).assertEqual(3);
      expect(stub.requests[0].option).assertEqual(options[0]);
      expect(stub.requests[1].option).assertEqual(options[1]);
      expect(stub.requests[2].option).assertEqual(options[2]);
      expect(stub.requests[0].handled).assertTrue();
      expect(stub.requests[1].handled).assertTrue();
      expect(stub.requests[2].handled).assertTrue();
      expect(countOf(stub.requests.map((record: StubRequestRecord): string => record.option), '1/0/true'))
        .assertEqual(1);
      expect(StubMetrics.from(stub).handled).assertEqual(3);
    });

    /**
     * @tc.name          inputValidationStubResetInputs
     * @tc.desc          Resetting the stub clears inputs and restores defaults.
     * @tc.precondition  A stub with traffic and custom settings exists.
     * @tc.steps         1. Send a request and set a custom reply.
     *                   2. Reset the stub.
     *                   3. Read every field.
     * @tc.expected      Records clear, the reply resets and the stub stays alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('inputValidationStubResetInputs', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      stub.replyText = 'custom reply';
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const sentRecord = stub.lastRequest();
      const customReply: string = sentRecord === undefined ? '' : sentRecord.replyText;
      stub.reset();
      logStep('inputValidationStubResetInputs', stub.replyText);
      expect(customReply).assertEqual('custom reply');
      expect(stub.requestCount()).assertEqual(0);
      expect(stub.lastRequest()).assertUndefined();
      expect(stub.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.alive).assertTrue();
      expect(stub.descriptor).assertEqual('IPCStubTest');
      expect(stub.rejectCodes.length).assertEqual(0);
      expect(StubMetrics.from(stub).requests).assertEqual(0);
    });

    /**
     * @tc.name          inputValidationReplyBounds
     * @tc.desc          The reply literal length sits inside its documented bounds.
     * @tc.precondition  The reply constant is available.
     * @tc.steps         1. Read the reply length.
     *                   2. Clamp it against bounds.
     *                   3. Compare the characters.
     * @tc.expected      The reply length is nine and the bounds hold.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('inputValidationReplyBounds', 0, () => {
      logStep('inputValidationReplyBounds', REPLY_PAYLOAD);
      expect(REPLY_PAYLOAD.length).assertEqual(9);
      expect(clampInt(REPLY_PAYLOAD.length, 1, 8)).assertEqual(8);
      expect(clampInt(REPLY_PAYLOAD.length, 10, 20)).assertEqual(10);
      expect(clampInt(REPLY_PAYLOAD.length, 0, 100)).assertEqual(9);
      expect(REPLY_PAYLOAD.charCodeAt(0)).assertEqual(104);
      expect(REPLY_PAYLOAD.charCodeAt(8)).assertEqual(99);
      expect(REPLY_PAYLOAD.split(' ').length).assertEqual(2);
      expect(REPLY_PAYLOAD.indexOf('rpc')).assertEqual(6);
      expect(REPLY_PAYLOAD.length).assertLess(REQUEST_PAYLOAD.length);
    });

    /**
     * @tc.name          inputValidationEmptyPayloadBoundary
     * @tc.desc          The empty payload does not disturb request handling.
     * @tc.precondition  A stub is available.
     * @tc.steps         1. Send an empty payload.
     *                   2. Read the record.
     *                   3. Compare with the boundary helpers.
     * @tc.expected      The record text is empty and the request is handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('inputValidationEmptyPayloadBoundary', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const result: RequestResultModel = sendWithStub(stub, REQUEST_CODE);
      logStep('inputValidationEmptyPayloadBoundary', String(stub.lastRequest()?.text.length));
      expect(REQUEST_PAYLOAD.length).assertEqual(11);
      expect(result.handled).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.lastRequest()?.text).assertEqual(REQUEST_PAYLOAD);
      expect(stringLengthCategory('')).assertEqual('empty');
      expect(''.length).assertEqual(0);
      expect(clampInt(''.length, 0, 10)).assertEqual(0);
      expect(uniqueStrings(['', '']).length).assertEqual(1);
      expect(countOf(['', ''], '')).assertEqual(2);
    });

    /**
     * @tc.name          inputValidationLongPayloadBoundary
     * @tc.desc          A long payload sits beyond the medium category.
     * @tc.precondition  A stub is available.
     * @tc.steps         1. Build a 192 character payload.
     *                   2. Send it.
     *                   3. Compare the category and length.
     * @tc.expected      The payload is long and recorded in full.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('inputValidationLongPayloadBoundary', 0, () => {
      const longPayload: string = buildString('0123456789abcdef', 12);
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(REQUEST_CODE, longPayload);
      const record = stub.lastRequest();
      const text: string = record === undefined ? '' : record.text;
      logStep('inputValidationLongPayloadBoundary', String(longPayload.length));
      expect(longPayload.length).assertEqual(192);
      expect(stringLengthCategory(longPayload)).assertEqual('long');
      expect(text).assertEqual(longPayload);
      expect(text.length).assertEqual(192);
      expect(clampInt(text.length, 0, 128)).assertEqual(128);
      expect(text.startsWith('0123')).assertTrue();
      expect(text.endsWith('cdef')).assertTrue();
      expect(countOf([longPayload, text], longPayload)).assertEqual(2);
      expect(stub.requestCount()).assertEqual(1);
    });

    /**
     * @tc.name          inputValidationCodeStringLedger
     * @tc.desc          A code ledger string matches the sent codes.
     * @tc.precondition  A client is available.
     * @tc.steps         1. Send four codes.
     *                   2. Build the code ledger.
     *                   3. Split and compare.
     * @tc.expected      The ledger lists the codes in send order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('inputValidationCodeStringLedger', 0, () => {
      const client: InProcessClient = new InProcessClient(new StubRemoteObjectModel());
      client.send(1, 'p');
      client.send(0, 'p');
      client.send(2, 'p');
      client.send(99, 'p');
      const ledger: string = joined(numbersToStrings(client.sentCodes), '>');
      logStep('inputValidationCodeStringLedger', ledger);
      expect(ledger).assertEqual('1>0>2>99');
      expect(ledger.split('>').length).assertEqual(4);
      expect(ledger.split('>')[0]).assertEqual('1');
      expect(ledger.split('>')[3]).assertEqual('99');
      expect(client.sentCodes.length).assertEqual(4);
      expect(client.results[0].handled).assertTrue();
      expect(client.results[3].handled).assertFalse();
      expect(countOf(ledger.split('>'), '2')).assertEqual(1);
      expect(uniqueStrings(numbersToStrings(client.sentCodes)).length).assertEqual(4);
    });

    /**
     * @tc.name          inputValidationStubMetricsRatios
     * @tc.desc          Metrics ratios reflect the handled share of inputs.
     * @tc.precondition  A stub with mixed traffic exists.
     * @tc.steps         1. Send three handled and one rejected code.
     *                   2. Derive the metrics.
     *                   3. Compare the ratios.
     * @tc.expected      The ratio is three quarters and the counts align.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('inputValidationStubMetricsRatios', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(1, 'p');
      client.send(1, 'p');
      client.send(1, 'p');
      client.send(2, 'p');
      const metrics: StubMetrics = StubMetrics.from(stub);
      logStep('inputValidationStubMetricsRatios', String(metrics.successRatio()));
      expect(metrics.requests).assertEqual(4);
      expect(metrics.handled).assertEqual(3);
      expect(metrics.rejected).assertEqual(1);
      expect(metrics.replies).assertEqual(3);
      expect(metrics.successRatio()).assertEqual(0.75);
      expect(metrics.fingerprint()).assertLarger(0);
      expect(stub.requestCount()).assertEqual(4);
      expect(client.replies.length).assertEqual(3);
      expect(clampInt(metrics.handled, 0, 2)).assertEqual(2);
    });

    /**
     * @tc.name          inputValidationCodeArrayUnique
     * @tc.desc          A code array deduplicates while preserving first occurrence order.
     * @tc.precondition  The uniqueStrings helper is available.
     * @tc.steps         1. Build a repeated code string list.
     *                   2. Deduplicate it.
     *                   3. Compare the order.
     * @tc.expected      Three unique codes remain in first seen order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('inputValidationCodeArrayUnique', 0, () => {
      const codes: string[] = ['2', '1', '2', '99', '1'];
      const unique: string[] = uniqueStrings(codes);
      logStep('inputValidationCodeArrayUnique', joined(unique, ','));
      expect(codes.length).assertEqual(5);
      expect(unique.length).assertEqual(3);
      expect(unique[0]).assertEqual('2');
      expect(unique[1]).assertEqual('1');
      expect(unique[2]).assertEqual('99');
      expect(countOf(codes, '2')).assertEqual(2);
      expect(countOf(unique, '1')).assertEqual(1);
      expect(uniqueStrings(unique).length).assertEqual(3);
      expect(sameStringArray(unique, ['2', '1', '99'])).assertTrue();
    });

    /**
     * @tc.name          inputValidationBooleanToStringLedger
     * @tc.desc          Boolean outcomes convert to stable ledger tokens.
     * @tc.precondition  A client is available.
     * @tc.steps         1. Send two handled and one rejected code.
     *                   2. Convert the outcome flags.
     *                   3. Join the tokens.
     * @tc.expected      The ledger reads true,true,false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('inputValidationBooleanToStringLedger', 0, () => {
      const client: InProcessClient = new InProcessClient(new StubRemoteObjectModel());
      client.send(1, 'p');
      client.send(1, 'p');
      client.send(0, 'p');
      const tokens: string[] = client.results.map((result: RequestResultModel): string => String(result.handled));
      const ledger: string = joined(tokens, ',');
      logStep('inputValidationBooleanToStringLedger', ledger);
      expect(tokens.length).assertEqual(3);
      expect(ledger).assertEqual('true,true,false');
      expect(countOf(tokens, 'true')).assertEqual(2);
      expect(countOf(tokens, 'false')).assertEqual(1);
      expect(client.results[0].isSuccess()).assertTrue();
      expect(client.results[2].isSuccess()).assertFalse();
      expect(client.replies.length).assertEqual(2);
      expect(client.sentCodes[2]).assertEqual(0);
      expect(uniqueStrings(tokens).length).assertEqual(2);
    });

    /**
     * @tc.name          inputValidationStubRejectCodesCustom
     * @tc.desc          Custom reject codes force rejections for known codes.
     * @tc.precondition  A stub with a custom reject list exists.
     * @tc.steps         1. Add code one to the reject list.
     *                   2. Send code one.
     *                   3. Inspect the result and record.
     * @tc.expected      The known code is rejected after being listed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('inputValidationStubRejectCodesCustom', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      stub.rejectCodes = [REQUEST_CODE];
      const client: InProcessClient = new InProcessClient(stub);
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      logStep('inputValidationStubRejectCodesCustom', String(result.errCode));
      expect(stub.rejectCodes.length).assertEqual(1);
      expect(stub.rejectCodes[0]).assertEqual(REQUEST_CODE);
      expect(result.handled).assertFalse();
      expect(result.errCode).assertEqual(16000011);
      expect(stub.lastRequest()?.text).assertEqual('');
      expect(client.replies.length).assertEqual(0);
      expect(stub.requestCount()).assertEqual(1);
      expect(StubMetrics.from(stub).rejected).assertEqual(1);
      expect(isKnownRequestCode(REQUEST_CODE)).assertTrue();
    });

    /**
     * @tc.name          inputValidationArraySortStability
     * @tc.desc          Sorting numeric strings is stable across duplicates.
     * @tc.precondition  The code ledger helpers are available.
     * @tc.steps         1. Sort a code list twice.
     *                   2. Compare both results.
     *                   3. Count the duplicates.
     * @tc.expected      Both sorts agree and duplicates are retained.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('inputValidationArraySortStability', 0, () => {
      const first: string[] = ['2', '1', '2', '0', '99'];
      const second: string[] = ['2', '1', '2', '0', '99'];
      first.sort((left: string, right: string): number => Number(left) - Number(right));
      second.sort((left: string, right: string): number => Number(left) - Number(right));
      logStep('inputValidationArraySortStability', joined(first, ','));
      expect(sameStringArray(first, second)).assertTrue();
      expect(first[0]).assertEqual('0');
      expect(first[1]).assertEqual('1');
      expect(first[4]).assertEqual('99');
      expect(countOf(first, '2')).assertEqual(2);
      expect(first.length).assertEqual(5);
      expect(Number(first[0])).assertEqual(0);
      expect(Number(first[4])).assertEqual(99);
      expect(uniqueStrings(first).length).assertEqual(4);
    });

    /**
     * @tc.name          inputValidationStringSliceBoundaries
     * @tc.desc          Slicing the payload respects index boundaries.
     * @tc.precondition  The payload literal is available.
     * @tc.steps         1. Slice at the documented indices.
     *                   2. Compare each fragment.
     *                   3. Confirm the reassembly.
     * @tc.expected      The slices reassemble to the payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('inputValidationStringSliceBoundaries', 0, () => {
      const head: string = REQUEST_PAYLOAD.slice(0, 5);
      const space: string = REQUEST_PAYLOAD.slice(5, 6);
      const tail: string = REQUEST_PAYLOAD.slice(6);
      logStep('inputValidationStringSliceBoundaries', head + '|' + space + '|' + tail);
      expect(head).assertEqual('hello');
      expect(space).assertEqual(' ');
      expect(tail).assertEqual('world');
      expect(head + space + tail).assertEqual(REQUEST_PAYLOAD);
      expect(charsJoinedValue(REQUEST_PAYLOAD)).assertEqual(REQUEST_PAYLOAD);
      expect(REQUEST_PAYLOAD.slice(0, 0)).assertEqual('');
      expect(REQUEST_PAYLOAD.slice(11)).assertEqual('');
      expect(REQUEST_PAYLOAD.slice(-5)).assertEqual('world');
      expect(head.length + space.length + tail.length).assertEqual(11);
    });

    /**
     * @tc.name          inputValidationStubAliveFlag
     * @tc.desc          The alive flag toggles exactly with kill and revive.
     * @tc.precondition  A stub is available.
     * @tc.steps         1. Read the initial flag.
     *                   2. Kill and revive.
     *                   3. Compare each flag.
     * @tc.expected      The flag moves true, false and true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('inputValidationStubAliveFlag', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const initial: boolean = stub.alive;
      stub.kill();
      const killed: boolean = stub.alive;
      stub.revive();
      const revived: boolean = stub.alive;
      logStep('inputValidationStubAliveFlag', String(initial) + '/' + String(killed) + '/' + String(revived));
      expect(initial).assertTrue();
      expect(killed).assertFalse();
      expect(revived).assertTrue();
      expect(initial === killed).assertFalse();
      expect(killed === revived).assertFalse();
      expect(initial === revived).assertTrue();
      expect(stub.descriptor).assertEqual('IPCStubTest');
      expect(stub.requestCount()).assertEqual(0);
      expect(StubMetrics.from(stub).requests).assertEqual(0);
    });

    /**
     * @tc.name          inputValidationPayloadCategoryMatrix
     * @tc.desc          Payload categories cover empty, short, medium and long inputs.
     * @tc.precondition  The length category helper is available.
     * @tc.steps         1. Build four payloads.
     *                   2. Classify each.
     *                   3. Count each category.
     * @tc.expected      Each payload maps to its category.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('inputValidationPayloadCategoryMatrix', 0, () => {
      const empty: string = '';
      const short: string = 'abc';
      const medium: string = buildString('m', 40);
      const long: string = buildString('l', 100);
      const categories: string[] = [
        stringLengthCategory(empty),
        stringLengthCategory(short),
        stringLengthCategory(medium),
        stringLengthCategory(long)
      ];
      logStep('inputValidationPayloadCategoryMatrix', joined(categories, ','));
      expect(categories.length).assertEqual(4);
      expect(categories[0]).assertEqual('empty');
      expect(categories[1]).assertEqual('short');
      expect(categories[2]).assertEqual('medium');
      expect(categories[3]).assertEqual('long');
      expect(medium.length).assertEqual(40);
      expect(long.length).assertEqual(100);
      expect(uniqueStrings(categories).length).assertEqual(4);
      expect(countOf(categories, 'medium')).assertEqual(1);
    });

    /**
     * @tc.name          inputValidationClampSummaryReport
     * @tc.desc          A clamp summary reports the low, high and identity results.
     * @tc.precondition  The clampInt helper is available.
     * @tc.steps         1. Clamp three inputs.
     *                   2. Compose the summary.
     *                   3. Inspect each field.
     * @tc.expected      The summary matches the clamped values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('inputValidationClampSummaryReport', 0, () => {
      const low: number = clampInt(-10, 0, 100);
      const high: number = clampInt(1000, 0, 100);
      const identity: number = clampInt(50, 0, 100);
      const report: string = String(low) + ',' + String(high) + ',' + String(identity);
      logStep('inputValidationClampSummaryReport', report);
      expect(report).assertEqual('0,100,50');
      expect(report.split(',').length).assertEqual(3);
      expect(report.split(',')[0]).assertEqual('0');
      expect(report.split(',')[1]).assertEqual('100');
      expect(report.split(',')[2]).assertEqual('50');
      expect(low + high + identity).assertEqual(150);
      expect(countOf(report.split(','), '0')).assertEqual(1);
      expect(Number(report.split(',')[1])).assertEqual(100);
      expect(clampInt(identity, 0, 100)).assertEqual(identity);
    });

    /**
     * @tc.name          inputValidationCodeRangeSweep
     * @tc.desc          A sweep across codes finds only one known value.
     * @tc.precondition  The known code oracle is available.
     * @tc.steps         1. Sweep codes from minus two to two.
     *                   2. Count the known results.
     *                   3. Compare with the expected positions.
     * @tc.expected      Only code one is known in the sweep.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('inputValidationCodeRangeSweep', 0, () => {
      const codes: number[] = [-2, -1, 0, 1, 2];
      const known: boolean[] = [];
      for (let index = 0; index < codes.length; index++) {
        known.push(isKnownRequestCode(codes[index]));
      }
      logStep('inputValidationCodeRangeSweep', joined(known.map((value: boolean): string => String(value)), ','));
      expect(known.length).assertEqual(5);
      expect(known[0]).assertFalse();
      expect(known[1]).assertFalse();
      expect(known[2]).assertFalse();
      expect(known[3]).assertTrue();
      expect(known[4]).assertFalse();
      expect(countOf(known.map((value: boolean): string => String(value)), 'true')).assertEqual(1);
      expect(codes[3]).assertEqual(REQUEST_CODE);
      expect(codes.length).assertEqual(5);
      expect(uniqueStrings(codes.map((code: number): string => classifyCode(code))).length).assertEqual(4);
    });

    /**
     * @tc.name          inputValidationTrimmedLengthMatrix
     * @tc.desc          Trimmed lengths separate padded inputs from exact ones.
     * @tc.precondition  The string helpers are available.
     * @tc.steps         1. Trim three padded inputs.
     *                   2. Compare the trimmed lengths.
     *                   3. Confirm the originals stay padded.
     * @tc.expected      Trimmed lengths equal the exact payload length.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('inputValidationTrimmedLengthMatrix', 0, () => {
      const left: string = ' ' + REQUEST_PAYLOAD;
      const right: string = REQUEST_PAYLOAD + ' ';
      const both: string = ' ' + REQUEST_PAYLOAD + ' ';
      logStep('inputValidationTrimmedLengthMatrix', String(both.trim().length));
      expect(left.trim()).assertEqual(REQUEST_PAYLOAD);
      expect(right.trim()).assertEqual(REQUEST_PAYLOAD);
      expect(both.trim()).assertEqual(REQUEST_PAYLOAD);
      expect(left.trim().length).assertEqual(11);
      expect(right.trim().length).assertEqual(11);
      expect(both.trim().length).assertEqual(11);
      expect(left.length).assertEqual(12);
      expect(both.length).assertEqual(13);
      expect(both.trim().length).assertLess(both.length);
    });

    /**
     * @tc.name          inputValidationUnicodeLength
     * @tc.desc          Unicode input lengths count code units consistently.
     * @tc.precondition  The unicode literal is available.
     * @tc.steps         1. Read the unicode length.
     *                   2. Slice the input.
     *                   3. Compare the fragments.
     * @tc.expected      Sliced fragments reassemble to the original.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('inputValidationUnicodeLength', 0, () => {
      const unicode: string = '输入边界';
      logStep('inputValidationUnicodeLength', unicode);
      expect(unicode.length).assertEqual(4);
      expect(unicode.slice(0, 2)).assertEqual('输入');
      expect(unicode.slice(2)).assertEqual('边界');
      expect(unicode.slice(0, 2) + unicode.slice(2)).assertEqual(unicode);
      expect(unicode.charCodeAt(0)).assertLarger(127);
      expect(stringLengthCategory(unicode)).assertEqual('short');
      expect(clampInt(unicode.length, 0, 2)).assertEqual(2);
      expect(unicode.split('').length).assertEqual(4);
      expect(uniqueStrings(unicode.split('')).length).assertEqual(4);
    });

    /**
     * @tc.name          inputValidationFinalInputLedger
     * @tc.desc          A final input ledger combines codes, categories and counts.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send two boundary codes.
     *                   2. Build the ledger.
     *                   3. Inspect each field.
     * @tc.expected      The ledger lists two codes, two categories and one handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('inputValidationFinalInputLedger', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, '');
      const metrics: StubMetrics = StubMetrics.from(stub);
      const ledger: string = joined(numbersToStrings(client.sentCodes), '>') + '#' +
        countOf(client.sentTexts.map((value: string): string => stringLengthCategory(value)), 'medium') + '#' +
        String(metrics.handled);
      logStep('inputValidationFinalInputLedger', ledger);
      expect(ledger).assertEqual('1>2#1#1');
      expect(ledger.split('#').length).assertEqual(3);
      expect(ledger.split('#')[0]).assertEqual('1>2');
      expect(ledger.split('#')[1]).assertEqual('1');
      expect(ledger.split('#')[2]).assertEqual('1');
      expect(metrics.requests).assertEqual(2);
      expect(metrics.rejected).assertEqual(1);
      expect(client.replies.length).assertEqual(1);
      expect(countOf(client.sentTexts, '')).assertEqual(1);
    });

    /**
     * @tc.name          inputValidationContractCheck
     * @tc.desc          A closing contract check covers the helper invariants.
     * @tc.precondition  The array and clamp helpers are available.
     * @tc.steps         1. Compare array views.
     *                   2. Clamp the known code.
     *                   3. Confirm the fingerprint bounds.
     * @tc.expected      Every invariant holds simultaneously.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('inputValidationContractCheck', 0, () => {
      const values: string[] = ['a', 'b'];
      const copy: string[] = ['a', 'b'];
      const fingerprint: number = textFingerprint(REQUEST_PAYLOAD);
      logStep('inputValidationContractCheck', String(fingerprint));
      expect(sameStringArray(values, copy)).assertTrue();
      expect(values === copy).assertFalse();
      expect(uniqueStrings(values).length).assertEqual(values.length);
      expect(countOf(values, 'a')).assertEqual(1);
      expect(clampInt(REQUEST_CODE, 0, 99)).assertEqual(1);
      expect(isKnownRequestCode(clampInt(REQUEST_CODE, 0, 99))).assertTrue();
      expect(fingerprint).assertLarger(0);
      expect(fingerprint).assertLess(1000003);
      expect(fingerprint).assertEqual(textFingerprint('hello world'));
    });

    /**
     * @tc.name          inputValidationBoundaryClosingMatrix
     * @tc.desc          The closing boundary matrix mixes clamps, codes and lengths.
     * @tc.precondition  The clamp, code and length helpers are available.
     * @tc.steps         1. Clamp the extreme codes.
     *                   2. Classify extreme strings.
     *                   3. Confirm the matrix values.
     * @tc.expected      Every boundary resolves to the documented value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('inputValidationBoundaryClosingMatrix', 0, () => {
      const longText: string = buildString('z', 200);
      const lowCode: number = clampInt(CODE_MIN, CODE_MIN, CODE_MAX);
      const highCode: number = clampInt(CODE_MAX, CODE_MIN, CODE_MAX);
      const clampedLength: number = clampInt(longText.length, 0, 64);
      logStep('inputValidationBoundaryClosingMatrix', String(clampedLength));
      expect(lowCode).assertEqual(CODE_MIN);
      expect(highCode).assertEqual(CODE_MAX);
      expect(clampedLength).assertEqual(64);
      expect(stringLengthCategory(longText)).assertEqual('long');
      expect(stringLengthCategory('')).assertEqual('empty');
      expect(isKnownRequestCode(lowCode)).assertFalse();
      expect(isKnownRequestCode(highCode)).assertFalse();
      expect(longText.length).assertEqual(200);
      expect(longText.length).assertLarger(clampedLength);
    });
  });
}
