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
  pressAndWait,
  pressBackAndWait,
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
  isNonEmptyString,
  INDEX_PAGE_TEXT_KEY,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  ABILITY_STAGE_NAME,
  ENTRY_ABILITY_NAME,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION,
  DELAY_AFTER_LAUNCH,
  DELAY_AFTER_BACKGROUND,
  STRESS_ROUNDS_LIFECYCLE,
  KEY_ENTER,
  KEY_TAB,
  KEY_HOME,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

enum StageLifecycleEvent {
  EVENT_CREATE = 'onCreate',
  EVENT_ACCEPT_WANT = 'onAcceptWant',
  EVENT_DESTROY = 'onDestroy',
  EVENT_CONFIGURATION_UPDATED = 'onConfigurationUpdated',
  EVENT_MEMORY_LEVEL = 'onMemoryLevel'
}

enum LaunchReason {
  LAUNCH_REASON_SPAWN = 0,
  LAUNCH_REASON_ACTIVE = 1,
  LAUNCH_REASON_UNKNOWN = -1
}

enum StageState {
  STATE_IDLE = 0,
  STATE_CREATED = 1,
  STATE_FOREGROUND = 2,
  STATE_BACKGROUND = 3,
  STATE_DESTROYED = 4
}

enum CallbackRegistrationResult {
  RESULT_REGISTERED = 0,
  RESULT_DUPLICATE = 1,
  RESULT_REJECTED = 2
}

enum AcceptWantMode {
  MODE_UNDEFINED = 'undefined',
  MODE_MULTITON = 'multiton',
  MODE_SPECIFIED = 'specified',
  MODE_SINGLETON = 'singleton'
}

const EVENT_ENVIRONMENT: string = 'environment';

const SPECIFIED_STAGE_ID: string = 'MyAbilityStage';

const VALID_EVENT_NAMES: string[] = [
  'onCreate', 'onAcceptWant', 'onDestroy', 'onConfigurationUpdated', 'onMemoryLevel', 'environment'
];

interface WantInit {
  bundleName: string;
  abilityName: string;
  moduleName: string;
  parameters: Map<string, string>;
}

interface ConfigFieldProbe {
  fieldIndex: number;
  changed: boolean;
}

class WantModel {
  public bundleName: string;
  public abilityName: string;
  public moduleName: string;
  public parameters: Map<string, string>;

  constructor(init: WantInit) {
    this.bundleName = init.bundleName;
    this.abilityName = init.abilityName;
    this.moduleName = init.moduleName;
    this.parameters = init.parameters;
  }

  public static createEntryWant(): WantModel {
    const parameters: Map<string, string> = new Map<string, string>();
    const init: WantInit = {
      bundleName: 'com.samples.abilitystage',
      abilityName: 'EntryAbility',
      moduleName: 'entry',
      parameters: parameters
    };
    return new WantModel(init);
  }

  public static createSpecifiedWant(): WantModel {
    const parameters: Map<string, string> = new Map<string, string>();
    parameters.set('ohos.aafwk.param.callerAbilityName', 'EntryAbility');
    parameters.set('ability.params.launchReason', 'specified');
    const init: WantInit = {
      bundleName: 'com.samples.abilitystage',
      abilityName: 'EntryAbility',
      moduleName: 'entry',
      parameters: parameters
    };
    return new WantModel(init);
  }

  public static createEmptyWant(): WantModel {
    const parameters: Map<string, string> = new Map<string, string>();
    const init: WantInit = {
      bundleName: '',
      abilityName: '',
      moduleName: '',
      parameters: parameters
    };
    return new WantModel(init);
  }

  public hasBundleName(): boolean {
    return this.bundleName.length > 0;
  }

  public hasAbilityName(): boolean {
    return this.abilityName.length > 0;
  }

  public hasModuleName(): boolean {
    return this.moduleName.length > 0;
  }

  public hasParameter(key: string): boolean {
    return this.parameters.has(key);
  }

  public getParameter(key: string): string {
    const value: string | undefined = this.parameters.get(key);
    if (value === undefined) {
      return '';
    }
    return value;
  }

  public getParameterCount(): number {
    return this.parameters.size;
  }

  public isComplete(): boolean {
    return this.hasBundleName() && this.hasAbilityName() && this.hasModuleName();
  }

  public matchesBundle(bundleName: string): boolean {
    return this.bundleName === bundleName;
  }

  public toString(): string {
    return `WantModel{bundle: ${this.bundleName}, ability: ${this.abilityName}, module: ${this.moduleName}, ` +
      `params: ${this.parameters.size}}`;
  }
}

class LaunchReasonResolver {
  public static fromCode(code: number): LaunchReason {
    if (code === 0) {
      return LaunchReason.LAUNCH_REASON_SPAWN;
    }
    if (code === 1) {
      return LaunchReason.LAUNCH_REASON_ACTIVE;
    }
    return LaunchReason.LAUNCH_REASON_UNKNOWN;
  }

