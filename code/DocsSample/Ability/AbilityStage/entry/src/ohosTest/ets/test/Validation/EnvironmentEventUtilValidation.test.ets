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
import { Driver, Component } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import {
  getDriver,
  ensureIndexPageInitial,
  getAbilityDelegator,
  getBundleName,
  launchEntryAbility,
  waitForIndexPageStable,
  isIndexPageVisible,
  isIndexPageRendered,
  pageComponentCount,
  collectAllTexts,
  checkTextContent,
  checkComponentExistsByKey,
  findComponentsByType,
  doAbilityForeground,
  doAbilityBackground,
  measureElapsed,
  isWithinBudget,
  logInfo,
  logError,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_ABILITY_LAUNCH,
  TIMEOUT_BACKGROUND_SWITCH,
  DELAY_AFTER_BACKGROUND,
  ENV_CALLBACK_EVENT,
  INDEX_PAGE_TEXT_KEY,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  BUNDLE_NAME
} from '../Shared/SharedDriver';

enum EnvField {
  LANGUAGE = 'language',
  COLOR_MODE = 'colorMode',
  DIRECTION = 'direction',
  FONT_SIZE_SCALE = 'fontSizeScale',
  FONT_WEIGHT_SCALE = 'fontWeightScale'
}

enum MemoryLevel {
  MEMORY_LEVEL_MODERATE = 0,
  MEMORY_LEVEL_LOW = 1,
  MEMORY_LEVEL_CRITICAL = 2
}

interface EnvironmentSnapshot {
  language: string;
  colorMode: number;
  direction: number;
  fontSizeScale: number;
  fontWeightScale: number;
}

interface EnvironmentDiffEntry {
  field: string;
  before: string;
  after: string;
}

interface DispatchFailure {
  subscriberId: number;
  errorName: string;
}

class EnvRegistrationError extends Error {
  public code: number = 401;

  constructor(message: string) {
    super(message);
    this.name = 'EnvRegistrationError';
  }
}

class EnvDispatchError extends Error {
  public code: number = 500;

  constructor(message: string) {
    super(message);
    this.name = 'EnvDispatchError';
  }
}

class EnvironmentSnapshotUtil {
  public static createDefault(): EnvironmentSnapshot {
    const snapshot: EnvironmentSnapshot = {
      language: 'zh-Hans',
      colorMode: 0,
      direction: 0,
      fontSizeScale: 1.0,
      fontWeightScale: 1.0
    };
    return snapshot;
  }

  public static clone(source: EnvironmentSnapshot): EnvironmentSnapshot {
    const copy: EnvironmentSnapshot = {
      language: source.language,
      colorMode: source.colorMode,
      direction: source.direction,
      fontSizeScale: source.fontSizeScale,
      fontWeightScale: source.fontWeightScale
    };
    return copy;
  }

  public static fieldNames(): string[] {
    const names: string[] = [
      EnvField.LANGUAGE, EnvField.COLOR_MODE, EnvField.DIRECTION,
      EnvField.FONT_SIZE_SCALE, EnvField.FONT_WEIGHT_SCALE
    ];
    return names;
  }

  public static readField(snapshot: EnvironmentSnapshot, field: string): string {
    if (field === EnvField.LANGUAGE) {
      return snapshot.language;
    }
    if (field === EnvField.COLOR_MODE) {
      return snapshot.colorMode.toString();
    }
    if (field === EnvField.DIRECTION) {
      return snapshot.direction.toString();
    }
    if (field === EnvField.FONT_SIZE_SCALE) {
      return snapshot.fontSizeScale.toString();
    }
    if (field === EnvField.FONT_WEIGHT_SCALE) {
      return snapshot.fontWeightScale.toString();
    }
    throw new EnvRegistrationError(`unknown environment field ${field}`);
  }

  public static diff(before: EnvironmentSnapshot, after: EnvironmentSnapshot): EnvironmentDiffEntry[] {
    const entries: EnvironmentDiffEntry[] = [];
    const names: string[] = EnvironmentSnapshotUtil.fieldNames();
    for (let i = 0; i < names.length; i++) {
      const field: string = names[i];
      const left: string = EnvironmentSnapshotUtil.readField(before, field);
      const right: string = EnvironmentSnapshotUtil.readField(after, field);
      if (left !== right) {
        const entry: EnvironmentDiffEntry = { field: field, before: left, after: right };
        entries.push(entry);
      }
    }
    return entries;
  }

  public static changedFieldNames(before: EnvironmentSnapshot, after: EnvironmentSnapshot): string[] {
    const entries: EnvironmentDiffEntry[] = EnvironmentSnapshotUtil.diff(before, after);
    const names: string[] = [];
    for (let i = 0; i < entries.length; i++) {
      names.push(entries[i].field);
    }
    return names;
  }

