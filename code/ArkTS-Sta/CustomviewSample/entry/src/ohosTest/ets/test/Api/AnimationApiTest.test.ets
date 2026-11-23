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

export default function animationApiTest(): void {
  describe('AnimationApiTest', (): void => {
    // SAMPLE_CUSTOMVIEW_API_003_0100 animationApiTest001: same index duration is zero
    it('animationApiTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.animationDuration(0, 0)).assertEqual(0);
      expect(CustomViewLogic.animationDuration(3, 3)).assertEqual(0);
    });
    // SAMPLE_CUSTOMVIEW_API_003_0200 animationApiTest002: adjacent duration
    it('animationApiTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.animationDuration(0, 1)).assertEqual(100);
      expect(CustomViewLogic.animationDuration(1, 2)).assertEqual(100);
      expect(CustomViewLogic.animationDuration(2, 3)).assertEqual(100);
    });
    // SAMPLE_CUSTOMVIEW_API_003_0300 animationApiTest003: distance of two tabs
    it('animationApiTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.animationDuration(0, 2)).assertEqual(200);
      expect(CustomViewLogic.animationDuration(1, 3)).assertEqual(200);
    });
    // SAMPLE_CUSTOMVIEW_API_003_0400 animationApiTest004: full distance duration
    it('animationApiTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.animationDuration(0, 3)).assertEqual(300);
      expect(CustomViewLogic.animationDuration(3, 0)).assertEqual(300);
    });
    // SAMPLE_CUSTOMVIEW_API_003_0500 animationApiTest005: duration is symmetric
    it('animationApiTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let from: number = 0; from < CustomViewLogic.getTabCount(); from++) {
        for (let to: number = 0; to < CustomViewLogic.getTabCount(); to++) {
          expect(CustomViewLogic.animationDuration(from, to))
            .assertEqual(CustomViewLogic.animationDuration(to, from));
        }
      }
    });
    // SAMPLE_CUSTOMVIEW_API_003_0600 animationApiTest006: backward duration
    it('animationApiTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.animationDuration(3, 2)).assertEqual(100);
      expect(CustomViewLogic.animationDuration(3, 1)).assertEqual(200);
    });
    // SAMPLE_CUSTOMVIEW_API_003_0700 animationApiTest007: duration equals distance times radix
    it('animationApiTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let from: number = 0; from < CustomViewLogic.getTabCount(); from++) {
        for (let to: number = 0; to < CustomViewLogic.getTabCount(); to++) {
          const expected: number = Math.abs(to - from) * CustomViewLogic.DURATION_RADIX;
          expect(CustomViewLogic.animationDuration(from, to)).assertEqual(expected);
        }
      }
    });
    // SAMPLE_CUSTOMVIEW_API_003_0800 animationApiTest008: duration is never negative
    it('animationApiTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.animationDuration(0, 3) >= 0).assertTrue();
      expect(CustomViewLogic.animationDuration(3, 0) >= 0).assertTrue();
      expect(CustomViewLogic.animationDuration(-2, 1) >= 0).assertTrue();
    });
    // SAMPLE_CUSTOMVIEW_API_003_0900 animationApiTest009: duration radix constant
    it('animationApiTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.DURATION_RADIX).assertEqual(100);
    });
    // SAMPLE_CUSTOMVIEW_API_003_1000 animationApiTest010: default iterations
    it('animationApiTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.ITERATIONS_DEFAULT).assertEqual(1);
    });
    // SAMPLE_CUSTOMVIEW_API_003_1100 animationApiTest011: large index distance
    it('animationApiTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.animationDuration(0, 10)).assertEqual(1000);
    });
    // SAMPLE_CUSTOMVIEW_API_003_1200 animationApiTest012: negative index distance
    it('animationApiTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CustomViewLogic.animationDuration(-1, 2)).assertEqual(300);
    });
  });
}
