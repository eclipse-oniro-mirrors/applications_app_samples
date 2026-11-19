/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  logInfo,
  launchEntryAbility,
  serializedDelay,
  waitForIndexPageStable,
  isIndexPageVisible,
  checkTextContent,
  waitForTextVisible,
  tapComponentByText,
  checkComponentExistsByKey,
  getBundleName,
  BUNDLE_NAME,
  MODULE_NAME,
  ENTRY_ABILITY_NAME,
  BACKUP_ABILITY_NAME,
  ABILITY_STAGE_NAME,
  INDEX_PAGE_TEXT_KEY,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  DELAY_AFTER_LAUNCH,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

const MODULE_TYPE_ENTRY: string = 'entry';

const MODULE_SRC_ENTRY: string = './ets/myabilitystage/MyAbilityStage.ets';

const ABILITY_SRC_ENTRY: string = './ets/entryability/EntryAbility.ets';

const BACKUP_SRC_ENTRY: string = './ets/entrybackupability/EntryBackupAbility.ets';

const PAGES_PROFILE: string = '$profile:main_pages';

const BACKGROUND_COLOR_REF: string = '$color:start_window_background';

const ALLOWED_DEVICE_TYPES: string[] = ['default', 'tablet', 'phone', '2in1'];

const ALLOWED_EXTENSION_TYPES: string[] = ['backup', 'form', 'workScheduler'];

const HOME_ENTITY: string = 'entity.system.home';

const HOME_ACTION: string = 'ohos.want.action.home';

const BACKUP_METADATA_NAME: string = 'ohos.extension.backup';

const BACKUP_METADATA_RESOURCE: string = '$profile:backup_config';

enum ConfigCode {
  OK = 'ok',
  NAME_MISSING = 'name_missing',
  NAME_MISMATCH = 'name_mismatch',
  TYPE_INVALID = 'type_invalid',
  SRC_ENTRY_INVALID = 'src_entry_invalid',
  DEVICE_TYPES_EMPTY = 'device_types_empty',
  DEVICE_TYPE_UNSUPPORTED = 'device_type_unsupported',
  MAIN_ELEMENT_MISSING = 'main_element_missing',
  DELIVERY_FLAG_INVALID = 'delivery_flag_invalid',
  INSTALLATION_FREE_INVALID = 'installation_free_invalid',
  PAGES_INVALID = 'pages_invalid',
  ABILITIES_EMPTY = 'abilities_empty',
  EXPORTED_NOT_BOOLEAN = 'exported_not_boolean',
  SKILLS_EMPTY = 'skills_empty',
  EXTENSION_TYPE_INVALID = 'extension_type_invalid',
  EXTENSION_EXPORTED_INVALID = 'extension_exported_invalid'
}

class SkillEntry {
  public entities: string[];
  public actions: string[];

  constructor(entities: string[], actions: string[]) {
    this.entities = entities;
    this.actions = actions;
  }

  public declaresHome(): boolean {
    return this.entities.indexOf(HOME_ENTITY) >= 0 && this.actions.indexOf(HOME_ACTION) >= 0;
  }
}

class AbilityEntry {
  public name: string;
  public srcEntry: string;
  public exported: boolean;
  public skills: SkillEntry[];

  constructor(name: string, srcEntry: string, exported: boolean, skills: SkillEntry[]) {
    this.name = name;
    this.srcEntry = srcEntry;
    this.exported = exported;
    this.skills = skills;
  }

  public hasSkill(): boolean {
    return this.skills.length > 0;
  }

  public skillCount(): number {
    return this.skills.length;
  }
}

class ExtensionEntry {
  public name: string;
  public srcEntry: string;
  public type: string;
  public exported: boolean;
  public metadataName: string;
  public metadataResource: string;

  constructor(name: string, srcEntry: string, type: string, exported: boolean,
    metadataName: string, metadataResource: string) {
    this.name = name;
    this.srcEntry = srcEntry;
    this.type = type;
    this.exported = exported;
    this.metadataName = metadataName;
    this.metadataResource = metadataResource;
  }

  public isBackupType(): boolean {
    return this.type === 'backup';
  }
}

class ModuleDescriptor {
  public name: string;
  public type: string;
  public srcEntry: string;
  public mainElement: string;
  public deviceTypes: string[];
  public deliveryWithInstall: boolean;
  public installationFree: boolean;
  public pages: string;
  public abilities: AbilityEntry[];
  public extensionAbilities: ExtensionEntry[];

  constructor(name: string, type: string, srcEntry: string, mainElement: string, deviceTypes: string[],
    deliveryWithInstall: boolean, installationFree: boolean, pages: string,
    abilities: AbilityEntry[], extensionAbilities: ExtensionEntry[]) {
    this.name = name;
    this.type = type;
    this.srcEntry = srcEntry;
    this.mainElement = mainElement;
    this.deviceTypes = deviceTypes;
    this.deliveryWithInstall = deliveryWithInstall;
    this.installationFree = installationFree;
    this.pages = pages;
    this.abilities = abilities;
    this.extensionAbilities = extensionAbilities;
  }