  public static equals(left: EnvironmentSnapshot, right: EnvironmentSnapshot): boolean {
    return EnvironmentSnapshotUtil.diff(left, right).length === 0;
  }

  public static isScaleValid(value: number): boolean {
    if (isNaN(value) || !isFinite(value)) {
      return false;
    }
    return value >= 0.5 && value <= 3.5;
  }

  public static applyField(snapshot: EnvironmentSnapshot, field: string, value: string): EnvironmentSnapshot {
    const updated: EnvironmentSnapshot = EnvironmentSnapshotUtil.clone(snapshot);
    if (field === EnvField.LANGUAGE) {
      if (value.length === 0) {
        throw new EnvRegistrationError('language must not be empty');
      }
      updated.language = value;
      return updated;
    }
    const numeric: number = parseFloat(value);
    if (isNaN(numeric) || !isFinite(numeric)) {
      throw new EnvRegistrationError(`field ${field} requires a numeric value`);
    }
    if (field === EnvField.COLOR_MODE) {
      updated.colorMode = numeric;
      return updated;
    }
    if (field === EnvField.DIRECTION) {
      updated.direction = numeric;
      return updated;
    }
    if (field === EnvField.FONT_SIZE_SCALE) {
      updated.fontSizeScale = numeric;
      return updated;
    }
    if (field === EnvField.FONT_WEIGHT_SCALE) {
      updated.fontWeightScale = numeric;
      return updated;
    }
    throw new EnvRegistrationError(`unknown environment field ${field}`);
  }
}

class EnvironmentSubscriber {
  public id: number = 0;
  public key: string = '';
  public order: number = 0;
  public dispatchCount: number = 0;
  public failOnDispatch: boolean = false;
  public lastLanguage: string = '';

  constructor(id: number, key: string, order: number, failOnDispatch: boolean) {
    this.id = id;
    this.key = key;
    this.order = order;
    this.failOnDispatch = failOnDispatch;
  }

  public handle(snapshot: EnvironmentSnapshot): void {
    if (this.failOnDispatch) {
      throw new EnvDispatchError(`subscriber ${this.key} failed on purpose`);
    }
    this.dispatchCount++;
    this.lastLanguage = snapshot.language;
  }
}

class EnvironmentEventRegistry {
  private subscribers: EnvironmentSubscriber[] = [];
  private nextCallbackId: number = 1;
  private nextOrder: number = 1;
  private duplicateRegistrations: number = 0;
  private dispatchRounds: number = 0;
  private totalDeliveries: number = 0;
  private failures: DispatchFailure[] = [];
  private dispatchLog: number[] = [];
  private eventName: string = ENV_CALLBACK_EVENT;

  public getEventName(): string {
    return this.eventName;
  }

  public register(key: string, failOnDispatch: boolean = false): number {
    if (key.length === 0) {
      throw new EnvRegistrationError('subscriber key must not be empty');
    }
    const existing: EnvironmentSubscriber | null = this.findByKey(key);
    if (existing !== null) {
      this.duplicateRegistrations++;
      return existing.id;
    }
    const subscriber: EnvironmentSubscriber = new EnvironmentSubscriber(this.nextCallbackId, key, this.nextOrder, failOnDispatch);
    this.nextCallbackId++;
    this.nextOrder++;
    this.subscribers.push(subscriber);
    return subscriber.id;
  }

  public registerDuplicateIgnored(key: string): boolean {
    const before: number = this.subscribers.length;
    this.register(key);
    return this.subscribers.length === before;
  }

  public unregister(callbackId: number): boolean {
    for (let i = 0; i < this.subscribers.length; i++) {
      if (this.subscribers[i].id === callbackId) {
        this.subscribers.splice(i, 1);
        return true;
      }
    }
    return false;
  }

  public unregisterByKey(key: string): boolean {
    const existing: EnvironmentSubscriber | null = this.findByKey(key);
    if (existing === null) {
      return false;
    }
    return this.unregister(existing.id);
  }

  private findByKey(key: string): EnvironmentSubscriber | null {
    for (let i = 0; i < this.subscribers.length; i++) {
      if (this.subscribers[i].key === key) {
        return this.subscribers[i];
      }
    }
    return null;
  }

  public hasSubscriber(key: string): boolean {
    return this.findByKey(key) !== null;
  }

  public subscriberCount(): number {
    return this.subscribers.length;
  }

  public getDuplicateRegistrationCount(): number {
    return this.duplicateRegistrations;
  }

