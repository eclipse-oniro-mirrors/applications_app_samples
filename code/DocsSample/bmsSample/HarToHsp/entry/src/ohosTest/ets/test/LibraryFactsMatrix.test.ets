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

export default function libraryFactsMatrixTest() {
  describe('libraryFactsMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_LIB_0001
   * @tc.name      testLibraryFacts0001
   * @tc.desc      Library module exposes page string
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testLibraryFacts0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testLibraryFacts0001', 'library page string');
    const info: bundleManager.BundleInfo = await selfBundle();
    if (!hasModule(info, 'library')) {
      expect(moduleNames(info).includes('library')).assertFalse();
      return;
    }
    const res: resourceManager.ResourceManager = libraryResources();
    const text: string = res.getStringByNameSync('page_show');
    expect(text).assertEqual('page from package');
    expect(text.length).assertEqual(17);
    expect(text.split(' ').length).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_LIB_0002
   * @tc.name      testLibraryFacts0002
   * @tc.desc      Library page string keeps first word
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testLibraryFacts0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testLibraryFacts0002', 'library first word');
    const info: bundleManager.BundleInfo = await selfBundle();
    if (!hasModule(info, 'library')) {
      expect(moduleNames(info).includes('library')).assertFalse();
      return;
    }
    const res: resourceManager.ResourceManager = libraryResources();
    const text: string = res.getStringByNameSync('page_show');
    expect(text.split(' ')[0]).assertEqual('page');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_LIB_0003
   * @tc.name      testLibraryFacts0003
   * @tc.desc      Library page string keeps middle word
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testLibraryFacts0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testLibraryFacts0003', 'library middle word');
    const info: bundleManager.BundleInfo = await selfBundle();
    if (!hasModule(info, 'library')) {
      expect(moduleNames(info).includes('library')).assertFalse();
      return;
    }
    const res: resourceManager.ResourceManager = libraryResources();
    const text: string = res.getStringByNameSync('page_show');
    expect(text.split(' ')[1]).assertEqual('from');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_LIB_0004
   * @tc.name      testLibraryFacts0004
   * @tc.desc      Library page string keeps last word
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testLibraryFacts0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testLibraryFacts0004', 'library last word');
    const info: bundleManager.BundleInfo = await selfBundle();
    if (!hasModule(info, 'library')) {
      expect(moduleNames(info).includes('library')).assertFalse();
      return;
    }
    const res: resourceManager.ResourceManager = libraryResources();
    const text: string = res.getStringByNameSync('page_show');
    expect(text.split(' ')[2]).assertEqual('package');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_LIB_0005
   * @tc.name      testLibraryFacts0005
   * @tc.desc      Library page string keeps first char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testLibraryFacts0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testLibraryFacts0005', 'library first char');
    const info: bundleManager.BundleInfo = await selfBundle();
    if (!hasModule(info, 'library')) {
      expect(moduleNames(info).includes('library')).assertFalse();
      return;
    }
    const res: resourceManager.ResourceManager = libraryResources();
    const text: string = res.getStringByNameSync('page_show');
    expect(text.charAt(0)).assertEqual('p');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_LIB_0006
   * @tc.name      testLibraryFacts0006
   * @tc.desc      Library page string keeps last char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testLibraryFacts0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testLibraryFacts0006', 'library last char');
    const info: bundleManager.BundleInfo = await selfBundle();
    if (!hasModule(info, 'library')) {
      expect(moduleNames(info).includes('library')).assertFalse();
      return;
    }
    const res: resourceManager.ResourceManager = libraryResources();
    const text: string = res.getStringByNameSync('page_show');
    expect(text.charAt(text.length - 1)).assertEqual('e');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_LIB_0007
   * @tc.name      testLibraryFacts0007
   * @tc.desc      Library page string keeps uppercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testLibraryFacts0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testLibraryFacts0007', 'library uppercase');
    const info: bundleManager.BundleInfo = await selfBundle();
    if (!hasModule(info, 'library')) {
      expect(moduleNames(info).includes('library')).assertFalse();
      return;
    }
    const res: resourceManager.ResourceManager = libraryResources();
    const text: string = res.getStringByNameSync('page_show');
    expect(text.toUpperCase()).assertEqual('PAGE FROM PACKAGE');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_LIB_0008
   * @tc.name      testLibraryFacts0008
   * @tc.desc      Library page string keeps starts with page
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testLibraryFacts0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testLibraryFacts0008', 'library starts with page');
    const info: bundleManager.BundleInfo = await selfBundle();
    if (!hasModule(info, 'library')) {
      expect(moduleNames(info).includes('library')).assertFalse();
      return;
    }
    const res: resourceManager.ResourceManager = libraryResources();
    const text: string = res.getStringByNameSync('page_show');
    expect(text.startsWith('page')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_LIB_0009
   * @tc.name      testLibraryFacts0009
   * @tc.desc      Library page string keeps ends with package
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testLibraryFacts0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testLibraryFacts0009', 'library ends with package');
    const info: bundleManager.BundleInfo = await selfBundle();
    if (!hasModule(info, 'library')) {
      expect(moduleNames(info).includes('library')).assertFalse();
      return;
    }
    const res: resourceManager.ResourceManager = libraryResources();
    const text: string = res.getStringByNameSync('page_show');
    expect(text.endsWith('package')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_LIB_0010
   * @tc.name      testLibraryFacts0010
   * @tc.desc      Library page string keeps index of from
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testLibraryFacts0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testLibraryFacts0010', 'library index of from');
    const info: bundleManager.BundleInfo = await selfBundle();
    if (!hasModule(info, 'library')) {
      expect(moduleNames(info).includes('library')).assertFalse();
      return;
    }
    const res: resourceManager.ResourceManager = libraryResources();
    const text: string = res.getStringByNameSync('page_show');
    expect(text.indexOf('from')).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_LIB_0011
   * @tc.name      testLibraryFacts0011
   * @tc.desc      Library page string keeps index of package
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testLibraryFacts0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testLibraryFacts0011', 'library index of package');
    const info: bundleManager.BundleInfo = await selfBundle();
    if (!hasModule(info, 'library')) {
      expect(moduleNames(info).includes('library')).assertFalse();
      return;
    }
    const res: resourceManager.ResourceManager = libraryResources();
    const text: string = res.getStringByNameSync('page_show');
    expect(text.indexOf('package')).assertEqual(10);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_LIB_0012
   * @tc.name      testLibraryFacts0012
   * @tc.desc      Library page string keeps substring tail
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testLibraryFacts0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testLibraryFacts0012', 'library substring tail');
    const info: bundleManager.BundleInfo = await selfBundle();
    if (!hasModule(info, 'library')) {
      expect(moduleNames(info).includes('library')).assertFalse();
      return;
    }
    const res: resourceManager.ResourceManager = libraryResources();
    const text: string = res.getStringByNameSync('page_show');
    expect(text.substring(5)).assertEqual('from package');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_LIB_0013
   * @tc.name      testLibraryFacts0013
   * @tc.desc      Library page string keeps slice tail
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testLibraryFacts0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testLibraryFacts0013', 'library slice tail');
    const info: bundleManager.BundleInfo = await selfBundle();
    if (!hasModule(info, 'library')) {
      expect(moduleNames(info).includes('library')).assertFalse();
      return;
    }
    const res: resourceManager.ResourceManager = libraryResources();
    const text: string = res.getStringByNameSync('page_show');
    expect(text.slice(10)).assertEqual('package');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_LIB_0014
   * @tc.name      testLibraryFacts0014
   * @tc.desc      Library page string keeps replace first
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testLibraryFacts0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testLibraryFacts0014', 'library replace first');
    const info: bundleManager.BundleInfo = await selfBundle();
    if (!hasModule(info, 'library')) {
      expect(moduleNames(info).includes('library')).assertFalse();
      return;
    }
    const res: resourceManager.ResourceManager = libraryResources();
    const text: string = res.getStringByNameSync('page_show');
    expect(text.replace('page', 'view')).assertEqual('view from package');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_LIB_0015
   * @tc.name      testLibraryFacts0015
   * @tc.desc      Library page string keeps split join
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testLibraryFacts0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testLibraryFacts0015', 'library split join');
    const info: bundleManager.BundleInfo = await selfBundle();
    if (!hasModule(info, 'library')) {
      expect(moduleNames(info).includes('library')).assertFalse();
      return;
    }
    const res: resourceManager.ResourceManager = libraryResources();
    const text: string = res.getStringByNameSync('page_show');
    expect(text.split(' ').join('/')).assertEqual('page/from/package');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_LIB_0016
   * @tc.name      testLibraryFacts0016
   * @tc.desc      Library page string keeps char codes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testLibraryFacts0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testLibraryFacts0016', 'library char codes');
    const info: bundleManager.BundleInfo = await selfBundle();
    if (!hasModule(info, 'library')) {
      expect(moduleNames(info).includes('library')).assertFalse();
      return;
    }
    const res: resourceManager.ResourceManager = libraryResources();
    const text: string = res.getStringByNameSync('page_show');
    expect(text.charCodeAt(0)).assertEqual(112);
    expect(text.charCodeAt(1)).assertEqual(97);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_LIB_0017
   * @tc.name      testLibraryFacts0017
   * @tc.desc      Library page string keeps no digits
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testLibraryFacts0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testLibraryFacts0017', 'library no digits');
    const info: bundleManager.BundleInfo = await selfBundle();
    if (!hasModule(info, 'library')) {
      expect(moduleNames(info).includes('library')).assertFalse();
      return;
    }
    const res: resourceManager.ResourceManager = libraryResources();
    const text: string = res.getStringByNameSync('page_show');
    expect(text.indexOf('0')).assertEqual(-1);
    expect(text.indexOf('9')).assertEqual(-1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_LIB_0018
   * @tc.name      testLibraryFacts0018
   * @tc.desc      Library page string keeps contains space
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testLibraryFacts0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testLibraryFacts0018', 'library contains space');
    const info: bundleManager.BundleInfo = await selfBundle();
    if (!hasModule(info, 'library')) {
      expect(moduleNames(info).includes('library')).assertFalse();
      return;
    }
    const res: resourceManager.ResourceManager = libraryResources();
    const text: string = res.getStringByNameSync('page_show');
    expect(text.includes(' ')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_LIB_0019
   * @tc.name      testLibraryFacts0019
   * @tc.desc      Library page string keeps repeat twice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testLibraryFacts0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testLibraryFacts0019', 'library repeat twice');
    const info: bundleManager.BundleInfo = await selfBundle();
    if (!hasModule(info, 'library')) {
      expect(moduleNames(info).includes('library')).assertFalse();
      return;
    }
    const res: resourceManager.ResourceManager = libraryResources();
    const text: string = res.getStringByNameSync('page_show');
    expect(text.repeat(2).length).assertEqual(34);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_LIB_0020
   * @tc.name      testLibraryFacts0020
   * @tc.desc      Library page string keeps pad end
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testLibraryFacts0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testLibraryFacts0020', 'library pad end');
    const info: bundleManager.BundleInfo = await selfBundle();
    if (!hasModule(info, 'library')) {
      expect(moduleNames(info).includes('library')).assertFalse();
      return;
    }
    const res: resourceManager.ResourceManager = libraryResources();
    const text: string = res.getStringByNameSync('page_show');
    expect(text.padEnd(20, '.').endsWith('...')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_LIB_0021
   * @tc.name      testLibraryFacts0021
   * @tc.desc      Library page string keeps trim stable
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testLibraryFacts0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testLibraryFacts0021', 'library trim stable');
    const info: bundleManager.BundleInfo = await selfBundle();
    if (!hasModule(info, 'library')) {
      expect(moduleNames(info).includes('library')).assertFalse();
      return;
    }
    const res: resourceManager.ResourceManager = libraryResources();
    const text: string = res.getStringByNameSync('page_show');
    expect(text.trim()).assertEqual(text);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_LIB_0022
   * @tc.name      testLibraryFacts0022
   * @tc.desc      Library shares font size with entry
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testLibraryFacts0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testLibraryFacts0022', 'library float');
    const info: bundleManager.BundleInfo = await selfBundle();
    if (!hasModule(info, 'library')) {
      expect(entryResources().getNumberByName('page_text_font_size')).assertEqual(50);
      return;
    }
    const libRes: resourceManager.ResourceManager = libraryResources();
    const entryRes: resourceManager.ResourceManager = entryResources();
    expect(libRes.getNumberByName('page_text_font_size')).assertEqual(50);
    expect(entryRes.getNumberByName('page_text_font_size')).assertEqual(50);
    expect(libRes.getNumberByName('page_text_font_size')).assertEqual(entryRes.getNumberByName('page_text_font_size'));
  });
  });
}
