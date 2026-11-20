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
import { resourceManager } from '@kit.LocalizationKit';
import { UIAbility, contextConstant } from '@kit.AbilityKit';
import { util } from '@kit.ArkTS';
import { selfBundle, findModule, moduleNames, hasModule, entryResources, libraryResources, errorCode,
  PngOracle, launchHome, stopHome } from './shared/Probe';
import { ENTRY_MODULE, LIBRARY_MODULE, ERR_RES_NAME_INVALID, ERR_RES_ID_INVALID } from './shared/Probe';
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

export default function layeredTextMatrixTest() {
  describe('layeredTextMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_LAY_0001
   * @tc.name      testLayeredText0001
   * @tc.desc      Layered image keeps json keys
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testLayeredText0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testLayeredText0001', 'layered json keys');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('layered_image');
    expect(bytes.length > 50).assertTrue();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const text: string = decoder.decodeToString(bytes);
    expect(text.includes('layered-image')).assertTrue();
    expect(text.includes('background')).assertTrue();
    expect(text.includes('foreground')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_LAY_0002
   * @tc.name      testLayeredText0002
   * @tc.desc      Layered image keeps braces
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testLayeredText0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testLayeredText0002', 'layered braces');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('layered_image');
    expect(bytes.length > 50).assertTrue();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const text: string = decoder.decodeToString(bytes);
    expect(text.trim().startsWith('{')).assertTrue();
    expect(text.trim().endsWith('}')).assertTrue();
  });



  /**
   * @tc.number    SUB_BMS_HARTOHSP_LAY_0004
   * @tc.name      testLayeredText0004
   * @tc.desc      Layered image keeps counts
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testLayeredText0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testLayeredText0004', 'layered counts');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('layered_image');
    expect(bytes.length > 50).assertTrue();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const text: string = decoder.decodeToString(bytes);
    expect(text.split('{').length).assertEqual(3);
    expect(text.split('}').length).assertEqual(3);
  });


  /**
   * @tc.number    SUB_BMS_HARTOHSP_LAY_0006
   * @tc.name      testLayeredText0006
   * @tc.desc      Layered image keeps quotes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testLayeredText0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testLayeredText0006', 'layered quotes');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('layered_image');
    expect(bytes.length > 50).assertTrue();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const text: string = decoder.decodeToString(bytes);
    expect(text.split(String.fromCharCode(34)).length).assertEqual(11);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_LAY_0007
   * @tc.name      testLayeredText0007
   * @tc.desc      Layered image keeps no nesting
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testLayeredText0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testLayeredText0007', 'layered no nesting');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('layered_image');
    expect(bytes.length > 50).assertTrue();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const text: string = decoder.decodeToString(bytes);
    expect(text.split('layered-image').length).assertEqual(2);
    expect(text.split('$media:').length).assertEqual(3);
  });


  });
}
