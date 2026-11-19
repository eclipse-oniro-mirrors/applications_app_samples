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
