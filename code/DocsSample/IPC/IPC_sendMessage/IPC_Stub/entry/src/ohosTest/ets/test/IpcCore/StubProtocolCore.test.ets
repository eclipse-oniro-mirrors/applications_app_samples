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
  STUB_DESCRIPTOR,
  STUB_BUNDLE,
  STUB_ABILITY,
  CLIENT_BUNDLE,
  REQUEST_CODE,
  UNKNOWN_CODE_ZERO,
  UNKNOWN_CODE_TWO,
  UNKNOWN_CODE_NEGATIVE,
  UNKNOWN_CODE_LARGE,
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  ERROR_NONE,
  ERROR_STUB_REJECTED,
  ERROR_STUB_NOT_ALIVE,
  ERROR_SEQUENCE_RECLAIMED,
  OPTION_FLAG_SYNC,
  OPTION_FLAG_ASYNC,
  LEVEL_INFO,
  LEVEL_WARN,
  LEVEL_ERROR,
  MessageSequenceModel,
  MessageOptionModel,
  RequestResultModel,
  StubRequestRecord,
  StubRemoteObjectModel,
  InProcessClient,
  StubMetrics,
  joined,
  countOf,
  uniqueStrings,
  sameStringArray,
  textFingerprint,
  clampInt,
  isKnownRequestCode,
  expectedHandled,
  expectedReplyFor,
  expectedDescriptor,
  replayCodes
} from '../Shared/SharedDriver';

