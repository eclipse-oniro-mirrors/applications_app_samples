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
 * ConstantContract: the exported driver constants as a resource contract.
 *
 * Toasts, error codes, states, log levels and timing values are part of the
 * observable client contract. This suite pins their values and the relations
 * between them so an accidental edit fails loudly.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TARGET_BUNDLE,
  TARGET_ABILITY,
  CLIENT_BUNDLE,
  STUB_DESCRIPTOR,
  REQUEST_CODE,
  UNKNOWN_CODE_ZERO,
  UNKNOWN_CODE_TWO,
  UNKNOWN_CODE_NEGATIVE,
  UNKNOWN_CODE_LARGE,
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  CONNECT_SUCCESS_TOAST,
  CONNECT_FAIL_TOAST,
  SEND_SUCCESS_TOAST,
  SEND_FAIL_TOAST,
  DISCONNECT_FAIL_TOAST,
  DISCONNECT_SUCCESS_TOAST,
  STATE_DISCONNECTED,
  STATE_CONNECTING,
  STATE_CONNECTED,
  STATE_FAILED,
  ERROR_NONE,
  ERROR_CONNECT,
  ERROR_DISCONNECT,
  ERROR_SEND,
  ERROR_PROXY_INVALID,
  ERROR_DEATH_REGISTER,
  TOAST_DURATION_MS,
  DISCONNECT_PROBE_MS,
  OPTION_FLAG_SYNC,
  OPTION_FLAG_ASYNC,
  INITIAL_CONNECT_ID,
  LEVEL_INFO,
  LEVEL_WARN,
  LEVEL_ERROR,
  LOG_TAG,
  isKnownRequestCode,
  isNonZeroError,
  ConnectionModel,
  createConnectedSession,
  clampInt,
  joined,
  countOf,
  uniqueStrings,
  textFingerprint
} from '../Shared/SharedDriver';

function errorCodes(): number[] {
  return [ERROR_NONE, ERROR_CONNECT, ERROR_DISCONNECT, ERROR_SEND, ERROR_PROXY_INVALID, ERROR_DEATH_REGISTER];
}

function toastTexts(): string[] {
  return [
    CONNECT_SUCCESS_TOAST,
    CONNECT_FAIL_TOAST,
    SEND_SUCCESS_TOAST,
    SEND_FAIL_TOAST,
    DISCONNECT_FAIL_TOAST,
    DISCONNECT_SUCCESS_TOAST
  ];
}

function stateNames(): string[] {
  return [STATE_DISCONNECTED, STATE_CONNECTING, STATE_CONNECTED, STATE_FAILED];
}

function allPositive(codes: number[]): boolean {
  for (let index = 0; index < codes.length; index++) {
    if (codes[index] <= 0) {
      return false;
    }
  }
  return true;
}

function numericFingerprint(values: number[]): number {
  const text: string[] = [];
  for (let index = 0; index < values.length; index++) {
    text.push(String(values[index]));
  }
  return textFingerprint(joined(text, ','));
}

