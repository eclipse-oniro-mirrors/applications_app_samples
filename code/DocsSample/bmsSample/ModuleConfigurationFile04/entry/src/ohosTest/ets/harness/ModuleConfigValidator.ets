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

import {
  HOME_ACTION,
  HOME_ENTITY,
  KNOWN_DEVICE_TYPES,
  KNOWN_LAUNCH_TYPES,
  KNOWN_MODULE_TYPES,
  KNOWN_ORIENTATIONS,
  MAX_ABILITIES,
  MAX_ABILITY_NAME_LENGTH,
  MAX_DEVICE_TYPES,
  MAX_MODULE_NAME_LENGTH,
  MAX_PRELOADS,
  MODULE_TYPE_ENTRY,
  MODULE_TYPE_FEATURE,
  SRC_ENTRY_PREFIX,
  SRC_ENTRY_SUFFIX
} from './ConfigConstants';
import type {
  AbilityConfig,
  AtomicServiceConfig,
  ExtensionAbilityConfig,
  ModuleConfig,
  SkillConfig,
  UriConfig
} from './ConfigModels';
import type { Finding } from './FindingTypes';
import { FindingUtils, Severity } from './FindingTypes';
import { NameUtils } from './NameUtils';
import { ResourceReference } from './ResourceReference';

/**
 * Validator for the module.json5 configuration content.
 */
export class ModuleConfigValidator {
  /**
   * Runs every module level validation rule.
   */
  public static validate(moduleConfig: ModuleConfig): Finding[] {
    const findings: Finding[] = [];
    ModuleConfigValidator.append(findings, ModuleConfigValidator.validateName(moduleConfig));
    ModuleConfigValidator.append(findings, ModuleConfigValidator.validateType(moduleConfig));
    ModuleConfigValidator.append(findings, ModuleConfigValidator.validateDescription(moduleConfig));
    ModuleConfigValidator.append(findings, ModuleConfigValidator.validateDeviceTypes(moduleConfig));
    ModuleConfigValidator.append(findings, ModuleConfigValidator.validateMainElement(moduleConfig));
    ModuleConfigValidator.append(findings, ModuleConfigValidator.validateInstallation(moduleConfig));
    ModuleConfigValidator.append(findings, ModuleConfigValidator.validatePages(moduleConfig));
    ModuleConfigValidator.append(findings, ModuleConfigValidator.validateAbilities(moduleConfig));
    ModuleConfigValidator.append(findings, ModuleConfigValidator.validateSkills(moduleConfig));
    ModuleConfigValidator.append(findings, ModuleConfigValidator.validateExtensionAbilities(moduleConfig));
    ModuleConfigValidator.append(findings, ModuleConfigValidator.validateAtomicService(moduleConfig));
    return findings;
  }

  /**
   * Validates the module name field.
   */
  public static validateName(moduleConfig: ModuleConfig): Finding[] {
    const findings: Finding[] = [];
    const value: string = moduleConfig.name;
    if (NameUtils.isBlank(value)) {
      findings.push(FindingUtils.create('MODULE_NAME_EMPTY', Severity.ERROR, 'module.name',
        'Module name must not be empty'));
      return findings;
    }
    const trimmed: string = value.trim();
    if (trimmed.length > MAX_MODULE_NAME_LENGTH) {
      findings.push(FindingUtils.create('MODULE_NAME_TOO_LONG', Severity.ERROR, 'module.name',
        'Module name exceeds the maximum length'));
    }
    if (NameUtils.hasUppercase(trimmed)) {
      findings.push(FindingUtils.create('MODULE_NAME_UPPERCASE', Severity.ERROR, 'module.name',
        'Module name must be lower case'));
    }
    if (NameUtils.hasWhitespace(trimmed)) {
      findings.push(FindingUtils.create('MODULE_NAME_WHITESPACE', Severity.ERROR, 'module.name',
        'Module name must not contain whitespace'));
    }
    if (!NameUtils.hasOnlyAllowedChars(trimmed, 'abcdefghijklmnopqrstuvwxyz0123456789_')) {
      findings.push(FindingUtils.create('MODULE_NAME_ILLEGAL_CHAR', Severity.ERROR, 'module.name',
        'Module name contains unsupported characters'));
    }
    if (NameUtils.startsWithDigit(trimmed)) {
      findings.push(FindingUtils.create('MODULE_NAME_LEADING_DIGIT', Severity.ERROR, 'module.name',
        'Module name must not start with a digit'));
    }
    if (NameUtils.startsWith(trimmed, '_') || NameUtils.endsWith(trimmed, '_')) {
      findings.push(FindingUtils.create('MODULE_NAME_EDGE_UNDERSCORE', Severity.ERROR, 'module.name',
        'Module name must not start or end with an underscore'));
    }
    if (NameUtils.isReservedModuleName(trimmed)) {
      findings.push(FindingUtils.create('MODULE_NAME_RESERVED', Severity.ERROR, 'module.name',
        'Module name is reserved by the system'));
    }
    return findings;
  }

