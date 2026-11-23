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

// Handwritten UI companion suite for the page layout of Index / RecommendPage / UserSongList.
// Every expectation comes from the frozen layout contract of the main sources (TitleBar height 56,
// Search height 40, song label height 38, mine entry label height 22, padding 16) or from the
// frozen label table, never from a value recomputed by the component under test. All locators are
// semantic (ON.id / ON.text / ON.type); no hard coded coordinates are used in this file.
import { describe, it, expect, beforeAll, afterEach } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry, Component, Driver, MatchPattern, ON, On, Rect, UiWindow } from '@kit.TestKit';
import { systemLabelByName } from '../util/LabelResolver';
import { vpToPx } from '../util/DisplayUtil';
import { BUNDLE_NAME, ENTRY_ABILITY_NAME } from '../util/TestConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';
const TITLE_BAR_HEIGHT: number = 56;
const SEARCH_HEIGHT: number = 40;
const SONG_LABEL_HEIGHT: number = 38;
const MINE_TITLE_HEIGHT: number = 33;
const MINE_ENTRY_HEIGHT: number = 22;
const PAGE_PADDING: number = 16;
const FOREGROUND_TIMEOUT_MS: number = 10000;
const POLL_INTERVAL_MS: number = 200;

/**
 * Resolves a song label by resource name on first use. The lookup deliberately stays out
 * of the module scope: the resource manager is only reachable once the test ability has
 * been created.
 */
function songLabel(resourceName: string): string {
  return systemLabelByName(resourceName);
}

function driver(): Driver {
  return Driver.create();
}

function near(actual: number, expected: number): boolean {
  return Math.abs(actual - expected) <= 1;
}

/**
 * Polls for a component id until it appears or the timeout expires.
 */
async function waitForId(id: string, timeoutMs: number = FOREGROUND_TIMEOUT_MS): Promise<boolean> {
  const deadline: number = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    if (await presentById(id)) {
      return true;
    }
    await driver().delayMs(POLL_INTERVAL_MS);
  }
  return false;
}

async function startApp(): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  await delegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ENTRY_ABILITY_NAME });
  // startAbility resolves before the window is drawn, so the tab bar is polled for
  // instead of being awaited with a fixed sleep.
  const ready: boolean = await waitForId('tabs0');
  hilog.info(DOMAIN, TAG, 'foreground-ready actual=%{public}s expected=true', String(ready));
  if (!ready) {
    throw new Error('The Index tab bar did not become visible within the timeout');
  }
}

async function present(on: On): Promise<boolean> {
  try {
    await driver().assertComponentExist(on);
    return true;
  } catch (error) {
    return false;
  }
}

async function presentById(id: string): Promise<boolean> {
  return await present(ON.id(id));
}

async function presentByText(text: string, contains: boolean): Promise<boolean> {
  return await present(contains ? ON.text(text, MatchPattern.CONTAINS) : ON.text(text));
}

async function presentByType(type: string): Promise<boolean> {
  return await present(ON.type(type));
}

async function componentOfText(text: string): Promise<Component> {
  return await driver().findComponent(ON.text(text));
}

async function boundsOfText(text: string): Promise<Rect> {
  const component: Component = await componentOfText(text);
  return await component.getBounds();
}

async function boundsOfType(type: string): Promise<Rect> {
  const component: Component = await driver().findComponent(ON.type(type));
  return await component.getBounds();
}

async function boundsOfId(id: string): Promise<Rect> {
  const component: Component = await driver().findComponent(ON.id(id));
  return await component.getBounds();
}

async function windowRect(): Promise<Rect> {
  const windowObj: UiWindow = await driver().findWindow({ bundleName: BUNDLE_NAME });
  return await windowObj.getBounds();
}

async function clickId(id: string): Promise<void> {
  const component: Component = await driver().findComponent(ON.id(id));
  await component.click();
  await driver().delayMs(400);
}

