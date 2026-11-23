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

/** Logic checks for visibleItemsOf (19 cases). */
export default function visibleItemsOf3Test(): void {
  describe('VisibleItemsOf3Test', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0193
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0193
     * @tc.desc      visibleItemsOf(windowHeightVp=1, keyboardHeightVp=-1, itemHeightVp=1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0193 begin`);
      const actual: number = visibleItemsOf(1, -1, 1);
      logInfo(`visibleItemsOf(windowHeightVp=1, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}VisibleItemsOf_0193 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0194
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0194
     * @tc.desc      visibleItemsOf(windowHeightVp=2, keyboardHeightVp=-1, itemHeightVp=1920) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0194 begin`);
      const actual: number = visibleItemsOf(2, -1, 1920);
      logInfo(`visibleItemsOf(windowHeightVp=2, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0194 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0195
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0195
     * @tc.desc      visibleItemsOf(windowHeightVp=1080, keyboardHeightVp=720, itemHeightVp=720) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0195 begin`);
      const actual: number = visibleItemsOf(1080, 720, 720);
      logInfo(`visibleItemsOf(windowHeightVp=1080, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0195 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0196
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0196
     * @tc.desc      visibleItemsOf(windowHeightVp=10, keyboardHeightVp=100, itemHeightVp=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0196 begin`);
      const actual: number = visibleItemsOf(10, 100, -1);
      logInfo(`visibleItemsOf(windowHeightVp=10, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0196 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0197
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0197
     * @tc.desc      visibleItemsOf(windowHeightVp=1080, keyboardHeightVp=720, itemHeightVp=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0197 begin`);
      const actual: number = visibleItemsOf(1080, 720, -1);
      logInfo(`visibleItemsOf(windowHeightVp=1080, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0197 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0198
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0198
     * @tc.desc      visibleItemsOf(windowHeightVp=-1, keyboardHeightVp=96, itemHeightVp=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0198 begin`);
      const actual: number = visibleItemsOf(-1, 96, 100);
      logInfo(`visibleItemsOf(windowHeightVp=-1, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0198 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0199
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0199
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=3, itemHeightVp=96) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0199 begin`);
      const actual: number = visibleItemsOf(0, 3, 96);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0199 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0200
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0200
     * @tc.desc      visibleItemsOf(windowHeightVp=-1, keyboardHeightVp=3, itemHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0200 begin`);
      const actual: number = visibleItemsOf(-1, 3, 0);
      logInfo(`visibleItemsOf(windowHeightVp=-1, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0200 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0201
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0201
     * @tc.desc      visibleItemsOf(windowHeightVp=100, keyboardHeightVp=3, itemHeightVp=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0201 begin`);
      const actual: number = visibleItemsOf(100, 3, -1);
      logInfo(`visibleItemsOf(windowHeightVp=100, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0201 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0202
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0202
     * @tc.desc      visibleItemsOf(windowHeightVp=360, keyboardHeightVp=-1, itemHeightVp=1920) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0202 begin`);
      const actual: number = visibleItemsOf(360, -1, 1920);
      logInfo(`visibleItemsOf(windowHeightVp=360, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0202 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0203
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0203
     * @tc.desc      visibleItemsOf(windowHeightVp=1, keyboardHeightVp=1920, itemHeightVp=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0203 begin`);
      const actual: number = visibleItemsOf(1, 1920, 100);
      logInfo(`visibleItemsOf(windowHeightVp=1, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0203 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0204
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0204
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=96, itemHeightVp=1920) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0204 begin`);
      const actual: number = visibleItemsOf(0, 96, 1920);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0204 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0205
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0205
     * @tc.desc      visibleItemsOf(windowHeightVp=96, keyboardHeightVp=3, itemHeightVp=1080) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0205 begin`);
      const actual: number = visibleItemsOf(96, 3, 1080);
      logInfo(`visibleItemsOf(windowHeightVp=96, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0205 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0206
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0206
     * @tc.desc      visibleItemsOf(windowHeightVp=1, keyboardHeightVp=1, itemHeightVp=96) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0206 begin`);
      const actual: number = visibleItemsOf(1, 1, 96);
      logInfo(`visibleItemsOf(windowHeightVp=1, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0206 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0207
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0207
     * @tc.desc      visibleItemsOf(windowHeightVp=720, keyboardHeightVp=100, itemHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0207 begin`);
      const actual: number = visibleItemsOf(720, 100, 0);
      logInfo(`visibleItemsOf(windowHeightVp=720, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0207 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0208
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0208
     * @tc.desc      visibleItemsOf(windowHeightVp=360, keyboardHeightVp=96, itemHeightVp=100) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0208 begin`);
      const actual: number = visibleItemsOf(360, 96, 100);
      logInfo(`visibleItemsOf(windowHeightVp=360, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}VisibleItemsOf_0208 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0209
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0209
     * @tc.desc      visibleItemsOf(windowHeightVp=-1, keyboardHeightVp=360, itemHeightVp=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0209 begin`);
      const actual: number = visibleItemsOf(-1, 360, 3);
      logInfo(`visibleItemsOf(windowHeightVp=-1, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0209 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0210
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0210
     * @tc.desc      visibleItemsOf(windowHeightVp=720, keyboardHeightVp=720, itemHeightVp=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0210 begin`);
      const actual: number = visibleItemsOf(720, 720, 10);
      logInfo(`visibleItemsOf(windowHeightVp=720, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0210 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0211
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0211
     * @tc.desc      visibleItemsOf(windowHeightVp=3, keyboardHeightVp=96, itemHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0211 begin`);
      const actual: number = visibleItemsOf(3, 96, 0);
      logInfo(`visibleItemsOf(windowHeightVp=3, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0211 end`);
    });
  });
}
