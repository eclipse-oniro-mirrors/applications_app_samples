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
import { afterEach, beforeAll, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { Component, Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { hilog } from '@kit.PerformanceAnalysisKit';

const BUNDLE: string = 'com.samples.tsdrawingsample';
const ABILITY: string = 'EntryAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'DrawingUiStateTest';
const CONTAINER_ID: string = 'drawingNodeContainer';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function sleep(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => { resolve(); }, duration);
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

async function ensureTargetPage(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, CONTAINER_ID)) {
      return true;
    }
    await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
    await sleep(1200);
  }
  return await exists(driver, CONTAINER_ID);
}

async function prepare(driver: Driver): Promise<boolean> {
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1200);
  if (!await ensureTargetPage(driver)) {
    log('prepare: target page is not available');
    return false;
  }
  return true;
}

export default function drawingUiStateTest(): void {
  describe('DrawingUiStateTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1200);
      log('beforeAll end');
    });

    afterEach(async () => {
      const driver: Driver = Driver.create();
      const actual1: boolean = await ensureTargetPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureTargetPage(driver)=${actual1}`);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number    SUB_TSDRAWING_PAGEUI_0601
     * @tc.name      testDrawingUiState0601
     * @tc.desc      Verify the main page exposes the node container and all five draw buttons.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingUiState0601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      log('testDrawingUiState0601 begin');
      const actual42: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual42}`);
      expect(actual42).assertTrue();
      const actual2: boolean = await exists(driver, CONTAINER_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, CONTAINER_ID)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, 'canvasBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'canvasBtn')=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists(driver, 'shapeBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'shapeBtn')=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = await exists(driver, 'pathBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'pathBtn')=${actual5}`);
      expect(actual5).assertTrue();
      const actual6: boolean = await exists(driver, 'imageFontBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'imageFontBtn')=${actual6}`);
      expect(actual6).assertTrue();
      const actual7: boolean = await exists(driver, 'complexBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'complexBtn')=${actual7}`);
      expect(actual7).assertTrue();
      log('testDrawingUiState0601 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PAGEUI_0602
     * @tc.name      testDrawingUiState0602
     * @tc.desc      Verify clicking the Canvas button keeps the drawing container mounted.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingUiState0602', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      log('testDrawingUiState0602 begin');
      const actual43: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual43}`);
      expect(actual43).assertTrue();
      const actual8: boolean = await clickId(driver, 'canvasBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'canvasBtn')=${actual8}`);
      expect(actual8).assertTrue();
      await sleep(500);
      const actual9: boolean = await exists(driver, CONTAINER_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, CONTAINER_ID)=${actual9}`);
      expect(actual9).assertTrue();
      log('testDrawingUiState0602 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PAGEUI_0603
     * @tc.name      testDrawingUiState0603
     * @tc.desc      Verify clicking the Geometric shape button keeps the drawing container mounted.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingUiState0603', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      log('testDrawingUiState0603 begin');
      const actual44: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual44}`);
      expect(actual44).assertTrue();
      const actual10: boolean = await clickId(driver, 'shapeBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'shapeBtn')=${actual10}`);
      expect(actual10).assertTrue();
      await sleep(500);
      const actual11: boolean = await exists(driver, CONTAINER_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, CONTAINER_ID)=${actual11}`);
      expect(actual11).assertTrue();
      log('testDrawingUiState0603 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PAGEUI_0604
     * @tc.name      testDrawingUiState0604
     * @tc.desc      Verify clicking the Path button keeps the drawing container mounted.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingUiState0604', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      log('testDrawingUiState0604 begin');
      const actual45: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual45}`);
      expect(actual45).assertTrue();
      const actual12: boolean = await clickId(driver, 'pathBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'pathBtn')=${actual12}`);
      expect(actual12).assertTrue();
      await sleep(500);
      const actual13: boolean = await exists(driver, CONTAINER_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, CONTAINER_ID)=${actual13}`);
      expect(actual13).assertTrue();
      log('testDrawingUiState0604 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PAGEUI_0605
     * @tc.name      testDrawingUiState0605
     * @tc.desc      Verify clicking the Image and Font button keeps the drawing container mounted.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingUiState0605', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      log('testDrawingUiState0605 begin');
      const actual46: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual46}`);
      expect(actual46).assertTrue();
      const actual14: boolean = await clickId(driver, 'imageFontBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'imageFontBtn')=${actual14}`);
      expect(actual14).assertTrue();
      await sleep(700);
      const actual15: boolean = await exists(driver, CONTAINER_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, CONTAINER_ID)=${actual15}`);
      expect(actual15).assertTrue();
      log('testDrawingUiState0605 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PAGEUI_0606
     * @tc.name      testDrawingUiState0606
     * @tc.desc      Verify clicking the Complex button keeps the drawing container mounted.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingUiState0606', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      log('testDrawingUiState0606 begin');
      const actual47: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual47}`);
      expect(actual47).assertTrue();
      const actual16: boolean = await clickId(driver, 'complexBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'complexBtn')=${actual16}`);
      expect(actual16).assertTrue();
      await sleep(500);
      const actual17: boolean = await exists(driver, CONTAINER_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, CONTAINER_ID)=${actual17}`);
      expect(actual17).assertTrue();
      log('testDrawingUiState0606 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PAGEUI_0607
     * @tc.name      testDrawingUiState0607
     * @tc.desc      Verify switching Canvas then Geometric shape then Path keeps the container mounted.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingUiState0607', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      log('testDrawingUiState0607 begin');
      const actual48: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual48}`);
      expect(actual48).assertTrue();
      const actual18: boolean = await clickId(driver, 'canvasBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'canvasBtn')=${actual18}`);
      expect(actual18).assertTrue();
      await sleep(400);
      const actual19: boolean = await exists(driver, CONTAINER_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, CONTAINER_ID)=${actual19}`);
      expect(actual19).assertTrue();
      const actual20: boolean = await clickId(driver, 'shapeBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'shapeBtn')=${actual20}`);
      expect(actual20).assertTrue();
      await sleep(400);
      const actual21: boolean = await exists(driver, CONTAINER_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, CONTAINER_ID)=${actual21}`);
      expect(actual21).assertTrue();
      const actual22: boolean = await clickId(driver, 'pathBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'pathBtn')=${actual22}`);
      expect(actual22).assertTrue();
      await sleep(400);
      const actual23: boolean = await exists(driver, CONTAINER_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, CONTAINER_ID)=${actual23}`);
      expect(actual23).assertTrue();
      log('testDrawingUiState0607 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PAGEUI_0608
     * @tc.name      testDrawingUiState0608
     * @tc.desc      Verify switching Path then Image and Font then Complex keeps the container mounted.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingUiState0608', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      log('testDrawingUiState0608 begin');
      const actual49: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual49}`);
      expect(actual49).assertTrue();
      const actual24: boolean = await clickId(driver, 'pathBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'pathBtn')=${actual24}`);
      expect(actual24).assertTrue();
      await sleep(400);
      const actual25: boolean = await exists(driver, CONTAINER_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, CONTAINER_ID)=${actual25}`);
      expect(actual25).assertTrue();
      const actual26: boolean = await clickId(driver, 'imageFontBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'imageFontBtn')=${actual26}`);
      expect(actual26).assertTrue();
      await sleep(500);
      const actual27: boolean = await exists(driver, CONTAINER_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, CONTAINER_ID)=${actual27}`);
      expect(actual27).assertTrue();
      const actual28: boolean = await clickId(driver, 'complexBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'complexBtn')=${actual28}`);
      expect(actual28).assertTrue();
      await sleep(400);
      const actual29: boolean = await exists(driver, CONTAINER_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, CONTAINER_ID)=${actual29}`);
      expect(actual29).assertTrue();
      log('testDrawingUiState0608 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PAGEUI_0609
     * @tc.name      testDrawingUiState0609
     * @tc.desc      Verify clicking the Canvas button twice in a row keeps the container mounted.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingUiState0609', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      log('testDrawingUiState0609 begin');
      const actual50: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual50}`);
      expect(actual50).assertTrue();
      const actual30: boolean = await clickId(driver, 'canvasBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'canvasBtn')=${actual30}`);
      expect(actual30).assertTrue();
      await sleep(400);
      const actual31: boolean = await exists(driver, CONTAINER_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, CONTAINER_ID)=${actual31}`);
      expect(actual31).assertTrue();
      const actual32: boolean = await clickId(driver, 'canvasBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'canvasBtn')=${actual32}`);
      expect(actual32).assertTrue();
      await sleep(400);
      const actual33: boolean = await exists(driver, CONTAINER_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, CONTAINER_ID)=${actual33}`);
      expect(actual33).assertTrue();
      log('testDrawingUiState0609 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PAGEUI_0610
     * @tc.name      testDrawingUiState0610
     * @tc.desc      Verify the Canvas button keeps its visible label.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingUiState0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      log('testDrawingUiState0610 begin');
      const actual51: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual51}`);
      expect(actual51).assertTrue();
      const component: Component = await driver.findComponent(ON.id('canvasBtn'));
      const label: string = await component.getText();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual label=${label}, expected='Canvas'`);
      expect(label).assertEqual('Canvas');
      log('testDrawingUiState0610 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PAGEUI_0611
     * @tc.name      testDrawingUiState0611
     * @tc.desc      Verify the Geometric shape button keeps its visible label.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingUiState0611', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      log('testDrawingUiState0611 begin');
      const actual52: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual52}`);
      expect(actual52).assertTrue();
      const component: Component = await driver.findComponent(ON.id('shapeBtn'));
      const label: string = await component.getText();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual label=${label}, expected='Geometric shape'`);
      expect(label).assertEqual('Geometric shape');
      log('testDrawingUiState0611 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PAGEUI_0612
     * @tc.name      testDrawingUiState0612
     * @tc.desc      Verify all draw buttons remain visible after clicking the Complex button.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingUiState0612', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      log('testDrawingUiState0612 begin');
      const actual53: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual53}`);
      expect(actual53).assertTrue();
      const actual34: boolean = await clickId(driver, 'complexBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'complexBtn')=${actual34}`);
      expect(actual34).assertTrue();
      await sleep(500);
      const actual35: boolean = await exists(driver, 'canvasBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'canvasBtn')=${actual35}`);
      expect(actual35).assertTrue();
      const actual36: boolean = await exists(driver, 'shapeBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'shapeBtn')=${actual36}`);
      expect(actual36).assertTrue();
      const actual37: boolean = await exists(driver, 'pathBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'pathBtn')=${actual37}`);
      expect(actual37).assertTrue();
      const actual38: boolean = await exists(driver, 'imageFontBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'imageFontBtn')=${actual38}`);
      expect(actual38).assertTrue();
      const actual39: boolean = await exists(driver, 'complexBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'complexBtn')=${actual39}`);
      expect(actual39).assertTrue();
      log('testDrawingUiState0612 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PAGEUI_0613
     * @tc.name      testDrawingUiState0613
     * @tc.desc      Verify the page stays functional after relaunching the ability.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingUiState0613', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      log('testDrawingUiState0613 begin');
      const actual54: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual54}`);
      expect(actual54).assertTrue();
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1200);
      const actual40: boolean = await ensureTargetPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureTargetPage(driver)=${actual40}`);
      expect(actual40).assertTrue();
      const actual41: boolean = await exists(driver, 'canvasBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'canvasBtn')=${actual41}`);
      expect(actual41).assertTrue();
      log('testDrawingUiState0613 end');
    })
  })
}