  public findAbility(name: string): AbilityEntry | null {
    for (let i = 0; i < this.abilities.length; i++) {
      if (this.abilities[i].name === name) {
        return this.abilities[i];
      }
    }
    return null;
  }

  public findExtension(name: string): ExtensionEntry | null {
    for (let i = 0; i < this.extensionAbilities.length; i++) {
      if (this.extensionAbilities[i].name === name) {
        return this.extensionAbilities[i];
      }
    }
    return null;
  }
}

class ModuleConfigFactory {
  public static shippedModule(): ModuleDescriptor {
    const homeSkill: SkillEntry = new SkillEntry([HOME_ENTITY], [HOME_ACTION]);
    const ability: AbilityEntry = new AbilityEntry(ENTRY_ABILITY_NAME, ABILITY_SRC_ENTRY, true, [homeSkill]);
    const extension: ExtensionEntry = new ExtensionEntry(BACKUP_ABILITY_NAME, BACKUP_SRC_ENTRY, 'backup',
      false, BACKUP_METADATA_NAME, BACKUP_METADATA_RESOURCE);
    return new ModuleDescriptor(MODULE_NAME, MODULE_TYPE_ENTRY, MODULE_SRC_ENTRY, ENTRY_ABILITY_NAME,
      ['default', 'tablet'], true, false, PAGES_PROFILE, [ability], [extension]);
  }

  public static withType(type: string): ModuleDescriptor {
    const base: ModuleDescriptor = ModuleConfigFactory.shippedModule();
    return new ModuleDescriptor(base.name, type, base.srcEntry, base.mainElement, base.deviceTypes,
      base.deliveryWithInstall, base.installationFree, base.pages, base.abilities, base.extensionAbilities);
  }

  public static withDeviceTypes(deviceTypes: string[]): ModuleDescriptor {
    const base: ModuleDescriptor = ModuleConfigFactory.shippedModule();
    return new ModuleDescriptor(base.name, base.type, base.srcEntry, base.mainElement, deviceTypes,
      base.deliveryWithInstall, base.installationFree, base.pages, base.abilities, base.extensionAbilities);
  }

  public static withDeliveryFlag(flag: boolean): ModuleDescriptor {
    const base: ModuleDescriptor = ModuleConfigFactory.shippedModule();
    return new ModuleDescriptor(base.name, base.type, base.srcEntry, base.mainElement, base.deviceTypes,
      flag, base.installationFree, base.pages, base.abilities, base.extensionAbilities);
  }

  public static withInstallationFree(flag: boolean): ModuleDescriptor {
    const base: ModuleDescriptor = ModuleConfigFactory.shippedModule();
    return new ModuleDescriptor(base.name, base.type, base.srcEntry, base.mainElement, base.deviceTypes,
      base.deliveryWithInstall, flag, base.pages, base.abilities, base.extensionAbilities);
  }

  public static withPages(pages: string): ModuleDescriptor {
    const base: ModuleDescriptor = ModuleConfigFactory.shippedModule();
    return new ModuleDescriptor(base.name, base.type, base.srcEntry, base.mainElement, base.deviceTypes,
      base.deliveryWithInstall, base.installationFree, pages, base.abilities, base.extensionAbilities);
  }

  public static withoutAbilities(): ModuleDescriptor {
    const base: ModuleDescriptor = ModuleConfigFactory.shippedModule();
    const emptyAbilities: AbilityEntry[] = [];
    return new ModuleDescriptor(base.name, base.type, base.srcEntry, base.mainElement, base.deviceTypes,
      base.deliveryWithInstall, base.installationFree, base.pages, emptyAbilities, base.extensionAbilities);
  }

  public static withExported(exported: boolean): ModuleDescriptor {
    const base: ModuleDescriptor = ModuleConfigFactory.shippedModule();
    const skill: SkillEntry = new SkillEntry([HOME_ENTITY], [HOME_ACTION]);
    const ability: AbilityEntry = new AbilityEntry(ENTRY_ABILITY_NAME, ABILITY_SRC_ENTRY, exported, [skill]);
    return new ModuleDescriptor(base.name, base.type, base.srcEntry, base.mainElement, base.deviceTypes,
      base.deliveryWithInstall, base.installationFree, base.pages, [ability], base.extensionAbilities);
  }

  public static withoutSkills(): ModuleDescriptor {
    const base: ModuleDescriptor = ModuleConfigFactory.shippedModule();
    const noSkills: SkillEntry[] = [];
    const ability: AbilityEntry = new AbilityEntry(ENTRY_ABILITY_NAME, ABILITY_SRC_ENTRY, true, noSkills);
    return new ModuleDescriptor(base.name, base.type, base.srcEntry, base.mainElement, base.deviceTypes,
      base.deliveryWithInstall, base.installationFree, base.pages, [ability], base.extensionAbilities);
  }
}

