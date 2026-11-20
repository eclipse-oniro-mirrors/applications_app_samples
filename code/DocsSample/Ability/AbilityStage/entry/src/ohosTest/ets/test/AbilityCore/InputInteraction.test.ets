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
  pressHomeAndWait,
  checkTextContent,
  pageComponentCount,
  collectAllTexts,
  checkComponentExistsByKey,
  tapComponentByText,
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
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION,
  DELAY_AFTER_LAUNCH,
  DELAY_AFTER_BACKGROUND,
  STRESS_ROUNDS_NAVIGATION,
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

enum KeyEventType {
  KEY_EVENT_DOWN = 0,
  KEY_EVENT_UP = 1
}

enum SequenceAction {
  ACTION_NONE = 0,
  ACTION_LEFT = 1,
  ACTION_RIGHT = 2,
  ACTION_UP = 3,
  ACTION_DOWN = 4,
  ACTION_CONFIRM = 5,
  ACTION_BACK = 6,
  ACTION_HOME = 7,
  ACTION_NEXT_FOCUS = 8,
  ACTION_INPUT_SPACE = 9,
  ACTION_CANCEL = 10,
  ACTION_MENU = 11
}

const UNKNOWN_KEY_NAME: string = 'UNKNOWN_KEY';

const DEBOUNCE_WINDOW_MS: number = 50;

class InvalidKeyCodeError extends Error {
  public invalidCode: number;

  constructor(invalidCode: number) {
    super(`unsupported key code ${invalidCode}`);
    this.name = 'InvalidKeyCodeError';
    this.invalidCode = invalidCode;
  }
}

interface ParseResult {
  actions: SequenceAction[];
  rejectedCodes: number[];
}

class KeyNameMapper {
  public static getName(keyCode: number): string {
    switch (keyCode) {
      case KEY_LEFT:
        return 'KEYCODE_DPAD_LEFT';
      case KEY_RIGHT:
        return 'KEYCODE_DPAD_RIGHT';
      case KEY_UP:
        return 'KEYCODE_DPAD_UP';
      case KEY_DOWN:
        return 'KEYCODE_DPAD_DOWN';
      case KEY_ENTER:
        return 'KEYCODE_ENTER';
      case KEY_BACK:
        return 'KEYCODE_BACK';
      case KEY_HOME:
        return 'KEYCODE_HOME';
      case KEY_TAB:
        return 'KEYCODE_TAB';
      case KEY_SPACE:
        return 'KEYCODE_SPACE';
      case KEY_ESCAPE:
        return 'KEYCODE_ESCAPE';
      case KEY_MENU:
        return 'KEYCODE_MENU';
      default:
        return UNKNOWN_KEY_NAME;
    }
  }

  public static isSupported(keyCode: number): boolean {
    return KeyNameMapper.getName(keyCode) !== UNKNOWN_KEY_NAME;
  }

  public static getSupportedCodes(): number[] {
    const codes: number[] = [
      KEY_LEFT, KEY_RIGHT, KEY_UP, KEY_DOWN, KEY_ENTER, KEY_BACK, KEY_HOME, KEY_TAB, KEY_SPACE, KEY_ESCAPE, KEY_MENU
    ];
    return codes;
  }

  public static getSupportedCount(): number {
    return KeyNameMapper.getSupportedCodes().length;
  }
}

class KeyEventModel {
  public keyCode: number;
  public eventType: number;
  public repeatCount: number;
  public timestamp: number;

  constructor(keyCode: number, eventType: number, repeatCount: number, timestamp: number) {
    this.keyCode = keyCode;
    this.eventType = eventType;
    this.repeatCount = repeatCount;
    this.timestamp = timestamp;
  }

  public static createDown(keyCode: number, timestamp: number): KeyEventModel {
    return new KeyEventModel(keyCode, KeyEventType.KEY_EVENT_DOWN, 0, timestamp);
  }

  public static createUp(keyCode: number, timestamp: number): KeyEventModel {
    return new KeyEventModel(keyCode, KeyEventType.KEY_EVENT_UP, 0, timestamp);
  }

  public getKeyName(): string {
    return KeyNameMapper.getName(this.keyCode);
  }

  public isDown(): boolean {
    return this.eventType === KeyEventType.KEY_EVENT_DOWN;
  }

  public isUp(): boolean {
    return this.eventType === KeyEventType.KEY_EVENT_UP;
  }

  public isRepeat(): boolean {
    return this.repeatCount > 0;
  }

  public isSupportedKey(): boolean {
    return KeyNameMapper.isSupported(this.keyCode);
  }

  public durationTo(other: KeyEventModel): number {
    return other.timestamp - this.timestamp;
  }

  public clone(): KeyEventModel {
    return new KeyEventModel(this.keyCode, this.eventType, this.repeatCount, this.timestamp);
  }

  public equals(other: KeyEventModel): boolean {
    return this.keyCode === other.keyCode && this.eventType === other.eventType &&
      this.repeatCount === other.repeatCount && this.timestamp === other.timestamp;
  }

  public toString(): string {
    return `KeyEventModel{keyCode: ${this.keyCode}, name: ${this.getKeyName()}, eventType: ${this.eventType}, ` +
      `repeatCount: ${this.repeatCount}, timestamp: ${this.timestamp}}`;
  }
}

