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
import {
  PAGE_BASICS, PAGE_FUNCTIONS, PAGE_CLASSES, PAGE_GENERICS, ALL_PAGES, PageSpec,
  STATUS_UNINITIALIZED, LOG_EMPTY,
  logBegin, logEnd, startApp, lockRecovery, navigate, clickLabel, delay,
  readStatus, readLogRaw, runButtonCase, getDriver, waitForText
} from './ArkTSGuideUiSupport';

async function expectInitialState(page: PageSpec): Promise<void> {
  expect(await navigate(page)).assertTrue();
  expect(await readStatus()).assertEqual(STATUS_UNINITIALIZED);
  expect(await readLogRaw()).assertEqual(LOG_EMPTY);
}

/**
 * 内容页当前状态文本与初始日志占位文本的契约。
 */
export default function ArkTSUiStatusTextTest(): void {
  describe('ArkTSUiStatusTextTest', () => {

    beforeEach(async () => {
      const started: boolean = await startApp();
      expect(started).assertTrue();
      await lockRecovery();
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_STATUS_testBasicsInitialStatus0001
     * @tc.name      testBasicsInitialStatus0001
     * @tc.desc      Verify the Basics page opens with the uninitialized status and empty log
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testBasicsInitialStatus0001', 0, async () => {
      logBegin('testBasicsInitialStatus0001');
      await expectInitialState(PAGE_BASICS);
      expect(await readStatus()).assertEqual('未初始化');
      expect((await readLogRaw()).length > 0).assertTrue();
      logEnd('testBasicsInitialStatus0001');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_STATUS_testFunctionsInitialStatus0002
     * @tc.name      testFunctionsInitialStatus0002
     * @tc.desc      Verify the Functions page opens with the uninitialized status and empty log
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testFunctionsInitialStatus0002', 0, async () => {
      logBegin('testFunctionsInitialStatus0002');
      await expectInitialState(PAGE_FUNCTIONS);
      expect(await readStatus()).assertEqual('未初始化');
      expect((await readLogRaw()).length > 0).assertTrue();
      logEnd('testFunctionsInitialStatus0002');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_STATUS_testClassesInitialStatus0003
     * @tc.name      testClassesInitialStatus0003
     * @tc.desc      Verify the Classes page opens with the uninitialized status and empty log
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testClassesInitialStatus0003', 0, async () => {
      logBegin('testClassesInitialStatus0003');
      await expectInitialState(PAGE_CLASSES);
      expect(await readStatus()).assertEqual('未初始化');
      expect((await readLogRaw()).length > 0).assertTrue();
      logEnd('testClassesInitialStatus0003');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_STATUS_testGenericsInitialStatus0004
     * @tc.name      testGenericsInitialStatus0004
     * @tc.desc      Verify the Generics page opens with the uninitialized status and empty log
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testGenericsInitialStatus0004', 0, async () => {
      logBegin('testGenericsInitialStatus0004');
      await expectInitialState(PAGE_GENERICS);
      expect(await readStatus()).assertEqual('未初始化');
      expect((await readLogRaw()).length > 0).assertTrue();
      logEnd('testGenericsInitialStatus0004');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_STATUS_testBasicsButtonFinishes0005
     * @tc.name      testBasicsButtonFinishes0005
     * @tc.desc      Verify each Basics button sets its own completion status in order
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testBasicsButtonFinishes0005', 0, async () => {
      logBegin('testBasicsButtonFinishes0005');
      expect(await navigate(PAGE_BASICS)).assertTrue();
      for (let i = 0; i < PAGE_BASICS.buttons.length; i++) {
        expect(await clickLabel(PAGE_BASICS.buttons[i])).assertTrue();
        expect(await readStatus()).assertEqual(PAGE_BASICS.finishes[i]);
      }
      expect(await readStatus()).assertEqual('测试空安全完成');
      logEnd('testBasicsButtonFinishes0005');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_STATUS_testFunctionsButtonFinishes0006
     * @tc.name      testFunctionsButtonFinishes0006
     * @tc.desc      Verify each Functions button sets its own completion status in order
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testFunctionsButtonFinishes0006', 0, async () => {
      logBegin('testFunctionsButtonFinishes0006');
      expect(await navigate(PAGE_FUNCTIONS)).assertTrue();
      for (let i = 0; i < PAGE_FUNCTIONS.buttons.length; i++) {
        expect(await clickLabel(PAGE_FUNCTIONS.buttons[i])).assertTrue();
        expect(await readStatus()).assertEqual(PAGE_FUNCTIONS.finishes[i]);
      }
      expect(await readStatus()).assertEqual('测试闭包完成');
      logEnd('testFunctionsButtonFinishes0006');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_STATUS_testClassesButtonFinishes0007
     * @tc.name      testClassesButtonFinishes0007
     * @tc.desc      Verify each Classes button sets its own completion status in order
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testClassesButtonFinishes0007', 0, async () => {
      logBegin('testClassesButtonFinishes0007');
      expect(await navigate(PAGE_CLASSES)).assertTrue();
      for (let i = 0; i < PAGE_CLASSES.buttons.length; i++) {
        expect(await clickLabel(PAGE_CLASSES.buttons[i])).assertTrue();
        expect(await readStatus()).assertEqual(PAGE_CLASSES.finishes[i]);
      }
      expect(await readStatus()).assertEqual('测试继承完成');
      logEnd('testClassesButtonFinishes0007');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_STATUS_testGenericsButtonFinishes0008
     * @tc.name      testGenericsButtonFinishes0008
     * @tc.desc      Verify each Generics button sets its own completion status in order
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testGenericsButtonFinishes0008', 0, async () => {
      logBegin('testGenericsButtonFinishes0008');
      expect(await navigate(PAGE_GENERICS)).assertTrue();
      for (let i = 0; i < PAGE_GENERICS.buttons.length; i++) {
        expect(await clickLabel(PAGE_GENERICS.buttons[i])).assertTrue();
        expect(await readStatus()).assertEqual(PAGE_GENERICS.finishes[i]);
      }
      expect(await readStatus()).assertEqual('测试泛型约束完成');
      logEnd('testGenericsButtonFinishes0008');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_STATUS_testStatusIsIdempotent0009
     * @tc.name      testStatusIsIdempotent0009
     * @tc.desc      Verify clicking the same Basics button twice keeps the same completion status
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testStatusIsIdempotent0009', 0, async () => {
      logBegin('testStatusIsIdempotent0009');
      expect(await navigate(PAGE_BASICS)).assertTrue();
      expect(await clickLabel(PAGE_BASICS.buttons[0])).assertTrue();
      const first: string = await readStatus();
      expect(await clickLabel(PAGE_BASICS.buttons[0])).assertTrue();
      const second: string = await readStatus();
      expect(first).assertEqual(PAGE_BASICS.finishes[0]);
      expect(second).assertEqual(first);
      logEnd('testStatusIsIdempotent0009');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_STATUS_testStatusNeverRegresses0010
     * @tc.name      testStatusNeverRegresses0010
     * @tc.desc      Verify the status never returns to uninitialized after a click on the same page
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testStatusNeverRegresses0010', 0, async () => {
      logBegin('testStatusNeverRegresses0010');
      expect(await navigate(PAGE_FUNCTIONS)).assertTrue();
      expect(await clickLabel(PAGE_FUNCTIONS.buttons[2])).assertTrue();
      expect(await clickLabel(PAGE_FUNCTIONS.buttons[0])).assertTrue();
      await delay(200);
      const status: string = await readStatus();
      expect(status === STATUS_UNINITIALIZED).assertFalse();
      expect(status).assertEqual(PAGE_FUNCTIONS.finishes[0]);
      logEnd('testStatusNeverRegresses0010');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_STATUS_testStatusResetsAfterBack0011
     * @tc.name      testStatusResetsAfterBack0011
     * @tc.desc      Verify leaving a page and returning restores the uninitialized status
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testStatusResetsAfterBack0011', 0, async () => {
      logBegin('testStatusResetsAfterBack0011');
      expect(await navigate(PAGE_GENERICS)).assertTrue();
      expect(await clickLabel(PAGE_GENERICS.buttons[0])).assertTrue();
      expect(await readStatus()).assertEqual(PAGE_GENERICS.finishes[0]);
      expect(await navigate(PAGE_GENERICS)).assertTrue();
      expect(await readStatus()).assertEqual(STATUS_UNINITIALIZED);
      logEnd('testStatusResetsAfterBack0011');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_STATUS_testInitialLogText0012
     * @tc.name      testInitialLogText0012
     * @tc.desc      Verify every content page renders the documented empty-log placeholder verbatim
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testInitialLogText0012', 0, async () => {
      logBegin('testInitialLogText0012');
      let matched: number = 0;
      for (let i = 0; i < ALL_PAGES.length; i++) {
        expect(await navigate(ALL_PAGES[i])).assertTrue();
        const raw: string = await readLogRaw();
        if (raw === '暂无日志信息') {
          matched++;
        }
      }
      expect(matched).assertEqual(ALL_PAGES.length);
      expect(LOG_EMPTY.length).assertEqual(6);
      logEnd('testInitialLogText0012');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_STATUS_testFinishTextsAreUnique0013
     * @tc.name      testFinishTextsAreUnique0013
     * @tc.desc      Verify all 16 completion texts are distinct so status matching is unambiguous
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testFinishTextsAreUnique0013', 0, async () => {
      logBegin('testFinishTextsAreUnique0013');
      const all: Set<string> = new Set<string>();
      for (let i = 0; i < ALL_PAGES.length; i++) {
        for (let j = 0; j < ALL_PAGES[i].finishes.length; j++) {
          all.add(ALL_PAGES[i].finishes[j]);
        }
      }
      expect(all.size).assertEqual(16);
      expect(PAGE_BASICS.finishes[0] === PAGE_GENERICS.finishes[0]).assertFalse();
      logEnd('testFinishTextsAreUnique0013');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_STATUS_testCompletionFollowsLastClick0014
     * @tc.name      testCompletionFollowsLastClick0014
     * @tc.desc      Verify the status always reflects the most recently clicked button on the page
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testCompletionFollowsLastClick0014', 0, async () => {
      logBegin('testCompletionFollowsLastClick0014');
      expect(await navigate(PAGE_CLASSES)).assertTrue();
      expect(await clickLabel(PAGE_CLASSES.buttons[2])).assertTrue();
      expect(await readStatus()).assertEqual(PAGE_CLASSES.finishes[2]);
      expect(await clickLabel(PAGE_CLASSES.buttons[0])).assertTrue();
      expect(await readStatus()).assertEqual(PAGE_CLASSES.finishes[0]);
      const reverted: boolean = (await readStatus()) === PAGE_CLASSES.finishes[2];
      expect(reverted).assertFalse();
      logEnd('testCompletionFollowsLastClick0014');
    });

  });
}
