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
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { resourceManager } from '@kit.LocalizationKit';
import { entryContext } from './shared/AppProbe';
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

export default function harStringMatrixTest() {
  describe('harStringMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0001
   * @tc.name      testHarString0001
   * @tc.desc      String resource module_desc keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarString0001', 'module_desc length');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('module_desc');
    expect(text.length).assertEqual(18);
    expect(res.getStringByNameSync('module_desc').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0002
   * @tc.name      testHarString0002
   * @tc.desc      String resource module_desc keeps char at zero
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarString0002', 'module_desc char at zero');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('module_desc');
    expect(text.charAt(0)).assertEqual('m');
    expect(res.getStringByNameSync('module_desc').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0003
   * @tc.name      testHarString0003
   * @tc.desc      String resource module_desc keeps tail keeps end
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarString0003', 'module_desc tail keeps end');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('module_desc');
    expect(text.substring(text.length - 2)).assertEqual('on');
    expect(res.getStringByNameSync('module_desc').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0004
   * @tc.name      testHarString0004
   * @tc.desc      String resource module_desc keeps space split count
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarString0004', 'module_desc space split count');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('module_desc');
    expect(text.split(' ').length).assertEqual(2);
    expect(res.getStringByNameSync('module_desc').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0005
   * @tc.name      testHarString0005
   * @tc.desc      String resource module_desc keeps index of e
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarString0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarString0005', 'module_desc index of e');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('module_desc');
    expect(text.indexOf('e')).assertEqual(5);
    expect(res.getStringByNameSync('module_desc').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0006
   * @tc.name      testHarString0006
   * @tc.desc      String resource module_desc keeps upper keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarString0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarString0006', 'module_desc upper keeps length');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('module_desc');
    expect(text.toUpperCase().length).assertEqual(text.length);
    expect(res.getStringByNameSync('module_desc').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0007
   * @tc.name      testHarString0007
   * @tc.desc      String resource module_desc keeps trim keeps value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarString0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarString0007', 'module_desc trim keeps value');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('module_desc');
    expect(text.trim()).assertEqual('module description');
    expect(res.getStringByNameSync('module_desc').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0008
   * @tc.name      testHarString0008
   * @tc.desc      String resource module_desc keeps code sum
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarString0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarString0008', 'module_desc code sum');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('module_desc');
    let sum: number = 0;
    for (let i: number = 0; i < text.length; i++) {
      sum += text.charCodeAt(i);
    }
    expect(sum).assertEqual(1866);
    expect(res.getStringByNameSync('module_desc').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0009
   * @tc.name      testHarString0009
   * @tc.desc      String resource module_desc keeps prefix three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarString0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarString0009', 'module_desc prefix three');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('module_desc');
    expect(text.startsWith('mod')).assertTrue();
    expect(res.getStringByNameSync('module_desc').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0010
   * @tc.name      testHarString0010
   * @tc.desc      String resource module_desc keeps repeat once
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarString0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarString0010', 'module_desc repeat once');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('module_desc');
    expect(text.repeat(1)).assertEqual(text);
    expect(res.getStringByNameSync('module_desc').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0011
   * @tc.name      testHarString0011
   * @tc.desc      String resource ApplicationAbility_desc keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarString0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarString0011', 'ApplicationAbility_desc length');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('ApplicationAbility_desc');
    expect(text.length).assertEqual(11);
    expect(res.getStringByNameSync('ApplicationAbility_desc').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0012
   * @tc.name      testHarString0012
   * @tc.desc      String resource ApplicationAbility_desc keeps char at zero
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarString0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarString0012', 'ApplicationAbility_desc char at zero');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('ApplicationAbility_desc');
    expect(text.charAt(0)).assertEqual('d');
    expect(res.getStringByNameSync('ApplicationAbility_desc').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0013
   * @tc.name      testHarString0013
   * @tc.desc      String resource ApplicationAbility_desc keeps tail keeps end
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarString0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarString0013', 'ApplicationAbility_desc tail keeps end');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('ApplicationAbility_desc');
    expect(text.substring(text.length - 2)).assertEqual('on');
    expect(res.getStringByNameSync('ApplicationAbility_desc').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0014
   * @tc.name      testHarString0014
   * @tc.desc      String resource ApplicationAbility_desc keeps space split count
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarString0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarString0014', 'ApplicationAbility_desc space split count');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('ApplicationAbility_desc');
    expect(text.split(' ').length).assertEqual(1);
    expect(res.getStringByNameSync('ApplicationAbility_desc').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0015
   * @tc.name      testHarString0015
   * @tc.desc      String resource ApplicationAbility_desc keeps index of e
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarString0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarString0015', 'ApplicationAbility_desc index of e');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('ApplicationAbility_desc');
    expect(text.indexOf('e')).assertEqual(1);
    expect(res.getStringByNameSync('ApplicationAbility_desc').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0016
   * @tc.name      testHarString0016
   * @tc.desc      String resource ApplicationAbility_desc keeps upper keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarString0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarString0016', 'ApplicationAbility_desc upper keeps length');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('ApplicationAbility_desc');
    expect(text.toUpperCase().length).assertEqual(text.length);
    expect(res.getStringByNameSync('ApplicationAbility_desc').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0017
   * @tc.name      testHarString0017
   * @tc.desc      String resource ApplicationAbility_desc keeps trim keeps value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarString0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarString0017', 'ApplicationAbility_desc trim keeps value');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('ApplicationAbility_desc');
    expect(text.trim()).assertEqual('description');
    expect(res.getStringByNameSync('ApplicationAbility_desc').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0018
   * @tc.name      testHarString0018
   * @tc.desc      String resource ApplicationAbility_desc keeps code sum
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarString0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarString0018', 'ApplicationAbility_desc code sum');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('ApplicationAbility_desc');
    let sum: number = 0;
    for (let i: number = 0; i < text.length; i++) {
      sum += text.charCodeAt(i);
    }
    expect(sum).assertEqual(1188);
    expect(res.getStringByNameSync('ApplicationAbility_desc').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0019
   * @tc.name      testHarString0019
   * @tc.desc      String resource ApplicationAbility_desc keeps prefix three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarString0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarString0019', 'ApplicationAbility_desc prefix three');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('ApplicationAbility_desc');
    expect(text.startsWith('des')).assertTrue();
    expect(res.getStringByNameSync('ApplicationAbility_desc').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0020
   * @tc.name      testHarString0020
   * @tc.desc      String resource ApplicationAbility_desc keeps repeat once
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarString0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarString0020', 'ApplicationAbility_desc repeat once');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('ApplicationAbility_desc');
    expect(text.repeat(1)).assertEqual(text);
    expect(res.getStringByNameSync('ApplicationAbility_desc').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0021
   * @tc.name      testHarString0021
   * @tc.desc      String resource ApplicationAbility_label keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarString0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarString0021', 'ApplicationAbility_label length');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('ApplicationAbility_label');
    expect(text.length).assertEqual(5);
    expect(res.getStringByNameSync('ApplicationAbility_label').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0022
   * @tc.name      testHarString0022
   * @tc.desc      String resource ApplicationAbility_label keeps char at zero
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarString0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarString0022', 'ApplicationAbility_label char at zero');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('ApplicationAbility_label');
    expect(text.charAt(0)).assertEqual('l');
    expect(res.getStringByNameSync('ApplicationAbility_label').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0023
   * @tc.name      testHarString0023
   * @tc.desc      String resource ApplicationAbility_label keeps tail keeps end
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarString0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarString0023', 'ApplicationAbility_label tail keeps end');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('ApplicationAbility_label');
    expect(text.substring(text.length - 2)).assertEqual('el');
    expect(res.getStringByNameSync('ApplicationAbility_label').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0024
   * @tc.name      testHarString0024
   * @tc.desc      String resource ApplicationAbility_label keeps space split count
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarString0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarString0024', 'ApplicationAbility_label space split count');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('ApplicationAbility_label');
    expect(text.split(' ').length).assertEqual(1);
    expect(res.getStringByNameSync('ApplicationAbility_label').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0025
   * @tc.name      testHarString0025
   * @tc.desc      String resource ApplicationAbility_label keeps index of e
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarString0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarString0025', 'ApplicationAbility_label index of e');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('ApplicationAbility_label');
    expect(text.indexOf('e')).assertEqual(3);
    expect(res.getStringByNameSync('ApplicationAbility_label').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0026
   * @tc.name      testHarString0026
   * @tc.desc      String resource ApplicationAbility_label keeps upper keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarString0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarString0026', 'ApplicationAbility_label upper keeps length');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('ApplicationAbility_label');
    expect(text.toUpperCase().length).assertEqual(text.length);
    expect(res.getStringByNameSync('ApplicationAbility_label').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0027
   * @tc.name      testHarString0027
   * @tc.desc      String resource ApplicationAbility_label keeps trim keeps value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarString0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarString0027', 'ApplicationAbility_label trim keeps value');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('ApplicationAbility_label');
    expect(text.trim()).assertEqual('label');
    expect(res.getStringByNameSync('ApplicationAbility_label').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0028
   * @tc.name      testHarString0028
   * @tc.desc      String resource ApplicationAbility_label keeps code sum
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarString0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarString0028', 'ApplicationAbility_label code sum');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('ApplicationAbility_label');
    let sum: number = 0;
    for (let i: number = 0; i < text.length; i++) {
      sum += text.charCodeAt(i);
    }
    expect(sum).assertEqual(512);
    expect(res.getStringByNameSync('ApplicationAbility_label').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0029
   * @tc.name      testHarString0029
   * @tc.desc      String resource ApplicationAbility_label keeps prefix three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarString0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarString0029', 'ApplicationAbility_label prefix three');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('ApplicationAbility_label');
    expect(text.startsWith('lab')).assertTrue();
    expect(res.getStringByNameSync('ApplicationAbility_label').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0030
   * @tc.name      testHarString0030
   * @tc.desc      String resource ApplicationAbility_label keeps repeat once
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarString0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarString0030', 'ApplicationAbility_label repeat once');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('ApplicationAbility_label');
    expect(text.repeat(1)).assertEqual(text);
    expect(res.getStringByNameSync('ApplicationAbility_label').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0031
   * @tc.name      testHarString0031
   * @tc.desc      String resource app_name keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarString0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarString0031', 'app_name length');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('app_name');
    expect(text.length).assertEqual(20);
    expect(res.getStringByNameSync('app_name').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0032
   * @tc.name      testHarString0032
   * @tc.desc      String resource app_name keeps char at zero
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarString0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarString0032', 'app_name char at zero');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('app_name');
    expect(text.charAt(0)).assertEqual('s');
    expect(res.getStringByNameSync('app_name').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0033
   * @tc.name      testHarString0033
   * @tc.desc      String resource app_name keeps tail keeps end
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarString0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarString0033', 'app_name tail keeps end');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('app_name');
    expect(text.substring(text.length - 2)).assertEqual('ar');
    expect(res.getStringByNameSync('app_name').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0034
   * @tc.name      testHarString0034
   * @tc.desc      String resource app_name keeps space split count
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarString0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarString0034', 'app_name space split count');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('app_name');
    expect(text.split(' ').length).assertEqual(1);
    expect(res.getStringByNameSync('app_name').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0035
   * @tc.name      testHarString0035
   * @tc.desc      String resource app_name keeps index of e
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarString0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarString0035', 'app_name index of e');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('app_name');
    expect(text.indexOf('e')).assertEqual(5);
    expect(res.getStringByNameSync('app_name').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0036
   * @tc.name      testHarString0036
   * @tc.desc      String resource app_name keeps upper keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarString0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarString0036', 'app_name upper keeps length');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('app_name');
    expect(text.toUpperCase().length).assertEqual(text.length);
    expect(res.getStringByNameSync('app_name').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0037
   * @tc.name      testHarString0037
   * @tc.desc      String resource app_name keeps trim keeps value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarString0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarString0037', 'app_name trim keeps value');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('app_name');
    expect(text.trim()).assertEqual('simple007_hap_to_har');
    expect(res.getStringByNameSync('app_name').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0038
   * @tc.name      testHarString0038
   * @tc.desc      String resource app_name keeps code sum
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarString0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarString0038', 'app_name code sum');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('app_name');
    let sum: number = 0;
    for (let i: number = 0; i < text.length; i++) {
      sum += text.charCodeAt(i);
    }
    expect(sum).assertEqual(1941);
    expect(res.getStringByNameSync('app_name').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0039
   * @tc.name      testHarString0039
   * @tc.desc      String resource app_name keeps prefix three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarString0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarString0039', 'app_name prefix three');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('app_name');
    expect(text.startsWith('sim')).assertTrue();
    expect(res.getStringByNameSync('app_name').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0040
   * @tc.name      testHarString0040
   * @tc.desc      String resource app_name keeps repeat once
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarString0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarString0040', 'app_name repeat once');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const text: string = res.getStringByNameSync('app_name');
    expect(text.repeat(1)).assertEqual(text);
    expect(res.getStringByNameSync('app_name').length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0041
   * @tc.name      testHarString0041
   * @tc.desc      Unknown string name with upper case is rejected
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarString0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarString0041', 'missing string upper case');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    let code: number = 0;
    try {
      res.getStringByNameSync('MODULE_DESC');
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(9001003);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0042
   * @tc.name      testHarString0042
   * @tc.desc      Unknown string name with mixed case is rejected
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarString0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarString0042', 'missing string mixed case');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    let code: number = 0;
    try {
      res.getStringByNameSync('Module_Desc');
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(9001003);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0043
   * @tc.name      testHarString0043
   * @tc.desc      Unknown string name with dash is rejected
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarString0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarString0043', 'missing string dash');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    let code: number = 0;
    try {
      res.getStringByNameSync('module-description');
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(9001003);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0044
   * @tc.name      testHarString0044
   * @tc.desc      Unknown string name with trailing space is rejected
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarString0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarString0044', 'missing string trailing space');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    let code: number = 0;
    try {
      res.getStringByNameSync('module_desc ');
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(9001003);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0045
   * @tc.name      testHarString0045
   * @tc.desc      Unknown string name with leading space is rejected
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarString0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarString0045', 'missing string leading space');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    let code: number = 0;
    try {
      res.getStringByNameSync(' module_desc');
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(9001003);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0046
   * @tc.name      testHarString0046
   * @tc.desc      Unknown string name with digit is rejected
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarString0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarString0046', 'missing string digit');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    let code: number = 0;
    try {
      res.getStringByNameSync('module_desc2');
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(9001003);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0047
   * @tc.name      testHarString0047
   * @tc.desc      Unknown string name with camel is rejected
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarString0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarString0047', 'missing string camel');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    let code: number = 0;
    try {
      res.getStringByNameSync('moduleDescription');
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(9001003);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0048
   * @tc.name      testHarString0048
   * @tc.desc      Unknown string name with har prefix is rejected
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarString0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarString0048', 'missing string har prefix');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    let code: number = 0;
    try {
      res.getStringByNameSync('entry_module_desc');
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(9001003);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0049
   * @tc.name      testHarString0049
   * @tc.desc      Unknown string name with app prefix is rejected
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarString0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarString0049', 'missing string app prefix');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    let code: number = 0;
    try {
      res.getStringByNameSync('application_desc');
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(9001003);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0050
   * @tc.name      testHarString0050
   * @tc.desc      Unknown string name with no underscore is rejected
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarString0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarString0050', 'missing string no underscore');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    let code: number = 0;
    try {
      res.getStringByNameSync('moduledesc');
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(9001003);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0051
   * @tc.name      testHarString0051
   * @tc.desc      Unknown string name with head upper is rejected
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarString0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarString0051', 'missing string head upper');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    let code: number = 0;
    try {
      res.getStringByNameSync('MODULE_desc');
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(9001003);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARSTR_0052
   * @tc.name      testHarString0052
   * @tc.desc      Unknown string name with tail upper is rejected
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarString0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarString0052', 'missing string tail upper');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    let code: number = 0;
    try {
      res.getStringByNameSync('module_DESC');
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(9001003);
  });
  });
}
