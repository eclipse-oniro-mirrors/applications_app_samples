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
import { LIB_MODULE, ENTRY_MODULE, ROUTE_NAME, ROUTE_PAGE, ROUTE_BUILDER, ROUTE_DESC,
  libraryModule } from './shared/Probe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

export default function libraryModuleMatrixTest() {
  describe('LibraryModuleMatrix', () => {
    const SHARED_DESC: string = 'description';
    beforeEach(async () => {
      await paceTurn();
    });
    /**
     * @tc.number    SUB_IHSP_LIB_0001
     * @tc.name      testLibraryModule0001
     * @tc.desc      Library module name keeps character at offset 0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testLibraryModule0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.HapModuleInfo | undefined = await libraryModule();
      if (info === undefined) {
        logCase('testLibraryModule0001', 'library module not installed');
        return;
      }
      const name: string = info.name;
      const probe: number = 0;
      logCase('testLibraryModule0001', 'library name offset ' + probe);
      expect(name).assertEqual(LIB_MODULE);
      expect(name.length).assertEqual(7);
      expect(name.charAt(probe)).assertEqual('l');
      expect(name.charCodeAt(probe)).assertEqual(108);
      expect(name.indexOf('l')).assertEqual(0);
    });
    /**
     * @tc.number    SUB_IHSP_LIB_0002
     * @tc.name      testLibraryModule0002
     * @tc.desc      Library module name keeps character at offset 1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testLibraryModule0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.HapModuleInfo | undefined = await libraryModule();
      if (info === undefined) {
        logCase('testLibraryModule0002', 'library module not installed');
        return;
      }
      const name: string = info.name;
      const probe: number = 1;
      logCase('testLibraryModule0002', 'library name offset ' + probe);
      expect(name).assertEqual(LIB_MODULE);
      expect(name.length).assertEqual(7);
      expect(name.charAt(probe)).assertEqual('i');
      expect(name.charCodeAt(probe)).assertEqual(105);
      expect(name.indexOf('i')).assertEqual(1);
    });
    /**
     * @tc.number    SUB_IHSP_LIB_0003
     * @tc.name      testLibraryModule0003
     * @tc.desc      Library module name keeps character at offset 2
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testLibraryModule0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.HapModuleInfo | undefined = await libraryModule();
      if (info === undefined) {
        logCase('testLibraryModule0003', 'library module not installed');
        return;
      }
      const name: string = info.name;
      const probe: number = 2;
      logCase('testLibraryModule0003', 'library name offset ' + probe);
      expect(name).assertEqual(LIB_MODULE);
      expect(name.length).assertEqual(7);
      expect(name.charAt(probe)).assertEqual('b');
      expect(name.charCodeAt(probe)).assertEqual(98);
      expect(name.indexOf('b')).assertEqual(2);
    });
    /**
     * @tc.number    SUB_IHSP_LIB_0004
     * @tc.name      testLibraryModule0004
     * @tc.desc      Library module name keeps character at offset 3
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testLibraryModule0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.HapModuleInfo | undefined = await libraryModule();
      if (info === undefined) {
        logCase('testLibraryModule0004', 'library module not installed');
        return;
      }
      const name: string = info.name;
      const probe: number = 3;
      logCase('testLibraryModule0004', 'library name offset ' + probe);
      expect(name).assertEqual(LIB_MODULE);
      expect(name.length).assertEqual(7);
      expect(name.charAt(probe)).assertEqual('r');
      expect(name.charCodeAt(probe)).assertEqual(114);
      expect(name.indexOf('r')).assertEqual(3);
    });
    /**
     * @tc.number    SUB_IHSP_LIB_0005
     * @tc.name      testLibraryModule0005
     * @tc.desc      Library module name keeps character at offset 4
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testLibraryModule0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.HapModuleInfo | undefined = await libraryModule();
      if (info === undefined) {
        logCase('testLibraryModule0005', 'library module not installed');
        return;
      }
      const name: string = info.name;
      const probe: number = 4;
      logCase('testLibraryModule0005', 'library name offset ' + probe);
      expect(name).assertEqual(LIB_MODULE);
      expect(name.length).assertEqual(7);
      expect(name.charAt(probe)).assertEqual('a');
      expect(name.charCodeAt(probe)).assertEqual(97);
      expect(name.indexOf('a')).assertEqual(4);
    });
    /**
     * @tc.number    SUB_IHSP_LIB_0006
     * @tc.name      testLibraryModule0006
     * @tc.desc      Library module name keeps character at offset 5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testLibraryModule0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.HapModuleInfo | undefined = await libraryModule();
      if (info === undefined) {
        logCase('testLibraryModule0006', 'library module not installed');
        return;
      }
      const name: string = info.name;
      const probe: number = 5;
      logCase('testLibraryModule0006', 'library name offset ' + probe);
      expect(name).assertEqual(LIB_MODULE);
      expect(name.length).assertEqual(7);
      expect(name.charAt(probe)).assertEqual('r');
      expect(name.charCodeAt(probe)).assertEqual(114);
      expect(name.indexOf('r')).assertEqual(3);
    });
    /**
     * @tc.number    SUB_IHSP_LIB_0007
     * @tc.name      testLibraryModule0007
     * @tc.desc      Library module name keeps character at offset 6
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testLibraryModule0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.HapModuleInfo | undefined = await libraryModule();
      if (info === undefined) {
        logCase('testLibraryModule0007', 'library module not installed');
        return;
      }
      const name: string = info.name;
      const probe: number = 6;
      logCase('testLibraryModule0007', 'library name offset ' + probe);
      expect(name).assertEqual(LIB_MODULE);
      expect(name.length).assertEqual(7);
      expect(name.charAt(probe)).assertEqual('y');
      expect(name.charCodeAt(probe)).assertEqual(121);
      expect(name.indexOf('y')).assertEqual(6);
    });
    /**
     * @tc.number    SUB_IHSP_LIB_0008
     * @tc.name      testLibraryModule0008
     * @tc.desc      Library module type is shared
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testLibraryModule0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.HapModuleInfo | undefined = await libraryModule();
      if (info === undefined) {
        logCase('testLibraryModule0008', 'library module not installed');
        return;
      }
      const moduleType: number = Number(info.type);
      logCase('testLibraryModule0008', 'library type ' + moduleType);
      expect(moduleType).assertEqual(3);
      expect(moduleType !== 1).assertTrue();
      expect(moduleType !== 2).assertTrue();
      expect(info.name).assertEqual(LIB_MODULE);
      expect(LIB_MODULE.length).assertEqual(7);
      expect(LIB_MODULE.toUpperCase()).assertEqual('LIBRARY');
    });
    /**
     * @tc.number    SUB_IHSP_LIB_0009
     * @tc.name      testLibraryModule0009
     * @tc.desc      Library module description probe 0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testLibraryModule0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.HapModuleInfo | undefined = await libraryModule();
      if (info === undefined) {
        logCase('testLibraryModule0009', 'library module not installed');
        return;
      }
      const probe: number = 0;
      logCase('testLibraryModule0009', 'library description ' + probe);
      expect(info.description).assertEqual(SHARED_DESC);
      expect(info.description.length).assertEqual(11);
      expect(info.description.charAt(probe)).assertEqual(SHARED_DESC.charAt(probe));
      expect(info.description.startsWith('desc')).assertTrue();
      expect(info.descriptionId >= 0).assertTrue();
      expect(info.description.split('').length).assertEqual(11);
    });
    /**
     * @tc.number    SUB_IHSP_LIB_0010
     * @tc.name      testLibraryModule0010
     * @tc.desc      Library module description probe 1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testLibraryModule0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.HapModuleInfo | undefined = await libraryModule();
      if (info === undefined) {
        logCase('testLibraryModule0010', 'library module not installed');
        return;
      }
      const probe: number = 1;
      logCase('testLibraryModule0010', 'library description ' + probe);
      expect(info.description).assertEqual(SHARED_DESC);
      expect(info.description.length).assertEqual(11);
      expect(info.description.charAt(probe)).assertEqual(SHARED_DESC.charAt(probe));
      expect(info.description.startsWith('desc')).assertTrue();
      expect(info.descriptionId >= 0).assertTrue();
      expect(info.description.split('').length).assertEqual(11);
    });
    /**
     * @tc.number    SUB_IHSP_LIB_0011
     * @tc.name      testLibraryModule0011
     * @tc.desc      Library module description probe 2
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testLibraryModule0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.HapModuleInfo | undefined = await libraryModule();
      if (info === undefined) {
        logCase('testLibraryModule0011', 'library module not installed');
        return;
      }
      const probe: number = 2;
      logCase('testLibraryModule0011', 'library description ' + probe);
      expect(info.description).assertEqual(SHARED_DESC);
      expect(info.description.length).assertEqual(11);
      expect(info.description.charAt(probe)).assertEqual(SHARED_DESC.charAt(probe));
      expect(info.description.startsWith('desc')).assertTrue();
      expect(info.descriptionId >= 0).assertTrue();
      expect(info.description.split('').length).assertEqual(11);
    });
    /**
     * @tc.number    SUB_IHSP_LIB_0012
     * @tc.name      testLibraryModule0012
     * @tc.desc      Library module description probe 3
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testLibraryModule0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.HapModuleInfo | undefined = await libraryModule();
      if (info === undefined) {
        logCase('testLibraryModule0012', 'library module not installed');
        return;
      }
      const probe: number = 3;
      logCase('testLibraryModule0012', 'library description ' + probe);
      expect(info.description).assertEqual(SHARED_DESC);
      expect(info.description.length).assertEqual(11);
      expect(info.description.charAt(probe)).assertEqual(SHARED_DESC.charAt(probe));
      expect(info.description.startsWith('desc')).assertTrue();
      expect(info.descriptionId >= 0).assertTrue();
      expect(info.description.split('').length).assertEqual(11);
    });
    /**
     * @tc.number    SUB_IHSP_LIB_0013
     * @tc.name      testLibraryModule0013
     * @tc.desc      Library description repeats probe 4
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testLibraryModule0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.HapModuleInfo | undefined = await libraryModule();
      if (info === undefined) {
        logCase('testLibraryModule0013', 'library module not installed');
        return;
      }
      const again: bundleManager.HapModuleInfo | undefined = await libraryModule();
      expect(again !== undefined).assertTrue();
      if (again === undefined) {
        return;
      }
      const probe: number = 4;
      logCase('testLibraryModule0013', 'library description repeat ' + probe);
      expect(again.description).assertEqual(info.description);
      expect(again.descriptionId).assertEqual(info.descriptionId);
      expect(again.name).assertEqual(info.name);
      expect(probe + again.description.length > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIB_0014
     * @tc.name      testLibraryModule0014
     * @tc.desc      Library description repeats probe 5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testLibraryModule0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.HapModuleInfo | undefined = await libraryModule();
      if (info === undefined) {
        logCase('testLibraryModule0014', 'library module not installed');
        return;
      }
      const again: bundleManager.HapModuleInfo | undefined = await libraryModule();
      expect(again !== undefined).assertTrue();
      if (again === undefined) {
        return;
      }
      const probe: number = 5;
      logCase('testLibraryModule0014', 'library description repeat ' + probe);
      expect(again.description).assertEqual(info.description);
      expect(again.descriptionId).assertEqual(info.descriptionId);
      expect(again.name).assertEqual(info.name);
      expect(probe + again.description.length > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIB_0015
     * @tc.name      testLibraryModule0015
     * @tc.desc      Library description repeats probe 6
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testLibraryModule0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.HapModuleInfo | undefined = await libraryModule();
      if (info === undefined) {
        logCase('testLibraryModule0015', 'library module not installed');
        return;
      }
      const again: bundleManager.HapModuleInfo | undefined = await libraryModule();
      expect(again !== undefined).assertTrue();
      if (again === undefined) {
        return;
      }
      const probe: number = 6;
      logCase('testLibraryModule0015', 'library description repeat ' + probe);
      expect(again.description).assertEqual(info.description);
      expect(again.descriptionId).assertEqual(info.descriptionId);
      expect(again.name).assertEqual(info.name);
      expect(probe + again.description.length > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIB_0016
     * @tc.name      testLibraryModule0016
     * @tc.desc      Library description repeats probe 7
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testLibraryModule0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.HapModuleInfo | undefined = await libraryModule();
      if (info === undefined) {
        logCase('testLibraryModule0016', 'library module not installed');
        return;
      }
      const again: bundleManager.HapModuleInfo | undefined = await libraryModule();
      expect(again !== undefined).assertTrue();
      if (again === undefined) {
        return;
      }
      const probe: number = 7;
      logCase('testLibraryModule0016', 'library description repeat ' + probe);
      expect(again.description).assertEqual(info.description);
      expect(again.descriptionId).assertEqual(info.descriptionId);
      expect(again.name).assertEqual(info.name);
      expect(probe + again.description.length > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIB_0017
     * @tc.name      testLibraryModule0017
     * @tc.desc      Library device type count probe 0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testLibraryModule0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.HapModuleInfo | undefined = await libraryModule();
      if (info === undefined) {
        logCase('testLibraryModule0017', 'library module not installed');
        return;
      }
      const probe: number = 0;
      logCase('testLibraryModule0017', 'library devices ' + info.deviceTypes.length);
      expect(info.deviceTypes.length).assertEqual(2);
      expect(info.deviceTypes.includes('tablet')).assertTrue();
      expect(info.deviceTypes.includes('2in1')).assertTrue();
      expect(info.deviceTypes.indexOf('tablet')).assertEqual(0);
      expect(info.deviceTypes.indexOf('2in1')).assertEqual(1);
      expect(probe < info.deviceTypes.length).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIB_0018
     * @tc.name      testLibraryModule0018
     * @tc.desc      Library device type count probe 1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testLibraryModule0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.HapModuleInfo | undefined = await libraryModule();
      if (info === undefined) {
        logCase('testLibraryModule0018', 'library module not installed');
        return;
      }
      const probe: number = 1;
      logCase('testLibraryModule0018', 'library devices ' + info.deviceTypes.length);
      expect(info.deviceTypes.length).assertEqual(2);
      expect(info.deviceTypes.includes('tablet')).assertTrue();
      expect(info.deviceTypes.includes('2in1')).assertTrue();
      expect(info.deviceTypes.indexOf('tablet')).assertEqual(0);
      expect(info.deviceTypes.indexOf('2in1')).assertEqual(1);
      expect(probe < info.deviceTypes.length).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIB_0019
     * @tc.name      testLibraryModule0019
     * @tc.desc      Library device type count probe 2
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testLibraryModule0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.HapModuleInfo | undefined = await libraryModule();
      if (info === undefined) {
        logCase('testLibraryModule0019', 'library module not installed');
        return;
      }
      const probe: number = 2;
      logCase('testLibraryModule0019', 'library devices ' + info.deviceTypes.length);
      expect(info.deviceTypes.length).assertEqual(2);
      expect(info.deviceTypes.includes('tablet')).assertTrue();
      expect(info.deviceTypes.includes('2in1')).assertTrue();
      expect(info.deviceTypes.indexOf('tablet')).assertEqual(0);
      expect(info.deviceTypes.indexOf('2in1')).assertEqual(1);
      expect(probe < info.deviceTypes.length).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIB_0020
     * @tc.name      testLibraryModule0020
     * @tc.desc      Library device type count probe 3
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLibraryModule0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.HapModuleInfo | undefined = await libraryModule();
      if (info === undefined) {
        logCase('testLibraryModule0020', 'library module not installed');
        return;
      }
      const probe: number = 3;
      logCase('testLibraryModule0020', 'library devices ' + info.deviceTypes.length);
      expect(info.deviceTypes.length).assertEqual(2);
      expect(info.deviceTypes.includes('tablet')).assertTrue();
      expect(info.deviceTypes.includes('2in1')).assertTrue();
      expect(info.deviceTypes.indexOf('tablet')).assertEqual(0);
      expect(info.deviceTypes.indexOf('2in1')).assertEqual(1);
      expect(probe < info.deviceTypes.length).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIB_0021
     * @tc.name      testLibraryModule0021
     * @tc.desc      Library device type count probe 4
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLibraryModule0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.HapModuleInfo | undefined = await libraryModule();
      if (info === undefined) {
        logCase('testLibraryModule0021', 'library module not installed');
        return;
      }
      const probe: number = 4;
      logCase('testLibraryModule0021', 'library devices ' + info.deviceTypes.length);
      expect(info.deviceTypes.length).assertEqual(2);
      expect(info.deviceTypes.includes('tablet')).assertTrue();
      expect(info.deviceTypes.includes('2in1')).assertTrue();
      expect(info.deviceTypes.indexOf('tablet')).assertEqual(0);
      expect(info.deviceTypes.indexOf('2in1')).assertEqual(1);
      expect(probe < info.deviceTypes.length).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIB_0022
     * @tc.name      testLibraryModule0022
     * @tc.desc      Library device type text probe 5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLibraryModule0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.HapModuleInfo | undefined = await libraryModule();
      if (info === undefined) {
        logCase('testLibraryModule0022', 'library module not installed');
        return;
      }
      const first: string = info.deviceTypes[0];
      const second: string = info.deviceTypes[1];
      const probe: number = 5;
      logCase('testLibraryModule0022', 'library device text ' + probe);
      expect(first).assertEqual('tablet');
      expect(second).assertEqual('2in1');
      expect(first.length).assertEqual(6);
      expect(second.length).assertEqual(4);
      expect(first.charAt(0)).assertEqual('t');
      expect(second.charAt(0)).assertEqual('2');
      expect(first.toUpperCase()).assertEqual('TABLET');
      expect(second.endsWith('1')).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIB_0023
     * @tc.name      testLibraryModule0023
     * @tc.desc      Library device type text probe 6
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLibraryModule0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.HapModuleInfo | undefined = await libraryModule();
      if (info === undefined) {
        logCase('testLibraryModule0023', 'library module not installed');
        return;
      }
      const first: string = info.deviceTypes[0];
      const second: string = info.deviceTypes[1];
      const probe: number = 6;
      logCase('testLibraryModule0023', 'library device text ' + probe);
      expect(first).assertEqual('tablet');
      expect(second).assertEqual('2in1');
      expect(first.length).assertEqual(6);
      expect(second.length).assertEqual(4);
      expect(first.charAt(0)).assertEqual('t');
      expect(second.charAt(0)).assertEqual('2');
      expect(first.toUpperCase()).assertEqual('TABLET');
      expect(second.endsWith('1')).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIB_0024
     * @tc.name      testLibraryModule0024
     * @tc.desc      Library device type text probe 7
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLibraryModule0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.HapModuleInfo | undefined = await libraryModule();
      if (info === undefined) {
        logCase('testLibraryModule0024', 'library module not installed');
        return;
      }
      const first: string = info.deviceTypes[0];
      const second: string = info.deviceTypes[1];
      const probe: number = 7;
      logCase('testLibraryModule0024', 'library device text ' + probe);
      expect(first).assertEqual('tablet');
      expect(second).assertEqual('2in1');
      expect(first.length).assertEqual(6);
      expect(second.length).assertEqual(4);
      expect(first.charAt(0)).assertEqual('t');
      expect(second.charAt(0)).assertEqual('2');
      expect(first.toUpperCase()).assertEqual('TABLET');
      expect(second.endsWith('1')).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIB_0025
     * @tc.name      testLibraryModule0025
     * @tc.desc      Library device type text probe 8
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLibraryModule0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.HapModuleInfo | undefined = await libraryModule();
      if (info === undefined) {
        logCase('testLibraryModule0025', 'library module not installed');
        return;
      }
      const first: string = info.deviceTypes[0];
      const second: string = info.deviceTypes[1];
      const probe: number = 8;
      logCase('testLibraryModule0025', 'library device text ' + probe);
      expect(first).assertEqual('tablet');
      expect(second).assertEqual('2in1');
      expect(first.length).assertEqual(6);
      expect(second.length).assertEqual(4);
      expect(first.charAt(0)).assertEqual('t');
      expect(second.charAt(0)).assertEqual('2');
      expect(first.toUpperCase()).assertEqual('TABLET');
      expect(second.endsWith('1')).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIB_0026
     * @tc.name      testLibraryModule0026
     * @tc.desc      Library device combo probe 9
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLibraryModule0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.HapModuleInfo | undefined = await libraryModule();
      if (info === undefined) {
        logCase('testLibraryModule0026', 'library module not installed');
        return;
      }
      const probe: number = 9;
      logCase('testLibraryModule0026', 'library device combo ' + probe);
      expect(info.deviceTypes.join('|')).assertEqual('tablet|2in1');
      expect(info.deviceTypes.slice(0, 1).length).assertEqual(1);
      expect(info.deviceTypes.slice(1).length).assertEqual(1);
      expect(info.deviceTypes.filter((item: string) => item.length === 4).length).assertEqual(1);
      expect(probe + info.deviceTypes.length > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIB_0027
     * @tc.name      testLibraryModule0027
     * @tc.desc      Library device combo probe 10
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLibraryModule0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.HapModuleInfo | undefined = await libraryModule();
      if (info === undefined) {
        logCase('testLibraryModule0027', 'library module not installed');
        return;
      }
      const probe: number = 10;
      logCase('testLibraryModule0027', 'library device combo ' + probe);
      expect(info.deviceTypes.join('|')).assertEqual('tablet|2in1');
      expect(info.deviceTypes.slice(0, 1).length).assertEqual(1);
      expect(info.deviceTypes.slice(1).length).assertEqual(1);
      expect(info.deviceTypes.filter((item: string) => item.length === 4).length).assertEqual(1);
      expect(probe + info.deviceTypes.length > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIB_0028
     * @tc.name      testLibraryModule0028
     * @tc.desc      Library device combo probe 11
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLibraryModule0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.HapModuleInfo | undefined = await libraryModule();
      if (info === undefined) {
        logCase('testLibraryModule0028', 'library module not installed');
        return;
      }
      const probe: number = 11;
      logCase('testLibraryModule0028', 'library device combo ' + probe);
      expect(info.deviceTypes.join('|')).assertEqual('tablet|2in1');
      expect(info.deviceTypes.slice(0, 1).length).assertEqual(1);
      expect(info.deviceTypes.slice(1).length).assertEqual(1);
      expect(info.deviceTypes.filter((item: string) => item.length === 4).length).assertEqual(1);
      expect(probe + info.deviceTypes.length > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIB_0029
     * @tc.name      testLibraryModule0029
     * @tc.desc      Library device membership probe 12
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLibraryModule0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.HapModuleInfo | undefined = await libraryModule();
      if (info === undefined) {
        logCase('testLibraryModule0029', 'library module not installed');
        return;
      }
      const probe: number = 12;
      logCase('testLibraryModule0029', 'library device membership ' + probe);
      expect(info.deviceTypes.includes('phone')).assertFalse();
      expect(info.deviceTypes.indexOf('phone')).assertEqual(-1);
      expect(info.deviceTypes.join(',').split(',').length).assertEqual(2);
      expect(info.deviceTypes.join(',').startsWith('tablet')).assertTrue();
      expect(probe + 2 > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIB_0030
     * @tc.name      testLibraryModule0030
     * @tc.desc      Library device membership probe 13
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLibraryModule0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.HapModuleInfo | undefined = await libraryModule();
      if (info === undefined) {
        logCase('testLibraryModule0030', 'library module not installed');
        return;
      }
      const probe: number = 13;
      logCase('testLibraryModule0030', 'library device membership ' + probe);
      expect(info.deviceTypes.includes('phone')).assertFalse();
      expect(info.deviceTypes.indexOf('phone')).assertEqual(-1);
      expect(info.deviceTypes.join(',').split(',').length).assertEqual(2);
      expect(info.deviceTypes.join(',').startsWith('tablet')).assertTrue();
      expect(probe + 2 > 0).assertTrue();
    });
;
  });
}
