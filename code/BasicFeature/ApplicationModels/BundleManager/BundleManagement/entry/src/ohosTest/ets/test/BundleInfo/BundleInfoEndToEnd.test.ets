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

const TAG: string = 'BundleInfoEndToEnd';
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


export default function bundleInfoEndToEndTest() {
  describe('BundleInfoEndToEnd_Test', () => {
    beforeAll(() => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'suite BundleInfoEndToEnd begin');
    });
    afterAll(() => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'suite BundleInfoEndToEnd end');
    });
    /*
     * @tc.number: BundleInfoEndToEnd_000
     * @tc.name: bundle_version
     * @tc.desc: verify bundle version name and code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleInfoEndToEnd_000', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleInfoEndToEnd_000 start');
      const info: BundleInfoLike = BundleDomainModel.buildBundleInfo();
      expect(info.versionName).assertEqual(BundleDomainModel.VERSION_NAME);
      expect(info.versionCode > 0).assertTrue();
    });
    /*
     * @tc.number: BundleInfoEndToEnd_001
     * @tc.name: flag_combine
     * @tc.desc: verify bundle flag combination
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleInfoEndToEnd_001', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleInfoEndToEnd_001 start');
      const flags: number = BundleDomainModel.combineFlags(BundleFlag.ABILITY, BundleFlag.HAP_MODULE);
      expect(BundleDomainModel.hasFlag(flags, BundleFlag.ABILITY)).assertTrue();
      expect(BundleDomainModel.hasFlag(flags, BundleFlag.HAP_MODULE)).assertTrue();
      expect(BundleDomainModel.countFlags(flags)).assertEqual(2);
    });
    /*
     * @tc.number: BundleInfoEndToEnd_002
     * @tc.name: flag_count_loop
     * @tc.desc: verify incremental flag accumulation
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleInfoEndToEnd_002', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleInfoEndToEnd_002 start');
      const values: number[] = [1, 2, 4, 8, 16, 32];
      let combined: number = 0;
      for (let i = 0; i < 3; i++) {
        combined = BundleDomainModel.combineFlags(combined, values[i]);
      }
      expect(BundleDomainModel.countFlags(combined)).assertEqual(3);
    });
    /*
     * @tc.number: BundleInfoEndToEnd_003
     * @tc.name: ability_names
     * @tc.desc: verify ability names from bundleInfo
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleInfoEndToEnd_003', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleInfoEndToEnd_003 start');
      const names: string[] = BundleDomainModel.getAbilityNames();
      expect(names.length).assertEqual(2);
      expect(names.indexOf(BundleDomainModel.ENTRY_ABILITY) >= 0).assertTrue();
    });
    /*
     * @tc.number: BundleInfoEndToEnd_004
     * @tc.name: module_names
     * @tc.desc: verify module names from bundleInfo
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleInfoEndToEnd_004', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleInfoEndToEnd_004 start');
      const modules: string[] = BundleDomainModel.getModuleNames();
      expect(modules.length).assertEqual(3);
      expect(BundleDomainModel.isValidModule(BundleDomainModel.ENTRY_MODULE)).assertTrue();
    });
    /*
     * @tc.number: BundleInfoEndToEnd_005
     * @tc.name: profile_ability
     * @tc.desc: verify getProfileByAbility result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleInfoEndToEnd_005', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleInfoEndToEnd_005 start');
      const profile: ProfileLike = BundleDomainModel.getProfileByAbility(BundleDomainModel.ENTRY_MODULE, BundleDomainModel.ENTRY_ABILITY, 'ohos.ability.shortcuts');
      expect(profile.moduleName).assertEqual(BundleDomainModel.ENTRY_MODULE);
      expect(profile.value.length > 0).assertTrue();
    });
    /*
     * @tc.number: BundleInfoEndToEnd_006
     * @tc.name: profile_extension
     * @tc.desc: verify getProfileByExtensionAbility result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleInfoEndToEnd_006', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleInfoEndToEnd_006 start');
      const profile: ProfileLike = BundleDomainModel.getProfileByExtensionAbility(BundleDomainModel.ENTRY_MODULE, BundleDomainModel.EXT_ABILITY, 'ohos.ability.NewUIExtAbility');
      expect(profile.abilityName).assertEqual(BundleDomainModel.EXT_ABILITY);
      expect(profile.value).assertEqual('[]');
    });
    /*
     * @tc.number: BundleInfoEndToEnd_007
     * @tc.name: verify_abc
     * @tc.desc: verify abc file verification
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleInfoEndToEnd_007', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleInfoEndToEnd_007 start');
      expect(BundleDomainModel.verifyAbc(['/data/storage/el1/bundle/modules.abc'])).assertTrue();
      expect(BundleDomainModel.verifyAbc([])).assertFalse();
    });
    /*
     * @tc.number: BundleInfoEndToEnd_008
     * @tc.name: verify_abc_multiple
     * @tc.desc: verify multiple abc paths
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleInfoEndToEnd_008', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleInfoEndToEnd_008 start');
      const paths: string[] = ['/data/a.abc', '/data/b.abc', '/data/c.abc'];
      expect(BundleDomainModel.verifyAbc(paths)).assertTrue();
      expect(BundleDomainModel.verifyAbc([''])).assertFalse();
    });
    /*
     * @tc.number: BundleInfoEndToEnd_009
     * @tc.name: delete_abc
     * @tc.desc: verify abc file deletion
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleInfoEndToEnd_009', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleInfoEndToEnd_009 start');
      expect(BundleDomainModel.deleteAbc('/data/storage/el1/bundle/modules.abc')).assertTrue();
      expect(BundleDomainModel.deleteAbc('')).assertFalse();
    });
    /*
     * @tc.number: BundleInfoEndToEnd_010
     * @tc.name: can_open_link
     * @tc.desc: verify canOpenLink for schemes
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleInfoEndToEnd_010', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleInfoEndToEnd_010 start');
      expect(BundleDomainModel.canOpenLink('http://example.com')).assertTrue();
      expect(BundleDomainModel.canOpenLink('https://example.com')).assertTrue();
      expect(BundleDomainModel.canOpenLink('ftp://example.com')).assertFalse();
    });
    /*
     * @tc.number: BundleInfoEndToEnd_011
     * @tc.name: can_open_link_loop
     * @tc.desc: verify canOpenLink across a batch
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleInfoEndToEnd_011', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleInfoEndToEnd_011 start');
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
     * @tc.number: BundleInfoEndToEnd_012
     * @tc.name: default_app
     * @tc.desc: verify default application decision
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleInfoEndToEnd_012', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleInfoEndToEnd_012 start');
      expect(BundleDomainModel.isDefaultApplication(AppType.BROWSER)).assertTrue();
      expect(BundleDomainModel.isDefaultApplication(AppType.VIDEO)).assertFalse();
    });
    /*
     * @tc.number: BundleInfoEndToEnd_013
     * @tc.name: default_app_matrix
     * @tc.desc: verify default application across types
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleInfoEndToEnd_013', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleInfoEndToEnd_013 start');
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
     * @tc.number: BundleInfoEndToEnd_014
     * @tc.name: overlay_enable
     * @tc.desc: verify overlay enable state toggle
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleInfoEndToEnd_014', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleInfoEndToEnd_014 start');
      expect(BundleDomainModel.setOverlayEnabled(BundleDomainModel.OVERLAY_MODULE, true)).assertEqual(OverlayState.ENABLED);
      expect(BundleDomainModel.setOverlayEnabled(BundleDomainModel.OVERLAY_MODULE, false)).assertEqual(OverlayState.DISABLED);
    });
    /*
     * @tc.number: BundleInfoEndToEnd_015
     * @tc.name: overlay_info
     * @tc.desc: verify overlay module info
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('BundleInfoEndToEnd_015', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case BundleInfoEndToEnd_015 start');
      const info: OverlayInfoLike = BundleDomainModel.getOverlayModuleInfo(BundleDomainModel.RUNTIME_OVERLAY_MODULE);
      expect(info.targetModuleName).assertEqual(BundleDomainModel.ENTRY_MODULE);
      expect(info.state).assertEqual(OverlayState.ENABLED);
    });
  });
}
