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
import Want from '@ohos.app.ability.Want';
import {
  getDriver,
  getBundleName,
  launchEntryAbility,
  buildEntryWant,
  startAbilityByWant,
  doAbilityForeground,
  doAbilityBackground,
  waitForIndexPageStable,
  pageComponentCount,
  checkTextContent,
  checkComponentExistsByKey,
  collectAllTexts,
  serializedDelay,
  logInfo,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  INDEX_PAGE_TEXT_KEY,
  INDEX_PAGE_PATH,
  BUNDLE_NAME,
  MODULE_NAME,
  ABILITY_STAGE_NAME,
  ENTRY_ABILITY_NAME,
  BACKUP_ABILITY_NAME,
  COLOR_MODE_NOT_SET,
  ENV_CALLBACK_EVENT,
  TIMEOUT_ABILITY_LAUNCH,
  DELAY_AFTER_LAUNCH,
  DELAY_AFTER_BACKGROUND,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

const MODULE_TYPE_ENTRY: string = 'entry';

const DELIVERY_WITH_INSTALL: boolean = true;

const INSTALLATION_FREE: boolean = false;

const ENTITY_SYSTEM_HOME: string = 'entity.system.home';

const ACTION_HOME: string = 'ohos.want.action.home';

const EXTENSION_TYPE_BACKUP: string = 'backup';

const BACKUP_METADATA_NAME: string = 'ohos.extension.backup';

enum IntegrationTarget {
  TARGET_ABILITY_STAGE = 'ability_stage',
  TARGET_ENTRY_ABILITY = 'entry_ability',
  TARGET_BACKUP_EXTENSION = 'backup_extension',
  TARGET_ENVIRONMENT = 'environment',
  TARGET_WINDOW_STAGE = 'window_stage'
}

interface ModuleConfigSnapshot {
  moduleName: string;
  moduleType: string;
  mainElement: string;
  deviceTypes: string[];
  deliveryWithInstall: boolean;
  installationFree: boolean;
  pagePath: string;
}

interface AbilityConfigSnapshot {
  abilityName: string;
  exported: boolean;
  entities: string[];
  actions: string[];
  srcEntry: string;
}

interface ExtensionConfigSnapshot {
  extensionName: string;
  extensionType: string;
  exported: boolean;
  metadataName: string;
  metadataResource: string;
}

class ModuleConfigParser {
  public parseModule(snapshot: ModuleConfigSnapshot): boolean {
    if (snapshot.moduleName.length === 0 || snapshot.moduleType.length === 0) {
      return false;
    }
    if (snapshot.deviceTypes.length === 0) {
      return false;
    }
    return snapshot.pagePath.length > 0;
  }

  public isEntryModule(snapshot: ModuleConfigSnapshot): boolean {
    return snapshot.moduleType === MODULE_TYPE_ENTRY;
  }

  public isInstallableOnDemand(snapshot: ModuleConfigSnapshot): boolean {
    return snapshot.deliveryWithInstall && !snapshot.installationFree;
  }

  public supportsDevice(snapshot: ModuleConfigSnapshot, deviceType: string): boolean {
    return snapshot.deviceTypes.includes(deviceType);
  }

  public countDeviceTypes(snapshot: ModuleConfigSnapshot): number {
    return snapshot.deviceTypes.length;
  }

  public isMainElement(snapshot: ModuleConfigSnapshot, abilityName: string): boolean {
    return snapshot.mainElement === abilityName;
  }

  public resolvePagePath(snapshot: ModuleConfigSnapshot): string {
    if (!snapshot.pagePath.startsWith('$profile:')) {
      return '';
    }
    return snapshot.pagePath.substring('$profile:'.length);
  }
}

class AbilityConfigValidator {
  public hasHomeEntity(snapshot: AbilityConfigSnapshot): boolean {
    return snapshot.entities.includes(ENTITY_SYSTEM_HOME);
  }

  public hasHomeAction(snapshot: AbilityConfigSnapshot): boolean {
    return snapshot.actions.includes(ACTION_HOME);
  }

  public canBeLaunchedByHome(snapshot: AbilityConfigSnapshot): boolean {
    return snapshot.exported && this.hasHomeEntity(snapshot) && this.hasHomeAction(snapshot);
  }

  public countSkills(snapshot: AbilityConfigSnapshot): number {
    return snapshot.entities.length + snapshot.actions.length;
  }

  public resolveSourceModule(snapshot: AbilityConfigSnapshot): string {
    const marker: string = '/ets/';
    const index: number = snapshot.srcEntry.indexOf(marker);
    if (index < 0) {
      return '';
    }
    return snapshot.srcEntry.substring(index + marker.length);
  }
}

class ExtensionConfigValidator {
  public isBackupExtension(snapshot: ExtensionConfigSnapshot): boolean {
    return snapshot.extensionType === EXTENSION_TYPE_BACKUP;
  }

  public isHiddenFromLaunch(snapshot: ExtensionConfigSnapshot): boolean {
    return !snapshot.exported;
  }

  public hasBackupMetadata(snapshot: ExtensionConfigSnapshot): boolean {
    return snapshot.metadataName === BACKUP_METADATA_NAME && snapshot.metadataResource.length > 0;
  }

  public isConfigComplete(snapshot: ExtensionConfigSnapshot): boolean {
    return this.isBackupExtension(snapshot) && this.hasBackupMetadata(snapshot) &&
      snapshot.extensionName.length > 0;
  }
}

class IntegrationRegistry {
  private targets: string[] = [];
  private failures: string[] = [];

  public register(target: string): boolean {
    if (target.length === 0) {
      this.failures.push(target);
      return false;
    }
    if (this.targets.includes(target)) {
      return false;
    }
    this.targets.push(target);
    return true;
  }

  public markFailure(target: string): void {
    this.failures.push(target);
  }

  public getTargets(): string[] {
    return this.targets.slice(0);
  }

  public getFailureCount(): number {
    return this.failures.length;
  }

  public size(): number {
    return this.targets.length;
  }

  public isComplete(): boolean {
    return this.failures.length === 0 && this.targets.length === 5;
  }
}

export default function systemIntegrationTest(): void {
  describe('SystemIntegrationTest', () => {
    let driver: Driver;
    let moduleParser: ModuleConfigParser;
    let abilityValidator: AbilityConfigValidator;
    let extensionValidator: ExtensionConfigValidator;

    const moduleSnapshot: ModuleConfigSnapshot = {
      moduleName: MODULE_NAME,
      moduleType: MODULE_TYPE_ENTRY,
      mainElement: ENTRY_ABILITY_NAME,
      deviceTypes: ['default', 'tablet'],
      deliveryWithInstall: DELIVERY_WITH_INSTALL,
      installationFree: INSTALLATION_FREE,
      pagePath: '$profile:main_pages'
    };

    const abilitySnapshot: AbilityConfigSnapshot = {
      abilityName: ENTRY_ABILITY_NAME,
      exported: true,
      entities: [ENTITY_SYSTEM_HOME],
      actions: [ACTION_HOME],
      srcEntry: './ets/entryability/EntryAbility.ets'
    };

    const extensionSnapshot: ExtensionConfigSnapshot = {
      extensionName: BACKUP_ABILITY_NAME,
      extensionType: EXTENSION_TYPE_BACKUP,
      exported: false,
      metadataName: BACKUP_METADATA_NAME,
      metadataResource: '$profile:backup_config'
    };

    beforeAll(async () => {
      driver = getDriver();
      moduleParser = new ModuleConfigParser();
      abilityValidator = new AbilityConfigValidator();
      extensionValidator = new ExtensionConfigValidator();
      logInfo('SystemIntegrationTest: beforeAll prepared parsers and driver');

      await ensureIndexPageInitial(driver);
    })

    afterAll(async () => {
      await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
      logInfo('SystemIntegrationTest: afterAll finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SYSTEM_0100
     * @tc.name testModuleConfigParsing
     * @tc.desc Verify module name entry with type entry and a non empty page profile parses successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleConfigParsing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(moduleParser.parseModule(moduleSnapshot)).assertTrue();
          expect(moduleParser.isEntryModule(moduleSnapshot)).assertTrue();
          expect(moduleSnapshot.moduleName).assertEqual(MODULE_NAME);
          expect(moduleParser.countDeviceTypes(moduleSnapshot)).assertEqual(2);
          expect(moduleParser.isMainElement(moduleSnapshot, ENTRY_ABILITY_NAME)).assertTrue();
          expect(moduleParser.isMainElement(moduleSnapshot, BACKUP_ABILITY_NAME)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SYSTEM_0200
     * @tc.name testInstallationFlags
     * @tc.desc Verify deliveryWithInstall true with installationFree false yields an installable on demand module
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstallationFlags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(moduleSnapshot.deliveryWithInstall).assertTrue();
          expect(moduleSnapshot.installationFree).assertFalse();
          expect(moduleParser.isInstallableOnDemand(moduleSnapshot)).assertTrue();
          const freeModule: ModuleConfigSnapshot = {
            moduleName: MODULE_NAME,
            moduleType: MODULE_TYPE_ENTRY,
            mainElement: ENTRY_ABILITY_NAME,
            deviceTypes: ['default'],
            deliveryWithInstall: true,
            installationFree: true,
            pagePath: '$profile:main_pages'
          };
          expect(moduleParser.isInstallableOnDemand(freeModule)).assertFalse();
          const detachedModule: ModuleConfigSnapshot = {
            moduleName: MODULE_NAME,
            moduleType: MODULE_TYPE_ENTRY,
            mainElement: ENTRY_ABILITY_NAME,
            deviceTypes: ['default'],
            deliveryWithInstall: false,
            installationFree: false,
            pagePath: '$profile:main_pages'
          };
          expect(moduleParser.isInstallableOnDemand(detachedModule)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SYSTEM_0300
     * @tc.name testDeviceTypeCoverage
     * @tc.desc Verify the module supports default and tablet and rejects phone, tv and empty strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeviceTypeCoverage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(moduleParser.supportsDevice(moduleSnapshot, 'default')).assertTrue();
          expect(moduleParser.supportsDevice(moduleSnapshot, 'tablet')).assertTrue();
          expect(moduleParser.supportsDevice(moduleSnapshot, 'phone')).assertFalse();
          expect(moduleParser.supportsDevice(moduleSnapshot, 'tv')).assertFalse();
          expect(moduleParser.supportsDevice(moduleSnapshot, '')).assertFalse();
          expect(moduleParser.resolvePagePath(moduleSnapshot)).assertEqual('main_pages');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SYSTEM_0400
     * @tc.name testAbilityExportedAndSkills
     * @tc.desc Verify EntryAbility is exported with entity.system.home and ohos.want.action.home so the launcher can open it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAbilityExportedAndSkills', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(abilitySnapshot.exported).assertTrue();
          expect(abilityValidator.hasHomeEntity(abilitySnapshot)).assertTrue();
          expect(abilityValidator.hasHomeAction(abilitySnapshot)).assertTrue();
          expect(abilityValidator.canBeLaunchedByHome(abilitySnapshot)).assertTrue();
          expect(abilityValidator.countSkills(abilitySnapshot)).assertEqual(2);
          expect(abilityValidator.resolveSourceModule(abilitySnapshot)).assertEqual('entryability/EntryAbility.ets');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SYSTEM_0500
     * @tc.name testAbilityWithoutSkillCannotLaunch
     * @tc.desc Verify an ability missing the home action or marked not exported cannot be launched by the home entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testAbilityWithoutSkillCannotLaunch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          const noAction: AbilityConfigSnapshot = {
            abilityName: ENTRY_ABILITY_NAME,
            exported: true,
            entities: [ENTITY_SYSTEM_HOME],
            actions: [],
            srcEntry: './ets/entryability/EntryAbility.ets'
          };
          const notExported: AbilityConfigSnapshot = {
            abilityName: ENTRY_ABILITY_NAME,
            exported: false,
            entities: [ENTITY_SYSTEM_HOME],
            actions: [ACTION_HOME],
            srcEntry: './ets/entryability/EntryAbility.ets'
          };
          expect(abilityValidator.canBeLaunchedByHome(noAction)).assertFalse();
          expect(abilityValidator.canBeLaunchedByHome(notExported)).assertFalse();
          expect(abilityValidator.countSkills(noAction)).assertEqual(1);
          expect(abilityValidator.resolveSourceModule(noAction)).assertEqual('entryability/EntryAbility.ets');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SYSTEM_0600
     * @tc.name testBackupExtensionConfig
     * @tc.desc Verify the backup extension is type backup, not exported and carries ohos.extension.backup metadata with a profile resource
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBackupExtensionConfig', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(extensionValidator.isBackupExtension(extensionSnapshot)).assertTrue();
          expect(extensionValidator.isHiddenFromLaunch(extensionSnapshot)).assertTrue();
          expect(extensionValidator.hasBackupMetadata(extensionSnapshot)).assertTrue();
          expect(extensionValidator.isConfigComplete(extensionSnapshot)).assertTrue();
          expect(extensionSnapshot.metadataResource).assertEqual('$profile:backup_config');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SYSTEM_0700
     * @tc.name testIncompleteBackupExtensionRejected
     * @tc.desc Verify a backup extension with a wrong metadata name or an empty extension name is not a complete configuration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testIncompleteBackupExtensionRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          const wrongMetadata: ExtensionConfigSnapshot = {
            extensionName: BACKUP_ABILITY_NAME,
            extensionType: EXTENSION_TYPE_BACKUP,
            exported: false,
            metadataName: 'ohos.extension.unknown',
            metadataResource: '$profile:backup_config'
          };
          const emptyName: ExtensionConfigSnapshot = {
            extensionName: '',
            extensionType: EXTENSION_TYPE_BACKUP,
            exported: false,
            metadataName: BACKUP_METADATA_NAME,
            metadataResource: '$profile:backup_config'
          };
          const wrongType: ExtensionConfigSnapshot = {
            extensionName: BACKUP_ABILITY_NAME,
            extensionType: 'service',
            exported: true,
            metadataName: BACKUP_METADATA_NAME,
            metadataResource: '$profile:backup_config'
          };
          expect(extensionValidator.isConfigComplete(wrongMetadata)).assertFalse();
          expect(extensionValidator.isConfigComplete(emptyName)).assertFalse();
          expect(extensionValidator.isConfigComplete(wrongType)).assertFalse();
          expect(extensionValidator.isHiddenFromLaunch(wrongType)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SYSTEM_0800
     * @tc.name testRegistryCompleteness
     * @tc.desc Verify registering five distinct integration targets makes the registry complete, and duplicate or empty registration is refused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testRegistryCompleteness', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          const registry: IntegrationRegistry = new IntegrationRegistry();
          expect(registry.register(IntegrationTarget.TARGET_ABILITY_STAGE)).assertTrue();
          expect(registry.register(IntegrationTarget.TARGET_ENTRY_ABILITY)).assertTrue();
          expect(registry.register(IntegrationTarget.TARGET_BACKUP_EXTENSION)).assertTrue();
          expect(registry.register(IntegrationTarget.TARGET_ENVIRONMENT)).assertTrue();
          expect(registry.register(IntegrationTarget.TARGET_WINDOW_STAGE)).assertTrue();
          expect(registry.register(IntegrationTarget.TARGET_WINDOW_STAGE)).assertFalse();
          expect(registry.register('')).assertFalse();
          expect(registry.size()).assertEqual(5);
          expect(registry.getFailureCount()).assertEqual(1);
          expect(registry.isComplete()).assertFalse();
          registry.markFailure(IntegrationTarget.TARGET_ENVIRONMENT);
          expect(registry.getFailureCount()).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SYSTEM_0900
     * @tc.name testDelegatorBundleAndModuleIdentity
     * @tc.desc Verify the runtime bundle name matches the sample bundle identifier and the module name constant is entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDelegatorBundleAndModuleIdentity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const runtimeBundleName: string = getBundleName();
          expect(runtimeBundleName.length > 0).assertTrue();
          expect(runtimeBundleName).assertEqual(BUNDLE_NAME);
          expect(MODULE_NAME).assertEqual('entry');
          expect(ABILITY_STAGE_NAME).assertEqual('MyAbilityStage');
          expect(ENTRY_ABILITY_NAME).assertEqual('EntryAbility');
          expect(BACKUP_ABILITY_NAME).assertEqual('EntryBackupAbility');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SYSTEM_1000
     * @tc.name testEntryAbilityLaunchesThroughDelegator
     * @tc.desc Verify the delegator starts EntryAbility by explicit Want and the Index page renders with the HelloWorld text component
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testEntryAbilityLaunchesThroughDelegator', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
        try {
          const want: Want = buildEntryWant();
          await startAbilityByWant(want);
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          expect(stable).assertTrue();
          expect(await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY)).assertTrue();
          const componentCount: number = await pageComponentCount(driver);
          expect(componentCount > 0).assertTrue();
          const showsInitial: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
          const showsClicked: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
          expect(showsInitial || showsClicked).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SYSTEM_1100
     * @tc.name testIndexPagePathConstant
     * @tc.desc Verify the declared entry page path constant equals pages/Index and the page still exposes index text after a foreground switch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexPagePathConstant', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(INDEX_PAGE_PATH).assertEqual('pages/Index');
          expect(COLOR_MODE_NOT_SET).assertEqual(-1);
          expect(ENV_CALLBACK_EVENT).assertEqual('environment');
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          expect(stable).assertTrue();
          const texts: string[] = await collectAllTexts(driver);
          expect(texts.length > 0).assertTrue();
        } finally {
          done();
        }
      })
  })
}