  /**
   * Validates the module type field.
   */
  public static validateType(moduleConfig: ModuleConfig): Finding[] {
    const findings: Finding[] = [];
    const value: string = moduleConfig.type;
    if (NameUtils.isBlank(value)) {
      findings.push(FindingUtils.create('MODULE_TYPE_EMPTY', Severity.ERROR, 'module.type',
        'Module type must not be empty'));
      return findings;
    }
    if (KNOWN_MODULE_TYPES.indexOf(value.trim()) < 0) {
      findings.push(FindingUtils.create('MODULE_TYPE_UNKNOWN', Severity.ERROR, 'module.type',
        `Module type ${value} is not supported`));
    }
    return findings;
  }

  /**
   * Validates the module description reference.
   */
  public static validateDescription(moduleConfig: ModuleConfig): Finding[] {
    return ResourceReference.validate(moduleConfig.description, 'string', 'module.description');
  }

  /**
   * Validates the deviceTypes field.
   */
  public static validateDeviceTypes(moduleConfig: ModuleConfig): Finding[] {
    const findings: Finding[] = [];
    const values: string[] = moduleConfig.deviceTypes;
    if (values.length === 0) {
      findings.push(FindingUtils.create('MODULE_DEVICE_TYPES_EMPTY', Severity.ERROR, 'module.deviceTypes',
        'At least one device type must be declared'));
      return findings;
    }
    if (values.length > MAX_DEVICE_TYPES) {
      findings.push(FindingUtils.create('MODULE_DEVICE_TYPES_TOO_MANY', Severity.ERROR, 'module.deviceTypes',
        'Too many device types are declared'));
    }
    const seen: string[] = [];
    for (let index: number = 0; index < values.length; index++) {
      const current: string = values[index].trim();
      if (current.length === 0) {
        findings.push(FindingUtils.create('MODULE_DEVICE_TYPE_BLANK', Severity.ERROR, `module.deviceTypes[${index}]`,
          'Device type must not be blank'));
        continue;
      }
      if (KNOWN_DEVICE_TYPES.indexOf(current) < 0) {
        findings.push(FindingUtils.create('MODULE_DEVICE_TYPE_UNKNOWN', Severity.ERROR, `module.deviceTypes[${index}]`,
          `Device type ${current} is not supported`));
      }
      if (seen.indexOf(current) >= 0) {
        findings.push(FindingUtils.create('MODULE_DEVICE_TYPE_DUPLICATE', Severity.ERROR,
          `module.deviceTypes[${index}]`, `Device type ${current} is declared more than once`));
      } else {
        seen.push(current);
      }
    }
    return findings;
  }

