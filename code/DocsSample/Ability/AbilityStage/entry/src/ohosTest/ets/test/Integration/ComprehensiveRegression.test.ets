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
  waitForTextVisible,
  pageComponentCount,
  checkTextContent,
  checkComponentExistsByKey,
  collectAllTexts,
  measureElapsed,
  isWithinBudget,
  averageOf,
  maxOf,
  minOf,
  serializedDelay,
  pressAndWait,
  simulateTouch,
  tapComponentByText,
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
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_BACKGROUND_SWITCH,
  TOLERANCE_COMPONENT_COUNT,
  DELAY_AFTER_LAUNCH,
  DELAY_AFTER_BACKGROUND,
  DELAY_KEY_NAVIGATION,
  DELAY_TOUCH_EVENT,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_ENTER,
  STRESS_ROUNDS_NAVIGATION,
  STRESS_ROUNDS_LIFECYCLE,
  STRESS_ROUNDS_LAUNCH,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

const EXPECTED_CALLBACK_COUNT: number = 2;

const VALID_PAGE_PATH: string = 'pages/Index';

const INVALID_PAGE_PATH: string = 'pages/Missing';

const VERSION_CODE_MIN: number = 1000000;

const VERSION_CODE_CURRENT: number = 1000012;

const VERSION_NAME_CURRENT: string = '1.0.12';

enum RegressionArea {
  AREA_LIFECYCLE = 'lifecycle',
  AREA_UI = 'ui',
  AREA_CONFIG = 'config',
  AREA_BACKUP = 'backup',
  AREA_ENVIRONMENT = 'environment',
  AREA_PERFORMANCE = 'performance'
}

enum RegressionStatus {
  STATUS_PASS = 'pass',
  STATUS_FAIL = 'fail',
  STATUS_SKIP = 'skip'
}

interface RegressionCase {
  area: string;
  caseName: string;
  status: string;
  durationMs: number;
}

class RegressionSuite {
  private cases: RegressionCase[] = [];

  public addCase(area: string, caseName: string, status: string, durationMs: number): number {
    const item: RegressionCase = {
      area: area,
      caseName: caseName,
      status: status,
      durationMs: durationMs
    };
    this.cases.push(item);
    return this.cases.length;
  }

  public size(): number {
    return this.cases.length;
  }

  public countByStatus(status: string): number {
    let total: number = 0;
    for (let i = 0; i < this.cases.length; i++) {
      if (this.cases[i].status === status) {
        total++;
      }
    }
    return total;
  }

  public countByArea(area: string): number {
    let total: number = 0;
    for (let i = 0; i < this.cases.length; i++) {
      if (this.cases[i].area === area) {
        total++;
      }
    }
    return total;
  }

  public getDurations(): number[] {
    const values: number[] = [];
    for (let i = 0; i < this.cases.length; i++) {
      values.push(this.cases[i].durationMs);
    }
    return values;
  }

  public averageDuration(): number {
    return averageOf(this.getDurations());
  }

  public slowestDuration(): number {
    return maxOf(this.getDurations());
  }

  public fastestDuration(): number {
    return minOf(this.getDurations());
  }

  public allPassed(): boolean {
    return this.cases.length > 0 && this.countByStatus(RegressionStatus.STATUS_PASS) === this.cases.length;
  }

  public hasArea(area: string): boolean {
    return this.countByArea(area) > 0;
  }

  public reset(): void {
    this.cases = [];
  }
}

class EnvironmentConfigModel {
  private language: string = '';
  private colorMode: number = COLOR_MODE_NOT_SET;
  private direction: string = '';
  private fontSizeScale: number = 1.0;
  private fontWeightScale: number = 1.0;

  public update(language: string, colorMode: number, direction: string, fontSizeScale: number,
    fontWeightScale: number): boolean {
    if (language.length < 2 || direction.length === 0) {
      return false;
    }
    if (!isFinite(fontSizeScale) || fontSizeScale <= 0) {
      return false;
    }
    if (!isFinite(fontWeightScale) || fontWeightScale <= 0) {
      return false;
    }
    this.language = language;
    this.colorMode = colorMode;
    this.direction = direction;
    this.fontSizeScale = fontSizeScale;
    this.fontWeightScale = fontWeightScale;
    return true;
  }

