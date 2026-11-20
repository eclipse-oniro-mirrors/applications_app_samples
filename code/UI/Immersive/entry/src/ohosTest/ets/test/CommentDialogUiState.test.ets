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
import { beforeAll, afterEach, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { Component, Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { hilog } from '@kit.PerformanceAnalysisKit';

const BUNDLE: string = 'com.samples.immersive';
const ABILITY: string = 'EntryAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'CommentDialogUiStateTest';

const HOME_BANNER_ID: string = 'banner';
const HOME_GOODS_ITEM_0_ID: string = 'goodsItem0';
const DETAIL_BACK_ID: string = 'goodsDetailBack';
const DETAIL_MODEL_ENTRY_ID: string = 'goodsDetailModelEntry';
const COMMENT_TITLE_ID: string = 'commentTitle';
const COMMENT_LIST_ID: string = 'commentList';
const COMMENT_ITEM_1_ID: string = 'commentItem1';
const COMMENT_CLOSE_ID: string = 'close_button';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();

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

async function clickId(driver: Driver, id: string): Promise<boolean> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    if (component === undefined || component === null) {
      return false;
    }
    await component.click();
    await sleep(350);
    return true;
  } catch (error) {
    log('clickId failed: ' + id + ' -> ' + String(error));
    return false;
  }
}

async function startMainAbility(): Promise<void> {
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1200);
}

async function ensureHomePage(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, HOME_BANNER_ID)) {
      return true;
    }
    await driver.pressBack();
    await sleep(600);
    if (await exists(driver, HOME_BANNER_ID)) {
      return true;
    }
    await startMainAbility();
  }
  return await exists(driver, HOME_BANNER_ID);
}

async function prepareOnDetail(driver: Driver): Promise<boolean> {
  await startMainAbility();
  if (!await ensureHomePage(driver)) {
    log('prepareOnDetail: home page is not available');
    return false;
  }
  if (!await clickId(driver, HOME_GOODS_ITEM_0_ID)) {
    return false;
  }
  await sleep(700);
  return await exists(driver, DETAIL_BACK_ID);
}

async function ensureDialogClosed(driver: Driver): Promise<void> {
  if (await exists(driver, COMMENT_TITLE_ID)) {
    await driver.pressBack();
    await sleep(600);
  }
}

async function openCommentDialog(driver: Driver): Promise<boolean> {
  if (!await clickId(driver, DETAIL_MODEL_ENTRY_ID)) {
    return false;
  }
  await sleep(900);
  return await exists(driver, COMMENT_TITLE_ID) && await exists(driver, COMMENT_CLOSE_ID);
}

async function closeCommentDialog(driver: Driver): Promise<boolean> {
  if (!await clickId(driver, COMMENT_CLOSE_ID)) {
    await driver.pressBack();
    await sleep(600);
  }
  await sleep(500);
  return !await exists(driver, COMMENT_TITLE_ID) && await exists(driver, DETAIL_BACK_ID);
}