  /**
   * Validates the mainElement field against the declared abilities.
   */
  public static validateMainElement(moduleConfig: ModuleConfig): Finding[] {
    const findings: Finding[] = [];
    const value: string = moduleConfig.mainElement;
    if (NameUtils.isBlank(value)) {
      findings.push(FindingUtils.create('MODULE_MAIN_ELEMENT_EMPTY', Severity.ERROR, 'module.mainElement',
        'Main element must not be empty'));
      return findings;
    }
    const trimmed: string = value.trim();
    if (trimmed.length > MAX_ABILITY_NAME_LENGTH) {
      findings.push(FindingUtils.create('MODULE_MAIN_ELEMENT_TOO_LONG', Severity.ERROR, 'module.mainElement',
        'Main element exceeds the maximum length'));
    }
    if (!NameUtils.isPascalCase(trimmed)) {
      findings.push(FindingUtils.create('MODULE_MAIN_ELEMENT_INVALID_NAME', Severity.ERROR, 'module.mainElement',
        'Main element must use PascalCase'));
    }
    const ability: AbilityConfig | null = ModuleConfigValidator.findAbility(moduleConfig, trimmed);
    if (ability === null) {
      findings.push(FindingUtils.create('MODULE_MAIN_ELEMENT_UNKNOWN_ABILITY', Severity.ERROR, 'module.mainElement',
        'Main element does not match a declared ability'));
      return findings;
    }
    if (!ability.exported) {
      findings.push(FindingUtils.create('MODULE_MAIN_ELEMENT_NOT_EXPORTED', Severity.ERROR, 'module.mainElement',
        'Main ability must be exported'));
    }
    if (!ModuleConfigValidator.skillHasEntity(ability, HOME_ENTITY)) {
      findings.push(FindingUtils.create('MODULE_MAIN_ELEMENT_NO_HOME_ENTITY', Severity.ERROR, 'module.mainElement',
        'Main ability must declare the home entity'));
    }
    if (!ModuleConfigValidator.skillHasAction(ability, HOME_ACTION)) {
      findings.push(FindingUtils.create('MODULE_MAIN_ELEMENT_NO_HOME_ACTION', Severity.ERROR, 'module.mainElement',
        'Main ability must declare the home action'));
    }
    return findings;
  }

  /**
   * Validates the installation related flags.
   */
  public static validateInstallation(moduleConfig: ModuleConfig): Finding[] {
    const findings: Finding[] = [];
    if (!moduleConfig.deliveryWithInstall && moduleConfig.installationFree) {
      findings.push(FindingUtils.create('MODULE_INSTALLATION_FLAGS_CONFLICT', Severity.ERROR,
        'module.installationFree', 'installationFree requires deliveryWithInstall'));
    }
    if (!moduleConfig.deliveryWithInstall && moduleConfig.type === MODULE_TYPE_ENTRY) {
      findings.push(FindingUtils.create('MODULE_ENTRY_NOT_DELIVERED', Severity.ERROR, 'module.deliveryWithInstall',
        'Entry module must be delivered with the installation'));
    }
    if (moduleConfig.type === MODULE_TYPE_ENTRY && moduleConfig.installationFree &&
      moduleConfig.atomicService === null) {
      findings.push(FindingUtils.create('MODULE_ENTRY_FREE_WITHOUT_ATOMIC', Severity.ERROR,
        'module.installationFree', 'Installation free entry module requires an atomicService block'));
    }
    return findings;
  }

  /**
   * Validates the pages profile reference.
   */
  public static validatePages(moduleConfig: ModuleConfig): Finding[] {
    const findings: Finding[] = [];
    const value: string = moduleConfig.pages;
    if (NameUtils.isBlank(value)) {
      findings.push(FindingUtils.create('MODULE_PAGES_EMPTY', Severity.ERROR, 'module.pages',
        'Pages profile must not be empty'));
      return findings;
    }
    const trimmed: string = value.trim();
    if (!NameUtils.startsWith(trimmed, '$profile:')) {
      findings.push(FindingUtils.create('MODULE_PAGES_NOT_PROFILE_REF', Severity.ERROR, 'module.pages',
        'Pages must reference a profile resource'));
      return findings;
    }
    const profileName: string = trimmed.substring('$profile:'.length);
    if (profileName.length === 0) {
      findings.push(FindingUtils.create('MODULE_PAGES_PROFILE_NAME_EMPTY', Severity.ERROR, 'module.pages',
        'Pages profile name must not be empty'));
    } else if (!NameUtils.isSegmentSafe(profileName)) {
      findings.push(FindingUtils.create('MODULE_PAGES_PROFILE_NAME_ILLEGAL', Severity.ERROR, 'module.pages',
        'Pages profile name contains unsupported characters'));
    }
    return findings;
  }

