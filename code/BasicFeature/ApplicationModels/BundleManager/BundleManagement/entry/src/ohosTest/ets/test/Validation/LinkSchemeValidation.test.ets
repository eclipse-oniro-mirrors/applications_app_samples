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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG: string = 'LinkSchemeValidation';
const DOMAIN_NUMBER: number = 0xFF00;

enum BundleFlag {
  NONE = 0,
  ABILITY = 1,
  HAP_MODULE = 2,
  APPLICATION = 4,
  METADATA = 8,
  EXTENSION_ABILITY = 16,
  REQUESTED_PERMISSION = 32,
  SKILL = 64,
  APP_INFO = 128,
  SIGNATURE = 256
}

enum AppType {
  BROWSER = 'BROWSER',
  AUDIO = 'AUDIO',
  VIDEO = 'VIDEO',
  IMAGE = 'IMAGE',
  EMAIL = 'EMAIL'
}

enum OverlayState {
  DISABLED = 'disabled',
  ENABLED = 'enabled'
}

enum ScenarioErrorCode {
  SUCCESS = 0,
  PARAM_ERROR = 401,
  BUNDLE_NOT_FOUND = 17700001,
  ABILITY_NOT_FOUND = 17700002,
  MODULE_NOT_FOUND = 17700026,
  OVERLAY_NOT_FOUND = 17700040,
  NOT_DEFAULT_APP = 17700050,
  SIGNATURE_INVALID = 17700060
}

interface BundleInfoLike {
  bundleName: string;
  versionCode: number;
  versionName: string;
  abilityNames: string[];
  moduleNames: string[];
  enabled: boolean;
}

interface ProfileLike {
  moduleName: string;
  abilityName: string;
  metadataName: string;
  value: string;
}

interface OverlayInfoLike {
  moduleName: string;
  targetModuleName: string;
  state: OverlayState;
  priority: number;
}

class BundleDomainModel {
  static readonly BUNDLE_NAME: string = 'com.samples.bundlemanagement';
  static readonly VERSION_CODE: number = 1000000;
  static readonly VERSION_NAME: string = '1.0.0';
  static readonly ENTRY_MODULE: string = 'entry';
  static readonly OVERLAY_MODULE: string = 'libraryOverlay';
  static readonly RUNTIME_OVERLAY_MODULE: string = 'libraryRuntimeOverlay';
  static readonly ENTRY_ABILITY: string = 'EntryAbility';
  static readonly NEW_ABILITY: string = 'NewAbility';
  static readonly EXT_ABILITY: string = 'NewUIExtAbility';

  public static combineFlags(left: number, right: number): number {
    return left | right;
  }

  public static hasFlag(flags: number, flag: number): boolean {
    return (flags & flag) === flag;
  }

  public static countFlags(flags: number): number {
    let count: number = 0;
    let current: number = flags;
    while (current > 0) {
      count += (current & 1);
      current = current >> 1;
    }
    return count;
  }

  public static buildBundleInfo(): BundleInfoLike {
    return {
      bundleName: BundleDomainModel.BUNDLE_NAME,
      versionCode: BundleDomainModel.VERSION_CODE,
      versionName: BundleDomainModel.VERSION_NAME,
      abilityNames: [BundleDomainModel.ENTRY_ABILITY, BundleDomainModel.NEW_ABILITY],
      moduleNames: [BundleDomainModel.ENTRY_MODULE, BundleDomainModel.OVERLAY_MODULE,
        BundleDomainModel.RUNTIME_OVERLAY_MODULE],
      enabled: true
    };
  }

  public static getAbilityNames(): string[] {
    return [BundleDomainModel.ENTRY_ABILITY, BundleDomainModel.NEW_ABILITY];
  }

  public static getModuleNames(): string[] {
    return [BundleDomainModel.ENTRY_MODULE, BundleDomainModel.OVERLAY_MODULE,
      BundleDomainModel.RUNTIME_OVERLAY_MODULE];
  }

  public static getProfileByAbility(moduleName: string, abilityName: string, metadataName: string): ProfileLike {
    return {
      moduleName: moduleName, abilityName: abilityName, metadataName: metadataName,
      value: '{"shortcuts":[]}'
    };
  }

  public static getProfileByExtensionAbility(moduleName: string, extensionName: string,
    metadataName: string): ProfileLike {
    return { moduleName: moduleName, abilityName: extensionName, metadataName: metadataName, value: '[]' };
  }

  public static verifyAbc(paths: string[]): boolean {
    if (paths.length === 0) {
      return false;
    }
    for (let i = 0; i < paths.length; i++) {
      if (paths[i].length === 0) {
        return false;
      }
    }
    return true;
  }

  public static deleteAbc(path: string): boolean {
    return path.length > 0 && path.endsWith('.abc');
  }

  public static isValidLink(link: string): boolean {
    return link.startsWith('http://') || link.startsWith('https://');
  }

  public static canOpenLink(link: string): boolean {
    return BundleDomainModel.isValidLink(link);
  }

  public static isDefaultApplication(type: AppType): boolean {
    return type === AppType.BROWSER || type === AppType.EMAIL;
  }

