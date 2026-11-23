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
  STUB_BUNDLE,
  STUB_ABILITY,
  CLIENT_BUNDLE,
  STUB_DESCRIPTOR,
  REQUEST_CODE,
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  ERROR_NONE,
  ERROR_STUB_REJECTED,
  joined,
  countOf,
  uniqueStrings,
  sameStringArray,
  textFingerprint,
  clampInt,
  isKnownRequestCode,
  InProcessClient,
  StubRemoteObjectModel,
  StubMetrics,
  replayCodes
} from '../Shared/SharedDriver';

const WANT_ACTION_START: string = 'ohos.want.action.startservice';

/** Pure Want double used to validate bundle and ability names. */
class WantModel {
  public bundleName: string;
  public abilityName: string;
  public deviceId: string;
  public action: string;

  constructor(bundleName: string, abilityName: string, deviceId: string = '', action: string = WANT_ACTION_START) {
    this.bundleName = bundleName;
    this.abilityName = abilityName;
    this.deviceId = deviceId;
    this.action = action;
  }

  public describe(): string {
    return this.bundleName + '/' + this.abilityName + '/' + this.deviceId + '/' + this.action;
  }

  public isLocal(): boolean {
    return this.deviceId.length === 0;
  }

  public namesServer(): boolean {
    return this.bundleName === STUB_BUNDLE && this.abilityName === STUB_ABILITY;
  }

  public namesClient(): boolean {
    return this.bundleName === CLIENT_BUNDLE && this.abilityName === STUB_ABILITY;
  }
}

/** Bundle names use lower case segments separated by dots. */
function bundleLooksValid(value: string): boolean {
  if (value.length === 0) {
    return false;
  }
  if (value.startsWith('.') || value.endsWith('.')) {
    return false;
  }
  if (value.indexOf('.') < 0) {
    return false;
  }
  for (let index = 0; index < value.length; index++) {
    const code: number = value.charCodeAt(index);
    const letter: boolean = code >= 97 && code <= 122;
    const digit: boolean = code >= 48 && code <= 57;
    const separator: boolean = value.charAt(index) === '.' || value.charAt(index) === '_';
    if (!letter && !digit && !separator) {
      return false;
    }
  }
  return true;
}

/** Ability names are CamelCase identifiers without separators. */
function abilityLooksValid(value: string): boolean {
  if (value.length === 0) {
    return false;
  }
  const first: number = value.charCodeAt(0);
  if (!(first >= 65 && first <= 90)) {
    return false;
  }
  for (let index = 0; index < value.length; index++) {
    const code: number = value.charCodeAt(index);
    const upper: boolean = code >= 65 && code <= 90;
    const lower: boolean = code >= 97 && code <= 122;
    const digit: boolean = code >= 48 && code <= 57;
    if (!upper && !lower && !digit) {
      return false;
    }
  }
  return true;
}

function buildServerWant(): WantModel {
  return new WantModel(STUB_BUNDLE, STUB_ABILITY);
}

function buildClientWant(): WantModel {
  return new WantModel(CLIENT_BUNDLE, STUB_ABILITY);
}