  /**
   * Validates the abilities array including duplicates and per ability rules.
   */
  public static validateAbilities(moduleConfig: ModuleConfig): Finding[] {
    const findings: Finding[] = [];
    const abilities: AbilityConfig[] = moduleConfig.abilities;
    if (abilities.length === 0) {
      findings.push(FindingUtils.create('MODULE_ABILITIES_EMPTY', Severity.ERROR, 'module.abilities',
        'At least one ability must be declared'));
      return findings;
    }
    if (abilities.length > MAX_ABILITIES) {
      findings.push(FindingUtils.create('MODULE_ABILITIES_TOO_MANY', Severity.ERROR, 'module.abilities',
        'Too many abilities are declared'));
    }
    const names: string[] = [];
    for (let index: number = 0; index < abilities.length; index++) {
      if (names.indexOf(abilities[index].name) >= 0) {
        findings.push(FindingUtils.create('MODULE_ABILITY_NAME_DUPLICATE', Severity.ERROR,
          `module.abilities[${index}].name`, 'Ability name is declared more than once'));
      } else {
        names.push(abilities[index].name);
      }
      ModuleConfigValidator.append(findings,
        ModuleConfigValidator.validateAbility(moduleConfig, abilities[index], index));
    }
    return findings;
  }

  /**
   * Validates one ability record.
   */
  public static validateAbility(moduleConfig: ModuleConfig, ability: AbilityConfig, index: number): Finding[] {
    const findings: Finding[] = [];
    const prefix: string = `module.abilities[${index}]`;
    ModuleConfigValidator.append(findings, ModuleConfigValidator.validateAbilityName(ability, prefix));
    ModuleConfigValidator.append(findings, ModuleConfigValidator.validateSrcEntry(ability, prefix));
    ModuleConfigValidator.append(findings,
      ResourceReference.validate(ability.description, 'string', `${prefix}.description`));
    ModuleConfigValidator.append(findings, ResourceReference.validate(ability.icon, 'media', `${prefix}.icon`));
    ModuleConfigValidator.append(findings, ResourceReference.validate(ability.label, 'string', `${prefix}.label`));
    ModuleConfigValidator.append(findings,
      ResourceReference.validate(ability.startWindowIcon, 'media', `${prefix}.startWindowIcon`));
    ModuleConfigValidator.append(findings,
      ResourceReference.validate(ability.startWindowBackground, 'color', `${prefix}.startWindowBackground`));
    if (ability.name === moduleConfig.mainElement && !ability.exported) {
      findings.push(FindingUtils.create('MODULE_MAIN_ABILITY_NOT_EXPORTED', Severity.ERROR, `${prefix}.exported`,
        'Main ability must be exported'));
    }
    if (NameUtils.isBlank(ability.launchType)) {
      findings.push(FindingUtils.create('MODULE_LAUNCH_TYPE_EMPTY', Severity.ERROR, `${prefix}.launchType`,
        'Launch type must not be empty'));
    } else if (KNOWN_LAUNCH_TYPES.indexOf(ability.launchType.trim()) < 0) {
      findings.push(FindingUtils.create('MODULE_LAUNCH_TYPE_UNKNOWN', Severity.ERROR, `${prefix}.launchType`,
        `Launch type ${ability.launchType} is not supported`));
    }
    if (NameUtils.isBlank(ability.orientation)) {
      findings.push(FindingUtils.create('MODULE_ORIENTATION_EMPTY', Severity.ERROR, `${prefix}.orientation`,
        'Orientation must not be empty'));
    } else if (KNOWN_ORIENTATIONS.indexOf(ability.orientation.trim()) < 0) {
      findings.push(FindingUtils.create('MODULE_ORIENTATION_UNKNOWN', Severity.ERROR, `${prefix}.orientation`,
        `Orientation ${ability.orientation} is not supported`));
    }
    return findings;
  }

