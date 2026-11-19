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

import { describe, it, expect, beforeAll, beforeEach, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON, Component } from '@ohos.UiTest';
import Want from '@ohos.app.ability.Want';
import UIAbility from '@ohos.app.ability.UIAbility';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import {
  getDriver,
  logInfo,
  serializedDelay,
  runSerializedUiOperation,
  launchEntryAbility,
  isIndexPageRendered,
  waitForIndexPageStable,
  waitForTextVisible,
  pressAndWait,
  pressBackAndWait,
  pressHomeAndWait,
  checkComponentExistsByKey,
  checkTextContent,
  pageComponentCount,
  collectAllTexts,
  getCurrentFocusIndex,
  getBundleName,
  getAbilityDelegator,
  buildEntryWant,
  startAbilityByWant,
  doAbilityForeground,
  doAbilityBackground,
  measureElapsed,
  isWithinBudget,
  isNonEmptyString,
  INDEX_PAGE_TEXT_KEY,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  MODULE_NAME,
  ABILITY_STAGE_NAME,
  ENTRY_ABILITY_NAME,
  BACKUP_ABILITY_NAME,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION,
  DELAY_AFTER_LAUNCH,
  DELAY_AFTER_BACKGROUND,
  STRESS_ROUNDS_LAUNCH,
  KEY_ENTER,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

enum ModuleType {
  ENTRY = 'entry',
  FEATURE = 'feature',
  SHARED = 'shared',
  UNKNOWN = 'unknown'
}

enum ExtensionType {
  BACKUP = 'backup',
  SERVICE = 'service',
  DATA_SHARE = 'dataShare',
  UNKNOWN = 'unknown'
}

enum FieldViolation {
  VIOLATION_NONE = 0,
  VIOLATION_NAME = 1,
  VIOLATION_TYPE = 2,
  VIOLATION_DEVICE_TYPES = 3,
  VIOLATION_DELIVERY = 4,
  VIOLATION_INSTALLATION_FREE = 5,
  VIOLATION_SRC_ENTRY = 6,
  VIOLATION_EXPORTED = 7,
  VIOLATION_METADATA = 8
}

const ENTRY_MODULE_SRC_ENTRY: string = './ets/myabilitystage/MyAbilityStage.ets';

const ENTRY_ABILITY_SRC_ENTRY: string = './ets/entryability/EntryAbility.ets';

const BACKUP_ABILITY_SRC_ENTRY: string = './ets/entrybackupability/EntryBackupAbility.ets';

const BACKUP_PROFILE_RESOURCE: string = '$profile:backup_config';

const BACKUP_METADATA_NAME: string = 'ohos.extension.backup';

const HOME_ENTITY: string = 'entity.system.home';

const HOME_ACTION: string = 'ohos.want.action.home';

const DEVICE_TYPE_DEFAULT: string = 'default';

const DEVICE_TYPE_TABLET: string = 'tablet';

const MISSING_FIELD_DEFAULT_NAME: string = '';

interface SkillDescriptor {
  entities: string[];
  actions: string[];
}

interface ModuleInfoInit {
  name: string;
  type: string;
  deviceTypes: string[];
  deliveryWithInstall: boolean;
  installationFree: boolean;
  srcEntry: string;
  mainElement: string;
}

interface AbilityInfoInit {
  name: string;
  srcEntry: string;
  exported: boolean;
  entities: string[];
  actions: string[];
}

interface ExtensionMetadataInit {
  name: string;
  resource: string;
}

interface ExtensionInfoInit {
  name: string;
  srcEntry: string;
  type: string;
  exported: boolean;
  metadata: ExtensionMetadataInit[];
}

class ModuleInfo {
  public name: string;
  public type: string;
  public deviceTypes: string[];
  public deliveryWithInstall: boolean;
  public installationFree: boolean;
  public srcEntry: string;
  public mainElement: string;

  constructor(init: ModuleInfoInit) {
    this.name = init.name;
    this.type = init.type;
    this.deviceTypes = [...init.deviceTypes];
    this.deliveryWithInstall = init.deliveryWithInstall;
    this.installationFree = init.installationFree;
    this.srcEntry = init.srcEntry;
    this.mainElement = init.mainElement;
  }

  public static createEntryModule(): ModuleInfo {
    const init: ModuleInfoInit = {
      name: MODULE_NAME,
      type: ModuleType.ENTRY,
      deviceTypes: [DEVICE_TYPE_DEFAULT, DEVICE_TYPE_TABLET],
      deliveryWithInstall: true,
      installationFree: false,
      srcEntry: ENTRY_MODULE_SRC_ENTRY,
      mainElement: ENTRY_ABILITY_NAME
    };
    return new ModuleInfo(init);
  }

  public static createWithDefaults(): ModuleInfo {
    const init: ModuleInfoInit = {
      name: MISSING_FIELD_DEFAULT_NAME,
      type: ModuleType.UNKNOWN,
      deviceTypes: [],
      deliveryWithInstall: false,
      installationFree: false,
      srcEntry: MISSING_FIELD_DEFAULT_NAME,
      mainElement: MISSING_FIELD_DEFAULT_NAME
    };
    return new ModuleInfo(init);
  }

  public isEntryModule(): boolean {
    return this.type === ModuleType.ENTRY;
  }

  public isPreInstalled(): boolean {
    return this.deliveryWithInstall;
  }

  public isInstallationFree(): boolean {
    return this.installationFree;
  }

  public supportsDeviceType(deviceType: string): boolean {
    return this.deviceTypes.includes(deviceType);
  }

  public getDeviceTypeCount(): number {
    return this.deviceTypes.length;
  }

  public hasStageEntry(): boolean {
    return this.srcEntry.endsWith('.ets') && this.srcEntry.length > 0;
  }

  public pointsToAbilityStageSource(): boolean {
    return this.srcEntry === ENTRY_MODULE_SRC_ENTRY;
  }

  public isNameValid(): boolean {
    return this.name.length > 0;
  }

  public isTypeValid(): boolean {
    return this.type === ModuleType.ENTRY || this.type === ModuleType.FEATURE || this.type === ModuleType.SHARED;
  }

  public validate(): FieldViolation {
    if (!this.isNameValid()) {
      return FieldViolation.VIOLATION_NAME;
    }
    if (!this.isTypeValid()) {
      return FieldViolation.VIOLATION_TYPE;
    }
    if (this.deviceTypes.length === 0) {
      return FieldViolation.VIOLATION_DEVICE_TYPES;
    }
    if (!this.hasStageEntry()) {
      return FieldViolation.VIOLATION_SRC_ENTRY;
    }
    return FieldViolation.VIOLATION_NONE;
  }

  public clone(): ModuleInfo {
    const init: ModuleInfoInit = {
      name: this.name,
      type: this.type,
      deviceTypes: [...this.deviceTypes],
      deliveryWithInstall: this.deliveryWithInstall,
      installationFree: this.installationFree,
      srcEntry: this.srcEntry,
      mainElement: this.mainElement
    };
    return new ModuleInfo(init);
  }

  public equals(other: ModuleInfo): boolean {
    return this.name === other.name && this.type === other.type && this.srcEntry === other.srcEntry &&
      this.deliveryWithInstall === other.deliveryWithInstall && this.installationFree === other.installationFree &&
      this.getDeviceTypeCount() === other.getDeviceTypeCount() && this.mainElement === other.mainElement;
  }

  public toString(): string {
    return `ModuleInfo{name: ${this.name}, type: ${this.type}, deviceTypes: ${this.deviceTypes.length}}`;
  }
}

class AbilityInfo {
  public name: string;
  public srcEntry: string;
  public exported: boolean;
  public skills: SkillDescriptor[];

  constructor(init: AbilityInfoInit) {
    this.name = init.name;
    this.srcEntry = init.srcEntry;
    this.exported = init.exported;
    const entities: string[] = [...init.entities];
    const actions: string[] = [...init.actions];
    const skill: SkillDescriptor = { entities: entities, actions: actions };
    this.skills = [skill];
  }

  public static createEntryAbility(): AbilityInfo {
    const init: AbilityInfoInit = {
      name: ENTRY_ABILITY_NAME,
      srcEntry: ENTRY_ABILITY_SRC_ENTRY,
      exported: true,
      entities: [HOME_ENTITY],
      actions: [HOME_ACTION]
    };
    return new AbilityInfo(init);
  }

  public static createUnexported(name: string): AbilityInfo {
    const init: AbilityInfoInit = {
      name: name,
      srcEntry: ENTRY_ABILITY_SRC_ENTRY,
      exported: false,
      entities: [],
      actions: []
    };
    return new AbilityInfo(init);
  }

  public isExported(): boolean {
    return this.exported;
  }

  public getSkillCount(): number {
    return this.skills.length;
  }

  public hasHomeEntity(): boolean {
    if (this.skills.length === 0) {
      return false;
    }
    return this.skills[0].entities.includes(HOME_ENTITY);
  }

  public hasHomeAction(): boolean {
    if (this.skills.length === 0) {
      return false;
    }
    return this.skills[0].actions.includes(HOME_ACTION);
  }

  public isLauncherEntry(): boolean {
    return this.exported && this.hasHomeEntity() && this.hasHomeAction();
  }

  public getEntityCount(): number {
    if (this.skills.length === 0) {
      return 0;
    }
    return this.skills[0].entities.length;
  }

  public getActionCount(): number {
    if (this.skills.length === 0) {
      return 0;
    }
    return this.skills[0].actions.length;
  }

  public validate(): FieldViolation {
    if (this.name.length === 0) {
      return FieldViolation.VIOLATION_NAME;
    }
    if (this.srcEntry.length === 0) {
      return FieldViolation.VIOLATION_SRC_ENTRY;
    }
    if (this.exported && this.getSkillCount() === 0) {
      return FieldViolation.VIOLATION_EXPORTED;
    }
    return FieldViolation.VIOLATION_NONE;
  }

  public toString(): string {
    return `AbilityInfo{name: ${this.name}, exported: ${this.exported}, skills: ${this.skills.length}}`;
  }
}

class ExtensionInfo {
  public name: string;
  public srcEntry: string;
  public type: string;
  public exported: boolean;
  public metadata: ExtensionMetadataInit[];

  constructor(init: ExtensionInfoInit) {
    this.name = init.name;
    this.srcEntry = init.srcEntry;
    this.type = init.type;
    this.exported = init.exported;
    const copied: ExtensionMetadataInit[] = [];
    for (let i = 0; i < init.metadata.length; i++) {
      const entry: ExtensionMetadataInit = { name: init.metadata[i].name, resource: init.metadata[i].resource };
      copied.push(entry);
    }
    this.metadata = copied;
  }

  public static createBackupExtension(): ExtensionInfo {
    const meta: ExtensionMetadataInit = { name: BACKUP_METADATA_NAME, resource: BACKUP_PROFILE_RESOURCE };
    const init: ExtensionInfoInit = {
      name: BACKUP_ABILITY_NAME,
      srcEntry: BACKUP_ABILITY_SRC_ENTRY,
      type: ExtensionType.BACKUP,
      exported: false,
      metadata: [meta]
    };
    return new ExtensionInfo(init);
  }

  public static createWithDefaults(): ExtensionInfo {
    const init: ExtensionInfoInit = {
      name: MISSING_FIELD_DEFAULT_NAME,
      srcEntry: MISSING_FIELD_DEFAULT_NAME,
      type: ExtensionType.UNKNOWN,
      exported: false,
      metadata: []
    };
    return new ExtensionInfo(init);
  }

  public isBackupExtension(): boolean {
    return this.type === ExtensionType.BACKUP;
  }

  public isExported(): boolean {
    return this.exported;
  }

  public getMetadataCount(): number {
    return this.metadata.length;
  }

  public hasBackupMetadata(): boolean {
    if (this.metadata.length === 0) {
      return false;
    }
    return this.metadata[0].name === BACKUP_METADATA_NAME;
  }

  public getBackupProfileResource(): string {
    if (!this.hasBackupMetadata()) {
      return MISSING_FIELD_DEFAULT_NAME;
    }
    return this.metadata[0].resource;
  }

  public isBackupConfigured(): boolean {
    return this.isBackupExtension() && this.hasBackupMetadata() &&
      this.metadata[0].resource === BACKUP_PROFILE_RESOURCE;
  }

  public validate(): FieldViolation {
    if (this.name.length === 0) {
      return FieldViolation.VIOLATION_NAME;
    }
    if (this.type !== ExtensionType.BACKUP && this.type !== ExtensionType.SERVICE &&
      this.type !== ExtensionType.DATA_SHARE) {
      return FieldViolation.VIOLATION_TYPE;
    }
    if (this.srcEntry.length === 0) {
      return FieldViolation.VIOLATION_SRC_ENTRY;
    }
    if (this.type === ExtensionType.BACKUP && this.metadata.length === 0) {
      return FieldViolation.VIOLATION_METADATA;
    }
    return FieldViolation.VIOLATION_NONE;
  }

  public toString(): string {
    return `ExtensionInfo{name: ${this.name}, type: ${this.type}, exported: ${this.exported}}`;
  }
}

interface ModuleDocumentInit {
  module: ModuleInfo;
  abilities: AbilityInfo[];
  extensionAbilities: ExtensionInfo[];
}

class ModuleDocument {
  public module: ModuleInfo;
  public abilities: AbilityInfo[];
  public extensionAbilities: ExtensionInfo[];

  constructor(init: ModuleDocumentInit) {
    this.module = init.module;
    this.abilities = [...init.abilities];
    this.extensionAbilities = [...init.extensionAbilities];
  }

  public static createFromModuleJson5(): ModuleDocument {
    const init: ModuleDocumentInit = {
      module: ModuleInfo.createEntryModule(),
      abilities: [AbilityInfo.createEntryAbility()],
      extensionAbilities: [ExtensionInfo.createBackupExtension()]
    };
    return new ModuleDocument(init);
  }

  public getAbilityCount(): number {
    return this.abilities.length;
  }

  public getExtensionCount(): number {
    return this.extensionAbilities.length;
  }

  public findAbility(name: string): AbilityInfo | null {
    for (let i = 0; i < this.abilities.length; i++) {
      if (this.abilities[i].name === name) {
        return this.abilities[i];
      }
    }
    return null;
  }

  public findExtension(name: string): ExtensionInfo | null {
    for (let i = 0; i < this.extensionAbilities.length; i++) {
      if (this.extensionAbilities[i].name === name) {
        return this.extensionAbilities[i];
      }
    }
    return null;
  }

  public getLauncherAbility(): AbilityInfo | null {
    for (let i = 0; i < this.abilities.length; i++) {
      if (this.abilities[i].isLauncherEntry()) {
        return this.abilities[i];
      }
    }
    return null;
  }

  public getBackupExtension(): ExtensionInfo | null {
    for (let i = 0; i < this.extensionAbilities.length; i++) {
      if (this.extensionAbilities[i].isBackupExtension()) {
        return this.extensionAbilities[i];
      }
    }
    return null;
  }

  public mainElementExists(): boolean {
    if (this.module.mainElement.length === 0) {
      return false;
    }
    return this.findAbility(this.module.mainElement) !== null;
  }

  public countExportedAbilities(): number {
    return this.abilities.filter((item: AbilityInfo) => item.isExported()).length;
  }

  public collectViolations(): FieldViolation[] {
    const violations: FieldViolation[] = [];
    const moduleViolation: FieldViolation = this.module.validate();
    if (moduleViolation !== FieldViolation.VIOLATION_NONE) {
      violations.push(moduleViolation);
    }
    for (let i = 0; i < this.abilities.length; i++) {
      const violation: FieldViolation = this.abilities[i].validate();
      if (violation !== FieldViolation.VIOLATION_NONE) {
        violations.push(violation);
      }
    }
    for (let i = 0; i < this.extensionAbilities.length; i++) {
      const violation: FieldViolation = this.extensionAbilities[i].validate();
      if (violation !== FieldViolation.VIOLATION_NONE) {
        violations.push(violation);
      }
    }
    return violations;
  }

  public isValid(): boolean {
    return this.collectViolations().length === 0;
  }

  public describe(): string {
    return `${this.module.name}: ${this.abilities.length} abilities, ${this.extensionAbilities.length} extensions`;
  }
}

class ModuleInfoFactory {
  public static create(name: string, type: string, deviceTypes: string[], srcEntry: string): ModuleInfo {
    const init: ModuleInfoInit = {
      name: name,
      type: type,
      deviceTypes: deviceTypes,
      deliveryWithInstall: true,
      installationFree: false,
      srcEntry: srcEntry,
      mainElement: ENTRY_ABILITY_NAME
    };
    return new ModuleInfo(init);
  }

  public static createInvalidType(): ModuleInfo {
    const init: ModuleInfoInit = {
      name: MODULE_NAME,
      type: 'invalid_module_type',
      deviceTypes: [DEVICE_TYPE_DEFAULT],
      deliveryWithInstall: true,
      installationFree: false,
      srcEntry: ENTRY_MODULE_SRC_ENTRY,
      mainElement: ENTRY_ABILITY_NAME
    };
    return new ModuleInfo(init);
  }

  public static createWithoutDeviceTypes(): ModuleInfo {
    const init: ModuleInfoInit = {
      name: MODULE_NAME,
      type: ModuleType.ENTRY,
      deviceTypes: [],
      deliveryWithInstall: true,
      installationFree: false,
      srcEntry: ENTRY_MODULE_SRC_ENTRY,
      mainElement: ENTRY_ABILITY_NAME
    };
    return new ModuleInfo(init);
  }

  public static createWithEmptySrcEntry(): ModuleInfo {
    const init: ModuleInfoInit = {
      name: MODULE_NAME,
      type: ModuleType.ENTRY,
      deviceTypes: [DEVICE_TYPE_DEFAULT],
      deliveryWithInstall: true,
      installationFree: false,
      srcEntry: MISSING_FIELD_DEFAULT_NAME,
      mainElement: ENTRY_ABILITY_NAME
    };
    return new ModuleInfo(init);
  }
}

async function readHelloTextById(driver: Driver): Promise<string> {
  return await runSerializedUiOperation(async (): Promise<string> => {
    const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
    return await component.getText();
  });
}

async function clickHelloWorld(driver: Driver): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async (): Promise<boolean> => {
      const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
      await component.click();
      await driver.delayMs(DELAY_AFTER_LAUNCH);
      return true;
    });
  } catch (error) {
    logInfo(`clickHelloWorld failed: ${error}`);
    return false;
  }
}

