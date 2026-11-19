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
  logInfo,
  getBundleName,
  buildEntryWant,
  launchEntryAbility,
  startAbilityByWant,
  serializedDelay,
  waitForIndexPageStable,
  isIndexPageVisible,
  checkTextContent,
  waitForTextVisible,
  tapComponentByText,
  doAbilityBackground,
  doAbilityForeground,
  BUNDLE_NAME,
  MODULE_NAME,
  ENTRY_ABILITY_NAME,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  INDEX_PAGE_PATH,
  DELAY_AFTER_LAUNCH,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

const MAX_ABILITY_NAME_LENGTH: number = 63;

const MAX_PARAMETER_KEY_LENGTH: number = 32;

const RETRY_LIMIT_MIN: number = 0;

const RETRY_LIMIT_MAX: number = 10;

const MIN_DEVICE_COUNT: number = 1;

const MAX_DEVICE_COUNT: number = 8;

enum WantCheckCode {
  OK = 'ok',
  NULL_WANT = 'null_want',
  BUNDLE_MISSING = 'bundle_missing',
  BUNDLE_MISMATCH = 'bundle_mismatch',
  ABILITY_MISSING = 'ability_missing',
  ABILITY_MISMATCH = 'ability_mismatch',
  ABILITY_TOO_LONG = 'ability_too_long',
  MODULE_MISSING = 'module_missing',
  MODULE_MISMATCH = 'module_mismatch',
  DEVICE_MISSING = 'device_missing',
  DEVICE_OUT_OF_RANGE = 'device_out_of_range',
  PARAM_KEY_EMPTY = 'param_key_empty',
  PARAM_KEY_TOO_LONG = 'param_key_too_long',
  PARAM_TYPE_MISMATCH = 'param_type_mismatch',
  PARAM_VALUE_MISSING = 'param_value_missing'
}

enum ParameterType {
  STRING = 'string',
  NUMBER = 'number',
  BOOLEAN = 'boolean'
}

class WantSpec {
  public bundleName: string;
  public abilityName: string;
  public moduleName: string;
  public deviceCount: number;

  constructor(bundleName: string, abilityName: string, moduleName: string, deviceCount: number = MIN_DEVICE_COUNT) {
    this.bundleName = bundleName;
    this.abilityName = abilityName;
    this.moduleName = moduleName;
    this.deviceCount = deviceCount;
  }

  public clone(): WantSpec {
    return new WantSpec(this.bundleName, this.abilityName, this.moduleName, this.deviceCount);
  }
}

class ParameterEntryItem {
  public key: string;
  public type: ParameterType;
  public value: string;

  constructor(key: string, type: ParameterType, value: string) {
    this.key = key;
    this.type = type;
    this.value = value;
  }

  public sameAs(other: ParameterEntryItem): boolean {
    return this.key === other.key && this.type === other.type && this.value === other.value;
  }
}

class ParameterBag {
  private items: ParameterEntryItem[] = [];

  public add(item: ParameterEntryItem): boolean {
    if (this.indexOf(item.key) >= 0) {
      return false;
    }
    this.items.push(item);
    return true;
  }

  public indexOf(key: string): number {
    for (let i = 0; i < this.items.length; i++) {
      if (this.items[i].key === key) {
        return i;
      }
    }
    return -1;
  }

  public find(key: string): ParameterEntryItem | null {
    const index: number = this.indexOf(key);
    if (index < 0) {
      return null;
    }
    return this.items[index];
  }

  public size(): number {
    return this.items.length;
  }

  public keys(): string[] {
    const result: string[] = [];
    for (let i = 0; i < this.items.length; i++) {
      result.push(this.items[i].key);
    }
    return result;
  }

  public remove(key: string): boolean {
    const index: number = this.indexOf(key);
    if (index < 0) {
      return false;
    }
    this.items.splice(index, 1);
    return true;
  }

  public typeOf(key: string): string {
    const item: ParameterEntryItem | null = this.find(key);
    if (item === null) {
      return 'absent';
    }
    return item.type;
  }
}