  /**
   * Validates the ability name field.
   */
  public static validateAbilityName(ability: AbilityConfig, prefix: string): Finding[] {
    const findings: Finding[] = [];
    const value: string = ability.name;
    if (NameUtils.isBlank(value)) {
      findings.push(FindingUtils.create('MODULE_ABILITY_NAME_EMPTY', Severity.ERROR, `${prefix}.name`,
        'Ability name must not be empty'));
      return findings;
    }
    const trimmed: string = value.trim();
    if (trimmed.length > MAX_ABILITY_NAME_LENGTH) {
      findings.push(FindingUtils.create('MODULE_ABILITY_NAME_TOO_LONG', Severity.ERROR, `${prefix}.name`,
        'Ability name exceeds the maximum length'));
    }
    if (!NameUtils.isPascalCase(trimmed)) {
      findings.push(FindingUtils.create('MODULE_ABILITY_NAME_NOT_PASCAL', Severity.ERROR, `${prefix}.name`,
        'Ability name must use PascalCase'));
    }
    return findings;
  }

  /**
   * Validates the srcEntry path of an ability.
   */
  public static validateSrcEntry(ability: AbilityConfig, prefix: string): Finding[] {
    const findings: Finding[] = [];
    const value: string = ability.srcEntry;
    if (NameUtils.isBlank(value)) {
      findings.push(FindingUtils.create('MODULE_ABILITY_SRC_EMPTY', Severity.ERROR, `${prefix}.srcEntry`,
        'Ability source entry must not be empty'));
      return findings;
    }
    const trimmed: string = value.trim();
    if (NameUtils.hasWhitespace(trimmed)) {
      findings.push(FindingUtils.create('MODULE_ABILITY_SRC_WHITESPACE', Severity.ERROR, `${prefix}.srcEntry`,
        'Ability source entry must not contain whitespace'));
    }
    if (NameUtils.contains(trimmed, '..')) {
      findings.push(FindingUtils.create('MODULE_ABILITY_SRC_TRAVERSAL', Severity.ERROR, `${prefix}.srcEntry`,
        'Ability source entry must not contain parent directory traversal'));
    }
    if (NameUtils.contains(trimmed, '\\')) {
      findings.push(FindingUtils.create('MODULE_ABILITY_SRC_BACKSLASH', Severity.ERROR, `${prefix}.srcEntry`,
        'Ability source entry must use forward slashes'));
    }
    if (!NameUtils.startsWith(trimmed, SRC_ENTRY_PREFIX)) {
      findings.push(FindingUtils.create('MODULE_ABILITY_SRC_PREFIX', Severity.ERROR, `${prefix}.srcEntry`,
        'Ability source entry must start with ./ets/'));
    }
    if (!NameUtils.endsWith(trimmed, SRC_ENTRY_SUFFIX)) {
      findings.push(FindingUtils.create('MODULE_ABILITY_SRC_EXTENSION', Severity.ERROR, `${prefix}.srcEntry`,
        'Ability source entry must end with .ets'));
    }
    return findings;
  }

  /**
   * Validates the skills declared by every ability.
   */
  public static validateSkills(moduleConfig: ModuleConfig): Finding[] {
    const findings: Finding[] = [];
    for (let index: number = 0; index < moduleConfig.abilities.length; index++) {
      const ability: AbilityConfig = moduleConfig.abilities[index];
      const isMain: boolean = ability.name === moduleConfig.mainElement;
      if (isMain && ability.skills.length === 0) {
        findings.push(FindingUtils.create('MODULE_MAIN_ABILITY_SKILLS_MISSING', Severity.WARN,
          `module.abilities[${index}].skills`, 'Main ability should declare a home skill'));
      }
      const signatures: string[] = [];
      for (let skillIndex: number = 0; skillIndex < ability.skills.length; skillIndex++) {
        const skill: SkillConfig = ability.skills[skillIndex];
        const prefix: string = `module.abilities[${index}].skills[${skillIndex}]`;
        const signature: string = `${skill.entities.join('|')}#${skill.actions.join('|')}`;
        if (signatures.indexOf(signature) >= 0) {
          findings.push(FindingUtils.create('MODULE_SKILL_DUPLICATE', Severity.WARN, prefix,
            'Duplicate skill declaration'));
        } else {
          signatures.push(signature);
        }
        ModuleConfigValidator.append(findings, ModuleConfigValidator.validateSkill(skill, prefix));
      }
    }
    return findings;
  }