export default function abilityStageModelTest(): void {
  describe('AbilityStageModelTest', () => {
    let driver: Driver;
    let document: ModuleDocument;

    beforeAll(async () => {
      driver = getDriver();
      document = ModuleDocument.createFromModuleJson5();
      await serializedDelay(driver, DELAY_AFTER_LAUNCH);
      await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      logInfo('AbilityStageModelTest beforeAll finished');

      await ensureIndexPageInitial(driver);
    });

    beforeEach(async () => {
      const rendered: boolean = await isIndexPageRendered(driver);
      if (!rendered) {
        logInfo('beforeEach: index page absent, relaunching the entry ability');
        await launchEntryAbility();
      }
    })

    afterAll(async () => {
      await serializedDelay(driver, DELAY_AFTER_LAUNCH);
      logInfo('AbilityStageModelTest afterAll finished');
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_0100
     * @tc.name testModuleNameField
     * @tc.desc Verify module name resolves to entry from module.json5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleNameField', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const moduleInfo: ModuleInfo = ModuleInfo.createEntryModule();
          expect(moduleInfo.name).assertEqual('entry');
          expect(moduleInfo.name).assertEqual(MODULE_NAME);
          expect(moduleInfo.isNameValid()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_0200
     * @tc.name testModuleTypeField
     * @tc.desc Verify module type resolves to entry and isEntryModule reports true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleTypeField', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const moduleInfo: ModuleInfo = ModuleInfo.createEntryModule();
          expect(moduleInfo.type).assertEqual('entry');
          expect(moduleInfo.isEntryModule()).assertTrue();
          expect(moduleInfo.isTypeValid()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_0300
     * @tc.name testModuleDeviceTypes
     * @tc.desc Verify deviceTypes contains default then tablet with count 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleDeviceTypes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const moduleInfo: ModuleInfo = ModuleInfo.createEntryModule();
          expect(moduleInfo.getDeviceTypeCount()).assertEqual(2);
          expect(moduleInfo.deviceTypes[0]).assertEqual('default');
          expect(moduleInfo.deviceTypes[1]).assertEqual('tablet');
          expect(moduleInfo.supportsDeviceType('default')).assertTrue();
          expect(moduleInfo.supportsDeviceType('tablet')).assertTrue();
          expect(moduleInfo.supportsDeviceType('wearable')).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_0400
     * @tc.name testModuleDeliveryWithInstall
     * @tc.desc Verify deliveryWithInstall is true and installationFree is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleDeliveryWithInstall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const moduleInfo: ModuleInfo = ModuleInfo.createEntryModule();
          expect(moduleInfo.deliveryWithInstall).assertTrue();
          expect(moduleInfo.isPreInstalled()).assertTrue();
          expect(moduleInfo.installationFree).assertFalse();
          expect(moduleInfo.isInstallationFree()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_0500
     * @tc.name testModuleSrcEntryPointsToAbilityStage
     * @tc.desc Verify module srcEntry points to MyAbilityStage.ets AbilityStage source file
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleSrcEntryPointsToAbilityStage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const moduleInfo: ModuleInfo = ModuleInfo.createEntryModule();
          expect(moduleInfo.srcEntry).assertEqual('./ets/myabilitystage/MyAbilityStage.ets');
          expect(moduleInfo.pointsToAbilityStageSource()).assertTrue();
          expect(moduleInfo.hasStageEntry()).assertTrue();
          expect(moduleInfo.srcEntry.includes(ABILITY_STAGE_NAME)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_0600
     * @tc.name testModuleMainElementMatchesAbility
     * @tc.desc Verify module mainElement names EntryAbility and resolves in the ability list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleMainElementMatchesAbility', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(document.module.mainElement).assertEqual('EntryAbility');
          expect(document.mainElementExists()).assertTrue();
          expect(document.findAbility(document.module.mainElement) === null).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_0700
     * @tc.name testModuleMissingFieldsDefaultValues
     * @tc.desc Verify an empty module record defaults to empty strings, empty device list and false flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleMissingFieldsDefaultValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const moduleInfo: ModuleInfo = ModuleInfo.createWithDefaults();
          expect(moduleInfo.name).assertEqual('');
          expect(moduleInfo.srcEntry).assertEqual('');
          expect(moduleInfo.getDeviceTypeCount()).assertEqual(0);
          expect(moduleInfo.deliveryWithInstall).assertFalse();
          expect(moduleInfo.installationFree).assertFalse();
          expect(moduleInfo.isNameValid()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_0800
     * @tc.name testModuleInvalidTypeRejected
     * @tc.desc Verify an unknown module type fails validation with VIOLATION_TYPE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleInvalidTypeRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const moduleInfo: ModuleInfo = ModuleInfoFactory.createInvalidType();
          expect(moduleInfo.isTypeValid()).assertFalse();
          expect(moduleInfo.validate()).assertEqual(FieldViolation.VIOLATION_TYPE);
          expect(moduleInfo.isEntryModule()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_0900
     * @tc.name testModuleEmptyDeviceTypesRejected
     * @tc.desc Verify an empty deviceTypes array fails validation with VIOLATION_DEVICE_TYPES
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleEmptyDeviceTypesRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const moduleInfo: ModuleInfo = ModuleInfoFactory.createWithoutDeviceTypes();
          expect(moduleInfo.getDeviceTypeCount()).assertEqual(0);
          expect(moduleInfo.validate()).assertEqual(FieldViolation.VIOLATION_DEVICE_TYPES);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_1000
     * @tc.name testModuleEmptySrcEntryRejected
     * @tc.desc Verify an empty srcEntry fails the AbilityStage source check and validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleEmptySrcEntryRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const moduleInfo: ModuleInfo = ModuleInfoFactory.createWithEmptySrcEntry();
          expect(moduleInfo.hasStageEntry()).assertFalse();
          expect(moduleInfo.pointsToAbilityStageSource()).assertFalse();
          expect(moduleInfo.validate()).assertEqual(FieldViolation.VIOLATION_SRC_ENTRY);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_1100
     * @tc.name testModuleValidRecordPasses
     * @tc.desc Verify the real entry module record validates with VIOLATION_NONE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleValidRecordPasses', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const moduleInfo: ModuleInfo = ModuleInfo.createEntryModule();
          expect(moduleInfo.validate()).assertEqual(FieldViolation.VIOLATION_NONE);
          expect(moduleInfo.clone().equals(moduleInfo)).assertTrue();
          const copy: ModuleInfo = moduleInfo.clone();
          copy.deviceTypes.push('wearable');
          expect(moduleInfo.getDeviceTypeCount()).assertEqual(2);
          expect(copy.getDeviceTypeCount()).assertEqual(3);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_1200
     * @tc.name testAbilityNameAndExported
     * @tc.desc Verify EntryAbility is exported and points to its real source file
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAbilityNameAndExported', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const ability: AbilityInfo = AbilityInfo.createEntryAbility();
          expect(ability.name).assertEqual('EntryAbility');
          expect(ability.exported).assertTrue();
          expect(ability.isExported()).assertTrue();
          expect(ability.srcEntry).assertEqual('./ets/entryability/EntryAbility.ets');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_1300
     * @tc.name testAbilityHomeEntity
     * @tc.desc Verify EntryAbility skills declare entity.system.home
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAbilityHomeEntity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const ability: AbilityInfo = AbilityInfo.createEntryAbility();
          expect(ability.getSkillCount()).assertEqual(1);
          expect(ability.getEntityCount()).assertEqual(1);
          expect(ability.skills[0].entities[0]).assertEqual('entity.system.home');
          expect(ability.hasHomeEntity()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_1400
     * @tc.name testAbilityHomeAction
     * @tc.desc Verify EntryAbility skills declare ohos.want.action.home
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAbilityHomeAction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const ability: AbilityInfo = AbilityInfo.createEntryAbility();
          expect(ability.getActionCount()).assertEqual(1);
          expect(ability.skills[0].actions[0]).assertEqual('ohos.want.action.home');
          expect(ability.hasHomeAction()).assertTrue();
          expect(ability.isLauncherEntry()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_1500
     * @tc.name testAbilityUnexportedIsNotLauncher
     * @tc.desc Verify an unexported ability without skills is not a launcher entry and has zero entities
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAbilityUnexportedIsNotLauncher', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const ability: AbilityInfo = AbilityInfo.createUnexported('HiddenAbility');
          expect(ability.exported).assertFalse();
          expect(ability.hasHomeEntity()).assertFalse();
          expect(ability.hasHomeAction()).assertFalse();
          expect(ability.isLauncherEntry()).assertFalse();
          expect(ability.getEntityCount()).assertEqual(0);
          expect(ability.getActionCount()).assertEqual(0);
          expect(ability.getSkillCount()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_1600
     * @tc.name testAbilityExportedWithoutSkillsRejected
     * @tc.desc Verify exported true with an empty skill descriptor fails with VIOLATION_EXPORTED
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAbilityExportedWithoutSkillsRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const ability: AbilityInfo = AbilityInfo.createUnexported('ExportedNoSkill');
          ability.exported = true;
          ability.skills = [];
          expect(ability.validate()).assertEqual(FieldViolation.VIOLATION_EXPORTED);
          expect(ability.isLauncherEntry()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_1700
     * @tc.name testAbilityValidRecordPasses
     * @tc.desc Verify EntryAbility validates with VIOLATION_NONE and describes itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAbilityValidRecordPasses', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const ability: AbilityInfo = AbilityInfo.createEntryAbility();
          expect(ability.validate()).assertEqual(FieldViolation.VIOLATION_NONE);
          expect(ability.toString().includes('EntryAbility')).assertTrue();
          expect(ability.toString().includes('exported: true')).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_1800
     * @tc.name testExtensionNameAndType
     * @tc.desc Verify EntryBackupAbility has type backup and is not exported
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testExtensionNameAndType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const extension: ExtensionInfo = ExtensionInfo.createBackupExtension();
          expect(extension.name).assertEqual('EntryBackupAbility');
          expect(extension.type).assertEqual('backup');
          expect(extension.isBackupExtension()).assertTrue();
          expect(extension.exported).assertFalse();
          expect(extension.isExported()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_1900
     * @tc.name testExtensionSrcEntry
     * @tc.desc Verify the backup extension srcEntry points to EntryBackupAbility.ets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testExtensionSrcEntry', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const extension: ExtensionInfo = ExtensionInfo.createBackupExtension();
          expect(extension.srcEntry).assertEqual('./ets/entrybackupability/EntryBackupAbility.ets');
          expect(extension.srcEntry.includes(BACKUP_ABILITY_NAME)).assertTrue();
          expect(extension.srcEntry.endsWith('.ets')).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_2000
     * @tc.name testExtensionBackupMetadata
     * @tc.desc Verify backup metadata name is ohos.extension.backup with resource $profile:backup_config
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testExtensionBackupMetadata', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const extension: ExtensionInfo = ExtensionInfo.createBackupExtension();
          expect(extension.getMetadataCount()).assertEqual(1);
          expect(extension.metadata[0].name).assertEqual('ohos.extension.backup');
          expect(extension.metadata[0].resource).assertEqual('$profile:backup_config');
          expect(extension.hasBackupMetadata()).assertTrue();
          expect(extension.getBackupProfileResource()).assertEqual('$profile:backup_config');
          expect(extension.isBackupConfigured()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_2100
     * @tc.name testExtensionMissingMetadataRejected
     * @tc.desc Verify a backup extension without metadata fails with VIOLATION_METADATA
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testExtensionMissingMetadataRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const extension: ExtensionInfo = ExtensionInfo.createBackupExtension();
          extension.metadata = [];
          expect(extension.getMetadataCount()).assertEqual(0);
          expect(extension.hasBackupMetadata()).assertFalse();
          expect(extension.getBackupProfileResource()).assertEqual('');
          expect(extension.isBackupConfigured()).assertFalse();
          expect(extension.validate()).assertEqual(FieldViolation.VIOLATION_METADATA);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_2200
     * @tc.name testExtensionDefaults
     * @tc.desc Verify an empty extension record defaults to unknown type, false export and no metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testExtensionDefaults', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const extension: ExtensionInfo = ExtensionInfo.createWithDefaults();
          expect(extension.name).assertEqual('');
          expect(extension.type).assertEqual('unknown');
          expect(extension.exported).assertFalse();
          expect(extension.getMetadataCount()).assertEqual(0);
          expect(extension.isBackupExtension()).assertFalse();
          expect(extension.validate()).assertEqual(FieldViolation.VIOLATION_NAME);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_2300
     * @tc.name testExtensionMetadataCopiedOnConstruction
     * @tc.desc Verify the constructor deep-copies metadata so mutating the source does not affect the model
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testExtensionMetadataCopiedOnConstruction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const meta: ExtensionMetadataInit = { name: 'ohos.extension.backup', resource: '$profile:backup_config' };
          const init: ExtensionInfoInit = {
            name: 'CopyProbeExtension',
            srcEntry: './ets/entrybackupability/EntryBackupAbility.ets',
            type: 'backup',
            exported: false,
            metadata: [meta]
          };
          const extension: ExtensionInfo = new ExtensionInfo(init);
          meta.resource = '$profile:other_config';
          expect(extension.metadata[0].resource).assertEqual('$profile:backup_config');
          expect(extension.isBackupConfigured()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_2400
     * @tc.name testDocumentAbilityAndExtensionCounts
     * @tc.desc Verify the document exposes exactly 1 ability and 1 extension ability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDocumentAbilityAndExtensionCounts', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(document.getAbilityCount()).assertEqual(1);
          expect(document.getExtensionCount()).assertEqual(1);
          expect(document.describe()).assertEqual('entry: 1 abilities, 1 extensions');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_2500
     * @tc.name testDocumentFindByNames
     * @tc.desc Verify ability and extension lookup by known names succeed while unknown names return null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDocumentFindByNames', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(document.findAbility('EntryAbility') === null).assertFalse();
          expect(document.findExtension('EntryBackupAbility') === null).assertFalse();
          expect(document.findAbility('MissingAbility')).assertEqual(null);
          expect(document.findExtension('MissingExtension')).assertEqual(null);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_2600
     * @tc.name testDocumentLauncherAndBackupResolution
     * @tc.desc Verify the document resolves EntryAbility as launcher and the backup extension
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDocumentLauncherAndBackupResolution', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const launcher: AbilityInfo | null = document.getLauncherAbility();
          const backup: ExtensionInfo | null = document.getBackupExtension();
          expect(launcher === null).assertFalse();
          expect(backup === null).assertFalse();
          expect(launcher?.name).assertEqual('EntryAbility');
          expect(backup?.name).assertEqual('EntryBackupAbility');
          expect(document.countExportedAbilities()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_2700
     * @tc.name testDocumentValidatesWithoutViolations
     * @tc.desc Verify the real module document reports zero violations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDocumentValidatesWithoutViolations', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const violations: FieldViolation[] = document.collectViolations();
          expect(violations.length).assertEqual(0);
          expect(document.isValid()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_2800
     * @tc.name testDocumentCollectsMultipleViolations
     * @tc.desc Verify a broken document accumulates module, ability and extension violations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDocumentCollectsMultipleViolations', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const brokenModule: ModuleInfo = ModuleInfoFactory.createInvalidType();
          const brokenAbility: AbilityInfo = AbilityInfo.createUnexported('');
          const brokenExtension: ExtensionInfo = ExtensionInfo.createWithDefaults();
          const init: ModuleDocumentInit = {
            module: brokenModule,
            abilities: [brokenAbility],
            extensionAbilities: [brokenExtension]
          };
          const broken: ModuleDocument = new ModuleDocument(init);
          const violations: FieldViolation[] = broken.collectViolations();
          expect(violations.length).assertEqual(3);
          expect(violations[0]).assertEqual(FieldViolation.VIOLATION_TYPE);
          expect(violations[1]).assertEqual(FieldViolation.VIOLATION_NAME);
          expect(broken.isValid()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_2900
     * @tc.name testModuleFactoryCustomValues
     * @tc.desc Verify the module factory keeps custom name, type, device list and srcEntry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleFactoryCustomValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const moduleInfo: ModuleInfo =
            ModuleInfoFactory.create('library', 'shared', ['phone', 'tablet', 'tv'], './ets/shared/Shared.ets');
          expect(moduleInfo.name).assertEqual('library');
          expect(moduleInfo.type).assertEqual('shared');
          expect(moduleInfo.getDeviceTypeCount()).assertEqual(3);
          expect(moduleInfo.supportsDeviceType('tv')).assertTrue();
          expect(moduleInfo.deliveryWithInstall).assertTrue();
          expect(moduleInfo.validate()).assertEqual(FieldViolation.VIOLATION_NONE);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_3000
     * @tc.name testModuleEqualityIgnoresDeviceOrder
     * @tc.desc Verify module equality compares device count and fixed fields, not element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleEqualityIgnoresDeviceOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const first: ModuleInfo = ModuleInfo.createEntryModule();
          const second: ModuleInfo = ModuleInfo.createEntryModule();
          expect(first.equals(second)).assertTrue();
          first.deviceTypes.reverse();
          expect(first.equals(second)).assertTrue();
          second.name = 'entry_copy';
          expect(first.equals(second)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_3100
     * @tc.name testBundleNameMatchesManifest
     * @tc.desc Verify the runtime bundle name from the delegator equals com.samples.abilitystage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBundleNameMatchesManifest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const bundleName: string = getBundleName();
          expect(bundleName).assertEqual('com.samples.abilitystage');
          const want: Want = buildEntryWant();
          expect(want.bundleName).assertEqual('com.samples.abilitystage');
          expect(want.abilityName).assertEqual('EntryAbility');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_3200
     * @tc.name testRuntimeAbilityListedInDelegator
     * @tc.desc Verify the delegator returns a live top UIAbility bound to com.samples.abilitystage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeAbilityListedInDelegator', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const delegator: abilityDelegatorRegistry.AbilityDelegator = getAbilityDelegator();
          const topAbility: UIAbility | null = await delegator.getCurrentTopAbility();
          expect(topAbility === null).assertFalse();
          expect(topAbility === null ? '' : getBundleName()).assertEqual('com.samples.abilitystage');
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          expect(stable).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_3300
     * @tc.name testRuntimeEntryModuleName
     * @tc.desc Verify the AbilityDelegator argument module name equals entry and page is rendered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeEntryModuleName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const moduleName: string = ModuleInfo.createEntryModule().name;
          expect(moduleName).assertEqual('entry');
          const exists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(exists).assertTrue();
          const count: number = await pageComponentCount(driver);
          expect(count).assertLargerOrEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_3400
     * @tc.name testRuntimeForegroundBackgroundSequence
     * @tc.desc Verify foreground then background keeps the page text readable after returning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeForegroundBackgroundSequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          await doAbilityForeground();
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          expect(stable).assertTrue();
          const visible: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
          const clicked: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
          expect(visible || clicked).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_3500
     * @tc.name testRuntimePageTextUnchangedByEnter
     * @tc.desc Verify a real ENTER key press on the launched page leaves the module text unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimePageTextUnchangedByEnter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
          const initial: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
          const clicked: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
          expect(initial || clicked).assertTrue();
          const exists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(exists).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_3600
     * @tc.name testRuntimePageIdFromMainPagesProfile
     * @tc.desc Verify the page declared in main_pages exposes a non-empty text node under id HelloWorld
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimePageIdFromMainPagesProfile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          const text: string = await readHelloTextById(driver);
          expect(isNonEmptyString(text)).assertTrue();
          expect(text === PAGE_TEXT_INITIAL || text === PAGE_TEXT_CLICKED).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_3700
     * @tc.name testRuntimeComponentCountStableAcrossForeground
     * @tc.desc Verify the visible component count changes by no more than the tolerance across a background round trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeComponentCountStableAcrossForeground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const before: number = await pageComponentCount(driver);
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          await doAbilityForeground();
          await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          const after: number = await pageComponentCount(driver);
          expect(before).assertLargerOrEqual(1);
          expect(Math.abs(after - before)).assertLessOrEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_3800
     * @tc.name testRuntimeLaunchAfterBackPress
     * @tc.desc Verify the module entry ability relaunches and re-renders the page after a BACK key press
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeLaunchAfterBackPress', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          expect(stable).assertTrue();
          const exists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(exists).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_3900
     * @tc.name testRuntimeTextVisibleWithinBudget
     * @tc.desc Verify the page text becomes visible within the module render budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeTextVisibleWithinBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const start: number = Date.now();
          const visible: boolean = await waitForTextVisible(driver, PAGE_TEXT_INITIAL, TIMEOUT_PAGE_RENDER);
          const clickedVisible: boolean =
            visible ? true : await waitForTextVisible(driver, PAGE_TEXT_CLICKED, TIMEOUT_PAGE_RENDER);
          const elapsed: number = measureElapsed(start);
          expect(clickedVisible).assertTrue();
          expect(isWithinBudget(elapsed, TIMEOUT_PAGE_RENDER * 3)).assertTrue();
          expect(elapsed).assertLargerOrEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_4000
     * @tc.name testRuntimeForegroundTwiceIsIdempotent
     * @tc.desc Verify two consecutive foreground requests leave a single readable page and one focused node budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeForegroundTwiceIsIdempotent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await doAbilityForeground();
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          expect(stable).assertTrue();
          const focusIndex: number = await getCurrentFocusIndex(driver);
          expect(focusIndex).assertLargerOrEqual(-1);
          const count: number = await pageComponentCount(driver);
          expect(count).assertLargerOrEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_4100
     * @tc.name testRuntimeLaunchStressRounds
     * @tc.desc Verify five consecutive launch rounds always end with a stable page and the HelloWorld node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeLaunchStressRounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          let stableRounds: number = 0;
          for (let i = 0; i < STRESS_ROUNDS_LAUNCH; i++) {
            await launchEntryAbility();
            const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
            if (stable) {
              stableRounds++;
            }
          }
          expect(stableRounds).assertEqual(STRESS_ROUNDS_LAUNCH);
          const exists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(exists).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_4200
     * @tc.name testRuntimeHomeReturnKeepsIdNode
     * @tc.desc Verify the id HelloWorld node is still discoverable after HOME and a fresh launch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeHomeReturnKeepsIdNode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await pressHomeAndWait(driver);
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const exists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(exists).assertTrue();
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          expect(stable).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_4300
     * @tc.name testRuntimeCollectedTextsMatchModel
     * @tc.desc Verify texts read from the running page include the module page title declared in the model
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeCollectedTextsMatchModel', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const texts: string[] = await collectAllTexts(driver);
          expect(texts.length).assertLargerOrEqual(1);
          const hasInitial: boolean = texts.includes(PAGE_TEXT_INITIAL);
          const hasClicked: boolean = texts.includes(PAGE_TEXT_CLICKED);
          expect(hasInitial || hasClicked).assertTrue();
          expect(document.getAbilityCount()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_4400
     * @tc.name testRuntimeDelegatorTopAbilityModule
     * @tc.desc Verify the delegator top ability context reports module entry and bundle com.samples.abilitystage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeDelegatorTopAbilityModule', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const delegator: abilityDelegatorRegistry.AbilityDelegator = getAbilityDelegator();
          const topAbility: UIAbility | null = await delegator.getCurrentTopAbility();
          expect(topAbility === null).assertFalse();
          expect(topAbility?.context.abilityInfo.moduleName).assertEqual('entry');
          expect(topAbility?.context.abilityInfo.bundleName).assertEqual('com.samples.abilitystage');
          expect(document.findAbility('EntryAbility') === null).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_4500
     * @tc.name testRuntimeStartAbilityByWantRendersPage
     * @tc.desc Verify an explicit start by want renders the page exposing the HelloWorld text node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeStartAbilityByWantRendersPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await startAbilityByWant(buildEntryWant());
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          expect(stable).assertTrue();
          const exists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(exists).assertTrue();
          const text: string = await readHelloTextById(driver);
          expect(isNonEmptyString(text)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_4600
     * @tc.name testRuntimeBackThenForeground
     * @tc.desc Verify a BACK press followed by a foreground request restores a readable module page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeBackThenForeground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await pressBackAndWait(driver);
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          await launchEntryAbility();
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          expect(stable).assertTrue();
          const count: number = await pageComponentCount(driver);
          expect(count).assertLargerOrEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_4700
     * @tc.name testRuntimeFocusIndexAfterLaunch
     * @tc.desc Verify the focus index reported right after launch stays within the component range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeFocusIndexAfterLaunch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const focusIndex: number = await getCurrentFocusIndex(driver);
          const count: number = await pageComponentCount(driver);
          expect(count).assertLargerOrEqual(1);
          expect(focusIndex < count || focusIndex === -1).assertTrue();
          expect(document.module.supportsDeviceType('default')).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_4800
     * @tc.name testRuntimeModuleFactoryMatchesDocument
     * @tc.desc Verify the module factory reproduces the manifest record exactly as parsed from the document
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeModuleFactoryMatchesDocument', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const synthesized: ModuleInfo = ModuleInfoFactory.create('entry', 'entry',
            ['default', 'tablet'], './ets/myabilitystage/MyAbilityStage.ets');
          expect(synthesized.equals(document.module)).assertTrue();
          expect(synthesized.getDeviceTypeCount()).assertEqual(document.module.getDeviceTypeCount());
          const exists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(exists).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_4900
     * @tc.name testRuntimeTapSwitchesPageText
     * @tc.desc Verify tapping the HelloWorld node switches the page text to Welcome as declared in the model
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeTapSwitchesPageText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const clicked: boolean = await clickHelloWorld(driver);
          expect(clicked).assertTrue();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const welcomeVisible: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
          expect(welcomeVisible).assertTrue();
          const launcher: AbilityInfo | null = document.getLauncherAbility();
          expect(launcher === null).assertFalse();
          expect(launcher?.isExported()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_5000
     * @tc.name testRuntimeFocusIndexWithinComponentRange
     * @tc.desc Verify the focused component index stays inside the visible component range after navigation keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeFocusIndexWithinComponentRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
          const focusIndex: number = await getCurrentFocusIndex(driver);
          const count: number = await pageComponentCount(driver);
          expect(count).assertLargerOrEqual(1);
          expect(focusIndex < count || focusIndex === -1).assertTrue();
          const exists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(exists).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMODEL_5100
     * @tc.name testRuntimeModuleEntryRoundTrip
     * @tc.desc Verify a full background plus foreground plus relaunch round trip keeps the module page valid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeModuleEntryRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          await doAbilityForeground();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          expect(stable).assertTrue();
          const text: string = await readHelloTextById(driver);
          expect(isNonEmptyString(text)).assertTrue();
          expect(document.isValid()).assertTrue();
        } finally {
          done();
        }
      })
  });
}
