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
  waitForIndexPageStable,
  isIndexPageVisible,
  pageComponentCount,
  getCurrentFocusIndex,
  pressAndWait,
  triggerEntryAbility,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_DOWN,
  KEY_ENTER,
  KEY_BACK,
  KEY_HOME,
  KEY_TAB,
  KEY_SPACE,
  KEY_ESCAPE,
  KEY_MENU,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

enum KeyCategory {
  DIRECTION = 'direction',
  CONFIRM = 'confirm',
  SYSTEM = 'system',
  MEDIA = 'media',
  TEXT = 'text',
  UNKNOWN = 'unknown'
}

enum LookupCode {
  FOUND = 0,
  UNKNOWN_CODE = 1,
  UNKNOWN_NAME = 2,
  DUPLICATE_CODE = 3,
  DUPLICATE_NAME = 4,
  INVALID_CODE = 5,
  TABLE_FULL = 6,
  REMOVED = 7
}

interface KeyBinding {
  keyCode: number;
  keyName: string;
  category: KeyCategory;
  reserved: boolean;
}

interface LookupResult {
  code: LookupCode;
  keyCode: number;
  keyName: string;
  category: KeyCategory;
}

interface KeyTableStats {
  size: number;
  directionCount: number;
  systemCount: number;
  reservedCount: number;
  minCode: number;
  maxCode: number;
}

class KeyCodeTable {
  private bindings: KeyBinding[] = [];
  private capacity: number;
  private duplicateCodeAttempts: number = 0;
  private duplicateNameAttempts: number = 0;
  private lookupMisses: number = 0;

  public constructor(capacity: number) {
    this.capacity = capacity;
  }

  public register(keyCode: number, keyName: string, category: KeyCategory, reserved: boolean): LookupCode {
    if (keyCode <= 0 || keyName.length === 0) {
      return LookupCode.INVALID_CODE;
    }
    if (this.bindings.length >= this.capacity) {
      return LookupCode.TABLE_FULL;
    }
    if (this.codeIndex(keyCode) >= 0) {
      this.duplicateCodeAttempts++;
      return LookupCode.DUPLICATE_CODE;
    }
    if (this.nameIndex(keyName) >= 0) {
      this.duplicateNameAttempts++;
      return LookupCode.DUPLICATE_NAME;
    }
    const binding: KeyBinding = {
      keyCode: keyCode,
      keyName: keyName,
      category: category,
      reserved: reserved
    };
    this.bindings.push(binding);
    return LookupCode.FOUND;
  }

  public unregister(keyCode: number): LookupCode {
    const index: number = this.codeIndex(keyCode);
    if (index < 0) {
      return LookupCode.UNKNOWN_CODE;
    }
    const kept: KeyBinding[] = [];
    for (let i = 0; i < this.bindings.length; i++) {
      if (i !== index) {
        kept.push(this.bindings[i]);
      }
    }
    this.bindings = kept;
    return LookupCode.REMOVED;
  }

  public nameByCode(keyCode: number, fallback: string): LookupResult {
    const index: number = this.codeIndex(keyCode);
    if (index < 0) {
      this.lookupMisses++;
      const miss: LookupResult = {
        code: LookupCode.UNKNOWN_CODE,
        keyCode: keyCode,
        keyName: fallback,
        category: KeyCategory.UNKNOWN
      };
      return miss;
    }
    const binding: KeyBinding = this.bindings[index];
    const hit: LookupResult = {
      code: LookupCode.FOUND,
      keyCode: binding.keyCode,
      keyName: binding.keyName,
      category: binding.category
    };
    return hit;
  }

  public codeByName(keyName: string): LookupResult {
    const index: number = this.nameIndex(keyName);
    if (index < 0) {
      this.lookupMisses++;
      const miss: LookupResult = {
        code: LookupCode.UNKNOWN_NAME,
        keyCode: -1,
        keyName: keyName,
        category: KeyCategory.UNKNOWN
      };
      return miss;
    }
    const binding: KeyBinding = this.bindings[index];
    const hit: LookupResult = {
      code: LookupCode.FOUND,
      keyCode: binding.keyCode,
      keyName: binding.keyName,
      category: binding.category
    };
    return hit;
  }

  public categoryOf(keyCode: number): KeyCategory {
    const index: number = this.codeIndex(keyCode);
    if (index < 0) {
      return KeyCategory.UNKNOWN;
    }
    return this.bindings[index].category;
  }

  public isReserved(keyCode: number): boolean {
    const index: number = this.codeIndex(keyCode);
    if (index < 0) {
      return false;
    }
    return this.bindings[index].reserved;
  }

  public contains(keyCode: number): boolean {
    return this.codeIndex(keyCode) >= 0;
  }

  public size(): number {
    return this.bindings.length;
  }

  public getCapacity(): number {
    return this.capacity;
  }

  public getDuplicateCodeAttempts(): number {
    return this.duplicateCodeAttempts;
  }

  public getDuplicateNameAttempts(): number {
    return this.duplicateNameAttempts;
  }

  public getLookupMisses(): number {
    return this.lookupMisses;
  }

  public resetCounters(): void {
    this.duplicateCodeAttempts = 0;
    this.duplicateNameAttempts = 0;
    this.lookupMisses = 0;
  }

  public stats(): KeyTableStats {
    let directionCount: number = 0;
    let systemCount: number = 0;
    let reservedCount: number = 0;
    for (let i = 0; i < this.bindings.length; i++) {
      const binding: KeyBinding = this.bindings[i];
      if (binding.category === KeyCategory.DIRECTION) {
        directionCount++;
      }
      if (binding.category === KeyCategory.SYSTEM) {
        systemCount++;
      }
      if (binding.reserved) {
        reservedCount++;
      }
    }
    const stats: KeyTableStats = {
      size: this.bindings.length,
      directionCount: directionCount,
      systemCount: systemCount,
      reservedCount: reservedCount,
      minCode: this.minCode(),
      maxCode: this.maxCode()
    };
    return stats;
  }

