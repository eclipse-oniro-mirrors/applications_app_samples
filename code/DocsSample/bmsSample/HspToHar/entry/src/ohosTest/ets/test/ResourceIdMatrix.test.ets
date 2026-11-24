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
   * @tc.number    SUB_BMS_HSPTOHAR_RID_0001
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
   * @tc.number    SUB_BMS_HSPTOHAR_RID_0002
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
   * @tc.number    SUB_BMS_HSPTOHAR_RID_0003
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
   * @tc.number    SUB_BMS_HSPTOHAR_RID_0004
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
   * @tc.number    SUB_BMS_HSPTOHAR_RID_0005
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
   * @tc.number    SUB_BMS_HSPTOHAR_RID_0006
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
   * @tc.number    SUB_BMS_HSPTOHAR_RID_0007
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
   * @tc.number    SUB_BMS_HSPTOHAR_RID_0008
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
   * @tc.number    SUB_BMS_HSPTOHAR_RID_0009
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
   * @tc.number    SUB_BMS_HSPTOHAR_RID_0010
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
   * @tc.number    SUB_BMS_HSPTOHAR_RID_0011
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
   * @tc.number    SUB_BMS_HSPTOHAR_RID_0012
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
   * @tc.number    SUB_BMS_HSPTOHAR_RID_0013
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
   * @tc.number    SUB_BMS_HSPTOHAR_RID_0014
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
   * @tc.number    SUB_BMS_HSPTOHAR_RID_0015
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
   * @tc.number    SUB_BMS_HSPTOHAR_RID_0016
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
   * @tc.number    SUB_BMS_HSPTOHAR_RID_0017
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

  });
}
