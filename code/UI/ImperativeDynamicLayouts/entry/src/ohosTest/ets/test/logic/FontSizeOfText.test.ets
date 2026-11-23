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

import { describe, beforeEach, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../TestEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { fontSizeOfText } from '../model/DynamicLayoutLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ImperativeDynamicLayouts]';
const BUNDLE: string = 'ImperativeDynamicLayouts_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for fontSizeOfText (30 cases). */
export default function fontSizeOfTextTest(): void {
  describe('FontSizeOfTextTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FONT_SIZE_OF_TEXT_0001
     * @tc.name      ImperativeDynamicLayouts_FontSizeOfText_0001
     * @tc.desc      fontSizeOfText(content="Text") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImperativeDynamicLayouts_FontSizeOfText_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FontSizeOfText_0001 begin`);
      const actual: number = fontSizeOfText('Text');
      logInfo(`fontSizeOfText(content="Text"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FontSizeOfText_0001 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FONT_SIZE_OF_TEXT_0002
     * @tc.name      ImperativeDynamicLayouts_FontSizeOfText_0002
     * @tc.desc      fontSizeOfText(content="TEXT") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImperativeDynamicLayouts_FontSizeOfText_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FontSizeOfText_0002 begin`);
      const actual: number = fontSizeOfText('TEXT');
      logInfo(`fontSizeOfText(content="TEXT"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FontSizeOfText_0002 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FONT_SIZE_OF_TEXT_0003
     * @tc.name      ImperativeDynamicLayouts_FontSizeOfText_0003
     * @tc.desc      fontSizeOfText(content="Tex") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_FontSizeOfText_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FontSizeOfText_0003 begin`);
      const actual: number = fontSizeOfText('Tex');
      logInfo(`fontSizeOfText(content="Tex"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FontSizeOfText_0003 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FONT_SIZE_OF_TEXT_0004
     * @tc.name      ImperativeDynamicLayouts_FontSizeOfText_0004
     * @tc.desc      fontSizeOfText(content="Textx") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_FontSizeOfText_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FontSizeOfText_0004 begin`);
      const actual: number = fontSizeOfText('Textx');
      logInfo(`fontSizeOfText(content="Textx"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FontSizeOfText_0004 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FONT_SIZE_OF_TEXT_0005
     * @tc.name      ImperativeDynamicLayouts_FontSizeOfText_0005
     * @tc.desc      fontSizeOfText(content="Hello") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FontSizeOfText_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontSizeOfText_0005 begin`);
      const actual: number = fontSizeOfText('Hello');
      logInfo(`fontSizeOfText(content="Hello"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FontSizeOfText_0005 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FONT_SIZE_OF_TEXT_0006
     * @tc.name      ImperativeDynamicLayouts_FontSizeOfText_0006
     * @tc.desc      fontSizeOfText(content="hello world") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FontSizeOfText_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontSizeOfText_0006 begin`);
      const actual: number = fontSizeOfText('hello world');
      logInfo(`fontSizeOfText(content="hello world"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FontSizeOfText_0006 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FONT_SIZE_OF_TEXT_0007
     * @tc.name      ImperativeDynamicLayouts_FontSizeOfText_0007
     * @tc.desc      fontSizeOfText(content="") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_FontSizeOfText_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FontSizeOfText_0007 begin`);
      const actual: number = fontSizeOfText('');
      logInfo(`fontSizeOfText(content=""): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FontSizeOfText_0007 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FONT_SIZE_OF_TEXT_0008
     * @tc.name      ImperativeDynamicLayouts_FontSizeOfText_0008
     * @tc.desc      fontSizeOfText(content=" ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FontSizeOfText_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontSizeOfText_0008 begin`);
      const actual: number = fontSizeOfText(' ');
      logInfo(`fontSizeOfText(content=" "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FontSizeOfText_0008 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FONT_SIZE_OF_TEXT_0009
     * @tc.name      ImperativeDynamicLayouts_FontSizeOfText_0009
     * @tc.desc      fontSizeOfText(content="A") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FontSizeOfText_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontSizeOfText_0009 begin`);
      const actual: number = fontSizeOfText('A');
      logInfo(`fontSizeOfText(content="A"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FontSizeOfText_0009 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FONT_SIZE_OF_TEXT_0010
     * @tc.name      ImperativeDynamicLayouts_FontSizeOfText_0010
     * @tc.desc      fontSizeOfText(content="Sample Title 123") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FontSizeOfText_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontSizeOfText_0010 begin`);
      const actual: number = fontSizeOfText('Sample Title 123');
      logInfo(`fontSizeOfText(content="Sample Title 123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FontSizeOfText_0010 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FONT_SIZE_OF_TEXT_0011
     * @tc.name      ImperativeDynamicLayouts_FontSizeOfText_0011
     * @tc.desc      fontSizeOfText(content="??") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FontSizeOfText_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontSizeOfText_0011 begin`);
      const actual: number = fontSizeOfText('\u4e2d\u6587');
      logInfo(`fontSizeOfText(content="??"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FontSizeOfText_0011 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FONT_SIZE_OF_TEXT_0012
     * @tc.name      ImperativeDynamicLayouts_FontSizeOfText_0012
     * @tc.desc      fontSizeOfText(content="a") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FontSizeOfText_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontSizeOfText_0012 begin`);
      const actual: number = fontSizeOfText('a');
      logInfo(`fontSizeOfText(content="a"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FontSizeOfText_0012 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FONT_SIZE_OF_TEXT_0013
     * @tc.name      ImperativeDynamicLayouts_FontSizeOfText_0013
     * @tc.desc      fontSizeOfText(content="abc") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FontSizeOfText_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontSizeOfText_0013 begin`);
      const actual: number = fontSizeOfText('abc');
      logInfo(`fontSizeOfText(content="abc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FontSizeOfText_0013 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FONT_SIZE_OF_TEXT_0014
     * @tc.name      ImperativeDynamicLayouts_FontSizeOfText_0014
     * @tc.desc      fontSizeOfText(content="Hello World") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FontSizeOfText_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontSizeOfText_0014 begin`);
      const actual: number = fontSizeOfText('Hello World');
      logInfo(`fontSizeOfText(content="Hello World"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FontSizeOfText_0014 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FONT_SIZE_OF_TEXT_0015
     * @tc.name      ImperativeDynamicLayouts_FontSizeOfText_0015
     * @tc.desc      fontSizeOfText(content="123") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FontSizeOfText_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontSizeOfText_0015 begin`);
      const actual: number = fontSizeOfText('123');
      logInfo(`fontSizeOfText(content="123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FontSizeOfText_0015 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FONT_SIZE_OF_TEXT_0016
     * @tc.name      ImperativeDynamicLayouts_FontSizeOfText_0016
     * @tc.desc      fontSizeOfText(content=" Text ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_FontSizeOfText_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FontSizeOfText_0016 begin`);
      const actual: number = fontSizeOfText(' Text ');
      logInfo(`fontSizeOfText(content=" Text "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FontSizeOfText_0016 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FONT_SIZE_OF_TEXT_0017
     * @tc.name      ImperativeDynamicLayouts_FontSizeOfText_0017
     * @tc.desc      fontSizeOfText(content="TextText") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FontSizeOfText_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontSizeOfText_0017 begin`);
      const actual: number = fontSizeOfText('TextText');
      logInfo(`fontSizeOfText(content="TextText"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FontSizeOfText_0017 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FONT_SIZE_OF_TEXT_0018
     * @tc.name      ImperativeDynamicLayouts_FontSizeOfText_0018
     * @tc.desc      fontSizeOfText(content="Text_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FontSizeOfText_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontSizeOfText_0018 begin`);
      const actual: number = fontSizeOfText('Text_1');
      logInfo(`fontSizeOfText(content="Text_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FontSizeOfText_0018 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FONT_SIZE_OF_TEXT_0019
     * @tc.name      ImperativeDynamicLayouts_FontSizeOfText_0019
     * @tc.desc      fontSizeOfText(content="xText") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_FontSizeOfText_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FontSizeOfText_0019 begin`);
      const actual: number = fontSizeOfText('xText');
      logInfo(`fontSizeOfText(content="xText"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FontSizeOfText_0019 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FONT_SIZE_OF_TEXT_0020
     * @tc.name      ImperativeDynamicLayouts_FontSizeOfText_0020
     * @tc.desc      fontSizeOfText(content=" TEXT ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_FontSizeOfText_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FontSizeOfText_0020 begin`);
      const actual: number = fontSizeOfText(' TEXT ');
      logInfo(`fontSizeOfText(content=" TEXT "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FontSizeOfText_0020 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FONT_SIZE_OF_TEXT_0021
     * @tc.name      ImperativeDynamicLayouts_FontSizeOfText_0021
     * @tc.desc      fontSizeOfText(content="TEXTTEXT") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FontSizeOfText_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontSizeOfText_0021 begin`);
      const actual: number = fontSizeOfText('TEXTTEXT');
      logInfo(`fontSizeOfText(content="TEXTTEXT"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FontSizeOfText_0021 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FONT_SIZE_OF_TEXT_0022
     * @tc.name      ImperativeDynamicLayouts_FontSizeOfText_0022
     * @tc.desc      fontSizeOfText(content="TEXT_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FontSizeOfText_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontSizeOfText_0022 begin`);
      const actual: number = fontSizeOfText('TEXT_1');
      logInfo(`fontSizeOfText(content="TEXT_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FontSizeOfText_0022 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FONT_SIZE_OF_TEXT_0023
     * @tc.name      ImperativeDynamicLayouts_FontSizeOfText_0023
     * @tc.desc      fontSizeOfText(content="xTEXT") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_FontSizeOfText_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FontSizeOfText_0023 begin`);
      const actual: number = fontSizeOfText('xTEXT');
      logInfo(`fontSizeOfText(content="xTEXT"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FontSizeOfText_0023 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FONT_SIZE_OF_TEXT_0024
     * @tc.name      ImperativeDynamicLayouts_FontSizeOfText_0024
     * @tc.desc      fontSizeOfText(content=" Tex ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_FontSizeOfText_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FontSizeOfText_0024 begin`);
      const actual: number = fontSizeOfText(' Tex ');
      logInfo(`fontSizeOfText(content=" Tex "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FontSizeOfText_0024 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FONT_SIZE_OF_TEXT_0025
     * @tc.name      ImperativeDynamicLayouts_FontSizeOfText_0025
     * @tc.desc      fontSizeOfText(content="TexTex") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FontSizeOfText_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontSizeOfText_0025 begin`);
      const actual: number = fontSizeOfText('TexTex');
      logInfo(`fontSizeOfText(content="TexTex"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FontSizeOfText_0025 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FONT_SIZE_OF_TEXT_0026
     * @tc.name      ImperativeDynamicLayouts_FontSizeOfText_0026
     * @tc.desc      fontSizeOfText(content="Tex_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FontSizeOfText_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontSizeOfText_0026 begin`);
      const actual: number = fontSizeOfText('Tex_1');
      logInfo(`fontSizeOfText(content="Tex_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FontSizeOfText_0026 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FONT_SIZE_OF_TEXT_0027
     * @tc.name      ImperativeDynamicLayouts_FontSizeOfText_0027
     * @tc.desc      fontSizeOfText(content="xTex") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_FontSizeOfText_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FontSizeOfText_0027 begin`);
      const actual: number = fontSizeOfText('xTex');
      logInfo(`fontSizeOfText(content="xTex"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FontSizeOfText_0027 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FONT_SIZE_OF_TEXT_0028
     * @tc.name      ImperativeDynamicLayouts_FontSizeOfText_0028
     * @tc.desc      fontSizeOfText(content=" Textx ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_FontSizeOfText_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FontSizeOfText_0028 begin`);
      const actual: number = fontSizeOfText(' Textx ');
      logInfo(`fontSizeOfText(content=" Textx "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FontSizeOfText_0028 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FONT_SIZE_OF_TEXT_0029
     * @tc.name      ImperativeDynamicLayouts_FontSizeOfText_0029
     * @tc.desc      fontSizeOfText(content="TextxTextx") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FontSizeOfText_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontSizeOfText_0029 begin`);
      const actual: number = fontSizeOfText('TextxTextx');
      logInfo(`fontSizeOfText(content="TextxTextx"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FontSizeOfText_0029 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FONT_SIZE_OF_TEXT_0030
     * @tc.name      ImperativeDynamicLayouts_FontSizeOfText_0030
     * @tc.desc      fontSizeOfText(content="Textx_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FontSizeOfText_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontSizeOfText_0030 begin`);
      const actual: number = fontSizeOfText('Textx_1');
      logInfo(`fontSizeOfText(content="Textx_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FontSizeOfText_0030 end`);
    });
  });
}
