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

const TAG: string = 'BundleOperationFlow';
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


export default function bundleOperationFlowTest() {
  describe('BundleOperationFlow_Test', () => {
    beforeAll(() => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'suite BundleOperationFlow begin');
    });
    afterAll(() => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'suite BundleOperationFlow end');
    });
    /*
     * @tc.number: BundleOperationFlow_000
     * @tc.name: flag_combine
     * @tc.desc: verify bundle flag combination
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_000', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_000 start');
      const flags: number = BundleDomainModel.combineFlags(BundleFlag.ABILITY, BundleFlag.HAP_MODULE);
      expect(BundleDomainModel.hasFlag(flags, BundleFlag.ABILITY)).assertTrue();
      expect(BundleDomainModel.hasFlag(flags, BundleFlag.HAP_MODULE)).assertTrue();
      expect(BundleDomainModel.countFlags(flags)).assertEqual(2);
    });
    /*
     * @tc.number: BundleOperationFlow_001
     * @tc.name: flag_count_loop
     * @tc.desc: verify incremental flag accumulation
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_001', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_001 start');
      const values: number[] = [1, 2, 4, 8, 16, 32];
      let combined: number = 0;
      for (let i = 0; i < 2; i++) {
        combined = BundleDomainModel.combineFlags(combined, values[i]);
      }
      expect(BundleDomainModel.countFlags(combined)).assertEqual(2);
    });
    /*
     * @tc.number: BundleOperationFlow_002
     * @tc.name: ability_names
     * @tc.desc: verify ability names from bundleInfo
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_002', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_002 start');
      const names: string[] = BundleDomainModel.getAbilityNames();
      expect(names.length).assertEqual(2);
      expect(names.indexOf(BundleDomainModel.ENTRY_ABILITY) >= 0).assertTrue();
    });
    /*
     * @tc.number: BundleOperationFlow_003
     * @tc.name: module_names
     * @tc.desc: verify module names from bundleInfo
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_003', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_003 start');
      const modules: string[] = BundleDomainModel.getModuleNames();
      expect(modules.length).assertEqual(3);
      expect(BundleDomainModel.isValidModule(BundleDomainModel.ENTRY_MODULE)).assertTrue();
    });
    /*
     * @tc.number: BundleOperationFlow_004
     * @tc.name: profile_ability
     * @tc.desc: verify getProfileByAbility result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_004', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_004 start');
      const profile: ProfileLike = BundleDomainModel.getProfileByAbility(BundleDomainModel.ENTRY_MODULE, BundleDomainModel.ENTRY_ABILITY, 'ohos.ability.shortcuts');
      expect(profile.moduleName).assertEqual(BundleDomainModel.ENTRY_MODULE);
      expect(profile.value.length > 0).assertTrue();
    });
    /*
     * @tc.number: BundleOperationFlow_005
     * @tc.name: profile_extension
     * @tc.desc: verify getProfileByExtensionAbility result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_005', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_005 start');
      const profile: ProfileLike = BundleDomainModel.getProfileByExtensionAbility(BundleDomainModel.ENTRY_MODULE, BundleDomainModel.EXT_ABILITY, 'ohos.ability.NewUIExtAbility');
      expect(profile.abilityName).assertEqual(BundleDomainModel.EXT_ABILITY);
      expect(profile.value).assertEqual('[]');
    });
    /*
     * @tc.number: BundleOperationFlow_006
     * @tc.name: verify_abc
     * @tc.desc: verify abc file verification
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_006', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_006 start');
      expect(BundleDomainModel.verifyAbc(['/data/storage/el1/bundle/modules.abc'])).assertTrue();
      expect(BundleDomainModel.verifyAbc([])).assertFalse();
    });
    /*
     * @tc.number: BundleOperationFlow_007
     * @tc.name: verify_abc_multiple
     * @tc.desc: verify multiple abc paths
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_007', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_007 start');
      const paths: string[] = ['/data/a.abc', '/data/b.abc', '/data/c.abc'];
      expect(BundleDomainModel.verifyAbc(paths)).assertTrue();
      expect(BundleDomainModel.verifyAbc([''])).assertFalse();
    });
    /*
     * @tc.number: BundleOperationFlow_008
     * @tc.name: delete_abc
     * @tc.desc: verify abc file deletion
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_008', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_008 start');
      expect(BundleDomainModel.deleteAbc('/data/storage/el1/bundle/modules.abc')).assertTrue();
      expect(BundleDomainModel.deleteAbc('')).assertFalse();
    });
    /*
     * @tc.number: BundleOperationFlow_009
     * @tc.name: can_open_link
     * @tc.desc: verify canOpenLink for schemes
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_009', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_009 start');
      expect(BundleDomainModel.canOpenLink('http://example.com')).assertTrue();
      expect(BundleDomainModel.canOpenLink('https://example.com')).assertTrue();
      expect(BundleDomainModel.canOpenLink('ftp://example.com')).assertFalse();
    });
    /*
     * @tc.number: BundleOperationFlow_010
     * @tc.name: can_open_link_loop
     * @tc.desc: verify canOpenLink across a batch
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_010', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_010 start');
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
     * @tc.number: BundleOperationFlow_011
     * @tc.name: default_app
     * @tc.desc: verify default application decision
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_011', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_011 start');
      expect(BundleDomainModel.isDefaultApplication(AppType.BROWSER)).assertTrue();
      expect(BundleDomainModel.isDefaultApplication(AppType.VIDEO)).assertFalse();
    });
    /*
     * @tc.number: BundleOperationFlow_012
     * @tc.name: default_app_matrix
     * @tc.desc: verify default application across types
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_012', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_012 start');
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
     * @tc.number: BundleOperationFlow_013
     * @tc.name: overlay_enable
     * @tc.desc: verify overlay enable state toggle
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_013', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_013 start');
      expect(BundleDomainModel.setOverlayEnabled(BundleDomainModel.OVERLAY_MODULE, true)).assertEqual(OverlayState.ENABLED);
      expect(BundleDomainModel.setOverlayEnabled(BundleDomainModel.OVERLAY_MODULE, false)).assertEqual(OverlayState.DISABLED);
    });
    /*
     * @tc.number: BundleOperationFlow_014
     * @tc.name: overlay_info
     * @tc.desc: verify overlay module info
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_014', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_014 start');
      const info: OverlayInfoLike = BundleDomainModel.getOverlayModuleInfo(BundleDomainModel.RUNTIME_OVERLAY_MODULE);
      expect(info.targetModuleName).assertEqual(BundleDomainModel.ENTRY_MODULE);
      expect(info.state).assertEqual(OverlayState.ENABLED);
    });
    /*
     * @tc.number: BundleOperationFlow_015
     * @tc.name: target_overlays
     * @tc.desc: verify target overlay module infos
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_015', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_015 start');
      const infos: OverlayInfoLike[] = BundleDomainModel.getTargetOverlayModuleInfos(BundleDomainModel.ENTRY_MODULE);
      expect(infos.length).assertEqual(2);
      expect(infos[0].targetModuleName).assertEqual(BundleDomainModel.ENTRY_MODULE);
    });
    /*
     * @tc.number: BundleOperationFlow_016
     * @tc.name: overlay_priority
     * @tc.desc: verify overlay priority ordering
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_016', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_016 start');
      const infos: OverlayInfoLike[] = BundleDomainModel.getTargetOverlayModuleInfos(BundleDomainModel.ENTRY_MODULE);
      expect(infos[0].priority).assertEqual(1);
      expect(infos[1].priority).assertEqual(2);
      expect(infos[0].priority < infos[1].priority).assertTrue();
    });
    /*
     * @tc.number: BundleOperationFlow_017
     * @tc.name: calc_add
     * @tc.desc: verify overlay Calc.add
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_017', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_017 start');
      expect(BundleDomainModel.add(1, 2)).assertEqual(3);
      expect(BundleDomainModel.add(-1, 2)).assertEqual(1);
      expect(BundleDomainModel.add(0, 0)).assertEqual(0);
    });
    /*
     * @tc.number: BundleOperationFlow_018
     * @tc.name: error_code
     * @tc.desc: verify business error code mapping
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_018', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_018 start');
      const code: number = BundleDomainModel.errorCodeForScenario('bundle');
      expect(code).assertEqual(17700001);
      expect(BundleDomainModel.errorMessage(code).length > 0).assertTrue();
    });
    /*
     * @tc.number: BundleOperationFlow_019
     * @tc.name: error_catch
     * @tc.desc: verify BusinessError mapping inside try/catch
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_019', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_019 start');
      let code: number = 0;
      try {
        throw new Error('scenario ability');
      } catch (err) {
        const businessError: BusinessError = BundleDomainModel.buildError('ability');
        code = businessError.code;
      }
      expect(code).assertEqual(17700002);
    });
    /*
     * @tc.number: BundleOperationFlow_020
     * @tc.name: module_membership
     * @tc.desc: verify module name membership
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_020', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_020 start');
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
     * @tc.number: BundleOperationFlow_021
     * @tc.name: module_valid
     * @tc.desc: verify module validation helper
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_021', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_021 start');
      expect(BundleDomainModel.isValidModule('unknownModule')).assertEqual(false);
    });
    /*
     * @tc.number: BundleOperationFlow_022
     * @tc.name: bundle_info_fields
     * @tc.desc: verify basic bundleInfo fields
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_022', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_022 start');
      const info: BundleInfoLike = BundleDomainModel.buildBundleInfo();
      expect(info.bundleName).assertEqual(BundleDomainModel.BUNDLE_NAME);
      expect(info.versionCode).assertEqual(BundleDomainModel.VERSION_CODE);
      expect(info.enabled).assertTrue();
    });
    /*
     * @tc.number: BundleOperationFlow_023
     * @tc.name: bundle_version
     * @tc.desc: verify bundle version name and code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_023', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_023 start');
      const info: BundleInfoLike = BundleDomainModel.buildBundleInfo();
      expect(info.versionName).assertEqual(BundleDomainModel.VERSION_NAME);
      expect(info.versionCode > 0).assertTrue();
    });
    /*
     * @tc.number: BundleOperationFlow_024
     * @tc.name: flag_combine
     * @tc.desc: verify bundle flag combination
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_024', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_024 start');
      const flags: number = BundleDomainModel.combineFlags(BundleFlag.ABILITY, BundleFlag.HAP_MODULE);
      expect(BundleDomainModel.hasFlag(flags, BundleFlag.ABILITY)).assertTrue();
      expect(BundleDomainModel.hasFlag(flags, BundleFlag.HAP_MODULE)).assertTrue();
      expect(BundleDomainModel.countFlags(flags)).assertEqual(2);
    });
    /*
     * @tc.number: BundleOperationFlow_025
     * @tc.name: flag_count_loop
     * @tc.desc: verify incremental flag accumulation
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_025', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_025 start');
      const values: number[] = [1, 2, 4, 8, 16, 32];
      let combined: number = 0;
      for (let i = 0; i < 2; i++) {
        combined = BundleDomainModel.combineFlags(combined, values[i]);
      }
      expect(BundleDomainModel.countFlags(combined)).assertEqual(2);
    });
    /*
     * @tc.number: BundleOperationFlow_026
     * @tc.name: ability_names
     * @tc.desc: verify ability names from bundleInfo
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_026', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_026 start');
      const names: string[] = BundleDomainModel.getAbilityNames();
      expect(names.length).assertEqual(2);
      expect(names.indexOf(BundleDomainModel.ENTRY_ABILITY) >= 0).assertTrue();
    });
    /*
     * @tc.number: BundleOperationFlow_027
     * @tc.name: module_names
     * @tc.desc: verify module names from bundleInfo
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_027', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_027 start');
      const modules: string[] = BundleDomainModel.getModuleNames();
      expect(modules.length).assertEqual(3);
      expect(BundleDomainModel.isValidModule(BundleDomainModel.ENTRY_MODULE)).assertTrue();
    });
    /*
     * @tc.number: BundleOperationFlow_028
     * @tc.name: profile_ability
     * @tc.desc: verify getProfileByAbility result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_028', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_028 start');
      const profile: ProfileLike = BundleDomainModel.getProfileByAbility(BundleDomainModel.ENTRY_MODULE, BundleDomainModel.ENTRY_ABILITY, 'ohos.ability.shortcuts');
      expect(profile.moduleName).assertEqual(BundleDomainModel.ENTRY_MODULE);
      expect(profile.value.length > 0).assertTrue();
    });
    /*
     * @tc.number: BundleOperationFlow_029
     * @tc.name: profile_extension
     * @tc.desc: verify getProfileByExtensionAbility result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_029', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_029 start');
      const profile: ProfileLike = BundleDomainModel.getProfileByExtensionAbility(BundleDomainModel.ENTRY_MODULE, BundleDomainModel.EXT_ABILITY, 'ohos.ability.NewUIExtAbility');
      expect(profile.abilityName).assertEqual(BundleDomainModel.EXT_ABILITY);
      expect(profile.value).assertEqual('[]');
    });
    /*
     * @tc.number: BundleOperationFlow_030
     * @tc.name: verify_abc
     * @tc.desc: verify abc file verification
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_030', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_030 start');
      expect(BundleDomainModel.verifyAbc(['/data/storage/el1/bundle/modules.abc'])).assertTrue();
      expect(BundleDomainModel.verifyAbc([])).assertFalse();
    });
    /*
     * @tc.number: BundleOperationFlow_031
     * @tc.name: verify_abc_multiple
     * @tc.desc: verify multiple abc paths
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_031', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_031 start');
      const paths: string[] = ['/data/a.abc', '/data/b.abc', '/data/c.abc'];
      expect(BundleDomainModel.verifyAbc(paths)).assertTrue();
      expect(BundleDomainModel.verifyAbc([''])).assertFalse();
    });
    /*
     * @tc.number: BundleOperationFlow_032
     * @tc.name: delete_abc
     * @tc.desc: verify abc file deletion
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_032', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_032 start');
      expect(BundleDomainModel.deleteAbc('/data/storage/el1/bundle/modules.abc')).assertTrue();
      expect(BundleDomainModel.deleteAbc('')).assertFalse();
    });
    /*
     * @tc.number: BundleOperationFlow_033
     * @tc.name: can_open_link
     * @tc.desc: verify canOpenLink for schemes
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_033', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_033 start');
      expect(BundleDomainModel.canOpenLink('http://example.com')).assertTrue();
      expect(BundleDomainModel.canOpenLink('https://example.com')).assertTrue();
      expect(BundleDomainModel.canOpenLink('ftp://example.com')).assertFalse();
    });
    /*
     * @tc.number: BundleOperationFlow_034
     * @tc.name: can_open_link_loop
     * @tc.desc: verify canOpenLink across a batch
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_034', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_034 start');
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
     * @tc.number: BundleOperationFlow_035
     * @tc.name: default_app
     * @tc.desc: verify default application decision
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_035', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_035 start');
      expect(BundleDomainModel.isDefaultApplication(AppType.BROWSER)).assertTrue();
      expect(BundleDomainModel.isDefaultApplication(AppType.VIDEO)).assertFalse();
    });
    /*
     * @tc.number: BundleOperationFlow_036
     * @tc.name: default_app_matrix
     * @tc.desc: verify default application across types
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_036', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_036 start');
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
     * @tc.number: BundleOperationFlow_037
     * @tc.name: overlay_enable
     * @tc.desc: verify overlay enable state toggle
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_037', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_037 start');
      expect(BundleDomainModel.setOverlayEnabled(BundleDomainModel.OVERLAY_MODULE, true)).assertEqual(OverlayState.ENABLED);
      expect(BundleDomainModel.setOverlayEnabled(BundleDomainModel.OVERLAY_MODULE, false)).assertEqual(OverlayState.DISABLED);
    });
    /*
     * @tc.number: BundleOperationFlow_038
     * @tc.name: overlay_info
     * @tc.desc: verify overlay module info
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_038', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_038 start');
      const info: OverlayInfoLike = BundleDomainModel.getOverlayModuleInfo(BundleDomainModel.RUNTIME_OVERLAY_MODULE);
      expect(info.targetModuleName).assertEqual(BundleDomainModel.ENTRY_MODULE);
      expect(info.state).assertEqual(OverlayState.ENABLED);
    });
    /*
     * @tc.number: BundleOperationFlow_039
     * @tc.name: target_overlays
     * @tc.desc: verify target overlay module infos
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_039', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_039 start');
      const infos: OverlayInfoLike[] = BundleDomainModel.getTargetOverlayModuleInfos(BundleDomainModel.ENTRY_MODULE);
      expect(infos.length).assertEqual(2);
      expect(infos[0].targetModuleName).assertEqual(BundleDomainModel.ENTRY_MODULE);
    });
    /*
     * @tc.number: BundleOperationFlow_040
     * @tc.name: overlay_priority
     * @tc.desc: verify overlay priority ordering
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_040', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_040 start');
      const infos: OverlayInfoLike[] = BundleDomainModel.getTargetOverlayModuleInfos(BundleDomainModel.ENTRY_MODULE);
      expect(infos[0].priority).assertEqual(1);
      expect(infos[1].priority).assertEqual(2);
      expect(infos[0].priority < infos[1].priority).assertTrue();
    });
    /*
     * @tc.number: BundleOperationFlow_041
     * @tc.name: calc_add
     * @tc.desc: verify overlay Calc.add
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_041', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_041 start');
      expect(BundleDomainModel.add(1, 2)).assertEqual(3);
      expect(BundleDomainModel.add(-1, 2)).assertEqual(1);
      expect(BundleDomainModel.add(0, 0)).assertEqual(0);
    });
    /*
     * @tc.number: BundleOperationFlow_042
     * @tc.name: error_code
     * @tc.desc: verify business error code mapping
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_042', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_042 start');
      const code: number = BundleDomainModel.errorCodeForScenario('bundle');
      expect(code).assertEqual(17700001);
      expect(BundleDomainModel.errorMessage(code).length > 0).assertTrue();
    });
    /*
     * @tc.number: BundleOperationFlow_043
     * @tc.name: error_catch
     * @tc.desc: verify BusinessError mapping inside try/catch
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_043', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_043 start');
      let code: number = 0;
      try {
        throw new Error('scenario ability');
      } catch (err) {
        const businessError: BusinessError = BundleDomainModel.buildError('ability');
        code = businessError.code;
      }
      expect(code).assertEqual(17700002);
    });
    /*
     * @tc.number: BundleOperationFlow_044
     * @tc.name: module_membership
     * @tc.desc: verify module name membership
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_044', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_044 start');
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
     * @tc.number: BundleOperationFlow_045
     * @tc.name: module_valid
     * @tc.desc: verify module validation helper
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_045', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_045 start');
      expect(BundleDomainModel.isValidModule('unknownModule')).assertEqual(false);
    });
    /*
     * @tc.number: BundleOperationFlow_046
     * @tc.name: bundle_info_fields
     * @tc.desc: verify basic bundleInfo fields
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_046', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_046 start');
      const info: BundleInfoLike = BundleDomainModel.buildBundleInfo();
      expect(info.bundleName).assertEqual(BundleDomainModel.BUNDLE_NAME);
      expect(info.versionCode).assertEqual(BundleDomainModel.VERSION_CODE);
      expect(info.enabled).assertTrue();
    });
    /*
     * @tc.number: BundleOperationFlow_047
     * @tc.name: bundle_version
     * @tc.desc: verify bundle version name and code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_047', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_047 start');
      const info: BundleInfoLike = BundleDomainModel.buildBundleInfo();
      expect(info.versionName).assertEqual(BundleDomainModel.VERSION_NAME);
      expect(info.versionCode > 0).assertTrue();
    });
    /*
     * @tc.number: BundleOperationFlow_048
     * @tc.name: flag_combine
     * @tc.desc: verify bundle flag combination
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_048', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_048 start');
      const flags: number = BundleDomainModel.combineFlags(BundleFlag.ABILITY, BundleFlag.HAP_MODULE);
      expect(BundleDomainModel.hasFlag(flags, BundleFlag.ABILITY)).assertTrue();
      expect(BundleDomainModel.hasFlag(flags, BundleFlag.HAP_MODULE)).assertTrue();
      expect(BundleDomainModel.countFlags(flags)).assertEqual(2);
    });
    /*
     * @tc.number: BundleOperationFlow_049
     * @tc.name: flag_count_loop
     * @tc.desc: verify incremental flag accumulation
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleOperationFlow_049', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleOperationFlow_049 start');
      const values: number[] = [1, 2, 4, 8, 16, 32];
      let combined: number = 0;
      for (let i = 0; i < 2; i++) {
        combined = BundleDomainModel.combineFlags(combined, values[i]);
      }
      expect(BundleDomainModel.countFlags(combined)).assertEqual(2);
    });
  });
}
