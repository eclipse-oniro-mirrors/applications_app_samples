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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { common, contextConstant } from '@kit.AbilityKit';
import hilog from '@ohos.hilog';
import { requireContext, requireModule, requireBundleInfo, byteLength, payload, probeFile, probeEvents,
  probeIndex, switchArea, FileProbe, EventProbe, IndexProbe } from '../Shared/ContextProbe';

export default function themeVariationTest(): void {
  describe('ThemeVariation', () => {
    beforeAll((): void => {
      expect(requireContext().applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    afterAll((): void => {
      hilog.info(0xF811, 'ContextTests', 'ThemeVariation completed');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_THEMEVARIATION_0001
     * @tc.name ThemeVariation_001
     * @tc.desc Verify EL2 filesDir isolation and restored context; files/create 128 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ThemeVariation_001', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_59_', 128);
      const actual: FileProbe = await probeFile('ThemeVariation59', 'files', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_THEMEVARIATION_0002
     * @tc.name ThemeVariation_002
     * @tc.desc Verify EL1 filesDir isolation and restored context; files/create 15 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ThemeVariation_002', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_60_', 15);
      const actual: FileProbe = await probeFile('ThemeVariation60', 'files', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_THEMEVARIATION_0003
     * @tc.name ThemeVariation_003
     * @tc.desc Verify EL2 filesDir isolation and restored context; cache/create 8191 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ThemeVariation_003', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_61_', 8191);
      const actual: FileProbe = await probeFile('ThemeVariation61', 'cache', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_THEMEVARIATION_0004
     * @tc.name ThemeVariation_004
     * @tc.desc Verify EL1 filesDir isolation and restored context; cache/create 512 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ThemeVariation_004', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_62_', 512);
      const actual: FileProbe = await probeFile('ThemeVariation62', 'cache', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_THEMEVARIATION_0005
     * @tc.name ThemeVariation_005
     * @tc.desc Verify EL2 filesDir isolation and restored context; cache/create 63 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ThemeVariation_005', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_63_', 63);
      const actual: FileProbe = await probeFile('ThemeVariation63', 'cache', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_THEMEVARIATION_0006
     * @tc.name ThemeVariation_006
     * @tc.desc Verify EL1 filesDir isolation and restored context; cache/create 2 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ThemeVariation_006', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_64_', 2);
      const actual: FileProbe = await probeFile('ThemeVariation64', 'cache', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_THEMEVARIATION_0007
     * @tc.name ThemeVariation_007
     * @tc.desc Verify EL2 filesDir isolation and restored context; cache/create 2048 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ThemeVariation_007', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_65_', 2048);
      const actual: FileProbe = await probeFile('ThemeVariation65', 'cache', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_THEMEVARIATION_0008
     * @tc.name ThemeVariation_008
     * @tc.desc Verify EL1 filesDir isolation and restored context; files/truncate 255 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ThemeVariation_008', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_66_', 255);
      const actual: FileProbe = await probeFile('ThemeVariation66', 'files', content, 'truncate');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_THEMEVARIATION_0009
     * @tc.name ThemeVariation_009
     * @tc.desc Verify EL2 filesDir isolation and restored context; files/truncate 16 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ThemeVariation_009', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_67_', 16);
      const actual: FileProbe = await probeFile('ThemeVariation67', 'files', content, 'truncate');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_THEMEVARIATION_0010
     * @tc.name ThemeVariation_010
     * @tc.desc Verify EL1 filesDir isolation and restored context; files/truncate 8192 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ThemeVariation_010', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_68_', 8192);
      const actual: FileProbe = await probeFile('ThemeVariation68', 'files', content, 'truncate');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_THEMEVARIATION_0011
     * @tc.name ThemeVariation_011
     * @tc.desc Verify EL2 filesDir isolation and restored context; files/truncate 1023 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ThemeVariation_011', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_69_', 1023);
      const actual: FileProbe = await probeFile('ThemeVariation69', 'files', content, 'truncate');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_THEMEVARIATION_0012
     * @tc.name ThemeVariation_012
     * @tc.desc Verify EL1 filesDir isolation and restored context; cache/truncate 64 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ThemeVariation_012', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_70_', 64);
      const actual: FileProbe = await probeFile('ThemeVariation70', 'cache', content, 'truncate');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_THEMEVARIATION_0013
     * @tc.name ThemeVariation_013
     * @tc.desc Verify EL2 filesDir isolation and restored context; cache/truncate 7 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ThemeVariation_013', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_71_', 7);
      const actual: FileProbe = await probeFile('ThemeVariation71', 'cache', content, 'truncate');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_THEMEVARIATION_0014
     * @tc.name ThemeVariation_014
     * @tc.desc Verify EL1 filesDir isolation and restored context; cache/truncate 4095 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ThemeVariation_014', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_72_', 4095);
      const actual: FileProbe = await probeFile('ThemeVariation72', 'cache', content, 'truncate');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_THEMEVARIATION_0015
     * @tc.name ThemeVariation_015
     * @tc.desc Verify EL2 filesDir isolation and restored context; cache/truncate 256 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ThemeVariation_015', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_73_', 256);
      const actual: FileProbe = await probeFile('ThemeVariation73', 'cache', content, 'truncate');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_THEMEVARIATION_0016
     * @tc.name ThemeVariation_016
     * @tc.desc Verify EL1 filesDir isolation and restored context; cache/truncate 31 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ThemeVariation_016', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_74_', 31);
      const actual: FileProbe = await probeFile('ThemeVariation74', 'cache', content, 'truncate');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_THEMEVARIATION_0017
     * @tc.name ThemeVariation_017
     * @tc.desc Verify EL2 filesDir isolation and restored context; files/append 0 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ThemeVariation_017', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_75_', 0);
      const actual: FileProbe = await probeFile('ThemeVariation75', 'files', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_THEMEVARIATION_0018
     * @tc.name ThemeVariation_018
     * @tc.desc Verify EL1 filesDir isolation and restored context; files/append 1024 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ThemeVariation_018', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_76_', 1024);
      const actual: FileProbe = await probeFile('ThemeVariation76', 'files', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_THEMEVARIATION_0019
     * @tc.name ThemeVariation_019
     * @tc.desc Verify EL2 filesDir isolation and restored context; files/append 127 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ThemeVariation_019', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_77_', 127);
      const actual: FileProbe = await probeFile('ThemeVariation77', 'files', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_THEMEVARIATION_0020
     * @tc.name ThemeVariation_020
     * @tc.desc Verify EL1 filesDir isolation and restored context; files/append 8 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ThemeVariation_020', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_78_', 8);
      const actual: FileProbe = await probeFile('ThemeVariation78', 'files', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_THEMEVARIATION_0021
     * @tc.name ThemeVariation_021
     * @tc.desc Verify EL2 filesDir isolation and restored context; files/append 4096 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ThemeVariation_021', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_79_', 4096);
      const actual: FileProbe = await probeFile('ThemeVariation79', 'files', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_THEMEVARIATION_0022
     * @tc.name ThemeVariation_022
     * @tc.desc Verify EL1 filesDir isolation and restored context; cache/append 511 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ThemeVariation_022', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_80_', 511);
      const actual: FileProbe = await probeFile('ThemeVariation80', 'cache', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_THEMEVARIATION_0023
     * @tc.name ThemeVariation_023
     * @tc.desc Verify EL2 filesDir isolation and restored context; cache/append 32 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ThemeVariation_023', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_81_', 32);
      const actual: FileProbe = await probeFile('ThemeVariation81', 'cache', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_THEMEVARIATION_0024
     * @tc.name ThemeVariation_024
     * @tc.desc Verify EL1 filesDir isolation and restored context; cache/append 1 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ThemeVariation_024', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_82_', 1);
      const actual: FileProbe = await probeFile('ThemeVariation82', 'cache', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_THEMEVARIATION_0025
     * @tc.name ThemeVariation_025
     * @tc.desc Verify EL2 filesDir isolation and restored context; cache/append 2047 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ThemeVariation_025', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_83_', 2047);
      const actual: FileProbe = await probeFile('ThemeVariation83', 'cache', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_THEMEVARIATION_0026
     * @tc.name ThemeVariation_026
     * @tc.desc Verify EL1 filesDir isolation and restored context; files/create 128 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ThemeVariation_026', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_84_', 128);
      const actual: FileProbe = await probeFile('ThemeVariation84', 'files', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_THEMEVARIATION_0027
     * @tc.name ThemeVariation_027
     * @tc.desc Verify EL2 filesDir isolation and restored context; files/create 15 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ThemeVariation_027', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_85_', 15);
      const actual: FileProbe = await probeFile('ThemeVariation85', 'files', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
  });
}
