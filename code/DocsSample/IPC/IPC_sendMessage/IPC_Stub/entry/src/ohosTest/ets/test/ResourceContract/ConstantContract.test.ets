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
  STUB_DESCRIPTOR, STUB_BUNDLE, STUB_ABILITY, CLIENT_BUNDLE, REQUEST_CODE, UNKNOWN_CODE_ZERO,
  UNKNOWN_CODE_TWO, UNKNOWN_CODE_NEGATIVE, UNKNOWN_CODE_LARGE, REQUEST_PAYLOAD, REPLY_PAYLOAD,
  EVENT_ON_CREATE, EVENT_ON_REQUEST, EVENT_ON_CONNECT, EVENT_ON_DISCONNECT, EVENT_ON_DESTROY,
  EVENT_ON_REMOTE_DIED, ERROR_NONE, ERROR_STUB_REJECTED, ERROR_STUB_NOT_ALIVE, ERROR_SEQUENCE_RECLAIMED,
  OPTION_FLAG_SYNC, OPTION_FLAG_ASYNC, LEVEL_INFO, LEVEL_WARN, LEVEL_ERROR, joined, countOf, uniqueStrings,
  sameStringArray, textFingerprint, isKnownRequestCode, expectedHandled, expectedReplyFor, expectedDescriptor,
  StubRemoteObjectModel, MessageOptionModel, RequestResultModel, InProcessClient, LogBuffer
} from '../Shared/SharedDriver';

class ContractCheck {
  public name: string;
  public actual: string;
  public expected: string;
  public pass: boolean;

  constructor(name: string, actual: string, expected: string) {
    this.name = name;
    this.actual = actual;
    this.expected = expected;
    this.pass = actual === expected;
  }

  public token(): string {
    return this.name + '=' + this.actual + '/' + this.expected;
  }
}

function stringContract(name: string, actual: string, expected: string): ContractCheck {
  return new ContractCheck(name, actual, expected);
}

function inBand(value: number, low: number, high: number): boolean {
  return value >= low && value <= high;
}

function allDistinct(values: number[]): boolean {
  const seen: number[] = [];
  for (let index = 0; index < values.length; index++) {
    if (seen.indexOf(values[index]) >= 0) {
      return false;
    }
    seen.push(values[index]);
  }
  return true;
}

function allUnique(values: string[]): boolean {
  const seen: string[] = [];
  for (let index = 0; index < values.length; index++) {
    if (seen.indexOf(values[index]) >= 0) {
      return false;
    }
    seen.push(values[index]);
  }
  return true;
}

function isUpperWord(value: string): boolean {
  if (value.length === 0) {
    return false;
  }
  for (let index = 0; index < value.length; index++) {
    if (value.charAt(index) !== value.charAt(index).toUpperCase()) {
      return false;
    }
  }
  return true;
}

function dotCount(value: string): number {
  let total = 0;
  for (let index = 0; index < value.length; index++) {
    if (value.charAt(index) === '.') {
      total = total + 1;
    }
  }
  return total;
}

function applyLevel(level: string): LogBuffer {
  const buffer: LogBuffer = new LogBuffer(4);
  if (level === LEVEL_INFO) {
    buffer.info('probe');
  } else if (level === LEVEL_WARN) {
    buffer.warn('probe');
  } else {
    buffer.error('probe');
  }
  return buffer;
}

