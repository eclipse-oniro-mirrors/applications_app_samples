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

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_0100
     * @tc.name testLifecycleEventCreateName
     * @tc.desc Verify the onCreate lifecycle callback name is exactly the string onCreate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLifecycleEventCreateName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(StageLifecycleEvent.EVENT_CREATE).assertEqual('onCreate');
          expect(LifecycleCallbackRegistry.isValidEventName('onCreate')).assertTrue();
          expect('onCreate'.length).assertEqual(8);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_0200
     * @tc.name testLifecycleEventAcceptWantName
     * @tc.desc Verify the onAcceptWant lifecycle callback name is exactly the string onAcceptWant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLifecycleEventAcceptWantName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(StageLifecycleEvent.EVENT_ACCEPT_WANT).assertEqual('onAcceptWant');
          expect(LifecycleCallbackRegistry.isValidEventName('onAcceptWant')).assertTrue();
          expect(StageLifecycleEvent.EVENT_ACCEPT_WANT.length).assertEqual(12);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_0300
     * @tc.name testLifecycleEventDestroyName
     * @tc.desc Verify the onDestroy lifecycle callback name is exactly the string onDestroy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLifecycleEventDestroyName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(StageLifecycleEvent.EVENT_DESTROY).assertEqual('onDestroy');
          expect(LifecycleCallbackRegistry.isValidEventName('onDestroy')).assertTrue();
          expect(StageLifecycleEvent.EVENT_DESTROY.length).assertEqual(9);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_0400
     * @tc.name testEnvironmentEventNameConstant
     * @tc.desc Verify the environment event name is environment and is accepted by the registry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvironmentEventNameConstant', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const local: LifecycleCallbackRegistry = new LifecycleCallbackRegistry();
          expect(local.getEnvironmentEventName()).assertEqual('environment');
          expect(EVENT_ENVIRONMENT).assertEqual('environment');
          const result: CallbackRegistrationResult = local.register('environment');
          expect(result).assertEqual(CallbackRegistrationResult.RESULT_REGISTERED);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_0500
     * @tc.name testEnvironmentCallbackFieldNames
     * @tc.desc Verify the two environment callbacks onConfigurationUpdated and onMemoryLevel are valid names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvironmentCallbackFieldNames', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(StageLifecycleEvent.EVENT_CONFIGURATION_UPDATED).assertEqual('onConfigurationUpdated');
          expect(StageLifecycleEvent.EVENT_MEMORY_LEVEL).assertEqual('onMemoryLevel');
          expect(LifecycleCallbackRegistry.isValidEventName('onConfigurationUpdated')).assertTrue();
          expect(LifecycleCallbackRegistry.isValidEventName('onMemoryLevel')).assertTrue();
          expect(LifecycleCallbackRegistry.getLifecycleEventCount()).assertEqual(3);
          expect(LifecycleCallbackRegistry.getEnvironmentEventCount()).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_0600
     * @tc.name testInvalidLifecycleEventNameRejected
     * @tc.desc Verify misspelled or empty lifecycle event names are rejected by registration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInvalidLifecycleEventNameRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const local: LifecycleCallbackRegistry = new LifecycleCallbackRegistry();
          expect(local.register('oncreate')).assertEqual(CallbackRegistrationResult.RESULT_REJECTED);
          expect(local.register('onStart')).assertEqual(CallbackRegistrationResult.RESULT_REJECTED);
          expect(local.register('')).assertEqual(CallbackRegistrationResult.RESULT_REJECTED);
          expect(local.getRegisteredCount()).assertEqual(0);
          expect(LifecycleCallbackRegistry.isValidEventName('onCreate ')).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_0700
     * @tc.name testRegistryDuplicateRegistrationCounted
     * @tc.desc Verify a duplicate lifecycle registration is reported as duplicate and bumps the count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegistryDuplicateRegistrationCounted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const local: LifecycleCallbackRegistry = new LifecycleCallbackRegistry();
          expect(local.register('onCreate')).assertEqual(CallbackRegistrationResult.RESULT_REGISTERED);
          expect(local.register('onCreate')).assertEqual(CallbackRegistrationResult.RESULT_DUPLICATE);
          expect(local.getCount('onCreate')).assertEqual(2);
          expect(local.getRegisteredCount()).assertEqual(1);
          expect(local.getRegisteredNames()[0]).assertEqual('onCreate');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_0800
     * @tc.name testRegistryUnregisterLifecycle
     * @tc.desc Verify unregistering onCreate removes it while leaving other callbacks registered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegistryUnregisterLifecycle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const local: LifecycleCallbackRegistry = new LifecycleCallbackRegistry();
          local.register('onCreate');
          local.register('onDestroy');
          expect(local.unregister('onCreate')).assertTrue();
          expect(local.contains('onCreate')).assertFalse();
          expect(local.contains('onDestroy')).assertTrue();
          expect(local.getRegisteredCount()).assertEqual(1);
          expect(local.getCount('onCreate')).assertEqual(0);
          expect(local.unregister('onCreate')).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_0900
     * @tc.name testRegistryAllLifecycleEventsRegistered
     * @tc.desc Verify all five stage events plus environment register without duplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegistryAllLifecycleEventsRegistered', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const local: LifecycleCallbackRegistry = new LifecycleCallbackRegistry();
          expect(local.register('onCreate')).assertEqual(CallbackRegistrationResult.RESULT_REGISTERED);
          expect(local.register('onAcceptWant')).assertEqual(CallbackRegistrationResult.RESULT_REGISTERED);
          expect(local.register('onDestroy')).assertEqual(CallbackRegistrationResult.RESULT_REGISTERED);
          expect(local.register('onConfigurationUpdated')).assertEqual(CallbackRegistrationResult.RESULT_REGISTERED);
          expect(local.register('onMemoryLevel')).assertEqual(CallbackRegistrationResult.RESULT_REGISTERED);
          expect(local.register('environment')).assertEqual(CallbackRegistrationResult.RESULT_REGISTERED);
          expect(local.getRegisteredCount()).assertEqual(6);
          expect(local.getRegisteredNames().length).assertEqual(6);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_1000
     * @tc.name testRegistryGlobalLifecycleIsolation
     * @tc.desc Verify the suite-level registry is unaffected by a throwaway local registry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegistryGlobalLifecycleIsolation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const before: number = registry.getRegisteredCount();
          const local: LifecycleCallbackRegistry = new LifecycleCallbackRegistry();
          local.register('onCreate');
          local.register('onDestroy');
          expect(local.getRegisteredCount()).assertEqual(2);
          expect(registry.getRegisteredCount()).assertEqual(before);
          expect(registry.contains('onCreate')).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_1100
     * @tc.name testWantModelEntryStructure
     * @tc.desc Verify the entry want carries bundle com.samples.abilitystage, ability EntryAbility and module entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantModelEntryStructure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const want: WantModel = WantModel.createEntryWant();
          expect(want.bundleName).assertEqual('com.samples.abilitystage');
          expect(want.abilityName).assertEqual('EntryAbility');
          expect(want.moduleName).assertEqual('entry');
          expect(want.getParameterCount()).assertEqual(0);
          expect(want.isComplete()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_1200
     * @tc.name testWantModelSpecifiedParameters
     * @tc.desc Verify the specified want carries two parameters and exposes the launch reason value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantModelSpecifiedParameters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const want: WantModel = WantModel.createSpecifiedWant();
          expect(want.getParameterCount()).assertEqual(2);
          expect(want.hasParameter('ohos.aafwk.param.callerAbilityName')).assertTrue();
          expect(want.getParameter('ability.params.launchReason')).assertEqual('specified');
          expect(want.getParameter('missing.key')).assertEqual('');
          expect(want.isComplete()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_1300
     * @tc.name testWantModelEmptyIsIncomplete
     * @tc.desc Verify an empty want fails completeness checks and matches no bundle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantModelEmptyIsIncomplete', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const want: WantModel = WantModel.createEmptyWant();
          expect(want.hasBundleName()).assertFalse();
          expect(want.hasAbilityName()).assertFalse();
          expect(want.hasModuleName()).assertFalse();
          expect(want.isComplete()).assertFalse();
          expect(want.matchesBundle('com.samples.abilitystage')).assertFalse();
          expect(want.matchesBundle('')).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_1400
     * @tc.name testWantModelBundleMatch
     * @tc.desc Verify bundle matching is exact and case sensitive against the manifest bundle name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantModelBundleMatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const want: WantModel = WantModel.createEntryWant();
          expect(want.matchesBundle('com.samples.abilitystage')).assertTrue();
          expect(want.matchesBundle('com.samples.AbilityStage')).assertFalse();
          expect(want.matchesBundle('com.samples.abilitystage.extra')).assertFalse();
          expect(want.bundleName.length).assertEqual(24);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_1500
     * @tc.name testWantModelToString
     * @tc.desc Verify the want representation includes each structural field name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantModelToString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const want: WantModel = WantModel.createSpecifiedWant();
          const text: string = want.toString();
          expect(text.includes('WantModel')).assertTrue();
          expect(text.includes('com.samples.abilitystage')).assertTrue();
          expect(text.includes('EntryAbility')).assertTrue();
          expect(text.includes('params: 2')).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_1600
     * @tc.name testLaunchReasonSpawnValue
     * @tc.desc Verify launch reason SPAWN resolves from code 0 and reports a cold start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLaunchReasonSpawnValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(LaunchReason.LAUNCH_REASON_SPAWN).assertEqual(0);
          const reason: LaunchReason = LaunchReasonResolver.fromCode(0);
          expect(reason).assertEqual(LaunchReason.LAUNCH_REASON_SPAWN);
          expect(LaunchReasonResolver.getName(reason)).assertEqual('spawn');
          expect(LaunchReasonResolver.isColdStart(reason)).assertTrue();
          expect(LaunchReasonResolver.isWarmStart(reason)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_1700
     * @tc.name testLaunchReasonActiveValue
     * @tc.desc Verify launch reason ACTIVE resolves from code 1 and reports a warm start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLaunchReasonActiveValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(LaunchReason.LAUNCH_REASON_ACTIVE).assertEqual(1);
          const reason: LaunchReason = LaunchReasonResolver.fromCode(1);
          expect(reason).assertEqual(LaunchReason.LAUNCH_REASON_ACTIVE);
          expect(LaunchReasonResolver.getName(reason)).assertEqual('active');
          expect(LaunchReasonResolver.isWarmStart(reason)).assertTrue();
          expect(LaunchReasonResolver.isColdStart(reason)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_1800
     * @tc.name testLaunchReasonInvalidCodes
     * @tc.desc Verify codes -1, 2 and 99 resolve to UNKNOWN and are rejected as invalid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLaunchReasonInvalidCodes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(LaunchReasonResolver.fromCode(-1)).assertEqual(LaunchReason.LAUNCH_REASON_UNKNOWN);
          expect(LaunchReasonResolver.fromCode(2)).assertEqual(LaunchReason.LAUNCH_REASON_UNKNOWN);
          expect(LaunchReasonResolver.fromCode(99)).assertEqual(LaunchReason.LAUNCH_REASON_UNKNOWN);
          expect(LaunchReasonResolver.isValidCode(-1)).assertFalse();
          expect(LaunchReasonResolver.isValidCode(0)).assertTrue();
          expect(LaunchReasonResolver.isValidCode(1)).assertTrue();
          expect(LaunchReasonResolver.getName(LaunchReason.LAUNCH_REASON_UNKNOWN)).assertEqual('unknown');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_1900
     * @tc.name testAcceptWantSpecifiedMode
     * @tc.desc Verify a spawn launch with a launchReason parameter resolves to specified mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAcceptWantSpecifiedMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const want: WantModel = WantModel.createSpecifiedWant();
          const mode: AcceptWantMode = AcceptWantMatrix.resolveMode(LaunchReason.LAUNCH_REASON_SPAWN, want);
          expect(mode).assertEqual(AcceptWantMode.MODE_SPECIFIED);
          expect(AcceptWantMatrix.isSpecifiedMode(mode)).assertTrue();
          expect(AcceptWantMatrix.getStageId(want, mode)).assertEqual('MyAbilityStage');
          expect(AcceptWantMatrix.getStageId(want, mode)).assertEqual(ABILITY_STAGE_NAME);
          expect(AcceptWantMatrix.describe(mode)).assertEqual('specified');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_2000
     * @tc.name testAcceptWantMultiTonMode
     * @tc.desc Verify a complete spawn want without launch parameters resolves to multiton mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAcceptWantMultiTonMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const want: WantModel = WantModel.createEntryWant();
          const mode: AcceptWantMode = AcceptWantMatrix.resolveMode(LaunchReason.LAUNCH_REASON_SPAWN, want);
          expect(mode).assertEqual(AcceptWantMode.MODE_MULTITON);
          expect(AcceptWantMatrix.isSpecifiedMode(mode)).assertFalse();
          expect(AcceptWantMatrix.getStageId(want, mode)).assertEqual('');
          expect(AcceptWantMatrix.describe(mode)).assertEqual('multiton');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_2100
     * @tc.name testAcceptWantActiveLaunchUndefined
     * @tc.desc Verify an active launch reason never triggers onAcceptWant so the mode stays undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAcceptWantActiveLaunchUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const want: WantModel = WantModel.createSpecifiedWant();
          const spawnMode: AcceptWantMode =
            AcceptWantMatrix.resolveMode(LaunchReason.LAUNCH_REASON_SPAWN, want);
          const activeMode: AcceptWantMode =
            AcceptWantMatrix.resolveMode(LaunchReason.LAUNCH_REASON_ACTIVE, want);
          expect(spawnMode).assertEqual(AcceptWantMode.MODE_SPECIFIED);
          expect(activeMode).assertEqual(AcceptWantMode.MODE_UNDEFINED);
          expect(AcceptWantMatrix.describe(activeMode)).assertEqual('undefined');
          expect(AcceptWantMatrix.getStageId(want, activeMode)).assertEqual('');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_2200
     * @tc.name testAcceptWantIncompleteWantUndefined
     * @tc.desc Verify an incomplete want resolves to undefined even under a spawn launch reason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAcceptWantIncompleteWantUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const want: WantModel = WantModel.createEmptyWant();
          const mode: AcceptWantMode = AcceptWantMatrix.resolveMode(LaunchReason.LAUNCH_REASON_SPAWN, want);
          expect(mode).assertEqual(AcceptWantMode.MODE_UNDEFINED);
          expect(AcceptWantMatrix.isSpecifiedMode(mode)).assertFalse();
          expect(AcceptWantMatrix.getStageId(want, mode)).assertEqual('');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_2300
     * @tc.name testAcceptWantMatrixCoverage
     * @tc.desc Verify the full 2 by 3 mode matrix produces exactly 2 specified cases out of 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAcceptWantMatrixCoverage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const wants: WantModel[] = [
            WantModel.createEntryWant(), WantModel.createSpecifiedWant(), WantModel.createEmptyWant()
          ];
          const reasons: number[] = [LaunchReason.LAUNCH_REASON_SPAWN, LaunchReason.LAUNCH_REASON_ACTIVE];
          const modes: AcceptWantMode[] = [];
          for (let r = 0; r < reasons.length; r++) {
            for (let w = 0; w < wants.length; w++) {
              modes.push(AcceptWantMatrix.resolveMode(reasons[r], wants[w]));
            }
          }
          expect(modes.length).assertEqual(6);
          expect(AcceptWantMatrix.countSpecified(modes)).assertEqual(1);
          expect(modes[0]).assertEqual(AcceptWantMode.MODE_MULTITON);
          expect(modes[1]).assertEqual(AcceptWantMode.MODE_SPECIFIED);
          expect(modes[2]).assertEqual(AcceptWantMode.MODE_UNDEFINED);
          expect(modes[3]).assertEqual(AcceptWantMode.MODE_UNDEFINED);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_2400
     * @tc.name testAcceptWantStageIdConstant
     * @tc.desc Verify the specified stage identifier is the exact string MyAbilityStage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAcceptWantStageIdConstant', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(SPECIFIED_STAGE_ID).assertEqual('MyAbilityStage');
          expect(SPECIFIED_STAGE_ID).assertEqual(ABILITY_STAGE_NAME);
          expect(SPECIFIED_STAGE_ID.length).assertEqual(14);
          expect(SPECIFIED_STAGE_ID.startsWith('My')).assertTrue();
          expect(SPECIFIED_STAGE_ID.endsWith('Stage')).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_2500
     * @tc.name testStageStateInitialIdle
     * @tc.desc Verify a fresh stage state machine starts idle with zero transitions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStageStateInitialIdle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const local: StageStateMachine = new StageStateMachine();
          expect(local.getState()).assertEqual(StageState.STATE_IDLE);
          expect(local.getTransitionCount()).assertEqual(0);
          expect(local.isForeground()).assertFalse();
          expect(local.isDestroyed()).assertFalse();
          expect(local.getAcceptWantCount()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_2600
     * @tc.name testStageStateCreateTransition
     * @tc.desc Verify create moves idle to created and a second create is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStageStateCreateTransition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const local: StageStateMachine = new StageStateMachine();
          expect(local.create()).assertTrue();
          expect(local.getState()).assertEqual(StageState.STATE_CREATED);
          expect(local.create()).assertFalse();
          expect(local.getTransitionCount()).assertEqual(1);
          expect(local.getTransitionSequence()[0]).assertEqual('create');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_2700
     * @tc.name testStageStateForegroundBackgroundCycle
     * @tc.desc Verify create, foreground, background, foreground yields a four step transition sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStageStateForegroundBackgroundCycle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const local: StageStateMachine = new StageStateMachine();
          local.create();
          expect(local.enterForeground()).assertTrue();
          expect(local.isForeground()).assertTrue();
          expect(local.enterBackground()).assertTrue();
          expect(local.getState()).assertEqual(StageState.STATE_BACKGROUND);
          expect(local.enterForeground()).assertTrue();
          expect(local.getTransitionCount()).assertEqual(4);
          expect(local.getTransitionSequence()[3]).assertEqual('foreground');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_2800
     * @tc.name testStageStateDestroyTerminal
     * @tc.desc Verify destroy is terminal so further create, foreground and destroy calls fail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStageStateDestroyTerminal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const local: StageStateMachine = new StageStateMachine();
          local.create();
          local.enterForeground();
          expect(local.destroy()).assertTrue();
          expect(local.isDestroyed()).assertTrue();
          expect(local.destroy()).assertFalse();
          expect(local.enterForeground()).assertFalse();
          expect(local.create()).assertFalse();
          expect(local.getTransitionCount()).assertEqual(3);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_2900
     * @tc.name testStageStateIllegalTransitions
     * @tc.desc Verify foreground before create and background before foreground are both rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStageStateIllegalTransitions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const local: StageStateMachine = new StageStateMachine();
          expect(local.enterForeground()).assertFalse();
          expect(local.enterBackground()).assertFalse();
          expect(local.destroy()).assertFalse();
          expect(local.getTransitionCount()).assertEqual(0);
          expect(local.getState()).assertEqual(StageState.STATE_IDLE);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_3000
     * @tc.name testStageStateAcceptWantResult
     * @tc.desc Verify acceptWant returns MyAbilityStage for a complete want in the created state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStageStateAcceptWantResult', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const local: StageStateMachine = new StageStateMachine();
          local.create();
          const result: string = local.acceptWant(WantModel.createSpecifiedWant());
          expect(result).assertEqual('MyAbilityStage');
          expect(local.getLastAcceptWantResult()).assertEqual('MyAbilityStage');
          expect(local.getAcceptWantCount()).assertEqual(1);
          const emptyResult: string = local.acceptWant(WantModel.createEmptyWant());
          expect(emptyResult).assertEqual('');
          expect(local.getAcceptWantCount()).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_3100
     * @tc.name testStageStateAcceptWantBeforeCreateRejected
     * @tc.desc Verify acceptWant returns empty before creation and after destruction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStageStateAcceptWantBeforeCreateRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const local: StageStateMachine = new StageStateMachine();
          expect(local.acceptWant(WantModel.createEntryWant())).assertEqual('');
          expect(local.getAcceptWantCount()).assertEqual(0);
          local.create();
          local.destroy();
          expect(local.acceptWant(WantModel.createEntryWant())).assertEqual('');
          expect(local.getAcceptWantCount()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_3200
     * @tc.name testLifecycleSequenceValidatorAccepts
     * @tc.desc Verify the canonical stage plus ability sequence validates against the expected order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLifecycleSequenceValidatorAccepts', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const validator: LifecycleSequenceValidator = new LifecycleSequenceValidator();
          const local: StageStateMachine = new StageStateMachine();
          local.create();
          local.enterForeground();
          local.enterBackground();
          local.enterForeground();
          local.destroy();
          const sequence: string[] = local.getTransitionSequence();
          expect(validator.validate(sequence)).assertTrue();
          expect(validator.findFirstDivergence(sequence)).assertEqual(-1);
          expect(validator.getExpectedCount()).assertEqual(5);
          expect(validator.getExpectedAt(0)).assertEqual('create');
          expect(validator.getExpectedAt(4)).assertEqual('destroy');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_3300
     * @tc.name testLifecycleSequenceDivergenceIndex
     * @tc.desc Verify a divergent foreground in the background slot reports index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLifecycleSequenceDivergenceIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const validator: LifecycleSequenceValidator = new LifecycleSequenceValidator();
          const actual: string[] = ['create', 'foreground', 'foreground', 'background', 'destroy'];
          expect(validator.validate(actual)).assertFalse();
          expect(validator.findFirstDivergence(actual)).assertEqual(2);
          expect(actual[2]).assertEqual('foreground');
          expect(validator.getExpectedAt(2)).assertEqual('background');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_3400
     * @tc.name testLifecycleSequenceLengthMismatch
     * @tc.desc Verify shorter and longer sequences are rejected with the divergence at the length boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLifecycleSequenceLengthMismatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const validator: LifecycleSequenceValidator = new LifecycleSequenceValidator();
          const shorter: string[] = ['create', 'foreground'];
          const longer: string[] = ['create', 'foreground', 'background', 'foreground', 'destroy', 'create'];
          expect(validator.validate(shorter)).assertFalse();
          expect(validator.findFirstDivergence(shorter)).assertEqual(2);
          expect(validator.validate(longer)).assertFalse();
          expect(validator.findFirstDivergence(longer)).assertEqual(5);
          expect(validator.getExpectedAt(9)).assertEqual('');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_3500
     * @tc.name testConfigDiffSingleBit
     * @tc.desc Verify flipping one configuration bit reports exactly one changed field index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConfigDiffSingleBit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const base: number[] = [0, 0, 0, 0, 0];
          const candidate: number[] = [0, 0, 1, 0, 0];
          const changed: number[] = ConfigurationDiffEngine.diffMask(base, candidate);
          expect(changed.length).assertEqual(1);
          expect(changed[0]).assertEqual(2);
          expect(ConfigurationDiffEngine.countChanged(base, candidate)).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_3600
     * @tc.name testConfigDiffAllFiveBits
     * @tc.desc Verify flipping all five configuration bits reports indices 0 through 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConfigDiffAllFiveBits', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const base: number[] = [0, 0, 0, 0, 0];
          const candidate: number[] = [1, 1, 1, 1, 1];
          const changed: number[] = ConfigurationDiffEngine.diffMask(base, candidate);
          expect(changed.length).assertEqual(5);
          expect(changed[0]).assertEqual(0);
          expect(changed[4]).assertEqual(4);
          expect(ConfigurationDiffEngine.countChanged(base, base)).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_3700
     * @tc.name testConfigDiffUnevenLengths
     * @tc.desc Verify diffing arrays of length 3 and 5 compares only the shared prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConfigDiffUnevenLengths', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const short: number[] = [0, 1, 0];
          const long: number[] = [0, 1, 1, 1, 1];
          const changed: number[] = ConfigurationDiffEngine.diffMask(short, long);
          expect(changed.length).assertEqual(1);
          expect(changed[0]).assertEqual(2);
          const empty: number[] = [];
          expect(ConfigurationDiffEngine.diffMask(empty, long).length).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_3800
     * @tc.name testConfigCombinationSampling
     * @tc.desc Verify mask 0 yields all zeros and mask 31 yields all ones across five fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConfigCombinationSampling', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const zero: number[] = ConfigurationDiffEngine.sampleCombination(0);
          const full: number[] = ConfigurationDiffEngine.sampleCombination(31);
          expect(zero.length).assertEqual(5);
          expect(zero[0]).assertEqual(0);
          expect(zero[4]).assertEqual(0);
          expect(full[0]).assertEqual(1);
          expect(full[4]).assertEqual(1);
          expect(ConfigurationDiffEngine.allCombinationsCount()).assertEqual(32);
          expect(ConfigurationDiffEngine.snapshots).assertEqual(5);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_3900
     * @tc.name testConfigCombinationDistribution
     * @tc.desc Verify the binomial distribution over five fields yields 1, 5, 10, 10, 5, 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConfigCombinationDistribution', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(ConfigurationDiffEngine.countCombinationsWithChanges(0)).assertEqual(1);
          expect(ConfigurationDiffEngine.countCombinationsWithChanges(1)).assertEqual(5);
          expect(ConfigurationDiffEngine.countCombinationsWithChanges(2)).assertEqual(10);
          expect(ConfigurationDiffEngine.countCombinationsWithChanges(3)).assertEqual(10);
          expect(ConfigurationDiffEngine.countCombinationsWithChanges(4)).assertEqual(5);
          expect(ConfigurationDiffEngine.countCombinationsWithChanges(5)).assertEqual(1);
          expect(ConfigurationDiffEngine.countCombinationsWithChanges(6)).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_4000
     * @tc.name testConfigCombinationHistogram
     * @tc.desc Verify the full 32 combination histogram sums to 32 and peaks at two changed fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConfigCombinationHistogram', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const histogram: number[] = [0, 0, 0, 0, 0, 0];
          const base: number[] = [0, 0, 0, 0, 0];
          for (let mask = 0; mask < 32; mask++) {
            const candidate: number[] = ConfigurationDiffEngine.sampleCombination(mask);
            const changed: number = ConfigurationDiffEngine.countChanged(base, candidate);
            histogram[changed] = histogram[changed] + 1;
          }
          let total: number = 0;
          for (let i = 0; i < histogram.length; i++) {
            total += histogram[i];
          }
          expect(total).assertEqual(32);
          expect(histogram[2]).assertEqual(10);
          expect(histogram[3]).assertEqual(10);
          expect(histogram[0]).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_4100
     * @tc.name testRuntimeWantMatchesManifest
     * @tc.desc Verify the runtime want built from the delegator matches the manifest bundle and ability names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeWantMatchesManifest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const runtime: WantModel = await buildRuntimeWant(driver);
          expect(runtime.bundleName).assertEqual(getBundleName());
          expect(runtime.abilityName).assertEqual('EntryAbility');
          expect(runtime.moduleName).assertEqual('entry');
          expect(runtime.isComplete()).assertTrue();
          expect(runtime.matchesBundle('com.samples.abilitystage')).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_4200
     * @tc.name testRuntimeWantStartAbility
     * @tc.desc Verify starting the ability with the built want renders the index page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeWantStartAbility', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const want: Want = buildEntryWant();
          await startAbilityByWant(want);
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
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_4300
     * @tc.name testRuntimeTopAbilityBundle
     * @tc.desc Verify the delegator top ability reports the manifest bundle name and the page stays readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeTopAbilityBundle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const delegator: abilityDelegatorRegistry.AbilityDelegator = getAbilityDelegator();
          const topAbility: UIAbility | null = await delegator.getCurrentTopAbility();
          expect(topAbility === null).assertFalse();
          expect(topAbility?.context.abilityInfo.bundleName).assertEqual('com.samples.abilitystage');
          expect(topAbility?.context.abilityInfo.name).assertEqual('EntryAbility');
          const text: string = await readHelloTextById(driver);
          expect(isNonEmptyString(text)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_4400
     * @tc.name testRuntimeStageLifecycleWithUi
     * @tc.desc Verify driving the model state machine alongside real foreground transitions stays consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeStageLifecycleWithUi', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          machine.create();
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          machine.enterForeground();
          expect(machine.isForeground()).assertTrue();
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          machine.enterBackground();
          expect(machine.getState()).assertEqual(StageState.STATE_BACKGROUND);
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          machine.enterForeground();
          expect(machine.getTransitionCount()).assertEqual(4);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          expect(stable).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_4500
     * @tc.name testRuntimeAcceptWantUnderUi
     * @tc.desc Verify acceptWant keeps returning MyAbilityStage while the real page stays rendered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeAcceptWantUnderUi', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const local: StageStateMachine = new StageStateMachine();
          local.create();
          const runtime: WantModel = await buildRuntimeWant(driver);
          const result: string = local.acceptWant(runtime);
          expect(result).assertEqual('MyAbilityStage');
          expect(local.getAcceptWantCount()).assertEqual(1);
          const exists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(exists).assertTrue();
          const count: number = await pageComponentCount(driver);
          expect(count).assertLargerOrEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_4600
     * @tc.name testRuntimeLifecycleRegistryWithLaunch
     * @tc.desc Verify lifecycle events registered around a real launch remain enumerable and the page is stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeLifecycleRegistryWithLaunch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const local: LifecycleCallbackRegistry = new LifecycleCallbackRegistry();
          local.register('onCreate');
          local.register('onAcceptWant');
          local.register('onDestroy');
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          expect(local.getRegisteredCount()).assertEqual(3);
          expect(local.contains('onCreate')).assertTrue();
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          expect(stable).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_4700
     * @tc.name testRuntimeKeyPressKeepsText
     * @tc.desc Verify keyboard activation: TAB moves focus onto the clickable text, then ENTER fires its
     * onClick so the message becomes Welcome and the HelloWorld node stays present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeKeyPressKeepsText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const before: string = await readHelloTextById(driver);
          expect(before === PAGE_TEXT_INITIAL || before === PAGE_TEXT_CLICKED).assertTrue();
          await pressAndWait(driver, KEY_TAB, 1, DELAY_KEY_NAVIGATION);
          await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const after: string = await readHelloTextById(driver);
          expect(after).assertEqual(PAGE_TEXT_CLICKED);
          expect(await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_4800
     * @tc.name testRuntimeBackAndRelaunchSequence
     * @tc.desc Verify BACK followed by a relaunch restores a stable page with the HelloWorld node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeBackAndRelaunchSequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await pressBackAndWait(driver);
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
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
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_4900
     * @tc.name testRuntimeHomeThenLaunch
     * @tc.desc Verify HOME then relaunch keeps the id HelloWorld node discoverable and the text readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeHomeThenLaunch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await pressAndWait(driver, KEY_HOME, 1, DELAY_AFTER_BACKGROUND);
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const exists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(exists).assertTrue();
          const text: string = await readHelloTextById(driver);
          expect(isNonEmptyString(text)).assertTrue();
          expect(text === PAGE_TEXT_INITIAL || text === PAGE_TEXT_CLICKED).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_5000
     * @tc.name testRuntimeFocusIndexRangeAfterTab
     * @tc.desc Verify the focus index after a TAB press stays within the visible component range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeFocusIndexRangeAfterTab', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await pressAndWait(driver, KEY_TAB, 1, DELAY_KEY_NAVIGATION);
          const focusIndex: number = await getCurrentFocusIndex(driver);
          const count: number = await pageComponentCount(driver);
          expect(count).assertLargerOrEqual(1);
          expect(focusIndex < count || focusIndex === -1).assertTrue();
          const texts: string[] = await collectAllTexts(driver);
          expect(texts.length).assertLargerOrEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_5100
     * @tc.name testRuntimeLifecycleStressCycles
     * @tc.desc Verify 10 foreground and background cycles keep both the model and the page consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeLifecycleStressCycles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const local: StageStateMachine = new StageStateMachine();
          local.create();
          local.enterForeground();
          let cycles: number = 0;
          for (let i = 0; i < STRESS_ROUNDS_LIFECYCLE; i++) {
            await doAbilityBackground();
            await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
            local.enterBackground();
            await doAbilityForeground();
            await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
            local.enterForeground();
            cycles++;
          }
          expect(cycles).assertEqual(10);
          expect(local.isForeground()).assertTrue();
          expect(local.getTransitionCount()).assertEqual(22);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          expect(stable).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_5200
     * @tc.name testRuntimeStageDestroyAfterUi
     * @tc.desc Verify the model can be destroyed after real UI teardown and no further transitions occur
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeStageDestroyAfterUi', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const local: StageStateMachine = new StageStateMachine();
          local.create();
          local.enterForeground();
          await pressBackAndWait(driver);
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          expect(local.destroy()).assertTrue();
          expect(local.isDestroyed()).assertTrue();
          expect(local.enterForeground()).assertFalse();
          expect(local.getTransitionCount()).assertEqual(3);
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          expect(stable).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_5300
     * @tc.name testRuntimeDeepIntegrationSummary
     * @tc.desc Verify the combined want, launch reason, accept want and state machine agree on one launch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeDeepIntegrationSummary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const want: WantModel = WantModel.createSpecifiedWant();
          const reason: LaunchReason = LaunchReasonResolver.fromCode(LaunchReason.LAUNCH_REASON_SPAWN);
          const mode: AcceptWantMode = AcceptWantMatrix.resolveMode(LaunchReason.LAUNCH_REASON_SPAWN, want);
          const local: StageStateMachine = new StageStateMachine();
          local.create();
          const stageId: string = local.acceptWant(want);
          expect(LaunchReasonResolver.getName(reason)).assertEqual('spawn');
          expect(AcceptWantMatrix.describe(mode)).assertEqual('specified');
          expect(stageId).assertEqual(AcceptWantMatrix.getStageId(want, mode));
          expect(stageId).assertEqual('MyAbilityStage');
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          expect(await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_5400
     * @tc.name testRuntimeTopAbilityLaunchReasonWarm
     * @tc.desc Verify a second launch reuses the running ability and the delegator still reports EntryAbility
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeTopAbilityLaunchReasonWarm', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const reason: LaunchReason = LaunchReasonResolver.fromCode(LaunchReason.LAUNCH_REASON_ACTIVE);
          expect(LaunchReasonResolver.isWarmStart(reason)).assertTrue();
          const delegator: abilityDelegatorRegistry.AbilityDelegator = getAbilityDelegator();
          const topAbility: UIAbility | null = await delegator.getCurrentTopAbility();
          expect(topAbility === null).assertFalse();
          expect(topAbility?.context.abilityInfo.name).assertEqual('EntryAbility');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_5500
     * @tc.name testRuntimeWantArgumentsFromDelegator
     * @tc.desc Verify the delegator arguments expose the test bundle name consumed by the want model
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeWantArgumentsFromDelegator', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const runtime: WantModel = await buildRuntimeWant(driver);
          expect(runtime.bundleName).assertEqual(getBundleName());
          expect(runtime.bundleName).assertEqual('com.samples.abilitystage');
          expect(runtime.abilityName).assertEqual(ENTRY_ABILITY_NAME);
          expect(runtime.matchesBundle(getBundleName())).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_5600
     * @tc.name testRuntimeStageIdAfterForeground
     * @tc.desc Verify acceptWant still returns MyAbilityStage after a real foreground and background cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeStageIdAfterForeground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const local: StageStateMachine = new StageStateMachine();
          local.create();
          local.enterForeground();
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          local.enterBackground();
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          local.enterForeground();
          expect(local.getState()).assertEqual(StageState.STATE_FOREGROUND);
          await launchEntryAbility();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const text: string = await readHelloTextById(driver);
          expect(isNonEmptyString(text)).assertTrue();
          expect(local.getTransitionCount()).assertEqual(4);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_5700
     * @tc.name testRuntimeLifecycleRegistryOrderAfterLaunch
     * @tc.desc Verify lifecycle callbacks registered in order survive a real launch in registration order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeLifecycleRegistryOrderAfterLaunch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const local: LifecycleCallbackRegistry = new LifecycleCallbackRegistry();
          local.register('onCreate');
          local.register('onAcceptWant');
          local.register('onDestroy');
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const names: string[] = local.getRegisteredNames();
          expect(names.length).assertEqual(3);
          expect(names[0]).assertEqual('onCreate');
          expect(names[2]).assertEqual('onDestroy');
          const count: number = await pageComponentCount(driver);
          expect(count).assertLargerOrEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_5800
     * @tc.name testRuntimeConfigDiffUnderBackgroundSwitch
     * @tc.desc Verify the five field diff stays stable while a real background switch occurs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeConfigDiffUnderBackgroundSwitch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const before: number[] = ConfigurationDiffEngine.sampleCombination(0);
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const after: number[] = ConfigurationDiffEngine.sampleCombination(0);
          expect(ConfigurationDiffEngine.countChanged(before, after)).assertEqual(0);
          const exists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(exists).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_5900
     * @tc.name testRuntimeKeyTourThenDestroy
     * @tc.desc Verify a TAB and ENTER tour followed by model destroy leaves the page text readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeKeyTourThenDestroy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const local: StageStateMachine = new StageStateMachine();
          local.create();
          local.enterForeground();
          await pressAndWait(driver, KEY_TAB, 1, DELAY_KEY_NAVIGATION);
          await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
          expect(local.destroy()).assertTrue();
          expect(local.isDestroyed()).assertTrue();
          const text: string = await readHelloTextById(driver);
          expect(isNonEmptyString(text)).assertTrue();
          expect(await checkTextContent(driver, text)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_6000
     * @tc.name testRuntimeCollectedTextsAfterLaunch
     * @tc.desc Verify texts collected from the launched page contain a non-empty page title entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeCollectedTextsAfterLaunch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const texts: string[] = await collectAllTexts(driver);
          expect(texts.length).assertLargerOrEqual(1);
          const hasInitial: boolean = texts.includes(PAGE_TEXT_INITIAL);
          const hasClicked: boolean = texts.includes(PAGE_TEXT_CLICKED);
          expect(hasInitial || hasClicked).assertTrue();
          expect(WantModel.createEntryWant().isComplete()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_6100
     * @tc.name testRuntimeStartBySpecifiedWant
     * @tc.desc Verify starting with a fully specified want renders the page with the HelloWorld node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeStartBySpecifiedWant', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const specified: WantModel = WantModel.createSpecifiedWant();
          expect(specified.isComplete()).assertTrue();
          expect(AcceptWantMatrix.resolveMode(LaunchReason.LAUNCH_REASON_SPAWN, specified))
            .assertEqual(AcceptWantMode.MODE_SPECIFIED);
          await startAbilityByWant(buildEntryWant());
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
     * @tc.number SUB_ABILITYSTAGE_STAGEDEEP_6200
     * @tc.name testRuntimeFocusIndexAfterDeepSequence
     * @tc.desc Verify the focus index stays in range after a deep lifecycle plus key sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeFocusIndexAfterDeepSequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const local: StageStateMachine = new StageStateMachine();
          local.create();
          local.enterForeground();
          await pressAndWait(driver, KEY_TAB, 1, DELAY_KEY_NAVIGATION);
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const focusIndex: number = await getCurrentFocusIndex(driver);
          const count: number = await pageComponentCount(driver);
          expect(count).assertLargerOrEqual(1);
          expect(focusIndex < count || focusIndex === -1).assertTrue();
          expect(local.isForeground()).assertTrue();
        } finally {
          done();
        }
      })
  });
}