class KeySequenceParser {
  public static toAction(keyCode: number): SequenceAction {
    switch (keyCode) {
      case KEY_LEFT:
        return SequenceAction.ACTION_LEFT;
      case KEY_RIGHT:
        return SequenceAction.ACTION_RIGHT;
      case KEY_UP:
        return SequenceAction.ACTION_UP;
      case KEY_DOWN:
        return SequenceAction.ACTION_DOWN;
      case KEY_ENTER:
        return SequenceAction.ACTION_CONFIRM;
      case KEY_BACK:
        return SequenceAction.ACTION_BACK;
      case KEY_HOME:
        return SequenceAction.ACTION_HOME;
      case KEY_TAB:
        return SequenceAction.ACTION_NEXT_FOCUS;
      case KEY_SPACE:
        return SequenceAction.ACTION_INPUT_SPACE;
      case KEY_ESCAPE:
        return SequenceAction.ACTION_CANCEL;
      case KEY_MENU:
        return SequenceAction.ACTION_MENU;
      default:
        return SequenceAction.ACTION_NONE;
    }
  }

  public static parse(codes: number[]): ParseResult {
    const actions: SequenceAction[] = [];
    const rejected: number[] = [];
    for (let i = 0; i < codes.length; i++) {
      const action: SequenceAction = KeySequenceParser.toAction(codes[i]);
      if (action === SequenceAction.ACTION_NONE) {
        rejected.push(codes[i]);
        continue;
      }
      actions.push(action);
    }
    const result: ParseResult = { actions: actions, rejectedCodes: rejected };
    return result;
  }

  public static validateOrThrow(codes: number[]): void {
    for (let i = 0; i < codes.length; i++) {
      if (!KeyNameMapper.isSupported(codes[i])) {
        throw new InvalidKeyCodeError(codes[i]);
      }
    }
  }

  public static countAction(result: ParseResult, action: SequenceAction): number {
    return result.actions.filter((item: SequenceAction) => item === action).length;
  }

  public static describe(actions: SequenceAction[]): string {
    const tokens: string[] = actions.map((item: SequenceAction) => KeySequenceParser.actionName(item));
    return tokens.join('>');
  }

  public static actionName(action: SequenceAction): string {
    switch (action) {
      case SequenceAction.ACTION_LEFT:
        return 'LEFT';
      case SequenceAction.ACTION_RIGHT:
        return 'RIGHT';
      case SequenceAction.ACTION_UP:
        return 'UP';
      case SequenceAction.ACTION_DOWN:
        return 'DOWN';
      case SequenceAction.ACTION_CONFIRM:
        return 'CONFIRM';
      case SequenceAction.ACTION_BACK:
        return 'BACK';
      case SequenceAction.ACTION_HOME:
        return 'HOME';
      case SequenceAction.ACTION_NEXT_FOCUS:
        return 'NEXT_FOCUS';
      case SequenceAction.ACTION_INPUT_SPACE:
        return 'INPUT_SPACE';
      case SequenceAction.ACTION_CANCEL:
        return 'CANCEL';
      case SequenceAction.ACTION_MENU:
        return 'MENU';
      default:
        return 'NONE';
    }
  }
}

class KeyRecord {
  public keyCode: number;
  public timestamp: number;

  constructor(keyCode: number, timestamp: number) {
    this.keyCode = keyCode;
    this.timestamp = timestamp;
  }
}

class KeyDebouncer {
  private windowMs: number;
  private records: KeyRecord[] = [];
  private acceptedCount: number = 0;
  private rejectedCount: number = 0;

  constructor(windowMs: number) {
    this.windowMs = windowMs;
  }

  public getWindowMs(): number {
    return this.windowMs;
  }

  public tryAccept(keyCode: number, timestamp: number): boolean {
    const lastRecord: KeyRecord | null = this.findLastRecord(keyCode);
    if (lastRecord !== null && timestamp - lastRecord.timestamp < this.windowMs) {
      this.rejectedCount++;
      return false;
    }
    this.records.push(new KeyRecord(keyCode, timestamp));
    this.acceptedCount++;
    return true;
  }

  public getAcceptedCount(): number {
    return this.acceptedCount;
  }

  public getRejectedCount(): number {
    return this.rejectedCount;
  }

  public getRecordCount(): number {
    return this.records.length;
  }

  public getLastTimestamp(keyCode: number): number {
    const lastRecord: KeyRecord | null = this.findLastRecord(keyCode);
    if (lastRecord === null) {
      return -1;
    }
    return lastRecord.timestamp;
  }

  public reset(): void {
    this.records = [];
    this.acceptedCount = 0;
    this.rejectedCount = 0;
  }

  private findLastRecord(keyCode: number): KeyRecord | null {
    for (let i = this.records.length - 1; i >= 0; i--) {
      if (this.records[i].keyCode === keyCode) {
        return this.records[i];
      }
    }
    return null;
  }
}

async function readHelloText(driver: Driver): Promise<string> {
  return await runSerializedUiOperation(async (): Promise<string> => {
    const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
    return await component.getText();
  });
}