  public static setOverlayEnabled(moduleName: string, enabled: boolean): OverlayState {
    if (moduleName.length === 0) {
      return OverlayState.DISABLED;
    }
    return enabled ? OverlayState.ENABLED : OverlayState.DISABLED;
  }

  public static getOverlayModuleInfo(moduleName: string): OverlayInfoLike {
    return {
      moduleName: moduleName, targetModuleName: BundleDomainModel.ENTRY_MODULE,
      state: OverlayState.ENABLED, priority: 1
    };
  }

  public static getTargetOverlayModuleInfos(targetModuleName: string): OverlayInfoLike[] {
    return [
      {
        moduleName: BundleDomainModel.OVERLAY_MODULE, targetModuleName: targetModuleName,
        state: OverlayState.ENABLED, priority: 1
      },
      {
        moduleName: BundleDomainModel.RUNTIME_OVERLAY_MODULE, targetModuleName: targetModuleName,
        state: OverlayState.DISABLED, priority: 2
      }
    ];
  }

  public static add(left: number, right: number): number {
    return left + right;
  }

  public static isValidModule(moduleName: string): boolean {
    return BundleDomainModel.getModuleNames().indexOf(moduleName) >= 0;
  }

  public static errorCodeForScenario(scenario: string): number {
    if (scenario === 'bundle') {
      return ScenarioErrorCode.BUNDLE_NOT_FOUND;
    }
    if (scenario === 'ability') {
      return ScenarioErrorCode.ABILITY_NOT_FOUND;
    }
    if (scenario === 'module') {
      return ScenarioErrorCode.MODULE_NOT_FOUND;
    }
    if (scenario === 'overlay') {
      return ScenarioErrorCode.OVERLAY_NOT_FOUND;
    }
    if (scenario === 'signature') {
      return ScenarioErrorCode.SIGNATURE_INVALID;
    }
    return ScenarioErrorCode.SUCCESS;
  }

  public static errorMessage(code: number): string {
    if (code === ScenarioErrorCode.BUNDLE_NOT_FOUND) {
      return 'bundle not found';
    }
    if (code === ScenarioErrorCode.ABILITY_NOT_FOUND) {
      return 'ability not found';
    }
    if (code === ScenarioErrorCode.MODULE_NOT_FOUND) {
      return 'module not found';
    }
    if (code === ScenarioErrorCode.OVERLAY_NOT_FOUND) {
      return 'overlay not found';
    }
    return 'success';
  }

  public static buildError(scenario: string): BusinessError {
    const code: number = BundleDomainModel.errorCodeForScenario(scenario);
    return { code: code, name: 'BusinessError', message: BundleDomainModel.errorMessage(code) };
  }
}


