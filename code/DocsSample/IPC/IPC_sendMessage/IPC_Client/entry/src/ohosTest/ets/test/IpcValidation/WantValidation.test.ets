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
  WantModel,
  ConnectionModel,
  TARGET_BUNDLE,
  TARGET_ABILITY,
  CLIENT_BUNDLE,
  STUB_DESCRIPTOR,
  STATE_CONNECTING,
  createConnectedSession,
  joined,
  countOf,
  uniqueStrings,
  sameStringArray,
  textFingerprint
} from '../Shared/SharedDriver';

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
     * @tc.name          wantValidationDefaultBundleLiteral
     * @tc.desc          The default WantModel carries the production bundle literal.
     * @tc.precondition  SharedDriver is imported and no Want is constructed yet.
     * @tc.steps         1. Construct a default WantModel.
     *                   2. Read bundleName.
     *                   3. Compare it with TARGET_BUNDLE.
     * @tc.expected      bundleName is com.example.ipc_stub.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('wantValidationDefaultBundleLiteral', 0, () => {
      const want: WantModel = new WantModel();
      logStep('wantValidation', 'bundle=' + want.bundleName);
      expect(want.bundleName).assertEqual(TARGET_BUNDLE);
      expect(want.bundleName).assertEqual('com.example.ipc_stub');
      expect(want.bundleName.length).assertEqual(20);
      expect(want.bundleName.indexOf('com.example')).assertEqual(0);
      expect(want.bundleName.indexOf('ipc_stub')).assertLarger(0);
      expect(want.validate().length).assertEqual(0);
    });

    /**
     * @tc.name          wantValidationDefaultAbilityLiteral
     * @tc.desc          The default WantModel carries the production ability literal.
     * @tc.precondition  SharedDriver is imported.
     * @tc.steps         1. Construct a default WantModel.
     *                   2. Read abilityName.
     *                   3. Compare it with TARGET_ABILITY.
     * @tc.expected      abilityName is ServiceAbility with the expected casing.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('wantValidationDefaultAbilityLiteral', 0, () => {
      const want: WantModel = new WantModel();
      expect(want.abilityName).assertEqual(TARGET_ABILITY);
      expect(want.abilityName).assertEqual('ServiceAbility');
      expect(want.abilityName.length).assertEqual(14);
      expect(want.abilityName.charAt(0)).assertEqual('S');
      expect(want.abilityName.charAt(7)).assertEqual('A');
      expect(want.abilityName.indexOf(' ')).assertLess(0);
    });

    /**
     * @tc.name          wantValidationDescribeJoinsWithSlash
     * @tc.desc          describe() renders bundle and ability separated by one slash.
     * @tc.precondition  A default WantModel exists.
     * @tc.steps         1. Call describe().
     *                   2. Split on the slash.
     *                   3. Check both segments and the total length.
     * @tc.expected      The first segment is the bundle and the second the ability.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('wantValidationDescribeJoinsWithSlash', 0, () => {
      const want: WantModel = new WantModel();
      const text: string = want.describe();
      const parts: string[] = text.split('/');
      expect(parts.length).assertEqual(2);
      expect(parts[0]).assertEqual(TARGET_BUNDLE);
      expect(parts[1]).assertEqual(TARGET_ABILITY);
      expect(text.length).assertEqual(TARGET_BUNDLE.length + TARGET_ABILITY.length + 1);
      expect(countOf(text.split(''), '/')).assertEqual(1);
      expect(text).assertEqual(TARGET_BUNDLE + '/' + TARGET_ABILITY);
    });

    /**
     * @tc.name          wantValidationMatchesIdenticalWant
     * @tc.desc          Two default wants match each other.
     * @tc.precondition  Two independent default WantModel values exist.
     * @tc.steps         1. Construct left and right wants.
     *                   2. Call left.matches(right).
     *                   3. Repeat in the other direction.
     * @tc.expected      Matching is symmetric and true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('wantValidationMatchesIdenticalWant', 0, () => {
      const left: WantModel = new WantModel();
      const right: WantModel = new WantModel();
      expect(left.matches(right)).assertTrue();
      expect(right.matches(left)).assertTrue();
      expect(left.describe()).assertEqual(right.describe());
      expect(left.bundleName).assertEqual(right.bundleName);
      expect(left.abilityName).assertEqual(right.abilityName);
      expect(textFingerprint(left.describe())).assertEqual(textFingerprint(right.describe()));
    });

    /**
     * @tc.name          wantValidationRejectsWrongBundle
     * @tc.desc          A want with a different bundle name does not match the target.
     * @tc.precondition  A default target want exists.
     * @tc.steps         1. Build a candidate with CLIENT_BUNDLE.
     *                   2. Compare with the target.
     *                   3. Verify the ability name is still equal.
     * @tc.expected      matches() is false while abilityName is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('wantValidationRejectsWrongBundle', 0, () => {
      const target: WantModel = new WantModel();
      const candidate: WantModel = new WantModel(CLIENT_BUNDLE, TARGET_ABILITY);
      expect(target.matches(candidate)).assertFalse();
      expect(candidate.matches(target)).assertFalse();
      expect(candidate.abilityName).assertEqual(TARGET_ABILITY);
      expect(candidate.bundleName).assertEqual('com.example.ipc_client');
      expect(candidate.bundleName).assertEqual(CLIENT_BUNDLE);
      expect(candidate.bundleName === target.bundleName).assertFalse();
    });

    /**
     * @tc.name          wantValidationRejectsWrongAbility
     * @tc.desc          A want with a different ability name does not match the target.
     * @tc.precondition  A default target want exists.
     * @tc.steps         1. Build a candidate with STUB_DESCRIPTOR as the ability.
     *                   2. Compare with the target.
     *                   3. Compare the bundle names.
     * @tc.expected      matches() is false while bundleName stays equal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('wantValidationRejectsWrongAbility', 0, () => {
      const target: WantModel = new WantModel();
      const candidate: WantModel = new WantModel(TARGET_BUNDLE, STUB_DESCRIPTOR);
      expect(target.matches(candidate)).assertFalse();
      expect(candidate.matches(target)).assertFalse();
      expect(candidate.bundleName).assertEqual(TARGET_BUNDLE);
      expect(candidate.abilityName).assertEqual('IPCStubTest');
      expect(candidate.abilityName === target.abilityName).assertFalse();
      expect(candidate.validate().length).assertEqual(0);
    });

    /**
     * @tc.name          wantValidationRejectsBothFieldsWrong
     * @tc.desc          Changing both fields keeps the wants distinct.
     * @tc.precondition  A default target want exists.
     * @tc.steps         1. Build a fully different want.
     *                   2. Compare both directions.
     *                   3. Verify describe strings differ.
     * @tc.expected      Both comparisons are false and descriptions differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('wantValidationRejectsBothFieldsWrong', 0, () => {
      const target: WantModel = new WantModel();
      const candidate: WantModel = new WantModel(CLIENT_BUNDLE, STUB_DESCRIPTOR);
      expect(target.matches(candidate)).assertFalse();
      expect(candidate.matches(target)).assertFalse();
      expect(target.describe() === candidate.describe()).assertFalse();
      expect(target.bundleName === candidate.bundleName).assertFalse();
      expect(target.abilityName === candidate.abilityName).assertFalse();
      expect(textFingerprint(target.describe()) === textFingerprint(candidate.describe())).assertFalse();
    });

    /**
     * @tc.name          wantValidationEmptyBundleReportsError
     * @tc.desc          An empty bundle name is reported by validate().
     * @tc.precondition  A candidate want with an empty bundle is constructed.
     * @tc.steps         1. Build WantModel with an empty bundle.
     *                   2. Call validate().
     *                   3. Inspect the error list.
     * @tc.expected      The only error token is bundle-empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('wantValidationEmptyBundleReportsError', 0, () => {
      const want: WantModel = new WantModel('', TARGET_ABILITY);
      const errors: string[] = want.validate();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('bundle-empty');
      expect(want.bundleName.length).assertEqual(0);
      expect(want.abilityName).assertEqual(TARGET_ABILITY);
      expect(want.matches(new WantModel())).assertFalse();
      expect(want.describe()).assertEqual('/' + TARGET_ABILITY);
    });

    /**
     * @tc.name          wantValidationEmptyAbilityReportsError
     * @tc.desc          An empty ability name is reported by validate().
     * @tc.precondition  A candidate want with an empty ability is constructed.
     * @tc.steps         1. Build WantModel with an empty ability.
     *                   2. Call validate().
     *                   3. Inspect the error list and describe output.
     * @tc.expected      The only error token is ability-empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('wantValidationEmptyAbilityReportsError', 0, () => {
      const want: WantModel = new WantModel(TARGET_BUNDLE, '');
      const errors: string[] = want.validate();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('ability-empty');
      expect(want.abilityName.length).assertEqual(0);
      expect(want.bundleName).assertEqual(TARGET_BUNDLE);
      expect(want.describe()).assertEqual(TARGET_BUNDLE + '/');
      expect(want.describe().endsWith('/')).assertTrue();
    });

    /**
     * @tc.name          wantValidationBothEmptyReportsTwoErrors
     * @tc.desc          Empty bundle and ability produce two ordered error tokens.
     * @tc.precondition  A want with both names empty is constructed.
     * @tc.steps         1. Build WantModel with two empty strings.
     *                   2. Call validate().
     *                   3. Check length and ordering.
     * @tc.expected      Errors are bundle-empty then ability-empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationBothEmptyReportsTwoErrors', 0, () => {
      const want: WantModel = new WantModel('', '');
      const errors: string[] = want.validate();
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('bundle-empty');
      expect(errors[1]).assertEqual('ability-empty');
      expect(joined(errors, '+')).assertEqual('bundle-empty+ability-empty');
      expect(uniqueStrings(errors).length).assertEqual(2);
      expect(want.describe()).assertEqual('/');
    });

    /**
     * @tc.name          wantValidationSpaceInBundleReported
     * @tc.desc          A single space inside the bundle name is rejected.
     * @tc.precondition  A want with an embedded space exists.
     * @tc.steps         1. Build a bundle name containing a space.
     *                   2. Call validate().
     *                   3. Check the error token and ability validity.
     * @tc.expected      bundle-has-space is reported once.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationSpaceInBundleReported', 0, () => {
      const want: WantModel = new WantModel('com.example ipc', TARGET_ABILITY);
      const errors: string[] = want.validate();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('bundle-has-space');
      expect(countOf(errors, 'bundle-has-space')).assertEqual(1);
      expect(want.bundleName.indexOf(' ')).assertLarger(-1);
      expect(want.abilityName.indexOf(' ')).assertLess(0);
      expect(want.describe().indexOf(' ')).assertLarger(-1);
    });

    /**
     * @tc.name          wantValidationSpaceInAbilityReported
     * @tc.desc          A trailing space in the ability name is rejected.
     * @tc.precondition  A want with a padded ability name exists.
     * @tc.steps         1. Build abilityName 'ServiceAbility '.
     *                   2. Call validate().
     *                   3. Confirm the bundle is clean.
     * @tc.expected      ability-has-space is reported and no bundle error appears.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationSpaceInAbilityReported', 0, () => {
      const want: WantModel = new WantModel(TARGET_BUNDLE, TARGET_ABILITY + ' ');
      const errors: string[] = want.validate();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('ability-has-space');
      expect(want.abilityName.length).assertEqual(TARGET_ABILITY.length + 1);
      expect(want.abilityName.endsWith(' ')).assertTrue();
      expect(want.validate().indexOf('bundle-has-space')).assertLess(0);
      expect(want.matches(new WantModel())).assertFalse();
    });

    /**
     * @tc.name          wantValidationFourErrorsFromPaddedEmptyWant
     * @tc.desc          Spaces in both empty names surface all four error tokens.
     * @tc.precondition  A want with a single space in each field exists.
     * @tc.steps         1. Build WantModel(' ', ' ').
     *                   2. Call validate().
     *                   3. Verify every token is present.
     * @tc.expected      The list holds spaces and non-empty checks only.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationFourErrorsFromPaddedEmptyWant', 0, () => {
      const want: WantModel = new WantModel(' ', ' ');
      const errors: string[] = want.validate();
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('bundle-has-space');
      expect(errors[1]).assertEqual('ability-has-space');
      expect(want.bundleName.length).assertEqual(1);
      expect(want.abilityName.length).assertEqual(1);
      expect(errors.indexOf('bundle-empty')).assertLess(0);
      expect(errors.indexOf('ability-empty')).assertLess(0);
    });

    /**
     * @tc.name          wantValidationValidTargetHasNoErrors
     * @tc.desc          The production target want validates cleanly and matches itself.
     * @tc.precondition  SharedDriver constants are loaded.
     * @tc.steps         1. Build the target want.
     *                   2. Validate it.
     *                   3. Compare with a second instance.
     * @tc.expected      No errors are produced and identity matching succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('wantValidationValidTargetHasNoErrors', 0, () => {
      const want: WantModel = new WantModel(TARGET_BUNDLE, TARGET_ABILITY);
      const errors: string[] = want.validate();
      expect(errors.length).assertEqual(0);
      expect(joined(errors, ',')).assertEqual('');
      expect(want.matches(new WantModel())).assertTrue();
      expect(want.bundleName.indexOf(' ')).assertLess(0);
      expect(want.abilityName.indexOf(' ')).assertLess(0);
      expect(want.describe().indexOf(' ')).assertLess(0);
    });

    /**
     * @tc.name          wantValidationCaseSensitiveMatching
     * @tc.desc          Want matching is case sensitive on both fields.
     * @tc.precondition  Uppercase variants of the target names exist.
     * @tc.steps         1. Uppercase both names.
     *                   2. Compare with the target.
     *                   3. Uppercase only one field and compare again.
     * @tc.expected      Any casing difference breaks matching.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationCaseSensitiveMatching', 0, () => {
      const target: WantModel = new WantModel();
      const upper: WantModel = new WantModel(TARGET_BUNDLE.toUpperCase(), TARGET_ABILITY.toUpperCase());
      const half: WantModel = new WantModel(TARGET_BUNDLE.toUpperCase(), TARGET_ABILITY);
      expect(target.matches(upper)).assertFalse();
      expect(target.matches(half)).assertFalse();
      expect(half.matches(target)).assertFalse();
      expect(upper.bundleName).assertEqual('COM.EXAMPLE.IPC_STUB');
      expect(upper.abilityName).assertEqual('SERVICEABILITY');
      expect(half.abilityName).assertEqual(TARGET_ABILITY);
    });

    /**
     * @tc.name          wantValidationClientBundleDiffersFromTarget
     * @tc.desc          The client bundle constant is distinct from the service bundle.
     * @tc.precondition  Both bundle constants are exported.
     * @tc.steps         1. Read both constants.
     *                   2. Compare lengths and shared prefix.
     *                   3. Confirm the target want never uses the client bundle.
     * @tc.expected      The names share a prefix but differ in the last segment.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationClientBundleDiffersFromTarget', 0, () => {
      const target: WantModel = new WantModel();
      expect(CLIENT_BUNDLE === TARGET_BUNDLE).assertFalse();
      expect(CLIENT_BUNDLE.length).assertLarger(TARGET_BUNDLE.length);
      expect(CLIENT_BUNDLE.indexOf('com.example.')).assertEqual(0);
      expect(target.bundleName.indexOf(CLIENT_BUNDLE)).assertLess(0);
      expect(target.bundleName.endsWith('ipc_stub')).assertTrue();
      expect(CLIENT_BUNDLE.endsWith('ipc_client')).assertTrue();
      expect(target.validate().length).assertEqual(0);
    });

    /**
     * @tc.name          wantValidationConnectRecordsDescribeOnce
     * @tc.desc          A connect call records exactly one event with the want description.
     * @tc.precondition  A fresh ConnectionModel exists.
     * @tc.steps         1. Call connect(7).
     *                   2. Read the recorded events.
     *                   3. Compare the last entry with describe().
     * @tc.expected      One connect event carrying bundle/ability text exists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationConnectRecordsDescribeOnce', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      const started: boolean = client.connect(7);
      expect(started).assertTrue();
      expect(client.events.size()).assertEqual(1);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.events.last()).assertEqual('connect:' + TARGET_BUNDLE + '/' + TARGET_ABILITY);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.want.describe()).assertEqual(TARGET_BUNDLE + '/' + TARGET_ABILITY);
      expect(client.connectCalls).assertEqual(1);
    });

    /**
     * @tc.name          wantValidationCustomWantRoundTrip
     * @tc.desc          A custom want keeps both supplied names unchanged.
     * @tc.precondition  Custom bundle and ability literals are available.
     * @tc.steps         1. Build WantModel('com.example.custom', 'CustomAbility').
     *                   2. Read both fields.
     *                   3. Describe and split the text.
     * @tc.expected      The custom values survive construction and describe().
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('wantValidationCustomWantRoundTrip', 0, () => {
      const want: WantModel = new WantModel('com.example.custom', 'CustomAbility');
      expect(want.bundleName).assertEqual('com.example.custom');
      expect(want.abilityName).assertEqual('CustomAbility');
      expect(want.describe()).assertEqual('com.example.custom/CustomAbility');
      expect(want.validate().length).assertEqual(0);
      expect(want.matches(want)).assertTrue();
      expect(want.matches(new WantModel())).assertFalse();
      expect(want.describe().split('/').length).assertEqual(2);
    });

    /**
     * @tc.name          wantValidationUnicodeAbilityName
     * @tc.desc          Non-ASCII ability names pass validate() because no space exists.
     * @tc.precondition  A unicode ability literal is provided.
     * @tc.steps         1. Build a want with a Chinese ability name.
     *                   2. Call validate().
     *                   3. Compare with the ASCII target.
     * @tc.expected      The unicode want is clean but does not match the target.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationUnicodeAbilityName', 0, () => {
      const want: WantModel = new WantModel(TARGET_BUNDLE, '服务能力');
      expect(want.abilityName.length).assertEqual(4);
      expect(want.validate().length).assertEqual(0);
      expect(want.abilityName.indexOf(' ')).assertLess(0);
      expect(want.matches(new WantModel())).assertFalse();
      expect(want.describe()).assertEqual(TARGET_BUNDLE + '/服务能力');
      expect(want.abilityName === TARGET_ABILITY).assertFalse();
    });

    /**
     * @tc.name          wantValidationLongNamesRemainIntact
     * @tc.desc          Long dotted names are preserved and validate cleanly.
     * @tc.precondition  A repeated segment name generator is prepared.
     * @tc.steps         1. Build a long bundle by repeating a segment.
     *                   2. Build the ability from the same source.
     *                   3. Validate and measure lengths.
     * @tc.expected      Both fields keep their full length with no errors.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationLongNamesRemainIntact', 0, () => {
      const segment: string = 'com.example.long';
      const bundle: string = segment + '.' + segment + '.stub';
      const ability: string = TARGET_ABILITY + TARGET_ABILITY;
      const want: WantModel = new WantModel(bundle, ability);
      expect(want.bundleName.length).assertEqual(bundle.length);
      expect(want.abilityName.length).assertEqual(28);
      expect(want.validate().length).assertEqual(0);
      expect(want.describe().length).assertEqual(bundle.length + ability.length + 1);
      expect(want.matches(new WantModel(bundle, ability))).assertTrue();
      expect(want.bundleName.indexOf(' ')).assertLess(0);
    });

    /**
     * @tc.name          wantValidationDotOnlyBundleIsClean
     * @tc.desc          A dot-only bundle contains no spaces and no empty string.
     * @tc.precondition  A punctuation bundle literal exists.
     * @tc.steps         1. Build a want with bundle '...'.
     *                   2. Validate it.
     *                   3. Compare to the target want.
     * @tc.expected      validate() is empty although the want does not match.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationDotOnlyBundleIsClean', 0, () => {
      const want: WantModel = new WantModel('...', TARGET_ABILITY);
      expect(want.bundleName.length).assertEqual(3);
      expect(want.validate().length).assertEqual(0);
      expect(want.bundleName.indexOf(' ')).assertLess(0);
      expect(want.matches(new WantModel())).assertFalse();
      expect(want.describe()).assertEqual('.../' + TARGET_ABILITY);
      expect(countOf(want.bundleName.split(''), '.')).assertEqual(3);
    });

    /**
     * @tc.name          wantValidationValidateIsIdempotent
     * @tc.desc          Repeated validate() calls return the same ordered errors.
     * @tc.precondition  An invalid want with two defects exists.
     * @tc.steps         1. Validate once and copy the list.
     *                   2. Validate twice more.
     *                   3. Compare all lists with sameStringArray.
     * @tc.expected      Every call produces the identical error sequence.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationValidateIsIdempotent', 0, () => {
      const want: WantModel = new WantModel('com.example ipc', 'Service Ability');
      const first: string[] = want.validate();
      const second: string[] = want.validate();
      const third: string[] = want.validate();
      expect(first.length).assertEqual(2);
      expect(sameStringArray(first, second)).assertTrue();
      expect(sameStringArray(second, third)).assertTrue();
      expect(first[0]).assertEqual('bundle-has-space');
      expect(first[1]).assertEqual('ability-has-space');
      expect(want.validate().length).assertEqual(2);
    });

    /**
     * @tc.name          wantValidationErrorOrderIsStable
     * @tc.desc          Error ordering follows bundle checks before ability checks.
     * @tc.precondition  A want with an empty bundle and a spaced ability exists.
     * @tc.steps         1. Build WantModel('', 'Service Ability').
     *                   2. Validate it.
     *                   3. Compare tokens position by position.
     * @tc.expected      bundle-empty precedes ability-has-space.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationErrorOrderIsStable', 0, () => {
      const want: WantModel = new WantModel('', 'Service Ability');
      const errors: string[] = want.validate();
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('bundle-empty');
      expect(errors[1]).assertEqual('ability-has-space');
      expect(errors.indexOf('bundle-empty')).assertLess(errors.indexOf('ability-has-space'));
      expect(countOf(errors, 'ability-empty')).assertEqual(0);
      expect(joined(errors, ';')).assertEqual('bundle-empty;ability-has-space');
      expect(uniqueStrings(errors).length).assertEqual(2);
    });

    /**
     * @tc.name          wantValidationInvalidWantStillStartsConnect
     * @tc.desc          connect() validates but still enters the connecting state.
     * @tc.precondition  A client with an empty-bundle want exists.
     * @tc.steps         1. Construct ConnectionModel with an invalid want.
     *                   2. Call connect(3).
     *                   3. Inspect state, connectId and errors.
     * @tc.expected      The state is connecting and the want still reports an error.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationInvalidWantStillStartsConnect', 0, () => {
      const client: ConnectionModel = new ConnectionModel(new WantModel('', TARGET_ABILITY));
      expect(client.connect(3)).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectId).assertEqual(3);
      expect(client.want.validate().length).assertEqual(1);
      expect(client.want.validate()[0]).assertEqual('bundle-empty');
      expect(client.events.last()).assertEqual('connect:/' + TARGET_ABILITY);
      expect(client.connectCalls).assertEqual(1);
    });

    /**
     * @tc.name          wantValidationConnectKeepsWantReference
     * @tc.desc          The client stores the exact want instance handed to it.
     * @tc.precondition  A custom want instance is built before the client.
     * @tc.steps         1. Build the want and client.
     *                   2. Connect.
     *                   3. Read names back through the client.
     * @tc.expected      The stored want exposes the custom literals.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationConnectKeepsWantReference', 0, () => {
      const want: WantModel = new WantModel(CLIENT_BUNDLE, TARGET_ABILITY);
      const client: ConnectionModel = new ConnectionModel(want);
      client.connect(11);
      expect(client.want.bundleName).assertEqual(CLIENT_BUNDLE);
      expect(client.want.bundleName).assertEqual('com.example.ipc_client');
      expect(client.want.abilityName).assertEqual(TARGET_ABILITY);
      expect(client.want.matches(want)).assertTrue();
      expect(client.want.validate().length).assertEqual(0);
      expect(client.events.last().indexOf(CLIENT_BUNDLE)).assertLarger(0);
    });

    /**
     * @tc.name          wantValidationWhitespaceOnlyBundle
     * @tc.desc          A tab-only bundle has no literal space but reports nothing.
     * @tc.precondition  A want with a tab inside the bundle exists.
     * @tc.steps         1. Build a bundle containing a tab character.
     *                   2. Validate it.
     *                   3. Check character codes.
     * @tc.expected      No error token appears because only ' ' is checked.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationWhitespaceOnlyBundle', 0, () => {
      const tab: string = '\t';
      const want: WantModel = new WantModel(tab, TARGET_ABILITY);
      expect(want.bundleName.length).assertEqual(1);
      expect(want.bundleName.indexOf(' ')).assertLess(0);
      expect(want.bundleName.indexOf('\t')).assertEqual(0);
      expect(want.validate().length).assertEqual(0);
      expect(want.matches(new WantModel())).assertFalse();
      expect(want.bundleName.charCodeAt(0)).assertEqual(9);
    });

    /**
     * @tc.name          wantValidationNewlineInAbilityNotReported
     * @tc.desc          A newline in the ability name escapes the space check.
     * @tc.precondition  A want with a newline ability exists.
     * @tc.steps         1. Build abilityName 'Service\nAbility'.
     *                   2. Validate it.
     *                   3. Count the newline occurrences.
     * @tc.expected      The error list stays empty while matching fails.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationNewlineInAbilityNotReported', 0, () => {
      const want: WantModel = new WantModel(TARGET_BUNDLE, 'Service\nAbility');
      expect(want.abilityName.indexOf('\n')).assertEqual(7);
      expect(countOf(want.abilityName.split(''), '\n')).assertEqual(1);
      expect(want.validate().length).assertEqual(0);
      expect(want.abilityName.length).assertEqual(15);
      expect(want.matches(new WantModel())).assertFalse();
      expect(want.describe().indexOf('\n')).assertLarger(0);
    });

    /**
     * @tc.name          wantValidationTrailingSpaceBundle
     * @tc.desc          A trailing space in the bundle is the only detected defect.
     * @tc.precondition  A padded bundle literal exists.
     * @tc.steps         1. Build bundleName TARGET_BUNDLE + ' '.
     *                   2. Validate it.
     *                   3. Compare lengths.
     * @tc.expected      bundle-has-space appears once and the length grows by one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('wantValidationTrailingSpaceBundle', 0, () => {
      const want: WantModel = new WantModel(TARGET_BUNDLE + ' ', TARGET_ABILITY);
      const errors: string[] = want.validate();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('bundle-has-space');
      expect(want.bundleName.length).assertEqual(TARGET_BUNDLE.length + 1);
      expect(want.bundleName.endsWith(' ')).assertTrue();
      expect(want.bundleName.indexOf('com.example')).assertEqual(0);
      expect(want.matches(new WantModel())).assertFalse();
    });

    /**
     * @tc.name          wantValidationMutatedWantRevalidates
     * @tc.desc          Mutating public fields changes the next validate() result.
     * @tc.precondition  A valid want instance exists.
     * @tc.steps         1. Validate the clean want.
     *                   2. Blank the ability name.
     *                   3. Validate again.
     * @tc.expected      The first call is empty and the second reports ability-empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationMutatedWantRevalidates', 0, () => {
      const want: WantModel = new WantModel();
      const before: string[] = want.validate();
      want.abilityName = '';
      const after: string[] = want.validate();
      expect(before.length).assertEqual(0);
      expect(after.length).assertEqual(1);
      expect(after[0]).assertEqual('ability-empty');
      expect(want.describe()).assertEqual(TARGET_BUNDLE + '/');
      expect(want.matches(new WantModel())).assertFalse();
      expect(want.abilityName.length).assertEqual(0);
    });

    /**
     * @tc.name          wantValidationRenameBundleChangesMatch
     * @tc.desc          Renaming the bundle breaks matching and describe output.
     * @tc.precondition  A default want and its fingerprint are captured.
     * @tc.steps         1. Capture describe and fingerprint.
     *                   2. Set bundleName to CLIENT_BUNDLE.
     *                   3. Recapture both values.
     * @tc.expected      Matching flips to false and the fingerprint changes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationRenameBundleChangesMatch', 0, () => {
      const want: WantModel = new WantModel();
      const beforeText: string = want.describe();
      const beforeHash: number = textFingerprint(beforeText);
      want.bundleName = CLIENT_BUNDLE;
      const afterText: string = want.describe();
      const afterHash: number = textFingerprint(afterText);
      expect(want.matches(new WantModel())).assertFalse();
      expect(beforeHash === afterHash).assertFalse();
      expect(afterText).assertEqual(CLIENT_BUNDLE + '/' + TARGET_ABILITY);
      expect(afterText.indexOf('ipc_client')).assertLarger(0);
      expect(want.validate().length).assertEqual(0);
      expect(beforeText === afterText).assertFalse();
    });

    /**
     * @tc.name          wantValidationDistinctFingerprints
     * @tc.desc          Four different wants produce four different fingerprints.
     * @tc.precondition  A helper array of wants is built.
     * @tc.steps         1. Build four wants with distinct fields.
     *                   2. Compute describe fingerprints.
     *                   3. Deduplicate the numeric list as text.
     * @tc.expected      Every fingerprint is unique.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationDistinctFingerprints', 0, () => {
      const texts: string[] = [];
      const hashes: string[] = [];
      texts.push(new WantModel().describe());
      texts.push(new WantModel(CLIENT_BUNDLE, TARGET_ABILITY).describe());
      texts.push(new WantModel(TARGET_BUNDLE, STUB_DESCRIPTOR).describe());
      texts.push(new WantModel('', '').describe());
      for (let index = 0; index < texts.length; index++) {
        hashes.push(String(textFingerprint(texts[index])));
      }
      expect(uniqueStrings(texts).length).assertEqual(4);
      expect(uniqueStrings(hashes).length).assertEqual(4);
      expect(hashes.length).assertEqual(4);
      expect(hashes[0] === hashes[1]).assertFalse();
      expect(hashes[2] === hashes[3]).assertFalse();
      expect(textFingerprint(texts[0])).assertLarger(0);
    });

    /**
     * @tc.name          wantValidationSameArrayOracle
     * @tc.desc          sameStringArray reports equality for cloned error lists.
     * @tc.precondition  A want producing two errors exists.
     * @tc.steps         1. Validate and copy the list.
     *                   2. Compare the copies.
     *                   3. Push an extra token and compare again.
     * @tc.expected      The untouched copy matches and the extended copy differs.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationSameArrayOracle', 0, () => {
      const want: WantModel = new WantModel('', '');
      const errors: string[] = want.validate();
      const copy: string[] = [];
      for (let index = 0; index < errors.length; index++) {
        copy.push(errors[index]);
      }
      expect(sameStringArray(errors, copy)).assertTrue();
      copy.push('extra');
      expect(sameStringArray(errors, copy)).assertFalse();
      expect(errors.length).assertEqual(2);
      expect(copy.length).assertEqual(3);
      expect(copy[2]).assertEqual('extra');
      expect(sameStringArray(errors, [])).assertFalse();
    });

    /**
     * @tc.name          wantValidationWantSurvivesFailedState
     * @tc.desc          The stored want is unchanged after an onFailed callback.
     * @tc.precondition  A client with a default want exists.
     * @tc.steps         1. Connect and fail the connection.
     *                   2. Read the stored want.
     *                   3. Compare with a fresh target want.
     * @tc.expected      The want still matches the production target.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationWantSurvivesFailedState', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(5);
      client.onFailed(16000001);
      expect(client.state).assertEqual('failed');
      expect(client.want.matches(new WantModel())).assertTrue();
      expect(client.want.validate().length).assertEqual(0);
      expect(client.want.describe()).assertEqual(TARGET_BUNDLE + '/' + TARGET_ABILITY);
      expect(client.failedCode).assertEqual(16000001);
      expect(client.events.countOf('failed')).assertEqual(1);
    });

    /**
     * @tc.name          wantValidationMatchesIsReflexiveWhenInvalid
     * @tc.desc          matches() only compares fields, so an invalid want matches itself.
     * @tc.precondition  A want with an empty bundle exists.
     * @tc.steps         1. Build the invalid want.
     *                   2. Compare it with itself.
     *                   3. Compare with a clean target.
     * @tc.expected      Self matching is true while target matching is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationMatchesIsReflexiveWhenInvalid', 0, () => {
      const want: WantModel = new WantModel('', TARGET_ABILITY);
      expect(want.matches(want)).assertTrue();
      expect(want.matches(new WantModel())).assertFalse();
      expect(want.validate().length).assertEqual(1);
      expect(want.describe()).assertEqual('/' + TARGET_ABILITY);
      expect(want.bundleName.length).assertEqual(0);
      expect(want.abilityName).assertEqual(TARGET_ABILITY);
    });

    /**
     * @tc.name          wantValidationBundleOnlyConstructor
     * @tc.desc          Passing only a bundle keeps the default ability name.
     * @tc.precondition  The WantModel constructor defaults are known.
     * @tc.steps         1. Build WantModel(CLIENT_BUNDLE).
     *                   2. Read abilityName.
     *                   3. Validate and match.
     * @tc.expected      The ability falls back to ServiceAbility and matching fails.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationBundleOnlyConstructor', 0, () => {
      const want: WantModel = new WantModel(CLIENT_BUNDLE);
      expect(want.abilityName).assertEqual(TARGET_ABILITY);
      expect(want.abilityName).assertEqual('ServiceAbility');
      expect(want.bundleName).assertEqual(CLIENT_BUNDLE);
      expect(want.validate().length).assertEqual(0);
      expect(want.matches(new WantModel())).assertFalse();
      expect(want.describe()).assertEqual(CLIENT_BUNDLE + '/' + TARGET_ABILITY);
    });

    /**
     * @tc.name          wantValidationSlashInsideBundle
     * @tc.desc          A slash in the bundle produces more than two describe segments.
     * @tc.precondition  A bundle literal containing a slash exists.
     * @tc.steps         1. Build the slash bundle want.
     *                   2. Split describe output.
     *                   3. Validate the want.
     * @tc.expected      The split yields three parts and validate reports no error.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationSlashInsideBundle', 0, () => {
      const want: WantModel = new WantModel('com/example/ipc', TARGET_ABILITY);
      const parts: string[] = want.describe().split('/');
      expect(parts.length).assertEqual(4);
      expect(parts[0]).assertEqual('com');
      expect(parts[1]).assertEqual('example');
      expect(parts[2]).assertEqual('ipc');
      expect(parts[3]).assertEqual(TARGET_ABILITY);
      expect(want.validate().length).assertEqual(0);
      expect(countOf(want.describe().split(''), '/')).assertEqual(3);
    });

    /**
     * @tc.name          wantValidationJoinedDescribeParts
     * @tc.desc          joined() rebuilds the describe string from split parts.
     * @tc.precondition  A default want exists.
     * @tc.steps         1. Split describe on the slash.
     *                   2. Join the parts with the same separator.
     *                   3. Compare with the original.
     * @tc.expected      The rebuilt text equals the original describe output.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationJoinedDescribeParts', 0, () => {
      const want: WantModel = new WantModel();
      const text: string = want.describe();
      const parts: string[] = text.split('/');
      const rebuilt: string = joined(parts, '/');
      expect(rebuilt).assertEqual(text);
      expect(rebuilt.length).assertEqual(text.length);
      expect(parts.length).assertEqual(2);
      expect(joined(parts, '-')).assertEqual(TARGET_BUNDLE + '-' + TARGET_ABILITY);
      expect(textFingerprint(rebuilt)).assertEqual(textFingerprint(text));
      expect(joined([], '/')).assertEqual('');
    });

    /**
     * @tc.name          wantValidationStubDescriptorAsBundle
     * @tc.desc          STUB_DESCRIPTOR is a valid non-empty bundle token.
     * @tc.precondition  The stub descriptor constant is exported.
     * @tc.steps         1. Build a want whose bundle is STUB_DESCRIPTOR.
     *                   2. Validate it.
     *                   3. Compare with the target.
     * @tc.expected      The want validates cleanly yet does not match the target.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationStubDescriptorAsBundle', 0, () => {
      const want: WantModel = new WantModel(STUB_DESCRIPTOR, STUB_DESCRIPTOR);
      expect(want.bundleName).assertEqual('IPCStubTest');
      expect(want.abilityName).assertEqual('IPCStubTest');
      expect(want.validate().length).assertEqual(0);
      expect(want.matches(want)).assertTrue();
      expect(want.matches(new WantModel())).assertFalse();
      expect(want.describe()).assertEqual('IPCStubTest/IPCStubTest');
    });

    /**
     * @tc.name          wantValidationTrailingDotBundle
     * @tc.desc          A trailing dot is preserved and produces no validation error.
     * @tc.precondition  A dotted bundle literal exists.
     * @tc.steps         1. Build bundleName TARGET_BUNDLE + '.'.
     *                   2. Validate.
     *                   3. Compare lengths with the target.
     * @tc.expected      The want is clean but fails matching.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationTrailingDotBundle', 0, () => {
      const want: WantModel = new WantModel(TARGET_BUNDLE + '.', TARGET_ABILITY);
      expect(want.bundleName.endsWith('.')).assertTrue();
      expect(want.bundleName.length).assertEqual(TARGET_BUNDLE.length + 1);
      expect(want.validate().length).assertEqual(0);
      expect(want.matches(new WantModel())).assertFalse();
      expect(countOf(want.bundleName.split(''), '.')).assertEqual(3);
      expect(want.bundleName.indexOf(' ')).assertLess(0);
    });

    /**
     * @tc.name          wantValidationTwoClientsKeepSeparateWants
     * @tc.desc          Two clients built with different wants never share names.
     * @tc.precondition  Two distinct want literals exist.
     * @tc.steps         1. Build client A and client B.
     *                   2. Connect both.
     *                   3. Compare stored wants.
     * @tc.expected      Each client keeps its own want and events differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationTwoClientsKeepSeparateWants', 0, () => {
      const first: ConnectionModel = new ConnectionModel(new WantModel(TARGET_BUNDLE, TARGET_ABILITY));
      const second: ConnectionModel = new ConnectionModel(new WantModel(CLIENT_BUNDLE, 'OtherAbility'));
      first.connect(1);
      second.connect(2);
      expect(first.want.matches(second.want)).assertFalse();
      expect(first.want.bundleName).assertEqual(TARGET_BUNDLE);
      expect(second.want.bundleName).assertEqual(CLIENT_BUNDLE);
      expect(second.want.abilityName).assertEqual('OtherAbility');
      expect(first.events.trace() === second.events.trace()).assertFalse();
      expect(first.connectId === second.connectId).assertFalse();
    });

    /**
     * @tc.name          wantValidationResetKeepsWant
     * @tc.desc          ConnectionModel.reset() leaves the constructed want untouched.
     * @tc.precondition  A client with a custom want was connected.
     * @tc.steps         1. Connect with the custom want.
     *                   2. Reset the client.
     *                   3. Read the want again.
     * @tc.expected      The want keeps its literals after the reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationResetKeepsWant', 0, () => {
      const client: ConnectionModel = new ConnectionModel(new WantModel(CLIENT_BUNDLE, 'CustomAbility'));
      client.connect(9);
      client.reset();
      expect(client.want.bundleName).assertEqual(CLIENT_BUNDLE);
      expect(client.want.abilityName).assertEqual('CustomAbility');
      expect(client.want.validate().length).assertEqual(0);
      expect(client.state).assertEqual('disconnected');
      expect(client.connectId).assertEqual(-1);
      expect(client.events.size()).assertEqual(0);
    });

    /**
     * @tc.name          wantValidationMultipleSpacesSingleToken
     * @tc.desc          Several spaces in one field still yield one has-space token.
     * @tc.precondition  A bundle with three spaces exists.
     * @tc.steps         1. Build the spaced bundle want.
     *                   2. Validate it.
     *                   3. Count the token.
     * @tc.expected      bundle-has-space occurs exactly once.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationMultipleSpacesSingleToken', 0, () => {
      const want: WantModel = new WantModel('a b c d', TARGET_ABILITY);
      const errors: string[] = want.validate();
      expect(errors.length).assertEqual(1);
      expect(countOf(errors, 'bundle-has-space')).assertEqual(1);
      expect(want.bundleName.split(' ').length).assertEqual(4);
      expect(want.bundleName.length).assertEqual(7);
      expect(want.bundleName.indexOf(' ')).assertEqual(1);
      expect(want.matches(new WantModel())).assertFalse();
    });

    /**
     * @tc.name          wantValidationUnicodeBundleWithSpace
     * @tc.desc          A unicode bundle containing an ASCII space is rejected.
     * @tc.precondition  A mixed unicode bundle exists.
     * @tc.steps         1. Build bundle '例子 包名'.
     *                   2. Validate.
     *                   3. Check the error and length.
     * @tc.expected      bundle-has-space is reported once.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationUnicodeBundleWithSpace', 0, () => {
      const want: WantModel = new WantModel('例子 包名', TARGET_ABILITY);
      const errors: string[] = want.validate();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('bundle-has-space');
      expect(want.bundleName.length).assertEqual(5);
      expect(want.bundleName.indexOf(' ')).assertEqual(2);
      expect(want.abilityName).assertEqual(TARGET_ABILITY);
      expect(want.describe().indexOf('例子')).assertEqual(0);
    });

    /**
     * @tc.name          wantValidationAbilityWithDot
     * @tc.desc          A dotted ability name is accepted because no space is present.
     * @tc.precondition  A dotted ability literal exists.
     * @tc.steps         1. Build ability 'Service.Ability'.
     *                   2. Validate.
     *                   3. Compare against the target ability.
     * @tc.expected      Validation passes and matching fails on the ability field.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationAbilityWithDot', 0, () => {
      const want: WantModel = new WantModel(TARGET_BUNDLE, 'Service.Ability');
      expect(want.validate().length).assertEqual(0);
      expect(want.abilityName.length).assertEqual(15);
      expect(want.abilityName.split('.').length).assertEqual(2);
      expect(want.abilityName.split('.')[0]).assertEqual('Service');
      expect(want.matches(new WantModel())).assertFalse();
      expect(want.bundleName).assertEqual(TARGET_BUNDLE);
    });

    /**
     * @tc.name          wantValidationConnectSkipLeavesWantClean
     * @tc.desc          A rejected duplicate connect leaves the want and state intact.
     * @tc.precondition  A client already in the connecting state exists.
     * @tc.steps         1. Connect once.
     *                   2. Attempt a second connect.
     *                   3. Recheck the want and the log warning.
     * @tc.expected      The second call fails but the want is still valid.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationConnectSkipLeavesWantClean', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      expect(client.connect(1)).assertTrue();
      expect(client.connect(2)).assertFalse();
      expect(client.connectId).assertEqual(1);
      expect(client.want.validate().length).assertEqual(0);
      expect(client.want.matches(new WantModel())).assertTrue();
      expect(client.logs.contains('connect skipped')).assertTrue();
      expect(client.connectCalls).assertEqual(2);
    });

    /**
     * @tc.name          wantValidationWantAfterOnConnect
     * @tc.desc          The want survives a successful connection callback.
     * @tc.precondition  A proxy double is available through createConnectedSession.
     * @tc.steps         1. Build a connected session.
     *                   2. Read the want.
     *                   3. Verify the death recipient registration event.
     * @tc.expected      The want still matches the target after connecting.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('wantValidationWantAfterOnConnect', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      expect(client.want.matches(new WantModel())).assertTrue();
      expect(client.want.describe()).assertEqual(TARGET_BUNDLE + '/' + TARGET_ABILITY);
      expect(client.deathRecipient.registered).assertTrue();
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.connectId).assertEqual(7);
      expect(client.toasts.length).assertEqual(1);
    });

    /**
     * @tc.name          wantValidationSpacedBothFieldsTwoTokens
     * @tc.desc          Spaces in both fields produce exactly two error tokens.
     * @tc.precondition  A want with spaces in both names exists.
     * @tc.steps         1. Build the wanted pair.
     *                   2. Validate.
     *                   3. Compare with the expected joined text.
     * @tc.expected      The tokens are bundle-has-space then ability-has-space.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationSpacedBothFieldsTwoTokens', 0, () => {
      const want: WantModel = new WantModel('bundle name', 'ability name');
      const errors: string[] = want.validate();
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('bundle-has-space');
      expect(errors[1]).assertEqual('ability-has-space');
      expect(joined(errors, '|')).assertEqual('bundle-has-space|ability-has-space');
      expect(countOf(errors, 'bundle-empty')).assertEqual(0);
      expect(countOf(errors, 'ability-empty')).assertEqual(0);
      expect(uniqueStrings(errors).length).assertEqual(2);
    });

    /**
     * @tc.name          wantValidationLiteralVersusConstantBuild
     * @tc.desc          A want built from literals describes identically to the constant build.
     * @tc.precondition  Both literal strings are known.
     * @tc.steps         1. Build a want from string literals.
     *                   2. Compare with a default want.
     *                   3. Compare fingerprints.
     * @tc.expected      Both describe strings and fingerprints agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('wantValidationLiteralVersusConstantBuild', 0, () => {
      const literal: WantModel = new WantModel('com.example.ipc_stub', 'ServiceAbility');
      const constant: WantModel = new WantModel(TARGET_BUNDLE, TARGET_ABILITY);
      expect(literal.matches(constant)).assertTrue();
      expect(literal.bundleName.length).assertEqual(constant.bundleName.length);
      expect(literal.abilityName.length).assertEqual(constant.abilityName.length);
      expect(literal.describe()).assertEqual(constant.describe());
      expect(textFingerprint(literal.describe())).assertEqual(textFingerprint(constant.describe()));
      expect(literal.validate().length).assertEqual(0);
    });

    /**
     * @tc.name          wantValidationEmptyStringsFingerprint
     * @tc.desc          The all-empty want still yields a positive fingerprint.
     * @tc.precondition  A want built with two empty names exists.
     * @tc.steps         1. Build the empty want.
     *                   2. Describe it.
     *                   3. Hash the description.
     * @tc.expected      The description is a single slash and the hash is positive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationEmptyStringsFingerprint', 0, () => {
      const want: WantModel = new WantModel('', '');
      const text: string = want.describe();
      const hash: number = textFingerprint(text);
      expect(text).assertEqual('/');
      expect(text.length).assertEqual(1);
      expect(hash).assertLarger(0);
      expect(hash).assertLess(1000003);
      expect(want.validate().length).assertEqual(2);
      expect(countOf(want.describe().split(''), '/')).assertEqual(1);
    });

    /**
     * @tc.name          wantValidationTwoSessionsSameWantShape
     * @tc.desc          Two default sessions expose equal want descriptions.
     * @tc.precondition  Two connected sessions are created.
     * @tc.steps         1. Create two sessions.
     *                   2. Compare want description strings.
     *                   3. Compare event fingerprints.
     * @tc.expected      Descriptions match while event fingerprints stay stable per session.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationTwoSessionsSameWantShape', 0, () => {
      const first: ConnectionModel = new ConnectionModel();
      const second: ConnectionModel = new ConnectionModel();
      first.connect(1);
      second.connect(2);
      expect(first.want.describe()).assertEqual(second.want.describe());
      expect(first.want.matches(second.want)).assertTrue();
      expect(first.events.fingerprint()).assertEqual(second.events.fingerprint());
      expect(first.connectId === second.connectId).assertFalse();
      expect(first.want.validate().length).assertEqual(0);
      expect(second.want.validate().length).assertEqual(0);
    });

    /**
     * @tc.name          wantValidationLeadingSpaceBundle
     * @tc.desc          A leading space in the bundle is detected at index zero.
     * @tc.precondition  A padded bundle literal exists.
     * @tc.steps         1. Build bundleName ' ' + TARGET_BUNDLE.
     *                   2. Validate.
     *                   3. Check index of the space.
     * @tc.expected      bundle-has-space appears and indexOf returns zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationLeadingSpaceBundle', 0, () => {
      const want: WantModel = new WantModel(' ' + TARGET_BUNDLE, TARGET_ABILITY);
      const errors: string[] = want.validate();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('bundle-has-space');
      expect(want.bundleName.indexOf(' ')).assertEqual(0);
      expect(want.bundleName.startsWith(' ')).assertTrue();
      expect(want.bundleName.length).assertEqual(TARGET_BUNDLE.length + 1);
      expect(want.matches(new WantModel())).assertFalse();
    });

    /**
     * @tc.name          wantValidationNumericAbility
     * @tc.desc          A digits-only ability name is accepted by validate().
     * @tc.precondition  A numeric ability literal exists.
     * @tc.steps         1. Build ability '12345'.
     *                   2. Validate.
     *                   3. Check matching and describe.
     * @tc.expected      No errors appear and the want does not match the target.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationNumericAbility', 0, () => {
      const want: WantModel = new WantModel(TARGET_BUNDLE, '12345');
      expect(want.validate().length).assertEqual(0);
      expect(want.abilityName.length).assertEqual(5);
      expect(want.abilityName.charAt(0)).assertEqual('1');
      expect(want.abilityName.charAt(4)).assertEqual('5');
      expect(want.matches(new WantModel())).assertFalse();
      expect(want.describe()).assertEqual(TARGET_BUNDLE + '/12345');
    });

    /**
     * @tc.name          wantValidationMutationBackToValid
     * @tc.desc          Restoring a blanked field makes validate() clean again.
     * @tc.precondition  A want was blanked and revalidated.
     * @tc.steps         1. Build a want and blank its bundle.
     *                   2. Validate to observe the error.
     *                   3. Restore the bundle and validate again.
     * @tc.expected      The error disappears after the restore.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationMutationBackToValid', 0, () => {
      const want: WantModel = new WantModel();
      want.bundleName = '';
      expect(want.validate().length).assertEqual(1);
      expect(want.validate()[0]).assertEqual('bundle-empty');
      want.bundleName = TARGET_BUNDLE;
      expect(want.validate().length).assertEqual(0);
      expect(want.matches(new WantModel())).assertTrue();
      expect(want.describe()).assertEqual(TARGET_BUNDLE + '/' + TARGET_ABILITY);
      expect(want.bundleName.length).assertEqual(20);
    });

    /**
     * @tc.name          wantValidationReturnedListIsDisposable
     * @tc.desc          Mutating a returned error list does not affect later calls.
     * @tc.precondition  An invalid want exists.
     * @tc.steps         1. Validate and clear the returned list.
     *                   2. Validate again.
     *                   3. Compare lengths.
     * @tc.expected      The second call still reports the original errors.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationReturnedListIsDisposable', 0, () => {
      const want: WantModel = new WantModel('', TARGET_ABILITY);
      const first: string[] = want.validate();
      while (first.length > 0) {
        first.pop();
      }
      const second: string[] = want.validate();
      expect(first.length).assertEqual(0);
      expect(second.length).assertEqual(1);
      expect(second[0]).assertEqual('bundle-empty');
      expect(want.bundleName.length).assertEqual(0);
      expect(want.abilityName).assertEqual(TARGET_ABILITY);
      expect(sameStringArray(first, second)).assertFalse();
    });

    /**
     * @tc.name          wantValidationPairwiseMatchMatrix
     * @tc.desc          Four wants produce only four true pairs out of sixteen comparisons.
     * @tc.precondition  Four distinct wants are constructed.
     * @tc.steps         1. Build the four wants.
     *                   2. Compare every ordered pair.
     *                   3. Count the true results.
     * @tc.expected      Exactly the four diagonal comparisons are true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationPairwiseMatchMatrix', 0, () => {
      const wants: WantModel[] = [
        new WantModel(),
        new WantModel(CLIENT_BUNDLE, TARGET_ABILITY),
        new WantModel(TARGET_BUNDLE, STUB_DESCRIPTOR),
        new WantModel('', '')
      ];
      let trueCount: number = 0;
      for (let row = 0; row < wants.length; row++) {
        for (let column = 0; column < wants.length; column++) {
          if (wants[row].matches(wants[column])) {
            trueCount = trueCount + 1;
          }
        }
      }
      expect(trueCount).assertEqual(4);
      expect(wants.length).assertEqual(4);
      expect(wants[0].matches(wants[1])).assertFalse();
      expect(wants[2].matches(wants[3])).assertFalse();
      expect(wants[3].matches(wants[3])).assertTrue();
      expect(uniqueStrings([wants[0].describe(), wants[1].describe(), wants[2].describe(),
        wants[3].describe()]).length).assertEqual(4);
    });

    /**
     * @tc.name          wantValidationLongAbilityThreeHundred
     * @tc.desc          A three-hundred character ability name stays intact.
     * @tc.precondition  A loop-built ability name is prepared.
     * @tc.steps         1. Append TARGET_ABILITY until the length reaches 300.
     *                   2. Build the want.
     *                   3. Validate and match.
     * @tc.expected      The ability length exceeds 299 and validation passes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationLongAbilityThreeHundred', 0, () => {
      let ability: string = '';
      while (ability.length < 300) {
        ability = ability + TARGET_ABILITY;
      }
      const want: WantModel = new WantModel(TARGET_BUNDLE, ability);
      expect(ability.length).assertLarger(299);
      expect(want.abilityName.length).assertEqual(ability.length);
      expect(want.abilityName.startsWith('ServiceAbility')).assertTrue();
      expect(want.validate().length).assertEqual(0);
      expect(want.matches(new WantModel())).assertFalse();
      expect(want.describe().length).assertEqual(TARGET_BUNDLE.length + ability.length + 1);
    });

    /**
     * @tc.name          wantValidationAbilityEqualsBundle
     * @tc.desc          Identical bundle and ability tokens still match themselves.
     * @tc.precondition  A want with the same token in both fields exists.
     * @tc.steps         1. Build WantModel(token, token).
     *                   2. Validate.
     *                   3. Split describe and compare segments.
     * @tc.expected      Both describe segments are equal and validation passes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationAbilityEqualsBundle', 0, () => {
      const token: string = 'com.example.shared';
      const want: WantModel = new WantModel(token, token);
      const parts: string[] = want.describe().split('/');
      expect(want.validate().length).assertEqual(0);
      expect(parts.length).assertEqual(2);
      expect(parts[0]).assertEqual(parts[1]);
      expect(want.bundleName).assertEqual(want.abilityName);
      expect(want.matches(new WantModel(token, token))).assertTrue();
      expect(want.matches(new WantModel())).assertFalse();
    });

    /**
     * @tc.name          wantValidationUnicodeFingerprintStability
     * @tc.desc          Two unicode wants hash identically when rebuilt.
     * @tc.precondition  A unicode bundle literal is available.
     * @tc.steps         1. Build the want twice.
     *                   2. Hash both describe strings.
     *                   3. Compare with an ASCII want hash.
     * @tc.expected      Rebuilt unicode wants share a hash distinct from ASCII.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationUnicodeFingerprintStability', 0, () => {
      const first: WantModel = new WantModel('例子.包名', '能力');
      const second: WantModel = new WantModel('例子.包名', '能力');
      const ascii: WantModel = new WantModel();
      expect(textFingerprint(first.describe())).assertEqual(textFingerprint(second.describe()));
      expect(textFingerprint(first.describe()) === textFingerprint(ascii.describe())).assertFalse();
      expect(first.matches(second)).assertTrue();
      expect(first.validate().length).assertEqual(0);
      expect(first.describe().indexOf('例子')).assertEqual(0);
      expect(second.abilityName.length).assertEqual(2);
    });

    /**
     * @tc.name          wantValidationManyReconnectsAfterReset
     * @tc.desc          A reset client can connect again with the same want shape.
     * @tc.precondition  A connected client is reset twice.
     * @tc.steps         1. Connect and reset.
     *                   2. Connect and reset again.
     *                   3. Verify the final state and call count.
     * @tc.expected      Each cycle starts from connecting with a clean event log.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationManyReconnectsAfterReset', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(4);
      client.reset();
      client.connect(5);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectId).assertEqual(5);
      expect(client.events.size()).assertEqual(1);
      client.reset();
      expect(client.connectCalls).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
      expect(client.want.matches(new WantModel())).assertTrue();
    });

    /**
     * @tc.name          wantValidationTargetConstantsShape
     * @tc.desc          The target constants have the expected casing and separators.
     * @tc.precondition  SharedDriver constants are loaded.
     * @tc.steps         1. Read TARGET_BUNDLE and TARGET_ABILITY.
     *                   2. Inspect the first characters.
     *                   3. Count dots and uppercase letters.
     * @tc.expected      The bundle is lowercase dotted and the ability is PascalCase.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationTargetConstantsShape', 0, () => {
      expect(TARGET_BUNDLE).assertEqual(TARGET_BUNDLE.toLowerCase());
      expect(TARGET_BUNDLE.charAt(0)).assertEqual('c');
      expect(TARGET_ABILITY.charAt(0)).assertEqual('S');
      expect(TARGET_ABILITY).assertEqual('ServiceAbility');
      expect(countOf(TARGET_BUNDLE.split(''), '.')).assertEqual(2);
      expect(TARGET_ABILITY.indexOf('.')).assertLess(0);
      expect(TARGET_BUNDLE.indexOf('IPC')).assertLess(0);
    });

    /**
     * @tc.name          wantValidationStubDescriptorShape
     * @tc.desc          The stub descriptor is PascalCase with no separators.
     * @tc.precondition  STUB_DESCRIPTOR is exported.
     * @tc.steps         1. Read the constant.
     *                   2. Check length and characters.
     *                   3. Build a want using it.
     * @tc.expected      The descriptor has no spaces or dots.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationStubDescriptorShape', 0, () => {
      const want: WantModel = new WantModel(STUB_DESCRIPTOR, STUB_DESCRIPTOR);
      expect(STUB_DESCRIPTOR.length).assertEqual(11);
      expect(STUB_DESCRIPTOR.indexOf(' ')).assertLess(0);
      expect(STUB_DESCRIPTOR.indexOf('.')).assertLess(0);
      expect(STUB_DESCRIPTOR.charAt(0)).assertEqual('I');
      expect(want.validate().length).assertEqual(0);
      expect(want.describe()).assertEqual('IPCStubTest/IPCStubTest');
    });

    /**
     * @tc.name          wantValidationValidateAfterDeath
     * @tc.desc          The stored want stays valid after the remote proxy dies.
     * @tc.precondition  A connected session with a live proxy exists.
     * @tc.steps         1. Create the session.
     *                   2. Notify proxy death.
     *                   3. Validate the want again.
     * @tc.expected      The want is clean and the recipient counted one death.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationValidateAfterDeath', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      const proxyAliveBefore: boolean = client.proxy?.isAlive() ?? false;
      client.proxy?.notifyDeath();
      expect(proxyAliveBefore).assertTrue();
      expect(client.isConnected()).assertFalse();
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(client.want.validate().length).assertEqual(0);
      expect(client.want.matches(new WantModel())).assertTrue();
      expect(client.state).assertEqual('connected');
    });

    /**
     * @tc.name          wantValidationDescribeNeverBlank
     * @tc.desc          describe() always contains the slash separator.
     * @tc.precondition  A set of wants covers empty and full fields.
     * @tc.steps         1. Build four wants.
     *                   2. Describe each.
     *                   3. Require at least one slash.
     * @tc.expected      Every description contains a slash.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationDescribeNeverBlank', 0, () => {
      const wants: WantModel[] = [
        new WantModel(),
        new WantModel('', ''),
        new WantModel('', TARGET_ABILITY),
        new WantModel(TARGET_BUNDLE, '')
      ];
      for (let index = 0; index < wants.length; index++) {
        const text: string = wants[index].describe();
        expect(text.indexOf('/')).assertLarger(-1);
        expect(text.length).assertLarger(0);
      }
      expect(wants[1].describe()).assertEqual('/');
      expect(wants[0].describe().split('/').length).assertEqual(2);
      expect(wants[2].describe().split('/').length).assertEqual(2);
      expect(wants[3].describe().split('/').length).assertEqual(2);
    });

    /**
     * @tc.name          wantValidationErrorTokenAlphabet
     * @tc.desc          Every validation token is lowercase ASCII with dashes.
     * @tc.precondition  An invalid want produces four distinct tokens.
     * @tc.steps         1. Build a want with two empty spaced fields.
     *                   2. Collect the tokens.
     *                   3. Check each token text.
     * @tc.expected      No token contains uppercase or whitespace.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('wantValidationErrorTokenAlphabet', 0, () => {
      const errors: string[] = new WantModel(' ', ' ').validate();
      expect(errors.length).assertEqual(2);
      for (let index = 0; index < errors.length; index++) {
        expect(errors[index]).assertEqual(errors[index].toLowerCase());
        expect(errors[index].indexOf(' ')).assertLess(0);
        expect(errors[index].indexOf('-')).assertLarger(0);
      }
      expect(errors[0]).assertEqual('bundle-has-space');
      expect(errors[1]).assertEqual('ability-has-space');
      expect(joined(errors, ',')).assertEqual('bundle-has-space,ability-has-space');
    });

    /**
     * @tc.name          wantValidationCrossFieldSwap
     * @tc.desc          Swapping bundle and ability tokens breaks matching.
     * @tc.precondition  The two target tokens are known.
     * @tc.steps         1. Build the swapped want.
     *                   2. Compare with the target.
     *                   3. Check both fields.
     * @tc.expected      The swapped want does not match the production target.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('wantValidationCrossFieldSwap', 0, () => {
      const swapped: WantModel = new WantModel(TARGET_ABILITY, TARGET_BUNDLE);
      const target: WantModel = new WantModel();
      expect(swapped.matches(target)).assertFalse();
      expect(target.matches(swapped)).assertFalse();
      expect(swapped.bundleName).assertEqual('ServiceAbility');
      expect(swapped.abilityName).assertEqual(TARGET_BUNDLE);
      expect(swapped.validate().length).assertEqual(0);
      expect(swapped.describe()).assertEqual('ServiceAbility/' + TARGET_BUNDLE);
    });
  });
}