export default function constantContract(): void {
  describe('ConstantContract', () => {
    beforeAll(() => {
      logSuite('ConstantContract', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ConstantContract', 'end');
    });

    /**
     * @tc.name          constantContractErrorCodesAreDistinct
     * @tc.desc          The five failure codes plus zero are all distinct.
     * @tc.precondition  Error constants are exported by the driver.
     * @tc.steps         1. Collect the codes. 2. De-duplicate them.
     *                   3. Compare array lengths.
     * @tc.expected      Six collected values yield six unique values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractErrorCodesAreDistinct', 0, () => {
      logStep('constantContract', 'error codes distinct');
      const codes = errorCodes();
      const asText: string[] = [];
      for (let index = 0; index < codes.length; index++) {
        asText.push(String(codes[index]));
      }
      expect(codes.length).assertEqual(6);
      expect(uniqueStrings(asText).length).assertEqual(6);
      expect(countOf(asText, '0')).assertEqual(1);
      expect(numericFingerprint(codes)).assertEqual(numericFingerprint(errorCodes()));
      expect(ERROR_CONNECT === ERROR_DISCONNECT).assertFalse();
      expect(ERROR_SEND === ERROR_PROXY_INVALID).assertFalse();
    });

    /**
     * @tc.name          constantContractFailureCodesArePositive
     * @tc.desc          Every failure code is positive and ERROR_NONE is zero.
     * @tc.precondition  Error constants are exported by the driver.
     * @tc.steps         1. Check ERROR_NONE. 2. Check the five failures.
     *                   3. Evaluate the non-zero oracle.
     * @tc.expected      Only ERROR_NONE is zero; all failures are above zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractFailureCodesArePositive', 0, () => {
      logStep('constantContract', 'failure codes positive');
      const failures: number[] = [ERROR_CONNECT, ERROR_DISCONNECT, ERROR_SEND, ERROR_PROXY_INVALID, ERROR_DEATH_REGISTER];
      expect(ERROR_NONE).assertEqual(0);
      expect(allPositive(failures)).assertTrue();
      expect(isNonZeroError(ERROR_NONE)).assertFalse();
      for (let index = 0; index < failures.length; index++) {
        expect(isNonZeroError(failures[index])).assertTrue();
        expect(failures[index] > ERROR_NONE).assertTrue();
      }
      expect(ERROR_CONNECT).assertEqual(16000001);
      expect(ERROR_DEATH_REGISTER).assertEqual(16000005);
    });

    /**
     * @tc.name          constantContractErrorCodesAreMonotonic
     * @tc.desc          The five failure codes form a consecutive run.
     * @tc.precondition  Error constants are exported by the driver.
     * @tc.steps         1. Order the failures. 2. Compare adjacent values.
     *                   3. Check the total span.
     * @tc.expected      Each code is one greater than its predecessor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractErrorCodesAreMonotonic', 0, () => {
      logStep('constantContract', 'error codes monotonic');
      const failures: number[] = [ERROR_CONNECT, ERROR_DISCONNECT, ERROR_SEND, ERROR_PROXY_INVALID, ERROR_DEATH_REGISTER];
      expect(failures[1] - failures[0]).assertEqual(1);
      expect(failures[2] - failures[1]).assertEqual(1);
      expect(failures[3] - failures[2]).assertEqual(1);
      expect(failures[4] - failures[3]).assertEqual(1);
      expect(failures[4] - failures[0]).assertEqual(4);
      expect(failures[0] - ERROR_NONE).assertEqual(16000001);
    });

    /**
     * @tc.name          constantContractToastTextsAreNonEmpty
     * @tc.desc          Every toast constant is a non-empty user facing string.
     * @tc.precondition  Toast constants are exported by the driver.
     * @tc.steps         1. Collect the six toasts. 2. Check each length.
     *                   3. Confirm all are distinct.
     * @tc.expected      All six toasts are non-empty and unique.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractToastTextsAreNonEmpty', 0, () => {
      logStep('constantContract', 'toast texts');
      const toasts = toastTexts();
      expect(toasts.length).assertEqual(6);
      expect(uniqueStrings(toasts).length).assertEqual(6);
      for (let index = 0; index < toasts.length; index++) {
        expect(toasts[index].length > 0).assertTrue();
        expect(toasts[index].indexOf('  ')).assertEqual(-1);
      }
      expect(CONNECT_SUCCESS_TOAST).assertEqual('connectAbility success');
      expect(SEND_SUCCESS_TOAST).assertEqual('sendRequest success');
      expect(DISCONNECT_SUCCESS_TOAST).assertEqual('disconnectAbility success');
    });

    /**
     * @tc.name          constantContractToastDurationIsTwoSeconds
     * @tc.desc          Toast duration matches the production showToast call.
     * @tc.precondition  Timing constants are exported by the driver.
     * @tc.steps         1. Read TOAST_DURATION_MS. 2. Read DISCONNECT_PROBE_MS.
     *                   3. Compare the probe to the production 3000 ms sleep.
     * @tc.expected      Toast duration is 2000 and the probe is 3000.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractToastDurationIsTwoSeconds', 0, () => {
      logStep('constantContract', 'toast duration');
      expect(TOAST_DURATION_MS).assertEqual(2000);
      expect(DISCONNECT_PROBE_MS).assertEqual(3000);
      expect(DISCONNECT_PROBE_MS > TOAST_DURATION_MS).assertTrue();
      expect(TOAST_DURATION_MS / 1000).assertEqual(2);
      expect(DISCONNECT_PROBE_MS / 1000).assertEqual(3);
      expect(clampInt(5000, 1000, 4000)).assertEqual(4000);
      expect(clampInt(TOAST_DURATION_MS, 1000, 4000)).assertEqual(2000);
    });

    /**
     * @tc.name          constantContractStateNamesAreDistinct
     * @tc.desc          The four connection state names are unique literals.
     * @tc.precondition  State constants are exported by the driver.
     * @tc.steps         1. Collect the states. 2. De-duplicate them.
     *                   3. Check the literal spellings.
     * @tc.expected      Four unique lower case state names exist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractStateNamesAreDistinct', 0, () => {
      logStep('constantContract', 'state names');
      const states = stateNames();
      expect(states.length).assertEqual(4);
      expect(uniqueStrings(states).length).assertEqual(4);
      expect(STATE_DISCONNECTED).assertEqual('disconnected');
      expect(STATE_CONNECTING).assertEqual('connecting');
      expect(STATE_CONNECTED).assertEqual('connected');
      expect(STATE_FAILED).assertEqual('failed');
      for (let index = 0; index < states.length; index++) {
        expect(states[index] === states[index].toUpperCase()).assertFalse();
      }
    });

    /**
     * @tc.name          constantContractRequestProtocolIsPinned
     * @tc.desc          The request code, payloads and descriptor are pinned.
     * @tc.precondition  Protocol constants are exported by the driver.
     * @tc.steps         1. Read REQUEST_CODE. 2. Read both payloads.
     *                   3. Read the target tuple.
     * @tc.expected      Code 1, 'hello world', 'hello rpc', expected target.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractRequestProtocolIsPinned', 0, () => {
      logStep('constantContract', 'request protocol');
      expect(REQUEST_CODE).assertEqual(1);
      expect(isKnownRequestCode(REQUEST_CODE)).assertTrue();
      expect(REQUEST_PAYLOAD).assertEqual('hello world');
      expect(REPLY_PAYLOAD).assertEqual('hello rpc');
      expect(TARGET_BUNDLE).assertEqual('com.example.ipc_stub');
      expect(TARGET_ABILITY).assertEqual('ServiceAbility');
      expect(STUB_DESCRIPTOR).assertEqual('IPCStubTest');
      expect(CLIENT_BUNDLE).assertEqual('com.example.ipc_client');
    });

    /**
     * @tc.name          constantContractUnknownCodesAreRejected
     * @tc.desc          Only request code one is handled by the protocol oracle.
     * @tc.precondition  Unknown code constants are exported.
     * @tc.steps         1. Collect the unknown codes. 2. Check the oracle.
     *                   3. Check the minimum and maximum.
     * @tc.expected      No unknown code is accepted and the values are distinct.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractUnknownCodesAreRejected', 0, () => {
      logStep('constantContract', 'unknown codes');
      const unknown: number[] = [UNKNOWN_CODE_ZERO, UNKNOWN_CODE_TWO, UNKNOWN_CODE_NEGATIVE, UNKNOWN_CODE_LARGE];
      for (let index = 0; index < unknown.length; index++) {
        expect(isKnownRequestCode(unknown[index])).assertFalse();
      }
      expect(unknown[0]).assertEqual(0);
      expect(unknown[1]).assertEqual(2);
      expect(unknown[2]).assertEqual(-1);
      expect(unknown[3]).assertEqual(99);
      expect(numericFingerprint(unknown)).assertEqual(numericFingerprint([0, 2, -1, 99]));
      expect(unknown.indexOf(REQUEST_CODE)).assertEqual(-1);
    });

    /**
     * @tc.name          constantContractLogLevelsAreUppercase
     * @tc.desc          The three log level literals are distinct and uppercase.
     * @tc.precondition  Level constants are exported by the driver.
     * @tc.steps         1. Collect the levels. 2. Upper case them and compare.
     *                   3. Check uniqueness.
     * @tc.expected      INFO, WARN and ERROR are already uppercase and unique.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractLogLevelsAreUppercase', 0, () => {
      logStep('constantContract', 'log levels');
      const levels: string[] = [LEVEL_INFO, LEVEL_WARN, LEVEL_ERROR];
      expect(levels.length).assertEqual(3);
      expect(uniqueStrings(levels).length).assertEqual(3);
      const lengths: number[] = [4, 4, 5];
      for (let index = 0; index < levels.length; index++) {
        expect(levels[index]).assertEqual(levels[index].toUpperCase());
        expect(levels[index].length).assertEqual(lengths[index]);
      }
      expect(LEVEL_INFO).assertEqual('INFO');
      expect(LEVEL_WARN).assertEqual('WARN');
      expect(LEVEL_ERROR).assertEqual('ERROR');
    });

    /**
     * @tc.name          constantContractOptionFlagsAreDistinct
     * @tc.desc          The sync and async option flags differ by one.
     * @tc.precondition  Option flag constants are exported.
     * @tc.steps         1. Read both flags. 2. Compare them to zero and one.
     *                   3. Check the difference.
     * @tc.expected      Sync is zero, async is one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractOptionFlagsAreDistinct', 0, () => {
      logStep('constantContract', 'option flags');
      expect(OPTION_FLAG_SYNC).assertEqual(0);
      expect(OPTION_FLAG_ASYNC).assertEqual(1);
      expect(OPTION_FLAG_ASYNC - OPTION_FLAG_SYNC).assertEqual(1);
      expect(OPTION_FLAG_SYNC === OPTION_FLAG_ASYNC).assertFalse();
      expect(OPTION_FLAG_SYNC).assertEqual(ERROR_NONE);
      expect(OPTION_FLAG_ASYNC > OPTION_FLAG_SYNC).assertTrue();
      expect(String(OPTION_FLAG_ASYNC)).assertEqual('1');
    });

    /**
     * @tc.name          constantContractInitialConnectIdIsSentinel
     * @tc.desc          The unconnected id is minus one and never a valid handle.
     * @tc.precondition  INITIAL_CONNECT_ID is exported by the driver.
     * @tc.steps         1. Read the sentinel. 2. Compare it to minus one.
     *                   3. Check a fresh client and a connected client.
     * @tc.expected      Fresh clients hold minus one; connected clients hold
     *                   their positive handle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractInitialConnectIdIsSentinel', 0, () => {
      logStep('constantContract', 'connect id sentinel');
      const fresh = new ConnectionModel();
      const connected = createConnectedSession();
      expect(INITIAL_CONNECT_ID).assertEqual(-1);
      expect(INITIAL_CONNECT_ID < 0).assertTrue();
      expect(fresh.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(connected.connectId).assertEqual(7);
      expect(connected.connectId > INITIAL_CONNECT_ID).assertTrue();
      expect(UNKNOWN_CODE_NEGATIVE).assertEqual(INITIAL_CONNECT_ID);
      expect(fresh.connectId === connected.connectId).assertFalse();
    });

    /**
     * @tc.name          constantContractClampIntHonoursBounds
     * @tc.desc          clampInt pins values to the inclusive range.
     * @tc.precondition  clampInt is exported by the driver.
     * @tc.steps         1. Clamp a value below the range. 2. Clamp one above.
     *                   3. Clamp an inside value.
     * @tc.expected      The low and high bounds are returned at the edges.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractClampIntHonoursBounds', 0, () => {
      logStep('constantContract', 'clamp bounds');
      expect(clampInt(-5, 0, 10)).assertEqual(0);
      expect(clampInt(50, 0, 10)).assertEqual(10);
      expect(clampInt(5, 0, 10)).assertEqual(5);
      expect(clampInt(0, 0, 10)).assertEqual(0);
      expect(clampInt(10, 0, 10)).assertEqual(10);
      expect(clampInt(5, 10, 0)).assertEqual(10);
      expect(clampInt(2000, 0, 1000)).assertEqual(1000);
    });

    /**
     * @tc.name          constantContractJoinedUsesDefaultSeparator
     * @tc.desc          joined defaults to a comma and accepts a custom separator.
     * @tc.precondition  joined is exported by the driver.
     * @tc.steps         1. Join two values with the default. 2. Join with a dash.
     *                   3. Join an empty array.
     * @tc.expected      The default join is a,b and the empty join is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractJoinedUsesDefaultSeparator', 0, () => {
      logStep('constantContract', 'joined separator');
      expect(joined(['a', 'b'])).assertEqual('a,b');
      expect(joined(['a', 'b'], '-')).assertEqual('a-b');
      expect(joined(['a'])).assertEqual('a');
      expect(joined([])).assertEqual('');
      expect(joined(['a', 'b', 'c'], '')).assertEqual('abc');
      expect(joined([STATE_CONNECTED, STATE_FAILED], '>')).assertEqual('connected>failed');
      expect(joined(['a', 'b']).split(',').length).assertEqual(2);
    });

    /**
     * @tc.name          constantContractCountOfCountsExactMatches
     * @tc.desc          countOf counts exact string matches only.
     * @tc.precondition  countOf is exported by the driver.
     * @tc.steps         1. Count a repeated value. 2. Count an absent value.
     *                   3. Count case variants.
     * @tc.expected      Only exact matches are counted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractCountOfCountsExactMatches', 0, () => {
      logStep('constantContract', 'count exact');
      const values: string[] = ['a', 'a', 'b', 'A', 'a'];
      expect(countOf(values, 'a')).assertEqual(3);
      expect(countOf(values, 'A')).assertEqual(1);
      expect(countOf(values, 'b')).assertEqual(1);
      expect(countOf(values, 'z')).assertEqual(0);
      expect(countOf([], 'a')).assertEqual(0);
      expect(countOf(values, 'a') + countOf(values, 'A')).assertEqual(4);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.name          constantContractUniqueStringsKeepsFirstOrder
     * @tc.desc          uniqueStrings keeps the first occurrence order.
     * @tc.precondition  uniqueStrings is exported by the driver.
     * @tc.steps         1. De-duplicate a repeated list. 2. Compare the order.
     *                   3. Compare the count.
     * @tc.expected      The first occurrences survive in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractUniqueStringsKeepsFirstOrder', 0, () => {
      logStep('constantContract', 'unique order');
      const values: string[] = ['b', 'a', 'b', 'c', 'a'];
      const unique = uniqueStrings(values);
      expect(unique.length).assertEqual(3);
      expect(unique[0]).assertEqual('b');
      expect(unique[1]).assertEqual('a');
      expect(unique[2]).assertEqual('c');
      expect(joined(unique, '')).assertEqual('bac');
      expect(uniqueStrings([]).length).assertEqual(0);
      expect(uniqueStrings(['x'])[0]).assertEqual('x');
    });

    /**
     * @tc.name          constantContractFingerprintIsSensitive
     * @tc.desc          The text fingerprint is deterministic and input sensitive.
     * @tc.precondition  textFingerprint is exported by the driver.
     * @tc.steps         1. Fingerprint an empty string. 2. Fingerprint two
     *                   different strings. 3. Recompute one fingerprint.
     * @tc.expected      Equal strings match and different strings usually differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('constantContractFingerprintIsSensitive', 0, () => {
      logStep('constantContract', 'fingerprint sensitivity');
      const empty = textFingerprint('');
      expect(empty).assertEqual(216613);
      expect(textFingerprint('abc')).assertEqual(textFingerprint('abc'));
      expect(textFingerprint('abc') === textFingerprint('abd')).assertFalse();
      expect(textFingerprint(REQUEST_PAYLOAD) === textFingerprint(REPLY_PAYLOAD)).assertFalse();
      expect(textFingerprint('a') > 0).assertTrue();
      expect(textFingerprint('ab')).assertEqual(textFingerprint('a' + 'b'));
      expect(empty === textFingerprint('a')).assertFalse();
    });

    /**
     * @tc.name          constantContractToastGuidancePhrases
     * @tc.desc          Failure toasts carry actionable guidance.
     * @tc.precondition  Toast constants are exported by the driver.
     * @tc.steps         1. Check the connect failure text. 2. Check the send
     *                   failure text. 3. Check the disconnect failure text.
     * @tc.expected      Each failure names the service or the missing connection.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractToastGuidancePhrases', 0, () => {
      logStep('constantContract', 'toast guidance');
      expect(CONNECT_FAIL_TOAST.indexOf('background')).assertEqual(65);
      expect(CONNECT_FAIL_TOAST.indexOf('Please')).assertEqual(16);
      expect(SEND_FAIL_TOAST.indexOf('connect to the server')).assertEqual(27);
      expect(DISCONNECT_FAIL_TOAST.startsWith('disConnect failed')).assertTrue();
      expect(DISCONNECT_FAIL_TOAST.indexOf('connect to the service')).assertEqual(26);
      expect(CONNECT_SUCCESS_TOAST.endsWith('success')).assertTrue();
      expect(SEND_SUCCESS_TOAST.endsWith('success')).assertTrue();
      expect(DISCONNECT_SUCCESS_TOAST.endsWith('success')).assertTrue();
    });

    /**
     * @tc.name          constantContractPayloadLengthsArePinned
     * @tc.desc          The request and reply literals keep their lengths.
     * @tc.precondition  Payload constants are exported by the driver.
     * @tc.steps         1. Read both lengths. 2. Compare them. 3. Compare the texts.
     * @tc.expected      The request is eleven chars and the reply is nine.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractPayloadLengthsArePinned', 0, () => {
      logStep('constantContract', 'payload lengths');
      expect(REQUEST_PAYLOAD.length).assertEqual(11);
      expect(REPLY_PAYLOAD.length).assertEqual(9);
      expect(REQUEST_PAYLOAD === REPLY_PAYLOAD).assertFalse();
      expect(REQUEST_PAYLOAD.startsWith('hello')).assertTrue();
      expect(REPLY_PAYLOAD.startsWith('hello')).assertTrue();
      expect(REQUEST_PAYLOAD.endsWith('world')).assertTrue();
      expect(REPLY_PAYLOAD.endsWith('rpc')).assertTrue();
      expect(REQUEST_PAYLOAD.indexOf(' ')).assertEqual(5);
    });

    /**
     * @tc.name          constantContractToastAndFailureCountsAlign
     * @tc.desc          Six toasts pair with five failures and a zero code.
     * @tc.precondition  Toast and error constants are exported.
     * @tc.steps         1. Count both collections. 2. Check the relationship.
     *                   3. Check the zero code.
     * @tc.expected      There are six toasts and six error constants.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('constantContractToastAndFailureCountsAlign', 0, () => {
      logStep('constantContract', 'toast and failure counts');
      expect(toastTexts().length).assertEqual(6);
      expect(errorCodes().length).assertEqual(6);
      expect(allPositive([ERROR_CONNECT, ERROR_DISCONNECT, ERROR_SEND, ERROR_PROXY_INVALID, ERROR_DEATH_REGISTER]))
        .assertTrue();
      expect(ERROR_NONE).assertEqual(0);
      expect(toastTexts().length - 1).assertEqual(5);
      expect(errorCodes().length - 1).assertEqual(5);
      expect(uniqueStrings(toastTexts()).length).assertEqual(6);
      expect(uniqueStrings(['0', '16000001', '16000002', '16000003', '16000004', '16000005']).length)
        .assertEqual(6);
    });

    /**
     * @tc.name          constantContractTagAndDescriptorLiterals
     * @tc.desc          The log tag and descriptor literals are pinned.
     * @tc.precondition  LOG_TAG and STUB_DESCRIPTOR are exported.
     * @tc.steps         1. Read the tag. 2. Read the descriptor. 3. Compare their
     *                   lengths and prefixes.
     * @tc.expected      The tag is testTag and the descriptor is IPCStubTest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractTagAndDescriptorLiterals', 0, () => {
      logStep('constantContract', 'tag and descriptor');
      expect(LOG_TAG).assertEqual('testTag');
      expect(LOG_TAG.length).assertEqual(7);
      expect(LOG_TAG.startsWith('test')).assertTrue();
      expect(STUB_DESCRIPTOR).assertEqual('IPCStubTest');
      expect(STUB_DESCRIPTOR.length).assertEqual(11);
      expect(STUB_DESCRIPTOR.startsWith('IPC')).assertTrue();
      expect(STUB_DESCRIPTOR.endsWith('Test')).assertTrue();
      expect(LOG_TAG === STUB_DESCRIPTOR).assertFalse();
    });

    /**
     * @tc.name          constantContractProbeMatchesProductionSleep
     * @tc.desc          The disconnect probe equals the page's three second sleep.
     * @tc.precondition  DISCONNECT_PROBE_MS is exported.
     * @tc.steps         1. Read the probe. 2. Divide by one thousand. 3. Compare
     *                   it to the toast duration.
     * @tc.expected      The probe is 3000 ms and longer than the toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractProbeMatchesProductionSleep', 0, () => {
      logStep('constantContract', 'probe sleep');
      expect(DISCONNECT_PROBE_MS).assertEqual(3000);
      expect(DISCONNECT_PROBE_MS / 1000).assertEqual(3);
      expect(DISCONNECT_PROBE_MS - TOAST_DURATION_MS).assertEqual(1000);
      expect(DISCONNECT_PROBE_MS % TOAST_DURATION_MS).assertEqual(1000);
      expect(DISCONNECT_PROBE_MS > TOAST_DURATION_MS).assertTrue();
      expect(TOAST_DURATION_MS * 1.5).assertEqual(DISCONNECT_PROBE_MS);
      expect(clampInt(DISCONNECT_PROBE_MS, 0, TOAST_DURATION_MS)).assertEqual(2000);
    });

    /**
     * @tc.name          constantContractKnownCodeTruthTable
     * @tc.desc          Only code one satisfies isKnownRequestCode.
     * @tc.precondition  isKnownRequestCode is exported.
     * @tc.steps         1. Evaluate code one. 2. Evaluate four other codes. 3. Sum
     *                   the accepted count.
     * @tc.expected      Exactly one code is accepted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractKnownCodeTruthTable', 0, () => {
      logStep('constantContract', 'known code table');
      const codes: number[] = [REQUEST_CODE, UNKNOWN_CODE_ZERO, UNKNOWN_CODE_TWO, UNKNOWN_CODE_NEGATIVE,
        UNKNOWN_CODE_LARGE];
      let accepted = 0;
      for (let index = 0; index < codes.length; index++) {
        if (isKnownRequestCode(codes[index])) {
          accepted = accepted + 1;
        }
      }
      expect(accepted).assertEqual(1);
      expect(isKnownRequestCode(1)).assertTrue();
      expect(isKnownRequestCode(0)).assertFalse();
      expect(isKnownRequestCode(-1)).assertFalse();
      expect(isKnownRequestCode(99)).assertFalse();
      expect(isKnownRequestCode(1.0)).assertTrue();
      expect(codes.length).assertEqual(5);
    });

    /**
     * @tc.name          constantContractNonZeroErrorTruthTable
     * @tc.desc          isNonZeroError is true exactly for non-zero values.
     * @tc.precondition  isNonZeroError is exported.
     * @tc.steps         1. Evaluate zero. 2. Evaluate positive and negative values.
     *                   3. Count the true results.
     * @tc.expected      Only zero is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractNonZeroErrorTruthTable', 0, () => {
      logStep('constantContract', 'non zero table');
      const values: number[] = [0, 1, -1, 16000001, 16000005];
      let truthy = 0;
      for (let index = 0; index < values.length; index++) {
        if (isNonZeroError(values[index])) {
          truthy = truthy + 1;
        }
      }
      expect(isNonZeroError(0)).assertFalse();
      expect(isNonZeroError(1)).assertTrue();
      expect(isNonZeroError(-1)).assertTrue();
      expect(truthy).assertEqual(4);
      expect(values.length).assertEqual(5);
      expect(isNonZeroError(ERROR_NONE)).assertFalse();
      expect(isNonZeroError(ERROR_DEATH_REGISTER)).assertTrue();
    });

    /**
     * @tc.name          constantContractErrorJoinGolden
     * @tc.desc          The error code set serialises to a pinned golden string.
     * @tc.precondition  Error constants are exported.
     * @tc.steps         1. Map codes to text. 2. Join them with commas. 3. Compare
     *                   the golden and its fingerprint.
     * @tc.expected      The golden is 0,16000001,...,16000005.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('constantContractErrorJoinGolden', 0, () => {
      logStep('constantContract', 'error join golden');
      const codes = errorCodes();
      const text: string[] = [];
      for (let index = 0; index < codes.length; index++) {
        text.push(String(codes[index]));
      }
      const golden = '0,16000001,16000002,16000003,16000004,16000005';
      expect(joined(text)).assertEqual(golden);
      expect(joined(text).split(',').length).assertEqual(6);
      expect(text[0]).assertEqual('0');
      expect(text[5]).assertEqual('16000005');
      expect(textFingerprint(joined(text))).assertEqual(textFingerprint(golden));
      expect(numericFingerprint(codes)).assertEqual(textFingerprint(golden));
      expect(joined(text, '|').indexOf('16000003')).assertEqual(20);
    });

    /**
     * @tc.name          constantContractFailureToastsMentionService
     * @tc.desc          Each failure toast names the service or server.
     * @tc.precondition  Toast constants are exported.
     * @tc.steps         1. Search the connect failure. 2. Search the send failure.
     *                   3. Search the disconnect failure.
     * @tc.expected      Every failure names the remote endpoint.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractFailureToastsMentionService', 0, () => {
      logStep('constantContract', 'failure toasts mention service');
      expect(CONNECT_FAIL_TOAST.indexOf('service') >= 0).assertTrue();
      expect(SEND_FAIL_TOAST.indexOf('server') >= 0).assertTrue();
      expect(DISCONNECT_FAIL_TOAST.indexOf('service') >= 0).assertTrue();
      expect(CONNECT_FAIL_TOAST.indexOf('service')).assertEqual(39);
      expect(SEND_FAIL_TOAST.indexOf('server')).assertEqual(42);
      expect(DISCONNECT_FAIL_TOAST.indexOf('service')).assertEqual(41);
      expect(SEND_SUCCESS_TOAST.indexOf('server')).assertEqual(-1);
      expect(DISCONNECT_SUCCESS_TOAST.indexOf('failed')).assertEqual(-1);
    });

    /**
     * @tc.name          constantContractStatesAreDisjointFromErrors
     * @tc.desc          No state name collides with an error code string.
     * @tc.precondition  State and error constants are exported.
     * @tc.steps         1. Map both vocabularies to strings. 2. Check for overlap.
     *                   3. Count the union.
     * @tc.expected      The two vocabularies are disjoint.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('constantContractStatesAreDisjointFromErrors', 0, () => {
      logStep('constantContract', 'states disjoint');
      const states = stateNames();
      const codes: string[] = ['0', '16000001', '16000002', '16000003', '16000004', '16000005'];
      let overlap = 0;
      for (let index = 0; index < states.length; index++) {
        if (codes.indexOf(states[index]) >= 0) {
          overlap = overlap + 1;
        }
      }
      expect(overlap).assertEqual(0);
      expect(states.length + codes.length).assertEqual(10);
      expect(uniqueStrings(states.concat(codes)).length).assertEqual(10);
      expect(states.indexOf('failed')).assertEqual(3);
      expect(codes.indexOf('failed')).assertEqual(-1);
      expect(countOf(states, STATE_FAILED)).assertEqual(1);
    });

    /**
     * @tc.name          constantContractLevelsAreDisjointFromStates
     * @tc.desc          Log level names never equal a connection state name.
     * @tc.precondition  Level and state constants are exported.
     * @tc.steps         1. Compare each pair. 2. Count the collisions. 3. Compare
     *                   the union size.
     * @tc.expected      There are no collisions between the two vocabularies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('constantContractLevelsAreDisjointFromStates', 0, () => {
      logStep('constantContract', 'levels disjoint');
      const levels: string[] = [LEVEL_INFO, LEVEL_WARN, LEVEL_ERROR];
      const states = stateNames();
      let collisions = 0;
      for (let index = 0; index < levels.length; index++) {
        if (states.indexOf(levels[index]) >= 0) {
          collisions = collisions + 1;
        }
      }
      expect(collisions).assertEqual(0);
      expect(levels.concat(states).length).assertEqual(7);
      expect(uniqueStrings(levels.concat(states)).length).assertEqual(7);
      expect(levels.indexOf('ERROR')).assertEqual(2);
      expect(states.indexOf('ERROR')).assertEqual(-1);
      expect(joined(levels, '/')).assertEqual('INFO/WARN/ERROR');
    });

    /**
     * @tc.name          constantContractBundleSegmentsAreGolden
     * @tc.desc          The target bundle splits into three pinned segments.
     * @tc.precondition  TARGET_BUNDLE is exported.
     * @tc.steps         1. Split the bundle. 2. Compare each segment. 3. Rebuild it.
     * @tc.expected      The segments are com, example and ipc_stub.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractBundleSegmentsAreGolden', 0, () => {
      logStep('constantContract', 'bundle segment golden');
      const parts = TARGET_BUNDLE.split('.');
      expect(parts.length).assertEqual(3);
      expect(parts[0]).assertEqual('com');
      expect(parts[1]).assertEqual('example');
      expect(parts[2]).assertEqual('ipc_stub');
      expect(joined(parts, '.')).assertEqual(TARGET_BUNDLE);
      expect(joined(parts, '/')).assertEqual('com/example/ipc_stub');
      expect(TARGET_BUNDLE.split('.').length).assertEqual(3);
      expect(TARGET_BUNDLE.indexOf('ipc_stub')).assertEqual(12);
    });

    /**
     * @tc.name          constantContractAbilityLengthIsPinned
     * @tc.desc          The ability name has a fixed fourteen char length.
     * @tc.precondition  TARGET_ABILITY is exported.
     * @tc.steps         1. Read its length. 2. Check both halves. 3. Compare the
     *                   character positions.
     * @tc.expected      Service plus Ability forms a fourteen char literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractAbilityLengthIsPinned', 0, () => {
      logStep('constantContract', 'ability length');
      expect(TARGET_ABILITY.length).assertEqual(14);
      expect(TARGET_ABILITY.substring(0, 7)).assertEqual('Service');
      expect(TARGET_ABILITY.substring(7)).assertEqual('Ability');
      expect(TARGET_ABILITY.indexOf('Ability')).assertEqual(7);
      expect(TARGET_ABILITY.charAt(0)).assertEqual('S');
      expect(TARGET_ABILITY.charAt(13)).assertEqual('y');
      expect(TARGET_ABILITY.split('A').length).assertEqual(2);
    });

    /**
     * @tc.name          constantContractDescriptorDiffersFromBundle
     * @tc.desc          The stub descriptor is not a bundle or ability literal.
     * @tc.precondition  Descriptor, bundle and ability constants exist.
     * @tc.steps         1. Compare the descriptor to the bundle. 2. Compare it to the
     *                   ability. 3. Compare fingerprints.
     * @tc.expected      The descriptor is distinct from both identifiers.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractDescriptorDiffersFromBundle', 0, () => {
      logStep('constantContract', 'descriptor differs');
      expect(STUB_DESCRIPTOR === TARGET_BUNDLE).assertFalse();
      expect(STUB_DESCRIPTOR === TARGET_ABILITY).assertFalse();
      expect(textFingerprint(STUB_DESCRIPTOR) === textFingerprint(TARGET_BUNDLE)).assertFalse();
      expect(textFingerprint(STUB_DESCRIPTOR) === textFingerprint(TARGET_ABILITY)).assertFalse();
      expect(STUB_DESCRIPTOR.indexOf('.')).assertEqual(-1);
      expect(STUB_DESCRIPTOR.indexOf('/')).assertEqual(-1);
      expect(TARGET_BUNDLE.indexOf('.') > 0).assertTrue();
    });

    /**
     * @tc.name          constantContractProbeRelationsHold
     * @tc.desc          The probe and toast durations satisfy fixed relations.
     * @tc.precondition  Both timing constants are exported.
     * @tc.steps         1. Add them. 2. Subtract them. 3. Compare the double.
     * @tc.expected      The sum is 5000 and the difference is 1000.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractProbeRelationsHold', 0, () => {
      logStep('constantContract', 'probe relations');
      expect(TOAST_DURATION_MS + DISCONNECT_PROBE_MS).assertEqual(5000);
      expect(DISCONNECT_PROBE_MS - TOAST_DURATION_MS).assertEqual(1000);
      expect(TOAST_DURATION_MS * 2).assertEqual(DISCONNECT_PROBE_MS + 1000);
      expect(TOAST_DURATION_MS / 2).assertEqual(1000);
      expect(DISCONNECT_PROBE_MS / TOAST_DURATION_MS).assertEqual(1.5);
      expect(TOAST_DURATION_MS > 0).assertTrue();
      expect(DISCONNECT_PROBE_MS > 0).assertTrue();
      expect(TOAST_DURATION_MS % 1000).assertEqual(0);
    });

    /**
     * @tc.name          constantContractClampIntDegenerateRange
     * @tc.desc          A degenerate clamp range always returns its single bound.
     * @tc.precondition  clampInt is exported.
     * @tc.steps         1. Clamp below, inside and above a fixed range. 2. Compare all
     *                   three. 3. Check a reversed range.
     * @tc.expected      Every call returns the fixed bound of five.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('constantContractClampIntDegenerateRange', 0, () => {
      logStep('constantContract', 'degenerate clamp');
      expect(clampInt(-1, 5, 5)).assertEqual(5);
      expect(clampInt(5, 5, 5)).assertEqual(5);
      expect(clampInt(6, 5, 5)).assertEqual(5);
      expect(clampInt(0, 5, 5)).assertEqual(5);
      expect(clampInt(99, 5, 5)).assertEqual(5);
      expect(clampInt(5, 5, 1)).assertEqual(1);
      expect(clampInt(2, 5, 1)).assertEqual(5);
      expect(clampInt(2, 1, 5)).assertEqual(2);
    });

    /**
     * @tc.name          constantContractUnknownLargeCodeIsNotAnError
     * @tc.desc          The unknown code 99 is not part of the error set.
     * @tc.precondition  Error constants are exported.
     * @tc.steps         1. Compare 99 to the error codes. 2. Compare it to the request
     *                   code. 3. Check the observable branch.
     * @tc.expected      Code 99 is neither an error constant nor a request code.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractUnknownLargeCodeIsNotAnError', 0, () => {
      logStep('constantContract', 'unknown large code');
      expect(errorCodes().indexOf(UNKNOWN_CODE_LARGE)).assertEqual(-1);
      expect(UNKNOWN_CODE_LARGE).assertEqual(99);
      expect(isKnownRequestCode(UNKNOWN_CODE_LARGE)).assertFalse();
      expect(isNonZeroError(UNKNOWN_CODE_LARGE)).assertTrue();
      expect(UNKNOWN_CODE_LARGE > ERROR_DEATH_REGISTER).assertFalse();
      expect(UNKNOWN_CODE_LARGE - ERROR_DEATH_REGISTER).assertEqual(-15999906);
      expect(uniqueStrings(['99', '16000005']).length).assertEqual(2);
    });

    /**
     * @tc.name          constantContractRequestCodeIsNotAnError
     * @tc.desc          Request code one never appears in the error vocabulary.
     * @tc.precondition  Both vocabularies are exported.
     * @tc.steps         1. Compare code one to the errors. 2. Check the known predicate.
     *                   3. Check the non-zero predicate.
     * @tc.expected      Code one is known but not an error constant.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractRequestCodeIsNotAnError', 0, () => {
      logStep('constantContract', 'request not error');
      expect(errorCodes().indexOf(REQUEST_CODE)).assertEqual(-1);
      expect(isKnownRequestCode(REQUEST_CODE)).assertTrue();
      expect(isNonZeroError(REQUEST_CODE)).assertTrue();
      expect(REQUEST_CODE > ERROR_NONE).assertTrue();
      expect(REQUEST_CODE < ERROR_CONNECT).assertTrue();
      expect(REQUEST_CODE).assertEqual(1);
      expect(UNKNOWN_CODE_TWO - REQUEST_CODE).assertEqual(1);
      expect(uniqueStrings(['1', '0']).length).assertEqual(2);
    });

    /**
     * @tc.name          constantContractStateCountIsFour
     * @tc.desc          Exactly four connection states are declared.
     * @tc.precondition  State constants are exported.
     * @tc.steps         1. Count the states. 2. Check the set size. 3. Compare the literal
     *                   lengths.
     * @tc.expected      Four unique states with fixed spelled lengths.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractStateCountIsFour', 0, () => {
      logStep('constantContract', 'state count');
      const states = stateNames();
      expect(states.length).assertEqual(4);
      expect(uniqueStrings(states).length).assertEqual(4);
      expect(STATE_DISCONNECTED.length).assertEqual(12);
      expect(STATE_CONNECTING.length).assertEqual(10);
      expect(STATE_CONNECTED.length).assertEqual(9);
      expect(STATE_FAILED.length).assertEqual(6);
      expect(countOf(states, STATE_CONNECTED)).assertEqual(1);
      expect(states.indexOf(STATE_FAILED)).assertEqual(3);
      expect(joined(states, '|')).assertEqual('disconnected|connecting|connected|failed');
    });

    /**
     * @tc.name          constantContractToastPairsSharePrefixes
     * @tc.desc          Each success and failure toast pair shares a verb prefix.
     * @tc.precondition  Toast constants are exported.
     * @tc.steps         1. Compare the connect pair. 2. Compare the send pair. 3. Compare
     *                   the disconnect pair.
     * @tc.expected      Each pair shares a case sensitive verb prefix.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractToastPairsSharePrefixes', 0, () => {
      logStep('constantContract', 'toast pairs');
      expect(CONNECT_SUCCESS_TOAST.startsWith('connectAbility')).assertTrue();
      expect(CONNECT_FAIL_TOAST.startsWith('Connect failed')).assertTrue();
      expect(SEND_SUCCESS_TOAST.startsWith('sendRequest')).assertTrue();
      expect(SEND_FAIL_TOAST.startsWith('sendRequest failed')).assertTrue();
      expect(DISCONNECT_SUCCESS_TOAST.startsWith('disconnectAbility')).assertTrue();
      expect(DISCONNECT_FAIL_TOAST.startsWith('disConnect failed')).assertTrue();
      expect(CONNECT_SUCCESS_TOAST.toLowerCase().startsWith('connectability')).assertTrue();
      expect(DISCONNECT_FAIL_TOAST.charAt(0)).assertEqual('d');
    });

    /**
     * @tc.name          constantContractErrorBoundsArePinned
     * @tc.desc          The failure code range runs from 16000001 to 16000005.
     * @tc.precondition  Error constants are exported.
     * @tc.steps         1. Read the minimum. 2. Read the maximum. 3. Compare the span.
     * @tc.expected      The range has five members spanning four steps.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractErrorBoundsArePinned', 0, () => {
      logStep('constantContract', 'error bounds');
      const failures: number[] = [ERROR_CONNECT, ERROR_DISCONNECT, ERROR_SEND, ERROR_PROXY_INVALID,
        ERROR_DEATH_REGISTER];
      let minimum = failures[0];
      let maximum = failures[0];
      for (let index = 0; index < failures.length; index++) {
        if (failures[index] < minimum) {
          minimum = failures[index];
        }
        if (failures[index] > maximum) {
          maximum = failures[index];
        }
      }
      expect(minimum).assertEqual(16000001);
      expect(maximum).assertEqual(16000005);
      expect(maximum - minimum).assertEqual(4);
      expect(failures.length).assertEqual(5);
      expect(errorCodes().length).assertEqual(6);
      expect(minimum > ERROR_NONE).assertTrue();
      expect(String(maximum)).assertEqual('16000005');
    });

    /**
     * @tc.name          constantContractClampTimingConstants
     * @tc.desc          Timing constants clamp to the toast window deterministically.
     * @tc.precondition  clampInt and timing constants are exported.
     * @tc.steps         1. Clamp the probe high. 2. Clamp zero low. 3. Clamp the toast.
     * @tc.expected      The probe clamps to 3000 and zero to 1000.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractClampTimingConstants', 0, () => {
      logStep('constantContract', 'clamp timing');
      expect(clampInt(DISCONNECT_PROBE_MS, 1000, 3000)).assertEqual(3000);
      expect(clampInt(0, 1000, 3000)).assertEqual(1000);
      expect(clampInt(TOAST_DURATION_MS, 1000, 3000)).assertEqual(2000);
      expect(clampInt(5000, 1000, 3000)).assertEqual(3000);
      expect(clampInt(1500, 1000, 3000)).assertEqual(1500);
      expect(clampInt(1000, 1000, 3000)).assertEqual(1000);
      expect(clampInt(3000, 1000, 3000)).assertEqual(3000);
      expect(clampInt(-1, 1000, 3000) === 1000).assertTrue();
    });

    /**
     * @tc.name          constantContractJoinSplitRoundTrip
     * @tc.desc          A joined list splits back to its original members.
     * @tc.precondition  joined is exported.
     * @tc.steps         1. Join three values. 2. Split the result. 3. Compare the members.
     * @tc.expected      The split restores all three values in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractJoinSplitRoundTrip', 0, () => {
      logStep('constantContract', 'join split');
      const values: string[] = [STATE_DISCONNECTED, STATE_CONNECTING, STATE_CONNECTED];
      const text = joined(values, '::');
      const parts = text.split('::');
      expect(text).assertEqual('disconnected::connecting::connected');
      expect(parts.length).assertEqual(3);
      expect(parts[0]).assertEqual(values[0]);
      expect(parts[1]).assertEqual(values[1]);
      expect(parts[2]).assertEqual(values[2]);
      expect(joined(parts, '::')).assertEqual(text);
      expect(countOf(parts, STATE_CONNECTING)).assertEqual(1);
      expect(text.indexOf('::')).assertEqual(12);
    });

    /**
     * @tc.name          constantContractToastSetFingerprintIsStable
     * @tc.desc          The six toast texts have a deterministic fingerprint.
     * @tc.precondition  Toast constants are exported.
     * @tc.steps         1. Join the toasts. 2. Fingerprint twice. 3. Compare to a rebuilt
     *                   array.
     * @tc.expected      The fingerprint is stable across rebuilds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('constantContractToastSetFingerprintIsStable', 0, () => {
      logStep('constantContract', 'toast fingerprint');
      const first = toastTexts();
      const second = toastTexts();
      const fingerprint = textFingerprint(joined(first, '|'));
      expect(fingerprint).assertEqual(textFingerprint(joined(second, '|')));
      expect(fingerprint > 0).assertTrue();
      expect(fingerprint === textFingerprint(joined(first, ','))).assertFalse();
      expect(joined(first, '|').split('|').length).assertEqual(6);
      expect(uniqueStrings(first).length).assertEqual(6);
      expect(textFingerprint(joined(first, '|'))).assertEqual(fingerprint);
    });

    /**
     * @tc.name          constantContractSuccessToastLengths
     * @tc.desc          The three success toasts have pinned lengths.
     * @tc.precondition  Toast constants are exported.
     * @tc.steps         1. Read the connect toast. 2. Read the send toast. 3. Read the
     *                   disconnect toast.
     * @tc.expected      Lengths are twenty two, nineteen and twenty five.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractSuccessToastLengths', 0, () => {
      logStep('constantContract', 'success toast lengths');
      expect(CONNECT_SUCCESS_TOAST.length).assertEqual(22);
      expect(SEND_SUCCESS_TOAST.length).assertEqual(19);
      expect(DISCONNECT_SUCCESS_TOAST.length).assertEqual(25);
      expect(CONNECT_SUCCESS_TOAST.endsWith('success')).assertTrue();
      expect(SEND_SUCCESS_TOAST.endsWith('success')).assertTrue();
      expect(DISCONNECT_SUCCESS_TOAST.endsWith('success')).assertTrue();
      expect(CONNECT_SUCCESS_TOAST.length - SEND_SUCCESS_TOAST.length).assertEqual(3);
      expect(DISCONNECT_SUCCESS_TOAST.length - CONNECT_SUCCESS_TOAST.length).assertEqual(3);
    });

    /**
     * @tc.name          constantContractErrorCodeTextLengths
     * @tc.desc          The five failure codes are eight digit strings.
     * @tc.precondition  Error constants are exported.
     * @tc.steps         1. Map each failure to text. 2. Read the lengths. 3. Check the
     *                   zero code.
     * @tc.expected      Every failure text is eight chars and zero is one char.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractErrorCodeTextLengths', 0, () => {
      logStep('constantContract', 'error text lengths');
      const failures: number[] = [ERROR_CONNECT, ERROR_DISCONNECT, ERROR_SEND, ERROR_PROXY_INVALID,
        ERROR_DEATH_REGISTER];
      for (let index = 0; index < failures.length; index++) {
        expect(String(failures[index]).length).assertEqual(8);
      }
      expect(String(ERROR_NONE)).assertEqual('0');
      expect(String(ERROR_NONE).length).assertEqual(1);
      expect(String(ERROR_DEATH_REGISTER)).assertEqual('16000005');
      expect(String(ERROR_CONNECT).charAt(0)).assertEqual('1');
      expect(String(ERROR_CONNECT).charAt(7)).assertEqual('1');
      expect(String(ERROR_DEATH_REGISTER).charAt(7)).assertEqual('5');
      expect(String(ERROR_NONE) === String(ERROR_CONNECT)).assertFalse();
    });

    /**
     * @tc.name          constantContractOptionSyncAlignsWithZeroError
     * @tc.desc          The sync flag shares the zero value with ERROR_NONE.
     * @tc.precondition  Option and error constants are exported.
     * @tc.steps         1. Compare both zeros. 2. Compare the async flag. 3. Check the
     *                   ordering.
     * @tc.expected      Sync equals zero and async is greater than it.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('constantContractOptionSyncAlignsWithZeroError', 0, () => {
      logStep('constantContract', 'option aligns zero');
      expect(OPTION_FLAG_SYNC).assertEqual(ERROR_NONE);
      expect(OPTION_FLAG_SYNC).assertEqual(0);
      expect(OPTION_FLAG_ASYNC).assertEqual(1);
      expect(OPTION_FLAG_ASYNC > OPTION_FLAG_SYNC).assertTrue();
      expect(OPTION_FLAG_SYNC < ERROR_CONNECT).assertTrue();
      expect(OPTION_FLAG_ASYNC < ERROR_CONNECT).assertTrue();
      expect(OPTION_FLAG_SYNC + OPTION_FLAG_ASYNC).assertEqual(1);
      expect(String(OPTION_FLAG_SYNC)).assertEqual('0');
    });

    /**
     * @tc.name          constantContractInitialIdIsNotPositive
     * @tc.desc          The initial connect id is not a usable handle.
     * @tc.precondition  INITIAL_CONNECT_ID is exported.
     * @tc.steps         1. Compare it to zero. 2. Compare it to the unknown code. 3. Check
     *                   the sign.
     * @tc.expected      The sentinel is minus one and never positive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractInitialIdIsNotPositive', 0, () => {
      logStep('constantContract', 'initial id not positive');
      expect(INITIAL_CONNECT_ID).assertEqual(-1);
      expect(INITIAL_CONNECT_ID === UNKNOWN_CODE_NEGATIVE).assertTrue();
      expect(INITIAL_CONNECT_ID < 0).assertTrue();
      expect(INITIAL_CONNECT_ID <= REQUEST_CODE).assertTrue();
      expect(INITIAL_CONNECT_ID + 1).assertEqual(0);
      expect(INITIAL_CONNECT_ID * -1).assertEqual(1);
      expect(String(INITIAL_CONNECT_ID)).assertEqual('-1');
      expect(INITIAL_CONNECT_ID > 0).assertFalse();
    });

    /**
     * @tc.name          constantContractDescriptorIsNotLowercase
     * @tc.desc          The descriptor contains upper case letters by contract.
     * @tc.precondition  STUB_DESCRIPTOR is exported.
     * @tc.steps         1. Compare the literal to its lower case. 2. Compare to its upper
     *                   case. 3. Check the prefix.
     * @tc.expected      The descriptor is mixed case and already differs from both folds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractDescriptorIsNotLowercase', 0, () => {
      logStep('constantContract', 'descriptor case');
      expect(STUB_DESCRIPTOR === STUB_DESCRIPTOR.toLowerCase()).assertFalse();
      expect(STUB_DESCRIPTOR === STUB_DESCRIPTOR.toUpperCase()).assertFalse();
      expect(STUB_DESCRIPTOR.startsWith('IPC')).assertTrue();
      expect(STUB_DESCRIPTOR.charAt(3)).assertEqual('S');
      expect(STUB_DESCRIPTOR.toUpperCase()).assertEqual('IPCSTUBTEST');
      expect(STUB_DESCRIPTOR.toLowerCase()).assertEqual('ipcstubtest');
      expect(STUB_DESCRIPTOR.indexOf('Stub')).assertEqual(3);
      expect(STUB_DESCRIPTOR.indexOf('Test')).assertEqual(7);
    });

    /**
     * @tc.name          constantContractToastFingerprintsDiffer
     * @tc.desc          Distinct toast texts have distinct fingerprints.
     * @tc.precondition  Toast constants are exported.
     * @tc.steps         1. Fingerprint the success toasts. 2. Fingerprint the failure
     *                   toasts. 3. Compare both groups.
     * @tc.expected      All six fingerprints are distinct.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('constantContractToastFingerprintsDiffer', 0, () => {
      logStep('constantContract', 'toast fingerprints');
      const toasts = toastTexts();
      const fingerprints: string[] = [];
      for (let index = 0; index < toasts.length; index++) {
        fingerprints.push(String(textFingerprint(toasts[index])));
      }
      expect(uniqueStrings(fingerprints).length).assertEqual(6);
      expect(fingerprints.length).assertEqual(6);
      expect(fingerprints[0] === fingerprints[1]).assertFalse();
      expect(fingerprints[2] === fingerprints[3]).assertFalse();
      expect(fingerprints[4] === fingerprints[5]).assertFalse();
      expect(textFingerprint(toasts[0]) === textFingerprint(toasts[5])).assertFalse();
      expect(countOf(fingerprints, fingerprints[0])).assertEqual(1);
    });

    /**
     * @tc.name          constantContractPayloadsShareHelloPrefix
     * @tc.desc          Request and reply payloads share a hello prefix.
     * @tc.precondition  Payload constants are exported.
     * @tc.steps         1. Compare the shared prefix. 2. Compare the suffixes. 3. Compare
     *                   the lengths.
     * @tc.expected      Both start with hello and differ after the space.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractPayloadsShareHelloPrefix', 0, () => {
      logStep('constantContract', 'payload prefix');
      expect(REQUEST_PAYLOAD.substring(0, 6)).assertEqual('hello ');
      expect(REPLY_PAYLOAD.substring(0, 6)).assertEqual('hello ');
      expect(REQUEST_PAYLOAD.substring(6)).assertEqual('world');
      expect(REPLY_PAYLOAD.substring(6)).assertEqual('rpc');
      expect(REQUEST_PAYLOAD.length - REPLY_PAYLOAD.length).assertEqual(2);
      expect(REQUEST_PAYLOAD.indexOf(' ')).assertEqual(5);
      expect(REPLY_PAYLOAD.indexOf(' ')).assertEqual(5);
      expect(textFingerprint(REQUEST_PAYLOAD) === textFingerprint(REPLY_PAYLOAD)).assertFalse();
    });

    /**
     * @tc.name          constantContractStateSequenceJoinIsPinned
     * @tc.desc          The four states join into a fixed lifecycle string.
     * @tc.precondition  State constants are exported.
     * @tc.steps         1. Join the states with arrows. 2. Split the result. 3. Compare the
     *                   fingerprint.
     * @tc.expected      The joined lifecycle string is pinned.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractStateSequenceJoinIsPinned', 0, () => {
      logStep('constantContract', 'state sequence');
      const lifecycle = joined(stateNames(), '->');
      expect(lifecycle).assertEqual('disconnected->connecting->connected->failed');
      expect(lifecycle.split('->').length).assertEqual(4);
      expect(lifecycle.indexOf('->')).assertEqual(12);
      expect(countOf(lifecycle.split('->'), STATE_CONNECTED)).assertEqual(1);
      expect(textFingerprint(lifecycle)).assertEqual(textFingerprint('disconnected->connecting->connected->failed'));
      expect(lifecycle.startsWith(STATE_DISCONNECTED)).assertTrue();
      expect(lifecycle.endsWith(STATE_FAILED)).assertTrue();
      expect(uniqueStrings(lifecycle.split('->')).length).assertEqual(4);
    });

    /**
     * @tc.name          constantContractToastCountIsSix
     * @tc.desc          Exactly six toast constants are declared.
     * @tc.precondition  Toast constants are exported.
     * @tc.steps         1. Count the toasts. 2. Count the unique texts. 3. Count the failure
     *                   texts.
     * @tc.expected      Six toasts with six unique values and three failures.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractToastCountIsSix', 0, () => {
      logStep('constantContract', 'toast count six');
      const toasts = toastTexts();
      expect(toasts.length).assertEqual(6);
      expect(uniqueStrings(toasts).length).assertEqual(6);
      expect(countOf(toasts, CONNECT_SUCCESS_TOAST)).assertEqual(1);
      expect(toasts.indexOf(SEND_FAIL_TOAST)).assertEqual(3);
      expect(toasts.indexOf(DISCONNECT_SUCCESS_TOAST)).assertEqual(5);
      expect(toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(toasts[5]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(toasts.length / 2).assertEqual(3);
    });

    /**
     * @tc.name          constantContractErrorOrderIsIncreasing
     * @tc.desc          The five failure codes increase in declaration order.
     * @tc.precondition  Error constants are exported.
     * @tc.steps         1. Walk the failures. 2. Compare each pair. 3. Check the last value.
     * @tc.expected      Every code is strictly greater than its predecessor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractErrorOrderIsIncreasing', 0, () => {
      logStep('constantContract', 'error order increasing');
      const failures: number[] = [ERROR_CONNECT, ERROR_DISCONNECT, ERROR_SEND, ERROR_PROXY_INVALID,
        ERROR_DEATH_REGISTER];
      for (let index = 1; index < failures.length; index++) {
        expect(failures[index] > failures[index - 1]).assertTrue();
      }
      expect(failures[0]).assertEqual(16000001);
      expect(failures[4]).assertEqual(16000005);
      expect(failures[4] - failures[3]).assertEqual(1);
      expect(failures[1] - failures[0]).assertEqual(1);
      expect(countOf(['16000001', '16000002', '16000003', '16000004', '16000005'], '16000003'))
        .assertEqual(1);
      expect(failures.length).assertEqual(5);
    });

    /**
     * @tc.name          constantContractTagDiffersFromDescriptor
     * @tc.desc          The log tag and the stub descriptor are different literals.
     * @tc.precondition  Both constants are exported.
     * @tc.steps         1. Compare the values. 2. Compare the lengths. 3. Compare the
     *                   fingerprints.
     * @tc.expected      The tag is testTag and the descriptor IPCStubTest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractTagDiffersFromDescriptor', 0, () => {
      logStep('constantContract', 'tag differs');
      expect(LOG_TAG === STUB_DESCRIPTOR).assertFalse();
      expect(LOG_TAG).assertEqual('testTag');
      expect(STUB_DESCRIPTOR).assertEqual('IPCStubTest');
      expect(LOG_TAG.length).assertEqual(7);
      expect(STUB_DESCRIPTOR.length).assertEqual(11);
      expect(LOG_TAG.length < STUB_DESCRIPTOR.length).assertTrue();
      expect(textFingerprint(LOG_TAG) === textFingerprint(STUB_DESCRIPTOR)).assertFalse();
      expect(LOG_TAG.indexOf('IPC')).assertEqual(-1);
      expect(STUB_DESCRIPTOR.indexOf('tag')).assertEqual(-1);
    });

    /**
     * @tc.name          constantContractNegativeUnknownMatchesSentinel
     * @tc.desc          The negative unknown code equals the connect sentinel.
     * @tc.precondition  Both constants are exported.
     * @tc.steps         1. Compare the values. 2. Check the predicates. 3. Compare the signs.
     * @tc.expected      Both are minus one and neither is a known request code.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractNegativeUnknownMatchesSentinel', 0, () => {
      logStep('constantContract', 'negative unknown');
      expect(UNKNOWN_CODE_NEGATIVE).assertEqual(INITIAL_CONNECT_ID);
      expect(UNKNOWN_CODE_NEGATIVE).assertEqual(-1);
      expect(UNKNOWN_CODE_NEGATIVE < 0).assertTrue();
      expect(isKnownRequestCode(UNKNOWN_CODE_NEGATIVE)).assertFalse();
      expect(isNonZeroError(UNKNOWN_CODE_NEGATIVE)).assertTrue();
      expect(UNKNOWN_CODE_NEGATIVE + 1).assertEqual(0);
      expect(UNKNOWN_CODE_ZERO > UNKNOWN_CODE_NEGATIVE).assertTrue();
      expect(UNKNOWN_CODE_TWO > UNKNOWN_CODE_NEGATIVE).assertTrue();
    });

    /**
     * @tc.name          constantContractPayloadSpacePositions
     * @tc.desc          Both payloads put their single space at index five.
     * @tc.precondition  Payload constants are exported.
     * @tc.steps         1. Search for the space. 2. Count the spaces. 3. Compare the joined
     *                   forms.
     * @tc.expected      Each payload has one space at index five.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractPayloadSpacePositions', 0, () => {
      logStep('constantContract', 'payload spaces');
      expect(countOf(REQUEST_PAYLOAD.split(''), ' ')).assertEqual(1);
      expect(countOf(REPLY_PAYLOAD.split(''), ' ')).assertEqual(1);
      expect(REQUEST_PAYLOAD.indexOf(' ')).assertEqual(5);
      expect(REPLY_PAYLOAD.indexOf(' ')).assertEqual(5);
      expect(REQUEST_PAYLOAD.split(' ').length).assertEqual(2);
      expect(REPLY_PAYLOAD.split(' ').length).assertEqual(2);
      expect(REQUEST_PAYLOAD.charAt(5)).assertEqual(' ');
      expect(REPLY_PAYLOAD.charAt(5)).assertEqual(' ');
      expect(joined([REQUEST_PAYLOAD, REPLY_PAYLOAD], '|')).assertEqual('hello world|hello rpc');
    });

    /**
     * @tc.name          constantContractClampNegativeRange
     * @tc.desc          clampInt handles a fully negative range.
     * @tc.precondition  clampInt is exported.
     * @tc.steps         1. Clamp below, inside and above a negative range. 2. Compare each
     *                   result. 3. Check the identity case.
     * @tc.expected      The negative bounds are respected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('constantContractClampNegativeRange', 0, () => {
      logStep('constantContract', 'negative clamp');
      expect(clampInt(-100, -50, -10)).assertEqual(-50);
      expect(clampInt(-30, -50, -10)).assertEqual(-30);
      expect(clampInt(0, -50, -10)).assertEqual(-10);
      expect(clampInt(-50, -50, -10)).assertEqual(-50);
      expect(clampInt(-10, -50, -10)).assertEqual(-10);
      expect(clampInt(-1, -1, -1)).assertEqual(-1);
      expect(clampInt(5, -50, -10)).assertEqual(-10);
      expect(clampInt(-1000, -50, -10) < 0).assertTrue();
    });

    /**
     * @tc.name          constantContractUnknownTwoIsRequestPlusOne
     * @tc.desc          The unknown code two sits one above the request code.
     * @tc.precondition  Request and unknown constants are exported.
     * @tc.steps         1. Subtract the request code. 2. Check the predicates. 3. Compare the
     *                   literal.
     * @tc.expected      The difference is one and the code is not known.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractUnknownTwoIsRequestPlusOne', 0, () => {
      logStep('constantContract', 'unknown two');
      expect(UNKNOWN_CODE_TWO - REQUEST_CODE).assertEqual(1);
      expect(UNKNOWN_CODE_TWO).assertEqual(2);
      expect(isKnownRequestCode(UNKNOWN_CODE_TWO)).assertFalse();
      expect(isKnownRequestCode(UNKNOWN_CODE_TWO - 1)).assertTrue();
      expect(isNonZeroError(UNKNOWN_CODE_TWO)).assertTrue();
      expect(UNKNOWN_CODE_TWO < UNKNOWN_CODE_LARGE).assertTrue();
      expect(UNKNOWN_CODE_TWO > UNKNOWN_CODE_ZERO).assertTrue();
      expect(String(UNKNOWN_CODE_TWO)).assertEqual('2');
    });

    /**
     * @tc.name          constantContractClampLargeValues
     * @tc.desc          clampInt handles values far outside the range.
     * @tc.precondition  clampInt is exported.
     * @tc.steps         1. Clamp a million. 2. Clamp a negative million. 3. Check the extremes
     *                   are returned.
     * @tc.expected      Both extreme values clamp to the nearest bound.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractClampLargeValues', 0, () => {
      logStep('constantContract', 'clamp large values');
      expect(clampInt(1000000, 0, 100)).assertEqual(100);
      expect(clampInt(-1000000, 0, 100)).assertEqual(0);
      expect(clampInt(1000000, 16000001, 16000005)).assertEqual(16000001);
      expect(clampInt(0, 16000001, 16000005)).assertEqual(16000001);
      expect(clampInt(16000003, 16000001, 16000005)).assertEqual(16000003);
      expect(clampInt(999999999, 0, 1)).assertEqual(1);
      expect(clampInt(-999999999, 0, 1)).assertEqual(0);
      expect(clampInt(1000000, 0, 100) === 100).assertTrue();
    });

    /**
     * @tc.name          constantContractErrorTextWidthIsEight
     * @tc.desc          Every failure code serialises to eight characters.
     * @tc.precondition  Error constants are exported.
     * @tc.steps         1. Map each failure. 2. Check each length. 3. Check the shared prefix.
     * @tc.expected      All five texts start with 1600000 and are eight chars.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractErrorTextWidthIsEight', 0, () => {
      logStep('constantContract', 'error text width');
      const failures: number[] = [ERROR_CONNECT, ERROR_DISCONNECT, ERROR_SEND, ERROR_PROXY_INVALID,
        ERROR_DEATH_REGISTER];
      for (let index = 0; index < failures.length; index++) {
        const text = String(failures[index]);
        expect(text.length).assertEqual(8);
        expect(text.startsWith('1600000')).assertTrue();
        expect(text.charAt(7)).assertEqual(String(index + 1));
      }
      expect(String(ERROR_CONNECT).substring(0, 7)).assertEqual('1600000');
      expect(String(ERROR_DEATH_REGISTER).substring(7)).assertEqual('5');
      expect(String(ERROR_SEND).substring(7)).assertEqual('3');
      expect(String(ERROR_PROXY_INVALID).substring(7)).assertEqual('4');
    });

    /**
     * @tc.name          constantContractDescriptorHasNoSeparators
     * @tc.desc          The descriptor contains no path or bundle separators.
     * @tc.precondition  STUB_DESCRIPTOR is exported.
     * @tc.steps         1. Search for a dot. 2. Search for a slash. 3. Search for a backslash.
     * @tc.expected      No separator appears in the descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractDescriptorHasNoSeparators', 0, () => {
      logStep('constantContract', 'descriptor separators');
      expect(STUB_DESCRIPTOR.indexOf('.')).assertEqual(-1);
      expect(STUB_DESCRIPTOR.indexOf('/')).assertEqual(-1);
      expect(STUB_DESCRIPTOR.indexOf('\\')).assertEqual(-1);
      expect(STUB_DESCRIPTOR.indexOf('-')).assertEqual(-1);
      expect(STUB_DESCRIPTOR.indexOf(' ')).assertEqual(-1);
      expect(STUB_DESCRIPTOR.indexOf('_')).assertEqual(-1);
      expect(TARGET_BUNDLE.indexOf('.')).assertEqual(3);
      expect(STUB_DESCRIPTOR.split('.').length).assertEqual(1);
      expect(STUB_DESCRIPTOR.split('/').length).assertEqual(1);
      expect(STUB_DESCRIPTOR.split(' ').length).assertEqual(1);
    });

    /**
     * @tc.name          constantContractFailureToastsAreLonger
     * @tc.desc          Failure toasts are longer than their success counterparts.
     * @tc.precondition  Toast constants are exported.
     * @tc.steps         1. Compare connect lengths. 2. Compare send lengths. 3. Compare
     *                   disconnect lengths.
     * @tc.expected      Every failure text is longer than its success text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractFailureToastsAreLonger', 0, () => {
      logStep('constantContract', 'failure toasts longer');
      expect(CONNECT_FAIL_TOAST.length > CONNECT_SUCCESS_TOAST.length).assertTrue();
      expect(SEND_FAIL_TOAST.length > SEND_SUCCESS_TOAST.length).assertTrue();
      expect(DISCONNECT_FAIL_TOAST.length > DISCONNECT_SUCCESS_TOAST.length).assertTrue();
      expect(CONNECT_FAIL_TOAST.length > 60).assertTrue();
      expect(SEND_FAIL_TOAST.length > 40).assertTrue();
      expect(DISCONNECT_FAIL_TOAST.length > 40).assertTrue();
      expect(CONNECT_FAIL_TOAST.indexOf('Please')).assertEqual(16);
      expect(DISCONNECT_FAIL_TOAST.indexOf('Please')).assertEqual(19);
      expect(SEND_FAIL_TOAST.indexOf('please')).assertEqual(20);
    });

    /**
     * @tc.name          constantContractEveryFailureIsNonZero
     * @tc.desc          Every declared failure code satisfies isNonZeroError.
     * @tc.precondition  Error constants and the predicate are exported.
     * @tc.steps         1. Walk the five failures. 2. Check the predicate. 3. Check zero.
     * @tc.expected      All five pass and zero fails.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractEveryFailureIsNonZero', 0, () => {
      logStep('constantContract', 'every failure nonzero');
      const failures: number[] = [ERROR_CONNECT, ERROR_DISCONNECT, ERROR_SEND, ERROR_PROXY_INVALID,
        ERROR_DEATH_REGISTER];
      for (let index = 0; index < failures.length; index++) {
        expect(isNonZeroError(failures[index])).assertTrue();
        expect(failures[index] > ERROR_NONE).assertTrue();
        expect(failures[index] === ERROR_NONE).assertFalse();
      }
      expect(isNonZeroError(ERROR_NONE)).assertFalse();
      expect(isNonZeroError(ERROR_CONNECT)).assertTrue();
      expect(countOf(['1', '1', '1', '1', '1'], '1')).assertEqual(5);
      expect(failures.length).assertEqual(5);
    });

  });
}