  public static getName(reason: LaunchReason): string {
    switch (reason) {
      case LaunchReason.LAUNCH_REASON_SPAWN:
        return 'spawn';
      case LaunchReason.LAUNCH_REASON_ACTIVE:
        return 'active';
      default:
        return 'unknown';
    }
  }

  public static isColdStart(reason: LaunchReason): boolean {
    return reason === LaunchReason.LAUNCH_REASON_SPAWN;
  }

  public static isWarmStart(reason: LaunchReason): boolean {
    return reason === LaunchReason.LAUNCH_REASON_ACTIVE;
  }

  public static isValidCode(code: number): boolean {
    return LaunchReasonResolver.fromCode(code) !== LaunchReason.LAUNCH_REASON_UNKNOWN;
  }
}

class AcceptWantMatrix {
  public static resolveMode(launchReason: number, want: WantModel): AcceptWantMode {
    if (launchReason !== LaunchReason.LAUNCH_REASON_SPAWN) {
      return AcceptWantMode.MODE_UNDEFINED;
    }
    if (!want.isComplete()) {
      return AcceptWantMode.MODE_UNDEFINED;
    }
    if (want.hasParameter('ability.params.launchReason')) {
      return AcceptWantMode.MODE_SPECIFIED;
    }
    return AcceptWantMode.MODE_MULTITON;
  }

  public static getStageId(want: WantModel, mode: AcceptWantMode): string {
    if (mode !== AcceptWantMode.MODE_SPECIFIED) {
      return '';
    }
    if (!want.isComplete()) {
      return '';
    }
    return SPECIFIED_STAGE_ID;
  }

  public static isSpecifiedMode(mode: AcceptWantMode): boolean {
    return mode === AcceptWantMode.MODE_SPECIFIED;
  }

  public static describe(mode: AcceptWantMode): string {
    switch (mode) {
      case AcceptWantMode.MODE_SPECIFIED:
        return 'specified';
      case AcceptWantMode.MODE_MULTITON:
        return 'multiton';
      case AcceptWantMode.MODE_SINGLETON:
        return 'singleton';
      default:
        return 'undefined';
    }
  }

  public static countSpecified(cases: AcceptWantMode[]): number {
    return cases.filter((item: AcceptWantMode) => item === AcceptWantMode.MODE_SPECIFIED).length;
  }
}

class LifecycleCallbackRegistry {
  private names: string[] = [];
  private counts: Map<string, number> = new Map<string, number>();

  public register(eventName: string): CallbackRegistrationResult {
    if (!VALID_EVENT_NAMES.includes(eventName)) {
      return CallbackRegistrationResult.RESULT_REJECTED;
    }
    if (this.names.includes(eventName)) {
      const current: number = this.getCount(eventName);
      this.counts.set(eventName, current + 1);
      return CallbackRegistrationResult.RESULT_DUPLICATE;
    }
    this.names.push(eventName);
    this.counts.set(eventName, 1);
    return CallbackRegistrationResult.RESULT_REGISTERED;
  }

  public getCount(eventName: string): number {
    const value: number | undefined = this.counts.get(eventName);
    if (value === undefined) {
      return 0;
    }
    return value;
  }

  public getRegisteredNames(): string[] {
    return [...this.names];
  }

  public getRegisteredCount(): number {
    return this.names.length;
  }

  public contains(eventName: string): boolean {
    return this.names.includes(eventName);
  }

  public unregister(eventName: string): boolean {
    const index: number = this.names.indexOf(eventName);
    if (index < 0) {
      return false;
    }
    this.names.splice(index, 1);
    this.counts.delete(eventName);
    return true;
  }

  public getEnvironmentEventName(): string {
    return EVENT_ENVIRONMENT;
  }

  public static isValidEventName(eventName: string): boolean {
    return VALID_EVENT_NAMES.includes(eventName);
  }

  public static getLifecycleEventCount(): number {
    return 3;
  }

  public static getEnvironmentEventCount(): number {
    return 2;
  }
}

class StageStateMachine {
  private state: StageState = StageState.STATE_IDLE;
  private transitions: string[] = [];
  private acceptWantResults: string[] = [];

  public getState(): StageState {
    return this.state;
  }

  public create(): boolean {
    if (this.state !== StageState.STATE_IDLE) {
      return false;
    }
    this.state = StageState.STATE_CREATED;
    this.transitions.push('create');
    return true;
  }

  public acceptWant(want: WantModel): string {
    if (this.state !== StageState.STATE_CREATED && this.state !== StageState.STATE_BACKGROUND) {
      return '';
    }
    const result: string = want.isComplete() ? SPECIFIED_STAGE_ID : '';
    this.acceptWantResults.push(result);
    return result;
  }

  public enterForeground(): boolean {
    if (this.state !== StageState.STATE_CREATED && this.state !== StageState.STATE_BACKGROUND) {
      return false;
    }
    this.state = StageState.STATE_FOREGROUND;
    this.transitions.push('foreground');
    return true;
  }

  public enterBackground(): boolean {
    if (this.state !== StageState.STATE_FOREGROUND) {
      return false;
    }
    this.state = StageState.STATE_BACKGROUND;
    this.transitions.push('background');
    return true;
  }