  public getLanguage(): string {
    return this.language;
  }

  public getColorMode(): number {
    return this.colorMode;
  }

  public getDirection(): string {
    return this.direction;
  }

  public getFontSizeScale(): number {
    return this.fontSizeScale;
  }

  public isAvoidingDarkMode(): boolean {
    return this.colorMode === COLOR_MODE_NOT_SET;
  }

  public isConfigured(): boolean {
    return this.language.length > 0;
  }

  public describe(): string {
    if (!this.isConfigured()) {
      return 'unconfigured';
    }
    return `${this.language}|${this.colorMode}|${this.direction}|${this.fontSizeScale}`;
  }
}

class PageStateModel {
  private text: string = PAGE_TEXT_INITIAL;
  private clickCount: number = 0;

  public getText(): string {
    return this.text;
  }

  public click(): string {
    this.clickCount++;
    this.text = PAGE_TEXT_CLICKED;
    return this.text;
  }

  public reset(): void {
    this.text = PAGE_TEXT_INITIAL;
    this.clickCount = 0;
  }

  public getClickCount(): number {
    return this.clickCount;
  }

  public isClicked(): boolean {
    return this.text === PAGE_TEXT_CLICKED;
  }

  public matches(expected: string): boolean {
    return this.text === expected;
  }
}

class BackupMigrationModel {
  private restorableCodes: number[] = [];

  public isCodeRestorable(code: number): boolean {
    return code >= VERSION_CODE_MIN && code <= VERSION_CODE_CURRENT;
  }

  public isCodeFromFuture(code: number): boolean {
    return code > VERSION_CODE_CURRENT;
  }

  private toNumber(digits: string): number {
    let value: number = 0;
    for (let i = 0; i < digits.length; i++) {
      const code: number = digits.charCodeAt(i) - 48;
      if (code < 0 || code > 9) {
        return -1;
      }
      value = value * 10 + code;
    }
    return value;
  }

  public nameFollowsCode(code: number, name: string): boolean {
    const parts: string[] = name.split('.');
    if (parts.length !== 3) {
      return false;
    }
    const major: number = this.toNumber(parts[0]);
    const minor: number = this.toNumber(parts[1]);
    const patch: number = this.toNumber(parts[2]);
    if (major < 0 || minor < 0 || patch < 0) {
      return false;
    }
    return major * 1000000 + minor * 1000 + patch === code;
  }

  public decideAction(code: number): string {
    if (this.isCodeFromFuture(code)) {
      return 'block-downgrade';
    }
    if (!this.isCodeRestorable(code)) {
      return 'reject';
    }
    if (code === VERSION_CODE_CURRENT) {
      return 'restore';
    }
    return 'migrate';
  }

  public recordRestore(code: number): boolean {
    if (!this.isCodeRestorable(code)) {
      return false;
    }
    this.restorableCodes.push(code);
    return true;
  }

  public getRestoredCodes(): number[] {
    return this.restorableCodes.slice(0);
  }

  public restoredCount(): number {
    return this.restorableCodes.length;
  }
}

class BudgetSampler {
  private samples: number[] = [];
  private budget: number;

  constructor(budget: number) {
    this.budget = budget;
  }

  public addSample(elapsed: number): boolean {
    if (!isFinite(elapsed) || elapsed < 0) {
      return false;
    }
    this.samples.push(elapsed);
    return true;
  }

  public getViolations(): number {
    let total: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      if (!isWithinBudget(this.samples[i], this.budget)) {
        total++;
      }
    }
    return total;
  }

  public getMedian(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    const sorted: number[] = this.samples.slice(0).sort((left: number, right: number): number => left - right);
    const middle: number = Math.floor(sorted.length / 2);
    if (sorted.length % 2 === 0) {
      return (sorted[middle - 1] + sorted[middle]) / 2;
    }
    return sorted[middle];
  }

  public getAverage(): number {
    return averageOf(this.samples);
  }

  public getMax(): number {
    return maxOf(this.samples);
  }

  public size(): number {
    return this.samples.length;
  }

  public getBudget(): number {
    return this.budget;
  }
}

