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
import { util } from '@kit.ArkTS';
import { resourceManager } from '@kit.LocalizationKit';
import { entryContext, PngOracle } from './shared/Probe';
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

export default function resourceIdMatrixTest() {
  describe('resourceIdMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0001
   * @tc.name      testResourceId0001
   * @tc.desc      String id module_desc literal value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testResourceId0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testResourceId0001', 'module_desc literal value');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.string.module_desc');
    expect(res.getStringSync(ref)).assertEqual('module description');
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0002
   * @tc.name      testResourceId0002
   * @tc.desc      String id module_desc literal length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testResourceId0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testResourceId0002', 'module_desc literal length');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.string.module_desc');
    expect(res.getStringSync(ref).length).assertEqual(18);
    expect(res.getStringByNameSync('module_desc').length).assertEqual(18);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0003
   * @tc.name      testResourceId0003
   * @tc.desc      String id module_desc name lookup
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testResourceId0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testResourceId0003', 'module_desc name lookup');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.string.module_desc');
    expect(res.getStringSync(ref)).assertEqual(res.getStringByNameSync('module_desc'));
    expect(ref.id > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0004
   * @tc.name      testResourceId0004
   * @tc.desc      String id module_desc head char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testResourceId0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testResourceId0004', 'module_desc head char');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.string.module_desc');
    expect(res.getStringSync(ref).charAt(0)).assertEqual('m');
    expect(res.getStringSync(ref).indexOf('m')).assertEqual(0);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0005
   * @tc.name      testResourceId0005
   * @tc.desc      String id EntryAbility_desc literal value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testResourceId0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testResourceId0005', 'EntryAbility_desc literal value');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.string.EntryAbility_desc');
    expect(res.getStringSync(ref)).assertEqual('description');
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0006
   * @tc.name      testResourceId0006
   * @tc.desc      String id EntryAbility_desc literal length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testResourceId0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testResourceId0006', 'EntryAbility_desc literal length');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.string.EntryAbility_desc');
    expect(res.getStringSync(ref).length).assertEqual(11);
    expect(res.getStringByNameSync('EntryAbility_desc').length).assertEqual(11);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0007
   * @tc.name      testResourceId0007
   * @tc.desc      String id EntryAbility_desc name lookup
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testResourceId0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testResourceId0007', 'EntryAbility_desc name lookup');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.string.EntryAbility_desc');
    expect(res.getStringSync(ref)).assertEqual(res.getStringByNameSync('EntryAbility_desc'));
    expect(ref.id > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0008
   * @tc.name      testResourceId0008
   * @tc.desc      String id EntryAbility_desc head char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testResourceId0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testResourceId0008', 'EntryAbility_desc head char');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.string.EntryAbility_desc');
    expect(res.getStringSync(ref).charAt(0)).assertEqual('d');
    expect(res.getStringSync(ref).indexOf('d')).assertEqual(0);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0009
   * @tc.name      testResourceId0009
   * @tc.desc      String id EntryAbility_label literal value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testResourceId0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testResourceId0009', 'EntryAbility_label literal value');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.string.EntryAbility_label');
    expect(res.getStringSync(ref)).assertEqual('label');
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0010
   * @tc.name      testResourceId0010
   * @tc.desc      String id EntryAbility_label literal length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testResourceId0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testResourceId0010', 'EntryAbility_label literal length');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.string.EntryAbility_label');
    expect(res.getStringSync(ref).length).assertEqual(5);
    expect(res.getStringByNameSync('EntryAbility_label').length).assertEqual(5);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0011
   * @tc.name      testResourceId0011
   * @tc.desc      String id EntryAbility_label name lookup
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testResourceId0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testResourceId0011', 'EntryAbility_label name lookup');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.string.EntryAbility_label');
    expect(res.getStringSync(ref)).assertEqual(res.getStringByNameSync('EntryAbility_label'));
    expect(ref.id > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0012
   * @tc.name      testResourceId0012
   * @tc.desc      String id EntryAbility_label head char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testResourceId0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testResourceId0012', 'EntryAbility_label head char');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.string.EntryAbility_label');
    expect(res.getStringSync(ref).charAt(0)).assertEqual('l');
    expect(res.getStringSync(ref).indexOf('l')).assertEqual(0);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0013
   * @tc.name      testResourceId0013
   * @tc.desc      Color id keeps color id matches name
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testResourceId0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testResourceId0013', 'color color id matches name');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.color.start_window_background');
    expect(res.getColorSync(ref)).assertEqual(res.getColorByNameSync('start_window_background'));
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0014
   * @tc.name      testResourceId0014
   * @tc.desc      Color id keeps color id positive
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testResourceId0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testResourceId0014', 'color color id positive');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.color.start_window_background');
    expect(ref.id > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0015
   * @tc.name      testResourceId0015
   * @tc.desc      Color id keeps color alpha
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testResourceId0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testResourceId0015', 'color color alpha');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.color.start_window_background');
    const color: number = res.getColorSync(ref);
    expect((color >>> 24) & 0xFF).assertEqual(255);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0016
   * @tc.name      testResourceId0016
   * @tc.desc      Color id keeps color stable
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testResourceId0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testResourceId0016', 'color color stable');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.color.start_window_background');
    expect(res.getColorSync(ref)).assertEqual(res.getColorSync(ref));
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0017
   * @tc.name      testResourceId0017
   * @tc.desc      Color id keeps color channels
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testResourceId0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testResourceId0017', 'color color channels');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.color.start_window_background');
    const color: number = res.getColorSync(ref);
    expect((color >>> 16) & 0xFF).assertEqual((color >>> 8) & 0xFF);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0018
   * @tc.name      testResourceId0018
   * @tc.desc      Media id background id matches name
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testResourceId0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testResourceId0018', 'background id matches name');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.media.background');
    const bytes: Uint8Array = res.getMediaContentSync(ref.id);
    expect(bytes.length).assertEqual(res.getMediaByNameSync('background').length);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0019
   * @tc.name      testResourceId0019
   * @tc.desc      Media id background id positive
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testResourceId0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testResourceId0019', 'background id positive');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.media.background');
    const bytes: Uint8Array = res.getMediaContentSync(ref.id);
    expect(ref.id > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0020
   * @tc.name      testResourceId0020
   * @tc.desc      Media id background size stable
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testResourceId0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testResourceId0020', 'background size stable');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.media.background');
    const bytes: Uint8Array = res.getMediaContentSync(ref.id);
    expect(bytes.length).assertEqual(91942);
    expect(res.getMediaContentSync(ref.id).length).assertEqual(bytes.length);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0021
   * @tc.name      testResourceId0021
   * @tc.desc      Media id background signature
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testResourceId0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testResourceId0021', 'background signature');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.media.background');
    const bytes: Uint8Array = res.getMediaContentSync(ref.id);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0022
   * @tc.name      testResourceId0022
   * @tc.desc      Media id background width
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testResourceId0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testResourceId0022', 'background width');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.media.background');
    const bytes: Uint8Array = res.getMediaContentSync(ref.id);
    expect(PngOracle.width(bytes)).assertEqual(1024);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0023
   * @tc.name      testResourceId0023
   * @tc.desc      Media id foreground id matches name
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testResourceId0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testResourceId0023', 'foreground id matches name');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.media.foreground');
    const bytes: Uint8Array = res.getMediaContentSync(ref.id);
    expect(bytes.length).assertEqual(res.getMediaByNameSync('foreground').length);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0024
   * @tc.name      testResourceId0024
   * @tc.desc      Media id foreground id positive
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testResourceId0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testResourceId0024', 'foreground id positive');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.media.foreground');
    const bytes: Uint8Array = res.getMediaContentSync(ref.id);
    expect(ref.id > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0025
   * @tc.name      testResourceId0025
   * @tc.desc      Media id foreground size stable
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testResourceId0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testResourceId0025', 'foreground size stable');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.media.foreground');
    const bytes: Uint8Array = res.getMediaContentSync(ref.id);
    expect(bytes.length).assertEqual(8805);
    expect(res.getMediaContentSync(ref.id).length).assertEqual(bytes.length);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0026
   * @tc.name      testResourceId0026
   * @tc.desc      Media id foreground signature
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testResourceId0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testResourceId0026', 'foreground signature');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.media.foreground');
    const bytes: Uint8Array = res.getMediaContentSync(ref.id);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0027
   * @tc.name      testResourceId0027
   * @tc.desc      Media id foreground width
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testResourceId0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testResourceId0027', 'foreground width');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.media.foreground');
    const bytes: Uint8Array = res.getMediaContentSync(ref.id);
    expect(PngOracle.width(bytes)).assertEqual(1024);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0028
   * @tc.name      testResourceId0028
   * @tc.desc      Media id startIcon id matches name
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testResourceId0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testResourceId0028', 'startIcon id matches name');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.media.startIcon');
    const bytes: Uint8Array = res.getMediaContentSync(ref.id);
    expect(bytes.length).assertEqual(res.getMediaByNameSync('startIcon').length);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0029
   * @tc.name      testResourceId0029
   * @tc.desc      Media id startIcon id positive
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testResourceId0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testResourceId0029', 'startIcon id positive');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.media.startIcon');
    const bytes: Uint8Array = res.getMediaContentSync(ref.id);
    expect(ref.id > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0030
   * @tc.name      testResourceId0030
   * @tc.desc      Media id startIcon size stable
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testResourceId0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testResourceId0030', 'startIcon size stable');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.media.startIcon');
    const bytes: Uint8Array = res.getMediaContentSync(ref.id);
    expect(bytes.length).assertEqual(20093);
    expect(res.getMediaContentSync(ref.id).length).assertEqual(bytes.length);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0031
   * @tc.name      testResourceId0031
   * @tc.desc      Media id startIcon signature
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testResourceId0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testResourceId0031', 'startIcon signature');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.media.startIcon');
    const bytes: Uint8Array = res.getMediaContentSync(ref.id);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0032
   * @tc.name      testResourceId0032
   * @tc.desc      Media id startIcon width
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testResourceId0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testResourceId0032', 'startIcon width');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.media.startIcon');
    const bytes: Uint8Array = res.getMediaContentSync(ref.id);
    expect(PngOracle.width(bytes)).assertEqual(144);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0033
   * @tc.name      testResourceId0033
   * @tc.desc      Layered id keeps layered id loads
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testResourceId0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testResourceId0033', 'layered layered id loads');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.media.layered_image');
    const bytes: Uint8Array = res.getMediaContentSync(ref.id);
    expect(bytes.length > 50).assertTrue();
    expect(ref.id > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_RID_0034
   * @tc.name      testResourceId0034
   * @tc.desc      Layered id keeps layered text root
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testResourceId0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testResourceId0034', 'layered layered text root');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.media.layered_image');
    const bytes: Uint8Array = res.getMediaContentSync(ref.id);
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const text: string = decoder.decodeToString(bytes);
    expect(text.trim().startsWith('{')).assertTrue();
  });
  });
}
