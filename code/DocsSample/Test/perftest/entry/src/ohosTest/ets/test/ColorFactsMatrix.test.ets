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
import { bundleManager } from '@kit.AbilityKit';
import { common } from '@kit.AbilityKit';
import { preferences } from '@kit.ArkData';
import { fileIo as fs } from '@kit.CoreFileKit';
import { resourceManager } from '@kit.LocalizationKit';
import { UIAbility, contextConstant } from '@kit.AbilityKit';
import { util } from '@kit.ArkTS';
import { selfBundle, findModule, moduleNames, hasModule, entryContext, entryResources, errorCode,
  PngOracle, launchHome, stopHome } from './shared/Probe';
import { ENTRY_MODULE, ERR_RES_NAME_INVALID, ERR_RES_ID_INVALID } from './shared/Probe';
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

export default function colorFactsMatrixTest() {
  describe('colorFactsMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_CLR_0001
   * @tc.name      testColorFacts0001
   * @tc.desc      Window color keeps alpha
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testColorFacts0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testColorFacts0001', 'color alpha');
    const res: resourceManager.ResourceManager = entryResources();
    const color: number = res.getColorByNameSync('start_window_background');
    expect((color >>> 24) & 0xFF).assertEqual(255);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_CLR_0002
   * @tc.name      testColorFacts0002
   * @tc.desc      Window color keeps channels
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testColorFacts0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testColorFacts0002', 'color channels');
    const res: resourceManager.ResourceManager = entryResources();
    const color: number = res.getColorByNameSync('start_window_background');
    const r: number = (color >>> 16) & 0xFF;
    const g: number = (color >>> 8) & 0xFF;
    const b: number = color & 0xFF;
    expect(r === g && g === b).assertTrue();
    expect(r === 0 || r === 255).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_CLR_0003
   * @tc.name      testColorFacts0003
   * @tc.desc      Window color keeps hex form
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testColorFacts0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testColorFacts0003', 'color hex form');
    const res: resourceManager.ResourceManager = entryResources();
    const color: number = res.getColorByNameSync('start_window_background');
    expect(['FFFFFFFF', 'FF000000'].includes((color >>> 0).toString(16).toUpperCase())).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_CLR_0004
   * @tc.name      testColorFacts0004
   * @tc.desc      Window color keeps opaque
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testColorFacts0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testColorFacts0004', 'color opaque');
    const res: resourceManager.ResourceManager = entryResources();
    const color: number = res.getColorByNameSync('start_window_background');
    expect(color >>> 24).assertEqual(255);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_CLR_0005
   * @tc.name      testColorFacts0005
   * @tc.desc      Window color keeps name equals id
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testColorFacts0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testColorFacts0005', 'color name equals id');
    const res: resourceManager.ResourceManager = entryResources();
    const color: number = res.getColorByNameSync('start_window_background');
    expect(res.getColorSync($r('app.color.start_window_background').id)).assertEqual(color);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_CLR_0006
   * @tc.name      testColorFacts0006
   * @tc.desc      Window color keeps stable read
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testColorFacts0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testColorFacts0006', 'color stable read');
    const res: resourceManager.ResourceManager = entryResources();
    const color: number = res.getColorByNameSync('start_window_background');
    const again: number = res.getColorByNameSync('start_window_background');
    expect(again).assertEqual(color);
    expect(again >>> 24).assertEqual(color >>> 24);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_CLR_0007
   * @tc.name      testColorFacts0007
   * @tc.desc      Window color keeps grey equality
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testColorFacts0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testColorFacts0007', 'color grey equality');
    const res: resourceManager.ResourceManager = entryResources();
    const color: number = res.getColorByNameSync('start_window_background');
    const r: number = (color >>> 16) & 0xFF;
    const g: number = (color >>> 8) & 0xFF;
    const b: number = color & 0xFF;
    expect(r === g && g === b).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_CLR_0008
   * @tc.name      testColorFacts0008
   * @tc.desc      Window color keeps sum extremes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testColorFacts0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testColorFacts0008', 'color sum extremes');
    const res: resourceManager.ResourceManager = entryResources();
    const color: number = res.getColorByNameSync('start_window_background');
    const r: number = (color >>> 16) & 0xFF;
    const g: number = (color >>> 8) & 0xFF;
    const b: number = color & 0xFF;
    expect(r + g + b === 765 || r + g + b === 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_CLR_0009
   * @tc.name      testColorFacts0009
   * @tc.desc      Window color keeps full tone
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testColorFacts0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testColorFacts0009', 'color full tone');
    const res: resourceManager.ResourceManager = entryResources();
    const color: number = res.getColorByNameSync('start_window_background');
    expect([0xFFFFFFFF, 0xFF000000].includes(color >>> 0)).assertTrue();
    const rgb: number = color & 0xFFFFFF;
    expect(rgb === 0xFFFFFF || rgb === 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_CLR_0010
   * @tc.name      testColorFacts0010
   * @tc.desc      Window color keeps theme extreme
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testColorFacts0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testColorFacts0010', 'color theme extreme');
    const res: resourceManager.ResourceManager = entryResources();
    const color: number = res.getColorByNameSync('start_window_background');
    expect((color >>> 0) === 0xFFFFFFFF || (color >>> 0) === 0xFF000000).assertTrue();
    expect(color !== 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_CLR_0011
   * @tc.name      testColorFacts0011
   * @tc.desc      Color lookup rejects bad names
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testColorFacts0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testColorFacts0011', 'color bad name');
    const res: resourceManager.ResourceManager = entryResources();
    expect(errorCode(() => {
      res.getColorByNameSync('start_window_background_2');
    })).assertEqual(ERR_RES_NAME_INVALID);
    expect(errorCode(() => {
      res.getColorByNameSync('Page_Text_Color');
    })).assertEqual(ERR_RES_NAME_INVALID);
    expect(res.getColorByNameSync('start_window_background') >>> 0).assertEqual(0xFFFFFFFF);
  });
  });
}