export default function constantContract(): void {
  describe('ConstantContractTest', () => {
    beforeAll(() => {
      logSuite('ConstantContractTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ConstantContractTest', 'end');
    });

    /**
     * @tc.name          constantContractDescriptorValue
     * @tc.desc          Constant stub descriptor keeps its published string value.
     * @tc.precondition  The shared driver exports the constant.
     * @tc.steps         1. Read the exported value "STUB_DESCRIPTOR".
     *                   2. Compare it with the published literal.
     *                   3. Check the length, type and trimming.
     *                   4. Compare the contract token and fingerprint.
     * @tc.expected      The value equals the literal with the published length and type.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractDescriptorValue', 0, () => {
      const value: string = STUB_DESCRIPTOR;
      const contract: ContractCheck = stringContract("STUB_DESCRIPTOR", value, 'IPCStubTest');
      expect(value).assertEqual('IPCStubTest');
      expect(value.length).assertEqual(11);
      expect(value.indexOf("") >= 0).assertTrue();
      expect(contract.pass).assertTrue();
      expect(contract.token().indexOf('IPCStubTest') >= 0).assertTrue();
      expect(value.trim()).assertEqual(value);
      expect(value.charCodeAt(0) > 32).assertTrue();
      expect(textFingerprint(value)).assertEqual(textFingerprint('IPCStubTest'));
      logStep("constantContractDescriptorValue", contract.token());
    });

    /**
     * @tc.name          constantContractDescriptorOracle
     * @tc.desc          The descriptor oracle labelled descriptor oracle agrees with the stub default.
     * @tc.precondition  The oracle and the stub constructor both derive the descriptor.
     * @tc.steps         1. Call the descriptor oracle.
     *                   2. Construct a default stub.
     *                   3. Compare the two descriptors with the constant.
     *                   4. Check the prefix and suffix of the literal.
     * @tc.expected      The oracle, the stub and the constant all return IPCStubTest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractDescriptorOracle', 0, () => {
      const oracle: string = expectedDescriptor();
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      expect(oracle).assertEqual(STUB_DESCRIPTOR);
      expect(stub.descriptor).assertEqual(oracle);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(oracle.length).assertEqual(11);
      expect(oracle.startsWith("IPC")).assertTrue();
      expect(oracle.endsWith("Test")).assertTrue();
      expect(expectedDescriptor()).assertEqual(oracle);
      expect(stringContract("oracle", oracle, STUB_DESCRIPTOR).pass).assertTrue();
      logStep("constantContractDescriptorOracle", oracle);
    });

    /**
     * @tc.name          constantContractDescriptorModelDefault
     * @tc.desc          The descriptor oracle labelled descriptor model default agrees with the stub default.
     * @tc.precondition  The oracle and the stub constructor both derive the descriptor.
     * @tc.steps         1. Call the descriptor oracle.
     *                   2. Construct a default stub.
     *                   3. Compare the two descriptors with the constant.
     *                   4. Check the prefix and suffix of the literal.
     * @tc.expected      The oracle, the stub and the constant all return IPCStubTest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractDescriptorModelDefault', 0, () => {
      const oracle: string = expectedDescriptor();
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      expect(oracle).assertEqual(STUB_DESCRIPTOR);
      expect(stub.descriptor).assertEqual(oracle);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(oracle.length).assertEqual(11);
      expect(oracle.startsWith("IPC")).assertTrue();
      expect(oracle.endsWith("Test")).assertTrue();
      expect(expectedDescriptor()).assertEqual(oracle);
      expect(stringContract("oracle", oracle, STUB_DESCRIPTOR).pass).assertTrue();
      logStep("constantContractDescriptorModelDefault", oracle);
    });

    /**
     * @tc.name          constantContractStubBundle
     * @tc.desc          Constant stub bundle keeps its published string value.
     * @tc.precondition  The shared driver exports the constant.
     * @tc.steps         1. Read the exported value "STUB_BUNDLE".
     *                   2. Compare it with the published literal.
     *                   3. Check the length, type and trimming.
     *                   4. Compare the contract token and fingerprint.
     * @tc.expected      The value equals the literal with the published length and type.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractStubBundle', 0, () => {
      const value: string = STUB_BUNDLE;
      const contract: ContractCheck = stringContract("STUB_BUNDLE", value, 'com.example.ipc_stub');
      expect(value).assertEqual('com.example.ipc_stub');
      expect(value.length).assertEqual(20);
      expect(value.indexOf("") >= 0).assertTrue();
      expect(contract.pass).assertTrue();
      expect(contract.token().indexOf('com.example.ipc_stub') >= 0).assertTrue();
      expect(value.trim()).assertEqual(value);
      expect(value.charCodeAt(0) > 32).assertTrue();
      expect(textFingerprint(value)).assertEqual(textFingerprint('com.example.ipc_stub'));
      logStep("constantContractStubBundle", contract.token());
    });

    /**
     * @tc.name          constantContractClientBundle
     * @tc.desc          Constant client bundle keeps its published string value.
     * @tc.precondition  The shared driver exports the constant.
     * @tc.steps         1. Read the exported value "CLIENT_BUNDLE".
     *                   2. Compare it with the published literal.
     *                   3. Check the length, type and trimming.
     *                   4. Compare the contract token and fingerprint.
     * @tc.expected      The value equals the literal with the published length and type.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractClientBundle', 0, () => {
      const value: string = CLIENT_BUNDLE;
      const contract: ContractCheck = stringContract("CLIENT_BUNDLE", value, 'com.example.ipc_client');
      expect(value).assertEqual('com.example.ipc_client');
      expect(value.length).assertEqual(22);
      expect(value.indexOf("") >= 0).assertTrue();
      expect(contract.pass).assertTrue();
      expect(contract.token().indexOf('com.example.ipc_client') >= 0).assertTrue();
      expect(value.trim()).assertEqual(value);
      expect(value.charCodeAt(0) > 32).assertTrue();
      expect(textFingerprint(value)).assertEqual(textFingerprint('com.example.ipc_client'));
      logStep("constantContractClientBundle", contract.token());
    });

    /**
     * @tc.name          constantContractAbilityName
     * @tc.desc          Constant ability name keeps its published string value.
     * @tc.precondition  The shared driver exports the constant.
     * @tc.steps         1. Read the exported value "STUB_ABILITY".
     *                   2. Compare it with the published literal.
     *                   3. Check the length, type and trimming.
     *                   4. Compare the contract token and fingerprint.
     * @tc.expected      The value equals the literal with the published length and type.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractAbilityName', 0, () => {
      const value: string = STUB_ABILITY;
      const contract: ContractCheck = stringContract("STUB_ABILITY", value, 'ServiceAbility');
      expect(value).assertEqual('ServiceAbility');
      expect(value.length).assertEqual(14);
      expect(value.indexOf("") >= 0).assertTrue();
      expect(contract.pass).assertTrue();
      expect(contract.token().indexOf('ServiceAbility') >= 0).assertTrue();
      expect(value.trim()).assertEqual(value);
      expect(value.charCodeAt(0) > 32).assertTrue();
      expect(textFingerprint(value)).assertEqual(textFingerprint('ServiceAbility'));
      logStep("constantContractAbilityName", contract.token());
    });

    /**
     * @tc.name          constantContractBundleShape
     * @tc.desc          Bundle names bundle shape keep the dotted reverse-domain shape.
     * @tc.precondition  All bundle constants are read from the shared driver.
     * @tc.steps         1. Count the dots in the stub bundle.
     *                   2. Count the dots in the client bundle.
     *                   3. Compare the two bundle literals.
     *                   4. Check the ability name has no dot.
     * @tc.expected      Both bundles carry two dots and the ability name stays a plain word.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractBundleShape', 0, () => {
      expect(dotCount(STUB_BUNDLE)).assertEqual(2);
      expect(dotCount(CLIENT_BUNDLE)).assertEqual(2);
      expect(STUB_BUNDLE).assertEqual("com.example.ipc_stub");
      expect(CLIENT_BUNDLE).assertEqual("com.example.ipc_client");
      expect(dotCount(STUB_ABILITY)).assertEqual(0);
      expect(STUB_BUNDLE === CLIENT_BUNDLE).assertFalse();
      expect(STUB_BUNDLE.startsWith("com.")).assertTrue();
      expect(CLIENT_BUNDLE.startsWith("com.")).assertTrue();
      expect(STUB_BUNDLE.split(".").length).assertEqual(3);
      expect(CLIENT_BUNDLE.split(".").length).assertEqual(3);
      logStep("constantContractBundleShape", STUB_BUNDLE + ":" + CLIENT_BUNDLE);
    });

    /**
     * @tc.name          constantContractBundleFamily
     * @tc.desc          The bundle family string family is unique and non-empty.
     * @tc.precondition  The family is collected from exported constants.
     * @tc.steps         1. Collect the family into an array.
     *                   2. Check pairwise uniqueness.
     *                   3. Check that every entry is non-empty.
     *                   4. Recompute the family size with uniqueStrings.
     * @tc.expected      The family has the published size with no duplicate or empty entry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractBundleFamily', 0, () => {
      const values: string[] = [STUB_BUNDLE, CLIENT_BUNDLE, STUB_ABILITY];
      expect(values.length).assertEqual(3);
      expect(allUnique(values)).assertTrue();
      expect(uniqueStrings(values).length).assertEqual(3);
      expect(values[0]).assertEqual(STUB_BUNDLE);
      expect(values.indexOf(STUB_BUNDLE)).assertEqual(0);
      expect(values.indexOf(STUB_BUNDLE, 1)).assertEqual(-1);
      expect(values.join("").length > 0).assertTrue();
      expect(countOf(values, STUB_BUNDLE)).assertEqual(1);
      logStep("constantContractBundleFamily", values.join(","));
    });

    /**
     * @tc.name          constantContractRequestCode
     * @tc.desc          Numeric constant request code stays inside its published band.
     * @tc.precondition  The shared driver exports the numeric constant.
     * @tc.steps         1. Read the exported value "REQUEST_CODE".
     *                   2. Compare it with the published number.
     *                   3. Check the inclusive band and integrality.
     *                   4. Check the string form and type.
     * @tc.expected      The value equals the literal, is integral, and lies inside the band.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractRequestCode', 0, () => {
      const value: number = REQUEST_CODE;
      expect(value).assertEqual(1);
      expect(value >= 1).assertTrue();
      expect(value <= 1).assertTrue();
      expect(inBand(value, 1, 1)).assertTrue();
      expect(Math.floor(value)).assertEqual(value);
      expect(String(value).indexOf(".")).assertEqual(-1);
      expect(String(value).length > 0).assertTrue();
      expect(value === 1).assertTrue();
      logStep("constantContractRequestCode", "REQUEST_CODE" + "=" + String(value));
    });

    /**
     * @tc.name          constantContractUnknownZero
     * @tc.desc          Numeric constant unknown zero stays inside its published band.
     * @tc.precondition  The shared driver exports the numeric constant.
     * @tc.steps         1. Read the exported value "UNKNOWN_CODE_ZERO".
     *                   2. Compare it with the published number.
     *                   3. Check the inclusive band and integrality.
     *                   4. Check the string form and type.
     * @tc.expected      The value equals the literal, is integral, and lies inside the band.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractUnknownZero', 0, () => {
      const value: number = UNKNOWN_CODE_ZERO;
      expect(value).assertEqual(0);
      expect(value >= 0).assertTrue();
      expect(value <= 0).assertTrue();
      expect(inBand(value, 0, 0)).assertTrue();
      expect(Math.floor(value)).assertEqual(value);
      expect(String(value).indexOf(".")).assertEqual(-1);
      expect(String(value).length > 0).assertTrue();
      expect(value === 0).assertTrue();
      logStep("constantContractUnknownZero", "UNKNOWN_CODE_ZERO" + "=" + String(value));
    });

    /**
     * @tc.name          constantContractUnknownTwo
     * @tc.desc          Numeric constant unknown two stays inside its published band.
     * @tc.precondition  The shared driver exports the numeric constant.
     * @tc.steps         1. Read the exported value "UNKNOWN_CODE_TWO".
     *                   2. Compare it with the published number.
     *                   3. Check the inclusive band and integrality.
     *                   4. Check the string form and type.
     * @tc.expected      The value equals the literal, is integral, and lies inside the band.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractUnknownTwo', 0, () => {
      const value: number = UNKNOWN_CODE_TWO;
      expect(value).assertEqual(2);
      expect(value >= 2).assertTrue();
      expect(value <= 2).assertTrue();
      expect(inBand(value, 2, 2)).assertTrue();
      expect(Math.floor(value)).assertEqual(value);
      expect(String(value).indexOf(".")).assertEqual(-1);
      expect(String(value).length > 0).assertTrue();
      expect(value === 2).assertTrue();
      logStep("constantContractUnknownTwo", "UNKNOWN_CODE_TWO" + "=" + String(value));
    });

    /**
     * @tc.name          constantContractUnknownNegative
     * @tc.desc          Numeric constant unknown negative stays inside its published band.
     * @tc.precondition  The shared driver exports the numeric constant.
     * @tc.steps         1. Read the exported value "UNKNOWN_CODE_NEGATIVE".
     *                   2. Compare it with the published number.
     *                   3. Check the inclusive band and integrality.
     *                   4. Check the string form and type.
     * @tc.expected      The value equals the literal, is integral, and lies inside the band.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractUnknownNegative', 0, () => {
      const value: number = UNKNOWN_CODE_NEGATIVE;
      expect(value).assertEqual(-1);
      expect(value >= -1).assertTrue();
      expect(value <= -1).assertTrue();
      expect(inBand(value, -1, -1)).assertTrue();
      expect(Math.floor(value)).assertEqual(value);
      expect(String(value).indexOf(".")).assertEqual(-1);
      expect(String(value).length > 0).assertTrue();
      expect(value === -1).assertTrue();
      logStep("constantContractUnknownNegative", "UNKNOWN_CODE_NEGATIVE" + "=" + String(value));
    });

    /**
     * @tc.name          constantContractUnknownLarge
     * @tc.desc          Numeric constant unknown large stays inside its published band.
     * @tc.precondition  The shared driver exports the numeric constant.
     * @tc.steps         1. Read the exported value "UNKNOWN_CODE_LARGE".
     *                   2. Compare it with the published number.
     *                   3. Check the inclusive band and integrality.
     *                   4. Check the string form and type.
     * @tc.expected      The value equals the literal, is integral, and lies inside the band.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractUnknownLarge', 0, () => {
      const value: number = UNKNOWN_CODE_LARGE;
      expect(value).assertEqual(99);
      expect(value >= 99).assertTrue();
      expect(value <= 99).assertTrue();
      expect(inBand(value, 99, 99)).assertTrue();
      expect(Math.floor(value)).assertEqual(value);
      expect(String(value).indexOf(".")).assertEqual(-1);
      expect(String(value).length > 0).assertTrue();
      expect(value === 99).assertTrue();
      logStep("constantContractUnknownLarge", "UNKNOWN_CODE_LARGE" + "=" + String(value));
    });

    /**
     * @tc.name          constantContractCodeFamily
     * @tc.desc          The code family numeric set is pairwise distinct.
     * @tc.precondition  All members of the numeric family are read together.
     * @tc.steps         1. Collect the family into an array.
     *                   2. Count the members.
     *                   3. Check pairwise distinctness.
     *                   4. Search for a missing sentinel value.
     * @tc.expected      Every member is unique and the sentinel is absent.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractCodeFamily', 0, () => {
      const values: number[] = [REQUEST_CODE, UNKNOWN_CODE_ZERO, UNKNOWN_CODE_TWO, UNKNOWN_CODE_NEGATIVE, UNKNOWN_CODE_LARGE];
      expect(values.length).assertEqual(5);
      expect(allDistinct(values)).assertTrue();
      expect(values[0]).assertEqual(REQUEST_CODE);
      expect(values.indexOf(REQUEST_CODE)).assertEqual(0);
      expect(values.indexOf(REQUEST_CODE, 1)).assertEqual(-1);
      expect(values.indexOf(42)).assertEqual(-1);
      expect(uniqueStrings(["a", "a", "b"]).length).assertEqual(2);
      expect(values.length > 1).assertTrue();
      logStep("constantContractCodeFamily", String(values.length));
    });

    /**
     * @tc.name          constantContractKnownProductionCode
     * @tc.desc          The known-code predicate for production code matches the single-code protocol.
     * @tc.precondition  The request-code predicate is compared against the production code.
     * @tc.steps         1. Evaluate the predicate for the production code.
     *                   2. Evaluate it for the probe code.
     *                   3. Compare the two verdicts.
     *                   4. Check the predicate is stable.
     * @tc.expected      Only code 1 is reported as known.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractKnownProductionCode', 0, () => {
      expect(isKnownRequestCode(REQUEST_CODE)).assertTrue();
      expect(isKnownRequestCode(1)).assertEqual(true);
      expect(isKnownRequestCode(1)).assertEqual(true);
      expect(isKnownRequestCode(0)).assertFalse();
      expect(isKnownRequestCode(-1)).assertFalse();
      expect(isKnownRequestCode(1)).assertEqual(isKnownRequestCode(1));
      expect(isKnownRequestCode(REQUEST_CODE + 1)).assertFalse();
      expect(isKnownRequestCode(REQUEST_CODE) === (REQUEST_CODE === 1)).assertTrue();
      logStep("constantContractKnownProductionCode", String(isKnownRequestCode(1)));
    });

    /**
     * @tc.name          constantContractKnownZeroCode
     * @tc.desc          The known-code predicate for zero code matches the single-code protocol.
     * @tc.precondition  The request-code predicate is compared against the production code.
     * @tc.steps         1. Evaluate the predicate for the production code.
     *                   2. Evaluate it for the probe code.
     *                   3. Compare the two verdicts.
     *                   4. Check the predicate is stable.
     * @tc.expected      Only code 1 is reported as known.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractKnownZeroCode', 0, () => {
      expect(isKnownRequestCode(REQUEST_CODE)).assertTrue();
      expect(isKnownRequestCode(0)).assertEqual(false);
      expect(isKnownRequestCode(1)).assertEqual(true);
      expect(isKnownRequestCode(0)).assertFalse();
      expect(isKnownRequestCode(-1)).assertFalse();
      expect(isKnownRequestCode(0)).assertEqual(isKnownRequestCode(0));
      expect(isKnownRequestCode(REQUEST_CODE + 1)).assertFalse();
      expect(isKnownRequestCode(REQUEST_CODE) === (REQUEST_CODE === 1)).assertTrue();
      logStep("constantContractKnownZeroCode", String(isKnownRequestCode(0)));
    });

    /**
     * @tc.name          constantContractKnownTwoCode
     * @tc.desc          The known-code predicate for two code matches the single-code protocol.
     * @tc.precondition  The request-code predicate is compared against the production code.
     * @tc.steps         1. Evaluate the predicate for the production code.
     *                   2. Evaluate it for the probe code.
     *                   3. Compare the two verdicts.
     *                   4. Check the predicate is stable.
     * @tc.expected      Only code 1 is reported as known.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractKnownTwoCode', 0, () => {
      expect(isKnownRequestCode(REQUEST_CODE)).assertTrue();
      expect(isKnownRequestCode(2)).assertEqual(false);
      expect(isKnownRequestCode(1)).assertEqual(true);
      expect(isKnownRequestCode(0)).assertFalse();
      expect(isKnownRequestCode(-1)).assertFalse();
      expect(isKnownRequestCode(2)).assertEqual(isKnownRequestCode(2));
      expect(isKnownRequestCode(REQUEST_CODE + 1)).assertFalse();
      expect(isKnownRequestCode(REQUEST_CODE) === (REQUEST_CODE === 1)).assertTrue();
      logStep("constantContractKnownTwoCode", String(isKnownRequestCode(2)));
    });

    /**
     * @tc.name          constantContractKnownNegativeCode
     * @tc.desc          The known-code predicate for negative code matches the single-code protocol.
     * @tc.precondition  The request-code predicate is compared against the production code.
     * @tc.steps         1. Evaluate the predicate for the production code.
     *                   2. Evaluate it for the probe code.
     *                   3. Compare the two verdicts.
     *                   4. Check the predicate is stable.
     * @tc.expected      Only code 1 is reported as known.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractKnownNegativeCode', 0, () => {
      expect(isKnownRequestCode(REQUEST_CODE)).assertTrue();
      expect(isKnownRequestCode(-1)).assertEqual(false);
      expect(isKnownRequestCode(1)).assertEqual(true);
      expect(isKnownRequestCode(0)).assertFalse();
      expect(isKnownRequestCode(-1)).assertFalse();
      expect(isKnownRequestCode(-1)).assertEqual(isKnownRequestCode(-1));
      expect(isKnownRequestCode(REQUEST_CODE + 1)).assertFalse();
      expect(isKnownRequestCode(REQUEST_CODE) === (REQUEST_CODE === 1)).assertTrue();
      logStep("constantContractKnownNegativeCode", String(isKnownRequestCode(-1)));
    });

    /**
     * @tc.name          constantContractRequestPayload
     * @tc.desc          Constant request payload keeps its published string value.
     * @tc.precondition  The shared driver exports the constant.
     * @tc.steps         1. Read the exported value "REQUEST_PAYLOAD".
     *                   2. Compare it with the published literal.
     *                   3. Check the length, type and trimming.
     *                   4. Compare the contract token and fingerprint.
     * @tc.expected      The value equals the literal with the published length and type.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractRequestPayload', 0, () => {
      const value: string = REQUEST_PAYLOAD;
      const contract: ContractCheck = stringContract("REQUEST_PAYLOAD", value, 'hello world');
      expect(value).assertEqual('hello world');
      expect(value.length).assertEqual(11);
      expect(value.indexOf("") >= 0).assertTrue();
      expect(contract.pass).assertTrue();
      expect(contract.token().indexOf('hello world') >= 0).assertTrue();
      expect(value.trim()).assertEqual(value);
      expect(value.charCodeAt(0) > 32).assertTrue();
      expect(textFingerprint(value)).assertEqual(textFingerprint('hello world'));
      logStep("constantContractRequestPayload", contract.token());
    });

    /**
     * @tc.name          constantContractReplyPayload
     * @tc.desc          Constant reply payload keeps its published string value.
     * @tc.precondition  The shared driver exports the constant.
     * @tc.steps         1. Read the exported value "REPLY_PAYLOAD".
     *                   2. Compare it with the published literal.
     *                   3. Check the length, type and trimming.
     *                   4. Compare the contract token and fingerprint.
     * @tc.expected      The value equals the literal with the published length and type.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractReplyPayload', 0, () => {
      const value: string = REPLY_PAYLOAD;
      const contract: ContractCheck = stringContract("REPLY_PAYLOAD", value, 'hello rpc');
      expect(value).assertEqual('hello rpc');
      expect(value.length).assertEqual(9);
      expect(value.indexOf("") >= 0).assertTrue();
      expect(contract.pass).assertTrue();
      expect(contract.token().indexOf('hello rpc') >= 0).assertTrue();
      expect(value.trim()).assertEqual(value);
      expect(value.charCodeAt(0) > 32).assertTrue();
      expect(textFingerprint(value)).assertEqual(textFingerprint('hello rpc'));
      logStep("constantContractReplyPayload", contract.token());
    });

    /**
     * @tc.name          constantContractPayloadFamily
     * @tc.desc          The payload family string family is unique and non-empty.
     * @tc.precondition  The family is collected from exported constants.
     * @tc.steps         1. Collect the family into an array.
     *                   2. Check pairwise uniqueness.
     *                   3. Check that every entry is non-empty.
     *                   4. Recompute the family size with uniqueStrings.
     * @tc.expected      The family has the published size with no duplicate or empty entry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractPayloadFamily', 0, () => {
      const values: string[] = [REQUEST_PAYLOAD, REPLY_PAYLOAD];
      expect(values.length).assertEqual(2);
      expect(allUnique(values)).assertTrue();
      expect(uniqueStrings(values).length).assertEqual(2);
      expect(values[0]).assertEqual(REQUEST_PAYLOAD);
      expect(values.indexOf(REQUEST_PAYLOAD)).assertEqual(0);
      expect(values.indexOf(REQUEST_PAYLOAD, 1)).assertEqual(-1);
      expect(values.join("").length > 0).assertTrue();
      expect(countOf(values, REQUEST_PAYLOAD)).assertEqual(1);
      logStep("constantContractPayloadFamily", values.join(","));
    });

    /**
     * @tc.name          constantContractReplyOracleProduction
     * @tc.desc          Reply oracle for code 1 labelled production reply matches the stub.
     * @tc.precondition  The reply oracle and a fresh in-process client are available.
     * @tc.steps         1. Evaluate the reply oracle for the code.
     *                   2. Send the code and read the reply.
     *                   3. Compare the client reply trace.
     *                   4. Inspect the recorded reply text.
     * @tc.expected      The oracle, the result and the client trace agree on the reply literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractReplyOracleProduction', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      const result: RequestResultModel = client.send(1, REQUEST_PAYLOAD);
      expect(expectedReplyFor(1)).assertEqual(REPLY_PAYLOAD);
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.trace()).assertEqual(REPLY_PAYLOAD);
      expect(stub.requests[0].replyText).assertEqual(REPLY_PAYLOAD);
      expect(result.isSuccess()).assertEqual(true);
      expect(expectedReplyFor(1).length).assertEqual(9);
      logStep("constantContractReplyOracleProduction", result.replyText);
    });

    /**
     * @tc.name          constantContractReplyOracleUnknown
     * @tc.desc          Reply oracle for code 0 labelled unknown reply matches the stub.
     * @tc.precondition  The reply oracle and a fresh in-process client are available.
     * @tc.steps         1. Evaluate the reply oracle for the code.
     *                   2. Send the code and read the reply.
     *                   3. Compare the client reply trace.
     *                   4. Inspect the recorded reply text.
     * @tc.expected      The oracle, the result and the client trace agree on the reply literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractReplyOracleUnknown', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      const result: RequestResultModel = client.send(0, REQUEST_PAYLOAD);
      expect(expectedReplyFor(0)).assertEqual("");
      expect(result.replyText).assertEqual("");
      expect(client.trace()).assertEqual("");
      expect(stub.requests[0].replyText).assertEqual("");
      expect(result.isSuccess()).assertEqual(false);
      expect(expectedReplyFor(0).length).assertEqual(0);
      logStep("constantContractReplyOracleUnknown", result.replyText);
    });

    /**
     * @tc.name          constantContractEventCreate
     * @tc.desc          Lifecycle constant create event keeps its callback spelling.
     * @tc.precondition  The event constant is compared with the production callback name.
     * @tc.steps         1. Read the exported event constant.
     *                   2. Compare it with the expected name.
     *                   3. Check the on-prefix and the length.
     *                   4. Fingerprint the literal independently.
     * @tc.expected      The event literal starts with on and matches the published spelling.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractEventCreate', 0, () => {
      const value: string = EVENT_ON_CREATE;
      expect(value).assertEqual('onCreate');
      expect(value.startsWith("on")).assertTrue();
      expect(value.length).assertEqual(8);
      expect(value.charAt(2)).assertEqual("C");
      expect(value === 'onCreate').assertTrue();
      expect(textFingerprint(value)).assertEqual(textFingerprint('onCreate'));
      expect(value.indexOf(" ")).assertEqual(-1);
      expect(allUnique(["onCreate", "onConnect", "onDestroy"])).assertTrue();
      logStep("constantContractEventCreate", value);
    });

    /**
     * @tc.name          constantContractEventRequest
     * @tc.desc          Lifecycle constant request event keeps its callback spelling.
     * @tc.precondition  The event constant is compared with the production callback name.
     * @tc.steps         1. Read the exported event constant.
     *                   2. Compare it with the expected name.
     *                   3. Check the on-prefix and the length.
     *                   4. Fingerprint the literal independently.
     * @tc.expected      The event literal starts with on and matches the published spelling.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractEventRequest', 0, () => {
      const value: string = EVENT_ON_REQUEST;
      expect(value).assertEqual('onRequest');
      expect(value.startsWith("on")).assertTrue();
      expect(value.length).assertEqual(9);
      expect(value.charAt(2)).assertEqual("R");
      expect(value === 'onRequest').assertTrue();
      expect(textFingerprint(value)).assertEqual(textFingerprint('onRequest'));
      expect(value.indexOf(" ")).assertEqual(-1);
      expect(allUnique(["onCreate", "onConnect", "onDestroy"])).assertTrue();
      logStep("constantContractEventRequest", value);
    });

    /**
     * @tc.name          constantContractEventConnect
     * @tc.desc          Lifecycle constant connect event keeps its callback spelling.
     * @tc.precondition  The event constant is compared with the production callback name.
     * @tc.steps         1. Read the exported event constant.
     *                   2. Compare it with the expected name.
     *                   3. Check the on-prefix and the length.
     *                   4. Fingerprint the literal independently.
     * @tc.expected      The event literal starts with on and matches the published spelling.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractEventConnect', 0, () => {
      const value: string = EVENT_ON_CONNECT;
      expect(value).assertEqual('onConnect');
      expect(value.startsWith("on")).assertTrue();
      expect(value.length).assertEqual(9);
      expect(value.charAt(2)).assertEqual("C");
      expect(value === 'onConnect').assertTrue();
      expect(textFingerprint(value)).assertEqual(textFingerprint('onConnect'));
      expect(value.indexOf(" ")).assertEqual(-1);
      expect(allUnique(["onCreate", "onConnect", "onDestroy"])).assertTrue();
      logStep("constantContractEventConnect", value);
    });

    /**
     * @tc.name          constantContractEventDisconnect
     * @tc.desc          Lifecycle constant disconnect event keeps its callback spelling.
     * @tc.precondition  The event constant is compared with the production callback name.
     * @tc.steps         1. Read the exported event constant.
     *                   2. Compare it with the expected name.
     *                   3. Check the on-prefix and the length.
     *                   4. Fingerprint the literal independently.
     * @tc.expected      The event literal starts with on and matches the published spelling.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractEventDisconnect', 0, () => {
      const value: string = EVENT_ON_DISCONNECT;
      expect(value).assertEqual('onDisconnect');
      expect(value.startsWith("on")).assertTrue();
      expect(value.length).assertEqual(12);
      expect(value.charAt(2)).assertEqual("D");
      expect(value === 'onDisconnect').assertTrue();
      expect(textFingerprint(value)).assertEqual(textFingerprint('onDisconnect'));
      expect(value.indexOf(" ")).assertEqual(-1);
      expect(allUnique(["onCreate", "onConnect", "onDestroy"])).assertTrue();
      logStep("constantContractEventDisconnect", value);
    });

    /**
     * @tc.name          constantContractEventDestroy
     * @tc.desc          Lifecycle constant destroy event keeps its callback spelling.
     * @tc.precondition  The event constant is compared with the production callback name.
     * @tc.steps         1. Read the exported event constant.
     *                   2. Compare it with the expected name.
     *                   3. Check the on-prefix and the length.
     *                   4. Fingerprint the literal independently.
     * @tc.expected      The event literal starts with on and matches the published spelling.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractEventDestroy', 0, () => {
      const value: string = EVENT_ON_DESTROY;
      expect(value).assertEqual('onDestroy');
      expect(value.startsWith("on")).assertTrue();
      expect(value.length).assertEqual(9);
      expect(value.charAt(2)).assertEqual("D");
      expect(value === 'onDestroy').assertTrue();
      expect(textFingerprint(value)).assertEqual(textFingerprint('onDestroy'));
      expect(value.indexOf(" ")).assertEqual(-1);
      expect(allUnique(["onCreate", "onConnect", "onDestroy"])).assertTrue();
      logStep("constantContractEventDestroy", value);
    });

    /**
     * @tc.name          constantContractEventRemoteDied
     * @tc.desc          Lifecycle constant remote died event keeps its callback spelling.
     * @tc.precondition  The event constant is compared with the production callback name.
     * @tc.steps         1. Read the exported event constant.
     *                   2. Compare it with the expected name.
     *                   3. Check the on-prefix and the length.
     *                   4. Fingerprint the literal independently.
     * @tc.expected      The event literal starts with on and matches the published spelling.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractEventRemoteDied', 0, () => {
      const value: string = EVENT_ON_REMOTE_DIED;
      expect(value).assertEqual('onRemoteDied');
      expect(value.startsWith("on")).assertTrue();
      expect(value.length).assertEqual(12);
      expect(value.charAt(2)).assertEqual("R");
      expect(value === 'onRemoteDied').assertTrue();
      expect(textFingerprint(value)).assertEqual(textFingerprint('onRemoteDied'));
      expect(value.indexOf(" ")).assertEqual(-1);
      expect(allUnique(["onCreate", "onConnect", "onDestroy"])).assertTrue();
      logStep("constantContractEventRemoteDied", value);
    });

    /**
     * @tc.name          constantContractEventFamily
     * @tc.desc          The event family string family is unique and non-empty.
     * @tc.precondition  The family is collected from exported constants.
     * @tc.steps         1. Collect the family into an array.
     *                   2. Check pairwise uniqueness.
     *                   3. Check that every entry is non-empty.
     *                   4. Recompute the family size with uniqueStrings.
     * @tc.expected      The family has the published size with no duplicate or empty entry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractEventFamily', 0, () => {
      const values: string[] = [EVENT_ON_CREATE, EVENT_ON_CONNECT, EVENT_ON_DISCONNECT, EVENT_ON_DESTROY, EVENT_ON_REMOTE_DIED];
      expect(values.length).assertEqual(5);
      expect(allUnique(values)).assertTrue();
      expect(uniqueStrings(values).length).assertEqual(5);
      expect(values[0]).assertEqual(EVENT_ON_CREATE);
      expect(values.indexOf(EVENT_ON_CREATE)).assertEqual(0);
      expect(values.indexOf(EVENT_ON_CREATE, 1)).assertEqual(-1);
      expect(values.join("").length > 0).assertTrue();
      expect(countOf(values, EVENT_ON_CREATE)).assertEqual(1);
      logStep("constantContractEventFamily", values.join(","));
    });

    /**
     * @tc.name          constantContractErrorNone
     * @tc.desc          Numeric constant error none stays inside its published band.
     * @tc.precondition  The shared driver exports the numeric constant.
     * @tc.steps         1. Read the exported value "ERROR_NONE".
     *                   2. Compare it with the published number.
     *                   3. Check the inclusive band and integrality.
     *                   4. Check the string form and type.
     * @tc.expected      The value equals the literal, is integral, and lies inside the band.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractErrorNone', 0, () => {
      const value: number = ERROR_NONE;
      expect(value).assertEqual(0);
      expect(value >= 0).assertTrue();
      expect(value <= 0).assertTrue();
      expect(inBand(value, 0, 0)).assertTrue();
      expect(Math.floor(value)).assertEqual(value);
      expect(String(value).indexOf(".")).assertEqual(-1);
      expect(String(value).length > 0).assertTrue();
      expect(value === 0).assertTrue();
      logStep("constantContractErrorNone", "ERROR_NONE" + "=" + String(value));
    });

    /**
     * @tc.name          constantContractErrorRejected
     * @tc.desc          Numeric constant error rejected stays inside its published band.
     * @tc.precondition  The shared driver exports the numeric constant.
     * @tc.steps         1. Read the exported value "ERROR_STUB_REJECTED".
     *                   2. Compare it with the published number.
     *                   3. Check the inclusive band and integrality.
     *                   4. Check the string form and type.
     * @tc.expected      The value equals the literal, is integral, and lies inside the band.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractErrorRejected', 0, () => {
      const value: number = ERROR_STUB_REJECTED;
      expect(value).assertEqual(16000011);
      expect(value >= 16000011).assertTrue();
      expect(value <= 16000011).assertTrue();
      expect(inBand(value, 16000011, 16000011)).assertTrue();
      expect(Math.floor(value)).assertEqual(value);
      expect(String(value).indexOf(".")).assertEqual(-1);
      expect(String(value).length > 0).assertTrue();
      expect(value === 16000011).assertTrue();
      logStep("constantContractErrorRejected", "ERROR_STUB_REJECTED" + "=" + String(value));
    });

    /**
     * @tc.name          constantContractErrorNotAlive
     * @tc.desc          Numeric constant error not alive stays inside its published band.
     * @tc.precondition  The shared driver exports the numeric constant.
     * @tc.steps         1. Read the exported value "ERROR_STUB_NOT_ALIVE".
     *                   2. Compare it with the published number.
     *                   3. Check the inclusive band and integrality.
     *                   4. Check the string form and type.
     * @tc.expected      The value equals the literal, is integral, and lies inside the band.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractErrorNotAlive', 0, () => {
      const value: number = ERROR_STUB_NOT_ALIVE;
      expect(value).assertEqual(16000012);
      expect(value >= 16000012).assertTrue();
      expect(value <= 16000012).assertTrue();
      expect(inBand(value, 16000012, 16000012)).assertTrue();
      expect(Math.floor(value)).assertEqual(value);
      expect(String(value).indexOf(".")).assertEqual(-1);
      expect(String(value).length > 0).assertTrue();
      expect(value === 16000012).assertTrue();
      logStep("constantContractErrorNotAlive", "ERROR_STUB_NOT_ALIVE" + "=" + String(value));
    });

    /**
     * @tc.name          constantContractErrorSequence
     * @tc.desc          Numeric constant error sequence stays inside its published band.
     * @tc.precondition  The shared driver exports the numeric constant.
     * @tc.steps         1. Read the exported value "ERROR_SEQUENCE_RECLAIMED".
     *                   2. Compare it with the published number.
     *                   3. Check the inclusive band and integrality.
     *                   4. Check the string form and type.
     * @tc.expected      The value equals the literal, is integral, and lies inside the band.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractErrorSequence', 0, () => {
      const value: number = ERROR_SEQUENCE_RECLAIMED;
      expect(value).assertEqual(16000013);
      expect(value >= 16000013).assertTrue();
      expect(value <= 16000013).assertTrue();
      expect(inBand(value, 16000013, 16000013)).assertTrue();
      expect(Math.floor(value)).assertEqual(value);
      expect(String(value).indexOf(".")).assertEqual(-1);
      expect(String(value).length > 0).assertTrue();
      expect(value === 16000013).assertTrue();
      logStep("constantContractErrorSequence", "ERROR_SEQUENCE_RECLAIMED" + "=" + String(value));
    });

    /**
     * @tc.name          constantContractErrorFamily
     * @tc.desc          The error family numeric set is pairwise distinct.
     * @tc.precondition  All members of the numeric family are read together.
     * @tc.steps         1. Collect the family into an array.
     *                   2. Count the members.
     *                   3. Check pairwise distinctness.
     *                   4. Search for a missing sentinel value.
     * @tc.expected      Every member is unique and the sentinel is absent.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractErrorFamily', 0, () => {
      const values: number[] = [ERROR_NONE, ERROR_STUB_REJECTED, ERROR_STUB_NOT_ALIVE, ERROR_SEQUENCE_RECLAIMED];
      expect(values.length).assertEqual(4);
      expect(allDistinct(values)).assertTrue();
      expect(values[0]).assertEqual(ERROR_NONE);
      expect(values.indexOf(ERROR_NONE)).assertEqual(0);
      expect(values.indexOf(ERROR_NONE, 1)).assertEqual(-1);
      expect(values.indexOf(7)).assertEqual(-1);
      expect(uniqueStrings(["a", "a", "b"]).length).assertEqual(2);
      expect(values.length > 1).assertTrue();
      logStep("constantContractErrorFamily", String(values.length));
    });

    /**
     * @tc.name          constantContractErrorBand
     * @tc.desc          The error band numeric set is pairwise distinct.
     * @tc.precondition  All members of the numeric family are read together.
     * @tc.steps         1. Collect the family into an array.
     *                   2. Count the members.
     *                   3. Check pairwise distinctness.
     *                   4. Search for a missing sentinel value.
     * @tc.expected      Every member is unique and the sentinel is absent.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractErrorBand', 0, () => {
      const values: number[] = [ERROR_STUB_REJECTED, ERROR_STUB_NOT_ALIVE, ERROR_SEQUENCE_RECLAIMED];
      expect(values.length).assertEqual(3);
      expect(allDistinct(values)).assertTrue();
      expect(values[0]).assertEqual(ERROR_STUB_REJECTED);
      expect(values.indexOf(ERROR_STUB_REJECTED)).assertEqual(0);
      expect(values.indexOf(ERROR_STUB_REJECTED, 1)).assertEqual(-1);
      expect(values.indexOf(16000014)).assertEqual(-1);
      expect(uniqueStrings(["a", "a", "b"]).length).assertEqual(2);
      expect(values.length > 1).assertTrue();
      logStep("constantContractErrorBand", String(values.length));
    });

    /**
     * @tc.name          constantContractOptionSyncFlag
     * @tc.desc          Numeric constant sync flag stays inside its published band.
     * @tc.precondition  The shared driver exports the numeric constant.
     * @tc.steps         1. Read the exported value "OPTION_FLAG_SYNC".
     *                   2. Compare it with the published number.
     *                   3. Check the inclusive band and integrality.
     *                   4. Check the string form and type.
     * @tc.expected      The value equals the literal, is integral, and lies inside the band.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractOptionSyncFlag', 0, () => {
      const value: number = OPTION_FLAG_SYNC;
      expect(value).assertEqual(0);
      expect(value >= 0).assertTrue();
      expect(value <= 0).assertTrue();
      expect(inBand(value, 0, 0)).assertTrue();
      expect(Math.floor(value)).assertEqual(value);
      expect(String(value).indexOf(".")).assertEqual(-1);
      expect(String(value).length > 0).assertTrue();
      expect(value === 0).assertTrue();
      logStep("constantContractOptionSyncFlag", "OPTION_FLAG_SYNC" + "=" + String(value));
    });

    /**
     * @tc.name          constantContractOptionAsyncFlag
     * @tc.desc          Numeric constant async flag stays inside its published band.
     * @tc.precondition  The shared driver exports the numeric constant.
     * @tc.steps         1. Read the exported value "OPTION_FLAG_ASYNC".
     *                   2. Compare it with the published number.
     *                   3. Check the inclusive band and integrality.
     *                   4. Check the string form and type.
     * @tc.expected      The value equals the literal, is integral, and lies inside the band.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('constantContractOptionAsyncFlag', 0, () => {
      const value: number = OPTION_FLAG_ASYNC;
      expect(value).assertEqual(1);
      expect(value >= 1).assertTrue();
      expect(value <= 1).assertTrue();
      expect(inBand(value, 1, 1)).assertTrue();
      expect(Math.floor(value)).assertEqual(value);
      expect(String(value).indexOf(".")).assertEqual(-1);
      expect(String(value).length > 0).assertTrue();
      expect(value === 1).assertTrue();
      logStep("constantContractOptionAsyncFlag", "OPTION_FLAG_ASYNC" + "=" + String(value));
    });

    /**
     * @tc.name          constantContractOptionFlags
     * @tc.desc          The option flags numeric set is pairwise distinct.
     * @tc.precondition  All members of the numeric family are read together.
     * @tc.steps         1. Collect the family into an array.
     *                   2. Count the members.
     *                   3. Check pairwise distinctness.
     *                   4. Search for a missing sentinel value.
     * @tc.expected      Every member is unique and the sentinel is absent.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractOptionFlags', 0, () => {
      const values: number[] = [OPTION_FLAG_SYNC, OPTION_FLAG_ASYNC];
      expect(values.length).assertEqual(2);
      expect(allDistinct(values)).assertTrue();
      expect(values[0]).assertEqual(OPTION_FLAG_SYNC);
      expect(values.indexOf(OPTION_FLAG_SYNC)).assertEqual(0);
      expect(values.indexOf(OPTION_FLAG_SYNC, 1)).assertEqual(-1);
      expect(values.indexOf(2)).assertEqual(-1);
      expect(uniqueStrings(["a", "a", "b"]).length).assertEqual(2);
      expect(values.length > 1).assertTrue();
      logStep("constantContractOptionFlags", String(values.length));
    });

    /**
     * @tc.name          constantContractOptionDefaultModel
     * @tc.desc          Message option configuration default model reports the published flags.
     * @tc.precondition  The option model mirrors rpc.MessageOption defaults.
     * @tc.steps         1. Construct the option with explicit flags.
     *                   2. Compare flags, wait time and sync flag.
     *                   3. Evaluate the sync predicate.
     *                   4. Check the describe token and the default model.
     * @tc.expected      The model keeps the supplied values and the default model is synchronous.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractOptionDefaultModel', 0, () => {
      const model: MessageOptionModel = new MessageOptionModel(OPTION_FLAG_SYNC, 0, false);
      expect(model.flags).assertEqual(OPTION_FLAG_SYNC);
      expect(model.waitTime).assertEqual(0);
      expect(model.sync).assertEqual(false);
      expect(model.isSync()).assertEqual(true);
      expect(model.describe()).assertEqual("0/0/false");
      const fallback: MessageOptionModel = new MessageOptionModel();
      expect(fallback.flags).assertEqual(OPTION_FLAG_SYNC);
      expect(fallback.describe()).assertEqual("0/0/false");
      expect(fallback.isSync()).assertTrue();
      expect(OPTION_FLAG_SYNC).assertEqual(0);
      expect(OPTION_FLAG_ASYNC).assertEqual(1);
      logStep("constantContractOptionDefaultModel", model.describe());
    });

    /**
     * @tc.name          constantContractOptionAsyncModel
     * @tc.desc          Message option configuration async model reports the published flags.
     * @tc.precondition  The option model mirrors rpc.MessageOption defaults.
     * @tc.steps         1. Construct the option with explicit flags.
     *                   2. Compare flags, wait time and sync flag.
     *                   3. Evaluate the sync predicate.
     *                   4. Check the describe token and the default model.
     * @tc.expected      The model keeps the supplied values and the default model is synchronous.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractOptionAsyncModel', 0, () => {
      const model: MessageOptionModel = new MessageOptionModel(OPTION_FLAG_ASYNC, 0, false);
      expect(model.flags).assertEqual(OPTION_FLAG_ASYNC);
      expect(model.waitTime).assertEqual(0);
      expect(model.sync).assertEqual(false);
      expect(model.isSync()).assertEqual(false);
      expect(model.describe()).assertEqual("1/0/false");
      const fallback: MessageOptionModel = new MessageOptionModel();
      expect(fallback.flags).assertEqual(OPTION_FLAG_SYNC);
      expect(fallback.describe()).assertEqual("0/0/false");
      expect(fallback.isSync()).assertTrue();
      expect(OPTION_FLAG_SYNC).assertEqual(0);
      expect(OPTION_FLAG_ASYNC).assertEqual(1);
      logStep("constantContractOptionAsyncModel", model.describe());
    });

    /**
     * @tc.name          constantContractOptionWaitedModel
     * @tc.desc          Message option configuration waited model reports the published flags.
     * @tc.precondition  The option model mirrors rpc.MessageOption defaults.
     * @tc.steps         1. Construct the option with explicit flags.
     *                   2. Compare flags, wait time and sync flag.
     *                   3. Evaluate the sync predicate.
     *                   4. Check the describe token and the default model.
     * @tc.expected      The model keeps the supplied values and the default model is synchronous.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractOptionWaitedModel', 0, () => {
      const model: MessageOptionModel = new MessageOptionModel(OPTION_FLAG_ASYNC, 100, false);
      expect(model.flags).assertEqual(OPTION_FLAG_ASYNC);
      expect(model.waitTime).assertEqual(100);
      expect(model.sync).assertEqual(false);
      expect(model.isSync()).assertEqual(false);
      expect(model.describe()).assertEqual("1/100/false");
      const fallback: MessageOptionModel = new MessageOptionModel();
      expect(fallback.flags).assertEqual(OPTION_FLAG_SYNC);
      expect(fallback.describe()).assertEqual("0/0/false");
      expect(fallback.isSync()).assertTrue();
      expect(OPTION_FLAG_SYNC).assertEqual(0);
      expect(OPTION_FLAG_ASYNC).assertEqual(1);
      logStep("constantContractOptionWaitedModel", model.describe());
    });

    /**
     * @tc.name          constantContractOptionSyncWaited
     * @tc.desc          Message option configuration sync waited model reports the published flags.
     * @tc.precondition  The option model mirrors rpc.MessageOption defaults.
     * @tc.steps         1. Construct the option with explicit flags.
     *                   2. Compare flags, wait time and sync flag.
     *                   3. Evaluate the sync predicate.
     *                   4. Check the describe token and the default model.
     * @tc.expected      The model keeps the supplied values and the default model is synchronous.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractOptionSyncWaited', 0, () => {
      const model: MessageOptionModel = new MessageOptionModel(OPTION_FLAG_SYNC, 50, false);
      expect(model.flags).assertEqual(OPTION_FLAG_SYNC);
      expect(model.waitTime).assertEqual(50);
      expect(model.sync).assertEqual(false);
      expect(model.isSync()).assertEqual(true);
      expect(model.describe()).assertEqual("0/50/false");
      const fallback: MessageOptionModel = new MessageOptionModel();
      expect(fallback.flags).assertEqual(OPTION_FLAG_SYNC);
      expect(fallback.describe()).assertEqual("0/0/false");
      expect(fallback.isSync()).assertTrue();
      expect(OPTION_FLAG_SYNC).assertEqual(0);
      expect(OPTION_FLAG_ASYNC).assertEqual(1);
      logStep("constantContractOptionSyncWaited", model.describe());
    });

    /**
     * @tc.name          constantContractOptionExplicitSync
     * @tc.desc          Message option configuration explicit sync model reports the published flags.
     * @tc.precondition  The option model mirrors rpc.MessageOption defaults.
     * @tc.steps         1. Construct the option with explicit flags.
     *                   2. Compare flags, wait time and sync flag.
     *                   3. Evaluate the sync predicate.
     *                   4. Check the describe token and the default model.
     * @tc.expected      The model keeps the supplied values and the default model is synchronous.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractOptionExplicitSync', 0, () => {
      const model: MessageOptionModel = new MessageOptionModel(OPTION_FLAG_SYNC, 0, true);
      expect(model.flags).assertEqual(OPTION_FLAG_SYNC);
      expect(model.waitTime).assertEqual(0);
      expect(model.sync).assertEqual(true);
      expect(model.isSync()).assertEqual(true);
      expect(model.describe()).assertEqual("0/0/true");
      const fallback: MessageOptionModel = new MessageOptionModel();
      expect(fallback.flags).assertEqual(OPTION_FLAG_SYNC);
      expect(fallback.describe()).assertEqual("0/0/false");
      expect(fallback.isSync()).assertTrue();
      expect(OPTION_FLAG_SYNC).assertEqual(0);
      expect(OPTION_FLAG_ASYNC).assertEqual(1);
      logStep("constantContractOptionExplicitSync", model.describe());
    });

    /**
     * @tc.name          constantContractOptionExplicitAsync
     * @tc.desc          Message option configuration explicit async model reports the published flags.
     * @tc.precondition  The option model mirrors rpc.MessageOption defaults.
     * @tc.steps         1. Construct the option with explicit flags.
     *                   2. Compare flags, wait time and sync flag.
     *                   3. Evaluate the sync predicate.
     *                   4. Check the describe token and the default model.
     * @tc.expected      The model keeps the supplied values and the default model is synchronous.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractOptionExplicitAsync', 0, () => {
      const model: MessageOptionModel = new MessageOptionModel(OPTION_FLAG_ASYNC, 25, true);
      expect(model.flags).assertEqual(OPTION_FLAG_ASYNC);
      expect(model.waitTime).assertEqual(25);
      expect(model.sync).assertEqual(true);
      expect(model.isSync()).assertEqual(true);
      expect(model.describe()).assertEqual("1/25/true");
      const fallback: MessageOptionModel = new MessageOptionModel();
      expect(fallback.flags).assertEqual(OPTION_FLAG_SYNC);
      expect(fallback.describe()).assertEqual("0/0/false");
      expect(fallback.isSync()).assertTrue();
      expect(OPTION_FLAG_SYNC).assertEqual(0);
      expect(OPTION_FLAG_ASYNC).assertEqual(1);
      logStep("constantContractOptionExplicitAsync", model.describe());
    });

    /**
     * @tc.name          constantContractLevelInfo
     * @tc.desc          Log level constant info level drives the bounded buffer.
     * @tc.precondition  The level constants are compared against the buffer output.
     * @tc.steps         1. Read the level constant.
     *                   2. Check the published spelling and upper-case word.
     *                   3. Store one probe line at that level.
     *                   4. Count levels and inspect the prefix.
     * @tc.expected      The buffer records exactly one line under the requested level.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractLevelInfo', 0, () => {
      const value: string = LEVEL_INFO;
      const buffer: LogBuffer = applyLevel(value);
      expect(value).assertEqual('INFO');
      expect(isUpperWord(value)).assertTrue();
      expect(value.length).assertEqual(4);
      expect(buffer.size()).assertEqual(1);
      expect(buffer.countLevel(value)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_INFO) + buffer.countLevel(LEVEL_WARN) + buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.lines[0].startsWith(value + " ")).assertTrue();
      expect(buffer.contains("probe")).assertTrue();
      logStep("constantContractLevelInfo", buffer.trace());
    });

    /**
     * @tc.name          constantContractLevelWarn
     * @tc.desc          Log level constant warn level drives the bounded buffer.
     * @tc.precondition  The level constants are compared against the buffer output.
     * @tc.steps         1. Read the level constant.
     *                   2. Check the published spelling and upper-case word.
     *                   3. Store one probe line at that level.
     *                   4. Count levels and inspect the prefix.
     * @tc.expected      The buffer records exactly one line under the requested level.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractLevelWarn', 0, () => {
      const value: string = LEVEL_WARN;
      const buffer: LogBuffer = applyLevel(value);
      expect(value).assertEqual('WARN');
      expect(isUpperWord(value)).assertTrue();
      expect(value.length).assertEqual(4);
      expect(buffer.size()).assertEqual(1);
      expect(buffer.countLevel(value)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_INFO) + buffer.countLevel(LEVEL_WARN) + buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.lines[0].startsWith(value + " ")).assertTrue();
      expect(buffer.contains("probe")).assertTrue();
      logStep("constantContractLevelWarn", buffer.trace());
    });

    /**
     * @tc.name          constantContractLevelError
     * @tc.desc          Log level constant error level drives the bounded buffer.
     * @tc.precondition  The level constants are compared against the buffer output.
     * @tc.steps         1. Read the level constant.
     *                   2. Check the published spelling and upper-case word.
     *                   3. Store one probe line at that level.
     *                   4. Count levels and inspect the prefix.
     * @tc.expected      The buffer records exactly one line under the requested level.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractLevelError', 0, () => {
      const value: string = LEVEL_ERROR;
      const buffer: LogBuffer = applyLevel(value);
      expect(value).assertEqual('ERROR');
      expect(isUpperWord(value)).assertTrue();
      expect(value.length).assertEqual(5);
      expect(buffer.size()).assertEqual(1);
      expect(buffer.countLevel(value)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_INFO) + buffer.countLevel(LEVEL_WARN) + buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.lines[0].startsWith(value + " ")).assertTrue();
      expect(buffer.contains("probe")).assertTrue();
      logStep("constantContractLevelError", buffer.trace());
    });

    /**
     * @tc.name          constantContractLevelFamily
     * @tc.desc          The level family string family is unique and non-empty.
     * @tc.precondition  The family is collected from exported constants.
     * @tc.steps         1. Collect the family into an array.
     *                   2. Check pairwise uniqueness.
     *                   3. Check that every entry is non-empty.
     *                   4. Recompute the family size with uniqueStrings.
     * @tc.expected      The family has the published size with no duplicate or empty entry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractLevelFamily', 0, () => {
      const values: string[] = [LEVEL_INFO, LEVEL_WARN, LEVEL_ERROR];
      expect(values.length).assertEqual(3);
      expect(allUnique(values)).assertTrue();
      expect(uniqueStrings(values).length).assertEqual(3);
      expect(values[0]).assertEqual(LEVEL_INFO);
      expect(values.indexOf(LEVEL_INFO)).assertEqual(0);
      expect(values.indexOf(LEVEL_INFO, 1)).assertEqual(-1);
      expect(values.join("").length > 0).assertTrue();
      expect(countOf(values, LEVEL_INFO)).assertEqual(1);
      logStep("constantContractLevelFamily", values.join(","));
    });

    /**
     * @tc.name          constantContractLevelBufferInfo
     * @tc.desc          Log level constant info buffer drives the bounded buffer.
     * @tc.precondition  The level constants are compared against the buffer output.
     * @tc.steps         1. Read the level constant.
     *                   2. Check the published spelling and upper-case word.
     *                   3. Store one probe line at that level.
     *                   4. Count levels and inspect the prefix.
     * @tc.expected      The buffer records exactly one line under the requested level.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractLevelBufferInfo', 0, () => {
      const value: string = LEVEL_INFO;
      const buffer: LogBuffer = applyLevel(value);
      expect(value).assertEqual('INFO');
      expect(isUpperWord(value)).assertTrue();
      expect(value.length).assertEqual(4);
      expect(buffer.size()).assertEqual(1);
      expect(buffer.countLevel(value)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_INFO) + buffer.countLevel(LEVEL_WARN) + buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.lines[0].startsWith(value + " ")).assertTrue();
      expect(buffer.contains("probe")).assertTrue();
      logStep("constantContractLevelBufferInfo", buffer.trace());
    });

    /**
     * @tc.name          constantContractLevelBufferError
     * @tc.desc          Log level constant error buffer drives the bounded buffer.
     * @tc.precondition  The level constants are compared against the buffer output.
     * @tc.steps         1. Read the level constant.
     *                   2. Check the published spelling and upper-case word.
     *                   3. Store one probe line at that level.
     *                   4. Count levels and inspect the prefix.
     * @tc.expected      The buffer records exactly one line under the requested level.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractLevelBufferError', 0, () => {
      const value: string = LEVEL_ERROR;
      const buffer: LogBuffer = applyLevel(value);
      expect(value).assertEqual('ERROR');
      expect(isUpperWord(value)).assertTrue();
      expect(value.length).assertEqual(5);
      expect(buffer.size()).assertEqual(1);
      expect(buffer.countLevel(value)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_INFO) + buffer.countLevel(LEVEL_WARN) + buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.lines[0].startsWith(value + " ")).assertTrue();
      expect(buffer.contains("probe")).assertTrue();
      logStep("constantContractLevelBufferError", buffer.trace());
    });

    /**
     * @tc.name          constantContractHandledProductionCode
     * @tc.desc          Code 1 labelled production handled follows the handled oracle.
     * @tc.precondition  A fresh stub is driven with the production payload.
     * @tc.steps         1. Evaluate the handled oracle for the code.
     *                   2. Send the code through an in-process client.
     *                   3. Compare the result and the recorded flag.
     *                   4. Count the replies.
     * @tc.expected      Only the production code is handled and receives a reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractHandledProductionCode', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      const result: RequestResultModel = client.send(1, REQUEST_PAYLOAD);
      expect(expectedHandled(1)).assertEqual(true);
      expect(result.handled).assertEqual(true);
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.isSuccess()).assertEqual(true);
      expect(stub.lastRequest()?.handled).assertEqual(true);
      expect(client.replies.length).assertEqual(1);
      logStep("constantContractHandledProductionCode", String(result.errCode));
    });

    /**
     * @tc.name          constantContractHandledZeroCode
     * @tc.desc          Code 0 labelled zero handled follows the handled oracle.
     * @tc.precondition  A fresh stub is driven with the production payload.
     * @tc.steps         1. Evaluate the handled oracle for the code.
     *                   2. Send the code through an in-process client.
     *                   3. Compare the result and the recorded flag.
     *                   4. Count the replies.
     * @tc.expected      The code is refused and produces no reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractHandledZeroCode', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      const result: RequestResultModel = client.send(0, REQUEST_PAYLOAD);
      expect(expectedHandled(0)).assertEqual(false);
      expect(result.handled).assertEqual(false);
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.isSuccess()).assertEqual(false);
      expect(stub.lastRequest()?.handled).assertEqual(false);
      expect(client.replies.length).assertEqual(0);
      logStep("constantContractHandledZeroCode", String(result.errCode));
    });

    /**
     * @tc.name          constantContractHandledTwoCode
     * @tc.desc          Code 2 labelled two handled follows the handled oracle.
     * @tc.precondition  A fresh stub is driven with the production payload.
     * @tc.steps         1. Evaluate the handled oracle for the code.
     *                   2. Send the code through an in-process client.
     *                   3. Compare the result and the recorded flag.
     *                   4. Count the replies.
     * @tc.expected      The code is refused and produces no reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractHandledTwoCode', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      const result: RequestResultModel = client.send(2, REQUEST_PAYLOAD);
      expect(expectedHandled(2)).assertEqual(false);
      expect(result.handled).assertEqual(false);
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.isSuccess()).assertEqual(false);
      expect(stub.lastRequest()?.handled).assertEqual(false);
      expect(client.replies.length).assertEqual(0);
      logStep("constantContractHandledTwoCode", String(result.errCode));
    });

    /**
     * @tc.name          constantContractHandledNegativeCode
     * @tc.desc          Code -1 labelled negative handled follows the handled oracle.
     * @tc.precondition  A fresh stub is driven with the production payload.
     * @tc.steps         1. Evaluate the handled oracle for the code.
     *                   2. Send the code through an in-process client.
     *                   3. Compare the result and the recorded flag.
     *                   4. Count the replies.
     * @tc.expected      The code is refused and produces no reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractHandledNegativeCode', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      const result: RequestResultModel = client.send(-1, REQUEST_PAYLOAD);
      expect(expectedHandled(-1)).assertEqual(false);
      expect(result.handled).assertEqual(false);
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.isSuccess()).assertEqual(false);
      expect(stub.lastRequest()?.handled).assertEqual(false);
      expect(client.replies.length).assertEqual(0);
      logStep("constantContractHandledNegativeCode", String(result.errCode));
    });

    /**
     * @tc.name          constantContractHandledLargeCode
     * @tc.desc          Code 99 labelled large handled follows the handled oracle.
     * @tc.precondition  A fresh stub is driven with the production payload.
     * @tc.steps         1. Evaluate the handled oracle for the code.
     *                   2. Send the code through an in-process client.
     *                   3. Compare the result and the recorded flag.
     *                   4. Count the replies.
     * @tc.expected      The code is refused and produces no reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractHandledLargeCode', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      const result: RequestResultModel = client.send(99, REQUEST_PAYLOAD);
      expect(expectedHandled(99)).assertEqual(false);
      expect(result.handled).assertEqual(false);
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.isSuccess()).assertEqual(false);
      expect(stub.lastRequest()?.handled).assertEqual(false);
      expect(client.replies.length).assertEqual(0);
      logStep("constantContractHandledLargeCode", String(result.errCode));
    });

    /**
     * @tc.name          constantContractHelperDuplicateList
     * @tc.desc          String helpers applied to the duplicate list list keep their contract.
     * @tc.precondition  A mixed list with one duplicate is prepared.
     * @tc.steps         1. Join the list with a comma and a pipe.
     *                   2. Count one repeated target.
     *                   3. Deduplicate and compare sizes.
     *                   4. Compare the original list with its deduplicated copy.
     * @tc.expected      Joins, counts, deduplication and equality all follow the published helpers.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractHelperDuplicateList', 0, () => {
      const values: string[] = ['a', 'b', 'a'];
      expect(joined(values, ",")).assertEqual('a,b,a');
      expect(joined(values, "|")).assertEqual('a|b|a');
      expect(countOf(values, 'a')).assertEqual(2);
      expect(uniqueStrings(values).length).assertEqual(2);
      expect(sameStringArray(values, uniqueStrings(values))).assertEqual(false);
      expect(sameStringArray(values, values.slice())).assertTrue();
      expect(joined([], ",")).assertEqual("");
      expect(countOf(values, "absent")).assertEqual(0);
      expect(uniqueStrings(values)[0]).assertEqual(values[0]);
      logStep("constantContractHelperDuplicateList", joined(values, ","));
    });

    /**
     * @tc.name          constantContractHelperSingleList
     * @tc.desc          String helpers applied to the single list list keep their contract.
     * @tc.precondition  A mixed list with one duplicate is prepared.
     * @tc.steps         1. Join the list with a comma and a pipe.
     *                   2. Count one repeated target.
     *                   3. Deduplicate and compare sizes.
     *                   4. Compare the original list with its deduplicated copy.
     * @tc.expected      Joins, counts, deduplication and equality all follow the published helpers.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractHelperSingleList', 0, () => {
      const values: string[] = ['only'];
      expect(joined(values, ",")).assertEqual('only');
      expect(joined(values, "|")).assertEqual('only');
      expect(countOf(values, 'only')).assertEqual(1);
      expect(uniqueStrings(values).length).assertEqual(1);
      expect(sameStringArray(values, uniqueStrings(values))).assertEqual(true);
      expect(sameStringArray(values, values.slice())).assertTrue();
      expect(joined([], ",")).assertEqual("");
      expect(countOf(values, "absent")).assertEqual(0);
      expect(uniqueStrings(values)[0]).assertEqual(values[0]);
      logStep("constantContractHelperSingleList", joined(values, ","));
    });

    /**
     * @tc.name          constantContractHelperWordList
     * @tc.desc          String helpers applied to the word list list keep their contract.
     * @tc.precondition  A mixed list with one duplicate is prepared.
     * @tc.steps         1. Join the list with a comma and a pipe.
     *                   2. Count one repeated target.
     *                   3. Deduplicate and compare sizes.
     *                   4. Compare the original list with its deduplicated copy.
     * @tc.expected      Joins, counts, deduplication and equality all follow the published helpers.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractHelperWordList', 0, () => {
      const values: string[] = ['one', 'two', 'three'];
      expect(joined(values, ",")).assertEqual('one,two,three');
      expect(joined(values, "|")).assertEqual('one|two|three');
      expect(countOf(values, 'two')).assertEqual(1);
      expect(uniqueStrings(values).length).assertEqual(3);
      expect(sameStringArray(values, uniqueStrings(values))).assertEqual(true);
      expect(sameStringArray(values, values.slice())).assertTrue();
      expect(joined([], ",")).assertEqual("");
      expect(countOf(values, "absent")).assertEqual(0);
      expect(uniqueStrings(values)[0]).assertEqual(values[0]);
      logStep("constantContractHelperWordList", joined(values, ","));
    });

    /**
     * @tc.name          constantContractHelperRepeatedList
     * @tc.desc          String helpers applied to the repeated list list keep their contract.
     * @tc.precondition  A mixed list with one duplicate is prepared.
     * @tc.steps         1. Join the list with a comma and a pipe.
     *                   2. Count one repeated target.
     *                   3. Deduplicate and compare sizes.
     *                   4. Compare the original list with its deduplicated copy.
     * @tc.expected      Joins, counts, deduplication and equality all follow the published helpers.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractHelperRepeatedList', 0, () => {
      const values: string[] = ['x', 'x', 'x'];
      expect(joined(values, ",")).assertEqual('x,x,x');
      expect(joined(values, "|")).assertEqual('x|x|x');
      expect(countOf(values, 'x')).assertEqual(3);
      expect(uniqueStrings(values).length).assertEqual(1);
      expect(sameStringArray(values, uniqueStrings(values))).assertEqual(false);
      expect(sameStringArray(values, values.slice())).assertTrue();
      expect(joined([], ",")).assertEqual("");
      expect(countOf(values, "absent")).assertEqual(0);
      expect(uniqueStrings(values)[0]).assertEqual(values[0]);
      logStep("constantContractHelperRepeatedList", joined(values, ","));
    });

    /**
     * @tc.name          constantContractHelperEmptyTarget
     * @tc.desc          String helpers applied to the empty target list list keep their contract.
     * @tc.precondition  A mixed list with one duplicate is prepared.
     * @tc.steps         1. Join the list with a comma and a pipe.
     *                   2. Count one repeated target.
     *                   3. Deduplicate and compare sizes.
     *                   4. Compare the original list with its deduplicated copy.
     * @tc.expected      Joins, counts, deduplication and equality all follow the published helpers.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractHelperEmptyTarget', 0, () => {
      const values: string[] = ['p', 'q'];
      expect(joined(values, ",")).assertEqual('p,q');
      expect(joined(values, "|")).assertEqual('p|q');
      expect(countOf(values, 'z')).assertEqual(0);
      expect(uniqueStrings(values).length).assertEqual(2);
      expect(sameStringArray(values, uniqueStrings(values))).assertEqual(true);
      expect(sameStringArray(values, values.slice())).assertTrue();
      expect(joined([], ",")).assertEqual("");
      expect(countOf(values, "absent")).assertEqual(0);
      expect(uniqueStrings(values)[0]).assertEqual(values[0]);
      logStep("constantContractHelperEmptyTarget", joined(values, ","));
    });

    /**
     * @tc.name          constantContractHelperNumberWords
     * @tc.desc          String helpers applied to the number word list list keep their contract.
     * @tc.precondition  A mixed list with one duplicate is prepared.
     * @tc.steps         1. Join the list with a comma and a pipe.
     *                   2. Count one repeated target.
     *                   3. Deduplicate and compare sizes.
     *                   4. Compare the original list with its deduplicated copy.
     * @tc.expected      Joins, counts, deduplication and equality all follow the published helpers.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractHelperNumberWords', 0, () => {
      const values: string[] = ['k1', 'k2', 'k1', 'k3'];
      expect(joined(values, ",")).assertEqual('k1,k2,k1,k3');
      expect(joined(values, "|")).assertEqual('k1|k2|k1|k3');
      expect(countOf(values, 'k1')).assertEqual(2);
      expect(uniqueStrings(values).length).assertEqual(3);
      expect(sameStringArray(values, uniqueStrings(values))).assertEqual(false);
      expect(sameStringArray(values, values.slice())).assertTrue();
      expect(joined([], ",")).assertEqual("");
      expect(countOf(values, "absent")).assertEqual(0);
      expect(uniqueStrings(values)[0]).assertEqual(values[0]);
      logStep("constantContractHelperNumberWords", joined(values, ","));
    });

    /**
     * @tc.name          constantContractFingerprintSample0
     * @tc.desc          Fingerprint of sample 0 matches the independent computation.
     * @tc.precondition  The fingerprint helper uses the published rolling hash.
     * @tc.steps         1. Fingerprint the input text.
     *                   2. Compare it with the independent digest.
     *                   3. Repeat the call for determinism.
     *                   4. Check the empty and extended inputs.
     * @tc.expected      The digest matches the independent value and stays inside its modulus.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractFingerprintSample0', 0, () => {
      const text: string = 'IPCStubTest';
      expect(textFingerprint(text)).assertEqual(814438);
      expect(textFingerprint(text)).assertEqual(textFingerprint(text));
      expect(textFingerprint("")).assertEqual(216613);
      expect(textFingerprint(text) >= 0).assertTrue();
      expect(textFingerprint(text) < 1000003).assertTrue();
      expect(textFingerprint(text + "x") === textFingerprint(text)).assertEqual(false);
      expect(textFingerprint(text).toString().length > 0).assertTrue();
      expect(textFingerprint(text + text)).assertEqual(textFingerprint(text + text));
      logStep("constantContractFingerprintSample0", String(textFingerprint(text)));
    });

    /**
     * @tc.name          constantContractFingerprintSample1
     * @tc.desc          Fingerprint of sample 1 matches the independent computation.
     * @tc.precondition  The fingerprint helper uses the published rolling hash.
     * @tc.steps         1. Fingerprint the input text.
     *                   2. Compare it with the independent digest.
     *                   3. Repeat the call for determinism.
     *                   4. Check the empty and extended inputs.
     * @tc.expected      The digest matches the independent value and stays inside its modulus.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractFingerprintSample1', 0, () => {
      const text: string = 'hello world';
      expect(textFingerprint(text)).assertEqual(854151);
      expect(textFingerprint(text)).assertEqual(textFingerprint(text));
      expect(textFingerprint("")).assertEqual(216613);
      expect(textFingerprint(text) >= 0).assertTrue();
      expect(textFingerprint(text) < 1000003).assertTrue();
      expect(textFingerprint(text + "x") === textFingerprint(text)).assertEqual(false);
      expect(textFingerprint(text).toString().length > 0).assertTrue();
      expect(textFingerprint(text + text)).assertEqual(textFingerprint(text + text));
      logStep("constantContractFingerprintSample1", String(textFingerprint(text)));
    });

    /**
     * @tc.name          constantContractFingerprintSample2
     * @tc.desc          Fingerprint of sample 2 matches the independent computation.
     * @tc.precondition  The fingerprint helper uses the published rolling hash.
     * @tc.steps         1. Fingerprint the input text.
     *                   2. Compare it with the independent digest.
     *                   3. Repeat the call for determinism.
     *                   4. Check the empty and extended inputs.
     * @tc.expected      The digest matches the independent value and stays inside its modulus.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractFingerprintSample2', 0, () => {
      const text: string = 'hello rpc';
      expect(textFingerprint(text)).assertEqual(453954);
      expect(textFingerprint(text)).assertEqual(textFingerprint(text));
      expect(textFingerprint("")).assertEqual(216613);
      expect(textFingerprint(text) >= 0).assertTrue();
      expect(textFingerprint(text) < 1000003).assertTrue();
      expect(textFingerprint(text + "x") === textFingerprint(text)).assertEqual(false);
      expect(textFingerprint(text).toString().length > 0).assertTrue();
      expect(textFingerprint(text + text)).assertEqual(textFingerprint(text + text));
      logStep("constantContractFingerprintSample2", String(textFingerprint(text)));
    });

    /**
     * @tc.name          constantContractFingerprintSample3
     * @tc.desc          Fingerprint of sample 3 matches the independent computation.
     * @tc.precondition  The fingerprint helper uses the published rolling hash.
     * @tc.steps         1. Fingerprint the input text.
     *                   2. Compare it with the independent digest.
     *                   3. Repeat the call for determinism.
     *                   4. Check the empty and extended inputs.
     * @tc.expected      The digest matches the independent value and stays inside its modulus.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractFingerprintSample3', 0, () => {
      const text: string = 'onCreate';
      expect(textFingerprint(text)).assertEqual(662095);
      expect(textFingerprint(text)).assertEqual(textFingerprint(text));
      expect(textFingerprint("")).assertEqual(216613);
      expect(textFingerprint(text) >= 0).assertTrue();
      expect(textFingerprint(text) < 1000003).assertTrue();
      expect(textFingerprint(text + "x") === textFingerprint(text)).assertEqual(false);
      expect(textFingerprint(text).toString().length > 0).assertTrue();
      expect(textFingerprint(text + text)).assertEqual(textFingerprint(text + text));
      logStep("constantContractFingerprintSample3", String(textFingerprint(text)));
    });

    /**
     * @tc.name          constantContractFingerprintSample4
     * @tc.desc          Fingerprint of sample 4 matches the independent computation.
     * @tc.precondition  The fingerprint helper uses the published rolling hash.
     * @tc.steps         1. Fingerprint the input text.
     *                   2. Compare it with the independent digest.
     *                   3. Repeat the call for determinism.
     *                   4. Check the empty and extended inputs.
     * @tc.expected      The digest matches the independent value and stays inside its modulus.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('constantContractFingerprintSample4', 0, () => {
      const text: string = 'onConnect';
      expect(textFingerprint(text)).assertEqual(322274);
      expect(textFingerprint(text)).assertEqual(textFingerprint(text));
      expect(textFingerprint("")).assertEqual(216613);
      expect(textFingerprint(text) >= 0).assertTrue();
      expect(textFingerprint(text) < 1000003).assertTrue();
      expect(textFingerprint(text + "x") === textFingerprint(text)).assertEqual(false);
      expect(textFingerprint(text).toString().length > 0).assertTrue();
      expect(textFingerprint(text + text)).assertEqual(textFingerprint(text + text));
      logStep("constantContractFingerprintSample4", String(textFingerprint(text)));
    });

  });
}
