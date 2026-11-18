'use static'


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {
  describe,
  it,
  expect,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  TestType,
  Size,
  Level
} from '@ohos/hypium';

import {
  Driver
} from '@ohos.UiTest';

import {
  getDriver,
  waitForPanelStable,
  pressAndWait,
  tabsCount,
  serializedDelay,
  settlePanel,
  resetPanelToInitial,
  bringPanelToFront,
  TAB_PREFIX,
  TAB_DIVIDER_STROKE,
  SELECTED_FONT_COLOR,
  KEY_DPAD_LEFT,
  KEY_DPAD_RIGHT,
  TIMEOUT_PANEL_RENDER,
  TIMEOUT_STATE_SETTLE,
  TIMEOUT_FOCUS_CHANGE,
  DELAY_KEY_NAVIGATION
} from '../Shared/SharedDriver';


enum FocusDirection {
  LEFT = 'left',
  RIGHT = 'right',
  UP = 'up',
  DOWN = 'down'
}

class FocusTrail {
  private history: int[] = [];
  private static readonly MAX_HISTORY: int = 16;

  public record(index: int): void {
    this.history.push(index);
    if (this.history.length > FocusTrail.MAX_HISTORY) {
      this.history.shift();
    }
  }

  public getHistory(): int[] {
    return this.history.slice(0);
  }

  public getLast(): int {
    if (this.history.length === 0) {
      return -1;
    }
    return this.history[this.history.length - 1];
  }

  public getCount(): int {
    return this.history.length;
  }

  public clear(): void {
    this.history = [];
  }
}

class FocusNavigator {
  private current: int;
  private total: int;

  constructor(total: int) {
    this.total = total;
    this.current = 0;
  }

  public getCurrent(): int {
    return this.current;
  }

  public getTotal(): int {
    return this.total;
  }

  public moveTo(index: int): boolean {
    if (index < 0 || index >= this.total) {
      return false;
    }
    this.current = index;
    return true;
  }

  public moveNext(): boolean {
    if (this.current + 1 >= this.total) {
      return false;
    }
    this.current = this.current + 1;
    return true;
  }

  public movePrevious(): boolean {
    if (this.current - 1 < 0) {
      return false;
    }
    this.current = this.current - 1;
    return true;
  }

  public applyDirection(direction: FocusDirection): boolean {
    if (direction === FocusDirection.RIGHT || direction === FocusDirection.DOWN) {
      return this.moveNext();
    }
    return this.movePrevious();
  }

  public isAtStart(): boolean {
    return this.current === 0;
  }

  public isAtEnd(): boolean {
    return this.current === this.total - 1;
  }

  public reset(): void {
    this.current = 0;
  }
}

class FocusRingModel {
  public ringWidth: int;
  public ringColor: string;
  public animationMs: int;

  constructor(ringWidth: int, ringColor: string, animationMs: int) {
    this.ringWidth = ringWidth;
    this.ringColor = ringColor;
    this.animationMs = animationMs;
  }

  public static defaultRing(): FocusRingModel {
    return new FocusRingModel(TAB_DIVIDER_STROKE, SELECTED_FONT_COLOR, TIMEOUT_FOCUS_CHANGE);
  }

  public isAnimated(): boolean {
    return this.animationMs > 0;
  }

  public describe(): string {
    return `ring{${this.ringWidth}:${this.ringColor}:${this.animationMs}}`;
  }
}

