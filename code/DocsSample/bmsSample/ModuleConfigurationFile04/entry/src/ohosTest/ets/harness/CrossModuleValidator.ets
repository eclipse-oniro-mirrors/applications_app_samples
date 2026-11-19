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

import { MAX_MODULES, MODULE_TYPE_ENTRY, MODULE_TYPE_FEATURE } from './ConfigConstants';
import type { BundleSnapshot, ModuleConfig } from './ConfigModels';
import type { Finding } from './FindingTypes';
import { FindingUtils, Severity } from './FindingTypes';

/**
 * Validator for rules that span more than one module inside a bundle.
 */
export class CrossModuleValidator {
  /**
   * Runs every bundle level validation rule.
   */
  public static validate(snapshot: BundleSnapshot): Finding[] {
    const findings: Finding[] = [];
    CrossModuleValidator.append(findings, CrossModuleValidator.validateModuleList(snapshot));
    CrossModuleValidator.append(findings, CrossModuleValidator.validateEntryModules(snapshot));
    CrossModuleValidator.append(findings, CrossModuleValidator.validateAbilityCollisions(snapshot));
    CrossModuleValidator.append(findings, CrossModuleValidator.validatePreloads(snapshot));
    CrossModuleValidator.append(findings, CrossModuleValidator.validatePreloadCycles(snapshot));
    CrossModuleValidator.append(findings, CrossModuleValidator.validateOrphanFeatures(snapshot));
    return findings;
  }

  /**
   * Validates the module list size and uniqueness.
   */
  public static validateModuleList(snapshot: BundleSnapshot): Finding[] {
    const findings: Finding[] = [];
    const modules: ModuleConfig[] = snapshot.modules;
    if (modules.length === 0) {
      findings.push(FindingUtils.create('BUNDLE_MODULES_EMPTY', Severity.ERROR, 'modules',
        'Bundle must declare at least one module'));
      return findings;
    }
    if (modules.length > MAX_MODULES) {
      findings.push(FindingUtils.create('BUNDLE_TOO_MANY_MODULES', Severity.WARN, 'modules',
        'Bundle declares more modules than the recommended limit'));
    }
    const names: string[] = [];
    for (let index: number = 0; index < modules.length; index++) {
      if (names.indexOf(modules[index].name) >= 0) {
        findings.push(FindingUtils.create('BUNDLE_DUPLICATE_MODULE_NAME', Severity.ERROR, `modules[${index}].name`,
          `Module name ${modules[index].name} is declared more than once`));
      } else {
        names.push(modules[index].name);
      }
    }
    return findings;
  }

  /**
   * Validates that exactly one entry module exists.
   */
  public static validateEntryModules(snapshot: BundleSnapshot): Finding[] {
    const findings: Finding[] = [];
    const entries: ModuleConfig[] = CrossModuleValidator.entryModules(snapshot);
    if (entries.length === 0) {
      findings.push(FindingUtils.create('BUNDLE_NO_ENTRY_MODULE', Severity.ERROR, 'modules',
        'Bundle must declare exactly one entry module'));
    } else if (entries.length > 1) {
      findings.push(FindingUtils.create('BUNDLE_MULTIPLE_ENTRY_MODULES', Severity.ERROR, 'modules',
        'Bundle must not declare more than one entry module'));
    }
    return findings;
  }

