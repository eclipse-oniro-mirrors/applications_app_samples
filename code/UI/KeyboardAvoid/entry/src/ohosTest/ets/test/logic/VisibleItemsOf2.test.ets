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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { visibleItemsOf } from '../model/KeyboardAvoidLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_KeyboardAvoid]';
const BUNDLE: string = 'KeyboardAvoid_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for visibleItemsOf (96 cases). */
export default function visibleItemsOf2Test(): void {
  describe('VisibleItemsOf2Test', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0097
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0097
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=3, itemHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0097 begin`);
      const actual: number = visibleItemsOf(0, 3, 0);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0097 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0098
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0098
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=10, itemHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0098 begin`);
      const actual: number = visibleItemsOf(0, 10, 0);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0098 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0099
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0099
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=96, itemHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0099 begin`);
      const actual: number = visibleItemsOf(0, 96, 0);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0099 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0100
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0100
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=0, itemHeightVp=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0100 begin`);
      const actual: number = visibleItemsOf(0, 0, 1);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0100 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0101
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0101
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=0, itemHeightVp=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0101 begin`);
      const actual: number = visibleItemsOf(0, 0, -1);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0101 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0102
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0102
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=0, itemHeightVp=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0102 begin`);
      const actual: number = visibleItemsOf(0, 0, 100);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0102 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0103
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0103
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=0, itemHeightVp=360) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0103 begin`);
      const actual: number = visibleItemsOf(0, 0, 360);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0103 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0104
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0104
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=0, itemHeightVp=720) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0104 begin`);
      const actual: number = visibleItemsOf(0, 0, 720);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0104 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0105
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0105
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=0, itemHeightVp=1080) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0105 begin`);
      const actual: number = visibleItemsOf(0, 0, 1080);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0105 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0106
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0106
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=0, itemHeightVp=1920) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0106 begin`);
      const actual: number = visibleItemsOf(0, 0, 1920);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0106 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0107
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0107
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=0, itemHeightVp=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0107 begin`);
      const actual: number = visibleItemsOf(0, 0, 2);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0107 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0108
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0108
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=0, itemHeightVp=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0108 begin`);
      const actual: number = visibleItemsOf(0, 0, 3);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0108 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0109
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0109
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=0, itemHeightVp=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0109 begin`);
      const actual: number = visibleItemsOf(0, 0, 10);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0109 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0110
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0110
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=0, itemHeightVp=96) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0110 begin`);
      const actual: number = visibleItemsOf(0, 0, 96);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0110 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0111
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0111
     * @tc.desc      visibleItemsOf(windowHeightVp=100, keyboardHeightVp=10, itemHeightVp=1920) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0111 begin`);
      const actual: number = visibleItemsOf(100, 10, 1920);
      logInfo(`visibleItemsOf(windowHeightVp=100, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0111 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0112
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0112
     * @tc.desc      visibleItemsOf(windowHeightVp=1, keyboardHeightVp=3, itemHeightVp=360) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0112 begin`);
      const actual: number = visibleItemsOf(1, 3, 360);
      logInfo(`visibleItemsOf(windowHeightVp=1, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0112 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0113
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0113
     * @tc.desc      visibleItemsOf(windowHeightVp=2, keyboardHeightVp=1, itemHeightVp=1080) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0113 begin`);
      const actual: number = visibleItemsOf(2, 1, 1080);
      logInfo(`visibleItemsOf(windowHeightVp=2, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0113 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0114
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0114
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=1080, itemHeightVp=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0114 begin`);
      const actual: number = visibleItemsOf(0, 1080, 1);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0114 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0115
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0115
     * @tc.desc      visibleItemsOf(windowHeightVp=100, keyboardHeightVp=360, itemHeightVp=1080) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0115 begin`);
      const actual: number = visibleItemsOf(100, 360, 1080);
      logInfo(`visibleItemsOf(windowHeightVp=100, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0115 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0116
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0116
     * @tc.desc      visibleItemsOf(windowHeightVp=1, keyboardHeightVp=0, itemHeightVp=96) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0116 begin`);
      const actual: number = visibleItemsOf(1, 0, 96);
      logInfo(`visibleItemsOf(windowHeightVp=1, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0116 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0117
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0117
     * @tc.desc      visibleItemsOf(windowHeightVp=1080, keyboardHeightVp=2, itemHeightVp=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0117 begin`);
      const actual: number = visibleItemsOf(1080, 2, -1);
      logInfo(`visibleItemsOf(windowHeightVp=1080, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0117 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0118
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0118
     * @tc.desc      visibleItemsOf(windowHeightVp=100, keyboardHeightVp=0, itemHeightVp=1080) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0118 begin`);
      const actual: number = visibleItemsOf(100, 0, 1080);
      logInfo(`visibleItemsOf(windowHeightVp=100, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0118 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0119
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0119
     * @tc.desc      visibleItemsOf(windowHeightVp=-1, keyboardHeightVp=10, itemHeightVp=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0119 begin`);
      const actual: number = visibleItemsOf(-1, 10, 100);
      logInfo(`visibleItemsOf(windowHeightVp=-1, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0119 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0120
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0120
     * @tc.desc      visibleItemsOf(windowHeightVp=720, keyboardHeightVp=1920, itemHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0120 begin`);
      const actual: number = visibleItemsOf(720, 1920, 0);
      logInfo(`visibleItemsOf(windowHeightVp=720, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0120 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0121
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0121
     * @tc.desc      visibleItemsOf(windowHeightVp=100, keyboardHeightVp=1, itemHeightVp=720) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0121 begin`);
      const actual: number = visibleItemsOf(100, 1, 720);
      logInfo(`visibleItemsOf(windowHeightVp=100, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0121 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0122
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0122
     * @tc.desc      visibleItemsOf(windowHeightVp=10, keyboardHeightVp=100, itemHeightVp=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0122 begin`);
      const actual: number = visibleItemsOf(10, 100, 2);
      logInfo(`visibleItemsOf(windowHeightVp=10, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0122 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0123
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0123
     * @tc.desc      visibleItemsOf(windowHeightVp=1080, keyboardHeightVp=1920, itemHeightVp=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0123 begin`);
      const actual: number = visibleItemsOf(1080, 1920, 10);
      logInfo(`visibleItemsOf(windowHeightVp=1080, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0123 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0124
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0124
     * @tc.desc      visibleItemsOf(windowHeightVp=100, keyboardHeightVp=-1, itemHeightVp=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0124 begin`);
      const actual: number = visibleItemsOf(100, -1, -1);
      logInfo(`visibleItemsOf(windowHeightVp=100, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0124 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0125
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0125
     * @tc.desc      visibleItemsOf(windowHeightVp=100, keyboardHeightVp=720, itemHeightVp=96) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0125 begin`);
      const actual: number = visibleItemsOf(100, 720, 96);
      logInfo(`visibleItemsOf(windowHeightVp=100, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0125 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0126
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0126
     * @tc.desc      visibleItemsOf(windowHeightVp=96, keyboardHeightVp=0, itemHeightVp=720) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0126 begin`);
      const actual: number = visibleItemsOf(96, 0, 720);
      logInfo(`visibleItemsOf(windowHeightVp=96, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0126 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0127
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0127
     * @tc.desc      visibleItemsOf(windowHeightVp=3, keyboardHeightVp=360, itemHeightVp=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0127 begin`);
      const actual: number = visibleItemsOf(3, 360, 3);
      logInfo(`visibleItemsOf(windowHeightVp=3, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0127 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0128
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0128
     * @tc.desc      visibleItemsOf(windowHeightVp=1, keyboardHeightVp=1920, itemHeightVp=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0128 begin`);
      const actual: number = visibleItemsOf(1, 1920, 10);
      logInfo(`visibleItemsOf(windowHeightVp=1, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0128 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0129
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0129
     * @tc.desc      visibleItemsOf(windowHeightVp=1080, keyboardHeightVp=-1, itemHeightVp=1920) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0129 begin`);
      const actual: number = visibleItemsOf(1080, -1, 1920);
      logInfo(`visibleItemsOf(windowHeightVp=1080, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0129 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0130
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0130
     * @tc.desc      visibleItemsOf(windowHeightVp=2, keyboardHeightVp=1080, itemHeightVp=360) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0130 begin`);
      const actual: number = visibleItemsOf(2, 1080, 360);
      logInfo(`visibleItemsOf(windowHeightVp=2, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0130 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0131
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0131
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=100, itemHeightVp=360) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0131 begin`);
      const actual: number = visibleItemsOf(0, 100, 360);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0131 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0132
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0132
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=96, itemHeightVp=96) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0132 begin`);
      const actual: number = visibleItemsOf(0, 96, 96);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0132 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0133
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0133
     * @tc.desc      visibleItemsOf(windowHeightVp=1, keyboardHeightVp=360, itemHeightVp=1080) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0133 begin`);
      const actual: number = visibleItemsOf(1, 360, 1080);
      logInfo(`visibleItemsOf(windowHeightVp=1, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0133 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0134
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0134
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=1080, itemHeightVp=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0134 begin`);
      const actual: number = visibleItemsOf(0, 1080, -1);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0134 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0135
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0135
     * @tc.desc      visibleItemsOf(windowHeightVp=-1, keyboardHeightVp=1, itemHeightVp=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0135 begin`);
      const actual: number = visibleItemsOf(-1, 1, 2);
      logInfo(`visibleItemsOf(windowHeightVp=-1, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0135 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0136
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0136
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=3, itemHeightVp=1920) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0136 begin`);
      const actual: number = visibleItemsOf(0, 3, 1920);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0136 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0137
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0137
     * @tc.desc      visibleItemsOf(windowHeightVp=720, keyboardHeightVp=1920, itemHeightVp=1920) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0137 begin`);
      const actual: number = visibleItemsOf(720, 1920, 1920);
      logInfo(`visibleItemsOf(windowHeightVp=720, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0137 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0138
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0138
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=360, itemHeightVp=720) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0138 begin`);
      const actual: number = visibleItemsOf(0, 360, 720);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0138 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0139
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0139
     * @tc.desc      visibleItemsOf(windowHeightVp=-1, keyboardHeightVp=100, itemHeightVp=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0139 begin`);
      const actual: number = visibleItemsOf(-1, 100, 2);
      logInfo(`visibleItemsOf(windowHeightVp=-1, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0139 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0140
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0140
     * @tc.desc      visibleItemsOf(windowHeightVp=1080, keyboardHeightVp=360, itemHeightVp=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0140 begin`);
      const actual: number = visibleItemsOf(1080, 360, -1);
      logInfo(`visibleItemsOf(windowHeightVp=1080, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0140 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0141
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0141
     * @tc.desc      visibleItemsOf(windowHeightVp=96, keyboardHeightVp=10, itemHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0141 begin`);
      const actual: number = visibleItemsOf(96, 10, 0);
      logInfo(`visibleItemsOf(windowHeightVp=96, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0141 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0142
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0142
     * @tc.desc      visibleItemsOf(windowHeightVp=2, keyboardHeightVp=1, itemHeightVp=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0142 begin`);
      const actual: number = visibleItemsOf(2, 1, 2);
      logInfo(`visibleItemsOf(windowHeightVp=2, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0142 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0143
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0143
     * @tc.desc      visibleItemsOf(windowHeightVp=100, keyboardHeightVp=3, itemHeightVp=360) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0143 begin`);
      const actual: number = visibleItemsOf(100, 3, 360);
      logInfo(`visibleItemsOf(windowHeightVp=100, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0143 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0144
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0144
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=96, itemHeightVp=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0144 begin`);
      const actual: number = visibleItemsOf(0, 96, -1);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0144 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0145
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0145
     * @tc.desc      visibleItemsOf(windowHeightVp=-1, keyboardHeightVp=96, itemHeightVp=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0145 begin`);
      const actual: number = visibleItemsOf(-1, 96, 10);
      logInfo(`visibleItemsOf(windowHeightVp=-1, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0145 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0146
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0146
     * @tc.desc      visibleItemsOf(windowHeightVp=1, keyboardHeightVp=2, itemHeightVp=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0146 begin`);
      const actual: number = visibleItemsOf(1, 2, 10);
      logInfo(`visibleItemsOf(windowHeightVp=1, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0146 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0147
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0147
     * @tc.desc      visibleItemsOf(windowHeightVp=10, keyboardHeightVp=2, itemHeightVp=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0147 begin`);
      const actual: number = visibleItemsOf(10, 2, -1);
      logInfo(`visibleItemsOf(windowHeightVp=10, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0147 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0148
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0148
     * @tc.desc      visibleItemsOf(windowHeightVp=720, keyboardHeightVp=1920, itemHeightVp=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0148 begin`);
      const actual: number = visibleItemsOf(720, 1920, 2);
      logInfo(`visibleItemsOf(windowHeightVp=720, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0148 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0149
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0149
     * @tc.desc      visibleItemsOf(windowHeightVp=96, keyboardHeightVp=1920, itemHeightVp=1920) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0149 begin`);
      const actual: number = visibleItemsOf(96, 1920, 1920);
      logInfo(`visibleItemsOf(windowHeightVp=96, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0149 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0150
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0150
     * @tc.desc      visibleItemsOf(windowHeightVp=100, keyboardHeightVp=360, itemHeightVp=360) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0150 begin`);
      const actual: number = visibleItemsOf(100, 360, 360);
      logInfo(`visibleItemsOf(windowHeightVp=100, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0150 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0151
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0151
     * @tc.desc      visibleItemsOf(windowHeightVp=96, keyboardHeightVp=96, itemHeightVp=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0151 begin`);
      const actual: number = visibleItemsOf(96, 96, 100);
      logInfo(`visibleItemsOf(windowHeightVp=96, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0151 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0152
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0152
     * @tc.desc      visibleItemsOf(windowHeightVp=-1, keyboardHeightVp=1, itemHeightVp=720) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0152 begin`);
      const actual: number = visibleItemsOf(-1, 1, 720);
      logInfo(`visibleItemsOf(windowHeightVp=-1, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0152 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0153
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0153
     * @tc.desc      visibleItemsOf(windowHeightVp=1080, keyboardHeightVp=360, itemHeightVp=2) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0153 begin`);
      const actual: number = visibleItemsOf(1080, 360, 2);
      logInfo(`visibleItemsOf(windowHeightVp=1080, keybo...: actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}VisibleItemsOf_0153 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0154
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0154
     * @tc.desc      visibleItemsOf(windowHeightVp=360, keyboardHeightVp=100, itemHeightVp=96) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0154 begin`);
      const actual: number = visibleItemsOf(360, 100, 96);
      logInfo(`visibleItemsOf(windowHeightVp=360, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}VisibleItemsOf_0154 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0155
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0155
     * @tc.desc      visibleItemsOf(windowHeightVp=3, keyboardHeightVp=1920, itemHeightVp=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0155 begin`);
      const actual: number = visibleItemsOf(3, 1920, 1);
      logInfo(`visibleItemsOf(windowHeightVp=3, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0155 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0156
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0156
     * @tc.desc      visibleItemsOf(windowHeightVp=2, keyboardHeightVp=1920, itemHeightVp=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0156 begin`);
      const actual: number = visibleItemsOf(2, 1920, 100);
      logInfo(`visibleItemsOf(windowHeightVp=2, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0156 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0157
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0157
     * @tc.desc      visibleItemsOf(windowHeightVp=96, keyboardHeightVp=10, itemHeightVp=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0157 begin`);
      const actual: number = visibleItemsOf(96, 10, 100);
      logInfo(`visibleItemsOf(windowHeightVp=96, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0157 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0158
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0158
     * @tc.desc      visibleItemsOf(windowHeightVp=1080, keyboardHeightVp=1080, itemHeightVp=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0158 begin`);
      const actual: number = visibleItemsOf(1080, 1080, 3);
      logInfo(`visibleItemsOf(windowHeightVp=1080, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0158 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0159
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0159
     * @tc.desc      visibleItemsOf(windowHeightVp=10, keyboardHeightVp=1920, itemHeightVp=360) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0159 begin`);
      const actual: number = visibleItemsOf(10, 1920, 360);
      logInfo(`visibleItemsOf(windowHeightVp=10, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0159 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0160
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0160
     * @tc.desc      visibleItemsOf(windowHeightVp=1, keyboardHeightVp=10, itemHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0160 begin`);
      const actual: number = visibleItemsOf(1, 10, 0);
      logInfo(`visibleItemsOf(windowHeightVp=1, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0160 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0161
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0161
     * @tc.desc      visibleItemsOf(windowHeightVp=2, keyboardHeightVp=100, itemHeightVp=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0161 begin`);
      const actual: number = visibleItemsOf(2, 100, 1);
      logInfo(`visibleItemsOf(windowHeightVp=2, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0161 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0162
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0162
     * @tc.desc      visibleItemsOf(windowHeightVp=360, keyboardHeightVp=1920, itemHeightVp=720) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0162 begin`);
      const actual: number = visibleItemsOf(360, 1920, 720);
      logInfo(`visibleItemsOf(windowHeightVp=360, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0162 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0163
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0163
     * @tc.desc      visibleItemsOf(windowHeightVp=96, keyboardHeightVp=2, itemHeightVp=96) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0163 begin`);
      const actual: number = visibleItemsOf(96, 2, 96);
      logInfo(`visibleItemsOf(windowHeightVp=96, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0163 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0164
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0164
     * @tc.desc      visibleItemsOf(windowHeightVp=3, keyboardHeightVp=2, itemHeightVp=1080) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0164 begin`);
      const actual: number = visibleItemsOf(3, 2, 1080);
      logInfo(`visibleItemsOf(windowHeightVp=3, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0164 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0165
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0165
     * @tc.desc      visibleItemsOf(windowHeightVp=1, keyboardHeightVp=0, itemHeightVp=1920) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0165 begin`);
      const actual: number = visibleItemsOf(1, 0, 1920);
      logInfo(`visibleItemsOf(windowHeightVp=1, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0165 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0166
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0166
     * @tc.desc      visibleItemsOf(windowHeightVp=10, keyboardHeightVp=3, itemHeightVp=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0166 begin`);
      const actual: number = visibleItemsOf(10, 3, 10);
      logInfo(`visibleItemsOf(windowHeightVp=10, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0166 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0167
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0167
     * @tc.desc      visibleItemsOf(windowHeightVp=96, keyboardHeightVp=3, itemHeightVp=360) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0167 begin`);
      const actual: number = visibleItemsOf(96, 3, 360);
      logInfo(`visibleItemsOf(windowHeightVp=96, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0167 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0168
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0168
     * @tc.desc      visibleItemsOf(windowHeightVp=1, keyboardHeightVp=100, itemHeightVp=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0168 begin`);
      const actual: number = visibleItemsOf(1, 100, 2);
      logInfo(`visibleItemsOf(windowHeightVp=1, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0168 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0169
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0169
     * @tc.desc      visibleItemsOf(windowHeightVp=100, keyboardHeightVp=0, itemHeightVp=96) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0169 begin`);
      const actual: number = visibleItemsOf(100, 0, 96);
      logInfo(`visibleItemsOf(windowHeightVp=100, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}VisibleItemsOf_0169 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0170
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0170
     * @tc.desc      visibleItemsOf(windowHeightVp=-1, keyboardHeightVp=1920, itemHeightVp=360) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0170 begin`);
      const actual: number = visibleItemsOf(-1, 1920, 360);
      logInfo(`visibleItemsOf(windowHeightVp=-1, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0170 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0171
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0171
     * @tc.desc      visibleItemsOf(windowHeightVp=100, keyboardHeightVp=1, itemHeightVp=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0171 begin`);
      const actual: number = visibleItemsOf(100, 1, -1);
      logInfo(`visibleItemsOf(windowHeightVp=100, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0171 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0172
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0172
     * @tc.desc      visibleItemsOf(windowHeightVp=2, keyboardHeightVp=3, itemHeightVp=1920) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0172 begin`);
      const actual: number = visibleItemsOf(2, 3, 1920);
      logInfo(`visibleItemsOf(windowHeightVp=2, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0172 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0173
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0173
     * @tc.desc      visibleItemsOf(windowHeightVp=96, keyboardHeightVp=720, itemHeightVp=1920) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0173 begin`);
      const actual: number = visibleItemsOf(96, 720, 1920);
      logInfo(`visibleItemsOf(windowHeightVp=96, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0173 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0174
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0174
     * @tc.desc      visibleItemsOf(windowHeightVp=10, keyboardHeightVp=360, itemHeightVp=1080) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0174 begin`);
      const actual: number = visibleItemsOf(10, 360, 1080);
      logInfo(`visibleItemsOf(windowHeightVp=10, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0174 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0175
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0175
     * @tc.desc      visibleItemsOf(windowHeightVp=96, keyboardHeightVp=96, itemHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0175 begin`);
      const actual: number = visibleItemsOf(96, 96, 0);
      logInfo(`visibleItemsOf(windowHeightVp=96, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0175 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0176
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0176
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=1920, itemHeightVp=1920) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0176 begin`);
      const actual: number = visibleItemsOf(0, 1920, 1920);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0176 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0177
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0177
     * @tc.desc      visibleItemsOf(windowHeightVp=96, keyboardHeightVp=96, itemHeightVp=360) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0177 begin`);
      const actual: number = visibleItemsOf(96, 96, 360);
      logInfo(`visibleItemsOf(windowHeightVp=96, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0177 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0178
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0178
     * @tc.desc      visibleItemsOf(windowHeightVp=3, keyboardHeightVp=96, itemHeightVp=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0178 begin`);
      const actual: number = visibleItemsOf(3, 96, 1);
      logInfo(`visibleItemsOf(windowHeightVp=3, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0178 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0179
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0179
     * @tc.desc      visibleItemsOf(windowHeightVp=100, keyboardHeightVp=100, itemHeightVp=1920) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0179 begin`);
      const actual: number = visibleItemsOf(100, 100, 1920);
      logInfo(`visibleItemsOf(windowHeightVp=100, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0179 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0180
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0180
     * @tc.desc      visibleItemsOf(windowHeightVp=360, keyboardHeightVp=2, itemHeightVp=360) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0180 begin`);
      const actual: number = visibleItemsOf(360, 2, 360);
      logInfo(`visibleItemsOf(windowHeightVp=360, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0180 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0181
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0181
     * @tc.desc      visibleItemsOf(windowHeightVp=1, keyboardHeightVp=2, itemHeightVp=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0181 begin`);
      const actual: number = visibleItemsOf(1, 2, 100);
      logInfo(`visibleItemsOf(windowHeightVp=1, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0181 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0182
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0182
     * @tc.desc      visibleItemsOf(windowHeightVp=1080, keyboardHeightVp=1, itemHeightVp=360) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0182 begin`);
      const actual: number = visibleItemsOf(1080, 1, 360);
      logInfo(`visibleItemsOf(windowHeightVp=1080, keybo...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}VisibleItemsOf_0182 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0183
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0183
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=-1, itemHeightVp=720) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0183 begin`);
      const actual: number = visibleItemsOf(0, -1, 720);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0183 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0184
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0184
     * @tc.desc      visibleItemsOf(windowHeightVp=1, keyboardHeightVp=100, itemHeightVp=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0184 begin`);
      const actual: number = visibleItemsOf(1, 100, 1);
      logInfo(`visibleItemsOf(windowHeightVp=1, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0184 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0185
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0185
     * @tc.desc      visibleItemsOf(windowHeightVp=3, keyboardHeightVp=1080, itemHeightVp=96) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0185 begin`);
      const actual: number = visibleItemsOf(3, 1080, 96);
      logInfo(`visibleItemsOf(windowHeightVp=3, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0185 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0186
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0186
     * @tc.desc      visibleItemsOf(windowHeightVp=96, keyboardHeightVp=1080, itemHeightVp=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0186 begin`);
      const actual: number = visibleItemsOf(96, 1080, 10);
      logInfo(`visibleItemsOf(windowHeightVp=96, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0186 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0187
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0187
     * @tc.desc      visibleItemsOf(windowHeightVp=360, keyboardHeightVp=720, itemHeightVp=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0187 begin`);
      const actual: number = visibleItemsOf(360, 720, 100);
      logInfo(`visibleItemsOf(windowHeightVp=360, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0187 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0188
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0188
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=-1, itemHeightVp=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0188 begin`);
      const actual: number = visibleItemsOf(0, -1, 10);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0188 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0189
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0189
     * @tc.desc      visibleItemsOf(windowHeightVp=-1, keyboardHeightVp=1, itemHeightVp=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0189 begin`);
      const actual: number = visibleItemsOf(-1, 1, -1);
      logInfo(`visibleItemsOf(windowHeightVp=-1, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0189 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0190
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0190
     * @tc.desc      visibleItemsOf(windowHeightVp=3, keyboardHeightVp=0, itemHeightVp=3) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0190 begin`);
      const actual: number = visibleItemsOf(3, 0, 3);
      logInfo(`visibleItemsOf(windowHeightVp=3, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}VisibleItemsOf_0190 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0191
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0191
     * @tc.desc      visibleItemsOf(windowHeightVp=2, keyboardHeightVp=0, itemHeightVp=1080) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0191 begin`);
      const actual: number = visibleItemsOf(2, 0, 1080);
      logInfo(`visibleItemsOf(windowHeightVp=2, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0191 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0192
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0192
     * @tc.desc      visibleItemsOf(windowHeightVp=1080, keyboardHeightVp=1080, itemHeightVp=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0192 begin`);
      const actual: number = visibleItemsOf(1080, 1080, 10);
      logInfo(`visibleItemsOf(windowHeightVp=1080, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0192 end`);
    });
  });
}