class ParameterSchema {
  public static buildDefault(): ParameterEntryItem[] {
    return [
      new ParameterEntryItem('sessionId', ParameterType.STRING, ''),
      new ParameterEntryItem('retryCount', ParameterType.NUMBER, '0'),
      new ParameterEntryItem('offlineMode', ParameterType.BOOLEAN, 'false')
    ];
  }

  public static checkKeyLength(key: string): WantCheckCode {
    if (key.length === 0) {
      return WantCheckCode.PARAM_KEY_EMPTY;
    }
    if (key.length > MAX_PARAMETER_KEY_LENGTH) {
      return WantCheckCode.PARAM_KEY_TOO_LONG;
    }
    return WantCheckCode.OK;
  }

  public static checkAgainst(bag: ParameterBag): WantCheckCode {
    const expected: ParameterEntryItem[] = ParameterSchema.buildDefault();
    for (let i = 0; i < expected.length; i++) {
      const actual: ParameterEntryItem | null = bag.find(expected[i].key);
      if (actual === null) {
        return WantCheckCode.PARAM_VALUE_MISSING;
      }
      if (actual.type !== expected[i].type) {
        return WantCheckCode.PARAM_TYPE_MISMATCH;
      }
    }
    return WantCheckCode.OK;
  }

  public static isRetryWithinRange(raw: string): boolean {
    const parsed: number = parseInt(raw, 10);
    if (isNaN(parsed)) {
      return false;
    }
    return parsed >= RETRY_LIMIT_MIN && parsed <= RETRY_LIMIT_MAX;
  }

  public static isOfflineFlagValid(raw: string): boolean {
    return raw === 'true' || raw === 'false';
  }
}

class WantErrorFactory {
  public static nameOf(code: WantCheckCode): string {
    if (code === WantCheckCode.NULL_WANT) {
      return 'NullWantError';
    }
    if (code === WantCheckCode.BUNDLE_MISSING) {
      return 'BundleNameMissingError';
    }
    if (code === WantCheckCode.BUNDLE_MISMATCH) {
      return 'BundleNameMismatchError';
    }
    if (code === WantCheckCode.ABILITY_MISSING) {
      return 'AbilityNameMissingError';
    }
    if (code === WantCheckCode.ABILITY_MISMATCH) {
      return 'AbilityNameMismatchError';
    }
    if (code === WantCheckCode.ABILITY_TOO_LONG) {
      return 'AbilityNameTooLongError';
    }
    if (code === WantCheckCode.MODULE_MISSING) {
      return 'ModuleNameMissingError';
    }
    if (code === WantCheckCode.MODULE_MISMATCH) {
      return 'ModuleNameMismatchError';
    }
    if (code === WantCheckCode.DEVICE_MISSING) {
      return 'DeviceIdMissingError';
    }
    if (code === WantCheckCode.DEVICE_OUT_OF_RANGE) {
      return 'DeviceIdRangeError';
    }
    if (code === WantCheckCode.PARAM_KEY_EMPTY) {
      return 'ParameterKeyEmptyError';
    }
    if (code === WantCheckCode.PARAM_KEY_TOO_LONG) {
      return 'ParameterKeyTooLongError';
    }
    if (code === WantCheckCode.PARAM_TYPE_MISMATCH) {
      return 'ParameterTypeMismatchError';
    }
    if (code === WantCheckCode.PARAM_VALUE_MISSING) {
      return 'ParameterValueMissingError';
    }
    return 'NoError';
  }

  public static create(code: WantCheckCode, message: string): Error {
    const error: Error = new Error(message);
    error.name = WantErrorFactory.nameOf(code);
    return error;
  }
}

class WantValidator {
  private expectedBundle: string;
  private expectedAbility: string;
  private expectedModule: string;

  constructor(expectedBundle: string, expectedAbility: string, expectedModule: string) {
    this.expectedBundle = expectedBundle;
    this.expectedAbility = expectedAbility;
    this.expectedModule = expectedModule;
  }

