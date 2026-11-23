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

/** Logic checks for contentHeightOf (96 cases). */
export default function contentHeightOf2Test(): void {
  describe('ContentHeightOf2Test', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0097
     * @tc.name      KeyboardAvoid_ContentHeightOf_0097
     * @tc.desc      contentHeightOf(windowHeightVp=360, keyboardHeightVp=100, bottomPaddingVp=3, inputRowHeightVp=-1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0097 begin`);
      const actual: number = contentHeightOf(360, 100, 3, -1);
      logInfo(`contentHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(258);
      logInfo(`${BUNDLE}ContentHeightOf_0097 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0098
     * @tc.name      KeyboardAvoid_ContentHeightOf_0098
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=1080, bottomPaddingVp=3, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0098 begin`);
      const actual: number = contentHeightOf(1920, 1080, 3, 360);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(477);
      logInfo(`${BUNDLE}ContentHeightOf_0098 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0099
     * @tc.name      KeyboardAvoid_ContentHeightOf_0099
     * @tc.desc      contentHeightOf(windowHeightVp=1080, keyboardHeightVp=100, bottomPaddingVp=-100, inputRowHeightV...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0099 begin`);
      const actual: number = contentHeightOf(1080, 100, -100, 100);
      logInfo(`contentHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(980);
      logInfo(`${BUNDLE}ContentHeightOf_0099 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0100
     * @tc.name      KeyboardAvoid_ContentHeightOf_0100
     * @tc.desc      contentHeightOf(windowHeightVp=1080, keyboardHeightVp=100, bottomPaddingVp=50, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0100 begin`);
      const actual: number = contentHeightOf(1080, 100, 50, 720);
      logInfo(`contentHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(210);
      logInfo(`${BUNDLE}ContentHeightOf_0100 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0101
     * @tc.name      KeyboardAvoid_ContentHeightOf_0101
     * @tc.desc      contentHeightOf(windowHeightVp=1080, keyboardHeightVp=100, bottomPaddingVp=100, inputRowHeightVp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0101 begin`);
      const actual: number = contentHeightOf(1080, 100, 100, -1);
      logInfo(`contentHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(881);
      logInfo(`${BUNDLE}ContentHeightOf_0101 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0102
     * @tc.name      KeyboardAvoid_ContentHeightOf_0102
     * @tc.desc      contentHeightOf(windowHeightVp=1080, keyboardHeightVp=0, bottomPaddingVp=100, inputRowHeightVp=1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0102 begin`);
      const actual: number = contentHeightOf(1080, 0, 100, 100);
      logInfo(`contentHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(880);
      logInfo(`${BUNDLE}ContentHeightOf_0102 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0103
     * @tc.name      KeyboardAvoid_ContentHeightOf_0103
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=360, bottomPaddingVp=0, inputRowHeightVp=1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0103 begin`);
      const actual: number = contentHeightOf(1920, 360, 0, 100);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1460);
      logInfo(`${BUNDLE}ContentHeightOf_0103 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0104
     * @tc.name      KeyboardAvoid_ContentHeightOf_0104
     * @tc.desc      contentHeightOf(windowHeightVp=1080, keyboardHeightVp=1, bottomPaddingVp=50, inputRowHeightVp=72...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0104 begin`);
      const actual: number = contentHeightOf(1080, 1, 50, 720);
      logInfo(`contentHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(309);
      logInfo(`${BUNDLE}ContentHeightOf_0104 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0105
     * @tc.name      KeyboardAvoid_ContentHeightOf_0105
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=100, bottomPaddingVp=100, inputRowHeightVp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0105 begin`);
      const actual: number = contentHeightOf(1920, 100, 100, -1);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1721);
      logInfo(`${BUNDLE}ContentHeightOf_0105 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0106
     * @tc.name      KeyboardAvoid_ContentHeightOf_0106
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=0, bottomPaddingVp=-100, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0106 begin`);
      const actual: number = contentHeightOf(1920, 0, -100, -1);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(2021);
      logInfo(`${BUNDLE}ContentHeightOf_0106 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0107
     * @tc.name      KeyboardAvoid_ContentHeightOf_0107
     * @tc.desc      contentHeightOf(windowHeightVp=1080, keyboardHeightVp=1, bottomPaddingVp=-1, inputRowHeightVp=1)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0107 begin`);
      const actual: number = contentHeightOf(1080, 1, -1, 1);
      logInfo(`contentHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1079);
      logInfo(`${BUNDLE}ContentHeightOf_0107 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0108
     * @tc.name      KeyboardAvoid_ContentHeightOf_0108
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=100, bottomPaddingVp=1, inputRowHeightVp=-1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0108 begin`);
      const actual: number = contentHeightOf(720, 100, 1, -1);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(620);
      logInfo(`${BUNDLE}ContentHeightOf_0108 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0109
     * @tc.name      KeyboardAvoid_ContentHeightOf_0109
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=0, bottomPaddingVp=3, inputRowHeightVp=1) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0109 begin`);
      const actual: number = contentHeightOf(1920, 0, 3, 1);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1916);
      logInfo(`${BUNDLE}ContentHeightOf_0109 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0110
     * @tc.name      KeyboardAvoid_ContentHeightOf_0110
     * @tc.desc      contentHeightOf(windowHeightVp=360, keyboardHeightVp=100, bottomPaddingVp=100, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0110 begin`);
      const actual: number = contentHeightOf(360, 100, 100, 1);
      logInfo(`contentHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(159);
      logInfo(`${BUNDLE}ContentHeightOf_0110 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0111
     * @tc.name      KeyboardAvoid_ContentHeightOf_0111
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=0, bottomPaddingVp=-1, inputRowHeightVp=1) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0111 begin`);
      const actual: number = contentHeightOf(720, 0, -1, 1);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}ContentHeightOf_0111 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0112
     * @tc.name      KeyboardAvoid_ContentHeightOf_0112
     * @tc.desc      contentHeightOf(windowHeightVp=360, keyboardHeightVp=-1, bottomPaddingVp=50, inputRowHeightVp=-1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0112 begin`);
      const actual: number = contentHeightOf(360, -1, 50, -1);
      logInfo(`contentHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(312);
      logInfo(`${BUNDLE}ContentHeightOf_0112 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0113
     * @tc.name      KeyboardAvoid_ContentHeightOf_0113
     * @tc.desc      contentHeightOf(windowHeightVp=360, keyboardHeightVp=1, bottomPaddingVp=50, inputRowHeightVp=1) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0113 begin`);
      const actual: number = contentHeightOf(360, 1, 50, 1);
      logInfo(`contentHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(308);
      logInfo(`${BUNDLE}ContentHeightOf_0113 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0114
     * @tc.name      KeyboardAvoid_ContentHeightOf_0114
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=100, bottomPaddingVp=-1, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0114 begin`);
      const actual: number = contentHeightOf(1920, 100, -1, 0);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1821);
      logInfo(`${BUNDLE}ContentHeightOf_0114 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0115
     * @tc.name      KeyboardAvoid_ContentHeightOf_0115
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=0, bottomPaddingVp=50, inputRowHeightVp=0)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0115 begin`);
      const actual: number = contentHeightOf(1920, 0, 50, 0);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1870);
      logInfo(`${BUNDLE}ContentHeightOf_0115 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0116
     * @tc.name      KeyboardAvoid_ContentHeightOf_0116
     * @tc.desc      contentHeightOf(windowHeightVp=1080, keyboardHeightVp=-1, bottomPaddingVp=100, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0116 begin`);
      const actual: number = contentHeightOf(1080, -1, 100, -1);
      logInfo(`contentHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(982);
      logInfo(`${BUNDLE}ContentHeightOf_0116 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0117
     * @tc.name      KeyboardAvoid_ContentHeightOf_0117
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=1, bottomPaddingVp=0, inputRowHeightVp=0) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0117 begin`);
      const actual: number = contentHeightOf(1920, 1, 0, 0);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1919);
      logInfo(`${BUNDLE}ContentHeightOf_0117 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0118
     * @tc.name      KeyboardAvoid_ContentHeightOf_0118
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=0, bottomPaddingVp=1, inputRowHeightVp=100...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0118 begin`);
      const actual: number = contentHeightOf(1920, 0, 1, 100);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1819);
      logInfo(`${BUNDLE}ContentHeightOf_0118 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0119
     * @tc.name      KeyboardAvoid_ContentHeightOf_0119
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=100, bottomPaddingVp=0, inputRowHeightVp=1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0119 begin`);
      const actual: number = contentHeightOf(1920, 100, 0, 100);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1720);
      logInfo(`${BUNDLE}ContentHeightOf_0119 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0120
     * @tc.name      KeyboardAvoid_ContentHeightOf_0120
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=100, bottomPaddingVp=1, inputRowHeightVp=1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0120 begin`);
      const actual: number = contentHeightOf(1920, 100, 1, 100);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1719);
      logInfo(`${BUNDLE}ContentHeightOf_0120 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0121
     * @tc.name      KeyboardAvoid_ContentHeightOf_0121
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=720, bottomPaddingVp=-1, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0121 begin`);
      const actual: number = contentHeightOf(1920, 720, -1, 720);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(481);
      logInfo(`${BUNDLE}ContentHeightOf_0121 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0122
     * @tc.name      KeyboardAvoid_ContentHeightOf_0122
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=0, bottomPaddingVp=-100, inputRowHeightVp=1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0122 begin`);
      const actual: number = contentHeightOf(720, 0, -100, 1);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(819);
      logInfo(`${BUNDLE}ContentHeightOf_0122 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0123
     * @tc.name      KeyboardAvoid_ContentHeightOf_0123
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=100, bottomPaddingVp=50, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0123 begin`);
      const actual: number = contentHeightOf(1920, 100, 50, 0);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1770);
      logInfo(`${BUNDLE}ContentHeightOf_0123 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0124
     * @tc.name      KeyboardAvoid_ContentHeightOf_0124
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=1080, bottomPaddingVp=-100, inputRowHeight...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0124 begin`);
      const actual: number = contentHeightOf(1920, 1080, -100, 720);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(220);
      logInfo(`${BUNDLE}ContentHeightOf_0124 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0125
     * @tc.name      KeyboardAvoid_ContentHeightOf_0125
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=1, bottomPaddingVp=3, inputRowHeightVp=100...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0125 begin`);
      const actual: number = contentHeightOf(1920, 1, 3, 100);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1816);
      logInfo(`${BUNDLE}ContentHeightOf_0125 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0126
     * @tc.name      KeyboardAvoid_ContentHeightOf_0126
     * @tc.desc      contentHeightOf(windowHeightVp=-1, keyboardHeightVp=0, bottomPaddingVp=-100, inputRowHeightVp=0)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0126 begin`);
      const actual: number = contentHeightOf(-1, 0, -100, 0);
      logInfo(`contentHeightOf(windowHeightVp=-1, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ContentHeightOf_0126 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0127
     * @tc.name      KeyboardAvoid_ContentHeightOf_0127
     * @tc.desc      contentHeightOf(windowHeightVp=0, keyboardHeightVp=1, bottomPaddingVp=-100, inputRowHeightVp=0) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0127 begin`);
      const actual: number = contentHeightOf(0, 1, -100, 0);
      logInfo(`contentHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ContentHeightOf_0127 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0128
     * @tc.name      KeyboardAvoid_ContentHeightOf_0128
     * @tc.desc      contentHeightOf(windowHeightVp=0, keyboardHeightVp=-1, bottomPaddingVp=-100, inputRowHeightVp=0)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0128 begin`);
      const actual: number = contentHeightOf(0, -1, -100, 0);
      logInfo(`contentHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(101);
      logInfo(`${BUNDLE}ContentHeightOf_0128 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0129
     * @tc.name      KeyboardAvoid_ContentHeightOf_0129
     * @tc.desc      contentHeightOf(windowHeightVp=0, keyboardHeightVp=100, bottomPaddingVp=-100, inputRowHeightVp=0...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0129 begin`);
      const actual: number = contentHeightOf(0, 100, -100, 0);
      logInfo(`contentHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ContentHeightOf_0129 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0130
     * @tc.name      KeyboardAvoid_ContentHeightOf_0130
     * @tc.desc      contentHeightOf(windowHeightVp=0, keyboardHeightVp=360, bottomPaddingVp=-100, inputRowHeightVp=0...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0130 begin`);
      const actual: number = contentHeightOf(0, 360, -100, 0);
      logInfo(`contentHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ContentHeightOf_0130 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0131
     * @tc.name      KeyboardAvoid_ContentHeightOf_0131
     * @tc.desc      contentHeightOf(windowHeightVp=0, keyboardHeightVp=720, bottomPaddingVp=-100, inputRowHeightVp=0...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0131 begin`);
      const actual: number = contentHeightOf(0, 720, -100, 0);
      logInfo(`contentHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ContentHeightOf_0131 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0132
     * @tc.name      KeyboardAvoid_ContentHeightOf_0132
     * @tc.desc      contentHeightOf(windowHeightVp=0, keyboardHeightVp=1080, bottomPaddingVp=-100, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0132 begin`);
      const actual: number = contentHeightOf(0, 1080, -100, 0);
      logInfo(`contentHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ContentHeightOf_0132 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0133
     * @tc.name      KeyboardAvoid_ContentHeightOf_0133
     * @tc.desc      contentHeightOf(windowHeightVp=0, keyboardHeightVp=1920, bottomPaddingVp=-100, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0133 begin`);
      const actual: number = contentHeightOf(0, 1920, -100, 0);
      logInfo(`contentHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ContentHeightOf_0133 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0134
     * @tc.name      KeyboardAvoid_ContentHeightOf_0134
     * @tc.desc      contentHeightOf(windowHeightVp=0, keyboardHeightVp=0, bottomPaddingVp=1, inputRowHeightVp=0) ret...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0134 begin`);
      const actual: number = contentHeightOf(0, 0, 1, 0);
      logInfo(`contentHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0134 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0135
     * @tc.name      KeyboardAvoid_ContentHeightOf_0135
     * @tc.desc      contentHeightOf(windowHeightVp=0, keyboardHeightVp=0, bottomPaddingVp=50, inputRowHeightVp=0) re...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0135 begin`);
      const actual: number = contentHeightOf(0, 0, 50, 0);
      logInfo(`contentHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0135 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0136
     * @tc.name      KeyboardAvoid_ContentHeightOf_0136
     * @tc.desc      contentHeightOf(windowHeightVp=0, keyboardHeightVp=0, bottomPaddingVp=100, inputRowHeightVp=0) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0136 begin`);
      const actual: number = contentHeightOf(0, 0, 100, 0);
      logInfo(`contentHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0136 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0137
     * @tc.name      KeyboardAvoid_ContentHeightOf_0137
     * @tc.desc      contentHeightOf(windowHeightVp=0, keyboardHeightVp=0, bottomPaddingVp=2, inputRowHeightVp=0) ret...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0137 begin`);
      const actual: number = contentHeightOf(0, 0, 2, 0);
      logInfo(`contentHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0137 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0138
     * @tc.name      KeyboardAvoid_ContentHeightOf_0138
     * @tc.desc      contentHeightOf(windowHeightVp=0, keyboardHeightVp=0, bottomPaddingVp=3, inputRowHeightVp=0) ret...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0138 begin`);
      const actual: number = contentHeightOf(0, 0, 3, 0);
      logInfo(`contentHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0138 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0139
     * @tc.name      KeyboardAvoid_ContentHeightOf_0139
     * @tc.desc      contentHeightOf(windowHeightVp=0, keyboardHeightVp=0, bottomPaddingVp=-100, inputRowHeightVp=-1)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0139 begin`);
      const actual: number = contentHeightOf(0, 0, -100, -1);
      logInfo(`contentHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(101);
      logInfo(`${BUNDLE}ContentHeightOf_0139 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0140
     * @tc.name      KeyboardAvoid_ContentHeightOf_0140
     * @tc.desc      contentHeightOf(windowHeightVp=0, keyboardHeightVp=0, bottomPaddingVp=-100, inputRowHeightVp=100...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0140 begin`);
      const actual: number = contentHeightOf(0, 0, -100, 100);
      logInfo(`contentHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0140 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0141
     * @tc.name      KeyboardAvoid_ContentHeightOf_0141
     * @tc.desc      contentHeightOf(windowHeightVp=0, keyboardHeightVp=0, bottomPaddingVp=-100, inputRowHeightVp=360...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0141 begin`);
      const actual: number = contentHeightOf(0, 0, -100, 360);
      logInfo(`contentHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0141 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0142
     * @tc.name      KeyboardAvoid_ContentHeightOf_0142
     * @tc.desc      contentHeightOf(windowHeightVp=0, keyboardHeightVp=0, bottomPaddingVp=-100, inputRowHeightVp=720...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0142 begin`);
      const actual: number = contentHeightOf(0, 0, -100, 720);
      logInfo(`contentHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0142 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0143
     * @tc.name      KeyboardAvoid_ContentHeightOf_0143
     * @tc.desc      contentHeightOf(windowHeightVp=0, keyboardHeightVp=0, bottomPaddingVp=-100, inputRowHeightVp=108...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0143 begin`);
      const actual: number = contentHeightOf(0, 0, -100, 1080);
      logInfo(`contentHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0143 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0144
     * @tc.name      KeyboardAvoid_ContentHeightOf_0144
     * @tc.desc      contentHeightOf(windowHeightVp=0, keyboardHeightVp=0, bottomPaddingVp=-100, inputRowHeightVp=192...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0144 begin`);
      const actual: number = contentHeightOf(0, 0, -100, 1920);
      logInfo(`contentHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0144 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0145
     * @tc.name      KeyboardAvoid_ContentHeightOf_0145
     * @tc.desc      contentHeightOf(windowHeightVp=-1, keyboardHeightVp=0, bottomPaddingVp=3, inputRowHeightVp=1) re...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0145 begin`);
      const actual: number = contentHeightOf(-1, 0, 3, 1);
      logInfo(`contentHeightOf(windowHeightVp=-1, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0145 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0146
     * @tc.name      KeyboardAvoid_ContentHeightOf_0146
     * @tc.desc      contentHeightOf(windowHeightVp=1, keyboardHeightVp=-1, bottomPaddingVp=2, inputRowHeightVp=100) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0146 begin`);
      const actual: number = contentHeightOf(1, -1, 2, 100);
      logInfo(`contentHeightOf(windowHeightVp=1, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0146 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0147
     * @tc.name      KeyboardAvoid_ContentHeightOf_0147
     * @tc.desc      contentHeightOf(windowHeightVp=100, keyboardHeightVp=1080, bottomPaddingVp=0, inputRowHeightVp=1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0147 begin`);
      const actual: number = contentHeightOf(100, 1080, 0, 100);
      logInfo(`contentHeightOf(windowHeightVp=100, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0147 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0148
     * @tc.name      KeyboardAvoid_ContentHeightOf_0148
     * @tc.desc      contentHeightOf(windowHeightVp=360, keyboardHeightVp=720, bottomPaddingVp=100, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0148 begin`);
      const actual: number = contentHeightOf(360, 720, 100, 0);
      logInfo(`contentHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0148 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0149
     * @tc.name      KeyboardAvoid_ContentHeightOf_0149
     * @tc.desc      contentHeightOf(windowHeightVp=100, keyboardHeightVp=-1, bottomPaddingVp=0, inputRowHeightVp=1) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0149 begin`);
      const actual: number = contentHeightOf(100, -1, 0, 1);
      logInfo(`contentHeightOf(windowHeightVp=100, keybo...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ContentHeightOf_0149 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0150
     * @tc.name      KeyboardAvoid_ContentHeightOf_0150
     * @tc.desc      contentHeightOf(windowHeightVp=-1, keyboardHeightVp=1, bottomPaddingVp=2, inputRowHeightVp=1) re...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0150 begin`);
      const actual: number = contentHeightOf(-1, 1, 2, 1);
      logInfo(`contentHeightOf(windowHeightVp=-1, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0150 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0151
     * @tc.name      KeyboardAvoid_ContentHeightOf_0151
     * @tc.desc      contentHeightOf(windowHeightVp=100, keyboardHeightVp=1920, bottomPaddingVp=2, inputRowHeightVp=7...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0151 begin`);
      const actual: number = contentHeightOf(100, 1920, 2, 720);
      logInfo(`contentHeightOf(windowHeightVp=100, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0151 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0152
     * @tc.name      KeyboardAvoid_ContentHeightOf_0152
     * @tc.desc      contentHeightOf(windowHeightVp=1080, keyboardHeightVp=1920, bottomPaddingVp=100, inputRowHeightV...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0152 begin`);
      const actual: number = contentHeightOf(1080, 1920, 100, 0);
      logInfo(`contentHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0152 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0153
     * @tc.name      KeyboardAvoid_ContentHeightOf_0153
     * @tc.desc      contentHeightOf(windowHeightVp=360, keyboardHeightVp=1080, bottomPaddingVp=1, inputRowHeightVp=1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0153 begin`);
      const actual: number = contentHeightOf(360, 1080, 1, 1920);
      logInfo(`contentHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0153 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0154
     * @tc.name      KeyboardAvoid_ContentHeightOf_0154
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=360, bottomPaddingVp=2, inputRowHeightVp=72...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0154 begin`);
      const actual: number = contentHeightOf(720, 360, 2, 720);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0154 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0155
     * @tc.name      KeyboardAvoid_ContentHeightOf_0155
     * @tc.desc      contentHeightOf(windowHeightVp=100, keyboardHeightVp=100, bottomPaddingVp=2, inputRowHeightVp=10...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0155 begin`);
      const actual: number = contentHeightOf(100, 100, 2, 1080);
      logInfo(`contentHeightOf(windowHeightVp=100, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0155 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0156
     * @tc.name      KeyboardAvoid_ContentHeightOf_0156
     * @tc.desc      contentHeightOf(windowHeightVp=100, keyboardHeightVp=-1, bottomPaddingVp=1, inputRowHeightVp=108...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0156 begin`);
      const actual: number = contentHeightOf(100, -1, 1, 1080);
      logInfo(`contentHeightOf(windowHeightVp=100, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0156 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0157
     * @tc.name      KeyboardAvoid_ContentHeightOf_0157
     * @tc.desc      contentHeightOf(windowHeightVp=360, keyboardHeightVp=360, bottomPaddingVp=50, inputRowHeightVp=3...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0157 begin`);
      const actual: number = contentHeightOf(360, 360, 50, 360);
      logInfo(`contentHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0157 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0158
     * @tc.name      KeyboardAvoid_ContentHeightOf_0158
     * @tc.desc      contentHeightOf(windowHeightVp=-1, keyboardHeightVp=720, bottomPaddingVp=0, inputRowHeightVp=1) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0158 begin`);
      const actual: number = contentHeightOf(-1, 720, 0, 1);
      logInfo(`contentHeightOf(windowHeightVp=-1, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0158 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0159
     * @tc.name      KeyboardAvoid_ContentHeightOf_0159
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=720, bottomPaddingVp=1, inputRowHeightVp=-1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0159 begin`);
      const actual: number = contentHeightOf(720, 720, 1, -1);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0159 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0160
     * @tc.name      KeyboardAvoid_ContentHeightOf_0160
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=360, bottomPaddingVp=-1, inputRowHeightVp=-...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0160 begin`);
      const actual: number = contentHeightOf(720, 360, -1, -1);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(362);
      logInfo(`${BUNDLE}ContentHeightOf_0160 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0161
     * @tc.name      KeyboardAvoid_ContentHeightOf_0161
     * @tc.desc      contentHeightOf(windowHeightVp=360, keyboardHeightVp=1920, bottomPaddingVp=50, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0161 begin`);
      const actual: number = contentHeightOf(360, 1920, 50, 1920);
      logInfo(`contentHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0161 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0162
     * @tc.name      KeyboardAvoid_ContentHeightOf_0162
     * @tc.desc      contentHeightOf(windowHeightVp=0, keyboardHeightVp=1080, bottomPaddingVp=3, inputRowHeightVp=100...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0162 begin`);
      const actual: number = contentHeightOf(0, 1080, 3, 100);
      logInfo(`contentHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0162 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0163
     * @tc.name      KeyboardAvoid_ContentHeightOf_0163
     * @tc.desc      contentHeightOf(windowHeightVp=1, keyboardHeightVp=0, bottomPaddingVp=-1, inputRowHeightVp=1) re...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0163 begin`);
      const actual: number = contentHeightOf(1, 0, -1, 1);
      logInfo(`contentHeightOf(windowHeightVp=1, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ContentHeightOf_0163 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0164
     * @tc.name      KeyboardAvoid_ContentHeightOf_0164
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=720, bottomPaddingVp=3, inputRowHeightVp=19...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0164 begin`);
      const actual: number = contentHeightOf(720, 720, 3, 1920);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0164 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0165
     * @tc.name      KeyboardAvoid_ContentHeightOf_0165
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=1920, bottomPaddingVp=3, inputRowHeightVp=7...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0165 begin`);
      const actual: number = contentHeightOf(720, 1920, 3, 720);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0165 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0166
     * @tc.name      KeyboardAvoid_ContentHeightOf_0166
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=1080, bottomPaddingVp=0, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0166 begin`);
      const actual: number = contentHeightOf(1920, 1080, 0, 1920);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0166 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0167
     * @tc.name      KeyboardAvoid_ContentHeightOf_0167
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=1080, bottomPaddingVp=-100, inputRowHeightV...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0167 begin`);
      const actual: number = contentHeightOf(720, 1080, -100, 720);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0167 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0168
     * @tc.name      KeyboardAvoid_ContentHeightOf_0168
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=1920, bottomPaddingVp=-1, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0168 begin`);
      const actual: number = contentHeightOf(720, 1920, -1, 1080);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0168 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0169
     * @tc.name      KeyboardAvoid_ContentHeightOf_0169
     * @tc.desc      contentHeightOf(windowHeightVp=0, keyboardHeightVp=1, bottomPaddingVp=3, inputRowHeightVp=360) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0169 begin`);
      const actual: number = contentHeightOf(0, 1, 3, 360);
      logInfo(`contentHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0169 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0170
     * @tc.name      KeyboardAvoid_ContentHeightOf_0170
     * @tc.desc      contentHeightOf(windowHeightVp=-1, keyboardHeightVp=1080, bottomPaddingVp=50, inputRowHeightVp=0...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0170 begin`);
      const actual: number = contentHeightOf(-1, 1080, 50, 0);
      logInfo(`contentHeightOf(windowHeightVp=-1, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0170 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0171
     * @tc.name      KeyboardAvoid_ContentHeightOf_0171
     * @tc.desc      contentHeightOf(windowHeightVp=-1, keyboardHeightVp=1, bottomPaddingVp=2, inputRowHeightVp=1080)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0171 begin`);
      const actual: number = contentHeightOf(-1, 1, 2, 1080);
      logInfo(`contentHeightOf(windowHeightVp=-1, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0171 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0172
     * @tc.name      KeyboardAvoid_ContentHeightOf_0172
     * @tc.desc      contentHeightOf(windowHeightVp=-1, keyboardHeightVp=1080, bottomPaddingVp=-100, inputRowHeightVp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0172 begin`);
      const actual: number = contentHeightOf(-1, 1080, -100, 1920);
      logInfo(`contentHeightOf(windowHeightVp=-1, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0172 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0173
     * @tc.name      KeyboardAvoid_ContentHeightOf_0173
     * @tc.desc      contentHeightOf(windowHeightVp=-1, keyboardHeightVp=1, bottomPaddingVp=100, inputRowHeightVp=-1)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0173 begin`);
      const actual: number = contentHeightOf(-1, 1, 100, -1);
      logInfo(`contentHeightOf(windowHeightVp=-1, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0173 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0174
     * @tc.name      KeyboardAvoid_ContentHeightOf_0174
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=720, bottomPaddingVp=-100, inputRowHeightVp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0174 begin`);
      const actual: number = contentHeightOf(720, 720, -100, 1920);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0174 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0175
     * @tc.name      KeyboardAvoid_ContentHeightOf_0175
     * @tc.desc      contentHeightOf(windowHeightVp=360, keyboardHeightVp=100, bottomPaddingVp=0, inputRowHeightVp=-1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0175 begin`);
      const actual: number = contentHeightOf(360, 100, 0, -1);
      logInfo(`contentHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(261);
      logInfo(`${BUNDLE}ContentHeightOf_0175 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0176
     * @tc.name      KeyboardAvoid_ContentHeightOf_0176
     * @tc.desc      contentHeightOf(windowHeightVp=360, keyboardHeightVp=0, bottomPaddingVp=1, inputRowHeightVp=1080...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0176 begin`);
      const actual: number = contentHeightOf(360, 0, 1, 1080);
      logInfo(`contentHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0176 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0177
     * @tc.name      KeyboardAvoid_ContentHeightOf_0177
     * @tc.desc      contentHeightOf(windowHeightVp=1, keyboardHeightVp=100, bottomPaddingVp=3, inputRowHeightVp=1) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0177 begin`);
      const actual: number = contentHeightOf(1, 100, 3, 1);
      logInfo(`contentHeightOf(windowHeightVp=1, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0177 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0178
     * @tc.name      KeyboardAvoid_ContentHeightOf_0178
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=360, bottomPaddingVp=3, inputRowHeightVp=0)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0178 begin`);
      const actual: number = contentHeightOf(720, 360, 3, 0);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(357);
      logInfo(`${BUNDLE}ContentHeightOf_0178 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0179
     * @tc.name      KeyboardAvoid_ContentHeightOf_0179
     * @tc.desc      contentHeightOf(windowHeightVp=1080, keyboardHeightVp=-1, bottomPaddingVp=-100, inputRowHeightVp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0179 begin`);
      const actual: number = contentHeightOf(1080, -1, -100, 1080);
      logInfo(`contentHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(101);
      logInfo(`${BUNDLE}ContentHeightOf_0179 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0180
     * @tc.name      KeyboardAvoid_ContentHeightOf_0180
     * @tc.desc      contentHeightOf(windowHeightVp=-1, keyboardHeightVp=720, bottomPaddingVp=50, inputRowHeightVp=-1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0180 begin`);
      const actual: number = contentHeightOf(-1, 720, 50, -1);
      logInfo(`contentHeightOf(windowHeightVp=-1, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0180 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0181
     * @tc.name      KeyboardAvoid_ContentHeightOf_0181
     * @tc.desc      contentHeightOf(windowHeightVp=0, keyboardHeightVp=360, bottomPaddingVp=2, inputRowHeightVp=1) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0181 begin`);
      const actual: number = contentHeightOf(0, 360, 2, 1);
      logInfo(`contentHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0181 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0182
     * @tc.name      KeyboardAvoid_ContentHeightOf_0182
     * @tc.desc      contentHeightOf(windowHeightVp=360, keyboardHeightVp=720, bottomPaddingVp=3, inputRowHeightVp=36...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0182 begin`);
      const actual: number = contentHeightOf(360, 720, 3, 360);
      logInfo(`contentHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0182 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0183
     * @tc.name      KeyboardAvoid_ContentHeightOf_0183
     * @tc.desc      contentHeightOf(windowHeightVp=1, keyboardHeightVp=-1, bottomPaddingVp=1, inputRowHeightVp=360) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0183 begin`);
      const actual: number = contentHeightOf(1, -1, 1, 360);
      logInfo(`contentHeightOf(windowHeightVp=1, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0183 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0184
     * @tc.name      KeyboardAvoid_ContentHeightOf_0184
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=720, bottomPaddingVp=100, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0184 begin`);
      const actual: number = contentHeightOf(720, 720, 100, 1080);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0184 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0185
     * @tc.name      KeyboardAvoid_ContentHeightOf_0185
     * @tc.desc      contentHeightOf(windowHeightVp=360, keyboardHeightVp=360, bottomPaddingVp=0, inputRowHeightVp=0)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0185 begin`);
      const actual: number = contentHeightOf(360, 360, 0, 0);
      logInfo(`contentHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0185 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0186
     * @tc.name      KeyboardAvoid_ContentHeightOf_0186
     * @tc.desc      contentHeightOf(windowHeightVp=100, keyboardHeightVp=100, bottomPaddingVp=1, inputRowHeightVp=19...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0186 begin`);
      const actual: number = contentHeightOf(100, 100, 1, 1920);
      logInfo(`contentHeightOf(windowHeightVp=100, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0186 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0187
     * @tc.name      KeyboardAvoid_ContentHeightOf_0187
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=720, bottomPaddingVp=-100, inputRowHeightVp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0187 begin`);
      const actual: number = contentHeightOf(720, 720, -100, 1080);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0187 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0188
     * @tc.name      KeyboardAvoid_ContentHeightOf_0188
     * @tc.desc      contentHeightOf(windowHeightVp=360, keyboardHeightVp=1080, bottomPaddingVp=1, inputRowHeightVp=0...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0188 begin`);
      const actual: number = contentHeightOf(360, 1080, 1, 0);
      logInfo(`contentHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0188 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0189
     * @tc.name      KeyboardAvoid_ContentHeightOf_0189
     * @tc.desc      contentHeightOf(windowHeightVp=-1, keyboardHeightVp=1920, bottomPaddingVp=50, inputRowHeightVp=1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0189 begin`);
      const actual: number = contentHeightOf(-1, 1920, 50, 1080);
      logInfo(`contentHeightOf(windowHeightVp=-1, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0189 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0190
     * @tc.name      KeyboardAvoid_ContentHeightOf_0190
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=720, bottomPaddingVp=3, inputRowHeightVp=1)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0190 begin`);
      const actual: number = contentHeightOf(720, 720, 3, 1);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0190 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0191
     * @tc.name      KeyboardAvoid_ContentHeightOf_0191
     * @tc.desc      contentHeightOf(windowHeightVp=1, keyboardHeightVp=1080, bottomPaddingVp=100, inputRowHeightVp=7...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0191 begin`);
      const actual: number = contentHeightOf(1, 1080, 100, 720);
      logInfo(`contentHeightOf(windowHeightVp=1, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0191 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0192
     * @tc.name      KeyboardAvoid_ContentHeightOf_0192
     * @tc.desc      contentHeightOf(windowHeightVp=1080, keyboardHeightVp=100, bottomPaddingVp=0, inputRowHeightVp=1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0192 begin`);
      const actual: number = contentHeightOf(1080, 100, 0, 1080);
      logInfo(`contentHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0192 end`);
    });
  });
}