export default function linkSchemeValidationTest() {
  describe('LinkSchemeValidation_Test', () => {
    beforeAll(() => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'suite LinkSchemeValidation begin');
    });
    afterAll(() => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'suite LinkSchemeValidation end');
    });
    /*
     * @tc.number: LinkSchemeValidation_000
     * @tc.name: bundle_version
     * @tc.desc: verify bundle version name and code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_000', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_000 start');
      const info: BundleInfoLike = BundleDomainModel.buildBundleInfo();
      expect(info.versionName).assertEqual(BundleDomainModel.VERSION_NAME);
      expect(info.versionCode > 0).assertTrue();
    });
    /*
     * @tc.number: LinkSchemeValidation_001
     * @tc.name: flag_combine
     * @tc.desc: verify bundle flag combination
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_001', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_001 start');
      const flags: number = BundleDomainModel.combineFlags(BundleFlag.ABILITY, BundleFlag.HAP_MODULE);
      expect(BundleDomainModel.hasFlag(flags, BundleFlag.ABILITY)).assertTrue();
      expect(BundleDomainModel.hasFlag(flags, BundleFlag.HAP_MODULE)).assertTrue();
      expect(BundleDomainModel.countFlags(flags)).assertEqual(2);
    });
    /*
     * @tc.number: LinkSchemeValidation_002
     * @tc.name: flag_count_loop
     * @tc.desc: verify incremental flag accumulation
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_002', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_002 start');
      const values: number[] = [1, 2, 4, 8, 16, 32];
      let combined: number = 0;
      for (let i = 0; i < 3; i++) {
        combined = BundleDomainModel.combineFlags(combined, values[i]);
      }
      expect(BundleDomainModel.countFlags(combined)).assertEqual(3);
    });
    /*
     * @tc.number: LinkSchemeValidation_003
     * @tc.name: ability_names
     * @tc.desc: verify ability names from bundleInfo
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_003', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_003 start');
      const names: string[] = BundleDomainModel.getAbilityNames();
      expect(names.length).assertEqual(2);
      expect(names.indexOf(BundleDomainModel.ENTRY_ABILITY) >= 0).assertTrue();
    });
    /*
     * @tc.number: LinkSchemeValidation_004
     * @tc.name: module_names
     * @tc.desc: verify module names from bundleInfo
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_004', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_004 start');
      const modules: string[] = BundleDomainModel.getModuleNames();
      expect(modules.length).assertEqual(3);
      expect(BundleDomainModel.isValidModule(BundleDomainModel.ENTRY_MODULE)).assertTrue();
    });
    /*
     * @tc.number: LinkSchemeValidation_005
     * @tc.name: profile_ability
     * @tc.desc: verify getProfileByAbility result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_005', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_005 start');
      const profile: ProfileLike = BundleDomainModel.getProfileByAbility(BundleDomainModel.ENTRY_MODULE, BundleDomainModel.ENTRY_ABILITY, 'ohos.ability.shortcuts');
      expect(profile.moduleName).assertEqual(BundleDomainModel.ENTRY_MODULE);
      expect(profile.value.length > 0).assertTrue();
    });
    /*
     * @tc.number: LinkSchemeValidation_006
     * @tc.name: profile_extension
     * @tc.desc: verify getProfileByExtensionAbility result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_006', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_006 start');
      const profile: ProfileLike = BundleDomainModel.getProfileByExtensionAbility(BundleDomainModel.ENTRY_MODULE, BundleDomainModel.EXT_ABILITY, 'ohos.ability.NewUIExtAbility');
      expect(profile.abilityName).assertEqual(BundleDomainModel.EXT_ABILITY);
      expect(profile.value).assertEqual('[]');
    });
    /*
     * @tc.number: LinkSchemeValidation_007
     * @tc.name: verify_abc
     * @tc.desc: verify abc file verification
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_007', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_007 start');
      expect(BundleDomainModel.verifyAbc(['/data/storage/el1/bundle/modules.abc'])).assertTrue();
      expect(BundleDomainModel.verifyAbc([])).assertFalse();
    });
    /*
     * @tc.number: LinkSchemeValidation_008
     * @tc.name: verify_abc_multiple
     * @tc.desc: verify multiple abc paths
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_008', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_008 start');
      const paths: string[] = ['/data/a.abc', '/data/b.abc', '/data/c.abc'];
      expect(BundleDomainModel.verifyAbc(paths)).assertTrue();
      expect(BundleDomainModel.verifyAbc([''])).assertFalse();
    });
    /*
     * @tc.number: LinkSchemeValidation_009
     * @tc.name: delete_abc
     * @tc.desc: verify abc file deletion
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_009', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_009 start');
      expect(BundleDomainModel.deleteAbc('/data/storage/el1/bundle/modules.abc')).assertTrue();
      expect(BundleDomainModel.deleteAbc('')).assertFalse();
    });
    /*
     * @tc.number: LinkSchemeValidation_010
     * @tc.name: can_open_link
     * @tc.desc: verify canOpenLink for schemes
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_010', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_010 start');
      expect(BundleDomainModel.canOpenLink('http://example.com')).assertTrue();
      expect(BundleDomainModel.canOpenLink('https://example.com')).assertTrue();
      expect(BundleDomainModel.canOpenLink('ftp://example.com')).assertFalse();
    });
    /*
     * @tc.number: LinkSchemeValidation_011
     * @tc.name: can_open_link_loop
     * @tc.desc: verify canOpenLink across a batch
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_011', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_011 start');
      const links: string[] = ['http://a.com', 'https://b.com', 'ftp://c.com'];
      let valid: number = 0;
      for (let i = 0; i < links.length; i++) {
        if (BundleDomainModel.canOpenLink(links[i])) {
          valid++;
        }
      }
      expect(valid).assertEqual(2);
    });
    /*
     * @tc.number: LinkSchemeValidation_012
     * @tc.name: default_app
     * @tc.desc: verify default application decision
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_012', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_012 start');
      expect(BundleDomainModel.isDefaultApplication(AppType.BROWSER)).assertTrue();
      expect(BundleDomainModel.isDefaultApplication(AppType.VIDEO)).assertFalse();
    });
    /*
     * @tc.number: LinkSchemeValidation_013
     * @tc.name: default_app_matrix
     * @tc.desc: verify default application across types
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_013', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_013 start');
      const types: AppType[] = [AppType.BROWSER, AppType.AUDIO, AppType.VIDEO, AppType.IMAGE, AppType.EMAIL];
      let count: number = 0;
      for (let i = 0; i < types.length; i++) {
        if (BundleDomainModel.isDefaultApplication(types[i])) {
          count++;
        }
      }
      expect(count).assertEqual(2);
    });
    /*
     * @tc.number: LinkSchemeValidation_014
     * @tc.name: overlay_enable
     * @tc.desc: verify overlay enable state toggle
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_014', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_014 start');
      expect(BundleDomainModel.setOverlayEnabled(BundleDomainModel.OVERLAY_MODULE, true)).assertEqual(OverlayState.ENABLED);
      expect(BundleDomainModel.setOverlayEnabled(BundleDomainModel.OVERLAY_MODULE, false)).assertEqual(OverlayState.DISABLED);
    });
    /*
     * @tc.number: LinkSchemeValidation_015
     * @tc.name: overlay_info
     * @tc.desc: verify overlay module info
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_015', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_015 start');
      const info: OverlayInfoLike = BundleDomainModel.getOverlayModuleInfo(BundleDomainModel.RUNTIME_OVERLAY_MODULE);
      expect(info.targetModuleName).assertEqual(BundleDomainModel.ENTRY_MODULE);
      expect(info.state).assertEqual(OverlayState.ENABLED);
    });
    /*
     * @tc.number: LinkSchemeValidation_016
     * @tc.name: target_overlays
     * @tc.desc: verify target overlay module infos
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_016', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_016 start');
      const infos: OverlayInfoLike[] = BundleDomainModel.getTargetOverlayModuleInfos(BundleDomainModel.ENTRY_MODULE);
      expect(infos.length).assertEqual(2);
      expect(infos[0].targetModuleName).assertEqual(BundleDomainModel.ENTRY_MODULE);
    });
    /*
     * @tc.number: LinkSchemeValidation_017
     * @tc.name: overlay_priority
     * @tc.desc: verify overlay priority ordering
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_017', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_017 start');
      const infos: OverlayInfoLike[] = BundleDomainModel.getTargetOverlayModuleInfos(BundleDomainModel.ENTRY_MODULE);
      expect(infos[0].priority).assertEqual(1);
      expect(infos[1].priority).assertEqual(2);
      expect(infos[0].priority < infos[1].priority).assertTrue();
    });
    /*
     * @tc.number: LinkSchemeValidation_018
     * @tc.name: calc_add
     * @tc.desc: verify overlay Calc.add
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_018', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_018 start');
      expect(BundleDomainModel.add(1, 2)).assertEqual(3);
      expect(BundleDomainModel.add(-1, 2)).assertEqual(1);
      expect(BundleDomainModel.add(0, 0)).assertEqual(0);
    });
    /*
     * @tc.number: LinkSchemeValidation_019
     * @tc.name: error_code
     * @tc.desc: verify business error code mapping
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_019', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_019 start');
      const code: number = BundleDomainModel.errorCodeForScenario('ability');
      expect(code).assertEqual(17700002);
      expect(BundleDomainModel.errorMessage(code).length > 0).assertTrue();
    });
    /*
     * @tc.number: LinkSchemeValidation_020
     * @tc.name: error_catch
     * @tc.desc: verify BusinessError mapping inside try/catch
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_020', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_020 start');
      let code: number = 0;
      try {
        throw new Error('scenario module');
      } catch (err) {
        const businessError: BusinessError = BundleDomainModel.buildError('module');
        code = businessError.code;
      }
      expect(code).assertEqual(17700026);
    });
    /*
     * @tc.number: LinkSchemeValidation_021
     * @tc.name: module_membership
     * @tc.desc: verify module name membership
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_021', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_021 start');
      const modules: string[] = BundleDomainModel.getModuleNames();
      let found: boolean = false;
      for (let i = 0; i < modules.length; i++) {
        if (modules[i] === 'unknownModule') {
          found = true;
        }
      }
      expect(found).assertEqual(false);
    });
    /*
     * @tc.number: LinkSchemeValidation_022
     * @tc.name: module_valid
     * @tc.desc: verify module validation helper
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_022', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_022 start');
      expect(BundleDomainModel.isValidModule('entry')).assertEqual(true);
    });
    /*
     * @tc.number: LinkSchemeValidation_023
     * @tc.name: bundle_info_fields
     * @tc.desc: verify basic bundleInfo fields
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_023', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_023 start');
      const info: BundleInfoLike = BundleDomainModel.buildBundleInfo();
      expect(info.bundleName).assertEqual(BundleDomainModel.BUNDLE_NAME);
      expect(info.versionCode).assertEqual(BundleDomainModel.VERSION_CODE);
      expect(info.enabled).assertTrue();
    });
    /*
     * @tc.number: LinkSchemeValidation_024
     * @tc.name: bundle_version
     * @tc.desc: verify bundle version name and code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_024', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_024 start');
      const info: BundleInfoLike = BundleDomainModel.buildBundleInfo();
      expect(info.versionName).assertEqual(BundleDomainModel.VERSION_NAME);
      expect(info.versionCode > 0).assertTrue();
    });
    /*
     * @tc.number: LinkSchemeValidation_025
     * @tc.name: flag_combine
     * @tc.desc: verify bundle flag combination
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_025', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_025 start');
      const flags: number = BundleDomainModel.combineFlags(BundleFlag.ABILITY, BundleFlag.HAP_MODULE);
      expect(BundleDomainModel.hasFlag(flags, BundleFlag.ABILITY)).assertTrue();
      expect(BundleDomainModel.hasFlag(flags, BundleFlag.HAP_MODULE)).assertTrue();
      expect(BundleDomainModel.countFlags(flags)).assertEqual(2);
    });
    /*
     * @tc.number: LinkSchemeValidation_026
     * @tc.name: flag_count_loop
     * @tc.desc: verify incremental flag accumulation
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_026', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_026 start');
      const values: number[] = [1, 2, 4, 8, 16, 32];
      let combined: number = 0;
      for (let i = 0; i < 3; i++) {
        combined = BundleDomainModel.combineFlags(combined, values[i]);
      }
      expect(BundleDomainModel.countFlags(combined)).assertEqual(3);
    });
    /*
     * @tc.number: LinkSchemeValidation_027
     * @tc.name: ability_names
     * @tc.desc: verify ability names from bundleInfo
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_027', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_027 start');
      const names: string[] = BundleDomainModel.getAbilityNames();
      expect(names.length).assertEqual(2);
      expect(names.indexOf(BundleDomainModel.ENTRY_ABILITY) >= 0).assertTrue();
    });
    /*
     * @tc.number: LinkSchemeValidation_028
     * @tc.name: module_names
     * @tc.desc: verify module names from bundleInfo
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_028', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_028 start');
      const modules: string[] = BundleDomainModel.getModuleNames();
      expect(modules.length).assertEqual(3);
      expect(BundleDomainModel.isValidModule(BundleDomainModel.ENTRY_MODULE)).assertTrue();
    });
    /*
     * @tc.number: LinkSchemeValidation_029
     * @tc.name: profile_ability
     * @tc.desc: verify getProfileByAbility result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_029', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_029 start');
      const profile: ProfileLike = BundleDomainModel.getProfileByAbility(BundleDomainModel.ENTRY_MODULE, BundleDomainModel.ENTRY_ABILITY, 'ohos.ability.shortcuts');
      expect(profile.moduleName).assertEqual(BundleDomainModel.ENTRY_MODULE);
      expect(profile.value.length > 0).assertTrue();
    });
    /*
     * @tc.number: LinkSchemeValidation_030
     * @tc.name: profile_extension
     * @tc.desc: verify getProfileByExtensionAbility result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_030', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_030 start');
      const profile: ProfileLike = BundleDomainModel.getProfileByExtensionAbility(BundleDomainModel.ENTRY_MODULE, BundleDomainModel.EXT_ABILITY, 'ohos.ability.NewUIExtAbility');
      expect(profile.abilityName).assertEqual(BundleDomainModel.EXT_ABILITY);
      expect(profile.value).assertEqual('[]');
    });
    /*
     * @tc.number: LinkSchemeValidation_031
     * @tc.name: verify_abc
     * @tc.desc: verify abc file verification
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_031', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_031 start');
      expect(BundleDomainModel.verifyAbc(['/data/storage/el1/bundle/modules.abc'])).assertTrue();
      expect(BundleDomainModel.verifyAbc([])).assertFalse();
    });
    /*
     * @tc.number: LinkSchemeValidation_032
     * @tc.name: verify_abc_multiple
     * @tc.desc: verify multiple abc paths
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_032', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_032 start');
      const paths: string[] = ['/data/a.abc', '/data/b.abc', '/data/c.abc'];
      expect(BundleDomainModel.verifyAbc(paths)).assertTrue();
      expect(BundleDomainModel.verifyAbc([''])).assertFalse();
    });
    /*
     * @tc.number: LinkSchemeValidation_033
     * @tc.name: delete_abc
     * @tc.desc: verify abc file deletion
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_033', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_033 start');
      expect(BundleDomainModel.deleteAbc('/data/storage/el1/bundle/modules.abc')).assertTrue();
      expect(BundleDomainModel.deleteAbc('')).assertFalse();
    });
    /*
     * @tc.number: LinkSchemeValidation_034
     * @tc.name: can_open_link
     * @tc.desc: verify canOpenLink for schemes
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_034', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_034 start');
      expect(BundleDomainModel.canOpenLink('http://example.com')).assertTrue();
      expect(BundleDomainModel.canOpenLink('https://example.com')).assertTrue();
      expect(BundleDomainModel.canOpenLink('ftp://example.com')).assertFalse();
    });
    /*
     * @tc.number: LinkSchemeValidation_035
     * @tc.name: can_open_link_loop
     * @tc.desc: verify canOpenLink across a batch
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_035', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_035 start');
      const links: string[] = ['http://a.com', 'https://b.com', 'ftp://c.com'];
      let valid: number = 0;
      for (let i = 0; i < links.length; i++) {
        if (BundleDomainModel.canOpenLink(links[i])) {
          valid++;
        }
      }
      expect(valid).assertEqual(2);
    });
    /*
     * @tc.number: LinkSchemeValidation_036
     * @tc.name: default_app
     * @tc.desc: verify default application decision
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_036', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_036 start');
      expect(BundleDomainModel.isDefaultApplication(AppType.BROWSER)).assertTrue();
      expect(BundleDomainModel.isDefaultApplication(AppType.VIDEO)).assertFalse();
    });
    /*
     * @tc.number: LinkSchemeValidation_037
     * @tc.name: default_app_matrix
     * @tc.desc: verify default application across types
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_037', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_037 start');
      const types: AppType[] = [AppType.BROWSER, AppType.AUDIO, AppType.VIDEO, AppType.IMAGE, AppType.EMAIL];
      let count: number = 0;
      for (let i = 0; i < types.length; i++) {
        if (BundleDomainModel.isDefaultApplication(types[i])) {
          count++;
        }
      }
      expect(count).assertEqual(2);
    });
    /*
     * @tc.number: LinkSchemeValidation_038
     * @tc.name: overlay_enable
     * @tc.desc: verify overlay enable state toggle
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_038', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_038 start');
      expect(BundleDomainModel.setOverlayEnabled(BundleDomainModel.OVERLAY_MODULE, true)).assertEqual(OverlayState.ENABLED);
      expect(BundleDomainModel.setOverlayEnabled(BundleDomainModel.OVERLAY_MODULE, false)).assertEqual(OverlayState.DISABLED);
    });
    /*
     * @tc.number: LinkSchemeValidation_039
     * @tc.name: overlay_info
     * @tc.desc: verify overlay module info
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_039', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_039 start');
      const info: OverlayInfoLike = BundleDomainModel.getOverlayModuleInfo(BundleDomainModel.RUNTIME_OVERLAY_MODULE);
      expect(info.targetModuleName).assertEqual(BundleDomainModel.ENTRY_MODULE);
      expect(info.state).assertEqual(OverlayState.ENABLED);
    });
    /*
     * @tc.number: LinkSchemeValidation_040
     * @tc.name: target_overlays
     * @tc.desc: verify target overlay module infos
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_040', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_040 start');
      const infos: OverlayInfoLike[] = BundleDomainModel.getTargetOverlayModuleInfos(BundleDomainModel.ENTRY_MODULE);
      expect(infos.length).assertEqual(2);
      expect(infos[0].targetModuleName).assertEqual(BundleDomainModel.ENTRY_MODULE);
    });
    /*
     * @tc.number: LinkSchemeValidation_041
     * @tc.name: overlay_priority
     * @tc.desc: verify overlay priority ordering
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_041', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_041 start');
      const infos: OverlayInfoLike[] = BundleDomainModel.getTargetOverlayModuleInfos(BundleDomainModel.ENTRY_MODULE);
      expect(infos[0].priority).assertEqual(1);
      expect(infos[1].priority).assertEqual(2);
      expect(infos[0].priority < infos[1].priority).assertTrue();
    });
    /*
     * @tc.number: LinkSchemeValidation_042
     * @tc.name: calc_add
     * @tc.desc: verify overlay Calc.add
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_042', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_042 start');
      expect(BundleDomainModel.add(1, 2)).assertEqual(3);
      expect(BundleDomainModel.add(-1, 2)).assertEqual(1);
      expect(BundleDomainModel.add(0, 0)).assertEqual(0);
    });
    /*
     * @tc.number: LinkSchemeValidation_043
     * @tc.name: error_code
     * @tc.desc: verify business error code mapping
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_043', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_043 start');
      const code: number = BundleDomainModel.errorCodeForScenario('ability');
      expect(code).assertEqual(17700002);
      expect(BundleDomainModel.errorMessage(code).length > 0).assertTrue();
    });
    /*
     * @tc.number: LinkSchemeValidation_044
     * @tc.name: error_catch
     * @tc.desc: verify BusinessError mapping inside try/catch
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_044', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_044 start');
      let code: number = 0;
      try {
        throw new Error('scenario module');
      } catch (err) {
        const businessError: BusinessError = BundleDomainModel.buildError('module');
        code = businessError.code;
      }
      expect(code).assertEqual(17700026);
    });
    /*
     * @tc.number: LinkSchemeValidation_045
     * @tc.name: module_membership
     * @tc.desc: verify module name membership
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_045', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_045 start');
      const modules: string[] = BundleDomainModel.getModuleNames();
      let found: boolean = false;
      for (let i = 0; i < modules.length; i++) {
        if (modules[i] === 'unknownModule') {
          found = true;
        }
      }
      expect(found).assertEqual(false);
    });
    /*
     * @tc.number: LinkSchemeValidation_046
     * @tc.name: module_valid
     * @tc.desc: verify module validation helper
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_046', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_046 start');
      expect(BundleDomainModel.isValidModule('entry')).assertEqual(true);
    });
    /*
     * @tc.number: LinkSchemeValidation_047
     * @tc.name: bundle_info_fields
     * @tc.desc: verify basic bundleInfo fields
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_047', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_047 start');
      const info: BundleInfoLike = BundleDomainModel.buildBundleInfo();
      expect(info.bundleName).assertEqual(BundleDomainModel.BUNDLE_NAME);
      expect(info.versionCode).assertEqual(BundleDomainModel.VERSION_CODE);
      expect(info.enabled).assertTrue();
    });
    /*
     * @tc.number: LinkSchemeValidation_048
     * @tc.name: bundle_version
     * @tc.desc: verify bundle version name and code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_048', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_048 start');
      const info: BundleInfoLike = BundleDomainModel.buildBundleInfo();
      expect(info.versionName).assertEqual(BundleDomainModel.VERSION_NAME);
      expect(info.versionCode > 0).assertTrue();
    });
    /*
     * @tc.number: LinkSchemeValidation_049
     * @tc.name: flag_combine
     * @tc.desc: verify bundle flag combination
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_049', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_049 start');
      const flags: number = BundleDomainModel.combineFlags(BundleFlag.ABILITY, BundleFlag.HAP_MODULE);
      expect(BundleDomainModel.hasFlag(flags, BundleFlag.ABILITY)).assertTrue();
      expect(BundleDomainModel.hasFlag(flags, BundleFlag.HAP_MODULE)).assertTrue();
      expect(BundleDomainModel.countFlags(flags)).assertEqual(2);
    });
    /*
     * @tc.number: LinkSchemeValidation_050
     * @tc.name: flag_count_loop
     * @tc.desc: verify incremental flag accumulation
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_050', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_050 start');
      const values: number[] = [1, 2, 4, 8, 16, 32];
      let combined: number = 0;
      for (let i = 0; i < 3; i++) {
        combined = BundleDomainModel.combineFlags(combined, values[i]);
      }
      expect(BundleDomainModel.countFlags(combined)).assertEqual(3);
    });
    /*
     * @tc.number: LinkSchemeValidation_051
     * @tc.name: ability_names
     * @tc.desc: verify ability names from bundleInfo
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_051', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_051 start');
      const names: string[] = BundleDomainModel.getAbilityNames();
      expect(names.length).assertEqual(2);
      expect(names.indexOf(BundleDomainModel.ENTRY_ABILITY) >= 0).assertTrue();
    });
    /*
     * @tc.number: LinkSchemeValidation_052
     * @tc.name: module_names
     * @tc.desc: verify module names from bundleInfo
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_052', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_052 start');
      const modules: string[] = BundleDomainModel.getModuleNames();
      expect(modules.length).assertEqual(3);
      expect(BundleDomainModel.isValidModule(BundleDomainModel.ENTRY_MODULE)).assertTrue();
    });
    /*
     * @tc.number: LinkSchemeValidation_053
     * @tc.name: profile_ability
     * @tc.desc: verify getProfileByAbility result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_053', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_053 start');
      const profile: ProfileLike = BundleDomainModel.getProfileByAbility(BundleDomainModel.ENTRY_MODULE, BundleDomainModel.ENTRY_ABILITY, 'ohos.ability.shortcuts');
      expect(profile.moduleName).assertEqual(BundleDomainModel.ENTRY_MODULE);
      expect(profile.value.length > 0).assertTrue();
    });
    /*
     * @tc.number: LinkSchemeValidation_054
     * @tc.name: profile_extension
     * @tc.desc: verify getProfileByExtensionAbility result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_054', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_054 start');
      const profile: ProfileLike = BundleDomainModel.getProfileByExtensionAbility(BundleDomainModel.ENTRY_MODULE, BundleDomainModel.EXT_ABILITY, 'ohos.ability.NewUIExtAbility');
      expect(profile.abilityName).assertEqual(BundleDomainModel.EXT_ABILITY);
      expect(profile.value).assertEqual('[]');
    });
    /*
     * @tc.number: LinkSchemeValidation_055
     * @tc.name: verify_abc
     * @tc.desc: verify abc file verification
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_055', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_055 start');
      expect(BundleDomainModel.verifyAbc(['/data/storage/el1/bundle/modules.abc'])).assertTrue();
      expect(BundleDomainModel.verifyAbc([])).assertFalse();
    });
    /*
     * @tc.number: LinkSchemeValidation_056
     * @tc.name: verify_abc_multiple
     * @tc.desc: verify multiple abc paths
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_056', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_056 start');
      const paths: string[] = ['/data/a.abc', '/data/b.abc', '/data/c.abc'];
      expect(BundleDomainModel.verifyAbc(paths)).assertTrue();
      expect(BundleDomainModel.verifyAbc([''])).assertFalse();
    });
    /*
     * @tc.number: LinkSchemeValidation_057
     * @tc.name: delete_abc
     * @tc.desc: verify abc file deletion
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_057', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_057 start');
      expect(BundleDomainModel.deleteAbc('/data/storage/el1/bundle/modules.abc')).assertTrue();
      expect(BundleDomainModel.deleteAbc('')).assertFalse();
    });
    /*
     * @tc.number: LinkSchemeValidation_058
     * @tc.name: can_open_link
     * @tc.desc: verify canOpenLink for schemes
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_058', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_058 start');
      expect(BundleDomainModel.canOpenLink('http://example.com')).assertTrue();
      expect(BundleDomainModel.canOpenLink('https://example.com')).assertTrue();
      expect(BundleDomainModel.canOpenLink('ftp://example.com')).assertFalse();
    });
    /*
     * @tc.number: LinkSchemeValidation_059
     * @tc.name: can_open_link_loop
     * @tc.desc: verify canOpenLink across a batch
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_059', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_059 start');
      const links: string[] = ['http://a.com', 'https://b.com', 'ftp://c.com'];
      let valid: number = 0;
      for (let i = 0; i < links.length; i++) {
        if (BundleDomainModel.canOpenLink(links[i])) {
          valid++;
        }
      }
      expect(valid).assertEqual(2);
    });
    /*
     * @tc.number: LinkSchemeValidation_060
     * @tc.name: default_app
     * @tc.desc: verify default application decision
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_060', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_060 start');
      expect(BundleDomainModel.isDefaultApplication(AppType.BROWSER)).assertTrue();
      expect(BundleDomainModel.isDefaultApplication(AppType.VIDEO)).assertFalse();
    });
    /*
     * @tc.number: LinkSchemeValidation_061
     * @tc.name: default_app_matrix
     * @tc.desc: verify default application across types
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_061', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_061 start');
      const types: AppType[] = [AppType.BROWSER, AppType.AUDIO, AppType.VIDEO, AppType.IMAGE, AppType.EMAIL];
      let count: number = 0;
      for (let i = 0; i < types.length; i++) {
        if (BundleDomainModel.isDefaultApplication(types[i])) {
          count++;
        }
      }
      expect(count).assertEqual(2);
    });
    /*
     * @tc.number: LinkSchemeValidation_062
     * @tc.name: overlay_enable
     * @tc.desc: verify overlay enable state toggle
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_062', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_062 start');
      expect(BundleDomainModel.setOverlayEnabled(BundleDomainModel.OVERLAY_MODULE, true)).assertEqual(OverlayState.ENABLED);
      expect(BundleDomainModel.setOverlayEnabled(BundleDomainModel.OVERLAY_MODULE, false)).assertEqual(OverlayState.DISABLED);
    });
    /*
     * @tc.number: LinkSchemeValidation_063
     * @tc.name: overlay_info
     * @tc.desc: verify overlay module info
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_063', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_063 start');
      const info: OverlayInfoLike = BundleDomainModel.getOverlayModuleInfo(BundleDomainModel.RUNTIME_OVERLAY_MODULE);
      expect(info.targetModuleName).assertEqual(BundleDomainModel.ENTRY_MODULE);
      expect(info.state).assertEqual(OverlayState.ENABLED);
    });
    /*
     * @tc.number: LinkSchemeValidation_064
     * @tc.name: target_overlays
     * @tc.desc: verify target overlay module infos
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_064', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_064 start');
      const infos: OverlayInfoLike[] = BundleDomainModel.getTargetOverlayModuleInfos(BundleDomainModel.ENTRY_MODULE);
      expect(infos.length).assertEqual(2);
      expect(infos[0].targetModuleName).assertEqual(BundleDomainModel.ENTRY_MODULE);
    });
    /*
     * @tc.number: LinkSchemeValidation_065
     * @tc.name: overlay_priority
     * @tc.desc: verify overlay priority ordering
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_065', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_065 start');
      const infos: OverlayInfoLike[] = BundleDomainModel.getTargetOverlayModuleInfos(BundleDomainModel.ENTRY_MODULE);
      expect(infos[0].priority).assertEqual(1);
      expect(infos[1].priority).assertEqual(2);
      expect(infos[0].priority < infos[1].priority).assertTrue();
    });
    /*
     * @tc.number: LinkSchemeValidation_066
     * @tc.name: calc_add
     * @tc.desc: verify overlay Calc.add
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_066', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_066 start');
      expect(BundleDomainModel.add(1, 2)).assertEqual(3);
      expect(BundleDomainModel.add(-1, 2)).assertEqual(1);
      expect(BundleDomainModel.add(0, 0)).assertEqual(0);
    });
    /*
     * @tc.number: LinkSchemeValidation_067
     * @tc.name: error_code
     * @tc.desc: verify business error code mapping
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_067', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_067 start');
      const code: number = BundleDomainModel.errorCodeForScenario('ability');
      expect(code).assertEqual(17700002);
      expect(BundleDomainModel.errorMessage(code).length > 0).assertTrue();
    });
    /*
     * @tc.number: LinkSchemeValidation_068
     * @tc.name: error_catch
     * @tc.desc: verify BusinessError mapping inside try/catch
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_068', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_068 start');
      let code: number = 0;
      try {
        throw new Error('scenario module');
      } catch (err) {
        const businessError: BusinessError = BundleDomainModel.buildError('module');
        code = businessError.code;
      }
      expect(code).assertEqual(17700026);
    });
    /*
     * @tc.number: LinkSchemeValidation_069
     * @tc.name: module_membership
     * @tc.desc: verify module name membership
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_069', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_069 start');
      const modules: string[] = BundleDomainModel.getModuleNames();
      let found: boolean = false;
      for (let i = 0; i < modules.length; i++) {
        if (modules[i] === 'unknownModule') {
          found = true;
        }
      }
      expect(found).assertEqual(false);
    });
    /*
     * @tc.number: LinkSchemeValidation_070
     * @tc.name: module_valid
     * @tc.desc: verify module validation helper
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_070', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_070 start');
      expect(BundleDomainModel.isValidModule('entry')).assertEqual(true);
    });
    /*
     * @tc.number: LinkSchemeValidation_071
     * @tc.name: bundle_info_fields
     * @tc.desc: verify basic bundleInfo fields
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_071', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_071 start');
      const info: BundleInfoLike = BundleDomainModel.buildBundleInfo();
      expect(info.bundleName).assertEqual(BundleDomainModel.BUNDLE_NAME);
      expect(info.versionCode).assertEqual(BundleDomainModel.VERSION_CODE);
      expect(info.enabled).assertTrue();
    });
    /*
     * @tc.number: LinkSchemeValidation_072
     * @tc.name: bundle_version
     * @tc.desc: verify bundle version name and code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_072', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_072 start');
      const info: BundleInfoLike = BundleDomainModel.buildBundleInfo();
      expect(info.versionName).assertEqual(BundleDomainModel.VERSION_NAME);
      expect(info.versionCode > 0).assertTrue();
    });
    /*
     * @tc.number: LinkSchemeValidation_073
     * @tc.name: flag_combine
     * @tc.desc: verify bundle flag combination
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('LinkSchemeValidation_073', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case LinkSchemeValidation_073 start');
      const flags: number = BundleDomainModel.combineFlags(BundleFlag.ABILITY, BundleFlag.HAP_MODULE);
      expect(BundleDomainModel.hasFlag(flags, BundleFlag.ABILITY)).assertTrue();
      expect(BundleDomainModel.hasFlag(flags, BundleFlag.HAP_MODULE)).assertTrue();
      expect(BundleDomainModel.countFlags(flags)).assertEqual(2);
    });
  });
}
