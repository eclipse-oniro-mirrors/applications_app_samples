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
import { contentHeightOf } from '../model/KeyboardAvoidLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_KeyboardAvoid]';
const BUNDLE: string = 'KeyboardAvoid_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for contentHeightOf (20 cases). */
export default function contentHeightOf3Test(): void {
  describe('ContentHeightOf3Test', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0193
     * @tc.name      KeyboardAvoid_ContentHeightOf_0193
     * @tc.desc      contentHeightOf(windowHeightVp=-1, keyboardHeightVp=0, bottomPaddingVp=0, inputRowHeightVp=100) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0193 begin`);
      const actual: number = contentHeightOf(-1, 0, 0, 100);
      logInfo(`contentHeightOf(windowHeightVp=-1, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0193 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0194
     * @tc.name      KeyboardAvoid_ContentHeightOf_0194
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=1920, bottomPaddingVp=0, inputRowHeightVp=-...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0194 begin`);
      const actual: number = contentHeightOf(720, 1920, 0, -1);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ContentHeightOf_0194 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0195
     * @tc.name      KeyboardAvoid_ContentHeightOf_0195
     * @tc.desc      contentHeightOf(windowHeightVp=-1, keyboardHeightVp=1920, bottomPaddingVp=-100, inputRowHeightVp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0195 begin`);
      const actual: number = contentHeightOf(-1, 1920, -100, 720);
      logInfo(`contentHeightOf(windowHeightVp=-1, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0195 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0196
     * @tc.name      KeyboardAvoid_ContentHeightOf_0196
     * @tc.desc      contentHeightOf(windowHeightVp=360, keyboardHeightVp=1080, bottomPaddingVp=-100, inputRowHeightV...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0196 begin`);
      const actual: number = contentHeightOf(360, 1080, -100, 1080);
      logInfo(`contentHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0196 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0197
     * @tc.name      KeyboardAvoid_ContentHeightOf_0197
     * @tc.desc      contentHeightOf(windowHeightVp=1, keyboardHeightVp=720, bottomPaddingVp=1, inputRowHeightVp=0) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0197 begin`);
      const actual: number = contentHeightOf(1, 720, 1, 0);
      logInfo(`contentHeightOf(windowHeightVp=1, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0197 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0198
     * @tc.name      KeyboardAvoid_ContentHeightOf_0198
     * @tc.desc      contentHeightOf(windowHeightVp=0, keyboardHeightVp=0, bottomPaddingVp=50, inputRowHeightVp=1) re...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0198 begin`);
      const actual: number = contentHeightOf(0, 0, 50, 1);
      logInfo(`contentHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0198 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0199
     * @tc.name      KeyboardAvoid_ContentHeightOf_0199
     * @tc.desc      contentHeightOf(windowHeightVp=-1, keyboardHeightVp=0, bottomPaddingVp=-100, inputRowHeightVp=36...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0199 begin`);
      const actual: number = contentHeightOf(-1, 0, -100, 360);
      logInfo(`contentHeightOf(windowHeightVp=-1, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0199 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0200
     * @tc.name      KeyboardAvoid_ContentHeightOf_0200
     * @tc.desc      contentHeightOf(windowHeightVp=360, keyboardHeightVp=1, bottomPaddingVp=0, inputRowHeightVp=720)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0200 begin`);
      const actual: number = contentHeightOf(360, 1, 0, 720);
      logInfo(`contentHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0200 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0201
     * @tc.name      KeyboardAvoid_ContentHeightOf_0201
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=1920, bottomPaddingVp=3, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0201 begin`);
      const actual: number = contentHeightOf(1920, 1920, 3, 1920);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0201 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0202
     * @tc.name      KeyboardAvoid_ContentHeightOf_0202
     * @tc.desc      contentHeightOf(windowHeightVp=100, keyboardHeightVp=1, bottomPaddingVp=50, inputRowHeightVp=360...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0202 begin`);
      const actual: number = contentHeightOf(100, 1, 50, 360);
      logInfo(`contentHeightOf(windowHeightVp=100, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0202 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0203
     * @tc.name      KeyboardAvoid_ContentHeightOf_0203
     * @tc.desc      contentHeightOf(windowHeightVp=100, keyboardHeightVp=1, bottomPaddingVp=1, inputRowHeightVp=100)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0203 begin`);
      const actual: number = contentHeightOf(100, 1, 1, 100);
      logInfo(`contentHeightOf(windowHeightVp=100, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0203 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0204
     * @tc.name      KeyboardAvoid_ContentHeightOf_0204
     * @tc.desc      contentHeightOf(windowHeightVp=100, keyboardHeightVp=100, bottomPaddingVp=1, inputRowHeightVp=1)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0204 begin`);
      const actual: number = contentHeightOf(100, 100, 1, 1);
      logInfo(`contentHeightOf(windowHeightVp=100, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0204 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0205
     * @tc.name      KeyboardAvoid_ContentHeightOf_0205
     * @tc.desc      contentHeightOf(windowHeightVp=100, keyboardHeightVp=1080, bottomPaddingVp=100, inputRowHeightVp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0205 begin`);
      const actual: number = contentHeightOf(100, 1080, 100, 0);
      logInfo(`contentHeightOf(windowHeightVp=100, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0205 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0206
     * @tc.name      KeyboardAvoid_ContentHeightOf_0206
     * @tc.desc      contentHeightOf(windowHeightVp=0, keyboardHeightVp=100, bottomPaddingVp=-100, inputRowHeightVp=-...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0206 begin`);
      const actual: number = contentHeightOf(0, 100, -100, -1);
      logInfo(`contentHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(101);
      logInfo(`${BUNDLE}ContentHeightOf_0206 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0207
     * @tc.name      KeyboardAvoid_ContentHeightOf_0207
     * @tc.desc      contentHeightOf(windowHeightVp=-1, keyboardHeightVp=1, bottomPaddingVp=1, inputRowHeightVp=1080)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0207 begin`);
      const actual: number = contentHeightOf(-1, 1, 1, 1080);
      logInfo(`contentHeightOf(windowHeightVp=-1, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0207 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0208
     * @tc.name      KeyboardAvoid_ContentHeightOf_0208
     * @tc.desc      contentHeightOf(windowHeightVp=1, keyboardHeightVp=1, bottomPaddingVp=100, inputRowHeightVp=1920...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0208 begin`);
      const actual: number = contentHeightOf(1, 1, 100, 1920);
      logInfo(`contentHeightOf(windowHeightVp=1, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0208 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0209
     * @tc.name      KeyboardAvoid_ContentHeightOf_0209
     * @tc.desc      contentHeightOf(windowHeightVp=-1, keyboardHeightVp=100, bottomPaddingVp=1, inputRowHeightVp=1) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0209 begin`);
      const actual: number = contentHeightOf(-1, 100, 1, 1);
      logInfo(`contentHeightOf(windowHeightVp=-1, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0209 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0210
     * @tc.name      KeyboardAvoid_ContentHeightOf_0210
     * @tc.desc      contentHeightOf(windowHeightVp=0, keyboardHeightVp=1920, bottomPaddingVp=3, inputRowHeightVp=720...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0210 begin`);
      const actual: number = contentHeightOf(0, 1920, 3, 720);
      logInfo(`contentHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0210 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0211
     * @tc.name      KeyboardAvoid_ContentHeightOf_0211
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=1920, bottomPaddingVp=50, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0211 begin`);
      const actual: number = contentHeightOf(720, 1920, 50, 1920);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0211 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0212
     * @tc.name      KeyboardAvoid_ContentHeightOf_0212
     * @tc.desc      contentHeightOf(windowHeightVp=-1, keyboardHeightVp=1, bottomPaddingVp=3, inputRowHeightVp=1080)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0212 begin`);
      const actual: number = contentHeightOf(-1, 1, 3, 1080);
      logInfo(`contentHeightOf(windowHeightVp=-1, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0212 end`);
    });
  });
}
