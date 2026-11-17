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

const TAG: string = 'ConcurrencyControl';
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


export default function concurrencyControlTest() {
  describe('ConcurrencyControl_Test', () => {
    beforeAll(() => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'suite ConcurrencyControl begin');
    });
    afterAll(() => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'suite ConcurrencyControl end');
    });
    /*
     * @tc.number: ConcurrencyControl_000
     * @tc.name: can_open_link_loop
     * @tc.desc: verify canOpenLink across a batch
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ConcurrencyControl_000', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case ConcurrencyControl_000 start');
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
     * @tc.number: ConcurrencyControl_001
     * @tc.name: default_app
     * @tc.desc: verify default application decision
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ConcurrencyControl_001', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case ConcurrencyControl_001 start');
      expect(BundleDomainModel.isDefaultApplication(AppType.BROWSER)).assertTrue();
      expect(BundleDomainModel.isDefaultApplication(AppType.VIDEO)).assertFalse();
    });
    /*
     * @tc.number: ConcurrencyControl_002
     * @tc.name: default_app_matrix
     * @tc.desc: verify default application across types
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ConcurrencyControl_002', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case ConcurrencyControl_002 start');
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
     * @tc.number: ConcurrencyControl_003
     * @tc.name: overlay_enable
     * @tc.desc: verify overlay enable state toggle
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ConcurrencyControl_003', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case ConcurrencyControl_003 start');
      expect(BundleDomainModel.setOverlayEnabled(BundleDomainModel.OVERLAY_MODULE, true)).assertEqual(OverlayState.ENABLED);
      expect(BundleDomainModel.setOverlayEnabled(BundleDomainModel.OVERLAY_MODULE, false)).assertEqual(OverlayState.DISABLED);
    });
    /*
     * @tc.number: ConcurrencyControl_004
     * @tc.name: overlay_info
     * @tc.desc: verify overlay module info
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ConcurrencyControl_004', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case ConcurrencyControl_004 start');
      const info: OverlayInfoLike = BundleDomainModel.getOverlayModuleInfo(BundleDomainModel.RUNTIME_OVERLAY_MODULE);
      expect(info.targetModuleName).assertEqual(BundleDomainModel.ENTRY_MODULE);
      expect(info.state).assertEqual(OverlayState.ENABLED);
    });
    /*
     * @tc.number: ConcurrencyControl_005
     * @tc.name: target_overlays
     * @tc.desc: verify target overlay module infos
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ConcurrencyControl_005', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case ConcurrencyControl_005 start');
      const infos: OverlayInfoLike[] = BundleDomainModel.getTargetOverlayModuleInfos(BundleDomainModel.ENTRY_MODULE);
      expect(infos.length).assertEqual(2);
      expect(infos[0].targetModuleName).assertEqual(BundleDomainModel.ENTRY_MODULE);
    });
    /*
     * @tc.number: ConcurrencyControl_006
     * @tc.name: overlay_priority
     * @tc.desc: verify overlay priority ordering
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ConcurrencyControl_006', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case ConcurrencyControl_006 start');
      const infos: OverlayInfoLike[] = BundleDomainModel.getTargetOverlayModuleInfos(BundleDomainModel.ENTRY_MODULE);
      expect(infos[0].priority).assertEqual(1);
      expect(infos[1].priority).assertEqual(2);
      expect(infos[0].priority < infos[1].priority).assertTrue();
    });
    /*
     * @tc.number: ConcurrencyControl_007
     * @tc.name: calc_add
     * @tc.desc: verify overlay Calc.add
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ConcurrencyControl_007', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case ConcurrencyControl_007 start');
      expect(BundleDomainModel.add(1, 2)).assertEqual(3);
      expect(BundleDomainModel.add(-1, 2)).assertEqual(1);
      expect(BundleDomainModel.add(0, 0)).assertEqual(0);
    });
    /*
     * @tc.number: ConcurrencyControl_008
     * @tc.name: error_code
     * @tc.desc: verify business error code mapping
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ConcurrencyControl_008', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case ConcurrencyControl_008 start');
      const code: number = BundleDomainModel.errorCodeForScenario('module');
      expect(code).assertEqual(17700026);
      expect(BundleDomainModel.errorMessage(code).length > 0).assertTrue();
    });
    /*
     * @tc.number: ConcurrencyControl_009
     * @tc.name: error_catch
     * @tc.desc: verify BusinessError mapping inside try/catch
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ConcurrencyControl_009', 0, () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'case ConcurrencyControl_009 start');
      let code: number = 0;
      try {
        throw new Error('scenario overlay');
      } catch (err) {
        const businessError: BusinessError = BundleDomainModel.buildError('overlay');
        code = businessError.code;
      }
      expect(code).assertEqual(17700040);
    });
  });
}
