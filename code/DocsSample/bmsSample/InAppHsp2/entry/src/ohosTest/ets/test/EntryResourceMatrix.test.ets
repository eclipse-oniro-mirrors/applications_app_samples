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
import { moduleContext, appContext, pngWidth, pngHeight, pngBitDepth, pngColorType, pngChunkType,
  firstBytesSum, bytesToText } from './shared/Probe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

export default function entryResourceMatrixTest() {
  describe('EntryResourceMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });
    /**
     * @tc.number    SUB_IHSP_ERES_0001
     * @tc.name      testEntryResource0001
     * @tc.desc      String module_desc keeps offset 0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryResource0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const res: resourceManager.ResourceManager = moduleContext('entry').resourceManager;
      const text: string = res.getStringByNameSync('module_desc');
      const probe: number = 0;
      logCase('testEntryResource0001', 'key=module_desc offset=' + probe);
      expect(text).assertEqual('module description');
      expect(text.length).assertEqual(18);
      expect(text.charAt(probe)).assertEqual('m');
      expect(text.charCodeAt(probe)).assertEqual(109);
      expect(text.substring(probe)).assertEqual('module description');
      expect(text.substring(0, probe)).assertEqual('');
      expect(text.indexOf('m')).assertEqual(0);
      expect(text.lastIndexOf('m')).assertEqual(0);
      expect(res.getStringByNameSync('module_desc')).assertEqual(text);
    });
    /**
     * @tc.number    SUB_IHSP_ERES_0002
     * @tc.name      testEntryResource0002
     * @tc.desc      String module_desc keeps offset 1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryResource0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const res: resourceManager.ResourceManager = moduleContext('entry').resourceManager;
      const text: string = res.getStringByNameSync('module_desc');
      const probe: number = 1;
      logCase('testEntryResource0002', 'key=module_desc offset=' + probe);
      expect(text).assertEqual('module description');
      expect(text.length).assertEqual(18);
      expect(text.charAt(probe)).assertEqual('o');
      expect(text.charCodeAt(probe)).assertEqual(111);
      expect(text.substring(probe)).assertEqual('odule description');
      expect(text.substring(0, probe)).assertEqual('m');
      expect(text.indexOf('o')).assertEqual(1);
      expect(text.lastIndexOf('o')).assertEqual(16);
      expect(res.getStringByNameSync('module_desc')).assertEqual(text);
    });
    /**
     * @tc.number    SUB_IHSP_ERES_0003
     * @tc.name      testEntryResource0003
     * @tc.desc      String module_desc keeps offset 2
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryResource0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const res: resourceManager.ResourceManager = moduleContext('entry').resourceManager;
      const text: string = res.getStringByNameSync('module_desc');
      const probe: number = 2;
      logCase('testEntryResource0003', 'key=module_desc offset=' + probe);
      expect(text).assertEqual('module description');
      expect(text.length).assertEqual(18);
      expect(text.charAt(probe)).assertEqual('d');
      expect(text.charCodeAt(probe)).assertEqual(100);
      expect(text.substring(probe)).assertEqual('dule description');
      expect(text.substring(0, probe)).assertEqual('mo');
      expect(text.indexOf('d')).assertEqual(2);
      expect(text.lastIndexOf('d')).assertEqual(7);
      expect(res.getStringByNameSync('module_desc')).assertEqual(text);
    });
    /**
     * @tc.number    SUB_IHSP_ERES_0004
     * @tc.name      testEntryResource0004
     * @tc.desc      String module_desc keeps offset 3
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryResource0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const res: resourceManager.ResourceManager = moduleContext('entry').resourceManager;
      const text: string = res.getStringByNameSync('module_desc');
      const probe: number = 3;
      logCase('testEntryResource0004', 'key=module_desc offset=' + probe);
      expect(text).assertEqual('module description');
      expect(text.length).assertEqual(18);
      expect(text.charAt(probe)).assertEqual('u');
      expect(text.charCodeAt(probe)).assertEqual(117);
      expect(text.substring(probe)).assertEqual('ule description');
      expect(text.substring(0, probe)).assertEqual('mod');
      expect(text.indexOf('u')).assertEqual(3);
      expect(text.lastIndexOf('u')).assertEqual(3);
      expect(res.getStringByNameSync('module_desc')).assertEqual(text);
    });
    /**
     * @tc.number    SUB_IHSP_ERES_0005
     * @tc.name      testEntryResource0005
     * @tc.desc      String module_desc keeps offset 4
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryResource0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const res: resourceManager.ResourceManager = moduleContext('entry').resourceManager;
      const text: string = res.getStringByNameSync('module_desc');
      const probe: number = 4;
      logCase('testEntryResource0005', 'key=module_desc offset=' + probe);
      expect(text).assertEqual('module description');
      expect(text.length).assertEqual(18);
      expect(text.charAt(probe)).assertEqual('l');
      expect(text.charCodeAt(probe)).assertEqual(108);
      expect(text.substring(probe)).assertEqual('le description');
      expect(text.substring(0, probe)).assertEqual('modu');
      expect(text.indexOf('l')).assertEqual(4);
      expect(text.lastIndexOf('l')).assertEqual(4);
      expect(res.getStringByNameSync('module_desc')).assertEqual(text);
    });
    /**
     * @tc.number    SUB_IHSP_ERES_0006
     * @tc.name      testEntryResource0006
     * @tc.desc      String module_desc keeps offset 5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryResource0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const res: resourceManager.ResourceManager = moduleContext('entry').resourceManager;
      const text: string = res.getStringByNameSync('module_desc');
      const probe: number = 5;
      logCase('testEntryResource0006', 'key=module_desc offset=' + probe);
      expect(text).assertEqual('module description');
      expect(text.length).assertEqual(18);
      expect(text.charAt(probe)).assertEqual('e');
      expect(text.charCodeAt(probe)).assertEqual(101);
      expect(text.substring(probe)).assertEqual('e description');
      expect(text.substring(0, probe)).assertEqual('modul');
      expect(text.indexOf('e')).assertEqual(5);
      expect(text.lastIndexOf('e')).assertEqual(8);
      expect(res.getStringByNameSync('module_desc')).assertEqual(text);
    });
    /**
     * @tc.number    SUB_IHSP_ERES_0007
     * @tc.name      testEntryResource0007
     * @tc.desc      String module_desc keeps offset 6
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryResource0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const res: resourceManager.ResourceManager = moduleContext('entry').resourceManager;
      const text: string = res.getStringByNameSync('module_desc');
      const probe: number = 6;
      logCase('testEntryResource0007', 'key=module_desc offset=' + probe);
      expect(text).assertEqual('module description');
      expect(text.length).assertEqual(18);
      expect(text.charAt(probe)).assertEqual(' ');
      expect(text.charCodeAt(probe)).assertEqual(32);
      expect(text.substring(probe)).assertEqual(' description');
      expect(text.substring(0, probe)).assertEqual('module');
      expect(text.indexOf(' ')).assertEqual(6);
      expect(text.lastIndexOf(' ')).assertEqual(6);
      expect(res.getStringByNameSync('module_desc')).assertEqual(text);
    });
    /**
     * @tc.number    SUB_IHSP_ERES_0008
     * @tc.name      testEntryResource0008
     * @tc.desc      String module_desc keeps offset 7
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryResource0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const res: resourceManager.ResourceManager = moduleContext('entry').resourceManager;
      const text: string = res.getStringByNameSync('module_desc');
      const probe: number = 7;
      logCase('testEntryResource0008', 'key=module_desc offset=' + probe);
      expect(text).assertEqual('module description');
      expect(text.length).assertEqual(18);
      expect(text.charAt(probe)).assertEqual('d');
      expect(text.charCodeAt(probe)).assertEqual(100);
      expect(text.substring(probe)).assertEqual('description');
      expect(text.substring(0, probe)).assertEqual('module ');
      expect(text.indexOf('d')).assertEqual(2);
      expect(text.lastIndexOf('d')).assertEqual(7);
      expect(res.getStringByNameSync('module_desc')).assertEqual(text);
    });
    /**
     * @tc.number    SUB_IHSP_ERES_0009
     * @tc.name      testEntryResource0009
     * @tc.desc      String module_desc keeps offset 8
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryResource0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const res: resourceManager.ResourceManager = moduleContext('entry').resourceManager;
      const text: string = res.getStringByNameSync('module_desc');
      const probe: number = 8;
      logCase('testEntryResource0009', 'key=module_desc offset=' + probe);
      expect(text).assertEqual('module description');
      expect(text.length).assertEqual(18);
      expect(text.charAt(probe)).assertEqual('e');
      expect(text.charCodeAt(probe)).assertEqual(101);
      expect(text.substring(probe)).assertEqual('escription');
      expect(text.substring(0, probe)).assertEqual('module d');
      expect(text.indexOf('e')).assertEqual(5);
      expect(text.lastIndexOf('e')).assertEqual(8);
      expect(res.getStringByNameSync('module_desc')).assertEqual(text);
    });
    /**
     * @tc.number    SUB_IHSP_ERES_0010
     * @tc.name      testEntryResource0010
     * @tc.desc      String module_desc keeps offset 9
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryResource0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const res: resourceManager.ResourceManager = moduleContext('entry').resourceManager;
      const text: string = res.getStringByNameSync('module_desc');
      const probe: number = 9;
      logCase('testEntryResource0010', 'key=module_desc offset=' + probe);
      expect(text).assertEqual('module description');
      expect(text.length).assertEqual(18);
      expect(text.charAt(probe)).assertEqual('s');
      expect(text.charCodeAt(probe)).assertEqual(115);
      expect(text.substring(probe)).assertEqual('scription');
      expect(text.substring(0, probe)).assertEqual('module de');
      expect(text.indexOf('s')).assertEqual(9);
      expect(text.lastIndexOf('s')).assertEqual(9);
      expect(res.getStringByNameSync('module_desc')).assertEqual(text);
    });
    /**
     * @tc.number    SUB_IHSP_ERES_0011
     * @tc.name      testEntryResource0011
     * @tc.desc      String module_desc keeps offset 10
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryResource0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const res: resourceManager.ResourceManager = moduleContext('entry').resourceManager;
      const text: string = res.getStringByNameSync('module_desc');
      const probe: number = 10;
      logCase('testEntryResource0011', 'key=module_desc offset=' + probe);
      expect(text).assertEqual('module description');
      expect(text.length).assertEqual(18);
      expect(text.charAt(probe)).assertEqual('c');
      expect(text.charCodeAt(probe)).assertEqual(99);
      expect(text.substring(probe)).assertEqual('cription');
      expect(text.substring(0, probe)).assertEqual('module des');
      expect(text.indexOf('c')).assertEqual(10);
      expect(text.lastIndexOf('c')).assertEqual(10);
      expect(res.getStringByNameSync('module_desc')).assertEqual(text);
    });
    /**
     * @tc.number    SUB_IHSP_ERES_0012
     * @tc.name      testEntryResource0012
     * @tc.desc      String module_desc keeps offset 11
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryResource0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const res: resourceManager.ResourceManager = moduleContext('entry').resourceManager;
      const text: string = res.getStringByNameSync('module_desc');
      const probe: number = 11;
      logCase('testEntryResource0012', 'key=module_desc offset=' + probe);
      expect(text).assertEqual('module description');
      expect(text.length).assertEqual(18);
      expect(text.charAt(probe)).assertEqual('r');
      expect(text.charCodeAt(probe)).assertEqual(114);
      expect(text.substring(probe)).assertEqual('ription');
      expect(text.substring(0, probe)).assertEqual('module desc');
      expect(text.indexOf('r')).assertEqual(11);
      expect(text.lastIndexOf('r')).assertEqual(11);
      expect(res.getStringByNameSync('module_desc')).assertEqual(text);
    });
    /**
     * @tc.number    SUB_IHSP_ERES_0013
     * @tc.name      testEntryResource0013
     * @tc.desc      String module_desc keeps offset 12
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryResource0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const res: resourceManager.ResourceManager = moduleContext('entry').resourceManager;
      const text: string = res.getStringByNameSync('module_desc');
      const probe: number = 12;
      logCase('testEntryResource0013', 'key=module_desc offset=' + probe);
      expect(text).assertEqual('module description');
      expect(text.length).assertEqual(18);
      expect(text.charAt(probe)).assertEqual('i');
      expect(text.charCodeAt(probe)).assertEqual(105);
      expect(text.substring(probe)).assertEqual('iption');
      expect(text.substring(0, probe)).assertEqual('module descr');
      expect(text.indexOf('i')).assertEqual(12);
      expect(text.lastIndexOf('i')).assertEqual(15);
      expect(res.getStringByNameSync('module_desc')).assertEqual(text);
    });
    /**
     * @tc.number    SUB_IHSP_ERES_0014
     * @tc.name      testEntryResource0014
     * @tc.desc      String module_desc keeps offset 13
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryResource0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const res: resourceManager.ResourceManager = moduleContext('entry').resourceManager;
      const text: string = res.getStringByNameSync('module_desc');
      const probe: number = 13;
      logCase('testEntryResource0014', 'key=module_desc offset=' + probe);
      expect(text).assertEqual('module description');
      expect(text.length).assertEqual(18);
      expect(text.charAt(probe)).assertEqual('p');
      expect(text.charCodeAt(probe)).assertEqual(112);
      expect(text.substring(probe)).assertEqual('ption');
      expect(text.substring(0, probe)).assertEqual('module descri');
      expect(text.indexOf('p')).assertEqual(13);
      expect(text.lastIndexOf('p')).assertEqual(13);
      expect(res.getStringByNameSync('module_desc')).assertEqual(text);
    });
    /**
     * @tc.number    SUB_IHSP_ERES_0015
     * @tc.name      testEntryResource0015
     * @tc.desc      String module_desc keeps offset 14
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryResource0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const res: resourceManager.ResourceManager = moduleContext('entry').resourceManager;
      const text: string = res.getStringByNameSync('module_desc');
      const probe: number = 14;
      logCase('testEntryResource0015', 'key=module_desc offset=' + probe);
      expect(text).assertEqual('module description');
      expect(text.length).assertEqual(18);
      expect(text.charAt(probe)).assertEqual('t');
      expect(text.charCodeAt(probe)).assertEqual(116);
      expect(text.substring(probe)).assertEqual('tion');
      expect(text.substring(0, probe)).assertEqual('module descrip');
      expect(text.indexOf('t')).assertEqual(14);
      expect(text.lastIndexOf('t')).assertEqual(14);
      expect(res.getStringByNameSync('module_desc')).assertEqual(text);
    });
    /**
     * @tc.number    SUB_IHSP_ERES_0016
     * @tc.name      testEntryResource0016
     * @tc.desc      String module_desc keeps offset 15
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryResource0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const res: resourceManager.ResourceManager = moduleContext('entry').resourceManager;
      const text: string = res.getStringByNameSync('module_desc');
      const probe: number = 15;
      logCase('testEntryResource0016', 'key=module_desc offset=' + probe);
      expect(text).assertEqual('module description');
      expect(text.length).assertEqual(18);
      expect(text.charAt(probe)).assertEqual('i');
      expect(text.charCodeAt(probe)).assertEqual(105);
      expect(text.substring(probe)).assertEqual('ion');
      expect(text.substring(0, probe)).assertEqual('module descript');
      expect(text.indexOf('i')).assertEqual(12);
      expect(text.lastIndexOf('i')).assertEqual(15);
      expect(res.getStringByNameSync('module_desc')).assertEqual(text);
    });
    /**
     * @tc.number    SUB_IHSP_ERES_0017
     * @tc.name      testEntryResource0017
     * @tc.desc      String module_desc keeps offset 16
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryResource0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const res: resourceManager.ResourceManager = moduleContext('entry').resourceManager;
      const text: string = res.getStringByNameSync('module_desc');
      const probe: number = 16;
      logCase('testEntryResource0017', 'key=module_desc offset=' + probe);
      expect(text).assertEqual('module description');
      expect(text.length).assertEqual(18);
      expect(text.charAt(probe)).assertEqual('o');
      expect(text.charCodeAt(probe)).assertEqual(111);
      expect(text.substring(probe)).assertEqual('on');
      expect(text.substring(0, probe)).assertEqual('module descripti');
      expect(text.indexOf('o')).assertEqual(1);
      expect(text.lastIndexOf('o')).assertEqual(16);
      expect(res.getStringByNameSync('module_desc')).assertEqual(text);
    });
    /**
     * @tc.number    SUB_IHSP_ERES_0018
     * @tc.name      testEntryResource0018
     * @tc.desc      String module_desc keeps offset 17
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryResource0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const res: resourceManager.ResourceManager = moduleContext('entry').resourceManager;
      const text: string = res.getStringByNameSync('module_desc');
      const probe: number = 17;
      logCase('testEntryResource0018', 'key=module_desc offset=' + probe);
      expect(text).assertEqual('module description');
      expect(text.length).assertEqual(18);
      expect(text.charAt(probe)).assertEqual('n');
      expect(text.charCodeAt(probe)).assertEqual(110);
      expect(text.substring(probe)).assertEqual('n');
      expect(text.substring(0, probe)).assertEqual('module descriptio');
      expect(text.indexOf('n')).assertEqual(17);
      expect(text.lastIndexOf('n')).assertEqual(17);
      expect(res.getStringByNameSync('module_desc')).assertEqual(text);
    });
    /**
     * @tc.number    SUB_IHSP_ERES_0019
     * @tc.name      testEntryResource0019
     * @tc.desc      String module_desc keeps prefix of two
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryResource0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const res: resourceManager.ResourceManager = moduleContext('entry').resourceManager;
      const text: string = res.getStringByNameSync('module_desc');
      logCase('testEntryResource0019', 'key=module_desc extra=prefix of two');
      expect(text.length).assertEqual(18);
      expect(text.substring(0, 2)).assertEqual('mo');
      expect(text.substring(2)).assertEqual('dule description');
    });
    /**
     * @tc.number    SUB_IHSP_ERES_0020
     * @tc.name      testEntryResource0020
     * @tc.desc      String module_desc keeps suffix of two
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryResource0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const res: resourceManager.ResourceManager = moduleContext('entry').resourceManager;
      const text: string = res.getStringByNameSync('module_desc');
      logCase('testEntryResource0020', 'key=module_desc extra=suffix of two');
      expect(text.length).assertEqual(18);
      expect(text.substring(16)).assertEqual('on');
      expect(text.endsWith('on')).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_ERES_0021
     * @tc.name      testEntryResource0021
     * @tc.desc      String module_desc keeps prefix of three
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryResource0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const res: resourceManager.ResourceManager = moduleContext('entry').resourceManager;
      const text: string = res.getStringByNameSync('module_desc');
      logCase('testEntryResource0021', 'key=module_desc extra=prefix of three');
      expect(text.length).assertEqual(18);
      expect(text.substring(0, 3)).assertEqual('mod');
      expect(text.substring(3)).assertEqual('ule description');
    });
    /**
     * @tc.number    SUB_IHSP_ERES_0022
     * @tc.name      testEntryResource0022
     * @tc.desc      String module_desc keeps suffix of three
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryResource0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const res: resourceManager.ResourceManager = moduleContext('entry').resourceManager;
      const text: string = res.getStringByNameSync('module_desc');
      logCase('testEntryResource0022', 'key=module_desc extra=suffix of three');
      expect(text.length).assertEqual(18);
      expect(text.substring(15)).assertEqual('ion');
      expect(text.startsWith('module descript')).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_ERES_0023
     * @tc.name      testEntryResource0023
     * @tc.desc      String module_desc keeps first character
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryResource0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const res: resourceManager.ResourceManager = moduleContext('entry').resourceManager;
      const text: string = res.getStringByNameSync('module_desc');
      logCase('testEntryResource0023', 'key=module_desc extra=first character');
      expect(text.length).assertEqual(18);
      expect(text.charAt(0)).assertEqual('m');
      expect(text.charCodeAt(0)).assertEqual(109);
    });
    /**
     * @tc.number    SUB_IHSP_ERES_0024
     * @tc.name      testEntryResource0024
     * @tc.desc      String module_desc keeps last character
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryResource0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const res: resourceManager.ResourceManager = moduleContext('entry').resourceManager;
      const text: string = res.getStringByNameSync('module_desc');
      logCase('testEntryResource0024', 'key=module_desc extra=last character');
      expect(text.length).assertEqual(18);
      expect(text.charAt(17)).assertEqual('n');
      expect(text.charCodeAt(17)).assertEqual(110);
    });
    /**
     * @tc.number    SUB_IHSP_ERES_0025
     * @tc.name      testEntryResource0025
     * @tc.desc      String module_desc keeps checksum
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryResource0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const res: resourceManager.ResourceManager = moduleContext('entry').resourceManager;
      const text: string = res.getStringByNameSync('module_desc');
      logCase('testEntryResource0025', 'key=module_desc extra=checksum');
      expect(text.length).assertEqual(18);
      let sum: number = 0;
      for (let k: number = 0; k < text.length; k++) {
        sum += text.charCodeAt(k);
      }
      expect(sum).assertEqual(1866);
    });
    /**
     * @tc.number    SUB_IHSP_ERES_0026
     * @tc.name      testEntryResource0026
     * @tc.desc      String module_desc keeps prefix checksum
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryResource0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const res: resourceManager.ResourceManager = moduleContext('entry').resourceManager;
      const text: string = res.getStringByNameSync('module_desc');
      logCase('testEntryResource0026', 'key=module_desc extra=prefix checksum');
      expect(text.length).assertEqual(18);
      let prefix: number = 0;
      for (let k: number = 0; k < 9; k++) {
        prefix += text.charCodeAt(k);
      }
      expect(prefix).assertEqual(879);
    });
    /**
     * @tc.number    SUB_IHSP_ERES_0027
     * @tc.name      testEntryResource0027
     * @tc.desc      String module_desc keeps uppercase length
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryResource0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const res: resourceManager.ResourceManager = moduleContext('entry').resourceManager;
      const text: string = res.getStringByNameSync('module_desc');
      logCase('testEntryResource0027', 'key=module_desc extra=uppercase length');
      expect(text.length).assertEqual(18);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
    });
    /**
     * @tc.number    SUB_IHSP_ERES_0028
     * @tc.name      testEntryResource0028
     * @tc.desc      String module_desc keeps trim identity
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryResource0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const res: resourceManager.ResourceManager = moduleContext('entry').resourceManager;
      const text: string = res.getStringByNameSync('module_desc');
      logCase('testEntryResource0028', 'key=module_desc extra=trim identity');
      expect(text.length).assertEqual(18);
      expect(text.trim()).assertEqual(text);
      expect(text.trim().length).assertEqual(18);
    });
    /**
     * @tc.number    SUB_IHSP_ERES_0029
     * @tc.name      testEntryResource0029
     * @tc.desc      String module_desc keeps space split
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryResource0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const res: resourceManager.ResourceManager = moduleContext('entry').resourceManager;
      const text: string = res.getStringByNameSync('module_desc');
      logCase('testEntryResource0029', 'key=module_desc extra=space split');
      expect(text.length).assertEqual(18);
      expect(text.split(' ').length).assertEqual(2);
      expect(text.indexOf(' ')).assertEqual(6);
    });
    /**
     * @tc.number    SUB_IHSP_ERES_0030
     * @tc.name      testEntryResource0030
     * @tc.desc      String module_desc keeps join reconstruction
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryResource0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const res: resourceManager.ResourceManager = moduleContext('entry').resourceManager;
      const text: string = res.getStringByNameSync('module_desc');
      logCase('testEntryResource0030', 'key=module_desc extra=join reconstruction');
      expect(text.length).assertEqual(18);
      expect(text.split('').join('')).assertEqual(text);
      expect(text.split('').length).assertEqual(18);
    });
;
  });
}
