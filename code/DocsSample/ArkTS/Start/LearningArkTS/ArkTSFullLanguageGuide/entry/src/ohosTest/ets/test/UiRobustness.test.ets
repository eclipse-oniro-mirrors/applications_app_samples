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

import { describe, it, expect, beforeEach } from '@ohos/hypium';
import { Component } from '@kit.TestKit';
import {
  ALL_PAGES, PAGE_BASICS, PAGE_CLASSES, PAGE_FUNCTIONS, PageSpec,
  INDEX_TITLE, STATUS_UNINITIALIZED, LOG_EMPTY,
  logBegin, logEnd, getDriver, startApp, lockRecovery, navigate, clickLabel, delay,
  readStatus, readLogRaw, backToIndex, waitForText, wakeScreen
} from './ArkTSGuideUiSupport';

async function fullCycle(): Promise<number> {
  let matched: number = 0;
  for (let i = 0; i < ALL_PAGES.length; i++) {
    const page: PageSpec = ALL_PAGES[i];
    if (!(await navigate(page))) {
      continue;
    }
    const clicked: boolean = await clickLabel(page.buttons[0]);
    const status: string = await readStatus();
    if (clicked && status === page.finishes[0]) {
      matched++;
    }
  }
  return matched;
}

/**
 * 锁屏唤醒、重复循环、连点与返回键等鲁棒性场景。
 */
export default function ArkTSUiRobustnessTest(): void {
  describe('ArkTSUiRobustnessTest', () => {

    beforeEach(async () => {
      const started: boolean = await startApp();
      expect(started).assertTrue();
      await lockRecovery();
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_ROBUST_testWakeUpRestoresForeground0001
     * @tc.name      testWakeUpRestoresForeground0001
     * @tc.desc      Verify a wake-up key event leaves the guide in its foreground state
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testWakeUpRestoresForeground0001', 0, async () => {
      logBegin('testWakeUpRestoresForeground0001');
      await wakeScreen();
      expect(await backToIndex()).assertTrue();
      const title: Component | null = await waitForText(INDEX_TITLE, 3000);
      expect(title !== null).assertTrue();
      expect(await (title as Component).getText()).assertEqual('Index');
      logEnd('testWakeUpRestoresForeground0001');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_ROBUST_testSingleFullCycle0002
     * @tc.name      testSingleFullCycle0002
     * @tc.desc      Verify one pass through all four pages completes every first button
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testSingleFullCycle0002', 0, async () => {
      logBegin('testSingleFullCycle0002');
      expect(await fullCycle()).assertEqual(4);
      expect(await backToIndex()).assertTrue();
      logEnd('testSingleFullCycle0002');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_ROBUST_testDoubleFullCycle0003
     * @tc.name      testDoubleFullCycle0003
     * @tc.desc      Verify a second full pass still completes all four pages without leakage
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testDoubleFullCycle0003', 0, async () => {
      logBegin('testDoubleFullCycle0003');
      const first: number = await fullCycle();
      expect(await backToIndex()).assertTrue();
      const second: number = await fullCycle();
      expect(first).assertEqual(4);
      expect(second).assertEqual(first);
      expect(await backToIndex()).assertTrue();
      logEnd('testDoubleFullCycle0003');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_ROBUST_testClosureReplayIsDeterministic0004
     * @tc.name      testClosureReplayIsDeterministic0004
     * @tc.desc      Verify the closure button logs counter 1 and 2 again on a fresh page instance
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testClosureReplayIsDeterministic0004', 0, async () => {
      logBegin('testClosureReplayIsDeterministic0004');
      expect(await navigate(PAGE_FUNCTIONS)).assertTrue();
      expect(await clickLabel(PAGE_FUNCTIONS.buttons[3])).assertTrue();
      const expected: string = 'counter(): 1\ncounter(): 2';
      expect(await readLogRaw()).assertEqual(expected);
      expect(await navigate(PAGE_FUNCTIONS)).assertTrue();
      expect(await clickLabel(PAGE_FUNCTIONS.buttons[3])).assertTrue();
      expect(await readLogRaw()).assertEqual(expected);
      logEnd('testClosureReplayIsDeterministic0004');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_ROBUST_testDoubleClickSameButton0005
     * @tc.name      testDoubleClickSameButton0005
     * @tc.desc      Verify clicking a button twice keeps a stable body and completion status
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testDoubleClickSameButton0005', 0, async () => {
      logBegin('testDoubleClickSameButton0005');
      expect(await navigate(PAGE_BASICS)).assertTrue();
      expect(await clickLabel(PAGE_BASICS.buttons[3])).assertTrue();
      const firstBody: string = await readLogRaw();
      const firstStatus: string = await readStatus();
      expect(await clickLabel(PAGE_BASICS.buttons[3])).assertTrue();
      await delay(200);
      expect(await readLogRaw()).assertEqual(firstBody);
      expect(await readStatus()).assertEqual(firstStatus);
      logEnd('testDoubleClickSameButton0005');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_ROBUST_testRapidModeSwitching0006
     * @tc.name      testRapidModeSwitching0006
     * @tc.desc      Verify switching pages rapidly keeps only the last page state visible
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testRapidModeSwitching0006', 0, async () => {
      logBegin('testRapidModeSwitching0006');
      expect(await navigate(PAGE_BASICS)).assertTrue();
      expect(await clickLabel(PAGE_BASICS.buttons[0])).assertTrue();
      await getDriver().pressBack();
      await delay(200);
      expect(await navigate(PAGE_CLASSES)).assertTrue();
      expect(await readStatus()).assertEqual(STATUS_UNINITIALIZED);
      expect(await readLogRaw()).assertEqual(LOG_EMPTY);
      expect(await clickLabel(PAGE_CLASSES.buttons[3])).assertTrue();
      expect(await readStatus()).assertEqual(PAGE_CLASSES.finishes[3]);
      logEnd('testRapidModeSwitching0006');
    });

  });
}
