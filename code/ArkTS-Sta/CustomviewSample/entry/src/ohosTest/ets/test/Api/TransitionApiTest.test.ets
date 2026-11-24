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

export default function transitionApiTest(): void {
  describe('TransitionApiTest', (): void => {
    // SAMPLE_CUSTOMVIEW_API_002_0100 transitionApiTest001: first tab offset
    it('transitionApiTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.getTransitionX(0)).assertEqual(30);
    });
    // SAMPLE_CUSTOMVIEW_API_002_0200 transitionApiTest002: second tab offset
    it('transitionApiTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.getTransitionX(1)).assertEqual(110);
    });
    // SAMPLE_CUSTOMVIEW_API_002_0300 transitionApiTest003: third tab offset
    it('transitionApiTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.getTransitionX(2)).assertEqual(190);
    });
    // SAMPLE_CUSTOMVIEW_API_002_0400 transitionApiTest004: fourth tab offset
    it('transitionApiTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.getTransitionX(3)).assertEqual(270);
    });
    // SAMPLE_CUSTOMVIEW_API_002_0500 transitionApiTest005: negative index clamps to first tab
    it('transitionApiTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.getTransitionX(-1)).assertEqual(30);
      expect(CustomViewLogic.getTransitionX(-100)).assertEqual(30);
    });
    // SAMPLE_CUSTOMVIEW_API_002_0600 transitionApiTest006: overflow index clamps to last tab
    it('transitionApiTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.getTransitionX(4)).assertEqual(270);
      expect(CustomViewLogic.getTransitionX(99)).assertEqual(270);
    });
    // SAMPLE_CUSTOMVIEW_API_002_0700 transitionApiTest007: offsets are strictly increasing
    it('transitionApiTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.getTransitionX(1) > CustomViewLogic.getTransitionX(0)).assertTrue();
      expect(CustomViewLogic.getTransitionX(2) > CustomViewLogic.getTransitionX(1)).assertTrue();
      expect(CustomViewLogic.getTransitionX(3) > CustomViewLogic.getTransitionX(2)).assertTrue();
    });
    // SAMPLE_CUSTOMVIEW_API_002_0800 transitionApiTest008: adjacent distance equals title width
    it('transitionApiTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.getTransitionX(1) - CustomViewLogic.getTransitionX(0)).assertEqual(80);
      expect(CustomViewLogic.getTransitionX(2) - CustomViewLogic.getTransitionX(1)).assertEqual(80);
      expect(CustomViewLogic.getTransitionX(3) - CustomViewLogic.getTransitionX(2)).assertEqual(80);
    });
    // SAMPLE_CUSTOMVIEW_API_002_0900 transitionApiTest009: indicator center aligns with title center
    it('transitionApiTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let index: number = 0; index < CustomViewLogic.getTabCount(); index++) {
        const indicatorCenter: number = CustomViewLogic.getTransitionX(index) + CustomViewLogic.COLOR_BAR_HALF;
        expect(indicatorCenter).assertEqual(index * 80 + 40);
      }
    });
    // SAMPLE_CUSTOMVIEW_API_002_1000 transitionApiTest010: initial offset equals first tab offset
    it('transitionApiTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.INITIAL_TRANSITION_X).assertEqual(CustomViewLogic.getTransitionX(0));
    });
    // SAMPLE_CUSTOMVIEW_API_002_1100 transitionApiTest011: custom title widths at index 0
    it('transitionApiTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.getTransitionX(0, ['ab', 'cde'])).assertEqual(10);
    });
    // SAMPLE_CUSTOMVIEW_API_002_1200 transitionApiTest012: custom title widths at index 1
    it('transitionApiTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.getTransitionX(1, ['ab', 'cde'])).assertEqual(60);
    });
    // SAMPLE_CUSTOMVIEW_API_002_1300 transitionApiTest013: single-character title offset
    it('transitionApiTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.getTransitionX(0, ['a'])).assertEqual(0);
    });
    // SAMPLE_CUSTOMVIEW_API_002_1400 transitionApiTest014: two single-character titles
    it('transitionApiTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.getTransitionX(0, ['a', 'b'])).assertEqual(0);
      expect(CustomViewLogic.getTransitionX(1, ['a', 'b'])).assertEqual(20);
    });
    // SAMPLE_CUSTOMVIEW_API_002_1500 transitionApiTest015: empty title list
    it('transitionApiTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.getTransitionX(0, [])).assertEqual(0);
      expect(CustomViewLogic.getTransitionX(3, [])).assertEqual(0);
    });
    // SAMPLE_CUSTOMVIEW_API_002_1600 transitionApiTest016: mixed length titles
    it('transitionApiTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.getTransitionX(0, ['a', 'bb', 'ccc'])).assertEqual(0);
      expect(CustomViewLogic.getTransitionX(1, ['a', 'bb', 'ccc'])).assertEqual(30);
      expect(CustomViewLogic.getTransitionX(2, ['a', 'bb', 'ccc'])).assertEqual(80);
    });
    // SAMPLE_CUSTOMVIEW_API_002_1700 transitionApiTest017: indicator stays inside header
    it('transitionApiTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lastOffset: number = CustomViewLogic.getTransitionX(3);
      expect(lastOffset + CustomViewLogic.INDICATOR_WIDTH <= CustomViewLogic.HEADER_WIDTH).assertTrue();
    });
    // SAMPLE_CUSTOMVIEW_API_002_1800 transitionApiTest018: offset formula at last tab
    it('transitionApiTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const expected: number = 3 * 80 + 80 / 2 - 10;
      expect(CustomViewLogic.getTransitionX(3)).assertEqual(expected);
    });
  });
}
