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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import { yieldToEventLoop } from '../common/TestYield';
import Logger from '../Logger';
import { ListConstants } from 'publishmultimediaupdate/src/main/ets/constants/ListConstants';
import { BUNDLE, LIST_LAYOUT_WEIGHT, LIST_SPACE, TAG } from '../common/TestConstant';
/**
 * Contract of the list layout constants.
 * The page passes both values straight into the list builder, so a changed
 * weight or spacing silently reshapes every row. The suite pins both numbers
 * and their arithmetic relations.
 */
export default function listConstantsTest() {
  describe('ListConstantsTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONST_0100
     * @tc.name LayoutWeightEqualsOne001
     * @tc.desc Verify layout weight equals one
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LayoutWeightEqualsOne_001', 0, (): void => {
      Logger.info(TAG, 'LayoutWeightEqualsOne_001 begin');
      const weight: number = ListConstants.LAYOUT_WEIGHT;
      Logger.info(TAG, 'weight=' + weight);
      expect(weight).assertEqual(1);
      Logger.info(TAG, 'LayoutWeightEqualsOne_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONST_0200
     * @tc.name ListSpaceEqualsTen002
     * @tc.desc Verify list space equals ten
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ListSpaceEqualsTen_002', 0, (): void => {
      Logger.info(TAG, 'ListSpaceEqualsTen_002 begin');
      const space: number = ListConstants.LIST_SPACE;
      Logger.info(TAG, 'space=' + space);
      expect(space).assertEqual(10);
      Logger.info(TAG, 'ListSpaceEqualsTen_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONST_0300
     * @tc.name BothValuesStableAcrossRepeatedReads003
     * @tc.desc Verify both values stable across repeated reads
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'BothValuesStableAcrossRepeatedReads_003', 0, (): void => {
      Logger.info(TAG, 'BothValuesStableAcrossRepeatedReads_003 begin');
      let unstable: number = 0;
      for (let attempt: number = 0; attempt < 5; attempt++) {
        const weight: number = ListConstants.LAYOUT_WEIGHT;
        const space: number = ListConstants.LIST_SPACE;
        const check01: boolean = weight === LIST_LAYOUT_WEIGHT && space === LIST_SPACE;
        if (!check01) {
          unstable += 1;
          Logger.info(TAG, 'attempt ' + attempt + ' weight=' + weight + ' space=' + space);
        }
      }
      Logger.info(TAG, 'unstable=' + unstable);
      expect(unstable).assertEqual(0);
      Logger.info(TAG, 'BothValuesStableAcrossRepeatedReads_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONST_0400
     * @tc.name SumEqualsEleven004
     * @tc.desc Verify sum equals eleven
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SumEqualsEleven_004', 0, (): void => {
      Logger.info(TAG, 'SumEqualsEleven_004 begin');
      const sum: number = ListConstants.LAYOUT_WEIGHT + ListConstants.LIST_SPACE;
      Logger.info(TAG, 'sum=' + sum);
      expect(sum).assertEqual(11);
      const check01: boolean = sum === LIST_LAYOUT_WEIGHT + LIST_SPACE;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'SumEqualsEleven_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONST_0500
     * @tc.name ValuesAreDistinct005
     * @tc.desc Verify values are distinct
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ValuesAreDistinct_005', 0, (): void => {
      Logger.info(TAG, 'ValuesAreDistinct_005 begin');
      const check01: boolean = ListConstants.LAYOUT_WEIGHT !== ListConstants.LIST_SPACE;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'ValuesAreDistinct_005 end');
    });
  });
}
