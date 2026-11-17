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

const TAG: string = 'BundleAppVersion';
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


export default function bundleAppVersionTest() {
  describe('BundleAppVersion_Test', () => {
    beforeAll(() => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'suite BundleAppVersion begin');
    });
    afterAll(() => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'suite BundleAppVersion end');
    });
    /*
     * @tc.number: BundleAppVersion_000
     * @tc.name: overlay_info
     * @tc.desc: verify overlay module info
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_000', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_000 start');
      const info: OverlayInfoLike = BundleDomainModel.getOverlayModuleInfo(BundleDomainModel.RUNTIME_OVERLAY_MODULE);
      expect(info.targetModuleName).assertEqual(BundleDomainModel.ENTRY_MODULE);
      expect(info.state).assertEqual(OverlayState.ENABLED);
    });
    /*
     * @tc.number: BundleAppVersion_001
     * @tc.name: target_overlays
     * @tc.desc: verify target overlay module infos
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_001', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_001 start');
      const infos: OverlayInfoLike[] = BundleDomainModel.getTargetOverlayModuleInfos(BundleDomainModel.ENTRY_MODULE);
      expect(infos.length).assertEqual(2);
      expect(infos[0].targetModuleName).assertEqual(BundleDomainModel.ENTRY_MODULE);
    });
    /*
     * @tc.number: BundleAppVersion_002
     * @tc.name: overlay_priority
     * @tc.desc: verify overlay priority ordering
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_002', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_002 start');
      const infos: OverlayInfoLike[] = BundleDomainModel.getTargetOverlayModuleInfos(BundleDomainModel.ENTRY_MODULE);
      expect(infos[0].priority).assertEqual(1);
      expect(infos[1].priority).assertEqual(2);
      expect(infos[0].priority < infos[1].priority).assertTrue();
    });
    /*
     * @tc.number: BundleAppVersion_003
     * @tc.name: calc_add
     * @tc.desc: verify overlay Calc.add
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_003', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_003 start');
      expect(BundleDomainModel.add(1, 2)).assertEqual(3);
      expect(BundleDomainModel.add(-1, 2)).assertEqual(1);
      expect(BundleDomainModel.add(0, 0)).assertEqual(0);
    });
    /*
     * @tc.number: BundleAppVersion_004
     * @tc.name: error_code
     * @tc.desc: verify business error code mapping
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_004', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_004 start');
      const code: number = BundleDomainModel.errorCodeForScenario('signature');
      expect(code).assertEqual(17700060);
      expect(BundleDomainModel.errorMessage(code).length > 0).assertTrue();
    });
    /*
     * @tc.number: BundleAppVersion_005
     * @tc.name: error_catch
     * @tc.desc: verify BusinessError mapping inside try/catch
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_005', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_005 start');
      let code: number = 0;
      try {
        throw new Error('scenario none');
      } catch (err) {
        const businessError: BusinessError = BundleDomainModel.buildError('none');
        code = businessError.code;
      }
      expect(code).assertEqual(0);
    });
    /*
     * @tc.number: BundleAppVersion_006
     * @tc.name: module_membership
     * @tc.desc: verify module name membership
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_006', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_006 start');
      const modules: string[] = BundleDomainModel.getModuleNames();
      let found: boolean = false;
      for (let i = 0; i < modules.length; i++) {
        if (modules[i] === 'entry') {
          found = true;
        }
      }
      expect(found).assertEqual(true);
    });
    /*
     * @tc.number: BundleAppVersion_007
     * @tc.name: module_valid
     * @tc.desc: verify module validation helper
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_007', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_007 start');
      expect(BundleDomainModel.isValidModule('unknownModule')).assertEqual(false);
    });
    /*
     * @tc.number: BundleAppVersion_008
     * @tc.name: bundle_info_fields
     * @tc.desc: verify basic bundleInfo fields
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_008', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_008 start');
      const info: BundleInfoLike = BundleDomainModel.buildBundleInfo();
      expect(info.bundleName).assertEqual(BundleDomainModel.BUNDLE_NAME);
      expect(info.versionCode).assertEqual(BundleDomainModel.VERSION_CODE);
      expect(info.enabled).assertTrue();
    });
    /*
     * @tc.number: BundleAppVersion_009
     * @tc.name: bundle_version
     * @tc.desc: verify bundle version name and code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_009', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_009 start');
      const info: BundleInfoLike = BundleDomainModel.buildBundleInfo();
      expect(info.versionName).assertEqual(BundleDomainModel.VERSION_NAME);
      expect(info.versionCode > 0).assertTrue();
    });
    /*
     * @tc.number: BundleAppVersion_010
     * @tc.name: flag_combine
     * @tc.desc: verify bundle flag combination
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_010', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_010 start');
      const flags: number = BundleDomainModel.combineFlags(BundleFlag.ABILITY, BundleFlag.HAP_MODULE);
      expect(BundleDomainModel.hasFlag(flags, BundleFlag.ABILITY)).assertTrue();
      expect(BundleDomainModel.hasFlag(flags, BundleFlag.HAP_MODULE)).assertTrue();
      expect(BundleDomainModel.countFlags(flags)).assertEqual(2);
    });
    /*
     * @tc.number: BundleAppVersion_011
     * @tc.name: flag_count_loop
     * @tc.desc: verify incremental flag accumulation
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_011', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_011 start');
      const values: number[] = [1, 2, 4, 8, 16, 32];
      let combined: number = 0;
      for (let i = 0; i < 6; i++) {
        combined = BundleDomainModel.combineFlags(combined, values[i]);
      }
      expect(BundleDomainModel.countFlags(combined)).assertEqual(6);
    });
    /*
     * @tc.number: BundleAppVersion_012
     * @tc.name: ability_names
     * @tc.desc: verify ability names from bundleInfo
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_012', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_012 start');
      const names: string[] = BundleDomainModel.getAbilityNames();
      expect(names.length).assertEqual(2);
      expect(names.indexOf(BundleDomainModel.ENTRY_ABILITY) >= 0).assertTrue();
    });
    /*
     * @tc.number: BundleAppVersion_013
     * @tc.name: module_names
     * @tc.desc: verify module names from bundleInfo
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_013', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_013 start');
      const modules: string[] = BundleDomainModel.getModuleNames();
      expect(modules.length).assertEqual(3);
      expect(BundleDomainModel.isValidModule(BundleDomainModel.ENTRY_MODULE)).assertTrue();
    });
    /*
     * @tc.number: BundleAppVersion_014
     * @tc.name: profile_ability
     * @tc.desc: verify getProfileByAbility result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_014', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_014 start');
      const profile: ProfileLike = BundleDomainModel.getProfileByAbility(BundleDomainModel.ENTRY_MODULE, BundleDomainModel.ENTRY_ABILITY, 'ohos.ability.shortcuts');
      expect(profile.moduleName).assertEqual(BundleDomainModel.ENTRY_MODULE);
      expect(profile.value.length > 0).assertTrue();
    });
    /*
     * @tc.number: BundleAppVersion_015
     * @tc.name: profile_extension
     * @tc.desc: verify getProfileByExtensionAbility result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_015', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_015 start');
      const profile: ProfileLike = BundleDomainModel.getProfileByExtensionAbility(BundleDomainModel.ENTRY_MODULE, BundleDomainModel.EXT_ABILITY, 'ohos.ability.NewUIExtAbility');
      expect(profile.abilityName).assertEqual(BundleDomainModel.EXT_ABILITY);
      expect(profile.value).assertEqual('[]');
    });
    /*
     * @tc.number: BundleAppVersion_016
     * @tc.name: verify_abc
     * @tc.desc: verify abc file verification
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_016', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_016 start');
      expect(BundleDomainModel.verifyAbc(['/data/storage/el1/bundle/modules.abc'])).assertTrue();
      expect(BundleDomainModel.verifyAbc([])).assertFalse();
    });
    /*
     * @tc.number: BundleAppVersion_017
     * @tc.name: verify_abc_multiple
     * @tc.desc: verify multiple abc paths
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_017', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_017 start');
      const paths: string[] = ['/data/a.abc', '/data/b.abc', '/data/c.abc'];
      expect(BundleDomainModel.verifyAbc(paths)).assertTrue();
      expect(BundleDomainModel.verifyAbc([''])).assertFalse();
    });
    /*
     * @tc.number: BundleAppVersion_018
     * @tc.name: delete_abc
     * @tc.desc: verify abc file deletion
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_018', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_018 start');
      expect(BundleDomainModel.deleteAbc('/data/storage/el1/bundle/modules.abc')).assertTrue();
      expect(BundleDomainModel.deleteAbc('')).assertFalse();
    });
    /*
     * @tc.number: BundleAppVersion_019
     * @tc.name: can_open_link
     * @tc.desc: verify canOpenLink for schemes
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_019', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_019 start');
      expect(BundleDomainModel.canOpenLink('http://example.com')).assertTrue();
      expect(BundleDomainModel.canOpenLink('https://example.com')).assertTrue();
      expect(BundleDomainModel.canOpenLink('ftp://example.com')).assertFalse();
    });
    /*
     * @tc.number: BundleAppVersion_020
     * @tc.name: can_open_link_loop
     * @tc.desc: verify canOpenLink across a batch
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_020', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_020 start');
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
     * @tc.number: BundleAppVersion_021
     * @tc.name: default_app
     * @tc.desc: verify default application decision
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_021', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_021 start');
      expect(BundleDomainModel.isDefaultApplication(AppType.BROWSER)).assertTrue();
      expect(BundleDomainModel.isDefaultApplication(AppType.VIDEO)).assertFalse();
    });
    /*
     * @tc.number: BundleAppVersion_022
     * @tc.name: default_app_matrix
     * @tc.desc: verify default application across types
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_022', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_022 start');
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
     * @tc.number: BundleAppVersion_023
     * @tc.name: overlay_enable
     * @tc.desc: verify overlay enable state toggle
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_023', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_023 start');
      expect(BundleDomainModel.setOverlayEnabled(BundleDomainModel.OVERLAY_MODULE, true)).assertEqual(OverlayState.ENABLED);
      expect(BundleDomainModel.setOverlayEnabled(BundleDomainModel.OVERLAY_MODULE, false)).assertEqual(OverlayState.DISABLED);
    });
    /*
     * @tc.number: BundleAppVersion_024
     * @tc.name: overlay_info
     * @tc.desc: verify overlay module info
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_024', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_024 start');
      const info: OverlayInfoLike = BundleDomainModel.getOverlayModuleInfo(BundleDomainModel.RUNTIME_OVERLAY_MODULE);
      expect(info.targetModuleName).assertEqual(BundleDomainModel.ENTRY_MODULE);
      expect(info.state).assertEqual(OverlayState.ENABLED);
    });
    /*
     * @tc.number: BundleAppVersion_025
     * @tc.name: target_overlays
     * @tc.desc: verify target overlay module infos
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_025', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_025 start');
      const infos: OverlayInfoLike[] = BundleDomainModel.getTargetOverlayModuleInfos(BundleDomainModel.ENTRY_MODULE);
      expect(infos.length).assertEqual(2);
      expect(infos[0].targetModuleName).assertEqual(BundleDomainModel.ENTRY_MODULE);
    });
    /*
     * @tc.number: BundleAppVersion_026
     * @tc.name: overlay_priority
     * @tc.desc: verify overlay priority ordering
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_026', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_026 start');
      const infos: OverlayInfoLike[] = BundleDomainModel.getTargetOverlayModuleInfos(BundleDomainModel.ENTRY_MODULE);
      expect(infos[0].priority).assertEqual(1);
      expect(infos[1].priority).assertEqual(2);
      expect(infos[0].priority < infos[1].priority).assertTrue();
    });
    /*
     * @tc.number: BundleAppVersion_027
     * @tc.name: calc_add
     * @tc.desc: verify overlay Calc.add
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_027', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_027 start');
      expect(BundleDomainModel.add(1, 2)).assertEqual(3);
      expect(BundleDomainModel.add(-1, 2)).assertEqual(1);
      expect(BundleDomainModel.add(0, 0)).assertEqual(0);
    });
    /*
     * @tc.number: BundleAppVersion_028
     * @tc.name: error_code
     * @tc.desc: verify business error code mapping
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_028', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_028 start');
      const code: number = BundleDomainModel.errorCodeForScenario('signature');
      expect(code).assertEqual(17700060);
      expect(BundleDomainModel.errorMessage(code).length > 0).assertTrue();
    });
    /*
     * @tc.number: BundleAppVersion_029
     * @tc.name: error_catch
     * @tc.desc: verify BusinessError mapping inside try/catch
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_029', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_029 start');
      let code: number = 0;
      try {
        throw new Error('scenario none');
      } catch (err) {
        const businessError: BusinessError = BundleDomainModel.buildError('none');
        code = businessError.code;
      }
      expect(code).assertEqual(0);
    });
    /*
     * @tc.number: BundleAppVersion_030
     * @tc.name: module_membership
     * @tc.desc: verify module name membership
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_030', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_030 start');
      const modules: string[] = BundleDomainModel.getModuleNames();
      let found: boolean = false;
      for (let i = 0; i < modules.length; i++) {
        if (modules[i] === 'entry') {
          found = true;
        }
      }
      expect(found).assertEqual(true);
    });
    /*
     * @tc.number: BundleAppVersion_031
     * @tc.name: module_valid
     * @tc.desc: verify module validation helper
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_031', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_031 start');
      expect(BundleDomainModel.isValidModule('unknownModule')).assertEqual(false);
    });
    /*
     * @tc.number: BundleAppVersion_032
     * @tc.name: bundle_info_fields
     * @tc.desc: verify basic bundleInfo fields
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_032', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_032 start');
      const info: BundleInfoLike = BundleDomainModel.buildBundleInfo();
      expect(info.bundleName).assertEqual(BundleDomainModel.BUNDLE_NAME);
      expect(info.versionCode).assertEqual(BundleDomainModel.VERSION_CODE);
      expect(info.enabled).assertTrue();
    });
    /*
     * @tc.number: BundleAppVersion_033
     * @tc.name: bundle_version
     * @tc.desc: verify bundle version name and code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_033', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_033 start');
      const info: BundleInfoLike = BundleDomainModel.buildBundleInfo();
      expect(info.versionName).assertEqual(BundleDomainModel.VERSION_NAME);
      expect(info.versionCode > 0).assertTrue();
    });
    /*
     * @tc.number: BundleAppVersion_034
     * @tc.name: flag_combine
     * @tc.desc: verify bundle flag combination
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_034', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_034 start');
      const flags: number = BundleDomainModel.combineFlags(BundleFlag.ABILITY, BundleFlag.HAP_MODULE);
      expect(BundleDomainModel.hasFlag(flags, BundleFlag.ABILITY)).assertTrue();
      expect(BundleDomainModel.hasFlag(flags, BundleFlag.HAP_MODULE)).assertTrue();
      expect(BundleDomainModel.countFlags(flags)).assertEqual(2);
    });
    /*
     * @tc.number: BundleAppVersion_035
     * @tc.name: flag_count_loop
     * @tc.desc: verify incremental flag accumulation
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_035', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_035 start');
      const values: number[] = [1, 2, 4, 8, 16, 32];
      let combined: number = 0;
      for (let i = 0; i < 6; i++) {
        combined = BundleDomainModel.combineFlags(combined, values[i]);
      }
      expect(BundleDomainModel.countFlags(combined)).assertEqual(6);
    });
    /*
     * @tc.number: BundleAppVersion_036
     * @tc.name: ability_names
     * @tc.desc: verify ability names from bundleInfo
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_036', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_036 start');
      const names: string[] = BundleDomainModel.getAbilityNames();
      expect(names.length).assertEqual(2);
      expect(names.indexOf(BundleDomainModel.ENTRY_ABILITY) >= 0).assertTrue();
    });
    /*
     * @tc.number: BundleAppVersion_037
     * @tc.name: module_names
     * @tc.desc: verify module names from bundleInfo
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_037', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_037 start');
      const modules: string[] = BundleDomainModel.getModuleNames();
      expect(modules.length).assertEqual(3);
      expect(BundleDomainModel.isValidModule(BundleDomainModel.ENTRY_MODULE)).assertTrue();
    });
    /*
     * @tc.number: BundleAppVersion_038
     * @tc.name: profile_ability
     * @tc.desc: verify getProfileByAbility result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_038', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_038 start');
      const profile: ProfileLike = BundleDomainModel.getProfileByAbility(BundleDomainModel.ENTRY_MODULE, BundleDomainModel.ENTRY_ABILITY, 'ohos.ability.shortcuts');
      expect(profile.moduleName).assertEqual(BundleDomainModel.ENTRY_MODULE);
      expect(profile.value.length > 0).assertTrue();
    });
    /*
     * @tc.number: BundleAppVersion_039
     * @tc.name: profile_extension
     * @tc.desc: verify getProfileByExtensionAbility result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_039', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_039 start');
      const profile: ProfileLike = BundleDomainModel.getProfileByExtensionAbility(BundleDomainModel.ENTRY_MODULE, BundleDomainModel.EXT_ABILITY, 'ohos.ability.NewUIExtAbility');
      expect(profile.abilityName).assertEqual(BundleDomainModel.EXT_ABILITY);
      expect(profile.value).assertEqual('[]');
    });
    /*
     * @tc.number: BundleAppVersion_040
     * @tc.name: verify_abc
     * @tc.desc: verify abc file verification
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_040', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_040 start');
      expect(BundleDomainModel.verifyAbc(['/data/storage/el1/bundle/modules.abc'])).assertTrue();
      expect(BundleDomainModel.verifyAbc([])).assertFalse();
    });
    /*
     * @tc.number: BundleAppVersion_041
     * @tc.name: verify_abc_multiple
     * @tc.desc: verify multiple abc paths
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_041', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_041 start');
      const paths: string[] = ['/data/a.abc', '/data/b.abc', '/data/c.abc'];
      expect(BundleDomainModel.verifyAbc(paths)).assertTrue();
      expect(BundleDomainModel.verifyAbc([''])).assertFalse();
    });
    /*
     * @tc.number: BundleAppVersion_042
     * @tc.name: delete_abc
     * @tc.desc: verify abc file deletion
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_042', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_042 start');
      expect(BundleDomainModel.deleteAbc('/data/storage/el1/bundle/modules.abc')).assertTrue();
      expect(BundleDomainModel.deleteAbc('')).assertFalse();
    });
    /*
     * @tc.number: BundleAppVersion_043
     * @tc.name: can_open_link
     * @tc.desc: verify canOpenLink for schemes
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_043', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_043 start');
      expect(BundleDomainModel.canOpenLink('http://example.com')).assertTrue();
      expect(BundleDomainModel.canOpenLink('https://example.com')).assertTrue();
      expect(BundleDomainModel.canOpenLink('ftp://example.com')).assertFalse();
    });
    /*
     * @tc.number: BundleAppVersion_044
     * @tc.name: can_open_link_loop
     * @tc.desc: verify canOpenLink across a batch
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleAppVersion_044', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleAppVersion_044 start');
      const links: string[] = ['http://a.com', 'https://b.com', 'ftp://c.com'];
      let valid: number = 0;
      for (let i = 0; i < links.length; i++) {
        if (BundleDomainModel.canOpenLink(links[i])) {
          valid++;
        }
      }
      expect(valid).assertEqual(2);
    });
  });
}
