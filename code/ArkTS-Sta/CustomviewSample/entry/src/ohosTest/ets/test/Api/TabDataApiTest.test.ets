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
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { CustomViewLogic } from '../../../../main/ets/model/CustomViewLogic';

export default function tabDataApiTest(): void {
  describe('TabDataApiTest', (): void => {
    // SAMPLE_CUSTOMVIEW_API_001_0100 tabDataApiTest001: tab count
    it('tabDataApiTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.getTabCount()).assertEqual(4);
    });
    // SAMPLE_CUSTOMVIEW_API_001_0200 tabDataApiTest002: title list length
    it('tabDataApiTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.TAB_TITLES.length).assertEqual(4);
    });
    // SAMPLE_CUSTOMVIEW_API_001_0300 tabDataApiTest003: first title
    it('tabDataApiTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.TAB_TITLES[0]).assertEqual('候补预测');
    });
    // SAMPLE_CUSTOMVIEW_API_001_0400 tabDataApiTest004: second title
    it('tabDataApiTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.TAB_TITLES[1]).assertEqual('在线换座');
    });
    // SAMPLE_CUSTOMVIEW_API_001_0500 tabDataApiTest005: third title
    it('tabDataApiTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.TAB_TITLES[2]).assertEqual('余票挖掘');
    });
    // SAMPLE_CUSTOMVIEW_API_001_0600 tabDataApiTest006: fourth title
    it('tabDataApiTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.TAB_TITLES[3]).assertEqual('个人中心');
    });
    // SAMPLE_CUSTOMVIEW_API_001_0700 tabDataApiTest007: every title has four characters
    it('tabDataApiTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let index: number = 0; index < CustomViewLogic.TAB_TITLES.length; index++) {
        expect(CustomViewLogic.TAB_TITLES[index].length).assertEqual(4);
      }
    });
    // SAMPLE_CUSTOMVIEW_API_001_0800 tabDataApiTest008: valid indexes
    it('tabDataApiTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.isValidIndex(0)).assertTrue();
      expect(CustomViewLogic.isValidIndex(1)).assertTrue();
      expect(CustomViewLogic.isValidIndex(2)).assertTrue();
      expect(CustomViewLogic.isValidIndex(3)).assertTrue();
    });
    // SAMPLE_CUSTOMVIEW_API_001_0900 tabDataApiTest009: invalid indexes
    it('tabDataApiTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.isValidIndex(-1)).assertFalse();
      expect(CustomViewLogic.isValidIndex(4)).assertFalse();
      expect(CustomViewLogic.isValidIndex(99)).assertFalse();
    });
    // SAMPLE_CUSTOMVIEW_API_001_1000 tabDataApiTest010: fractional index is invalid
    it('tabDataApiTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.isValidIndex(0.5)).assertFalse();
      expect(CustomViewLogic.isValidIndex(1.5)).assertFalse();
    });
    // SAMPLE_CUSTOMVIEW_API_001_1100 tabDataApiTest011: title width of a four-character title
    it('tabDataApiTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.titleWidth('候补预测')).assertEqual(80);
    });
    // SAMPLE_CUSTOMVIEW_API_001_1200 tabDataApiTest012: title width of single and double character titles
    it('tabDataApiTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.titleWidth('a')).assertEqual(20);
      expect(CustomViewLogic.titleWidth('ab')).assertEqual(40);
    });
    // SAMPLE_CUSTOMVIEW_API_001_1300 tabDataApiTest013: empty title width
    it('tabDataApiTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.titleWidth('')).assertEqual(0);
    });
    // SAMPLE_CUSTOMVIEW_API_001_1400 tabDataApiTest014: total width of default titles
    it('tabDataApiTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.totalTitleWidth()).assertEqual(320);
    });
    // SAMPLE_CUSTOMVIEW_API_001_1500 tabDataApiTest015: total width of custom titles
    it('tabDataApiTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.totalTitleWidth(['ab', 'cde'])).assertEqual(100);
      expect(CustomViewLogic.totalTitleWidth(['a'])).assertEqual(20);
    });
    // SAMPLE_CUSTOMVIEW_API_001_1600 tabDataApiTest016: empty title list width
    it('tabDataApiTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.totalTitleWidth([])).assertEqual(0);
    });
    // SAMPLE_CUSTOMVIEW_API_001_1700 tabDataApiTest017: header width matches title total width
    it('tabDataApiTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.HEADER_WIDTH).assertEqual(CustomViewLogic.totalTitleWidth());
    });
    // SAMPLE_CUSTOMVIEW_API_001_1800 tabDataApiTest018: initial transition matches first tab offset
    it('tabDataApiTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.INITIAL_TRANSITION_X).assertEqual(CustomViewLogic.getTransitionX(0));
    });
    // SAMPLE_CUSTOMVIEW_API_001_1900 tabDataApiTest019: indicator width equals twice the color bar half width
    it('tabDataApiTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.INDICATOR_WIDTH).assertEqual(CustomViewLogic.COLOR_BAR_HALF * 2);
    });
    // SAMPLE_CUSTOMVIEW_API_001_2000 tabDataApiTest020: layout constants
    it('tabDataApiTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.TITLE_LENGTH_RADIX).assertEqual(20);
      expect(CustomViewLogic.TITLE_ROW_HEIGHT).assertEqual(30);
      expect(CustomViewLogic.HEADER_HEIGHT).assertEqual(40);
      expect(CustomViewLogic.CONTENT_ITEM_HEIGHT).assertEqual(50);
    });
  });
}