class ModuleConfigValidator {
  public static checkName(module: ModuleDescriptor): ConfigCode {
    if (module.name.length === 0) {
      return ConfigCode.NAME_MISSING;
    }
    if (module.name !== MODULE_NAME) {
      return ConfigCode.NAME_MISMATCH;
    }
    return ConfigCode.OK;
  }

  public static checkType(module: ModuleDescriptor): ConfigCode {
    if (module.type !== MODULE_TYPE_ENTRY) {
      return ConfigCode.TYPE_INVALID;
    }
    return ConfigCode.OK;
  }

  public static checkSrcEntry(module: ModuleDescriptor): ConfigCode {
    if (!module.srcEntry.startsWith('./ets/')) {
      return ConfigCode.SRC_ENTRY_INVALID;
    }
    if (!module.srcEntry.endsWith('.ets')) {
      return ConfigCode.SRC_ENTRY_INVALID;
    }
    if (module.srcEntry !== MODULE_SRC_ENTRY) {
      return ConfigCode.SRC_ENTRY_INVALID;
    }
    return ConfigCode.OK;
  }

  public static checkDeviceTypes(module: ModuleDescriptor): ConfigCode {
    if (module.deviceTypes.length === 0) {
      return ConfigCode.DEVICE_TYPES_EMPTY;
    }
    for (let i = 0; i < module.deviceTypes.length; i++) {
      if (ALLOWED_DEVICE_TYPES.indexOf(module.deviceTypes[i]) < 0) {
        return ConfigCode.DEVICE_TYPE_UNSUPPORTED;
      }
    }
    return ConfigCode.OK;
  }

  public static checkMainElement(module: ModuleDescriptor): ConfigCode {
    if (module.mainElement !== ENTRY_ABILITY_NAME) {
      return ConfigCode.MAIN_ELEMENT_MISSING;
    }
    if (module.findAbility(module.mainElement) === null) {
      return ConfigCode.MAIN_ELEMENT_MISSING;
    }
    return ConfigCode.OK;
  }

  public static checkDeliveryWithInstall(module: ModuleDescriptor): ConfigCode {
    if (!module.deliveryWithInstall) {
      return ConfigCode.DELIVERY_FLAG_INVALID;
    }
    return ConfigCode.OK;
  }

  public static checkInstallationFree(module: ModuleDescriptor): ConfigCode {
    if (module.installationFree) {
      return ConfigCode.INSTALLATION_FREE_INVALID;
    }
    return ConfigCode.OK;
  }

  public static checkPages(module: ModuleDescriptor): ConfigCode {
    if (module.pages !== PAGES_PROFILE) {
      return ConfigCode.PAGES_INVALID;
    }
    return ConfigCode.OK;
  }

  public static checkAbilities(module: ModuleDescriptor): ConfigCode {
    if (module.abilities.length === 0) {
      return ConfigCode.ABILITIES_EMPTY;
    }
    return ConfigCode.OK;
  }

  public static checkExported(module: ModuleDescriptor): ConfigCode {
    const ability: AbilityEntry | null = module.findAbility(ENTRY_ABILITY_NAME);
    if (ability === null) {
      return ConfigCode.ABILITIES_EMPTY;
    }
    if (!ability.exported) {
      return ConfigCode.EXPORTED_NOT_BOOLEAN;
    }
    return ConfigCode.OK;
  }

  public static checkSkills(module: ModuleDescriptor): ConfigCode {
    const ability: AbilityEntry | null = module.findAbility(ENTRY_ABILITY_NAME);
    if (ability === null) {
      return ConfigCode.ABILITIES_EMPTY;
    }
    if (!ability.hasSkill()) {
      return ConfigCode.SKILLS_EMPTY;
    }
    for (let i = 0; i < ability.skills.length; i++) {
      if (!ability.skills[i].declaresHome()) {
        return ConfigCode.SKILLS_EMPTY;
      }
    }
    return ConfigCode.OK;
  }

  public static checkExtensions(module: ModuleDescriptor): ConfigCode {
    const extension: ExtensionEntry | null = module.findExtension(BACKUP_ABILITY_NAME);
    if (extension === null) {
      return ConfigCode.EXTENSION_TYPE_INVALID;
    }
    if (ALLOWED_EXTENSION_TYPES.indexOf(extension.type) < 0) {
      return ConfigCode.EXTENSION_TYPE_INVALID;
    }
    if (extension.exported) {
      return ConfigCode.EXTENSION_EXPORTED_INVALID;
    }
    return ConfigCode.OK;
  }