  /**
   * Detects the same ability name declared by different modules.
   */
  public static validateAbilityCollisions(snapshot: BundleSnapshot): Finding[] {
    const findings: Finding[] = [];
    const owners: string[] = [];
    const abilityNames: string[] = [];
    for (let moduleIndex: number = 0; moduleIndex < snapshot.modules.length; moduleIndex++) {
      const moduleConfig: ModuleConfig = snapshot.modules[moduleIndex];
      for (let abilityIndex: number = 0; abilityIndex < moduleConfig.abilities.length; abilityIndex++) {
        const abilityName: string = moduleConfig.abilities[abilityIndex].name;
        const key: string = `${abilityName}`;
        const owner: string = `${moduleConfig.name}`;
        const position: number = abilityNames.indexOf(key);
        if (position >= 0) {
          if (owners[position] !== owner) {
            findings.push(FindingUtils.create('BUNDLE_ABILITY_NAME_COLLISION', Severity.ERROR,
              `modules[${moduleIndex}].abilities[${abilityIndex}].name`,
              `Ability name ${abilityName} is already declared by module ${owners[position]}`));
          }
        } else {
          abilityNames.push(key);
          owners.push(owner);
        }
      }
    }
    return findings;
  }

  /**
   * Validates every atomicService preload target.
   */
  public static validatePreloads(snapshot: BundleSnapshot): Finding[] {
    const findings: Finding[] = [];
    for (let moduleIndex: number = 0; moduleIndex < snapshot.modules.length; moduleIndex++) {
      const moduleConfig: ModuleConfig = snapshot.modules[moduleIndex];
      if (moduleConfig.atomicService === null) {
        continue;
      }
      const preloads = moduleConfig.atomicService.preloads;
      for (let preloadIndex: number = 0; preloadIndex < preloads.length; preloadIndex++) {
        const targetName: string = preloads[preloadIndex].moduleName;
        const prefix: string = `modules[${moduleIndex}].atomicService.preloads[${preloadIndex}].moduleName`;
        if (targetName === moduleConfig.name) {
          findings.push(FindingUtils.create('BUNDLE_PRELOAD_SELF_REFERENCE', Severity.ERROR, prefix,
            'A module must not preload itself'));
          continue;
        }
        const target: ModuleConfig | null = CrossModuleValidator.findModule(snapshot, targetName);
        if (target === null) {
          findings.push(FindingUtils.create('BUNDLE_PRELOAD_UNKNOWN_MODULE', Severity.ERROR, prefix,
            `Preloaded module ${targetName} is not declared`));
          continue;
        }
        if (target.type !== MODULE_TYPE_FEATURE) {
          findings.push(FindingUtils.create('BUNDLE_PRELOAD_NOT_FEATURE', Severity.ERROR, prefix,
            `Preloaded module ${targetName} is not a feature module`));
        }
      }
    }
    return findings;
  }

  /**
   * Detects preload dependency cycles between modules.
   */
  public static validatePreloadCycles(snapshot: BundleSnapshot): Finding[] {
    const findings: Finding[] = [];
    const states: string[] = [];
    for (let index: number = 0; index < snapshot.modules.length; index++) {
      states.push('unvisited');
    }
    for (let index: number = 0; index < snapshot.modules.length; index++) {
      if (states[index] === 'unvisited') {
        const stack: number[] = [];
        const cycleCode: string = CrossModuleValidator.visit(index, snapshot, states, stack);
        if (cycleCode.length > 0) {
          findings.push(FindingUtils.create('BUNDLE_PRELOAD_CYCLE', Severity.ERROR,
            `modules[${index}].atomicService.preloads`, 'Preload dependency cycle detected'));
        }
      }
    }
    return findings;
  }

  /**
   * Detects feature modules that are never preloaded by an entry module.
   */
  public static validateOrphanFeatures(snapshot: BundleSnapshot): Finding[] {
    const findings: Finding[] = [];
    const referenced: string[] = [];
    for (let moduleIndex: number = 0; moduleIndex < snapshot.modules.length; moduleIndex++) {
      const moduleConfig: ModuleConfig = snapshot.modules[moduleIndex];
      if (moduleConfig.atomicService === null) {
        continue;
      }
      for (let preloadIndex: number = 0; preloadIndex < moduleConfig.atomicService.preloads.length; preloadIndex++) {
        referenced.push(moduleConfig.atomicService.preloads[preloadIndex].moduleName);
      }
    }
    for (let moduleIndex: number = 0; moduleIndex < snapshot.modules.length; moduleIndex++) {
      const moduleConfig: ModuleConfig = snapshot.modules[moduleIndex];
      if (moduleConfig.type === MODULE_TYPE_FEATURE && referenced.indexOf(moduleConfig.name) < 0 &&
        CrossModuleValidator.countEntryModules(snapshot) > 0) {
        findings.push(FindingUtils.create('BUNDLE_ORPHAN_FEATURE_MODULE', Severity.WARN,
          `modules[${moduleIndex}].name`, `Feature module ${moduleConfig.name} is not referenced by any preload`));
      }
    }
    return findings;
  }