  public validateBundle(spec: WantSpec): WantCheckCode {
    if (spec.bundleName.length === 0) {
      return WantCheckCode.BUNDLE_MISSING;
    }
    if (spec.bundleName !== this.expectedBundle) {
      return WantCheckCode.BUNDLE_MISMATCH;
    }
    return WantCheckCode.OK;
  }

  public validateAbility(spec: WantSpec): WantCheckCode {
    if (spec.abilityName.length === 0) {
      return WantCheckCode.ABILITY_MISSING;
    }
    if (spec.abilityName.length > MAX_ABILITY_NAME_LENGTH) {
      return WantCheckCode.ABILITY_TOO_LONG;
    }
    if (spec.abilityName !== this.expectedAbility) {
      return WantCheckCode.ABILITY_MISMATCH;
    }
    return WantCheckCode.OK;
  }

  public validateModule(spec: WantSpec): WantCheckCode {
    if (spec.moduleName.length === 0) {
      return WantCheckCode.MODULE_MISSING;
    }
    if (spec.moduleName !== this.expectedModule) {
      return WantCheckCode.MODULE_MISMATCH;
    }
    return WantCheckCode.OK;
  }

  public validateDevice(spec: WantSpec): WantCheckCode {
    if (spec.deviceCount < MIN_DEVICE_COUNT) {
      return WantCheckCode.DEVICE_MISSING;
    }
    if (spec.deviceCount > MAX_DEVICE_COUNT) {
      return WantCheckCode.DEVICE_OUT_OF_RANGE;
    }
    return WantCheckCode.OK;
  }

  public validate(spec: WantSpec): WantCheckCode {
    const checks: WantCheckCode[] = [
      this.validateBundle(spec),
      this.validateAbility(spec),
      this.validateModule(spec),
      this.validateDevice(spec)
    ];
    for (let i = 0; i < checks.length; i++) {
      if (checks[i] !== WantCheckCode.OK) {
        return checks[i];
      }
    }
    return WantCheckCode.OK;
  }

  public requireValid(spec: WantSpec): void {
    const code: WantCheckCode = this.validate(spec);
    if (code === WantCheckCode.OK) {
      return;
    }
    throw WantErrorFactory.create(code, `want rejected: ${code}`);
  }

  public requireParameters(bag: ParameterBag): void {
    const code: WantCheckCode = ParameterSchema.checkAgainst(bag);
    if (code === WantCheckCode.OK) {
      return;
    }
    throw WantErrorFactory.create(code, `parameters rejected: ${code}`);
  }

  public isValid(spec: WantSpec): boolean {
    return this.validate(spec) === WantCheckCode.OK;
  }

  public firstInvalidField(spec: WantSpec): string {
    if (this.validateBundle(spec) !== WantCheckCode.OK) {
      return 'bundleName';
    }
    if (this.validateAbility(spec) !== WantCheckCode.OK) {
      return 'abilityName';
    }
    if (this.validateModule(spec) !== WantCheckCode.OK) {
      return 'moduleName';
    }
    if (this.validateDevice(spec) !== WantCheckCode.OK) {
      return 'deviceCount';
    }
    return 'none';
  }

  public toWant(spec: WantSpec): Want {
    const want: Want = {
      bundleName: spec.bundleName,
      abilityName: spec.abilityName,
      moduleName: spec.moduleName
    };
    return want;
  }
}

class WantCorpus {
  public static validSpec(): WantSpec {
    return new WantSpec(BUNDLE_NAME, ENTRY_ABILITY_NAME, MODULE_NAME);
  }

  public static withBundle(bundleName: string): WantSpec {
    return new WantSpec(bundleName, ENTRY_ABILITY_NAME, MODULE_NAME);
  }

  public static withAbility(abilityName: string): WantSpec {
    return new WantSpec(BUNDLE_NAME, abilityName, MODULE_NAME);
  }

  public static withModule(moduleName: string): WantSpec {
    return new WantSpec(BUNDLE_NAME, ENTRY_ABILITY_NAME, moduleName);
  }

