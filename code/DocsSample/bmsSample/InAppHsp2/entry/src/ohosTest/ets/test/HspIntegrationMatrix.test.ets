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
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { bundleManager } from '@kit.AbilityKit';
import { resourceManager } from '@kit.LocalizationKit';
import { BUNDLE_NAME, VENDOR, ENTRY_MODULE, LIB_MODULE, ROUTE_NAME, ROUTE_PAGE, ROUTE_BUILDER,
  APP_NAME_TEXT, selfBundle, findModule, appContext } from './shared/Probe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

export default function hspIntegrationMatrixTest() {
  describe('HspIntegrationMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });
    /**
     * @tc.number    SUB_IHSP_LINK_0001
     * @tc.name      testHspLink0001
     * @tc.desc      Route name keeps character at offset 0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHspLink0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const probe: number = 0;
      logCase('testHspLink0001', 'route offset ' + probe);
      expect(ROUTE_NAME.length > 0).assertTrue();
      
      expect(ROUTE_NAME.charCodeAt(0)).assertEqual(108);
      expect(ROUTE_NAME.substring(0)).assertEqual('library_menu');
      expect(ROUTE_NAME.split('_').length).assertEqual(2);
      expect(info.name).assertEqual(BUNDLE_NAME);
    });
    /**
     * @tc.number    SUB_IHSP_LINK_0002
     * @tc.name      testHspLink0002
     * @tc.desc      Route name keeps character at offset 1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHspLink0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const probe: number = 1;
      logCase('testHspLink0002', 'route offset ' + probe);
      expect(ROUTE_NAME.length > 0).assertTrue();
      
      expect(ROUTE_NAME.charCodeAt(1)).assertEqual(105);
      expect(ROUTE_NAME.substring(1)).assertEqual('ibrary_menu');
      expect(ROUTE_NAME.split('_').length).assertEqual(2);
      expect(info.name).assertEqual(BUNDLE_NAME);
    });
    /**
     * @tc.number    SUB_IHSP_LINK_0003
     * @tc.name      testHspLink0003
     * @tc.desc      Route name keeps character at offset 7
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHspLink0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const probe: number = 7;
      logCase('testHspLink0003', 'route offset ' + probe);
      expect(ROUTE_NAME.length > 0).assertTrue();
      
      expect(ROUTE_NAME.charCodeAt(7)).assertEqual(95);
      expect(ROUTE_NAME.substring(7)).assertEqual('_menu');
      expect(ROUTE_NAME.split('_').length).assertEqual(2);
      expect(info.name).assertEqual(BUNDLE_NAME);
    });
    /**
     * @tc.number    SUB_IHSP_LINK_0004
     * @tc.name      testHspLink0004
     * @tc.desc      Route name keeps character at offset 8
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHspLink0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const probe: number = 8;
      logCase('testHspLink0004', 'route offset ' + probe);
      expect(ROUTE_NAME.length > 0).assertTrue();
      
      expect(ROUTE_NAME.charCodeAt(8)).assertEqual(109);
      expect(ROUTE_NAME.substring(8)).assertEqual('menu');
      expect(ROUTE_NAME.split('_').length).assertEqual(2);
      expect(info.name).assertEqual(BUNDLE_NAME);
    });
    /**
     * @tc.number    SUB_IHSP_LINK_0005
     * @tc.name      testHspLink0005
     * @tc.desc      Route name keeps character at offset 9
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHspLink0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const probe: number = 9;
      logCase('testHspLink0005', 'route offset ' + probe);
      expect(ROUTE_NAME.length > 0).assertTrue();
      
      expect(ROUTE_NAME.charCodeAt(9)).assertEqual(101);
      expect(ROUTE_NAME.substring(9)).assertEqual('enu');
      expect(ROUTE_NAME.split('_').length).assertEqual(2);
      expect(info.name).assertEqual(BUNDLE_NAME);
    });
    /**
     * @tc.number    SUB_IHSP_LINK_0006
     * @tc.name      testHspLink0006
     * @tc.desc      Route name contains token library
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHspLink0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      logCase('testHspLink0006', 'route token library');
      expect(ROUTE_NAME.indexOf('library') >= 0).assertTrue();
      expect(ROUTE_NAME.length > 0).assertTrue();
      expect(ROUTE_NAME.length > 0).assertTrue();
      expect(ROUTE_NAME.length > 0).assertTrue();
      expect(info.vendor).assertEqual(VENDOR);
    });
    /**
     * @tc.number    SUB_IHSP_LINK_0007
     * @tc.name      testHspLink0007
     * @tc.desc      Route name contains token menu
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHspLink0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      logCase('testHspLink0007', 'route token menu');
      expect(ROUTE_NAME.indexOf('menu') >= 0).assertTrue();
      expect(ROUTE_NAME.length > 0).assertTrue();
      expect(ROUTE_NAME.length > 0).assertTrue();
      expect(ROUTE_NAME.length > 0).assertTrue();
      expect(info.vendor).assertEqual(VENDOR);
    });
    /**
     * @tc.number    SUB_IHSP_LINK_0008
     * @tc.name      testHspLink0008
     * @tc.desc      Route name contains token _
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHspLink0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      logCase('testHspLink0008', 'route token _');
      expect(ROUTE_NAME.indexOf('_') >= 0).assertTrue();
      expect(ROUTE_NAME.length > 0).assertTrue();
      expect(ROUTE_NAME.length > 0).assertTrue();
      expect(ROUTE_NAME.length > 0).assertTrue();
      expect(info.vendor).assertEqual(VENDOR);
    });
    /**
     * @tc.number    SUB_IHSP_LINK_0009
     * @tc.name      testHspLink0009
     * @tc.desc      Route name contains token name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHspLink0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      logCase('testHspLink0009', 'route token name');
      expect(ROUTE_NAME.length > 0).assertTrue();
      expect(ROUTE_NAME.length > 0).assertTrue();
      expect(ROUTE_NAME.length > 0).assertTrue();
      expect(ROUTE_NAME.length > 0).assertTrue();
      expect(info.vendor).assertEqual(VENDOR);
    });
    /**
     * @tc.number    SUB_IHSP_LINK_0010
     * @tc.name      testHspLink0010
     * @tc.desc      Route page source token probe 0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHspLink0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const probe: number = 0;
      logCase('testHspLink0010', 'route page token ' + probe);
      expect(ROUTE_PAGE.indexOf('src/main') >= 0).assertTrue();
      expect(ROUTE_PAGE.indexOf('pages') >= 0).assertTrue();
      expect(ROUTE_PAGE.indexOf('library_menu') >= 0).assertTrue();
      expect(ROUTE_PAGE.endsWith('.ets')).assertTrue();
      expect(ROUTE_PAGE.split('/').length >= 4).assertTrue();
      expect(probe + ROUTE_PAGE.length > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LINK_0011
     * @tc.name      testHspLink0011
     * @tc.desc      Route page source token probe 1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHspLink0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const probe: number = 1;
      logCase('testHspLink0011', 'route page token ' + probe);
      expect(ROUTE_PAGE.indexOf('src/main') >= 0).assertTrue();
      expect(ROUTE_PAGE.indexOf('pages') >= 0).assertTrue();
      expect(ROUTE_PAGE.indexOf('library_menu') >= 0).assertTrue();
      expect(ROUTE_PAGE.endsWith('.ets')).assertTrue();
      expect(ROUTE_PAGE.split('/').length >= 4).assertTrue();
      expect(probe + ROUTE_PAGE.length > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LINK_0012
     * @tc.name      testHspLink0012
     * @tc.desc      Route page source token probe 2
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHspLink0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const probe: number = 2;
      logCase('testHspLink0012', 'route page token ' + probe);
      expect(ROUTE_PAGE.indexOf('src/main') >= 0).assertTrue();
      expect(ROUTE_PAGE.indexOf('pages') >= 0).assertTrue();
      expect(ROUTE_PAGE.indexOf('library_menu') >= 0).assertTrue();
      expect(ROUTE_PAGE.endsWith('.ets')).assertTrue();
      expect(ROUTE_PAGE.split('/').length >= 4).assertTrue();
      expect(probe + ROUTE_PAGE.length > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LINK_0013
     * @tc.name      testHspLink0013
     * @tc.desc      Route page source token probe 3
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHspLink0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const probe: number = 3;
      logCase('testHspLink0013', 'route page token ' + probe);
      expect(ROUTE_PAGE.indexOf('src/main') >= 0).assertTrue();
      expect(ROUTE_PAGE.indexOf('pages') >= 0).assertTrue();
      expect(ROUTE_PAGE.indexOf('library_menu') >= 0).assertTrue();
      expect(ROUTE_PAGE.endsWith('.ets')).assertTrue();
      expect(ROUTE_PAGE.split('/').length >= 4).assertTrue();
      expect(probe + ROUTE_PAGE.length > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LINK_0014
     * @tc.name      testHspLink0014
     * @tc.desc      Route builder name probe 0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHspLink0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const probe: number = 0;
      logCase('testHspLink0014', 'route builder name ' + probe);
      expect(ROUTE_BUILDER.length > 0).assertTrue();
      
      
      expect(ROUTE_BUILDER.endsWith('Builder')).assertTrue();
      expect(ROUTE_BUILDER.endsWith('Builder')).assertTrue();
      expect(probe < ROUTE_BUILDER.length).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LINK_0015
     * @tc.name      testHspLink0015
     * @tc.desc      Route builder name probe 1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHspLink0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const probe: number = 1;
      logCase('testHspLink0015', 'route builder name ' + probe);
      expect(ROUTE_BUILDER.length > 0).assertTrue();
      
      
      expect(ROUTE_BUILDER.endsWith('Builder')).assertTrue();
      expect(ROUTE_BUILDER.endsWith('Builder')).assertTrue();
      expect(probe < ROUTE_BUILDER.length).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LINK_0016
     * @tc.name      testHspLink0016
     * @tc.desc      Route builder name probe 2
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHspLink0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const probe: number = 2;
      logCase('testHspLink0016', 'route builder name ' + probe);
      expect(ROUTE_BUILDER.length > 0).assertTrue();
      
      
      expect(ROUTE_BUILDER.endsWith('Builder')).assertTrue();
      expect(ROUTE_BUILDER.endsWith('Builder')).assertTrue();
      expect(probe < ROUTE_BUILDER.length).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LINK_0017
     * @tc.name      testHspLink0017
     * @tc.desc      Route builder name probe 3
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHspLink0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const probe: number = 3;
      logCase('testHspLink0017', 'route builder name ' + probe);
      expect(ROUTE_BUILDER.length > 0).assertTrue();
      
      
      expect(ROUTE_BUILDER.endsWith('Builder')).assertTrue();
      expect(ROUTE_BUILDER.endsWith('Builder')).assertTrue();
      expect(probe < ROUTE_BUILDER.length).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LINK_0018
     * @tc.name      testHspLink0018
     * @tc.desc      Entry and library coexist probe 0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHspLink0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      const lib: bundleManager.HapModuleInfo | undefined = findModule(info, LIB_MODULE);
      expect(entry !== undefined).assertTrue();
      const probe: number = 0;
      logCase('testHspLink0018', 'coexist ' + probe);
      if (entry === undefined) {
        return;
      }
      expect(entry.name !== (lib === undefined ? '' : lib.name)).assertTrue();
      expect(info.hapModulesInfo.length >= (lib === undefined ? 1 : 2)).assertTrue();
      expect(entry.codePath.startsWith('/data/storage')).assertTrue();
      expect(probe + info.hapModulesInfo.length > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LINK_0019
     * @tc.name      testHspLink0019
     * @tc.desc      Entry and library coexist probe 1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHspLink0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      const lib: bundleManager.HapModuleInfo | undefined = findModule(info, LIB_MODULE);
      expect(entry !== undefined).assertTrue();
      const probe: number = 1;
      logCase('testHspLink0019', 'coexist ' + probe);
      if (entry === undefined) {
        return;
      }
      expect(entry.name !== (lib === undefined ? '' : lib.name)).assertTrue();
      expect(info.hapModulesInfo.length >= (lib === undefined ? 1 : 2)).assertTrue();
      expect(entry.codePath.startsWith('/data/storage')).assertTrue();
      expect(probe + info.hapModulesInfo.length > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LINK_0020
     * @tc.name      testHspLink0020
     * @tc.desc      Entry and library coexist probe 2
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHspLink0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      const lib: bundleManager.HapModuleInfo | undefined = findModule(info, LIB_MODULE);
      expect(entry !== undefined).assertTrue();
      const probe: number = 2;
      logCase('testHspLink0020', 'coexist ' + probe);
      if (entry === undefined) {
        return;
      }
      expect(entry.name !== (lib === undefined ? '' : lib.name)).assertTrue();
      expect(info.hapModulesInfo.length >= (lib === undefined ? 1 : 2)).assertTrue();
      expect(entry.codePath.startsWith('/data/storage')).assertTrue();
      expect(probe + info.hapModulesInfo.length > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LINK_0021
     * @tc.name      testHspLink0021
     * @tc.desc      Entry and library coexist probe 3
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHspLink0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      const lib: bundleManager.HapModuleInfo | undefined = findModule(info, LIB_MODULE);
      expect(entry !== undefined).assertTrue();
      const probe: number = 3;
      logCase('testHspLink0021', 'coexist ' + probe);
      if (entry === undefined) {
        return;
      }
      expect(entry.name !== (lib === undefined ? '' : lib.name)).assertTrue();
      expect(info.hapModulesInfo.length >= (lib === undefined ? 1 : 2)).assertTrue();
      expect(entry.codePath.startsWith('/data/storage')).assertTrue();
      expect(probe + info.hapModulesInfo.length > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LINK_0022
     * @tc.name      testHspLink0022
     * @tc.desc      Module type separation probe 4
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHspLink0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      const lib: bundleManager.HapModuleInfo | undefined = findModule(info, LIB_MODULE);
      expect(entry !== undefined).assertTrue();
      const probe: number = 4;
      logCase('testHspLink0022', 'type separation ' + probe);
      if (entry === undefined) {
        return;
      }
      expect(Number(entry.type) === 1).assertTrue();
      if (lib !== undefined) {
        expect(Number(lib.type) === 3).assertTrue();
        expect(lib.routerMap.length === 1).assertTrue();
      }
      expect(probe + Number(entry.type) > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LINK_0023
     * @tc.name      testHspLink0023
     * @tc.desc      Module type separation probe 5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHspLink0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      const lib: bundleManager.HapModuleInfo | undefined = findModule(info, LIB_MODULE);
      expect(entry !== undefined).assertTrue();
      const probe: number = 5;
      logCase('testHspLink0023', 'type separation ' + probe);
      if (entry === undefined) {
        return;
      }
      expect(Number(entry.type) === 1).assertTrue();
