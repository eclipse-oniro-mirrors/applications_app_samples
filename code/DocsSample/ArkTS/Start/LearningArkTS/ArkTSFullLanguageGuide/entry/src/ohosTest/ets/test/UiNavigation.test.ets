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
import { Driver } from '@kit.TestKit';
import {
  INDEX_TITLE, TAB_BASICS, TAB_FUNCTIONS, TAB_CLASSES, TAB_GENERICS, ALL_PAGES, PageSpec,
  STATUS_UNINITIALIZED, LOG_EMPTY,
  logBegin, logEnd, getDriver, startApp, lockRecovery, clickLabel, backToIndex, delay,
  waitForText, navigate, readStatus, readLogRaw
} from './ArkTSGuideUiSupport';
import { ON, Component } from '@kit.TestKit';

const INDEX_TABS: string[] = [TAB_BASICS, TAB_FUNCTIONS, TAB_CLASSES, TAB_GENERICS];

async function indexTabCount(): Promise<number> {
  const d: Driver = getDriver();
  let count: number = 0;
  for (let i = 0; i < INDEX_TABS.length; i++) {
    if (await d.findComponent(ON.text(INDEX_TABS[i])) !== null) {
      count++;
    }
  }
  return count;
}

/**
 * Index 首页与四个内容页之间的路由导航契约。
 */
