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

import { describe, it, expect, TestType, Size, Level, beforeAll, afterEach } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  UiFlow, BoxInfo, ID_SWITCH, ID_SEARCH, ID_ADD, ID_MORE, ID_ACCOUNT, TEXT_MENU_FIRST
} from '../util/UiFlow';
import { assertNarrowLayout } from '../util/UiFlow';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';

export default function uiNavReal02Test() {
  describe('MultiNavBarUiNavReal02', () => {
    let flow: UiFlow = new UiFlow();

    beforeAll(async () => {
      flow = await UiFlow.boot();
      await flow.reset();
    });

    afterEach(async () => {
      await flow.reset();
    });

    /**
     * @tc.name   testUiNavReal020026
     * @tc.number SUB_MNB_UI_5026
     * @tc.desc   tabs mode renders the add button only, the more button stays out of the tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal020026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020026 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal020026');
        return;
      }
      const addPresent: boolean = await flow.exists(ID_ADD);
      const morePresent: boolean = await flow.exists(ID_MORE);
      const menuPresent: boolean = await flow.textExists(TEXT_MENU_FIRST);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(addPresent), 'true');
      expect(addPresent).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(morePresent),
        'false');
      expect(morePresent).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(menuPresent),
        'false');
      expect(menuPresent).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020026 end');
    });

    /**
     * @tc.name   testUiNavReal020027
     * @tc.number SUB_MNB_UI_5027
     * @tc.desc   adding a tool keeps tabs mode and does not create the more button yet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal020027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020027 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal020027');
        return;
      }
      const added: boolean = await flow.addTool();
      const addPresent: boolean = await flow.exists(ID_ADD);
      const morePresent: boolean = await flow.exists(ID_MORE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(added), 'true');
      expect(added).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(addPresent),
        'true');
      expect(addPresent).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(morePresent),
        'false');
      expect(morePresent).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020027 end');
    });

    /**
     * @tc.name   testUiNavReal020028
     * @tc.number SUB_MNB_UI_5028
     * @tc.desc   once two tools exist list mode swaps the add button for the more button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal020028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020028 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal020028');
        return;
      }
      await flow.addTool();
      const added: boolean = await flow.addTool();
      await flow.ensureList();
      const morePresent: boolean = await flow.exists(ID_MORE);
      const addPresent: boolean = await flow.exists(ID_ADD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(added), 'true');
      expect(added).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(morePresent),
        'true');
      expect(morePresent).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(addPresent),
        'false');
      expect(addPresent).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020028 end');
    });

    /**
     * @tc.name   testUiNavReal020029
     * @tc.number SUB_MNB_UI_5029
     * @tc.desc   tapping the more button pops a menu that carries the first tool entry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal020029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020029 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal020029');
        return;
      }
      await flow.addTool();
      await flow.addTool();
      await flow.ensureList();
      const opened: boolean = await flow.tap(ID_MORE);
      const menuShown: boolean = await flow.waitText(TEXT_MENU_FIRST, 3000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(opened), 'true');
      expect(opened).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(menuShown), 'true');
      expect(menuShown).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(await flow.exists(ID_MORE)), 'true');
      expect(await flow.exists(ID_MORE)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020029 end');
    });

    /**
     * @tc.name   testUiNavReal020030
     * @tc.number SUB_MNB_UI_5030
     * @tc.desc   the menu entry has a usable size while the popup is open
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal020030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020030 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal020030');
        return;
      }
      await flow.addTool();
      await flow.addTool();
      await flow.ensureList();
      await flow.tap(ID_MORE);
      const menuShown: boolean = await flow.waitText(TEXT_MENU_FIRST, 3000);
      const menuBox: BoxInfo = await flow.boxOfText(TEXT_MENU_FIRST);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(menuShown), 'true');
      expect(menuShown).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=>0', menuBox.right - menuBox.left);
      expect(menuBox.right - menuBox.left > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=>0', menuBox.bottom - menuBox.top);
      expect(menuBox.bottom - menuBox.top > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020030 end');
    });

    /**
     * @tc.name   testUiNavReal020031
     * @tc.number SUB_MNB_UI_5031
     * @tc.desc   the menu floats above the more button instead of below it
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal020031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020031 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal020031');
        return;
      }
      await flow.addTool();
      await flow.addTool();
      await flow.ensureList();
      await flow.tap(ID_MORE);
      const menuShown: boolean = await flow.waitText(TEXT_MENU_FIRST, 3000);
      const menuBox: BoxInfo = await flow.boxOfText(TEXT_MENU_FIRST);
      const moreBox: BoxInfo = await flow.boxOf(ID_MORE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(menuShown), 'true');
      expect(menuShown).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=<%{public}d', menuBox.top, moreBox.top);
      expect(menuBox.top < moreBox.top).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(moreBox.present),
        'true');
      expect(moreBox.present).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020031 end');
    });

    /**
     * @tc.name   testUiNavReal020032
     * @tc.number SUB_MNB_UI_5032
     * @tc.desc   pressing back closes the popup and keeps the more button on screen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal020032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020032 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal020032');
        return;
      }
      await flow.addTool();
      await flow.addTool();
      await flow.ensureList();
      await flow.tap(ID_MORE);
      const menuShown: boolean = await flow.waitText(TEXT_MENU_FIRST, 3000);
      const closed: boolean = await flow.closeMenu();
      const menuGone: boolean = await flow.waitNoText(TEXT_MENU_FIRST, 3000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(menuShown), 'true');
      expect(menuShown).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(closed), 'true');
      expect(closed).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(menuGone), 'true');
      expect(menuGone).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020032 end');
    });

    /**
     * @tc.name   testUiNavReal020033
     * @tc.number SUB_MNB_UI_5033
     * @tc.desc   the popup can be reopened after it was dismissed once
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal020033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020033 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal020033');
        return;
      }
      await flow.addTool();
      await flow.addTool();
      await flow.ensureList();
      await flow.tap(ID_MORE);
      const firstShown: boolean = await flow.waitText(TEXT_MENU_FIRST, 3000);
      await flow.closeMenu();
      const secondTap: boolean = await flow.tap(ID_MORE);
      const secondShown: boolean = await flow.waitText(TEXT_MENU_FIRST, 3000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(firstShown), 'true');
      expect(firstShown).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(secondTap), 'true');
      expect(secondTap).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(secondShown),
        'true');
      expect(secondShown).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020033 end');
    });

    /**
     * @tc.name   testUiNavReal020034
     * @tc.number SUB_MNB_UI_5034
     * @tc.desc   list mode keeps the account block and the add button out of the tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal020034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020034 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal020034');
        return;
      }
      await flow.addTool();
      await flow.addTool();
      await flow.ensureList();
      const account: boolean = await flow.exists(ID_ACCOUNT);
      const addPresent: boolean = await flow.exists(ID_ADD);
      const morePresent: boolean = await flow.exists(ID_MORE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(account), 'false');
      expect(account).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(addPresent),
        'false');
      expect(addPresent).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(morePresent),
        'true');
      expect(morePresent).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020034 end');
    });

    /**
     * @tc.name   testUiNavReal020035
     * @tc.number SUB_MNB_UI_5035
     * @tc.desc   tapping the absent more button in tabs mode is a no op
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal020035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020035 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal020035');
        return;
      }
      await flow.ensureTabs();
      const tapped: boolean = await flow.tap(ID_MORE);
      const addPresent: boolean = await flow.exists(ID_ADD);
      const morePresent: boolean = await flow.exists(ID_MORE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tapped), 'false');
      expect(tapped).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(addPresent),
        'true');
      expect(addPresent).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(morePresent),
        'false');
      expect(morePresent).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020035 end');
    });

    /**
     * @tc.name   testUiNavReal020036
     * @tc.number SUB_MNB_UI_5036
     * @tc.desc   tapping the absent add button in list mode is a no op
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal020036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020036 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal020036');
        return;
      }
      await flow.addTool();
      await flow.addTool();
      await flow.ensureList();
      const tapped: boolean = await flow.tap(ID_ADD);
      const morePresent: boolean = await flow.exists(ID_MORE);
      const account: boolean = await flow.exists(ID_ACCOUNT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tapped), 'false');
      expect(tapped).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(morePresent),
        'true');
      expect(morePresent).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(account), 'false');
      expect(account).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020036 end');
    });

    /**
     * @tc.name   testUiNavReal020037
     * @tc.number SUB_MNB_UI_5037
     * @tc.desc   the more button keeps a positive size below the search field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal020037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020037 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal020037');
        return;
      }
      await flow.addTool();
      await flow.addTool();
      await flow.ensureList();
      const moreBox: BoxInfo = await flow.boxOf(ID_MORE);
      const searchBox: BoxInfo = await flow.boxOf(ID_SEARCH);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=>0', moreBox.right - moreBox.left);
      expect(moreBox.right - moreBox.left > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=>%{public}d', moreBox.top,
        searchBox.top);
      expect(moreBox.top > searchBox.top).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=>0', moreBox.bottom - moreBox.top);
      expect(moreBox.bottom - moreBox.top > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020037 end');
    });

    /**
     * @tc.name   testUiNavReal020038
     * @tc.number SUB_MNB_UI_5038
     * @tc.desc   the add button stays reachable after repeated additions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal020038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020038 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal020038');
        return;
      }
      const added: boolean = await flow.addTool();
      const addBox: BoxInfo = await flow.boxOf(ID_ADD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(added), 'true');
      expect(added).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(addBox.present),
        'true');
      expect(addBox.present).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=>0', addBox.right - addBox.left);
      expect(addBox.right - addBox.left > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020038 end');
    });

    /**
     * @tc.name   testUiNavReal020039
     * @tc.number SUB_MNB_UI_5039
     * @tc.desc   a tabs to list round trip preserves the tool list behind the more button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal020039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020039 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal020039');
        return;
      }
      await flow.addTool();
      await flow.addTool();
      await flow.ensureList();
      const firstMore: boolean = await flow.exists(ID_MORE);
      await flow.ensureTabs();
      await flow.ensureList();
      const secondMore: boolean = await flow.exists(ID_MORE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(firstMore), 'true');
      expect(firstMore).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(secondMore),
        'true');
      expect(secondMore).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(await flow.exists(ID_ADD)), 'false');
      expect(await flow.exists(ID_ADD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020039 end');
    });

    /**
     * @tc.name   testUiNavReal020040
     * @tc.number SUB_MNB_UI_5040
     * @tc.desc   closing an already closed popup is harmless and tabs mode survives
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal020040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020040 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal020040');
        return;
      }
      const closed: boolean = await flow.closeMenu();
      const reset: boolean = await flow.reset();
      const addPresent: boolean = await flow.exists(ID_ADD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(closed), 'true');
      expect(closed).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reset), 'true');
      expect(reset).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(addPresent),
        'true');
      expect(addPresent).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020040 end');
    });

    /**
     * @tc.name   testUiNavReal020041
     * @tc.number SUB_MNB_UI_5041
     * @tc.desc   the search field is still the full width form after a tool was added
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal020041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020041 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal020041');
        return;
      }
      await flow.addTool();
      await flow.ensureTabs();
      const tabsWidth: number = (await flow.boxOf(ID_SEARCH)).right - (await flow.boxOf(ID_SEARCH)).left;
      await flow.ensureList();
      const listWidth: number = (await flow.boxOf(ID_SEARCH)).right - (await flow.boxOf(ID_SEARCH)).left;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=>%{public}d', tabsWidth, listWidth);
      expect(tabsWidth > listWidth).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=>0', tabsWidth);
      expect(tabsWidth > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=>0', listWidth);
      expect(listWidth > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020041 end');
    });

    /**
     * @tc.name   testUiNavReal020042
     * @tc.number SUB_MNB_UI_5042
     * @tc.desc   the reset helper always ends in tabs mode with a visible account block
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal020042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020042 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal020042');
        return;
      }
      await flow.ensureList();
      const reset: boolean = await flow.reset();
      const account: boolean = await flow.exists(ID_ACCOUNT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reset), 'true');
      expect(reset).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(account), 'true');
      expect(account).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(await flow.exists(ID_MORE)), 'false');
      expect(await flow.exists(ID_MORE)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020042 end');
    });

    /**
     * @tc.name   testUiNavReal020043
     * @tc.number SUB_MNB_UI_5043
     * @tc.desc   the hamburger button remains the only mode switch while a popup is open
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal020043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020043 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal020043');
        return;
      }
      await flow.addTool();
      await flow.addTool();
      await flow.ensureList();
      await flow.tap(ID_MORE);
      await flow.waitText(TEXT_MENU_FIRST, 3000);
      const switchPresent: boolean = await flow.exists(ID_SWITCH);
      const morePresent: boolean = await flow.exists(ID_MORE);
      const addPresent: boolean = await flow.exists(ID_ADD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(switchPresent),
        'true');
      expect(switchPresent).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(morePresent),
        'true');
      expect(morePresent).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(addPresent),
        'false');
      expect(addPresent).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020043 end');
    });

    /**
     * @tc.name   testUiNavReal020044
     * @tc.number SUB_MNB_UI_5044
     * @tc.desc   switching out of list mode with an open popup is rejected softly and recovers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal020044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020044 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal020044');
        return;
      }
      await flow.addTool();
      await flow.addTool();
      await flow.ensureList();
      await flow.tap(ID_MORE);
      await flow.waitText(TEXT_MENU_FIRST, 3000);
      await flow.closeMenu();
      const backToTabs: boolean = await flow.ensureTabs();
      const addPresent: boolean = await flow.exists(ID_ADD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(backToTabs),
        'true');
      expect(backToTabs).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(addPresent),
        'true');
      expect(addPresent).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(await flow.textExists(TEXT_MENU_FIRST)), 'false');
      expect(await flow.textExists(TEXT_MENU_FIRST)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020044 end');
    });

    /**
     * @tc.name   testUiNavReal020045
     * @tc.number SUB_MNB_UI_5045
     * @tc.desc   the more button shares the left edge of the search field in list mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal020045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020045 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal020045');
        return;
      }
      await flow.addTool();
      await flow.addTool();
      await flow.ensureList();
      const moreBox: BoxInfo = await flow.boxOf(ID_MORE);
      const searchBox: BoxInfo = await flow.boxOf(ID_SEARCH);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=<=%{public}d', moreBox.left,
        searchBox.left);
      expect(moreBox.left <= searchBox.left).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=<=%{public}d', moreBox.right,
        searchBox.right);
      expect(moreBox.right <= searchBox.right).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(moreBox.present),
        'true');
      expect(moreBox.present).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020045 end');
    });

    /**
     * @tc.name   testUiNavReal020046
     * @tc.number SUB_MNB_UI_5046
     * @tc.desc   the first tool entry is still listed after two more additions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal020046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020046 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal020046');
        return;
      }
      await flow.addTool();
      await flow.addTool();
      await flow.ensureList();
      const opened: boolean = await flow.tap(ID_MORE);
      const shown: boolean = await flow.waitText(TEXT_MENU_FIRST, 3000);
      const menuBox: BoxInfo = await flow.boxOfText(TEXT_MENU_FIRST);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(opened), 'true');
      expect(opened).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(shown), 'true');
      expect(shown).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(menuBox.present),
        'true');
      expect(menuBox.present).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020046 end');
    });

    /**
     * @tc.name   testUiNavReal020047
     * @tc.number SUB_MNB_UI_5047
     * @tc.desc   every addition is accepted, the add button never disables itself
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal020047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020047 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal020047');
        return;
      }
      const first: boolean = await flow.addTool();
      const second: boolean = await flow.addTool();
      const third: boolean = await flow.addTool();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(first), 'true');
      expect(first).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(second), 'true');
      expect(second).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(third), 'true');
      expect(third).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020047 end');
    });

    /**
     * @tc.name   testUiNavReal020048
     * @tc.number SUB_MNB_UI_5048
     * @tc.desc   the footer area keeps a single icon row, add and more never coexist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal020048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020048 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal020048');
        return;
      }
      await flow.addTool();
      await flow.addTool();
      const tabsAdd: boolean = await flow.exists(ID_ADD);
      const tabsMore: boolean = await flow.exists(ID_MORE);
      await flow.ensureList();
      const listAdd: boolean = await flow.exists(ID_ADD);
      const listMore: boolean = await flow.exists(ID_MORE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(tabsAdd && !tabsMore), 'true');
      expect(tabsAdd && !tabsMore).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(!listAdd && listMore), 'true');
      expect(!listAdd && listMore).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(tabsAdd !== listAdd), 'true');
      expect(tabsAdd !== listAdd).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020048 end');
    });

    /**
     * @tc.name   testUiNavReal020049
     * @tc.number SUB_MNB_UI_5049
     * @tc.desc   the account block and the add button always travel together
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal020049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020049 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal020049');
        return;
      }
      await flow.ensureTabs();
      const tabsPaired: boolean = (await flow.exists(ID_ADD)) && (await flow.exists(ID_ACCOUNT));
      await flow.ensureList();
      const listPaired: boolean = (await flow.exists(ID_ADD)) || (await flow.exists(ID_ACCOUNT));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tabsPaired),
        'true');
      expect(tabsPaired).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listPaired),
        'false');
      expect(listPaired).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(await flow.exists(ID_SWITCH)), 'true');
      expect(await flow.exists(ID_SWITCH)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020049 end');
    });

    /**
     * @tc.name   testUiNavReal020050
     * @tc.number SUB_MNB_UI_5050
     * @tc.desc   the suite hand back a clean tabs mode with no popup on screen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal020050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020050 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal020050');
        return;
      }
      const listOk: boolean = await flow.ensureList();
      const back: boolean = await flow.reset();
      const accountBack: boolean = await flow.exists(ID_ACCOUNT);
      const switchBack: boolean = await flow.exists(ID_SWITCH);
      const searchBox: BoxInfo = await flow.boxOf(ID_SEARCH);
      const switchBox: BoxInfo = await flow.boxOf(ID_SWITCH);
      const searchWider: boolean = (searchBox.right - searchBox.left) > (switchBox.right - switchBox.left);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listOk), 'true');
      expect(listOk).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(back), 'true');
      expect(back).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(accountBack),
        'true');
      expect(accountBack).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(switchBack),
        'true');
      expect(switchBack).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(searchWider),
        'true');
      expect(searchWider).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal020050 end');
    });
  });
}
