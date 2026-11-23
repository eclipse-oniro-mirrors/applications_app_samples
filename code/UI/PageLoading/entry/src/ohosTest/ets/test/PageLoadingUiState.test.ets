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
import { beforeEach, afterEach, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../utils/YieldHook';
import { Component, Driver, ON, Rect } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { UIAbility } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const BUNDLE: string = 'com.samples.pageloading';
const ABILITY: string = 'EntryAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'PageLoadingUiStateTest';

const INDEX_ROOT_ID: string = 'indexRootColumn';
const STACK_ID: string = 'pageLoadingStack';
const LOADING_HUD_ID: string = 'loadingHUD';
const CANVAS_ID: string = 'loadingCanvas';
const PROGRESS_TEXT_ID: string = 'loadingProgressText';
const LIST_ID: string = 'commodity_list';
const BANNER_ID: string = 'commodityBanner';
const GOODS_TITLE_ID: string = 'commodityGoodsTitle';
const GOODS_TITLE_TEXT: string = '商品精选';

const delegator = abilityDelegatorRegistry.getAbilityDelegator();

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function sleep(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, duration);
  });
}

async function exists(driver: Driver, id: string): Promise<boolean> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    return component !== undefined && component !== null;
  } catch (error) {
    log('exists failed: ' + id + ' -> ' + String(error));
    return false;
  }
}

async function safeText(driver: Driver, id: string): Promise<string> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    if (component === undefined || component === null) {
      return '';
    }
    return await component.getText();
  } catch (error) {
    log('safeText failed: ' + id + ' -> ' + String(error));
    return '';
  }
}

async function safeBounds(driver: Driver, id: string): Promise<Rect | undefined> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    if (component === undefined || component === null) {
      return undefined;
    }
    return await component.getBounds();
  } catch (error) {
    log('safeBounds failed: ' + id + ' -> ' + String(error));
    return undefined;
  }
}

async function startMainAbility(): Promise<void> {
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1200);
}

async function forceReset(): Promise<void> {
  const ability: UIAbility = await delegator.getCurrentTopAbility();
  if (ability.context.abilityInfo.name === ABILITY) {
    await ability.context.terminateSelf();
    await sleep(600);
  }
  await startMainAbility();
}

async function waitLoaded(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 16; i++) {
    if (await exists(driver, LIST_ID)) {
      return true;
    }
    await sleep(600);
  }
  return await exists(driver, LIST_ID);
}

async function ensurePage(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, STACK_ID)) {
      return true;
    }
    await startMainAbility();
  }
  return await exists(driver, STACK_ID);
}

function extractProgress(raw: string): number {
  const match: RegExpMatchArray | null = raw.match(/^当前已加载(\d+)%$/);
  if (match === null) {
    return -1;
  }
  return parseInt(match[1], 10);
}

