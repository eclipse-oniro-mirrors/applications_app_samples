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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { bundle, bundleManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import {
  BACKUP_ABILITY,
  BACKUP_METADATA,
  BUNDLE_NAME,
  ENTRY_ABILITY,
  ENTRY_MODULE,
  SELF_FLAGS,
  selfBundle,
  TEST_MODULE
} from './shared/AppProbe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

// The suite only ever asks the bundle manager about names and paths that cannot exist. Every rejection therefore
// carries a documented code: 17700001 for a missing bundle, 17700003 for a missing ability, 17700024 for a missing
// metadata profile, 201 when the caller is not allowed to look at a foreign bundle. Because the test HAP does not
// declare ohos.permission.GET_BUNDLE_INFO, a device may answer foreign lookups with 201 instead of 17700001, so the
// first probe of each API family pins the one code the device really uses and every later case demands exactly that
// pinned number. Nothing is ever loosened to "a non-zero code".
const CODE_CLEAN: number = 0;
const UNTOUCHED: number = -1;
const PIN_UNSET: number = -2;
const EMPTY_LENGTH: number = 0;
const EMPTY_TEXT: string = '';
const ERR_PERMISSION_DENIED: number = 201;
const ERR_BUNDLE_NOT_FOUND: number = 17700001;
const ERR_ABILITY_NOT_FOUND: number = 17700003;
const ERR_NO_PROFILE: number = 17700024;
const VERSION_CODE: number = 1000000;
const MODULE_TOTAL_SELF: number = 2;
const PROFILE_TOTAL_ONE: number = 1;
const TABLE_TWO: number = 2;
const TABLE_THREE: number = 3;
const LENGTH_ONE: number = 1;
const LENGTH_TWO: number = 2;
const LENGTH_FOUR: number = 4;
const LENGTH_FIVE: number = 5;
const LENGTH_SIX: number = 6;
const SPACE_CODE: number = 32;
const TAB_CODE: number = 9;
const LINE_FEED_CODE: number = 10;
const NBSP_CODE: number = 0x00A0;
const ZERO_WIDTH_SPACE_CODE: number = 0x200B;
const FULL_WIDTH_DOT_CODE: number = 0x3002;
const SURROGATE_EMOJI_TOTAL: number = 2;

// segment and suffix shapes used by the near miss families
const SEGMENT_TOTAL: number = 3;
const SEGMENT_COM_CAPITAL: string = 'Com';
const SEGMENT_COM_UPPER: string = 'COM';
const SEGMENT_ARKTSGC_MIXED: string = 'ArkTSGc';
const SEGMENT_HAP: string = 'hap';
const SEGMENT_TEST: string = 'test';
const PREFIX_OHOS: string = 'ohos.';
const PREFIX_APP: string = 'app.';
const SUFFIX_DEBUG: string = '.debug';
const SUFFIX_TEST: string = '.test';
const SUFFIX_HAP: string = '.hap';
const SUFFIX_ENTRY: string = ':entry';
const MISSING_MARKER: string = '.missing';
const BUNDLE_NAME_LOWER: string = 'com.sample.arktsgc';
const WILDCARD_TEXT: string = '*';
const UNDERSCORE_CODE: number = 95;
const SLASH_CODE: number = 47;
const BACK_SLASH_CODE: number = 92;
const QUESTION_CODE: number = 63;
const LENGTH_SEVEN: number = 7;
const QUOTE_CODE: number = 34;
const BRACE_OPEN_CODE: number = 123;
const BRACE_CLOSE_CODE: number = 125;
const SEGMENT_ARKTSGC_PERCENT: string = 'ArkTSGC%';
const SEGMENT_ARKTSGC_DIGIT: string = 'ArkTSGC2';
const JSON_KEY_MARKER: string = 'bundleName';
const PREFIX_TWO_SEGMENT: string = 'com.sample.';
const SEGMENT_REPEAT_TOTAL: number = 180;
const PADDED_TRIMMED_LENGTH: number = 17;
const BITS_MAX_POSITIVE: number = 31;
const HEX_MAX_POSITIVE: string = '0x7fffffff';
const HEX_SIGN_BIT: string = '0x80000000';
const HEX_ZERO: string = '0x0';
const HEX_ALL_BITS: string = '0xffffffff';
const HEX_ALL_BUT_ONE: string = '0xfffffffe';
const BITS_ALL: number = 32;
const DOT_CODE: number = 46;
const ASCII_LIMIT: number = 127;
const SURROGATE_LOW_MIN: number = 0xD800;
const SURROGATE_LOW_MAX: number = 0xDFFF;

// name shapes
const NAME_EMPTY: string = '';
const NAME_SINGLE_SPACE: string = ' ';
const NAME_SPACE_RUN: string = '   ';
const NAME_TAB_ONLY: string = '\t';
const NAME_LINE_FEED_ONLY: string = '\n';
const NAME_LEADING_SPACE: string = ' com.sample.ArkTSGC';
const NAME_TRAILING_SPACE: string = 'com.sample.ArkTSGC ';
const NAME_PADDED_SPACES: string = '  com.sample.ArkTSGC  ';
const NAME_TAB_PADDED: string = '\tcom.sample.ArkTSGC\t';
const NAME_LINE_FEED_PADDED: string = 'com.sample.ArkTSGC\n';
const NAME_INNER_SPACE: string = 'com. sample.ArkTSGC';
const NAME_INNER_TAB: string = 'com.sample.\tArkTSGC';
const NAME_NBSP_INNER: string = 'com.sample.\u00A0ArkTSGC';
const NAME_ZERO_WIDTH_TAIL: string = 'com.sample.ArkTSGC\u200B';
const NAME_UPPER: string = 'COM.SAMPLE.ARKTSGC';
const NAME_LOWER: string = 'com.sample.arktsgc';
const NAME_FIRST_UPPER: string = 'Com.sample.ArkTSGC';
const NAME_LAST_LOWER: string = 'com.sample.ArkTSGc';
const NAME_SWAPPED_CASE: string = 'COM.SAMPLE.arktsgc';
const NAME_MIXED_CASE: string = 'cOm.SaMpLe.ArKtSgC';
const NAME_UPPER_FIRST_SEGMENT: string = 'COM.sample.ArkTSGC';
const NAME_UPPER_TWO_SEGMENT: string = 'COM.SAMPLE';
const NAME_DOUBLE_DOT: string = 'com..sample.ArkTSGC';
const NAME_TRAILING_DOT: string = 'com.sample.ArkTSGC.';
const NAME_LEADING_DOT: string = '.com.sample.ArkTSGC';
const NAME_DOT_ONLY: string = '.';
const NAME_TRIPLE_DOT: string = '...';
const NAME_FOUR_SEGMENT: string = 'com.sample.ArkTSGC.extra';
const NAME_TRUNCATED_SEGMENT: string = 'com.sample.ArkTSG';
const NAME_TWO_SEGMENT: string = 'com.sample';
const NAME_ONE_SEGMENT: string = 'ArkTSGC';
const NAME_NO_DOT: string = 'comsampleArkTSGC';
const NAME_PREFIX_OHOS: string = 'ohos.com.sample.ArkTSGC';
const NAME_PREFIX_APP: string = 'app.com.sample.ArkTSGC';
const NAME_SUFFIX_DEBUG: string = 'com.sample.ArkTSGC.debug';
const NAME_SUFFIX_TEST: string = 'com.sample.ArkTSGC.test';
const NAME_SUFFIX_HAP: string = 'com.sample.ArkTSGC.hap';
const NAME_SUFFIX_VERSION: string = 'com.sample.ArkTSGC@1.0.0';
const NAME_SUFFIX_COLON: string = 'com.sample.ArkTSGC:entry';
const NAME_SUFFIX_SEMICOLON: string = 'com.sample.ArkTSGC;entry';
const NAME_HYPHEN: string = 'com.sample-ArkTSGC';
const NAME_UNDERSCORE: string = 'com.sample.ArkTSGC_entry';
const NAME_SLASH: string = 'com/sample/ArkTSGC';
const NAME_BACK_SLASH: string = 'com\\sample\\ArkTSGC';
const NAME_STAR: string = 'com.sample.*';
const NAME_QUESTION: string = 'com.sample.ArkTSG?';
const NAME_PERCENT: string = 'com.sample.ArkTSGC%';
const NAME_QUOTED: string = '"com.sample.ArkTSGC"';
const NAME_BRACED: string = '{com.sample.ArkTSGC}';
const NAME_JSON: string = '{"bundleName":"com.sample.ArkTSGC"}';
const NAME_REVERSED: string = 'ArkTSGC.sample.com';
const NAME_DIGIT_TAIL: string = 'com.sample.ArkTSGC2';
const NAME_DIGITS_ONLY: string = '12345';
const NAME_SINGLE_CHAR: string = 'c';
const NAME_CYRILLIC_TAIL: string = 'com.sample.ArkTSG\u0421';
const NAME_GREEK_HEAD: string = 'com.sample.\u0391rkTSGC';
const NAME_ACCENT_HEAD: string = 'com.sample.\u00C1rkTSGC';
const NAME_FULL_WIDTH_DOT: string = 'com\u3002sample\u3002ArkTSGC';
const NAME_EMOJI_TAIL: string = 'com.sample.ArkTSGC\uD83D\uDE00';
const NAME_LONE_SURROGATE: string = 'com.sample.\uDE00ArkTSGC';
const NAME_COMBINING_MARK: string = 'com.sample.Ar\u0301kTSGC';
const NAME_ARABIC_HEAD: string = 'com.sample.\u0627rkTSGC';
const NAME_LONG_SEGMENT: string = 'com.sample.' + 'a'.repeat(180);
const NAME_ABSENT_PLAIN: string = 'com.sample.absent.bundle';
const NAME_ABSENT_ALT: string = 'com.sample.ArkTSGC.notinstalled';
const NAME_ABSENT_SYNC: string = 'com.absent.sync.bundle';
const NAME_ABSENT_FIRST: string = 'com.absent.first.bundle';
const NAME_ABSENT_SECOND: string = 'com.absent.second.bundle';
const NAME_PIN_LOOKUP: string = 'com.sample.ArkTSGC.absent.pin';
const NAME_PIN_LEGACY: string = 'com.sample.ArkTSGC.absent.legacy';
const NAME_ABSENT_DOUBLE_DOT: string = 'com..absent..bundle';
const NAME_ABSENT_TRAILING_DOT: string = 'com.absent.bundle.';
const NAME_ABSENT_PADDED: string = ' com.absent.bundle ';
const NAME_ABSENT_TAB: string = 'com.absent\tbundle';
const NAME_MISSING_ABILITY: string = 'MissingAbility';
const NAME_ABILITY_LOWER: string = 'entryability';
const NAME_ABILITY_MODULE_PREFIX: string = 'entry.EntryAbility';
const NAME_ABILITY_SPACED: string = 'EntryAbility ';
const NAME_ABILITY_TRUNCATED: string = 'EntryAbilit';
const NAME_ABILITY_CYRILLIC: string = 'EntryAbilit\u0443';
const NAME_BACKUP_MISSING: string = 'EntryBackupAbilit';
const NAME_MODULE_MISSING: string = 'entry_missing';
const NAME_MODULE_SPACED: string = 'entry ';
const NAME_METADATA_MISSING: string = 'ohos.extension.missing';

// archive paths
const PATH_EMPTY: string = '';
const PATH_PIN_ARCHIVE: string = '/data/storage/el2/base/haps/absent/absent_pin.hap';
const PATH_ABSENT_MODULE: string = '/data/storage/el2/base/haps/absent/absent.hap';
const PATH_RELATIVE: string = 'absent_module.hap';
const PATH_TRAVERSAL: string = '/data/storage/el2/base/haps/../../etc/absent.hap';
const PATH_NO_EXTENSION: string = '/data/storage/el2/base/haps';
const PATH_TEXT_FILE: string = '/data/storage/el2/base/files/absent.txt';
const PATH_SPACED: string = ' /tmp/absent module.hap ';
const PATH_DEEP: string = '/data/storage/el2/base/haps/entry/entry.hap';
const PATH_DOT_ONLY: string = '.';
const PATH_DIRECTORY: string = '/data/storage/el2/base/haps/absent/';
const SUFFIX_TEXT: string = '.txt';
const TRAVERSAL_MARKER: string = '..';
const DATA_STORAGE_PREFIX: string = '/data/storage';

// bundle flags, including values the API never defines
const FLAG_ZERO: number = 0;
const FLAG_NEG_ONE: number = -1;
const FLAG_NEG_TWO: number = -2;
const FLAG_MAX_POSITIVE: number = 0x7FFFFFFF;
const FLAG_SIGN_BIT: number = 0x80000000;
const FLAG_UNKNOWN_BIT: number = 0x1000;

const DEFAULT_FLAGS: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT;
const APP_FLAGS: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
const MODULE_FLAGS: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;

class BundleProbe {
  code: number = CODE_CLEAN;
  returned: boolean = false;
  name: string = EMPTY_TEXT;
  moduleTotal: number = UNTOUCHED;
  versionCode: number = UNTOUCHED;
}

class AppInfoProbe {
  code: number = CODE_CLEAN;
  returned: boolean = false;
  name: string = EMPTY_TEXT;
  uidValue: number = UNTOUCHED;
}

class AbilityProbe {
  code: number = CODE_CLEAN;
  returned: boolean = false;
  name: string = EMPTY_TEXT;
  moduleName: string = EMPTY_TEXT;
}

class ArchiveProbe {
  code: number = CODE_CLEAN;
  returned: boolean = false;
  name: string = EMPTY_TEXT;
  moduleTotal: number = UNTOUCHED;
}

class ProfileProbe {
  code: number = CODE_CLEAN;
  returned: boolean = false;
  total: number = UNTOUCHED;
  firstLength: number = UNTOUCHED;
}

let lookupPin: number = PIN_UNSET;
let legacyPin: number = PIN_UNSET;
let archivePin: number = PIN_UNSET;

async function bundleProbeAsync(name: string, flags: number): Promise<BundleProbe> {
  const probe: BundleProbe = new BundleProbe();
  try {
    const info: bundleManager.BundleInfo = await bundleManager.getBundleInfo(name, flags);
    probe.returned = true;
    probe.name = info.name;
    probe.moduleTotal = info.hapModulesInfo.length;
    probe.versionCode = info.versionCode;
  } catch (error) {
    probe.code = Number((error as BusinessError).code);
  }
  return probe;
}

function bundleProbeSync(name: string, flags: number): BundleProbe {
  const probe: BundleProbe = new BundleProbe();
  try {
    const info: bundleManager.BundleInfo = bundleManager.getBundleInfoSync(name, flags);
    probe.returned = true;
    probe.name = info.name;
    probe.moduleTotal = info.hapModulesInfo.length;
    probe.versionCode = info.versionCode;
  } catch (error) {
    probe.code = Number((error as BusinessError).code);
  }
  return probe;
}

async function legacyBundleProbe(name: string, flags: number): Promise<BundleProbe> {
  const probe: BundleProbe = new BundleProbe();
  try {
    const info = await bundle.getBundleInfo(name, flags);
    probe.returned = true;
    probe.name = info.name;
    probe.moduleTotal = info.hapModuleInfos.length;
    probe.versionCode = info.versionCode;
  } catch (error) {
    probe.code = Number((error as BusinessError).code);
  }
  return probe;
}

async function legacyAppProbe(name: string, flags: number): Promise<AppInfoProbe> {
  const probe: AppInfoProbe = new AppInfoProbe();
  try {
    const info = await bundle.getApplicationInfo(name, flags);
    probe.returned = true;
    probe.name = info.name;
    probe.uidValue = info.uid;
  } catch (error) {
    probe.code = Number((error as BusinessError).code);
  }
  return probe;
}

async function legacyAbilityProbe(bundleName: string, abilityName: string): Promise<AbilityProbe> {
  const probe: AbilityProbe = new AbilityProbe();
  try {
    const info = await bundle.getAbilityInfo(bundleName, abilityName);
    probe.returned = true;
    probe.name = info.name;
    probe.moduleName = info.moduleName;
  } catch (error) {
    probe.code = Number((error as BusinessError).code);
  }
  return probe;
}

async function archiveProbe(path: string, flags: number): Promise<ArchiveProbe> {
  const probe: ArchiveProbe = new ArchiveProbe();
  try {
    const info = await bundle.getBundleArchiveInfo(path, flags);
    probe.returned = true;
    probe.name = info.name;
    probe.moduleTotal = info.hapModuleInfos.length;
  } catch (error) {
    probe.code = Number((error as BusinessError).code);
  }
  return probe;
}

function abilityProfileProbe(moduleName: string, abilityName: string, metadataName: string): ProfileProbe {
  const probe: ProfileProbe = new ProfileProbe();
  try {
    const profiles: string[] = bundleManager.getProfileByAbilitySync(moduleName, abilityName, metadataName);
    probe.returned = true;
    probe.total = profiles.length;
    probe.firstLength = profiles.length > EMPTY_LENGTH ? profiles[0].length : EMPTY_LENGTH;
  } catch (error) {
    probe.code = Number((error as BusinessError).code);
  }
  return probe;
}

function extensionProfileProbe(moduleName: string, extensionName: string, metadataName: string): ProfileProbe {
  const probe: ProfileProbe = new ProfileProbe();
  try {
    const profiles: string[] =
      bundleManager.getProfileByExtensionAbilitySync(moduleName, extensionName, metadataName);
    probe.returned = true;
    probe.total = profiles.length;
    probe.firstLength = profiles.length > EMPTY_LENGTH ? profiles[0].length : EMPTY_LENGTH;
  } catch (error) {
    probe.code = Number((error as BusinessError).code);
  }
  return probe;
}

async function pinLookup(): Promise<number> {
  if (lookupPin === PIN_UNSET) {
    const probe: BundleProbe = await bundleProbeAsync(NAME_PIN_LOOKUP, DEFAULT_FLAGS);
    lookupPin = probe.code;
  }
  return lookupPin;
}

async function pinLegacy(): Promise<number> {
  if (legacyPin === PIN_UNSET) {
    const probe: BundleProbe = await legacyBundleProbe(NAME_PIN_LEGACY, DEFAULT_FLAGS);
    legacyPin = probe.code;
  }
  return legacyPin;
}

async function pinArchive(): Promise<number> {
  if (archivePin === PIN_UNSET) {
    const probe: ArchiveProbe = await archiveProbe(PATH_PIN_ARCHIVE, DEFAULT_FLAGS);
    archivePin = probe.code;
  }
  return archivePin;
}

function isDocumentedLookupRejection(code: number): boolean {
  return code === ERR_BUNDLE_NOT_FOUND || code === ERR_PERMISSION_DENIED;
}

function selfIntact(): boolean {
  const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(SELF_FLAGS);
  const named: bundleManager.HapModuleInfo | undefined =
    info.hapModulesInfo.find((item: bundleManager.HapModuleInfo) => item.name === ENTRY_MODULE);
  if (named === undefined || named.abilitiesInfo.length === EMPTY_LENGTH) {
    return false;
  }
  return info.name === BUNDLE_NAME && info.versionCode === VERSION_CODE &&
    named.abilitiesInfo[0].name === ENTRY_ABILITY;
}

function selfModuleTotal(): number {
  return bundleManager.getBundleInfoForSelfSync(SELF_FLAGS).hapModulesInfo.length;
}

function selfVersionCode(): number {
  return bundleManager.getBundleInfoForSelfSync(SELF_FLAGS).versionCode;
}

function selfMainAbility(): string {
  const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(SELF_FLAGS);
  const named: bundleManager.HapModuleInfo | undefined =
    info.hapModulesInfo.find((item: bundleManager.HapModuleInfo) => item.name === ENTRY_MODULE);
  return named === undefined || named.abilitiesInfo.length === EMPTY_LENGTH ? EMPTY_TEXT :
    named.abilitiesInfo[0].name;
}

function dotTotal(text: string): number {
  let total: number = 0;
  for (let index: number = 0; index < text.length; index++) {
    if (text.charCodeAt(index) === DOT_CODE) {
      total += 1;
    }
  }
  return total;
}

function segmentTotal(text: string): number {
  return text.split('.').length;
}

function firstSegment(text: string): string {
  return text.split('.')[0];
}

function lastSegment(text: string): string {
  const parts: string[] = text.split('.');
  return parts[parts.length - 1];
}

function hasEmptySegment(text: string): boolean {
  return text.split('.').some((part: string) => part.length === EMPTY_LENGTH);
}

function isAsciiOnly(text: string): boolean {
  for (let index: number = 0; index < text.length; index++) {
    if (text.charCodeAt(index) > ASCII_LIMIT) {
      return false;
    }
  }
  return true;
}

function hasCodeUnit(text: string, unit: number): boolean {
  for (let index: number = 0; index < text.length; index++) {
    if (text.charCodeAt(index) === unit) {
      return true;
    }
  }
  return false;
}

function surrogateTotal(text: string): number {
  let total: number = 0;
  for (let index: number = 0; index < text.length; index++) {
    if (text.charCodeAt(index) >= SURROGATE_LOW_MIN && text.charCodeAt(index) <= SURROGATE_LOW_MAX) {
      total += 1;
    }
  }
  return total;
}

function charCodeSum(text: string): number {
  let total: number = 0;
  for (let index: number = 0; index < text.length; index++) {
    total += text.charCodeAt(index);
  }
  return total;
}

function trimTotal(text: string): number {
  return text.trim().length;
}

function trimsToBundle(text: string): boolean {
  return text.trim() === BUNDLE_NAME;
}

function trimsTo(text: string, expected: string): boolean {
  return text.trim() === expected;
}

function containsText(text: string, part: string): boolean {
  return text.indexOf(part) >= EMPTY_LENGTH;
}

function pathSegmentTotal(path: string): number {
  return path.split('/').length;
}

function lowersToBundle(text: string): boolean {
  return text.toLowerCase() === BUNDLE_NAME.toLowerCase();
}

function startsWithBundle(text: string): boolean {
  return text.startsWith(BUNDLE_NAME);
}

function startsWithPart(text: string, prefix: string): boolean {
  return text.substring(0, prefix.length) === prefix;
}

function endsWithBundle(text: string): boolean {
  return text.endsWith(BUNDLE_NAME);
}

function containsBundle(text: string): boolean {
  return text.indexOf(BUNDLE_NAME) >= EMPTY_LENGTH;
}

function indexOfPart(text: string, part: string): number {
  return text.indexOf(part);
}

function isUpperOnly(text: string): boolean {
  return text === text.toUpperCase() && text !== text.toLowerCase();
}

function editDistance(left: string, right: string): number {
  let previous: number[] = [];
  for (let column: number = 0; column <= right.length; column++) {
    previous.push(column);
  }
  for (let row: number = 1; row <= left.length; row++) {
    const current: number[] = [row];
    for (let column: number = 1; column <= right.length; column++) {
      const cost: number = left.charCodeAt(row - 1) === right.charCodeAt(column - 1) ? 0 : 1;
      const deletion: number = previous[column] + 1;
      const insertion: number = current[column - 1] + 1;
      const substitution: number = previous[column - 1] + cost;
      let best: number = deletion < insertion ? deletion : insertion;
      if (substitution < best) {
        best = substitution;
      }
      current.push(best);
    }
    previous = current;
  }
  return previous[right.length];
}

function bitTotal(value: number): number {
  let bits: number = 0;
  let rest: number = value >>> 0;
  while (rest > 0) {
    bits += rest & 1;
    rest = rest >>> 1;
  }
  return bits;
}

function unsignedHex(value: number): string {
  return '0x' + (value >>> 0).toString(16);
}

function allRejected(codes: number[], expected: number): boolean {
  return codes.length > EMPTY_LENGTH && codes.every((code: number) => code === expected);
}

function rejectedTotal(codes: number[], expected: number): number {
  return codes.filter((code: number) => code === expected).length;
}

function distinctTotal(values: string[]): number {
  const seen: string[] = [];
  values.forEach((value: string) => {
    if (seen.indexOf(value) < EMPTY_LENGTH) {
      seen.push(value);
    }
  });
  return seen.length;
}

export default function bundleErrorMatrixTest() {
  describe('BundleErrorMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_0100
     * @tc.name      testLookupProbeEstablishBaseline0001
     * @tc.desc      Ask for one plainly missing bundle name, pin the rejection code this device answers with and check
     *               the caller bundle is still fully readable afterwards
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLookupProbeEstablishBaseline0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_ABSENT_PLAIN, DEFAULT_FLAGS);
      const pinned: number = await pinLookup();
      logCase('testLookupProbeEstablishBaseline0001', `name=${NAME_ABSENT_PLAIN} code=${probe.code} ` +
        `pinned=${pinned} documented=${isDocumentedLookupRejection(probe.code)} returned=${probe.returned}`);
      expect(probe.returned).assertFalse();
      expect(probe.code).assertEqual(pinned);
      expect(probe.code === CODE_CLEAN).assertFalse();
      expect(isDocumentedLookupRejection(probe.code)).assertTrue();
      expect(probe.moduleTotal).assertEqual(UNTOUCHED);
      expect(selfIntact()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_0200
     * @tc.name      testLookupMissingNameLeavesNoPayload0002
     * @tc.desc      Query a second missing name and check the rejected probe exposes no name, no module list and no
     *               version instead of a half filled record
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLookupMissingNameLeavesNoPayload0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_ABSENT_ALT, DEFAULT_FLAGS);
      logCase('testLookupMissingNameLeavesNoPayload0002', `name=${NAME_ABSENT_ALT} code=${probe.code} ` +
        `payloadName=${probe.name} versionCode=${probe.versionCode}`);
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
      expect(probe.name).assertEqual(EMPTY_TEXT);
      expect(probe.versionCode).assertEqual(UNTOUCHED);
      expect(selfModuleTotal()).assertEqual(MODULE_TOTAL_SELF);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_0300
     * @tc.name      testLookupSyncMatchesAsyncVerdict0003
     * @tc.desc      Send one missing name through both the promise and the synchronous bundle manager entry points and
     *               check the two verdicts are the same number
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLookupSyncMatchesAsyncVerdict0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const asyncProbe: BundleProbe = await bundleProbeAsync(NAME_ABSENT_SYNC, DEFAULT_FLAGS);
      const syncProbe: BundleProbe = bundleProbeSync(NAME_ABSENT_SYNC, DEFAULT_FLAGS);
      logCase('testLookupSyncMatchesAsyncVerdict0003', `name=${NAME_ABSENT_SYNC} async=${asyncProbe.code} ` +
        `sync=${syncProbe.code} syncReturned=${syncProbe.returned}`);
      expect(asyncProbe.code).assertEqual(syncProbe.code);
      expect(syncProbe.code).assertEqual(await pinLookup());
      expect(asyncProbe.returned).assertFalse();
      expect(syncProbe.returned).assertFalse();
      expect(syncProbe.moduleTotal).assertEqual(UNTOUCHED);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_0400
     * @tc.name      testLookupTwoNamesShareVerdict0004
     * @tc.desc      Query two different missing names synchronously and check both carry the pinned code while the
     *               inputs really are two distinct strings
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLookupTwoNamesShareVerdict0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = [NAME_ABSENT_FIRST, NAME_ABSENT_SECOND];
      const first: BundleProbe = bundleProbeSync(NAME_ABSENT_FIRST, DEFAULT_FLAGS);
      const second: BundleProbe = bundleProbeSync(NAME_ABSENT_SECOND, DEFAULT_FLAGS);
      logCase('testLookupTwoNamesShareVerdict0004', `names=${names.join('|')} first=${first.code} ` +
        `second=${second.code} distinct=${distinctTotal(names)}`);
      expect(distinctTotal(names)).assertEqual(TABLE_TWO);
      expect(first.code).assertEqual(second.code);
      expect(first.code).assertEqual(await pinLookup());
      expect(first.returned).assertFalse();
      expect(second.returned).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_0500
     * @tc.name      testBundleNameEmptyRejected0005
     * @tc.desc      Ask for the empty bundle name and check the empty string is a real input that is rejected without
     *               touching the version of the caller bundle
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleNameEmptyRejected0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_EMPTY, DEFAULT_FLAGS);
      logCase('testBundleNameEmptyRejected0005', `length=${NAME_EMPTY.length} code=${probe.code} ` +
        `returned=${probe.returned} selfVersion=${selfVersionCode()}`);
      expect(NAME_EMPTY.length).assertEqual(EMPTY_LENGTH);
      expect(probe.returned).assertFalse();
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.code === CODE_CLEAN).assertFalse();
      expect(selfVersionCode()).assertEqual(VERSION_CODE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_0600
     * @tc.name      testBundleNameSingleSpace0006
     * @tc.desc      Ask for one space, which trims to the empty string, and check it is rejected and yields no module
     *               list
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleNameSingleSpace0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_SINGLE_SPACE, DEFAULT_FLAGS);
      logCase('testBundleNameSingleSpace0006', `trimmedLength=${trimTotal(NAME_SINGLE_SPACE)} code=${probe.code} ` +
        `moduleTotal=${probe.moduleTotal}`);
      expect(trimTotal(NAME_SINGLE_SPACE)).assertEqual(EMPTY_LENGTH);
      expect(NAME_SINGLE_SPACE.length).assertEqual(LENGTH_ONE);
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
      expect(probe.moduleTotal).assertEqual(UNTOUCHED);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_0700
     * @tc.name      testBundleNameSpaceRun0007
     * @tc.desc      Ask for a run of three spaces and check the sync entry point reports the same rejection although
     *               the input is three code units long
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleNameSpaceRun0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const syncProbe: BundleProbe = bundleProbeSync(NAME_SPACE_RUN, DEFAULT_FLAGS);
      logCase('testBundleNameSpaceRun0007', `length=${NAME_SPACE_RUN.length} ` +
        `trimmed=${trimTotal(NAME_SPACE_RUN)} code=${syncProbe.code} dotTotal=${dotTotal(NAME_SPACE_RUN)}`);
      expect(NAME_SPACE_RUN.length).assertEqual(TABLE_THREE);
      expect(trimTotal(NAME_SPACE_RUN)).assertEqual(EMPTY_LENGTH);
      expect(dotTotal(NAME_SPACE_RUN)).assertEqual(EMPTY_LENGTH);
      expect(syncProbe.code).assertEqual(await pinLookup());
      expect(syncProbe.returned).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_0800
     * @tc.name      testBundleNameTabOnly0008
     * @tc.desc      Ask for a lone tab character and check the rejection while the tab code point proves the input is
     *               not just a renamed empty string
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleNameTabOnly0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_TAB_ONLY, DEFAULT_FLAGS);
      logCase('testBundleNameTabOnly0008', `firstCode=${NAME_TAB_ONLY.charCodeAt(0)} code=${probe.code} ` +
        `returned=${probe.returned}`);
      expect(NAME_TAB_ONLY.charCodeAt(0)).assertEqual(TAB_CODE);
      expect(hasCodeUnit(NAME_TAB_ONLY, TAB_CODE)).assertTrue();
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
      expect(selfIntact()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_0900
     * @tc.name      testBundleNameLineFeedOnly0009
     * @tc.desc      Ask for a lone line feed and check both entry points reject it while the caller ability name is
     *               still readable
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleNameLineFeedOnly0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const asyncProbe: BundleProbe = await bundleProbeAsync(NAME_LINE_FEED_ONLY, DEFAULT_FLAGS);
      const syncProbe: BundleProbe = bundleProbeSync(NAME_LINE_FEED_ONLY, DEFAULT_FLAGS);
      logCase('testBundleNameLineFeedOnly0009', `code=${asyncProbe.code} sync=${syncProbe.code} ` +
        `mainAbility=${selfMainAbility()}`);
      expect(hasCodeUnit(NAME_LINE_FEED_ONLY, LINE_FEED_CODE)).assertTrue();
      expect(asyncProbe.code).assertEqual(syncProbe.code);
      expect(asyncProbe.code).assertEqual(await pinLookup());
      expect(syncProbe.returned).assertFalse();
      expect(selfMainAbility()).assertEqual(ENTRY_ABILITY);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_1000
     * @tc.name      testBundleNameTabPadded0010
     * @tc.desc      Ask for the real bundle name wrapped in tabs and check the wrapper is not trimmed by the bundle
     *               manager, so the lookup fails although trim() recovers the exact name
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleNameTabPadded0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_TAB_PADDED, DEFAULT_FLAGS);
      logCase('testBundleNameTabPadded0010', `length=${NAME_TAB_PADDED.length} trims=${trimsToBundle(NAME_TAB_PADDED)} ` +
        `code=${probe.code} returned=${probe.returned}`);
      expect(trimsToBundle(NAME_TAB_PADDED)).assertTrue();
      expect(NAME_TAB_PADDED.length).assertEqual(BUNDLE_NAME.length + LENGTH_TWO);
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
      expect(probe.moduleTotal).assertEqual(UNTOUCHED);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_1100
     * @tc.name      testBundleNameUpperCaseRejected0011
     * @tc.desc      Ask for the fully upper cased bundle name and check that only the case differs while the lookup is
     *               still rejected
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleNameUpperCaseRejected0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_UPPER, DEFAULT_FLAGS);
      logCase('testBundleNameUpperCaseRejected0011', `code=${probe.code} lowers=${lowersToBundle(NAME_UPPER)} ` +
        `upperSum=${charCodeSum(NAME_UPPER)} bundleSum=${charCodeSum(BUNDLE_NAME)}`);
      expect(lowersToBundle(NAME_UPPER)).assertTrue();
      expect(isUpperOnly(NAME_UPPER)).assertTrue();
      expect(charCodeSum(NAME_UPPER) < charCodeSum(BUNDLE_NAME)).assertTrue();
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_1200
     * @tc.name      testBundleNameLowerCaseRejected0012
     * @tc.desc      Ask for the fully lower cased bundle name through the synchronous entry point and check the
     *               rejected probe keeps an empty name
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleNameLowerCaseRejected0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const syncProbe: BundleProbe = bundleProbeSync(NAME_LOWER, DEFAULT_FLAGS);
      logCase('testBundleNameLowerCaseRejected0012', `code=${syncProbe.code} payloadName=${syncProbe.name} ` +
        `returned=${syncProbe.returned}`);
      expect(NAME_LOWER).assertEqual(BUNDLE_NAME.toLowerCase());
      expect(lowersToBundle(NAME_LOWER)).assertTrue();
      expect(syncProbe.code).assertEqual(await pinLookup());
      expect(syncProbe.returned).assertFalse();
      expect(syncProbe.name).assertEqual(EMPTY_TEXT);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_1300
     * @tc.name      testBundleNameFirstSegmentCapital0013
     * @tc.desc      Capitalise only the first segment of the bundle name and check the single character distance as
     *               well as the rejection
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleNameFirstSegmentCapital0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_FIRST_UPPER, DEFAULT_FLAGS);
      logCase('testBundleNameFirstSegmentCapital0013', `first=${firstSegment(NAME_FIRST_UPPER)} ` +
        `segments=${segmentTotal(NAME_FIRST_UPPER)} distance=${editDistance(NAME_FIRST_UPPER, BUNDLE_NAME)}`);
      expect(firstSegment(NAME_FIRST_UPPER)).assertEqual(SEGMENT_COM_CAPITAL);
      expect(segmentTotal(NAME_FIRST_UPPER)).assertEqual(SEGMENT_TOTAL);
      expect(editDistance(NAME_FIRST_UPPER, BUNDLE_NAME)).assertEqual(LENGTH_ONE);
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_1400
     * @tc.name      testBundleNameLastCharacterLower0014
     * @tc.desc      Lower the very last character of the bundle name and check the last segment and the single edit
     *               distance before the rejection is verified
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleNameLastCharacterLower0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_LAST_LOWER, DEFAULT_FLAGS);
      logCase('testBundleNameLastCharacterLower0014', `last=${lastSegment(NAME_LAST_LOWER)} ` +
        `distance=${editDistance(NAME_LAST_LOWER, BUNDLE_NAME)} code=${probe.code}`);
      expect(lastSegment(NAME_LAST_LOWER)).assertEqual(SEGMENT_ARKTSGC_MIXED);
      expect(editDistance(NAME_LAST_LOWER, BUNDLE_NAME)).assertEqual(LENGTH_ONE);
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
      expect(probe.moduleTotal).assertEqual(UNTOUCHED);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_1500
     * @tc.name      testBundleNameCaseSwapped0015
     * @tc.desc      Swap the case of both halves of the bundle name and compare its edit distance with the much
     *               closer first segment variant while checking the rejection
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleNameCaseSwapped0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_SWAPPED_CASE, DEFAULT_FLAGS);
      const swappedDistance: number = editDistance(NAME_SWAPPED_CASE, BUNDLE_NAME);
      const capitalDistance: number = editDistance(NAME_FIRST_UPPER, BUNDLE_NAME);
      logCase('testBundleNameCaseSwapped0015', `swapped=${swappedDistance} capital=${capitalDistance} ` +
        `code=${probe.code} lowers=${lowersToBundle(NAME_SWAPPED_CASE)}`);
      expect(lowersToBundle(NAME_SWAPPED_CASE)).assertTrue();
      expect(swappedDistance > capitalDistance).assertTrue();
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
      expect(selfIntact()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_1600
     * @tc.name      testBundleNameMixedCase0016
     * @tc.desc      Use a name whose case changes at every segment and check both entry points agree on the rejection
     *               while the character sum differs from the genuine name
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleNameMixedCase0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const asyncProbe: BundleProbe = await bundleProbeAsync(NAME_MIXED_CASE, DEFAULT_FLAGS);
      const syncProbe: BundleProbe = bundleProbeSync(NAME_MIXED_CASE, DEFAULT_FLAGS);
      logCase('testBundleNameMixedCase0016', `async=${asyncProbe.code} sync=${syncProbe.code} ` +
        `sum=${charCodeSum(NAME_MIXED_CASE)} bundleSum=${charCodeSum(BUNDLE_NAME)}`);
      expect(lowersToBundle(NAME_MIXED_CASE)).assertTrue();
      expect(charCodeSum(NAME_MIXED_CASE) !== charCodeSum(BUNDLE_NAME)).assertTrue();
      expect(asyncProbe.code).assertEqual(syncProbe.code);
      expect(asyncProbe.code).assertEqual(await pinLookup());
      expect(asyncProbe.returned).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_1700
     * @tc.name      testBundleNameUpperFirstSegment0017
     * @tc.desc      Upper case only the first segment and check the first and last segment shapes are preserved while
     *               the lookup is rejected
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleNameUpperFirstSegment0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_UPPER_FIRST_SEGMENT, DEFAULT_FLAGS);
      logCase('testBundleNameUpperFirstSegment0017', `first=${firstSegment(NAME_UPPER_FIRST_SEGMENT)} ` +
        `last=${lastSegment(NAME_UPPER_FIRST_SEGMENT)} code=${probe.code}`);
      expect(firstSegment(NAME_UPPER_FIRST_SEGMENT)).assertEqual(SEGMENT_COM_UPPER);
      expect(lastSegment(NAME_UPPER_FIRST_SEGMENT)).assertEqual(lastSegment(BUNDLE_NAME));
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_1800
     * @tc.name      testBundleNameUpperTwoSegment0018
     * @tc.desc      Ask for an upper cased two segment prefix of the bundle name and check the segment count and the
     *               untouched caller version
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL3
     */
    it('testBundleNameUpperTwoSegment0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_UPPER_TWO_SEGMENT, DEFAULT_FLAGS);
      logCase('testBundleNameUpperTwoSegment0018', `segments=${segmentTotal(NAME_UPPER_TWO_SEGMENT)} ` +
        `upperOnly=${isUpperOnly(NAME_UPPER_TWO_SEGMENT)} code=${probe.code}`);
      expect(segmentTotal(NAME_UPPER_TWO_SEGMENT)).assertEqual(TABLE_TWO);
      expect(isUpperOnly(NAME_UPPER_TWO_SEGMENT)).assertTrue();
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
      expect(selfVersionCode()).assertEqual(VERSION_CODE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_1900
     * @tc.name      testBundleNameDoubleDot0019
     * @tc.desc      Insert an empty segment into the bundle name and check the dot count, the empty segment and the
     *               single edit distance before the rejection
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleNameDoubleDot0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_DOUBLE_DOT, DEFAULT_FLAGS);
      logCase('testBundleNameDoubleDot0019', `dots=${dotTotal(NAME_DOUBLE_DOT)} ` +
        `segments=${segmentTotal(NAME_DOUBLE_DOT)} empty=${hasEmptySegment(NAME_DOUBLE_DOT)} code=${probe.code}`);
      expect(dotTotal(NAME_DOUBLE_DOT)).assertEqual(TABLE_THREE);
      expect(segmentTotal(NAME_DOUBLE_DOT)).assertEqual(LENGTH_FOUR);
      expect(hasEmptySegment(NAME_DOUBLE_DOT)).assertTrue();
      expect(editDistance(NAME_DOUBLE_DOT, BUNDLE_NAME)).assertEqual(LENGTH_ONE);
      expect(probe.code).assertEqual(await pinLookup());
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_2000
     * @tc.name      testBundleNameTrailingDot0020
     * @tc.desc      Append a trailing dot to the bundle name and check the last segment is empty and the lookup is
     *               rejected without payload
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleNameTrailingDot0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_TRAILING_DOT, DEFAULT_FLAGS);
      logCase('testBundleNameTrailingDot0020', `last=${lastSegment(NAME_TRAILING_DOT)} ` +
        `distance=${editDistance(NAME_TRAILING_DOT, BUNDLE_NAME)} code=${probe.code}`);
      expect(lastSegment(NAME_TRAILING_DOT)).assertEqual(EMPTY_TEXT);
      expect(dotTotal(NAME_TRAILING_DOT)).assertEqual(TABLE_THREE);
      expect(editDistance(NAME_TRAILING_DOT, BUNDLE_NAME)).assertEqual(LENGTH_ONE);
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_2100
     * @tc.name      testBundleNameLeadingDot0021
     * @tc.desc      Prepend a dot to the bundle name and check the empty first segment plus the agreement of both
     *               entry points on the rejection
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleNameLeadingDot0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const asyncProbe: BundleProbe = await bundleProbeAsync(NAME_LEADING_DOT, DEFAULT_FLAGS);
      const syncProbe: BundleProbe = bundleProbeSync(NAME_LEADING_DOT, DEFAULT_FLAGS);
      logCase('testBundleNameLeadingDot0021', `first=${firstSegment(NAME_LEADING_DOT)} async=${asyncProbe.code} ` +
        `sync=${syncProbe.code}`);
      expect(firstSegment(NAME_LEADING_DOT)).assertEqual(EMPTY_TEXT);
      expect(asyncProbe.code).assertEqual(syncProbe.code);
      expect(syncProbe.code).assertEqual(await pinLookup());
      expect(syncProbe.returned).assertFalse();
      expect(syncProbe.moduleTotal).assertEqual(UNTOUCHED);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_2200
     * @tc.name      testBundleNameDotOnly0022
     * @tc.desc      Ask for a single dot and check it splits into two empty segments while the rejection keeps the
     *               module list untouched
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleNameDotOnly0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_DOT_ONLY, DEFAULT_FLAGS);
      logCase('testBundleNameDotOnly0022', `dots=${dotTotal(NAME_DOT_ONLY)} segments=${segmentTotal(NAME_DOT_ONLY)} ` +
        `code=${probe.code} moduleTotal=${probe.moduleTotal}`);
      expect(dotTotal(NAME_DOT_ONLY)).assertEqual(LENGTH_ONE);
      expect(segmentTotal(NAME_DOT_ONLY)).assertEqual(LENGTH_TWO);
      expect(hasEmptySegment(NAME_DOT_ONLY)).assertTrue();
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.moduleTotal).assertEqual(UNTOUCHED);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_2300
     * @tc.name      testBundleNameTripleDot0023
     * @tc.desc      Ask for three dots and check trim() cannot shorten them while the lookup is rejected with no
     *               returned record
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleNameTripleDot0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_TRIPLE_DOT, DEFAULT_FLAGS);
      logCase('testBundleNameTripleDot0023', `trimmed=${trimTotal(NAME_TRIPLE_DOT)} ` +
        `segments=${segmentTotal(NAME_TRIPLE_DOT)} code=${probe.code}`);
      expect(trimTotal(NAME_TRIPLE_DOT)).assertEqual(TABLE_THREE);
      expect(dotTotal(NAME_TRIPLE_DOT)).assertEqual(TABLE_THREE);
      expect(segmentTotal(NAME_TRIPLE_DOT)).assertEqual(LENGTH_FOUR);
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_2400
     * @tc.name      testBundleNameExtraFourSegment0024
     * @tc.desc      Append one extra segment to the real bundle name and check the prefix relation and the six
     *               character distance before the rejection is verified
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleNameExtraFourSegment0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_FOUR_SEGMENT, DEFAULT_FLAGS);
      logCase('testBundleNameExtraFourSegment0024', `segments=${segmentTotal(NAME_FOUR_SEGMENT)} ` +
        `prefix=${startsWithBundle(NAME_FOUR_SEGMENT)} distance=${editDistance(NAME_FOUR_SEGMENT, BUNDLE_NAME)}`);
      expect(segmentTotal(NAME_FOUR_SEGMENT)).assertEqual(LENGTH_FOUR);
      expect(startsWithBundle(NAME_FOUR_SEGMENT)).assertTrue();
      expect(editDistance(NAME_FOUR_SEGMENT, BUNDLE_NAME)).assertEqual(LENGTH_SIX);
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_2500
     * @tc.name      testBundleNameSegmentTruncated0025
     * @tc.desc      Drop the last character of the bundle name and check the real name starts with the truncated one
     *               while the truncated lookup is rejected
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleNameSegmentTruncated0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_TRUNCATED_SEGMENT, DEFAULT_FLAGS);
      logCase('testBundleNameSegmentTruncated0025', `segments=${segmentTotal(NAME_TRUNCATED_SEGMENT)} ` +
        `distance=${editDistance(NAME_TRUNCATED_SEGMENT, BUNDLE_NAME)} code=${probe.code}`);
      expect(segmentTotal(NAME_TRUNCATED_SEGMENT)).assertEqual(SEGMENT_TOTAL);
      expect(BUNDLE_NAME.startsWith(NAME_TRUNCATED_SEGMENT)).assertTrue();
      expect(editDistance(NAME_TRUNCATED_SEGMENT, BUNDLE_NAME)).assertEqual(LENGTH_ONE);
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.versionCode).assertEqual(UNTOUCHED);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_2600
     * @tc.name      testBundleNameTwoSegment0026
     * @tc.desc      Ask for the two segment prefix of the bundle name and check the genuine name starts with it
     *               although the prefix itself is rejected
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL3
     */
    it('testBundleNameTwoSegment0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_TWO_SEGMENT, DEFAULT_FLAGS);
      logCase('testBundleNameTwoSegment0026', `segments=${segmentTotal(NAME_TWO_SEGMENT)} ` +
        `contains=${containsBundle(NAME_TWO_SEGMENT)} code=${probe.code}`);
      expect(segmentTotal(NAME_TWO_SEGMENT)).assertEqual(TABLE_TWO);
      expect(BUNDLE_NAME.startsWith(NAME_TWO_SEGMENT + '.')).assertTrue();
      expect(containsBundle(NAME_TWO_SEGMENT)).assertFalse();
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_2700
     * @tc.name      testBundleNameOneSegment0027
     * @tc.desc      Ask for only the last segment of the bundle name and check it carries no dot although the genuine
     *               name ends with it
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL3
     */
    it('testBundleNameOneSegment0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_ONE_SEGMENT, DEFAULT_FLAGS);
      logCase('testBundleNameOneSegment0027', `dots=${dotTotal(NAME_ONE_SEGMENT)} ` +
        `segments=${segmentTotal(NAME_ONE_SEGMENT)} code=${probe.code}`);
      expect(dotTotal(NAME_ONE_SEGMENT)).assertEqual(EMPTY_LENGTH);
      expect(segmentTotal(NAME_ONE_SEGMENT)).assertEqual(LENGTH_ONE);
      expect(BUNDLE_NAME.endsWith(NAME_ONE_SEGMENT)).assertTrue();
      expect(probe.code).assertEqual(await pinLookup());
      expect(selfIntact()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_2800
     * @tc.name      testBundleNameNoDot0028
     * @tc.desc      Remove both dots of the bundle name and check both entry points reject the result and agree on the
     *               code
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL3
     */
    it('testBundleNameNoDot0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const asyncProbe: BundleProbe = await bundleProbeAsync(NAME_NO_DOT, DEFAULT_FLAGS);
      const syncProbe: BundleProbe = bundleProbeSync(NAME_NO_DOT, DEFAULT_FLAGS);
      const distance: number = editDistance(NAME_NO_DOT, BUNDLE_NAME);
      logCase('testBundleNameNoDot0028', `dots=${dotTotal(NAME_NO_DOT)} distance=${distance} ` +
        `async=${asyncProbe.code}`);
      expect(dotTotal(NAME_NO_DOT)).assertEqual(EMPTY_LENGTH);
      expect(editDistance(NAME_NO_DOT, BUNDLE_NAME)).assertEqual(LENGTH_TWO);
      expect(asyncProbe.code).assertEqual(syncProbe.code);
      expect(asyncProbe.code).assertEqual(await pinLookup());
      expect(syncProbe.returned).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_2900
     * @tc.name      testBundleNameOhosPrefix0029
     * @tc.desc      Prefix the bundle name with the ohos segment and check the prefix is counted in the edit distance
     *               while the lookup is rejected
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleNameOhosPrefix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_PREFIX_OHOS, DEFAULT_FLAGS);
      logCase('testBundleNameOhosPrefix0029', `prefix=${NAME_PREFIX_OHOS.startsWith(PREFIX_OHOS)} ` +
        `suffix=${endsWithBundle(NAME_PREFIX_OHOS)} code=${probe.code}`);
      expect(NAME_PREFIX_OHOS.startsWith(PREFIX_OHOS)).assertTrue();
      expect(endsWithBundle(NAME_PREFIX_OHOS)).assertTrue();
      expect(editDistance(NAME_PREFIX_OHOS, BUNDLE_NAME)).assertEqual(LENGTH_FIVE);
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_3000
     * @tc.name      testBundleNameAppPrefix0030
     * @tc.desc      Prefix the bundle name with the app segment and check the genuine name is still contained in the
     *               rejected input
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleNameAppPrefix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_PREFIX_APP, DEFAULT_FLAGS);
      logCase('testBundleNameAppPrefix0030', `prefix=${NAME_PREFIX_APP.startsWith(PREFIX_APP)} ` +
        `contains=${containsBundle(NAME_PREFIX_APP)} code=${probe.code}`);
      expect(NAME_PREFIX_APP.startsWith(PREFIX_APP)).assertTrue();
      expect(containsBundle(NAME_PREFIX_APP)).assertTrue();
      expect(editDistance(NAME_PREFIX_APP, BUNDLE_NAME)).assertEqual(LENGTH_FOUR);
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_3100
     * @tc.name      testBundleNameDebugSuffix0031
     * @tc.desc      Append the debug suffix to the bundle name and check the segment count and the appended length
     *               while the lookup is rejected without payload
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleNameDebugSuffix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_SUFFIX_DEBUG, DEFAULT_FLAGS);
      logCase('testBundleNameDebugSuffix0031', `suffix=${NAME_SUFFIX_DEBUG.endsWith(SUFFIX_DEBUG)} ` +
        `segments=${segmentTotal(NAME_SUFFIX_DEBUG)} distance=${editDistance(NAME_SUFFIX_DEBUG, BUNDLE_NAME)}`);
      expect(NAME_SUFFIX_DEBUG.endsWith(SUFFIX_DEBUG)).assertTrue();
      expect(segmentTotal(NAME_SUFFIX_DEBUG)).assertEqual(LENGTH_FOUR);
      expect(editDistance(NAME_SUFFIX_DEBUG, BUNDLE_NAME)).assertEqual(LENGTH_SIX);
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.moduleTotal).assertEqual(UNTOUCHED);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_3200
     * @tc.name      testBundleNameTestSuffix0032
     * @tc.desc      Append the test suffix to the bundle name and check the last segment and the five character
     *               distance before the rejection
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleNameTestSuffix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_SUFFIX_TEST, DEFAULT_FLAGS);
      logCase('testBundleNameTestSuffix0032', `last=${lastSegment(NAME_SUFFIX_TEST)} ` +
        `distance=${editDistance(NAME_SUFFIX_TEST, BUNDLE_NAME)} code=${probe.code}`);
      expect(lastSegment(NAME_SUFFIX_TEST)).assertEqual(SEGMENT_TEST);
      expect(NAME_SUFFIX_TEST.endsWith(SUFFIX_TEST)).assertTrue();
      expect(editDistance(NAME_SUFFIX_TEST, BUNDLE_NAME)).assertEqual(LENGTH_FIVE);
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_3300
     * @tc.name      testBundleNameHapSuffix0033
     * @tc.desc      Append the hap suffix to the bundle name and check the synchronous entry point rejects it exactly
     *               like the promise one
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleNameHapSuffix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const syncProbe: BundleProbe = bundleProbeSync(NAME_SUFFIX_HAP, DEFAULT_FLAGS);
      logCase('testBundleNameHapSuffix0033', `last=${lastSegment(NAME_SUFFIX_HAP)} ` +
        `suffix=${NAME_SUFFIX_HAP.endsWith(SUFFIX_HAP)} code=${syncProbe.code}`);
      expect(lastSegment(NAME_SUFFIX_HAP)).assertEqual(SEGMENT_HAP);
      expect(NAME_SUFFIX_HAP.endsWith(SUFFIX_HAP)).assertTrue();
      expect(editDistance(NAME_SUFFIX_HAP, BUNDLE_NAME)).assertEqual(LENGTH_FOUR);
      expect(syncProbe.code).assertEqual(await pinLookup());
      expect(syncProbe.returned).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_3400
     * @tc.name      testBundleNameVersionSuffix0034
     * @tc.desc      Append a version marker to the bundle name and check the marker starts exactly behind the real
     *               name while the lookup is rejected
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL3
     */
    it('testBundleNameVersionSuffix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_SUFFIX_VERSION, DEFAULT_FLAGS);
      const markerIndex: number = indexOfPart(NAME_SUFFIX_VERSION, '@');
      logCase('testBundleNameVersionSuffix0034', `markerIndex=${markerIndex} bundleLength=${BUNDLE_NAME.length} ` +
        `code=${probe.code}`);
      expect(markerIndex).assertEqual(BUNDLE_NAME.length);
      expect(startsWithBundle(NAME_SUFFIX_VERSION)).assertTrue();
      expect(editDistance(NAME_SUFFIX_VERSION, BUNDLE_NAME)).assertEqual(LENGTH_SIX);
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_3500
     * @tc.name      testBundleNameColonSuffix0035
     * @tc.desc      Append a colon and the entry module name to the bundle name and check the colon offset while the
     *               lookup is rejected
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL3
     */
    it('testBundleNameColonSuffix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_SUFFIX_COLON, DEFAULT_FLAGS);
      logCase('testBundleNameColonSuffix0035', `colonIndex=${indexOfPart(NAME_SUFFIX_COLON, ':')} ` +
        `suffix=${NAME_SUFFIX_COLON.endsWith(SUFFIX_ENTRY)} code=${probe.code}`);
      expect(indexOfPart(NAME_SUFFIX_COLON, ':')).assertEqual(BUNDLE_NAME.length);
      expect(NAME_SUFFIX_COLON.endsWith(SUFFIX_ENTRY)).assertTrue();
      expect(segmentTotal(NAME_SUFFIX_COLON)).assertEqual(SEGMENT_TOTAL);
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_3600
     * @tc.name      testBundleNameSemicolonSuffix0036
     * @tc.desc      Append a semicolon and the entry module name to the bundle name and check the six character
     *               distance while the caller version stays untouched
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL3
     */
    it('testBundleNameSemicolonSuffix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_SUFFIX_SEMICOLON, DEFAULT_FLAGS);
      logCase('testBundleNameSemicolonSuffix0036', `index=${indexOfPart(NAME_SUFFIX_SEMICOLON, ';')} ` +
        `distance=${editDistance(NAME_SUFFIX_SEMICOLON, BUNDLE_NAME)} code=${probe.code}`);
      expect(indexOfPart(NAME_SUFFIX_SEMICOLON, ';')).assertEqual(BUNDLE_NAME.length);
      expect(editDistance(NAME_SUFFIX_SEMICOLON, BUNDLE_NAME)).assertEqual(LENGTH_SIX);
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
      expect(selfVersionCode()).assertEqual(VERSION_CODE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_3700
     * @tc.name      testBundleNameLeadingSpace0037
     * @tc.desc      Prepend one space to the real bundle name and check trim() recovers the exact name while the
     *               lookup is rejected and no module list is reported
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleNameLeadingSpace0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_LEADING_SPACE, DEFAULT_FLAGS);
      logCase('testBundleNameLeadingSpace0037', `trims=${trimsToBundle(NAME_LEADING_SPACE)} ` +
        `length=${NAME_LEADING_SPACE.length} code=${probe.code}`);
      expect(trimsToBundle(NAME_LEADING_SPACE)).assertTrue();
      expect(NAME_LEADING_SPACE.length).assertEqual(BUNDLE_NAME.length + LENGTH_ONE);
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
      expect(probe.moduleTotal).assertEqual(UNTOUCHED);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_3800
     * @tc.name      testBundleNameTrailingSpace0038
     * @tc.desc      Append one space to the real bundle name and check the final code unit is a space before the
     *               synchronous rejection is verified
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleNameTrailingSpace0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const syncProbe: BundleProbe = bundleProbeSync(NAME_TRAILING_SPACE, DEFAULT_FLAGS);
      const lastCode: number = NAME_TRAILING_SPACE.charCodeAt(NAME_TRAILING_SPACE.length - 1);
      logCase('testBundleNameTrailingSpace0038', `lastCode=${lastCode} trims=${trimsToBundle(NAME_TRAILING_SPACE)} ` +
        `code=${syncProbe.code}`);
      expect(lastCode).assertEqual(SPACE_CODE);
      expect(trimsToBundle(NAME_TRAILING_SPACE)).assertTrue();
      expect(syncProbe.code).assertEqual(await pinLookup());
      expect(syncProbe.returned).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_3900
     * @tc.name      testBundleNamePaddedSpaces0039
     * @tc.desc      Wrap the real bundle name in two spaces on both sides and check the trimmed length equals the real
     *               name while both entry points reject the padded string
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleNamePaddedSpaces0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const asyncProbe: BundleProbe = await bundleProbeAsync(NAME_PADDED_SPACES, DEFAULT_FLAGS);
      const syncProbe: BundleProbe = bundleProbeSync(NAME_PADDED_SPACES, DEFAULT_FLAGS);
      logCase('testBundleNamePaddedSpaces0039', `length=${NAME_PADDED_SPACES.length} ` +
        `trimmed=${trimTotal(NAME_PADDED_SPACES)} async=${asyncProbe.code} sync=${syncProbe.code}`);
      expect(NAME_PADDED_SPACES.length).assertEqual(BUNDLE_NAME.length + LENGTH_FOUR);
      expect(trimTotal(NAME_PADDED_SPACES)).assertEqual(BUNDLE_NAME.length);
      expect(asyncProbe.code).assertEqual(syncProbe.code);
      expect(asyncProbe.code).assertEqual(await pinLookup());
      expect(selfIntact()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_4000
     * @tc.name      testBundleNameLineFeedPadded0040
     * @tc.desc      Terminate the real bundle name with a line feed and check the line feed code point while the
     *               lookup is rejected
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleNameLineFeedPadded0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_LINE_FEED_PADDED, DEFAULT_FLAGS);
      logCase('testBundleNameLineFeedPadded0040', `lineFeed=${hasCodeUnit(NAME_LINE_FEED_PADDED, LINE_FEED_CODE)} ` +
        `trims=${trimsToBundle(NAME_LINE_FEED_PADDED)} code=${probe.code}`);
      expect(hasCodeUnit(NAME_LINE_FEED_PADDED, LINE_FEED_CODE)).assertTrue();
      expect(trimsToBundle(NAME_LINE_FEED_PADDED)).assertTrue();
      expect(NAME_LINE_FEED_PADDED.length).assertEqual(BUNDLE_NAME.length + LENGTH_ONE);
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_4100
     * @tc.name      testBundleNameInnerSpace0041
     * @tc.desc      Replace the first dot with a space so trim() can no longer repair the name and check the segment
     *               count stays three while the lookup is rejected
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleNameInnerSpace0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_INNER_SPACE, DEFAULT_FLAGS);
      logCase('testBundleNameInnerSpace0041', `trims=${trimsToBundle(NAME_INNER_SPACE)} ` +
        `segments=${segmentTotal(NAME_INNER_SPACE)} code=${probe.code}`);
      expect(trimsToBundle(NAME_INNER_SPACE)).assertFalse();
      expect(segmentTotal(NAME_INNER_SPACE)).assertEqual(SEGMENT_TOTAL);
      expect(hasCodeUnit(NAME_INNER_SPACE, SPACE_CODE)).assertTrue();
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.versionCode).assertEqual(UNTOUCHED);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_4200
     * @tc.name      testBundleNameInnerTab0042
     * @tc.desc      Put a tab between the second dot and the last segment and check the tab survives trim() while the
     *               lookup is rejected with no module list
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleNameInnerTab0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_INNER_TAB, DEFAULT_FLAGS);
      logCase('testBundleNameInnerTab0042', `tab=${hasCodeUnit(NAME_INNER_TAB, TAB_CODE)} ` +
        `trims=${trimsToBundle(NAME_INNER_TAB)} code=${probe.code}`);
      expect(hasCodeUnit(NAME_INNER_TAB, TAB_CODE)).assertTrue();
      expect(trimsToBundle(NAME_INNER_TAB)).assertFalse();
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
      expect(probe.moduleTotal).assertEqual(UNTOUCHED);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_4300
     * @tc.name      testBundleNameNbspInner0043
     * @tc.desc      Insert a no break space before the last segment and check the string is no longer pure ASCII while
     *               the lookup is rejected
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL3
     */
    it('testBundleNameNbspInner0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_NBSP_INNER, DEFAULT_FLAGS);
      logCase('testBundleNameNbspInner0043', `nbsp=${hasCodeUnit(NAME_NBSP_INNER, NBSP_CODE)} ` +
        `ascii=${isAsciiOnly(NAME_NBSP_INNER)} code=${probe.code}`);
      expect(hasCodeUnit(NAME_NBSP_INNER, NBSP_CODE)).assertTrue();
      expect(isAsciiOnly(NAME_NBSP_INNER)).assertFalse();
      expect(segmentTotal(NAME_NBSP_INNER)).assertEqual(SEGMENT_TOTAL);
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_4400
     * @tc.name      testBundleNameZeroWidthTail0044
     * @tc.desc      Append a zero width space to the real bundle name and check trim() keeps it so the trimmed length
     *               is one longer than the real name while the lookup is rejected
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL3
     */
    it('testBundleNameZeroWidthTail0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const zeroWidth: boolean = hasCodeUnit(NAME_ZERO_WIDTH_TAIL, ZERO_WIDTH_SPACE_CODE);
      const probe: BundleProbe = await bundleProbeAsync(NAME_ZERO_WIDTH_TAIL, DEFAULT_FLAGS);
      logCase('testBundleNameZeroWidthTail0044', `zeroWidth=${zeroWidth} ` +
        `trimmed=${trimTotal(NAME_ZERO_WIDTH_TAIL)} code=${probe.code}`);
      expect(zeroWidth).assertTrue();
      expect(trimTotal(NAME_ZERO_WIDTH_TAIL)).assertEqual(BUNDLE_NAME.length + LENGTH_ONE);
      expect(trimsToBundle(NAME_ZERO_WIDTH_TAIL)).assertFalse();
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_4500
     * @tc.name      testBundleNameCyrillicTail0045
     * @tc.desc      Replace the final latin letter with a Cyrillic lookalike of the same length and check the case
     *               folding of the lookalike still differs from the genuine lower case name
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleNameCyrillicTail0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_CYRILLIC_TAIL, DEFAULT_FLAGS);
      const folded: string = NAME_CYRILLIC_TAIL.toLowerCase();
      logCase('testBundleNameCyrillicTail0045', `ascii=${isAsciiOnly(NAME_CYRILLIC_TAIL)} folded=${folded} ` +
        `code=${probe.code}`);
      expect(isAsciiOnly(NAME_CYRILLIC_TAIL)).assertFalse();
      expect(NAME_CYRILLIC_TAIL.length).assertEqual(BUNDLE_NAME.length);
      expect(folded === BUNDLE_NAME_LOWER).assertFalse();
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_4600
     * @tc.name      testBundleNameGreekHead0046
     * @tc.desc      Replace the first letter of the last segment with a Greek capital of the same width and check it
     *               is a single code unit while the lookup is rejected
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleNameGreekHead0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_GREEK_HEAD, DEFAULT_FLAGS);
      logCase('testBundleNameGreekHead0046', `ascii=${isAsciiOnly(NAME_GREEK_HEAD)} ` +
        `surrogates=${surrogateTotal(NAME_GREEK_HEAD)} code=${probe.code}`);
      expect(isAsciiOnly(NAME_GREEK_HEAD)).assertFalse();
      expect(surrogateTotal(NAME_GREEK_HEAD)).assertEqual(EMPTY_LENGTH);
      expect(NAME_GREEK_HEAD.length).assertEqual(BUNDLE_NAME.length);
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.moduleTotal).assertEqual(UNTOUCHED);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_4700
     * @tc.name      testBundleNameAccentHead0047
     * @tc.desc      Replace the first letter of the last segment with an accented capital and check its folded length
     *               is unchanged while both entry points reject it
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleNameAccentHead0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const asyncProbe: BundleProbe = await bundleProbeAsync(NAME_ACCENT_HEAD, DEFAULT_FLAGS);
      const syncProbe: BundleProbe = bundleProbeSync(NAME_ACCENT_HEAD, DEFAULT_FLAGS);
      logCase('testBundleNameAccentHead0047', `ascii=${isAsciiOnly(NAME_ACCENT_HEAD)} ` +
        `foldedLength=${NAME_ACCENT_HEAD.toLowerCase().length} code=${asyncProbe.code}`);
      expect(isAsciiOnly(NAME_ACCENT_HEAD)).assertFalse();
      expect(NAME_ACCENT_HEAD.toLowerCase().length).assertEqual(BUNDLE_NAME.length);
      expect(asyncProbe.code).assertEqual(syncProbe.code);
      expect(asyncProbe.code).assertEqual(await pinLookup());
      expect(syncProbe.returned).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_4800
     * @tc.name      testBundleNameFullWidthDot0048
     * @tc.desc      Use full width dots between the segments and check the string has no ASCII dot at all so it is a
     *               single segment that is still rejected
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleNameFullWidthDot0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const fullWidth: boolean = hasCodeUnit(NAME_FULL_WIDTH_DOT, FULL_WIDTH_DOT_CODE);
      const probe: BundleProbe = await bundleProbeAsync(NAME_FULL_WIDTH_DOT, DEFAULT_FLAGS);
      logCase('testBundleNameFullWidthDot0048', `fullWidth=${fullWidth} ` +
        `asciiDots=${dotTotal(NAME_FULL_WIDTH_DOT)} code=${probe.code}`);
      expect(fullWidth).assertTrue();
      expect(dotTotal(NAME_FULL_WIDTH_DOT)).assertEqual(EMPTY_LENGTH);
      expect(segmentTotal(NAME_FULL_WIDTH_DOT)).assertEqual(LENGTH_ONE);
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_4900
     * @tc.name      testBundleNameEmojiTail0049
     * @tc.desc      Append an emoji to the real bundle name and check it costs two surrogate code units while the
     *               genuine name is still a prefix of the rejected input
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL3
     */
    it('testBundleNameEmojiTail0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_EMOJI_TAIL, DEFAULT_FLAGS);
      logCase('testBundleNameEmojiTail0049', `surrogates=${surrogateTotal(NAME_EMOJI_TAIL)} ` +
        `length=${NAME_EMOJI_TAIL.length} prefix=${startsWithBundle(NAME_EMOJI_TAIL)} code=${probe.code}`);
      expect(surrogateTotal(NAME_EMOJI_TAIL)).assertEqual(SURROGATE_EMOJI_TOTAL);
      expect(NAME_EMOJI_TAIL.length).assertEqual(BUNDLE_NAME.length + SURROGATE_EMOJI_TOTAL);
      expect(startsWithBundle(NAME_EMOJI_TAIL)).assertTrue();
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_5000
     * @tc.name      testBundleNameLoneSurrogate0050
     * @tc.desc      Replace one letter of the last segment with an unpaired low surrogate and check the input is
     *               rejected without disturbing the caller bundle
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL3
     */
    it('testBundleNameLoneSurrogate0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_LONE_SURROGATE, DEFAULT_FLAGS);
      logCase('testBundleNameLoneSurrogate0050', `surrogates=${surrogateTotal(NAME_LONE_SURROGATE)} ` +
        `ascii=${isAsciiOnly(NAME_LONE_SURROGATE)} code=${probe.code}`);
      expect(surrogateTotal(NAME_LONE_SURROGATE)).assertEqual(LENGTH_ONE);
      expect(isAsciiOnly(NAME_LONE_SURROGATE)).assertFalse();
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
      expect(selfIntact()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_5100
     * @tc.name      testBundleNameCombiningMark0051
     * @tc.desc      Insert a combining accent between two letters and check it grows the name by one code unit while
     *               the lookup is rejected with no version reported
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL3
     */
    it('testBundleNameCombiningMark0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_COMBINING_MARK, DEFAULT_FLAGS);
      logCase('testBundleNameCombiningMark0051', `length=${NAME_COMBINING_MARK.length} ` +
        `ascii=${isAsciiOnly(NAME_COMBINING_MARK)} code=${probe.code}`);
      expect(NAME_COMBINING_MARK.length).assertEqual(BUNDLE_NAME.length + LENGTH_ONE);
      expect(isAsciiOnly(NAME_COMBINING_MARK)).assertFalse();
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
      expect(probe.versionCode).assertEqual(UNTOUCHED);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_5200
     * @tc.name      testBundleNameArabicHead0052
     * @tc.desc      Replace the first letter of the last segment with an Arabic letter and check the character sum is
     *               larger than that of the genuine name while the lookup is rejected
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL3
     */
    it('testBundleNameArabicHead0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_ARABIC_HEAD, DEFAULT_FLAGS);
      logCase('testBundleNameArabicHead0052', `ascii=${isAsciiOnly(NAME_ARABIC_HEAD)} ` +
        `sum=${charCodeSum(NAME_ARABIC_HEAD)} bundleSum=${charCodeSum(BUNDLE_NAME)} code=${probe.code}`);
      expect(isAsciiOnly(NAME_ARABIC_HEAD)).assertFalse();
      expect(charCodeSum(NAME_ARABIC_HEAD) > charCodeSum(BUNDLE_NAME)).assertTrue();
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_5300
     * @tc.name      testBundleNameHyphenSegment0053
     * @tc.desc      Join the last two segments with a hyphen and check only one dot remains and the distance is a
     *               single replacement while both entry points reject it
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleNameHyphenSegment0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const asyncProbe: BundleProbe = await bundleProbeAsync(NAME_HYPHEN, DEFAULT_FLAGS);
      const syncProbe: BundleProbe = bundleProbeSync(NAME_HYPHEN, DEFAULT_FLAGS);
      logCase('testBundleNameHyphenSegment0053', `dots=${dotTotal(NAME_HYPHEN)} ` +
        `distance=${editDistance(NAME_HYPHEN, BUNDLE_NAME)} async=${asyncProbe.code} sync=${syncProbe.code}`);
      expect(dotTotal(NAME_HYPHEN)).assertEqual(LENGTH_ONE);
      expect(editDistance(NAME_HYPHEN, BUNDLE_NAME)).assertEqual(LENGTH_ONE);
      expect(asyncProbe.code).assertEqual(syncProbe.code);
      expect(asyncProbe.code).assertEqual(await pinLookup());
      expect(syncProbe.returned).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_5400
     * @tc.name      testBundleNameUnderscoreSuffix0054
     * @tc.desc      Attach the entry module name with an underscore and check the underscore code point and the six
     *               character distance while the rejection carries no module list
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleNameUnderscoreSuffix0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_UNDERSCORE, DEFAULT_FLAGS);
      logCase('testBundleNameUnderscoreSuffix0054', `underscore=${hasCodeUnit(NAME_UNDERSCORE, UNDERSCORE_CODE)} ` +
        `distance=${editDistance(NAME_UNDERSCORE, BUNDLE_NAME)} code=${probe.code}`);
      expect(hasCodeUnit(NAME_UNDERSCORE, UNDERSCORE_CODE)).assertTrue();
      expect(editDistance(NAME_UNDERSCORE, BUNDLE_NAME)).assertEqual(LENGTH_SIX);
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
      expect(probe.moduleTotal).assertEqual(UNTOUCHED);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_5500
     * @tc.name      testBundleNameSlashSeparator0055
     * @tc.desc      Replace both dots with slashes and check the input has no dot at all and costs two replacements
     *               before the rejection
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleNameSlashSeparator0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_SLASH, DEFAULT_FLAGS);
      logCase('testBundleNameSlashSeparator0055', `dots=${dotTotal(NAME_SLASH)} ` +
        `distance=${editDistance(NAME_SLASH, BUNDLE_NAME)} code=${probe.code}`);
      expect(dotTotal(NAME_SLASH)).assertEqual(EMPTY_LENGTH);
      expect(hasCodeUnit(NAME_SLASH, SLASH_CODE)).assertTrue();
      expect(editDistance(NAME_SLASH, BUNDLE_NAME)).assertEqual(LENGTH_TWO);
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_5600
     * @tc.name      testBundleNameBackSlashSeparator0056
     * @tc.desc      Replace both dots with back slashes and check the synchronous rejection while the caller version
     *               stays readable
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleNameBackSlashSeparator0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const syncProbe: BundleProbe = bundleProbeSync(NAME_BACK_SLASH, DEFAULT_FLAGS);
      logCase('testBundleNameBackSlashSeparator0056', `backSlash=${hasCodeUnit(NAME_BACK_SLASH, BACK_SLASH_CODE)} ` +
        `distance=${editDistance(NAME_BACK_SLASH, BUNDLE_NAME)} code=${syncProbe.code}`);
      expect(hasCodeUnit(NAME_BACK_SLASH, BACK_SLASH_CODE)).assertTrue();
      expect(dotTotal(NAME_BACK_SLASH)).assertEqual(EMPTY_LENGTH);
      expect(editDistance(NAME_BACK_SLASH, BUNDLE_NAME)).assertEqual(LENGTH_TWO);
      expect(syncProbe.code).assertEqual(await pinLookup());
      expect(selfVersionCode()).assertEqual(VERSION_CODE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_5700
     * @tc.name      testBundleNameStarSegment0057
     * @tc.desc      Use a wildcard as the last segment and check the distance covers the whole replaced segment while
     *               the lookup is rejected
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL3
     */
    it('testBundleNameStarSegment0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_STAR, DEFAULT_FLAGS);
      logCase('testBundleNameStarSegment0057', `last=${lastSegment(NAME_STAR)} ` +
        `distance=${editDistance(NAME_STAR, BUNDLE_NAME)} code=${probe.code}`);
      expect(lastSegment(NAME_STAR)).assertEqual(WILDCARD_TEXT);
      expect(editDistance(NAME_STAR, BUNDLE_NAME)).assertEqual(LENGTH_SEVEN);
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_5800
     * @tc.name      testBundleNameQuestionMark0058
     * @tc.desc      Use a question mark as the final character and check the single character distance while the
     *               rejection keeps the module list untouched
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL3
     */
    it('testBundleNameQuestionMark0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_QUESTION, DEFAULT_FLAGS);
      logCase('testBundleNameQuestionMark0058', `question=${hasCodeUnit(NAME_QUESTION, QUESTION_CODE)} ` +
        `distance=${editDistance(NAME_QUESTION, BUNDLE_NAME)} code=${probe.code}`);
      expect(hasCodeUnit(NAME_QUESTION, QUESTION_CODE)).assertTrue();
      expect(editDistance(NAME_QUESTION, BUNDLE_NAME)).assertEqual(LENGTH_ONE);
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
      expect(probe.moduleTotal).assertEqual(UNTOUCHED);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_5900
     * @tc.name      testBundleNameQuoted0059
     * @tc.desc      Wrap the real bundle name in double quotes and check the quote code points and the two extra
     *               characters while the lookup is rejected
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleNameQuoted0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const probe: BundleProbe = await bundleProbeAsync(NAME_QUOTED, DEFAULT_FLAGS);
      logCase('testBundleNameQuoted0059', `quotes=${hasCodeUnit(NAME_QUOTED, QUOTE_CODE)} ` +
        `length=${NAME_QUOTED.length} code=${probe.code}`);
      expect(hasCodeUnit(NAME_QUOTED, QUOTE_CODE)).assertTrue();
      expect(NAME_QUOTED.length).assertEqual(BUNDLE_NAME.length + LENGTH_TWO);
      expect(trimsToBundle(NAME_QUOTED)).assertFalse();
      expect(probe.code).assertEqual(await pinLookup());
      expect(probe.returned).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEERR_6000
     * @tc.name      testBundleNameBraced0060
     * @tc.desc      Wrap the real bundle name in curly braces and check both brace code points are present while the
     *               lookup is rejected with no payload
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