export default function securityAccessibilityTest(): void {
  describe('SecurityAccessibility_Test', () => {
    beforeAll(async () => {
      await bringPanelToFront(getDriver());
    });

    beforeEach(async () => {
      await resetPanelToInitial(getDriver());
      await serializedDelay(getDriver(), DELAY_KEY_NAVIGATION);
    });

    afterEach(async () => {
      await settlePanel(getDriver());
    });

    afterAll(async () => {
      await serializedDelay(getDriver(), TIMEOUT_STATE_SETTLE);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_SECURITYACCESSIBILITYTEST_0100
     * @tc.name securityAccessibilityTestCase001
     * @tc.desc Verify focus navigation: two moves right -> current index two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('securityAccessibilityTestCase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const navigator: FocusNavigator = new FocusNavigator(4);
      expect(navigator.moveNext()).assertTrue();
      expect(navigator.moveNext()).assertTrue();
      expect(navigator.getCurrent()).assertEqual(2);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_SECURITYACCESSIBILITYTEST_0200
     * @tc.name securityAccessibilityTestCase002
     * @tc.desc Verify backward navigation: move from zero -> refused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('securityAccessibilityTestCase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const navigator: FocusNavigator = new FocusNavigator(4);
      expect(navigator.movePrevious()).assertFalse();
      navigator.moveTo(2);
      expect(navigator.movePrevious()).assertTrue();
      expect(navigator.getCurrent()).assertEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_SECURITYACCESSIBILITYTEST_0300
     * @tc.name securityAccessibilityTestCase003
     * @tc.desc Verify focus end boundary: at last slot -> next move refused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('securityAccessibilityTestCase003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const navigator: FocusNavigator = new FocusNavigator(3);
      expect(navigator.moveTo(2)).assertTrue();
      expect(navigator.isAtEnd()).assertTrue();
      expect(navigator.moveNext()).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_SECURITYACCESSIBILITYTEST_0400
     * @tc.name securityAccessibilityTestCase004
     * @tc.desc Verify direction mapping: right advances, left retreats
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('securityAccessibilityTestCase004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const navigator: FocusNavigator = new FocusNavigator(3);
      expect(navigator.applyDirection(FocusDirection.RIGHT)).assertTrue();
      expect(navigator.getCurrent()).assertEqual(1);
      expect(navigator.applyDirection(FocusDirection.LEFT)).assertTrue();
      expect(navigator.getCurrent()).assertEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_SECURITYACCESSIBILITYTEST_0500
     * @tc.name securityAccessibilityTestCase005
     * @tc.desc Verify vertical direction: down advances like right, up retreats
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('securityAccessibilityTestCase005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const navigator: FocusNavigator = new FocusNavigator(3);
      expect(navigator.applyDirection(FocusDirection.DOWN)).assertTrue();
      expect(navigator.getCurrent()).assertEqual(1);
      expect(navigator.applyDirection(FocusDirection.UP)).assertTrue();
      expect(navigator.getCurrent()).assertEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_SECURITYACCESSIBILITYTEST_0600
     * @tc.name securityAccessibilityTestCase006
     * @tc.desc Verify moveTo bounds: out of range target -> refused and position kept
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('securityAccessibilityTestCase006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const navigator: FocusNavigator = new FocusNavigator(3);
      expect(navigator.moveTo(3)).assertFalse();
      expect(navigator.moveTo(-1)).assertFalse();
      expect(navigator.getCurrent()).assertEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_SECURITYACCESSIBILITYTEST_0700
     * @tc.name securityAccessibilityTestCase007
     * @tc.desc Verify focus trail: three records -> last equals two and count three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('securityAccessibilityTestCase007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const trail: FocusTrail = new FocusTrail();
      trail.record(0);
      trail.record(1);
      trail.record(2);
      expect(trail.getCount()).assertEqual(3);
      expect(trail.getLast()).assertEqual(2);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_SECURITYACCESSIBILITYTEST_0800
     * @tc.name securityAccessibilityTestCase008
     * @tc.desc Verify trail capacity: more than limit recorded -> history trimmed to limit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('securityAccessibilityTestCase008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const trail: FocusTrail = new FocusTrail();
      for (let cursor: int = 0; cursor < 20; cursor++) {
        trail.record(cursor);
      }
      expect(trail.getCount()).assertEqual(16);
      expect(trail.getLast()).assertEqual(19);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_SECURITYACCESSIBILITYTEST_0900
     * @tc.name securityAccessibilityTestCase009
     * @tc.desc Verify empty trail: no records -> last index minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('securityAccessibilityTestCase009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const trail: FocusTrail = new FocusTrail();
      expect(trail.getLast()).assertEqual(-1);
      expect(trail.getHistory().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_SECURITYACCESSIBILITYTEST_1000
     * @tc.name securityAccessibilityTestCase010
     * @tc.desc Verify focus ring: default ring -> animated with expected width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('securityAccessibilityTestCase010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ring: FocusRingModel = FocusRingModel.defaultRing();
      expect(ring.ringWidth).assertEqual(TAB_DIVIDER_STROKE);
      expect(ring.isAnimated()).assertTrue();
      expect(ring.ringColor).assertEqual(SELECTED_FONT_COLOR);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_SECURITYACCESSIBILITYTEST_1100
     * @tc.name securityAccessibilityTestCase011
     * @tc.desc Verify driver focus navigation: arrow keys pressed -> panel stays visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('securityAccessibilityTestCase011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await pressAndWait(driver, KEY_DPAD_RIGHT, 2, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_DPAD_LEFT, 1, DELAY_KEY_NAVIGATION);
      const tabs: number = await tabsCount(driver);
      expect(tabs).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_SECURITYACCESSIBILITYTEST_1200
     * @tc.name securityAccessibilityTestCase012
     * @tc.desc Verify tab title prefix: TAB_PREFIX equals declared literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('securityAccessibilityTestCase012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TAB_PREFIX).assertEqual('页面');
    });
  });
}
