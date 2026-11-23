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
 * IpcSecurity: bundle/ability allowlist behaviour for the IPC client.
 *
 * The production page builds a Want with the literal bundle
 * 'com.example.ipc_stub' and the literal ability 'ServiceAbility'. This suite
 * pins those literals behind an independent allowlist oracle so a mistaken
 * rename or a spoofed suffix is visible immediately.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TARGET_BUNDLE,
  TARGET_ABILITY,
  CLIENT_BUNDLE,
  STUB_DESCRIPTOR,
  WantModel,
  RemoteStubModel,
  RemoteProxyModel,
  ConnectionModel,
  createConnectedSession,
  uniqueStrings,
  joined,
  countOf,
  textFingerprint,
  INITIAL_CONNECT_ID,
  STATE_CONNECTING,
  STATE_CONNECTED,
  ERROR_NONE
} from '../Shared/SharedDriver';

const ALLOWED_BUNDLE_LITERAL: string = 'com.example.ipc_stub';
const ALLOWED_ABILITY_LITERAL: string = 'ServiceAbility';

function bundleAllowed(value: string): boolean {
  return value === ALLOWED_BUNDLE_LITERAL;
}

function abilityAllowed(value: string): boolean {
  return value === ALLOWED_ABILITY_LITERAL;
}

function looksLikeBundle(value: string): boolean {
  if (value.length === 0 || value.indexOf(' ') >= 0) {
    return false;
  }
  const parts: string[] = value.split('.');
  if (parts.length < 2) {
    return false;
  }
  for (let index = 0; index < parts.length; index++) {
    if (parts[index].length === 0) {
      return false;
    }
  }
  return true;
}

function verdict(want: WantModel): string {
  if (!bundleAllowed(want.bundleName)) {
    return 'bundle-denied';
  }
  if (!abilityAllowed(want.abilityName)) {
    return 'ability-denied';
  }
  if (want.validate().length > 0) {
    return 'malformed';
  }
  return 'allow';
}

function fingerprintOf(values: string[]): number {
  return textFingerprint(joined(values, '|'));
}