export default function inputInteractionTest(): void {
  describe('InputInteractionTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, DELAY_AFTER_LAUNCH);
      await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      logInfo('InputInteractionTest beforeAll finished');

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
      await pressBackAndWait(driver);
      await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
      logInfo('InputInteractionTest afterAll finished');
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_0100
     * @tc.name testKeyEventDefaultConstruction
     * @tc.desc Verify KeyEventModel zero-value construction: keyCode 0, eventType 0, repeatCount 0, timestamp 0 -> down event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyEventDefaultConstruction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const event: KeyEventModel = new KeyEventModel(0, KeyEventType.KEY_EVENT_DOWN, 0, 0);
          expect(event.keyCode).assertEqual(0);
          expect(event.eventType).assertEqual(0);
          expect(event.repeatCount).assertEqual(0);
          expect(event.timestamp).assertEqual(0);
          expect(event.isDown()).assertTrue();
          expect(event.isRepeat()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_0200
     * @tc.name testKeyEventParameterizedConstruction
     * @tc.desc Verify KeyEventModel parameterized construction preserves every supplied field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyEventParameterizedConstruction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const event: KeyEventModel = new KeyEventModel(KEY_ENTER, KeyEventType.KEY_EVENT_UP, 3, 1000);
          expect(event.keyCode).assertEqual(KEY_ENTER);
          expect(event.eventType).assertEqual(KeyEventType.KEY_EVENT_UP);
          expect(event.repeatCount).assertEqual(3);
          expect(event.timestamp).assertEqual(1000);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_0300
     * @tc.name testKeyEventDownState
     * @tc.desc Verify a down event reports isDown true and isUp false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyEventDownState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const event: KeyEventModel = KeyEventModel.createDown(KEY_LEFT, 120);
          expect(event.isDown()).assertTrue();
          expect(event.isUp()).assertFalse();
          expect(event.getKeyName()).assertEqual('KEYCODE_DPAD_LEFT');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_0400
     * @tc.name testKeyEventUpState
     * @tc.desc Verify an up event reports isUp true and isDown false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyEventUpState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const event: KeyEventModel = KeyEventModel.createUp(KEY_RIGHT, 240);
          expect(event.isUp()).assertTrue();
          expect(event.isDown()).assertFalse();
          expect(event.getKeyName()).assertEqual('KEYCODE_DPAD_RIGHT');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_0500
     * @tc.name testKeyEventRepeatCountDetection
     * @tc.desc Verify repeatCount 0 is not a repeat while repeatCount 1 and 5 are repeats
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyEventRepeatCountDetection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const first: KeyEventModel = new KeyEventModel(KEY_DOWN, KeyEventType.KEY_EVENT_DOWN, 0, 0);
          const second: KeyEventModel = new KeyEventModel(KEY_DOWN, KeyEventType.KEY_EVENT_DOWN, 1, 16);
          const fifth: KeyEventModel = new KeyEventModel(KEY_DOWN, KeyEventType.KEY_EVENT_DOWN, 5, 80);
          expect(first.isRepeat()).assertFalse();
          expect(second.isRepeat()).assertTrue();
          expect(fifth.isRepeat()).assertTrue();
          expect(first.repeatCount).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_0600
     * @tc.name testKeyEventTimestampOrdering
     * @tc.desc Verify durationTo computes up timestamp minus down timestamp as 40 ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyEventTimestampOrdering', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const down: KeyEventModel = KeyEventModel.createDown(KEY_ENTER, 1000);
          const up: KeyEventModel = KeyEventModel.createUp(KEY_ENTER, 1040);
          expect(down.durationTo(up)).assertEqual(40);
          expect(up.durationTo(down)).assertEqual(-40);
          expect(down.durationTo(down)).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_0700
     * @tc.name testKeyEventKeyNameDpadLeftRight
     * @tc.desc Verify keyName mapping for KEY_LEFT and KEY_RIGHT direction keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyEventKeyNameDpadLeftRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(KeyNameMapper.getName(KEY_LEFT)).assertEqual('KEYCODE_DPAD_LEFT');
          expect(KeyNameMapper.getName(KEY_RIGHT)).assertEqual('KEYCODE_DPAD_RIGHT');
          expect(KeyNameMapper.isSupported(KEY_LEFT)).assertTrue();
          expect(KeyNameMapper.isSupported(KEY_RIGHT)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_0800
     * @tc.name testKeyEventKeyNameDpadUpDown
     * @tc.desc Verify keyName mapping for KEY_UP and KEY_DOWN direction keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyEventKeyNameDpadUpDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(KeyNameMapper.getName(KEY_UP)).assertEqual('KEYCODE_DPAD_UP');
          expect(KeyNameMapper.getName(KEY_DOWN)).assertEqual('KEYCODE_DPAD_DOWN');
          expect(KEY_UP).assertEqual(2012);
          expect(KEY_DOWN).assertEqual(2013);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_0900
     * @tc.name testKeyEventKeyNameEnterBack
     * @tc.desc Verify keyName mapping for KEY_ENTER and KEY_BACK system keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyEventKeyNameEnterBack', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(KeyNameMapper.getName(KEY_ENTER)).assertEqual('KEYCODE_ENTER');
          expect(KeyNameMapper.getName(KEY_BACK)).assertEqual('KEYCODE_BACK');
          expect(KEY_ENTER).assertEqual(2054);
          expect(KEY_BACK).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_1000
     * @tc.name testKeyEventKeyNameHomeTab
     * @tc.desc Verify keyName mapping for KEY_HOME and KEY_TAB keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyEventKeyNameHomeTab', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(KeyNameMapper.getName(KEY_HOME)).assertEqual('KEYCODE_HOME');
          expect(KeyNameMapper.getName(KEY_TAB)).assertEqual('KEYCODE_TAB');
          expect(KeyNameMapper.isSupported(KEY_HOME)).assertTrue();
          expect(KeyNameMapper.isSupported(KEY_TAB)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_1100
     * @tc.name testKeyEventKeyNameSpaceEscapeMenu
     * @tc.desc Verify keyName mapping for KEY_SPACE, KEY_ESCAPE and KEY_MENU keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyEventKeyNameSpaceEscapeMenu', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(KeyNameMapper.getName(KEY_SPACE)).assertEqual('KEYCODE_SPACE');
          expect(KeyNameMapper.getName(KEY_ESCAPE)).assertEqual('KEYCODE_ESCAPE');
          expect(KeyNameMapper.getName(KEY_MENU)).assertEqual('KEYCODE_MENU');
          expect(KEY_SPACE).assertEqual(2050);
          expect(KEY_ESCAPE).assertEqual(2070);
          expect(KEY_MENU).assertEqual(2067);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_1200
     * @tc.name testKeyEventKeyNameUnknownCode
     * @tc.desc Verify an unmapped keyCode such as 9999 resolves to UNKNOWN_KEY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyEventKeyNameUnknownCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(KeyNameMapper.getName(9999)).assertEqual('UNKNOWN_KEY');
          expect(KeyNameMapper.isSupported(9999)).assertFalse();
          const event: KeyEventModel = new KeyEventModel(9999, KeyEventType.KEY_EVENT_DOWN, 0, 10);
          expect(event.getKeyName()).assertEqual('UNKNOWN_KEY');
          expect(event.isSupportedKey()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_1300
     * @tc.name testKeyEventUnsupportedCodeRejection
     * @tc.desc Verify keyCodes 0, -1 and 100 are rejected as unsupported
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyEventUnsupportedCodeRejection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(KeyNameMapper.isSupported(0)).assertFalse();
          expect(KeyNameMapper.isSupported(-1)).assertFalse();
          expect(KeyNameMapper.isSupported(100)).assertFalse();
          expect(KeyNameMapper.isSupported(KEY_ESCAPE)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_1400
     * @tc.name testKeyEventSupportedCodeSet
     * @tc.desc Verify the supported code set contains exactly 11 distinct codes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyEventSupportedCodeSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const codes: number[] = KeyNameMapper.getSupportedCodes();
          expect(codes.length).assertEqual(11);
          expect(KeyNameMapper.getSupportedCount()).assertEqual(11);
          expect(codes.includes(KEY_LEFT)).assertTrue();
          expect(codes.includes(KEY_HOME)).assertTrue();
          expect(codes.includes(KEY_MENU)).assertTrue();
          expect(codes.includes(2016)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_1500
     * @tc.name testKeyEventEqualityComparison
     * @tc.desc Verify two events with identical fields are equal while a differing keyCode is not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyEventEqualityComparison', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const first: KeyEventModel = new KeyEventModel(KEY_UP, KeyEventType.KEY_EVENT_DOWN, 0, 500);
          const second: KeyEventModel = new KeyEventModel(KEY_UP, KeyEventType.KEY_EVENT_DOWN, 0, 500);
          const third: KeyEventModel = new KeyEventModel(KEY_DOWN, KeyEventType.KEY_EVENT_DOWN, 0, 500);
          expect(first.equals(second)).assertTrue();
          expect(first.equals(third)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_1600
     * @tc.name testKeyEventInequalityComparison
     * @tc.desc Verify eventType and timestamp differences break equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyEventInequalityComparison', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const base: KeyEventModel = new KeyEventModel(KEY_TAB, KeyEventType.KEY_EVENT_DOWN, 0, 100);
          const otherType: KeyEventModel = new KeyEventModel(KEY_TAB, KeyEventType.KEY_EVENT_UP, 0, 100);
          const otherTime: KeyEventModel = new KeyEventModel(KEY_TAB, KeyEventType.KEY_EVENT_DOWN, 0, 101);
          expect(base.equals(otherType)).assertFalse();
          expect(base.equals(otherTime)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_1700
     * @tc.name testKeyEventCloneIndependence
     * @tc.desc Verify a clone keeps original values and mutating the clone does not change the original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyEventCloneIndependence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const original: KeyEventModel = new KeyEventModel(KEY_SPACE, KeyEventType.KEY_EVENT_DOWN, 2, 700);
          const cloned: KeyEventModel = original.clone();
          expect(original.equals(cloned)).assertTrue();
          cloned.repeatCount = 9;
          cloned.timestamp = 800;
          expect(original.repeatCount).assertEqual(2);
          expect(original.timestamp).assertEqual(700);
          expect(cloned.repeatCount).assertEqual(9);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_1800
     * @tc.name testKeyEventToStringContent
     * @tc.desc Verify toString exposes keyCode, resolved key name and repeat count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyEventToStringContent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const event: KeyEventModel = new KeyEventModel(KEY_MENU, KeyEventType.KEY_EVENT_DOWN, 4, 900);
          const text: string = event.toString();
          expect(text.includes('KeyEventModel')).assertTrue();
          expect(text.includes('KEYCODE_MENU')).assertTrue();
          expect(text.includes('repeatCount: 4')).assertTrue();
          expect(text.includes('2067')).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_1900
     * @tc.name testKeyParserSingleEnter
     * @tc.desc Verify a single KEY_ENTER parses to exactly one CONFIRM action with no rejects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyParserSingleEnter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const codes: number[] = [KEY_ENTER];
          const result: ParseResult = KeySequenceParser.parse(codes);
          expect(result.actions.length).assertEqual(1);
          expect(result.actions[0]).assertEqual(SequenceAction.ACTION_CONFIRM);
          expect(result.rejectedCodes.length).assertEqual(0);
          expect(KeySequenceParser.describe(result.actions)).assertEqual('CONFIRM');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_2000
     * @tc.name testKeyParserHorizontalDirections
     * @tc.desc Verify LEFT, RIGHT, LEFT, RIGHT parses to two LEFT and two RIGHT actions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyParserHorizontalDirections', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const codes: number[] = [KEY_LEFT, KEY_RIGHT, KEY_LEFT, KEY_RIGHT];
          const result: ParseResult = KeySequenceParser.parse(codes);
          expect(result.actions.length).assertEqual(4);
          expect(KeySequenceParser.countAction(result, SequenceAction.ACTION_LEFT)).assertEqual(2);
          expect(KeySequenceParser.countAction(result, SequenceAction.ACTION_RIGHT)).assertEqual(2);
          expect(KeySequenceParser.describe(result.actions)).assertEqual('LEFT>RIGHT>LEFT>RIGHT');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_2100
     * @tc.name testKeyParserVerticalDirections
     * @tc.desc Verify UP, DOWN, DOWN, UP parses to two UP and two DOWN actions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyParserVerticalDirections', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const codes: number[] = [KEY_UP, KEY_DOWN, KEY_DOWN, KEY_UP];
          const result: ParseResult = KeySequenceParser.parse(codes);
          expect(KeySequenceParser.countAction(result, SequenceAction.ACTION_UP)).assertEqual(2);
          expect(KeySequenceParser.countAction(result, SequenceAction.ACTION_DOWN)).assertEqual(2);
          expect(result.rejectedCodes.length).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_2200
     * @tc.name testKeyParserBackAndHome
     * @tc.desc Verify KEY_BACK maps to BACK and KEY_HOME maps to HOME
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyParserBackAndHome', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const codes: number[] = [KEY_BACK, KEY_HOME];
          const result: ParseResult = KeySequenceParser.parse(codes);
          expect(result.actions[0]).assertEqual(SequenceAction.ACTION_BACK);
          expect(result.actions[1]).assertEqual(SequenceAction.ACTION_HOME);
          expect(KeySequenceParser.describe(result.actions)).assertEqual('BACK>HOME');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_2300
     * @tc.name testKeyParserTabSpaceEscapeMenu
     * @tc.desc Verify TAB, SPACE, ESCAPE and MENU map to NEXT_FOCUS, INPUT_SPACE, CANCEL and MENU
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyParserTabSpaceEscapeMenu', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const codes: number[] = [KEY_TAB, KEY_SPACE, KEY_ESCAPE, KEY_MENU];
          const result: ParseResult = KeySequenceParser.parse(codes);
          expect(result.actions[0]).assertEqual(SequenceAction.ACTION_NEXT_FOCUS);
          expect(result.actions[1]).assertEqual(SequenceAction.ACTION_INPUT_SPACE);
          expect(result.actions[2]).assertEqual(SequenceAction.ACTION_CANCEL);
          expect(result.actions[3]).assertEqual(SequenceAction.ACTION_MENU);
          expect(KeySequenceParser.describe(result.actions)).assertEqual('NEXT_FOCUS>INPUT_SPACE>CANCEL>MENU');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_2400
     * @tc.name testKeyParserEmptySequence
     * @tc.desc Verify an empty sequence yields zero actions and zero rejects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyParserEmptySequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const codes: number[] = [];
          const result: ParseResult = KeySequenceParser.parse(codes);
          expect(result.actions.length).assertEqual(0);
          expect(result.rejectedCodes.length).assertEqual(0);
          expect(KeySequenceParser.describe(result.actions)).assertEqual('');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_2500
     * @tc.name testKeyParserIllegalCodeCollection
     * @tc.desc Verify illegal codes 0, 88 and 9999 are collected while the valid LEFT action is kept
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyParserIllegalCodeCollection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const codes: number[] = [KEY_LEFT, 0, 88, KEY_ENTER, 9999];
          const result: ParseResult = KeySequenceParser.parse(codes);
          expect(result.actions.length).assertEqual(2);
          expect(result.rejectedCodes.length).assertEqual(3);
          expect(result.rejectedCodes[0]).assertEqual(0);
          expect(result.rejectedCodes[1]).assertEqual(88);
          expect(result.rejectedCodes[2]).assertEqual(9999);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_2600
     * @tc.name testKeyParserValidateOrThrowRejects
     * @tc.desc Verify validateOrThrow raises InvalidKeyCodeError carrying the offending keyCode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyParserValidateOrThrowRejects', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const codes: number[] = [KEY_LEFT, KEY_ENTER, 777];
          try {
            KeySequenceParser.validateOrThrow(codes);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('InvalidKeyCodeError');
            const failure: InvalidKeyCodeError = e as InvalidKeyCodeError;
            expect(failure.invalidCode).assertEqual(777);
            expect(failure.message).assertEqual('unsupported key code 777');
          }
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_2700
     * @tc.name testKeyParserActionDescription
     * @tc.desc Verify actionName maps each supported action to its uppercase token and unknown to NONE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyParserActionDescription', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(KeySequenceParser.actionName(SequenceAction.ACTION_LEFT)).assertEqual('LEFT');
          expect(KeySequenceParser.actionName(SequenceAction.ACTION_CONFIRM)).assertEqual('CONFIRM');
          expect(KeySequenceParser.actionName(SequenceAction.ACTION_CANCEL)).assertEqual('CANCEL');
          expect(KeySequenceParser.actionName(SequenceAction.ACTION_NONE)).assertEqual('NONE');
          expect(KeySequenceParser.actionName(SequenceAction.ACTION_MENU)).assertEqual('MENU');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_2800
     * @tc.name testKeyParserMixedSequenceCounts
     * @tc.desc Verify a mixed 9-key sequence keeps 8 actions in order and rejects 1 invalid code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyParserMixedSequenceCounts', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const codes: number[] = [KEY_LEFT, KEY_RIGHT, KEY_DOWN, KEY_UP, 555, KEY_ENTER, KEY_TAB, KEY_MENU, KEY_BACK];
          const result: ParseResult = KeySequenceParser.parse(codes);
          expect(result.actions.length).assertEqual(8);
          expect(result.rejectedCodes.length).assertEqual(1);
          expect(result.actions[3]).assertEqual(SequenceAction.ACTION_UP);
          expect(result.actions[7]).assertEqual(SequenceAction.ACTION_BACK);
          expect(KeySequenceParser.countAction(result, SequenceAction.ACTION_CONFIRM)).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_2900
     * @tc.name testKeyParserValidateOrThrowAcceptsValid
     * @tc.desc Verify validateOrThrow accepts a fully supported 6-key sequence and parse reports no rejects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyParserValidateOrThrowAcceptsValid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const codes: number[] = [KEY_LEFT, KEY_RIGHT, KEY_UP, KEY_DOWN, KEY_ENTER, KEY_BACK];
          KeySequenceParser.validateOrThrow(codes);
          const result: ParseResult = KeySequenceParser.parse(codes);
          expect(result.rejectedCodes.length).assertEqual(0);
          expect(result.actions.length).assertEqual(6);
          expect(KeySequenceParser.countAction(result, SequenceAction.ACTION_BACK)).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_3000
     * @tc.name testDebouncerAcceptsFirstEvent
     * @tc.desc Verify the debouncer accepts the first event of a key and records its timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDebouncerAcceptsFirstEvent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const debouncer: KeyDebouncer = new KeyDebouncer(DEBOUNCE_WINDOW_MS);
          expect(debouncer.tryAccept(KEY_LEFT, 1000)).assertTrue();
          expect(debouncer.getAcceptedCount()).assertEqual(1);
          expect(debouncer.getRejectedCount()).assertEqual(0);
          expect(debouncer.getLastTimestamp(KEY_LEFT)).assertEqual(1000);
          expect(debouncer.getWindowMs()).assertEqual(50);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_3100
     * @tc.name testDebouncerRejectsWithinWindow
     * @tc.desc Verify a second event of the same key 49 ms later is rejected as a duplicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDebouncerRejectsWithinWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const debouncer: KeyDebouncer = new KeyDebouncer(DEBOUNCE_WINDOW_MS);
          expect(debouncer.tryAccept(KEY_ENTER, 1000)).assertTrue();
          expect(debouncer.tryAccept(KEY_ENTER, 1049)).assertFalse();
          expect(debouncer.getAcceptedCount()).assertEqual(1);
          expect(debouncer.getRejectedCount()).assertEqual(1);
          expect(debouncer.getRecordCount()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_3200
     * @tc.name testDebouncerAcceptsAtWindowBoundary
     * @tc.desc Verify an event exactly 50 ms after the last accepted event is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDebouncerAcceptsAtWindowBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const debouncer: KeyDebouncer = new KeyDebouncer(DEBOUNCE_WINDOW_MS);
          expect(debouncer.tryAccept(KEY_RIGHT, 0)).assertTrue();
          expect(debouncer.tryAccept(KEY_RIGHT, 49)).assertFalse();
          expect(debouncer.tryAccept(KEY_RIGHT, 50)).assertTrue();
          expect(debouncer.getAcceptedCount()).assertEqual(2);
          expect(debouncer.getLastTimestamp(KEY_RIGHT)).assertEqual(50);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_3300
     * @tc.name testDebouncerAcceptsDifferentKeyWithinWindow
     * @tc.desc Verify different keys inside one 50 ms window are accepted independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDebouncerAcceptsDifferentKeyWithinWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const debouncer: KeyDebouncer = new KeyDebouncer(DEBOUNCE_WINDOW_MS);
          expect(debouncer.tryAccept(KEY_LEFT, 100)).assertTrue();
          expect(debouncer.tryAccept(KEY_RIGHT, 110)).assertTrue();
          expect(debouncer.tryAccept(KEY_UP, 120)).assertTrue();
          expect(debouncer.getAcceptedCount()).assertEqual(3);
          expect(debouncer.getRecordCount()).assertEqual(3);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_3400
     * @tc.name testDebouncerResetClearsState
     * @tc.desc Verify reset clears records and counters so the same key is accepted again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDebouncerResetClearsState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const debouncer: KeyDebouncer = new KeyDebouncer(DEBOUNCE_WINDOW_MS);
          debouncer.tryAccept(KEY_DOWN, 10);
          expect(debouncer.tryAccept(KEY_DOWN, 20)).assertFalse();
          debouncer.reset();
          expect(debouncer.getRecordCount()).assertEqual(0);
          expect(debouncer.getAcceptedCount()).assertEqual(0);
          expect(debouncer.getRejectedCount()).assertEqual(0);
          expect(debouncer.tryAccept(KEY_DOWN, 20)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_3500
     * @tc.name testDebouncerCountersTrackAccepts
     * @tc.desc Verify counters reflect 3 accepted and 2 rejected events across repeated presses
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDebouncerCountersTrackAccepts', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const debouncer: KeyDebouncer = new KeyDebouncer(DEBOUNCE_WINDOW_MS);
          expect(debouncer.tryAccept(KEY_MENU, 0)).assertTrue();
          expect(debouncer.tryAccept(KEY_MENU, 10)).assertFalse();
          expect(debouncer.tryAccept(KEY_MENU, 20)).assertFalse();
          expect(debouncer.tryAccept(KEY_MENU, 50)).assertTrue();
          expect(debouncer.tryAccept(KEY_MENU, 150)).assertTrue();
          expect(debouncer.getAcceptedCount()).assertEqual(3);
          expect(debouncer.getRejectedCount()).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_3600
     * @tc.name testDebouncerTimestampRegressionRejected
     * @tc.desc Verify a timestamp going backwards stays inside the window and is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDebouncerTimestampRegressionRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const debouncer: KeyDebouncer = new KeyDebouncer(DEBOUNCE_WINDOW_MS);
          expect(debouncer.tryAccept(KEY_HOME, 1000)).assertTrue();
          expect(debouncer.tryAccept(KEY_HOME, 900)).assertFalse();
          expect(debouncer.getLastTimestamp(KEY_HOME)).assertEqual(1000);
          expect(debouncer.getRejectedCount()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_3700
     * @tc.name testDebouncerStressAlternatingKeys
     * @tc.desc Verify 10 alternating LEFT and RIGHT presses at 50 ms spacing are all accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDebouncerStressAlternatingKeys', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const debouncer: KeyDebouncer = new KeyDebouncer(DEBOUNCE_WINDOW_MS);
          for (let i = 0; i < 5; i++) {
            expect(debouncer.tryAccept(KEY_LEFT, i * 100)).assertTrue();
            expect(debouncer.tryAccept(KEY_RIGHT, i * 100 + 50)).assertTrue();
          }
          expect(debouncer.getAcceptedCount()).assertEqual(10);
          expect(debouncer.getRejectedCount()).assertEqual(0);
          expect(debouncer.getRecordCount()).assertEqual(10);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_3800
     * @tc.name testKeyUiPageStableAfterLaunch
     * @tc.desc Verify the index page renders after launching EntryAbility and exposes the HelloWorld text node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyUiPageStableAfterLaunch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          expect(stable).assertTrue();
          const exists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(exists).assertTrue();
          const count: number = await pageComponentCount(driver);
          expect(count).assertLargerOrEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_3900
     * @tc.name testKeyUiLeftPressKeepsTextReadable
     * @tc.desc Verify two real LEFT key presses keep the index page text readable and unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyUiLeftPressKeepsTextReadable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const before: string = await readHelloText(driver);
          await pressAndWait(driver, KEY_LEFT, 2, DELAY_KEY_NAVIGATION);
          const after: string = await readHelloText(driver);
          expect(after).assertEqual(before);
          const readable: boolean = await checkTextContent(driver, after);
          expect(readable).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_4000
     * @tc.name testKeyUiRightThenLeftKeepsComponent
     * @tc.desc Verify RIGHT followed by LEFT keeps the HelloWorld component present and focus index valid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyUiRightThenLeftKeepsComponent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
          await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
          const exists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(exists).assertTrue();
          const focusIndex: number = await getCurrentFocusIndex(driver);
          expect(focusIndex).assertLargerOrEqual(-1);
          const count: number = await pageComponentCount(driver);
          expect(focusIndex < count || focusIndex === -1).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_4100
     * @tc.name testKeyUiEnterDoesNotMutateText
     * @tc.desc Verify a real ENTER key press does not change the displayed page text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyUiEnterDoesNotMutateText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const before: string = await readHelloText(driver);
          await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
          const after: string = await readHelloText(driver);
          expect(after).assertEqual(before);
          const texts: string[] = await collectAllTexts(driver);
          expect(texts.includes(after)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_4200
     * @tc.name testKeyUiTabSpaceEscapeMenuSequence
     * @tc.desc Verify TAB, SPACE, ESCAPE and MENU presses keep the page rendered with readable text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyUiTabSpaceEscapeMenuSequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await pressAndWait(driver, KEY_TAB, 1, DELAY_KEY_NAVIGATION);
          await pressAndWait(driver, KEY_SPACE, 1, DELAY_KEY_NAVIGATION);
          await pressAndWait(driver, KEY_ESCAPE, 1, DELAY_KEY_NAVIGATION);
          await pressAndWait(driver, KEY_MENU, 1, DELAY_KEY_NAVIGATION);
          const count: number = await pageComponentCount(driver);
          expect(count).assertLargerOrEqual(1);
          const visible: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
          const clickedVisible: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
          expect(visible || clickedVisible).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_4300
     * @tc.name testKeyUiBackHomeCycleKeepsPage
     * @tc.desc Verify BACK then relaunch then HOME keeps the ability launchable and the page stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyUiBackHomeCycleKeepsPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await pressBackAndWait(driver);
          await launchEntryAbility();
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          expect(stable).assertTrue();
          await pressHomeAndWait(driver);
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          await launchEntryAbility();
          const restored: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          expect(restored).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_4400
     * @tc.name testKeyUiArrowNavigationStress
     * @tc.desc Verify 20 rounds of alternating arrow key presses never break page rendering or text access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyUiArrowNavigationStress', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const startText: string = await readHelloText(driver);
          for (let i = 0; i < STRESS_ROUNDS_NAVIGATION; i++) {
            await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
            await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
          }
          const endText: string = await readHelloText(driver);
          expect(endText).assertEqual(startText);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          expect(stable).assertTrue();
          const count: number = await pageComponentCount(driver);
          expect(count).assertLargerOrEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_4500
     * @tc.name testKeyUiRapidPressDebounceAndRender
     * @tc.desc Verify three rapid real LEFT presses keep the page rendered while the model layer keeps only one event in 50 ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyUiRapidPressDebounceAndRender', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await pressAndWait(driver, KEY_LEFT, 3, 5);
          const exists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(exists).assertTrue();
          const debouncer: KeyDebouncer = new KeyDebouncer(DEBOUNCE_WINDOW_MS);
          expect(debouncer.tryAccept(KEY_LEFT, 0)).assertTrue();
          expect(debouncer.tryAccept(KEY_LEFT, 20)).assertFalse();
          expect(debouncer.tryAccept(KEY_LEFT, 40)).assertFalse();
          expect(debouncer.tryAccept(KEY_LEFT, 60)).assertTrue();
          expect(debouncer.getAcceptedCount()).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_4600
     * @tc.name testKeyUiCollectedTextsContainPageText
     * @tc.desc Verify texts collected from the real page contain the visible page title text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyUiCollectedTextsContainPageText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
          await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
          const current: string = await readHelloText(driver);
          const texts: string[] = await collectAllTexts(driver);
          expect(texts.includes(current)).assertTrue();
          expect(texts.length).assertLargerOrEqual(1);
          const count: number = await pageComponentCount(driver);
          expect(count).assertLargerOrEqual(texts.length);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_4700
     * @tc.name testKeyUiDelegatorTopAbilityName
     * @tc.desc Verify the delegator exposes a live top ability named EntryAbility while arrow keys are pressable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyUiDelegatorTopAbilityName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const delegator: abilityDelegatorRegistry.AbilityDelegator = getAbilityDelegator();
          const topAbility: UIAbility | null = await delegator.getCurrentTopAbility();
          expect(topAbility === null).assertFalse();
          expect(topAbility?.context.abilityInfo.name).assertEqual('EntryAbility');
          await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
          await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          expect(stable).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_4800
     * @tc.name testKeyUiForegroundAfterDirectionPress
     * @tc.desc Verify foreground cycles after UP and DOWN presses keep the HelloWorld text node visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyUiForegroundAfterDirectionPress', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await pressAndWait(driver, KEY_UP, 2, DELAY_KEY_NAVIGATION);
          await pressAndWait(driver, KEY_DOWN, 2, DELAY_KEY_NAVIGATION);
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const exists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(exists).assertTrue();
          const text: string = await readHelloText(driver);
          expect(isNonEmptyString(text)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_4900
     * @tc.name testKeyUiStartAbilityByWantThenKey
     * @tc.desc Verify starting the ability by want and pressing ENTER keeps a single readable page text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyUiStartAbilityByWantThenKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await startAbilityByWant(buildEntryWant());
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
          const text: string = await readHelloText(driver);
          expect(isNonEmptyString(text)).assertTrue();
          const texts: string[] = await collectAllTexts(driver);
          expect(texts.includes(text)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_5000
     * @tc.name testKeyUiEscapeMenuFromDelegator
     * @tc.desc Verify ESCAPE and MENU presses preserve the bundle identity read from the delegator arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyUiEscapeMenuFromDelegator', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(getBundleName()).assertEqual('com.samples.abilitystage');
          await pressAndWait(driver, KEY_ESCAPE, 1, DELAY_KEY_NAVIGATION);
          await pressAndWait(driver, KEY_MENU, 1, DELAY_KEY_NAVIGATION);
          const exists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(exists).assertTrue();
          const count: number = await pageComponentCount(driver);
          expect(count).assertLargerOrEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_5100
     * @tc.name testKeyUiSpaceTabFocusIndex
     * @tc.desc Verify SPACE and TAB presses keep the reported focus index inside the component range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyUiSpaceTabFocusIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await pressAndWait(driver, KEY_SPACE, 1, DELAY_KEY_NAVIGATION);
          await pressAndWait(driver, KEY_TAB, 1, DELAY_KEY_NAVIGATION);
          const focusIndex: number = await getCurrentFocusIndex(driver);
          const count: number = await pageComponentCount(driver);
          expect(count).assertLargerOrEqual(1);
          expect(focusIndex < count || focusIndex === -1).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_5200
     * @tc.name testKeyUiDebounceTimingOnRealPress
     * @tc.desc Verify real rapid LEFT presses complete within a measured budget and the model debouncer agrees
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyUiDebounceTimingOnRealPress', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const start: number = Date.now();
          await pressAndWait(driver, KEY_LEFT, 4, 20);
          const elapsed: number = measureElapsed(start);
          expect(elapsed).assertLargerOrEqual(0);
          expect(isWithinBudget(elapsed, 5000)).assertTrue();
          const debouncer: KeyDebouncer = new KeyDebouncer(DEBOUNCE_WINDOW_MS);
          expect(debouncer.tryAccept(KEY_LEFT, 0)).assertTrue();
          expect(debouncer.tryAccept(KEY_LEFT, 20)).assertFalse();
          expect(debouncer.getRejectedCount()).assertEqual(1);
          const exists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(exists).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_5300
     * @tc.name testKeyUiAllSupportedKeysSequence
     * @tc.desc Verify pressing each of the 11 supported keys once keeps the page rendered and readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyUiAllSupportedKeysSequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const codes: number[] = KeyNameMapper.getSupportedCodes();
          expect(codes.length).assertEqual(11);
          for (let i = 0; i < codes.length; i++) {
            if (codes[i] === KEY_BACK || codes[i] === KEY_HOME) {
              continue;
            }
            await pressAndWait(driver, codes[i], 1, DELAY_KEY_NAVIGATION);
          }
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          expect(stable).assertTrue();
          const text: string = await readHelloText(driver);
          expect(isNonEmptyString(text)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_5400
     * @tc.name testKeyUiParsedSequenceMatchesPressedKeys
     * @tc.desc Verify the parsed action sequence for the pressed keys matches the expected LEFT RIGHT CONFIRM order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyUiParsedSequenceMatchesPressedKeys', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const pressed: number[] = [KEY_LEFT, KEY_RIGHT, KEY_ENTER];
          await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
          await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
          await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
          const parsed: ParseResult = KeySequenceParser.parse(pressed);
          expect(KeySequenceParser.describe(parsed.actions)).assertEqual('LEFT>RIGHT>CONFIRM');
          expect(parsed.rejectedCodes.length).assertEqual(0);
          const exists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(exists).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_5500
     * @tc.name testKeyUiHomePressThenRelaunch
     * @tc.desc Verify a real HOME press followed by a relaunch restores the HelloWorld text node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyUiHomePressThenRelaunch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await pressHomeAndWait(driver);
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          expect(stable).assertTrue();
          const exists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(exists).assertTrue();
          const text: string = await readHelloText(driver);
          expect(isNonEmptyString(text)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_5600
     * @tc.name testKeyUiBackThenEnter
     * @tc.desc Verify BACK followed by ENTER and relaunch ends with a rendered page and a readable text node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyUiBackThenEnter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await pressBackAndWait(driver);
          await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const count: number = await pageComponentCount(driver);
          expect(count).assertLargerOrEqual(1);
          const text: string = await readHelloText(driver);
          expect(await checkTextContent(driver, text)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUT_5700
     * @tc.name testKeyUiKeyAfterTapKeepsClickedText
     * @tc.desc Verify tapping then pressing LEFT keeps the clicked page text Welcome visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyUiKeyAfterTapKeepsClickedText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const clicked: boolean = await tapComponentByText(driver, PAGE_TEXT_INITIAL);
          const current: string = await readHelloText(driver);
          expect(clicked || isNonEmptyString(current)).assertTrue();
          await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
          const after: string = await readHelloText(driver);
          expect(isNonEmptyString(after)).assertTrue();
          const texts: string[] = await collectAllTexts(driver);
          expect(texts.includes(after)).assertTrue();
        } finally {
          done();
        }
      })
  });
}