export default function pageLoadingUiStateTest() {
  describe('PageLoadingUiStateTest', () => {
    beforeEach(yieldToEventLoop);
    afterEach(async () => {
      const driver: Driver = Driver.create();
      const actual1: boolean = await ensurePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensurePage(driver)=${actual1}`);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number    SUB_PAGELOADING_PAGEUI_1001
     * @tc.name      testPageUiState1001
     * @tc.desc      Verify a fresh launch renders the page with the loading HUD.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUiState1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUiState1001 begin');
      const driver: Driver = Driver.create();
      await forceReset();
      const actual2: boolean = await exists(driver, INDEX_ROOT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, INDEX_ROOT_ID)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, STACK_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, STACK_ID)=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists(driver, LOADING_HUD_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, LOADING_HUD_ID)=${actual4}`);
      expect(actual4).assertTrue();
      log('testPageUiState1001 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_PAGEUI_1002
     * @tc.name      testPageUiState1002
     * @tc.desc      Verify the loading canvas renders as a square area.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUiState1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUiState1002 begin');
      const driver: Driver = Driver.create();
      await forceReset();
      const bounds: Rect | undefined = await safeBounds(driver, CANVAS_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bounds !== undefined=${bounds !== undefined}`);
      expect(bounds !== undefined).assertTrue();
      const width: number = (bounds as Rect).right - (bounds as Rect).left;
      const height: number = (bounds as Rect).bottom - (bounds as Rect).top;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual width=${width}, expected=height`);
      expect(width).assertEqual(height);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger width=${width}, expected=0`);
      expect(width).assertLarger(0);
      log('testPageUiState1002 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_PAGEUI_1003
     * @tc.name      testPageUiState1003
     * @tc.desc      Verify the loading phase shows the percent progress text.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUiState1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUiState1003 begin');
      const driver: Driver = Driver.create();
      await forceReset();
      const raw: string = await safeText(driver, PROGRESS_TEXT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue /^当前已加载/d+%$/.test(raw)=${/^当前已加载\d+%$/.test(raw)}`);
      expect(/^当前已加载\d+%$/.test(raw)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue extractProgress(raw) >= 0=${extractProgress(raw) >= 0}`);
      expect(extractProgress(raw) >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof raw=${typeof raw}, expected='string'`);
      expect(typeof raw).assertEqual('string');
      log('testPageUiState1003 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_PAGEUI_1004
     * @tc.name      testPageUiState1004
     * @tc.desc      Verify the progress value keeps increasing while loading.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUiState1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUiState1004 begin');
      const driver: Driver = Driver.create();
      await forceReset();
      const first: number = extractProgress(await safeText(driver, PROGRESS_TEXT_ID));
      await sleep(1200);
      const second: number = extractProgress(await safeText(driver, PROGRESS_TEXT_ID));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue first >= 0=${first >= 0}`);
      expect(first >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger second=${second}, expected=first`);
      expect(second).assertLarger(first);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue second <= 100=${second <= 100}`);
      expect(second <= 100).assertTrue();
      log('testPageUiState1004 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_PAGEUI_1005
     * @tc.name      testPageUiState1005
     * @tc.desc      Verify sampled progress values stay inside the 0-100 range.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUiState1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUiState1005 begin');
      const driver: Driver = Driver.create();
      await forceReset();
      const first: number = extractProgress(await safeText(driver, PROGRESS_TEXT_ID));
      await sleep(900);
      const second: number = extractProgress(await safeText(driver, PROGRESS_TEXT_ID));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue first >= 0 && first <= 100=${first >= 0 && first <= 100}`);
      expect(first >= 0 && first <= 100).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue second >= 0 && second <= 100=${second >= 0 && second <= 100}`);
      expect(second >= 0 && second <= 100).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue second >= first=${second >= first}`);
      expect(second >= first).assertTrue();
      log('testPageUiState1005 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_PAGEUI_1006
     * @tc.name      testPageUiState1006
     * @tc.desc      Verify the commodity list stays hidden during the loading phase.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUiState1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUiState1006 begin');
      const driver: Driver = Driver.create();
      await forceReset();
      const actual5: boolean = await exists(driver, LIST_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse exists(driver, LIST_ID)=${actual5}`);
      expect(actual5).assertFalse();
      const actual6: boolean = await exists(driver, 'commodityGoodsTitle');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse exists(driver, 'commodityGoodsTitle')=${actual6}`);
      expect(actual6).assertFalse();
      const actual7: boolean = await exists(driver, LOADING_HUD_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, LOADING_HUD_ID)=${actual7}`);
      expect(actual7).assertTrue();
      log('testPageUiState1006 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_PAGEUI_1007
     * @tc.name      testPageUiState1007
     * @tc.desc      Verify the loading phase switches to the commodity page in time.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUiState1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUiState1007 begin');
      const driver: Driver = Driver.create();
      await forceReset();
      const actual8: boolean = await waitLoaded(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue waitLoaded(driver)=${actual8}`);
      expect(actual8).assertTrue();
      const actual9: boolean = await exists(driver, LOADING_HUD_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse exists(driver, LOADING_HUD_ID)=${actual9}`);
      expect(actual9).assertFalse();
      const actual10: boolean = await exists(driver, LIST_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, LIST_ID)=${actual10}`);
      expect(actual10).assertTrue();
      log('testPageUiState1007 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_PAGEUI_1008
     * @tc.name      testPageUiState1008
     * @tc.desc      Verify the banner occupies a visible area after loading.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUiState1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUiState1008 begin');
      const driver: Driver = Driver.create();
      await forceReset();
      const actual11: boolean = await waitLoaded(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue waitLoaded(driver)=${actual11}`);
      expect(actual11).assertTrue();
      const bounds: Rect | undefined = await safeBounds(driver, BANNER_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bounds !== undefined=${bounds !== undefined}`);
      expect(bounds !== undefined).assertTrue();
      const width: number = (bounds as Rect).right - (bounds as Rect).left;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger width=${width}, expected=0`);
      expect(width).assertLarger(0);
      log('testPageUiState1008 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_PAGEUI_1009
     * @tc.name      testPageUiState1009
     * @tc.desc      Verify the loaded page title reads the expected banner text.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUiState1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUiState1009 begin');
      const driver: Driver = Driver.create();
      await forceReset();
      const actual12: boolean = await waitLoaded(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue waitLoaded(driver)=${actual12}`);
      expect(actual12).assertTrue();
      const title: string = await safeText(driver, GOODS_TITLE_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual title=${title}, expected=GOODS_TITLE_TEXT`);
      expect(title).assertEqual(GOODS_TITLE_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual title.length=${title.length}, expected=4`);
      expect(title.length).assertEqual(4);
      log('testPageUiState1009 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_PAGEUI_1010
     * @tc.name      testPageUiState1010
     * @tc.desc      Verify the commodity list is scrollable after loading.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUiState1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUiState1010 begin');
      const driver: Driver = Driver.create();
      await forceReset();
      const actual13: boolean = await waitLoaded(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue waitLoaded(driver)=${actual13}`);
      expect(actual13).assertTrue();
      const list: Component = await driver.findComponent(ON.id(LIST_ID));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${list !== undefined && list !== null}`);
      expect(list !== undefined && list !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue (list as Component).isScrollable()`);
      expect(await (list as Component).isScrollable()).assertTrue();
      log('testPageUiState1010 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_PAGEUI_1011
     * @tc.name      testPageUiState1011
     * @tc.desc      Verify an upward swipe over the list keeps the page alive.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUiState1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUiState1011 begin');
      const driver: Driver = Driver.create();
      await forceReset();
      const actual14: boolean = await waitLoaded(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue waitLoaded(driver)=${actual14}`);
      expect(actual14).assertTrue();
      const bounds: Rect | undefined = await safeBounds(driver, LIST_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bounds !== undefined=${bounds !== undefined}`);
      expect(bounds !== undefined).assertTrue();
      const listBounds: Rect = bounds as Rect;
      const centerX: number = listBounds.left + (listBounds.right - listBounds.left) / 2;
      await driver.swipe(centerX, listBounds.bottom - 120, centerX, listBounds.top + 120, 2200);
      await sleep(800);
      const actual15: boolean = await exists(driver, LIST_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, LIST_ID)=${actual15}`);
      expect(actual15).assertTrue();
      const actual16: boolean = await exists(driver, GOODS_TITLE_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, GOODS_TITLE_ID)=${actual16}`);
      expect(actual16).assertTrue();
      log('testPageUiState1011 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_PAGEUI_1012
     * @tc.name      testPageUiState1012
     * @tc.desc      Verify the first visible commodity card exposes its anchors.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUiState1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUiState1012 begin');
      const driver: Driver = Driver.create();
      await forceReset();
      const actual17: boolean = await waitLoaded(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue waitLoaded(driver)=${actual17}`);
      expect(actual17).assertTrue();
      const imageBounds: Rect | undefined = await safeBounds(driver, 'image');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue imageBounds !== undefined=${imageBounds !== undefined}`);
      expect(imageBounds !== undefined).assertTrue();
      const imageWidth: number = (imageBounds as Rect).right - (imageBounds as Rect).left;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger imageWidth=${imageWidth}, expected=0`);
      expect(imageWidth).assertLarger(0);
      const actual18: boolean = await exists(driver, 'insurance');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'insurance')=${actual18}`);
      expect(actual18).assertTrue();
      log('testPageUiState1012 end');
    })
  })
}