  public static withDevices(count: number): WantSpec {
    return new WantSpec(BUNDLE_NAME, ENTRY_ABILITY_NAME, MODULE_NAME, count);
  }

  public static abilityOfLength(length: number): string {
    let result: string = '';
    for (let i = 0; i < length; i++) {
      result = result + 'A';
    }
    return result;
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

export default function wantParameterValidationTest(): void {
  describe('WantParameterValidationTest', () => {
    const validator: WantValidator = new WantValidator(BUNDLE_NAME, ENTRY_ABILITY_NAME, MODULE_NAME);

    beforeAll(async () => {
      await launchEntryAbility();
      await ensureIndexPageInitial(getDriver());
    });

    afterAll(async () => {
      logInfo('WantParameterValidationTest suite finished');
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_0100
     * @tc.name testWantValidSpecAccepted
     * @tc.desc Verify a want with bundle com.samples.abilitystage EntryAbility and module entry is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantValidSpecAccepted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const spec: WantSpec = WantCorpus.validSpec();
          expect(validator.validate(spec)).assertEqual(WantCheckCode.OK);
          expect(validator.isValid(spec)).assertTrue();
          expect(validator.firstInvalidField(spec)).assertEqual('none');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_0200
     * @tc.name testWantBundleEmptyRejected
     * @tc.desc Verify empty bundleName yields BUNDLE_MISSING
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantBundleEmptyRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const spec: WantSpec = WantCorpus.withBundle('');
          expect(validator.validate(spec)).assertEqual(WantCheckCode.BUNDLE_MISSING);
          expect(validator.firstInvalidField(spec)).assertEqual('bundleName');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_0300
     * @tc.name testWantBundleMismatchRejected
     * @tc.desc Verify foreign bundle name com.samples.other yields BUNDLE_MISMATCH
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantBundleMismatchRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(validator.validate(WantCorpus.withBundle('com.samples.other')))
            .assertEqual(WantCheckCode.BUNDLE_MISMATCH);
          expect(validator.isValid(WantCorpus.withBundle('com.samples.other'))).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_0400
     * @tc.name testWantAbilityEmptyRejected
     * @tc.desc Verify empty abilityName yields ABILITY_MISSING
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantAbilityEmptyRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(validator.validate(WantCorpus.withAbility(''))).assertEqual(WantCheckCode.ABILITY_MISSING);
          expect(validator.firstInvalidField(WantCorpus.withAbility('')))
            .assertEqual('abilityName');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_0500
     * @tc.name testWantAbilityMismatchRejected
     * @tc.desc Verify ability name OtherAbility yields ABILITY_MISMATCH
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantAbilityMismatchRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(validator.validate(WantCorpus.withAbility('OtherAbility')))
            .assertEqual(WantCheckCode.ABILITY_MISMATCH);
          expect(validator.validate(WantCorpus.withAbility('entryability')))
            .assertEqual(WantCheckCode.ABILITY_MISMATCH);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_0600
     * @tc.name testWantAbilityNameTooLong
     * @tc.desc Verify a 64 character abilityName yields ABILITY_TOO_LONG
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantAbilityNameTooLong', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const tooLong: string = WantCorpus.abilityOfLength(64);
          expect(tooLong.length).assertEqual(64);
          expect(validator.validate(WantCorpus.withAbility(tooLong))).assertEqual(WantCheckCode.ABILITY_TOO_LONG);
          expect(validator.validate(WantCorpus.validSpec())).assertEqual(WantCheckCode.OK);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_0700
     * @tc.name testWantModuleEmptyRejected
     * @tc.desc Verify empty moduleName yields MODULE_MISSING
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantModuleEmptyRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(validator.validate(WantCorpus.withModule(''))).assertEqual(WantCheckCode.MODULE_MISSING);
          expect(validator.firstInvalidField(WantCorpus.withModule(''))).assertEqual('moduleName');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_0800
     * @tc.name testWantModuleMismatchRejected
     * @tc.desc Verify module name feature yields MODULE_MISMATCH
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantModuleMismatchRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(validator.validate(WantCorpus.withModule('feature'))).assertEqual(WantCheckCode.MODULE_MISMATCH);
          expect(validator.validate(WantCorpus.withModule(MODULE_NAME))).assertEqual(WantCheckCode.OK);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_0900
     * @tc.name testWantDeviceCountZeroRejected
     * @tc.desc Verify zero device count yields DEVICE_MISSING
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantDeviceCountZeroRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(validator.validate(WantCorpus.withDevices(0))).assertEqual(WantCheckCode.DEVICE_MISSING);
          expect(validator.validate(WantCorpus.withDevices(MIN_DEVICE_COUNT))).assertEqual(WantCheckCode.OK);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_1000
     * @tc.name testWantDeviceCountUpperBound
     * @tc.desc Verify device count 8 is accepted and 9 yields DEVICE_OUT_OF_RANGE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantDeviceCountUpperBound', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(validator.validate(WantCorpus.withDevices(MAX_DEVICE_COUNT))).assertEqual(WantCheckCode.OK);
          expect(validator.validate(WantCorpus.withDevices(MAX_DEVICE_COUNT + 1)))
            .assertEqual(WantCheckCode.DEVICE_OUT_OF_RANGE);
          expect(validator.validate(WantCorpus.withDevices(-1))).assertEqual(WantCheckCode.DEVICE_MISSING);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_1100
     * @tc.name testWantNullSpecThrows
     * @tc.desc Verify null want object throws an error named NullWantError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantNullSpecThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const spec: WantSpec | null = null;
          try {
            if (spec === null) {
              throw WantErrorFactory.create(WantCheckCode.NULL_WANT, 'want is null');
            }
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('NullWantError');
          }
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_1200
     * @tc.name testWantBundleMismatchThrows
     * @tc.desc Verify requireValid throws BundleNameMismatchError for a foreign bundle name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantBundleMismatchThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          try {
            validator.requireValid(WantCorpus.withBundle('com.samples.other'));
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('BundleNameMismatchError');
          }
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_1300
     * @tc.name testWantAbilityMismatchThrows
     * @tc.desc Verify requireValid throws AbilityNameMismatchError for a wrong ability name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantAbilityMismatchThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          try {
            validator.requireValid(WantCorpus.withAbility('GhostAbility'));
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('AbilityNameMismatchError');
          }
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_1400
     * @tc.name testWantModuleMismatchThrows
     * @tc.desc Verify requireValid throws ModuleNameMismatchError for a wrong module name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantModuleMismatchThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          try {
            validator.requireValid(WantCorpus.withModule('entryform'));
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ModuleNameMismatchError');
          }
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_1500
     * @tc.name testWantValidSpecAcceptedWithoutError
     * @tc.desc Verify the valid spec validates to OK and its ability name round trips unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantValidSpecAcceptedWithoutError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const spec: WantSpec = WantCorpus.validSpec();
          const want: Want = validator.toWant(spec);
          expect(want.abilityName as string).assertEqual(spec.abilityName);
          expect(validator.validate(spec)).assertEqual(WantCheckCode.OK);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_1600
     * @tc.name testWantParameterBagDuplicateKey
     * @tc.desc Verify adding a duplicate parameter key is rejected and size stays unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantParameterBagDuplicateKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const bag: ParameterBag = new ParameterBag();
          expect(bag.add(new ParameterEntryItem('sessionId', ParameterType.STRING, 'a1'))).assertTrue();
          expect(bag.add(new ParameterEntryItem('sessionId', ParameterType.STRING, 'b2'))).assertFalse();
          expect(bag.size()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_1700
     * @tc.name testWantParameterTypeMismatch
     * @tc.desc Verify a numeric retryCount declared as string yields PARAM_TYPE_MISMATCH
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantParameterTypeMismatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const bag: ParameterBag = new ParameterBag();
          bag.add(new ParameterEntryItem('sessionId', ParameterType.STRING, 'a1'));
          bag.add(new ParameterEntryItem('retryCount', ParameterType.STRING, '3'));
          bag.add(new ParameterEntryItem('offlineMode', ParameterType.BOOLEAN, 'false'));
          expect(bag.typeOf('retryCount')).assertEqual(ParameterType.STRING);
          expect(ParameterSchema.checkAgainst(bag)).assertEqual(WantCheckCode.PARAM_TYPE_MISMATCH);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_1800
     * @tc.name testWantParameterMissingValue
     * @tc.desc Verify a bag missing offlineMode yields PARAM_VALUE_MISSING
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantParameterMissingValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const bag: ParameterBag = new ParameterBag();
          bag.add(new ParameterEntryItem('sessionId', ParameterType.STRING, 'a1'));
          bag.add(new ParameterEntryItem('retryCount', ParameterType.NUMBER, '2'));
          expect(ParameterSchema.checkAgainst(bag)).assertEqual(WantCheckCode.PARAM_VALUE_MISSING);
          expect(bag.typeOf('offlineMode')).assertEqual('absent');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_1900
     * @tc.name testWantParameterCompleteBag
     * @tc.desc Verify a fully typed parameter bag passes schema validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantParameterCompleteBag', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const bag: ParameterBag = new ParameterBag();
          bag.add(new ParameterEntryItem('sessionId', ParameterType.STRING, 's-001'));
          bag.add(new ParameterEntryItem('retryCount', ParameterType.NUMBER, '2'));
          bag.add(new ParameterEntryItem('offlineMode', ParameterType.BOOLEAN, 'true'));
          expect(ParameterSchema.checkAgainst(bag)).assertEqual(WantCheckCode.OK);
          expect(bag.size()).assertEqual(3);
          expect(bag.keys().length).assertEqual(3);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_2000
     * @tc.name testWantParameterKeyEmpty
     * @tc.desc Verify empty parameter key yields PARAM_KEY_EMPTY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantParameterKeyEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(ParameterSchema.checkKeyLength('')).assertEqual(WantCheckCode.PARAM_KEY_EMPTY);
          expect(ParameterSchema.checkKeyLength('a')).assertEqual(WantCheckCode.OK);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_2100
     * @tc.name testWantParameterKeyBoundary
     * @tc.desc Verify parameter key of 32 characters passes and 33 characters yields PARAM_KEY_TOO_LONG
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantParameterKeyBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const atLimit: string = WantCorpus.abilityOfLength(MAX_PARAMETER_KEY_LENGTH);
          const overLimit: string = WantCorpus.abilityOfLength(MAX_PARAMETER_KEY_LENGTH + 1);
          expect(ParameterSchema.checkKeyLength(atLimit)).assertEqual(WantCheckCode.OK);
          expect(ParameterSchema.checkKeyLength(overLimit)).assertEqual(WantCheckCode.PARAM_KEY_TOO_LONG);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_2200
     * @tc.name testWantParameterRetryRange
     * @tc.desc Verify retry count range 0 to 10 inclusive and rejects negative or out of range values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantParameterRetryRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(ParameterSchema.isRetryWithinRange('0')).assertTrue();
          expect(ParameterSchema.isRetryWithinRange('10')).assertTrue();
          expect(ParameterSchema.isRetryWithinRange('11')).assertFalse();
          expect(ParameterSchema.isRetryWithinRange('-1')).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_2300
     * @tc.name testWantParameterOfflineFlag
     * @tc.desc Verify offline flag accepts literal true and false and rejects yes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantParameterOfflineFlag', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(ParameterSchema.isOfflineFlagValid('true')).assertTrue();
          expect(ParameterSchema.isOfflineFlagValid('false')).assertTrue();
          expect(ParameterSchema.isOfflineFlagValid('yes')).assertFalse();
          expect(ParameterSchema.isOfflineFlagValid('TRUE')).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_2400
     * @tc.name testWantParameterRemove
     * @tc.desc Verify removing an existing key succeeds and removing it twice fails
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantParameterRemove', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const bag: ParameterBag = new ParameterBag();
          bag.add(new ParameterEntryItem('sessionId', ParameterType.STRING, 's-9'));
          expect(bag.remove('sessionId')).assertTrue();
          expect(bag.remove('sessionId')).assertFalse();
          expect(bag.size()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_2500
     * @tc.name testWantParameterEntryEquality
     * @tc.desc Verify parameter entry equality considers key type and value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantParameterEntryEquality', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const base: ParameterEntryItem = new ParameterEntryItem('retryCount', ParameterType.NUMBER, '1');
          expect(base.sameAs(new ParameterEntryItem('retryCount', ParameterType.NUMBER, '1'))).assertTrue();
          expect(base.sameAs(new ParameterEntryItem('retryCount', ParameterType.NUMBER, '2'))).assertFalse();
          expect(base.sameAs(new ParameterEntryItem('retryCount', ParameterType.STRING, '1'))).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_2600
     * @tc.name testWantParameterErrorNameThrows
     * @tc.desc Verify requireParameters throws ParameterTypeMismatchError for a mistyped retryCount
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantParameterErrorNameThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const bag: ParameterBag = new ParameterBag();
          bag.add(new ParameterEntryItem('sessionId', ParameterType.STRING, 's-1'));
          bag.add(new ParameterEntryItem('retryCount', ParameterType.BOOLEAN, 'true'));
          bag.add(new ParameterEntryItem('offlineMode', ParameterType.BOOLEAN, 'false'));
          try {
            validator.requireParameters(bag);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ParameterTypeMismatchError');
          }
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_2700
     * @tc.name testWantErrorFactoryNames
     * @tc.desc Verify error factory maps missing module and device range codes to distinct names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantErrorFactoryNames', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(WantErrorFactory.nameOf(WantCheckCode.MODULE_MISSING)).assertEqual('ModuleNameMissingError');
          expect(WantErrorFactory.nameOf(WantCheckCode.DEVICE_OUT_OF_RANGE)).assertEqual('DeviceIdRangeError');
          expect(WantErrorFactory.nameOf(WantCheckCode.OK)).assertEqual('NoError');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_2800
     * @tc.name testWantSpecCloneIndependent
     * @tc.desc Verify cloned want spec keeps the original values after the source is mutated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantSpecCloneIndependent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const source: WantSpec = WantCorpus.validSpec();
          const copy: WantSpec = source.clone();
          source.bundleName = 'com.samples.mutated';
          expect(copy.bundleName).assertEqual(BUNDLE_NAME);
          expect(copy.abilityName).assertEqual(ENTRY_ABILITY_NAME);
          expect(validator.isValid(copy)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_2900
     * @tc.name testWantToWantFields
     * @tc.desc Verify toWant maps spec fields onto bundleName abilityName and moduleName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantToWantFields', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const want: Want = validator.toWant(WantCorpus.validSpec());
          expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
          expect(want.abilityName as string).assertEqual(ENTRY_ABILITY_NAME);
          expect(want.moduleName as string).assertEqual(MODULE_NAME);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_3000
     * @tc.name testWantBuildEntryWantFields
     * @tc.desc Verify the shared buildEntryWant produces EntryAbility under the runtime bundle name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantBuildEntryWantFields', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const want: Want = buildEntryWant();
          expect(want.abilityName as string).assertEqual(ENTRY_ABILITY_NAME);
          expect(want.bundleName as string).assertEqual(getBundleName());
          expect(validator.validate(new WantSpec(want.bundleName as string, want.abilityName as string,
            MODULE_NAME))).assertEqual(WantCheckCode.OK);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_3100
     * @tc.name testWantRuntimeBundleMatchesConfig
     * @tc.desc Verify runtime bundle name matches the configured constant exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantRuntimeBundleMatchesConfig', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(getBundleName()).assertEqual(BUNDLE_NAME);
          expect(BUNDLE_NAME.indexOf('com.samples.')).assertEqual(0);
          expect(BUNDLE_NAME.endsWith('abilitystage')).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_3200
     * @tc.name testWantStartAbilityValidWant
     * @tc.desc Verify starting EntryAbility with the validated want renders the Index page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantStartAbilityValidWant', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const spec: WantSpec = WantCorpus.validSpec();
          validator.requireValid(spec);
          await startAbilityByWant(validator.toWant(spec));
          const driver: Driver = getDriver();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          expect(await waitForIndexPageStable(driver)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_3300
     * @tc.name testWantLaunchWithModuleName
     * @tc.desc Verify a want including moduleName entry still reaches the Index page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantLaunchWithModuleName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const want: Want = {
            bundleName: getBundleName(),
            abilityName: ENTRY_ABILITY_NAME,
            moduleName: MODULE_NAME
          };
          await startAbilityByWant(want);
          const driver: Driver = getDriver();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          expect(await isIndexPageVisible(driver)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_3400
     * @tc.name testWantInvalidAbilityNoRender
     * @tc.desc Verify an invalid ability name fails validation and the valid page remains visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantInvalidAbilityNoRender', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const rejected: WantSpec = WantCorpus.withAbility('MissingAbility');
          expect(validator.isValid(rejected)).assertFalse();
          const driver: Driver = getDriver();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const currentText: string = await PageTextProbe.current(driver);
          expect(PageTextProbe.isKnown(currentText)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_3500
     * @tc.name testWantPagePathConfigured
     * @tc.desc Verify the configured page path pages/Index is non-empty and ends with Index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantPagePathConfigured', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(INDEX_PAGE_PATH).assertEqual('pages/Index');
          expect(INDEX_PAGE_PATH.endsWith('Index')).assertTrue();
          expect(INDEX_PAGE_PATH.startsWith('pages/')).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_3600
     * @tc.name testWantClickTransitionAfterLaunch
     * @tc.desc Verify the launched page switches to Welcome on click
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantClickTransitionAfterLaunch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          expect(await PageTextProbe.ensureClicked(driver)).assertTrue();
          expect(await checkTextContent(driver, PAGE_TEXT_CLICKED)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_3700
     * @tc.name testWantBackgroundKeepsWant
     * @tc.desc Verify background and foreground retains the launched page and want bundle identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantBackgroundKeepsWant', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          expect(await isIndexPageVisible(driver)).assertTrue();
          expect(buildEntryWant().bundleName as string).assertEqual(BUNDLE_NAME);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_3800
     * @tc.name testWantRepeatedValidationsIdempotent
     * @tc.desc Verify validating the same spec five times always yields OK
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantRepeatedValidationsIdempotent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const spec: WantSpec = WantCorpus.validSpec();
          let okCount: number = 0;
          for (let i = 0; i < 5; i++) {
            if (validator.validate(spec) === WantCheckCode.OK) {
              okCount++;
            }
          }
          expect(okCount).assertEqual(5);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_3900
     * @tc.name testWantErrorFactoryCreateName
     * @tc.desc Verify factory created error carries the mapped name and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantErrorFactoryCreateName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const error: Error = WantErrorFactory.create(WantCheckCode.ABILITY_MISSING, 'ability missing');
          expect(error.name).assertEqual('AbilityNameMissingError');
          expect(error.message).assertEqual('ability missing');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_WANTVALID_4000
     * @tc.name testWantBundlePrefixBoundary
     * @tc.desc Verify bundle names differing only by suffix are rejected by exact match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantBundlePrefixBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(validator.validate(WantCorpus.withBundle('com.samples.abilitystage2')))
            .assertEqual(WantCheckCode.BUNDLE_MISMATCH);
          expect(validator.validate(WantCorpus.withBundle(' com.samples.abilitystage')))
            .assertEqual(WantCheckCode.BUNDLE_MISMATCH);
          expect(validator.validate(WantCorpus.withBundle(BUNDLE_NAME))).assertEqual(WantCheckCode.OK);
        } finally {
          done();
        }
      })
  })
}
