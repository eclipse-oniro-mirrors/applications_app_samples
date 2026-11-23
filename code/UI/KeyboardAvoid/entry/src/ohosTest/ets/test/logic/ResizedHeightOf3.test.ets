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
import { resizedHeightOf } from '../model/KeyboardAvoidLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_KeyboardAvoid]';
const BUNDLE: string = 'KeyboardAvoid_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for resizedHeightOf (20 cases). */
export default function resizedHeightOf3Test(): void {
  describe('ResizedHeightOf3Test', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0193
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0193
     * @tc.desc      resizedHeightOf(windowHeightVp=0, keyboardHeightVp=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0193 begin`);
      const actual: number = resizedHeightOf(0, 10);
      logInfo(`resizedHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResizedHeightOf_0193 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0194
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0194
     * @tc.desc      resizedHeightOf(windowHeightVp=0, keyboardHeightVp=96) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0194 begin`);
      const actual: number = resizedHeightOf(0, 96);
      logInfo(`resizedHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResizedHeightOf_0194 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0195
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0195
     * @tc.desc      resizedHeightOf(windowHeightVp=0, keyboardHeightVp=192) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0195 begin`);
      const actual: number = resizedHeightOf(0, 192);
      logInfo(`resizedHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResizedHeightOf_0195 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0196
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0196
     * @tc.desc      resizedHeightOf(windowHeightVp=0, keyboardHeightVp=288) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0196 begin`);
      const actual: number = resizedHeightOf(0, 288);
      logInfo(`resizedHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResizedHeightOf_0196 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0197
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0197
     * @tc.desc      resizedHeightOf(windowHeightVp=0, keyboardHeightVp=384) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0197 begin`);
      const actual: number = resizedHeightOf(0, 384);
      logInfo(`resizedHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResizedHeightOf_0197 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0198
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0198
     * @tc.desc      resizedHeightOf(windowHeightVp=0, keyboardHeightVp=480) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0198 begin`);
      const actual: number = resizedHeightOf(0, 480);
      logInfo(`resizedHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResizedHeightOf_0198 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0199
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0199
     * @tc.desc      resizedHeightOf(windowHeightVp=0, keyboardHeightVp=576) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0199 begin`);
      const actual: number = resizedHeightOf(0, 576);
      logInfo(`resizedHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResizedHeightOf_0199 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0200
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0200
     * @tc.desc      resizedHeightOf(windowHeightVp=0, keyboardHeightVp=672) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0200 begin`);
      const actual: number = resizedHeightOf(0, 672);
      logInfo(`resizedHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResizedHeightOf_0200 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0201
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0201
     * @tc.desc      resizedHeightOf(windowHeightVp=0, keyboardHeightVp=768) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0201 begin`);
      const actual: number = resizedHeightOf(0, 768);
      logInfo(`resizedHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResizedHeightOf_0201 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0202
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0202
     * @tc.desc      resizedHeightOf(windowHeightVp=0, keyboardHeightVp=864) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0202 begin`);
      const actual: number = resizedHeightOf(0, 864);
      logInfo(`resizedHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResizedHeightOf_0202 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0203
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0203
     * @tc.desc      resizedHeightOf(windowHeightVp=0, keyboardHeightVp=960) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0203 begin`);
      const actual: number = resizedHeightOf(0, 960);
      logInfo(`resizedHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResizedHeightOf_0203 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0204
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0204
     * @tc.desc      resizedHeightOf(windowHeightVp=0, keyboardHeightVp=1056) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0204 begin`);
      const actual: number = resizedHeightOf(0, 1056);
      logInfo(`resizedHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResizedHeightOf_0204 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0205
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0205
     * @tc.desc      resizedHeightOf(windowHeightVp=0, keyboardHeightVp=1152) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0205 begin`);
      const actual: number = resizedHeightOf(0, 1152);
      logInfo(`resizedHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResizedHeightOf_0205 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0206
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0206
     * @tc.desc      resizedHeightOf(windowHeightVp=0, keyboardHeightVp=1248) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0206 begin`);
      const actual: number = resizedHeightOf(0, 1248);
      logInfo(`resizedHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResizedHeightOf_0206 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0207
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0207
     * @tc.desc      resizedHeightOf(windowHeightVp=0, keyboardHeightVp=1344) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0207 begin`);
      const actual: number = resizedHeightOf(0, 1344);
      logInfo(`resizedHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResizedHeightOf_0207 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0208
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0208
     * @tc.desc      resizedHeightOf(windowHeightVp=0, keyboardHeightVp=1440) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0208 begin`);
      const actual: number = resizedHeightOf(0, 1440);
      logInfo(`resizedHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResizedHeightOf_0208 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0209
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0209
     * @tc.desc      resizedHeightOf(windowHeightVp=0, keyboardHeightVp=1536) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0209 begin`);
      const actual: number = resizedHeightOf(0, 1536);
      logInfo(`resizedHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResizedHeightOf_0209 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0210
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0210
     * @tc.desc      resizedHeightOf(windowHeightVp=0, keyboardHeightVp=1632) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0210 begin`);
      const actual: number = resizedHeightOf(0, 1632);
      logInfo(`resizedHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResizedHeightOf_0210 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0211
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0211
     * @tc.desc      resizedHeightOf(windowHeightVp=0, keyboardHeightVp=1728) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0211 begin`);
      const actual: number = resizedHeightOf(0, 1728);
      logInfo(`resizedHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResizedHeightOf_0211 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0212
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0212
     * @tc.desc      resizedHeightOf(windowHeightVp=0, keyboardHeightVp=1824) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0212 begin`);
      const actual: number = resizedHeightOf(0, 1824);
      logInfo(`resizedHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResizedHeightOf_0212 end`);
    });
  });
}