  /**
   * Validates one skill record including its uris.
   */
  public static validateSkill(skill: SkillConfig, prefix: string): Finding[] {
    const findings: Finding[] = [];
    if (skill.entities.length === 0) {
      findings.push(FindingUtils.create('MODULE_SKILL_ENTITY_EMPTY', Severity.ERROR, `${prefix}.entities`,
        'Skill must declare at least one entity'));
    }
    for (let index: number = 0; index < skill.entities.length; index++) {
      const entity: string = skill.entities[index].trim();
      if (entity.length === 0) {
        findings.push(FindingUtils.create('MODULE_SKILL_ENTITY_BLANK', Severity.ERROR, `${prefix}.entities[${index}]`,
          'Skill entity must not be blank'));
      } else if (!ModuleConfigValidator.isEntityName(entity)) {
        findings.push(FindingUtils.create('MODULE_SKILL_ENTITY_ILLEGAL', Severity.ERROR, `${prefix}.entities[${index}]`,
          `Skill entity ${entity} is not a valid entity name`));
      }
    }
    if (skill.actions.length === 0) {
      findings.push(FindingUtils.create('MODULE_SKILL_ACTION_EMPTY', Severity.ERROR, `${prefix}.actions`,
        'Skill must declare at least one action'));
    }
    for (let index: number = 0; index < skill.actions.length; index++) {
      const action: string = skill.actions[index].trim();
      if (action.length === 0) {
        findings.push(FindingUtils.create('MODULE_SKILL_ACTION_BLANK', Severity.ERROR, `${prefix}.actions[${index}]`,
          'Skill action must not be blank'));
      } else if (!ModuleConfigValidator.isActionName(action)) {
        findings.push(FindingUtils.create('MODULE_SKILL_ACTION_ILLEGAL', Severity.ERROR, `${prefix}.actions[${index}]`,
          `Skill action ${action} is not a valid action name`));
      }
    }
    for (let index: number = 0; index < skill.uris.length; index++) {
      ModuleConfigValidator.append(findings, ModuleConfigValidator.validateUri(skill.uris[index],
        `${prefix}.uris[${index}]`));
    }
    return findings;
  }

  /**
   * Validates one uri record declared inside a skill.
   */
  public static validateUri(uri: UriConfig, prefix: string): Finding[] {
    const findings: Finding[] = [];
    if (NameUtils.isBlank(uri.scheme)) {
      findings.push(FindingUtils.create('MODULE_SKILL_URI_SCHEME_EMPTY', Severity.ERROR, `${prefix}.scheme`,
        'Uri scheme must not be empty'));
    } else if (!NameUtils.isLowerSnake(uri.scheme.trim())) {
      findings.push(FindingUtils.create('MODULE_SKILL_URI_SCHEME_ILLEGAL', Severity.ERROR, `${prefix}.scheme`,
        'Uri scheme must use lower case characters'));
    }
    if (NameUtils.hasWhitespace(uri.host)) {
      findings.push(FindingUtils.create('MODULE_SKILL_URI_HOST_WHITESPACE', Severity.ERROR, `${prefix}.host`,
        'Uri host must not contain whitespace'));
    }
    if (uri.path.length > 0 && !NameUtils.startsWith(uri.path, '/')) {
      findings.push(FindingUtils.create('MODULE_SKILL_URI_PATH_PREFIX', Severity.ERROR, `${prefix}.path`,
        'Uri path must start with a slash'));
    }
    return findings;
  }

