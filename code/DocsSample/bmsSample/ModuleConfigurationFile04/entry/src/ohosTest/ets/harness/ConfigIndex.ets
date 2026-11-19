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

import { MODULE_TYPE_ENTRY, MODULE_TYPE_FEATURE } from './ConfigConstants';
import type { AbilityConfig, BundleSnapshot, ModuleConfig } from './ConfigModels';

/**
 * Lookup helper over a bundle snapshot.
 */
export class ConfigIndex {
  private snapshot: BundleSnapshot;

  constructor(snapshot: BundleSnapshot) {
    this.snapshot = snapshot;
  }

  /**
   * Returns true when a module with the requested name exists.
   */
  public hasModule(moduleName: string): boolean {
    return this.findModule(moduleName) !== null;
  }

  /**
   * Returns the module with the requested name, or null when missing.
   */
  public findModule(moduleName: string): ModuleConfig | null {
    for (let index: number = 0; index < this.snapshot.modules.length; index++) {
      if (this.snapshot.modules[index].name === moduleName) {
        return this.snapshot.modules[index];
      }
    }
    return null;
  }

  /**
   * Returns true when the module declares the requested ability.
   */
  public hasAbility(moduleName: string, abilityName: string): boolean {
    return this.findAbility(moduleName, abilityName) !== null;
  }

  /**
   * Returns the ability with the requested name, or null when missing.
   */
  public findAbility(moduleName: string, abilityName: string): AbilityConfig | null {
    const moduleConfig: ModuleConfig | null = this.findModule(moduleName);
    if (moduleConfig === null) {
      return null;
    }
    for (let index: number = 0; index < moduleConfig.abilities.length; index++) {
      if (moduleConfig.abilities[index].name === abilityName) {
        return moduleConfig.abilities[index];
      }
    }
    return null;
  }

  /**
   * Returns the first module that declares the requested ability.
   */
  public findModuleOfAbility(abilityName: string): ModuleConfig | null {
    for (let index: number = 0; index < this.snapshot.modules.length; index++) {
      const moduleConfig: ModuleConfig = this.snapshot.modules[index];
      for (let abilityIndex: number = 0; abilityIndex < moduleConfig.abilities.length; abilityIndex++) {
        if (moduleConfig.abilities[abilityIndex].name === abilityName) {
          return moduleConfig;
        }
      }
    }
    return null;
  }

  /**
   * Returns all modules in declaration order.
   */
  public modules(): ModuleConfig[] {
    return this.snapshot.modules;
  }

  /**
   * Returns all entry modules.
   */
  public entryModules(): ModuleConfig[] {
    return this.modulesOfType(MODULE_TYPE_ENTRY);
  }

  /**
   * Returns all feature modules.
   */
  public featureModules(): ModuleConfig[] {
    return this.modulesOfType(MODULE_TYPE_FEATURE);
  }

  /**
   * Returns all modules of the requested type.
   */
  public modulesOfType(moduleType: string): ModuleConfig[] {
    const modules: ModuleConfig[] = [];
    for (let index: number = 0; index < this.snapshot.modules.length; index++) {
      if (this.snapshot.modules[index].type === moduleType) {
        modules.push(this.snapshot.modules[index]);
      }
    }
    return modules;
  }

  /**
   * Returns the module names in declaration order.
   */
  public moduleNames(): string[] {
    const names: string[] = [];
    for (let index: number = 0; index < this.snapshot.modules.length; index++) {
      names.push(this.snapshot.modules[index].name);
    }
    return names;
  }

  /**
   * Returns the module names sorted in ascending order.
   */
  public sortedModuleNames(): string[] {
    const names: string[] = this.moduleNames();
    names.sort();
    return names;
  }

  /**
   * Returns the ability names of the requested module.
   */
  public abilityNames(moduleName: string): string[] {
    const names: string[] = [];
    const moduleConfig: ModuleConfig | null = this.findModule(moduleName);
    if (moduleConfig === null) {
      return names;
    }
    for (let index: number = 0; index < moduleConfig.abilities.length; index++) {
      names.push(moduleConfig.abilities[index].name);
    }
    return names;
  }

  /**
   * Counts the abilities of the requested module.
   */
  public abilityCount(moduleName: string): number {
    return this.abilityNames(moduleName).length;
  }

