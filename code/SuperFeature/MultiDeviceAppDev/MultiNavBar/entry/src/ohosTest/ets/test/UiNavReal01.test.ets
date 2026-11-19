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
  UiFlow, BoxInfo, ID_SWITCH, ID_SEARCH, ID_ADD, ID_MORE, ID_ACCOUNT, TEXT_PHONE, TEXT_MENU_FIRST
} from '../util/UiFlow';
import { assertNarrowLayout } from '../util/UiFlow';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';

export default function uiNavReal01Test() {
  describe('MultiNavBarUiNavReal01', () => {
    let flow: UiFlow = new UiFlow();

    beforeAll(async () => {
      flow = await UiFlow.boot();
      await flow.reset();
    });

    afterEach(async () => {
      await flow.reset();
    });

    /**
     * @tc.name   testUiNavReal010001
     * @tc.number SUB_MNB_UI_5001
     * @tc.desc   the wide layout exposes the hamburger button right after boot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010001 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal010001');
        return;
      }
      const wide: boolean = flow.wide;
      const switchBox: BoxInfo = await flow.boxOf(ID_SWITCH);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(wide), 'true');
      expect(wide).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(switchBox.present),
        'true');
      expect(switchBox.present).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=>0', switchBox.bottom - switchBox.top);
      expect(switchBox.bottom - switchBox.top > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010001 end');
    });

    /**
     * @tc.name   testUiNavReal010002
     * @tc.number SUB_MNB_UI_5002
     * @tc.desc   tabs mode renders the footer add button with a positive size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010002 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal010002');
        return;
      }
      const addBox: BoxInfo = await flow.boxOf(ID_ADD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(addBox.present),
        'true');
      expect(addBox.present).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=>0', addBox.right - addBox.left);
      expect(addBox.right - addBox.left > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=>=0', addBox.left);
      expect(addBox.left >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010002 end');
    });

    /**
     * @tc.name   testUiNavReal010003
     * @tc.number SUB_MNB_UI_5003
     * @tc.desc   with a single footer tool the more button and its menu stay absent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010003 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal010003');
        return;
      }
      const morePresent: boolean = await flow.exists(ID_MORE);
      const menuPresent: boolean = await flow.textExists(TEXT_MENU_FIRST);
      const addPresent: boolean = await flow.exists(ID_ADD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(morePresent), 'false');
      expect(morePresent).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(menuPresent),
        'false');
      expect(menuPresent).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(addPresent), 'true');
      expect(addPresent).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010003 end');
    });

    /**
     * @tc.name   testUiNavReal010004
     * @tc.number SUB_MNB_UI_5004
     * @tc.desc   the account block of the tabs side bar shows both text rows
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010004 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal010004');
        return;
      }
      const account: boolean = await flow.exists(ID_ACCOUNT);
      const phone: boolean = await flow.textExists(TEXT_PHONE);
      const accountBox: BoxInfo = await flow.boxOf(ID_ACCOUNT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(account), 'true');
      expect(account).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(phone), 'true');
      expect(phone).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=>0', accountBox.right - accountBox.left);
      expect(accountBox.right - accountBox.left > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010004 end');
    });

    /**
     * @tc.name   testUiNavReal010005
     * @tc.number SUB_MNB_UI_5005
     * @tc.desc   one tap on the hamburger button leaves tabs mode and hides the add button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010005 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal010005');
        return;
      }
      const tapped: boolean = await flow.tap(ID_SWITCH);
      const gone: boolean = await flow.waitNoId(ID_ADD, 3000);
      const addPresent: boolean = await flow.exists(ID_ADD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tapped), 'true');
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(gone), 'true');
      expect(gone).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(addPresent),
        'false');
      expect(addPresent).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010005 end');
    });

    /**
     * @tc.name   testUiNavReal010006
     * @tc.number SUB_MNB_UI_5006
     * @tc.desc   list mode drops the account block and keeps the footer menu closed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010006 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal010006');
        return;
      }
      const inList: boolean = await flow.ensureList();
      const account: boolean = await flow.exists(ID_ACCOUNT);
      const phone: boolean = await flow.textExists(TEXT_PHONE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(inList), 'true');
      expect(inList).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(account), 'false');
      expect(account).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(phone), 'false');
      expect(phone).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010006 end');
    });

    /**
     * @tc.name   testUiNavReal010007
     * @tc.number SUB_MNB_UI_5007
     * @tc.desc   list mode hides both footer buttons while a single tool exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010007 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal010007');
        return;
      }
      await flow.ensureList();
      const morePresent: boolean = await flow.exists(ID_MORE);
      const addPresent: boolean = await flow.exists(ID_ADD);
      const switchPresent: boolean = await flow.exists(ID_SWITCH);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(morePresent),
        'false');
      expect(morePresent).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(addPresent),
        'false');
      expect(addPresent).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(switchPresent),
        'true');
      expect(switchPresent).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010007 end');
    });

    /**
     * @tc.name   testUiNavReal010008
     * @tc.number SUB_MNB_UI_5008
     * @tc.desc   the search field shrinks from the full width of tabs mode to 40 in list mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010008 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal010008');
        return;
      }
      await flow.ensureTabs();
      const tabsBox: BoxInfo = await flow.boxOf(ID_SEARCH);
      await flow.ensureList();
      const listBox: BoxInfo = await flow.boxOf(ID_SEARCH);
      const tabsWidth: number = tabsBox.right - tabsBox.left;
      const listWidth: number = listBox.right - listBox.left;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=>0', listWidth);
      expect(listWidth > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=<%{public}d', listWidth, tabsWidth);
      expect(listWidth < tabsWidth).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=>0', tabsWidth);
      expect(tabsWidth > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010008 end');
    });

    /**
     * @tc.name   testUiNavReal010009
     * @tc.number SUB_MNB_UI_5009
     * @tc.desc   touching the collapsed search field brings tabs mode back
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010009 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal010009');
        return;
      }
      await flow.ensureList();
      const tapped: boolean = await flow.tap(ID_SEARCH);
      const addBack: boolean = await flow.waitId(ID_ADD, 3000);
      const account: boolean = await flow.exists(ID_ACCOUNT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tapped), 'true');
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(addBack), 'true');
      expect(addBack).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(account), 'true');
      expect(account).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010009 end');
    });

    /**
     * @tc.name   testUiNavReal010010
     * @tc.number SUB_MNB_UI_5010
     * @tc.desc   a second hamburger tap returns to tabs mode and the add button reappears
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010010 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal010010');
        return;
      }
      await flow.ensureList();
      const tapped: boolean = await flow.tap(ID_SWITCH);
      const addBack: boolean = await flow.waitId(ID_ADD, 3000);
      const morePresent: boolean = await flow.exists(ID_MORE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tapped), 'true');
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(addBack), 'true');
      expect(addBack).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(morePresent),
        'false');
      expect(morePresent).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010010 end');
    });

    /**
     * @tc.name   testUiNavReal010011
     * @tc.number SUB_MNB_UI_5011
     * @tc.desc   two hamburger taps are a round trip, tabs mode ends where it started
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010011 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal010011');
        return;
      }
      const firstTap: boolean = await flow.tap(ID_SWITCH);
      const addGone: boolean = await flow.waitNoId(ID_ADD, 3000);
      const secondTap: boolean = await flow.tap(ID_SWITCH);
      const addBack: boolean = await flow.waitId(ID_ADD, 3000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(firstTap), 'true');
      expect(firstTap).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(addGone), 'true');
      expect(addGone).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(secondTap && addBack), 'true');
      expect(secondTap && addBack).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010011 end');
    });

    /**
     * @tc.name   testUiNavReal010012
     * @tc.number SUB_MNB_UI_5012
     * @tc.desc   the hamburger button sits to the left of the search field inside the side bar
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010012 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal010012');
        return;
      }
      const switchBox: BoxInfo = await flow.boxOf(ID_SWITCH);
      const searchBox: BoxInfo = await flow.boxOf(ID_SEARCH);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=<%{public}d', switchBox.left,
        searchBox.left);
      expect(switchBox.left <= searchBox.left).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(switchBox.present),
        'true');
      expect(switchBox.present).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(searchBox.present),
        'true');
      expect(searchBox.present).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010012 end');
    });

    /**
     * @tc.name   testUiNavReal010013
     * @tc.number SUB_MNB_UI_5013
     * @tc.desc   the hamburger button is drawn above the search field in the same column
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010013 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal010013');
        return;
      }
      const switchBox: BoxInfo = await flow.boxOf(ID_SWITCH);
      const searchBox: BoxInfo = await flow.boxOf(ID_SEARCH);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=<%{public}d', switchBox.top,
        searchBox.top);
      expect(switchBox.top < searchBox.top).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=>0', searchBox.bottom - searchBox.top);
      expect(searchBox.bottom - searchBox.top > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=>0',
        switchBox.right - switchBox.left);
      expect(switchBox.right - switchBox.left > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010013 end');
    });

    /**
     * @tc.name   testUiNavReal010014
     * @tc.number SUB_MNB_UI_5014
     * @tc.desc   the footer add button is placed below the search field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010014 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal010014');
        return;
      }
      const addBox: BoxInfo = await flow.boxOf(ID_ADD);
      const searchBox: BoxInfo = await flow.boxOf(ID_SEARCH);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=>%{public}d', addBox.top,
        searchBox.top);
      expect(addBox.top > searchBox.top).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=>%{public}d', addBox.bottom,
        addBox.top);
      expect(addBox.bottom > addBox.top).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(addBox.present),
        'true');
      expect(addBox.present).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010014 end');
    });

    /**
     * @tc.name   testUiNavReal010015
     * @tc.number SUB_MNB_UI_5015
     * @tc.desc   the after each reset returns a clean tabs mode before every case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010015 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal010015');
        return;
      }
      const addPresent: boolean = await flow.exists(ID_ADD);
      const account: boolean = await flow.exists(ID_ACCOUNT);
      const morePresent: boolean = await flow.exists(ID_MORE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(addPresent), 'true');
      expect(addPresent).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(account), 'true');
      expect(account).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(morePresent),
        'false');
      expect(morePresent).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010015 end');
    });

    /**
     * @tc.name   testUiNavReal010016
     * @tc.number SUB_MNB_UI_5016
     * @tc.desc   resetting twice keeps tabs mode and never leaves a popup behind
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010016 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal010016');
        return;
      }
      const firstReset: boolean = await flow.reset();
      const secondReset: boolean = await flow.reset();
      const menuPresent: boolean = await flow.textExists(TEXT_MENU_FIRST);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstReset && secondReset), 'true');
      expect(firstReset && secondReset).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(menuPresent),
        'false');
      expect(menuPresent).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(await flow.exists(ID_ADD)), 'true');
      expect(await flow.exists(ID_ADD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010016 end');
    });

    /**
     * @tc.name   testUiNavReal010017
     * @tc.number SUB_MNB_UI_5017
     * @tc.desc   the collapsed search field keeps a positive width in list mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010017 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal010017');
        return;
      }
      await flow.ensureTabs();
      const tabsWidth: number = (await flow.boxOf(ID_SEARCH)).right - (await flow.boxOf(ID_SEARCH)).left;
      await flow.ensureList();
      const listBox: BoxInfo = await flow.boxOf(ID_SEARCH);
      const listWidth: number = listBox.right - listBox.left;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listBox.present),
        'true');
      expect(listBox.present).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=>0', listWidth);
      expect(listWidth > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=<%{public}d', listWidth, tabsWidth);
      expect(listWidth < tabsWidth).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010017 end');
    });

    /**
     * @tc.name   testUiNavReal010018
     * @tc.number SUB_MNB_UI_5018
     * @tc.desc   the search field grows back after a list to tabs round trip
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010018 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal010018');
        return;
      }
      await flow.ensureList();
      const listWidth: number = (await flow.boxOf(ID_SEARCH)).right - (await flow.boxOf(ID_SEARCH)).left;
      await flow.ensureTabs();
      const backBox: BoxInfo = await flow.boxOf(ID_SEARCH);
      const backWidth: number = backBox.right - backBox.left;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=>%{public}d', backWidth, listWidth);
      expect(backWidth > listWidth).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=>0', backWidth);
      expect(backWidth > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(backBox.present),
        'true');
      expect(backBox.present).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010018 end');
    });

    /**
     * @tc.name   testUiNavReal010019
     * @tc.number SUB_MNB_UI_5019
     * @tc.desc   tapping the expanded search field in tabs mode keeps tabs mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010019 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal010019');
        return;
      }
      await flow.ensureTabs();
      const tapped: boolean = await flow.tap(ID_SEARCH);
      const addPresent: boolean = await flow.exists(ID_ADD);
      const account: boolean = await flow.exists(ID_ACCOUNT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tapped), 'true');
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(addPresent),
        'true');
      expect(addPresent).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(account), 'true');
      expect(account).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010019 end');
    });

    /**
     * @tc.name   testUiNavReal010020
     * @tc.number SUB_MNB_UI_5020
     * @tc.desc   list mode can only be left through the hamburger button when a single tool exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010020 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal010020');
        return;
      }
      await flow.ensureList();
      const morePresent: boolean = await flow.exists(ID_MORE);
      const tapped: boolean = await flow.tap(ID_SWITCH);
      const addBack: boolean = await flow.waitId(ID_ADD, 3000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(morePresent),
        'false');
      expect(morePresent).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tapped), 'true');
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(addBack), 'true');
      expect(addBack).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010020 end');
    });

    /**
     * @tc.name   testUiNavReal010021
     * @tc.number SUB_MNB_UI_5021
     * @tc.desc   ensure tabs is idempotent and never touches the tool list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010021 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal010021');
        return;
      }
      const first: boolean = await flow.ensureTabs();
      const second: boolean = await flow.ensureTabs();
      const morePresent: boolean = await flow.exists(ID_MORE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(first), 'true');
      expect(first).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(first && second), 'true');
      expect(first && second).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(morePresent),
        'false');
      expect(morePresent).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010021 end');
    });

    /**
     * @tc.name   testUiNavReal010022
     * @tc.number SUB_MNB_UI_5022
     * @tc.desc   ensure list is idempotent and leaves the account block hidden
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010022 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal010022');
        return;
      }
      const first: boolean = await flow.ensureList();
      const second: boolean = await flow.ensureList();
      const account: boolean = await flow.exists(ID_ACCOUNT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(first), 'true');
      expect(first).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(second), 'true');
      expect(second).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(account), 'false');
      expect(account).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010022 end');
    });

    /**
     * @tc.name   testUiNavReal010023
     * @tc.number SUB_MNB_UI_5023
     * @tc.desc   the 24vp hamburger icon is narrower than the full width search field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010023 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal010023');
        return;
      }
      await flow.ensureTabs();
      const switchBox: BoxInfo = await flow.boxOf(ID_SWITCH);
      const searchBox: BoxInfo = await flow.boxOf(ID_SEARCH);
      const switchWidth: number = switchBox.right - switchBox.left;
      const searchWidth: number = searchBox.right - searchBox.left;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=<%{public}d', switchWidth, searchWidth);
      expect(switchWidth < searchWidth).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=>0', switchWidth);
      expect(switchWidth > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=>0', searchWidth);
      expect(searchWidth > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010023 end');
    });

    /**
     * @tc.name   testUiNavReal010024
     * @tc.number SUB_MNB_UI_5024
     * @tc.desc   the footer add icon is not wider than the search field above it
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010024 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal010024');
        return;
      }
      const addBox: BoxInfo = await flow.boxOf(ID_ADD);
      const searchBox: BoxInfo = await flow.boxOf(ID_SEARCH);
      const addWidth: number = addBox.right - addBox.left;
      const searchWidth: number = searchBox.right - searchBox.left;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=<=%{public}d', addWidth, searchWidth);
      expect(addWidth <= searchWidth).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=>0', addWidth);
      expect(addWidth > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(addBox.present),
        'true');
      expect(addBox.present).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010024 end');
    });

    /**
     * @tc.name   testUiNavReal010025
     * @tc.number SUB_MNB_UI_5025
     * @tc.desc   the suite finishes in the documented clean state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiNavReal010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010025 begin');
      if (!flow.wide) {
        await assertNarrowLayout(flow, 'testUiNavReal010025');
        return;
      }
      const reset: boolean = await flow.reset();
      const addPresent: boolean = await flow.exists(ID_ADD);
      const menuPresent: boolean = await flow.textExists(TEXT_MENU_FIRST);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reset), 'true');
      expect(reset).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(addPresent),
        'true');
      expect(addPresent).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(menuPresent),
        'false');
      expect(menuPresent).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiNavReal010025 end');
    });
  });
}
