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
import { bundleManager } from '@kit.AbilityKit';
import { process } from '@kit.ArkTS';
import {
  BACKUP_ABILITY,
  BACKUP_METADATA,
  BUNDLE_NAME,
  ENTRY_ABILITY,
  ENTRY_MODULE,
  findModule,
  SELF_FLAGS,
  selfBundle,
  TEST_MODULE
} from './shared/AppProbe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

const VERSION_CODE: number = 1000000;
const VERSION_NAME: string = '1.0.0';
const APP_VENDOR: string = 'example';
const TARGET_API: number = 26;
const TARGET_VERSION: number = TARGET_API * 10000000 + TARGET_API;
const APP_INDEX: number = 0;
const MODULE_TOTAL: number = 2;
const ABILITY_TOTAL: number = 1;
const EXTENSION_TOTAL: number = 1;
const BACKUP_TYPE_NAME: string = 'backup';
const BACKUP_RESOURCE: string = '$profile:backup_config';
const HOME_ACTION: string = 'ohos.want.action.home';
const HOME_ENTITY: string = 'entity.system.home';
const TEST_MAIN_ELEMENT: string = 'TestAbility';
const DEVICE_TYPE_PHONE: string = 'phone';
const WINDOW_MODE_LIST: string = '0,1,2';
const BUNDLE_SEGMENTS: string[] = ['com', 'sample', 'ArkTSGC'];
const BUNDLE_SEGMENT_TOTAL: number = BUNDLE_SEGMENTS.length;
const VERSION_SEGMENT_TOTAL: number = 3;
const WINDOW_MODE_TOTAL: number = 3;
const EMPTY_LENGTH: number = 0;
const NO_SKILL_URI: number = 0;

const FLAG_DEFAULT: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT;
const FLAG_APPLICATION: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
const FLAG_MODULE: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
const FLAG_ABILITY: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
const FLAG_EXTENSION: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
const FLAG_PERMISSION: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
const FLAG_METADATA: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
const FLAG_SIGNATURE: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
const FLAG_SKILL: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;

const MODULE_ONLY: number = FLAG_MODULE;
const MODULE_ABILITY: number = FLAG_MODULE | FLAG_ABILITY;
const MODULE_EXTENSION: number = FLAG_MODULE | FLAG_EXTENSION;
const MODULE_ABILITY_SKILL: number = MODULE_ABILITY | FLAG_SKILL;
const MODULE_EXTENSION_SKILL: number = MODULE_EXTENSION | FLAG_SKILL;
const MODULE_EXTENSION_METADATA: number = MODULE_EXTENSION | FLAG_METADATA;
const MODULE_ABILITY_METADATA: number = MODULE_ABILITY | FLAG_METADATA;
const APP_MODULE: number = FLAG_APPLICATION | FLAG_MODULE;
const APP_MODULE_ABILITY: number = APP_MODULE | FLAG_ABILITY;
const APP_MODULE_EXTENSION: number = APP_MODULE | FLAG_EXTENSION;
const APP_MODULE_SKILL: number = APP_MODULE | FLAG_SKILL;
const MODULE_ALL_PARTS: number = MODULE_ABILITY | FLAG_EXTENSION;
const FULL_FLAGS: number = SELF_FLAGS | FLAG_SIGNATURE | FLAG_PERMISSION;

const STEP_NONE: number = FLAG_DEFAULT;
const STEP_APP: number = STEP_NONE | FLAG_APPLICATION;
const STEP_MODULE: number = STEP_APP | FLAG_MODULE;
const STEP_ABILITY: number = STEP_MODULE | FLAG_ABILITY;
const STEP_EXTENSION: number = STEP_ABILITY | FLAG_EXTENSION;
const STEP_METADATA: number = STEP_EXTENSION | FLAG_METADATA;
const STEP_SKILL: number = STEP_METADATA | FLAG_SKILL;

async function infoWith(flags: number): Promise<bundleManager.BundleInfo> {
  return await bundleManager.getBundleInfoForSelf(flags);
}

function flagSummary(flags: number): string {
  return '0x' + flags.toString(16);
}

function textOrEmpty(value: string | undefined): string {
  return value === undefined ? '' : value;
}

// collections gated behind flags can come back absent, so every length read goes through here
function lenOf<T>(items: T[] | undefined): number {
  return items === undefined || items === null ? EMPTY_LENGTH : items.length;
}

function countModules(info: bundleManager.BundleInfo): number {
  return info.hapModulesInfo.length;
}

function countAbilities(info: bundleManager.BundleInfo): number {
  let total: number = 0;
  info.hapModulesInfo.forEach((item: bundleManager.HapModuleInfo) => {
    total += item.abilitiesInfo.length;
  });
  return total;
}

function countExtensions(info: bundleManager.BundleInfo): number {
  let total: number = 0;
  info.hapModulesInfo.forEach((item: bundleManager.HapModuleInfo) => {
    total += item.extensionAbilitiesInfo.length;
  });
  return total;
}

function countModuleMetadata(info: bundleManager.BundleInfo): number {
  let total: number = 0;
  info.hapModulesInfo.forEach((item: bundleManager.HapModuleInfo) => {
    total += item.metadata.length;
  });
  return total;
}

function countExtensionMetadata(info: bundleManager.BundleInfo): number {
  let total: number = 0;
  info.hapModulesInfo.forEach((item: bundleManager.HapModuleInfo) => {
    item.extensionAbilitiesInfo.forEach((extension: bundleManager.ExtensionAbilityInfo) => {
      total += extension.metadata.length;
    });
  });
  return total;
}

function countSkills(info: bundleManager.BundleInfo): number {
  let total: number = 0;
  info.hapModulesInfo.forEach((item: bundleManager.HapModuleInfo) => {
    item.abilitiesInfo.forEach((ability: bundleManager.AbilityInfo) => {
      total += lenOf<bundleManager.Skill>(ability.skills);
    });
    item.extensionAbilitiesInfo.forEach((extension: bundleManager.ExtensionAbilityInfo) => {
      total += lenOf<bundleManager.Skill>(extension.skills);
    });
  });
  return total;
}

function moduleNamesJoined(info: bundleManager.BundleInfo): string {
  return info.hapModulesInfo.map((item: bundleManager.HapModuleInfo) => item.name).sort().join(',');
}

function abilityNamesJoined(info: bundleManager.BundleInfo): string {
  const names: string[] = [];
  info.hapModulesInfo.forEach((item: bundleManager.HapModuleInfo) => {
    item.abilitiesInfo.forEach((ability: bundleManager.AbilityInfo) => {
      names.push(ability.name);
    });
  });
  return names.sort().join(',');
}

function extensionNamesJoined(info: bundleManager.BundleInfo): string {
  const names: string[] = [];
  info.hapModulesInfo.forEach((item: bundleManager.HapModuleInfo) => {
    item.extensionAbilitiesInfo.forEach((extension: bundleManager.ExtensionAbilityInfo) => {
      names.push(extension.name);
    });
  });
  return names.sort().join(',');
}

function scalarKey(info: bundleManager.BundleInfo): string {
  return `${info.name}|${textOrEmpty(info.vendor)}|${info.versionCode}|${textOrEmpty(info.versionName)}|` +
    `${info.minCompatibleVersionCode}|${info.targetVersion}|${info.appIndex}`;
}

function timeKey(info: bundleManager.BundleInfo): string {
  return `${info.installTime}|${info.updateTime}`;
}

function uidKey(info: bundleManager.BundleInfo): string {
  return `${info.appInfo.uid}|${info.appInfo.accessTokenId}`;
}

function moduleOrNone(info: bundleManager.BundleInfo,
  name: string): bundleManager.HapModuleInfo | undefined {
  return info.hapModulesInfo.find((item: bundleManager.HapModuleInfo) => item.name === name);
}

function moduleNameList(): string {
  return [ENTRY_MODULE, TEST_MODULE].sort().join(',');
}

function digitOnly(value: string): boolean {
  if (value.length === EMPTY_LENGTH) {
    return false;
  }
  for (let index = 0; index < value.length; index++) {
    const code: number = value.charCodeAt(index);
    if (code < 48 || code > 57) {
      return false;
    }
  }
  return true;
}

function appIdShaped(appId: string): boolean {
  const prefixed: boolean = appId.indexOf(BUNDLE_NAME) >= 0;
  return prefixed || digitOnly(appId);
}

function distinctCount(values: string[]): number {
  const seen: Set<string> = new Set<string>();
  values.forEach((value: string) => {
    seen.add(value);
  });
  return seen.size;
}

function firstAbilityOf(module: bundleManager.HapModuleInfo): bundleManager.AbilityInfo {
  return module.abilitiesInfo[0];
}

function firstExtensionOf(module: bundleManager.HapModuleInfo): bundleManager.ExtensionAbilityInfo {
  return module.extensionAbilitiesInfo[0];
}

class FlagShape {
  readonly moduleCount: number;
  readonly abilityCount: number;
  readonly extensionCount: number;
  readonly moduleMetadataCount: number;
  readonly extensionMetadataCount: number;
  readonly skillCount: number;
  readonly appName: string;
  readonly permissionCount: number;

  constructor(info: bundleManager.BundleInfo) {
    this.moduleCount = countModules(info);
    this.abilityCount = countAbilities(info);
    this.extensionCount = countExtensions(info);
    this.moduleMetadataCount = countModuleMetadata(info);
    this.extensionMetadataCount = countExtensionMetadata(info);
    this.skillCount = countSkills(info);
    this.appName = info.appInfo === undefined || info.appInfo === null ? '' : textOrEmpty(info.appInfo.name);
    this.permissionCount = lenOf<bundleManager.ReqPermissionDetail>(info.reqPermissionDetails);
  }

  key(): string {
    return `${this.moduleCount}|${this.abilityCount}|${this.extensionCount}|${this.moduleMetadataCount}|` +
      `${this.extensionMetadataCount}|${this.skillCount}|${this.appName}|${this.permissionCount}`;
  }
}

interface FlagRow {
  readonly label: string;
  readonly flags: number;
  readonly wantsModules: boolean;
  readonly wantsAbility: boolean;
  readonly wantsExtension: boolean;
  readonly wantsMetadata: boolean;
  readonly wantsSkill: boolean;
}

class FlagRowSpec implements FlagRow {
  readonly label: string;
  readonly flags: number;
  readonly wantsModules: boolean;
  readonly wantsAbility: boolean;
  readonly wantsExtension: boolean;
  readonly wantsMetadata: boolean;
  readonly wantsSkill: boolean;

  constructor(label: string, flags: number, wantsModules: boolean, wantsAbility: boolean,
    wantsExtension: boolean, wantsMetadata: boolean, wantsSkill: boolean) {
    this.label = label;
    this.flags = flags;
    this.wantsModules = wantsModules;
    this.wantsAbility = wantsAbility;
    this.wantsExtension = wantsExtension;
    this.wantsMetadata = wantsMetadata;
    this.wantsSkill = wantsSkill;
  }
}

function makeRow(label: string, flags: number, wantsModules: boolean, wantsAbility: boolean,
  wantsExtension: boolean, wantsMetadata: boolean, wantsSkill: boolean): FlagRow {
  return new FlagRowSpec(label, flags, wantsModules, wantsAbility, wantsExtension, wantsMetadata,
    wantsSkill) as FlagRow;
}

function rowMatches(row: FlagRow, shape: FlagShape): boolean {
  const modulesOk: boolean = row.wantsModules ? shape.moduleCount === MODULE_TOTAL : shape.moduleCount === 0;
  const abilitiesOk: boolean = row.wantsAbility ? shape.abilityCount >= ABILITY_TOTAL : shape.abilityCount === 0;
  const extensionsOk: boolean = row.wantsExtension ? shape.extensionCount >= EXTENSION_TOTAL :
    shape.extensionCount === 0;
  const metadataOk: boolean = row.wantsMetadata ? shape.extensionMetadataCount >= EXTENSION_TOTAL :
    shape.extensionMetadataCount === 0 && shape.moduleMetadataCount === 0;
  const skillsOk: boolean = row.wantsSkill ? shape.skillCount >= ABILITY_TOTAL : shape.skillCount === 0;
  return modulesOk && abilitiesOk && extensionsOk && metadataOk && skillsOk;
}