export default function commentDialogUiStateTest(): void {
  describe('CommentDialogUiStateTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      const driver: Driver = Driver.create();
      await startMainAbility();
      await ensureHomePage(driver);
      log('beforeAll end');
    });

    afterEach(async () => {
      const driver: Driver = Driver.create();
      await ensureDialogClosed(driver);
      const actual1: boolean = await ensureHomePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureHomePage(driver)=${actual1}`);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENTDIALOG_0601
     * @tc.name      testCommentDialog0601
     * @tc.desc      Verify tapping the model entry opens the comment dialog.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCommentDialog0601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCommentDialog0601 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepareOnDetail(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareOnDetail(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await openCommentDialog(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue openCommentDialog(driver)=${actual3}`);
      expect(actual3).assertTrue();
      log('testCommentDialog0601 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENTDIALOG_0602
     * @tc.name      testCommentDialog0602
     * @tc.desc      Verify the opened comment dialog shows the close button.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCommentDialog0602', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCommentDialog0602 begin');
      const driver: Driver = Driver.create();
      const actual4: boolean = await prepareOnDetail(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareOnDetail(driver)=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = await openCommentDialog(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue openCommentDialog(driver)=${actual5}`);
      expect(actual5).assertTrue();
      const actual6: boolean = await exists(driver, COMMENT_CLOSE_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, COMMENT_CLOSE_ID)=${actual6}`);
      expect(actual6).assertTrue();
      log('testCommentDialog0602 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENTDIALOG_0603
     * @tc.name      testCommentDialog0603
     * @tc.desc      Verify the comment area loads its first comment item.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCommentDialog0603', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCommentDialog0603 begin');
      const driver: Driver = Driver.create();
      const actual7: boolean = await prepareOnDetail(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareOnDetail(driver)=${actual7}`);
      expect(actual7).assertTrue();
      const actual8: boolean = await openCommentDialog(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue openCommentDialog(driver)=${actual8}`);
      expect(actual8).assertTrue();
      const actual9: boolean = await exists(driver, COMMENT_ITEM_1_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, COMMENT_ITEM_1_ID)=${actual9}`);
      expect(actual9).assertTrue();
      log('testCommentDialog0603 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENTDIALOG_0604
     * @tc.name      testCommentDialog0604
     * @tc.desc      Verify the comment dialog exposes the comment list.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCommentDialog0604', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCommentDialog0604 begin');
      const driver: Driver = Driver.create();
      const actual10: boolean = await prepareOnDetail(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareOnDetail(driver)=${actual10}`);
      expect(actual10).assertTrue();
      const actual11: boolean = await openCommentDialog(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue openCommentDialog(driver)=${actual11}`);
      expect(actual11).assertTrue();
      const actual12: boolean = await exists(driver, COMMENT_LIST_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, COMMENT_LIST_ID)=${actual12}`);
      expect(actual12).assertTrue();
      const actual13: boolean = await exists(driver, COMMENT_ITEM_1_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, COMMENT_ITEM_1_ID)=${actual13}`);
      expect(actual13).assertTrue();
      log('testCommentDialog0604 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENTDIALOG_0605
     * @tc.name      testCommentDialog0605
     * @tc.desc      Verify the close button dismisses the comment dialog.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCommentDialog0605', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCommentDialog0605 begin');
      const driver: Driver = Driver.create();
      const actual14: boolean = await prepareOnDetail(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareOnDetail(driver)=${actual14}`);
      expect(actual14).assertTrue();
      const actual15: boolean = await openCommentDialog(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue openCommentDialog(driver)=${actual15}`);
      expect(actual15).assertTrue();
      const actual16: boolean = await closeCommentDialog(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue closeCommentDialog(driver)=${actual16}`);
      expect(actual16).assertTrue();
      const actual17: boolean = await exists(driver, DETAIL_MODEL_ENTRY_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, DETAIL_MODEL_ENTRY_ID)=${actual17}`);
      expect(actual17).assertTrue();
      log('testCommentDialog0605 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENTDIALOG_0606
     * @tc.name      testCommentDialog0606
     * @tc.desc      Verify reopening the dialog loads the comment area again.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCommentDialog0606', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCommentDialog0606 begin');
      const driver: Driver = Driver.create();
      const actual18: boolean = await prepareOnDetail(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareOnDetail(driver)=${actual18}`);
      expect(actual18).assertTrue();
      const actual19: boolean = await openCommentDialog(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue openCommentDialog(driver)=${actual19}`);
      expect(actual19).assertTrue();
      const actual20: boolean = await closeCommentDialog(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue closeCommentDialog(driver)=${actual20}`);
      expect(actual20).assertTrue();
      const actual21: boolean = await openCommentDialog(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue openCommentDialog(driver)=${actual21}`);
      expect(actual21).assertTrue();
      const actual22: boolean = await exists(driver, COMMENT_ITEM_1_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, COMMENT_ITEM_1_ID)=${actual22}`);
      expect(actual22).assertTrue();
      log('testCommentDialog0606 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENTDIALOG_0607
     * @tc.name      testCommentDialog0607
     * @tc.desc      Verify two open and close cycles stay stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCommentDialog0607', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCommentDialog0607 begin');
      const driver: Driver = Driver.create();
      const actual23: boolean = await prepareOnDetail(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareOnDetail(driver)=${actual23}`);
      expect(actual23).assertTrue();
      const actual24: boolean = await openCommentDialog(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue openCommentDialog(driver)=${actual24}`);
      expect(actual24).assertTrue();
      const actual25: boolean = await closeCommentDialog(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue closeCommentDialog(driver)=${actual25}`);
      expect(actual25).assertTrue();
      const actual26: boolean = await openCommentDialog(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue openCommentDialog(driver)=${actual26}`);
      expect(actual26).assertTrue();
      const actual27: boolean = await closeCommentDialog(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue closeCommentDialog(driver)=${actual27}`);
      expect(actual27).assertTrue();
      const actual28: boolean = await exists(driver, DETAIL_BACK_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, DETAIL_BACK_ID)=${actual28}`);
      expect(actual28).assertTrue();
      log('testCommentDialog0607 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENTDIALOG_0608
     * @tc.name      testCommentDialog0608
     * @tc.desc      Verify the model entry stays clickable after dialog closes.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCommentDialog0608', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCommentDialog0608 begin');
      const driver: Driver = Driver.create();
      const actual29: boolean = await prepareOnDetail(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareOnDetail(driver)=${actual29}`);
      expect(actual29).assertTrue();
      const actual30: boolean = await openCommentDialog(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue openCommentDialog(driver)=${actual30}`);
      expect(actual30).assertTrue();
      const actual31: boolean = await closeCommentDialog(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue closeCommentDialog(driver)=${actual31}`);
      expect(actual31).assertTrue();
      const actual32: boolean = await exists(driver, DETAIL_MODEL_ENTRY_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, DETAIL_MODEL_ENTRY_ID)=${actual32}`);
      expect(actual32).assertTrue();
      const actual33: boolean = await openCommentDialog(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue openCommentDialog(driver)=${actual33}`);
      expect(actual33).assertTrue();
      log('testCommentDialog0608 end');
    })
  })
}