  public destroy(): boolean {
    if (this.state === StageState.STATE_DESTROYED || this.state === StageState.STATE_IDLE) {
      return false;
    }
    this.state = StageState.STATE_DESTROYED;
    this.transitions.push('destroy');
    return true;
  }

  public getTransitionCount(): number {
    return this.transitions.length;
  }

  public getTransitionSequence(): string[] {
    return [...this.transitions];
  }

  public getAcceptWantCount(): number {
    return this.acceptWantResults.length;
  }

  public getLastAcceptWantResult(): string {
    if (this.acceptWantResults.length === 0) {
      return '';
    }
    return this.acceptWantResults[this.acceptWantResults.length - 1];
  }

  public isDestroyed(): boolean {
    return this.state === StageState.STATE_DESTROYED;
  }

  public isForeground(): boolean {
    return this.state === StageState.STATE_FOREGROUND;
  }
}

class LifecycleSequenceValidator {
  private expected: string[] = ['create', 'foreground', 'background', 'foreground', 'destroy'];

  public validate(actual: string[]): boolean {
    if (actual.length !== this.expected.length) {
      return false;
    }
    for (let i = 0; i < this.expected.length; i++) {
      if (actual[i] !== this.expected[i]) {
        return false;
      }
    }
    return true;
  }

  public findFirstDivergence(actual: string[]): number {
    const limit: number = Math.min(actual.length, this.expected.length);
    for (let i = 0; i < limit; i++) {
      if (actual[i] !== this.expected[i]) {
        return i;
      }
    }
    if (actual.length === this.expected.length) {
      return -1;
    }
    return limit;
  }

  public getExpectedCount(): number {
    return this.expected.length;
  }

  public getExpectedAt(index: number): string {
    if (index < 0 || index >= this.expected.length) {
      return '';
    }
    return this.expected[index];
  }
}

class ConfigurationDiffEngine {
  public static snapshots: number = 5;

  public static diffMask(base: number[], candidate: number[]): number[] {
    const probes: ConfigFieldProbe[] = [];
    const limit: number = Math.min(base.length, candidate.length);
    for (let i = 0; i < limit; i++) {
      const probe: ConfigFieldProbe = { fieldIndex: i, changed: base[i] !== candidate[i] };
      probes.push(probe);
    }
    const changedIndices: number[] = [];
    for (let i = 0; i < probes.length; i++) {
      if (probes[i].changed) {
        changedIndices.push(probes[i].fieldIndex);
      }
    }
    return changedIndices;
  }

  public static countChanged(base: number[], candidate: number[]): number {
    return ConfigurationDiffEngine.diffMask(base, candidate).length;
  }

  public static sampleCombination(mask: number): number[] {
    const values: number[] = [];
    for (let bit = 0; bit < ConfigurationDiffEngine.snapshots; bit++) {
      if ((mask & (1 << bit)) === 0) {
        values.push(0);
      } else {
        values.push(1);
      }
    }
    return values;
  }

  public static allCombinationsCount(): number {
    return 1 << ConfigurationDiffEngine.snapshots;
  }

  public static countCombinationsWithChanges(changedFields: number): number {
    if (changedFields < 0 || changedFields > ConfigurationDiffEngine.snapshots) {
      return 0;
    }
    if (changedFields === 0) {
      return 1;
    }
    if (changedFields === ConfigurationDiffEngine.snapshots) {
      return 1;
    }
    if (changedFields === 1) {
      return ConfigurationDiffEngine.snapshots;
    }
    if (changedFields === 4) {
      return ConfigurationDiffEngine.snapshots;
    }
    return 10;
  }
}

async function readHelloTextById(driver: Driver): Promise<string> {
  return await runSerializedUiOperation(async (): Promise<string> => {
    const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
    return await component.getText();
  });
}

async function buildRuntimeWant(driver: Driver): Promise<WantModel> {
  const base: Want = buildEntryWant();
  const baseBundle: string = base.bundleName === undefined ? '' : base.bundleName;
  const baseAbility: string = base.abilityName === undefined ? '' : base.abilityName;
  const parameters: Map<string, string> = new Map<string, string>();
  const init: WantInit = {
    bundleName: baseBundle,
    abilityName: baseAbility,
    moduleName: 'entry',
    parameters: parameters
  };
  const model: WantModel = new WantModel(init);
  logInfo(`buildRuntimeWant: ${model.toString()}`);
  await serializedDelay(driver, 10);
  return model;
}

export default function abilityStageModelDeepTest(): void {
  describe('AbilityStageModelDeepTest', () => {
    let driver: Driver;
    let registry: LifecycleCallbackRegistry;
    let machine: StageStateMachine;

    beforeAll(async () => {
      driver = getDriver();
      registry = new LifecycleCallbackRegistry();
      machine = new StageStateMachine();
      await serializedDelay(driver, DELAY_AFTER_LAUNCH);
      await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      logInfo('AbilityStageModelDeepTest beforeAll finished');

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
      await doAbilityForeground();
      await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
      logInfo('AbilityStageModelDeepTest afterAll finished');
    });
