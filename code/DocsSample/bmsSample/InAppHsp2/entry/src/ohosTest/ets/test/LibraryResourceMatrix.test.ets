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
import { common } from '@kit.AbilityKit';
import { resourceManager } from '@kit.LocalizationKit';
import { ENTRY_MODULE, LIB_MODULE, libraryInstalled, moduleContext } from './shared/Probe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

export default function libraryResourceMatrixTest() {
  describe('LibraryResourceMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });
    /**
     * @tc.number    SUB_IHSP_LRES_0001
     * @tc.name      testLibraryResource0001
     * @tc.desc      Library string shared_desc offset 0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testLibraryResource0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const installed: boolean = await libraryInstalled();
      if (!installed) {
        logCase('testLibraryResource0001', 'library module not installed');
        return;
      }
      const res: resourceManager.ResourceManager = moduleContext(LIB_MODULE).resourceManager;
      const text: string = res.getStringByNameSync('shared_desc');
      const probe: number = 0;
      logCase('testLibraryResource0001', 'shared desc offset=' + probe);
      expect(text).assertEqual('description');
      expect(text.length).assertEqual(11);
      expect(text.charAt(probe)).assertEqual('d');
      expect(text.charCodeAt(probe)).assertEqual(100);
      expect(text.substring(probe)).assertEqual('description');
      expect(text.indexOf('d')).assertEqual(0);
      expect(res.getStringByNameSync('shared_desc')).assertEqual(text);
    });
    /**
     * @tc.number    SUB_IHSP_LRES_0002
     * @tc.name      testLibraryResource0002
     * @tc.desc      Library string shared_desc offset 1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testLibraryResource0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const installed: boolean = await libraryInstalled();
      if (!installed) {
        logCase('testLibraryResource0002', 'library module not installed');
        return;
      }
      const res: resourceManager.ResourceManager = moduleContext(LIB_MODULE).resourceManager;
      const text: string = res.getStringByNameSync('shared_desc');
      const probe: number = 1;
      logCase('testLibraryResource0002', 'shared desc offset=' + probe);
      expect(text).assertEqual('description');
      expect(text.length).assertEqual(11);
      expect(text.charAt(probe)).assertEqual('e');
      expect(text.charCodeAt(probe)).assertEqual(101);
      expect(text.substring(probe)).assertEqual('escription');
      expect(text.indexOf('e')).assertEqual(1);
      expect(res.getStringByNameSync('shared_desc')).assertEqual(text);
    });
    /**
     * @tc.number    SUB_IHSP_LRES_0003
     * @tc.name      testLibraryResource0003
     * @tc.desc      Library string shared_desc offset 2
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testLibraryResource0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const installed: boolean = await libraryInstalled();
      if (!installed) {
        logCase('testLibraryResource0003', 'library module not installed');
        return;
      }
      const res: resourceManager.ResourceManager = moduleContext(LIB_MODULE).resourceManager;
      const text: string = res.getStringByNameSync('shared_desc');
      const probe: number = 2;
      logCase('testLibraryResource0003', 'shared desc offset=' + probe);
      expect(text).assertEqual('description');
      expect(text.length).assertEqual(11);
      expect(text.charAt(probe)).assertEqual('s');
      expect(text.charCodeAt(probe)).assertEqual(115);
      expect(text.substring(probe)).assertEqual('scription');
      expect(text.indexOf('s')).assertEqual(2);
      expect(res.getStringByNameSync('shared_desc')).assertEqual(text);
    });
    /**
     * @tc.number    SUB_IHSP_LRES_0004
     * @tc.name      testLibraryResource0004
     * @tc.desc      Library string shared_desc offset 3
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testLibraryResource0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const installed: boolean = await libraryInstalled();
      if (!installed) {
        logCase('testLibraryResource0004', 'library module not installed');
        return;
      }
      const res: resourceManager.ResourceManager = moduleContext(LIB_MODULE).resourceManager;
      const text: string = res.getStringByNameSync('shared_desc');
      const probe: number = 3;
      logCase('testLibraryResource0004', 'shared desc offset=' + probe);
      expect(text).assertEqual('description');
      expect(text.length).assertEqual(11);
      expect(text.charAt(probe)).assertEqual('c');
      expect(text.charCodeAt(probe)).assertEqual(99);
      expect(text.substring(probe)).assertEqual('cription');
      expect(text.indexOf('c')).assertEqual(3);
      expect(res.getStringByNameSync('shared_desc')).assertEqual(text);
    });
    /**
     * @tc.number    SUB_IHSP_LRES_0005
     * @tc.name      testLibraryResource0005
     * @tc.desc      Library string shared_desc offset 4
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testLibraryResource0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const installed: boolean = await libraryInstalled();
      if (!installed) {
        logCase('testLibraryResource0005', 'library module not installed');
        return;
      }
      const res: resourceManager.ResourceManager = moduleContext(LIB_MODULE).resourceManager;
      const text: string = res.getStringByNameSync('shared_desc');
      const probe: number = 4;
      logCase('testLibraryResource0005', 'shared desc offset=' + probe);
      expect(text).assertEqual('description');
      expect(text.length).assertEqual(11);
      expect(text.charAt(probe)).assertEqual('r');
      expect(text.charCodeAt(probe)).assertEqual(114);
      expect(text.substring(probe)).assertEqual('ription');
      expect(text.indexOf('r')).assertEqual(4);
      expect(res.getStringByNameSync('shared_desc')).assertEqual(text);
    });
    /**
     * @tc.number    SUB_IHSP_LRES_0006
     * @tc.name      testLibraryResource0006
     * @tc.desc      Library string shared_desc offset 5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testLibraryResource0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const installed: boolean = await libraryInstalled();
      if (!installed) {
        logCase('testLibraryResource0006', 'library module not installed');
        return;
      }
      const res: resourceManager.ResourceManager = moduleContext(LIB_MODULE).resourceManager;
      const text: string = res.getStringByNameSync('shared_desc');
      const probe: number = 5;
      logCase('testLibraryResource0006', 'shared desc offset=' + probe);
      expect(text).assertEqual('description');
      expect(text.length).assertEqual(11);
      expect(text.charAt(probe)).assertEqual('i');
      expect(text.charCodeAt(probe)).assertEqual(105);
      expect(text.substring(probe)).assertEqual('iption');
      expect(text.indexOf('i')).assertEqual(5);
      expect(res.getStringByNameSync('shared_desc')).assertEqual(text);
    });
    /**
     * @tc.number    SUB_IHSP_LRES_0007
     * @tc.name      testLibraryResource0007
     * @tc.desc      Library string shared_desc offset 6
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLibraryResource0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const installed: boolean = await libraryInstalled();
      if (!installed) {
        logCase('testLibraryResource0007', 'library module not installed');
        return;
      }
      const res: resourceManager.ResourceManager = moduleContext(LIB_MODULE).resourceManager;
      const text: string = res.getStringByNameSync('shared_desc');
      const probe: number = 6;
      logCase('testLibraryResource0007', 'shared desc offset=' + probe);
      expect(text).assertEqual('description');
      expect(text.length).assertEqual(11);
      expect(text.charAt(probe)).assertEqual('p');
      expect(text.charCodeAt(probe)).assertEqual(112);
      expect(text.substring(probe)).assertEqual('ption');
      expect(text.indexOf('p')).assertEqual(6);
      expect(res.getStringByNameSync('shared_desc')).assertEqual(text);
    });
    /**
     * @tc.number    SUB_IHSP_LRES_0008
     * @tc.name      testLibraryResource0008
     * @tc.desc      Library string shared_desc offset 7
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLibraryResource0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const installed: boolean = await libraryInstalled();
      if (!installed) {
        logCase('testLibraryResource0008', 'library module not installed');
        return;
      }
      const res: resourceManager.ResourceManager = moduleContext(LIB_MODULE).resourceManager;
      const text: string = res.getStringByNameSync('shared_desc');
      const probe: number = 7;
      logCase('testLibraryResource0008', 'shared desc offset=' + probe);
      expect(text).assertEqual('description');
      expect(text.length).assertEqual(11);
      expect(text.charAt(probe)).assertEqual('t');
      expect(text.charCodeAt(probe)).assertEqual(116);
      expect(text.substring(probe)).assertEqual('tion');
      expect(text.indexOf('t')).assertEqual(7);
      expect(res.getStringByNameSync('shared_desc')).assertEqual(text);
    });
    /**
     * @tc.number    SUB_IHSP_LRES_0009
     * @tc.name      testLibraryResource0009
     * @tc.desc      Library string shared_desc offset 8
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLibraryResource0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const installed: boolean = await libraryInstalled();
      if (!installed) {
        logCase('testLibraryResource0009', 'library module not installed');
        return;
      }
      const res: resourceManager.ResourceManager = moduleContext(LIB_MODULE).resourceManager;
      const text: string = res.getStringByNameSync('shared_desc');
      const probe: number = 8;
      logCase('testLibraryResource0009', 'shared desc offset=' + probe);
      expect(text).assertEqual('description');
      expect(text.length).assertEqual(11);
      expect(text.charAt(probe)).assertEqual('i');
      expect(text.charCodeAt(probe)).assertEqual(105);
      expect(text.substring(probe)).assertEqual('ion');
      expect(text.indexOf('i')).assertEqual(5);
      expect(res.getStringByNameSync('shared_desc')).assertEqual(text);
    });
    /**
     * @tc.number    SUB_IHSP_LRES_0010
     * @tc.name      testLibraryResource0010
     * @tc.desc      Library string shared_desc offset 9
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLibraryResource0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const installed: boolean = await libraryInstalled();
      if (!installed) {
        logCase('testLibraryResource0010', 'library module not installed');
        return;
      }
      const res: resourceManager.ResourceManager = moduleContext(LIB_MODULE).resourceManager;
      const text: string = res.getStringByNameSync('shared_desc');
      const probe: number = 9;
      logCase('testLibraryResource0010', 'shared desc offset=' + probe);
      expect(text).assertEqual('description');
      expect(text.length).assertEqual(11);
      expect(text.charAt(probe)).assertEqual('o');
      expect(text.charCodeAt(probe)).assertEqual(111);
      expect(text.substring(probe)).assertEqual('on');
      expect(text.indexOf('o')).assertEqual(9);
      expect(res.getStringByNameSync('shared_desc')).assertEqual(text);
    });
    /**
     * @tc.number    SUB_IHSP_LRES_0011
     * @tc.name      testLibraryResource0011
     * @tc.desc      Library string shared_desc offset 10
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLibraryResource0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const installed: boolean = await libraryInstalled();
      if (!installed) {
        logCase('testLibraryResource0011', 'library module not installed');
        return;
      }
      const res: resourceManager.ResourceManager = moduleContext(LIB_MODULE).resourceManager;
      const text: string = res.getStringByNameSync('shared_desc');
      const probe: number = 10;
      logCase('testLibraryResource0011', 'shared desc offset=' + probe);
      expect(text).assertEqual('description');
      expect(text.length).assertEqual(11);
      expect(text.charAt(probe)).assertEqual('n');
      expect(text.charCodeAt(probe)).assertEqual(110);
      expect(text.substring(probe)).assertEqual('n');
      expect(text.indexOf('n')).assertEqual(10);
      expect(res.getStringByNameSync('shared_desc')).assertEqual(text);
    });
    /**
     * @tc.number    SUB_IHSP_LRES_0012
     * @tc.name      testLibraryResource0012
     * @tc.desc      Library string shared_desc keeps prefix two
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLibraryResource0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const installed: boolean = await libraryInstalled();
      if (!installed) {
        logCase('testLibraryResource0012', 'library module not installed');
        return;
      }
      const res: resourceManager.ResourceManager = moduleContext(LIB_MODULE).resourceManager;
      const text: string = res.getStringByNameSync('shared_desc');
      logCase('testLibraryResource0012', 'shared desc prefix two');
      expect(text).assertEqual('description');
      expect(text.substring(0, 2)).assertEqual('de');
    });
    /**
     * @tc.number    SUB_IHSP_LRES_0013
     * @tc.name      testLibraryResource0013
     * @tc.desc      Library string shared_desc keeps suffix two
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLibraryResource0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const installed: boolean = await libraryInstalled();
      if (!installed) {
        logCase('testLibraryResource0013', 'library module not installed');
        return;
      }
      const res: resourceManager.ResourceManager = moduleContext(LIB_MODULE).resourceManager;
      const text: string = res.getStringByNameSync('shared_desc');
      logCase('testLibraryResource0013', 'shared desc suffix two');
      expect(text).assertEqual('description');
      expect(text.substring(9)).assertEqual('on');
    });
    /**
     * @tc.number    SUB_IHSP_LRES_0014
     * @tc.name      testLibraryResource0014
     * @tc.desc      Library string shared_desc keeps checksum
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLibraryResource0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const installed: boolean = await libraryInstalled();
      if (!installed) {
        logCase('testLibraryResource0014', 'library module not installed');
        return;
      }
      const res: resourceManager.ResourceManager = moduleContext(LIB_MODULE).resourceManager;
      const text: string = res.getStringByNameSync('shared_desc');
      logCase('testLibraryResource0014', 'shared desc checksum');
      expect(text).assertEqual('description');
      let sum: number = 0;
      for (let k: number = 0; k < text.length; k++) {
        sum += text.charCodeAt(k);
      }
      expect(sum).assertEqual(1188);
    });
    /**
     * @tc.number    SUB_IHSP_LRES_0015
     * @tc.name      testLibraryResource0015
     * @tc.desc      Library string shared_desc keeps letter count
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLibraryResource0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const installed: boolean = await libraryInstalled();
      if (!installed) {
        logCase('testLibraryResource0015', 'library module not installed');
        return;
      }
      const res: resourceManager.ResourceManager = moduleContext(LIB_MODULE).resourceManager;
      const text: string = res.getStringByNameSync('shared_desc');
      logCase('testLibraryResource0015', 'shared desc letter count');
      expect(text).assertEqual('description');
      expect(text.split('i').length - 1).assertEqual(2);
    });
    /**
     * @tc.number    SUB_IHSP_LRES_0016
     * @tc.name      testLibraryResource0016
     * @tc.desc      Library string shared_desc keeps upper length
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLibraryResource0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const installed: boolean = await libraryInstalled();
      if (!installed) {
        logCase('testLibraryResource0016', 'library module not installed');
        return;
      }
      const res: resourceManager.ResourceManager = moduleContext(LIB_MODULE).resourceManager;
      const text: string = res.getStringByNameSync('shared_desc');
      logCase('testLibraryResource0016', 'shared desc upper length');
      expect(text).assertEqual('description');
      expect(text.toUpperCase().length).assertEqual(11);
    });
    /**
     * @tc.number    SUB_IHSP_LRES_0017
     * @tc.name      testLibraryResource0017
     * @tc.desc      Library string shared_desc keeps trim
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLibraryResource0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const installed: boolean = await libraryInstalled();
      if (!installed) {
        logCase('testLibraryResource0017', 'library module not installed');
        return;
      }
      const res: resourceManager.ResourceManager = moduleContext(LIB_MODULE).resourceManager;
      const text: string = res.getStringByNameSync('shared_desc');
      logCase('testLibraryResource0017', 'shared desc trim');
      expect(text).assertEqual('description');
      expect(text.trim()).assertEqual(text);
    });
    /**
     * @tc.number    SUB_IHSP_LRES_0018
     * @tc.name      testLibraryResource0018
     * @tc.desc      Library string shared_desc keeps merge
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLibraryResource0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const installed: boolean = await libraryInstalled();
      if (!installed) {
        logCase('testLibraryResource0018', 'library module not installed');
        return;
      }
      const res: resourceManager.ResourceManager = moduleContext(LIB_MODULE).resourceManager;
      const text: string = res.getStringByNameSync('shared_desc');
      logCase('testLibraryResource0018', 'shared desc merge');
      expect(text).assertEqual('description');
      expect(text.substring(0, 5) + text.substring(5)).assertEqual(text);
    });
    /**
     * @tc.number    SUB_IHSP_LRES_0019
     * @tc.name      testLibraryResource0019
     * @tc.desc      Library string shared_desc keeps repeat
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLibraryResource0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const installed: boolean = await libraryInstalled();
      if (!installed) {
        logCase('testLibraryResource0019', 'library module not installed');
        return;
      }
      const res: resourceManager.ResourceManager = moduleContext(LIB_MODULE).resourceManager;
      const text: string = res.getStringByNameSync('shared_desc');
      logCase('testLibraryResource0019', 'shared desc repeat');
      expect(text).assertEqual('description');
      expect(res.getStringByNameSync('shared_desc').length).assertEqual(text.length);
    });
    /**
     * @tc.number    SUB_IHSP_LRES_0020
     * @tc.name      testLibraryResource0020
     * @tc.desc      Library string shared_desc keeps compare
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLibraryResource0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const installed: boolean = await libraryInstalled();
      if (!installed) {
        logCase('testLibraryResource0020', 'library module not installed');
        return;
      }
      const res: resourceManager.ResourceManager = moduleContext(LIB_MODULE).resourceManager;
      const text: string = res.getStringByNameSync('shared_desc');
      logCase('testLibraryResource0020', 'shared desc compare');
      expect(text).assertEqual('description');
      expect(text.localeCompare(text)).assertEqual(0);
    });
    /**
     * @tc.number    SUB_IHSP_LRES_0021
     * @tc.name      testLibraryResource0021
     * @tc.desc      Library string shared_desc keeps tail sum
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLibraryResource0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const installed: boolean = await libraryInstalled();
      if (!installed) {
        logCase('testLibraryResource0021', 'library module not installed');
        return;
      }
      const res: resourceManager.ResourceManager = moduleContext(LIB_MODULE).resourceManager;
      const text: string = res.getStringByNameSync('shared_desc');
      logCase('testLibraryResource0021', 'shared desc tail sum');
      expect(text).assertEqual('description');
      let tail: number = 0;
      for (let k: number = 6; k < text.length; k++) {
        tail += text.charCodeAt(k);
      }
      expect(tail).assertEqual(554);
    });
    /**
     * @tc.number    SUB_IHSP_LRES_0022
     * @tc.name      testLibraryResource0022
     * @tc.desc      Library string shared_desc keeps start end
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLibraryResource0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const installed: boolean = await libraryInstalled();
      if (!installed) {
        logCase('testLibraryResource0022', 'library module not installed');
        return;
      }
      const res: resourceManager.ResourceManager = moduleContext(LIB_MODULE).resourceManager;
      const text: string = res.getStringByNameSync('shared_desc');
      logCase('testLibraryResource0022', 'shared desc start end');
      expect(text).assertEqual('description');
      expect(text.startsWith('d')).assertTrue();
      expect(text.endsWith('n')).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LRES_0023
     * @tc.name      testLibraryResource0023
     * @tc.desc      Library module context paths probe 1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLibraryResource0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const installed: boolean = await libraryInstalled();
      if (!installed) {
        logCase('testLibraryResource0023', 'library module not installed');
        return;
      }
      const libCtx: common.Context = moduleContext(LIB_MODULE);
      const entryCtx: common.Context = moduleContext(ENTRY_MODULE);
      const probe: number = 1;
      logCase('testLibraryResource0023', 'library context probe=' + probe);
      expect(libCtx.filesDir.length > 0).assertTrue();
      expect(libCtx.filesDir !== entryCtx.filesDir).assertTrue();
      expect(libCtx.filesDir.includes(LIB_MODULE)).assertTrue();
      expect(libCtx.cacheDir.includes(LIB_MODULE)).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LRES_0024
     * @tc.name      testLibraryResource0024
     * @tc.desc      Library module context paths probe 2
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLibraryResource0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const installed: boolean = await libraryInstalled();
      if (!installed) {
        logCase('testLibraryResource0024', 'library module not installed');
        return;
      }
      const libCtx: common.Context = moduleContext(LIB_MODULE);
      const entryCtx: common.Context = moduleContext(ENTRY_MODULE);
      const probe: number = 2;
      logCase('testLibraryResource0024', 'library context probe=' + probe);
      expect(libCtx.filesDir.length > 0).assertTrue();
      expect(libCtx.filesDir !== entryCtx.filesDir).assertTrue();
      expect(libCtx.bundleCodeDir.includes(LIB_MODULE)).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LRES_0025
     * @tc.name      testLibraryResource0025
     * @tc.desc      Library module context paths probe 3
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLibraryResource0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const installed: boolean = await libraryInstalled();
      if (!installed) {
        logCase('testLibraryResource0025', 'library module not installed');
        return;
      }
      const libCtx: common.Context = moduleContext(LIB_MODULE);
      const entryCtx: common.Context = moduleContext(ENTRY_MODULE);
      const probe: number = 3;
      logCase('testLibraryResource0025', 'library context probe=' + probe);
      expect(libCtx.filesDir.length > 0).assertTrue();
      expect(libCtx.filesDir !== entryCtx.filesDir).assertTrue();
      expect(libCtx.tempDir.length > 0).assertTrue();
      expect(libCtx.tempDir !== entryCtx.tempDir).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LRES_0026
     * @tc.name      testLibraryResource0026
     * @tc.desc      Library module context paths probe 4
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLibraryResource0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const installed: boolean = await libraryInstalled();
      if (!installed) {
        logCase('testLibraryResource0026', 'library module not installed');
        return;
      }
      const libCtx: common.Context = moduleContext(LIB_MODULE);
      const entryCtx: common.Context = moduleContext(ENTRY_MODULE);
      const probe: number = 4;
      logCase('testLibraryResource0026', 'library context probe=' + probe);
      expect(libCtx.filesDir.length > 0).assertTrue();
      expect(libCtx.filesDir !== entryCtx.filesDir).assertTrue();
      expect(libCtx.resourceDir.length > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LRES_0027
     * @tc.name      testLibraryResource0027
     * @tc.desc      Library module context paths probe 5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLibraryResource0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const installed: boolean = await libraryInstalled();
      if (!installed) {
        logCase('testLibraryResource0027', 'library module not installed');
        return;
      }
      const libCtx: common.Context = moduleContext(LIB_MODULE);
      const entryCtx: common.Context = moduleContext(ENTRY_MODULE);
      const probe: number = 5;
      logCase('testLibraryResource0027', 'library context probe=' + probe);
      expect(libCtx.filesDir.length > 0).assertTrue();
      expect(libCtx.filesDir !== entryCtx.filesDir).assertTrue();
      expect(libCtx.preferencesDir.length > 0).assertTrue();
      expect(libCtx.preferencesDir !== entryCtx.preferencesDir).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LRES_0028
     * @tc.name      testLibraryResource0028
     * @tc.desc      Library module context paths probe 6
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLibraryResource0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const installed: boolean = await libraryInstalled();
      if (!installed) {
        logCase('testLibraryResource0028', 'library module not installed');
        return;
      }
      const libCtx: common.Context = moduleContext(LIB_MODULE);
      const entryCtx: common.Context = moduleContext(ENTRY_MODULE);
      const probe: number = 6;
      logCase('testLibraryResource0028', 'library context probe=' + probe);
      expect(libCtx.filesDir.length > 0).assertTrue();
      expect(libCtx.filesDir !== entryCtx.filesDir).assertTrue();
      expect(libCtx.databaseDir.length > 0).assertTrue();
      expect(libCtx.databaseDir !== entryCtx.databaseDir).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LRES_0029
     * @tc.name      testLibraryResource0029
     * @tc.desc      Library module context paths probe 7
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLibraryResource0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const installed: boolean = await libraryInstalled();
      if (!installed) {
        logCase('testLibraryResource0029', 'library module not installed');
        return;
      }
      const libCtx: common.Context = moduleContext(LIB_MODULE);
      const entryCtx: common.Context = moduleContext(ENTRY_MODULE);
      const probe: number = 7;
      logCase('testLibraryResource0029', 'library context probe=' + probe);
      expect(libCtx.filesDir.length > 0).assertTrue();
      expect(libCtx.filesDir !== entryCtx.filesDir).assertTrue();
      expect(libCtx.filesDir.startsWith('/data/storage')).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LRES_0030
     * @tc.name      testLibraryResource0030
     * @tc.desc      Library module context paths probe 8
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLibraryResource0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const installed: boolean = await libraryInstalled();
      if (!installed) {
        logCase('testLibraryResource0030', 'library module not installed');
        return;
      }
      const libCtx: common.Context = moduleContext(LIB_MODULE);
      const entryCtx: common.Context = moduleContext(ENTRY_MODULE);
      const probe: number = 8;
      logCase('testLibraryResource0030', 'library context probe=' + probe);
      expect(libCtx.filesDir.length > 0).assertTrue();
      expect(libCtx.filesDir !== entryCtx.filesDir).assertTrue();
      expect(libCtx.cacheDir !== libCtx.filesDir).assertTrue();
    });
;
  });
}