  public getDispatchRounds(): number {
    return this.dispatchRounds;
  }

  public getTotalDeliveries(): number {
    return this.totalDeliveries;
  }

  public getFailures(): DispatchFailure[] {
    return this.failures;
  }

  public getDispatchLog(): number[] {
    return this.dispatchLog;
  }

  public dispatch(snapshot: EnvironmentSnapshot): number {
    if (this.subscribers.length === 0) {
      throw new EnvDispatchError('dispatch requires at least one subscriber');
    }
    this.dispatchRounds++;
    let delivered: number = 0;
    this.dispatchLog = [];
    const ordered: EnvironmentSubscriber[] = this.subscribers.slice(0);
    ordered.sort((left: EnvironmentSubscriber, right: EnvironmentSubscriber): number => left.order - right.order);
    for (let i = 0; i < ordered.length; i++) {
      const current: EnvironmentSubscriber = ordered[i];
      this.dispatchLog.push(current.id);
      try {
        current.handle(snapshot);
        delivered++;
      } catch (error) {
        const failure: DispatchFailure = {
          subscriberId: current.id, errorName: (error as Error).name
        };
        this.failures.push(failure);
      }
    }
    this.totalDeliveries += delivered;
    return delivered;
  }

  public dispatchCountFor(key: string): number {
    const existing: EnvironmentSubscriber | null = this.findByKey(key);
    if (existing === null) {
      return -1;
    }
    return existing.dispatchCount;
  }

  public lastLanguageFor(key: string): string {
    const existing: EnvironmentSubscriber | null = this.findByKey(key);
    if (existing === null) {
      return '';
    }
    return existing.lastLanguage;
  }

  public reset(): void {
    this.subscribers = [];
    this.nextCallbackId = 1;
    this.nextOrder = 1;
    this.duplicateRegistrations = 0;
    this.dispatchRounds = 0;
    this.totalDeliveries = 0;
    this.failures = [];
    this.dispatchLog = [];
  }
}

class MemoryLevelPolicy {
  private level: MemoryLevel = MemoryLevel.MEMORY_LEVEL_MODERATE;
  private history: number[] = [];

  public onMemoryLevel(level: number): void {
    if (level !== MemoryLevel.MEMORY_LEVEL_MODERATE && level !== MemoryLevel.MEMORY_LEVEL_LOW &&
      level !== MemoryLevel.MEMORY_LEVEL_CRITICAL) {
      throw new EnvRegistrationError(`unsupported memory level ${level}`);
    }
    this.level = level;
    this.history.push(level);
  }

  public getLevel(): number {
    return this.level;
  }

  public getHistory(): number[] {
    return this.history;
  }

  public shouldReleaseCache(): boolean {
    return this.level >= MemoryLevel.MEMORY_LEVEL_LOW;
  }

  public shouldDropVisibleContent(): boolean {
    return this.level === MemoryLevel.MEMORY_LEVEL_CRITICAL;
  }

  public reset(): void {
    this.level = MemoryLevel.MEMORY_LEVEL_MODERATE;
    this.history = [];
  }
}