export default function stubProtocolTest(): void {
  describe('StubProtocolCore', () => {
    beforeAll(() => {
      logSuite('StubProtocolCore', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('StubProtocolCore', 'end');
    });

    /**
     * @tc.name   stubProtocolDescriptorConstantLiteral
     * @tc.desc   The shared descriptor constant matches the production string.
     * @tc.precondition  The driver module is imported.
     * @tc.steps         1. Read STUB_DESCRIPTOR.
     *                   2. Compare with the production literal.
     *                   3. Compare the character length.
     * @tc.expected      The constant is exactly 'IPCStubTest'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubProtocolDescriptorConstantLiteral', 0, () => {
      expect(STUB_DESCRIPTOR).assertEqual('IPCStubTest');
      expect(STUB_DESCRIPTOR.length).assertEqual(11);
      expect(STUB_DESCRIPTOR.startsWith('IPC')).assertTrue();
      expect(STUB_DESCRIPTOR.endsWith('Test')).assertTrue();
      expect(STUB_DESCRIPTOR.indexOf('Stub')).assertEqual(3);
      expect(expectedDescriptor()).assertEqual(STUB_DESCRIPTOR);
    });

    /**
     * @tc.name   stubProtocolBundleAndAbilityConstants
     * @tc.desc   The module, ability and client bundle constants are distinct.
     * @tc.precondition  The driver module is imported.
     * @tc.steps         1. Read the three constants.
     *                   2. Compare them pairwise.
     *                   3. Check their prefixes.
     * @tc.expected      The constants are stable and mutually distinct.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubProtocolBundleAndAbilityConstants', 0, () => {
      expect(STUB_BUNDLE).assertEqual('com.example.ipc_stub');
      expect(STUB_ABILITY).assertEqual('ServiceAbility');
      expect(CLIENT_BUNDLE).assertEqual('com.example.ipc_client');
      expect(STUB_BUNDLE === CLIENT_BUNDLE).assertFalse();
      expect(STUB_BUNDLE.startsWith('com.example')).assertTrue();
      expect(CLIENT_BUNDLE.endsWith('client')).assertTrue();
      expect(uniqueStrings([STUB_BUNDLE, STUB_ABILITY, CLIENT_BUNDLE]).length).assertEqual(3);
    });

    /**
     * @tc.name   stubProtocolRequestCodeConstant
     * @tc.desc   The accepted request code is the literal one.
     * @tc.precondition  The driver module is imported.
     * @tc.steps         1. Read REQUEST_CODE.
     *                   2. Compare with 1.
     *                   3. Evaluate isKnownRequestCode.
     * @tc.expected      The request code is one and is accepted by the oracle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubProtocolRequestCodeConstant', 0, () => {
      expect(REQUEST_CODE).assertEqual(1);
      expect(REQUEST_CODE).assertLarger(0);
      expect(isKnownRequestCode(REQUEST_CODE)).assertTrue();
      expect(expectedHandled(REQUEST_CODE)).assertTrue();
      expect(UNKNOWN_CODE_ZERO).assertEqual(0);
      expect(UNKNOWN_CODE_ZERO).assertLess(REQUEST_CODE);
    });

    /**
     * @tc.name   stubProtocolUnknownCodeConstantsDistinct
     * @tc.desc   The four unknown code constants are pairwise distinct.
     * @tc.precondition  The driver module is imported.
     * @tc.steps         1. Collect the unknown codes as text.
     *                   2. Deduplicate the list.
     *                   3. Confirm none equals the request code.
     * @tc.expected      Four distinct unknown codes remain.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubProtocolUnknownCodeConstantsDistinct', 0, () => {
      const codes: number[] = [UNKNOWN_CODE_ZERO, UNKNOWN_CODE_TWO, UNKNOWN_CODE_NEGATIVE, UNKNOWN_CODE_LARGE];
      const text: string[] = [];
      for (let index = 0; index < codes.length; index++) {
        text.push(String(codes[index]));
        expect(codes[index] === REQUEST_CODE).assertFalse();
      }
      expect(uniqueStrings(text).length).assertEqual(4);
      expect(countOf(text, '0')).assertEqual(1);
      expect(UNKNOWN_CODE_NEGATIVE).assertLess(0);
      expect(UNKNOWN_CODE_LARGE).assertEqual(99);
      expect(UNKNOWN_CODE_TWO).assertEqual(2);
    });

    /**
     * @tc.name   stubProtocolPayloadConstants
     * @tc.desc   The request and reply payload literals match production.
     * @tc.precondition  The driver module is imported.
     * @tc.steps         1. Read both payload constants.
     *                   2. Compare with the production literals.
     *                   3. Check their lengths and prefixes.
     * @tc.expected      Requests are 'hello world' and replies 'hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubProtocolPayloadConstants', 0, () => {
      expect(REQUEST_PAYLOAD).assertEqual('hello world');
      expect(REPLY_PAYLOAD).assertEqual('hello rpc');
      expect(REQUEST_PAYLOAD.length).assertEqual(11);
      expect(REPLY_PAYLOAD.length).assertEqual(9);
      expect(REQUEST_PAYLOAD.startsWith('hello')).assertTrue();
      expect(REPLY_PAYLOAD.startsWith('hello')).assertTrue();
      expect(REQUEST_PAYLOAD === REPLY_PAYLOAD).assertFalse();
    });

    /**
     * @tc.name   stubProtocolErrorCodeOrdering
     * @tc.desc   The error constants are ordered and non-zero except success.
     * @tc.precondition  The driver module is imported.
     * @tc.steps         1. Read the four error constants.
     *                   2. Compare their ordering.
     *                   3. Confirm the success code is zero.
     * @tc.expected      ERROR_NONE is smallest and the other codes increase.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubProtocolErrorCodeOrdering', 0, () => {
      expect(ERROR_NONE).assertEqual(0);
      expect(ERROR_STUB_REJECTED).assertLarger(ERROR_NONE);
      expect(ERROR_STUB_NOT_ALIVE).assertLarger(ERROR_STUB_REJECTED);
      expect(ERROR_SEQUENCE_RECLAIMED).assertLarger(ERROR_STUB_NOT_ALIVE);
      expect(ERROR_STUB_REJECTED).assertEqual(16000011);
      expect(ERROR_STUB_NOT_ALIVE).assertEqual(16000012);
      expect(ERROR_SEQUENCE_RECLAIMED).assertEqual(16000013);
    });

    /**
     * @tc.name   stubProtocolOptionFlagConstants
     * @tc.desc   The sync and async option flags carry fixed values.
     * @tc.precondition  The driver module is imported.
     * @tc.steps         1. Read both flag constants.
     *                   2. Compare with 0 and 1.
     *                   3. Confirm they differ by one.
     * @tc.expected      Sync is zero and async is one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubProtocolOptionFlagConstants', 0, () => {
      expect(OPTION_FLAG_SYNC).assertEqual(0);
      expect(OPTION_FLAG_ASYNC).assertEqual(1);
      expect(OPTION_FLAG_ASYNC - OPTION_FLAG_SYNC).assertEqual(1);
      expect(OPTION_FLAG_SYNC).assertLess(OPTION_FLAG_ASYNC);
      const syncOption = new MessageOptionModel(OPTION_FLAG_SYNC);
      const asyncOption = new MessageOptionModel(OPTION_FLAG_ASYNC);
      expect(syncOption.flags).assertEqual(OPTION_FLAG_SYNC);
      expect(asyncOption.flags).assertEqual(OPTION_FLAG_ASYNC);
    });

    /**
     * @tc.name   stubProtocolLevelConstantsDistinct
     * @tc.desc   The three log level constants are distinct non-empty strings.
     * @tc.precondition  The driver module is imported.
     * @tc.steps         1. Read the level constants.
     *                   2. Compare them pairwise.
     *                   3. Deduplicate the list.
     * @tc.expected      Three distinct levels exist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubProtocolLevelConstantsDistinct', 0, () => {
      const levels: string[] = [LEVEL_INFO, LEVEL_WARN, LEVEL_ERROR];
      expect(LEVEL_INFO).assertEqual('INFO');
      expect(LEVEL_WARN).assertEqual('WARN');
      expect(LEVEL_ERROR).assertEqual('ERROR');
      expect(uniqueStrings(levels).length).assertEqual(3);
      expect(countOf(levels, LEVEL_INFO)).assertEqual(1);
      expect(LEVEL_INFO.length).assertEqual(4);
      expect(LEVEL_ERROR.length).assertEqual(5);
    });

    /**
     * @tc.name   stubProtocolIsKnownRequestCodeAcceptsOne
     * @tc.desc   isKnownRequestCode accepts exactly the code 1 constant.
     * @tc.precondition  The helper function is imported.
     * @tc.steps         1. Evaluate the helper for code 1.
     *                   2. Compare with the expected boolean.
     *                   3. Guard against a truthy numeric result.
     * @tc.expected      The helper returns true for one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubProtocolIsKnownRequestCodeAcceptsOne', 0, () => {
      const known = isKnownRequestCode(REQUEST_CODE);
      expect(known).assertTrue();
      expect(known).assertEqual(REQUEST_CODE === 1);
      expect(isKnownRequestCode(1)).assertTrue();
      expect(isKnownRequestCode(1.0)).assertTrue();
      expect(isKnownRequestCode(1 + 0)).assertTrue();
      expect(isKnownRequestCode(3 - 2)).assertTrue();
    });

    /**
     * @tc.name   stubProtocolIsKnownRequestCodeRejectsZero
     * @tc.desc   isKnownRequestCode rejects the zero constant.
     * @tc.precondition  The helper function is imported.
     * @tc.steps         1. Evaluate the helper for zero.
     *                   2. Compare with the oracle.
     *                   3. Confirm the boolean is not truthy by accident.
     * @tc.expected      The helper returns false for zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolIsKnownRequestCodeRejectsZero', 0, () => {
      const known = isKnownRequestCode(UNKNOWN_CODE_ZERO);
      expect(known).assertFalse();
      expect(known).assertEqual(expectedHandled(UNKNOWN_CODE_ZERO));
      expect(isKnownRequestCode(0)).assertFalse();
      expect(isKnownRequestCode(2 - 2)).assertFalse();
      expect(UNKNOWN_CODE_ZERO === REQUEST_CODE).assertFalse();
      expect(isKnownRequestCode(REQUEST_CODE)).assertTrue();
    });

    /**
     * @tc.name   stubProtocolIsKnownRequestCodeRejectsOthers
     * @tc.desc   isKnownRequestCode rejects every non-one code in a sweep.
     * @tc.precondition  The helper function is imported.
     * @tc.steps         1. Sweep codes from -2 to 5 except 1.
     *                   2. Count the accepted results.
     *                   3. Confirm a few explicit codes.
     * @tc.expected      Only code 1 is accepted by the sweep.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolIsKnownRequestCodeRejectsOthers', 0, () => {
      let accepted: number[] = [];
      for (let code = -2; code <= 5; code++) {
        if (isKnownRequestCode(code)) {
          accepted.push(code);
        }
      }
      expect(accepted.length).assertEqual(1);
      expect(accepted[0]).assertEqual(REQUEST_CODE);
      expect(isKnownRequestCode(UNKNOWN_CODE_TWO)).assertFalse();
      expect(isKnownRequestCode(UNKNOWN_CODE_NEGATIVE)).assertFalse();
      expect(isKnownRequestCode(UNKNOWN_CODE_LARGE)).assertFalse();
      expect(isKnownRequestCode(10)).assertFalse();
    });

    /**
     * @tc.name   stubProtocolExpectedHandledAcceptsOnlyOne
     * @tc.desc   The handled oracle mirrors the stub for six codes.
     * @tc.precondition  The oracle function is imported.
     * @tc.steps         1. Build a stub and a client.
     *                   2. Send six codes.
     *                   3. Compare each result with the oracle.
     * @tc.expected      The oracle and the stub agree on every code.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolExpectedHandledAcceptsOnlyOne', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const codes: number[] = [REQUEST_CODE, UNKNOWN_CODE_ZERO, UNKNOWN_CODE_TWO, UNKNOWN_CODE_NEGATIVE,
        UNKNOWN_CODE_LARGE, REQUEST_CODE];
      let disagreements = 0;
      for (let index = 0; index < codes.length; index++) {
        const result = client.send(codes[index], REQUEST_PAYLOAD);
        if (result.handled !== expectedHandled(codes[index])) {
          disagreements = disagreements + 1;
        }
      }
      expect(disagreements).assertEqual(0);
      expect(client.results.length).assertEqual(6);
      expect(stub.requestCount()).assertEqual(6);
      expect(StubMetrics.from(stub).handled).assertEqual(2);
      expect(StubMetrics.from(stub).rejected).assertEqual(4);
    });

    /**
     * @tc.name   stubProtocolExpectedReplyOnlyForOne
     * @tc.desc   The reply oracle returns text only for the request code.
     * @tc.precondition  The oracle function is imported.
     * @tc.steps         1. Evaluate the oracle for the request code.
     *                   2. Evaluate it for four unknown codes.
     *                   3. Compare the non-empty results.
     * @tc.expected      Only code 1 maps to the reply literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolExpectedReplyOnlyForOne', 0, () => {
      const replies: string[] = [
        expectedReplyFor(REQUEST_CODE),
        expectedReplyFor(UNKNOWN_CODE_ZERO),
        expectedReplyFor(UNKNOWN_CODE_TWO),
        expectedReplyFor(UNKNOWN_CODE_NEGATIVE),
        expectedReplyFor(UNKNOWN_CODE_LARGE)
      ];
      expect(replies[0]).assertEqual(REPLY_PAYLOAD);
      expect(countOf(replies, '')).assertEqual(4);
      expect(uniqueStrings(replies).length).assertEqual(2);
      expect(replies[1]).assertEqual('');
      expect(replies[4]).assertEqual('');
      expect(joined(replies, ';')).assertEqual('hello rpc;;;;');
    });

    /**
     * @tc.name   stubProtocolExpectedDescriptorMatchesConstant
     * @tc.desc   The descriptor oracle returns the shared constant.
     * @tc.precondition  The oracle function is imported.
     * @tc.steps         1. Call expectedDescriptor twice.
     *                   2. Compare with STUB_DESCRIPTOR.
     *                   3. Build a stub and compare its descriptor.
     * @tc.expected      All descriptor sources agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubProtocolExpectedDescriptorMatchesConstant', 0, () => {
      const first = expectedDescriptor();
      const second = expectedDescriptor();
      const stub = new StubRemoteObjectModel();
      expect(first).assertEqual(STUB_DESCRIPTOR);
      expect(second).assertEqual(first);
      expect(stub.descriptor).assertEqual(first);
      expect(textFingerprint(first)).assertEqual(textFingerprint(STUB_DESCRIPTOR));
      expect(first.length).assertEqual(11);
      expect(first === 'IPCStubTest').assertTrue();
    });

    /**
     * @tc.name   stubProtocolClampIntBelowRange
     * @tc.desc   clampInt raises a value below the lower bound.
     * @tc.precondition  The helper function is imported.
     * @tc.steps         1. Clamp -10 into the range 0 to 100.
     *                   2. Compare with the low bound.
     *                   3. Clamp the exact low bound again.
     * @tc.expected      The result is the lower bound.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolClampIntBelowRange', 0, () => {
      expect(clampInt(-10, 0, 100)).assertEqual(0);
      expect(clampInt(UNKNOWN_CODE_NEGATIVE, 0, 1)).assertEqual(0);
      expect(clampInt(0, 0, 100)).assertEqual(0);
      expect(clampInt(-10, 0, 100)).assertLess(1);
      expect(clampInt(-10, 0, 100)).assertLarger(-1);
      expect(clampInt(-1000, 5, 9)).assertEqual(5);
    });

    /**
     * @tc.name   stubProtocolClampIntAboveRange
     * @tc.desc   clampInt lowers a value above the upper bound.
     * @tc.precondition  The helper function is imported.
     * @tc.steps         1. Clamp 999 into the range 0 to 100.
     *                   2. Compare with the high bound.
     *                   3. Clamp the exact high bound again.
     * @tc.expected      The result is the upper bound.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolClampIntAboveRange', 0, () => {
      expect(clampInt(999, 0, 100)).assertEqual(100);
      expect(clampInt(UNKNOWN_CODE_LARGE, 0, 1)).assertEqual(1);
      expect(clampInt(100, 0, 100)).assertEqual(100);
      expect(clampInt(999, 0, 100)).assertLess(1000);
      expect(clampInt(53, 0, 53)).assertEqual(53);
      expect(clampInt(54, 0, 53)).assertEqual(53);
    });

    /**
     * @tc.name   stubProtocolClampIntInsideRange
     * @tc.desc   clampInt returns an in-range value untouched.
     * @tc.precondition  The helper function is imported.
     * @tc.steps         1. Clamp 42 into the range 0 to 100.
     *                   2. Clamp a request code into 0 to 10.
     *                   3. Compare with the original values.
     * @tc.expected      In-range values pass through unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolClampIntInsideRange', 0, () => {
      expect(clampInt(42, 0, 100)).assertEqual(42);
      expect(clampInt(REQUEST_CODE, 0, 10)).assertEqual(REQUEST_CODE);
      expect(clampInt(50, 50, 50)).assertEqual(50);
      expect(clampInt(37, 0, 100)).assertEqual(37);
      expect(clampInt(1, 1, 2)).assertEqual(1);
      expect(clampInt(2, 1, 2)).assertEqual(2);
      expect(clampInt(REPLY_PAYLOAD.length, 0, 20)).assertEqual(9);
    });

    /**
     * @tc.name   stubProtocolJoinedEmptyList
     * @tc.desc   joined returns an empty string for an empty list.
     * @tc.precondition  The helper function is imported.
     * @tc.steps         1. Join an empty string array.
     *                   2. Join with and without a separator argument.
     *                   3. Compare both results.
     * @tc.expected      Both joins yield an empty string.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolJoinedEmptyList', 0, () => {
      const empty: string[] = [];
      expect(joined(empty)).assertEqual('');
      expect(joined(empty, '|')).assertEqual('');
      expect(joined(empty).length).assertEqual(0);
      expect(joined(empty, ',')).assertEqual('');
      expect(countOf(empty, '')).assertEqual(0);
    });

    /**
     * @tc.name   stubProtocolJoinedSingleValue
     * @tc.desc   joined returns the value itself for a one-element list.
     * @tc.precondition  The helper function is imported.
     * @tc.steps         1. Join a single-element list.
     *                   2. Join it with a custom separator.
     *                   3. Compare with the element.
     * @tc.expected      No separator appears in the result.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolJoinedSingleValue', 0, () => {
      const single: string[] = [REPLY_PAYLOAD];
      expect(joined(single)).assertEqual(REPLY_PAYLOAD);
      expect(joined(single, ',')).assertEqual(REPLY_PAYLOAD);
      expect(joined(single).indexOf(',')).assertEqual(-1);
      expect(joined(single, '|').indexOf('|')).assertEqual(-1);
      expect(joined(single).length).assertEqual(REPLY_PAYLOAD.length);
      expect(countOf(single, REPLY_PAYLOAD)).assertEqual(1);
    });

    /**
     * @tc.name   stubProtocolJoinedMultipleValues
     * @tc.desc   joined inserts the separator between each pair of values.
     * @tc.precondition  The helper function is imported.
     * @tc.steps         1. Join a four-element list with the default separator.
     *                   2. Split the result.
     *                   3. Compare the parts.
     * @tc.expected      The result is comma separated in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolJoinedMultipleValues', 0, () => {
      const values: string[] = ['a', 'b', 'c', 'd'];
      const text = joined(values);
      const parts = text.split(',');
      expect(text).assertEqual('a,b,c,d');
      expect(parts.length).assertEqual(4);
      expect(parts[0]).assertEqual('a');
      expect(parts[3]).assertEqual('d');
      expect(text.length).assertEqual(7);
      expect(countOf(parts, 'b')).assertEqual(1);
    });

    /**
     * @tc.name   stubProtocolJoinedCustomSeparator
     * @tc.desc   joined honours a custom multi-character separator.
     * @tc.precondition  The helper function is imported.
     * @tc.steps         1. Join three request-like tokens with ' -> '.
     *                   2. Split the result back.
     *                   3. Confirm order and separator count.
     * @tc.expected      The custom separator appears exactly twice.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolJoinedCustomSeparator', 0, () => {
      const values: string[] = ['send', 'handle', 'reply'];
      const text = joined(values, ' -> ');
      expect(text).assertEqual('send -> handle -> reply');
      expect(text.split(' -> ').length).assertEqual(3);
      expect(text.indexOf(' -> ')).assertEqual(4);
      expect(text.lastIndexOf(' -> ')).assertEqual(14);
      expect(text.startsWith('send')).assertTrue();
      expect(text.endsWith('reply')).assertTrue();
    });

    /**
     * @tc.name   stubProtocolCountOfMissingValue
     * @tc.desc   countOf returns zero when the target is absent.
     * @tc.precondition  The helper function is imported.
     * @tc.steps         1. Count a missing token in a three-element list.
     *                   2. Count the empty string in a non-empty list.
     *                   3. Compare both counts with zero.
     * @tc.expected      Missing values count as zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolCountOfMissingValue', 0, () => {
      const values: string[] = ['onCreate', 'onConnect', 'onDestroy'];
      expect(countOf(values, 'onRequest')).assertEqual(0);
      expect(countOf(values, '')).assertEqual(0);
      expect(countOf(values, 'oncreate')).assertEqual(0);
      expect(countOf(values, 'onDisconnect')).assertEqual(0);
      expect(countOf([], 'onCreate')).assertEqual(0);
      expect(countOf(values, 'onConnect')).assertEqual(1);
    });

    /**
     * @tc.name   stubProtocolCountOfRepeatedValue
     * @tc.desc   countOf reports every duplicate occurrence.
     * @tc.precondition  The helper function is imported.
     * @tc.steps         1. Count a token repeated three times.
     *                   2. Count a token repeated once.
     *                   3. Compare the total with the list length.
     * @tc.expected      The counts sum to the list length.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolCountOfRepeatedValue', 0, () => {
      const values: string[] = ['x', 'y', 'x', 'z', 'x', 'y'];
      expect(countOf(values, 'x')).assertEqual(3);
      expect(countOf(values, 'y')).assertEqual(2);
      expect(countOf(values, 'z')).assertEqual(1);
      expect(countOf(values, 'x') + countOf(values, 'y') + countOf(values, 'z')).assertEqual(values.length);
      expect(countOf(values, 'x')).assertLarger(countOf(values, 'y'));
      expect(countOf(values, 'z')).assertLess(countOf(values, 'x'));
    });

    /**
     * @tc.name   stubProtocolUniqueStringsPreservesFirstOrder
     * @tc.desc   uniqueStrings keeps the order of first appearance.
     * @tc.precondition  The helper function is imported.
     * @tc.steps         1. Deduplicate a list with interleaved repeats.
     *                   2. Compare with the expected order.
     *                   3. Confirm the length.
     * @tc.expected      The result is ['b', 'a', 'c'].
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolUniqueStringsPreservesFirstOrder', 0, () => {
      const values: string[] = ['b', 'a', 'b', 'c', 'a', 'b'];
      const distinct = uniqueStrings(values);
      expect(distinct.length).assertEqual(3);
      expect(joined(distinct)).assertEqual('b,a,c');
      expect(distinct[0]).assertEqual('b');
      expect(distinct[2]).assertEqual('c');
      expect(sameStringArray(distinct, ['b', 'a', 'c'])).assertTrue();
      expect(sameStringArray(distinct, ['a', 'b', 'c'])).assertFalse();
    });

    /**
     * @tc.name   stubProtocolUniqueStringsEmptyInput
     * @tc.desc   uniqueStrings returns an empty array for empty input.
     * @tc.precondition  The helper function is imported.
     * @tc.steps         1. Deduplicate an empty list.
     *                   2. Read the length and joined form.
     *                   3. Deduplicate a one-element list.
     * @tc.expected      Empty input stays empty and singletons are preserved.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolUniqueStringsEmptyInput', 0, () => {
      const empty = uniqueStrings([]);
      const single = uniqueStrings(['only']);
      expect(empty.length).assertEqual(0);
      expect(joined(empty)).assertEqual('');
      expect(single.length).assertEqual(1);
      expect(single[0]).assertEqual('only');
      expect(uniqueStrings(['only', 'only']).length).assertEqual(1);
      expect(uniqueStrings(['only', 'only', 'other']).length).assertEqual(2);
    });

    /**
     * @tc.name   stubProtocolSameStringArrayEqual
     * @tc.desc   sameStringArray accepts equal arrays in the same order.
     * @tc.precondition  The helper function is imported.
     * @tc.steps         1. Compare two independently built equal arrays.
     *                   2. Compare an array with itself.
     *                   3. Compare two empty arrays.
     * @tc.expected      All three comparisons are true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolSameStringArrayEqual', 0, () => {
      const left: string[] = ['a', 'b', 'c'];
      const right: string[] = ['a', 'b', 'c'];
      expect(sameStringArray(left, right)).assertTrue();
      expect(sameStringArray(left, left)).assertTrue();
      expect(sameStringArray([], [])).assertTrue();
      expect(sameStringArray([REPLY_PAYLOAD], [REPLY_PAYLOAD])).assertTrue();
      expect(sameStringArray(uniqueStrings(['a', 'a', 'b']), ['a', 'b'])).assertTrue();
      expect(sameStringArray(left, uniqueStrings(left))).assertTrue();
    });

    /**
     * @tc.name   stubProtocolSameStringArrayLengthMismatch
     * @tc.desc   sameStringArray rejects arrays of different lengths.
     * @tc.precondition  The helper function is imported.
     * @tc.steps         1. Compare a two-element and a three-element array.
     *                   2. Compare an empty array with a singleton.
     *                   3. Confirm the shared prefix does not matter.
     * @tc.expected      Length mismatches return false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolSameStringArrayLengthMismatch', 0, () => {
      expect(sameStringArray(['a', 'b'], ['a', 'b', 'c'])).assertFalse();
      expect(sameStringArray([], ['a'])).assertFalse();
      expect(sameStringArray(['a'], [])).assertFalse();
      expect(sameStringArray(['a', 'b'], ['a'])).assertFalse();
      expect(sameStringArray(['a'], ['a', 'b'])).assertFalse();
      expect(sameStringArray(['a', 'b'], ['a', 'b'])).assertTrue();
    });

    /**
     * @tc.name   stubProtocolSameStringArrayElementMismatch
     * @tc.desc   sameStringArray is order sensitive and value exact.
     * @tc.precondition  The helper function is imported.
     * @tc.steps         1. Compare equal-length arrays with swapped values.
     *                   2. Compare arrays differing in case.
     *                   3. Compare arrays differing in one position.
     * @tc.expected      Every mismatch returns false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolSameStringArrayElementMismatch', 0, () => {
      expect(sameStringArray(['a', 'b'], ['b', 'a'])).assertFalse();
      expect(sameStringArray(['INFO'], ['info'])).assertFalse();
      expect(sameStringArray(['x', 'y', 'z'], ['x', 'y', 'w'])).assertFalse();
      expect(sameStringArray([REQUEST_PAYLOAD], [REPLY_PAYLOAD])).assertFalse();
      expect(sameStringArray(['1', '2'], ['1'])).assertFalse();
      expect(sameStringArray(['1', '2'], ['1', '2'])).assertTrue();
    });

    /**
     * @tc.name   stubProtocolFingerprintDeterministic
     * @tc.desc   textFingerprint returns the same value for equal text.
     * @tc.precondition  The helper function is imported.
     * @tc.steps         1. Fingerprint the reply literal twice.
     *                   2. Fingerprint two independently built equal strings.
     *                   3. Compare all three values.
     * @tc.expected      Equal text always yields an equal fingerprint.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolFingerprintDeterministic', 0, () => {
      const first = textFingerprint(REPLY_PAYLOAD);
      const second = textFingerprint('hello rpc');
      const third = textFingerprint('hello' + ' ' + 'rpc');
      expect(first).assertEqual(second);
      expect(second).assertEqual(third);
      expect(first).assertLarger(-1);
      expect(first).assertLess(1000003);
      expect(textFingerprint(REQUEST_PAYLOAD)).assertEqual(textFingerprint('hello world'));
    });

    /**
     * @tc.name   stubProtocolFingerprintDiffersForDifferentText
     * @tc.desc   Different text yields different fingerprints in a sample set.
     * @tc.precondition  The helper function is imported.
     * @tc.steps         1. Fingerprint request and reply payloads.
     *                   2. Fingerprint three lifecycle event names.
     *                   3. Count the distinct fingerprints.
     * @tc.expected      All sampled fingerprints are distinct.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolFingerprintDiffersForDifferentText', 0, () => {
      const samples: string[] = [REQUEST_PAYLOAD, REPLY_PAYLOAD, 'onCreate', 'onConnect', 'onDestroy'];
      const prints: string[] = [];
      for (let index = 0; index < samples.length; index++) {
        prints.push(String(textFingerprint(samples[index])));
      }
      expect(uniqueStrings(prints).length).assertEqual(samples.length);
      expect(textFingerprint(REQUEST_PAYLOAD) === textFingerprint(REPLY_PAYLOAD)).assertFalse();
      expect(textFingerprint('a') === textFingerprint('b')).assertFalse();
      expect(textFingerprint('ab') === textFingerprint('ba')).assertFalse();
      expect(prints.length).assertEqual(5);
    });

    /**
     * @tc.name   stubProtocolFingerprintEmptyString
     * @tc.desc   The empty string has a stable non-zero fingerprint seed.
     * @tc.precondition  The helper function is imported.
     * @tc.steps         1. Fingerprint the empty string.
     *                   2. Compare with the documented seed 216613.
     *                   3. Compare two calls.
     * @tc.expected      The empty fingerprint is the constant seed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolFingerprintEmptyString', 0, () => {
      expect(textFingerprint('')).assertEqual(216613);
      expect(textFingerprint('')).assertEqual(textFingerprint(''));
      expect(textFingerprint('')).assertLarger(0);
      expect(textFingerprint(' ')).assertLarger(0);
      expect(textFingerprint(' ') === textFingerprint('')).assertFalse();
      expect(textFingerprint('')).assertLess(1000003);
    });

    /**
     * @tc.name   stubProtocolFingerprintStaysInRange
     * @tc.desc   Fingerprints stay inside the documented modulus range.
     * @tc.precondition  The helper function is imported.
     * @tc.steps         1. Fingerprint a long repeated string.
     *                   2. Fingerprint each lifecycle event name.
     *                   3. Check every value against the range.
     * @tc.expected      Every fingerprint is between 0 and 1000002.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolFingerprintStaysInRange', 0, () => {
      let long = '';
      for (let index = 0; index < 40; index++) {
        long = long + 'ipc';
      }
      const samples: string[] = [long, 'onCreate', 'onRequest', 'onConnect', 'onDisconnect', 'onDestroy'];
      for (let index = 0; index < samples.length; index++) {
        const value = textFingerprint(samples[index]);
        expect(value).assertLarger(-1);
        expect(value).assertLess(1000003);
      }
      expect(samples.length).assertEqual(6);
      expect(long.length).assertEqual(120);
      expect(textFingerprint(samples[0])).assertEqual(textFingerprint(long));
    });

    /**
     * @tc.name   stubProtocolOptionDefaultDescribe
     * @tc.desc   The default option describes as synchronous with no wait.
     * @tc.precondition  The driver module is imported.
     * @tc.steps         1. Build a default option.
     *                   2. Read its description.
     *                   3. Split the description.
     * @tc.expected      The description is '0/0/false'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubProtocolOptionDefaultDescribe', 0, () => {
      const option = new MessageOptionModel();
      const parts = option.describe().split('/');
      expect(option.describe()).assertEqual('0/0/false');
      expect(parts.length).assertEqual(3);
      expect(parts[0]).assertEqual('0');
      expect(parts[1]).assertEqual('0');
      expect(parts[2]).assertEqual('false');
      expect(option.isSync()).assertTrue();
      expect(option.flags).assertEqual(OPTION_FLAG_SYNC);
    });

    /**
     * @tc.name   stubProtocolOptionCustomDescribe
     * @tc.desc   A custom option reports its flag, wait time and sync flag.
     * @tc.precondition  The driver module is imported.
     * @tc.steps         1. Build an option with flag 1 and wait 10.
     *                   2. Read its description.
     *                   3. Compare each field.
     * @tc.expected      The description is '1/10/false'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubProtocolOptionCustomDescribe', 0, () => {
      const option = new MessageOptionModel(1, 10, false);
      expect(option.describe()).assertEqual('1/10/false');
      expect(option.flags).assertEqual(1);
      expect(option.waitTime).assertEqual(10);
      expect(option.sync).assertFalse();
      expect(option.describe().split('/')[1]).assertEqual('10');
      expect(option.describe().length).assertEqual(10);
    });

    /**
     * @tc.name   stubProtocolOptionAsyncIsNotSync
     * @tc.desc   An async option reports isSync false.
     * @tc.precondition  The driver module is imported.
     * @tc.steps         1. Build an async option with a wait time.
     *                   2. Evaluate isSync.
     *                   3. Compare with a default option.
     * @tc.expected      The async option is not synchronous.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolOptionAsyncIsNotSync', 0, () => {
      const asyncOption = new MessageOptionModel(OPTION_FLAG_ASYNC, 30, false);
      const defaultOption = new MessageOptionModel();
      expect(asyncOption.isSync()).assertFalse();
      expect(defaultOption.isSync()).assertTrue();
      expect(asyncOption.isSync() === defaultOption.isSync()).assertFalse();
      expect(asyncOption.flags).assertLarger(defaultOption.flags);
      expect(asyncOption.waitTime).assertLarger(defaultOption.waitTime);
      expect(asyncOption.describe().startsWith('1/30')).assertTrue();
    });

    /**
     * @tc.name   stubProtocolOptionSyncFlagIsSync
     * @tc.desc   The sync flag makes isSync true regardless of the wait time.
     * @tc.precondition  The driver module is imported.
     * @tc.steps         1. Build a sync option with a large wait time.
     *                   2. Build an option with the sync field set.
     *                   3. Evaluate both.
     * @tc.expected      The sync flag wins over the wait time.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolOptionSyncFlagIsSync', 0, () => {
      const slowSync = new MessageOptionModel(OPTION_FLAG_SYNC, 500, false);
      const forcedSync = new MessageOptionModel(OPTION_FLAG_ASYNC, 0, true);
      expect(slowSync.isSync()).assertTrue();
      expect(forcedSync.isSync()).assertTrue();
      expect(slowSync.waitTime).assertEqual(500);
      expect(forcedSync.flags).assertEqual(OPTION_FLAG_ASYNC);
      expect(slowSync.describe()).assertEqual('0/500/false');
      expect(forcedSync.describe()).assertEqual('1/0/true');
    });

    /**
     * @tc.name   stubProtocolResultSuccessPredicate
     * @tc.desc   RequestResultModel.isSuccess requires zero error and handled.
     * @tc.precondition  The driver module is imported.
     * @tc.steps         1. Build a successful result.
     *                   2. Build a result with a zero error but no handling.
     *                   3. Compare both predicates.
     * @tc.expected      Only the fully handled result is a success.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolResultSuccessPredicate', 0, () => {
      const success = new RequestResultModel(ERROR_NONE, REPLY_PAYLOAD, true);
      const partial = new RequestResultModel(ERROR_NONE, REPLY_PAYLOAD, false);
      expect(success.isSuccess()).assertTrue();
      expect(partial.isSuccess()).assertFalse();
      expect(success.errCode).assertEqual(0);
      expect(success.handled).assertTrue();
      expect(success.replyText).assertEqual(REPLY_PAYLOAD);
      expect(success.isSuccess() === partial.isSuccess()).assertFalse();
    });

    /**
     * @tc.name   stubProtocolResultFailurePredicate
     * @tc.desc   A non-zero error code always fails the success predicate.
     * @tc.precondition  The driver module is imported.
     * @tc.steps         1. Build a result with the rejection code.
     *                   2. Build a result with the not-alive code.
     *                   3. Compare both predicates.
     * @tc.expected      Both results report failure.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolResultFailurePredicate', 0, () => {
      const rejected = new RequestResultModel(ERROR_STUB_REJECTED, '', false);
      const notAlive = new RequestResultModel(ERROR_STUB_NOT_ALIVE, '', true);
      const reclaimed = new RequestResultModel(ERROR_SEQUENCE_RECLAIMED, 'x', true);
      expect(rejected.isSuccess()).assertFalse();
      expect(notAlive.isSuccess()).assertFalse();
      expect(reclaimed.isSuccess()).assertFalse();
      expect(rejected.errCode).assertEqual(16000011);
      expect(notAlive.errCode).assertLarger(rejected.errCode);
      expect(reclaimed.errCode).assertLarger(notAlive.errCode);
    });

    /**
     * @tc.name   stubProtocolResultDefaultReplyEmpty
     * @tc.desc   The reply text defaults to an empty string.
     * @tc.precondition  The driver module is imported.
     * @tc.steps         1. Build a result with only an error code.
     *                   2. Read the reply and handled fields.
     *                   3. Build a result with only a reply text.
     * @tc.expected      Omitted fields carry their defaults.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolResultDefaultReplyEmpty', 0, () => {
      const errorOnly = new RequestResultModel(ERROR_STUB_REJECTED);
      const textOnly = new RequestResultModel(ERROR_NONE, 'payload');
      expect(errorOnly.replyText).assertEqual('');
      expect(errorOnly.handled).assertFalse();
      expect(errorOnly.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(textOnly.handled).assertFalse();
      expect(textOnly.isSuccess()).assertFalse();
      expect(textOnly.replyText.length).assertEqual(7);
    });

    /**
     * @tc.name   stubProtocolRecordDescribeShape
     * @tc.desc   StubRequestRecord.describe joins code, text, reply and flag.
     * @tc.precondition  The driver module is imported.
     * @tc.steps         1. Build an accepted record.
     *                   2. Read its description.
     *                   3. Build a rejected record and compare.
     * @tc.expected      Both descriptions follow the four-field shape.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolRecordDescribeShape', 0, () => {
      const accepted = new StubRequestRecord(REQUEST_CODE, REQUEST_PAYLOAD, REPLY_PAYLOAD, true, '0/0/false');
      const rejected = new StubRequestRecord(UNKNOWN_CODE_TWO, '', '', false, '1/5/false');
      expect(accepted.describe()).assertEqual('1/hello world/hello rpc/true');
      expect(rejected.describe()).assertEqual('2///false');
      expect(accepted.describe().split('/').length).assertEqual(4);
      expect(rejected.describe().split('/').length).assertEqual(4);
      expect(accepted.code).assertEqual(REQUEST_CODE);
      expect(rejected.option).assertEqual('1/5/false');
      expect(accepted.describe() === rejected.describe()).assertFalse();
    });

    /**
     * @tc.name   stubProtocolMetricsRatioHalf
     * @tc.desc   StubMetrics.successRatio divides handled by requests.
     * @tc.precondition  A stub with two accepted and two rejected requests.
     * @tc.steps         1. Send a mixed run.
     *                   2. Build metrics.
     *                   3. Compare the ratio with 0.5.
     * @tc.expected      The ratio is one half.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolMetricsRatioHalf', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_ZERO, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_LARGE, REQUEST_PAYLOAD);
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(4);
      expect(metrics.handled).assertEqual(2);
      expect(metrics.rejected).assertEqual(2);
      expect(metrics.successRatio()).assertEqual(0.5);
      expect(metrics.successRatio()).assertLarger(0);
      expect(metrics.successRatio()).assertLess(1);
    });

    /**
     * @tc.name   stubProtocolMetricsRepliesOnlyHandled
     * @tc.desc   The replies counter only counts handled records with text.
     * @tc.precondition  A stub with one accepted and one rejected request.
     * @tc.steps         1. Send code 1 and code 2.
     *                   2. Build metrics.
     *                   3. Compare replies with handled.
     * @tc.expected      One reply is counted for the single handled request.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolMetricsRepliesOnlyHandled', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      const metrics = StubMetrics.from(stub);
      expect(metrics.handled).assertEqual(1);
      expect(metrics.replies).assertEqual(1);
      expect(metrics.replies).assertEqual(metrics.handled);
      expect(metrics.rejected).assertEqual(1);
      expect(metrics.replies).assertLess(metrics.requests);
      expect(metrics.successRatio()).assertEqual(0.5);
    });

    /**
     * @tc.name   stubProtocolMetricsFingerprintDeterministic
     * @tc.desc   Equal metric fields yield equal fingerprints.
     * @tc.precondition  Two stubs driven with the same codes.
     * @tc.steps         1. Replay three codes on both stubs.
     *                   2. Build metrics for both.
     *                   3. Compare the fingerprints and counters.
     * @tc.expected      Both metric fingerprints are equal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolMetricsFingerprintDeterministic', 0, () => {
      const left = new StubRemoteObjectModel();
      const right = new StubRemoteObjectModel();
      replayCodes(left, [REQUEST_CODE, UNKNOWN_CODE_TWO, REQUEST_CODE]);
      replayCodes(right, [REQUEST_CODE, UNKNOWN_CODE_TWO, REQUEST_CODE]);
      const leftMetrics = StubMetrics.from(left);
      const rightMetrics = StubMetrics.from(right);
      expect(leftMetrics.fingerprint()).assertEqual(rightMetrics.fingerprint());
      expect(leftMetrics.handled).assertEqual(rightMetrics.handled);
      expect(leftMetrics.rejected).assertEqual(rightMetrics.rejected);
      expect(leftMetrics.replies).assertEqual(rightMetrics.replies);
      expect(leftMetrics.fingerprint()).assertEqual(textFingerprint('3:2:1:2'));
      expect(leftMetrics.fingerprint()).assertLarger(0);
    });

    /**
     * @tc.name   stubProtocolMetricsFromEmptyStub
     * @tc.desc   Metrics of a fresh stub are all zero.
     * @tc.precondition  A stub with no requests.
     * @tc.steps         1. Build metrics from the fresh stub.
     *                   2. Read every counter.
     *                   3. Compare the ratio with zero.
     * @tc.expected      The empty metrics state is fully zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolMetricsFromEmptyStub', 0, () => {
      const metrics = StubMetrics.from(new StubRemoteObjectModel());
      expect(metrics.requests).assertEqual(0);
      expect(metrics.handled).assertEqual(0);
      expect(metrics.rejected).assertEqual(0);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('0:0:0:0'));
    });

    /**
     * @tc.name   stubProtocolSequenceWriteRead
     * @tc.desc   A sequence returns strings in write order until drained.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Write three strings.
     *                   2. Read them back one by one.
     *                   3. Read once more past the end.
     * @tc.expected      Values come back in order and the drained read is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolSequenceWriteRead', 0, () => {
      const sequence = MessageSequenceModel.create();
      expect(sequence.writeString('a')).assertTrue();
      expect(sequence.writeString('b')).assertTrue();
      expect(sequence.writeString('c')).assertTrue();
      expect(sequence.size()).assertEqual(3);
      expect(sequence.readString()).assertEqual('a');
      expect(sequence.readString()).assertEqual('b');
      expect(sequence.readString()).assertEqual('c');
      expect(sequence.readString()).assertEqual('');
    });

    /**
     * @tc.name   stubProtocolSequenceRewind
     * @tc.desc   rewind resets the cursor without clearing the values.
     * @tc.precondition  A sequence with two values read once.
     * @tc.steps         1. Write two values and read both.
     *                   2. Rewind the sequence.
     *                   3. Read the first value again.
     * @tc.expected      The cursor returns to zero and values are preserved.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolSequenceRewind', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString(REQUEST_PAYLOAD);
      sequence.writeString(REPLY_PAYLOAD);
      sequence.readString();
      sequence.readString();
      expect(sequence.cursor).assertEqual(2);
      sequence.rewind();
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.size()).assertEqual(2);
      expect(sequence.readString()).assertEqual(REQUEST_PAYLOAD);
      expect(sequence.readCount).assertEqual(3);
      expect(sequence.writeCount).assertEqual(2);
    });

    /**
     * @tc.name   stubProtocolSequenceReclaimBlocksWrite
     * @tc.desc   A reclaimed sequence rejects further writes.
     * @tc.precondition  A sequence that was reclaimed.
     * @tc.steps         1. Write one value then reclaim.
     *                   2. Attempt another write.
     *                   3. Inspect the size and write counter.
     * @tc.expected      The post-reclaim write fails and the size is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolSequenceReclaimBlocksWrite', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString(REQUEST_PAYLOAD);
      sequence.reclaim();
      expect(sequence.reclaimed).assertTrue();
      expect(sequence.writeString(REPLY_PAYLOAD)).assertFalse();
      expect(sequence.size()).assertEqual(1);
      expect(sequence.writeCount).assertEqual(1);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.values[0]).assertEqual(REQUEST_PAYLOAD);
    });

    /**
     * @tc.name   stubProtocolSequenceReclaimBlocksRead
     * @tc.desc   A reclaimed sequence returns empty strings when read.
     * @tc.precondition  A sequence holding one value that was reclaimed.
     * @tc.steps         1. Write one value and reclaim the sequence.
     *                   2. Read the sequence.
     *                   3. Inspect the read counter.
     * @tc.expected      The reclaimed read is empty and is not counted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolSequenceReclaimBlocksRead', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString(REQUEST_PAYLOAD);
      sequence.reclaim();
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readCount).assertEqual(0);
      expect(sequence.reclaimed).assertTrue();
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.size()).assertEqual(1);
      expect(sequence.trace()).assertEqual('hello world#0');
    });

    /**
     * @tc.name   stubProtocolSequenceTrace
     * @tc.desc   The sequence trace joins values and appends the cursor.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Read the trace of an empty sequence.
     *                   2. Write two values and read one.
     *                   3. Read the trace again.
     * @tc.expected      The trace shows values and the cursor after '#'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolSequenceTrace', 0, () => {
      const sequence = MessageSequenceModel.create();
      expect(sequence.trace()).assertEqual('#0');
      sequence.writeString('x');
      sequence.writeString('y');
      expect(sequence.trace()).assertEqual('x|y#0');
      sequence.readString();
      expect(sequence.trace()).assertEqual('x|y#1');
      expect(sequence.trace().endsWith('#1')).assertTrue();
      expect(sequence.trace().split('|').length).assertEqual(2);
      expect(sequence.trace().indexOf('#')).assertEqual(3);
    });

    /**
     * @tc.name   stubProtocolReplayCodesEmptyList
     * @tc.desc   Replaying an empty code list performs no requests.
     * @tc.precondition  A fresh stub.
     * @tc.steps         1. Replay an empty list.
     *                   2. Read the stub ledger and client state.
     *                   3. Build metrics.
     * @tc.expected      The stub and the client remain empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolReplayCodesEmptyList', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = replayCodes(stub, []);
      expect(stub.requestCount()).assertEqual(0);
      expect(client.sentCodes.length).assertEqual(0);
      expect(client.results.length).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
      expect(client.trace()).assertEqual('');
      expect(StubMetrics.from(stub).requests).assertEqual(0);
    });

    /**
     * @tc.name   stubProtocolReplayCodesHandledCount
     * @tc.desc   Replaying a mixed list yields the expected handled count.
     * @tc.precondition  A fresh stub.
     * @tc.steps         1. Replay five codes including two accepted.
     *                   2. Count the successful results.
     *                   3. Compare with the metrics.
     * @tc.expected      Two results are successful.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolReplayCodesHandledCount', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = replayCodes(stub, [REQUEST_CODE, UNKNOWN_CODE_TWO, REQUEST_CODE, UNKNOWN_CODE_ZERO,
        UNKNOWN_CODE_LARGE]);
      let successes = 0;
      for (let index = 0; index < client.results.length; index++) {
        if (client.results[index].isSuccess()) {
          successes = successes + 1;
        }
      }
      expect(successes).assertEqual(2);
      expect(StubMetrics.from(stub).handled).assertEqual(2);
      expect(StubMetrics.from(stub).rejected).assertEqual(3);
      expect(client.sentCodes.length).assertEqual(5);
      expect(client.trace()).assertEqual('hello rpc|hello rpc');
      expect(stub.requestCount()).assertEqual(5);
    });

    /**
     * @tc.name   stubProtocolReplayCodesReturnsClient
     * @tc.desc   replayCodes returns a client bound to the supplied stub.
     * @tc.precondition  A fresh stub.
     * @tc.steps         1. Replay two codes.
     *                   2. Compare the client stub with the input stub.
     *                   3. Read the sent text ledger.
     * @tc.expected      The returned client wraps the same stub instance.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolReplayCodesReturnsClient', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = replayCodes(stub, [REQUEST_CODE, UNKNOWN_CODE_TWO]);
      expect(client.stub).assertEqual(stub);
      expect(client.sentTexts.length).assertEqual(2);
      expect(client.sentTexts[0]).assertEqual(REQUEST_PAYLOAD);
      expect(client.sentTexts[1]).assertEqual(REQUEST_PAYLOAD);
      expect(client.results[0].errCode).assertEqual(ERROR_NONE);
      expect(client.results[1].errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(client.replies.length).assertEqual(1);
    });

    /**
     * @tc.name   stubProtocolStubDefaultState
     * @tc.desc   A fresh stub has the documented protocol defaults.
     * @tc.precondition  No stub methods have been called.
     * @tc.steps         1. Build a stub.
     *                   2. Read descriptor, reply text and counters.
     *                   3. Read the reject list and alive flag.
     * @tc.expected      The stub starts alive with the production defaults.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubProtocolStubDefaultState', 0, () => {
      const stub = new StubRemoteObjectModel();
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.alive).assertTrue();
      expect(stub.requestCount()).assertEqual(0);
      expect(stub.lastRequest()).assertUndefined();
      expect(stub.rejectCodes.length).assertEqual(0);
      expect(stub.requests.length).assertEqual(0);
    });

    /**
     * @tc.name   stubProtocolStubResetDefaults
     * @tc.desc   reset restores the stub protocol defaults after mutation.
     * @tc.precondition  A stub with mutated reply text, reject list and state.
     * @tc.steps         1. Mutate every stub field.
     *                   2. Reset the stub.
     *                   3. Compare against a fresh stub.
     * @tc.expected      The reset stub matches a fresh stub.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolStubResetDefaults', 0, () => {
      const stub = new StubRemoteObjectModel('custom');
      stub.replyText = 'changed';
      stub.rejectCodes.push(REQUEST_CODE);
      stub.kill();
      stub.reset();
      const fresh = new StubRemoteObjectModel();
      expect(stub.descriptor).assertEqual('custom');
      expect(stub.replyText).assertEqual(fresh.replyText);
      expect(stub.alive).assertEqual(fresh.alive);
      expect(stub.rejectCodes.length).assertEqual(0);
      expect(stub.requestCount()).assertEqual(0);
      expect(stub.descriptor === fresh.descriptor).assertFalse();
    });

    /**
     * @tc.name   stubProtocolSequenceCountersAfterMixedUse
     * @tc.desc   Write and read counters track mixed sequence usage.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Write two values and read one.
     *                   2. Write a third value and rewind.
     *                   3. Read all three values.
     * @tc.expected      The counters reflect every successful operation.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolSequenceCountersAfterMixedUse', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('a');
      sequence.writeString('b');
      sequence.readString();
      sequence.writeString('c');
      sequence.rewind();
      expect(sequence.writeCount).assertEqual(3);
      expect(sequence.readCount).assertEqual(1);
      expect(sequence.size()).assertEqual(3);
      expect(sequence.readString()).assertEqual('a');
      expect(sequence.readString()).assertEqual('b');
      expect(sequence.readString()).assertEqual('c');
      expect(sequence.cursor).assertEqual(3);
    });

    /**
     * @tc.name   stubProtocolSequencesIndependent
     * @tc.desc   Two sequences keep separate values and cursors.
     * @tc.precondition  Two empty sequences.
     * @tc.steps         1. Write different values into each.
     *                   2. Read from the first only.
     *                   3. Compare both traces.
     * @tc.expected      Neither sequence affects the other.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolSequencesIndependent', 0, () => {
      const left = MessageSequenceModel.create();
      const right = MessageSequenceModel.create();
      left.writeString('left-only');
      right.writeString('right-one');
      right.writeString('right-two');
      left.readString();
      expect(left.size()).assertEqual(1);
      expect(right.size()).assertEqual(2);
      expect(left.trace()).assertEqual('left-only#1');
      expect(right.trace()).assertEqual('right-one|right-two#0');
      expect(left.reclaimed).assertFalse();
      expect(right.readCount).assertEqual(0);
      expect(left.values[0] === right.values[0]).assertFalse();
    });

    /**
     * @tc.name   stubProtocolOptionsIndependent
     * @tc.desc   Message option instances keep independent field values.
     * @tc.precondition  Three options with different constructor arguments.
     * @tc.steps         1. Build sync, async and forced-sync options.
     *                   2. Compare their descriptions.
     *                   3. Compare their sync predicates.
     * @tc.expected      No option mutates another.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolOptionsIndependent', 0, () => {
      const sync = new MessageOptionModel(OPTION_FLAG_SYNC, 0, false);
      const asyncOption = new MessageOptionModel(OPTION_FLAG_ASYNC, 40, false);
      const forced = new MessageOptionModel(OPTION_FLAG_ASYNC, 0, true);
      expect(sync.describe()).assertEqual('0/0/false');
      expect(asyncOption.describe()).assertEqual('1/40/false');
      expect(forced.describe()).assertEqual('1/0/true');
      expect(sync.isSync()).assertTrue();
      expect(asyncOption.isSync()).assertFalse();
      expect(forced.isSync()).assertTrue();
      const descriptions: string[] = [sync.describe(), asyncOption.describe(), forced.describe()];
      expect(uniqueStrings(descriptions).length).assertEqual(3);
    });

    /**
     * @tc.name   stubProtocolPayloadFingerprintsDistinct
     * @tc.desc   The request and reply payloads have distinct fingerprints.
     * @tc.precondition  The helper function is imported.
     * @tc.steps         1. Fingerprint both payloads.
     *                   2. Fingerprint the descriptor.
     *                   3. Compare the three values.
     * @tc.expected      All three fingerprints differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolPayloadFingerprintsDistinct', 0, () => {
      const request = textFingerprint(REQUEST_PAYLOAD);
      const reply = textFingerprint(REPLY_PAYLOAD);
      const descriptor = textFingerprint(STUB_DESCRIPTOR);
      expect(request === reply).assertFalse();
      expect(reply === descriptor).assertFalse();
      expect(request === descriptor).assertFalse();
      const prints: string[] = [String(request), String(reply), String(descriptor)];
      expect(uniqueStrings(prints).length).assertEqual(3);
      expect(request).assertLarger(-1);
      expect(descriptor).assertLess(1000003);
    });

    /**
     * @tc.name   stubProtocolErrorCodesUnique
     * @tc.desc   The four error codes are pairwise distinct.
     * @tc.precondition  The driver module is imported.
     * @tc.steps         1. Collect the four codes as text.
     *                   2. Deduplicate the list.
     *                   3. Confirm success is the only zero.
     * @tc.expected      Four distinct values with exactly one zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolErrorCodesUnique', 0, () => {
      const codes: string[] = [String(ERROR_NONE), String(ERROR_STUB_REJECTED), String(ERROR_STUB_NOT_ALIVE),
        String(ERROR_SEQUENCE_RECLAIMED)];
      expect(uniqueStrings(codes).length).assertEqual(4);
      expect(countOf(codes, '0')).assertEqual(1);
      expect(codes[0]).assertEqual('0');
      expect(codes[1]).assertEqual('16000011');
      expect(codes[2]).assertEqual('16000012');
      expect(codes[3]).assertEqual('16000013');
      expect(joined(codes, ',')).assertEqual('0,16000011,16000012,16000013');
    });

    /**
     * @tc.name   stubProtocolRecordOptionDefaults
     * @tc.desc   The default client send records the default option description.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send code 1 through the client.
     *                   2. Read the recorded option.
     *                   3. Compare with a default option.
     * @tc.expected      The record shows the default sync option.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolRecordOptionDefaults', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const record = stub.requests[0];
      const option = new MessageOptionModel();
      expect(record.option).assertEqual(option.describe());
      expect(record.option).assertEqual('0/0/false');
      expect(record.option.endsWith('false')).assertTrue();
      expect(record.option.length).assertEqual(9);
      expect(record.handled).assertTrue();
      expect(client.results[0].handled).assertTrue();
    });

    /**
     * @tc.name   stubProtocolSequenceGrowth
     * @tc.desc   The sequence grows by one for every accepted write.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Write six values in a loop.
     *                   2. Compare the size with the loop count.
     *                   3. Read the traced values.
     * @tc.expected      Six values are stored and traced.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolSequenceGrowth', 0, () => {
      const sequence = MessageSequenceModel.create();
      for (let index = 0; index < 6; index++) {
        expect(sequence.writeString('v' + String(index))).assertTrue();
        expect(sequence.size()).assertEqual(index + 1);
      }
      expect(sequence.size()).assertEqual(6);
      expect(sequence.writeCount).assertEqual(6);
      expect(sequence.trace()).assertEqual('v0|v1|v2|v3|v4|v5#0');
      expect(sequence.trace().split('|').length).assertEqual(6);
      expect(sequence.readString()).assertEqual('v0');
    });

    /**
     * @tc.name   stubProtocolClientResultsInOrder
     * @tc.desc   The client result ledger preserves send order.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send four mixed codes.
     *                   2. Map results to handled flags.
     *                   3. Compare the ordered flags.
     * @tc.expected      The flags follow the send order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolClientResultsInOrder', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_ZERO, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const flags: string[] = [];
      for (let index = 0; index < client.results.length; index++) {
        flags.push(String(client.results[index].handled));
      }
      expect(joined(flags, ',')).assertEqual('true,false,false,true');
      expect(client.results.length).assertEqual(4);
      expect(client.sentCodes[3]).assertEqual(REQUEST_CODE);
      expect(client.replies.length).assertEqual(2);
      expect(StubMetrics.from(stub).rejected).assertEqual(2);
    });

    /**
     * @tc.name   stubProtocolMetricsFingerprintDiffers
     * @tc.desc   Different metric fields produce different fingerprints.
     * @tc.precondition  Two stubs with different request mixes.
     * @tc.steps         1. Replay two accepted codes on the left stub.
     *                   2. Replay two rejected codes on the right stub.
     *                   3. Compare fingerprints.
     * @tc.expected      The fingerprints differ while totals match.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubProtocolMetricsFingerprintDiffers', 0, () => {
      const left = new StubRemoteObjectModel();
      const right = new StubRemoteObjectModel();
      replayCodes(left, [REQUEST_CODE, REQUEST_CODE]);
      replayCodes(right, [UNKNOWN_CODE_TWO, UNKNOWN_CODE_TWO]);
      const leftMetrics = StubMetrics.from(left);
      const rightMetrics = StubMetrics.from(right);
      expect(leftMetrics.requests).assertEqual(rightMetrics.requests);
      expect(leftMetrics.handled).assertEqual(2);
      expect(rightMetrics.handled).assertEqual(0);
      expect(leftMetrics.fingerprint() === rightMetrics.fingerprint()).assertFalse();
      expect(leftMetrics.successRatio()).assertEqual(1);
      expect(rightMetrics.successRatio()).assertEqual(0);
      expect(leftMetrics.replies).assertEqual(2);
      expect(rightMetrics.replies).assertEqual(0);
    });
  });
}