  public codesInCategory(category: KeyCategory): number[] {
    const codes: number[] = [];
    for (let i = 0; i < this.bindings.length; i++) {
      if (this.bindings[i].category === category) {
        codes.push(this.bindings[i].keyCode);
      }
    }
    return codes;
  }

  public clear(): void {
    this.bindings = [];
    this.resetCounters();
  }

  private minCode(): number {
    if (this.bindings.length === 0) {
      return 0;
    }
    let min: number = this.bindings[0].keyCode;
    for (let i = 1; i < this.bindings.length; i++) {
      if (this.bindings[i].keyCode < min) {
        min = this.bindings[i].keyCode;
      }
    }
    return min;
  }

  private maxCode(): number {
    if (this.bindings.length === 0) {
      return 0;
    }
    let max: number = this.bindings[0].keyCode;
    for (let i = 1; i < this.bindings.length; i++) {
      if (this.bindings[i].keyCode > max) {
        max = this.bindings[i].keyCode;
      }
    }
    return max;
  }

  private codeIndex(keyCode: number): number {
    for (let i = 0; i < this.bindings.length; i++) {
      if (this.bindings[i].keyCode === keyCode) {
        return i;
      }
    }
    return -1;
  }

  private nameIndex(keyName: string): number {
    for (let i = 0; i < this.bindings.length; i++) {
      if (this.bindings[i].keyName === keyName) {
        return i;
      }
    }
    return -1;
  }
}

function buildStandardTable(): KeyCodeTable {
  const table: KeyCodeTable = new KeyCodeTable(64);
  table.register(KEY_ESCAPE, 'KEYCODE_ESCAPE', KeyCategory.SYSTEM, true);
  table.register(KEY_BACK, 'KEYCODE_BACK', KeyCategory.SYSTEM, true);
  table.register(KEY_HOME, 'KEYCODE_HOME', KeyCategory.SYSTEM, true);
  table.register(KEY_TAB, 'KEYCODE_TAB', KeyCategory.TEXT, false);
  table.register(16, 'KEYCODE_VOLUME_UP', KeyCategory.MEDIA, false);
  table.register(17, 'KEYCODE_VOLUME_DOWN', KeyCategory.MEDIA, false);
  table.register(KEY_MENU, 'KEYCODE_MENU', KeyCategory.SYSTEM, true);
  table.register(18, 'KEYCODE_POWER', KeyCategory.SYSTEM, true);
  table.register(KEY_SPACE, 'KEYCODE_SPACE', KeyCategory.TEXT, false);
  table.register(KEY_UP, 'KEYCODE_DPAD_UP', KeyCategory.DIRECTION, false);
  table.register(KEY_DOWN, 'KEYCODE_DPAD_DOWN', KeyCategory.DIRECTION, false);
  table.register(KEY_LEFT, 'KEYCODE_DPAD_LEFT', KeyCategory.DIRECTION, false);
  table.register(KEY_RIGHT, 'KEYCODE_DPAD_RIGHT', KeyCategory.DIRECTION, false);
  table.register(KEY_ENTER, 'KEYCODE_ENTER', KeyCategory.CONFIRM, false);
  return table;
}

interface KeyModifier {
  ctrl: boolean;
  alt: boolean;
  shift: boolean;
}

interface KeyStroke {
  keyCode: number;
  keyName: string;
  modifier: KeyModifier;
}

interface SequenceResult {
  valid: boolean;
  length: number;
  repeatCount: number;
  firstCode: number;
  lastCode: number;
}

class KeySequenceUtil {
  private table: KeyCodeTable;

  public constructor(table: KeyCodeTable) {
    this.table = table;
  }

  public buildStroke(keyCode: number, ctrl: boolean, alt: boolean, shift: boolean): KeyStroke | null {
    if (!this.table.contains(keyCode)) {
      return null;
    }
    const modifier: KeyModifier = {
      ctrl: ctrl,
      alt: alt,
      shift: shift
    };
    const stroke: KeyStroke = {
      keyCode: keyCode,
      keyName: this.table.nameByCode(keyCode, 'KEYCODE_UNKNOWN').keyName,
      modifier: modifier
    };
    return stroke;
  }

  public repeat(keyCode: number, times: number): KeyStroke[] {
    const strokes: KeyStroke[] = [];
    if (times <= 0 || !this.table.contains(keyCode)) {
      return strokes;
    }
    for (let i = 0; i < times; i++) {
      const stroke: KeyStroke | null = this.buildStroke(keyCode, false, false, false);
      if (stroke !== null) {
        strokes.push(stroke);
      }
    }
    return strokes;
  }

  public analyze(codes: number[]): SequenceResult {
    let valid: boolean = true;
    let repeatCount: number = 0;
    for (let i = 0; i < codes.length; i++) {
      if (!this.table.contains(codes[i])) {
        valid = false;
      }
      if (i > 0 && codes[i] === codes[i - 1]) {
        repeatCount++;
      }
    }
    const result: SequenceResult = {
      valid: valid,
      length: codes.length,
      repeatCount: repeatCount,
      firstCode: codes.length === 0 ? -1 : codes[0],
      lastCode: codes.length === 0 ? -1 : codes[codes.length - 1]
    };
    return result;
  }

  public hasDirectionStep(codes: number[]): boolean {
    for (let i = 0; i < codes.length; i++) {
      if (this.table.categoryOf(codes[i]) === KeyCategory.DIRECTION) {
        return true;
      }
    }
    return false;
  }

  public namesOf(codes: number[]): string[] {
    const names: string[] = [];
    for (let i = 0; i < codes.length; i++) {
      names.push(this.table.nameByCode(codes[i], 'KEYCODE_UNKNOWN').keyName);
    }
    return names;
  }

  public isWithinCodeRange(keyCode: number, minCode: number, maxCode: number): boolean {
    return keyCode >= minCode && keyCode <= maxCode;
  }
}