  /**
   * Validates the extensionAbilities array.
   */
  public static validateExtensionAbilities(moduleConfig: ModuleConfig): Finding[] {
    const findings: Finding[] = [];
    const extensions: ExtensionAbilityConfig[] = moduleConfig.extensionAbilities;
    const names: string[] = [];
    for (let index: number = 0; index < extensions.length; index++) {
      const extension: ExtensionAbilityConfig = extensions[index];
      const prefix: string = `module.extensionAbilities[${index}]`;
      if (NameUtils.isBlank(extension.name)) {
        findings.push(FindingUtils.create('MODULE_EXTENSION_NAME_EMPTY', Severity.ERROR, `${prefix}.name`,
          'Extension ability name must not be empty'));
      } else if (!NameUtils.isPascalCase(extension.name.trim())) {
        findings.push(FindingUtils.create('MODULE_EXTENSION_NAME_NOT_PASCAL', Severity.ERROR, `${prefix}.name`,
          'Extension ability name must use PascalCase'));
      }
      if (names.indexOf(extension.name) >= 0) {
        findings.push(FindingUtils.create('MODULE_EXTENSION_NAME_DUPLICATE', Severity.ERROR, `${prefix}.name`,
          'Extension ability name is declared more than once'));
      } else {
        names.push(extension.name);
      }
      if (NameUtils.isBlank(extension.type)) {
        findings.push(FindingUtils.create('MODULE_EXTENSION_TYPE_EMPTY', Severity.ERROR, `${prefix}.type`,
          'Extension ability type must not be empty'));
      } else if (!NameUtils.isLowerSnake(extension.type.trim())) {
        findings.push(FindingUtils.create('MODULE_EXTENSION_TYPE_ILLEGAL', Severity.ERROR, `${prefix}.type`,
          'Extension ability type must use lower case characters'));
      }
      if (NameUtils.isBlank(extension.srcEntry)) {
        findings.push(FindingUtils.create('MODULE_EXTENSION_SRC_EMPTY', Severity.ERROR, `${prefix}.srcEntry`,
          'Extension ability source entry must not be empty'));
      } else if (NameUtils.contains(extension.srcEntry, '..')) {
        findings.push(FindingUtils.create('MODULE_EXTENSION_SRC_TRAVERSAL', Severity.ERROR, `${prefix}.srcEntry`,
          'Extension ability source entry must not contain parent directory traversal'));
      }
    }
    return findings;
  }

  /**
   * Validates the atomicService block.
   */
  public static validateAtomicService(moduleConfig: ModuleConfig): Finding[] {
    const findings: Finding[] = [];
    const atomicService: AtomicServiceConfig | null = moduleConfig.atomicService;
    if (atomicService === null) {
      return findings;
    }
    if (moduleConfig.type !== MODULE_TYPE_ENTRY) {
      findings.push(FindingUtils.create('MODULE_ATOMIC_ON_NON_ENTRY', Severity.ERROR, 'module.atomicService',
        'atomicService is only supported by entry modules'));
      return findings;
    }
    if (atomicService.preloads.length === 0) {
      findings.push(FindingUtils.create('MODULE_ATOMIC_PRELOADS_EMPTY', Severity.WARN, 'module.atomicService.preloads',
        'atomicService preloads list is empty'));
      return findings;
    }
    if (atomicService.preloads.length > MAX_PRELOADS) {
      findings.push(FindingUtils.create('MODULE_ATOMIC_PRELOADS_TOO_MANY', Severity.ERROR,
        'module.atomicService.preloads', 'Too many preloaded modules are declared'));
    }
    const seen: string[] = [];
    for (let index: number = 0; index < atomicService.preloads.length; index++) {
      const moduleName: string = atomicService.preloads[index].moduleName;
      const prefix: string = `module.atomicService.preloads[${index}].moduleName`;
      if (NameUtils.isBlank(moduleName)) {
        findings.push(FindingUtils.create('MODULE_ATOMIC_PRELOAD_NAME_EMPTY', Severity.ERROR, prefix,
          'Preloaded module name must not be empty'));
        continue;
      }
      const trimmed: string = moduleName.trim();
      if (!NameUtils.isLowerSnake(trimmed)) {
        findings.push(FindingUtils.create('MODULE_ATOMIC_PRELOAD_NAME_ILLEGAL', Severity.ERROR, prefix,
          'Preloaded module name must use lower case characters'));
      }
      if (trimmed === moduleConfig.name) {
        findings.push(FindingUtils.create('MODULE_ATOMIC_PRELOAD_SELF', Severity.ERROR, prefix,
          'A module must not preload itself'));
      }
      if (seen.indexOf(trimmed) >= 0) {
        findings.push(FindingUtils.create('MODULE_ATOMIC_PRELOAD_DUPLICATE', Severity.ERROR, prefix,
          'Preloaded module is declared more than once'));
      } else {
        seen.push(trimmed);
      }
    }
    return findings;
  }