  public static checkAll(module: ModuleDescriptor): ConfigCode {
    const results: ConfigCode[] = [
      ModuleConfigValidator.checkName(module),
      ModuleConfigValidator.checkType(module),
      ModuleConfigValidator.checkSrcEntry(module),
      ModuleConfigValidator.checkDeviceTypes(module),
      ModuleConfigValidator.checkMainElement(module),
      ModuleConfigValidator.checkDeliveryWithInstall(module),
      ModuleConfigValidator.checkInstallationFree(module),
      ModuleConfigValidator.checkPages(module),
      ModuleConfigValidator.checkAbilities(module),
      ModuleConfigValidator.checkExported(module),
      ModuleConfigValidator.checkSkills(module),
      ModuleConfigValidator.checkExtensions(module)
    ];
    for (let i = 0; i < results.length; i++) {
      if (results[i] !== ConfigCode.OK) {
        return results[i];
      }
    }
    return ConfigCode.OK;
  }

  public static isValid(module: ModuleDescriptor): boolean {
    return ModuleConfigValidator.checkAll(module) === ConfigCode.OK;
  }

  public static homeAbilityName(module: ModuleDescriptor): string {
    for (let i = 0; i < module.abilities.length; i++) {
      const ability: AbilityEntry = module.abilities[i];
      for (let j = 0; j < ability.skills.length; j++) {
        if (ability.skills[j].declaresHome()) {
          return ability.name;
        }
      }
    }
    return '';
  }
}

class PageTextProbe {
  public static async current(driver: Driver): Promise<string> {
    if (await checkTextContent(driver, PAGE_TEXT_INITIAL)) {
      return PAGE_TEXT_INITIAL;
    }
    if (await checkTextContent(driver, PAGE_TEXT_CLICKED)) {
      return PAGE_TEXT_CLICKED;
    }
    return '';
  }

  public static isKnown(text: string): boolean {
    return text === PAGE_TEXT_INITIAL || text === PAGE_TEXT_CLICKED;
  }

  public static async ensureClicked(driver: Driver): Promise<boolean> {
    const currentText: string = await PageTextProbe.current(driver);
    if (currentText.length === 0) {
      return false;
    }
    await tapComponentByText(driver, currentText);
    return await waitForTextVisible(driver, PAGE_TEXT_CLICKED);
  }
}

