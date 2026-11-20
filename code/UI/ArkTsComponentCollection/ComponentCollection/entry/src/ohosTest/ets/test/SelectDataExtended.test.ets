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
  LEFT_PADDING, alphabetIndexerDataB, alphabetIndexerDataC, alphabetIndexerDataL,
  letterValue, panelData, selectData
} from '../../../main/ets/pages/components/ComponentData';

const DOMAIN: number = 0xF814;
const TAG: string = 'SelectDataExtTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function allIdsPositive(data: Resource[]): boolean {
  let result: boolean = true;
  data.forEach((item: Resource) => {
    if (item.id <= 0) {
      result = false;
    }
  });
  return result;
}

export default function selectDataExtendedTest(): void {
  describe('SelectDataExtendedTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0441
     * @tc.name      testSelectDataExt0441
     * @tc.desc      Verify the slowest video rate label is 0.75X.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0441', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0441 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CURRENT_RATE[0]=${CURRENT_RATE[0]}, expected='0.75X'`);
      expect(CURRENT_RATE[0]).assertEqual('0.75X');
      log('testSelectDataExt0441 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0442
     * @tc.name      testSelectDataExt0442
     * @tc.desc      Verify the middle video rate label is 1.25X.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0442', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0442 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CURRENT_RATE[2]=${CURRENT_RATE[2]}, expected='1.25X'`);
      expect(CURRENT_RATE[2]).assertEqual('1.25X');
      log('testSelectDataExt0442 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0443
     * @tc.name      testSelectDataExt0443
     * @tc.desc      Verify the fastest video rate label is 2X.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0443', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0443 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CURRENT_RATE[4]=${CURRENT_RATE[4]}, expected='2X'`);
      expect(CURRENT_RATE[4]).assertEqual('2X');
      log('testSelectDataExt0443 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0444
     * @tc.name      testSelectDataExt0444
     * @tc.desc      Verify the letter strip starts with the hash symbol.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0444', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0444 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual letterValue[0]=${letterValue[0]}, expected='#'`);
      expect(letterValue[0]).assertEqual('#');
      log('testSelectDataExt0444 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0445
     * @tc.name      testSelectDataExt0445
     * @tc.desc      Verify the letter strip ends with Z.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0445', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0445 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual letterValue[26]=${letterValue[26]}, expected='Z'`);
      expect(letterValue[26]).assertEqual('Z');
      log('testSelectDataExt0445 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0446
     * @tc.name      testSelectDataExt0446
     * @tc.desc      Verify data panel values sum to ninety.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0446', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0446 begin');
      let sum: number = 0;
      panelData.forEach((value: number) => {
        sum += value;
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual sum=${sum}, expected=90`);
      expect(sum).assertEqual(90);
      log('testSelectDataExt0446 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0447
     * @tc.name      testSelectDataExt0447
     * @tc.desc      Verify row align items options reference valid resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0447', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0447 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${allIdsPositive(ROW_ALIGNITEMS_DATA)}`);
      expect(allIdsPositive(ROW_ALIGNITEMS_DATA)).assertTrue();
      log('testSelectDataExt0447 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0448
     * @tc.name      testSelectDataExt0448
     * @tc.desc      Verify flex direction options reference valid resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0448', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0448 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${allIdsPositive(FLEX_DIRECTION_SELECT_DATA)}`);
      expect(allIdsPositive(FLEX_DIRECTION_SELECT_DATA)).assertTrue();
      log('testSelectDataExt0448 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0449
     * @tc.name      testSelectDataExt0449
     * @tc.desc      Verify stack alignment options reference valid resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0449', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0449 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${allIdsPositive(STACK_ARGUMENTS_SELECT_DATA)}`);
      expect(allIdsPositive(STACK_ARGUMENTS_SELECT_DATA)).assertTrue();
      log('testSelectDataExt0449 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0450
     * @tc.name      testSelectDataExt0450
     * @tc.desc      Verify list scrollbar options reference valid resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0450', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0450 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${allIdsPositive(LIST_SCROLLBAR_SELECT_DATA)}`);
      expect(allIdsPositive(LIST_SCROLLBAR_SELECT_DATA)).assertTrue();
      log('testSelectDataExt0450 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0451
     * @tc.name      testSelectDataExt0451
     * @tc.desc      Verify water flow scroll edge options reference valid resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0451 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${allIdsPositive(WATER_FLOW_SCROLL_EDGE_SELECT_DATA)}`);
      expect(allIdsPositive(WATER_FLOW_SCROLL_EDGE_SELECT_DATA)).assertTrue();
      log('testSelectDataExt0451 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0452
     * @tc.name      testSelectDataExt0452
     * @tc.desc      Verify water flow edge effect options reference valid resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0452 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${allIdsPositive(WATER_FLOW_EDGE_EFFECT_SELECT_DATA)}`);
      expect(allIdsPositive(WATER_FLOW_EDGE_EFFECT_SELECT_DATA)).assertTrue();
      log('testSelectDataExt0452 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0453
     * @tc.name      testSelectDataExt0453
     * @tc.desc      Verify path command options reference valid resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0453 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${allIdsPositive(PATH_SELECT_COMMANDS)}`);
      expect(allIdsPositive(PATH_SELECT_COMMANDS)).assertTrue();
      log('testSelectDataExt0453 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0454
     * @tc.name      testSelectDataExt0454
     * @tc.desc      Verify object fit options reference valid resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0454 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${allIdsPositive(OBJECT_FIT_SELECT)}`);
      expect(allIdsPositive(OBJECT_FIT_SELECT)).assertTrue();
      log('testSelectDataExt0454 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0455
     * @tc.name      testSelectDataExt0455
     * @tc.desc      Verify alphabet B names reference valid resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0455 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${allIdsPositive(alphabetIndexerDataB)}`);
      expect(allIdsPositive(alphabetIndexerDataB)).assertTrue();
      log('testSelectDataExt0455 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0456
     * @tc.name      testSelectDataExt0456
     * @tc.desc      Verify every letter strip entry is a non-empty string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0456 begin');
      let allNonEmpty: boolean = true;
      letterValue.forEach((letter: string) => {
        if (letter.length <= 0) {
          allNonEmpty = false;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allNonEmpty=${allNonEmpty}`);
      expect(allNonEmpty).assertTrue();
      log('testSelectDataExt0456 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0457
     * @tc.name      testSelectDataExt0457
     * @tc.desc      Verify every rate label ends with the X suffix.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0457', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0457 begin');
      let allEndWithX: boolean = true;
      CURRENT_RATE.forEach((rate: string) => {
        if (!rate.endsWith('X')) {
          allEndWithX = false;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allEndWithX=${allEndWithX}`);
      expect(allEndWithX).assertTrue();
      log('testSelectDataExt0457 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0458
     * @tc.name      testSelectDataExt0458
     * @tc.desc      Verify image repeat options reference valid resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0458', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0458 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${allIdsPositive(REPEAT_SELECT)}`);
      expect(allIdsPositive(REPEAT_SELECT)).assertTrue();
      log('testSelectDataExt0458 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0459
     * @tc.name      testSelectDataExt0459
     * @tc.desc      Verify grid layout direction options reference valid resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0459 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${allIdsPositive(GRID_LAYOUT_DIRECTION_SELECT)}`);
      expect(allIdsPositive(GRID_LAYOUT_DIRECTION_SELECT)).assertTrue();
      log('testSelectDataExt0459 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0460
     * @tc.name      testSelectDataExt0460
     * @tc.desc      Verify tabs bar mode options reference valid resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0460 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${allIdsPositive(TABS_BAR_MODE_SELECT)}`);
      expect(allIdsPositive(TABS_BAR_MODE_SELECT)).assertTrue();
      log('testSelectDataExt0460 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0461
     * @tc.name      testSelectDataExt0461
     * @tc.desc      Verify span decoration options reference valid resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0461 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allIdsPositive(selectData)=${allIdsPositive(selectData)}`);
      expect(allIdsPositive(selectData)).assertTrue();
      log('testSelectDataExt0461 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0462
     * @tc.name      testSelectDataExt0462
     * @tc.desc      Verify side bar container type options reference valid resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0462', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0462 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${allIdsPositive(SBC_TYPE_DATA)}`);
      expect(allIdsPositive(SBC_TYPE_DATA)).assertTrue();
      log('testSelectDataExt0462 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0463
     * @tc.name      testSelectDataExt0463
     * @tc.desc      Verify list direction options reference valid resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0463 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${allIdsPositive(LIST_DIRECTION_SELECT_DATA)}`);
      expect(allIdsPositive(LIST_DIRECTION_SELECT_DATA)).assertTrue();
      log('testSelectDataExt0463 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0464
     * @tc.name      testSelectDataExt0464
     * @tc.desc      Verify flex align items options reference valid resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0464', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0464 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${allIdsPositive(FLEX_ALIGN_ITEMS_SELECT_DATA)}`);
      expect(allIdsPositive(FLEX_ALIGN_ITEMS_SELECT_DATA)).assertTrue();
      log('testSelectDataExt0464 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0465
     * @tc.name      testSelectDataExt0465
     * @tc.desc      Verify column justify content options reference valid resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0465', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0465 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${allIdsPositive(COLUMN_JUSTIFYCONTENT_DATA)}`);
      expect(allIdsPositive(COLUMN_JUSTIFYCONTENT_DATA)).assertTrue();
      log('testSelectDataExt0465 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0466
     * @tc.name      testSelectDataExt0466
     * @tc.desc      Verify grid container size type options reference valid resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0466', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0466 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${allIdsPositive(GRIDCONTAIER_SIZE_TYPE_SELECT_DATA)}`);
      expect(allIdsPositive(GRIDCONTAIER_SIZE_TYPE_SELECT_DATA)).assertTrue();
      log('testSelectDataExt0466 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0467
     * @tc.name      testSelectDataExt0467
     * @tc.desc      Verify render mode options reference valid resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0467', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0467 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${allIdsPositive(RENDER_MODE_SELECT)}`);
      expect(allIdsPositive(RENDER_MODE_SELECT)).assertTrue();
      log('testSelectDataExt0467 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0468
     * @tc.name      testSelectDataExt0468
     * @tc.desc      Verify list align item options reference valid resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0468', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0468 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${allIdsPositive(LIST_ALIGN_LIST_ITEM_SELECT_DATA)}`);
      expect(allIdsPositive(LIST_ALIGN_LIST_ITEM_SELECT_DATA)).assertTrue();
      log('testSelectDataExt0468 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0469
     * @tc.name      testSelectDataExt0469
     * @tc.desc      Verify list edge effect options reference valid resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0469', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0469 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${allIdsPositive(LIST_EDGE_EFFECT_SELECT_DATA)}`);
      expect(allIdsPositive(LIST_EDGE_EFFECT_SELECT_DATA)).assertTrue();
      log('testSelectDataExt0469 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0470
     * @tc.name      testSelectDataExt0470
     * @tc.desc      Verify side bar position options reference valid resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0470', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0470 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${allIdsPositive(SBC_POSITION_DATA)}`);
      expect(allIdsPositive(SBC_POSITION_DATA)).assertTrue();
      log('testSelectDataExt0470 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0471
     * @tc.name      testSelectDataExt0471
     * @tc.desc      Verify stack z-index options reference valid resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0471', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0471 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${allIdsPositive(STACK_ZIND_SELECT_DATA)}`);
      expect(allIdsPositive(STACK_ZIND_SELECT_DATA)).assertTrue();
      log('testSelectDataExt0471 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0472
     * @tc.name      testSelectDataExt0472
     * @tc.desc      Verify flex wrap options reference valid resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0472', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0472 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${allIdsPositive(FLEX_WRAP_SELECT_DATA)}`);
      expect(allIdsPositive(FLEX_WRAP_SELECT_DATA)).assertTrue();
      log('testSelectDataExt0472 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0473
     * @tc.name      testSelectDataExt0473
     * @tc.desc      Verify flex justify content options reference valid resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0473', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0473 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${allIdsPositive(FLEX_JUSTIFY_CONTENT_SELECT_DATA)}`);
      expect(allIdsPositive(FLEX_JUSTIFY_CONTENT_SELECT_DATA)).assertTrue();
      log('testSelectDataExt0473 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0474
     * @tc.name      testSelectDataExt0474
     * @tc.desc      Verify row justify content options reference valid resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0474', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0474 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${allIdsPositive(ROW_JUSTIFYCONTENT_DATA)}`);
      expect(allIdsPositive(ROW_JUSTIFYCONTENT_DATA)).assertTrue();
      log('testSelectDataExt0474 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0475
     * @tc.name      testSelectDataExt0475
     * @tc.desc      Verify column align items options reference valid resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0475', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0475 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${allIdsPositive(COLUMN_ALIGNITEMS_DATA)}`);
      expect(allIdsPositive(COLUMN_ALIGNITEMS_DATA)).assertTrue();
      log('testSelectDataExt0475 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0476
     * @tc.name      testSelectDataExt0476
     * @tc.desc      Verify tabs bar position options reference valid resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0476', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0476 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${allIdsPositive(TABS_BAR_POSITION_SELECT)}`);
      expect(allIdsPositive(TABS_BAR_POSITION_SELECT)).assertTrue();
      log('testSelectDataExt0476 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0477
     * @tc.name      testSelectDataExt0477
     * @tc.desc      Verify alphabet C names reference valid resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0477', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0477 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${allIdsPositive(alphabetIndexerDataC)}`);
      expect(allIdsPositive(alphabetIndexerDataC)).assertTrue();
      log('testSelectDataExt0477 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0478
     * @tc.name      testSelectDataExt0478
     * @tc.desc      Verify alphabet L names reference valid resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0478', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0478 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${allIdsPositive(alphabetIndexerDataL)}`);
      expect(allIdsPositive(alphabetIndexerDataL)).assertTrue();
      log('testSelectDataExt0478 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0479
     * @tc.name      testSelectDataExt0479
     * @tc.desc      Verify all data panel values are positive numbers.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0479', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0479 begin');
      let allPositive: boolean = true;
      panelData.forEach((value: number) => {
        if (value <= 0) {
          allPositive = false;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allPositive=${allPositive}`);
      expect(allPositive).assertTrue();
      log('testSelectDataExt0479 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SELECTDATAEXT_0480
     * @tc.name      testSelectDataExt0480
     * @tc.desc      Verify padding constants stay stable across repeated reads.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectDataExt0480', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectDataExt0480 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual LEFT_PADDING=${LEFT_PADDING}, expected=LEFT_PADDING`);
      expect(LEFT_PADDING).assertEqual(LEFT_PADDING);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual LEFT_PADDING=${LEFT_PADDING}, expected=16`);
      expect(LEFT_PADDING).assertEqual(16);
      log('testSelectDataExt0480 end');
    })
  })
}