export default function ipcSecurity(): void {
  describe('IpcSecurity', () => {
    beforeAll(() => {
      logSuite('IpcSecurity', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('IpcSecurity', 'end');
    });

    /**
     * @tc.name          ipcSecurityTargetBundleMatchesAllowlist
     * @tc.desc          The production bundle literal is on the allowlist.
     * @tc.precondition  Shared driver constants are loaded.
     * @tc.steps         1. Read TARGET_BUNDLE. 2. Compare it to the literal.
     *                   3. Evaluate the allowlist oracle.
     * @tc.expected      The bundle equals com.example.ipc_stub and is allowed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('ipcSecurityTargetBundleMatchesAllowlist', 0, () => {
      logStep('ipcSecurity', 'target bundle');
      const want = new WantModel();
      expect(TARGET_BUNDLE).assertEqual(ALLOWED_BUNDLE_LITERAL);
      expect(want.bundleName).assertEqual(TARGET_BUNDLE);
      expect(bundleAllowed(want.bundleName)).assertTrue();
      expect(looksLikeBundle(want.bundleName)).assertTrue();
      expect(want.bundleName.indexOf(' ')).assertEqual(-1);
      expect(want.bundleName.length > 0).assertTrue();
      expect(textFingerprint(want.bundleName)).assertEqual(textFingerprint(ALLOWED_BUNDLE_LITERAL));
    });

    /**
     * @tc.name          ipcSecurityTargetAbilityMatchesAllowlist
     * @tc.desc          The production ability literal is on the allowlist.
     * @tc.precondition  Shared driver constants are loaded.
     * @tc.steps         1. Read TARGET_ABILITY. 2. Compare it to the literal.
     *                   3. Evaluate the ability oracle.
     * @tc.expected      The ability equals ServiceAbility and is allowed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('ipcSecurityTargetAbilityMatchesAllowlist', 0, () => {
      logStep('ipcSecurity', 'target ability');
      const want = new WantModel();
      expect(TARGET_ABILITY).assertEqual(ALLOWED_ABILITY_LITERAL);
      expect(want.abilityName).assertEqual(TARGET_ABILITY);
      expect(abilityAllowed(want.abilityName)).assertTrue();
      expect(want.abilityName.indexOf(' ')).assertEqual(-1);
      expect(want.abilityName.endsWith('Ability')).assertTrue();
      expect(want.abilityName.length).assertEqual(14);
      expect(textFingerprint(want.abilityName)).assertEqual(textFingerprint(ALLOWED_ABILITY_LITERAL));
    });

    /**
     * @tc.name          ipcSecurityClientBundleIsDenied
     * @tc.desc          The client's own bundle is not a connectable target.
     * @tc.precondition  CLIENT_BUNDLE is exported by the driver.
     * @tc.steps         1. Read CLIENT_BUNDLE. 2. Evaluate the allowlist.
     *                   3. Build a Want aimed at the client bundle.
     * @tc.expected      The client bundle is rejected by the allowlist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('ipcSecurityClientBundleIsDenied', 0, () => {
      logStep('ipcSecurity', 'client bundle');
      const spoof = new WantModel(CLIENT_BUNDLE, TARGET_ABILITY);
      expect(CLIENT_BUNDLE).assertEqual('com.example.ipc_client');
      expect(bundleAllowed(CLIENT_BUNDLE)).assertFalse();
      expect(looksLikeBundle(CLIENT_BUNDLE)).assertTrue();
      expect(verdict(spoof)).assertEqual('bundle-denied');
      expect(spoof.matches(new WantModel())).assertFalse();
      expect(spoof.validate().length).assertEqual(0);
    });

    /**
     * @tc.name          ipcSecurityEmptyBundleIsDenied
     * @tc.desc          An empty bundle name can never pass the allowlist.
     * @tc.precondition  WantModel accepts an empty bundle for validation.
     * @tc.steps         1. Build a Want with an empty bundle. 2. Validate it.
     *                   3. Evaluate the allowlist verdict.
     * @tc.expected      The want is malformed and the bundle is denied.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('ipcSecurityEmptyBundleIsDenied', 0, () => {
      logStep('ipcSecurity', 'empty bundle');
      const want = new WantModel('', TARGET_ABILITY);
      const errors = want.validate();
      expect(want.bundleName.length).assertEqual(0);
      expect(bundleAllowed(want.bundleName)).assertFalse();
      expect(looksLikeBundle(want.bundleName)).assertFalse();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('bundle-empty');
      expect(verdict(want)).assertEqual('bundle-denied');
    });

    /**
     * @tc.name          ipcSecurityEmptyAbilityIsDenied
     * @tc.desc          An empty ability name can never pass the allowlist.
     * @tc.precondition  WantModel accepts an empty ability for validation.
     * @tc.steps         1. Build a Want with an empty ability. 2. Validate it.
     *                   3. Evaluate the allowlist verdict.
     * @tc.expected      The want is malformed and the ability is denied.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('ipcSecurityEmptyAbilityIsDenied', 0, () => {
      logStep('ipcSecurity', 'empty ability');
      const want = new WantModel(TARGET_BUNDLE, '');
      const errors = want.validate();
      expect(want.abilityName.length).assertEqual(0);
      expect(abilityAllowed(want.abilityName)).assertFalse();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('ability-empty');
      expect(verdict(want)).assertEqual('ability-denied');
      expect(want.matches(new WantModel())).assertFalse();
    });

    /**
     * @tc.name          ipcSecuritySpaceInBundleIsMalformed
     * @tc.desc          A bundle with an embedded space fails validation.
     * @tc.precondition  The want validator checks for spaces.
     * @tc.steps         1. Build a spaced bundle want. 2. Validate it.
     *                   3. Evaluate the allowlist verdict.
     * @tc.expected      The error bundle-has-space is reported and denied.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('ipcSecuritySpaceInBundleIsMalformed', 0, () => {
      logStep('ipcSecurity', 'space in bundle');
      const want = new WantModel('com.example ipc_stub', TARGET_ABILITY);
      const errors = want.validate();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('bundle-has-space');
      expect(want.bundleName.indexOf(' ')).assertEqual(11);
      expect(looksLikeBundle(want.bundleName)).assertFalse();
      expect(verdict(want)).assertEqual('bundle-denied');
      expect(want.matches(new WantModel())).assertFalse();
    });

    /**
     * @tc.name          ipcSecuritySuffixSpoofedBundleIsDenied
     * @tc.desc          Appending a segment to the target bundle is denied.
     * @tc.precondition  The allowlist oracle uses exact equality.
     * @tc.steps         1. Build a bundle with an extra .evil segment.
     *                   2. Check its shape. 3. Evaluate the verdict.
     * @tc.expected      The spoof is well formed but not allowlisted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('ipcSecuritySuffixSpoofedBundleIsDenied', 0, () => {
      logStep('ipcSecurity', 'suffix spoof');
      const spoof = TARGET_BUNDLE + '.evil';
      const want = new WantModel(spoof, TARGET_ABILITY);
      expect(spoof).assertEqual('com.example.ipc_stub.evil');
      expect(looksLikeBundle(spoof)).assertTrue();
      expect(bundleAllowed(spoof)).assertFalse();
      expect(verdict(want)).assertEqual('bundle-denied');
      expect(want.validate().length).assertEqual(0);
      expect(spoof.split('.').length).assertEqual(4);
    });

    /**
     * @tc.name          ipcSecurityPrefixSpoofedBundleIsDenied
     * @tc.desc          A prefixed bundle name is not the allowlisted target.
     * @tc.precondition  The allowlist oracle uses exact equality.
     * @tc.steps         1. Build a bundle with an x- prefix. 2. Check shape.
     *                   3. Evaluate the verdict.
     * @tc.expected      The prefixed name is denied even though it is shaped well.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('ipcSecurityPrefixSpoofedBundleIsDenied', 0, () => {
      logStep('ipcSecurity', 'prefix spoof');
      const spoof = 'x' + TARGET_BUNDLE;
      const want = new WantModel(spoof, TARGET_ABILITY);
      expect(looksLikeBundle(spoof)).assertTrue();
      expect(bundleAllowed(spoof)).assertFalse();
      expect(verdict(want)).assertEqual('bundle-denied');
      expect(want.validate().length).assertEqual(0);
      expect(spoof.length).assertEqual(TARGET_BUNDLE.length + 1);
      expect(want.matches(new WantModel())).assertFalse();
    });

    /**
     * @tc.name          ipcSecurityCaseVariantBundleIsDenied
     * @tc.desc          The bundle allowlist is case sensitive.
     * @tc.precondition  The allowlist oracle compares exact strings.
     * @tc.steps         1. Upper case the target bundle. 2. Compare fingerprints.
     *                   3. Evaluate the verdict.
     * @tc.expected      The upper case variant is denied.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('ipcSecurityCaseVariantBundleIsDenied', 0, () => {
      logStep('ipcSecurity', 'case variant bundle');
      const upper = TARGET_BUNDLE.toUpperCase();
      const want = new WantModel(upper, TARGET_ABILITY);
      expect(bundleAllowed(upper)).assertFalse();
      expect(upper === TARGET_BUNDLE).assertFalse();
      expect(upper.length).assertEqual(TARGET_BUNDLE.length);
      expect(textFingerprint(upper) === textFingerprint(TARGET_BUNDLE)).assertFalse();
      expect(verdict(want)).assertEqual('bundle-denied');
      expect(looksLikeBundle(upper)).assertTrue();
    });

    /**
     * @tc.name          ipcSecurityAbilitySuffixSpoofIsDenied
     * @tc.desc          ServiceAbility2 is not the allowlisted ability.
     * @tc.precondition  The ability oracle compares exact strings.
     * @tc.steps         1. Append a digit to the ability. 2. Evaluate it.
     *                   3. Evaluate the verdict.
     * @tc.expected      The suffixed ability is denied.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('ipcSecurityAbilitySuffixSpoofIsDenied', 0, () => {
      logStep('ipcSecurity', 'ability suffix spoof');
      const spoof = TARGET_ABILITY + '2';
      const want = new WantModel(TARGET_BUNDLE, spoof);
      expect(spoof).assertEqual('ServiceAbility2');
      expect(abilityAllowed(spoof)).assertFalse();
      expect(verdict(want)).assertEqual('ability-denied');
      expect(want.validate().length).assertEqual(0);
      expect(spoof.startsWith(TARGET_ABILITY)).assertTrue();
      expect(spoof.length).assertEqual(TARGET_ABILITY.length + 1);
    });

    /**
     * @tc.name          ipcSecurityAbilityCaseVariantIsDenied
     * @tc.desc          A lower camel ability name is not allowlisted.
     * @tc.precondition  The ability oracle is case sensitive.
     * @tc.steps         1. Lower the first character. 2. Compare to the oracle.
     *                   3. Evaluate the verdict.
     * @tc.expected      The lower camel variant is denied.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('ipcSecurityAbilityCaseVariantIsDenied', 0, () => {
      logStep('ipcSecurity', 'ability case variant');
      const lower = 'serviceAbility';
      const want = new WantModel(TARGET_BUNDLE, lower);
      expect(abilityAllowed(lower)).assertFalse();
      expect(lower.length).assertEqual(TARGET_ABILITY.length);
      expect(lower.endsWith('Ability')).assertTrue();
      expect(verdict(want)).assertEqual('ability-denied');
      expect(lower === TARGET_ABILITY).assertFalse();
      expect(want.matches(new WantModel())).assertFalse();
    });

    /**
     * @tc.name          ipcSecurityTargetWantIsValid
     * @tc.desc          The production want validates with zero errors.
     * @tc.precondition  A default WantModel is available.
     * @tc.steps         1. Validate the default want. 2. Check each field.
     *                   3. Compare its description.
     * @tc.expected      No errors and the description is bundle/ability.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('ipcSecurityTargetWantIsValid', 0, () => {
      logStep('ipcSecurity', 'target want valid');
      const want = new WantModel();
      expect(want.validate().length).assertEqual(0);
      expect(want.describe()).assertEqual('com.example.ipc_stub/ServiceAbility');
      expect(want.describe()).assertEqual(TARGET_BUNDLE + '/' + TARGET_ABILITY);
      expect(verdict(want)).assertEqual('allow');
      expect(want.bundleName.indexOf(' ')).assertEqual(-1);
      expect(want.abilityName.indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.name          ipcSecurityMissingDotIsNotABundle
     * @tc.desc          A dotless identifier fails the bundle shape check.
     * @tc.precondition  The shape oracle requires at least two segments.
     * @tc.steps         1. Replace dots with underscores. 2. Check the shape.
     *                   3. Evaluate the verdict.
     * @tc.expected      The underscore form is denied while the target passes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('ipcSecurityMissingDotIsNotABundle', 0, () => {
      logStep('ipcSecurity', 'missing dot');
      const flat = 'com_example_ipc_stub';
      const want = new WantModel(flat, TARGET_ABILITY);
      expect(flat.indexOf('.')).assertEqual(-1);
      expect(looksLikeBundle(flat)).assertFalse();
      expect(looksLikeBundle(TARGET_BUNDLE)).assertTrue();
      expect(verdict(want)).assertEqual('bundle-denied');
      expect(want.validate().length).assertEqual(0);
      expect(flat.split('.').length).assertEqual(1);
    });

    /**
     * @tc.name          ipcSecurityEmptySegmentIsNotABundle
     * @tc.desc          A trailing or doubled dot leaves an empty segment.
     * @tc.precondition  The shape oracle rejects empty segments.
     * @tc.steps         1. Check a trailing dot. 2. Check a doubled dot.
     *                   3. Confirm the target still passes.
     * @tc.expected      Both malformed forms fail while the target passes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('ipcSecurityEmptySegmentIsNotABundle', 0, () => {
      logStep('ipcSecurity', 'empty segment');
      const trailing = 'com.example.';
      const doubled = 'com..example';
      expect(looksLikeBundle(trailing)).assertFalse();
      expect(looksLikeBundle(doubled)).assertFalse();
      expect(trailing.split('.').length).assertEqual(3);
      expect(doubled.split('.').length).assertEqual(3);
      expect(verdict(new WantModel(trailing, TARGET_ABILITY))).assertEqual('bundle-denied');
      expect(verdict(new WantModel(doubled, TARGET_ABILITY))).assertEqual('bundle-denied');
      expect(looksLikeBundle(TARGET_BUNDLE)).assertTrue();
    });

    /**
     * @tc.name          ipcSecurityCandidateSweepAllowsOnlyTarget
     * @tc.desc          A sweep of lookalike bundles yields exactly one allow.
     * @tc.precondition  The allowlist oracle is exact and case sensitive.
     * @tc.steps         1. Build eight candidate bundles. 2. Evaluate each.
     *                   3. Count the allows.
     * @tc.expected      Only the production target is allowed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('ipcSecurityCandidateSweepAllowsOnlyTarget', 0, () => {
      logStep('ipcSecurity', 'candidate sweep');
      const candidates: string[] = [
        TARGET_BUNDLE,
        TARGET_BUNDLE.toUpperCase(),
        TARGET_BUNDLE + '.evil',
        'x' + TARGET_BUNDLE,
        TARGET_BUNDLE.substring(0, TARGET_BUNDLE.length - 1),
        CLIENT_BUNDLE,
        'com.example.other',
        'com.example.ipc_stub '
      ];
      const allows: string[] = [];
      const denies: string[] = [];
      for (let index = 0; index < candidates.length; index++) {
        if (bundleAllowed(candidates[index])) {
          allows.push(candidates[index]);
        } else {
          denies.push(candidates[index]);
        }
      }
      expect(candidates.length).assertEqual(8);
      expect(allows.length).assertEqual(1);
      expect(denies.length).assertEqual(7);
      expect(allows[0]).assertEqual(TARGET_BUNDLE);
      expect(verdict(new WantModel(candidates[7], TARGET_ABILITY))).assertEqual('bundle-denied');
      expect(candidates[7].endsWith(' ')).assertTrue();
    });

    /**
     * @tc.name          ipcSecurityMatchesIsReflexive
     * @tc.desc          Want matching against an identical want is true.
     * @tc.precondition  Two identical default wants are available.
     * @tc.steps         1. Match a want to itself. 2. Match two defaults.
     *                   3. Compare descriptions.
     * @tc.expected      Both comparisons are true and descriptions agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('ipcSecurityMatchesIsReflexive', 0, () => {
      logStep('ipcSecurity', 'matches reflexive');
      const left = new WantModel();
      const right = new WantModel(TARGET_BUNDLE, TARGET_ABILITY);
      expect(left.matches(left)).assertTrue();
      expect(left.matches(right)).assertTrue();
      expect(right.matches(left)).assertTrue();
      expect(left.describe()).assertEqual(right.describe());
      expect(textFingerprint(left.describe())).assertEqual(textFingerprint(right.describe()));
      expect(left.validate().length).assertEqual(right.validate().length);
    });

    /**
     * @tc.name          ipcSecurityMatchesRejectsOneFieldDifference
     * @tc.desc          Changing either bundle or ability breaks the match.
     * @tc.precondition  The target want and two mutants are available.
     * @tc.steps         1. Mutate the bundle. 2. Mutate the ability.
     *                   3. Match both against the target.
     * @tc.expected      Each single field mutation is rejected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('ipcSecurityMatchesRejectsOneFieldDifference', 0, () => {
      logStep('ipcSecurity', 'matches mutant');
      const target = new WantModel();
      const bundleMutant = new WantModel(CLIENT_BUNDLE, TARGET_ABILITY);
      const abilityMutant = new WantModel(TARGET_BUNDLE, TARGET_ABILITY + '2');
      expect(target.matches(bundleMutant)).assertFalse();
      expect(target.matches(abilityMutant)).assertFalse();
      expect(bundleMutant.matches(abilityMutant)).assertFalse();
      expect(bundleMutant.bundleName === target.bundleName).assertFalse();
      expect(abilityMutant.abilityName === target.abilityName).assertFalse();
      expect(target.matches(target)).assertTrue();
    });

    /**
     * @tc.name          ipcSecurityBothEmptyErrorsAreOrdered
     * @tc.desc          Validating an empty want yields bundle then ability errors.
     * @tc.precondition  WantModel accepts empty strings for validation.
     * @tc.steps         1. Build an empty want. 2. Read the error list.
     *                   3. Compare positions and count.
     * @tc.expected      The list is [bundle-empty, ability-empty].
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('ipcSecurityBothEmptyErrorsAreOrdered', 0, () => {
      logStep('ipcSecurity', 'both empty errors');
      const errors = new WantModel('', '').validate();
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('bundle-empty');
      expect(errors[1]).assertEqual('ability-empty');
      expect(joined(errors, '>')).assertEqual('bundle-empty>ability-empty');
      expect(countOf(errors, 'bundle-empty')).assertEqual(1);
      expect(uniqueStrings(errors).length).assertEqual(2);
    });

    /**
     * @tc.name          ipcSecurityAllFourErrorsAreOrdered
     * @tc.desc          Space only and empty only errors keep a fixed order.
     * @tc.precondition  The validator checks empty fields before spaces.
     * @tc.steps         1. Validate single space names. 2. Validate one of each.
     *                   3. Compare both lists.
     * @tc.expected      Space names yield two space errors in field order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('ipcSecurityAllFourErrorsAreOrdered', 0, () => {
      logStep('ipcSecurity', 'error ordering');
      const spaced = new WantModel(' ', ' ').validate();
      const mixed = new WantModel('', 'Service Ability').validate();
      expect(spaced.length).assertEqual(2);
      expect(spaced[0]).assertEqual('bundle-has-space');
      expect(spaced[1]).assertEqual('ability-has-space');
      expect(mixed.length).assertEqual(2);
      expect(mixed[0]).assertEqual('bundle-empty');
      expect(mixed[1]).assertEqual('ability-has-space');
      expect(joined(spaced, '+')).assertEqual('bundle-has-space+ability-has-space');
    });

    /**
     * @tc.name          ipcSecuritySpaceInAbilityIsMalformed
     * @tc.desc          A spaced ability fails validation and is denied.
     * @tc.precondition  The ability oracle is exact and the validator checks spaces.
     * @tc.steps         1. Build a spaced ability want. 2. Validate it.
     *                   3. Evaluate the verdict.
     * @tc.expected      ability-has-space is reported and the ability is denied.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('ipcSecuritySpaceInAbilityIsMalformed', 0, () => {
      logStep('ipcSecurity', 'space in ability');
      const want = new WantModel(TARGET_BUNDLE, 'Service Ability');
      const errors = want.validate();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('ability-has-space');
      expect(want.abilityName.indexOf(' ')).assertEqual(7);
      expect(abilityAllowed(want.abilityName)).assertFalse();
      expect(verdict(want)).assertEqual('ability-denied');
      expect(want.matches(new WantModel())).assertFalse();
    });

    /**
     * @tc.name          ipcSecurityAllowlistLiteralCardinality
     * @tc.desc          Exactly one candidate in a fixed set passes the allowlist.
     * @tc.precondition  The allowlist literal is a single string.
     * @tc.steps         1. Build a candidate set containing duplicates. 2. Filter
     *                   by the oracle. 3. De-duplicate the survivors.
     * @tc.expected      Only one survivor remains after de-duplication.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('ipcSecurityAllowlistLiteralCardinality', 0, () => {
      logStep('ipcSecurity', 'allowlist cardinality');
      const candidates: string[] = [TARGET_BUNDLE, TARGET_BUNDLE, CLIENT_BUNDLE, TARGET_BUNDLE];
      const survivors: string[] = [];
      for (let index = 0; index < candidates.length; index++) {
        if (bundleAllowed(candidates[index])) {
          survivors.push(candidates[index]);
        }
      }
      expect(candidates.length).assertEqual(4);
      expect(survivors.length).assertEqual(3);
      expect(uniqueStrings(survivors).length).assertEqual(1);
      expect(uniqueStrings(survivors)[0]).assertEqual(ALLOWED_BUNDLE_LITERAL);
      expect(countOf(candidates, CLIENT_BUNDLE)).assertEqual(1);
      expect(countOf(survivors, TARGET_BUNDLE)).assertEqual(3);
    });

    /**
     * @tc.name          ipcSecurityConnectionUsesTargetWant
     * @tc.desc          A started connection carries the production want.
     * @tc.precondition  A fresh client is available.
     * @tc.steps         1. Connect with id nine. 2. Inspect the want and state.
     *                   3. Compare the description.
     * @tc.expected      The want is bundle/ability and the state is connecting.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('ipcSecurityConnectionUsesTargetWant', 0, () => {
      logStep('ipcSecurity', 'connection want');
      const client = new ConnectionModel();
      expect(client.connect(9)).assertTrue();
      expect(client.want.bundleName).assertEqual(TARGET_BUNDLE);
      expect(client.want.abilityName).assertEqual(TARGET_ABILITY);
      expect(client.want.describe()).assertEqual('com.example.ipc_stub/ServiceAbility');
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectId).assertEqual(9);
      expect(client.events.last()).assertEqual('connect:com.example.ipc_stub/ServiceAbility');
      expect(verdict(client.want)).assertEqual('allow');
    });

    /**
     * @tc.name          ipcSecurityOnConnectRecordsDescriptor
     * @tc.desc          A completed connection records the proxy descriptor.
     * @tc.precondition  A client has started a connect and owns a proxy.
     * @tc.steps         1. Connect. 2. Deliver onConnect. 3. Inspect events and
     *                   the success toast.
     * @tc.expected      The descriptor appears in two events and state is connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('ipcSecurityOnConnectRecordsDescriptor', 0, () => {
      logStep('ipcSecurity', 'onConnect records descriptor');
      const client = new ConnectionModel();
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      client.connect(9);
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.events.last()).assertEqual('connected:' + STUB_DESCRIPTOR);
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.lastToast()).assertEqual('connectAbility success');
      expect(client.proxy?.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(proxy.isAlive()).assertTrue();
    });

    /**
     * @tc.name          ipcSecurityTargetWantFingerprintIsStable
     * @tc.desc          Two independently built target wants share a fingerprint.
     * @tc.precondition  WantModel is deterministic.
     * @tc.steps         1. Build two wants. 2. Fingerprint their descriptions.
     *                   3. Recompute after a field read.
     * @tc.expected      The fingerprints match and are unchanged by reads.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('ipcSecurityTargetWantFingerprintIsStable', 0, () => {
      logStep('ipcSecurity', 'want fingerprint');
      const first = new WantModel();
      const second = new WantModel(TARGET_BUNDLE, TARGET_ABILITY);
      const baseline = textFingerprint(first.describe());
      expect(baseline).assertEqual(textFingerprint(second.describe()));
      expect(first.bundleName).assertEqual(second.bundleName);
      expect(first.abilityName).assertEqual(second.abilityName);
      expect(textFingerprint(first.describe())).assertEqual(baseline);
      expect(textFingerprint(second.describe())).assertEqual(baseline);
      expect(baseline > 0).assertTrue();
    });

    /**
     * @tc.name          ipcSecurityBundleHasThreeSegments
     * @tc.desc          The target bundle is a three segment dotted name.
     * @tc.precondition  TARGET_BUNDLE is exported by the driver.
     * @tc.steps         1. Split the bundle. 2. Check the segment count.
     *                   3. Check each segment is non-empty.
     * @tc.expected      Three non-empty segments form the bundle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('ipcSecurityBundleHasThreeSegments', 0, () => {
      logStep('ipcSecurity', 'bundle segments');
      const parts: string[] = TARGET_BUNDLE.split('.');
      expect(parts.length).assertEqual(3);
      expect(parts[0]).assertEqual('com');
      expect(parts[1]).assertEqual('example');
      expect(parts[2]).assertEqual('ipc_stub');
      for (let index = 0; index < parts.length; index++) {
        expect(parts[index].length > 0).assertTrue();
      }
      expect(countOf(parts, 'example')).assertEqual(1);
      expect(uniqueStrings(parts).length).assertEqual(3);
    });

    /**
     * @tc.name          ipcSecurityBundleUsesComPrefix
     * @tc.desc          The target bundle starts with the com. vendor prefix.
     * @tc.precondition  TARGET_BUNDLE is exported by the driver.
     * @tc.steps         1. Read the first four characters. 2. Compare the prefix.
     *                   3. Check the ability prefix too.
     * @tc.expected      The bundle starts with com. and the ability with Service.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('ipcSecurityBundleUsesComPrefix', 0, () => {
      logStep('ipcSecurity', 'vendor prefix');
      expect(TARGET_BUNDLE.startsWith('com.')).assertTrue();
      expect(TARGET_BUNDLE.substring(0, 4)).assertEqual('com.');
      expect(TARGET_BUNDLE.indexOf('.')).assertEqual(3);
      expect(TARGET_ABILITY.startsWith('Service')).assertTrue();
      expect(TARGET_ABILITY.endsWith('Ability')).assertTrue();
      expect(TARGET_BUNDLE.startsWith('org.')).assertFalse();
      expect(TARGET_BUNDLE.charAt(0)).assertEqual('c');
    });

    /**
     * @tc.name          ipcSecurityClientAndTargetBundlesDiffer
     * @tc.desc          The client and stub bundles are distinct identifiers.
     * @tc.precondition  Both bundles are exported by the driver.
     * @tc.steps         1. Compare the strings. 2. Compare fingerprints.
     *                   3. Check both are shaped like bundles.
     * @tc.expected      The bundles differ but share the vendor prefix.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('ipcSecurityClientAndTargetBundlesDiffer', 0, () => {
      logStep('ipcSecurity', 'client differs');
      expect(CLIENT_BUNDLE === TARGET_BUNDLE).assertFalse();
      expect(textFingerprint(CLIENT_BUNDLE) === textFingerprint(TARGET_BUNDLE)).assertFalse();
      expect(looksLikeBundle(CLIENT_BUNDLE)).assertTrue();
      expect(CLIENT_BUNDLE.startsWith('com.example.')).assertTrue();
      expect(CLIENT_BUNDLE.endsWith('client')).assertTrue();
      expect(TARGET_BUNDLE.endsWith('stub')).assertTrue();
      expect(bundleAllowed(CLIENT_BUNDLE) || bundleAllowed(TARGET_BUNDLE)).assertTrue();
    });

    /**
     * @tc.name          ipcSecurityNeighbourBundlesAreDenied
     * @tc.desc          Sibling example bundles are not connectable targets.
     * @tc.precondition  The allowlist oracle holds one literal.
     * @tc.steps         1. Evaluate three sibling bundles. 2. Count the denials.
     *                   3. Confirm the target still passes.
     * @tc.expected      All siblings are denied and the target is allowed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('ipcSecurityNeighbourBundlesAreDenied', 0, () => {
      logStep('ipcSecurity', 'neighbour bundles');
      const siblings: string[] = ['com.example.other', 'com.example.ipc', 'com.example.ipc_stub2'];
      let denied = 0;
      for (let index = 0; index < siblings.length; index++) {
        if (!bundleAllowed(siblings[index])) {
          denied = denied + 1;
        }
        expect(looksLikeBundle(siblings[index])).assertTrue();
      }
      expect(denied).assertEqual(3);
      expect(bundleAllowed(TARGET_BUNDLE)).assertTrue();
      expect(countOf(siblings, 'com.example.ipc')).assertEqual(1);
      expect(uniqueStrings(siblings).length).assertEqual(3);
      expect(siblings[2].endsWith('stub2')).assertTrue();
    });

    /**
     * @tc.name          ipcSecurityVerdictDeniesBundleFirst
     * @tc.desc          A bad bundle is denied before the ability is considered.
     * @tc.precondition  The verdict helper checks the bundle first.
     * @tc.steps         1. Pair a bad bundle with a bad ability. 2. Read the
     *                   verdict. 3. Pair a good bundle with the bad ability.
     * @tc.expected      The first verdict is bundle-denied, the second
     *                   ability-denied.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('ipcSecurityVerdictDeniesBundleFirst', 0, () => {
      logStep('ipcSecurity', 'verdict order');
      const both = new WantModel('bad.bundle', 'BadAbility');
      const abilityOnly = new WantModel(TARGET_BUNDLE, 'BadAbility');
      expect(verdict(both)).assertEqual('bundle-denied');
      expect(verdict(abilityOnly)).assertEqual('ability-denied');
      expect(verdict(new WantModel())).assertEqual('allow');
      expect(verdict(both) === verdict(abilityOnly)).assertFalse();
      expect(countOf([verdict(both), verdict(abilityOnly), verdict(new WantModel())], 'allow')).assertEqual(1);
      expect(joined([verdict(both), verdict(abilityOnly)], '|')).assertEqual('bundle-denied|ability-denied');
    });

    /**
     * @tc.name          ipcSecurityConnectAfterDisconnectUsesTargetWant
     * @tc.desc          A reconnect keeps the same production target want.
     * @tc.precondition  A connected session can be disconnected and reconnected.
     * @tc.steps         1. Disconnect. 2. Reconnect with a new id. 3. Compare the
     *                   want fields.
     * @tc.expected      The want is unchanged while the connect id moves.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('ipcSecurityConnectAfterDisconnectUsesTargetWant', 0, () => {
      logStep('ipcSecurity', 'reconnect want');
      const client = createConnectedSession();
      client.onDisconnect();
      expect(client.want.bundleName).assertEqual(TARGET_BUNDLE);
      expect(client.connect(77)).assertTrue();
      expect(client.connectId).assertEqual(77);
      expect(client.want.describe()).assertEqual('com.example.ipc_stub/ServiceAbility');
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.events.countOf('connect')).assertEqual(2);
      expect(verdict(client.want)).assertEqual('allow');
    });

    /**
     * @tc.name          ipcSecurityProxyIsNotPartOfAllowlist
     * @tc.desc          A live proxy alone does not authorise the want.
     * @tc.precondition  A client can be attached to a proxy manually.
     * @tc.steps         1. Attach a proxy to a bad want. 2. Evaluate the want.
     *                   3. Confirm the proxy is still live.
     * @tc.expected      The want is denied even though the proxy is alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('ipcSecurityProxyIsNotPartOfAllowlist', 0, () => {
      logStep('ipcSecurity', 'proxy not allowlist');
      const want = new WantModel('com.example.impostor', TARGET_ABILITY);
      const client = new ConnectionModel(want);
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      client.connect(3);
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(proxy.isAlive()).assertTrue();
      expect(verdict(want)).assertEqual('bundle-denied');
      expect(bundleAllowed(want.bundleName)).assertFalse();
      expect(client.isConnected()).assertTrue();
      expect(verdict(client.want) === 'allow').assertFalse();
    });

    /**
     * @tc.name          ipcSecurityEmptyStringsDenyAndFailValidation
     * @tc.desc          An empty want is denied and reports two validation errors.
     * @tc.precondition  A WantModel accepts empty names.
     * @tc.steps         1. Build the empty want. 2. Read its verdict. 3. Read its
     *                   validation errors.
     * @tc.expected      The verdict is bundle-denied with two ordered errors.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('ipcSecurityEmptyStringsDenyAndFailValidation', 0, () => {
      logStep('ipcSecurity', 'empty want');
      const want = new WantModel('', '');
      expect(verdict(want)).assertEqual('bundle-denied');
      expect(want.validate().length).assertEqual(2);
      expect(want.describe()).assertEqual('/');
      expect(want.bundleName.length).assertEqual(0);
      expect(want.abilityName.length).assertEqual(0);
      expect(want.matches(new WantModel())).assertFalse();
      expect(bundleAllowed('')).assertFalse();
      expect(abilityAllowed('')).assertFalse();
    });

    /**
     * @tc.name          ipcSecurityAllowlistRejectsCaseFoldedClient
     * @tc.desc          Case folding the client bundle does not reach the target.
     * @tc.precondition  Both bundle constants are exported.
     * @tc.steps         1. Upper case the client bundle. 2. Evaluate the allowlist.
     *                   3. Compare it to the target.
     * @tc.expected      The folded client bundle is denied and distinct from the
     *                   target.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('ipcSecurityAllowlistRejectsCaseFoldedClient', 0, () => {
      logStep('ipcSecurity', 'folded client');
      const folded = CLIENT_BUNDLE.toUpperCase();
      expect(bundleAllowed(folded)).assertFalse();
      expect(folded === TARGET_BUNDLE).assertFalse();
      expect(folded.length).assertEqual(CLIENT_BUNDLE.length);
      expect(folded.startsWith('COM.EXAMPLE')).assertTrue();
      expect(verdict(new WantModel(folded, TARGET_ABILITY))).assertEqual('bundle-denied');
      expect(looksLikeBundle(folded)).assertTrue();
      expect(textFingerprint(folded) === textFingerprint(TARGET_BUNDLE)).assertFalse();
    });

    /**
     * @tc.name          ipcSecurityDefaultWantUsesConstants
     * @tc.desc          The default constructor pulls both target constants.
     * @tc.precondition  WantModel has default parameters.
     * @tc.steps         1. Build a default want. 2. Build an explicit one. 3. Compare
     *                   every field.
     * @tc.expected      Both wants describe the same target tuple.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('ipcSecurityDefaultWantUsesConstants', 0, () => {
      logStep('ipcSecurity', 'default want');
      const implicit = new WantModel();
      const explicit = new WantModel(TARGET_BUNDLE, TARGET_ABILITY);
      expect(implicit.bundleName).assertEqual(TARGET_BUNDLE);
      expect(implicit.abilityName).assertEqual(TARGET_ABILITY);
      expect(implicit.matches(explicit)).assertTrue();
      expect(implicit.describe()).assertEqual(explicit.describe());
      expect(implicit.validate().length).assertEqual(0);
      expect(joined([implicit.bundleName, implicit.abilityName], '|'))
        .assertEqual('com.example.ipc_stub|ServiceAbility');
      expect(verdict(implicit)).assertEqual('allow');
    });

    /**
     * @tc.name          ipcSecurityNegativeConnectIdIsAccepted
     * @tc.desc          Only the initial sentinel is special during connect.
     * @tc.precondition  A fresh client is available.
     * @tc.steps         1. Connect with a negative id. 2. Snapshot the client.
     *                   3. Check the disconnect request path.
     * @tc.expected      The negative id is stored and treated as a handle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('ipcSecurityNegativeConnectIdIsAccepted', 0, () => {
      logStep('ipcSecurity', 'negative connect id');
      const client = new ConnectionModel();
      expect(client.connect(-5)).assertTrue();
      expect(client.connectId).assertEqual(-5);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.disconnectRequested()).assertTrue();
      expect(client.events.last()).assertEqual('disconnect-request:-5');
      expect(client.connectId === INITIAL_CONNECT_ID).assertFalse();
      expect(client.want.describe()).assertEqual('com.example.ipc_stub/ServiceAbility');
    });

    /**
     * @tc.name          ipcSecurityEventsAreTargetScoped
     * @tc.desc          Every connect event detail names the target or descriptor.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Walk every event. 2. Check for the bundle or descriptor.
     *                   3. Count the scoped details.
     * @tc.expected      All three connect events are target scoped.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('ipcSecurityEventsAreTargetScoped', 0, () => {
      logStep('ipcSecurity', 'events scoped');
      const client = createConnectedSession();
      let scoped = 0;
      for (let index = 0; index < client.events.entries.length; index++) {
        const entry = client.events.entries[index];
        if (entry.indexOf(TARGET_BUNDLE) >= 0 || entry.indexOf(STUB_DESCRIPTOR) >= 0) {
          scoped = scoped + 1;
        }
      }
      expect(client.events.size()).assertEqual(3);
      expect(scoped).assertEqual(3);
      expect(client.events.entries[0].indexOf(TARGET_BUNDLE)).assertEqual(8);
      expect(client.events.entries[0]).assertEqual('connect:com.example.ipc_stub/ServiceAbility');
      expect(client.events.entries[1].indexOf(STUB_DESCRIPTOR)).assertEqual(15);
      expect(client.events.entries[2]).assertEqual('connected:IPCStubTest');
      expect(client.events.countOf('connect')).assertEqual(1);
    });

    /**
     * @tc.name          ipcSecuritySpacedTargetIsMalformed
     * @tc.desc          Adding a trailing space to either name fails validation.
     * @tc.precondition  The validator checks both names for spaces.
     * @tc.steps         1. Space the bundle. 2. Space the ability. 3. Compare both
     *                   error lists.
     * @tc.expected      Each variant reports exactly one space error.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('ipcSecuritySpacedTargetIsMalformed', 0, () => {
      logStep('ipcSecurity', 'spaced target');
      const bundleSpaced = new WantModel(TARGET_BUNDLE + ' ', TARGET_ABILITY);
      const abilitySpaced = new WantModel(TARGET_BUNDLE, ' ' + TARGET_ABILITY);
      expect(bundleSpaced.validate()[0]).assertEqual('bundle-has-space');
      expect(abilitySpaced.validate()[0]).assertEqual('ability-has-space');
      expect(bundleSpaced.validate().length).assertEqual(1);
      expect(abilitySpaced.validate().length).assertEqual(1);
      expect(bundleSpaced.bundleName.endsWith(' ')).assertTrue();
      expect(abilitySpaced.abilityName.startsWith(' ')).assertTrue();
      expect(verdict(bundleSpaced)).assertEqual('bundle-denied');
      expect(verdict(abilitySpaced)).assertEqual('ability-denied');
    });

    /**
     * @tc.name          ipcSecurityDottedAbilityIsDenied
     * @tc.desc          A dotted ability name is well formed but not allowlisted.
     * @tc.precondition  The ability oracle is exact.
     * @tc.steps         1. Join the ability with a dot. 2. Validate it. 3. Evaluate
     *                   the verdict.
     * @tc.expected      The dotted name validates but is denied.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('ipcSecurityDottedAbilityIsDenied', 0, () => {
      logStep('ipcSecurity', 'dotted ability');
      const dotted = 'Service.Ability';
      const want = new WantModel(TARGET_BUNDLE, dotted);
      expect(dotted.indexOf('.')).assertEqual(7);
      expect(abilityAllowed(dotted)).assertFalse();
      expect(verdict(want)).assertEqual('ability-denied');
      expect(want.validate().length).assertEqual(0);
      expect(dotted.startsWith('Service')).assertTrue();
      expect(dotted.endsWith('Ability')).assertTrue();
      expect(dotted.length).assertEqual(TARGET_ABILITY.length + 1);
    });

    /**
     * @tc.name          ipcSecurityUnderscoreSegmentIsAllowlisted
     * @tc.desc          The target's underscore segment does not block the match.
     * @tc.precondition  TARGET_BUNDLE ends in ipc_stub.
     * @tc.steps         1. Split the bundle. 2. Read the last segment. 3. Compare it
     *                   to the allowlist match.
     * @tc.expected      The underscore segment is allowed and its hyphen analogue
     *                   is denied.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('ipcSecurityUnderscoreSegmentIsAllowlisted', 0, () => {
      logStep('ipcSecurity', 'underscore segment');
      const parts = TARGET_BUNDLE.split('.');
      const hyphenated = 'com.example.ipc-stub';
      expect(parts[2]).assertEqual('ipc_stub');
      expect(parts[2].indexOf('_')).assertEqual(3);
      expect(bundleAllowed(TARGET_BUNDLE)).assertTrue();
      expect(bundleAllowed(hyphenated)).assertFalse();
      expect(looksLikeBundle(hyphenated)).assertTrue();
      expect(verdict(new WantModel(hyphenated, TARGET_ABILITY))).assertEqual('bundle-denied');
    });

    /**
     * @tc.name          ipcSecurityTwoSessionsShareTargetTuple
     * @tc.desc          Independent sessions carry identical target tuples.
     * @tc.precondition  Two sessions are created from the same driver.
     * @tc.steps         1. Create two sessions. 2. Compare both want fields. 3.
     *                   Compare the descriptions.
     * @tc.expected      Both tuples are the same allowlisted literal pair.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('ipcSecurityTwoSessionsShareTargetTuple', 0, () => {
      logStep('ipcSecurity', 'shared target tuple');
      const first = createConnectedSession();
      const second = createConnectedSession();
      expect(first.want.bundleName).assertEqual(second.want.bundleName);
      expect(first.want.abilityName).assertEqual(second.want.abilityName);
      expect(first.want.describe()).assertEqual(second.want.describe());
      expect(first.want.matches(second.want)).assertTrue();
      expect(first.connectId).assertEqual(second.connectId);
      expect(verdict(first.want)).assertEqual(verdict(second.want));
      expect(textFingerprint(first.want.describe())).assertEqual(textFingerprint(second.want.describe()));
    });

    /**
     * @tc.name          ipcSecurityBundleControlSuffixIsDenied
     * @tc.desc          A control character suffix is not the allowlisted bundle.
     * @tc.precondition  The allowlist oracle compares exact strings.
     * @tc.steps         1. Append a newline. 2. Append a tab. 3. Evaluate both.
     * @tc.expected      Both mutated bundles are denied while validation passes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('ipcSecurityBundleControlSuffixIsDenied', 0, () => {
      logStep('ipcSecurity', 'bundle control suffix');
      const newline = TARGET_BUNDLE + '\n';
      const tab = TARGET_BUNDLE + '\t';
      expect(bundleAllowed(newline)).assertFalse();
      expect(bundleAllowed(tab)).assertFalse();
      expect(new WantModel(newline, TARGET_ABILITY).validate().length).assertEqual(0);
      expect(new WantModel(tab, TARGET_ABILITY).validate().length).assertEqual(0);
      expect(verdict(new WantModel(newline, TARGET_ABILITY))).assertEqual('bundle-denied');
      expect(verdict(new WantModel(tab, TARGET_ABILITY))).assertEqual('bundle-denied');
      expect(newline.length).assertEqual(TARGET_BUNDLE.length + 1);
    });

    /**
     * @tc.name          ipcSecurityAbilityControlSuffixIsDenied
     * @tc.desc          A control character suffix breaks the ability match.
     * @tc.precondition  The ability oracle compares exact strings.
     * @tc.steps         1. Append a newline to the ability. 2. Validate it. 3. Read
     *                   the verdict.
     * @tc.expected      The mutated ability validates but is denied.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('ipcSecurityAbilityControlSuffixIsDenied', 0, () => {
      logStep('ipcSecurity', 'ability control suffix');
      const newline = TARGET_ABILITY + '\n';
      const tab = TARGET_ABILITY + '\t';
      expect(abilityAllowed(newline)).assertFalse();
      expect(abilityAllowed(tab)).assertFalse();
      expect(new WantModel(TARGET_BUNDLE, newline).validate().length).assertEqual(0);
      expect(new WantModel(TARGET_BUNDLE, tab).validate().length).assertEqual(0);
      expect(verdict(new WantModel(TARGET_BUNDLE, newline))).assertEqual('ability-denied');
      expect(verdict(new WantModel(TARGET_BUNDLE, tab))).assertEqual('ability-denied');
      expect(newline.endsWith('\n')).assertTrue();
      expect(tab.endsWith('\t')).assertTrue();
    });

    /**
     * @tc.name          ipcSecurityVerdictTrailIsPinned
     * @tc.desc          A fixed candidate list produces a pinned verdict trail.
     * @tc.precondition  The verdict helper and allowlist are defined.
     * @tc.steps         1. Evaluate four wants. 2. Join their verdicts. 3. Compare the
     *                   golden trail.
     * @tc.expected      The trail is allow, bundle-denied, ability-denied and denied.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('ipcSecurityVerdictTrailIsPinned', 0, () => {
      logStep('ipcSecurity', 'verdict trail');
      const wants: WantModel[] = [
        new WantModel(),
        new WantModel(CLIENT_BUNDLE, TARGET_ABILITY),
        new WantModel(TARGET_BUNDLE, 'OtherAbility'),
        new WantModel('', '')
      ];
      const trail: string[] = [];
      for (let index = 0; index < wants.length; index++) {
        trail.push(verdict(wants[index]));
      }
      expect(joined(trail, '>')).assertEqual('allow>bundle-denied>ability-denied>bundle-denied');
      expect(countOf(trail, 'allow')).assertEqual(1);
      expect(countOf(trail, 'bundle-denied')).assertEqual(2);
      expect(trail.length).assertEqual(4);
      expect(trail[0]).assertEqual('allow');
      expect(trail[2]).assertEqual('ability-denied');
      expect(uniqueStrings(trail).length).assertEqual(3);
    });

    /**
     * @tc.name          ipcSecurityEightCandidateSweepCounts
     * @tc.desc          Eight candidates yield one allow and seven denials.
     * @tc.precondition  The allowlist oracle is exact.
     * @tc.steps         1. Build eight wants. 2. Count the verdicts. 3. Compare the
     *                   allow ratio.
     * @tc.expected      Exactly one candidate is allowed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('ipcSecurityEightCandidateSweepCounts', 0, () => {
      logStep('ipcSecurity', 'eight candidate sweep');
      const wants: WantModel[] = [
        new WantModel(),
        new WantModel(CLIENT_BUNDLE, TARGET_ABILITY),
        new WantModel(TARGET_BUNDLE + '.x', TARGET_ABILITY),
        new WantModel(TARGET_BUNDLE, TARGET_ABILITY + 'x'),
        new WantModel('', ''),
        new WantModel('com.example', ''),
        new WantModel('org.example.ipc_stub', 'ServiceAbility'),
        new WantModel(TARGET_BUNDLE, 'serviceAbility')
      ];
      let allowed = 0;
      for (let index = 0; index < wants.length; index++) {
        if (verdict(wants[index]) === 'allow') {
          allowed = allowed + 1;
        }
      }
      expect(wants.length).assertEqual(8);
      expect(allowed).assertEqual(1);
      expect(wants.length - allowed).assertEqual(7);
      expect(verdict(wants[0])).assertEqual('allow');
      expect(verdict(wants[7])).assertEqual('ability-denied');
      expect(countOf([verdict(wants[1]), verdict(wants[2])], 'bundle-denied')).assertEqual(2);
    });

    /**
     * @tc.name          ipcSecurityConnectEventCountIsOne
     * @tc.desc          A single connect records exactly one connect event.
     * @tc.precondition  A fresh client is available.
     * @tc.steps         1. Connect. 2. Count the connect events. 3. Read the detail.
     * @tc.expected      One event names the target tuple.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('ipcSecurityConnectEventCountIsOne', 0, () => {
      logStep('ipcSecurity', 'connect event count');
      const client = new ConnectionModel();
      client.connect(1);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.events.size()).assertEqual(1);
      expect(client.events.last()).assertEqual('connect:com.example.ipc_stub/ServiceAbility');
      expect(client.events.entries[0].split(':').length).assertEqual(2);
      expect(client.events.trace().indexOf(TARGET_BUNDLE) >= 0).assertTrue();
      expect(client.want.matches(new WantModel())).assertTrue();
      expect(client.connectCalls).assertEqual(1);
    });

    /**
     * @tc.name          ipcSecuritySameBundleDifferentAbilityDenied
     * @tc.desc          Four ability mutations are all denied for the right target.
     * @tc.precondition  The allowlist oracle is exact.
     * @tc.steps         1. Build four ability variants. 2. Evaluate each. 3. Count the
     *                   denials.
     * @tc.expected      All four variants are denied with a well formed bundle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('ipcSecuritySameBundleDifferentAbilityDenied', 0, () => {
      logStep('ipcSecurity', 'ability variants');
      const abilities: string[] = ['Service', 'Ability', 'ServiceAbilityExtra', 'serviceability'];
      const verdicts: string[] = [];
      for (let index = 0; index < abilities.length; index++) {
        verdicts.push(verdict(new WantModel(TARGET_BUNDLE, abilities[index])));
        expect(bundleAllowed(TARGET_BUNDLE)).assertTrue();
      }
      expect(verdicts.length).assertEqual(4);
      expect(countOf(verdicts, 'ability-denied')).assertEqual(4);
      expect(countOf(verdicts, 'allow')).assertEqual(0);
      expect(uniqueStrings(verdicts).length).assertEqual(1);
      expect(abilities[0]).assertEqual('Service');
      expect(abilities[3].toUpperCase()).assertEqual('SERVICEABILITY');
      expect(new WantModel(TARGET_BUNDLE, abilities[2]).validate().length).assertEqual(0);
    });

    /**
     * @tc.name          ipcSecuritySubstringWrapperIsDenied
     * @tc.desc          A bundle that merely contains the target is denied.
     * @tc.precondition  The allowlist oracle uses exact equality.
     * @tc.steps         1. Wrap the target with prefix and suffix. 2. Check the shape.
     *                   3. Evaluate the verdict.
     * @tc.expected      The wrapper is denied despite containing the literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('ipcSecuritySubstringWrapperIsDenied', 0, () => {
      logStep('ipcSecurity', 'substring wrapper');
      const wrapper = 'x' + TARGET_BUNDLE + 'y';
      expect(wrapper.indexOf(TARGET_BUNDLE)).assertEqual(1);
      expect(wrapper.length).assertEqual(TARGET_BUNDLE.length + 2);
      expect(bundleAllowed(wrapper)).assertFalse();
      expect(verdict(new WantModel(wrapper, TARGET_ABILITY))).assertEqual('bundle-denied');
      expect(wrapper.startsWith('x')).assertTrue();
      expect(wrapper.endsWith('y')).assertTrue();
      expect(looksLikeBundle(wrapper)).assertTrue();
    });

    /**
     * @tc.name          ipcSecurityDescribeHasSingleSlash
     * @tc.desc          The want description is two segments joined by one slash.
     * @tc.precondition  A default want exists.
     * @tc.steps         1. Split the description. 2. Count the slash. 3. Compare the
     *                   parts.
     * @tc.expected      Two parts and one slash form the description.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('ipcSecurityDescribeHasSingleSlash', 0, () => {
      logStep('ipcSecurity', 'describe slash');
      const want = new WantModel();
      const parts = want.describe().split('/');
      expect(parts.length).assertEqual(2);
      expect(parts[0]).assertEqual(TARGET_BUNDLE);
      expect(parts[1]).assertEqual(TARGET_ABILITY);
      expect(want.describe().split('/').length - 1).assertEqual(1);
      expect(want.describe().indexOf('/')).assertEqual(TARGET_BUNDLE.length);
      expect(want.describe().length).assertEqual(TARGET_BUNDLE.length + 1 + TARGET_ABILITY.length);
      expect(want.describe().charAt(TARGET_BUNDLE.length)).assertEqual('/');
    });

    /**
     * @tc.name          ipcSecurityLeadingDotVariantsAreMalformed
     * @tc.desc          Dot variants with empty edge segments fail the shape check.
     * @tc.precondition  The shape oracle rejects empty segments.
     * @tc.steps         1. Check a leading dot. 2. Check a double leading dot. 3. Read
     *                   the verdict.
     * @tc.expected      Both variants fail the shape check and are denied.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('ipcSecurityLeadingDotVariantsAreMalformed', 0, () => {
      logStep('ipcSecurity', 'leading dot variants');
      const leading = '.com.example';
      const doubled = '..com.example';
      expect(looksLikeBundle(leading)).assertFalse();
      expect(looksLikeBundle(doubled)).assertFalse();
      expect(verdict(new WantModel(leading, TARGET_ABILITY))).assertEqual('bundle-denied');
      expect(verdict(new WantModel(doubled, TARGET_ABILITY))).assertEqual('bundle-denied');
      expect(leading.split('.').length).assertEqual(3);
      expect(doubled.split('.').length).assertEqual(4);
      expect(leading.charAt(0)).assertEqual('.');
    });

    /**
     * @tc.name          ipcSecurityAllowlistIsStableAcrossCalls
     * @tc.desc          Repeated allowlist checks always agree.
     * @tc.precondition  The allowlist oracle is pure.
     * @tc.steps         1. Evaluate the target five times. 2. Evaluate the client five
     *                   times. 3. Compare the counts.
     * @tc.expected      Every target check passes and every client check fails.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('ipcSecurityAllowlistIsStableAcrossCalls', 0, () => {
      logStep('ipcSecurity', 'allowlist stable');
      let allowed = 0;
      let denied = 0;
      for (let index = 0; index < 5; index++) {
        if (bundleAllowed(TARGET_BUNDLE)) {
          allowed = allowed + 1;
        }
        if (!bundleAllowed(CLIENT_BUNDLE)) {
          denied = denied + 1;
        }
      }
      expect(allowed).assertEqual(5);
      expect(denied).assertEqual(5);
      expect(allowed + denied).assertEqual(10);
      expect(bundleAllowed(TARGET_BUNDLE)).assertEqual(bundleAllowed(ALLOWED_BUNDLE_LITERAL));
      expect(abilityAllowed(TARGET_ABILITY)).assertEqual(abilityAllowed(ALLOWED_ABILITY_LITERAL));
      expect(denied - allowed).assertEqual(0);
    });

    /**
     * @tc.name          ipcSecurityVerdictAllowsOneOfTwoAbilities
     * @tc.desc          Only the exact ability passes for the right bundle.
     * @tc.precondition  The verdict helper is defined.
     * @tc.steps         1. Evaluate the exact ability. 2. Evaluate a sibling. 3. Compare
     *                   the two verdicts.
     * @tc.expected      One allow and one ability denial.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('ipcSecurityVerdictAllowsOneOfTwoAbilities', 0, () => {
      logStep('ipcSecurity', 'one of two abilities');
      const exact = verdict(new WantModel(TARGET_BUNDLE, TARGET_ABILITY));
      const sibling = verdict(new WantModel(TARGET_BUNDLE, 'ServiceAbilityTwo'));
      expect(exact).assertEqual('allow');
      expect(sibling).assertEqual('ability-denied');
      expect(exact === sibling).assertFalse();
      expect(countOf([exact, sibling], 'allow')).assertEqual(1);
      expect(new WantModel(TARGET_BUNDLE, 'ServiceAbilityTwo').validate().length).assertEqual(0);
      expect(abilityAllowed('ServiceAbilityTwo')).assertFalse();
      expect(abilityAllowed(TARGET_ABILITY)).assertTrue();
    });

    /**
     * @tc.name          ipcSecurityBundleLiteralLengthIsTwenty
     * @tc.desc          The target bundle literal has twenty characters.
     * @tc.precondition  TARGET_BUNDLE is exported.
     * @tc.steps         1. Read the length. 2. Compare each segment length. 3. Compare
     *                   the concatenation.
     * @tc.expected      Three segments of three, seven and eight chars fit twenty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('ipcSecurityBundleLiteralLengthIsTwenty', 0, () => {
      logStep('ipcSecurity', 'bundle length');
      const parts = TARGET_BUNDLE.split('.');
      expect(TARGET_BUNDLE.length).assertEqual(20);
      expect(parts[0].length).assertEqual(3);
      expect(parts[1].length).assertEqual(7);
      expect(parts[2].length).assertEqual(8);
      expect(parts[0].length + parts[1].length + parts[2].length + 2).assertEqual(20);
      expect(TARGET_BUNDLE.split('.').length - 1).assertEqual(2);
      expect(TARGET_BUNDLE.endsWith('stub')).assertTrue();
    });

    /**
     * @tc.name          ipcSecuritySessionNeverTargetsItself
     * @tc.desc          The connected session's want is not the client bundle.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Read the session want. 2. Compare it to the client bundle. 3.
     *                   Evaluate the allowlist.
     * @tc.expected      The session targets the stub, never the client.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('ipcSecuritySessionNeverTargetsItself', 0, () => {
      logStep('ipcSecurity', 'never self target');
      const client = createConnectedSession();
      expect(client.want.bundleName).assertEqual(TARGET_BUNDLE);
      expect(client.want.bundleName === CLIENT_BUNDLE).assertFalse();
      expect(client.want.bundleName.endsWith('stub')).assertTrue();
      expect(CLIENT_BUNDLE.endsWith('client')).assertTrue();
      expect(bundleAllowed(client.want.bundleName)).assertTrue();
      expect(verdict(client.want)).assertEqual('allow');
      expect(client.want.describe().indexOf('ipc_client')).assertEqual(-1);
    });

    /**
     * @tc.name          ipcSecurityConnectFailureKeepsWantForRetry
     * @tc.desc          A failed connect keeps the target want for the next attempt.
     * @tc.precondition  A fresh client is available.
     * @tc.steps         1. Connect and fail. 2. Read the want. 3. Retry with a new id.
     * @tc.expected      The want is untouched and the retry starts cleanly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('ipcSecurityConnectFailureKeepsWantForRetry', 0, () => {
      logStep('ipcSecurity', 'retry keeps want');
      const client = new ConnectionModel();
      client.connect(1);
      client.onFailed(16000001);
      expect(client.want.bundleName).assertEqual(TARGET_BUNDLE);
      expect(client.want.abilityName).assertEqual(TARGET_ABILITY);
      expect(verdict(client.want)).assertEqual('allow');
      expect(client.connect(2)).assertTrue();
      expect(client.connectId).assertEqual(2);
      expect(client.want.describe()).assertEqual('com.example.ipc_stub/ServiceAbility');
      expect(client.events.countOf('connect')).assertEqual(2);
      expect(client.state).assertEqual(STATE_CONNECTING);
    });

    /**
     * @tc.name          ipcSecurityEmptyBundleShapeIsFalse
     * @tc.desc          The empty string is not shaped like a bundle.
     * @tc.precondition  The shape oracle is defined.
     * @tc.steps         1. Check the empty string. 2. Check a single space. 3. Compare
     *                   to the target.
     * @tc.expected      Both degenerate values fail while the target passes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('ipcSecurityEmptyBundleShapeIsFalse', 0, () => {
      logStep('ipcSecurity', 'empty bundle shape');
      expect(looksLikeBundle('')).assertFalse();
      expect(looksLikeBundle(' ')).assertFalse();
      expect(looksLikeBundle('.')).assertFalse();
      expect(looksLikeBundle('a.')).assertFalse();
      expect(looksLikeBundle('a.b')).assertTrue();
      expect(looksLikeBundle(TARGET_BUNDLE)).assertTrue();
      expect(bundleAllowed('')).assertFalse();
      expect(abilityAllowed(' ')).assertFalse();
    });

    /**
     * @tc.name          ipcSecurityWhitespaceOnlyNamesAreDenied
     * @tc.desc          Whitespace only bundle and ability values are denied.
     * @tc.precondition  The allowlist and validator are defined.
     * @tc.steps         1. Build a space only want. 2. Validate it. 3. Read the verdict.
     * @tc.expected      Two space errors are reported and the want is denied.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('ipcSecurityWhitespaceOnlyNamesAreDenied', 0, () => {
      logStep('ipcSecurity', 'whitespace only');
      const want = new WantModel('   ', '   ');
      const errors = want.validate();
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('bundle-has-space');
      expect(errors[1]).assertEqual('ability-has-space');
      expect(verdict(want)).assertEqual('bundle-denied');
      expect(bundleAllowed('   ')).assertFalse();
      expect(abilityAllowed('   ')).assertFalse();
      expect(looksLikeBundle('   ')).assertFalse();
    });

    /**
     * @tc.name          ipcSecurityDuplicateConnectKeepsState
     * @tc.desc          A refused duplicate connect does not move the state.
     * @tc.precondition  A connecting client exists.
     * @tc.steps         1. Connect. 2. Connect again. 3. Inspect state and id.
     * @tc.expected      The state and id remain from the first attempt.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('ipcSecurityDuplicateConnectKeepsState', 0, () => {
      logStep('ipcSecurity', 'duplicate connect state');
      const client = new ConnectionModel();
      client.connect(3);
      const state = client.state;
      expect(client.connect(4)).assertFalse();
      expect(client.state).assertEqual(state);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectId).assertEqual(3);
      expect(client.connectId === 4).assertFalse();
      expect(client.want.describe()).assertEqual('com.example.ipc_stub/ServiceAbility');
      expect(client.events.countOf('connect')).assertEqual(1);
    });

    /**
     * @tc.name          ipcSecurityRepeatedTargetVerdictsAgree
     * @tc.desc          Ten evaluations of the target want all allow.
     * @tc.precondition  The verdict helper is defined.
     * @tc.steps         1. Evaluate the target ten times. 2. Count the allows. 3. Compare
     *                   the trail fingerprint.
     * @tc.expected      All ten verdicts are allow.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('ipcSecurityRepeatedTargetVerdictsAgree', 0, () => {
      logStep('ipcSecurity', 'repeated verdicts');
      const want = new WantModel();
      const trail: string[] = [];
      for (let index = 0; index < 10; index++) {
        trail.push(verdict(want));
      }
      expect(trail.length).assertEqual(10);
      expect(countOf(trail, 'allow')).assertEqual(10);
      expect(uniqueStrings(trail).length).assertEqual(1);
      expect(joined(trail, '')).assertEqual('allowallowallowallowallowallowallowallowallowallow');
      expect(textFingerprint(joined(trail, '|')) > 0).assertTrue();
      expect(trail[0]).assertEqual(trail[9]);
      expect(countOf(trail, 'bundle-denied')).assertEqual(0);
    });

    /**
     * @tc.name          ipcSecurityAbilityUnderscoreIsDenied
     * @tc.desc          An underscored ability is well formed but not allowlisted.
     * @tc.precondition  The ability oracle is exact.
     * @tc.steps         1. Build Service_Ability. 2. Validate it. 3. Read the verdict.
     * @tc.expected      The underscored ability validates but is denied.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('ipcSecurityAbilityUnderscoreIsDenied', 0, () => {
      logStep('ipcSecurity', 'ability underscore');
      const variant = 'Service_Ability';
      const want = new WantModel(TARGET_BUNDLE, variant);
      expect(abilityAllowed(variant)).assertFalse();
      expect(want.validate().length).assertEqual(0);
      expect(verdict(want)).assertEqual('ability-denied');
      expect(variant.length).assertEqual(15);
      expect(variant.indexOf('_')).assertEqual(7);
      expect(variant.endsWith('Ability')).assertTrue();
      expect(abilityAllowed(TARGET_ABILITY)).assertTrue();
    });

    /**
     * @tc.name          ipcSecuritySpoofFingerprintDiffers
     * @tc.desc          A near miss bundle has a different fingerprint from the target.
     * @tc.precondition  Two similarly named bundles exist.
     * @tc.steps         1. Fingerprint the target. 2. Fingerprint a one char mutant. 3.
     *                   Compare the values and lengths.
     * @tc.expected      The fingerprints differ while the lengths stay close.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('ipcSecuritySpoofFingerprintDiffers', 0, () => {
      logStep('ipcSecurity', 'spoof fingerprint');
      const target = textFingerprint(TARGET_BUNDLE);
      const mutant = textFingerprint(TARGET_BUNDLE + 'x');
      expect(target === mutant).assertFalse();
      expect(target > 0).assertTrue();
      expect(mutant > 0).assertTrue();
      expect((TARGET_BUNDLE + 'x').length).assertEqual(TARGET_BUNDLE.length + 1);
      expect(bundleAllowed(TARGET_BUNDLE + 'x')).assertFalse();
      expect(target).assertEqual(textFingerprint('com.example.ipc_stub'));
      expect(mutant === textFingerprint(CLIENT_BUNDLE)).assertFalse();
    });

  });
}