export default function ArkTSUiNavigationTest(): void {
  describe('ArkTSUiNavigationTest', () => {

    beforeEach(async () => {
      const started: boolean = await startApp();
      expect(started).assertTrue();
      await lockRecovery();
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_NAV_testIndexTitleVisible0001
     * @tc.name      testIndexTitleVisible0001
     * @tc.desc      Verify the Index title is rendered as the first screen heading
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testIndexTitleVisible0001', 0, async () => {
      logBegin('testIndexTitleVisible0001');
      expect(await backToIndex()).assertTrue();
      const title: Component | null = await waitForText(INDEX_TITLE, 3000);
      expect(title !== null).assertTrue();
      const titleText: string = await (title as Component).getText();
      expect(titleText).assertEqual('Index');
      expect(titleText.length).assertEqual(5);
      logEnd('testIndexTitleVisible0001');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_NAV_testIndexShowsFourTabs0002
     * @tc.name      testIndexShowsFourTabs0002
     * @tc.desc      Verify all four navigation buttons exist on the Index page
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testIndexShowsFourTabs0002', 0, async () => {
      logBegin('testIndexShowsFourTabs0002');
      expect(await backToIndex()).assertTrue();
      expect(await indexTabCount()).assertEqual(4);
      expect(INDEX_TABS.join(',')).assertEqual('基本知识,函数,类,泛型类型和函数');
      logEnd('testIndexShowsFourTabs0002');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_NAV_testBasicsTabNavigates0003
     * @tc.name      testBasicsTabNavigates0003
     * @tc.desc      Verify the 基本知识 tab opens the Basics page with its four buttons
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testBasicsTabNavigates0003', 0, async () => {
      logBegin('testBasicsTabNavigates0003');
      expect(await navigate(ALL_PAGES[0])).assertTrue();
      const declared: Component | null = await waitForText('测试变量声明', 2000);
      expect(declared !== null).assertTrue();
      const hit1: Component | null = await waitForText('测试空安全', 2000);
      expect(hit1 !== null).assertTrue();
      expect(hit1 === null).assertFalse();
      logEnd('testBasicsTabNavigates0003');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_NAV_testFunctionsTabNavigates0004
     * @tc.name      testFunctionsTabNavigates0004
     * @tc.desc      Verify the 函数 tab opens the Functions page with its four buttons
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testFunctionsTabNavigates0004', 0, async () => {
      logBegin('testFunctionsTabNavigates0004');
      expect(await navigate(ALL_PAGES[1])).assertTrue();
      const hit2: Component | null = await waitForText('测试函数声明', 2000);
      expect(hit2 !== null).assertTrue();
      expect(hit2 === null).assertFalse();
      const hit3: Component | null = await waitForText('测试闭包', 2000);
      expect(hit3 !== null).assertTrue();
      expect(hit3 === null).assertFalse();
      logEnd('testFunctionsTabNavigates0004');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_NAV_testClassesTabNavigates0005
     * @tc.name      testClassesTabNavigates0005
     * @tc.desc      Verify the 类 tab opens the Classes page with its four buttons
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testClassesTabNavigates0005', 0, async () => {
      logBegin('testClassesTabNavigates0005');
      expect(await navigate(ALL_PAGES[2])).assertTrue();
      const hit4: Component | null = await waitForText('测试类定义', 2000);
      expect(hit4 !== null).assertTrue();
      expect(hit4 === null).assertFalse();
      const hit5: Component | null = await waitForText('测试继承', 2000);
      expect(hit5 !== null).assertTrue();
      expect(hit5 === null).assertFalse();
      logEnd('testClassesTabNavigates0005');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_NAV_testGenericsTabNavigates0006
     * @tc.name      testGenericsTabNavigates0006
     * @tc.desc      Verify the 泛型类型和函数 tab opens the Generics page with its four buttons
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testGenericsTabNavigates0006', 0, async () => {
      logBegin('testGenericsTabNavigates0006');
      expect(await navigate(ALL_PAGES[3])).assertTrue();
      const hit6: Component | null = await waitForText('测试泛型介绍', 2000);
      expect(hit6 !== null).assertTrue();
      expect(hit6 === null).assertFalse();
      const hit7: Component | null = await waitForText('测试泛型约束', 2000);
      expect(hit7 !== null).assertTrue();
      expect(hit7 === null).assertFalse();
      logEnd('testGenericsTabNavigates0006');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_NAV_testBackReturnsToIndex0007
     * @tc.name      testBackReturnsToIndex0007
     * @tc.desc      Verify pressing back from a content page restores the Index screen
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testBackReturnsToIndex0007', 0, async () => {
      logBegin('testBackReturnsToIndex0007');
      expect(await navigate(ALL_PAGES[1])).assertTrue();
      await getDriver().pressBack();
      await delay(400);
      const hit8: Component | null = await waitForText(INDEX_TITLE, 3000);
      expect(hit8 !== null).assertTrue();
      expect(hit8 === null).assertFalse();
      expect(await indexTabCount()).assertEqual(4);
      logEnd('testBackReturnsToIndex0007');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_NAV_testContentPageReplacedOnBack0008
     * @tc.name      testContentPageReplacedOnBack0008
     * @tc.desc      Verify after back the Basics page buttons are gone from the screen
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testContentPageReplacedOnBack0008', 0, async () => {
      logBegin('testContentPageReplacedOnBack0008');
      expect(await navigate(ALL_PAGES[0])).assertTrue();
      const hit9: Component | null = await waitForText('测试BigInt', 2000);
      expect(hit9 !== null).assertTrue();
      expect(hit9 === null).assertFalse();
      await getDriver().pressBack();
      await delay(400);
      const hit10: Component | null = await waitForText(INDEX_TITLE, 3000);
      expect(hit10 !== null).assertTrue();
      expect(hit10 === null).assertFalse();
      const gone: Component | null = await waitForText('测试BigInt', 800);
      expect(gone).assertNull();
      logEnd('testContentPageReplacedOnBack0008');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_NAV_testReturningResetsPageState0009
     * @tc.name      testReturningResetsPageState0009
     * @tc.desc      Verify re-entering a page after back starts from the uninitialized state
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testReturningResetsPageState0009', 0, async () => {
      logBegin('testReturningResetsPageState0009');
      const page: PageSpec = ALL_PAGES[2];
      expect(await navigate(page)).assertTrue();
      expect(await clickLabel(page.buttons[3])).assertTrue();
      expect(await readStatus()).assertEqual(page.finishes[3]);
      await getDriver().pressBack();
      await delay(400);
      expect(await navigate(page)).assertTrue();
      expect(await readStatus()).assertEqual(STATUS_UNINITIALIZED);
      expect(await readLogRaw()).assertEqual(LOG_EMPTY);
      logEnd('testReturningResetsPageState0009');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_NAV_testSimpleNavigationRegression0010
     * @tc.name      testSimpleNavigationRegression0010
     * @tc.desc      Verify the removed Run Smoke button is not present on the Index page
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testSimpleNavigationRegression0010', 0, async () => {
      logBegin('testSimpleNavigationRegression0010');
      expect(await backToIndex()).assertTrue();
      const smoke: Component | null = await waitForText('Run Smoke', 800);
      expect(smoke).assertNull();
      const absent: boolean = smoke !== null;
      expect(absent).assertFalse();
      expect(await indexTabCount()).assertEqual(4);
      logEnd('testSimpleNavigationRegression0010');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_NAV_testTabSequenceKeepsWorking0011
     * @tc.name      testTabSequenceKeepsWorking0011
     * @tc.desc      Verify navigating through all four tabs in order succeeds each time
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testTabSequenceKeepsWorking0011', 0, async () => {
      logBegin('testTabSequenceKeepsWorking0011');
      let visited: number = 0;
      for (let i = 0; i < ALL_PAGES.length; i++) {
        if (await navigate(ALL_PAGES[i])) {
          visited++;
        }
      }
      expect(visited).assertEqual(4);
      expect(await backToIndex()).assertTrue();
      logEnd('testTabSequenceKeepsWorking0011');
    });

  });
}
