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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  ROW_ALIGNITEMS_DATA, ROW_JUSTIFYCONTENT_DATA, COLUMN_ALIGNITEMS_DATA, COLUMN_JUSTIFYCONTENT_DATA,
  SBC_TYPE_DATA, SBC_POSITION_DATA, STACK_ARGUMENTS_SELECT_DATA, STACK_ZIND_SELECT_DATA,
  FLEX_DIRECTION_SELECT_DATA, FLEX_WRAP_SELECT_DATA, FLEX_JUSTIFY_CONTENT_SELECT_DATA,
  FLEX_ALIGN_ITEMS_SELECT_DATA, GRIDCONTAIER_SIZE_TYPE_SELECT_DATA, OBJECT_FIT_SELECT,
  RENDER_MODE_SELECT, REPEAT_SELECT, CURRENT_RATE, LIST_DIRECTION_SELECT_DATA,
  LIST_SCROLLBAR_SELECT_DATA, LIST_EDGE_EFFECT_SELECT_DATA, LIST_ALIGN_LIST_ITEM_SELECT_DATA,
  GRID_LAYOUT_DIRECTION_SELECT, TABS_BAR_POSITION_SELECT, TABS_BAR_MODE_SELECT,
  PATH_SELECT_COMMANDS, WATER_FLOW_SCROLL_EDGE_SELECT_DATA, WATER_FLOW_EDGE_EFFECT_SELECT_DATA,
  LEFT_PADDING, RIGHT_PADDING, alphabetIndexerDataB, alphabetIndexerDataC, alphabetIndexerDataL,
  letterValue, fruitArray, panelData, selectData
} from '../../../main/ets/pages/components/ComponentData';

