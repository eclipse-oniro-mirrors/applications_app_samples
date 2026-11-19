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

export default function swipeApiTest(): void {
  describe('SwipeApiTest', (): void => {
    // SAMPLE_CUSTOMVIEW_API_004_0100 swipeApiTest001: next index in range
    it('swipeApiTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.nextIndex(0)).assertEqual(1);
      expect(CustomViewLogic.nextIndex(1)).assertEqual(2);
      expect(CustomViewLogic.nextIndex(2)).assertEqual(3);
    });
    // SAMPLE_CUSTOMVIEW_API_004_0200 swipeApiTest002: next index at boundary
    it('swipeApiTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.nextIndex(3)).assertEqual(3);
    });
    // SAMPLE_CUSTOMVIEW_API_004_0300 swipeApiTest003: next index outside range
    it('swipeApiTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.nextIndex(-1)).assertEqual(1);
      expect(CustomViewLogic.nextIndex(99)).assertEqual(3);
    });
    // SAMPLE_CUSTOMVIEW_API_004_0400 swipeApiTest004: previous index in range
    it('swipeApiTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.prevIndex(1)).assertEqual(0);
      expect(CustomViewLogic.prevIndex(2)).assertEqual(1);
      expect(CustomViewLogic.prevIndex(3)).assertEqual(2);
    });
    // SAMPLE_CUSTOMVIEW_API_004_0500 swipeApiTest005: previous index at boundary
    it('swipeApiTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.prevIndex(0)).assertEqual(0);
    });
    // SAMPLE_CUSTOMVIEW_API_004_0600 swipeApiTest006: previous index outside range
    it('swipeApiTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.prevIndex(-5)).assertEqual(0);
      expect(CustomViewLogic.prevIndex(99)).assertEqual(2);
    });
    // SAMPLE_CUSTOMVIEW_API_004_0700 swipeApiTest007: clamp negative index
    it('swipeApiTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.clampIndex(-5)).assertEqual(0);
      expect(CustomViewLogic.clampIndex(-1)).assertEqual(0);
    });
    // SAMPLE_CUSTOMVIEW_API_004_0800 swipeApiTest008: clamp overflow index
    it('swipeApiTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.clampIndex(4)).assertEqual(3);
      expect(CustomViewLogic.clampIndex(100)).assertEqual(3);
    });
    // SAMPLE_CUSTOMVIEW_API_004_0900 swipeApiTest009: clamp valid index unchanged
    it('swipeApiTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.clampIndex(0)).assertEqual(0);
      expect(CustomViewLogic.clampIndex(1)).assertEqual(1);
      expect(CustomViewLogic.clampIndex(2)).assertEqual(2);
      expect(CustomViewLogic.clampIndex(3)).assertEqual(3);
    });
    // SAMPLE_CUSTOMVIEW_API_004_1000 swipeApiTest010: left swipe moves forward
    it('swipeApiTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.resolveSwipeTarget(0, -1)).assertEqual(1);
      expect(CustomViewLogic.resolveSwipeTarget(1, -1)).assertEqual(2);
      expect(CustomViewLogic.resolveSwipeTarget(2, -1)).assertEqual(3);
    });
    // SAMPLE_CUSTOMVIEW_API_004_1100 swipeApiTest011: left swipe at last tab stays
    it('swipeApiTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.resolveSwipeTarget(3, -1)).assertEqual(3);
      expect(CustomViewLogic.resolveSwipeTarget(3, -100)).assertEqual(3);
    });
    // SAMPLE_CUSTOMVIEW_API_004_1200 swipeApiTest012: right swipe moves backward
    it('swipeApiTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.resolveSwipeTarget(3, 1)).assertEqual(2);
      expect(CustomViewLogic.resolveSwipeTarget(2, 1)).assertEqual(1);
      expect(CustomViewLogic.resolveSwipeTarget(1, 1)).assertEqual(0);
    });
    // SAMPLE_CUSTOMVIEW_API_004_1300 swipeApiTest013: right swipe at first tab stays
    it('swipeApiTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.resolveSwipeTarget(0, 1)).assertEqual(0);
      expect(CustomViewLogic.resolveSwipeTarget(0, 100)).assertEqual(0);
    });
    // SAMPLE_CUSTOMVIEW_API_004_1400 swipeApiTest014: zero offset moves backward
    it('swipeApiTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.resolveSwipeTarget(0, 0)).assertEqual(0);
      expect(CustomViewLogic.resolveSwipeTarget(2, 0)).assertEqual(1);
      expect(CustomViewLogic.resolveSwipeTarget(3, 0)).assertEqual(2);
    });
    // SAMPLE_CUSTOMVIEW_API_004_1500 swipeApiTest015: swipe result is clamped
    it('swipeApiTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.resolveSwipeTarget(-1, -1)).assertEqual(1);
      expect(CustomViewLogic.resolveSwipeTarget(-1, 1)).assertEqual(0);
      expect(CustomViewLogic.resolveSwipeTarget(99, -1)).assertEqual(3);
      expect(CustomViewLogic.resolveSwipeTarget(99, 1)).assertEqual(2);
    });
    // SAMPLE_CUSTOMVIEW_API_004_1600 swipeApiTest016: can select different valid index
    it('swipeApiTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.canSelect(0, 1)).assertTrue();
      expect(CustomViewLogic.canSelect(3, 2)).assertTrue();
      expect(CustomViewLogic.canSelect(2, 0)).assertTrue();
    });
    // SAMPLE_CUSTOMVIEW_API_004_1700 swipeApiTest017: cannot select current index
    it('swipeApiTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.canSelect(0, 0)).assertFalse();
      expect(CustomViewLogic.canSelect(3, 3)).assertFalse();
    });
    // SAMPLE_CUSTOMVIEW_API_004_1800 swipeApiTest018: cannot select invalid index
    it('swipeApiTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.canSelect(0, -1)).assertFalse();
      expect(CustomViewLogic.canSelect(0, 4)).assertFalse();
      expect(CustomViewLogic.canSelect(0, 1.5)).assertFalse();
    });
    // SAMPLE_CUSTOMVIEW_API_004_1900 swipeApiTest019: adjacent swipe from each index
    it('swipeApiTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let index: number = 0; index < CustomViewLogic.getTabCount(); index++) {
        const forward: number = CustomViewLogic.resolveSwipeTarget(index, -1);
        const backward: number = CustomViewLogic.resolveSwipeTarget(index, 1);
        expect(forward).assertEqual(CustomViewLogic.nextIndex(index));
        expect(backward).assertEqual(CustomViewLogic.prevIndex(index));
      }
    });
    // SAMPLE_CUSTOMVIEW_API_004_2000 swipeApiTest020: judgment value constant
    it('swipeApiTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.JUDGMENT_VALUE).assertEqual(0);
    });
  });
}