  /**
   * Counts all abilities of the snapshot.
   */
  public totalAbilityCount(): number {
    let total: number = 0;
    for (let index: number = 0; index < this.snapshot.modules.length; index++) {
      total = total + this.snapshot.modules[index].abilities.length;
    }
    return total;
  }

  /**
   * Counts all skills of the snapshot.
   */
  public totalSkillCount(): number {
    let total: number = 0;
    for (let moduleIndex: number = 0; moduleIndex < this.snapshot.modules.length; moduleIndex++) {
      const moduleConfig: ModuleConfig = this.snapshot.modules[moduleIndex];
      for (let abilityIndex: number = 0; abilityIndex < moduleConfig.abilities.length; abilityIndex++) {
        total = total + moduleConfig.abilities[abilityIndex].skills.length;
      }
    }
    return total;
  }

  /**
   * Returns all modules that declare the requested device type.
   */
  public modulesWithDeviceType(deviceType: string): ModuleConfig[] {
    const modules: ModuleConfig[] = [];
    for (let index: number = 0; index < this.snapshot.modules.length; index++) {
      if (this.snapshot.modules[index].deviceTypes.indexOf(deviceType) >= 0) {
        modules.push(this.snapshot.modules[index]);
      }
    }
    return modules;
  }

  /**
   * Returns the union of all declared device types in first seen order.
   */
  public deviceTypeUnion(): string[] {
    const types: string[] = [];
    for (let moduleIndex: number = 0; moduleIndex < this.snapshot.modules.length; moduleIndex++) {
      const deviceTypes: string[] = this.snapshot.modules[moduleIndex].deviceTypes;
      for (let index: number = 0; index < deviceTypes.length; index++) {
        if (types.indexOf(deviceTypes[index]) < 0) {
          types.push(deviceTypes[index]);
        }
      }
    }
    return types;
  }

  /**
   * Returns every preload target name declared by the snapshot.
   */
  public preloadTargets(): string[] {
    const targets: string[] = [];
    for (let moduleIndex: number = 0; moduleIndex < this.snapshot.modules.length; moduleIndex++) {
      const moduleConfig: ModuleConfig = this.snapshot.modules[moduleIndex];
      if (moduleConfig.atomicService === null) {
        continue;
      }
      for (let preloadIndex: number = 0; preloadIndex < moduleConfig.atomicService.preloads.length; preloadIndex++) {
        targets.push(moduleConfig.atomicService.preloads[preloadIndex].moduleName);
      }
    }
    return targets;
  }

  /**
   * Resolves preload target names into existing modules.
   */
  public resolvedPreloadTargets(): ModuleConfig[] {
    const targets: ModuleConfig[] = [];
    const names: string[] = this.preloadTargets();
    for (let index: number = 0; index < names.length; index++) {
      const moduleConfig: ModuleConfig | null = this.findModule(names[index]);
      if (moduleConfig !== null) {
        targets.push(moduleConfig);
      }
    }
    return targets;
  }

  /**
   * Returns preload target names that do not resolve to a module.
   */
  public missingPreloadTargets(): string[] {
    const missing: string[] = [];
    const names: string[] = this.preloadTargets();
    for (let index: number = 0; index < names.length; index++) {
      if (this.findModule(names[index]) === null) {
        missing.push(names[index]);
      }
    }
    return missing;
  }

  /**
   * Returns all resource references declared by a module.
   */
  public moduleResourceRefs(moduleName: string): string[] {
    const refs: string[] = [];
    const moduleConfig: ModuleConfig | null = this.findModule(moduleName);
    if (moduleConfig === null) {
      return refs;
    }
    refs.push(moduleConfig.description);
    refs.push(moduleConfig.pages);
    for (let index: number = 0; index < moduleConfig.abilities.length; index++) {
      const ability: AbilityConfig = moduleConfig.abilities[index];
      refs.push(ability.description);
      refs.push(ability.icon);
      refs.push(ability.label);
      refs.push(ability.startWindowIcon);
      refs.push(ability.startWindowBackground);
    }
    return refs;
  }

  /**
   * Returns the number of declared extension abilities.
   */
  public totalExtensionCount(): number {
    let total: number = 0;
    for (let index: number = 0; index < this.snapshot.modules.length; index++) {
      total = total + this.snapshot.modules[index].extensionAbilities.length;
    }
    return total;
  }
}
