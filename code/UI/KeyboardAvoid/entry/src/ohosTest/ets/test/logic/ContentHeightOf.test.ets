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
export default function contentHeightOfTest(): void {
  describe('ContentHeightOfTest', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0001
     * @tc.name      KeyboardAvoid_ContentHeightOf_0001
     * @tc.desc      contentHeightOf(windowHeightVp=0, keyboardHeightVp=0, bottomPaddingVp=-100, inputRowHeightVp=0) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_ContentHeightOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0001 begin`);
      const actual: number = contentHeightOf(0, 0, -100, 0);
      logInfo(`contentHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ContentHeightOf_0001 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0002
     * @tc.name      KeyboardAvoid_ContentHeightOf_0002
     * @tc.desc      contentHeightOf(windowHeightVp=1, keyboardHeightVp=0, bottomPaddingVp=-100, inputRowHeightVp=0) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_ContentHeightOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0002 begin`);
      const actual: number = contentHeightOf(1, 0, -100, 0);
      logInfo(`contentHeightOf(windowHeightVp=1, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(101);
      logInfo(`${BUNDLE}ContentHeightOf_0002 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0003
     * @tc.name      KeyboardAvoid_ContentHeightOf_0003
     * @tc.desc      contentHeightOf(windowHeightVp=100, keyboardHeightVp=0, bottomPaddingVp=-100, inputRowHeightVp=0...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0003 begin`);
      const actual: number = contentHeightOf(100, 0, -100, 0);
      logInfo(`contentHeightOf(windowHeightVp=100, keybo...: actual=${actual}`);
      expect(actual).assertEqual(200);
      logInfo(`${BUNDLE}ContentHeightOf_0003 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0004
     * @tc.name      KeyboardAvoid_ContentHeightOf_0004
     * @tc.desc      contentHeightOf(windowHeightVp=360, keyboardHeightVp=0, bottomPaddingVp=-100, inputRowHeightVp=0...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0004 begin`);
      const actual: number = contentHeightOf(360, 0, -100, 0);
      logInfo(`contentHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(460);
      logInfo(`${BUNDLE}ContentHeightOf_0004 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0005
     * @tc.name      KeyboardAvoid_ContentHeightOf_0005
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=0, bottomPaddingVp=-100, inputRowHeightVp=0...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0005 begin`);
      const actual: number = contentHeightOf(720, 0, -100, 0);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(820);
      logInfo(`${BUNDLE}ContentHeightOf_0005 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0006
     * @tc.name      KeyboardAvoid_ContentHeightOf_0006
     * @tc.desc      contentHeightOf(windowHeightVp=1080, keyboardHeightVp=0, bottomPaddingVp=-100, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0006 begin`);
      const actual: number = contentHeightOf(1080, 0, -100, 0);
      logInfo(`contentHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1180);
      logInfo(`${BUNDLE}ContentHeightOf_0006 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0007
     * @tc.name      KeyboardAvoid_ContentHeightOf_0007
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=0, bottomPaddingVp=-100, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0007 begin`);
      const actual: number = contentHeightOf(1920, 0, -100, 0);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(2020);
      logInfo(`${BUNDLE}ContentHeightOf_0007 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0008
     * @tc.name      KeyboardAvoid_ContentHeightOf_0008
     * @tc.desc      contentHeightOf(windowHeightVp=0, keyboardHeightVp=0, bottomPaddingVp=-1, inputRowHeightVp=0) re...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0008 begin`);
      const actual: number = contentHeightOf(0, 0, -1, 0);
      logInfo(`contentHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ContentHeightOf_0008 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0009
     * @tc.name      KeyboardAvoid_ContentHeightOf_0009
     * @tc.desc      contentHeightOf(windowHeightVp=0, keyboardHeightVp=0, bottomPaddingVp=0, inputRowHeightVp=0) ret...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0009 begin`);
      const actual: number = contentHeightOf(0, 0, 0, 0);
      logInfo(`contentHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ContentHeightOf_0009 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0010
     * @tc.name      KeyboardAvoid_ContentHeightOf_0010
     * @tc.desc      contentHeightOf(windowHeightVp=0, keyboardHeightVp=0, bottomPaddingVp=-100, inputRowHeightVp=1) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0010 begin`);
      const actual: number = contentHeightOf(0, 0, -100, 1);
      logInfo(`contentHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`${BUNDLE}ContentHeightOf_0010 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0011
     * @tc.name      KeyboardAvoid_ContentHeightOf_0011
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=100, bottomPaddingVp=2, inputRowHeightVp=3...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0011 begin`);
      const actual: number = contentHeightOf(1920, 100, 2, 360);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1458);
      logInfo(`${BUNDLE}ContentHeightOf_0011 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0012
     * @tc.name      KeyboardAvoid_ContentHeightOf_0012
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=1, bottomPaddingVp=2, inputRowHeightVp=360)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0012 begin`);
      const actual: number = contentHeightOf(720, 1, 2, 360);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(357);
      logInfo(`${BUNDLE}ContentHeightOf_0012 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0013
     * @tc.name      KeyboardAvoid_ContentHeightOf_0013
     * @tc.desc      contentHeightOf(windowHeightVp=1080, keyboardHeightVp=720, bottomPaddingVp=0, inputRowHeightVp=1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0013 begin`);
      const actual: number = contentHeightOf(1080, 720, 0, 1);
      logInfo(`contentHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(359);
      logInfo(`${BUNDLE}ContentHeightOf_0013 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0014
     * @tc.name      KeyboardAvoid_ContentHeightOf_0014
     * @tc.desc      contentHeightOf(windowHeightVp=360, keyboardHeightVp=0, bottomPaddingVp=-1, inputRowHeightVp=-1)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0014 begin`);
      const actual: number = contentHeightOf(360, 0, -1, -1);
      logInfo(`contentHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(362);
      logInfo(`${BUNDLE}ContentHeightOf_0014 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0015
     * @tc.name      KeyboardAvoid_ContentHeightOf_0015
     * @tc.desc      contentHeightOf(windowHeightVp=1, keyboardHeightVp=0, bottomPaddingVp=-100, inputRowHeightVp=-1)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0015 begin`);
      const actual: number = contentHeightOf(1, 0, -100, -1);
      logInfo(`contentHeightOf(windowHeightVp=1, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}ContentHeightOf_0015 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0016
     * @tc.name      KeyboardAvoid_ContentHeightOf_0016
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=100, bottomPaddingVp=0, inputRowHeightVp=10...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0016 begin`);
      const actual: number = contentHeightOf(720, 100, 0, 100);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(520);
      logInfo(`${BUNDLE}ContentHeightOf_0016 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0017
     * @tc.name      KeyboardAvoid_ContentHeightOf_0017
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=360, bottomPaddingVp=-1, inputRowHeightVp=1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0017 begin`);
      const actual: number = contentHeightOf(720, 360, -1, 100);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(261);
      logInfo(`${BUNDLE}ContentHeightOf_0017 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0018
     * @tc.name      KeyboardAvoid_ContentHeightOf_0018
     * @tc.desc      contentHeightOf(windowHeightVp=360, keyboardHeightVp=1, bottomPaddingVp=0, inputRowHeightVp=100)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0018 begin`);
      const actual: number = contentHeightOf(360, 1, 0, 100);
      logInfo(`contentHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(259);
      logInfo(`${BUNDLE}ContentHeightOf_0018 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0019
     * @tc.name      KeyboardAvoid_ContentHeightOf_0019
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=-1, bottomPaddingVp=3, inputRowHeightVp=10...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0019 begin`);
      const actual: number = contentHeightOf(1920, -1, 3, 100);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1818);
      logInfo(`${BUNDLE}ContentHeightOf_0019 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0020
     * @tc.name      KeyboardAvoid_ContentHeightOf_0020
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=720, bottomPaddingVp=100, inputRowHeightVp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0020 begin`);
      const actual: number = contentHeightOf(1920, 720, 100, 1080);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}ContentHeightOf_0020 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0021
     * @tc.name      KeyboardAvoid_ContentHeightOf_0021
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=0, bottomPaddingVp=100, inputRowHeightVp=0...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0021 begin`);
      const actual: number = contentHeightOf(1920, 0, 100, 0);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1820);
      logInfo(`${BUNDLE}ContentHeightOf_0021 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0022
     * @tc.name      KeyboardAvoid_ContentHeightOf_0022
     * @tc.desc      contentHeightOf(windowHeightVp=-1, keyboardHeightVp=0, bottomPaddingVp=-1, inputRowHeightVp=-1) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0022 begin`);
      const actual: number = contentHeightOf(-1, 0, -1, -1);
      logInfo(`contentHeightOf(windowHeightVp=-1, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ContentHeightOf_0022 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0023
     * @tc.name      KeyboardAvoid_ContentHeightOf_0023
     * @tc.desc      contentHeightOf(windowHeightVp=360, keyboardHeightVp=0, bottomPaddingVp=-100, inputRowHeightVp=1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0023 begin`);
      const actual: number = contentHeightOf(360, 0, -100, 1);
      logInfo(`contentHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(459);
      logInfo(`${BUNDLE}ContentHeightOf_0023 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0024
     * @tc.name      KeyboardAvoid_ContentHeightOf_0024
     * @tc.desc      contentHeightOf(windowHeightVp=1080, keyboardHeightVp=1, bottomPaddingVp=2, inputRowHeightVp=360...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0024 begin`);
      const actual: number = contentHeightOf(1080, 1, 2, 360);
      logInfo(`contentHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(717);
      logInfo(`${BUNDLE}ContentHeightOf_0024 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0025
     * @tc.name      KeyboardAvoid_ContentHeightOf_0025
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=360, bottomPaddingVp=2, inputRowHeightVp=1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0025 begin`);
      const actual: number = contentHeightOf(1920, 360, 2, 1080);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(478);
      logInfo(`${BUNDLE}ContentHeightOf_0025 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0026
     * @tc.name      KeyboardAvoid_ContentHeightOf_0026
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=1, bottomPaddingVp=100, inputRowHeightVp=7...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0026 begin`);
      const actual: number = contentHeightOf(1920, 1, 100, 720);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1099);
      logInfo(`${BUNDLE}ContentHeightOf_0026 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0027
     * @tc.name      KeyboardAvoid_ContentHeightOf_0027
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=1, bottomPaddingVp=-100, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0027 begin`);
      const actual: number = contentHeightOf(1920, 1, -100, 1);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(2018);
      logInfo(`${BUNDLE}ContentHeightOf_0027 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0028
     * @tc.name      KeyboardAvoid_ContentHeightOf_0028
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=1080, bottomPaddingVp=2, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0028 begin`);
      const actual: number = contentHeightOf(1920, 1080, 2, 720);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(118);
      logInfo(`${BUNDLE}ContentHeightOf_0028 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0029
     * @tc.name      KeyboardAvoid_ContentHeightOf_0029
     * @tc.desc      contentHeightOf(windowHeightVp=360, keyboardHeightVp=1, bottomPaddingVp=2, inputRowHeightVp=100)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0029 begin`);
      const actual: number = contentHeightOf(360, 1, 2, 100);
      logInfo(`contentHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(257);
      logInfo(`${BUNDLE}ContentHeightOf_0029 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0030
     * @tc.name      KeyboardAvoid_ContentHeightOf_0030
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=720, bottomPaddingVp=-1, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0030 begin`);
      const actual: number = contentHeightOf(1920, 720, -1, 1);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1200);
      logInfo(`${BUNDLE}ContentHeightOf_0030 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0031
     * @tc.name      KeyboardAvoid_ContentHeightOf_0031
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=1080, bottomPaddingVp=-1, inputRowHeightVp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0031 begin`);
      const actual: number = contentHeightOf(1920, 1080, -1, 1);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(840);
      logInfo(`${BUNDLE}ContentHeightOf_0031 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0032
     * @tc.name      KeyboardAvoid_ContentHeightOf_0032
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=1080, bottomPaddingVp=100, inputRowHeightV...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0032 begin`);
      const actual: number = contentHeightOf(1920, 1080, 100, 1);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(739);
      logInfo(`${BUNDLE}ContentHeightOf_0032 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0033
     * @tc.name      KeyboardAvoid_ContentHeightOf_0033
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=1, bottomPaddingVp=1, inputRowHeightVp=720...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0033 begin`);
      const actual: number = contentHeightOf(1920, 1, 1, 720);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1198);
      logInfo(`${BUNDLE}ContentHeightOf_0033 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0034
     * @tc.name      KeyboardAvoid_ContentHeightOf_0034
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=0, bottomPaddingVp=1, inputRowHeightVp=360...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0034 begin`);
      const actual: number = contentHeightOf(1920, 0, 1, 360);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1559);
      logInfo(`${BUNDLE}ContentHeightOf_0034 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0035
     * @tc.name      KeyboardAvoid_ContentHeightOf_0035
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=1, bottomPaddingVp=-1, inputRowHeightVp=0)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0035 begin`);
      const actual: number = contentHeightOf(1920, 1, -1, 0);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1920);
      logInfo(`${BUNDLE}ContentHeightOf_0035 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0036
     * @tc.name      KeyboardAvoid_ContentHeightOf_0036
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=-1, bottomPaddingVp=100, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0036 begin`);
      const actual: number = contentHeightOf(1920, -1, 100, 720);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1101);
      logInfo(`${BUNDLE}ContentHeightOf_0036 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0037
     * @tc.name      KeyboardAvoid_ContentHeightOf_0037
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=360, bottomPaddingVp=-100, inputRowHeightV...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0037 begin`);
      const actual: number = contentHeightOf(1920, 360, -100, 720);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(940);
      logInfo(`${BUNDLE}ContentHeightOf_0037 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0038
     * @tc.name      KeyboardAvoid_ContentHeightOf_0038
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=1, bottomPaddingVp=-1, inputRowHeightVp=36...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0038 begin`);
      const actual: number = contentHeightOf(1920, 1, -1, 360);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1560);
      logInfo(`${BUNDLE}ContentHeightOf_0038 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0039
     * @tc.name      KeyboardAvoid_ContentHeightOf_0039
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=-1, bottomPaddingVp=-100, inputRowHeightVp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0039 begin`);
      const actual: number = contentHeightOf(1920, -1, -100, 720);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1301);
      logInfo(`${BUNDLE}ContentHeightOf_0039 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0040
     * @tc.name      KeyboardAvoid_ContentHeightOf_0040
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=-1, bottomPaddingVp=-1, inputRowHeightVp=10...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0040 begin`);
      const actual: number = contentHeightOf(720, -1, -1, 100);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(622);
      logInfo(`${BUNDLE}ContentHeightOf_0040 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0041
     * @tc.name      KeyboardAvoid_ContentHeightOf_0041
     * @tc.desc      contentHeightOf(windowHeightVp=360, keyboardHeightVp=100, bottomPaddingVp=0, inputRowHeightVp=10...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0041 begin`);
      const actual: number = contentHeightOf(360, 100, 0, 100);
      logInfo(`contentHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(160);
      logInfo(`${BUNDLE}ContentHeightOf_0041 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0042
     * @tc.name      KeyboardAvoid_ContentHeightOf_0042
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=1080, bottomPaddingVp=0, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0042 begin`);
      const actual: number = contentHeightOf(1920, 1080, 0, 1);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(839);
      logInfo(`${BUNDLE}ContentHeightOf_0042 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0043
     * @tc.name      KeyboardAvoid_ContentHeightOf_0043
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=1, bottomPaddingVp=2, inputRowHeightVp=360...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0043 begin`);
      const actual: number = contentHeightOf(1920, 1, 2, 360);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1557);
      logInfo(`${BUNDLE}ContentHeightOf_0043 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0044
     * @tc.name      KeyboardAvoid_ContentHeightOf_0044
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=-1, bottomPaddingVp=1, inputRowHeightVp=-1)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0044 begin`);
      const actual: number = contentHeightOf(720, -1, 1, -1);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(721);
      logInfo(`${BUNDLE}ContentHeightOf_0044 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0045
     * @tc.name      KeyboardAvoid_ContentHeightOf_0045
     * @tc.desc      contentHeightOf(windowHeightVp=360, keyboardHeightVp=0, bottomPaddingVp=-100, inputRowHeightVp=-...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0045 begin`);
      const actual: number = contentHeightOf(360, 0, -100, -1);
      logInfo(`contentHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(461);
      logInfo(`${BUNDLE}ContentHeightOf_0045 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0046
     * @tc.name      KeyboardAvoid_ContentHeightOf_0046
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=100, bottomPaddingVp=2, inputRowHeightVp=1)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0046 begin`);
      const actual: number = contentHeightOf(720, 100, 2, 1);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(617);
      logInfo(`${BUNDLE}ContentHeightOf_0046 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0047
     * @tc.name      KeyboardAvoid_ContentHeightOf_0047
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=360, bottomPaddingVp=-1, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0047 begin`);
      const actual: number = contentHeightOf(1920, 360, -1, 0);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1561);
      logInfo(`${BUNDLE}ContentHeightOf_0047 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0048
     * @tc.name      KeyboardAvoid_ContentHeightOf_0048
     * @tc.desc      contentHeightOf(windowHeightVp=1080, keyboardHeightVp=1, bottomPaddingVp=3, inputRowHeightVp=100...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0048 begin`);
      const actual: number = contentHeightOf(1080, 1, 3, 100);
      logInfo(`contentHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(976);
      logInfo(`${BUNDLE}ContentHeightOf_0048 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0049
     * @tc.name      KeyboardAvoid_ContentHeightOf_0049
     * @tc.desc      contentHeightOf(windowHeightVp=360, keyboardHeightVp=100, bottomPaddingVp=3, inputRowHeightVp=10...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0049 begin`);
      const actual: number = contentHeightOf(360, 100, 3, 100);
      logInfo(`contentHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(157);
      logInfo(`${BUNDLE}ContentHeightOf_0049 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0050
     * @tc.name      KeyboardAvoid_ContentHeightOf_0050
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=1, bottomPaddingVp=2, inputRowHeightVp=-1)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0050 begin`);
      const actual: number = contentHeightOf(1920, 1, 2, -1);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1918);
      logInfo(`${BUNDLE}ContentHeightOf_0050 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0051
     * @tc.name      KeyboardAvoid_ContentHeightOf_0051
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=360, bottomPaddingVp=3, inputRowHeightVp=-...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0051 begin`);
      const actual: number = contentHeightOf(1920, 360, 3, -1);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1558);
      logInfo(`${BUNDLE}ContentHeightOf_0051 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0052
     * @tc.name      KeyboardAvoid_ContentHeightOf_0052
     * @tc.desc      contentHeightOf(windowHeightVp=1080, keyboardHeightVp=-1, bottomPaddingVp=0, inputRowHeightVp=-1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0052 begin`);
      const actual: number = contentHeightOf(1080, -1, 0, -1);
      logInfo(`contentHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1082);
      logInfo(`${BUNDLE}ContentHeightOf_0052 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0053
     * @tc.name      KeyboardAvoid_ContentHeightOf_0053
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=360, bottomPaddingVp=0, inputRowHeightVp=1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0053 begin`);
      const actual: number = contentHeightOf(1920, 360, 0, 1080);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(480);
      logInfo(`${BUNDLE}ContentHeightOf_0053 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0054
     * @tc.name      KeyboardAvoid_ContentHeightOf_0054
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=720, bottomPaddingVp=-100, inputRowHeightV...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0054 begin`);
      const actual: number = contentHeightOf(1920, 720, -100, 0);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1300);
      logInfo(`${BUNDLE}ContentHeightOf_0054 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0055
     * @tc.name      KeyboardAvoid_ContentHeightOf_0055
     * @tc.desc      contentHeightOf(windowHeightVp=360, keyboardHeightVp=0, bottomPaddingVp=-100, inputRowHeightVp=1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0055 begin`);
      const actual: number = contentHeightOf(360, 0, -100, 100);
      logInfo(`contentHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}ContentHeightOf_0055 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0056
     * @tc.name      KeyboardAvoid_ContentHeightOf_0056
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=720, bottomPaddingVp=3, inputRowHeightVp=1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0056 begin`);
      const actual: number = contentHeightOf(1920, 720, 3, 100);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1097);
      logInfo(`${BUNDLE}ContentHeightOf_0056 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0057
     * @tc.name      KeyboardAvoid_ContentHeightOf_0057
     * @tc.desc      contentHeightOf(windowHeightVp=100, keyboardHeightVp=0, bottomPaddingVp=3, inputRowHeightVp=0) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0057 begin`);
      const actual: number = contentHeightOf(100, 0, 3, 0);
      logInfo(`contentHeightOf(windowHeightVp=100, keybo...: actual=${actual}`);
      expect(actual).assertEqual(97);
      logInfo(`${BUNDLE}ContentHeightOf_0057 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0058
     * @tc.name      KeyboardAvoid_ContentHeightOf_0058
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=-1, bottomPaddingVp=-100, inputRowHeightVp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0058 begin`);
      const actual: number = contentHeightOf(1920, -1, -100, 360);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1661);
      logInfo(`${BUNDLE}ContentHeightOf_0058 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0059
     * @tc.name      KeyboardAvoid_ContentHeightOf_0059
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=0, bottomPaddingVp=50, inputRowHeightVp=360...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0059 begin`);
      const actual: number = contentHeightOf(720, 0, 50, 360);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(310);
      logInfo(`${BUNDLE}ContentHeightOf_0059 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0060
     * @tc.name      KeyboardAvoid_ContentHeightOf_0060
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=720, bottomPaddingVp=2, inputRowHeightVp=-...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0060 begin`);
      const actual: number = contentHeightOf(1920, 720, 2, -1);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1199);
      logInfo(`${BUNDLE}ContentHeightOf_0060 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0061
     * @tc.name      KeyboardAvoid_ContentHeightOf_0061
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=-1, bottomPaddingVp=3, inputRowHeightVp=100...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0061 begin`);
      const actual: number = contentHeightOf(720, -1, 3, 100);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(618);
      logInfo(`${BUNDLE}ContentHeightOf_0061 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0062
     * @tc.name      KeyboardAvoid_ContentHeightOf_0062
     * @tc.desc      contentHeightOf(windowHeightVp=1080, keyboardHeightVp=100, bottomPaddingVp=50, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0062 begin`);
      const actual: number = contentHeightOf(1080, 100, 50, -1);
      logInfo(`contentHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(931);
      logInfo(`${BUNDLE}ContentHeightOf_0062 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0063
     * @tc.name      KeyboardAvoid_ContentHeightOf_0063
     * @tc.desc      contentHeightOf(windowHeightVp=1080, keyboardHeightVp=100, bottomPaddingVp=50, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0063 begin`);
      const actual: number = contentHeightOf(1080, 100, 50, 100);
      logInfo(`contentHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(830);
      logInfo(`${BUNDLE}ContentHeightOf_0063 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0064
     * @tc.name      KeyboardAvoid_ContentHeightOf_0064
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=-1, bottomPaddingVp=50, inputRowHeightVp=0...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0064 begin`);
      const actual: number = contentHeightOf(1920, -1, 50, 0);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1871);
      logInfo(`${BUNDLE}ContentHeightOf_0064 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0065
     * @tc.name      KeyboardAvoid_ContentHeightOf_0065
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=1, bottomPaddingVp=2, inputRowHeightVp=-1) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0065 begin`);
      const actual: number = contentHeightOf(720, 1, 2, -1);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(718);
      logInfo(`${BUNDLE}ContentHeightOf_0065 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0066
     * @tc.name      KeyboardAvoid_ContentHeightOf_0066
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=1, bottomPaddingVp=50, inputRowHeightVp=0) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0066 begin`);
      const actual: number = contentHeightOf(720, 1, 50, 0);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(669);
      logInfo(`${BUNDLE}ContentHeightOf_0066 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0067
     * @tc.name      KeyboardAvoid_ContentHeightOf_0067
     * @tc.desc      contentHeightOf(windowHeightVp=100, keyboardHeightVp=-1, bottomPaddingVp=-100, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0067 begin`);
      const actual: number = contentHeightOf(100, -1, -100, -1);
      logInfo(`contentHeightOf(windowHeightVp=100, keybo...: actual=${actual}`);
      expect(actual).assertEqual(202);
      logInfo(`${BUNDLE}ContentHeightOf_0067 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0068
     * @tc.name      KeyboardAvoid_ContentHeightOf_0068
     * @tc.desc      contentHeightOf(windowHeightVp=1080, keyboardHeightVp=720, bottomPaddingVp=-1, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0068 begin`);
      const actual: number = contentHeightOf(1080, 720, -1, 0);
      logInfo(`contentHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(361);
      logInfo(`${BUNDLE}ContentHeightOf_0068 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0069
     * @tc.name      KeyboardAvoid_ContentHeightOf_0069
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=1080, bottomPaddingVp=50, inputRowHeightVp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0069 begin`);
      const actual: number = contentHeightOf(1920, 1080, 50, 720);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}ContentHeightOf_0069 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0070
     * @tc.name      KeyboardAvoid_ContentHeightOf_0070
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=-1, bottomPaddingVp=2, inputRowHeightVp=0) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0070 begin`);
      const actual: number = contentHeightOf(720, -1, 2, 0);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(719);
      logInfo(`${BUNDLE}ContentHeightOf_0070 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0071
     * @tc.name      KeyboardAvoid_ContentHeightOf_0071
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=-1, bottomPaddingVp=-100, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0071 begin`);
      const actual: number = contentHeightOf(720, -1, -100, -1);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(822);
      logInfo(`${BUNDLE}ContentHeightOf_0071 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0072
     * @tc.name      KeyboardAvoid_ContentHeightOf_0072
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=0, bottomPaddingVp=-1, inputRowHeightVp=-1)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0072 begin`);
      const actual: number = contentHeightOf(720, 0, -1, -1);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(722);
      logInfo(`${BUNDLE}ContentHeightOf_0072 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0073
     * @tc.name      KeyboardAvoid_ContentHeightOf_0073
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=360, bottomPaddingVp=3, inputRowHeightVp=3...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0073 begin`);
      const actual: number = contentHeightOf(1920, 360, 3, 360);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1197);
      logInfo(`${BUNDLE}ContentHeightOf_0073 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0074
     * @tc.name      KeyboardAvoid_ContentHeightOf_0074
     * @tc.desc      contentHeightOf(windowHeightVp=1080, keyboardHeightVp=100, bottomPaddingVp=0, inputRowHeightVp=1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0074 begin`);
      const actual: number = contentHeightOf(1080, 100, 0, 1);
      logInfo(`contentHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(979);
      logInfo(`${BUNDLE}ContentHeightOf_0074 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0075
     * @tc.name      KeyboardAvoid_ContentHeightOf_0075
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=1080, bottomPaddingVp=100, inputRowHeightV...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0075 begin`);
      const actual: number = contentHeightOf(1920, 1080, 100, -1);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(741);
      logInfo(`${BUNDLE}ContentHeightOf_0075 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0076
     * @tc.name      KeyboardAvoid_ContentHeightOf_0076
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=1, bottomPaddingVp=2, inputRowHeightVp=108...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0076 begin`);
      const actual: number = contentHeightOf(1920, 1, 2, 1080);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(837);
      logInfo(`${BUNDLE}ContentHeightOf_0076 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0077
     * @tc.name      KeyboardAvoid_ContentHeightOf_0077
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=1080, bottomPaddingVp=3, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0077 begin`);
      const actual: number = contentHeightOf(1920, 1080, 3, -1);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(838);
      logInfo(`${BUNDLE}ContentHeightOf_0077 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0078
     * @tc.name      KeyboardAvoid_ContentHeightOf_0078
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=1080, bottomPaddingVp=-100, inputRowHeight...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0078 begin`);
      const actual: number = contentHeightOf(1920, 1080, -100, -1);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(941);
      logInfo(`${BUNDLE}ContentHeightOf_0078 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0079
     * @tc.name      KeyboardAvoid_ContentHeightOf_0079
     * @tc.desc      contentHeightOf(windowHeightVp=360, keyboardHeightVp=1, bottomPaddingVp=100, inputRowHeightVp=-1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0079 begin`);
      const actual: number = contentHeightOf(360, 1, 100, -1);
      logInfo(`contentHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(260);
      logInfo(`${BUNDLE}ContentHeightOf_0079 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0080
     * @tc.name      KeyboardAvoid_ContentHeightOf_0080
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=0, bottomPaddingVp=2, inputRowHeightVp=360)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0080 begin`);
      const actual: number = contentHeightOf(720, 0, 2, 360);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(358);
      logInfo(`${BUNDLE}ContentHeightOf_0080 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0081
     * @tc.name      KeyboardAvoid_ContentHeightOf_0081
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=100, bottomPaddingVp=1, inputRowHeightVp=0)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0081 begin`);
      const actual: number = contentHeightOf(720, 100, 1, 0);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(619);
      logInfo(`${BUNDLE}ContentHeightOf_0081 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0082
     * @tc.name      KeyboardAvoid_ContentHeightOf_0082
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=-1, bottomPaddingVp=0, inputRowHeightVp=0)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0082 begin`);
      const actual: number = contentHeightOf(1920, -1, 0, 0);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1921);
      logInfo(`${BUNDLE}ContentHeightOf_0082 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0083
     * @tc.name      KeyboardAvoid_ContentHeightOf_0083
     * @tc.desc      contentHeightOf(windowHeightVp=1080, keyboardHeightVp=0, bottomPaddingVp=3, inputRowHeightVp=-1)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0083 begin`);
      const actual: number = contentHeightOf(1080, 0, 3, -1);
      logInfo(`contentHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1078);
      logInfo(`${BUNDLE}ContentHeightOf_0083 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0084
     * @tc.name      KeyboardAvoid_ContentHeightOf_0084
     * @tc.desc      contentHeightOf(windowHeightVp=1080, keyboardHeightVp=-1, bottomPaddingVp=3, inputRowHeightVp=10...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0084 begin`);
      const actual: number = contentHeightOf(1080, -1, 3, 100);
      logInfo(`contentHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(978);
      logInfo(`${BUNDLE}ContentHeightOf_0084 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0085
     * @tc.name      KeyboardAvoid_ContentHeightOf_0085
     * @tc.desc      contentHeightOf(windowHeightVp=1080, keyboardHeightVp=1, bottomPaddingVp=2, inputRowHeightVp=1) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0085 begin`);
      const actual: number = contentHeightOf(1080, 1, 2, 1);
      logInfo(`contentHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1076);
      logInfo(`${BUNDLE}ContentHeightOf_0085 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0086
     * @tc.name      KeyboardAvoid_ContentHeightOf_0086
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=-1, bottomPaddingVp=-1, inputRowHeightVp=3...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0086 begin`);
      const actual: number = contentHeightOf(1920, -1, -1, 360);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1562);
      logInfo(`${BUNDLE}ContentHeightOf_0086 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0087
     * @tc.name      KeyboardAvoid_ContentHeightOf_0087
     * @tc.desc      contentHeightOf(windowHeightVp=1080, keyboardHeightVp=-1, bottomPaddingVp=50, inputRowHeightVp=0...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0087 begin`);
      const actual: number = contentHeightOf(1080, -1, 50, 0);
      logInfo(`contentHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1031);
      logInfo(`${BUNDLE}ContentHeightOf_0087 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0088
     * @tc.name      KeyboardAvoid_ContentHeightOf_0088
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=1, bottomPaddingVp=50, inputRowHeightVp=72...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0088 begin`);
      const actual: number = contentHeightOf(1920, 1, 50, 720);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1149);
      logInfo(`${BUNDLE}ContentHeightOf_0088 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0089
     * @tc.name      KeyboardAvoid_ContentHeightOf_0089
     * @tc.desc      contentHeightOf(windowHeightVp=1080, keyboardHeightVp=0, bottomPaddingVp=1, inputRowHeightVp=-1)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0089 begin`);
      const actual: number = contentHeightOf(1080, 0, 1, -1);
      logInfo(`contentHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1080);
      logInfo(`${BUNDLE}ContentHeightOf_0089 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0090
     * @tc.name      KeyboardAvoid_ContentHeightOf_0090
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=1, bottomPaddingVp=3, inputRowHeightVp=-1)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0090 begin`);
      const actual: number = contentHeightOf(1920, 1, 3, -1);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1917);
      logInfo(`${BUNDLE}ContentHeightOf_0090 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0091
     * @tc.name      KeyboardAvoid_ContentHeightOf_0091
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=0, bottomPaddingVp=100, inputRowHeightVp=1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0091 begin`);
      const actual: number = contentHeightOf(1920, 0, 100, 1080);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(740);
      logInfo(`${BUNDLE}ContentHeightOf_0091 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0092
     * @tc.name      KeyboardAvoid_ContentHeightOf_0092
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=-1, bottomPaddingVp=0, inputRowHeightVp=10...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentHeightOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0092 begin`);
      const actual: number = contentHeightOf(1920, -1, 0, 1080);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(841);
      logInfo(`${BUNDLE}ContentHeightOf_0092 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0093
     * @tc.name      KeyboardAvoid_ContentHeightOf_0093
     * @tc.desc      contentHeightOf(windowHeightVp=720, keyboardHeightVp=-1, bottomPaddingVp=-100, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentHeightOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0093 begin`);
      const actual: number = contentHeightOf(720, -1, -100, 0);
      logInfo(`contentHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(821);
      logInfo(`${BUNDLE}ContentHeightOf_0093 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0094
     * @tc.name      KeyboardAvoid_ContentHeightOf_0094
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=720, bottomPaddingVp=50, inputRowHeightVp=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0094 begin`);
      const actual: number = contentHeightOf(1920, 720, 50, 360);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(790);
      logInfo(`${BUNDLE}ContentHeightOf_0094 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0095
     * @tc.name      KeyboardAvoid_ContentHeightOf_0095
     * @tc.desc      contentHeightOf(windowHeightVp=1920, keyboardHeightVp=360, bottomPaddingVp=100, inputRowHeightVp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0095 begin`);
      const actual: number = contentHeightOf(1920, 360, 100, 360);
      logInfo(`contentHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1100);
      logInfo(`${BUNDLE}ContentHeightOf_0095 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_HEIGHT_OF_0096
     * @tc.name      KeyboardAvoid_ContentHeightOf_0096
     * @tc.desc      contentHeightOf(windowHeightVp=1080, keyboardHeightVp=1, bottomPaddingVp=3, inputRowHeightVp=1) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentHeightOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentHeightOf_0096 begin`);
      const actual: number = contentHeightOf(1080, 1, 3, 1);
      logInfo(`contentHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1075);
      logInfo(`${BUNDLE}ContentHeightOf_0096 end`);
    });
  });
}