  /**
   * Returns all entry modules of the snapshot.
   */
  public static entryModules(snapshot: BundleSnapshot): ModuleConfig[] {
    const entries: ModuleConfig[] = [];
    for (let index: number = 0; index < snapshot.modules.length; index++) {
      if (snapshot.modules[index].type === MODULE_TYPE_ENTRY) {
        entries.push(snapshot.modules[index]);
      }
    }
    return entries;
  }

  /**
   * Returns all feature modules of the snapshot.
   */
  public static featureModules(snapshot: BundleSnapshot): ModuleConfig[] {
    const features: ModuleConfig[] = [];
    for (let index: number = 0; index < snapshot.modules.length; index++) {
      if (snapshot.modules[index].type === MODULE_TYPE_FEATURE) {
        features.push(snapshot.modules[index]);
      }
    }
    return features;
  }

  /**
   * Counts the entry modules of the snapshot.
   */
  public static countEntryModules(snapshot: BundleSnapshot): number {
    return CrossModuleValidator.entryModules(snapshot).length;
  }

  /**
   * Returns the module with the requested name, or null when missing.
   */
  public static findModule(snapshot: BundleSnapshot, moduleName: string): ModuleConfig | null {
    for (let index: number = 0; index < snapshot.modules.length; index++) {
      if (snapshot.modules[index].name === moduleName) {
        return snapshot.modules[index];
      }
    }
    return null;
  }

  /**
   * Returns the index of the module with the requested name, or -1.
   */
  public static indexOfModule(snapshot: BundleSnapshot, moduleName: string): number {
    for (let index: number = 0; index < snapshot.modules.length; index++) {
      if (snapshot.modules[index].name === moduleName) {
        return index;
      }
    }
    return -1;
  }

  /**
   * Collects every preload target name of the snapshot.
   */
  public static preloadTargets(snapshot: BundleSnapshot): string[] {
    const targets: string[] = [];
    for (let moduleIndex: number = 0; moduleIndex < snapshot.modules.length; moduleIndex++) {
      const moduleConfig: ModuleConfig = snapshot.modules[moduleIndex];
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
   * Visits one node of the preload graph and reports a cycle when found.
   */
  private static visit(index: number, snapshot: BundleSnapshot, states: string[], stack: number[]): string {
    if (states[index] === 'visiting') {
      return 'cycle';
    }
    if (states[index] === 'visited') {
      return '';
    }
    states[index] = 'visiting';
    stack.push(index);
    const moduleConfig: ModuleConfig = snapshot.modules[index];
    if (moduleConfig.atomicService !== null) {
      for (let preloadIndex: number = 0; preloadIndex < moduleConfig.atomicService.preloads.length; preloadIndex++) {
        const targetIndex: number =
          CrossModuleValidator.indexOfModule(snapshot, moduleConfig.atomicService.preloads[preloadIndex].moduleName);
        if (targetIndex >= 0) {
          const result: string = CrossModuleValidator.visit(targetIndex, snapshot, states, stack);
          if (result.length > 0) {
            return result;
          }
        }
      }
    }
    stack.pop();
    states[index] = 'visited';
    return '';
  }

  /**
   * Appends source findings into the destination list.
   */
  private static append(destination: Finding[], source: Finding[]): void {
    for (let index: number = 0; index < source.length; index++) {
      destination.push(source[index]);
    }
  }
}
