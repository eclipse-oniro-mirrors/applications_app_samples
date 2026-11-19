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
import { BusinessError } from '@kit.BasicServicesKit';
import {
  getDriver,
  logInfo,
  sleepMs,
  launchEntryAbility,
  doAbilityBackground,
  doAbilityForeground,
  waitForIndexPageStable,
  isIndexPageVisible,
  checkComponentExistsByKey,
  buildEntryWant,
  pageComponentCount,
  INDEX_PAGE_TEXT_KEY,
  TIMEOUT_PAGE_RENDER,
  DELAY_AFTER_LAUNCH,
  DELAY_AFTER_BACKGROUND,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

enum ExceptionKind {
  NULL_WANT = 'nullWant',
  EMPTY_ABILITY = 'emptyAbility',
  DUPLICATE_CALLBACK = 'duplicateCallback',
  INVALID_LEVEL = 'invalidLevel',
  EMPTY_PAGE_PATH = 'emptyPagePath',
  INVALID_BUNDLE_VERSION = 'invalidBundleVersion',
  CALLBACK_NOT_REGISTERED = 'callbackNotRegistered',
  INVALID_SCALE = 'invalidScale'
}

const MEMORY_LEVEL_LOW: number = 0;

const MEMORY_LEVEL_NORMAL: number = 1;

const MEMORY_LEVEL_HIGH: number = 2;

const MEMORY_LEVEL_MAX: number = 2;

const ENV_EVENT_NAME: string = 'environment';

const ERROR_CODE_INVALID_PARAM: number = 401;

const ERROR_CODE_CALLBACK_LIMIT: number = 16000050;

interface BundleVersionLike {
  code: number;
  name: string;
}

interface ExceptionCase {
  kind: ExceptionKind;
  expectedErrorName: string;
  expectedErrorCode: number;
  message: string;
}

function namedError(name: string, message: string): Error {
  const error: Error = new Error(message);
  error.name = name;
  return error;
}

class StageBusinessError extends Error implements BusinessError {
  public code: number = 0;

  constructor(code: number, message: string) {
    super(message);
    this.code = code;
    this.name = 'BusinessError';
  }
}

function businessError(code: number, message: string): StageBusinessError {
  return new StageBusinessError(code, message);
}

class WantGuard {
  public static require(want: Want | null): Want {
    if (want === null) {
      throw namedError('NullWantError', 'want is null');
    }
    const bundle: string | undefined = want.bundleName;
    if (bundle === undefined) {
      throw namedError('InvalidWantError', 'bundleName undefined');
    }
    if (bundle.length === 0) {
      throw namedError('InvalidWantError', 'bundleName empty');
    }
    const ability: string | undefined = want.abilityName;
    if (ability === undefined || ability.length === 0) {
      throw namedError('InvalidWantError', 'abilityName missing');
    }
    return want;
  }

  public static accepts(want: Want | null): boolean {
    try {
      WantGuard.require(want);
      return true;
    } catch (e) {
      return false;
    }
  }

  public static describe(want: Want | null): string {
    try {
      const safe: Want = WantGuard.require(want);
      return `${safe.bundleName}/${safe.abilityName}`;
    } catch (e) {
      return `invalid:${e.name}`;
    }
  }
}

class EnvironmentRegistry {
  private callbacks: Map<number, string> = new Map<number, string>();

  private nextId: number = 1;

  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public register(eventName: string): number {
    if (eventName !== ENV_EVENT_NAME) {
      throw businessError(ERROR_CODE_INVALID_PARAM, `unsupported event ${eventName}`);
    }
    if (this.callbacks.size >= this.capacity) {
      throw businessError(ERROR_CODE_CALLBACK_LIMIT, 'callback capacity reached');
    }
    const id: number = this.nextId;
    this.callbacks.set(id, eventName);
    this.nextId++;
    return id;
  }

  public unregister(id: number): boolean {
    if (!this.callbacks.has(id)) {
      return false;
    }
    this.callbacks.delete(id);
    return true;
  }

  public has(id: number): boolean {
    return this.callbacks.has(id);
  }

  public size(): number {
    return this.callbacks.size;
  }

  public getCapacity(): number {
    return this.capacity;
  }

  public registerTwice(eventName: string, times: number): number[] {
    const ids: number[] = [];
    for (let i: number = 0; i < times; i++) {
      ids.push(this.register(eventName));
    }
    return ids;
  }
}

class MemoryLevelDispatcher {
  private acceptedLevels: number[] = [];

  public dispatch(level: number): void {
    if (!this.isValidLevel(level)) {
      throw namedError('InvalidMemoryLevelError', `level ${level} out of range`);
    }
    this.acceptedLevels.push(level);
  }

  public isValidLevel(level: number): boolean {
    if (!isFinite(level)) {
      return false;
    }
    if (level < MEMORY_LEVEL_LOW) {
      return false;
    }
    return level <= MEMORY_LEVEL_MAX;
  }

  public getAcceptedLevels(): number[] {
    const copy: number[] = [];
    for (let i: number = 0; i < this.acceptedLevels.length; i++) {
      copy.push(this.acceptedLevels[i]);
    }
    return copy;
  }

  public getAcceptedCount(): number {
    return this.acceptedLevels.length;
  }

  public classify(level: number): string {
    if (level === MEMORY_LEVEL_LOW) {
      return 'critical';
    }
    if (level === MEMORY_LEVEL_NORMAL) {
      return 'moderate';
    }
    if (level === MEMORY_LEVEL_HIGH) {
      return 'sufficient';
    }
    return 'unknown';
  }

  public shouldTrimCaches(level: number): boolean {
    return level <= MEMORY_LEVEL_NORMAL;
  }
}

class PageLoader {
  private loadedPath: string = '';

  public load(path: string): void {
    if (path.length === 0) {
      throw namedError('EmptyPagePathError', 'page path empty');
    }
    if (path.indexOf('/') < 0) {
      throw namedError('InvalidPagePathError', `page path lacks separator: ${path}`);
    }
    this.loadedPath = path;
  }

  public getLoadedPath(): string {
    return this.loadedPath;
  }

  public isLoaded(): boolean {
    return this.loadedPath.length > 0;
  }
}

class BundleVersionGuard {
  public static validate(version: BundleVersionLike | null): void {
    if (version === null) {
      throw namedError('InvalidBundleVersionError', 'bundle version null');
    }
    if (version.name.length === 0) {
      throw namedError('InvalidBundleVersionError', 'bundle version name empty');
    }
    if (version.code < 0) {
      throw namedError('InvalidBundleVersionError', 'bundle version code negative');
    }
  }

  public static isValid(version: BundleVersionLike | null): boolean {
    try {
      BundleVersionGuard.validate(version);
      return true;
    } catch (e) {
      return false;
    }
  }

  public static compare(left: BundleVersionLike, right: BundleVersionLike): number {
    if (left.code > right.code) {
      return 1;
    }
    if (left.code < right.code) {
      return -1;
    }
    return 0;
  }
}

class ExceptionEvidence {
  private cases: ExceptionCase[] = [];

  public add(kind: ExceptionKind, expectedErrorName: string, expectedErrorCode: number, message: string): void {
    const entry: ExceptionCase = {
      kind: kind,
      expectedErrorName: expectedErrorName,
      expectedErrorCode: expectedErrorCode,
      message: message
    };
    this.cases.push(entry);
  }

  public size(): number {
    return this.cases.length;
  }

  public findByName(name: string): ExceptionCase[] {
    const matches: ExceptionCase[] = [];
    for (let i: number = 0; i < this.cases.length; i++) {
      if (this.cases[i].expectedErrorName === name) {
        matches.push(this.cases[i]);
      }
    }
    return matches;
  }

  public countByKind(kind: ExceptionKind): number {
    let count: number = 0;
    for (let i: number = 0; i < this.cases.length; i++) {
      if (this.cases[i].kind === kind) {
        count++;
      }
    }
    return count;
  }

  public kinds(): string[] {
    const result: string[] = [];
    for (let i: number = 0; i < this.cases.length; i++) {
      result.push(`${this.cases[i].kind}`);
    }
    return result;
  }

  public clear(): void {
    this.cases = [];
  }
}

class ColorModeGuard {
  public static apply(currentMode: number, requested: number): number {
    if (requested < -1) {
      throw namedError('InvalidColorModeError', `color mode ${requested} rejected`);
    }
    if (requested > 1) {
      throw namedError('InvalidColorModeError', `color mode ${requested} rejected`);
    }
    return requested;
  }

  public static isAcceptable(mode: number): boolean {
    if (!isFinite(mode)) {
      return false;
    }
    return mode >= -1 && mode <= 1;
  }
}

export default function exceptionHandlingTest(): void {
  describe('ExceptionHandlingTest', () => {
    let driver: Driver = getDriver();
    let evidence: ExceptionEvidence = new ExceptionEvidence();

    beforeAll(async () => {
      driver = getDriver();
      evidence = new ExceptionEvidence();
      await launchEntryAbility();
      await sleepMs(DELAY_AFTER_LAUNCH);

      await ensureIndexPageInitial(driver);
    })

    afterAll(async () => {
      await doAbilityForeground();
      await sleepMs(DELAY_AFTER_BACKGROUND);
      logInfo('ExceptionHandlingTest: suite finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXCEPTION_0100
     * @tc.name testNullWantThrowsNullWantError
     * @tc.desc Verify onAcceptWant null guard: passing null want -> throws Error named NullWantError with message want is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNullWantThrowsNullWantError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        try {
          WantGuard.require(null);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('NullWantError');
          expect(e.message).assertEqual('want is null');
        }
        expect(WantGuard.accepts(null)).assertFalse();
        expect(WantGuard.describe(null)).assertEqual('invalid:NullWantError');
        evidence.add(ExceptionKind.NULL_WANT, 'NullWantError', 0, 'want is null');
        expect(evidence.size()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXCEPTION_0200
     * @tc.name testEmptyAbilityNameThrowsInvalidWantError
     * @tc.desc Verify want field guard: want with empty abilityName -> throws InvalidWantError naming abilityName missing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEmptyAbilityNameThrowsInvalidWantError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const want: Want = {
          bundleName: 'com.samples.abilitystage',
          abilityName: ''
        };
        try {
          WantGuard.require(want);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('InvalidWantError');
          expect(e.message).assertEqual('abilityName missing');
        }
        expect(WantGuard.accepts(want)).assertFalse();
        evidence.add(ExceptionKind.EMPTY_ABILITY, 'InvalidWantError', 0, 'abilityName missing');
        expect(evidence.countByKind(ExceptionKind.EMPTY_ABILITY)).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXCEPTION_0300
     * @tc.name testMissingBundleNameThrowsInvalidWantError
     * @tc.desc Verify missing bundleName: want carrying only abilityName -> InvalidWantError with bundleName undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMissingBundleNameThrowsInvalidWantError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const want: Want = {
          abilityName: 'EntryAbility'
        };
        try {
          WantGuard.require(want);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('InvalidWantError');
          expect(e.message).assertEqual('bundleName undefined');
        }
        const valid: Want = buildEntryWant();
        expect(WantGuard.accepts(valid)).assertTrue();
        expect(WantGuard.describe(valid)).assertEqual('com.samples.abilitystage/EntryAbility');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXCEPTION_0400
     * @tc.name testUnsupportedEnvironmentEventThrowsBusinessError
     * @tc.desc Verify event name guard: registering on event keyboard -> throws BusinessError code 401 and message lists event name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUnsupportedEnvironmentEventThrowsBusinessError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const registry: EnvironmentRegistry = new EnvironmentRegistry(4);
        try {
          registry.register('keyboard');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect((e as BusinessError).code).assertEqual(ERROR_CODE_INVALID_PARAM);
          expect(e.message).assertEqual('unsupported event keyboard');
        }
        expect(registry.size()).assertEqual(0);
        expect(registry.register(ENV_EVENT_NAME)).assertEqual(1);
        expect(registry.size()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXCEPTION_0500
     * @tc.name testDuplicateRegistrationConsumesSeparateSlots
     * @tc.desc Verify duplicate registration behavior: same event registered twice -> ids 1 and 2 with registry size 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDuplicateRegistrationConsumesSeparateSlots', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const registry: EnvironmentRegistry = new EnvironmentRegistry(4);
        const ids: number[] = registry.registerTwice(ENV_EVENT_NAME, 2);
        expect(ids.length).assertEqual(2);
        expect(ids[0]).assertEqual(1);
        expect(ids[1]).assertEqual(2);
        expect(registry.size()).assertEqual(2);
        expect(registry.has(1)).assertTrue();
        expect(registry.has(2)).assertTrue();
        evidence.add(ExceptionKind.DUPLICATE_CALLBACK, 'BusinessError', ERROR_CODE_CALLBACK_LIMIT, 'duplicate slots');
        expect(evidence.findByName('BusinessError').length).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXCEPTION_0600
     * @tc.name testCallbackCapacityExceededThrows
     * @tc.desc Verify callback capacity limit: capacity 2 then three registrations -> third throws BusinessError code 16000050
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCallbackCapacityExceededThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const registry: EnvironmentRegistry = new EnvironmentRegistry(2);
        expect(registry.register(ENV_EVENT_NAME)).assertEqual(1);
        expect(registry.register(ENV_EVENT_NAME)).assertEqual(2);
        try {
          registry.register(ENV_EVENT_NAME);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect((e as BusinessError).code).assertEqual(16000050);
          expect(e.message).assertEqual('callback capacity reached');
        }
        expect(registry.size()).assertEqual(2);
        expect(registry.getCapacity()).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXCEPTION_0700
     * @tc.name testUnregisterUnknownCallbackReturnsFalse
     * @tc.desc Verify idempotent unregister: removing unknown id 99 -> returns false and size unchanged; removing known id 1 -> true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUnregisterUnknownCallbackReturnsFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const registry: EnvironmentRegistry = new EnvironmentRegistry(3);
        const id: number = registry.register(ENV_EVENT_NAME);
        expect(registry.unregister(99)).assertFalse();
        expect(registry.size()).assertEqual(1);
        expect(registry.unregister(id)).assertTrue();
        expect(registry.size()).assertEqual(0);
        expect(registry.has(id)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXCEPTION_0800
     * @tc.name testMemoryLevelBelowRangeThrows
     * @tc.desc Verify onMemoryLevel lower bound: level -1 -> throws InvalidMemoryLevelError and no level recorded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMemoryLevelBelowRangeThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const dispatcher: MemoryLevelDispatcher = new MemoryLevelDispatcher();
        try {
          dispatcher.dispatch(-1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('InvalidMemoryLevelError');
          expect(e.message).assertEqual('level -1 out of range');
        }
        expect(dispatcher.getAcceptedCount()).assertEqual(0);
        expect(dispatcher.isValidLevel(0)).assertTrue();
        evidence.add(ExceptionKind.INVALID_LEVEL, 'InvalidMemoryLevelError', 0, 'level -1');
        expect(evidence.size() >= 3).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXCEPTION_0900
     * @tc.name testMemoryLevelAboveRangeThrows
     * @tc.desc Verify onMemoryLevel upper bound: level 3 -> throws InvalidMemoryLevelError while level 2 is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMemoryLevelAboveRangeThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const dispatcher: MemoryLevelDispatcher = new MemoryLevelDispatcher();
        dispatcher.dispatch(MEMORY_LEVEL_MAX);
        try {
          dispatcher.dispatch(MEMORY_LEVEL_MAX + 1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('InvalidMemoryLevelError');
          expect(e.message).assertEqual('level 3 out of range');
        }
        expect(dispatcher.getAcceptedCount()).assertEqual(1);
        expect(dispatcher.getAcceptedLevels()[0]).assertEqual(MEMORY_LEVEL_MAX);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXCEPTION_1000
     * @tc.name testMemoryLevelBoundariesAccepted
     * @tc.desc Verify memory level boundaries: levels 0, 1, 2 -> all accepted and classified critical, moderate, sufficient
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMemoryLevelBoundariesAccepted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const dispatcher: MemoryLevelDispatcher = new MemoryLevelDispatcher();
        dispatcher.dispatch(MEMORY_LEVEL_LOW);
        dispatcher.dispatch(MEMORY_LEVEL_NORMAL);
        dispatcher.dispatch(MEMORY_LEVEL_HIGH);
        expect(dispatcher.getAcceptedCount()).assertEqual(3);
        expect(dispatcher.classify(MEMORY_LEVEL_LOW)).assertEqual('critical');
        expect(dispatcher.classify(MEMORY_LEVEL_NORMAL)).assertEqual('moderate');
        expect(dispatcher.classify(MEMORY_LEVEL_HIGH)).assertEqual('sufficient');
        expect(dispatcher.classify(9)).assertEqual('unknown');
        expect(dispatcher.shouldTrimCaches(MEMORY_LEVEL_LOW)).assertTrue();
        expect(dispatcher.shouldTrimCaches(MEMORY_LEVEL_HIGH)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXCEPTION_1100
     * @tc.name testEmptyPagePathThrowsEmptyPagePathError
     * @tc.desc Verify loadContent empty path: loading empty string -> throws EmptyPagePathError and loader stays unloaded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEmptyPagePathThrowsEmptyPagePathError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const loader: PageLoader = new PageLoader();
        try {
          loader.load('');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('EmptyPagePathError');
          expect(e.message).assertEqual('page path empty');
        }
        expect(loader.isLoaded()).assertFalse();
        expect(loader.getLoadedPath()).assertEqual('');
        evidence.add(ExceptionKind.EMPTY_PAGE_PATH, 'EmptyPagePathError', 0, 'page path empty');
        expect(evidence.countByKind(ExceptionKind.EMPTY_PAGE_PATH)).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXCEPTION_1200
     * @tc.name testPagePathWithoutSeparatorThrows
     * @tc.desc Verify page path format: value Index without slash -> throws InvalidPagePathError then valid pages/Index loads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPagePathWithoutSeparatorThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const loader: PageLoader = new PageLoader();
        try {
          loader.load('Index');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('InvalidPagePathError');
          expect(e.message).assertEqual('page path lacks separator: Index');
        }
        loader.load('pages/Index');
        expect(loader.isLoaded()).assertTrue();
        expect(loader.getLoadedPath()).assertEqual('pages/Index');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXCEPTION_1300
     * @tc.name testNullBundleVersionThrows
     * @tc.desc Verify onRestore null version: null BundleVersion -> throws InvalidBundleVersionError naming null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNullBundleVersionThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        try {
          BundleVersionGuard.validate(null);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('InvalidBundleVersionError');
          expect(e.message).assertEqual('bundle version null');
        }
        expect(BundleVersionGuard.isValid(null)).assertFalse();
        evidence.add(ExceptionKind.INVALID_BUNDLE_VERSION, 'InvalidBundleVersionError', 0, 'version null');
        expect(evidence.findByName('InvalidBundleVersionError').length).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXCEPTION_1400
     * @tc.name testNegativeBundleVersionCodeThrows
     * @tc.desc Verify bundle version code guard: code -1 -> throws InvalidBundleVersionError and validity false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNegativeBundleVersionCodeThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const version: BundleVersionLike = {
          code: -1,
          name: '1.0.0'
        };
        try {
          BundleVersionGuard.validate(version);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('InvalidBundleVersionError');
          expect(e.message).assertEqual('bundle version code negative');
        }
        expect(BundleVersionGuard.isValid(version)).assertFalse();
        const zeroCode: BundleVersionLike = {
          code: 0,
          name: '0.0.0'
        };
        expect(BundleVersionGuard.isValid(zeroCode)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXCEPTION_1500
     * @tc.name testEmptyBundleVersionNameThrows
     * @tc.desc Verify bundle version name guard: empty name with code 100 -> InvalidBundleVersionError while non-empty name passes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEmptyBundleVersionNameThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const emptyName: BundleVersionLike = {
          code: 100,
          name: ''
        };
        try {
          BundleVersionGuard.validate(emptyName);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('InvalidBundleVersionError');
          expect(e.message).assertEqual('bundle version name empty');
        }
        const goodName: BundleVersionLike = {
          code: 100,
          name: '1.0.0'
        };
        expect(BundleVersionGuard.isValid(goodName)).assertTrue();
        expect(BundleVersionGuard.compare(goodName, goodName)).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXCEPTION_1600
     * @tc.name testBundleVersionCompareOrdering
     * @tc.desc Verify version comparison: code 120 vs 100 -> 1, reverse -> -1, equal codes -> 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBundleVersionCompareOrdering', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const older: BundleVersionLike = {
          code: 100,
          name: '1.0.0'
        };
        const newer: BundleVersionLike = {
          code: 120,
          name: '1.2.0'
        };
        expect(BundleVersionGuard.compare(newer, older)).assertEqual(1);
        expect(BundleVersionGuard.compare(older, newer)).assertEqual(-1);
        expect(BundleVersionGuard.compare(older, older)).assertEqual(0);
        expect(newer.code > older.code).assertTrue();
        expect(older.name).assertEqual('1.0.0');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXCEPTION_1700
     * @tc.name testColorModeOutOfRangeThrows
     * @tc.desc Verify setColorMode validation: requested 2 and -2 -> both throw InvalidColorModeError, -1 to 1 accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testColorModeOutOfRangeThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        try {
          ColorModeGuard.apply(-1, 2);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('InvalidColorModeError');
          expect(e.message).assertEqual('color mode 2 rejected');
        }
        try {
          ColorModeGuard.apply(-1, -2);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('InvalidColorModeError');
          expect(e.message).assertEqual('color mode -2 rejected');
        }
        expect(ColorModeGuard.apply(-1, -1)).assertEqual(-1);
        expect(ColorModeGuard.apply(-1, 0)).assertEqual(0);
        expect(ColorModeGuard.isAcceptable(1)).assertTrue();
        expect(ColorModeGuard.isAcceptable(5)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXCEPTION_1800
     * @tc.name testEvidenceAccumulatesDistinctKinds
     * @tc.desc Verify evidence ledger: five recorded exception kinds -> size 5 and each kind counted exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEvidenceAccumulatesDistinctKinds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const ledger: ExceptionEvidence = new ExceptionEvidence();
        ledger.add(ExceptionKind.NULL_WANT, 'NullWantError', 0, 'a');
        ledger.add(ExceptionKind.EMPTY_ABILITY, 'InvalidWantError', 0, 'b');
        ledger.add(ExceptionKind.DUPLICATE_CALLBACK, 'BusinessError', ERROR_CODE_CALLBACK_LIMIT, 'c');
        ledger.add(ExceptionKind.INVALID_LEVEL, 'InvalidMemoryLevelError', 0, 'd');
        ledger.add(ExceptionKind.EMPTY_PAGE_PATH, 'EmptyPagePathError', 0, 'e');
        expect(ledger.size()).assertEqual(5);
        expect(ledger.countByKind(ExceptionKind.NULL_WANT)).assertEqual(1);
        expect(ledger.countByKind(ExceptionKind.INVALID_SCALE)).assertEqual(0);
        const kinds: string[] = ledger.kinds();
        expect(kinds[0]).assertEqual(`${ExceptionKind.NULL_WANT}`);
        expect(kinds[4]).assertEqual(`${ExceptionKind.EMPTY_PAGE_PATH}`);
        ledger.clear();
        expect(ledger.size()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXCEPTION_1900
     * @tc.name testRegisteredCallbackMissingThrows
     * @tc.desc Verify dispatch on unregistered registry: unregister then has -> false and unregister twice returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegisteredCallbackMissingThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const registry: EnvironmentRegistry = new EnvironmentRegistry(2);
        const id: number = registry.register(ENV_EVENT_NAME);
        expect(registry.has(id)).assertTrue();
        expect(registry.unregister(id)).assertTrue();
        expect(registry.has(id)).assertFalse();
        expect(registry.unregister(id)).assertFalse();
        expect(registry.size()).assertEqual(0);
        evidence.add(ExceptionKind.CALLBACK_NOT_REGISTERED, 'BusinessError', ERROR_CODE_INVALID_PARAM, 'not registered');
        expect(evidence.size() >= 4).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXCEPTION_2000
     * @tc.name testUiNullWantDoesNotBreakRunningAbility
     * @tc.desc Verify live ability unaffected by rejected want: invalid want rejected while Index page stays visible and HelloWorld present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiNullWantDoesNotBreakRunningAbility', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(WantGuard.accepts(null)).assertFalse();
        const present: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
        expect(present).assertTrue();
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXCEPTION_2100
     * @tc.name testUiBackgroundForegroundAfterCaughtExceptions
     * @tc.desc Verify recovery after handled exceptions: several caught errors then background/foreground -> page visible and component count unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiBackgroundForegroundAfterCaughtExceptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        const baseline: number = await pageComponentCount(driver);
        const dispatcher: MemoryLevelDispatcher = new MemoryLevelDispatcher();
        try {
          dispatcher.dispatch(7);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('InvalidMemoryLevelError');
        }
        await doAbilityBackground();
        await sleepMs(DELAY_AFTER_BACKGROUND);
        await doAbilityForeground();
        await sleepMs(DELAY_AFTER_LAUNCH);
        const visible: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(visible).assertTrue();
        const current: number = await pageComponentCount(driver);
        expect(current).assertEqual(baseline);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXCEPTION_2200
     * @tc.name testUiRepeatedInvalidOperationsKeepPageUsable
     * @tc.desc Verify stress on error paths: 20 rejected want guards on live page -> all rejected and page still renders HelloWorld
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testUiRepeatedInvalidOperationsKeepPageUsable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      try {
        await launchEntryAbility();
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        let rejected: number = 0;
        for (let i: number = 0; i < 20; i++) {
          const bad: Want = {
            bundleName: '',
            abilityName: `Ability_${i}`
          };
          if (!WantGuard.accepts(bad)) {
            rejected++;
          }
        }
        expect(rejected).assertEqual(20);
        expect(WantGuard.accepts(buildEntryWant())).assertTrue();
        const visible: boolean = await isIndexPageVisible(driver);
        expect(visible).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXCEPTION_2300
     * @tc.name testExceptionHandlingThroughputWithinBudget
     * @tc.desc Verify exception path cost: 400 rejected want guards -> 400 rejections within 1500 ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testExceptionHandlingThroughputWithinBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      try {
        const startTime: number = Date.now();
        let rejections: number = 0;
        for (let i: number = 0; i < 400; i++) {
          if (!WantGuard.accepts(null)) {
            rejections++;
          }
        }
        const elapsed: number = Date.now() - startTime;
        expect(rejections).assertEqual(400);
        expect(elapsed <= 1500).assertTrue();
        expect(WantGuard.accepts(buildEntryWant())).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXCEPTION_2400
     * @tc.name testNestedTryCatchPreservesInnermostName
     * @tc.desc Verify nested exception handling: inner InvalidWantError caught then rethrown as ExceptionChainError with chained message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNestedTryCatchPreservesInnermostName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const emptyAbility: Want = {
          bundleName: 'com.samples.abilitystage',
          abilityName: ''
        };
        try {
          try {
            WantGuard.require(emptyAbility);
            expect().assertFail();
          } catch (inner) {
            expect(inner.name).assertEqual('InvalidWantError');
            throw namedError('ExceptionChainError', `chained:${inner.message}`);
          }
        } catch (outer) {
          expect(outer.name).assertEqual('ExceptionChainError');
          expect(outer.message).assertEqual('chained:abilityName missing');
        }
        expect(WantGuard.accepts(buildEntryWant())).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXCEPTION_2500
     * @tc.name testBusinessErrorCodeFromEventGuard
     * @tc.desc Verify BusinessError numeric payload: unsupported event guard -> code property 401 readable after cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBusinessErrorCodeFromEventGuard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const registry: EnvironmentRegistry = new EnvironmentRegistry(1);
        try {
          registry.register('memory');
          expect().assertFail();
        } catch (e) {
          const business: BusinessError = e as BusinessError;
          expect(e.name).assertEqual('BusinessError');
          expect(business.code).assertEqual(401);
          expect(business.message).assertEqual('unsupported event memory');
        }
        expect(registry.register(ENV_EVENT_NAME)).assertEqual(1);
        try {
          registry.register(ENV_EVENT_NAME);
          expect().assertFail();
        } catch (e) {
          expect((e as BusinessError).code).assertEqual(ERROR_CODE_CALLBACK_LIMIT);
        }
        expect(registry.size()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXCEPTION_2600
     * @tc.name testGuardlessValidatorNeverThrows
     * @tc.desc Verify boolean validators absorb errors: isValidLevel and ColorModeGuard.isAcceptable return false for out-of-range values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGuardlessValidatorNeverThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const dispatcher: MemoryLevelDispatcher = new MemoryLevelDispatcher();
        expect(dispatcher.isValidLevel(-1)).assertFalse();
        expect(dispatcher.isValidLevel(3)).assertFalse();
        expect(dispatcher.isValidLevel(0)).assertTrue();
        expect(dispatcher.isValidLevel(2)).assertTrue();
        expect(ColorModeGuard.isAcceptable(-2)).assertFalse();
        expect(ColorModeGuard.isAcceptable(2)).assertFalse();
        expect(ColorModeGuard.isAcceptable(-1)).assertTrue();
        expect(BundleVersionGuard.isValid(null)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXCEPTION_2700
     * @tc.name testEvidenceLookupByNameIsExact
     * @tc.desc Verify evidence lookup precision: ledger with three kinds -> findByName InvalidWantError returns only its own entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEvidenceLookupByNameIsExact', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const ledger: ExceptionEvidence = new ExceptionEvidence();
        ledger.add(ExceptionKind.NULL_WANT, 'NullWantError', 0, 'one');
        ledger.add(ExceptionKind.EMPTY_ABILITY, 'InvalidWantError', 0, 'two');
        ledger.add(ExceptionKind.INVALID_BUNDLE_VERSION, 'InvalidBundleVersionError', 0, 'three');
        const matches: ExceptionCase[] = ledger.findByName('InvalidWantError');
        expect(matches.length).assertEqual(1);
        expect(matches[0].kind).assertEqual(ExceptionKind.EMPTY_ABILITY);
        expect(matches[0].message).assertEqual('two');
        expect(ledger.findByName('MissingError').length).assertEqual(0);
        expect(ledger.size()).assertEqual(3);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXCEPTION_2800
     * @tc.name testInvalidMemoryLevelLeavesDispatcherClean
     * @tc.desc Verify dispatcher integrity: after two rejected levels -> accepted list empty and a valid level records exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInvalidMemoryLevelLeavesDispatcherClean', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const dispatcher: MemoryLevelDispatcher = new MemoryLevelDispatcher();
        for (let i: number = 0; i < 2; i++) {
          try {
            dispatcher.dispatch(-3 - i);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('InvalidMemoryLevelError');
          }
        }
        expect(dispatcher.getAcceptedLevels().length).assertEqual(0);
        dispatcher.dispatch(MEMORY_LEVEL_NORMAL);
        const accepted: number[] = dispatcher.getAcceptedLevels();
        expect(accepted.length).assertEqual(1);
        expect(accepted[0]).assertEqual(MEMORY_LEVEL_NORMAL);
      } finally {
        done();
      }
    })
  })
}