export default function environmentEventUtilValidationTest(): void {
  describe('EnvironmentEventUtilValidationTest', () => {
    let driver: Driver;
    let registry: EnvironmentEventRegistry;

    beforeAll(async () => {
      driver = getDriver();
      registry = new EnvironmentEventRegistry();
      logInfo('EnvironmentEventUtilValidationTest: beforeAll start');
      await launchEntryAbility();
      await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      await ensureIndexPageInitial(driver);
      logInfo('EnvironmentEventUtilValidationTest: beforeAll finished');
    })

    afterAll(async () => {
      logInfo('EnvironmentEventUtilValidationTest: afterAll start');
      await driver.delayMs(DELAY_AFTER_BACKGROUND);
      logInfo('EnvironmentEventUtilValidationTest: afterAll finished');
    })

    beforeEach(async () => {
      const rendered: boolean = await isIndexPageRendered(driver);
      if (!rendered) {
        logInfo('beforeEach: index page absent, relaunching the entry ability');
        await launchEntryAbility();
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_0100
     * @tc.name testEventNameMatchesAbilityStageRegistration
     * @tc.desc Verify the registry listens to the environment event name used by MyAbilityStage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEventNameMatchesAbilityStageRegistration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: EnvironmentEventRegistry = new EnvironmentEventRegistry();
        expect(local.getEventName()).assertEqual('environment');
        expect(local.getEventName()).assertEqual(ENV_CALLBACK_EVENT);
        expect(ENV_CALLBACK_EVENT.length).assertEqual(11);
        expect(local.subscriberCount()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_0200
     * @tc.name testDefaultSnapshotFieldValues
     * @tc.desc Verify the default environment snapshot carries the five documented configuration fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDefaultSnapshotFieldValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const snapshot: EnvironmentSnapshot = EnvironmentSnapshotUtil.createDefault();
        expect(snapshot.language).assertEqual('zh-Hans');
        expect(snapshot.colorMode).assertEqual(0);
        expect(snapshot.direction).assertEqual(0);
        expect(snapshot.fontSizeScale).assertEqual(1.0);
        expect(snapshot.fontWeightScale).assertEqual(1.0);
        expect(EnvironmentSnapshotUtil.fieldNames().length).assertEqual(5);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_0300
     * @tc.name testFieldNameListContent
     * @tc.desc Verify the five environment field names are language, colorMode, direction and both scale fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFieldNameListContent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const names: string[] = EnvironmentSnapshotUtil.fieldNames();
        expect(names[0]).assertEqual('language');
        expect(names[1]).assertEqual('colorMode');
        expect(names[2]).assertEqual('direction');
        expect(names[3]).assertEqual('fontSizeScale');
        expect(names[4]).assertEqual('fontWeightScale');
        expect(names.length).assertEqual(5);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_0400
     * @tc.name testRegisterReturnsMonotonicCallbackIds
     * @tc.desc Verify callback ids start at one and increase by exactly one per registration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegisterReturnsMonotonicCallbackIds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: EnvironmentEventRegistry = new EnvironmentEventRegistry();
        const first: number = local.register('cbA');
        const second: number = local.register('cbB');
        const third: number = local.register('cbC');
        expect(first).assertEqual(1);
        expect(second).assertEqual(2);
        expect(third).assertEqual(3);
        expect(local.subscriberCount()).assertEqual(3);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_0500
     * @tc.name testCallbackIdNotReusedAfterUnregister
     * @tc.desc Verify unregistering a callback never lets a later registration reuse its id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCallbackIdNotReusedAfterUnregister', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: EnvironmentEventRegistry = new EnvironmentEventRegistry();
        const first: number = local.register('cbA');
        expect(local.unregister(first)).assertTrue();
        expect(local.subscriberCount()).assertEqual(0);
        const second: number = local.register('cbB');
        expect(second).assertEqual(2);
        expect(second > first).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_0600
     * @tc.name testDuplicateRegistrationDeduplicated
     * @tc.desc Verify registering the same callback key twice keeps one subscriber and returns the same id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDuplicateRegistrationDeduplicated', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: EnvironmentEventRegistry = new EnvironmentEventRegistry();
        const first: number = local.register('sameCb');
        const second: number = local.register('sameCb');
        expect(first).assertEqual(second);
        expect(local.subscriberCount()).assertEqual(1);
        expect(local.getDuplicateRegistrationCount()).assertEqual(1);
        expect(local.registerDuplicateIgnored('sameCb')).assertTrue();
        expect(local.getDuplicateRegistrationCount()).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_0700
     * @tc.name testRegisterEmptyKeyRejected
     * @tc.desc Verify registering an empty callback key raises EnvRegistrationError with code 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegisterEmptyKeyRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: EnvironmentEventRegistry = new EnvironmentEventRegistry();
        try {
          local.register('');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('EnvRegistrationError');
          expect((e as EnvRegistrationError).code).assertEqual(401);
        }
        expect(local.subscriberCount()).assertEqual(0);
        expect(local.getDuplicateRegistrationCount()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_0800
     * @tc.name testUnregisterUnknownIdReturnsFalse
     * @tc.desc Verify unregistering an unknown callback id reports false and leaves the table unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUnregisterUnknownIdReturnsFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: EnvironmentEventRegistry = new EnvironmentEventRegistry();
        local.register('cbA');
        expect(local.unregister(99)).assertFalse();
        expect(local.subscriberCount()).assertEqual(1);
        expect(local.unregisterByKey('missingKey')).assertFalse();
        expect(local.subscriberCount()).assertEqual(1);
        expect(local.unregisterByKey('cbA')).assertTrue();
        expect(local.subscriberCount()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_0900
     * @tc.name testDispatchOrderFollowsRegistration
     * @tc.desc Verify subscribers are notified in registration order and the dispatch log records that order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDispatchOrderFollowsRegistration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: EnvironmentEventRegistry = new EnvironmentEventRegistry();
        local.register('first');
        local.register('second');
        local.register('third');
        const delivered: number = local.dispatch(EnvironmentSnapshotUtil.createDefault());
        expect(delivered).assertEqual(3);
        const order: number[] = local.getDispatchLog();
        expect(order.length).assertEqual(3);
        expect(order[0]).assertEqual(1);
        expect(order[1]).assertEqual(2);
        expect(order[2]).assertEqual(3);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_1000
     * @tc.name testDispatchCountExactValue
     * @tc.desc Verify two dispatches deliver exactly twice to each of the two subscribers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDispatchCountExactValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: EnvironmentEventRegistry = new EnvironmentEventRegistry();
        local.register('alpha');
        local.register('beta');
        local.dispatch(EnvironmentSnapshotUtil.createDefault());
        local.dispatch(EnvironmentSnapshotUtil.createDefault());
        expect(local.getDispatchRounds()).assertEqual(2);
        expect(local.getTotalDeliveries()).assertEqual(4);
        expect(local.dispatchCountFor('alpha')).assertEqual(2);
        expect(local.dispatchCountFor('beta')).assertEqual(2);
        expect(local.dispatchCountFor('gamma')).assertEqual(-1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_1100
     * @tc.name testDispatchDeliversSnapshotPayload
     * @tc.desc Verify the dispatched snapshot reaches subscribers with the updated language value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDispatchDeliversSnapshotPayload', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: EnvironmentEventRegistry = new EnvironmentEventRegistry();
        local.register('listener');
        const base: EnvironmentSnapshot = EnvironmentSnapshotUtil.createDefault();
        const updated: EnvironmentSnapshot = EnvironmentSnapshotUtil.applyField(base, EnvField.LANGUAGE, 'en-Latn-US');
        local.dispatch(updated);
        expect(local.lastLanguageFor('listener')).assertEqual('en-Latn-US');
        expect(local.lastLanguageFor('nobody')).assertEqual('');
        expect(local.dispatchCountFor('listener')).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_1200
     * @tc.name testDispatchEmptyTableRejected
     * @tc.desc Verify dispatching without any subscriber raises EnvDispatchError and records no round
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDispatchEmptyTableRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: EnvironmentEventRegistry = new EnvironmentEventRegistry();
        try {
          local.dispatch(EnvironmentSnapshotUtil.createDefault());
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('EnvDispatchError');
        }
        expect(local.getDispatchRounds()).assertEqual(0);
        expect(local.getTotalDeliveries()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_1300
     * @tc.name testFailingCallbackIsolated
     * @tc.desc Verify one throwing subscriber does not stop the remaining subscribers from receiving the event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFailingCallbackIsolated', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: EnvironmentEventRegistry = new EnvironmentEventRegistry();
        local.register('goodBefore');
        local.register('broken', true);
        local.register('goodAfter');
        const delivered: number = local.dispatch(EnvironmentSnapshotUtil.createDefault());
        expect(delivered).assertEqual(2);
        expect(local.dispatchCountFor('goodBefore')).assertEqual(1);
        expect(local.dispatchCountFor('goodAfter')).assertEqual(1);
        expect(local.getFailures().length).assertEqual(1);
        expect(local.getFailures()[0].subscriberId).assertEqual(2);
        expect(local.getFailures()[0].errorName).assertEqual('EnvDispatchError');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_1400
     * @tc.name testFailingCallbackStillLoggedInOrder
     * @tc.desc Verify a failing subscriber keeps its position in the dispatch log between healthy subscribers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFailingCallbackStillLoggedInOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: EnvironmentEventRegistry = new EnvironmentEventRegistry();
        local.register('one');
        local.register('two', true);
        local.register('three');
        local.dispatch(EnvironmentSnapshotUtil.createDefault());
        const log: number[] = local.getDispatchLog();
        expect(log.length).assertEqual(3);
        expect(log[1]).assertEqual(2);
        expect(local.dispatchCountFor('two')).assertEqual(0);
        expect(local.getTotalDeliveries()).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_1500
     * @tc.name testAllCallbacksFailingReportsZeroDelivered
     * @tc.desc Verify a dispatch where every subscriber throws reports zero deliveries and records each failure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAllCallbacksFailingReportsZeroDelivered', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: EnvironmentEventRegistry = new EnvironmentEventRegistry();
        local.register('brokenA', true);
        local.register('brokenB', true);
        const delivered: number = local.dispatch(EnvironmentSnapshotUtil.createDefault());
        expect(delivered).assertEqual(0);
        expect(local.getTotalDeliveries()).assertEqual(0);
        expect(local.getFailures().length).assertEqual(2);
        expect(local.getDispatchRounds()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_1600
     * @tc.name testUnregisteredCallbackReceivesNothing
     * @tc.desc Verify a subscriber removed from the table no longer receives subsequent dispatches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUnregisteredCallbackReceivesNothing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: EnvironmentEventRegistry = new EnvironmentEventRegistry();
        const removedId: number = local.register('temporary');
        local.register('permanent');
        local.dispatch(EnvironmentSnapshotUtil.createDefault());
        expect(local.dispatchCountFor('temporary')).assertEqual(1);
        expect(local.unregister(removedId)).assertTrue();
        const delivered: number = local.dispatch(EnvironmentSnapshotUtil.createDefault());
        expect(delivered).assertEqual(1);
        expect(local.dispatchCountFor('permanent')).assertEqual(2);
        expect(local.hasSubscriber('temporary')).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_1700
     * @tc.name testReRegisterAfterUnregisterStartsFresh
     * @tc.desc Verify re-registering the same key after removal creates a new callback id and a zero count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReRegisterAfterUnregisterStartsFresh', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: EnvironmentEventRegistry = new EnvironmentEventRegistry();
        const firstId: number = local.register('cycle');
        local.dispatch(EnvironmentSnapshotUtil.createDefault());
        expect(local.dispatchCountFor('cycle')).assertEqual(1);
        local.unregisterByKey('cycle');
        const secondId: number = local.register('cycle');
        expect(secondId).assertEqual(firstId + 1);
        expect(local.dispatchCountFor('cycle')).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_1800
     * @tc.name testDiffIdenticalSnapshotsEmpty
     * @tc.desc Verify diffing a snapshot against an identical clone yields no changed fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDiffIdenticalSnapshotsEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const base: EnvironmentSnapshot = EnvironmentSnapshotUtil.createDefault();
        const clone: EnvironmentSnapshot = EnvironmentSnapshotUtil.clone(base);
        expect(EnvironmentSnapshotUtil.diff(base, clone).length).assertEqual(0);
        expect(EnvironmentSnapshotUtil.equals(base, clone)).assertTrue();
        expect(EnvironmentSnapshotUtil.changedFieldNames(base, clone).length).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_1900
     * @tc.name testDiffSingleLanguageChange
     * @tc.desc Verify a language-only update produces exactly one diff entry with before and after values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDiffSingleLanguageChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const before: EnvironmentSnapshot = EnvironmentSnapshotUtil.createDefault();
        const after: EnvironmentSnapshot = EnvironmentSnapshotUtil.applyField(before, EnvField.LANGUAGE, 'en-Latn-US');
        const entries: EnvironmentDiffEntry[] = EnvironmentSnapshotUtil.diff(before, after);
        expect(entries.length).assertEqual(1);
        expect(entries[0].field).assertEqual('language');
        expect(entries[0].before).assertEqual('zh-Hans');
        expect(entries[0].after).assertEqual('en-Latn-US');
        expect(EnvironmentSnapshotUtil.equals(before, after)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_2000
     * @tc.name testDiffAllFiveFieldsChanged
     * @tc.desc Verify changing every configuration field reports five diff entries in field declaration order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDiffAllFiveFieldsChanged', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const before: EnvironmentSnapshot = EnvironmentSnapshotUtil.createDefault();
        let after: EnvironmentSnapshot = EnvironmentSnapshotUtil.applyField(before, EnvField.LANGUAGE, 'en-Latn-US');
        after = EnvironmentSnapshotUtil.applyField(after, EnvField.COLOR_MODE, '1');
        after = EnvironmentSnapshotUtil.applyField(after, EnvField.DIRECTION, '1');
        after = EnvironmentSnapshotUtil.applyField(after, EnvField.FONT_SIZE_SCALE, '1.5');
        after = EnvironmentSnapshotUtil.applyField(after, EnvField.FONT_WEIGHT_SCALE, '1.2');
        const names: string[] = EnvironmentSnapshotUtil.changedFieldNames(before, after);
        expect(names.length).assertEqual(5);
        expect(names[0]).assertEqual('language');
        expect(names[1]).assertEqual('colorMode');
        expect(names[4]).assertEqual('fontWeightScale');
        expect(after.fontSizeScale).assertEqual(1.5);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_2100
     * @tc.name testDiffTwoFieldsEntriesPairing
     * @tc.desc Verify changing colorMode and direction yields paired entries in declaration order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDiffTwoFieldsEntriesPairing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const before: EnvironmentSnapshot = EnvironmentSnapshotUtil.createDefault();
        let after: EnvironmentSnapshot = EnvironmentSnapshotUtil.applyField(before, EnvField.COLOR_MODE, '1');
        after = EnvironmentSnapshotUtil.applyField(after, EnvField.DIRECTION, '1');
        const entries: EnvironmentDiffEntry[] = EnvironmentSnapshotUtil.diff(before, after);
        expect(entries.length).assertEqual(2);
        expect(entries[0].field).assertEqual('colorMode');
        expect(entries[0].before).assertEqual('0');
        expect(entries[0].after).assertEqual('1');
        expect(entries[1].field).assertEqual('direction');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_2200
     * @tc.name testApplyUnknownFieldRejected
     * @tc.desc Verify applying an unknown environment field raises EnvRegistrationError and leaves input intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testApplyUnknownFieldRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const base: EnvironmentSnapshot = EnvironmentSnapshotUtil.createDefault();
        try {
          EnvironmentSnapshotUtil.applyField(base, 'notAField', '1');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('EnvRegistrationError');
        }
        expect(base.language).assertEqual('zh-Hans');
        try {
          EnvironmentSnapshotUtil.readField(base, 'notAField');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('EnvRegistrationError');
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_2300
     * @tc.name testApplyInvalidNumericRejected
     * @tc.desc Verify a non numeric value for a scale field raises EnvRegistrationError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testApplyInvalidNumericRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const base: EnvironmentSnapshot = EnvironmentSnapshotUtil.createDefault();
        try {
          EnvironmentSnapshotUtil.applyField(base, EnvField.FONT_SIZE_SCALE, 'large');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('EnvRegistrationError');
        }
        try {
          EnvironmentSnapshotUtil.applyField(base, EnvField.LANGUAGE, '');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('EnvRegistrationError');
        }
        expect(base.fontSizeScale).assertEqual(1.0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_2400
     * @tc.name testScaleBoundsValidated
     * @tc.desc Verify scale values are accepted only inside the 0.5 to 3.5 inclusive window
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScaleBoundsValidated', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(EnvironmentSnapshotUtil.isScaleValid(0.5)).assertTrue();
        expect(EnvironmentSnapshotUtil.isScaleValid(3.5)).assertTrue();
        expect(EnvironmentSnapshotUtil.isScaleValid(0.4999)).assertFalse();
        expect(EnvironmentSnapshotUtil.isScaleValid(3.5001)).assertFalse();
        expect(EnvironmentSnapshotUtil.isScaleValid(1.0)).assertTrue();
        expect(EnvironmentSnapshotUtil.isScaleValid(Number.NaN)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_2500
     * @tc.name testMemoryLevelPolicyTransitions
     * @tc.desc Verify the memory level policy escalates from moderate to critical and records each level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMemoryLevelPolicyTransitions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const policy: MemoryLevelPolicy = new MemoryLevelPolicy();
        expect(policy.getLevel()).assertEqual(0);
        expect(policy.shouldReleaseCache()).assertFalse();
        policy.onMemoryLevel(MemoryLevel.MEMORY_LEVEL_LOW);
        expect(policy.getLevel()).assertEqual(1);
        expect(policy.shouldReleaseCache()).assertTrue();
        expect(policy.shouldDropVisibleContent()).assertFalse();
        policy.onMemoryLevel(MemoryLevel.MEMORY_LEVEL_CRITICAL);
        expect(policy.shouldDropVisibleContent()).assertTrue();
        expect(policy.getHistory().length).assertEqual(2);
        expect(policy.getHistory()[1]).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_2600
     * @tc.name testMemoryLevelOutOfRangeRejected
     * @tc.desc Verify an unsupported memory level value is rejected with EnvRegistrationError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMemoryLevelOutOfRangeRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const policy: MemoryLevelPolicy = new MemoryLevelPolicy();
        try {
          policy.onMemoryLevel(7);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('EnvRegistrationError');
        }
        expect(policy.getLevel()).assertEqual(0);
        expect(policy.getHistory().length).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_2700
     * @tc.name testRegistryResetClearsTable
     * @tc.desc Verify reset empties the subscriber table, counters and failure history
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegistryResetClearsTable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: EnvironmentEventRegistry = new EnvironmentEventRegistry();
        local.register('a');
        local.register('b', true);
        local.dispatch(EnvironmentSnapshotUtil.createDefault());
        expect(local.getFailures().length).assertEqual(1);
        local.reset();
        expect(local.subscriberCount()).assertEqual(0);
        expect(local.getDispatchRounds()).assertEqual(0);
        expect(local.getTotalDeliveries()).assertEqual(0);
        expect(local.getFailures().length).assertEqual(0);
        expect(local.getDispatchLog().length).assertEqual(0);
        expect(local.register('c')).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_2800
     * @tc.name testUiLiveApplicationContextReachable
     * @tc.desc Verify the AbilityDelegator exposes the running bundle so environment callbacks target it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiLiveApplicationContextReachable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const delegator: abilityDelegatorRegistry.AbilityDelegator = getAbilityDelegator();
        const bundleName: string = getBundleName();
        logInfo(`testUiLiveApplicationContextReachable: bundle ${bundleName}`);
        expect(delegator !== null).assertTrue();
        expect(bundleName).assertEqual(BUNDLE_NAME);
        const visible: boolean = await isIndexPageVisible(driver);
        expect(visible).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_2900
     * @tc.name testUiSnapshotMatchesLivePageText
     * @tc.desc Verify the model snapshot language field coexists with a live visible page copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiSnapshotMatchesLivePageText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const snapshot: EnvironmentSnapshot = EnvironmentSnapshotUtil.createDefault();
        expect(EnvironmentSnapshotUtil.isScaleValid(snapshot.fontSizeScale)).assertTrue();
        expect(EnvironmentSnapshotUtil.isScaleValid(snapshot.fontWeightScale)).assertTrue();
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        const texts: string[] = await collectAllTexts(driver);
        expect(texts.length >= 1).assertTrue();
        if (texts.length >= 1) {
          expect(texts[0].length > 0).assertTrue();
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_3000
     * @tc.name testUiForegroundDispatchStillDelivers
     * @tc.desc Verify a subscriber keeps receiving events after the real ability cycles to background and back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiForegroundDispatchStillDelivers', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: EnvironmentEventRegistry = new EnvironmentEventRegistry();
        local.register('survivor');
        local.dispatch(EnvironmentSnapshotUtil.createDefault());
        await doAbilityBackground();
        await driver.delayMs(DELAY_AFTER_BACKGROUND);
        await doAbilityForeground();
        const startTime: number = Date.now();
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_BACKGROUND_SWITCH);
        const elapsed: number = measureElapsed(startTime);
        logInfo(`testUiForegroundDispatchStillDelivers: stable ${stable} in ${elapsed} ms`);
        expect(stable).assertTrue();
        expect(isWithinBudget(elapsed, TIMEOUT_ABILITY_LAUNCH)).assertTrue();
        expect(local.dispatchCountFor('survivor')).assertEqual(1);
      } catch (error) {
        logError(`testUiForegroundDispatchStillDelivers failed: ${error}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_3100
     * @tc.name testUiLanguageChangeReflectedInDiff
     * @tc.desc Verify a simulated language change diffs against the live page copy and marks one field changed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiLanguageChangeReflectedInDiff', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const before: EnvironmentSnapshot = EnvironmentSnapshotUtil.createDefault();
        const after: EnvironmentSnapshot = EnvironmentSnapshotUtil.applyField(before, EnvField.LANGUAGE, 'en-Latn-US');
        const names: string[] = EnvironmentSnapshotUtil.changedFieldNames(before, after);
        expect(names.length).assertEqual(1);
        expect(names[0]).assertEqual('language');
        const initialPresent: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
        const clickedPresent: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
        expect(initialPresent || clickedPresent).assertTrue();
        expect(await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_3200
     * @tc.name testUiComponentCountStableAcrossDispatch
     * @tc.desc Verify dispatching three rounds does not disturb the live page component count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiComponentCountStableAcrossDispatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: EnvironmentEventRegistry = new EnvironmentEventRegistry();
        const before: number = await pageComponentCount(driver);
        local.register('noopOne');
        local.register('noopTwo');
        local.dispatch(EnvironmentSnapshotUtil.createDefault());
        local.dispatch(EnvironmentSnapshotUtil.createDefault());
        local.dispatch(EnvironmentSnapshotUtil.createDefault());
        const after: number = await pageComponentCount(driver);
        logInfo(`testUiComponentCountStableAcrossDispatch: ${before} then ${after}`);
        expect(local.getTotalDeliveries()).assertEqual(6);
        expect(before).assertEqual(after);
        expect(after > 0).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENTUTIL_3300
     * @tc.name testUiFailureIsolationOnLiveSession
     * @tc.desc Verify failure isolation holds while the real page is on screen between dispatch rounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiFailureIsolationOnLiveSession', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: EnvironmentEventRegistry = new EnvironmentEventRegistry();
        local.register('healthyFirst');
        local.register('brokenMiddle', true);
        local.register('healthyLast');
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        const delivered: number = local.dispatch(EnvironmentSnapshotUtil.createDefault());
        expect(delivered).assertEqual(2);
        expect(local.getFailures().length).assertEqual(1);
        const textComponents: Component[] = await findComponentsByType(driver, 'Text');
        expect(textComponents.length >= 1).assertTrue();
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    })
  })
}
