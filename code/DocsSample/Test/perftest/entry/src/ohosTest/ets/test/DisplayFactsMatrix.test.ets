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
   * @tc.number    SUB_BMS_PERFTEST_DSP_0001
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
   * @tc.number    SUB_BMS_PERFTEST_DSP_0002
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
   * @tc.number    SUB_BMS_PERFTEST_DSP_0003
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
   * @tc.number    SUB_BMS_PERFTEST_DSP_0004
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
   * @tc.number    SUB_BMS_PERFTEST_DSP_0005
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
   * @tc.number    SUB_BMS_PERFTEST_DSP_0006
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
   * @tc.number    SUB_BMS_PERFTEST_DSP_0007
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
   * @tc.number    SUB_BMS_PERFTEST_DSP_0008
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
   * @tc.number    SUB_BMS_PERFTEST_DSP_0011
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
   * @tc.number    SUB_BMS_PERFTEST_DSP_0012
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
   * @tc.number    SUB_BMS_PERFTEST_DSP_0013
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
   * @tc.number    SUB_BMS_PERFTEST_DSP_0014
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
   * @tc.number    SUB_BMS_PERFTEST_DSP_0015
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
   * @tc.number    SUB_BMS_PERFTEST_DSP_0016
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
   * @tc.number    SUB_BMS_PERFTEST_DSP_0017
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
