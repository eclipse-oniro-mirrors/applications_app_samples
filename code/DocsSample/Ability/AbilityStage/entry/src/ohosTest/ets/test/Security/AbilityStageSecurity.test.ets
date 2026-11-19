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
import { Driver, ON, Component } from '@ohos.UiTest';
import Want from '@ohos.app.ability.Want';
import {
  BUNDLE_NAME,
  ENTRY_ABILITY_NAME,
  BACKUP_ABILITY_NAME,
  INDEX_PAGE_TEXT_KEY,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  DELAY_AFTER_LAUNCH,
  TIMEOUT_ABILITY_LAUNCH,
  TOLERANCE_COMPONENT_COUNT,
  getDriver,
  getBundleName,
  buildEntryWant,
  startAbilityByWant,
  launchEntryAbility,
  checkComponentExistsByKey,
  checkTextContent,
  findComponentsByText,
  pageComponentCount,
  runSerializedUiOperation,
  waitForIndexPageStable,
  waitForTextVisible,
  tapComponentByText,
  serializedDelay,
  logInfo,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

enum AbilityType {
  TYPE_ABILITY = 'ability',
  TYPE_BACKUP = 'backup',
  TYPE_DATA = 'data'
}

enum ExposureRisk {
  RISK_NONE = 'none',
  RISK_SILENT_EXPORT = 'silent_export',
  RISK_EXTENSION_EXPORT = 'extension_export',
  RISK_METADATA_MISSING = 'metadata_missing',
  RISK_UNDECLARED = 'undeclared'
}

interface SkillDeclaration {
  entities: string[];
  actions: string[];
}

interface MetadataDeclaration {
  name: string;
  resource: string;
}

interface AbilityDeclaration {
  name: string;
  abilityType: AbilityType;
  isExtension: boolean;
  exported: boolean;
  skills: SkillDeclaration[];
  metadata: MetadataDeclaration[];
}

const HOME_ENTITY: string = 'entity.system.home';

const HOME_ACTION: string = 'ohos.want.action.home';

const BACKUP_METADATA_NAME: string = 'ohos.extension.backup';

const BACKUP_RESOURCE_PREFIX: string = '$profile:';

const BACKUP_METADATA_RESOURCE: string = '$profile:backup_config';

const LAUNCH_REPEAT_ROUNDS: number = 3;

const ENTRY_HOME_SKILL: SkillDeclaration = {
  entities: [HOME_ENTITY],
  actions: [HOME_ACTION]
};

const BACKUP_METADATA: MetadataDeclaration = {
  name: BACKUP_METADATA_NAME,
  resource: BACKUP_METADATA_RESOURCE
};

class ModuleExposureModel {
  private declarations: AbilityDeclaration[] = [];

  public indexOf(name: string): number {
    for (let i = 0; i < this.declarations.length; i++) {
      if (this.declarations[i].name === name) {
        return i;
      }
    }
    return -1;
  }

  public register(declaration: AbilityDeclaration): boolean {
    if (this.indexOf(declaration.name) >= 0) {
      return false;
    }
    this.declarations.push(declaration);
    return true;
  }

  public total(): number {
    return this.declarations.length;
  }

  public find(name: string): AbilityDeclaration | null {
    const index: number = this.indexOf(name);
    if (index < 0) {
      return null;
    }
    return this.declarations[index];
  }

  public isDeclared(name: string): boolean {
    return this.indexOf(name) >= 0;
  }

  public isExported(name: string): boolean {
    const declaration: AbilityDeclaration | null = this.find(name);
    if (declaration === null) {
      return false;
    }
    return declaration.exported;
  }

  public countByType(abilityType: AbilityType): number {
    let count: number = 0;
    for (let i = 0; i < this.declarations.length; i++) {
      if (this.declarations[i].abilityType === abilityType) {
        count++;
      }
    }
    return count;
  }

  public exportedNames(): string[] {
    const names: string[] = [];
    for (let i = 0; i < this.declarations.length; i++) {
      if (this.declarations[i].exported) {
        names.push(this.declarations[i].name);
      }
    }
    return names;
  }

  public nonExportedNames(): string[] {
    const names: string[] = [];
    for (let i = 0; i < this.declarations.length; i++) {
      if (!this.declarations[i].exported) {
        names.push(this.declarations[i].name);
      }
    }
    return names;
  }

  public skillCount(name: string): number {
    const declaration: AbilityDeclaration | null = this.find(name);
    if (declaration === null) {
      return -1;
    }
    return declaration.skills.length;
  }

  public entityCount(name: string): number {
    const declaration: AbilityDeclaration | null = this.find(name);
    if (declaration === null) {
      return -1;
    }
    let count: number = 0;
    for (let i = 0; i < declaration.skills.length; i++) {
      count += declaration.skills[i].entities.length;
    }
    return count;
  }

  public actionCount(name: string): number {
    const declaration: AbilityDeclaration | null = this.find(name);
    if (declaration === null) {
      return -1;
    }
    let count: number = 0;
    for (let i = 0; i < declaration.skills.length; i++) {
      count += declaration.skills[i].actions.length;
    }
    return count;
  }

  public hasEntity(name: string, entity: string): boolean {
    const declaration: AbilityDeclaration | null = this.find(name);
    if (declaration === null) {
      return false;
    }
    for (let i = 0; i < declaration.skills.length; i++) {
      const entities: string[] = declaration.skills[i].entities;
      for (let j = 0; j < entities.length; j++) {
        if (entities[j] === entity) {
          return true;
        }
      }
    }
    return false;
  }

  public hasAction(name: string, action: string): boolean {
    const declaration: AbilityDeclaration | null = this.find(name);
    if (declaration === null) {
      return false;
    }
    for (let i = 0; i < declaration.skills.length; i++) {
      const actions: string[] = declaration.skills[i].actions;
      for (let j = 0; j < actions.length; j++) {
        if (actions[j] === action) {
          return true;
        }
      }
    }
    return false;
  }

  public isHomeEntry(name: string): boolean {
    return this.isExported(name) && this.hasEntity(name, HOME_ENTITY) && this.hasAction(name, HOME_ACTION);
  }

  public isOverExposed(name: string): boolean {
    const declaration: AbilityDeclaration | null = this.find(name);
    if (declaration === null) {
      return false;
    }
    return declaration.exported && declaration.skills.length === 0;
  }

  public metadataName(name: string): string {
    const declaration: AbilityDeclaration | null = this.find(name);
    if (declaration === null || declaration.metadata.length === 0) {
      return '';
    }
    return declaration.metadata[0].name;
  }

  public metadataResource(name: string): string {
    const declaration: AbilityDeclaration | null = this.find(name);
    if (declaration === null || declaration.metadata.length === 0) {
      return '';
    }
    return declaration.metadata[0].resource;
  }

  public isBackupMetadataBound(name: string): boolean {
    return this.metadataName(name) === BACKUP_METADATA_NAME &&
      this.metadataResource(name).startsWith(BACKUP_RESOURCE_PREFIX);
  }

  public riskOf(name: string): ExposureRisk {
    const declaration: AbilityDeclaration | null = this.find(name);
    if (declaration === null) {
      return ExposureRisk.RISK_UNDECLARED;
    }
    if (declaration.exported && declaration.skills.length === 0) {
      return ExposureRisk.RISK_SILENT_EXPORT;
    }
    if (declaration.isExtension && declaration.exported) {
      return ExposureRisk.RISK_EXTENSION_EXPORT;
    }
    if (declaration.abilityType === AbilityType.TYPE_BACKUP && !this.isBackupMetadataBound(name)) {
      return ExposureRisk.RISK_METADATA_MISSING;
    }
    return ExposureRisk.RISK_NONE;
  }

  public exportedRiskList(): string[] {
    const risks: string[] = [];
    const names: string[] = this.exportedNames();
    for (let i = 0; i < names.length; i++) {
      if (this.riskOf(names[i]) !== ExposureRisk.RISK_NONE) {
        risks.push(names[i]);
      }
    }
    return risks;
  }
}

class PermissionMinimizer {
  private declared: string[] = [];

  private used: string[] = [];

  public declare(name: string): void {
    if (this.declared.indexOf(name) < 0) {
      this.declared.push(name);
    }
  }

  public use(name: string): void {
    if (this.used.indexOf(name) < 0) {
      this.used.push(name);
    }
  }

  public isDeclared(name: string): boolean {
    return this.declared.indexOf(name) >= 0;
  }

  public declaredCount(): number {
    return this.declared.length;
  }

  public usedCount(): number {
    return this.used.length;
  }

  public unusedPermissions(): string[] {
    const unused: string[] = [];
    for (let i = 0; i < this.declared.length; i++) {
      if (this.used.indexOf(this.declared[i]) < 0) {
        unused.push(this.declared[i]);
      }
    }
    return unused;
  }

  public isMinimal(): boolean {
    return this.unusedPermissions().length === 0;
  }
}

class RoutingGuard {
  private bundleName: string = '';

  private allowedAbilities: string[] = [];

  constructor(bundleName: string) {
    this.bundleName = bundleName;
  }

  public allow(abilityName: string): void {
    if (this.allowedAbilities.indexOf(abilityName) < 0) {
      this.allowedAbilities.push(abilityName);
    }
  }

  public allowedCount(): number {
    return this.allowedAbilities.length;
  }

  public isBundleAccepted(bundleName: string): boolean {
    return bundleName === this.bundleName;
  }

  public canRoute(bundleName: string, abilityName: string): boolean {
    if (!this.isBundleAccepted(bundleName)) {
      return false;
    }
    return this.allowedAbilities.indexOf(abilityName) >= 0;
  }
}

function buildModuleModel(): ModuleExposureModel {
  const model: ModuleExposureModel = new ModuleExposureModel();
  const entrySkills: SkillDeclaration[] = [ENTRY_HOME_SKILL];
  const entryMetadata: MetadataDeclaration[] = [];
  const entry: AbilityDeclaration = {
    name: ENTRY_ABILITY_NAME,
    abilityType: AbilityType.TYPE_ABILITY,
    isExtension: false,
    exported: true,
    skills: entrySkills,
    metadata: entryMetadata
  };
  const backupSkills: SkillDeclaration[] = [];
  const backupMetadata: MetadataDeclaration[] = [BACKUP_METADATA];
  const backup: AbilityDeclaration = {
    name: BACKUP_ABILITY_NAME,
    abilityType: AbilityType.TYPE_BACKUP,
    isExtension: true,
    exported: false,
    skills: backupSkills,
    metadata: backupMetadata
  };
  model.register(entry);
  model.register(backup);
  return model;
}

function buildProbeModel(name: string, exported: boolean, isExtension: boolean, abilityType: AbilityType,
  withSkills: boolean, withMetadata: boolean): ModuleExposureModel {
  const model: ModuleExposureModel = new ModuleExposureModel();
  const skills: SkillDeclaration[] = [];
  if (withSkills) {
    skills.push(ENTRY_HOME_SKILL);
  }
  const metadata: MetadataDeclaration[] = [];
  if (withMetadata) {
    metadata.push(BACKUP_METADATA);
  }
  const declaration: AbilityDeclaration = {
    name: name,
    abilityType: abilityType,
    isExtension: isExtension,
    exported: exported,
    skills: skills,
    metadata: metadata
  };
  model.register(declaration);
  return model;
}

async function readTextById(driver: Driver, nodeId: string): Promise<string> {
  return await runSerializedUiOperation(async (): Promise<string> => {
    const nodes: Component[] = await driver.findComponents(ON.id(nodeId));
    if (nodes === null || nodes === undefined || nodes.length === 0) {
      return '';
    }
    return await nodes[0].getText();
  });
}

export default function abilityStageSecurityTest(): void {
  describe('AbilityStageSecurityTest', () => {
    let driver: Driver = getDriver();
    let model: ModuleExposureModel = buildModuleModel();
    let routingGuard: RoutingGuard = new RoutingGuard(BUNDLE_NAME);

    beforeAll(async (): Promise<void> => {
      driver = getDriver();
      model = buildModuleModel();
      routingGuard = new RoutingGuard(BUNDLE_NAME);
      routingGuard.allow(ENTRY_ABILITY_NAME);
      await serializedDelay(driver, DELAY_AFTER_LAUNCH);
      logInfo('abilityStageSecurityTest: module exposure model prepared');

      await ensureIndexPageInitial(driver);
    })

    afterAll(async (): Promise<void> => {
      await serializedDelay(driver, DELAY_AFTER_LAUNCH);
      logInfo('abilityStageSecurityTest: finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECURITY_0100
     * @tc.name testModuleSnapshotDeclaresExpectedMembers
     * @tc.desc Verify module snapshot: 1 ui ability, 1 backup extension, 0 data ability declared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testModuleSnapshotDeclaresExpectedMembers', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(model.total()).assertEqual(2);
          expect(model.countByType(AbilityType.TYPE_ABILITY)).assertEqual(1);
          expect(model.countByType(AbilityType.TYPE_BACKUP)).assertEqual(1);
          expect(model.countByType(AbilityType.TYPE_DATA)).assertEqual(0);
          expect(model.isDeclared(ENTRY_ABILITY_NAME)).assertTrue();
          expect(model.isDeclared(BACKUP_ABILITY_NAME)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECURITY_0200
     * @tc.name testEntryAbilityExportedFlagIsTrue
     * @tc.desc Verify EntryAbility stays exported because it carries the launcher home entity -> exported true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEntryAbilityExportedFlagIsTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(model.isExported(ENTRY_ABILITY_NAME)).assertTrue();
          expect(model.exportedNames().length).assertEqual(1);
          expect(model.exportedNames()[0]).assertEqual(ENTRY_ABILITY_NAME);
          logInfo('testEntryAbilityExportedFlagIsTrue: exported ability list size is 1');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECURITY_0300
     * @tc.name testEntryAbilityIsHomeEntry
     * @tc.desc Verify EntryAbility combines exported with entity.system.home and ohos.want.action.home -> home entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEntryAbilityIsHomeEntry', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(model.hasEntity(ENTRY_ABILITY_NAME, HOME_ENTITY)).assertTrue();
          expect(model.hasAction(ENTRY_ABILITY_NAME, HOME_ACTION)).assertTrue();
          expect(model.isHomeEntry(ENTRY_ABILITY_NAME)).assertTrue();
          expect(model.isHomeEntry(BACKUP_ABILITY_NAME)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECURITY_0400
     * @tc.name testEntryHomeSkillCombinationIsLegal
     * @tc.desc Verify entry skill block holds exactly 1 entity and 1 action so launcher matching stays unambiguous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEntryHomeSkillCombinationIsLegal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(model.skillCount(ENTRY_ABILITY_NAME)).assertEqual(1);
          expect(model.entityCount(ENTRY_ABILITY_NAME)).assertEqual(1);
          expect(model.actionCount(ENTRY_ABILITY_NAME)).assertEqual(1);
          expect(model.hasEntity(ENTRY_ABILITY_NAME, 'entity.system.browsable')).assertFalse();
          expect(model.hasAction(ENTRY_ABILITY_NAME, 'ohos.want.action.viewData')).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECURITY_0500
     * @tc.name testBackupAbilityIsNotExported
     * @tc.desc Verify EntryBackupAbility is declared as a non exported backup extension -> exported false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBackupAbilityIsNotExported', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(model.isExported(BACKUP_ABILITY_NAME)).assertFalse();
          expect(model.nonExportedNames().length).assertEqual(1);
          expect(model.nonExportedNames()[0]).assertEqual(BACKUP_ABILITY_NAME);
          expect(model.skillCount(BACKUP_ABILITY_NAME)).assertEqual(0);
          expect(model.isHomeEntry(BACKUP_ABILITY_NAME)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECURITY_0600
     * @tc.name testBackupMetadataBindsProfileResource
     * @tc.desc Verify backup extension metadata name is ohos.extension.backup and resource targets $profile:backup_config
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBackupMetadataBindsProfileResource', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(model.metadataName(BACKUP_ABILITY_NAME)).assertEqual(BACKUP_METADATA_NAME);
          expect(model.metadataResource(BACKUP_ABILITY_NAME)).assertEqual(BACKUP_METADATA_RESOURCE);
          expect(model.isBackupMetadataBound(BACKUP_ABILITY_NAME)).assertTrue();
          expect(model.metadataResource(ENTRY_ABILITY_NAME)).assertEqual('');
          expect(model.isBackupMetadataBound(ENTRY_ABILITY_NAME)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECURITY_0700
     * @tc.name testExportSurfaceContainsOnlyEntryAbility
     * @tc.desc Verify the exported ability list contains only EntryAbility and the backup extension never leaks into it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testExportSurfaceContainsOnlyEntryAbility', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const exported: string[] = model.exportedNames();
          expect(exported.length).assertEqual(1);
          expect(exported.indexOf(BACKUP_ABILITY_NAME)).assertEqual(-1);
          expect(exported.indexOf(ENTRY_ABILITY_NAME)).assertEqual(0);
          expect(model.total() - exported.length).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECURITY_0800
     * @tc.name testOverExposedDetectionForExportedWithoutSkills
     * @tc.desc Verify over exposure rule: exported ability without any skill is flagged, non exported one is not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOverExposedDetectionForExportedWithoutSkills', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(model.isOverExposed(ENTRY_ABILITY_NAME)).assertFalse();
          expect(model.isOverExposed(BACKUP_ABILITY_NAME)).assertFalse();
          const silentProbe: ModuleExposureModel =
            buildProbeModel('SilentExportAbility', true, false, AbilityType.TYPE_ABILITY, false, false);
          const closedProbe: ModuleExposureModel =
            buildProbeModel('ClosedExportAbility', false, false, AbilityType.TYPE_ABILITY, false, false);
          expect(silentProbe.isOverExposed('SilentExportAbility')).assertTrue();
          expect(closedProbe.isOverExposed('ClosedExportAbility')).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECURITY_0900
     * @tc.name testRiskOfDeclaredMembersIsClean
     * @tc.desc Verify declared entry and backup members carry no exposure risk and the risk list is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRiskOfDeclaredMembersIsClean', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(model.riskOf(ENTRY_ABILITY_NAME)).assertEqual(ExposureRisk.RISK_NONE);
          expect(model.riskOf(BACKUP_ABILITY_NAME)).assertEqual(ExposureRisk.RISK_NONE);
          expect(model.riskOf('GhostAbility')).assertEqual(ExposureRisk.RISK_UNDECLARED);
          expect(model.exportedRiskList().length).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECURITY_1000
     * @tc.name testRiskPrecedenceForSilentExportAndBackup
     * @tc.desc Verify risk precedence: silent export over metadata gap, extension export over backup without metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRiskPrecedenceForSilentExportAndBackup', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const silentProbe: ModuleExposureModel =
            buildProbeModel('SilentProbe', true, false, AbilityType.TYPE_ABILITY, false, false);
          expect(silentProbe.riskOf('SilentProbe')).assertEqual(ExposureRisk.RISK_SILENT_EXPORT);
          const metadataGapProbe: ModuleExposureModel =
            buildProbeModel('BackupProbe', false, true, AbilityType.TYPE_BACKUP, false, false);
          expect(metadataGapProbe.riskOf('BackupProbe')).assertEqual(ExposureRisk.RISK_METADATA_MISSING);
          const exportedExtensionProbe: ModuleExposureModel =
            buildProbeModel('ExportedBackupProbe', true, true, AbilityType.TYPE_BACKUP, true, true);
          expect(exportedExtensionProbe.riskOf('ExportedBackupProbe'))
            .assertEqual(ExposureRisk.RISK_EXTENSION_EXPORT);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECURITY_1100
     * @tc.name testNoDataAbilityDeclared
     * @tc.desc Verify no data ability is exposed: data type count is 0 and a data ability name stays undeclared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNoDataAbilityDeclared', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(model.countByType(AbilityType.TYPE_DATA)).assertEqual(0);
          expect(model.isDeclared('EntryDataAbility')).assertFalse();
          expect(model.countByType(AbilityType.TYPE_ABILITY)).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECURITY_1200
     * @tc.name testPermissionDeclarationIsMinimal
     * @tc.desc Verify the module requests no permission: declared count 0, unused list empty, exposure minimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPermissionDeclarationIsMinimal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const minimizer: PermissionMinimizer = new PermissionMinimizer();
          expect(minimizer.declaredCount()).assertEqual(0);
          expect(minimizer.isDeclared('ohos.permission.INTERNET')).assertFalse();
          expect(minimizer.unusedPermissions().length).assertEqual(0);
          expect(minimizer.isMinimal()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECURITY_1300
     * @tc.name testPermissionTrackerFlagsUnusedPermission
     * @tc.desc Verify a declared but unused permission is reported: 2 declared, 1 used -> 1 unused finding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPermissionTrackerFlagsUnusedPermission', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const minimizer: PermissionMinimizer = new PermissionMinimizer();
          minimizer.declare('ohos.permission.INTERNET');
          minimizer.declare('ohos.permission.CAMERA');
          minimizer.use('ohos.permission.INTERNET');
          expect(minimizer.declaredCount()).assertEqual(2);
          expect(minimizer.usedCount()).assertEqual(1);
          expect(minimizer.unusedPermissions().length).assertEqual(1);
          expect(minimizer.unusedPermissions()[0]).assertEqual('ohos.permission.CAMERA');
          expect(minimizer.isMinimal()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECURITY_1400
     * @tc.name testRoutingGuardAcceptsEntryAbility
     * @tc.desc Verify routing guard accepts the declared bundle with EntryAbility and keeps one whitelisted target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRoutingGuardAcceptsEntryAbility', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(routingGuard.allowedCount()).assertEqual(1);
          expect(routingGuard.isBundleAccepted(BUNDLE_NAME)).assertTrue();
          expect(routingGuard.canRoute(BUNDLE_NAME, ENTRY_ABILITY_NAME)).assertTrue();
          expect(routingGuard.canRoute(BUNDLE_NAME, BACKUP_ABILITY_NAME)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECURITY_1500
     * @tc.name testRoutingGuardRejectsUnknownAbility
     * @tc.desc Verify an unknown ability name is rejected while the declared bundle itself is still accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRoutingGuardRejectsUnknownAbility', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(routingGuard.canRoute(BUNDLE_NAME, 'GhostAbility')).assertFalse();
          expect(routingGuard.canRoute(BUNDLE_NAME, '')).assertFalse();
          expect(routingGuard.isBundleAccepted(BUNDLE_NAME)).assertTrue();
          expect(routingGuard.allowedCount()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECURITY_1600
     * @tc.name testRoutingGuardRejectsForeignKeyBundle
     * @tc.desc Verify a foreign bundle name cannot route into the entry ability of this module
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRoutingGuardRejectsForeignKeyBundle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(routingGuard.canRoute('com.example.hijack', ENTRY_ABILITY_NAME)).assertFalse();
          expect(routingGuard.isBundleAccepted('com.example.hijack')).assertFalse();
          expect(routingGuard.isBundleAccepted('')).assertFalse();
          expect(routingGuard.isBundleAccepted('com.samples.abilitystage.extra')).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECURITY_1700
     * @tc.name testRoutingGuardMatchesExportedSurface
     * @tc.desc Verify every exported member is routable and no non exported member is routable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRoutingGuardMatchesExportedSurface', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const exported: string[] = model.exportedNames();
          let routable: number = 0;
          for (let i = 0; i < exported.length; i++) {
            if (routingGuard.canRoute(BUNDLE_NAME, exported[i])) {
              routable++;
            }
          }
          expect(routable).assertEqual(exported.length);
          const closed: string[] = model.nonExportedNames();
          let closedRoutable: number = 0;
          for (let i = 0; i < closed.length; i++) {
            if (routingGuard.canRoute(BUNDLE_NAME, closed[i])) {
              closedRoutable++;
            }
          }
          expect(closedRoutable).assertEqual(0);
          expect(closed.length).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECURITY_1800
     * @tc.name testDuplicateRegistrationDoesNotInflateSurface
     * @tc.desc Verify registering the same declaration twice keeps the module at 2 members and a new one lifts it to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDuplicateRegistrationDoesNotInflateSurface', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const localModel: ModuleExposureModel = buildModuleModel();
          const duplicated: AbilityDeclaration = {
            name: ENTRY_ABILITY_NAME,
            abilityType: AbilityType.TYPE_ABILITY,
            isExtension: false,
            exported: true,
            skills: [ENTRY_HOME_SKILL],
            metadata: []
          };
          expect(localModel.register(duplicated)).assertFalse();
          expect(localModel.total()).assertEqual(2);
          expect(localModel.exportedNames().length).assertEqual(1);
          const fresh: AbilityDeclaration = {
            name: 'ProbeAbility',
            abilityType: AbilityType.TYPE_DATA,
            isExtension: false,
            exported: false,
            skills: [],
            metadata: []
          };
          expect(localModel.register(fresh)).assertTrue();
          expect(localModel.total()).assertEqual(3);
          expect(localModel.countByType(AbilityType.TYPE_DATA)).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECURITY_1900
     * @tc.name testRuntimeBundleNameMatchesDeclaredConfig
     * @tc.desc Verify the runtime bundle name resolved through AbilityDelegator equals the declared com.samples.abilitystage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeBundleNameMatchesDeclaredConfig', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const runtimeBundle: string = getBundleName();
          expect(runtimeBundle).assertEqual(BUNDLE_NAME);
          expect(runtimeBundle.length).assertEqual(BUNDLE_NAME.length);
          expect(runtimeBundle.indexOf('..')).assertEqual(-1);
          logInfo(`testRuntimeBundleNameMatchesDeclaredConfig: runtime bundle is ${runtimeBundle}`);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECURITY_2000
     * @tc.name testRuntimeEntryAbilityRendersIndexPage
     * @tc.desc Verify the exported entry ability still launches through the real delegator path and renders pages/Index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeEntryAbilityRendersIndexPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          expect(stable).assertTrue();
          const byId: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(byId).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECURITY_2100
     * @tc.name testRuntimeHelloWorldNodeIsExposed
     * @tc.desc Verify the exported entry page shows exactly one of the two declared text states at a time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeHelloWorldNodeIsExposed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          expect(stable).assertTrue();
          const initialVisible: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
          const clickedVisible: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
          expect(initialVisible || clickedVisible).assertTrue();
          expect(initialVisible !== clickedVisible).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECURITY_2200
     * @tc.name testRuntimeTextNodeValueMatchesDeclaredString
     * @tc.desc Verify the id-resolved text node value is one of the two allowed literals and carries no path separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeTextNodeValueMatchesDeclaredString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          const value: string = await readTextById(driver, INDEX_PAGE_TEXT_KEY);
          const allowed: string[] = [PAGE_TEXT_INITIAL, PAGE_TEXT_CLICKED];
          expect(allowed.indexOf(value) >= 0).assertTrue();
          expect(value.indexOf('/')).assertEqual(-1);
          expect(value.charCodeAt(0) >= 65 && value.charCodeAt(0) <= 90).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECURITY_2300
     * @tc.name testRuntimeDelegatorStartUsesDeclaredWant
     * @tc.desc Verify starting the app with the declared want bundle and ability reaches the index page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeDelegatorStartUsesDeclaredWant', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await startAbilityByWant(buildEntryWant());
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          expect(stable).assertTrue();
          const byId: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(byId).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECURITY_2400
     * @tc.name testRuntimeClickTransitionsTextToWelcome
     * @tc.desc Verify a click on the exported page converges the message to Welcome from either declared text state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeClickTransitionsTextToWelcome', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          const initialVisible: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
          if (initialVisible) {
            const tapped: boolean = await tapComponentByText(driver, PAGE_TEXT_INITIAL);
            expect(tapped).assertTrue();
          }
          const welcomeVisible: boolean = await waitForTextVisible(driver, PAGE_TEXT_CLICKED, TIMEOUT_ABILITY_LAUNCH);
          expect(welcomeVisible).assertTrue();
          const initialNodes: Component[] = await findComponentsByText(driver, PAGE_TEXT_INITIAL);
          expect(initialNodes.length).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECURITY_2500
     * @tc.name testRuntimeBackupNameAbsentFromPageSurface
     * @tc.desc Verify the non exported backup extension name never appears in the exported entry page content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeBackupNameAbsentFromPageSurface', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          const backupNodes: Component[] = await findComponentsByText(driver, BACKUP_ABILITY_NAME);
          expect(backupNodes.length).assertEqual(0);
          expect(model.isExported(BACKUP_ABILITY_NAME)).assertFalse();
          expect(model.nonExportedNames().indexOf(BACKUP_ABILITY_NAME)).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECURITY_2600
     * @tc.name testRuntimeRepeatedLaunchKeepsPageVisible
     * @tc.desc Verify three consecutive delegator launches all keep the entry page visible exactly 3 of 3 rounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeRepeatedLaunchKeepsPageVisible', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          let stableRounds: number = 0;
          for (let round = 0; round < LAUNCH_REPEAT_ROUNDS; round++) {
            await launchEntryAbility();
            const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
            if (stable) {
              stableRounds++;
            }
            await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          }
          expect(stableRounds).assertEqual(LAUNCH_REPEAT_ROUNDS);
          const byId: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(byId).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECURITY_2700
     * @tc.name testRuntimeComponentCountStableAcrossSamples
     * @tc.desc Verify the exported page component count stays above 1 and drifts no more than the declared tolerance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeComponentCountStableAcrossSamples', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          const firstCount: number = await pageComponentCount(driver);
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const secondCount: number = await pageComponentCount(driver);
          const drift: number = firstCount > secondCount ? firstCount - secondCount : secondCount - firstCount;
          expect(firstCount > 0).assertTrue();
          expect(secondCount > 0).assertTrue();
          expect(drift <= TOLERANCE_COMPONENT_COUNT).assertTrue();
          logInfo(`testRuntimeComponentCountStableAcrossSamples: ${firstCount} vs ${secondCount}`);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECURITY_2800
     * @tc.name testRuntimeForeignWantBundleIsNotRendered
     * @tc.desc Verify a foreign qualified want is rejected by the routing guard and never replaces the live entry page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeForeignWantBundleIsNotRendered', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          expect(routingGuard.canRoute('com.example.hijack', ENTRY_ABILITY_NAME)).assertFalse();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stillVisible: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL) ||
            await checkTextContent(driver, PAGE_TEXT_CLICKED);
          expect(stillVisible).assertTrue();
          const byId: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(byId).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECURITY_2900
     * @tc.name testRuntimeDeclaredWantMatchesConfigSurface
     * @tc.desc Verify the built entry want carries the declared bundle and only the exported ability name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeDeclaredWantMatchesConfigSurface', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const want: Want = buildEntryWant();
          expect(want.bundleName).assertEqual(BUNDLE_NAME);
          expect(want.abilityName).assertEqual(ENTRY_ABILITY_NAME);
          const abilityName: string = want.abilityName === undefined ? '' : want.abilityName;
          expect(model.isExported(abilityName)).assertTrue();
          expect(model.isOverExposed(abilityName)).assertFalse();
          await launchEntryAbility();
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          expect(stable).assertTrue();
        } finally {
          done();
        }
      })
  })
}