  /**
   * Returns the ability with the requested name, or null when missing.
   */
  public static findAbility(moduleConfig: ModuleConfig, abilityName: string): AbilityConfig | null {
    for (let index: number = 0; index < moduleConfig.abilities.length; index++) {
      if (moduleConfig.abilities[index].name === abilityName) {
        return moduleConfig.abilities[index];
      }
    }
    return null;
  }

  /**
   * Returns true when any skill of the ability declares the requested entity.
   */
  public static skillHasEntity(ability: AbilityConfig, entity: string): boolean {
    for (let skillIndex: number = 0; skillIndex < ability.skills.length; skillIndex++) {
      if (ability.skills[skillIndex].entities.indexOf(entity) >= 0) {
        return true;
      }
    }
    return false;
  }

  /**
   * Returns true when any skill of the ability declares the requested action.
   */
  public static skillHasAction(ability: AbilityConfig, action: string): boolean {
    for (let skillIndex: number = 0; skillIndex < ability.skills.length; skillIndex++) {
      if (ability.skills[skillIndex].actions.indexOf(action) >= 0) {
        return true;
      }
    }
    return false;
  }

  /**
   * Returns true when the value follows the entity name pattern.
   */
  public static isEntityName(value: string): boolean {
    const pattern: RegExp = new RegExp('^entity(\\.[a-z0-9_]+)+$');
    return pattern.test(value);
  }

  /**
   * Returns true when the value follows the action name pattern.
   */
  public static isActionName(value: string): boolean {
    const pattern: RegExp = new RegExp('^ohos\\.want\\.action(\\.[a-z0-9_]+)+$');
    return pattern.test(value);
  }

  /**
   * Returns true when the module declares the requested device type.
   */
  public static hasDeviceType(moduleConfig: ModuleConfig, deviceType: string): boolean {
    return moduleConfig.deviceTypes.indexOf(deviceType) >= 0;
  }

  /**
   * Returns true when the module declares an ability with the requested name.
   */
  public static hasAbility(moduleConfig: ModuleConfig, abilityName: string): boolean {
    return ModuleConfigValidator.findAbility(moduleConfig, abilityName) !== null;
  }

  /**
   * Returns the number of declared skills across all abilities.
   */
  public static countSkills(moduleConfig: ModuleConfig): number {
    let total: number = 0;
    for (let index: number = 0; index < moduleConfig.abilities.length; index++) {
      total = total + moduleConfig.abilities[index].skills.length;
    }
    return total;
  }

  /**
   * Returns the module whose type is feature, or null when missing.
   */
  public static firstFeatureModule(modules: ModuleConfig[]): ModuleConfig | null {
    for (let index: number = 0; index < modules.length; index++) {
      if (modules[index].type === MODULE_TYPE_FEATURE) {
        return modules[index];
      }
    }
    return null;
  }

  /**
   * Appends source findings into the destination list.
   */
  public static append(destination: Finding[], source: Finding[]): void {
    for (let index: number = 0; index < source.length; index++) {
      destination.push(source[index]);
    }
  }
}
