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

import { bundleManager } from '@kit.AbilityKit';

/**
 * Thin wrapper over bundleManager used by the integration tests.
 */
export class BundleInspector {
  /**
   * Returns the bundle info of the application under test.
   */
  public static async getSelfBundleInfo(): Promise<bundleManager.BundleInfo> {
    return await bundleManager.getBundleInfoForSelf(BundleInspector.selfFlags());
  }

  /**
   * Returns the flags used to read module, ability and application information.
   */
  public static selfFlags(): number {
    return bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
  }

  /**
   * Returns the module with the requested name, or null when missing.
   */
  public static findModule(bundleInfo: bundleManager.BundleInfo,
    moduleName: string): bundleManager.HapModuleInfo | null {
    const modules: bundleManager.HapModuleInfo[] = bundleInfo.hapModulesInfo;
    for (let index: number = 0; index < modules.length; index++) {
      if (modules[index].name === moduleName) {
        return modules[index];
      }
    }
    return null;
  }

  /**
   * Returns the ability with the requested name, or null when missing.
   */
  public static findAbility(moduleInfo: bundleManager.HapModuleInfo,
    abilityName: string): bundleManager.AbilityInfo | null {
    const abilities: bundleManager.AbilityInfo[] = moduleInfo.abilitiesInfo;
    for (let index: number = 0; index < abilities.length; index++) {
      if (abilities[index].name === abilityName) {
        return abilities[index];
      }
    }
    return null;
  }

  /**
   * Returns the module names of the installed bundle.
   */
  public static moduleNames(bundleInfo: bundleManager.BundleInfo): string[] {
    const names: string[] = [];
    for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
      names.push(bundleInfo.hapModulesInfo[index].name);
    }
    return names;
  }

  /**
   * Returns the ability names declared by the requested module.
   */
  public static abilityNames(moduleInfo: bundleManager.HapModuleInfo): string[] {
    const names: string[] = [];
    for (let index: number = 0; index < moduleInfo.abilitiesInfo.length; index++) {
      names.push(moduleInfo.abilitiesInfo[index].name);
    }
    return names;
  }

  /**
   * Returns true when the ability declares the requested entity in any skill.
   */
  public static hasEntity(abilityInfo: bundleManager.AbilityInfo, entity: string): boolean {
    const skills: bundleManager.Skill[] = abilityInfo.skills;
    for (let skillIndex: number = 0; skillIndex < skills.length; skillIndex++) {
      const entities: string[] = skills[skillIndex].entities;
      if (entities.indexOf(entity) >= 0) {
        return true;
      }
    }
    return false;
  }

  /**
   * Returns true when the ability declares the requested action in any skill.
   */
  public static hasAction(abilityInfo: bundleManager.AbilityInfo, action: string): boolean {
    const skills: bundleManager.Skill[] = abilityInfo.skills;
    for (let skillIndex: number = 0; skillIndex < skills.length; skillIndex++) {
      const actions: string[] = skills[skillIndex].actions;
      if (actions.indexOf(action) >= 0) {
        return true;
      }
    }
    return false;
  }

  /**
   * Returns the total number of abilities declared by the installed bundle.
   */
  public static totalAbilityCount(bundleInfo: bundleManager.BundleInfo): number {
    let total: number = 0;
    for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
      total = total + bundleInfo.hapModulesInfo[index].abilitiesInfo.length;
    }
    return total;
  }

  /**
   * Returns true when the bundle declares the requested module.
   */
  public static hasModule(bundleInfo: bundleManager.BundleInfo, moduleName: string): boolean {
    return BundleInspector.findModule(bundleInfo, moduleName) !== null;
  }

  /**
   * Returns the union of device types of the installed modules.
   */
  public static deviceTypeUnion(bundleInfo: bundleManager.BundleInfo): string[] {
    const types: string[] = [];
    for (let moduleIndex: number = 0; moduleIndex < bundleInfo.hapModulesInfo.length; moduleIndex++) {
      const deviceTypes: string[] = bundleInfo.hapModulesInfo[moduleIndex].deviceTypes;
      for (let index: number = 0; index < deviceTypes.length; index++) {
        if (types.indexOf(deviceTypes[index]) < 0) {
          types.push(deviceTypes[index]);
        }
      }
    }
    return types;
  }
}