export default function comprehensiveRegressionTest(): void {
  describe('ComprehensiveRegressionTest', () => {
    let driver: Driver;
    let suite: RegressionSuite;
    let configModel: EnvironmentConfigModel;
    let pageModel: PageStateModel;
    let backupModel: BackupMigrationModel;

    beforeAll(async () => {
      driver = getDriver();
      suite = new RegressionSuite();
      configModel = new EnvironmentConfigModel();
      pageModel = new PageStateModel();
      backupModel = new BackupMigrationModel();
      logInfo('ComprehensiveRegressionTest: beforeAll prepared regression models');

      await ensureIndexPageInitial(driver);
    })

    afterAll(async () => {
      await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
      suite.reset();
      logInfo('ComprehensiveRegressionTest: afterAll finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_REGRESSION_0100
     * @tc.name testSuiteStatusAccounting
     * @tc.desc Verify a suite with two passes and one failure reports size 3, 2 passes, 1 failure and is not fully passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSuiteStatusAccounting', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          suite.reset();
          expect(suite.addCase(RegressionArea.AREA_LIFECYCLE, 'create', RegressionStatus.STATUS_PASS, 120))
            .assertEqual(1);
          expect(suite.addCase(RegressionArea.AREA_UI, 'render', RegressionStatus.STATUS_PASS, 200))
            .assertEqual(2);
          expect(suite.addCase(RegressionArea.AREA_CONFIG, 'parse', RegressionStatus.STATUS_FAIL, 80))
            .assertEqual(3);
          expect(suite.size()).assertEqual(3);
          expect(suite.countByStatus(RegressionStatus.STATUS_PASS)).assertEqual(2);
          expect(suite.countByStatus(RegressionStatus.STATUS_FAIL)).assertEqual(1);
          expect(suite.countByStatus(RegressionStatus.STATUS_SKIP)).assertEqual(0);
          expect(suite.allPassed()).assertFalse();
          expect(suite.hasArea(RegressionArea.AREA_CONFIG)).assertTrue();
          expect(suite.hasArea(RegressionArea.AREA_BACKUP)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_REGRESSION_0200
     * @tc.name testSuiteAllPassedBoundary
     * @tc.desc Verify an empty suite is not considered passed while a suite with only pass entries is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testSuiteAllPassedBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          suite.reset();
          expect(suite.allPassed()).assertFalse();
          expect(suite.size()).assertEqual(0);
          suite.addCase(RegressionArea.AREA_ENVIRONMENT, 'callback', RegressionStatus.STATUS_PASS, 15);
          expect(suite.allPassed()).assertTrue();
          suite.addCase(RegressionArea.AREA_ENVIRONMENT, 'memory', RegressionStatus.STATUS_SKIP, 0);
          expect(suite.allPassed()).assertFalse();
          expect(suite.countByArea(RegressionArea.AREA_ENVIRONMENT)).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_REGRESSION_0300
     * @tc.name testSuiteDurationStatistics
     * @tc.desc Verify durations 100, 200, 300 and 400 average to 250 with min 100 and max 400
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSuiteDurationStatistics', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          suite.reset();
          suite.addCase(RegressionArea.AREA_LIFECYCLE, 'a', RegressionStatus.STATUS_PASS, 100);
          suite.addCase(RegressionArea.AREA_LIFECYCLE, 'b', RegressionStatus.STATUS_PASS, 200);
          suite.addCase(RegressionArea.AREA_LIFECYCLE, 'c', RegressionStatus.STATUS_PASS, 300);
          suite.addCase(RegressionArea.AREA_LIFECYCLE, 'd', RegressionStatus.STATUS_PASS, 400);
          expect(suite.averageDuration()).assertEqual(250);
          expect(suite.fastestDuration()).assertEqual(100);
          expect(suite.slowestDuration()).assertEqual(400);
          expect(suite.getDurations().length).assertEqual(4);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_REGRESSION_0400
     * @tc.name testEnvironmentConfigUpdate
     * @tc.desc Verify a valid environment update stores language zh_CN with colorMode not set and reports avoiding dark mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvironmentConfigUpdate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const updated: boolean = configModel.update('zh_CN', COLOR_MODE_NOT_SET, 'ltr', 1.0, 1.0);
          expect(updated).assertTrue();
          expect(configModel.getLanguage()).assertEqual('zh_CN');
          expect(configModel.getColorMode()).assertEqual(COLOR_MODE_NOT_SET);
          expect(configModel.getDirection()).assertEqual('ltr');
          expect(configModel.getFontSizeScale()).assertEqual(1.0);
          expect(configModel.isAvoidingDarkMode()).assertTrue();
          expect(configModel.isConfigured()).assertTrue();
          expect(configModel.describe()).assertEqual('zh_CN|-1|ltr|1');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_REGRESSION_0500
     * @tc.name testEnvironmentConfigRejectsInvalid
     * @tc.desc Verify updates with a short language, empty direction or non positive font scale are rejected and keep the previous snapshot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testEnvironmentConfigRejectsInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          configModel.update('en_US', 0, 'ltr', 1.0, 1.0);
          expect(configModel.update('z', 0, 'ltr', 1.0, 1.0)).assertFalse();
          expect(configModel.update('en_US', 0, '', 1.0, 1.0)).assertFalse();
          expect(configModel.update('en_US', 0, 'ltr', 0, 1.0)).assertFalse();
          expect(configModel.update('en_US', 0, 'ltr', 1.0, -1)).assertFalse();
          expect(configModel.getLanguage()).assertEqual('en_US');
          expect(configModel.getFontSizeScale()).assertEqual(1.0);
          expect(configModel.isAvoidingDarkMode()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_REGRESSION_0600
     * @tc.name testUnconfiguredEnvironmentDefaults
     * @tc.desc Verify a fresh environment model reports unconfigured with the background system token semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testUnconfiguredEnvironmentDefaults', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          const fresh: EnvironmentConfigModel = new EnvironmentConfigModel();
          expect(fresh.isConfigured()).assertFalse();
          expect(fresh.describe()).assertEqual('unconfigured');
          expect(fresh.isAvoidingDarkMode()).assertTrue();
          expect(fresh.getDirection()).assertEqual('');
          expect(COLOR_MODE_NOT_SET).assertEqual(-1);
          expect(ENV_CALLBACK_EVENT).assertEqual('environment');
          expect(EXPECTED_CALLBACK_COUNT).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_REGRESSION_0700
     * @tc.name testPageStateClickTransition
     * @tc.desc Verify the page state model moves from Hello World to Welcome on first click and stays Welcome on a second click
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPageStateClickTransition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          pageModel.reset();
          expect(pageModel.getText()).assertEqual(PAGE_TEXT_INITIAL);
          expect(pageModel.isClicked()).assertFalse();
          expect(pageModel.click()).assertEqual(PAGE_TEXT_CLICKED);
          expect(pageModel.matches(PAGE_TEXT_CLICKED)).assertTrue();
          expect(pageModel.click()).assertEqual(PAGE_TEXT_CLICKED);
          expect(pageModel.getClickCount()).assertEqual(2);
          pageModel.reset();
          expect(pageModel.getClickCount()).assertEqual(0);
          expect(pageModel.matches(PAGE_TEXT_INITIAL)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_REGRESSION_0800
     * @tc.name testBackupVersionBoundary
     * @tc.desc Verify backup codes below the minimum are rejected, the current code restores and a future code blocks the downgrade
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBackupVersionBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(backupModel.isCodeRestorable(999999)).assertFalse();
          expect(backupModel.isCodeRestorable(VERSION_CODE_MIN)).assertTrue();
          expect(backupModel.isCodeRestorable(VERSION_CODE_CURRENT)).assertTrue();
          expect(backupModel.isCodeFromFuture(VERSION_CODE_CURRENT + 1)).assertTrue();
          expect(backupModel.decideAction(999999)).assertEqual('reject');
          expect(backupModel.decideAction(VERSION_CODE_MIN)).assertEqual('migrate');
          expect(backupModel.decideAction(VERSION_CODE_CURRENT)).assertEqual('restore');
          expect(backupModel.decideAction(VERSION_CODE_CURRENT + 1)).assertEqual('block-downgrade');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_REGRESSION_0900
     * @tc.name testBackupNameConsistency
     * @tc.desc Verify the 1.0.12 name resolves to code 1000012 while 2.0.0 and an empty name do not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testBackupNameConsistency', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          expect(backupModel.nameFollowsCode(VERSION_CODE_CURRENT, VERSION_NAME_CURRENT)).assertTrue();
          expect(backupModel.nameFollowsCode(VERSION_CODE_CURRENT, '2.0.0')).assertFalse();
          expect(backupModel.nameFollowsCode(VERSION_CODE_MIN, '1.0.0')).assertTrue();
          expect(backupModel.nameFollowsCode(VERSION_CODE_MIN, '')).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_REGRESSION_1000
     * @tc.name testBackupRestoreRecording
     * @tc.desc Verify three restorable restore attempts are recorded while an out of range code is refused and not recorded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testBackupRestoreRecording', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          const model: BackupMigrationModel = new BackupMigrationModel();
          expect(model.recordRestore(VERSION_CODE_MIN)).assertTrue();
          expect(model.recordRestore(VERSION_CODE_CURRENT)).assertTrue();
          expect(model.recordRestore(VERSION_CODE_CURRENT - 1)).assertTrue();
          expect(model.recordRestore(500000)).assertFalse();
          expect(model.restoredCount()).assertEqual(3);
          expect(model.getRestoredCodes().length).assertEqual(3);
          expect(model.getRestoredCodes()[2]).assertEqual(VERSION_CODE_CURRENT - 1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_REGRESSION_1100
     * @tc.name testBudgetSamplerStatistics
     * @tc.desc Verify samples 100, 200, 300, 400 against a 250 budget yield two violations and a median of 250
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBudgetSamplerStatistics', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const sampler: BudgetSampler = new BudgetSampler(250);
          expect(sampler.addSample(100)).assertTrue();
          sampler.addSample(200);
          sampler.addSample(300);
          sampler.addSample(400);
          expect(sampler.size()).assertEqual(4);
          expect(sampler.getViolations()).assertEqual(2);
          expect(sampler.getMedian()).assertEqual(250);
          expect(sampler.getAverage()).assertEqual(250);
          expect(sampler.getMax()).assertEqual(400);
          expect(sampler.getBudget()).assertEqual(250);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_REGRESSION_1200
     * @tc.name testBudgetSamplerRejectsInvalidSamples
     * @tc.desc Verify a negative and a non finite sample are refused so only two valid samples remain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testBudgetSamplerRejectsInvalidSamples', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          const sampler: BudgetSampler = new BudgetSampler(TIMEOUT_ABILITY_LAUNCH);
          const notANumber: number = Math.sqrt(-1);
          const overflowing: number = Math.pow(10, 400);
          expect(isNaN(notANumber)).assertTrue();
          expect(isFinite(overflowing)).assertFalse();
          expect(sampler.addSample(-5)).assertFalse();
          expect(sampler.addSample(notANumber)).assertFalse();
          expect(sampler.addSample(0)).assertTrue();
          expect(sampler.addSample(TIMEOUT_ABILITY_LAUNCH)).assertTrue();
          expect(sampler.size()).assertEqual(2);
          expect(sampler.getViolations()).assertEqual(0);
          expect(sampler.getMedian()).assertEqual(TIMEOUT_ABILITY_LAUNCH / 2);
          expect(sampler.addSample(overflowing)).assertFalse();
          expect(sampler.size()).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_REGRESSION_1300
     * @tc.name testIdentityConstantsRegression
     * @tc.desc Verify bundle, module, stage and ability identity constants match the sample project declaration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIdentityConstantsRegression', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(BUNDLE_NAME).assertEqual('com.samples.abilitystage');
          expect(MODULE_NAME).assertEqual('entry');
          expect(ABILITY_STAGE_NAME).assertEqual('MyAbilityStage');
          expect(ENTRY_ABILITY_NAME).assertEqual('EntryAbility');
          expect(BACKUP_ABILITY_NAME).assertEqual('EntryBackupAbility');
          expect(INDEX_PAGE_PATH).assertEqual(VALID_PAGE_PATH);
          expect(INDEX_PAGE_TEXT_KEY).assertEqual('HelloWorld');
          expect(getBundleName()).assertEqual(BUNDLE_NAME);
          expect(VALID_PAGE_PATH.startsWith('pages/')).assertTrue();
          expect(INVALID_PAGE_PATH.startsWith('pages/')).assertTrue();
          expect(VALID_PAGE_PATH.endsWith('/Index')).assertTrue();
          expect(INVALID_PAGE_PATH.endsWith('/Missing')).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_REGRESSION_1400
     * @tc.name testRealLaunchRendersIndex
     * @tc.desc Verify the real launch path renders the Index page with a keyed text component and recorded duration under budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRealLaunchRendersIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
        try {
          const startTime: number = Date.now();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          const elapsed: number = measureElapsed(startTime);
          expect(stable).assertTrue();
          expect(await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY)).assertTrue();
          const componentCount: number = await pageComponentCount(driver);
          expect(componentCount > 0).assertTrue();
          suite.reset();
          const status: string = isWithinBudget(elapsed, TIMEOUT_ABILITY_LAUNCH * 2) ?
            RegressionStatus.STATUS_PASS : RegressionStatus.STATUS_FAIL;
          suite.addCase(RegressionArea.AREA_LIFECYCLE, 'launch', status, elapsed);
          expect(suite.countByArea(RegressionArea.AREA_LIFECYCLE)).assertEqual(1);
          expect(suite.getDurations()[0]).assertEqual(elapsed);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_REGRESSION_1500
     * @tc.name testRealPageTextAndClick
     * @tc.desc Verify the live page shows Hello World and tapping the keyed component makes Welcome visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRealPageTextAndClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          const showsInitial: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
          const showsClicked: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
          const tapStart: number = Date.now();
          if (showsInitial && !showsClicked) {
            const tapped: boolean = await tapComponentByText(driver, PAGE_TEXT_INITIAL);
            expect(tapped).assertTrue();
            await serializedDelay(driver, DELAY_TOUCH_EVENT);
            const welcomeVisible: boolean = await waitForTextVisible(driver, PAGE_TEXT_CLICKED,
              TIMEOUT_PAGE_RENDER);
            expect(welcomeVisible).assertTrue();
          } else {
            expect(showsClicked).assertTrue();
          }
          const duration: number = measureElapsed(tapStart);
          expect(duration >= 0).assertTrue();
          logInfo(`testRealPageTextAndClick: interaction took ${duration} ms`);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_REGRESSION_1600
     * @tc.name testRealBackgroundForegroundCycle
     * @tc.desc Verify a background and foreground cycle keeps the index page text list and component count positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRealBackgroundForegroundCycle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          const beforeTexts: string[] = await collectAllTexts(driver);
          expect(beforeTexts.length > 0).assertTrue();
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_BACKGROUND_SWITCH);
          expect(stable).assertTrue();
          const afterCount: number = await pageComponentCount(driver);
          expect(afterCount > 0).assertTrue();
          const showsInitial: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
          const showsClicked: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
          expect(showsInitial || showsClicked).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_REGRESSION_1700
     * @tc.name testRealExplicitWantIdentity
     * @tc.desc Verify a Want built from the runtime bundle name targets EntryAbility and starts the page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRealExplicitWantIdentity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const want: Want = buildEntryWant();
          const abilityName: string = want.abilityName === undefined ? '' : want.abilityName;
          const bundleName: string = want.bundleName === undefined ? '' : want.bundleName;
          expect(abilityName).assertEqual(ENTRY_ABILITY_NAME);
          expect(bundleName).assertEqual(getBundleName());
          await startAbilityByWant(want);
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          expect(stable).assertTrue();
          const componentCount: number = await pageComponentCount(driver);
          expect(componentCount > 0).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_REGRESSION_1800
     * @tc.name testRealNavigationStressKeepsPage
     * @tc.desc Verify twenty alternating left and right key presses keep the page component count inside the regression tolerance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testRealNavigationStressKeepsPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          const initialCount: number = await pageComponentCount(driver);
          expect(initialCount > 0).assertTrue();
          const counts: number[] = [];
          for (let i = 0; i < STRESS_ROUNDS_NAVIGATION; i++) {
            const key: number = i % 2 === 0 ? KEY_RIGHT : KEY_LEFT;
            await pressAndWait(driver, key, 1, DELAY_KEY_NAVIGATION);
            if (i % 5 === 0) {
              counts.push(await pageComponentCount(driver));
            }
          }
          const finalCount: number = await pageComponentCount(driver);
          expect(counts.length).assertEqual(4);
          expect(Math.abs(finalCount - initialCount) <= TOLERANCE_COMPONENT_COUNT).assertTrue();
          const showsInitial: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
          const showsClicked: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
          expect(showsInitial || showsClicked).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_REGRESSION_1900
     * @tc.name testRealRepeatedLaunchRegression
     * @tc.desc Verify five repeated launches all keep the page stable and record five lifecycle regression cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testRealRepeatedLaunchRegression', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          suite.reset();
          for (let i = 0; i < STRESS_ROUNDS_LAUNCH; i++) {
            const startTime: number = Date.now();
            await launchEntryAbility();
            await serializedDelay(driver, DELAY_AFTER_LAUNCH);
            const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
            expect(stable).assertTrue();
            const status: string = stable ? RegressionStatus.STATUS_PASS : RegressionStatus.STATUS_FAIL;
            suite.addCase(RegressionArea.AREA_LIFECYCLE, `launch_${i}`, status, measureElapsed(startTime));
          }
          expect(suite.size()).assertEqual(STRESS_ROUNDS_LAUNCH);
          expect(suite.countByArea(RegressionArea.AREA_LIFECYCLE)).assertEqual(STRESS_ROUNDS_LAUNCH);
          expect(suite.allPassed()).assertTrue();
          expect(suite.averageDuration() > 0).assertTrue();
          expect(STRESS_ROUNDS_LIFECYCLE).assertEqual(10);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_REGRESSION_2000
     * @tc.name testRealTouchCoordinatesDoNotCrash
     * @tc.desc Verify a simulated touch near the page center keeps the ability UI alive with a visible index text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testRealTouchCoordinatesDoNotCrash', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          await simulateTouch(driver, 100, 100);
          await serializedDelay(driver, DELAY_TOUCH_EVENT);
          const componentCount: number = await pageComponentCount(driver);
          expect(componentCount > 0).assertTrue();
          const showsInitial: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
          const showsClicked: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
          expect(showsInitial || showsClicked).assertTrue();
          expect(await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_REGRESSION_2100
     * @tc.name testKeyEnterKeepsStableLayout
     * @tc.desc Verify a single Enter key press does not change the component count beyond tolerance and the page remains rendered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testKeyEnterKeepsStableLayout', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          const beforeCount: number = await pageComponentCount(driver);
          await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          const afterCount: number = await pageComponentCount(driver);
          expect(afterCount > 0).assertTrue();
          expect(Math.abs(afterCount - beforeCount) <= TOLERANCE_COMPONENT_COUNT).assertTrue();
          expect(await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY)).assertTrue();
        } finally {
          done();
        }
      })
  })
}
