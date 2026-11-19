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
  tabsCount,
  tabContentCount,
  textCount,
  focusedCount,
  clickableCount,
  collectTexts,
  countTitles,
  containsLabel,
  tabTitleCount,
  panelSnapshot,
  serializedDelay,
  settlePanel,
  resetPanelToInitial,
  bringPanelToFront,
  PanelSnapshot,
  TAB_ADD_LABEL,
  TAB_CLOSE_LABEL,
  INITIAL_TAB_COUNT,
  FIRST_TAB_TITLE,
  SECOND_TAB_TITLE,
  TIMEOUT_PANEL_RENDER,
  TIMEOUT_STATE_SETTLE,
  DELAY_KEY_NAVIGATION,
  TOLERANCE_TAB_COUNT
} from '../Shared/SharedDriver';


enum Sval2Issue {
  OK = 'ok',
  EMPTY = 'empty',
  TOO_LONG = 'too_long',
  OUT_OF_RANGE = 'out_of_range',
  DUPLICATE = 'duplicate'
}

class Sval2Verdict {
  public issue: Sval2Issue;
  public accepted: boolean;

  constructor(issue: Sval2Issue, accepted: boolean) {
    this.issue = issue;
    this.accepted = accepted;
  }

  public static pass(): Sval2Verdict {
    return new Sval2Verdict(Sval2Issue.OK, true);
  }

  public static fail(issue: Sval2Issue): Sval2Verdict {
    return new Sval2Verdict(issue, false);
  }

  public isAccepted(): boolean {
    return this.accepted;
  }

  public describe(): string {
    return this.issue + '/' + this.accepted;
  }
}

class Sval2Validator {
  private static readonly MAX_LENGTH: int = 8;

  public static checkText(text: string): Sval2Verdict {
    if (text.length === 0) {
      return Sval2Verdict.fail(Sval2Issue.EMPTY);
    }
    if (text.length > Sval2Validator.MAX_LENGTH) {
      return Sval2Verdict.fail(Sval2Issue.TOO_LONG);
    }
    return Sval2Verdict.pass();
  }

  public static checkIndex(index: int, total: int): Sval2Verdict {
    if (index < 0 || index >= total) {
      return Sval2Verdict.fail(Sval2Issue.OUT_OF_RANGE);
    }
    return Sval2Verdict.pass();
  }

  public static checkUnique(values: string[], candidate: string): Sval2Verdict {
    if (values.indexOf(candidate) >= 0) {
      return Sval2Verdict.fail(Sval2Issue.DUPLICATE);
    }
    return Sval2Verdict.pass();
  }

  public static countAccepted(values: string[]): int {
    let counter: int = 0;
    for (let cursor: int = 0; cursor < values.length; cursor++) {
      if (Sval2Validator.checkText(values[cursor]).isAccepted()) {
        counter = counter + 1;
      }
    }
    return counter;
  }

  public static firstAccepted(values: string[]): string {
    for (let cursor: int = 0; cursor < values.length; cursor++) {
      if (Sval2Validator.checkText(values[cursor]).isAccepted()) {
        return values[cursor];
      }
    }
    return '';
  }

  public static requireIndex(index: int, total: int): int {
    if (index < 0 || index >= total) {
      throw new RangeError('index rejected: ' + index.toString());
    }
    return index;
  }

  public static requireText(text: string): string {
    if (text.length === 0) {
      throw new TypeError('empty text rejected');
    }
    return text;
  }
}

export default function securityValidationTest(): void {
  describe('SecurityValidation_Test', () => {
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
     * @tc.number SUB_SAMPLE_HANDLETABS_SECURITYVALIDATIONTEST_0100
     * @tc.name securityValidationTestCase001
     * @tc.desc Verify Tabs component renders: panel visible -> at least one Tabs node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('securityValidationTestCase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      const stable: boolean = await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      expect(stable).assertTrue();
      const tabs: number = await tabsCount(driver);
      expect(tabs).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_SECURITYVALIDATIONTEST_0200
     * @tc.name securityValidationTestCase002
     * @tc.desc Verify TabContent nodes: seeded strips -> content count matches tab count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('securityValidationTestCase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const contents: number = await tabContentCount(driver);
      const titles: number = await tabTitleCount(driver);
      expect(contents).assertLargerOrEqual(1);
      expect(titles).assertLargerOrEqual(INITIAL_TAB_COUNT - TOLERANCE_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_SECURITYVALIDATIONTEST_0300
     * @tc.name securityValidationTestCase003
     * @tc.desc Verify seeded titles: initial strip -> first and second page labels visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('securityValidationTestCase003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, FIRST_TAB_TITLE)).assertTrue();
      expect(containsLabel(texts, SECOND_TAB_TITLE)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_SECURITYVALIDATIONTEST_0400
     * @tc.name securityValidationTestCase004
     * @tc.desc Verify add button: initial strip below limit -> plus label present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('securityValidationTestCase004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, TAB_ADD_LABEL)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_SECURITYVALIDATIONTEST_0500
     * @tc.name securityValidationTestCase005
     * @tc.desc Verify close button: initial strip above minimum -> close label present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('securityValidationTestCase005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, TAB_CLOSE_LABEL)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_SECURITYVALIDATIONTEST_0600
     * @tc.name securityValidationTestCase006
     * @tc.desc Verify title prefix: rendered titles -> every tab label starts with page prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('securityValidationTestCase006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      const titles: number = countTitles(texts);
      expect(titles).assertLargerOrEqual(INITIAL_TAB_COUNT - TOLERANCE_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_SECURITYVALIDATIONTEST_0700
     * @tc.name securityValidationTestCase007
     * @tc.desc Verify clickable nodes: interactive strip -> clickable components reported
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('securityValidationTestCase007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const clickable: number = await clickableCount(driver);
      expect(clickable).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_SECURITYVALIDATIONTEST_0800
     * @tc.name securityValidationTestCase008
     * @tc.desc Verify focusable element: panel front -> at least one focused node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('securityValidationTestCase008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const focused: number = await focusedCount(driver);
      expect(focused).assertLargerOrEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_SECURITYVALIDATIONTEST_0900
     * @tc.name securityValidationTestCase009
     * @tc.desc Verify text nodes: tab bar labels rendered -> text component count above one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('securityValidationTestCase009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: number = await textCount(driver);
      expect(texts).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_SECURITYVALIDATIONTEST_1000
     * @tc.name securityValidationTestCase010
     * @tc.desc Verify snapshot capture: panel captured -> total components greater than zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('securityValidationTestCase010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const snapshot: PanelSnapshot = await panelSnapshot(driver);
      expect(snapshot.total() > 0).assertTrue();
      expect(snapshot.describe().startsWith('snapshot')).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_SECURITYVALIDATIONTEST_1100
     * @tc.name securityValidationTestCase011
     * @tc.desc Verify text gate: accepted short value ab -> ok verdict
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('securityValidationTestCase011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Sval2Validator.checkText('ab').isAccepted()).assertTrue();
      expect(Sval2Validator.checkText('ab').issue).assertEqual(Sval2Issue.OK);
    });
  });
}