export default function uiLayoutRealTest() {
  describe('UiLayoutReal', () => {
    beforeAll(async () => {
      await startApp();
      hilog.info(DOMAIN, TAG, '%{public}s', 'UiLayoutReal app started');
    })

    afterEach(async () => {
      try {
        await clickId('tabs0');
      } catch (error) {
        hilog.info(DOMAIN, TAG, '%{public}s', 'UiLayoutReal reset skipped');
      }
    })

    // ==================== 窗口与标题栏几何（10 条） ====================
    /**
     * @tc.number: SUB_MM_UILA_0100
     * @tc.name: testUiLayout0001
     * @tc.desc: Verify the application window exposes a usable portrait viewport.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testUiLayout0001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0001 begin');
      const windowBounds: Rect = await windowRect();
      const width: number = windowBounds.right - windowBounds.left;
      const height: number = windowBounds.bottom - windowBounds.top;
      hilog.info(DOMAIN, TAG, 'window actual=%{public}sx%{public}s expected=>=%{public}sx%{public}s',
        String(width), String(height), String(vpToPx(300)), String(vpToPx(400)));
      expect(width > 0).assertTrue();
      expect(height > 0).assertTrue();
      expect(width >= vpToPx(300)).assertTrue();
      expect(height >= vpToPx(400)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0001 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_0200
     * @tc.name: testUiLayout0002
     * @tc.desc: Verify the recommend title is laid out inside the window.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testUiLayout0002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0002 begin');
      const windowBounds: Rect = await windowRect();
      const title: Rect = await boundsOfText(systemLabelByName('recommend'));
      hilog.info(DOMAIN, TAG, 'title-inside actual=%{public}s/%{public}s/%{public}s expected=>=window',
        String(title.left), String(title.right), String(title.top));
      expect(title.left >= windowBounds.left).assertTrue();
      expect(title.right <= windowBounds.right).assertTrue();
      expect(title.top >= windowBounds.top).assertTrue();
      expect(title.bottom <= windowBounds.bottom).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0002 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_0300
     * @tc.name: testUiLayout0003
     * @tc.desc: Verify the recommend title keeps the frozen 56vp title bar height.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiLayout0003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0003 begin');
      const title: Rect = await boundsOfText(systemLabelByName('recommend'));
      const height: number = title.bottom - title.top;
      hilog.info(DOMAIN, TAG, 'title-height actual=%{public}s expected=%{public}s',
        String(height), String(vpToPx(TITLE_BAR_HEIGHT)));
      expect(near(height, vpToPx(TITLE_BAR_HEIGHT))).assertTrue();
      expect(height > vpToPx(MINE_TITLE_HEIGHT)).assertTrue();
      expect(title.right > title.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0003 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_0400
     * @tc.name: testUiLayout0004
     * @tc.desc: Verify the recommend title keeps the page padding on its left edge.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiLayout0004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0004 begin');
      const windowBounds: Rect = await windowRect();
      const title: Rect = await boundsOfText(systemLabelByName('recommend'));
      const inset: number = title.left - windowBounds.left;
      hilog.info(DOMAIN, TAG, 'title-inset actual=%{public}s expected>=%{public}s',
        String(inset), String(vpToPx(PAGE_PADDING)));
      expect(inset >= vpToPx(PAGE_PADDING)).assertTrue();
      expect(title.left > windowBounds.left).assertTrue();
      expect(title.right <= windowBounds.right).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0004 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_0500
     * @tc.name: testUiLayout0005
     * @tc.desc: Verify the recommend title stays in the upper half of the window.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiLayout0005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0005 begin');
      const windowBounds: Rect = await windowRect();
      const title: Rect = await boundsOfText(systemLabelByName('recommend'));
      const middle: number = windowBounds.top + (windowBounds.bottom - windowBounds.top) / 2;
      hilog.info(DOMAIN, TAG, 'title-middle actual=%{public}s expected=<%{public}s',
        String(title.top), String(middle));
      expect(title.top < middle).assertTrue();
      expect(title.top >= windowBounds.top).assertTrue();
      expect(title.top < title.bottom).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0005 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_0600
     * @tc.name: testUiLayout0006
     * @tc.desc: Verify the title bar renders a search box component.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testUiLayout0006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0006 begin');
      const exists: boolean = await presentByType('Search');
      const search: Rect = await boundsOfType('Search');
      hilog.info(DOMAIN, TAG, 'search-box actual=%{public}s/%{public}s expected=true/>0',
        String(exists), String(search.right - search.left));
      expect(exists).assertTrue();
      expect(search.right > search.left).assertTrue();
      expect(search.bottom > search.top).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0006 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_0700
     * @tc.name: testUiLayout0007
     * @tc.desc: Verify the search box keeps the frozen 40vp height.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiLayout0007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0007 begin');
      const search: Rect = await boundsOfType('Search');
      const height: number = search.bottom - search.top;
      hilog.info(DOMAIN, TAG, 'search-height actual=%{public}s expected=%{public}s',
        String(height), String(vpToPx(SEARCH_HEIGHT)));
      expect(near(height, vpToPx(SEARCH_HEIGHT))).assertTrue();
      expect(height > 0).assertTrue();
      expect(height < vpToPx(TITLE_BAR_HEIGHT)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0007 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_0800
     * @tc.name: testUiLayout0008
     * @tc.desc: Verify the search box is flush inside the window horizontally.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiLayout0008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0008 begin');
      const windowBounds: Rect = await windowRect();
      const search: Rect = await boundsOfType('Search');
      hilog.info(DOMAIN, TAG, 'search-horizontal actual=%{public}s/%{public}s expected=>=window.left',
        String(search.left), String(search.right));
      expect(search.left >= windowBounds.left).assertTrue();
      expect(search.right <= windowBounds.right).assertTrue();
      expect(search.right > search.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0008 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_0900
     * @tc.name: testUiLayout0009
     * @tc.desc: Verify the search box is not pushed out of the window vertically.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiLayout0009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0009 begin');
      const windowBounds: Rect = await windowRect();
      const title: Rect = await boundsOfText(systemLabelByName('recommend'));
      const search: Rect = await boundsOfType('Search');
      hilog.info(DOMAIN, TAG, 'search-vertical actual=%{public}s expected=>=%{public}s',
        String(search.top), String(title.top));
      expect(search.top >= title.top).assertTrue();
      expect(search.top >= windowBounds.top).assertTrue();
      expect(search.bottom <= windowBounds.bottom).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0009 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_1000
     * @tc.name: testUiLayout0010
     * @tc.desc: Verify the song section header starts below the title bar.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiLayout0010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0010 begin');
      const title: Rect = await boundsOfText(systemLabelByName('recommend'));
      const section: Rect = await boundsOfText(systemLabelByName('singRecommend'));
      hilog.info(DOMAIN, TAG, 'section-below-title actual=%{public}s expected=>%{public}s',
        String(section.top), String(title.bottom));
      expect(section.top >= title.bottom).assertTrue();
      expect(section.bottom > section.top).assertTrue();
      expect(section.right > section.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0010 end');
    })

    // ==================== 歌单推荐区与歌曲网格（10 条） ====================
    /**
     * @tc.number: SUB_MM_UILA_1100
     * @tc.name: testUiLayout0011
     * @tc.desc: Verify the song section header is laid out inside the window.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testUiLayout0011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0011 begin');
      const windowBounds: Rect = await windowRect();
      const section: Rect = await boundsOfText(systemLabelByName('singRecommend'));
      hilog.info(DOMAIN, TAG, 'section-inside actual=%{public}s/%{public}s expected=>=window',
        String(section.left), String(section.right));
      expect(section.left >= windowBounds.left).assertTrue();
      expect(section.right <= windowBounds.right).assertTrue();
      expect(section.top >= windowBounds.top).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0011 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_1200
     * @tc.name: testUiLayout0012
     * @tc.desc: Verify the more entry of the song section is reachable as text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testUiLayout0012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0012 begin');
      const exists: boolean = await presentByText(systemLabelByName('more'), false);
      const more: Rect = await boundsOfText(systemLabelByName('more'));
      hilog.info(DOMAIN, TAG, 'more-entry actual=%{public}s/%{public}s expected=true/>0',
        String(exists), String(more.right - more.left));
      expect(exists).assertTrue();
      expect(more.right > more.left).assertTrue();
      expect(more.bottom > more.top).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0012 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_1300
     * @tc.name: testUiLayout0013
     * @tc.desc: Verify the more entry sits on the right side of the section header.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiLayout0013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0013 begin');
      const section: Rect = await boundsOfText(systemLabelByName('singRecommend'));
      const more: Rect = await boundsOfText(systemLabelByName('more'));
      hilog.info(DOMAIN, TAG, 'more-right actual=%{public}s expected=>%{public}s',
        String(more.left), String(section.left));
      expect(more.left > section.left).assertTrue();
      expect(more.right > more.left).assertTrue();
      expect(more.right > section.right).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0013 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_1400
     * @tc.name: testUiLayout0014
     * @tc.desc: Verify the more entry stays inside the window right edge.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiLayout0014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0014 begin');
      const windowBounds: Rect = await windowRect();
      const more: Rect = await boundsOfText(systemLabelByName('more'));
      hilog.info(DOMAIN, TAG, 'more-clipped actual=%{public}s expected=<%{public}s',
        String(more.right), String(windowBounds.right));
      expect(more.right <= windowBounds.right).assertTrue();
      expect(more.left >= windowBounds.left).assertTrue();
      expect(more.bottom > more.top).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0014 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_1500
     * @tc.name: testUiLayout0015
     * @tc.desc: Verify the section header and the more entry share one text row.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiLayout0015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0015 begin');
      const section: Rect = await boundsOfText(systemLabelByName('singRecommend'));
      const more: Rect = await boundsOfText(systemLabelByName('more'));
      const gap: number = Math.abs(section.top - more.top);
      hilog.info(DOMAIN, TAG, 'section-row actual=%{public}s/%{public}s expected=<%{public}s',
        String(section.top), String(more.top), String(vpToPx(16)));
      expect(gap <= vpToPx(16)).assertTrue();
      expect(more.bottom <= section.bottom + vpToPx(16)).assertTrue();
      expect(section.top < section.bottom).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0015 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_1600
     * @tc.name: testUiLayout0016
     * @tc.desc: Verify the first frozen song label from the nostalgia group is rendered.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testUiLayout0016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0016 begin');
      const exists: boolean = await presentByText(songLabel('song_label_01'), false);
      const label: Rect = await boundsOfText(songLabel('song_label_01'));
      hilog.info(DOMAIN, TAG, 'nostalgia-label actual=%{public}s/%{public}s expected=true/>0',
        String(exists), String(label.right - label.left));
      expect(exists).assertTrue();
      expect(label.right > label.left).assertTrue();
      expect(label.bottom > label.top).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0016 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_1700
     * @tc.name: testUiLayout0017
     * @tc.desc: Verify the first frozen song label from the nordic group is rendered.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testUiLayout0017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0017 begin');
      const exists: boolean = await presentByText(songLabel('song_label_02'), false);
      const label: Rect = await boundsOfText(songLabel('song_label_02'));
      hilog.info(DOMAIN, TAG, 'nordic-label actual=%{public}s/%{public}s expected=true/>0',
        String(exists), String(label.right - label.left));
      expect(exists).assertTrue();
      expect(label.right > label.left).assertTrue();
      expect(label.bottom > label.top).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0017 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_1800
     * @tc.name: testUiLayout0018
     * @tc.desc: Verify the first frozen song label from the europe group is rendered.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testUiLayout0018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0018 begin');
      const windowBounds: Rect = await windowRect();
      const exists: boolean = await presentByText(songLabel('song_label_03'), false);
      const label: Rect = await boundsOfText(songLabel('song_label_03'));
      hilog.info(DOMAIN, TAG, 'europe-label actual=%{public}s/%{public}s expected=true/<%{public}s',
        String(exists), String(label.right), String(windowBounds.right));
      expect(exists).assertTrue();
      expect(label.bottom > label.top).assertTrue();
      expect(label.right <= windowBounds.right).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0018 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_1900
     * @tc.name: testUiLayout0019
     * @tc.desc: Verify every song label keeps the frozen 38vp two line box.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiLayout0019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0019 begin');
      const nostalgia: Rect = await boundsOfText(songLabel('song_label_01'));
      const nordic: Rect = await boundsOfText(songLabel('song_label_02'));
      const europe: Rect = await boundsOfText(songLabel('song_label_03'));
      const first: number = nostalgia.bottom - nostalgia.top;
      const second: number = nordic.bottom - nordic.top;
      const third: number = europe.bottom - europe.top;
      hilog.info(DOMAIN, TAG, 'song-label-height actual=%{public}s/%{public}s/%{public}s expected=%{public}s',
        String(first), String(second), String(third), String(vpToPx(SONG_LABEL_HEIGHT)));
      expect(near(first, vpToPx(SONG_LABEL_HEIGHT))).assertTrue();
      expect(near(second, vpToPx(SONG_LABEL_HEIGHT))).assertTrue();
      expect(near(third, vpToPx(SONG_LABEL_HEIGHT))).assertTrue();
      expect(second).assertEqual(third);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0019 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_2000
     * @tc.name: testUiLayout0020
     * @tc.desc: Verify the first three song labels share one grid row and grow to the right.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiLayout0020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0020 begin');
      const nostalgia: Rect = await boundsOfText(songLabel('song_label_01'));
      const nordic: Rect = await boundsOfText(songLabel('song_label_02'));
      const europe: Rect = await boundsOfText(songLabel('song_label_03'));
      hilog.info(DOMAIN, TAG, 'song-row actual=%{public}s/%{public}s/%{public}s',
        String(nostalgia.left), String(nordic.left), String(europe.left));
      expect(nostalgia.top).assertEqual(nordic.top);
      expect(nordic.top).assertEqual(europe.top);
      expect(nordic.left > nostalgia.left).assertTrue();
      expect(europe.left > nordic.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0020 end');
    })

    // ==================== 快捷入口行与播放条（10 条） ====================
    /**
     * @tc.number: SUB_MM_UILA_2100
     * @tc.name: testUiLayout0021
     * @tc.desc: Verify the first shortcut entry keeps its frozen private fm label.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testUiLayout0021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0021 begin');
      const windowBounds: Rect = await windowRect();
      const exists: boolean = await presentByText(systemLabelByName('privacy'), false);
      const entry: Rect = await boundsOfText(systemLabelByName('privacy'));
      hilog.info(DOMAIN, TAG, 'shortcut-privacy actual=%{public}s/%{public}s expected=true/inside',
        String(exists), String(entry.left));
      expect(exists).assertTrue();
      expect(entry.left >= windowBounds.left).assertTrue();
      expect(entry.right <= windowBounds.right).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0021 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_2200
     * @tc.name: testUiLayout0022
     * @tc.desc: Verify the second shortcut entry keeps its frozen singer label.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testUiLayout0022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0022 begin');
      const exists: boolean = await presentByText(systemLabelByName('singer'), false);
      const entry: Rect = await boundsOfText(systemLabelByName('singer'));
      hilog.info(DOMAIN, TAG, 'shortcut-singer actual=%{public}s/%{public}s expected=true/>0',
        String(exists), String(entry.bottom - entry.top));
      expect(exists).assertTrue();
      expect(entry.right > entry.left).assertTrue();
      expect(entry.bottom > entry.top).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0022 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_2300
     * @tc.name: testUiLayout0023
     * @tc.desc: Verify the third shortcut entry keeps its frozen playlist label.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testUiLayout0023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0023 begin');
      const exists: boolean = await presentByText(systemLabelByName('singList'), false);
      const entry: Rect = await boundsOfText(systemLabelByName('singList'));
      hilog.info(DOMAIN, TAG, 'shortcut-playlist actual=%{public}s/%{public}s expected=true/>0',
        String(exists), String(entry.right - entry.left));
      expect(exists).assertTrue();
      expect(entry.right > entry.left).assertTrue();
      expect(entry.bottom > entry.top).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0023 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_2400
     * @tc.name: testUiLayout0024
     * @tc.desc: Verify the fourth shortcut entry keeps its frozen ranking label.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiLayout0024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0024 begin');
      const exists: boolean = await presentByText(systemLabelByName('rank'), false);
      const entry: Rect = await boundsOfText(systemLabelByName('rank'));
      hilog.info(DOMAIN, TAG, 'shortcut-ranking actual=%{public}s/%{public}s expected=true/>0',
        String(exists), String(entry.right - entry.left));
      expect(exists).assertTrue();
      expect(entry.right > entry.left).assertTrue();
      expect(entry.top < entry.bottom).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0024 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_2500
     * @tc.name: testUiLayout0025
     * @tc.desc: Verify the visible shortcut entries share one horizontal row.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiLayout0025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0025 begin');
      const privacy: Rect = await boundsOfText(systemLabelByName('privacy'));
      const singer: Rect = await boundsOfText(systemLabelByName('singer'));
      const playlist: Rect = await boundsOfText(systemLabelByName('singList'));
      hilog.info(DOMAIN, TAG, 'shortcut-row actual=%{public}s/%{public}s/%{public}s',
        String(privacy.top), String(singer.top), String(playlist.top));
      expect(privacy.top).assertEqual(singer.top);
      expect(singer.top).assertEqual(playlist.top);
      expect(playlist.top).assertEqual(privacy.top);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0025 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_2600
     * @tc.name: testUiLayout0026
     * @tc.desc: Verify the shortcut entries are laid out from left to right.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiLayout0026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0026 begin');
      const privacy: Rect = await boundsOfText(systemLabelByName('privacy'));
      const singer: Rect = await boundsOfText(systemLabelByName('singer'));
      const playlist: Rect = await boundsOfText(systemLabelByName('singList'));
      const ranking: Rect = await boundsOfText(systemLabelByName('rank'));
      hilog.info(DOMAIN, TAG, 'shortcut-order actual=%{public}s/%{public}s/%{public}s',
        String(privacy.left), String(singer.left), String(playlist.left));
      expect(singer.left > privacy.left).assertTrue();
      expect(playlist.left > singer.left).assertTrue();
      expect(ranking.left > playlist.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0026 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_2700
     * @tc.name: testUiLayout0027
     * @tc.desc: Verify the shortcut row is placed above the song section header.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiLayout0027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0027 begin');
      const privacy: Rect = await boundsOfText(systemLabelByName('privacy'));
      const section: Rect = await boundsOfText(systemLabelByName('singRecommend'));
      hilog.info(DOMAIN, TAG, 'shortcut-above-section actual=%{public}s expected=<%{public}s',
        String(privacy.top), String(section.top));
      expect(privacy.top < section.top).assertTrue();
      expect(privacy.bottom < section.top).assertTrue();
      expect(section.top >= privacy.top).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0027 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_2800
     * @tc.name: testUiLayout0028
     * @tc.desc: Verify the shortcut row never overflows the window bottom edge.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiLayout0028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0028 begin');
      const windowBounds: Rect = await windowRect();
      const privacy: Rect = await boundsOfText(systemLabelByName('privacy'));
      const singer: Rect = await boundsOfText(systemLabelByName('singer'));
      hilog.info(DOMAIN, TAG, 'shortcut-vertical actual=%{public}s expected=<%{public}s',
        String(privacy.bottom), String(windowBounds.bottom));
      expect(privacy.bottom <= windowBounds.bottom).assertTrue();
      expect(singer.bottom <= windowBounds.bottom).assertTrue();
      expect(singer.bottom > singer.top).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0028 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_2900
     * @tc.name: testUiLayout0029
     * @tc.desc: Verify the shortcut labels stay centered in evenly spaced cells.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiLayout0029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0029 begin');
      const privacy: Rect = await boundsOfText(systemLabelByName('privacy'));
      const singer: Rect = await boundsOfText(systemLabelByName('singer'));
      const playlist: Rect = await boundsOfText(systemLabelByName('singList'));
      // Labels are centered inside their own cell, so the even spacing is visible on the
      // horizontal centers of the text bounds and not on the left edges.
      const stepGap: number = (singer.left + singer.right - privacy.left - privacy.right) / 2;
      const secondStep: number = (playlist.left + playlist.right - singer.left - singer.right) / 2;
      hilog.info(DOMAIN, TAG, 'shortcut-step actual=%{public}s/%{public}s expected=equal',
        String(stepGap), String(secondStep));
      expect(stepGap > vpToPx(32)).assertTrue();
      expect(near(stepGap, secondStep)).assertTrue();
      expect(singer.left > privacy.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0029 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_3000
     * @tc.name: testUiLayout0030
     * @tc.desc: Verify the player bar shows the frozen song title and artist stacked.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testUiLayout0030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0030 begin');
      const titleExists: boolean = await presentByText('Witness', false);
      const artistExists: boolean = await presentByText('Katy', false);
      const title: Rect = await boundsOfText('Witness');
      const artist: Rect = await boundsOfText('Katy');
      hilog.info(DOMAIN, TAG, 'player-bar actual=%{public}s/%{public}s expected=true/true',
        String(titleExists), String(artistExists));
      expect(titleExists).assertTrue();
      expect(artistExists).assertTrue();
      expect(artist.top > title.top).assertTrue();
      expect(artist.left).assertEqual(title.left);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0030 end');
    })

    // ==================== 我的歌单页几何（10 条） ====================
    /**
     * @tc.number: SUB_MM_UILA_3100
     * @tc.name: testUiLayout0031
     * @tc.desc: Verify the mine page renders its title inside the window.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testUiLayout0031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0031 begin');
      await clickId('tabs3');
      const windowBounds: Rect = await windowRect();
      const title: Rect = await boundsOfText(systemLabelByName('mySongs'));
      hilog.info(DOMAIN, TAG, 'mine-title actual=%{public}s/%{public}s expected=inside',
        String(title.left), String(title.right));
      expect(await presentByText(systemLabelByName('mySongs'), false)).assertTrue();
      expect(title.left >= windowBounds.left).assertTrue();
      expect(title.right <= windowBounds.right).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0031 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_3200
     * @tc.name: testUiLayout0032
     * @tc.desc: Verify the mine page title keeps the page padding on its left edge.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiLayout0032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0032 begin');
      await clickId('tabs3');
      const windowBounds: Rect = await windowRect();
      const title: Rect = await boundsOfText(systemLabelByName('mySongs'));
      const inset: number = title.left - windowBounds.left;
      hilog.info(DOMAIN, TAG, 'mine-title-inset actual=%{public}s expected>=%{public}s',
        String(inset), String(vpToPx(PAGE_PADDING)));
      expect(inset >= vpToPx(PAGE_PADDING)).assertTrue();
      expect(title.left > windowBounds.left).assertTrue();
      expect(title.top >= windowBounds.top).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0032 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_3300
     * @tc.name: testUiLayout0033
     * @tc.desc: Verify the mine page title keeps the frozen 33vp line box.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiLayout0033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0033 begin');
      await clickId('tabs3');
      const title: Rect = await boundsOfText(systemLabelByName('mySongs'));
      const height: number = title.bottom - title.top;
      hilog.info(DOMAIN, TAG, 'mine-title-height actual=%{public}s expected=%{public}s',
        String(height), String(vpToPx(MINE_TITLE_HEIGHT)));
      expect(near(height, vpToPx(MINE_TITLE_HEIGHT))).assertTrue();
      expect(height > vpToPx(MINE_ENTRY_HEIGHT)).assertTrue();
      expect(height < vpToPx(TITLE_BAR_HEIGHT)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0033 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_3400
     * @tc.name: testUiLayout0034
     * @tc.desc: Verify the self built playlist caption is rendered as one text node.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiLayout0034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0034 begin');
      await clickId('tabs3');
      const caption: boolean = await presentByText(systemLabelByName('buildBySelf'), true);
      const component: Component = await driver().findComponent(ON.text(systemLabelByName('buildBySelf'), MatchPattern.CONTAINS));
      const rect: Rect = await component.getBounds();
      hilog.info(DOMAIN, TAG, 'mine-caption actual=%{public}s/%{public}s expected=true/>0',
        String(caption), String(rect.right - rect.left));
      expect(caption).assertTrue();
      expect(rect.right > rect.left).assertTrue();
      expect(rect.bottom > rect.top).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0034 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_3500
     * @tc.name: testUiLayout0035
     * @tc.desc: Verify the first frozen user playlist entry is rendered on the mine page.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testUiLayout0035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0035 begin');
      await clickId('tabs3');
      const exists: boolean = await presentByText(systemLabelByName('emo'), false);
      const entry: Rect = await boundsOfText(systemLabelByName('emo'));
      hilog.info(DOMAIN, TAG, 'mine-first-entry actual=%{public}s/%{public}s expected=true/>0',
        String(exists), String(entry.right - entry.left));
      expect(exists).assertTrue();
      expect(entry.right > entry.left).assertTrue();
      expect(entry.bottom > entry.top).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0035 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_3600
     * @tc.name: testUiLayout0036
     * @tc.desc: Verify the second frozen user playlist entry is rendered on the mine page.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiLayout0036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0036 begin');
      await clickId('tabs3');
      const exists: boolean = await presentByText(systemLabelByName('noSleep'), false);
      const entry: Rect = await boundsOfText(systemLabelByName('noSleep'));
      hilog.info(DOMAIN, TAG, 'mine-second-entry actual=%{public}s expected=true', String(exists));
      expect(exists).assertTrue();
      expect(entry.right > entry.left).assertTrue();
      expect(entry.bottom > entry.top).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0036 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_3700
     * @tc.name: testUiLayout0037
     * @tc.desc: Verify the user playlist entry label keeps the frozen 22vp line box.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiLayout0037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0037 begin');
      await clickId('tabs3');
      const entry: Rect = await boundsOfText(systemLabelByName('emo'));
      const height: number = entry.bottom - entry.top;
      hilog.info(DOMAIN, TAG, 'mine-entry-height actual=%{public}s expected=%{public}s',
        String(height), String(vpToPx(MINE_ENTRY_HEIGHT)));
      expect(near(height, vpToPx(MINE_ENTRY_HEIGHT))).assertTrue();
      expect(height > 0).assertTrue();
      expect(height < vpToPx(MINE_TITLE_HEIGHT)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0037 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_3800
     * @tc.name: testUiLayout0038
     * @tc.desc: Verify the user playlist entry label respects the page padding and window edge.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiLayout0038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0038 begin');
      await clickId('tabs3');
      const windowBounds: Rect = await windowRect();
      const entry: Rect = await boundsOfText(systemLabelByName('emo'));
      const inset: number = entry.left - windowBounds.left;
      hilog.info(DOMAIN, TAG, 'mine-entry-inset actual=%{public}s expected>=%{public}s',
        String(inset), String(vpToPx(PAGE_PADDING)));
      expect(inset >= vpToPx(PAGE_PADDING)).assertTrue();
      expect(entry.right <= windowBounds.right).assertTrue();
      expect(entry.top >= windowBounds.top).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0038 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_3900
     * @tc.name: testUiLayout0039
     * @tc.desc: Verify the player bar is still rendered while the mine page is open.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiLayout0039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0039 begin');
      await clickId('tabs3');
      const player: boolean = await presentByText('Witness', false);
      const mineTitle: boolean = await presentByText(systemLabelByName('mySongs'), false);
      hilog.info(DOMAIN, TAG, 'mine-player-bar actual=%{public}s/%{public}s expected=true/true',
        String(player), String(mineTitle));
      expect(mineTitle).assertTrue();
      expect(player).assertTrue();
      expect(await presentById('tabs3')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0039 end');
    })

    /**
     * @tc.number: SUB_MM_UILA_4000
     * @tc.name: testUiLayout0040
     * @tc.desc: Verify the suite leaves the application on a clean home layout.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testUiLayout0040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0040 begin');
      await clickId('tabs3');
      await clickId('tabs0');
      const title: boolean = await presentByText(systemLabelByName('recommend'), false);
      const section: boolean = await presentByText(systemLabelByName('singRecommend'), false);
      const mineTitle: boolean = await presentByText(systemLabelByName('mySongs'), false);
      hilog.info(DOMAIN, TAG, 'clean-layout actual=%{public}s/%{public}s/%{public}s expected=true/true/false',
        String(title), String(section), String(mineTitle));
      expect(title).assertTrue();
      expect(section).assertTrue();
      expect(mineTitle).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiLayout0040 end');
    })
  })
}