const DOMAIN: number = 0xF814;
const TAG: string = 'SelectDataCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function componentSelectDataCoreTest(): void {
  describe('ComponentSelectDataCoreTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0401
     * @tc.name      testSelectData0401
     * @tc.desc      Verify row align items select data exposes three options.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0401 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ROW_ALIGNITEMS_DATA.length=${ROW_ALIGNITEMS_DATA.length}`);
      expect(ROW_ALIGNITEMS_DATA.length).assertEqual(3);
      log('testSelectData0401 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0402
     * @tc.name      testSelectData0402
     * @tc.desc      Verify row justify content select data exposes six options.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0402 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ROW_JUSTIFYCONTENT_DATA.length}, expected=6`);
      expect(ROW_JUSTIFYCONTENT_DATA.length).assertEqual(6);
      log('testSelectData0402 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0403
     * @tc.name      testSelectData0403
     * @tc.desc      Verify column align items select data exposes three options.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0403 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${COLUMN_ALIGNITEMS_DATA.length}, expected=3`);
      expect(COLUMN_ALIGNITEMS_DATA.length).assertEqual(3);
      log('testSelectData0403 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0404
     * @tc.name      testSelectData0404
     * @tc.desc      Verify column justify content select data exposes six options.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0404 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${COLUMN_JUSTIFYCONTENT_DATA.length}, expected=6`);
      expect(COLUMN_JUSTIFYCONTENT_DATA.length).assertEqual(6);
      log('testSelectData0404 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0405
     * @tc.name      testSelectData0405
     * @tc.desc      Verify side bar container type data exposes two options.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0405 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual SBC_TYPE_DATA.length=${SBC_TYPE_DATA.length}, expected=2`);
      expect(SBC_TYPE_DATA.length).assertEqual(2);
      log('testSelectData0405 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0406
     * @tc.name      testSelectData0406
     * @tc.desc      Verify side bar container position data exposes two options.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0406 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual SBC_POSITION_DATA.length=${SBC_POSITION_DATA.length}`);
      expect(SBC_POSITION_DATA.length).assertEqual(2);
      log('testSelectData0406 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0407
     * @tc.name      testSelectData0407
     * @tc.desc      Verify stack alignment select data exposes nine options.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0407 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${STACK_ARGUMENTS_SELECT_DATA.length}, expected=9`);
      expect(STACK_ARGUMENTS_SELECT_DATA.length).assertEqual(9);
      log('testSelectData0407 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0408
     * @tc.name      testSelectData0408
     * @tc.desc      Verify stack z-index select data exposes two options.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0408 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${STACK_ZIND_SELECT_DATA.length}, expected=2`);
      expect(STACK_ZIND_SELECT_DATA.length).assertEqual(2);
      log('testSelectData0408 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0409
     * @tc.name      testSelectData0409
     * @tc.desc      Verify flex direction select data exposes four options.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0409 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${FLEX_DIRECTION_SELECT_DATA.length}, expected=4`);
      expect(FLEX_DIRECTION_SELECT_DATA.length).assertEqual(4);
      log('testSelectData0409 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0410
     * @tc.name      testSelectData0410
     * @tc.desc      Verify flex wrap select data exposes three options.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0410 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual FLEX_WRAP_SELECT_DATA.length=${FLEX_WRAP_SELECT_DATA.length}`);
      expect(FLEX_WRAP_SELECT_DATA.length).assertEqual(3);
      log('testSelectData0410 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0411
     * @tc.name      testSelectData0411
     * @tc.desc      Verify flex justify content select data exposes six options.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0411 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${FLEX_JUSTIFY_CONTENT_SELECT_DATA.length}`);
      expect(FLEX_JUSTIFY_CONTENT_SELECT_DATA.length).assertEqual(6);
      log('testSelectData0411 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0412
     * @tc.name      testSelectData0412
     * @tc.desc      Verify flex align items select data exposes six options.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0412 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${FLEX_ALIGN_ITEMS_SELECT_DATA.length}, expected=6`);
      expect(FLEX_ALIGN_ITEMS_SELECT_DATA.length).assertEqual(6);
      log('testSelectData0412 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0413
     * @tc.name      testSelectData0413
     * @tc.desc      Verify grid container size type data exposes five options.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0413 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${GRIDCONTAIER_SIZE_TYPE_SELECT_DATA.length}`);
      expect(GRIDCONTAIER_SIZE_TYPE_SELECT_DATA.length).assertEqual(5);
      log('testSelectData0413 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0414
     * @tc.name      testSelectData0414
     * @tc.desc      Verify image object fit select data exposes six options.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0414 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual OBJECT_FIT_SELECT.length=${OBJECT_FIT_SELECT.length}`);
      expect(OBJECT_FIT_SELECT.length).assertEqual(6);
      log('testSelectData0414 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0415
     * @tc.name      testSelectData0415
     * @tc.desc      Verify image render mode select data exposes two options.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0415 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual RENDER_MODE_SELECT.length=${RENDER_MODE_SELECT.length}`);
      expect(RENDER_MODE_SELECT.length).assertEqual(2);
      log('testSelectData0415 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0416
     * @tc.name      testSelectData0416
     * @tc.desc      Verify image repeat select data exposes four options.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0416 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual REPEAT_SELECT.length=${REPEAT_SELECT.length}, expected=4`);
      expect(REPEAT_SELECT.length).assertEqual(4);
      log('testSelectData0416 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0417
     * @tc.name      testSelectData0417
     * @tc.desc      Verify video current rate list exposes five speeds.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0417 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CURRENT_RATE.length=${CURRENT_RATE.length}, expected=5`);
      expect(CURRENT_RATE.length).assertEqual(5);
      log('testSelectData0417 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0418
     * @tc.name      testSelectData0418
     * @tc.desc      Verify list direction select data exposes two options.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0418 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${LIST_DIRECTION_SELECT_DATA.length}, expected=2`);
      expect(LIST_DIRECTION_SELECT_DATA.length).assertEqual(2);
      log('testSelectData0418 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0419
     * @tc.name      testSelectData0419
     * @tc.desc      Verify list scrollbar select data exposes three options.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0419 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${LIST_SCROLLBAR_SELECT_DATA.length}, expected=3`);
      expect(LIST_SCROLLBAR_SELECT_DATA.length).assertEqual(3);
      log('testSelectData0419 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0420
     * @tc.name      testSelectData0420
     * @tc.desc      Verify list edge effect select data exposes three options.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0420 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${LIST_EDGE_EFFECT_SELECT_DATA.length}, expected=3`);
      expect(LIST_EDGE_EFFECT_SELECT_DATA.length).assertEqual(3);
      log('testSelectData0420 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0421
     * @tc.name      testSelectData0421
     * @tc.desc      Verify list align list item data exposes three options.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0421 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${LIST_ALIGN_LIST_ITEM_SELECT_DATA.length}`);
      expect(LIST_ALIGN_LIST_ITEM_SELECT_DATA.length).assertEqual(3);
      log('testSelectData0421 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0422
     * @tc.name      testSelectData0422
     * @tc.desc      Verify grid layout direction data exposes four options.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0422 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${GRID_LAYOUT_DIRECTION_SELECT.length}, expected=4`);
      expect(GRID_LAYOUT_DIRECTION_SELECT.length).assertEqual(4);
      log('testSelectData0422 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0423
     * @tc.name      testSelectData0423
     * @tc.desc      Verify tabs bar position select data exposes two options.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0423 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${TABS_BAR_POSITION_SELECT.length}, expected=2`);
      expect(TABS_BAR_POSITION_SELECT.length).assertEqual(2);
      log('testSelectData0423 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0424
     * @tc.name      testSelectData0424
     * @tc.desc      Verify tabs bar mode select data exposes two options.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0424 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual TABS_BAR_MODE_SELECT.length=${TABS_BAR_MODE_SELECT.length}`);
      expect(TABS_BAR_MODE_SELECT.length).assertEqual(2);
      log('testSelectData0424 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0425
     * @tc.name      testSelectData0425
     * @tc.desc      Verify path select commands expose seven shapes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0425 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual PATH_SELECT_COMMANDS.length=${PATH_SELECT_COMMANDS.length}`);
      expect(PATH_SELECT_COMMANDS.length).assertEqual(7);
      log('testSelectData0425 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0426
     * @tc.name      testSelectData0426
     * @tc.desc      Verify water flow scroll edge data exposes two options.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0426 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${WATER_FLOW_SCROLL_EDGE_SELECT_DATA.length}`);
      expect(WATER_FLOW_SCROLL_EDGE_SELECT_DATA.length).assertEqual(2);
      log('testSelectData0426 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0427
     * @tc.name      testSelectData0427
     * @tc.desc      Verify water flow edge effect data exposes three options.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0427 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${WATER_FLOW_EDGE_EFFECT_SELECT_DATA.length}`);
      expect(WATER_FLOW_EDGE_EFFECT_SELECT_DATA.length).assertEqual(3);
      log('testSelectData0427 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0428
     * @tc.name      testSelectData0428
     * @tc.desc      Verify the shared left padding constant equals 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0428 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual LEFT_PADDING=${LEFT_PADDING}, expected=16`);
      expect(LEFT_PADDING).assertEqual(16);
      log('testSelectData0428 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0429
     * @tc.name      testSelectData0429
     * @tc.desc      Verify the shared right padding constant equals 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0429 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual RIGHT_PADDING=${RIGHT_PADDING}, expected=16`);
      expect(RIGHT_PADDING).assertEqual(16);
      log('testSelectData0429 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0430
     * @tc.name      testSelectData0430
     * @tc.desc      Verify the alphabet indexer B dataset exposes five names.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0430 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual alphabetIndexerDataB.length=${alphabetIndexerDataB.length}`);
      expect(alphabetIndexerDataB.length).assertEqual(5);
      log('testSelectData0430 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0431
     * @tc.name      testSelectData0431
     * @tc.desc      Verify the alphabet indexer C dataset exposes four names.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0431 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual alphabetIndexerDataC.length=${alphabetIndexerDataC.length}`);
      expect(alphabetIndexerDataC.length).assertEqual(4);
      log('testSelectData0431 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0432
     * @tc.name      testSelectData0432
     * @tc.desc      Verify the alphabet indexer L dataset exposes eight names.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0432 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual alphabetIndexerDataL.length=${alphabetIndexerDataL.length}`);
      expect(alphabetIndexerDataL.length).assertEqual(8);
      log('testSelectData0432 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0433
     * @tc.name      testSelectData0433
     * @tc.desc      Verify the alphabet letter strip covers 26 letters plus hash.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0433 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual letterValue.length=${letterValue.length}, expected=27`);
      expect(letterValue.length).assertEqual(27);
      log('testSelectData0433 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0434
     * @tc.name      testSelectData0434
     * @tc.desc      Verify the panel fruit array exposes four fruits.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0434 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual fruitArray.length=${fruitArray.length}, expected=4`);
      expect(fruitArray.length).assertEqual(4);
      log('testSelectData0434 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0435
     * @tc.name      testSelectData0435
     * @tc.desc      Verify the data panel demo exposes six values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0435 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual panelData.length=${panelData.length}, expected=6`);
      expect(panelData.length).assertEqual(6);
      log('testSelectData0435 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0436
     * @tc.name      testSelectData0436
     * @tc.desc      Verify the span decoration select data exposes four options.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0436 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual selectData.length=${selectData.length}, expected=4`);
      expect(selectData.length).assertEqual(4);
      log('testSelectData0436 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0437
     * @tc.name      testSelectData0437
     * @tc.desc      Verify the current rate list is a string array object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0437 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(CURRENT_RATE)=${Array.isArray(CURRENT_RATE)}`);
      expect(Array.isArray(CURRENT_RATE)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof CURRENT_RATE[0]=${typeof CURRENT_RATE[0]}`);
      expect(typeof CURRENT_RATE[0]).assertEqual('string');
      log('testSelectData0437 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0438
     * @tc.name      testSelectData0438
     * @tc.desc      Verify the letter strip holds string values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0438 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(letterValue)=${Array.isArray(letterValue)}`);
      expect(Array.isArray(letterValue)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof letterValue[0]=${typeof letterValue[0]}`);
      expect(typeof letterValue[0]).assertEqual('string');
      log('testSelectData0438 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0439
     * @tc.name      testSelectData0439
     * @tc.desc      Verify the data panel values are numbers.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0439 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof panelData[0]=${typeof panelData[0]}`);
      expect(typeof panelData[0]).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof panelData[5]=${typeof panelData[5]}`);
      expect(typeof panelData[5]).assertEqual('number');
      log('testSelectData0439 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATA_0440
     * @tc.name      testSelectData0440
     * @tc.desc      Verify padding constants hold number values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectData0440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectData0440 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof LEFT_PADDING=${typeof LEFT_PADDING}`);
      expect(typeof LEFT_PADDING).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof RIGHT_PADDING=${typeof RIGHT_PADDING}`);
      expect(typeof RIGHT_PADDING).assertEqual('number');
      log('testSelectData0440 end');
    })
  })
}