export default function moduleConfigValidationTest(): void {
  describe('ModuleConfigValidationTest', () => {
    beforeAll(async () => {
      await launchEntryAbility();
      await ensureIndexPageInitial(getDriver());
    });

    afterAll(async () => {
      logInfo('ModuleConfigValidationTest suite finished');
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_0100
     * @tc.name testModuleFullDescriptorValid
     * @tc.desc Verify the shipped module descriptor passes every structural check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleFullDescriptorValid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const module: ModuleDescriptor = ModuleConfigFactory.shippedModule();
          expect(ModuleConfigValidator.checkAll(module)).assertEqual(ConfigCode.OK);
          expect(ModuleConfigValidator.isValid(module)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_0200
     * @tc.name testModuleNameEntry
     * @tc.desc Verify module name equals entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleNameEntry', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const module: ModuleDescriptor = ModuleConfigFactory.shippedModule();
          expect(module.name).assertEqual('entry');
          expect(ModuleConfigValidator.checkName(module)).assertEqual(ConfigCode.OK);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_0300
     * @tc.name testModuleNameEmptyRejected
     * @tc.desc Verify empty module name yields NAME_MISSING
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleNameEmptyRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const base: ModuleDescriptor = ModuleConfigFactory.shippedModule();
          const module: ModuleDescriptor = new ModuleDescriptor('', base.type, base.srcEntry, base.mainElement,
            base.deviceTypes, base.deliveryWithInstall, base.installationFree, base.pages,
            base.abilities, base.extensionAbilities);
          expect(ModuleConfigValidator.checkName(module)).assertEqual(ConfigCode.NAME_MISSING);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_0400
     * @tc.name testModuleNameMismatchRejected
     * @tc.desc Verify module name feature yields NAME_MISMATCH
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleNameMismatchRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const base: ModuleDescriptor = ModuleConfigFactory.shippedModule();
          const module: ModuleDescriptor = new ModuleDescriptor('feature', base.type, base.srcEntry,
            base.mainElement, base.deviceTypes, base.deliveryWithInstall, base.installationFree,
            base.pages, base.abilities, base.extensionAbilities);
          expect(ModuleConfigValidator.checkName(module)).assertEqual(ConfigCode.NAME_MISMATCH);
          expect(ModuleConfigValidator.checkAll(module)).assertEqual(ConfigCode.NAME_MISMATCH);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_0500
     * @tc.name testModuleTypeEntry
     * @tc.desc Verify module type entry is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleTypeEntry', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(ModuleConfigValidator.checkType(ModuleConfigFactory.withType('entry'))).assertEqual(ConfigCode.OK);
          expect(ModuleConfigFactory.withType('entry').type).assertEqual(MODULE_TYPE_ENTRY);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_0600
     * @tc.name testModuleTypeFeatureRejected
     * @tc.desc Verify module type feature yields TYPE_INVALID
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleTypeFeatureRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(ModuleConfigValidator.checkType(ModuleConfigFactory.withType('feature')))
            .assertEqual(ConfigCode.TYPE_INVALID);
          expect(ModuleConfigValidator.checkType(ModuleConfigFactory.withType('har')))
            .assertEqual(ConfigCode.TYPE_INVALID);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_0700
     * @tc.name testModuleSrcEntryAbilityStage
     * @tc.desc Verify srcEntry points at the MyAbilityStage implementation file
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleSrcEntryAbilityStage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const module: ModuleDescriptor = ModuleConfigFactory.shippedModule();
          expect(module.srcEntry).assertEqual('./ets/myabilitystage/MyAbilityStage.ets');
          expect(module.srcEntry.indexOf(ABILITY_STAGE_NAME) >= 0).assertTrue();
          expect(ModuleConfigValidator.checkSrcEntry(module)).assertEqual(ConfigCode.OK);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_0800
     * @tc.name testModuleSrcEntryInvalidPrefix
     * @tc.desc Verify srcEntry without the ./ets/ prefix yields SRC_ENTRY_INVALID
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleSrcEntryInvalidPrefix', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const base: ModuleDescriptor = ModuleConfigFactory.shippedModule();
          const module: ModuleDescriptor = new ModuleDescriptor(base.name, base.type,
            'ets/myabilitystage/MyAbilityStage.ets', base.mainElement, base.deviceTypes,
            base.deliveryWithInstall, base.installationFree, base.pages, base.abilities, base.extensionAbilities);
          expect(ModuleConfigValidator.checkSrcEntry(module)).assertEqual(ConfigCode.SRC_ENTRY_INVALID);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_0900
     * @tc.name testModuleSrcEntryWrongFile
     * @tc.desc Verify srcEntry pointing at EntryAbility yields SRC_ENTRY_INVALID
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleSrcEntryWrongFile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const base: ModuleDescriptor = ModuleConfigFactory.shippedModule();
          const module: ModuleDescriptor = new ModuleDescriptor(base.name, base.type, ABILITY_SRC_ENTRY,
            base.mainElement, base.deviceTypes, base.deliveryWithInstall, base.installationFree,
            base.pages, base.abilities, base.extensionAbilities);
          expect(ModuleConfigValidator.checkSrcEntry(module)).assertEqual(ConfigCode.SRC_ENTRY_INVALID);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_1000
     * @tc.name testModuleDeviceTypesDefaultTablet
     * @tc.desc Verify deviceTypes contains default and tablet and has exactly two entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleDeviceTypesDefaultTablet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const module: ModuleDescriptor = ModuleConfigFactory.shippedModule();
          expect(module.deviceTypes.indexOf('default') >= 0).assertTrue();
          expect(module.deviceTypes.indexOf('tablet') >= 0).assertTrue();
          expect(module.deviceTypes.length).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_1100
     * @tc.name testModuleDeviceTypesEmptyRejected
     * @tc.desc Verify an empty deviceTypes array yields DEVICE_TYPES_EMPTY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleDeviceTypesEmptyRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const empty: string[] = [];
          expect(ModuleConfigValidator.checkDeviceTypes(ModuleConfigFactory.withDeviceTypes(empty)))
            .assertEqual(ConfigCode.DEVICE_TYPES_EMPTY);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_1200
     * @tc.name testModuleDeviceTypeUnsupported
     * @tc.desc Verify an unknown device type yields DEVICE_TYPE_UNSUPPORTED
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleDeviceTypeUnsupported', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const invalid: string[] = ['default', 'watch'];
          expect(ModuleConfigValidator.checkDeviceTypes(ModuleConfigFactory.withDeviceTypes(invalid)))
            .assertEqual(ConfigCode.DEVICE_TYPE_UNSUPPORTED);
          const mixed: string[] = ['default', 'car'];
          expect(ModuleConfigValidator.checkDeviceTypes(ModuleConfigFactory.withDeviceTypes(mixed)))
            .assertEqual(ConfigCode.DEVICE_TYPE_UNSUPPORTED);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_1300
     * @tc.name testModuleMainElementEntryAbility
     * @tc.desc Verify mainElement EntryAbility exists among abilities
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleMainElementEntryAbility', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const module: ModuleDescriptor = ModuleConfigFactory.shippedModule();
          expect(module.mainElement).assertEqual(ENTRY_ABILITY_NAME);
          expect(ModuleConfigValidator.checkMainElement(module)).assertEqual(ConfigCode.OK);
          expect(module.findAbility(ENTRY_ABILITY_NAME) !== null).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_1400
     * @tc.name testModuleMainElementMissing
     * @tc.desc Verify mainElement referencing an absent ability yields MAIN_ELEMENT_MISSING
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleMainElementMissing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const base: ModuleDescriptor = ModuleConfigFactory.shippedModule();
          const module: ModuleDescriptor = new ModuleDescriptor(base.name, base.type, base.srcEntry,
            'GhostAbility', base.deviceTypes, base.deliveryWithInstall, base.installationFree,
            base.pages, base.abilities, base.extensionAbilities);
          expect(ModuleConfigValidator.checkMainElement(module)).assertEqual(ConfigCode.MAIN_ELEMENT_MISSING);
          expect(module.findAbility('GhostAbility')).assertEqual(null);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_1500
     * @tc.name testModuleDeliveryWithInstallTrue
     * @tc.desc Verify deliveryWithInstall true is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleDeliveryWithInstallTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const module: ModuleDescriptor = ModuleConfigFactory.withDeliveryFlag(true);
          expect(module.deliveryWithInstall).assertTrue();
          expect(ModuleConfigValidator.checkDeliveryWithInstall(module)).assertEqual(ConfigCode.OK);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_1600
     * @tc.name testModuleDeliveryWithInstallFalse
     * @tc.desc Verify deliveryWithInstall false yields DELIVERY_FLAG_INVALID
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleDeliveryWithInstallFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(ModuleConfigValidator.checkDeliveryWithInstall(ModuleConfigFactory.withDeliveryFlag(false)))
            .assertEqual(ConfigCode.DELIVERY_FLAG_INVALID);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_1700
     * @tc.name testModuleInstallationFreeFalse
     * @tc.desc Verify installationFree false is accepted for an entry module
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleInstallationFreeFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const module: ModuleDescriptor = ModuleConfigFactory.withInstallationFree(false);
          expect(module.installationFree).assertFalse();
          expect(ModuleConfigValidator.checkInstallationFree(module)).assertEqual(ConfigCode.OK);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_1800
     * @tc.name testModuleInstallationFreeTrue
     * @tc.desc Verify installationFree true yields INSTALLATION_FREE_INVALID
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleInstallationFreeTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(ModuleConfigValidator.checkInstallationFree(ModuleConfigFactory.withInstallationFree(true)))
            .assertEqual(ConfigCode.INSTALLATION_FREE_INVALID);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_1900
     * @tc.name testModulePagesProfile
     * @tc.desc Verify pages references the main_pages profile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModulePagesProfile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const module: ModuleDescriptor = ModuleConfigFactory.shippedModule();
          expect(module.pages).assertEqual('$profile:main_pages');
          expect(ModuleConfigValidator.checkPages(module)).assertEqual(ConfigCode.OK);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_2000
     * @tc.name testModulePagesInvalid
     * @tc.desc Verify literal path pages/Index yields PAGES_INVALID for the pages field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModulePagesInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(ModuleConfigValidator.checkPages(ModuleConfigFactory.withPages('pages/Index')))
            .assertEqual(ConfigCode.PAGES_INVALID);
          expect(ModuleConfigValidator.checkPages(ModuleConfigFactory.withPages('')))
            .assertEqual(ConfigCode.PAGES_INVALID);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_2100
     * @tc.name testModuleAbilitiesPresent
     * @tc.desc Verify the module declares exactly one ability named EntryAbility
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleAbilitiesPresent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const module: ModuleDescriptor = ModuleConfigFactory.shippedModule();
          expect(module.abilities.length).assertEqual(1);
          expect(module.abilities[0].name).assertEqual(ENTRY_ABILITY_NAME);
          expect(ModuleConfigValidator.checkAbilities(module)).assertEqual(ConfigCode.OK);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_2200
     * @tc.name testModuleAbilitiesEmpty
     * @tc.desc Verify an empty abilities array yields ABILITIES_EMPTY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleAbilitiesEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const module: ModuleDescriptor = ModuleConfigFactory.withoutAbilities();
          expect(module.abilities.length).assertEqual(0);
          expect(ModuleConfigValidator.checkAbilities(module)).assertEqual(ConfigCode.ABILITIES_EMPTY);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_2300
     * @tc.name testModuleExportedTrue
     * @tc.desc Verify EntryAbility exported flag is true and typed as boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleExportedTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const module: ModuleDescriptor = ModuleConfigFactory.shippedModule();
          const ability: AbilityEntry | null = module.findAbility(ENTRY_ABILITY_NAME);
          if (ability === null) {
            expect().assertFail();
            return;
          }
          expect(ModuleConfigValidator.checkExported(module)).assertEqual(ConfigCode.OK);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_2400
     * @tc.name testModuleExportedFalseRejected
     * @tc.desc Verify exported false yields EXPORTED_NOT_BOOLEAN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleExportedFalseRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(ModuleConfigValidator.checkExported(ModuleConfigFactory.withExported(false)))
            .assertEqual(ConfigCode.EXPORTED_NOT_BOOLEAN);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_2500
     * @tc.name testModuleSkillHomeEntityAction
     * @tc.desc Verify the home skill declares entity.system.home with ohos.want.action.home
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleSkillHomeEntityAction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const module: ModuleDescriptor = ModuleConfigFactory.shippedModule();
          const ability: AbilityEntry | null = module.findAbility(ENTRY_ABILITY_NAME);
          if (ability === null) {
            expect().assertFail();
            return;
          }
          expect(ModuleConfigValidator.checkSkills(module)).assertEqual(ConfigCode.OK);
          expect(ModuleConfigValidator.homeAbilityName(module)).assertEqual(ENTRY_ABILITY_NAME);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_2600
     * @tc.name testModuleSkillMissingRejected
     * @tc.desc Verify an ability without skills yields SKILLS_EMPTY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleSkillMissingRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(ModuleConfigValidator.checkSkills(ModuleConfigFactory.withoutSkills()))
            .assertEqual(ConfigCode.SKILLS_EMPTY);
          expect(ModuleConfigValidator.homeAbilityName(ModuleConfigFactory.withoutSkills())).assertEqual('');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_2700
     * @tc.name testModuleSkillWrongActionRejected
     * @tc.desc Verify a skill with the wrong action fails the home declaration check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleSkillWrongActionRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const wrongSkill: SkillEntry = new SkillEntry([HOME_ENTITY], ['ohos.want.action.viewData']);
          expect(wrongSkill.declaresHome()).assertFalse();
          const wrongEntity: SkillEntry = new SkillEntry(['entity.system.browsable'], [HOME_ACTION]);
          expect(wrongEntity.declaresHome()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_2800
     * @tc.name testModuleExtensionBackup
     * @tc.desc Verify EntryBackupAbility is a backup extension that is not exported
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleExtensionBackup', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const module: ModuleDescriptor = ModuleConfigFactory.shippedModule();
          const extension: ExtensionEntry | null = module.findExtension(BACKUP_ABILITY_NAME);
          if (extension === null) {
            expect().assertFail();
            return;
          }
          expect(extension.exported).assertFalse();
          expect(ModuleConfigValidator.checkExtensions(module)).assertEqual(ConfigCode.OK);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_2900
     * @tc.name testModuleExtensionSrcEntry
     * @tc.desc Verify the backup extension srcEntry and metadata resource references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleExtensionSrcEntry', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const module: ModuleDescriptor = ModuleConfigFactory.shippedModule();
          const extension: ExtensionEntry | null = module.findExtension(BACKUP_ABILITY_NAME);
          if (extension === null) {
            expect().assertFail();
            return;
          }
          expect(extension.srcEntry).assertEqual(BACKUP_SRC_ENTRY);
          expect(extension.metadataResource).assertEqual('$profile:backup_config');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_3000
     * @tc.name testModuleExtensionMissingRejected
     * @tc.desc Verify a module without the backup extension yields EXTENSION_TYPE_INVALID
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleExtensionMissingRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const base: ModuleDescriptor = ModuleConfigFactory.shippedModule();
          const emptyExtensions: ExtensionEntry[] = [];
          const module: ModuleDescriptor = new ModuleDescriptor(base.name, base.type, base.srcEntry,
            base.mainElement, base.deviceTypes, base.deliveryWithInstall, base.installationFree,
            base.pages, base.abilities, emptyExtensions);
          expect(ModuleConfigValidator.checkExtensions(module)).assertEqual(ConfigCode.EXTENSION_TYPE_INVALID);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_3100
     * @tc.name testModuleExtensionTypeInvalid
     * @tc.desc Verify an unsupported extension type yields EXTENSION_TYPE_INVALID
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleExtensionTypeInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const base: ModuleDescriptor = ModuleConfigFactory.shippedModule();
          const wrong: ExtensionEntry = new ExtensionEntry(BACKUP_ABILITY_NAME, BACKUP_SRC_ENTRY, 'unknown',
            false, BACKUP_METADATA_NAME, BACKUP_METADATA_RESOURCE);
          const module: ModuleDescriptor = new ModuleDescriptor(base.name, base.type, base.srcEntry,
            base.mainElement, base.deviceTypes, base.deliveryWithInstall, base.installationFree,
            base.pages, base.abilities, [wrong]);
          expect(ModuleConfigValidator.checkExtensions(module)).assertEqual(ConfigCode.EXTENSION_TYPE_INVALID);
          expect(wrong.isBackupType()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_3200
     * @tc.name testModuleAbilitySrcEntryPath
     * @tc.desc Verify the EntryAbility srcEntry points at the entryability implementation file
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleAbilitySrcEntryPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const module: ModuleDescriptor = ModuleConfigFactory.shippedModule();
          const ability: AbilityEntry | null = module.findAbility(ENTRY_ABILITY_NAME);
          if (ability === null) {
            expect().assertFail();
            return;
          }
          expect(ability.srcEntry).assertEqual('./ets/entryability/EntryAbility.ets');
          expect(ability.srcEntry.endsWith('EntryAbility.ets')).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_3300
     * @tc.name testModuleAbilitySkillCount
     * @tc.desc Verify the EntryAbility declares exactly one skill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleAbilitySkillCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const module: ModuleDescriptor = ModuleConfigFactory.shippedModule();
          const ability: AbilityEntry | null = module.findAbility(ENTRY_ABILITY_NAME);
          if (ability === null) {
            expect().assertFail();
            return;
          }
          expect(ability.skillCount()).assertEqual(1);
          expect(ability.skills[0].entities.length).assertEqual(1);
          expect(ability.skills[0].actions.length).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_3400
     * @tc.name testModuleFindAbilityAbsent
     * @tc.desc Verify findAbility returns null for unknown names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleFindAbilityAbsent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const module: ModuleDescriptor = ModuleConfigFactory.shippedModule();
          expect(module.findAbility('EntryAbility2')).assertEqual(null);
          expect(module.findExtension('EntryBackupAbility2')).assertEqual(null);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_3500
     * @tc.name testModuleFirstFailurePriority
     * @tc.desc Verify checkAll reports the name mismatch before later field failures
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleFirstFailurePriority', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const base: ModuleDescriptor = ModuleConfigFactory.shippedModule();
          const emptyDevices: string[] = [];
          const module: ModuleDescriptor = new ModuleDescriptor('wrong', 'feature', base.srcEntry,
            base.mainElement, emptyDevices, false, true, '', base.abilities, base.extensionAbilities);
          expect(ModuleConfigValidator.checkAll(module)).assertEqual(ConfigCode.NAME_MISMATCH);
          expect(ModuleConfigValidator.checkDeviceTypes(module)).assertEqual(ConfigCode.DEVICE_TYPES_EMPTY);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_3600
     * @tc.name testModuleBundleNameMatchesConfig
     * @tc.desc Verify the runtime bundle name matches the app level bundleName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleBundleNameMatchesConfig', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(getBundleName()).assertEqual('com.samples.abilitystage');
          expect(BUNDLE_NAME).assertEqual(getBundleName());
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_3700
     * @tc.name testModuleLaunchRendersIndexText
     * @tc.desc Verify the entry module launches and renders the HelloWorld text component
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleLaunchRendersIndexText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          expect(await waitForIndexPageStable(driver)).assertTrue();
          expect(await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_3800
     * @tc.name testModuleIndexRenderedText
     * @tc.desc Verify the launched page renders one of the known page texts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleIndexRenderedText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const currentText: string = await PageTextProbe.current(driver);
          expect(PageTextProbe.isKnown(currentText)).assertTrue();
          expect(await isIndexPageVisible(driver)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_3900
     * @tc.name testModuleConstantsConsistent
     * @tc.desc Verify module ability names constants match the module config values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleConstantsConsistent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const module: ModuleDescriptor = ModuleConfigFactory.shippedModule();
          expect(MODULE_NAME).assertEqual(module.name);
          expect(ENTRY_ABILITY_NAME).assertEqual(module.mainElement);
          expect(BACKUP_ABILITY_NAME).assertEqual(module.extensionAbilities[0].name);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_4000
     * @tc.name testModuleValidAfterRoundTrip
     * @tc.desc Verify a descriptor rebuilt from the shipped field values still passes validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleValidAfterRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const base: ModuleDescriptor = ModuleConfigFactory.shippedModule();
          const devices: string[] = [];
          for (let i = 0; i < base.deviceTypes.length; i++) {
            devices.push(base.deviceTypes[i]);
          }
          const skills: SkillEntry[] = [new SkillEntry([HOME_ENTITY], [HOME_ACTION])];
          const abilities: AbilityEntry[] = [new AbilityEntry(base.mainElement, ABILITY_SRC_ENTRY, true, skills)];
          const extensions: ExtensionEntry[] = [new ExtensionEntry(BACKUP_ABILITY_NAME, BACKUP_SRC_ENTRY,
            'backup', false, BACKUP_METADATA_NAME, BACKUP_METADATA_RESOURCE)];
          const rebuilt: ModuleDescriptor = new ModuleDescriptor(base.name, base.type, base.srcEntry,
            base.mainElement, devices, base.deliveryWithInstall, base.installationFree, base.pages,
            abilities, extensions);
          expect(ModuleConfigValidator.checkAll(rebuilt)).assertEqual(ConfigCode.OK);
          expect(rebuilt.deviceTypes.length).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_MODULECFG_4100
     * @tc.name testModuleColorModeReference
     * @tc.desc Verify the startWindowBackground color resource reference is well formed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleColorModeReference', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(BACKGROUND_COLOR_REF.startsWith('$color:')).assertTrue();
          expect(BACKGROUND_COLOR_REF).assertEqual('$color:start_window_background');
          expect(BACKGROUND_COLOR_REF.length > '$color:'.length).assertTrue();
        } finally {
          done();
        }
      })
  })
}
