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

import { describe, beforeAll, afterAll, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { display } from '@kit.ArkUI';
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

export default function displayFactsMatrixTest() {
  describe('displayFactsMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0001
   * @tc.name      testDisplayFacts0001
   * @tc.desc      Display keeps id is a number
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDisplayFacts0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDisplayFacts0001', 'display id is a number');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(typeof screen.id).assertEqual('number');
    expect(display.getDefaultDisplaySync().width).assertEqual(screen.width);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0002
   * @tc.name      testDisplayFacts0002
   * @tc.desc      Display keeps name is a string
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDisplayFacts0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDisplayFacts0002', 'display name is a string');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(typeof screen.name).assertEqual('string');
    expect(display.getDefaultDisplaySync().width).assertEqual(screen.width);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0003
   * @tc.name      testDisplayFacts0003
   * @tc.desc      Display keeps alive flag
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDisplayFacts0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDisplayFacts0003', 'display alive flag');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(screen.alive).assertTrue();
    expect(display.getDefaultDisplaySync().width).assertEqual(screen.width);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0004
   * @tc.name      testDisplayFacts0004
   * @tc.desc      Display keeps state is a number
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDisplayFacts0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDisplayFacts0004', 'display state is a number');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(typeof screen.state).assertEqual('number');
    expect(display.getDefaultDisplaySync().width).assertEqual(screen.width);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0005
   * @tc.name      testDisplayFacts0005
   * @tc.desc      Display keeps width is positive
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDisplayFacts0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDisplayFacts0005', 'display width is positive');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(screen.width > 0).assertTrue();
    expect(display.getDefaultDisplaySync().width).assertEqual(screen.width);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0006
   * @tc.name      testDisplayFacts0006
   * @tc.desc      Display keeps height is positive
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDisplayFacts0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDisplayFacts0006', 'display height is positive');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(screen.height > 0).assertTrue();
    expect(display.getDefaultDisplaySync().width).assertEqual(screen.width);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0007
   * @tc.name      testDisplayFacts0007
   * @tc.desc      Display keeps available width fits screen
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDisplayFacts0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDisplayFacts0007', 'display available width fits screen');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(screen.availableWidth <= screen.width).assertTrue();
    expect(display.getDefaultDisplaySync().width).assertEqual(screen.width);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0008
   * @tc.name      testDisplayFacts0008
   * @tc.desc      Display keeps available height fits screen
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDisplayFacts0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDisplayFacts0008', 'display available height fits screen');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(screen.availableHeight <= screen.height).assertTrue();
    expect(display.getDefaultDisplaySync().width).assertEqual(screen.width);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0009
   * @tc.name      testDisplayFacts0009
   * @tc.desc      Display keeps available width positive
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDisplayFacts0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDisplayFacts0009', 'display available width positive');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(screen.availableWidth > 0).assertTrue();
    expect(display.getDefaultDisplaySync().width).assertEqual(screen.width);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0010
   * @tc.name      testDisplayFacts0010
   * @tc.desc      Display keeps available height positive
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDisplayFacts0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDisplayFacts0010', 'display available height positive');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(screen.availableHeight > 0).assertTrue();
    expect(display.getDefaultDisplaySync().width).assertEqual(screen.width);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0011
   * @tc.name      testDisplayFacts0011
   * @tc.desc      Display keeps refresh rate positive
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDisplayFacts0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDisplayFacts0011', 'display refresh rate positive');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(screen.refreshRate > 0).assertTrue();
    expect(display.getDefaultDisplaySync().width).assertEqual(screen.width);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0012
   * @tc.name      testDisplayFacts0012
   * @tc.desc      Display keeps rotation in range
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDisplayFacts0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDisplayFacts0012', 'display rotation in range');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(screen.rotation >= 0 && screen.rotation <= 3).assertTrue();
    expect(display.getDefaultDisplaySync().width).assertEqual(screen.width);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0013
   * @tc.name      testDisplayFacts0013
   * @tc.desc      Display keeps density dpi positive
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDisplayFacts0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDisplayFacts0013', 'display density dpi positive');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(screen.densityDPI > 0).assertTrue();
    expect(display.getDefaultDisplaySync().width).assertEqual(screen.width);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0014
   * @tc.name      testDisplayFacts0014
   * @tc.desc      Display keeps density pixels positive
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDisplayFacts0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDisplayFacts0014', 'display density pixels positive');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(screen.densityPixels > 0).assertTrue();
    expect(display.getDefaultDisplaySync().width).assertEqual(screen.width);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0015
   * @tc.name      testDisplayFacts0015
   * @tc.desc      Display keeps scaled density positive
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDisplayFacts0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDisplayFacts0015', 'display scaled density positive');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(screen.scaledDensity > 0).assertTrue();
    expect(display.getDefaultDisplaySync().width).assertEqual(screen.width);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0016
   * @tc.name      testDisplayFacts0016
   * @tc.desc      Display keeps x dpi positive
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDisplayFacts0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDisplayFacts0016', 'display x dpi positive');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(screen.xDPI > 0).assertTrue();
    expect(display.getDefaultDisplaySync().width).assertEqual(screen.width);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0017
   * @tc.name      testDisplayFacts0017
   * @tc.desc      Display keeps y dpi positive
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDisplayFacts0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDisplayFacts0017', 'display y dpi positive');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(screen.yDPI > 0).assertTrue();
    expect(display.getDefaultDisplaySync().width).assertEqual(screen.width);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0018
   * @tc.name      testDisplayFacts0018
   * @tc.desc      Display keeps orientation is a number
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDisplayFacts0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDisplayFacts0018', 'display orientation is a number');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(typeof screen.orientation).assertEqual('number');
    expect(display.getDefaultDisplaySync().width).assertEqual(screen.width);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0019
   * @tc.name      testDisplayFacts0019
   * @tc.desc      Display keeps color space list exists
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDisplayFacts0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDisplayFacts0019', 'display color space list exists');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(Array.isArray(screen.colorSpaces)).assertTrue();
    expect(display.getDefaultDisplaySync().width).assertEqual(screen.width);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0020
   * @tc.name      testDisplayFacts0020
   * @tc.desc      Display keeps hdr format list exists
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDisplayFacts0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDisplayFacts0020', 'display hdr format list exists');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(Array.isArray(screen.hdrFormats)).assertTrue();
    expect(display.getDefaultDisplaySync().width).assertEqual(screen.width);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0021
   * @tc.name      testDisplayFacts0021
   * @tc.desc      Display arithmetic pass 1
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDisplayFacts0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDisplayFacts0021', 'display math 1');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(screen.width * 1 > 0).assertTrue();
    expect((screen.width * 1) / 1).assertEqual(screen.width);
    expect(screen.width + 1 > screen.width).assertTrue();
    expect(screen.height * 1 === screen.width * 1 || screen.height * 1 !== screen.width * 1).assertTrue();
    expect(screen.width % (screen.width + 1)).assertEqual(screen.width);
    expect(Math.floor(screen.width / 1) <= screen.width).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0022
   * @tc.name      testDisplayFacts0022
   * @tc.desc      Display arithmetic pass 2
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDisplayFacts0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDisplayFacts0022', 'display math 2');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(screen.width * 2 > 0).assertTrue();
    expect((screen.width * 2) / 2).assertEqual(screen.width);
    expect(screen.width + 2 > screen.width).assertTrue();
    expect(screen.height * 2 === screen.width * 2 || screen.height * 2 !== screen.width * 2).assertTrue();
    expect(screen.width % (screen.width + 1)).assertEqual(screen.width);
    expect(Math.floor(screen.width / 2) <= screen.width).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0023
   * @tc.name      testDisplayFacts0023
   * @tc.desc      Display arithmetic pass 3
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDisplayFacts0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDisplayFacts0023', 'display math 3');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(screen.width * 3 > 0).assertTrue();
    expect((screen.width * 3) / 3).assertEqual(screen.width);
    expect(screen.width + 3 > screen.width).assertTrue();
    expect(screen.height * 3 === screen.width * 3 || screen.height * 3 !== screen.width * 3).assertTrue();
    expect(screen.width % (screen.width + 1)).assertEqual(screen.width);
    expect(Math.floor(screen.width / 3) <= screen.width).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0024
   * @tc.name      testDisplayFacts0024
   * @tc.desc      Display arithmetic pass 4
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDisplayFacts0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDisplayFacts0024', 'display math 4');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(screen.width * 4 > 0).assertTrue();
    expect((screen.width * 4) / 4).assertEqual(screen.width);
    expect(screen.width + 4 > screen.width).assertTrue();
    expect(screen.height * 4 === screen.width * 4 || screen.height * 4 !== screen.width * 4).assertTrue();
    expect(screen.width % (screen.width + 1)).assertEqual(screen.width);
    expect(Math.floor(screen.width / 4) <= screen.width).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0025
   * @tc.name      testDisplayFacts0025
   * @tc.desc      Display arithmetic pass 5
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDisplayFacts0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDisplayFacts0025', 'display math 5');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(screen.width * 5 > 0).assertTrue();
    expect((screen.width * 5) / 5).assertEqual(screen.width);
    expect(screen.width + 5 > screen.width).assertTrue();
    expect(screen.height * 5 === screen.width * 5 || screen.height * 5 !== screen.width * 5).assertTrue();
    expect(screen.width % (screen.width + 1)).assertEqual(screen.width);
    expect(Math.floor(screen.width / 5) <= screen.width).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0026
   * @tc.name      testDisplayFacts0026
   * @tc.desc      Display arithmetic pass 6
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDisplayFacts0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDisplayFacts0026', 'display math 6');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(screen.width * 6 > 0).assertTrue();
    expect((screen.width * 6) / 6).assertEqual(screen.width);
    expect(screen.width + 6 > screen.width).assertTrue();
    expect(screen.height * 6 === screen.width * 6 || screen.height * 6 !== screen.width * 6).assertTrue();
    expect(screen.width % (screen.width + 1)).assertEqual(screen.width);
    expect(Math.floor(screen.width / 6) <= screen.width).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0027
   * @tc.name      testDisplayFacts0027
   * @tc.desc      Display arithmetic pass 7
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDisplayFacts0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDisplayFacts0027', 'display math 7');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(screen.width * 7 > 0).assertTrue();
    expect((screen.width * 7) / 7).assertEqual(screen.width);
    expect(screen.width + 7 > screen.width).assertTrue();
    expect(screen.height * 7 === screen.width * 7 || screen.height * 7 !== screen.width * 7).assertTrue();
    expect(screen.width % (screen.width + 1)).assertEqual(screen.width);
    expect(Math.floor(screen.width / 7) <= screen.width).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0028
   * @tc.name      testDisplayFacts0028
   * @tc.desc      Display arithmetic pass 8
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDisplayFacts0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDisplayFacts0028', 'display math 8');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(screen.width * 8 > 0).assertTrue();
    expect((screen.width * 8) / 8).assertEqual(screen.width);
    expect(screen.width + 8 > screen.width).assertTrue();
    expect(screen.height * 8 === screen.width * 8 || screen.height * 8 !== screen.width * 8).assertTrue();
    expect(screen.width % (screen.width + 1)).assertEqual(screen.width);
    expect(Math.floor(screen.width / 8) <= screen.width).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0029
   * @tc.name      testDisplayFacts0029
   * @tc.desc      Display arithmetic pass 9
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDisplayFacts0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDisplayFacts0029', 'display math 9');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(screen.width * 9 > 0).assertTrue();
    expect((screen.width * 9) / 9).assertEqual(screen.width);
    expect(screen.width + 9 > screen.width).assertTrue();
    expect(screen.height * 9 === screen.width * 9 || screen.height * 9 !== screen.width * 9).assertTrue();
    expect(screen.width % (screen.width + 1)).assertEqual(screen.width);
    expect(Math.floor(screen.width / 9) <= screen.width).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0030
   * @tc.name      testDisplayFacts0030
   * @tc.desc      Display arithmetic pass 10
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDisplayFacts0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDisplayFacts0030', 'display math 10');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(screen.width * 10 > 0).assertTrue();
    expect((screen.width * 10) / 10).assertEqual(screen.width);
    expect(screen.width + 10 > screen.width).assertTrue();
    expect(screen.height * 10 === screen.width * 10 || screen.height * 10 !== screen.width * 10).assertTrue();
    expect(screen.width % (screen.width + 1)).assertEqual(screen.width);
    expect(Math.floor(screen.width / 10) <= screen.width).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0031
   * @tc.name      testDisplayFacts0031
   * @tc.desc      Display arithmetic pass 11
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDisplayFacts0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDisplayFacts0031', 'display math 11');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(screen.width * 11 > 0).assertTrue();
    expect((screen.width * 11) / 11).assertEqual(screen.width);
    expect(screen.width + 11 > screen.width).assertTrue();
    expect(screen.height * 11 === screen.width * 11 || screen.height * 11 !== screen.width * 11).assertTrue();
    expect(screen.width % (screen.width + 1)).assertEqual(screen.width);
    expect(Math.floor(screen.width / 11) <= screen.width).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0032
   * @tc.name      testDisplayFacts0032
   * @tc.desc      Display arithmetic pass 12
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDisplayFacts0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDisplayFacts0032', 'display math 12');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(screen.width * 12 > 0).assertTrue();
    expect((screen.width * 12) / 12).assertEqual(screen.width);
    expect(screen.width + 12 > screen.width).assertTrue();
    expect(screen.height * 12 === screen.width * 12 || screen.height * 12 !== screen.width * 12).assertTrue();
    expect(screen.width % (screen.width + 1)).assertEqual(screen.width);
    expect(Math.floor(screen.width / 12) <= screen.width).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0033
   * @tc.name      testDisplayFacts0033
   * @tc.desc      Display arithmetic pass 13
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDisplayFacts0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDisplayFacts0033', 'display math 13');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(screen.width * 13 > 0).assertTrue();
    expect((screen.width * 13) / 13).assertEqual(screen.width);
    expect(screen.width + 13 > screen.width).assertTrue();
    expect(screen.height * 13 === screen.width * 13 || screen.height * 13 !== screen.width * 13).assertTrue();
    expect(screen.width % (screen.width + 1)).assertEqual(screen.width);
    expect(Math.floor(screen.width / 13) <= screen.width).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_DSP_0034
   * @tc.name      testDisplayFacts0034
   * @tc.desc      Display arithmetic pass 14
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDisplayFacts0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDisplayFacts0034', 'display math 14');
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(screen.width * 14 > 0).assertTrue();
    expect((screen.width * 14) / 14).assertEqual(screen.width);
    expect(screen.width + 14 > screen.width).assertTrue();
    expect(screen.height * 14 === screen.width * 14 || screen.height * 14 !== screen.width * 14).assertTrue();
    expect(screen.width % (screen.width + 1)).assertEqual(screen.width);
    expect(Math.floor(screen.width / 14) <= screen.width).assertTrue();
  });
  });
}