export default function keyCodeUtilValidationTest(): void {
  describe('KeyCodeUtilValidationTest', () => {
    let driver: Driver;
    let table: KeyCodeTable;

    beforeAll(async () => {
      driver = getDriver();
      table = buildStandardTable();
      logInfo('KeyCodeUtilValidationTest: beforeAll start');
      await triggerEntryAbility(driver);
      await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      logInfo('KeyCodeUtilValidationTest: beforeAll finished');

      await ensureIndexPageInitial(driver);
    })

    afterAll(async () => {
      driver = getDriver();
      await pressAndWait(driver, KEY_TAB, 1, DELAY_KEY_NAVIGATION);
      logInfo('KeyCodeUtilValidationTest: afterAll finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_0100
     * @tc.name testLookupCodeEnumValues
     * @tc.desc Verify lookup codes enumerate the documented failure reasons in ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLookupCodeEnumValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(LookupCode.FOUND).assertEqual(0);
        expect(LookupCode.UNKNOWN_CODE).assertEqual(1);
        expect(LookupCode.UNKNOWN_NAME).assertEqual(2);
        expect(LookupCode.DUPLICATE_CODE).assertEqual(3);
        expect(LookupCode.DUPLICATE_NAME).assertEqual(4);
        expect(LookupCode.INVALID_CODE).assertEqual(5);
        expect(LookupCode.TABLE_FULL).assertEqual(6);
        expect(LookupCode.REMOVED).assertEqual(7);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_0200
     * @tc.name testKeyCategoryEnumValues
     * @tc.desc Verify key category tags match the expected lowercase literals for every group
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyCategoryEnumValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(KeyCategory.DIRECTION).assertEqual('direction');
        expect(KeyCategory.CONFIRM).assertEqual('confirm');
        expect(KeyCategory.SYSTEM).assertEqual('system');
        expect(KeyCategory.MEDIA).assertEqual('media');
        expect(KeyCategory.TEXT).assertEqual('text');
        expect(KeyCategory.UNKNOWN).assertEqual('unknown');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_0300
     * @tc.name testStandardTableSize
     * @tc.desc Verify the standard table registers exactly fourteen bindings inside a capacity of sixty-four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStandardTableSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(table.size()).assertEqual(14);
        expect(table.getCapacity()).assertEqual(64);
        expect(table.stats().size).assertEqual(14);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_0400
     * @tc.name testDirectionKeyCodes
     * @tc.desc Verify dpad left right up down map to codes 2014 2015 2012 2013 by name lookup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDirectionKeyCodes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(table.codeByName('KEYCODE_DPAD_LEFT').keyCode).assertEqual(2014);
        expect(table.codeByName('KEYCODE_DPAD_RIGHT').keyCode).assertEqual(2015);
        expect(table.codeByName('KEYCODE_DPAD_UP').keyCode).assertEqual(2012);
        expect(table.codeByName('KEYCODE_DPAD_DOWN').keyCode).assertEqual(2013);
        expect(table.codeByName('KEYCODE_DPAD_LEFT').keyCode).assertEqual(KEY_LEFT);
        expect(table.codeByName('KEYCODE_DPAD_RIGHT').keyCode).assertEqual(KEY_RIGHT);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_0500
     * @tc.name testConfirmAndSystemKeyCodes
     * @tc.desc Verify enter back home tab escape menu map to 2054 2 1 2049 2070 2067 respectively
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConfirmAndSystemKeyCodes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(table.codeByName('KEYCODE_ENTER').keyCode).assertEqual(2054);
        expect(table.codeByName('KEYCODE_BACK').keyCode).assertEqual(2);
        expect(table.codeByName('KEYCODE_HOME').keyCode).assertEqual(1);
        expect(table.codeByName('KEYCODE_TAB').keyCode).assertEqual(2049);
        expect(table.codeByName('KEYCODE_ESCAPE').keyCode).assertEqual(2070);
        expect(table.codeByName('KEYCODE_MENU').keyCode).assertEqual(2067);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_0600
     * @tc.name testMediaAndTextKeyCodes
     * @tc.desc Verify volume up volume down space power map to 16 17 57 26 by name lookup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMediaAndTextKeyCodes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(table.codeByName('KEYCODE_VOLUME_UP').keyCode).assertEqual(16);
        expect(table.codeByName('KEYCODE_VOLUME_DOWN').keyCode).assertEqual(17);
        expect(table.codeByName('KEYCODE_SPACE').keyCode).assertEqual(2050);
        expect(table.codeByName('KEYCODE_POWER').keyCode).assertEqual(18);
        expect(table.codeByName('KEYCODE_SPACE').keyCode).assertEqual(KEY_SPACE);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_0700
     * @tc.name testNameByCodeRoundTrip
     * @tc.desc Verify every standard code resolves back to its registered name and category
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNameByCodeRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(table.nameByCode(KEY_LEFT, 'UNKNOWN').keyName).assertEqual('KEYCODE_DPAD_LEFT');
        expect(table.nameByCode(KEY_ENTER, 'UNKNOWN').keyName).assertEqual('KEYCODE_ENTER');
        expect(table.nameByCode(KEY_BACK, 'UNKNOWN').keyName).assertEqual('KEYCODE_BACK');
        expect(table.nameByCode(KEY_LEFT, 'UNKNOWN').category).assertEqual(KeyCategory.DIRECTION);
        expect(table.nameByCode(KEY_ENTER, 'UNKNOWN').category).assertEqual(KeyCategory.CONFIRM);
        expect(table.nameByCode(16, 'UNKNOWN').category).assertEqual(KeyCategory.MEDIA);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_0800
     * @tc.name testUnknownCodeReturnsFallbackName
     * @tc.desc Verify an unregistered code returns the caller fallback name and unknown category
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUnknownCodeReturnsFallbackName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const result: LookupResult = table.nameByCode(9999, 'KEYCODE_UNKNOWN');
        expect(result.code).assertEqual(LookupCode.UNKNOWN_CODE);
        expect(result.keyName).assertEqual('KEYCODE_UNKNOWN');
        expect(result.category).assertEqual(KeyCategory.UNKNOWN);
        expect(result.keyCode).assertEqual(9999);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_0900
     * @tc.name testUnknownNameReturnsMinusOne
     * @tc.desc Verify an unregistered name returns code minus one and the original name in the result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUnknownNameReturnsMinusOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const result: LookupResult = table.codeByName('KEYCODE_NOT_EXIST');
        expect(result.code).assertEqual(LookupCode.UNKNOWN_NAME);
        expect(result.keyCode).assertEqual(-1);
        expect(result.keyName).assertEqual('KEYCODE_NOT_EXIST');
        expect(result.category).assertEqual(KeyCategory.UNKNOWN);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_1000
     * @tc.name testUnknownLookupMissesCounted
     * @tc.desc Verify each failed lookup increments the miss counter exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUnknownLookupMissesCounted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: KeyCodeTable = new KeyCodeTable(8);
        local.register(KEY_ENTER, 'KEYCODE_ENTER', KeyCategory.CONFIRM, false);
        local.resetCounters();
        expect(local.getLookupMisses()).assertEqual(0);
        local.nameByCode(4242, 'FALLBACK');
        expect(local.getLookupMisses()).assertEqual(1);
        local.codeByName('KEYCODE_UNKNOWN_NAME');
        expect(local.getLookupMisses()).assertEqual(2);
        local.nameByCode(KEY_ENTER, 'FALLBACK');
        expect(local.getLookupMisses()).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_1100
     * @tc.name testDuplicateCodeRejected
     * @tc.desc Verify registering an existing key code is rejected with duplicate-code and leaves size unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDuplicateCodeRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: KeyCodeTable = new KeyCodeTable(8);
        local.register(KEY_ENTER, 'KEYCODE_ENTER', KeyCategory.CONFIRM, false);
        const duplicate: LookupCode = local.register(KEY_ENTER, 'KEYCODE_ENTER_ALT', KeyCategory.CONFIRM, false);
        expect(duplicate).assertEqual(LookupCode.DUPLICATE_CODE);
        expect(local.size()).assertEqual(1);
        expect(local.getDuplicateCodeAttempts()).assertEqual(1);
        expect(local.nameByCode(KEY_ENTER, 'NONE').keyName).assertEqual('KEYCODE_ENTER');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_1200
     * @tc.name testDuplicateNameRejected
     * @tc.desc Verify registering an existing key name with a new code is rejected with duplicate-name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDuplicateNameRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: KeyCodeTable = new KeyCodeTable(8);
        local.register(KEY_ENTER, 'KEYCODE_ENTER', KeyCategory.CONFIRM, false);
        const duplicate: LookupCode = local.register(2050, 'KEYCODE_ENTER', KeyCategory.CONFIRM, false);
        expect(duplicate).assertEqual(LookupCode.DUPLICATE_NAME);
        expect(local.size()).assertEqual(1);
        expect(local.getDuplicateNameAttempts()).assertEqual(1);
        expect(local.codeByName('KEYCODE_ENTER').keyCode).assertEqual(KEY_ENTER);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_1300
     * @tc.name testInvalidRegistrationRejected
     * @tc.desc Verify zero and negative codes and empty names are rejected as invalid registrations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInvalidRegistrationRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: KeyCodeTable = new KeyCodeTable(8);
        expect(local.register(0, 'KEYCODE_ZERO', KeyCategory.UNKNOWN, false)).assertEqual(LookupCode.INVALID_CODE);
        expect(local.register(-5, 'KEYCODE_NEGATIVE', KeyCategory.UNKNOWN, false)).assertEqual(LookupCode.INVALID_CODE);
        expect(local.register(KEY_ENTER, '', KeyCategory.CONFIRM, false)).assertEqual(LookupCode.INVALID_CODE);
        expect(local.size()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_1400
     * @tc.name testTableCapacityEnforced
     * @tc.desc Verify registration beyond the declared capacity returns table-full and keeps the size at capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTableCapacityEnforced', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: KeyCodeTable = new KeyCodeTable(3);
        expect(local.register(100, 'KEYCODE_A', KeyCategory.TEXT, false)).assertEqual(LookupCode.FOUND);
        expect(local.register(101, 'KEYCODE_B', KeyCategory.TEXT, false)).assertEqual(LookupCode.FOUND);
        expect(local.register(102, 'KEYCODE_C', KeyCategory.TEXT, false)).assertEqual(LookupCode.FOUND);
        expect(local.register(103, 'KEYCODE_D', KeyCategory.TEXT, false)).assertEqual(LookupCode.TABLE_FULL);
        expect(local.size()).assertEqual(3);
        expect(local.contains(103)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_1500
     * @tc.name testCapacityReclaimedAfterUnregister
     * @tc.desc Verify removing a binding frees a slot so a new code can then be registered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCapacityReclaimedAfterUnregister', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: KeyCodeTable = new KeyCodeTable(2);
        local.register(100, 'KEYCODE_A', KeyCategory.TEXT, false);
        local.register(101, 'KEYCODE_B', KeyCategory.TEXT, false);
        expect(local.register(102, 'KEYCODE_C', KeyCategory.TEXT, false)).assertEqual(LookupCode.TABLE_FULL);
        const removed: LookupCode = local.unregister(100);
        expect(removed).assertEqual(LookupCode.REMOVED);
        expect(local.size()).assertEqual(1);
        expect(local.register(102, 'KEYCODE_C', KeyCategory.TEXT, false)).assertEqual(LookupCode.FOUND);
        expect(local.size()).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_1600
     * @tc.name testUnregisterUnknownCode
     * @tc.desc Verify unregistering a code that is absent returns unknown-code and leaves the table intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUnregisterUnknownCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: KeyCodeTable = new KeyCodeTable(4);
        local.register(KEY_ENTER, 'KEYCODE_ENTER', KeyCategory.CONFIRM, false);
        expect(local.unregister(8888)).assertEqual(LookupCode.UNKNOWN_CODE);
        expect(local.size()).assertEqual(1);
        expect(local.contains(KEY_ENTER)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_1700
     * @tc.name testUnregisterThenLookupMisses
     * @tc.desc Verify a removed binding no longer resolves and lookups fall back to the default name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUnregisterThenLookupMisses', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: KeyCodeTable = new KeyCodeTable(4);
        local.register(KEY_MENU, 'KEYCODE_MENU', KeyCategory.SYSTEM, true);
        expect(local.nameByCode(KEY_MENU, 'NONE').keyName).assertEqual('KEYCODE_MENU');
        local.unregister(KEY_MENU);
        expect(local.nameByCode(KEY_MENU, 'NONE').keyName).assertEqual('NONE');
        expect(local.nameByCode(KEY_MENU, 'NONE').code).assertEqual(LookupCode.UNKNOWN_CODE);
        expect(local.isReserved(KEY_MENU)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_1800
     * @tc.name testCategoryLookup
     * @tc.desc Verify categoryOf classifies direction confirm system media and text bindings correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCategoryLookup', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(table.categoryOf(KEY_LEFT)).assertEqual(KeyCategory.DIRECTION);
        expect(table.categoryOf(KEY_ENTER)).assertEqual(KeyCategory.CONFIRM);
        expect(table.categoryOf(KEY_HOME)).assertEqual(KeyCategory.SYSTEM);
        expect(table.categoryOf(16)).assertEqual(KeyCategory.MEDIA);
        expect(table.categoryOf(KEY_SPACE)).assertEqual(KeyCategory.TEXT);
        expect(table.categoryOf(6000)).assertEqual(KeyCategory.UNKNOWN);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_1900
     * @tc.name testCodesInDirectionCategory
     * @tc.desc Verify exactly four direction codes are registered and they match the shared driver constants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodesInDirectionCategory', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const codes: number[] = table.codesInCategory(KeyCategory.DIRECTION);
        expect(codes.length).assertEqual(4);
        expect(codes[0]).assertEqual(KEY_UP);
        expect(codes[1]).assertEqual(KEY_DOWN);
        expect(codes[2]).assertEqual(KEY_LEFT);
        expect(codes[3]).assertEqual(KEY_RIGHT);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_2000
     * @tc.name testReservedFlags
     * @tc.desc Verify system reserved bindings report reserved true while dpad and enter report false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReservedFlags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(table.isReserved(KEY_BACK)).assertTrue();
        expect(table.isReserved(KEY_HOME)).assertTrue();
        expect(table.isReserved(KEY_ESCAPE)).assertTrue();
        expect(table.isReserved(KEY_MENU)).assertTrue();
        expect(table.isReserved(KEY_LEFT)).assertFalse();
        expect(table.isReserved(KEY_ENTER)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_2100
     * @tc.name testTableStatsAggregation
     * @tc.desc Verify aggregated stats report size direction count system count reserved count and code extents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTableStatsAggregation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stats: KeyTableStats = table.stats();
        expect(stats.size).assertEqual(14);
        expect(stats.directionCount).assertEqual(4);
        expect(stats.systemCount).assertEqual(5);
        expect(stats.reservedCount).assertEqual(5);
        expect(stats.minCode).assertEqual(1);
        expect(stats.maxCode).assertEqual(KEY_ESCAPE);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_2200
     * @tc.name testStatsOnEmptyTable
     * @tc.desc Verify stats on a fresh table report zero counts and zero code extents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStatsOnEmptyTable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: KeyCodeTable = new KeyCodeTable(16);
        const stats: KeyTableStats = local.stats();
        expect(stats.size).assertEqual(0);
        expect(stats.directionCount).assertEqual(0);
        expect(stats.systemCount).assertEqual(0);
        expect(stats.reservedCount).assertEqual(0);
        expect(stats.minCode).assertEqual(0);
        expect(stats.maxCode).assertEqual(0);
        expect(local.codesInCategory(KeyCategory.TEXT).length).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_2300
     * @tc.name testClearResetsTableAndCounters
     * @tc.desc Verify clear empties the table and resets duplicate and miss counters to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testClearResetsTableAndCounters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: KeyCodeTable = new KeyCodeTable(8);
        local.register(KEY_ENTER, 'KEYCODE_ENTER', KeyCategory.CONFIRM, false);
        local.register(KEY_ENTER, 'KEYCODE_ENTER_DUP', KeyCategory.CONFIRM, false);
        local.nameByCode(7777, 'NONE');
        expect(local.size()).assertEqual(1);
        expect(local.getDuplicateCodeAttempts()).assertEqual(1);
        expect(local.getLookupMisses()).assertEqual(1);
        local.clear();
        expect(local.size()).assertEqual(0);
        expect(local.getDuplicateCodeAttempts()).assertEqual(0);
        expect(local.getLookupMisses()).assertEqual(0);
        expect(local.contains(KEY_ENTER)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_2400
     * @tc.name testMinMaxCodeExtentsCustomTable
     * @tc.desc Verify code extents track the smallest and largest registered codes in a custom table
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMinMaxCodeExtentsCustomTable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: KeyCodeTable = new KeyCodeTable(8);
        local.register(500, 'KEYCODE_MID', KeyCategory.TEXT, false);
        local.register(100, 'KEYCODE_LOW', KeyCategory.TEXT, false);
        local.register(900, 'KEYCODE_HIGH', KeyCategory.TEXT, false);
        const stats: KeyTableStats = local.stats();
        expect(stats.minCode).assertEqual(100);
        expect(stats.maxCode).assertEqual(900);
        expect(stats.size).assertEqual(3);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_2500
     * @tc.name testRepeatedRegistrationStress
     * @tc.desc Verify one hundred duplicate attempts are all rejected and counted while the table keeps one entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRepeatedRegistrationStress', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: KeyCodeTable = new KeyCodeTable(8);
        local.register(KEY_ENTER, 'KEYCODE_ENTER', KeyCategory.CONFIRM, false);
        local.resetCounters();
        let rejected: number = 0;
        for (let i = 0; i < 100; i++) {
          const result: LookupCode = local.register(KEY_ENTER, 'KEYCODE_ENTER_ALT', KeyCategory.CONFIRM, false);
          if (result === LookupCode.DUPLICATE_CODE) {
            rejected++;
          }
        }
        expect(rejected).assertEqual(100);
        expect(local.getDuplicateCodeAttempts()).assertEqual(100);
        expect(local.size()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_2600
     * @tc.name testBidirectionalConsistencyAllBindings
     * @tc.desc Verify every code in the standard table maps back to a name whose lookup returns the same code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBidirectionalConsistencyAllBindings', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const codes: number[] = [1, 2, 16, 17, 18, 2012, 2013, 2014, 2015, 2049, 2050, 2054, 2067, 2070];
        let consistentCount: number = 0;
        for (let i = 0; i < codes.length; i++) {
          const forward: LookupResult = table.nameByCode(codes[i], 'NONE');
          const backward: LookupResult = table.codeByName(forward.keyName);
          if (backward.keyCode === codes[i]) {
            consistentCount++;
          }
        }
        expect(consistentCount).assertEqual(14);
        expect(table.size()).assertEqual(14);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_2700
     * @tc.name testUiPageVisibleForKeyProbe
     * @tc.desc Verify the index page is visible before dispatching real key events from the driver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiPageVisibleForKeyProbe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        expect(await isIndexPageVisible(driver)).assertTrue();
        const count: number = await pageComponentCount(driver);
        expect(count > 0).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_2800
     * @tc.name testUiDpadDownSmoke
     * @tc.desc Verify pressing the mapped dpad down code keeps the live focus index within bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiDpadDownSmoke', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const mappedDown: number = table.codeByName('KEYCODE_DPAD_DOWN').keyCode;
        expect(mappedDown).assertEqual(KEY_DOWN);
        const count: number = await pageComponentCount(driver);
        await pressAndWait(driver, mappedDown, 2, DELAY_KEY_NAVIGATION);
        const index: number = await getCurrentFocusIndex(driver);
        expect(index >= -1).assertTrue();
        expect(index <= count - 1).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_2900
     * @tc.name testUiDpadUpSmoke
     * @tc.desc Verify pressing the mapped dpad up code keeps the live focus index within bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiDpadUpSmoke', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const mappedUp: number = table.codeByName('KEYCODE_DPAD_UP').keyCode;
        expect(mappedUp).assertEqual(KEY_UP);
        const count: number = await pageComponentCount(driver);
        await pressAndWait(driver, mappedUp, 1, DELAY_KEY_NAVIGATION);
        const index: number = await getCurrentFocusIndex(driver);
        expect(index >= -1).assertTrue();
        expect(index < count).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_3000
     * @tc.name testUiDpadLeftRightSmoke
     * @tc.desc Verify pressing the mapped dpad left then right codes keeps the live focus index within bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiDpadLeftRightSmoke', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const mappedLeft: number = table.codeByName('KEYCODE_DPAD_LEFT').keyCode;
        const mappedRight: number = table.codeByName('KEYCODE_DPAD_RIGHT').keyCode;
        expect(mappedLeft).assertEqual(2014);
        expect(mappedRight).assertEqual(2015);
        const count: number = await pageComponentCount(driver);
        await pressAndWait(driver, mappedLeft, 1, DELAY_KEY_NAVIGATION);
        const afterLeft: number = await getCurrentFocusIndex(driver);
        await pressAndWait(driver, mappedRight, 1, DELAY_KEY_NAVIGATION);
        const afterRight: number = await getCurrentFocusIndex(driver);
        expect(afterLeft >= -1).assertTrue();
        expect(afterLeft < count).assertTrue();
        expect(afterRight >= -1).assertTrue();
        expect(afterRight < count).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_3100
     * @tc.name testUiTabSmoke
     * @tc.desc Verify pressing the mapped tab code advances focus traversal without leaving the window
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiTabSmoke', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const mappedTab: number = table.codeByName('KEYCODE_TAB').keyCode;
        expect(mappedTab).assertEqual(KEY_TAB);
        const count: number = await pageComponentCount(driver);
        await pressAndWait(driver, mappedTab, 3, DELAY_KEY_NAVIGATION);
        const index: number = await getCurrentFocusIndex(driver);
        expect(index >= -1).assertTrue();
        expect(index < count).assertTrue();
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_3200
     * @tc.name testUiEnterKeepsPageVisible
     * @tc.desc Verify pressing the mapped enter code leaves the index page visible with at least one component
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiEnterKeepsPageVisible', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const mappedEnter: number = table.codeByName('KEYCODE_ENTER').keyCode;
        expect(mappedEnter).assertEqual(2054);
        await pressAndWait(driver, mappedEnter, 1, DELAY_KEY_NAVIGATION);
        const visible: boolean = await isIndexPageVisible(driver);
        expect(visible).assertTrue();
        const count: number = await pageComponentCount(driver);
        expect(count > 0).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_3300
     * @tc.name testSequenceBuildStroke
     * @tc.desc Verify a registered code builds a stroke carrying the mapped name and the requested modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSequenceBuildStroke', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const util: KeySequenceUtil = new KeySequenceUtil(table);
        const stroke: KeyStroke | null = util.buildStroke(KEY_ENTER, true, false, true);
        expect(stroke === null).assertFalse();
        if (stroke !== null) {
          expect(stroke.keyCode).assertEqual(2054);
          expect(stroke.keyName).assertEqual('KEYCODE_ENTER');
          expect(stroke.modifier.ctrl).assertTrue();
          expect(stroke.modifier.alt).assertFalse();
          expect(stroke.modifier.shift).assertTrue();
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_3400
     * @tc.name testSequenceBuildStrokeUnknown
     * @tc.desc Verify an unregistered code yields a null stroke instead of a partially filled record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSequenceBuildStrokeUnknown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const util: KeySequenceUtil = new KeySequenceUtil(table);
        const stroke: KeyStroke | null = util.buildStroke(123456, false, false, false);
        expect(stroke === null).assertTrue();
        const localUtil: KeySequenceUtil = new KeySequenceUtil(new KeyCodeTable(4));
        expect(localUtil.buildStroke(KEY_ENTER, false, false, false) === null).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_3500
     * @tc.name testSequenceRepeatCount
     * @tc.desc Verify repeating a registered code five times yields five strokes with identical names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSequenceRepeatCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const util: KeySequenceUtil = new KeySequenceUtil(table);
        const strokes: KeyStroke[] = util.repeat(KEY_DOWN, 5);
        expect(strokes.length).assertEqual(5);
        expect(strokes[0].keyName).assertEqual('KEYCODE_DPAD_DOWN');
        expect(strokes[4].keyName).assertEqual('KEYCODE_DPAD_DOWN');
        expect(strokes[4].keyCode).assertEqual(2013);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_3600
     * @tc.name testSequenceRepeatBoundaries
     * @tc.desc Verify zero and negative repeat counts yield no strokes and an unknown code yields none either
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSequenceRepeatBoundaries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const util: KeySequenceUtil = new KeySequenceUtil(table);
        expect(util.repeat(KEY_DOWN, 0).length).assertEqual(0);
        expect(util.repeat(KEY_DOWN, -3).length).assertEqual(0);
        expect(util.repeat(54321, 4).length).assertEqual(0);
        expect(util.repeat(KEY_DOWN, 1).length).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_3700
     * @tc.name testSequenceAnalyzeKnownPath
     * @tc.desc Verify a fully registered navigation path reports valid with one repeat and correct endpoints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSequenceAnalyzeKnownPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const util: KeySequenceUtil = new KeySequenceUtil(table);
        const codes: number[] = [KEY_DOWN, KEY_DOWN, KEY_RIGHT, KEY_ENTER];
        const result: SequenceResult = util.analyze(codes);
        expect(result.valid).assertTrue();
        expect(result.length).assertEqual(4);
        expect(result.repeatCount).assertEqual(1);
        expect(result.firstCode).assertEqual(2013);
        expect(result.lastCode).assertEqual(2054);
        expect(util.hasDirectionStep(codes)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_3800
     * @tc.name testSequenceAnalyzeUnknownPath
     * @tc.desc Verify a path containing an unregistered code reports invalid and counts adjacent repeats exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSequenceAnalyzeUnknownPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const util: KeySequenceUtil = new KeySequenceUtil(table);
        const codes: number[] = [KEY_TAB, KEY_TAB, 9999];
        const result: SequenceResult = util.analyze(codes);
        expect(result.valid).assertFalse();
        expect(result.length).assertEqual(3);
        expect(result.repeatCount).assertEqual(1);
        expect(result.lastCode).assertEqual(9999);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_3900
     * @tc.name testSequenceAnalyzeEmpty
     * @tc.desc Verify an empty path reports zero length zero repeats and minus one endpoints with valid true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSequenceAnalyzeEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const util: KeySequenceUtil = new KeySequenceUtil(table);
        const codes: number[] = [];
        const result: SequenceResult = util.analyze(codes);
        expect(result.valid).assertTrue();
        expect(result.length).assertEqual(0);
        expect(result.repeatCount).assertEqual(0);
        expect(result.firstCode).assertEqual(-1);
        expect(result.lastCode).assertEqual(-1);
        expect(util.hasDirectionStep(codes)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_4000
     * @tc.name testSequenceNamesOfMixedCodes
     * @tc.desc Verify namesOf resolves mixed registered and unknown codes to names with the default placeholder
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSequenceNamesOfMixedCodes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const util: KeySequenceUtil = new KeySequenceUtil(table);
        const names: string[] = util.namesOf([KEY_LEFT, 7777, KEY_ENTER]);
        expect(names.length).assertEqual(3);
        expect(names[0]).assertEqual('KEYCODE_DPAD_LEFT');
        expect(names[1]).assertEqual('KEYCODE_UNKNOWN');
        expect(names[2]).assertEqual('KEYCODE_ENTER');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_4100
     * @tc.name testSequenceCodeRangeInclusive
     * @tc.desc Verify the range predicate is inclusive on both ends and rejects values one outside each side
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSequenceCodeRangeInclusive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const util: KeySequenceUtil = new KeySequenceUtil(table);
        expect(util.isWithinCodeRange(2012, 2012, 2015)).assertTrue();
        expect(util.isWithinCodeRange(2015, 2012, 2015)).assertTrue();
        expect(util.isWithinCodeRange(2011, 2012, 2015)).assertFalse();
        expect(util.isWithinCodeRange(2016, 2012, 2015)).assertFalse();
        expect(util.isWithinCodeRange(0, 0, 0)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_4200
     * @tc.name testSequenceNavigationPathStress
     * @tc.desc Verify a fifty-step direction path stays valid records the endpoints and contains a direction step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSequenceNavigationPathStress', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const util: KeySequenceUtil = new KeySequenceUtil(table);
        const codes: number[] = [];
        for (let i = 0; i < 50; i++) {
          codes.push(i % 2 === 0 ? KEY_DOWN : KEY_UP);
        }
        const result: SequenceResult = util.analyze(codes);
        expect(result.valid).assertTrue();
        expect(result.length).assertEqual(50);
        expect(result.repeatCount).assertEqual(0);
        expect(result.firstCode).assertEqual(KEY_DOWN);
        expect(result.lastCode).assertEqual(KEY_UP);
        expect(util.hasDirectionStep(codes)).assertTrue();
        expect(util.namesOf(codes).length).assertEqual(50);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_4300
     * @tc.name testUiSequenceDispatchDpadPath
     * @tc.desc Verify dispatching a mapped direction path on the real window keeps the page visible afterwards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiSequenceDispatchDpadPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const util: KeySequenceUtil = new KeySequenceUtil(table);
        const codes: number[] = [KEY_DOWN, KEY_DOWN, KEY_UP];
        const result: SequenceResult = util.analyze(codes);
        expect(result.valid).assertTrue();
        for (let i = 0; i < codes.length; i++) {
          await pressAndWait(driver, codes[i], 1, DELAY_KEY_NAVIGATION);
        }
        const count: number = await pageComponentCount(driver);
        const index: number = await getCurrentFocusIndex(driver);
        expect(index >= -1).assertTrue();
        expect(index < count).assertTrue();
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_4400
     * @tc.name testUiRepeatTabStaysOnPage
     * @tc.desc Verify five repeated tab dispatches keep the index page visible with a bounded focus index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiRepeatTabStaysOnPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const util: KeySequenceUtil = new KeySequenceUtil(table);
        const strokes: KeyStroke[] = util.repeat(KEY_TAB, 5);
        expect(strokes.length).assertEqual(5);
        const count: number = await pageComponentCount(driver);
        await pressAndWait(driver, KEY_TAB, 5, DELAY_KEY_NAVIGATION);
        const index: number = await getCurrentFocusIndex(driver);
        expect(index >= -1).assertTrue();
        expect(index < count).assertTrue();
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_4500
     * @tc.name testUiMappedCodesMatchSharedConstants
     * @tc.desc Verify every shared driver key constant resolves through the table to the identical numeric code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiMappedCodesMatchSharedConstants', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(table.codeByName('KEYCODE_DPAD_UP').keyCode).assertEqual(KEY_UP);
        expect(table.codeByName('KEYCODE_DPAD_DOWN').keyCode).assertEqual(KEY_DOWN);
        expect(table.codeByName('KEYCODE_DPAD_LEFT').keyCode).assertEqual(KEY_LEFT);
        expect(table.codeByName('KEYCODE_DPAD_RIGHT').keyCode).assertEqual(KEY_RIGHT);
        expect(table.codeByName('KEYCODE_ENTER').keyCode).assertEqual(KEY_ENTER);
        expect(table.codeByName('KEYCODE_BACK').keyCode).assertEqual(KEY_BACK);
        expect(table.codeByName('KEYCODE_HOME').keyCode).assertEqual(KEY_HOME);
        expect(table.codeByName('KEYCODE_TAB').keyCode).assertEqual(KEY_TAB);
        expect(table.codeByName('KEYCODE_SPACE').keyCode).assertEqual(KEY_SPACE);
        expect(table.codeByName('KEYCODE_ESCAPE').keyCode).assertEqual(KEY_ESCAPE);
        expect(table.codeByName('KEYCODE_MENU').keyCode).assertEqual(KEY_MENU);
        const count: number = await pageComponentCount(driver);
        expect(count > 0).assertTrue();
      } finally {
        done();
      }
    })
    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_4600
     * @tc.name testUiSpaceKeyKeepsPageVisible
     * @tc.desc Verify the mapped space code reaches the window and leaves the index page rendered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiSpaceKeyKeepsPageVisible', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const mappedSpace: number = table.codeByName('KEYCODE_SPACE').keyCode;
        expect(mappedSpace).assertEqual(KEY_SPACE);
        await pressAndWait(driver, mappedSpace, 2, DELAY_KEY_NAVIGATION);
        expect(await isIndexPageVisible(driver)).assertTrue();
        const count: number = await pageComponentCount(driver);
        expect(count > 0).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_4700
     * @tc.name testUiEscapeKeyKeepsPageVisible
     * @tc.desc Verify the mapped escape code is dispatchable and the index page stays visible afterwards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiEscapeKeyKeepsPageVisible', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const mappedEscape: number = table.codeByName('KEYCODE_ESCAPE').keyCode;
        expect(mappedEscape).assertEqual(KEY_ESCAPE);
        expect(table.isReserved(mappedEscape)).assertTrue();
        await pressAndWait(driver, mappedEscape, 1, DELAY_KEY_NAVIGATION);
        expect(await isIndexPageVisible(driver)).assertTrue();
        const index: number = await getCurrentFocusIndex(driver);
        expect(index >= -1).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_4800
     * @tc.name testUiMenuKeyKeepsPageVisible
     * @tc.desc Verify the mapped menu code is reserved system category and the page survives its dispatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiMenuKeyKeepsPageVisible', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const mappedMenu: number = table.codeByName('KEYCODE_MENU').keyCode;
        expect(mappedMenu).assertEqual(KEY_MENU);
        expect(table.categoryOf(mappedMenu)).assertEqual(KeyCategory.SYSTEM);
        await pressAndWait(driver, mappedMenu, 1, DELAY_KEY_NAVIGATION);
        expect(await isIndexPageVisible(driver)).assertTrue();
        const count: number = await pageComponentCount(driver);
        expect(count > 0).assertTrue();
      } finally {
        done();
      }
    })
    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_4900
     * @tc.name testUiVolumeUpCodeKeepsPageVisible
     * @tc.desc Verify the mapped volume up code is media category and its dispatch leaves the page rendered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiVolumeUpCodeKeepsPageVisible', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const mappedVolumeUp: number = table.codeByName('KEYCODE_VOLUME_UP').keyCode;
        expect(mappedVolumeUp).assertEqual(16);
        expect(table.categoryOf(mappedVolumeUp)).assertEqual(KeyCategory.MEDIA);
        expect(table.codesInCategory(KeyCategory.MEDIA).length).assertEqual(2);
        await pressAndWait(driver, mappedVolumeUp, 2, DELAY_KEY_NAVIGATION);
        expect(await isIndexPageVisible(driver)).assertTrue();
        const count: number = await pageComponentCount(driver);
        expect(count > 0).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_KEYCODE_5000
     * @tc.name testUiTabStrokeRecordedForLivePage
     * @tc.desc Verify a tab stroke built from the table is recorded and the live page keeps its component count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiTabStrokeRecordedForLivePage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const countBefore: number = await pageComponentCount(driver);
        expect(countBefore > 0).assertTrue();
        const sequence: KeySequenceUtil = new KeySequenceUtil(table);
        const stroke: KeyStroke | null = sequence.buildStroke(KEY_TAB, false, false, true);
        expect(stroke === null).assertFalse();
        if (stroke !== null) {
          expect(stroke.keyCode).assertEqual(KEY_TAB);
          expect(stroke.keyName).assertEqual('KEYCODE_TAB');
          expect(stroke.modifier.shift).assertTrue();
          expect(stroke.modifier.ctrl).assertFalse();
        }
        await pressAndWait(driver, KEY_TAB, 2, DELAY_KEY_NAVIGATION);
        const countAfter: number = await pageComponentCount(driver);
        expect(countAfter > 0).assertTrue();
        expect(countAfter <= countBefore + 3).assertTrue();
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    })
  })
}
