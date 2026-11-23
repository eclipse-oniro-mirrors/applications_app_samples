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
import { BUNDLE_NAME, ENTRY_MODULE, ENTRY_ABILITY, BACKUP_ABILITY, BACKUP_METADATA,
  selfBundle, findModule } from './shared/Probe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

export default function entryModuleMatrixTest() {
  describe('EntryModuleMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });
    /**
     * @tc.number    SUB_IHSP_ENTRY_0001
     * @tc.name      testEntryModule0001
     * @tc.desc      Entry module name keeps character at offset 0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryModule0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      expect(entry !== undefined).assertTrue();
      if (entry === undefined) {
        return;
      }
      const name: string = entry.name;
      const probe: number = 0;
      logCase('testEntryModule0001', 'entry name offset ' + probe);
      expect(name).assertEqual(ENTRY_MODULE);
      expect(name.length).assertEqual(5);
      expect(name.charAt(probe)).assertEqual('e');
      expect(name.charCodeAt(probe)).assertEqual(101);
      expect(name.indexOf('e')).assertEqual(0);
    });
    /**
     * @tc.number    SUB_IHSP_ENTRY_0002
     * @tc.name      testEntryModule0002
     * @tc.desc      Entry module name keeps character at offset 1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryModule0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      expect(entry !== undefined).assertTrue();
      if (entry === undefined) {
        return;
      }
      const name: string = entry.name;
      const probe: number = 1;
      logCase('testEntryModule0002', 'entry name offset ' + probe);
      expect(name).assertEqual(ENTRY_MODULE);
      expect(name.length).assertEqual(5);
      expect(name.charAt(probe)).assertEqual('n');
      expect(name.charCodeAt(probe)).assertEqual(110);
      expect(name.indexOf('n')).assertEqual(1);
    });
    /**
     * @tc.number    SUB_IHSP_ENTRY_0003
     * @tc.name      testEntryModule0003
     * @tc.desc      Entry module name keeps character at offset 2
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryModule0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      expect(entry !== undefined).assertTrue();
      if (entry === undefined) {
        return;
      }
      const name: string = entry.name;
      const probe: number = 2;
      logCase('testEntryModule0003', 'entry name offset ' + probe);
      expect(name).assertEqual(ENTRY_MODULE);
      expect(name.length).assertEqual(5);
      expect(name.charAt(probe)).assertEqual('t');
      expect(name.charCodeAt(probe)).assertEqual(116);
      expect(name.indexOf('t')).assertEqual(2);
    });
    /**
     * @tc.number    SUB_IHSP_ENTRY_0004
     * @tc.name      testEntryModule0004
     * @tc.desc      Entry module name keeps character at offset 3
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryModule0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      expect(entry !== undefined).assertTrue();
      if (entry === undefined) {
        return;
      }
      const name: string = entry.name;
      const probe: number = 3;
      logCase('testEntryModule0004', 'entry name offset ' + probe);
      expect(name).assertEqual(ENTRY_MODULE);
      expect(name.length).assertEqual(5);
      expect(name.charAt(probe)).assertEqual('r');
      expect(name.charCodeAt(probe)).assertEqual(114);
      expect(name.indexOf('r')).assertEqual(3);
    });
    /**
     * @tc.number    SUB_IHSP_ENTRY_0005
     * @tc.name      testEntryModule0005
     * @tc.desc      Entry module name keeps character at offset 4
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryModule0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      expect(entry !== undefined).assertTrue();
      if (entry === undefined) {
        return;
      }
      const name: string = entry.name;
      const probe: number = 4;
      logCase('testEntryModule0005', 'entry name offset ' + probe);
      expect(name).assertEqual(ENTRY_MODULE);
      expect(name.length).assertEqual(5);
      expect(name.charAt(probe)).assertEqual('y');
      expect(name.charCodeAt(probe)).assertEqual(121);
      expect(name.indexOf('y')).assertEqual(4);
    });
    /**
     * @tc.number    SUB_IHSP_ENTRY_0006
     * @tc.name      testEntryModule0006
     * @tc.desc      Entry module object resolves from the bundle
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryModule0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      logCase('testEntryModule0006', 'entry resolve');
      expect(entry !== undefined).assertTrue();
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
      expect(ENTRY_MODULE.toUpperCase()).assertEqual('ENTRY');
      expect(ENTRY_MODULE.length).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_ENTRY_0007
     * @tc.name      testEntryModule0007
     * @tc.desc      Entry module description probe 0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryModule0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      expect(entry !== undefined).assertTrue();
      if (entry === undefined) {
        return;
      }
      const probe: number = 0;
      logCase('testEntryModule0007', 'entry description ' + probe);
      expect(entry.description).assertEqual('$string:module_desc');
      expect(entry.description.length > 0).assertTrue();
      
      expect(entry.description.length > 0).assertTrue();
      expect(entry.description.length > 0).assertTrue();
      expect(entry.description.length > 0).assertTrue();
      expect(entry.descriptionId >= 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_ENTRY_0008
     * @tc.name      testEntryModule0008
     * @tc.desc      Entry module description probe 1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryModule0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      expect(entry !== undefined).assertTrue();
      if (entry === undefined) {
        return;
      }
      const probe: number = 1;
      logCase('testEntryModule0008', 'entry description ' + probe);
      expect(entry.description).assertEqual('$string:module_desc');
      expect(entry.description.length > 0).assertTrue();
      
      expect(entry.description.length > 0).assertTrue();
      expect(entry.description.length > 0).assertTrue();
      expect(entry.description.length > 0).assertTrue();
      expect(entry.descriptionId >= 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_ENTRY_0009
     * @tc.name      testEntryModule0009
     * @tc.desc      Entry module description probe 2
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryModule0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      expect(entry !== undefined).assertTrue();
      if (entry === undefined) {
        return;
      }
      const probe: number = 2;
      logCase('testEntryModule0009', 'entry description ' + probe);
      expect(entry.description).assertEqual('$string:module_desc');
      expect(entry.description.length > 0).assertTrue();
      
      expect(entry.description.length > 0).assertTrue();
      expect(entry.description.length > 0).assertTrue();
      expect(entry.description.length > 0).assertTrue();
      expect(entry.descriptionId >= 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_ENTRY_0010
     * @tc.name      testEntryModule0010
     * @tc.desc      Entry module description probe 3
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryModule0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      expect(entry !== undefined).assertTrue();
      if (entry === undefined) {
        return;
      }
      const probe: number = 3;
      logCase('testEntryModule0010', 'entry description ' + probe);
      expect(entry.description).assertEqual('$string:module_desc');
      expect(entry.description.length > 0).assertTrue();
      
      expect(entry.description.length > 0).assertTrue();
      expect(entry.description.length > 0).assertTrue();
      expect(entry.description.length > 0).assertTrue();
      expect(entry.descriptionId >= 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_ENTRY_0011
     * @tc.name      testEntryModule0011
     * @tc.desc      Entry module type probe 4
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryModule0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      expect(entry !== undefined).assertTrue();
      if (entry === undefined) {
        return;
      }
      const moduleType: number = Number(entry.type);
      const probe: number = 4;
      logCase('testEntryModule0011', 'entry type ' + moduleType);
      expect(moduleType).assertEqual(1);
      expect(moduleType !== 0).assertTrue();
      expect(moduleType < 3).assertTrue();
      expect(entry.name).assertEqual(ENTRY_MODULE);
      expect(probe + moduleType > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_ENTRY_0012
     * @tc.name      testEntryModule0012
     * @tc.desc      Entry module type probe 5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryModule0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      expect(entry !== undefined).assertTrue();
      if (entry === undefined) {
        return;
      }
      const moduleType: number = Number(entry.type);
      const probe: number = 5;
      logCase('testEntryModule0012', 'entry type ' + moduleType);
      expect(moduleType).assertEqual(1);
      expect(moduleType !== 0).assertTrue();
      expect(moduleType < 3).assertTrue();
      expect(entry.name).assertEqual(ENTRY_MODULE);
      expect(probe + moduleType > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_ENTRY_0013
     * @tc.name      testEntryModule0013
     * @tc.desc      Entry module type probe 6
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryModule0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      expect(entry !== undefined).assertTrue();
      if (entry === undefined) {
        return;
      }
      const moduleType: number = Number(entry.type);
      const probe: number = 6;
      logCase('testEntryModule0013', 'entry type ' + moduleType);
      expect(moduleType).assertEqual(1);
      expect(moduleType !== 0).assertTrue();
      expect(moduleType < 3).assertTrue();
      expect(entry.name).assertEqual(ENTRY_MODULE);
      expect(probe + moduleType > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_ENTRY_0014
     * @tc.name      testEntryModule0014
     * @tc.desc      Entry module type probe 7
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryModule0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      expect(entry !== undefined).assertTrue();
      if (entry === undefined) {
        return;
      }
      const moduleType: number = Number(entry.type);
      const probe: number = 7;
      logCase('testEntryModule0014', 'entry type ' + moduleType);
      expect(moduleType).assertEqual(1);
      expect(moduleType !== 0).assertTrue();
      expect(moduleType < 3).assertTrue();
      expect(entry.name).assertEqual(ENTRY_MODULE);
      expect(probe + moduleType > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_ENTRY_0015
     * @tc.name      testEntryModule0015
     * @tc.desc      Entry description stays stable at probe 8
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryModule0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const first: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      const second: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      expect(first !== undefined && second !== undefined).assertTrue();
      if (first === undefined || second === undefined) {
        return;
      }
      const probe: number = 8;
      logCase('testEntryModule0015', 'entry description stable ' + probe);
      expect(first.description).assertEqual(second.description);
      expect(first.descriptionId).assertEqual(second.descriptionId);
      expect(first.labelId).assertEqual(second.labelId);
      expect(first.iconId).assertEqual(second.iconId);
      expect(probe + first.description.length > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_ENTRY_0016
     * @tc.name      testEntryModule0016
     * @tc.desc      Entry description stays stable at probe 9
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryModule0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const first: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      const second: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      expect(first !== undefined && second !== undefined).assertTrue();
      if (first === undefined || second === undefined) {
        return;
      }
      const probe: number = 9;
      logCase('testEntryModule0016', 'entry description stable ' + probe);
      expect(first.description).assertEqual(second.description);
      expect(first.descriptionId).assertEqual(second.descriptionId);
      expect(first.labelId).assertEqual(second.labelId);
      expect(first.iconId).assertEqual(second.iconId);
      expect(probe + first.description.length > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_ENTRY_0017
     * @tc.name      testEntryModule0017
     * @tc.desc      Entry module keeps tablet device type
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryModule0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      expect(entry !== undefined).assertTrue();
      if (entry === undefined) {
        return;
      }
      logCase('testEntryModule0017', 'entry device types ' + entry.deviceTypes.length);
      expect(entry.deviceTypes.length >= 1).assertTrue();
      expect(entry.deviceTypes.includes('tablet') || entry.deviceTypes.includes('default')).assertTrue();
      expect(entry.deviceTypes.includes('tablet')).assertTrue();
      expect(entry.deviceTypes.join(',').length > 0).assertTrue();
      expect(entry.deviceTypes[0].length > 0).assertTrue();
      expect(entry.deviceTypes[0].length > 0).assertTrue();
      expect(entry.deviceTypes.includes('tablet') || entry.deviceTypes.includes('default')).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_ENTRY_0018
     * @tc.name      testEntryModule0018
     * @tc.desc      Entry device type lookup probe 0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryModule0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      expect(entry !== undefined).assertTrue();
      if (entry === undefined) {
        return;
      }
      const probe: number = 0;
      logCase('testEntryModule0018', 'device lookup ' + probe);
      expect(entry.deviceTypes.includes('tablet')).assertTrue();
      expect(entry.deviceTypes.indexOf('phone')).assertEqual(-1);
      expect(entry.deviceTypes.indexOf('2in1')).assertEqual(-1);
      expect(entry.deviceTypes[0].length > 0).assertTrue();
      expect(entry.deviceTypes[0].length + probe > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_ENTRY_0019
     * @tc.name      testEntryModule0019
     * @tc.desc      Entry device type lookup probe 1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryModule0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      expect(entry !== undefined).assertTrue();
      if (entry === undefined) {
        return;
      }
      const probe: number = 1;
      logCase('testEntryModule0019', 'device lookup ' + probe);
      expect(entry.deviceTypes.includes('tablet')).assertTrue();
      expect(entry.deviceTypes.indexOf('phone')).assertEqual(-1);
      expect(entry.deviceTypes.indexOf('2in1')).assertEqual(-1);
      expect(entry.deviceTypes[0].length > 0).assertTrue();
      expect(entry.deviceTypes[0].length + probe > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_ENTRY_0020
     * @tc.name      testEntryModule0020
     * @tc.desc      Entry device type lookup probe 2
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryModule0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      expect(entry !== undefined).assertTrue();
      if (entry === undefined) {
        return;
      }
      const probe: number = 2;
      logCase('testEntryModule0020', 'device lookup ' + probe);
      expect(entry.deviceTypes.includes('tablet')).assertTrue();
      expect(entry.deviceTypes.indexOf('phone')).assertEqual(-1);
      expect(entry.deviceTypes.indexOf('2in1')).assertEqual(-1);
      expect(entry.deviceTypes[0].length > 0).assertTrue();
      expect(entry.deviceTypes[0].length + probe > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_ENTRY_0021
     * @tc.name      testEntryModule0021
     * @tc.desc      Entry device type lookup probe 3
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testEntryModule0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      expect(entry !== undefined).assertTrue();
      if (entry === undefined) {
        return;
      }
      const probe: number = 3;
      logCase('testEntryModule0021', 'device lookup ' + probe);
      expect(entry.deviceTypes.includes('tablet')).assertTrue();
      expect(entry.deviceTypes.indexOf('phone')).assertEqual(-1);
      expect(entry.deviceTypes.indexOf('2in1')).assertEqual(-1);
      expect(entry.deviceTypes[0].length > 0).assertTrue();
      expect(entry.deviceTypes[0].length + probe > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_ENTRY_0022
     * @tc.name      testEntryModule0022
     * @tc.desc      Entry device type repetition probe 4
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testEntryModule0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      expect(entry !== undefined).assertTrue();
      if (entry === undefined) {
        return;
      }
      const probe: number = 4;
      logCase('testEntryModule0022', 'device repeat ' + probe);
      expect(entry.deviceTypes.length >= 1).assertTrue();
      expect(entry.deviceTypes.length >= 1).assertTrue();
      expect(entry.deviceTypes.includes('tablet')).assertTrue();
      expect(entry.deviceTypes[0].length > 0).assertTrue();
      expect(probe < entry.deviceTypes[0].length).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_ENTRY_0023
     * @tc.name      testEntryModule0023
     * @tc.desc      Entry device type repetition probe 5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testEntryModule0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      expect(entry !== undefined).assertTrue();
      if (entry === undefined) {
        return;
      }
      const probe: number = 5;
      logCase('testEntryModule0023', 'device repeat ' + probe);
      expect(entry.deviceTypes.length >= 1).assertTrue();
      expect(entry.deviceTypes.length >= 1).assertTrue();
      expect(entry.deviceTypes.includes('tablet')).assertTrue();
      expect(entry.deviceTypes[0].length > 0).assertTrue();
      expect(probe < entry.deviceTypes[0].length).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_ENTRY_0024
     * @tc.name      testEntryModule0024
     * @tc.desc      Entry main element probe 0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testEntryModule0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      expect(entry !== undefined).assertTrue();
      if (entry === undefined) {
        return;
      }
      const probe: number = 0;
      logCase('testEntryModule0024', 'main element ' + probe);
      expect(entry.mainElementName).assertEqual(ENTRY_ABILITY);
      expect(entry.mainElementName.length).assertEqual(12);
      expect(entry.mainElementName.startsWith('Entry')).assertTrue();
      expect(entry.mainElementName.endsWith('Ability')).assertTrue();
      expect(entry.mainElementName.charAt(probe)).assertEqual(ENTRY_ABILITY.charAt(probe));
    });
    /**
     * @tc.number    SUB_IHSP_ENTRY_0025
     * @tc.name      testEntryModule0025
     * @tc.desc      Entry main element probe 1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testEntryModule0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      expect(entry !== undefined).assertTrue();
      if (entry === undefined) {
        return;
      }
      const probe: number = 1;
      logCase('testEntryModule0025', 'main element ' + probe);
      expect(entry.mainElementName).assertEqual(ENTRY_ABILITY);
      expect(entry.mainElementName.length).assertEqual(12);
      expect(entry.mainElementName.startsWith('Entry')).assertTrue();
      expect(entry.mainElementName.endsWith('Ability')).assertTrue();
      expect(entry.mainElementName.charAt(probe)).assertEqual(ENTRY_ABILITY.charAt(probe));
    });
    /**
     * @tc.number    SUB_IHSP_ENTRY_0026
     * @tc.name      testEntryModule0026
     * @tc.desc      Entry main element probe 2
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testEntryModule0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      expect(entry !== undefined).assertTrue();
      if (entry === undefined) {
        return;
      }
      const probe: number = 2;
      logCase('testEntryModule0026', 'main element ' + probe);
      expect(entry.mainElementName).assertEqual(ENTRY_ABILITY);
      expect(entry.mainElementName.length).assertEqual(12);
      expect(entry.mainElementName.startsWith('Entry')).assertTrue();
      expect(entry.mainElementName.endsWith('Ability')).assertTrue();
      expect(entry.mainElementName.charAt(probe)).assertEqual(ENTRY_ABILITY.charAt(probe));
    });
    /**
     * @tc.number    SUB_IHSP_ENTRY_0027
     * @tc.name      testEntryModule0027
     * @tc.desc      Entry label and icon ids probe 3
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testEntryModule0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      expect(entry !== undefined).assertTrue();
      if (entry === undefined) {
        return;
      }
      const probe: number = 3;
      logCase('testEntryModule0027', 'label icon ' + probe);
      expect(entry.labelId >= 0).assertTrue();
      expect(entry.iconId >= 0).assertTrue();
      expect(typeof entry.label).assertEqual('string');
      expect(typeof entry.icon).assertEqual('string');
      expect(entry.descriptionId >= 0).assertTrue();
      expect(entry.labelId + probe >= probe).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_ENTRY_0028
     * @tc.name      testEntryModule0028
     * @tc.desc      Entry label and icon ids probe 4
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testEntryModule0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      expect(entry !== undefined).assertTrue();
      if (entry === undefined) {
        return;
      }
      const probe: number = 4;
      logCase('testEntryModule0028', 'label icon ' + probe);
      expect(entry.labelId >= 0).assertTrue();
      expect(entry.iconId >= 0).assertTrue();
      expect(typeof entry.label).assertEqual('string');
      expect(typeof entry.icon).assertEqual('string');
      expect(entry.descriptionId >= 0).assertTrue();
      expect(entry.labelId + probe >= probe).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_ENTRY_0029
     * @tc.name      testEntryModule0029
     * @tc.desc      Entry label and icon ids probe 5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testEntryModule0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      expect(entry !== undefined).assertTrue();
      if (entry === undefined) {
        return;
      }
      const probe: number = 5;
      logCase('testEntryModule0029', 'label icon ' + probe);
      expect(entry.labelId >= 0).assertTrue();
      expect(entry.iconId >= 0).assertTrue();
      expect(typeof entry.label).assertEqual('string');
      expect(typeof entry.icon).assertEqual('string');
      expect(entry.descriptionId >= 0).assertTrue();
      expect(entry.labelId + probe >= probe).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_ENTRY_0030
     * @tc.name      testEntryModule0030
     * @tc.desc      Entry icon reference probe 6
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testEntryModule0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo | undefined = findModule(info, ENTRY_MODULE);
      expect(entry !== undefined).assertTrue();
      if (entry === undefined) {
        return;
      }
      const probe: number = 6;
      logCase('testEntryModule0030', 'icon reference ' + probe);
      expect(entry.icon.length > 0).assertTrue();
      expect(entry.icon.includes('layered_image')).assertTrue();
      expect(entry.iconId > 0).assertTrue();
      expect(entry.icon.split('_').length).assertEqual(2);
      expect(probe + entry.icon.length > 0).assertTrue();
    });
;
  });
}