export default function wantValidation(): void {
  describe('WantValidation', () => {
    beforeAll(() => {
      logSuite('WantValidation', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('WantValidation', 'end');
    });

    /**
     * @tc.name          wantValidationServiceBundleLiteral
     * @tc.desc          The service Want names the documented bundle literal.
     * @tc.precondition  The Want model and shared constants are loaded.
     * @tc.steps         1. Build the server Want.
     *                   2. Read bundleName and abilityName.
     *                   3. Compare both against the shared constants.
     * @tc.expected      The bundle is com.example.ipc_stub and the ability is ServiceAbility.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('wantValidationServiceBundleLiteral', 0, () => {
      const want: WantModel = buildServerWant();
      logStep('wantValidationServiceBundleLiteral', want.describe());
      expect(want.bundleName).assertEqual('com.example.ipc_stub');
      expect(want.bundleName).assertEqual(STUB_BUNDLE);
      expect(want.abilityName).assertEqual('ServiceAbility');
      expect(want.abilityName).assertEqual(STUB_ABILITY);
      expect(want.isLocal()).assertTrue();
      expect(want.namesServer()).assertTrue();
      expect(want.namesClient()).assertFalse();
      expect(bundleLooksValid(want.bundleName)).assertTrue();
    });

    /**
     * @tc.name          wantValidationClientBundleDiffersFromServer
     * @tc.desc          A client Want uses a bundle distinct from the server bundle.
     * @tc.precondition  Both Want builders are available.
     * @tc.steps         1. Build the server and the client Wants.
     *                   2. Compare their bundle names.
     *                   3. Check the oracle predicates.
     * @tc.expected      The bundles differ while the ability name stays identical.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('wantValidationClientBundleDiffersFromServer', 0, () => {
      const server: WantModel = buildServerWant();
      const client: WantModel = buildClientWant();
      logStep('wantValidationClientBundleDiffersFromServer', client.describe());
      expect(server.bundleName).assertEqual(STUB_BUNDLE);
      expect(client.bundleName).assertEqual(CLIENT_BUNDLE);
      expect(server.bundleName === client.bundleName).assertFalse();
      expect(server.namesServer()).assertTrue();
      expect(client.namesServer()).assertFalse();
      expect(client.namesClient()).assertTrue();
      expect(server.abilityName).assertEqual(client.abilityName);
    });

    /**
     * @tc.name          wantValidationEmptyBundleIsRejected
     * @tc.desc          An empty bundle name fails bundle validation.
     * @tc.precondition  The bundle predicate is available.
     * @tc.steps         1. Build a Want with an empty bundle.
     *                   2. Evaluate the predicate.
     *                   3. Cross-check with a populated bundle.
     * @tc.expected      Only the populated bundle passes validation.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationEmptyBundleIsRejected', 0, () => {
      const empty: WantModel = new WantModel('', STUB_ABILITY);
      const populated: WantModel = buildServerWant();
      logStep('wantValidationEmptyBundleIsRejected', 'bundle=' + empty.bundleName);
      expect(empty.bundleName.length).assertEqual(0);
      expect(bundleLooksValid(empty.bundleName)).assertFalse();
      expect(bundleLooksValid(populated.bundleName)).assertTrue();
      expect(empty.namesServer()).assertFalse();
      expect(populated.namesServer()).assertTrue();
      expect(empty.describe().startsWith('/')).assertTrue();
    });

    /**
     * @tc.name          wantValidationEmptyAbilityIsRejected
     * @tc.desc          An empty ability name fails ability validation.
     * @tc.precondition  The ability predicate is available.
     * @tc.steps         1. Build a Want with an empty ability.
     *                   2. Evaluate the predicate.
     *                   3. Compare with the documented ability.
     * @tc.expected      Empty is rejected and ServiceAbility is accepted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationEmptyAbilityIsRejected', 0, () => {
      const empty: WantModel = new WantModel(STUB_BUNDLE, '');
      logStep('wantValidationEmptyAbilityIsRejected', 'ability=' + empty.abilityName);
      expect(empty.abilityName.length).assertEqual(0);
      expect(abilityLooksValid(empty.abilityName)).assertFalse();
      expect(abilityLooksValid(STUB_ABILITY)).assertTrue();
      expect(empty.namesServer()).assertFalse();
      expect(empty.bundleName).assertEqual(STUB_BUNDLE);
      expect(bundleLooksValid(empty.bundleName)).assertTrue();
    });

    /**
     * @tc.name          wantValidationBlankBundleIsRejected
     * @tc.desc          A whitespace-only bundle name fails validation.
     * @tc.precondition  The bundle predicate is available.
     * @tc.steps         1. Build a Want with a blank bundle.
     *                   2. Run the predicate over the blank value.
     *                   3. Run it over the documented bundle.
     * @tc.expected      The blank value is rejected and the literal passes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationBlankBundleIsRejected', 0, () => {
      const blank: WantModel = new WantModel('   ', STUB_ABILITY);
      const server: WantModel = buildServerWant();
      logStep('wantValidationBlankBundleIsRejected', 'len=' + String(blank.bundleName.length));
      expect(blank.bundleName.length).assertEqual(3);
      expect(blank.bundleName.trim().length).assertEqual(0);
      expect(bundleLooksValid(blank.bundleName)).assertFalse();
      expect(bundleLooksValid(server.bundleName)).assertTrue();
      expect(blank.bundleName.indexOf('.')).assertEqual(-1);
      expect(blank.namesServer()).assertFalse();
    });

    /**
     * @tc.name          wantValidationWhitespaceAbilityIsRejected
     * @tc.desc          An ability name containing spaces fails validation.
     * @tc.precondition  The ability predicate is available.
     * @tc.steps         1. Build a Want whose ability has a space.
     *                   2. Evaluate the predicate.
     *                   3. Evaluate the documented ability.
     * @tc.expected      The spaced name is rejected while ServiceAbility passes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationWhitespaceAbilityIsRejected', 0, () => {
      const spaced: WantModel = new WantModel(STUB_BUNDLE, 'Service Ability');
      logStep('wantValidationWhitespaceAbilityIsRejected', spaced.abilityName);
      expect(spaced.abilityName.length).assertEqual(15);
      expect(spaced.abilityName.indexOf(' ')).assertEqual(7);
      expect(abilityLooksValid(spaced.abilityName)).assertFalse();
      expect(abilityLooksValid(STUB_ABILITY)).assertTrue();
      expect(spaced.namesServer()).assertFalse();
      expect(spaced.bundleName).assertEqual(STUB_BUNDLE);
      expect(spaced.isLocal()).assertTrue();
    });

    /**
     * @tc.name          wantValidationBundleCaseSensitivity
     * @tc.desc          Bundle comparison is exact and therefore case sensitive.
     * @tc.precondition  The Want model is available.
     * @tc.steps         1. Build an upper case bundle Want.
     *                   2. Compare it with the documented bundle.
     *                   3. Repeat with the exact bundle.
     * @tc.expected      Only the exact lower case bundle matches.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationBundleCaseSensitivity', 0, () => {
      const upper: WantModel = new WantModel('COM.EXAMPLE.IPC_STUB', STUB_ABILITY);
      const exact: WantModel = buildServerWant();
      logStep('wantValidationBundleCaseSensitivity', upper.bundleName);
      expect(upper.bundleName).assertEqual('COM.EXAMPLE.IPC_STUB');
      expect(upper.bundleName === STUB_BUNDLE).assertFalse();
      expect(exact.bundleName === STUB_BUNDLE).assertTrue();
      expect(upper.namesServer()).assertFalse();
      expect(exact.namesServer()).assertTrue();
      expect(upper.bundleName.toLowerCase()).assertEqual(STUB_BUNDLE);
      expect(bundleLooksValid(upper.bundleName)).assertFalse();
    });

    /**
     * @tc.name          wantValidationAbilityCaseSensitivity
     * @tc.desc          Ability comparison is exact and therefore case sensitive.
     * @tc.precondition  The Want model is available.
     * @tc.steps         1. Build a lower case ability Want.
     *                   2. Compare it with ServiceAbility.
     *                   3. Evaluate the ability predicate.
     * @tc.expected      The lower case name is rejected by both checks.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationAbilityCaseSensitivity', 0, () => {
      const lower: WantModel = new WantModel(STUB_BUNDLE, 'serviceability');
      const exact: WantModel = buildServerWant();
      logStep('wantValidationAbilityCaseSensitivity', lower.abilityName);
      expect(lower.abilityName).assertEqual('serviceability');
      expect(lower.abilityName === STUB_ABILITY).assertFalse();
      expect(exact.abilityName === STUB_ABILITY).assertTrue();
      expect(lower.namesServer()).assertFalse();
      expect(exact.namesServer()).assertTrue();
      expect(abilityLooksValid(lower.abilityName)).assertFalse();
      expect(abilityLooksValid(exact.abilityName)).assertTrue();
    });

    /**
     * @tc.name          wantValidationServerWantMatchesBothLiterals
     * @tc.desc          The server Want matches bundle and ability simultaneously.
     * @tc.precondition  The namesServer oracle is available.
     * @tc.steps         1. Build the server Want.
     *                   2. Evaluate namesServer twice.
     *                   3. Confirm with direct literal comparisons.
     * @tc.expected      Every comparison reports a match.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('wantValidationServerWantMatchesBothLiterals', 0, () => {
      const want: WantModel = buildServerWant();
      logStep('wantValidationServerWantMatchesBothLiterals', want.describe());
      expect(want.namesServer()).assertTrue();
      expect(want.namesServer()).assertTrue();
      expect(want.bundleName === STUB_BUNDLE).assertTrue();
      expect(want.abilityName === STUB_ABILITY).assertTrue();
      expect(want.action).assertEqual(WANT_ACTION_START);
      expect(want.deviceId.length).assertEqual(0);
      expect(want.isLocal()).assertTrue();
      expect(want.describe().indexOf(STUB_DESCRIPTOR)).assertEqual(-1);
    });

    /**
     * @tc.name          wantValidationClientWantDoesNotMatchServer
     * @tc.desc          A client bundle Want is not accepted by namesServer.
     * @tc.precondition  Both builders are available.
     * @tc.steps         1. Build the client Want.
     *                   2. Evaluate namesServer and namesClient.
     *                   3. Compare the bundle with the server literal.
     * @tc.expected      namesServer is false and namesClient is true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('wantValidationClientWantDoesNotMatchServer', 0, () => {
      const want: WantModel = buildClientWant();
      logStep('wantValidationClientWantDoesNotMatchServer', want.bundleName);
      expect(want.namesServer()).assertFalse();
      expect(want.namesClient()).assertTrue();
      expect(want.bundleName === STUB_BUNDLE).assertFalse();
      expect(want.bundleName === CLIENT_BUNDLE).assertTrue();
      expect(want.abilityName === STUB_ABILITY).assertTrue();
      expect(bundleLooksValid(want.bundleName)).assertTrue();
      expect(want.isLocal()).assertTrue();
    });

    /**
     * @tc.name          wantValidationTrailingDotBundleIsRejected
     * @tc.desc          A bundle ending with a dot is malformed.
     * @tc.precondition  The bundle predicate is available.
     * @tc.steps         1. Build a bundle with a trailing dot.
     *                   2. Evaluate the predicate.
     *                   3. Confirm the documented bundle still passes.
     * @tc.expected      The trailing dot form is rejected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationTrailingDotBundleIsRejected', 0, () => {
      const trailing: WantModel = new WantModel('com.example.ipc_stub.', STUB_ABILITY);
      logStep('wantValidationTrailingDotBundleIsRejected', trailing.bundleName);
      expect(trailing.bundleName.endsWith('.')).assertTrue();
      expect(bundleLooksValid(trailing.bundleName)).assertFalse();
      expect(bundleLooksValid(STUB_BUNDLE)).assertTrue();
      expect(trailing.bundleName.length).assertEqual(STUB_BUNDLE.length + 1);
      expect(trailing.namesServer()).assertFalse();
      expect(trailing.bundleName.startsWith(STUB_BUNDLE)).assertTrue();
    });

    /**
     * @tc.name          wantValidationLeadingDotBundleIsRejected
     * @tc.desc          A bundle starting with a dot is malformed.
     * @tc.precondition  The bundle predicate is available.
     * @tc.steps         1. Build a bundle with a leading dot.
     *                   2. Evaluate the predicate.
     *                   3. Compare against the canonical bundle.
     * @tc.expected      The leading dot form is rejected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationLeadingDotBundleIsRejected', 0, () => {
      const leading: WantModel = new WantModel('.com.example.ipc_stub', STUB_ABILITY);
      logStep('wantValidationLeadingDotBundleIsRejected', leading.bundleName);
      expect(leading.bundleName.startsWith('.')).assertTrue();
      expect(bundleLooksValid(leading.bundleName)).assertFalse();
      expect(leading.bundleName.substring(1)).assertEqual(STUB_BUNDLE);
      expect(leading.bundleName.length).assertEqual(STUB_BUNDLE.length + 1);
      expect(leading.namesServer()).assertFalse();
      expect(bundleLooksValid(STUB_BUNDLE)).assertTrue();
    });

    /**
     * @tc.name          wantValidationSingleSegmentBundleIsRejected
     * @tc.desc          A bundle without a dot separator is rejected.
     * @tc.precondition  The bundle predicate is available.
     * @tc.steps         1. Build a single segment bundle.
     *                   2. Evaluate the predicate.
     *                   3. Evaluate the canonical bundle.
     * @tc.expected      Only the dotted bundle passes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationSingleSegmentBundleIsRejected', 0, () => {
      const single: WantModel = new WantModel('ipcstub', STUB_ABILITY);
      logStep('wantValidationSingleSegmentBundleIsRejected', single.bundleName);
      expect(single.bundleName.indexOf('.')).assertEqual(-1);
      expect(bundleLooksValid(single.bundleName)).assertFalse();
      expect(STUB_BUNDLE.indexOf('.')).assertLarger(0);
      expect(bundleLooksValid(STUB_BUNDLE)).assertTrue();
      expect(single.namesServer()).assertFalse();
      expect(countOf(STUB_BUNDLE.split('.'), 'example')).assertEqual(1);
    });

    /**
     * @tc.name          wantValidationUnderscoreBundleIsAccepted
     * @tc.desc          The documented bundle contains an underscore segment suffix.
     * @tc.precondition  The bundle predicate accepts underscores.
     * @tc.steps         1. Read the documented bundle.
     *                   2. Locate the underscore.
     *                   3. Validate the literal.
     * @tc.expected      The underscore is allowed and the literal passes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationUnderscoreBundleIsAccepted', 0, () => {
      logStep('wantValidationUnderscoreBundleIsAccepted', STUB_BUNDLE);
      expect(STUB_BUNDLE.indexOf('_')).assertLarger(0);
      expect(STUB_BUNDLE.split('_').length).assertEqual(2);
      expect(STUB_BUNDLE.split('_')[1]).assertEqual('stub');
      expect(bundleLooksValid(STUB_BUNDLE)).assertTrue();
      expect(bundleLooksValid('com.example.ipc_stub')).assertTrue();
      expect(countOf(STUB_BUNDLE.split('.'), 'ipc_stub')).assertEqual(1);
    });

    /**
     * @tc.name          wantValidationHyphenBundleIsRejected
     * @tc.desc          A hyphen is not part of the accepted bundle alphabet.
     * @tc.precondition  The bundle predicate is available.
     * @tc.steps         1. Build a bundle with a hyphen.
     *                   2. Evaluate the predicate.
     *                   3. Confirm the underscore variant passes.
     * @tc.expected      The hyphen form is rejected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationHyphenBundleIsRejected', 0, () => {
      const hyphen: WantModel = new WantModel('com.example.ipc-stub', STUB_ABILITY);
      logStep('wantValidationHyphenBundleIsRejected', hyphen.bundleName);
      expect(hyphen.bundleName.indexOf('-')).assertLarger(0);
      expect(bundleLooksValid(hyphen.bundleName)).assertFalse();
      expect(bundleLooksValid('com.example.ipc_stub')).assertTrue();
      expect(hyphen.namesServer()).assertFalse();
      expect(hyphen.bundleName.replace('-', '_')).assertEqual(STUB_BUNDLE);
      expect(countOf(hyphen.bundleName.split(''), '-')).assertEqual(1);
    });

    /**
     * @tc.name          wantValidationDigitSegmentBundleIsAccepted
     * @tc.desc          Digits are allowed inside bundle segments.
     * @tc.precondition  The bundle predicate is available.
     * @tc.steps         1. Build a bundle with a digit segment.
     *                   2. Evaluate the predicate.
     *                   3. Confirm the digit count independently.
     * @tc.expected      The digit form passes and the canonical bundle has none.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationDigitSegmentBundleIsAccepted', 0, () => {
      const digit: WantModel = new WantModel('com.example.ipc2_stub', STUB_ABILITY);
      logStep('wantValidationDigitSegmentBundleIsAccepted', digit.bundleName);
      expect(bundleLooksValid(digit.bundleName)).assertTrue();
      expect(digit.bundleName.indexOf('2')).assertLarger(0);
      expect(digit.namesServer()).assertFalse();
      expect(bundleLooksValid(STUB_BUNDLE)).assertTrue();
      expect(countOf(STUB_BUNDLE.split(''), '2')).assertEqual(0);
      expect(digit.bundleName.length).assertEqual(STUB_BUNDLE.length + 1);
    });

    /**
     * @tc.name          wantValidationLongBundleIsAccepted
     * @tc.desc          A long dotted bundle passes lexical validation.
     * @tc.precondition  The bundle predicate is available.
     * @tc.steps         1. Build a long bundle.
     *                   2. Evaluate the predicate.
     *                   3. Confirm segment count.
     * @tc.expected      The long bundle is accepted with eight segments.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationLongBundleIsAccepted', 0, () => {
      const longName: string = 'com.example.enterprise.services.ipc.stub.validation.module';
      const want: WantModel = new WantModel(longName, STUB_ABILITY);
      logStep('wantValidationLongBundleIsAccepted', longName);
      expect(bundleLooksValid(longName)).assertTrue();
      expect(longName.split('.').length).assertEqual(8);
      expect(longName.length).assertLarger(STUB_BUNDLE.length);
      expect(want.namesServer()).assertFalse();
      expect(want.abilityName).assertEqual(STUB_ABILITY);
      expect(countOf(longName.split('.'), 'ipc')).assertEqual(1);
      expect(longName.startsWith('com.example')).assertTrue();
    });

    /**
     * @tc.name          wantValidationInnerSpaceBundleIsRejected
     * @tc.desc          A bundle containing an inner space is malformed.
     * @tc.precondition  The bundle predicate is available.
     * @tc.steps         1. Build a bundle with an inner space.
     *                   2. Evaluate the predicate.
     *                   3. Compare with the trimmed form.
     * @tc.expected      The spaced form is rejected while the trimmed form passes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationInnerSpaceBundleIsRejected', 0, () => {
      const spaced: string = 'com.example.ipc stub';
      const want: WantModel = new WantModel(spaced, STUB_ABILITY);
      logStep('wantValidationInnerSpaceBundleIsRejected', spaced);
      expect(bundleLooksValid(spaced)).assertFalse();
      expect(spaced.indexOf(' ')).assertLarger(0);
      expect(spaced.replace(' ', '_')).assertEqual('com.example.ipc_stub');
      expect(bundleLooksValid(spaced.replace(' ', '_'))).assertTrue();
      expect(want.namesServer()).assertFalse();
      expect(spaced.split(' ').length).assertEqual(2);
    });

    /**
     * @tc.name          wantValidationUnicodeAbilityIsRejected
     * @tc.desc          Non ASCII characters are rejected in ability names.
     * @tc.precondition  The ability predicate is available.
     * @tc.steps         1. Build an ability with a non ASCII character.
     *                   2. Evaluate the predicate.
     *                   3. Confirm ASCII ServiceAbility passes.
     * @tc.expected      The unicode ability is rejected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationUnicodeAbilityIsRejected', 0, () => {
      const unicode: WantModel = new WantModel(STUB_BUNDLE, 'ServiceAbility\u4e00');
      logStep('wantValidationUnicodeAbilityIsRejected', unicode.abilityName);
      expect(unicode.abilityName.length).assertEqual(STUB_ABILITY.length + 1);
      expect(abilityLooksValid(unicode.abilityName)).assertFalse();
      expect(abilityLooksValid(STUB_ABILITY)).assertTrue();
      expect(unicode.namesServer()).assertFalse();
      expect(unicode.abilityName.startsWith('ServiceAbility')).assertTrue();
      expect(unicode.abilityName.charCodeAt(0)).assertEqual(83);
      expect(unicode.bundleName).assertEqual(STUB_BUNDLE);
    });

    /**
     * @tc.name          wantValidationUnderscoreAbilityIsRejected
     * @tc.desc          Ability names do not accept underscore separators.
     * @tc.precondition  The ability predicate is available.
     * @tc.steps         1. Build an ability with an underscore.
     *                   2. Evaluate the predicate.
     *                   3. Compare with the canonical ability.
     * @tc.expected      The underscored ability is rejected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationUnderscoreAbilityIsRejected', 0, () => {
      const underscored: WantModel = new WantModel(STUB_BUNDLE, 'Service_Ability');
      logStep('wantValidationUnderscoreAbilityIsRejected', underscored.abilityName);
      expect(underscored.abilityName.indexOf('_')).assertLarger(0);
      expect(abilityLooksValid(underscored.abilityName)).assertFalse();
      expect(underscored.abilityName.replace('_', '')).assertEqual(STUB_ABILITY);
      expect(underscored.namesServer()).assertFalse();
      expect(abilityLooksValid(STUB_ABILITY)).assertTrue();
      expect(underscored.abilityName.split('_').length).assertEqual(2);
    });

    /**
     * @tc.name          wantValidationDigitAbilityIsAccepted
     * @tc.desc          Digits after the first character are allowed in ability names.
     * @tc.precondition  The ability predicate is available.
     * @tc.steps         1. Build ServiceAbility2.
     *                   2. Evaluate the predicate.
     *                   3. Confirm it differs from the canonical ability.
     * @tc.expected      The digit suffix is accepted lexically but not equal to ServiceAbility.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationDigitAbilityIsAccepted', 0, () => {
      const suffixed: WantModel = new WantModel(STUB_BUNDLE, 'ServiceAbility2');
      logStep('wantValidationDigitAbilityIsAccepted', suffixed.abilityName);
      expect(abilityLooksValid('ServiceAbility2')).assertTrue();
      expect(suffixed.abilityName.length).assertEqual(STUB_ABILITY.length + 1);
      expect(suffixed.abilityName === STUB_ABILITY).assertFalse();
      expect(suffixed.namesServer()).assertFalse();
      expect(suffixed.abilityName.endsWith('2')).assertTrue();
      expect(abilityLooksValid(STUB_ABILITY)).assertTrue();
    });

    /**
     * @tc.name          wantValidationLowercaseAbilityIsRejected
     * @tc.desc          An ability starting with a lower case letter is rejected.
     * @tc.precondition  The ability predicate is available.
     * @tc.steps         1. Build serviceAbility.
     *                   2. Evaluate the predicate.
     *                   3. Confirm the upper case form passes.
     * @tc.expected      Only the upper case initial passes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationLowercaseAbilityIsRejected', 0, () => {
      const lower: string = 'serviceAbility';
      logStep('wantValidationLowercaseAbilityIsRejected', lower);
      expect(abilityLooksValid(lower)).assertFalse();
      expect(lower.charCodeAt(0)).assertEqual(115);
      expect(STUB_ABILITY.charCodeAt(0)).assertEqual(83);
      expect(lower.toUpperCase().charAt(0)).assertEqual(STUB_ABILITY.charAt(0));
      expect(abilityLooksValid(STUB_ABILITY)).assertTrue();
      expect(lower.length).assertEqual(STUB_ABILITY.length);
    });

    /**
     * @tc.name          wantValidationDuplicateWantsCollapse
     * @tc.desc          Duplicate Want descriptors collapse to unique entries.
     * @tc.precondition  The uniqueStrings helper is available.
     * @tc.steps         1. Build a list with repeated descriptors.
     *                   2. Apply uniqueStrings.
     *                   3. Compare sizes.
     * @tc.expected      Three duplicates collapse into one entry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationDuplicateWantsCollapse', 0, () => {
      const server: WantModel = buildServerWant();
      const text: string = server.describe();
      const raw: string[] = [text, text, text, CLIENT_BUNDLE];
      const unique: string[] = uniqueStrings(raw);
      logStep('wantValidationDuplicateWantsCollapse', String(unique.length));
      expect(raw.length).assertEqual(4);
      expect(unique.length).assertEqual(2);
      expect(unique[0]).assertEqual(text);
      expect(unique[1]).assertEqual(CLIENT_BUNDLE);
      expect(countOf(raw, text)).assertEqual(3);
      expect(countOf(unique, text)).assertEqual(1);
      expect(text.indexOf(STUB_BUNDLE)).assertEqual(0);
    });

    /**
     * @tc.name          wantValidationWantListJoinPreservesOrder
     * @tc.desc          Joined Want descriptors keep their insertion order.
     * @tc.precondition  The joined helper is available.
     * @tc.steps         1. Build three descriptors.
     *                   2. Join them with a pipe.
     *                   3. Split the result back.
     * @tc.expected      The split array equals the source order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationWantListJoinPreservesOrder', 0, () => {
      const server: string = buildServerWant().describe();
      const client: string = buildClientWant().describe();
      const third: string = new WantModel('com.example.third', STUB_ABILITY).describe();
      const text: string = joined([server, client, third], '|');
      logStep('wantValidationWantListJoinPreservesOrder', text);
      expect(text.split('|').length).assertEqual(3);
      expect(text.split('|')[0]).assertEqual(server);
      expect(text.split('|')[1]).assertEqual(client);
      expect(text.split('|')[2]).assertEqual(third);
      expect(text.indexOf(server)).assertEqual(0);
      expect(text.endsWith(third)).assertTrue();
      expect(joined([server], '|')).assertEqual(server);
    });

    /**
     * @tc.name          wantValidationWantBundleCount
     * @tc.desc          countOf reports how many Wants target the server bundle.
     * @tc.precondition  The countOf helper is available.
     * @tc.steps         1. Build a mixed bundle list.
     *                   2. Count the server bundle.
     *                   3. Count the client bundle.
     * @tc.expected      The counts are two and one respectively.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationWantBundleCount', 0, () => {
      const bundles: string[] = [STUB_BUNDLE, CLIENT_BUNDLE, STUB_BUNDLE, 'com.example.other'];
      logStep('wantValidationWantBundleCount', joined(bundles, ','));
      expect(bundles.length).assertEqual(4);
      expect(countOf(bundles, STUB_BUNDLE)).assertEqual(2);
      expect(countOf(bundles, CLIENT_BUNDLE)).assertEqual(1);
      expect(countOf(bundles, 'com.example.other')).assertEqual(1);
      expect(countOf(bundles, 'missing')).assertEqual(0);
      expect(countOf(bundles, STUB_BUNDLE) + countOf(bundles, CLIENT_BUNDLE)).assertEqual(3);
    });

    /**
     * @tc.name          wantValidationIdenticalWantListsMatch
     * @tc.desc          Two independently built identical Want lists compare equal.
     * @tc.precondition  The sameStringArray helper is available.
     * @tc.steps         1. Build two identical array literals.
     *                   2. Compare them.
     *                   3. Compare arrays of different lengths.
     * @tc.expected      Identical arrays match and unequal lengths do not.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationIdenticalWantListsMatch', 0, () => {
      const left: string[] = [STUB_BUNDLE, CLIENT_BUNDLE];
      const right: string[] = [STUB_BUNDLE, CLIENT_BUNDLE];
      const longer: string[] = [STUB_BUNDLE, CLIENT_BUNDLE, STUB_BUNDLE];
      logStep('wantValidationIdenticalWantListsMatch', joined(left, ','));
      expect(sameStringArray(left, right)).assertTrue();
      expect(sameStringArray(left, longer)).assertFalse();
      expect(left.length).assertEqual(right.length);
      expect(longer.length).assertEqual(3);
      expect(left[0]).assertEqual(right[0]);
      expect(left[1]).assertEqual(right[1]);
      expect(sameStringArray([], [])).assertTrue();
    });

    /**
     * @tc.name          wantValidationReorderedWantListsDiffer
     * @tc.desc          Order matters when comparing Want name lists.
     * @tc.precondition  The sameStringArray helper is available.
     * @tc.steps         1. Build an ordered list.
     *                   2. Reverse it.
     *                   3. Compare both directions.
     * @tc.expected      The reversed list is not equal to the original.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationReorderedWantListsDiffer', 0, () => {
      const ordered: string[] = [STUB_BUNDLE, CLIENT_BUNDLE];
      const reversed: string[] = [CLIENT_BUNDLE, STUB_BUNDLE];
      logStep('wantValidationReorderedWantListsDiffer', joined(reversed, ','));
      expect(sameStringArray(ordered, ordered)).assertTrue();
      expect(sameStringArray(ordered, reversed)).assertFalse();
      expect(reversed[0]).assertEqual(ordered[1]);
      expect(reversed[1]).assertEqual(ordered[0]);
      expect(reversed.length).assertEqual(ordered.length);
      expect(countOf(ordered, STUB_BUNDLE)).assertEqual(1);
      expect(countOf(reversed, STUB_BUNDLE)).assertEqual(1);
    });

    /**
     * @tc.name          wantValidationWantFingerprintStable
     * @tc.desc          The Want fingerprint is deterministic for the same text.
     * @tc.precondition  The textFingerprint helper is available.
     * @tc.steps         1. Describe the server Want twice.
     *                   2. Fingerprint both strings.
     *                   3. Fingerprint a different Want.
     * @tc.expected      Equal text yields equal fingerprints; different text does not.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationWantFingerprintStable', 0, () => {
      const first: string = buildServerWant().describe();
      const second: string = buildServerWant().describe();
      const other: string = buildClientWant().describe();
      logStep('wantValidationWantFingerprintStable', String(textFingerprint(first)));
      expect(first).assertEqual(second);
      expect(textFingerprint(first)).assertEqual(textFingerprint(second));
      expect(textFingerprint(first) === textFingerprint(other)).assertFalse();
      expect(textFingerprint(first) >= 0).assertTrue();
      expect(textFingerprint(first) < 1000003).assertTrue();
      expect(textFingerprint('')).assertEqual(216613);
      expect(textFingerprint(first)).assertLarger(0);
    });

    /**
     * @tc.name          wantValidationRemoteWantCarriesDeviceId
     * @tc.desc          A device id marks the Want as non local.
     * @tc.precondition  The Want model supports device identifiers.
     * @tc.steps         1. Build a Want with a device id.
     *                   2. Evaluate isLocal.
     *                   3. Compare with the local Want.
     * @tc.expected      Only the empty device id Want reports local.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationRemoteWantCarriesDeviceId', 0, () => {
      const remote: WantModel = new WantModel(STUB_BUNDLE, STUB_ABILITY, 'device-01');
      const local: WantModel = buildServerWant();
      logStep('wantValidationRemoteWantCarriesDeviceId', remote.deviceId);
      expect(remote.isLocal()).assertFalse();
      expect(local.isLocal()).assertTrue();
      expect(remote.deviceId.length).assertEqual(9);
      expect(local.deviceId.length).assertEqual(0);
      expect(remote.namesServer()).assertTrue();
      expect(remote.describe().indexOf('device-01')).assertLarger(0);
      expect(remote.describe() === local.describe()).assertFalse();
    });

    /**
     * @tc.name          wantValidationActionLiteralIsStartService
     * @tc.desc          The default Want action is the documented start service action.
     * @tc.precondition  The Want model default action is configured.
     * @tc.steps         1. Build the server Want.
     *                   2. Read the action.
     *                   3. Compare with a literal and a prefix.
     * @tc.expected      The action equals ohos.want.action.startservice.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationActionLiteralIsStartService', 0, () => {
      const want: WantModel = buildServerWant();
      logStep('wantValidationActionLiteralIsStartService', want.action);
      expect(want.action).assertEqual('ohos.want.action.startservice');
      expect(want.action).assertEqual(WANT_ACTION_START);
      expect(want.action.startsWith('ohos.want.action.')).assertTrue();
      expect(want.action.endsWith('startservice')).assertTrue();
      expect(want.action.length).assertEqual(29);
      expect(want.action.indexOf('action')).assertLarger(0);
      expect(want.describe().endsWith(WANT_ACTION_START)).assertTrue();
    });

    /**
     * @tc.name          wantValidationDescribeFormat
     * @tc.desc          The Want description joins four fields with slashes.
     * @tc.precondition  The Want model is available.
     * @tc.steps         1. Build the serving Want.
     *                   2. Split its description.
     *                   3. Inspect each field.
     * @tc.expected      Four fields appear in bundle, ability, device, action order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationDescribeFormat', 0, () => {
      const want: WantModel = buildServerWant();
      const parts: string[] = want.describe().split('/');
      logStep('wantValidationDescribeFormat', want.describe());
      expect(parts.length).assertEqual(4);
      expect(parts[0]).assertEqual(STUB_BUNDLE);
      expect(parts[1]).assertEqual(STUB_ABILITY);
      expect(parts[2].length).assertEqual(0);
      expect(parts[3]).assertEqual(WANT_ACTION_START);
      expect(want.describe().indexOf('/' + STUB_ABILITY + '/')).assertLarger(0);
      expect(want.describe().split('/').length).assertEqual(4);
    });

    /**
     * @tc.name          wantValidationIndexClampWithinBounds
     * @tc.desc          clampInt bounds a Want index inside the list.
     * @tc.precondition  The clampInt helper is available.
     * @tc.steps         1. Clamp a negative index.
     *                   2. Clamp an oversized index.
     *                   3. Clamp a valid index.
     * @tc.expected      Bounded values are low, high and the original value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationIndexClampWithinBounds', 0, () => {
      const wants: string[] = [STUB_BUNDLE, CLIENT_BUNDLE, STUB_BUNDLE];
      const low: number = clampInt(-4, 0, wants.length - 1);
      const high: number = clampInt(9, 0, wants.length - 1);
      const inside: number = clampInt(1, 0, wants.length - 1);
      logStep('wantValidationIndexClampWithinBounds', String(low) + '/' + String(high) + '/' + String(inside));
      expect(low).assertEqual(0);
      expect(high).assertEqual(2);
      expect(inside).assertEqual(1);
      expect(wants[low]).assertEqual(STUB_BUNDLE);
      expect(wants[high]).assertEqual(STUB_BUNDLE);
      expect(wants[inside]).assertEqual(CLIENT_BUNDLE);
      expect(clampInt(0, 0, 0)).assertEqual(0);
    });

    /**
     * @tc.name          wantValidationKnownRequestCodeOnlyOne
     * @tc.desc          Only code one is known by the documented stub.
     * @tc.precondition  The isKnownRequestCode helper is available.
     * @tc.steps         1. Evaluate code one.
     *                   2. Evaluate neighbouring codes.
     *                   3. Confirm the request constant.
     * @tc.expected      Only code one is accepted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationKnownRequestCodeOnlyOne', 0, () => {
      logStep('wantValidationKnownRequestCodeOnlyOne', String(REQUEST_CODE));
      expect(isKnownRequestCode(REQUEST_CODE)).assertTrue();
      expect(isKnownRequestCode(0)).assertFalse();
      expect(isKnownRequestCode(2)).assertFalse();
      expect(isKnownRequestCode(-1)).assertFalse();
      expect(isKnownRequestCode(99)).assertFalse();
      expect(REQUEST_CODE).assertEqual(1);
      expect(isKnownRequestCode(REQUEST_CODE + 1)).assertFalse();
    });

    /**
     * @tc.name          wantValidationReplayCodesToServerWant
     * @tc.desc          A replayed request ledger records one entry per code.
     * @tc.precondition  The replayCodes helper and a stub are available.
     * @tc.steps         1. Replay three codes.
     *                   2. Count the recorded requests.
     *                   3. Inspect the handled flags.
     * @tc.expected      Three records appear with one handled entry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationReplayCodesToServerWant', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = replayCodes(stub, [REQUEST_CODE, 0, 2]);
      const metrics: StubMetrics = StubMetrics.from(stub);
      logStep('wantValidationReplayCodesToServerWant', String(metrics.requests));
      expect(client.sentCodes.length).assertEqual(3);
      expect(stub.requestCount()).assertEqual(3);
      expect(metrics.requests).assertEqual(3);
      expect(metrics.handled).assertEqual(1);
      expect(metrics.rejected).assertEqual(2);
      expect(metrics.successRatio()).assertLarger(0);
      expect(metrics.successRatio()).assertLess(1);
      expect(client.sentTexts[0]).assertEqual(REQUEST_PAYLOAD);
    });

    /**
     * @tc.name          wantValidationServerWantRequestSucceeds
     * @tc.desc          A request routed through the server Want succeeds.
     * @tc.precondition  A stub and an in-process client are available.
     * @tc.steps         1. Build the server Want.
     *                   2. Send code one with the documented payload.
     *                   3. Inspect the result.
     * @tc.expected      The result is successful with error code zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('wantValidationServerWantRequestSucceeds', 0, () => {
      const want: WantModel = buildServerWant();
      const client: InProcessClient = new InProcessClient(new StubRemoteObjectModel());
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      logStep('wantValidationServerWantRequestSucceeds', want.bundleName);
      expect(want.namesServer()).assertTrue();
      expect(result.isSuccess()).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.handled).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.sentCodes[0]).assertEqual(REQUEST_CODE);
      expect(client.sentTexts[0]).assertEqual(REQUEST_PAYLOAD);
      expect(client.replies.length).assertEqual(1);
    });

    /**
     * @tc.name          wantValidationServerWantReplyLiteral
     * @tc.desc          The reply text is the documented hello rpc literal.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send one request.
     *                   2. Read the reply.
     *                   3. Compare with the literal and its length.
     * @tc.expected      The reply is hello rpc with nine characters.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('wantValidationServerWantReplyLiteral', 0, () => {
      const client: InProcessClient = new InProcessClient(new StubRemoteObjectModel());
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      logStep('wantValidationServerWantReplyLiteral', result.replyText);
      expect(result.replyText).assertEqual('hello rpc');
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(result.replyText.length).assertEqual(9);
      expect(result.replyText.split(' ').length).assertEqual(2);
      expect(result.replyText.startsWith('hello')).assertTrue();
      expect(result.replyText.endsWith('rpc')).assertTrue();
      expect(client.trace()).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          wantValidationUnknownCodeReturnsFalse
     * @tc.desc          An unknown code returns false and no reply text.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send code zero.
     *                   2. Inspect the result and the reply buffer.
     *                   3. Confirm the rejection error.
     * @tc.expected      The result is not handled and carries the rejection error.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationUnknownCodeReturnsFalse', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      const result = client.send(0, REQUEST_PAYLOAD);
      logStep('wantValidationUnknownCodeReturnsFalse', String(result.errCode));
      expect(result.handled).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual('');
      expect(result.isSuccess()).assertFalse();
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.lastRequest()?.handled).assertFalse();
      expect(client.replies.length).assertEqual(0);
    });

    /**
     * @tc.name          wantValidationWantSendCountAccumulates
     * @tc.desc          Repeated sends through the Want accumulate results.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send five requests.
     *                   2. Count successes.
     *                   3. Inspect the ledger.
     * @tc.expected      Five successes are reported and five replies are stored.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationWantSendCountAccumulates', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      const handled: number = client.sendMany(5, REQUEST_CODE);
      logStep('wantValidationWantSendCountAccumulates', String(handled));
      expect(handled).assertEqual(5);
      expect(stub.requestCount()).assertEqual(5);
      expect(client.results.length).assertEqual(5);
      expect(client.replies.length).assertEqual(5);
      expect(client.sentCodes.length).assertEqual(5);
      expect(countOf(client.sentTexts, REQUEST_PAYLOAD)).assertEqual(5);
      expect(client.trace().split('|').length).assertEqual(5);
    });

    /**
     * @tc.name          wantValidationWantMetricsAfterMixedTraffic
     * @tc.desc          Metrics summarize handled and rejected Want requests.
     * @tc.precondition  A stub with mixed traffic is available.
     * @tc.steps         1. Replay two known and three unknown codes.
     *                   2. Derive metrics.
     *                   3. Compare ratios.
     * @tc.expected      Two handled, three rejected and a ratio of two fifths.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationWantMetricsAfterMixedTraffic', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = replayCodes(stub, [REQUEST_CODE, 2, REQUEST_CODE, 99, 0]);
      const metrics: StubMetrics = StubMetrics.from(stub);
      logStep('wantValidationWantMetricsAfterMixedTraffic', String(metrics.fingerprint()));
      expect(client.sentCodes.length).assertEqual(5);
      expect(metrics.requests).assertEqual(5);
      expect(metrics.handled).assertEqual(2);
      expect(metrics.rejected).assertEqual(3);
      expect(metrics.replies).assertEqual(2);
      expect(metrics.successRatio()).assertEqual(0.4);
      expect(metrics.fingerprint()).assertLarger(0);
    });

    /**
     * @tc.name          wantValidationStubDescriptorIndependentOfWant
     * @tc.desc          The stub descriptor is not derived from the Want bundle.
     * @tc.precondition  A service lifecycle model is available.
     * @tc.steps         1. Connect the service.
     *                   2. Compare descriptor and bundle.
     *                   3. Check the descriptor oracle.
     * @tc.expected      The descriptor is IPCStubTest and differs from the bundle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationStubDescriptorIndependentOfWant', 0, () => {
      const want: WantModel = buildServerWant();
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      logStep('wantValidationStubDescriptorIndependentOfWant', stub.descriptor);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.descriptor === want.bundleName).assertFalse();
      expect(stub.descriptor === want.abilityName).assertFalse();
      expect(stub.descriptor.indexOf('.')).assertEqual(-1);
      expect(want.bundleName.indexOf('.')).assertLarger(0);
      expect(stub.descriptor.length).assertEqual(11);
      expect(bundleLooksValid(stub.descriptor)).assertFalse();
    });

    /**
     * @tc.name          wantValidationWantSummaryComposition
     * @tc.desc          A summary line composes bundle, ability and request count.
     * @tc.precondition  The Want model and a client are available.
     * @tc.steps         1. Send two requests.
     *                   2. Compose a summary string.
     *                   3. Inspect its segments.
     * @tc.expected      The summary contains both literals and the count two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationWantSummaryComposition', 0, () => {
      const want: WantModel = buildServerWant();
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      client.sendMany(2, REQUEST_CODE);
      const summary: string = want.bundleName + '#' + want.abilityName + '#' + String(stub.requestCount());
      logStep('wantValidationWantSummaryComposition', summary);
      expect(summary.split('#').length).assertEqual(3);
      expect(summary.split('#')[0]).assertEqual(STUB_BUNDLE);
      expect(summary.split('#')[1]).assertEqual(STUB_ABILITY);
      expect(summary.split('#')[2]).assertEqual('2');
      expect(summary.indexOf('ServiceAbility')).assertLarger(0);
      expect(summary.endsWith('#2')).assertTrue();
      expect(stub.requestCount()).assertEqual(2);
      expect(client.results.length).assertEqual(2);
    });

    /**
     * @tc.name          wantValidationUniqueWantBundlesCount
     * @tc.desc          Unique bundle names reduce a repeated list to two entries.
     * @tc.precondition  The uniqueStrings helper is available.
     * @tc.steps         1. Build a repeated bundle list.
     *                   2. Deduplicate it.
     *                   3. Count occurrences.
     * @tc.expected      Two unique names remain from five entries.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationUniqueWantBundlesCount', 0, () => {
      const bundles: string[] = [STUB_BUNDLE, CLIENT_BUNDLE, STUB_BUNDLE, STUB_BUNDLE, CLIENT_BUNDLE];
      const unique: string[] = uniqueStrings(bundles);
      logStep('wantValidationUniqueWantBundlesCount', joined(unique, ','));
      expect(bundles.length).assertEqual(5);
      expect(unique.length).assertEqual(2);
      expect(unique[0]).assertEqual(STUB_BUNDLE);
      expect(unique[1]).assertEqual(CLIENT_BUNDLE);
      expect(countOf(bundles, STUB_BUNDLE)).assertEqual(3);
      expect(countOf(bundles, CLIENT_BUNDLE)).assertEqual(2);
      expect(countOf(unique, STUB_BUNDLE)).assertEqual(1);
      expect(uniqueStrings([]).length).assertEqual(0);
    });

    /**
     * @tc.name          wantValidationWantDescriptorChain
     * @tc.desc          Descriptor chaining keeps the stable order of Wants.
     * @tc.precondition  The joined helper and Want model are available.
     * @tc.steps         1. Build four Wants.
     *                   2. Chain their descriptors.
     *                   3. Count the separator occurrences.
     * @tc.expected      Three separators produce four chain entries.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationWantDescriptorChain', 0, () => {
      const chain: string[] = [];
      chain.push(new WantModel(STUB_BUNDLE, STUB_ABILITY).describe());
      chain.push(new WantModel(CLIENT_BUNDLE, STUB_ABILITY).describe());
      chain.push(new WantModel('com.example.third', STUB_ABILITY).describe());
      chain.push(new WantModel(STUB_BUNDLE, 'BackupAbility').describe());
      const text: string = joined(chain, ' -> ');
      logStep('wantValidationWantDescriptorChain', text);
      expect(chain.length).assertEqual(4);
      expect(text.split(' -> ').length).assertEqual(4);
      expect(countOf(chain, chain[1])).assertEqual(1);
      expect(text.indexOf(STUB_BUNDLE)).assertEqual(0);
      expect(text.indexOf('BackupAbility')).assertLarger(0);
      expect(text.endsWith(WANT_ACTION_START)).assertTrue();
      expect(uniqueStrings(chain).length).assertEqual(4);
    });

    /**
     * @tc.name          wantValidationWantBoundaryCodeSet
     * @tc.desc          Boundary request codes are all rejected except one.
     * @tc.precondition  The stub and client are available.
     * @tc.steps         1. Send the boundary codes.
     *                   2. Count handled results.
     *                   3. Check metrics.
     * @tc.expected      Exactly one of five boundary codes is handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationWantBoundaryCodeSet', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = replayCodes(stub, [-1, 0, 1, 2, 99]);
      const metrics: StubMetrics = StubMetrics.from(stub);
      logStep('wantValidationWantBoundaryCodeSet', String(metrics.handled));
      expect(client.sentCodes.length).assertEqual(5);
      expect(metrics.handled).assertEqual(1);
      expect(metrics.rejected).assertEqual(4);
      expect(metrics.requests).assertEqual(5);
      expect(client.results[2].handled).assertTrue();
      expect(client.results[0].handled).assertFalse();
      expect(client.results[4].errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(metrics.successRatio()).assertEqual(0.2);
    });

    /**
     * @tc.name          wantValidationWantFullRoundTrip
     * @tc.desc          A full Want round trip preserves every observable field.
     * @tc.precondition  A stub, client and Want model are available.
     * @tc.steps         1. Connect through the server Want.
     *                   2. Send one request.
     *                   3. Compose the final snapshot.
     * @tc.expected      The snapshot reports success, the reply literal and one request.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationWantFullRoundTrip', 0, () => {
      const want: WantModel = buildServerWant();
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const snapshot: string = want.bundleName + '|' + String(result.handled) + '|' + result.replyText;
      logStep('wantValidationWantFullRoundTrip', snapshot);
      expect(want.namesServer()).assertTrue();
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(snapshot.split('|').length).assertEqual(3);
      expect(snapshot.split('|')[1]).assertEqual('true');
      expect(snapshot.split('|')[2]).assertEqual(REPLY_PAYLOAD);
      expect(stub.lastRequest()?.code).assertEqual(REQUEST_CODE);
      expect(stub.lastRequest()?.text).assertEqual(REQUEST_PAYLOAD);
    });

    /**
     * @tc.name          wantValidationWantAbilityAliasRejected
     * @tc.desc          A shortened ability alias is not the documented ability.
     * @tc.precondition  The Want model and ability predicate are available.
     * @tc.steps         1. Build a Want with the alias Service.
     *                   2. Compare it with ServiceAbility.
     *                   3. Confirm the oracle rejects the alias.
     * @tc.expected      Only the full ability name matches the server Want.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationWantAbilityAliasRejected', 0, () => {
      const alias: WantModel = new WantModel(STUB_BUNDLE, 'Service');
      const full: WantModel = buildServerWant();
      const aliasValid: boolean = abilityLooksValid(alias.abilityName);
      const fullValid: boolean = abilityLooksValid(full.abilityName);
      const sameName: boolean = alias.abilityName === full.abilityName;
      logStep('wantValidationWantAbilityAliasRejected', alias.abilityName);
      expect(alias.abilityName).assertEqual('Service');
      expect(alias.abilityName.length).assertEqual(7);
      expect(aliasValid).assertTrue();
      expect(sameName).assertFalse();
      expect(fullValid).assertTrue();
      expect(alias.namesServer()).assertFalse();
      expect(full.namesServer()).assertTrue();
      expect(full.abilityName.indexOf(alias.abilityName)).assertEqual(0);
      expect(full.abilityName.length).assertLarger(alias.abilityName.length);
    });

    /**
     * @tc.name          wantValidationWantBundleSegmentOrder
     * @tc.desc          Bundle segments appear in the documented reverse domain order.
     * @tc.precondition  The documented bundle constant is available.
     * @tc.steps         1. Split the bundle on dots.
     *                   2. Inspect each segment.
     *                   3. Confirm the join restores the literal.
     * @tc.expected      Segments are com, example and ipc_stub in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationWantBundleSegmentOrder', 0, () => {
      const segments: string[] = STUB_BUNDLE.split('.');
      const restored: string = joined(segments, '.');
      const first: string = segments[0];
      const last: string = segments[segments.length - 1];
      logStep('wantValidationWantBundleSegmentOrder', joined(segments, '>'));
      expect(segments.length).assertEqual(3);
      expect(first).assertEqual('com');
      expect(segments[1]).assertEqual('example');
      expect(last).assertEqual('ipc_stub');
      expect(restored).assertEqual(STUB_BUNDLE);
      expect(first.length).assertLess(last.length);
      expect(last.indexOf('_')).assertLarger(0);
      expect(segments[0] + '.' + segments[1]).assertEqual('com.example');
    });

    /**
     * @tc.name          wantValidationWantTrimBehaviour
     * @tc.desc          Trimming a padded bundle yields the canonical literal.
     * @tc.precondition  The Want model accepts arbitrary bundle text.
     * @tc.steps         1. Build a Want with padded bundle text.
     *                   2. Trim the text.
     *                   3. Compare lengths and equality.
     * @tc.expected      The trimmed text equals the canonical bundle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationWantTrimBehaviour', 0, () => {
      const padded: WantModel = new WantModel('  ' + STUB_BUNDLE + '  ', STUB_ABILITY);
      const trimmed: string = padded.bundleName.trim();
      const rawValid: boolean = bundleLooksValid(padded.bundleName);
      const trimmedValid: boolean = bundleLooksValid(trimmed);
      logStep('wantValidationWantTrimBehaviour', padded.bundleName);
      expect(padded.bundleName.length).assertEqual(STUB_BUNDLE.length + 4);
      expect(trimmed.length).assertEqual(STUB_BUNDLE.length);
      expect(trimmed).assertEqual(STUB_BUNDLE);
      expect(trimmedValid).assertTrue();
      expect(rawValid).assertFalse();
      expect(padded.bundleName.startsWith('  ')).assertTrue();
      expect(padded.bundleName.endsWith('  ')).assertTrue();
      expect(padded.namesServer()).assertFalse();
      expect(trimmed === STUB_BUNDLE).assertTrue();
    });

    /**
     * @tc.name          wantValidationWantEqualityMatrix
     * @tc.desc          A matrix of Want comparisons matches expectation.
     * @tc.precondition  Two server Wants and one client Want are available.
     * @tc.steps         1. Compare server with server.
     *                   2. Compare server with client.
     *                   3. Compare client with client.
     * @tc.expected      Only like-for-like comparisons report equality.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationWantEqualityMatrix', 0, () => {
      const serverA: WantModel = buildServerWant();
      const serverB: WantModel = buildServerWant();
      const client: WantModel = buildClientWant();
      const serverServer: boolean = serverA.bundleName === serverB.bundleName;
      const serverClient: boolean = serverA.bundleName === client.bundleName;
      const clientClient: boolean = client.bundleName === client.bundleName;
      logStep('wantValidationWantEqualityMatrix', serverA.describe());
      expect(serverServer).assertTrue();
      expect(serverClient).assertFalse();
      expect(clientClient).assertTrue();
      expect(serverA.describe()).assertEqual(serverB.describe());
      expect(serverA.describe() === client.describe()).assertFalse();
      expect(countOf([serverA.bundleName, serverB.bundleName], STUB_BUNDLE)).assertEqual(2);
      expect(uniqueStrings([serverA.bundleName, serverB.bundleName]).length).assertEqual(1);
      expect(serverA.abilityName).assertEqual(client.abilityName);
    });

    /**
     * @tc.name          wantValidationWantListIndexLookup
     * @tc.desc          Every Want list index resolves to the expected bundle.
     * @tc.precondition  The bundle list constant array is available.
     * @tc.steps         1. Build an ordered bundle list.
     *                   2. Look up allowed indices.
     *                   3. Confirm out of range lookups yield undefined.
     * @tc.expected      Indices zero and one resolve and index two is undefined.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationWantListIndexLookup', 0, () => {
      const bundles: string[] = [STUB_BUNDLE, CLIENT_BUNDLE];
      const atZero: string = bundles[0];
      const atOne: string = bundles[1];
      const outOfRange: string | undefined = bundles[2];
      const lastIndex: number = bundles.length - 1;
      logStep('wantValidationWantListIndexLookup', String(lastIndex));
      expect(atZero).assertEqual(STUB_BUNDLE);
      expect(atOne).assertEqual(CLIENT_BUNDLE);
      expect(outOfRange).assertUndefined();
      expect(lastIndex).assertEqual(1);
      expect(bundles[lastIndex]).assertEqual(CLIENT_BUNDLE);
      expect(bundles.indexOf(STUB_BUNDLE)).assertEqual(0);
      expect(bundles.indexOf(CLIENT_BUNDLE)).assertEqual(1);
      expect(bundles.indexOf('missing')).assertEqual(-1);
    });

    /**
     * @tc.name          wantValidationWantMutationIsolation
     * @tc.desc          Mutating one Want does not affect an independent Want.
     * @tc.precondition  Two independently constructed Wants are available.
     * @tc.steps         1. Build two Wants.
     *                   2. Mutate the first bundle and ability.
     *                   3. Compare with the untouched second Want.
     * @tc.expected      The second Want retains the canonical literals.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationWantMutationIsolation', 0, () => {
      const first: WantModel = buildServerWant();
      const second: WantModel = buildServerWant();
      first.bundleName = 'com.example.mutated';
      first.abilityName = 'MutatedAbility';
      logStep('wantValidationWantMutationIsolation', first.describe());
      expect(first.bundleName).assertEqual('com.example.mutated');
      expect(first.abilityName).assertEqual('MutatedAbility');
      expect(second.bundleName).assertEqual(STUB_BUNDLE);
      expect(second.abilityName).assertEqual(STUB_ABILITY);
      expect(second.namesServer()).assertTrue();
      expect(first.namesServer()).assertFalse();
      expect(second.describe() === first.describe()).assertFalse();
      expect(countOf([first.bundleName, second.bundleName], STUB_BUNDLE)).assertEqual(1);
    });

    /**
     * @tc.name          wantValidationWantTextReplacement
     * @tc.desc          Replacing a bundle segment produces a different Want target.
     * @tc.precondition  The Want model and string operations are available.
     * @tc.steps         1. Replace example with sample.
     *                   2. Build a Want from the replaced text.
     *                   3. Compare both forms.
     * @tc.expected      The replacement differs and no longer matches the server bundle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationWantTextReplacement', 0, () => {
      const replaced: string = STUB_BUNDLE.replace('example', 'sample');
      const want: WantModel = new WantModel(replaced, STUB_ABILITY);
      const original: WantModel = buildServerWant();
      const containsOld: boolean = replaced.indexOf('example') >= 0;
      logStep('wantValidationWantTextReplacement', replaced);
      expect(replaced).assertEqual('com.sample.ipc_stub');
      expect(replaced === STUB_BUNDLE).assertFalse();
      expect(containsOld).assertFalse();
      expect(want.bundleName.indexOf('sample')).assertLarger(0);
      expect(want.namesServer()).assertFalse();
      expect(original.namesServer()).assertTrue();
      expect(bundleLooksValid(replaced)).assertTrue();
      expect(replaced.split('.').length).assertEqual(3);
    });

    /**
     * @tc.name          wantValidationWantLengthBoundaries
     * @tc.desc          Length based checks separate short and canonical Wants.
     * @tc.precondition  The bundle literals are available.
     * @tc.steps         1. Compare bundle lengths.
     *                   2. Clamp a computed length.
     *                   3. Confirm boundary results.
     * @tc.expected      Clamping keeps lengths inside the documented range.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationWantLengthBoundaries', 0, () => {
      const canonical: number = STUB_BUNDLE.length;
      const shortName: string = 'com.a';
      const clampedLow: number = clampInt(shortName.length, canonical, canonical + 20);
      const clampedHigh: number = clampInt(STUB_BUNDLE.length + 40, canonical, canonical + 20);
      logStep('wantValidationWantLengthBoundaries', String(canonical));
      expect(canonical).assertEqual(20);
      expect(shortName.length).assertLess(canonical);
      expect(clampedLow).assertEqual(canonical);
      expect(clampedHigh).assertEqual(canonical + 20);
      expect(clampInt(canonical, canonical, canonical + 20)).assertEqual(canonical);
      expect(bundleLooksValid(shortName)).assertTrue();
      expect(shortName.split('.').length).assertEqual(2);
      expect(shortName.length).assertLess(STUB_ABILITY.length + canonical);
    });

    /**
     * @tc.name          wantValidationWantFinalLedger
     * @tc.desc          A final ledger aggregates Wants, requests and replies.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send two successful and one failing request.
     *                   2. Compose the ledger.
     *                   3. Check each ledger field.
     * @tc.expected      The ledger reports two replies, one rejection and three requests.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationWantFinalLedger', 0, () => {
      const server: WantModel = buildServerWant();
      const client: WantModel = buildClientWant();
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const driver: InProcessClient = new InProcessClient(stub);
      driver.send(REQUEST_CODE, REQUEST_PAYLOAD);
      driver.send(REQUEST_CODE, REQUEST_PAYLOAD);
      driver.send(2, REQUEST_PAYLOAD);
      const metrics: StubMetrics = StubMetrics.from(stub);
      const ledger: string = server.bundleName + ',' + client.bundleName + ',' +
        String(metrics.requests) + ',' + String(metrics.handled) + ',' + String(metrics.replies);
      logStep('wantValidationWantFinalLedger', ledger);
      expect(stub.requestCount()).assertEqual(3);
      expect(metrics.requests).assertEqual(3);
      expect(metrics.handled).assertEqual(2);
      expect(metrics.rejected).assertEqual(1);
      expect(driver.replies.length).assertEqual(2);
      expect(ledger.split(',').length).assertEqual(5);
      expect(ledger.indexOf(STUB_BUNDLE)).assertEqual(0);
      expect(ledger.indexOf(CLIENT_BUNDLE)).assertLarger(0);
    });

    /**
     * @tc.name          wantValidationWantRequestCodeLookup
     * @tc.desc          A code lookup table resolves only the documented request code.
     * @tc.precondition  The request constants are available.
     * @tc.steps         1. Build a code table.
     *                   2. Query four codes.
     *                   3. Compare the answers.
     * @tc.expected      Only code one maps to the handled path.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationWantRequestCodeLookup', 0, () => {
      const codes: number[] = [REQUEST_CODE, 0, 2, 99];
      const labels: string[] = ['handled', 'unknown', 'unknown', 'unknown'];
      const firstLabel: string = isKnownRequestCode(codes[0]) ? 'handled' : 'unknown';
      const secondLabel: string = isKnownRequestCode(codes[1]) ? 'handled' : 'unknown';
      const lastLabel: string = isKnownRequestCode(codes[3]) ? 'handled' : 'unknown';
      logStep('wantValidationWantRequestCodeLookup', firstLabel + '/' + lastLabel);
      expect(codes.length).assertEqual(4);
      expect(labels.length).assertEqual(codes.length);
      expect(firstLabel).assertEqual('handled');
      expect(secondLabel).assertEqual('unknown');
      expect(lastLabel).assertEqual('unknown');
      expect(countOf(labels, 'unknown')).assertEqual(3);
      expect(countOf(labels, 'handled')).assertEqual(1);
      expect(codes.indexOf(REQUEST_CODE)).assertEqual(0);
      expect(codes.indexOf(2)).assertEqual(2);
    });

    /**
     * @tc.name          wantValidationWantBundleAliasMatrix
     * @tc.desc          A matrix of bundle aliases compares against the server literal.
     * @tc.precondition  The server Want builder is available.
     * @tc.steps         1. List four bundle aliases.
     *                   2. Compare each with the server bundle.
     *                   3. Count the matches.
     * @tc.expected      Exactly one alias matches the server bundle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationWantBundleAliasMatrix', 0, () => {
      const aliases: string[] = [STUB_BUNDLE, 'com.example.ipc-stub', 'com.example.ipcstub', 'com.example.ipc_stub.module'];
      const matches: number = countOf(aliases, STUB_BUNDLE);
      const firstValid: boolean = bundleLooksValid(aliases[0]);
      const secondValid: boolean = bundleLooksValid(aliases[1]);
      const thirdValid: boolean = bundleLooksValid(aliases[2]);
      const fourthValid: boolean = bundleLooksValid(aliases[3]);
      logStep('wantValidationWantBundleAliasMatrix', String(matches));
      expect(aliases.length).assertEqual(4);
      expect(matches).assertEqual(1);
      expect(firstValid).assertTrue();
      expect(secondValid).assertFalse();
      expect(thirdValid).assertTrue();
      expect(fourthValid).assertTrue();
      expect(aliases[0]).assertEqual(STUB_BUNDLE);
      expect(uniqueStrings(aliases).length).assertEqual(4);
      expect(aliases[2] === STUB_BUNDLE).assertFalse();
    });
  });
}