const MATRIX_ROWS: FlagRow[] = [
  makeRow('default', FLAG_DEFAULT, false, false, false, false, false),
  makeRow('application', FLAG_APPLICATION, false, false, false, false, false),
  makeRow('module', MODULE_ONLY, true, false, false, false, false),
  makeRow('moduleAbility', MODULE_ABILITY, true, true, false, false, false),
  makeRow('moduleExtension', MODULE_EXTENSION, true, false, true, false, false),
  makeRow('moduleExtensionMetadata', MODULE_EXTENSION_METADATA, true, false, true, true, false),
  makeRow('moduleAbilitySkill', MODULE_ABILITY_SKILL, true, true, false, false, true),
  makeRow('full', FULL_FLAGS, true, true, true, true, true)
];

export default function bundleSelfInfoTest() {
  describe('BundleSelfInfo', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_0100
     * @tc.name      testBundleIdentity0001
     * @tc.desc      Check the self bundle name equals the declared bundle name, carries no padding and is repeated on
     *               the application info without diverging
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleIdentity0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const name: string = info.name;
      const appName: string = info.appInfo.name;
      const trimmed: boolean = name === name.trim();
      logCase('testBundleIdentity0001', `name=${name} appName=${appName} trimmed=${trimmed} ` +
        `length=${name.length}`);
      expect(name).assertEqual(BUNDLE_NAME);
      expect(appName).assertEqual(BUNDLE_NAME);
      expect(trimmed).assertTrue();
      expect(name.length > EMPTY_LENGTH).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_0200
     * @tc.name      testBundleIdentity0002
     * @tc.desc      Check the bundle name splits into the three declared segments and rebuilds to the same value
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleIdentity0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const segments: string[] = info.name.split('.');
      const rebuilt: string = segments.join('.');
      const segmentTotal: number = segments.length;
      logCase('testBundleIdentity0002', `segments=${segments.join('|')} total=${segmentTotal} ` +
        `rebuilt=${rebuilt}`);
      expect(segmentTotal).assertEqual(BUNDLE_SEGMENT_TOTAL);
      expect(segments[0]).assertEqual(BUNDLE_SEGMENTS[0]);
      expect(segments[1]).assertEqual(BUNDLE_SEGMENTS[1]);
      expect(segments[2]).assertEqual(BUNDLE_SEGMENTS[2]);
      expect(rebuilt).assertEqual(BUNDLE_NAME);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_0300
     * @tc.name      testBundleIdentity0003
     * @tc.desc      Check the vendor field matches app.json5 and does not change between two consecutive queries
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: bundleManager.BundleInfo = await selfBundle();
      const second: bundleManager.BundleInfo = await selfBundle();
      const vendor: string = first.vendor;
      const trimmed: boolean = vendor === vendor.trim();
      const stable: boolean = vendor === second.vendor;
      logCase('testBundleIdentity0003', `vendor=${vendor} trimmed=${trimmed} stable=${stable} ` +
        `length=${vendor.length}`);
      expect(vendor).assertEqual(APP_VENDOR);
      expect(trimmed).assertTrue();
      expect(vendor.length > EMPTY_LENGTH).assertTrue();
      expect(stable).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_0400
     * @tc.name      testBundleIdentity0004
     * @tc.desc      Check the version code matches build-profile.json5, is a positive whole number and does not
     *               depend on the requested flags
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleIdentity0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const bare: bundleManager.BundleInfo = await infoWith(FLAG_DEFAULT);
      const versionCode: number = info.versionCode;
      const whole: boolean = Math.floor(versionCode) === versionCode;
      logCase('testBundleIdentity0004', `versionCode=${versionCode} whole=${whole} ` +
        `bare=${bare.versionCode}`);
      expect(versionCode).assertEqual(VERSION_CODE);
      expect(versionCode > EMPTY_LENGTH).assertTrue();
      expect(whole).assertTrue();
      expect(bare.versionCode).assertEqual(versionCode);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_0500
     * @tc.name      testBundleIdentity0005
     * @tc.desc      Check the version name matches app.json5, has three dot separated segments and is stable across
     *               repeated queries
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleIdentity0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const first: bundleManager.BundleInfo = await selfBundle();
      const second: bundleManager.BundleInfo = await selfBundle();
      const versionName: string = first.versionName;
      const segments: string[] = versionName.split('.');
      logCase('testBundleIdentity0005', `versionName=${versionName} segments=${segments.length} ` +
        `stable=${versionName === second.versionName}`);
      expect(versionName).assertEqual(VERSION_NAME);
      expect(segments.length).assertEqual(VERSION_SEGMENT_TOTAL);
      expect(versionName.length > EMPTY_LENGTH).assertTrue();
      expect(second.versionName).assertEqual(versionName);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_0600
     * @tc.name      testBundleIdentity0006
     * @tc.desc      Check the target version encodes the compile SDK 26.0.0 in both its high and low decimal parts
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const targetVersion: number = info.targetVersion;
      const lowPart: number = targetVersion % 1000;
      const highPart: number = Math.floor(targetVersion / 10000000);
      logCase('testBundleIdentity0006', `targetVersion=${targetVersion} high=${highPart} low=${lowPart} ` +
        `expected=${TARGET_VERSION}`);
      expect(targetVersion).assertEqual(TARGET_VERSION);
      expect(lowPart).assertEqual(TARGET_API);
      expect(highPart).assertEqual(TARGET_API);
      expect(targetVersion > info.versionCode).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_0700
     * @tc.name      testBundleIdentity0007
     * @tc.desc      Check the minimum compatible version code falls back to the version code because app.json5 does
     *               not declare one
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: bundleManager.BundleInfo = await selfBundle();
      const second: bundleManager.BundleInfo = await selfBundle();
      const minVersion: number = first.minCompatibleVersionCode;
      const notAbove: boolean = minVersion <= first.versionCode;
      logCase('testBundleIdentity0007', `minCompatibleVersionCode=${minVersion} versionCode=${first.versionCode} ` +
        `notAbove=${notAbove} stable=${minVersion === second.minCompatibleVersionCode}`);
      expect(minVersion).assertEqual(VERSION_CODE);
      expect(minVersion > EMPTY_LENGTH).assertTrue();
      expect(notAbove).assertTrue();
      expect(second.minCompatibleVersionCode).assertEqual(minVersion);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_0800
     * @tc.name      testBundleIdentity0008
     * @tc.desc      Check the signature app id is a non empty identifier without blanks and does not change while the
     *               process keeps running
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: bundleManager.BundleInfo = await infoWith(FLAG_SIGNATURE);
      const second: bundleManager.BundleInfo = await infoWith(FLAG_SIGNATURE);
      const appId: string = textOrEmpty(first.signatureInfo.appId);
      const shaped: boolean = appIdShaped(appId);
      const blankFree: boolean = appId.indexOf(' ') < 0;
      logCase('testBundleIdentity0008', `appId=${appId} shaped=${shaped} blankFree=${blankFree} ` +
        `length=${appId.length}`);
      expect(appId.length > EMPTY_LENGTH).assertTrue();
      expect(shaped).assertTrue();
      expect(blankFree).assertTrue();
      expect(textOrEmpty(second.signatureInfo.appId)).assertEqual(appId);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_0900
     * @tc.name      testBundleIdentity0009
     * @tc.desc      Check the app id reported for the signature flag alone equals the one reported by the full flag
     *               set, so extra flags never alter the identifier
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const bare: bundleManager.BundleInfo = await infoWith(FLAG_SIGNATURE);
      const full: bundleManager.BundleInfo = await infoWith(FULL_FLAGS);
      const bareId: string = textOrEmpty(bare.signatureInfo.appId);
      const fullId: string = textOrEmpty(full.signatureInfo.appId);
      const sameLength: boolean = bareId.length === fullId.length;
      logCase('testBundleIdentity0009', `bareId=${bareId} fullId=${fullId} sameLength=${sameLength}`);
      expect(fullId).assertEqual(bareId);
      expect(bareId.length > EMPTY_LENGTH).assertTrue();
      expect(sameLength).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_1000
     * @tc.name      testBundleIdentity0010
     * @tc.desc      Check the application uid equals the uid of the running test process and stays positive
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await infoWith(FULL_FLAGS);
      const uid: number = info.appInfo.uid;
      const matchesProcess: boolean = uid === process.uid;
      const positive: boolean = uid > 0;
      logCase('testBundleIdentity0010', `uid=${uid} processUid=${process.uid} matches=${matchesProcess} ` +
        `positive=${positive}`);
      expect(uid).assertEqual(process.uid);
      expect(matchesProcess).assertTrue();
      expect(positive).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_1100
     * @tc.name      testBundleIdentity0011
     * @tc.desc      Check the uid and the access token id survive two independent queries without drifting
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: bundleManager.BundleInfo = await infoWith(FLAG_APPLICATION);
      const second: bundleManager.BundleInfo = await infoWith(FLAG_APPLICATION);
      const firstKey: string = uidKey(first);
      const secondKey: string = uidKey(second);
      const uidMatches: boolean = first.appInfo.uid === second.appInfo.uid;
      logCase('testBundleIdentity0011', `first=${firstKey} second=${secondKey} uidMatches=${uidMatches}`);
      expect(secondKey).assertEqual(firstKey);
      expect(uidMatches).assertTrue();
      expect(first.appInfo.uid).assertEqual(process.uid);
      expect(second.appInfo.accessTokenId > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_1200
     * @tc.name      testBundleIdentity0012
     * @tc.desc      Check the app index is the primary instance and the bundle type is a third party application
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const appIndex: number = info.appIndex;
      const appInfoIndex: number = info.appInfo.appIndex;
      const bundleType: bundleManager.BundleType = info.appInfo.bundleType;
      logCase('testBundleIdentity0012', `appIndex=${appIndex} appInfoIndex=${appInfoIndex} bundleType=${bundleType}`);
      expect(appIndex).assertEqual(APP_INDEX);
      expect(appInfoIndex).assertEqual(APP_INDEX);
      expect(bundleType).assertEqual(bundleManager.BundleType.APP);
      expect(info.appInfo.name).assertEqual(info.name);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_1300
     * @tc.name      testBundleIdentity0013
     * @tc.desc      Check the application process name, token id and enabled state describe a live debug application
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await infoWith(FULL_FLAGS);
      const app: bundleManager.ApplicationInfo = info.appInfo;
      const processName: string = app.process;
      const tokenId: number = app.accessTokenId;
      logCase('testBundleIdentity0013', `process=${processName} tokenId=${tokenId} enabled=${app.enabled} ` +
        `uid=${app.uid}`);
      expect(processName).assertEqual(BUNDLE_NAME);
      expect(tokenId > 0).assertTrue();
      expect(app.enabled).assertTrue();
      expect(app.uid).assertEqual(info.appInfo.uid);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_1400
     * @tc.name      testBundleIdentity0014
     * @tc.desc      Check the install and update timestamps are positive, ordered and immovable between queries
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: bundleManager.BundleInfo = await infoWith(FLAG_DEFAULT);
      const second: bundleManager.BundleInfo = await infoWith(FLAG_DEFAULT);
      const ordered: boolean = first.updateTime >= first.installTime;
      logCase('testBundleIdentity0014', `installTime=${first.installTime} updateTime=${first.updateTime} ` +
        `ordered=${ordered} firstKey=${timeKey(first)}`);
      expect(first.installTime > 0).assertTrue();
      expect(first.updateTime > 0).assertTrue();
      expect(ordered).assertTrue();
      expect(timeKey(second)).assertEqual(timeKey(first));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_1500
     * @tc.name      testBundleIdentity0015
     * @tc.desc      Check two independent bundle queries report stable installation timestamps, with a positive
     *               integer first install time when present and a nonnegative integer current install time
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleIdentity0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await infoWith(FLAG_DEFAULT);
      const second: bundleManager.BundleInfo = await infoWith(FLAG_DEFAULT);
      const firstInstall: number | undefined = info.firstInstallTime;
      const firstText: string = firstInstall === undefined ? 'absent' : firstInstall.toString();
      logCase('testBundleIdentity0015', `firstInstallTime=${firstText} installTime=${info.installTime} ` +
        `secondInstallTime=${second.installTime}`);
      expect(firstInstall).assertEqual(second.firstInstallTime);
      expect(info.installTime).assertEqual(second.installTime);
      expect(Number.isInteger(info.installTime) && info.installTime >= 0).assertTrue();
      if (firstInstall !== undefined) {
        expect(Number.isInteger(firstInstall) && firstInstall > 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_1600
     * @tc.name      testBundleIdentity0016
     * @tc.desc      Check the signature fingerprint is a stable non empty digest that is reported identically for the
     *               bare signature flag and the full flag set
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleIdentity0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const bare: bundleManager.BundleInfo = await infoWith(FLAG_SIGNATURE);
      const full: bundleManager.BundleInfo = await infoWith(FULL_FLAGS);
      const fingerprint: string = textOrEmpty(bare.signatureInfo.fingerprint);
      const sameDigest: boolean = fingerprint === textOrEmpty(full.signatureInfo.fingerprint);
      logCase('testBundleIdentity0016', `fingerprint=${fingerprint} sameDigest=${sameDigest} ` +
        `length=${fingerprint.length}`);
      expect(fingerprint.length > EMPTY_LENGTH).assertTrue();
      expect(sameDigest).assertTrue();
      expect(textOrEmpty(bare.signatureInfo.appId).length > EMPTY_LENGTH).assertTrue();
    });
    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_1700
     * @tc.name      testBundleFlagMatrix0001
     * @tc.desc      Check the default flag returns only the base bundle identity without modules, abilities,
     *               extensions or an application block
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleFlagMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const flags: number = FLAG_DEFAULT;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const shape: FlagShape = new FlagShape(info);
      logCase('testBundleFlagMatrix0001', `flags=${flagSummary(flags)} shape=${shape.key()} name=${info.name}`);
      expect(shape.moduleCount).assertEqual(EMPTY_LENGTH);
      expect(shape.abilityCount).assertEqual(EMPTY_LENGTH);
      expect(shape.extensionCount).assertEqual(EMPTY_LENGTH);
      expect(shape.appName.length).assertEqual(EMPTY_LENGTH);
      expect(info.name).assertEqual(BUNDLE_NAME);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_1800
     * @tc.name      testBundleFlagMatrix0002
     * @tc.desc      Check the application flag alone populates the application info block and nothing else
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleFlagMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const flags: number = FLAG_APPLICATION;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const shape: FlagShape = new FlagShape(info);
      logCase('testBundleFlagMatrix0002', `flags=${flagSummary(flags)} shape=${shape.key()} uid=${info.appInfo.uid}`);
      expect(shape.appName).assertEqual(BUNDLE_NAME);
      expect(shape.moduleCount).assertEqual(EMPTY_LENGTH);
      expect(shape.permissionCount).assertEqual(EMPTY_LENGTH);
      expect(info.appInfo.uid).assertEqual(process.uid);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_1900
     * @tc.name      testBundleFlagMatrix0003
     * @tc.desc      Check the HAP module flag alone populates the module list of the installed feature modules
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleFlagMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const flags: number = MODULE_ONLY;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const shape: FlagShape = new FlagShape(info);
      const names: string = moduleNamesJoined(info);
      logCase('testBundleFlagMatrix0003', `flags=${flagSummary(flags)} shape=${shape.key()} names=${names}`);
      expect(shape.moduleCount).assertEqual(MODULE_TOTAL);
      expect(names).assertEqual(moduleNameList());
      expect(shape.appName.length).assertEqual(EMPTY_LENGTH);
      expect(shape.abilityCount).assertEqual(EMPTY_LENGTH);
      expect(shape.extensionCount).assertEqual(EMPTY_LENGTH);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_2000
     * @tc.name      testBundleFlagMatrix0004
     * @tc.desc      Check the ability flag cannot be used on its own: without the HAP module flag no module and thus no
     *               ability is reported
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleFlagMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const flags: number = FLAG_ABILITY;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const shape: FlagShape = new FlagShape(info);
      logCase('testBundleFlagMatrix0004', `flags=${flagSummary(flags)} shape=${shape.key()}`);
      expect(shape.moduleCount).assertEqual(EMPTY_LENGTH);
      expect(shape.abilityCount).assertEqual(EMPTY_LENGTH);
      expect(shape.appName.length).assertEqual(EMPTY_LENGTH);
      expect(info.hapModulesInfo.length).assertEqual(EMPTY_LENGTH);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_2100
     * @tc.name      testBundleFlagMatrix0005
     * @tc.desc      Check the extension ability flag cannot be used on its own and therefore yields no extension
     *               entry
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleFlagMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const flags: number = FLAG_EXTENSION;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const shape: FlagShape = new FlagShape(info);
      logCase('testBundleFlagMatrix0005', `flags=${flagSummary(flags)} shape=${shape.key()}`);
      expect(shape.moduleCount).assertEqual(EMPTY_LENGTH);
      expect(shape.extensionCount).assertEqual(EMPTY_LENGTH);
      expect(shape.abilityCount).assertEqual(EMPTY_LENGTH);
      expect(shape.appName.length).assertEqual(EMPTY_LENGTH);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_2200
     * @tc.name      testBundleFlagMatrix0006
     * @tc.desc      Check the metadata flag cannot be used on its own and therefore leaves both metadata collections
     *               empty
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleFlagMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const flags: number = FLAG_METADATA;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const shape: FlagShape = new FlagShape(info);
      logCase('testBundleFlagMatrix0006', `flags=${flagSummary(flags)} shape=${shape.key()}`);
      expect(shape.moduleCount).assertEqual(EMPTY_LENGTH);
      expect(shape.moduleMetadataCount).assertEqual(EMPTY_LENGTH);
      expect(shape.extensionMetadataCount).assertEqual(EMPTY_LENGTH);
      expect(shape.appName.length).assertEqual(EMPTY_LENGTH);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_2300
     * @tc.name      testBundleFlagMatrix0007
     * @tc.desc      Check the skill flag cannot be used on its own and therefore reports no skill at all
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleFlagMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const flags: number = FLAG_SKILL;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const shape: FlagShape = new FlagShape(info);
      logCase('testBundleFlagMatrix0007', `flags=${flagSummary(flags)} shape=${shape.key()}`);
      expect(shape.moduleCount).assertEqual(EMPTY_LENGTH);
      expect(shape.skillCount).assertEqual(EMPTY_LENGTH);
      expect(shape.abilityCount).assertEqual(EMPTY_LENGTH);
      expect(shape.extensionCount).assertEqual(EMPTY_LENGTH);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_2400
     * @tc.name      testBundleFlagMatrix0008
     * @tc.desc      Check the requested permission flag alone returns empty permission arrays because the sample
     *               declares no permission at all
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleFlagMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const flags: number = FLAG_PERMISSION;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const shape: FlagShape = new FlagShape(info);
      logCase('testBundleFlagMatrix0008', `flags=${flagSummary(flags)} details=${info.reqPermissionDetails.length} ` +
        `grantStates=${info.permissionGrantStates.length}`);
      expect(info.reqPermissionDetails.length).assertEqual(EMPTY_LENGTH);
      expect(info.permissionGrantStates.length).assertEqual(EMPTY_LENGTH);
      expect(shape.moduleCount).assertEqual(EMPTY_LENGTH);
      expect(info.name).assertEqual(BUNDLE_NAME);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_2500
     * @tc.name      testBundleFlagMatrix0009
     * @tc.desc      Check the signature flag alone fills the signature block while the application and module blocks
     *               stay empty
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleFlagMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const flags: number = FLAG_SIGNATURE;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const shape: FlagShape = new FlagShape(info);
      const appId: string = textOrEmpty(info.signatureInfo.appId);
      const fingerprint: string = textOrEmpty(info.signatureInfo.fingerprint);
      logCase('testBundleFlagMatrix0009', `flags=${flagSummary(flags)} appId=${appId} ` +
        `fingerprintLength=${fingerprint.length} shape=${shape.key()}`);
      expect(appId.length > EMPTY_LENGTH).assertTrue();
      expect(fingerprint.length > EMPTY_LENGTH).assertTrue();
      expect(shape.moduleCount).assertEqual(EMPTY_LENGTH);
      expect(shape.appName.length).assertEqual(EMPTY_LENGTH);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_2600
     * @tc.name      testBundleFlagMatrix0010
     * @tc.desc      Check the application and signature flags combine so that both blocks are available from one
     *               query while the module list stays empty
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleFlagMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const flags: number = FLAG_APPLICATION | FLAG_SIGNATURE;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const shape: FlagShape = new FlagShape(info);
      const appId: string = textOrEmpty(info.signatureInfo.appId);
      logCase('testBundleFlagMatrix0010', `flags=${flagSummary(flags)} shape=${shape.key()} appId=${appId}`);
      expect(shape.appName).assertEqual(BUNDLE_NAME);
      expect(appId.length > EMPTY_LENGTH).assertTrue();
      expect(shape.moduleCount).assertEqual(EMPTY_LENGTH);
      expect(info.appInfo.uid).assertEqual(process.uid);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_2700
     * @tc.name      testBundleFlagMatrix0011
     * @tc.desc      Check the application and metadata flags combine so the application block is readable and its
     *               metadata collection is reported as empty
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleFlagMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const flags: number = FLAG_APPLICATION | FLAG_METADATA;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const shape: FlagShape = new FlagShape(info);
      const appMetadata: number = info.appInfo.metadataArray.length;
      logCase('testBundleFlagMatrix0011', `flags=${flagSummary(flags)} shape=${shape.key()} ` +
        `appMetadata=${appMetadata}`);
      expect(shape.appName).assertEqual(BUNDLE_NAME);
      expect(appMetadata).assertEqual(EMPTY_LENGTH);
      expect(shape.moduleCount).assertEqual(EMPTY_LENGTH);
      expect(shape.permissionCount).assertEqual(EMPTY_LENGTH);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_2800
     * @tc.name      testBundleFlagMatrix0012
     * @tc.desc      Check the module and ability flags report the single EntryAbility of the entry module and no
     *               extension ability
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleFlagMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const flags: number = MODULE_ABILITY;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const ability: bundleManager.AbilityInfo = firstAbilityOf(entry);
      const shape: FlagShape = new FlagShape(info);
      logCase('testBundleFlagMatrix0012', `flags=${flagSummary(flags)} shape=${shape.key()} ` +
        `entryAbilities=${entry.abilitiesInfo.length}`);
      expect(shape.moduleCount).assertEqual(MODULE_TOTAL);
      expect(entry.abilitiesInfo.length).assertEqual(ABILITY_TOTAL);
      expect(ability.name).assertEqual(ENTRY_ABILITY);
      expect(shape.extensionCount).assertEqual(EMPTY_LENGTH);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_2900
     * @tc.name      testBundleFlagMatrix0013
     * @tc.desc      Check the module and extension flags report the single EntryBackupAbility of the entry module and
     *               no page ability
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleFlagMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const flags: number = MODULE_EXTENSION;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const extension: bundleManager.ExtensionAbilityInfo = firstExtensionOf(entry);
      const shape: FlagShape = new FlagShape(info);
      logCase('testBundleFlagMatrix0013', `flags=${flagSummary(flags)} shape=${shape.key()} ` +
        `entryExtensions=${entry.extensionAbilitiesInfo.length}`);
      expect(shape.moduleCount).assertEqual(MODULE_TOTAL);
      expect(entry.extensionAbilitiesInfo.length).assertEqual(EXTENSION_TOTAL);
      expect(extension.name).assertEqual(BACKUP_ABILITY);
      expect(shape.abilityCount).assertEqual(EMPTY_LENGTH);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_3000
     * @tc.name      testBundleFlagMatrix0014
     * @tc.desc      Check the module and metadata flags report two modules with an empty module level metadata
     *               collection because the sample declares none
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleFlagMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const flags: number = FLAG_MODULE | FLAG_METADATA;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const shape: FlagShape = new FlagShape(info);
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleFlagMatrix0014', `flags=${flagSummary(flags)} shape=${shape.key()} ` +
        `entryMetadata=${entry.metadata.length}`);
      expect(shape.moduleCount).assertEqual(MODULE_TOTAL);
      expect(entry.metadata.length).assertEqual(EMPTY_LENGTH);
      expect(shape.moduleMetadataCount).assertEqual(EMPTY_LENGTH);
      expect(shape.extensionCount).assertEqual(EMPTY_LENGTH);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_3100
     * @tc.name      testBundleFlagMatrix0015
     * @tc.desc      Check the module and skill flags report two modules but no skill because the ability flag is
     *               missing from the combination
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleFlagMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const flags: number = FLAG_MODULE | FLAG_SKILL;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const shape: FlagShape = new FlagShape(info);
      logCase('testBundleFlagMatrix0015', `flags=${flagSummary(flags)} shape=${shape.key()}`);
      expect(shape.moduleCount).assertEqual(MODULE_TOTAL);
      expect(shape.abilityCount).assertEqual(EMPTY_LENGTH);
      expect(shape.skillCount).assertEqual(EMPTY_LENGTH);
      expect(shape.extensionCount).assertEqual(EMPTY_LENGTH);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_3200
     * @tc.name      testBundleFlagMatrix0016
     * @tc.desc      Check the module and permission flags keep the permission arrays empty while the module list is
     *               complete
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleFlagMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const flags: number = FLAG_MODULE | FLAG_PERMISSION;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const shape: FlagShape = new FlagShape(info);
      logCase('testBundleFlagMatrix0016', `flags=${flagSummary(flags)} shape=${shape.key()} ` +
        `details=${info.reqPermissionDetails.length}`);
      expect(shape.moduleCount).assertEqual(MODULE_TOTAL);
      expect(shape.permissionCount).assertEqual(EMPTY_LENGTH);
      expect(info.permissionGrantStates.length).assertEqual(EMPTY_LENGTH);
      expect(shape.appName.length).assertEqual(EMPTY_LENGTH);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_3300
     * @tc.name      testBundleFlagMatrix0017
     * @tc.desc      Check the module, ability and skill flags expose the single home skill of EntryAbility with its
     *               action and entity
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleFlagMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const flags: number = MODULE_ABILITY_SKILL;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const ability: bundleManager.AbilityInfo = firstAbilityOf(entry);
      const skills: bundleManager.Skill[] = ability.skills;
      logCase('testBundleFlagMatrix0017', `flags=${flagSummary(flags)} skills=${skills.length} ` +
        `actions=${skills.map((skill: bundleManager.Skill) => skill.actions.join(',')).join(';')}`);
      expect(skills.length).assertEqual(ABILITY_TOTAL);
      expect(skills[0].actions.join(',')).assertEqual(HOME_ACTION);
      expect(skills[0].entities.join(',')).assertEqual(HOME_ENTITY);
      expect(skills[0].uris.length).assertEqual(NO_SKILL_URI);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_3400
     * @tc.name      testBundleFlagMatrix0018
     * @tc.desc      Check the module, ability and metadata flags expose EntryAbility with an empty metadata and skill
     *               collection because it declares neither
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleFlagMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const flags: number = MODULE_ABILITY_METADATA;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const ability: bundleManager.AbilityInfo = firstAbilityOf(entry);
      logCase('testBundleFlagMatrix0018', `flags=${flagSummary(flags)} ability=${ability.name} ` +
        `metadata=${ability.metadata.length} skills=${ability.skills.length}`);
      expect(entry.abilitiesInfo.length).assertEqual(ABILITY_TOTAL);
      expect(ability.metadata.length).assertEqual(EMPTY_LENGTH);
      expect(ability.skills.length).assertEqual(EMPTY_LENGTH);
      expect(ability.name).assertEqual(ENTRY_ABILITY);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_3500
     * @tc.name      testBundleFlagMatrix0019
     * @tc.desc      Check the module, extension and metadata flags expose the backup metadata of EntryBackupAbility
     *               with its profile resource
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleFlagMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const flags: number = MODULE_EXTENSION_METADATA;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const extension: bundleManager.ExtensionAbilityInfo = firstExtensionOf(entry);
      const metadata: bundleManager.Metadata[] = extension.metadata;
      logCase('testBundleFlagMatrix0019', `flags=${flagSummary(flags)} metadata=${metadata.length} ` +
        `name=${metadata.length > 0 ? metadata[0].name : ''}`);
      expect(metadata.length).assertEqual(EXTENSION_TOTAL);
      expect(metadata[0].name).assertEqual(BACKUP_METADATA);
      expect(metadata[0].resource).assertEqual(BACKUP_RESOURCE);
      expect(extension.name).assertEqual(BACKUP_ABILITY);
    });
    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_3600
     * @tc.name      testBundleFlagMatrix0020
     * @tc.desc      Check the module, extension and skill flags expose the backup extension without metadata and
     *               without any skill, because it declares none
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleFlagMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const flags: number = MODULE_EXTENSION_SKILL;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const extension: bundleManager.ExtensionAbilityInfo = firstExtensionOf(entry);
      const shape: FlagShape = new FlagShape(info);
      logCase('testBundleFlagMatrix0020', `flags=${flagSummary(flags)} shape=${shape.key()} ` +
        `extension=${extension.name} skills=${extension.skills.length}`);
      expect(shape.extensionCount).assertEqual(EXTENSION_TOTAL);
      expect(extension.metadata.length).assertEqual(EMPTY_LENGTH);
      expect(extension.skills.length).assertEqual(EMPTY_LENGTH);
      expect(shape.abilityCount).assertEqual(EMPTY_LENGTH);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_3700
     * @tc.name      testBundleFlagMatrix0021
     * @tc.desc      Check the application and module flags report the application name together with the complete
     *               module list but no ability
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleFlagMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const flags: number = APP_MODULE;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const shape: FlagShape = new FlagShape(info);
      logCase('testBundleFlagMatrix0021', `flags=${flagSummary(flags)} shape=${shape.key()} ` +
        `names=${moduleNamesJoined(info)}`);
      expect(shape.appName).assertEqual(BUNDLE_NAME);
      expect(shape.moduleCount).assertEqual(MODULE_TOTAL);
      expect(shape.abilityCount).assertEqual(EMPTY_LENGTH);
      expect(shape.extensionCount).assertEqual(EMPTY_LENGTH);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_3800
     * @tc.name      testBundleFlagMatrix0022
     * @tc.desc      Check the application, module and ability flags report the application name and the single page
     *               ability of the entry module
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleFlagMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const flags: number = APP_MODULE_ABILITY;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const ability: bundleManager.AbilityInfo = firstAbilityOf(entry);
      const shape: FlagShape = new FlagShape(info);
      logCase('testBundleFlagMatrix0022', `flags=${flagSummary(flags)} shape=${shape.key()} ` +
        `ability=${ability.name}`);
      expect(shape.appName).assertEqual(BUNDLE_NAME);
      expect(entry.abilitiesInfo.length).assertEqual(ABILITY_TOTAL);
      expect(ability.name).assertEqual(ENTRY_ABILITY);
      expect(shape.extensionCount).assertEqual(EMPTY_LENGTH);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_3900
     * @tc.name      testBundleFlagMatrix0023
     * @tc.desc      Check the application, module and extension flags report the application name and the backup
     *               extension without any page ability
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleFlagMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const flags: number = APP_MODULE_EXTENSION;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const extension: bundleManager.ExtensionAbilityInfo = firstExtensionOf(entry);
      const shape: FlagShape = new FlagShape(info);
      logCase('testBundleFlagMatrix0023', `flags=${flagSummary(flags)} shape=${shape.key()} ` +
        `extension=${extension.name}`);
      expect(shape.appName).assertEqual(BUNDLE_NAME);
      expect(entry.extensionAbilitiesInfo.length).assertEqual(EXTENSION_TOTAL);
      expect(extension.name).assertEqual(BACKUP_ABILITY);
      expect(shape.abilityCount).assertEqual(EMPTY_LENGTH);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_4000
     * @tc.name      testBundleFlagMatrix0024
     * @tc.desc      Check the application, module and skill flags leave the skill collection empty because the
     *               ability flag is required to walk the ability skills
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleFlagMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const flags: number = APP_MODULE_SKILL;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const shape: FlagShape = new FlagShape(info);
      logCase('testBundleFlagMatrix0024', `flags=${flagSummary(flags)} shape=${shape.key()}`);
      expect(shape.appName).assertEqual(BUNDLE_NAME);
      expect(shape.moduleCount).assertEqual(MODULE_TOTAL);
      expect(shape.abilityCount).assertEqual(EMPTY_LENGTH);
      expect(shape.skillCount).assertEqual(EMPTY_LENGTH);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_4100
     * @tc.name      testBundleFlagMatrix0025
     * @tc.desc      Check the application and ability flags without the module flag report the application name but
     *               still no ability
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleFlagMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const flags: number = FLAG_APPLICATION | FLAG_ABILITY;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const shape: FlagShape = new FlagShape(info);
      logCase('testBundleFlagMatrix0025', `flags=${flagSummary(flags)} shape=${shape.key()}`);
      expect(shape.appName).assertEqual(BUNDLE_NAME);
      expect(shape.moduleCount).assertEqual(EMPTY_LENGTH);
      expect(shape.abilityCount).assertEqual(EMPTY_LENGTH);
      expect(info.appInfo.uid).assertEqual(process.uid);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_4200
     * @tc.name      testBundleFlagMatrix0026
     * @tc.desc      Check the first step of the cumulative flag ladder: the application flag alone fills the
     *               application block and leaves every array empty
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleFlagMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const flags: number = STEP_APP;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const shape: FlagShape = new FlagShape(info);
      logCase('testBundleFlagMatrix0026', `flags=${flagSummary(flags)} shape=${shape.key()}`);
      expect(shape.appName).assertEqual(BUNDLE_NAME);
      expect(shape.moduleCount).assertEqual(EMPTY_LENGTH);
      expect(shape.abilityCount).assertEqual(EMPTY_LENGTH);
      expect(shape.skillCount).assertEqual(EMPTY_LENGTH);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_4300
     * @tc.name      testBundleFlagMatrix0027
     * @tc.desc      Check the second step of the cumulative flag ladder: adding the module flag brings in the module
     *               list but still no ability
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleFlagMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const flags: number = STEP_MODULE;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const shape: FlagShape = new FlagShape(info);
      logCase('testBundleFlagMatrix0027', `flags=${flagSummary(flags)} shape=${shape.key()}`);
      expect(shape.moduleCount).assertEqual(MODULE_TOTAL);
      expect(shape.appName).assertEqual(BUNDLE_NAME);
      expect(shape.abilityCount).assertEqual(EMPTY_LENGTH);
      expect(shape.extensionCount).assertEqual(EMPTY_LENGTH);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_4400
     * @tc.name      testBundleFlagMatrix0028
     * @tc.desc      Check the third step of the cumulative flag ladder: adding the ability flag fills the entry
     *               ability list while extensions stay empty
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleFlagMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const flags: number = STEP_ABILITY;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const ability: bundleManager.AbilityInfo = firstAbilityOf(entry);
      const shape: FlagShape = new FlagShape(info);
      logCase('testBundleFlagMatrix0028', `flags=${flagSummary(flags)} shape=${shape.key()} ` +
        `ability=${ability.name}`);
      expect(entry.abilitiesInfo.length).assertEqual(ABILITY_TOTAL);
      expect(ability.name).assertEqual(ENTRY_ABILITY);
      expect(shape.extensionCount).assertEqual(EMPTY_LENGTH);
      expect(shape.moduleCount).assertEqual(MODULE_TOTAL);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_4500
     * @tc.name      testBundleFlagMatrix0029
     * @tc.desc      Check the fourth step of the cumulative flag ladder: adding the extension flag keeps the page
     *               ability and adds the backup extension
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleFlagMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const flags: number = STEP_EXTENSION;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const extension: bundleManager.ExtensionAbilityInfo = firstExtensionOf(entry);
      const shape: FlagShape = new FlagShape(info);
      logCase('testBundleFlagMatrix0029', `flags=${flagSummary(flags)} shape=${shape.key()} ` +
        `extension=${extension.name}`);
      expect(entry.abilitiesInfo.length >= ABILITY_TOTAL).assertTrue();
      expect(shape.abilityCount >= ABILITY_TOTAL).assertTrue();
      expect(entry.extensionAbilitiesInfo.length).assertEqual(EXTENSION_TOTAL);
      expect(extension.name).assertEqual(BACKUP_ABILITY);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_4600
     * @tc.name      testBundleFlagMatrix0030
     * @tc.desc      Check the fifth step of the cumulative flag ladder: adding the metadata flag exposes the backup
     *               metadata of the extension ability
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleFlagMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const flags: number = STEP_METADATA;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const extension: bundleManager.ExtensionAbilityInfo = firstExtensionOf(entry);
      const shape: FlagShape = new FlagShape(info);
      logCase('testBundleFlagMatrix0030', `flags=${flagSummary(flags)} shape=${shape.key()} ` +
        `metadata=${extension.metadata.length}`);
      expect(extension.metadata.length).assertEqual(EXTENSION_TOTAL);
      expect(shape.extensionMetadataCount).assertEqual(EXTENSION_TOTAL);
      expect(shape.abilityCount >= ABILITY_TOTAL).assertTrue();
      expect(shape.skillCount).assertEqual(EMPTY_LENGTH);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_4700
     * @tc.name      testBundleFlagMatrix0031
     * @tc.desc      Check the last step of the cumulative flag ladder: adding the skill flag exposes the home skill
     *               while the extension metadata is kept
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleFlagMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const flags: number = STEP_SKILL;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const shape: FlagShape = new FlagShape(info);
      const skills: string = abilityNamesJoined(info);
      logCase('testBundleFlagMatrix0031', `flags=${flagSummary(flags)} shape=${shape.key()} abilities=${skills}`);
      expect(shape.skillCount >= ABILITY_TOTAL).assertTrue();
      expect(shape.extensionMetadataCount).assertEqual(EXTENSION_TOTAL);
      expect(shape.moduleCount).assertEqual(MODULE_TOTAL);
      expect(skills.indexOf(ENTRY_ABILITY) >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_4800
     * @tc.name      testBundleFlagMatrix0032
     * @tc.desc      Check the shared self flags expose every populated collection of the sample in a single query
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleFlagMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const flags: number = SELF_FLAGS;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const shape: FlagShape = new FlagShape(info);
      logCase('testBundleFlagMatrix0032', `flags=${flagSummary(flags)} shape=${shape.key()}`);
      expect(shape.moduleCount).assertEqual(MODULE_TOTAL);
      expect(shape.abilityCount >= ABILITY_TOTAL).assertTrue();
      expect(shape.extensionCount).assertEqual(EXTENSION_TOTAL);
      expect(shape.extensionMetadataCount).assertEqual(EXTENSION_TOTAL);
      expect(shape.skillCount >= ABILITY_TOTAL).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_4900
     * @tc.name      testBundleFlagMatrix0033
     * @tc.desc      Check the widest flag set used by this suite adds the signature block and keeps every populated
     *               collection of the narrower self flags
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleFlagMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const flags: number = FULL_FLAGS;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const narrow: bundleManager.BundleInfo = await infoWith(SELF_FLAGS);
      const shape: FlagShape = new FlagShape(info);
      logCase('testBundleFlagMatrix0033', `flags=${flagSummary(flags)} shape=${shape.key()} ` +
        `appId=${textOrEmpty(info.signatureInfo.appId)}`);
      expect(textOrEmpty(info.signatureInfo.appId).length > EMPTY_LENGTH).assertTrue();
      expect(moduleNamesJoined(info)).assertEqual(moduleNamesJoined(narrow));
      expect(shape.extensionCount).assertEqual(EXTENSION_TOTAL);
      expect(shape.permissionCount).assertEqual(EMPTY_LENGTH);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_5000
     * @tc.name      testBundleFlagMatrix0034
     * @tc.desc      Check the application and permission flags report the application block and empty permission
     *               arrays without touching the module list
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleFlagMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const flags: number = FLAG_APPLICATION | FLAG_PERMISSION;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const shape: FlagShape = new FlagShape(info);
      logCase('testBundleFlagMatrix0034', `flags=${flagSummary(flags)} shape=${shape.key()}`);
      expect(shape.appName).assertEqual(BUNDLE_NAME);
      expect(shape.permissionCount).assertEqual(EMPTY_LENGTH);
      expect(shape.moduleCount).assertEqual(EMPTY_LENGTH);
      expect(info.reqPermissionDetails.length).assertEqual(EMPTY_LENGTH);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_5100
     * @tc.name      testBundleFlagMatrix0035
     * @tc.desc      Check the metadata and ability flags without the module flag report no module, no ability and no
     *               metadata at all
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleFlagMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const flags: number = FLAG_METADATA | FLAG_ABILITY;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const shape: FlagShape = new FlagShape(info);
      logCase('testBundleFlagMatrix0035', `flags=${flagSummary(flags)} shape=${shape.key()}`);
      expect(shape.moduleCount).assertEqual(EMPTY_LENGTH);
      expect(shape.abilityCount).assertEqual(EMPTY_LENGTH);
      expect(shape.moduleMetadataCount).assertEqual(EMPTY_LENGTH);
      expect(shape.extensionMetadataCount).assertEqual(EMPTY_LENGTH);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_5200
     * @tc.name      testBundleFlagMatrix0036
     * @tc.desc      Check the skill and ability flags without the module flag report no skill because there is no
     *               ability to walk
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleFlagMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const flags: number = FLAG_SKILL | FLAG_ABILITY;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const shape: FlagShape = new FlagShape(info);
      logCase('testBundleFlagMatrix0036', `flags=${flagSummary(flags)} shape=${shape.key()}`);
      expect(shape.moduleCount).assertEqual(EMPTY_LENGTH);
      expect(shape.skillCount).assertEqual(EMPTY_LENGTH);
      expect(shape.abilityCount).assertEqual(EMPTY_LENGTH);
      expect(shape.appName.length).assertEqual(EMPTY_LENGTH);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_5300
     * @tc.name      testBundleFlagMatrix0037
     * @tc.desc      Check the module, ability and extension flags together report exactly one page ability and one
     *               extension ability across the two modules
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleFlagMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const flags: number = MODULE_ALL_PARTS;
      const info: bundleManager.BundleInfo = await infoWith(flags);
      const shape: FlagShape = new FlagShape(info);
      logCase('testBundleFlagMatrix0037', `flags=${flagSummary(flags)} shape=${shape.key()} ` +
        `abilities=${abilityNamesJoined(info)} extensions=${extensionNamesJoined(info)}`);
      expect(shape.moduleCount).assertEqual(MODULE_TOTAL);
      expect(shape.abilityCount >= ABILITY_TOTAL).assertTrue();
      expect(shape.extensionCount).assertEqual(EXTENSION_TOTAL);
      expect(extensionNamesJoined(info)).assertEqual(BACKUP_ABILITY);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_5400
     * @tc.name      testBundleFlagMatrix0038
     * @tc.desc      Sweep the whole flag matrix and check every row reports exactly the collections its flags ask for
     *               and nothing more
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleFlagMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const failures: string[] = [];
      for (let index = 0; index < MATRIX_ROWS.length; index++) {
        const row: FlagRow = MATRIX_ROWS[index];
        const shape: FlagShape = new FlagShape(await infoWith(row.flags));
        if (!rowMatches(row, shape)) {
          failures.push(`${row.label}=${shape.key()}`);
        }
      }
      const labels: string[] = MATRIX_ROWS.map((row: FlagRow) => row.label);
      const distinct: number = distinctCount(labels);
      logCase('testBundleFlagMatrix0038', `rows=${MATRIX_ROWS.length} distinct=${distinct} ` +
        `failures=${failures.join(';')}`);
      expect(MATRIX_ROWS.length > EMPTY_LENGTH).assertTrue();
      expect(failures.length).assertEqual(EMPTY_LENGTH);
      expect(distinct).assertEqual(MATRIX_ROWS.length);
    });
    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_5500
     * @tc.name      testBundleConsistency0001
     * @tc.desc      Check four scalar identity fields come back unchanged from two independent full queries
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleConsistency0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: bundleManager.BundleInfo = await selfBundle();
      const second: bundleManager.BundleInfo = await selfBundle();
      const sameName: boolean = first.name === second.name;
      const sameCode: boolean = first.versionCode === second.versionCode;
      logCase('testBundleConsistency0001', `sameName=${sameName} sameCode=${sameCode} ` +
        `first=${first.name}@${first.versionCode} second=${second.name}@${second.versionCode}`);
      expect(sameName).assertTrue();
      expect(sameCode).assertTrue();
      expect(second.versionName).assertEqual(first.versionName);
      expect(second.targetVersion).assertEqual(first.targetVersion);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_5600
     * @tc.name      testBundleConsistency0002
     * @tc.desc      Check the scalar projection of the bundle info is byte identical across two queries and still
     *               carries the bundle name
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleConsistency0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: bundleManager.BundleInfo = await selfBundle();
      const second: bundleManager.BundleInfo = await selfBundle();
      const firstKey: string = scalarKey(first);
      const secondKey: string = scalarKey(second);
      const carriesName: boolean = firstKey.indexOf(BUNDLE_NAME) === 0;
      logCase('testBundleConsistency0002', `firstKey=${firstKey} secondKey=${secondKey} ` +
        `carriesName=${carriesName}`);
      expect(secondKey).assertEqual(firstKey);
      expect(carriesName).assertTrue();
      expect(firstKey.length > EMPTY_LENGTH).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_5700
     * @tc.name      testBundleConsistency0003
     * @tc.desc      Check the uid and token id pair is identical across two application queries and keeps matching
     *               the running process
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleConsistency0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: bundleManager.BundleInfo = await infoWith(FLAG_APPLICATION);
      const second: bundleManager.BundleInfo = await infoWith(FLAG_APPLICATION);
      const firstKey: string = uidKey(first);
      const secondKey: string = uidKey(second);
      logCase('testBundleConsistency0003', `firstKey=${firstKey} secondKey=${secondKey} ` +
        `processUid=${process.uid}`);
      expect(secondKey).assertEqual(firstKey);
      expect(first.appInfo.uid).assertEqual(process.uid);
      expect(second.appInfo.uid).assertEqual(process.uid);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_5800
     * @tc.name      testBundleConsistency0004
     * @tc.desc      Check the signature app id is reported identically by two queries that only ask for the
     *               signature block
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleConsistency0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: bundleManager.BundleInfo = await infoWith(FLAG_SIGNATURE);
      const second: bundleManager.BundleInfo = await infoWith(FLAG_SIGNATURE);
      const firstId: string = textOrEmpty(first.signatureInfo.appId);
      const secondId: string = textOrEmpty(second.signatureInfo.appId);
      logCase('testBundleConsistency0004', `firstId=${firstId} secondId=${secondId} shaped=${appIdShaped(firstId)}`);
      expect(secondId).assertEqual(firstId);
      expect(firstId.length > EMPTY_LENGTH).assertTrue();
      expect(appIdShaped(firstId)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_5900
     * @tc.name      testBundleConsistency0005
     * @tc.desc      Check the sorted module name list is identical across two queries and covers both installed
     *               modules
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleConsistency0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: bundleManager.BundleInfo = await selfBundle();
      const second: bundleManager.BundleInfo = await selfBundle();
      const firstNames: string = moduleNamesJoined(first);
      const secondNames: string = moduleNamesJoined(second);
      logCase('testBundleConsistency0005', `first=${firstNames} second=${secondNames} ` +
        `count=${first.hapModulesInfo.length}`);
      expect(secondNames).assertEqual(firstNames);
      expect(firstNames).assertEqual(moduleNameList());
      expect(second.hapModulesInfo.length).assertEqual(first.hapModulesInfo.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_6000
     * @tc.name      testBundleConsistency0006
     * @tc.desc      Check the sorted ability name list is identical across two queries and still names EntryAbility
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleConsistency0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: bundleManager.BundleInfo = await selfBundle();
      const second: bundleManager.BundleInfo = await selfBundle();
      const firstNames: string = abilityNamesJoined(first);
      const secondNames: string = abilityNamesJoined(second);
      const named: boolean = firstNames.indexOf(ENTRY_ABILITY) >= 0;
      logCase('testBundleConsistency0006', `first=${firstNames} second=${secondNames} named=${named}`);
      expect(secondNames).assertEqual(firstNames);
      expect(named).assertTrue();
      expect(countAbilities(second)).assertEqual(countAbilities(first));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_6100
     * @tc.name      testBundleConsistency0007
     * @tc.desc      Check the sorted extension name list is identical across two queries and still names the backup
     *               extension
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleConsistency0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: bundleManager.BundleInfo = await selfBundle();
      const second: bundleManager.BundleInfo = await selfBundle();
      const firstNames: string = extensionNamesJoined(first);
      const secondNames: string = extensionNamesJoined(second);
      logCase('testBundleConsistency0007', `first=${firstNames} second=${secondNames} ` +
        `total=${countExtensions(first)}`);
      expect(secondNames).assertEqual(firstNames);
      expect(firstNames).assertEqual(BACKUP_ABILITY);
      expect(countExtensions(second)).assertEqual(EXTENSION_TOTAL);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_6200
     * @tc.name      testBundleConsistency0008
     * @tc.desc      Check the install and update timestamps are identical across two default queries
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleConsistency0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: bundleManager.BundleInfo = await infoWith(FLAG_DEFAULT);
      const second: bundleManager.BundleInfo = await infoWith(FLAG_DEFAULT);
      const sameInstall: boolean = first.installTime === second.installTime;
      const sameUpdate: boolean = first.updateTime === second.updateTime;
      logCase('testBundleConsistency0008', `install=${sameInstall} update=${sameUpdate} key=${timeKey(first)}`);
      expect(sameInstall).assertTrue();
      expect(sameUpdate).assertTrue();
      expect(timeKey(second)).assertEqual(timeKey(first));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_6300
     * @tc.name      testBundleConsistency0009
     * @tc.desc      Check the shared self helper and an explicit query with the same flags agree on the scalar and
     *               collection projections
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleConsistency0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const helper: bundleManager.BundleInfo = await selfBundle();
      const explicit: bundleManager.BundleInfo = await infoWith(SELF_FLAGS);
      logCase('testBundleConsistency0009', `helper=${scalarKey(helper)} explicit=${scalarKey(explicit)} ` +
        `modules=${moduleNamesJoined(explicit)}`);
      expect(scalarKey(explicit)).assertEqual(scalarKey(helper));
      expect(moduleNamesJoined(explicit)).assertEqual(moduleNamesJoined(helper));
      expect(abilityNamesJoined(explicit)).assertEqual(abilityNamesJoined(helper));
      expect(extensionNamesJoined(explicit)).assertEqual(extensionNamesJoined(helper));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_6400
     * @tc.name      testBundleConsistency0010
     * @tc.desc      Check adding the signature flag to the self flags never changes a single collection of the
     *               narrower query
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleConsistency0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const narrow: bundleManager.BundleInfo = await infoWith(SELF_FLAGS);
      const wide: bundleManager.BundleInfo = await infoWith(SELF_FLAGS | FLAG_SIGNATURE);
      logCase('testBundleConsistency0010', `narrow=${moduleNamesJoined(narrow)} wide=${moduleNamesJoined(wide)} ` +
        `appId=${textOrEmpty(wide.signatureInfo.appId)}`);
      expect(moduleNamesJoined(wide)).assertEqual(moduleNamesJoined(narrow));
      expect(abilityNamesJoined(wide)).assertEqual(abilityNamesJoined(narrow));
      expect(extensionNamesJoined(wide)).assertEqual(extensionNamesJoined(narrow));
      expect(textOrEmpty(wide.signatureInfo.appId).length > EMPTY_LENGTH).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_6500
     * @tc.name      testBundleConsistency0011
     * @tc.desc      Check the widest flag set agrees with the self flags on every scalar field and every populated
     *               collection
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleConsistency0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const narrow: bundleManager.BundleInfo = await infoWith(SELF_FLAGS);
      const wide: bundleManager.BundleInfo = await infoWith(FULL_FLAGS);
      logCase('testBundleConsistency0011', `narrowKey=${scalarKey(narrow)} wideKey=${scalarKey(wide)}`);
      expect(scalarKey(wide)).assertEqual(scalarKey(narrow));
      expect(moduleNamesJoined(wide)).assertEqual(moduleNamesJoined(narrow));
      expect(extensionNamesJoined(wide)).assertEqual(extensionNamesJoined(narrow));
      expect(countSkills(wide)).assertEqual(countSkills(narrow));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_6600
     * @tc.name      testBundleConsistency0012
     * @tc.desc      Check five back to back queries all produce the very same scalar projection
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleConsistency0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const keys: string[] = [];
      for (let round = 0; round < 5; round++) {
        const info: bundleManager.BundleInfo = await infoWith(FLAG_DEFAULT);
        keys.push(scalarKey(info));
      }
      const distinct: number = distinctCount(keys);
      logCase('testBundleConsistency0012', `rounds=${keys.length} distinct=${distinct} first=${keys[0]}`);
      expect(keys.length).assertEqual(5);
      expect(distinct).assertEqual(1);
      expect(keys[4]).assertEqual(keys[0]);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_6700
     * @tc.name      testBundleModuleSurface0001
     * @tc.desc      Check the module list holds exactly the entry and the test feature module in sorted order
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModuleSurface0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const names: string = moduleNamesJoined(info);
      const count: number = info.hapModulesInfo.length;
      logCase('testBundleModuleSurface0001', `count=${count} names=${names} expected=${moduleNameList()}`);
      expect(count).assertEqual(MODULE_TOTAL);
      expect(names).assertEqual(moduleNameList());
      expect(names.length > EMPTY_LENGTH).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_6800
     * @tc.name      testBundleModuleSurface0002
     * @tc.desc      Check the module list contains the entry module and that module is of the entry type
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModuleSurface0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const present: boolean = moduleOrNone(info, ENTRY_MODULE) !== undefined;
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModuleSurface0002', `present=${present} entry=${entry.name} type=${entry.type}`);
      expect(present).assertTrue();
      expect(entry.name).assertEqual(ENTRY_MODULE);
      expect(entry.type).assertEqual(bundleManager.ModuleType.ENTRY);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_6900
     * @tc.name      testBundleModuleSurface0003
     * @tc.desc      Check the module list contains the test feature module with the feature module type
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModuleSurface0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const present: boolean = moduleOrNone(info, TEST_MODULE) !== undefined;
      const test: bundleManager.HapModuleInfo = findModule(info, TEST_MODULE);
      logCase('testBundleModuleSurface0003', `present=${present} name=${test.name} type=${test.type}`);
      expect(present).assertTrue();
      expect(test.name).assertEqual(TEST_MODULE);
      expect(test.type).assertEqual(bundleManager.ModuleType.FEATURE);
      expect(info.hapModulesInfo.length).assertEqual(MODULE_TOTAL);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_7000
     * @tc.name      testBundleModuleSurface0004
     * @tc.desc      Check both modules declare their main element, the entry module naming EntryAbility
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModuleSurface0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const test: bundleManager.HapModuleInfo = findModule(info, TEST_MODULE);
      logCase('testBundleModuleSurface0004', `entryMain=${entry.mainElementName} testMain=${test.mainElementName}`);
      expect(entry.mainElementName).assertEqual(ENTRY_ABILITY);
      expect(test.mainElementName).assertEqual(TEST_MAIN_ELEMENT);
      expect(entry.mainElementName.length > EMPTY_LENGTH).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_7100
     * @tc.name      testBundleModuleSurface0005
     * @tc.desc      Check the entry module targets exactly the phone device type
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModuleSurface0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const deviceTypes: string[] = entry.deviceTypes;
      logCase('testBundleModuleSurface0005', `deviceTypes=${deviceTypes.join(',')} count=${deviceTypes.length}`);
      expect(deviceTypes.length).assertEqual(1);
      expect(deviceTypes.join(',')).assertEqual(DEVICE_TYPE_PHONE);
      expect(deviceTypes.indexOf(DEVICE_TYPE_PHONE) >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_7200
     * @tc.name      testBundleModuleSurface0006
     * @tc.desc      Check the entry module is installed as a regular module and not as an installation free module
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModuleSurface0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModuleSurface0006', `installationFree=${entry.installationFree} name=${entry.name} ` +
        `modules=${info.hapModulesInfo.length}`);
      expect(entry.installationFree).assertFalse();
      expect(entry.name).assertEqual(ENTRY_MODULE);
      expect(info.hapModulesInfo.length).assertEqual(MODULE_TOTAL);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_7300
     * @tc.name      testBundleModuleSurface0007
     * @tc.desc      Check the entry module owns exactly one page ability and that ability is bound to the module
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModuleSurface0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const ability: bundleManager.AbilityInfo = firstAbilityOf(entry);
      logCase('testBundleModuleSurface0007', `abilities=${entry.abilitiesInfo.length} name=${ability.name} ` +
        `module=${ability.moduleName}`);
      expect(entry.abilitiesInfo.length).assertEqual(ABILITY_TOTAL);
      expect(ability.name).assertEqual(ENTRY_ABILITY);
      expect(ability.moduleName).assertEqual(ENTRY_MODULE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_7400
     * @tc.name      testBundleModuleSurface0008
     * @tc.desc      Check the entry module owns exactly one extension ability and that extension is the backup one
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModuleSurface0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const extension: bundleManager.ExtensionAbilityInfo = firstExtensionOf(entry);
      logCase('testBundleModuleSurface0008', `extensions=${entry.extensionAbilitiesInfo.length} ` +
        `name=${extension.name} type=${extension.extensionAbilityType}`);
      expect(entry.extensionAbilitiesInfo.length).assertEqual(EXTENSION_TOTAL);
      expect(extension.name).assertEqual(BACKUP_ABILITY);
      expect(extension.extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.BACKUP);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_7500
     * @tc.name      testBundleModuleSurface0009
     * @tc.desc      Check the module list carries no duplicated module name
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModuleSurface0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const names: string[] = info.hapModulesInfo.map((item: bundleManager.HapModuleInfo) => item.name);
      const distinct: number = distinctCount(names);
      logCase('testBundleModuleSurface0009', `names=${names.join(',')} distinct=${distinct} total=${names.length}`);
      expect(distinct).assertEqual(names.length);
      expect(distinct).assertEqual(MODULE_TOTAL);
      expect(names.indexOf(ENTRY_MODULE) >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_7600
     * @tc.name      testBundleModuleSurface0010
     * @tc.desc      Check a module only query reports the same module list as the full self query
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModuleSurface0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const narrow: bundleManager.BundleInfo = await infoWith(MODULE_ONLY);
      const wide: bundleManager.BundleInfo = await selfBundle();
      logCase('testBundleModuleSurface0010', `narrow=${moduleNamesJoined(narrow)} wide=${moduleNamesJoined(wide)} ` +
        `narrowCount=${narrow.hapModulesInfo.length}`);
      expect(moduleNamesJoined(narrow)).assertEqual(moduleNamesJoined(wide));
      expect(narrow.hapModulesInfo.length).assertEqual(wide.hapModulesInfo.length);
      expect(narrow.hapModulesInfo.length).assertEqual(MODULE_TOTAL);
    });
    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_7700
     * @tc.name      testBundleAbilityList0001
     * @tc.desc      Check the page ability collection of the entry module holds exactly EntryAbility
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleAbilityList0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const ability: bundleManager.AbilityInfo = firstAbilityOf(entry);
      logCase('testBundleAbilityList0001', `count=${entry.abilitiesInfo.length} name=${ability.name} ` +
        `joined=${abilityNamesJoined(info)}`);
      expect(entry.abilitiesInfo.length).assertEqual(ABILITY_TOTAL);
      expect(ability.name).assertEqual(ENTRY_ABILITY);
      expect(abilityNamesJoined(info).indexOf(ENTRY_ABILITY) >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_7800
     * @tc.name      testBundleAbilityList0002
     * @tc.desc      Check EntryAbility is reported for the self bundle, the entry module and the primary app instance
     *               with its declared skill
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbilityList0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const ability: bundleManager.AbilityInfo = firstAbilityOf(entry);
      logCase('testBundleAbilityList0002', `bundleName=${ability.bundleName} module=${ability.moduleName} ` +
        `appIndex=${ability.appIndex} skills=${ability.skills.length}`);
      expect(ability.bundleName).assertEqual(BUNDLE_NAME);
      expect(ability.moduleName).assertEqual(ENTRY_MODULE);
      expect(ability.appIndex).assertEqual(APP_INDEX);
      expect(ability.skills.length).assertEqual(ABILITY_TOTAL);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_7900
     * @tc.name      testBundleAbilityList0003
     * @tc.desc      Check EntryAbility is exported, enabled and launched as a singleton
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleAbilityList0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const ability: bundleManager.AbilityInfo = firstAbilityOf(entry);
      logCase('testBundleAbilityList0003', `exported=${ability.exported} enabled=${ability.enabled} ` +
        `launchType=${ability.launchType}`);
      expect(ability.exported).assertTrue();
      expect(ability.enabled).assertTrue();
      expect(ability.launchType).assertEqual(bundleManager.LaunchType.SINGLETON);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_8000
     * @tc.name      testBundleAbilityList0004
     * @tc.desc      Check EntryAbility resolves its label, description and icon resources to positive identifiers
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbilityList0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const ability: bundleManager.AbilityInfo = firstAbilityOf(entry);
      logCase('testBundleAbilityList0004', `labelId=${ability.labelId} descriptionId=${ability.descriptionId} ` +
        `iconId=${ability.iconId} icon=${ability.icon}`);
      expect(ability.labelId > 0).assertTrue();
      expect(ability.descriptionId > 0).assertTrue();
      expect(ability.icon.length > EMPTY_LENGTH).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_8100
     * @tc.name      testBundleAbilityList0005
     * @tc.desc      Check EntryAbility declares the single home skill with the home action, the home entity and no
     *               uri pattern
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleAbilityList0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const ability: bundleManager.AbilityInfo = firstAbilityOf(entry);
      const skills: bundleManager.Skill[] = ability.skills;
      logCase('testBundleAbilityList0005', `skills=${skills.length} ` +
        `actions=${skills.map((skill: bundleManager.Skill) => skill.actions.join(',')).join(';')}`);
      expect(skills.length).assertEqual(ABILITY_TOTAL);
      expect(skills[0].actions.join(',')).assertEqual(HOME_ACTION);
      expect(skills[0].entities.join(',')).assertEqual(HOME_ENTITY);
      expect(skills[0].uris.length).assertEqual(NO_SKILL_URI);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_8200
     * @tc.name      testBundleAbilityList0006
     * @tc.desc      Check EntryAbility supports the full, split and floating window modes exactly once each
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbilityList0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const ability: bundleManager.AbilityInfo = firstAbilityOf(entry);
      const modes: string = ability.supportWindowModes.slice().sort().join(',');
      logCase('testBundleAbilityList0006', `windowModes=${modes} count=${ability.supportWindowModes.length}`);
      expect(ability.supportWindowModes.length).assertEqual(WINDOW_MODE_TOTAL);
      expect(modes).assertEqual(WINDOW_MODE_LIST);
      expect(modes.indexOf('0') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_8300
     * @tc.name      testBundleAbilityList0007
     * @tc.desc      Check EntryAbility requests no permission and declares no metadata of its own
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbilityList0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const ability: bundleManager.AbilityInfo = firstAbilityOf(entry);
      logCase('testBundleAbilityList0007', `permissions=${ability.permissions.length} ` +
        `metadata=${ability.metadata.length} name=${ability.name}`);
      expect(ability.permissions.length).assertEqual(EMPTY_LENGTH);
      expect(ability.metadata.length).assertEqual(EMPTY_LENGTH);
      expect(ability.name).assertEqual(ENTRY_ABILITY);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_8400
     * @tc.name      testBundleAbilityList0008
     * @tc.desc      Check the ability reported by the narrow module plus ability flags matches the full query on name,
     *               module, export state and enable state
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbilityList0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const narrow: bundleManager.BundleInfo = await infoWith(MODULE_ABILITY);
      const wide: bundleManager.BundleInfo = await selfBundle();
      const narrowEntry: bundleManager.HapModuleInfo = findModule(narrow, ENTRY_MODULE);
      const wideEntry: bundleManager.HapModuleInfo = findModule(wide, ENTRY_MODULE);
      const narrowAbility: bundleManager.AbilityInfo = firstAbilityOf(narrowEntry);
      const wideAbility: bundleManager.AbilityInfo = firstAbilityOf(wideEntry);
      logCase('testBundleAbilityList0008', `narrow=${narrowAbility.name} wide=${wideAbility.name} ` +
        `enabled=${narrowAbility.enabled} exported=${narrowAbility.exported} ` +
        `narrowCount=${narrowEntry.abilitiesInfo.length} wideCount=${wideEntry.abilitiesInfo.length}`);
      expect(narrowEntry.abilitiesInfo.length).assertEqual(wideEntry.abilitiesInfo.length);
      expect(narrowAbility.name).assertEqual(wideAbility.name);
      expect(narrowAbility.moduleName).assertEqual(wideAbility.moduleName);
      expect(narrowAbility.enabled).assertEqual(wideAbility.enabled);
      expect(narrowAbility.exported).assertEqual(wideAbility.exported);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_8500
     * @tc.name      testBundleExtensionList0001
     * @tc.desc      Check the extension collection of the entry module holds exactly EntryBackupAbility
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleExtensionList0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const extension: bundleManager.ExtensionAbilityInfo = firstExtensionOf(entry);
      logCase('testBundleExtensionList0001', `count=${entry.extensionAbilitiesInfo.length} ` +
        `name=${extension.name} module=${extension.moduleName}`);
      expect(entry.extensionAbilitiesInfo.length).assertEqual(EXTENSION_TOTAL);
      expect(extension.name).assertEqual(BACKUP_ABILITY);
      expect(extension.moduleName).assertEqual(ENTRY_MODULE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_8600
     * @tc.name      testBundleExtensionList0002
     * @tc.desc      Check the only extension is of the backup type in both its numeric and textual form
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleExtensionList0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const extension: bundleManager.ExtensionAbilityInfo = firstExtensionOf(entry);
      logCase('testBundleExtensionList0002', `type=${extension.extensionAbilityType} ` +
        `typeName=${extension.extensionAbilityTypeName}`);
      expect(extension.extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.BACKUP);
      expect(extension.extensionAbilityTypeName).assertEqual(BACKUP_TYPE_NAME);
      expect(extension.name).assertEqual(BACKUP_ABILITY);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_8700
     * @tc.name      testBundleExtensionList0003
     * @tc.desc      Check the backup extension is not exported but is enabled for the current user
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleExtensionList0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const extension: bundleManager.ExtensionAbilityInfo = firstExtensionOf(entry);
      logCase('testBundleExtensionList0003', `exported=${extension.exported} enabled=${extension.enabled} ` +
        `name=${extension.name}`);
      expect(extension.exported).assertFalse();
      expect(extension.enabled).assertTrue();
      expect(extension.name).assertEqual(BACKUP_ABILITY);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_8800
     * @tc.name      testBundleExtensionList0004
     * @tc.desc      Check the backup extension declares exactly one metadata entry carrying the backup extension name
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleExtensionList0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const extension: bundleManager.ExtensionAbilityInfo = firstExtensionOf(entry);
      const metadata: bundleManager.Metadata[] = extension.metadata;
      const firstName: string = metadata.length > 0 ? metadata[0].name : '';
      logCase('testBundleExtensionList0004', `count=${metadata.length} name=${firstName}`);
      expect(metadata.length).assertEqual(EXTENSION_TOTAL);
      expect(metadata[0].name).assertEqual(BACKUP_METADATA);
      expect(countExtensionMetadata(info)).assertEqual(EXTENSION_TOTAL);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_8900
     * @tc.name      testBundleExtensionList0005
     * @tc.desc      Check the backup metadata points at the backup profile resource of the sample
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleExtensionList0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const extension: bundleManager.ExtensionAbilityInfo = firstExtensionOf(entry);
      const metadata: bundleManager.Metadata[] = extension.metadata;
      const resource: string = metadata.length > 0 ? metadata[0].resource : '';
      logCase('testBundleExtensionList0005', `count=${metadata.length} resource=${resource}`);
      expect(metadata.length).assertEqual(EXTENSION_TOTAL);
      expect(metadata[0].resource).assertEqual(BACKUP_RESOURCE);
      expect(metadata[0].name).assertEqual(BACKUP_METADATA);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_9000
     * @tc.name      testBundleExtensionList0006
     * @tc.desc      Check the backup extension belongs to the self bundle and requests no permission
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleExtensionList0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const extension: bundleManager.ExtensionAbilityInfo = firstExtensionOf(entry);
      logCase('testBundleExtensionList0006', `bundleName=${extension.bundleName} ` +
        `appIndex=${extension.appIndex} permissions=${extension.permissions.length}`);
      expect(extension.bundleName).assertEqual(BUNDLE_NAME);
      expect(extension.appIndex).assertEqual(APP_INDEX);
      expect(extension.permissions.length).assertEqual(EMPTY_LENGTH);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_9100
     * @tc.name      testBundleExtensionList0007
     * @tc.desc      Check the test feature module contributes no extension so the whole bundle reports exactly one
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleExtensionList0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const test: bundleManager.HapModuleInfo = findModule(info, TEST_MODULE);
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleExtensionList0007', `testExtensions=${test.extensionAbilitiesInfo.length} ` +
        `entryExtensions=${entry.extensionAbilitiesInfo.length} total=${countExtensions(info)}`);
      expect(test.extensionAbilitiesInfo.length).assertEqual(EMPTY_LENGTH);
      expect(entry.extensionAbilitiesInfo.length).assertEqual(EXTENSION_TOTAL);
      expect(countExtensions(info)).assertEqual(EXTENSION_TOTAL);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_9200
     * @tc.name      testBundleExtensionList0008
     * @tc.desc      Check the backup extension declares no skill while its metadata stays available under the widest
     *               flag set
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleExtensionList0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await infoWith(FULL_FLAGS);
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const extension: bundleManager.ExtensionAbilityInfo = firstExtensionOf(entry);
      logCase('testBundleExtensionList0008', `skills=${extension.skills.length} ` +
        `metadata=${extension.metadata.length} type=${extension.extensionAbilityTypeName}`);
      expect(extension.skills.length).assertEqual(NO_SKILL_URI);
      expect(extension.metadata.length).assertEqual(EXTENSION_TOTAL);
      expect(extension.extensionAbilityTypeName).assertEqual(BACKUP_TYPE_NAME);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_9300
     * @tc.name      testBundleMetadataGate0001
     * @tc.desc      Check asking for metadata together with the extension ability populates the backup metadata array
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleMetadataGate0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await infoWith(MODULE_EXTENSION_METADATA);
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const extension: bundleManager.ExtensionAbilityInfo = firstExtensionOf(entry);
      logCase('testBundleMetadataGate0001', `count=${extension.metadata.length} ` +
        `name=${extension.metadata.length > 0 ? extension.metadata[0].name : ''}`);
      expect(extension.metadata.length).assertEqual(EXTENSION_TOTAL);
      expect(extension.metadata[0].name).assertEqual(BACKUP_METADATA);
      expect(extension.metadata[0].resource).assertEqual(BACKUP_RESOURCE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_9400
     * @tc.name      testBundleMetadataGate0002
     * @tc.desc      Check the extension ability without the metadata flag reports an empty metadata array
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleMetadataGate0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await infoWith(MODULE_EXTENSION);
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const extension: bundleManager.ExtensionAbilityInfo = firstExtensionOf(entry);
      const shape: FlagShape = new FlagShape(info);
      logCase('testBundleMetadataGate0002', `count=${extension.metadata.length} shape=${shape.key()}`);
      expect(extension.metadata.length).assertEqual(EMPTY_LENGTH);
      expect(shape.extensionMetadataCount).assertEqual(EMPTY_LENGTH);
      expect(shape.extensionCount).assertEqual(EXTENSION_TOTAL);
      expect(shape.abilityCount).assertEqual(EMPTY_LENGTH);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_9500
     * @tc.name      testBundleMetadataGate0003
     * @tc.desc      Check asking for skills together with the module and ability flags exposes the home skill of
     *               EntryAbility
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleMetadataGate0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await infoWith(MODULE_ABILITY_SKILL);
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const ability: bundleManager.AbilityInfo = firstAbilityOf(entry);
      logCase('testBundleMetadataGate0003', `skills=${ability.skills.length} ` +
        `actions=${ability.skills.length > 0 ? ability.skills[0].actions.join(',') : ''}`);
      expect(ability.skills.length).assertEqual(ABILITY_TOTAL);
      expect(ability.skills[0].actions.join(',')).assertEqual(HOME_ACTION);
      expect(ability.skills[0].entities.join(',')).assertEqual(HOME_ENTITY);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_9600
     * @tc.name      testBundleMetadataGate0004
     * @tc.desc      Check the ability without the skill flag reports an empty skill array although the ability itself
     *               is present
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleMetadataGate0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await infoWith(MODULE_ABILITY);
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const ability: bundleManager.AbilityInfo = firstAbilityOf(entry);
      const shape: FlagShape = new FlagShape(info);
      logCase('testBundleMetadataGate0004', `skills=${ability.skills.length} shape=${shape.key()}`);
      expect(entry.abilitiesInfo.length).assertEqual(ABILITY_TOTAL);
      expect(ability.skills.length).assertEqual(EMPTY_LENGTH);
      expect(shape.skillCount).assertEqual(EMPTY_LENGTH);
      expect(ability.metadata.length).assertEqual(EMPTY_LENGTH);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_9700
     * @tc.name      testBundleMetadataGate0005
     * @tc.desc      Check the skill flag is the only difference between the skill count of two otherwise identical
     *               queries
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleMetadataGate0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const without: bundleManager.BundleInfo = await infoWith(MODULE_ABILITY);
      const withSkill: bundleManager.BundleInfo = await infoWith(MODULE_ABILITY_SKILL);
      const withoutSkills: number = countSkills(without);
      const withSkills: number = countSkills(withSkill);
      const gained: number = withSkills - withoutSkills;
      logCase('testBundleMetadataGate0005', `without=${withoutSkills} with=${withSkills} gained=${gained}`);
      expect(withoutSkills).assertEqual(EMPTY_LENGTH);
      expect(withSkills >= ABILITY_TOTAL).assertTrue();
      expect(gained).assertEqual(withSkills);
      expect(countAbilities(withSkill)).assertEqual(countAbilities(without));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_9800
     * @tc.name      testBundleMetadataGate0006
     * @tc.desc      Check the metadata flag is the only difference between the extension metadata arrays of two
     *               otherwise identical queries
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleMetadataGate0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const without: bundleManager.BundleInfo = await infoWith(MODULE_EXTENSION);
      const withMetadata: bundleManager.BundleInfo = await infoWith(MODULE_EXTENSION_METADATA);
      const withoutCount: number = countExtensionMetadata(without);
      const withCount: number = countExtensionMetadata(withMetadata);
      logCase('testBundleMetadataGate0006', `without=${withoutCount} with=${withCount} ` +
        `extensions=${countExtensions(withMetadata)}`);
      expect(withoutCount).assertEqual(EMPTY_LENGTH);
      expect(withCount).assertEqual(EXTENSION_TOTAL);
      expect(countExtensions(withMetadata)).assertEqual(countExtensions(without));
      expect(withCount > withoutCount).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_9900
     * @tc.name      testBundleMetadataGate0007
     * @tc.desc      Check the skill flag alone does not unlock metadata: the extension metadata stays empty and no
     *               skill appears
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleMetadataGate0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await infoWith(MODULE_EXTENSION_SKILL);
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const extension: bundleManager.ExtensionAbilityInfo = firstExtensionOf(entry);
      logCase('testBundleMetadataGate0007', `metadata=${extension.metadata.length} ` +
        `skills=${extension.skills.length} abilityTotal=${countAbilities(info)}`);
      expect(extension.metadata.length).assertEqual(EMPTY_LENGTH);
      expect(extension.skills.length).assertEqual(EMPTY_LENGTH);
      expect(countAbilities(info)).assertEqual(EMPTY_LENGTH);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_10000
     * @tc.name      testBundleMetadataGate0008
     * @tc.desc      Check the application metadata array is empty with and without the metadata flag because the
     *               sample declares no application level metadata
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleMetadataGate0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const plain: bundleManager.BundleInfo = await infoWith(FLAG_APPLICATION);
      const withMeta: bundleManager.BundleInfo = await infoWith(FLAG_APPLICATION | FLAG_METADATA);
      const plainCount: number = plain.appInfo.metadataArray.length;
      const metaCount: number = withMeta.appInfo.metadataArray.length;
      logCase('testBundleMetadataGate0008', `plain=${plainCount} with=${metaCount} ` +
        `plainName=${plain.appInfo.name} metaName=${withMeta.appInfo.name}`);
      expect(plainCount).assertEqual(EMPTY_LENGTH);
      expect(metaCount).assertEqual(EMPTY_LENGTH);
      expect(withMeta.appInfo.name).assertEqual(plain.appInfo.name);
      expect(plain.hapModulesInfo.length).assertEqual(EMPTY_LENGTH);
    });
    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_10100
     * @tc.name      testBundleInvariant0001
     * @tc.desc      Check the bundle name, the application name and the application process all agree on one
     *               identifier
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleInvariant0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const app: bundleManager.ApplicationInfo = info.appInfo;
      const processName: string = app.process;
      logCase('testBundleInvariant0001', `name=${info.name} appName=${app.name} process=${processName} ` +
        `vendor=${info.vendor}`);
      expect(app.name).assertEqual(info.name);
      expect(processName).assertEqual(info.name);
      expect(info.vendor).assertEqual(APP_VENDOR);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_10200
     * @tc.name      testBundleInvariant0002
     * @tc.desc      Check the application is an enabled third party application owned by the running process and
     *               carrying a valid access token
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInvariant0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const app: bundleManager.ApplicationInfo = info.appInfo;
      const ownedByProcess: boolean = app.uid === process.uid;
      logCase('testBundleInvariant0002', `uid=${app.uid} tokenId=${app.accessTokenId} ` +
        `ownedByProcess=${ownedByProcess} bundleType=${app.bundleType}`);
      expect(ownedByProcess).assertTrue();
      expect(app.accessTokenId > 0).assertTrue();
      expect(app.bundleType).assertEqual(bundleManager.BundleType.APP);
      expect(app.enabled).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_10300
     * @tc.name      testBundleInvariant0003
     * @tc.desc      Check the version code never exceeds the target version and the minimum compatible version never
     *               exceeds the version code
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInvariant0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const codeBelowTarget: boolean = info.versionCode <= info.targetVersion;
      const minBelowCode: boolean = info.minCompatibleVersionCode <= info.versionCode;
      logCase('testBundleInvariant0003', `code=${info.versionCode} target=${info.targetVersion} ` +
        `min=${info.minCompatibleVersionCode} ordered=${codeBelowTarget && minBelowCode}`);
      expect(codeBelowTarget).assertTrue();
      expect(minBelowCode).assertTrue();
      expect(info.versionName.length > EMPTY_LENGTH).assertTrue();
      expect(info.targetVersion > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_10400
     * @tc.name      testBundleInvariant0004
     * @tc.desc      Check the target version of the shared self query encodes the same API level twice, so the
     *               platform and the application agree on API 26
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInvariant0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const lowPart: number = info.targetVersion % 1000;
      const highPart: number = Math.floor(info.targetVersion / 10000000);
      const bothEqual: boolean = lowPart === highPart;
      logCase('testBundleInvariant0004', `target=${info.targetVersion} low=${lowPart} high=${highPart} ` +
        `bothEqual=${bothEqual}`);
      expect(bothEqual).assertTrue();
      expect(lowPart).assertEqual(TARGET_API);
      expect(info.targetVersion).assertEqual(TARGET_VERSION);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_10500
     * @tc.name      testBundleInvariant0005
     * @tc.desc      Check the base identity fields are flag independent while the module list is not
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInvariant0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const bare: bundleManager.BundleInfo = await infoWith(FLAG_DEFAULT);
      const full: bundleManager.BundleInfo = await infoWith(FULL_FLAGS);
      const sameScalars: boolean = scalarKey(bare) === scalarKey(full);
      const moduleGap: number = full.hapModulesInfo.length - bare.hapModulesInfo.length;
      logCase('testBundleInvariant0005', `sameScalars=${sameScalars} bareModules=${bare.hapModulesInfo.length} ` +
        `fullModules=${full.hapModulesInfo.length} gap=${moduleGap}`);
      expect(sameScalars).assertTrue();
      expect(bare.name).assertEqual(full.name);
      expect(bare.versionCode).assertEqual(full.versionCode);
      expect(moduleGap).assertEqual(MODULE_TOTAL);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_10600
     * @tc.name      testBundleInvariant0006
     * @tc.desc      Check the shared module lookup helper returns the very same module the linear scan finds for the
     *               entry module
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInvariant0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const scanned: bundleManager.HapModuleInfo | undefined = moduleOrNone(info, ENTRY_MODULE);
      const viaHelper: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const sameModule: boolean = scanned === viaHelper;
      logCase('testBundleInvariant0006', `scanned=${scanned === undefined ? 'none' : viaHelper.name} ` +
        `sameModule=${sameModule} total=${info.hapModulesInfo.length}`);
      expect(sameModule).assertTrue();
      expect(viaHelper.name).assertEqual(ENTRY_MODULE);
      expect(info.hapModulesInfo.indexOf(viaHelper) >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_10700
     * @tc.name      testBundleInvariant0007
     * @tc.desc      Check every ability and every extension reports the name of the module that owns it
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInvariant0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const mismatches: string[] = [];
      info.hapModulesInfo.forEach((item: bundleManager.HapModuleInfo) => {
        item.abilitiesInfo.forEach((ability: bundleManager.AbilityInfo) => {
          if (ability.moduleName !== item.name) {
            mismatches.push(item.name + '/' + ability.name);
          }
        });
        item.extensionAbilitiesInfo.forEach((extension: bundleManager.ExtensionAbilityInfo) => {
          if (extension.moduleName !== item.name) {
            mismatches.push(item.name + '/' + extension.name);
          }
        });
      });
      logCase('testBundleInvariant0007', `abilities=${countAbilities(info)} extensions=${countExtensions(info)} ` +
        `mismatches=${mismatches.join(';')}`);
      expect(mismatches.length).assertEqual(EMPTY_LENGTH);
      expect(countAbilities(info) >= ABILITY_TOTAL).assertTrue();
      expect(countExtensions(info)).assertEqual(EXTENSION_TOTAL);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEINFO_10800
     * @tc.name      testBundleInvariant0008
     * @tc.desc      Check the installed bundle is the primary instance of a three segment bundle name installed as
     *               two modules
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInvariant0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const segments: number = info.name.split('.').length;
      logCase('testBundleInvariant0008', `segments=${segments} appIndex=${info.appIndex} ` +
        `installTime=${info.installTime} modules=${info.hapModulesInfo.length}`);
      expect(segments).assertEqual(BUNDLE_SEGMENT_TOTAL);
      expect(info.appIndex).assertEqual(APP_INDEX);
      expect(info.hapModulesInfo.length).assertEqual(MODULE_TOTAL);
      expect(info.installTime > 0).assertTrue();
    });
  });
}
