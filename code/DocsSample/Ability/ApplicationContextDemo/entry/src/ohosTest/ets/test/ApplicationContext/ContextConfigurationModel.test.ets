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

export default function contextConfigurationModelTest(): void {
  describe('ContextConfigurationModel', () => {
    beforeAll((): void => {
      expect(requireContext().applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    afterAll((): void => {
      hilog.info(0xF811, 'ContextTests', 'ContextConfigurationModel completed');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTCONFIGURATIONMODEL_0001
     * @tc.name ContextConfigurationModel_001
     * @tc.desc Verify EL1 filesDir isolation and restored context; files/create 0 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextConfigurationModel_001', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_0_', 0);
      const actual: FileProbe = await probeFile('ContextConfigurationModel0', 'files', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTCONFIGURATIONMODEL_0002
     * @tc.name ContextConfigurationModel_002
     * @tc.desc Verify EL2 filesDir isolation and restored context; files/create 1024 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextConfigurationModel_002', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_1_', 1024);
      const actual: FileProbe = await probeFile('ContextConfigurationModel1', 'files', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTCONFIGURATIONMODEL_0003
     * @tc.name ContextConfigurationModel_003
     * @tc.desc Verify EL1 filesDir isolation and restored context; files/create 127 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextConfigurationModel_003', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_2_', 127);
      const actual: FileProbe = await probeFile('ContextConfigurationModel2', 'files', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTCONFIGURATIONMODEL_0004
     * @tc.name ContextConfigurationModel_004
     * @tc.desc Verify EL2 filesDir isolation and restored context; files/create 8 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextConfigurationModel_004', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_3_', 8);
      const actual: FileProbe = await probeFile('ContextConfigurationModel3', 'files', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTCONFIGURATIONMODEL_0005
     * @tc.name ContextConfigurationModel_005
     * @tc.desc Verify EL1 filesDir isolation and restored context; files/create 4096 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextConfigurationModel_005', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_4_', 4096);
      const actual: FileProbe = await probeFile('ContextConfigurationModel4', 'files', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTCONFIGURATIONMODEL_0006
     * @tc.name ContextConfigurationModel_006
     * @tc.desc Verify EL2 filesDir isolation and restored context; cache/create 511 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextConfigurationModel_006', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_5_', 511);
      const actual: FileProbe = await probeFile('ContextConfigurationModel5', 'cache', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTCONFIGURATIONMODEL_0007
     * @tc.name ContextConfigurationModel_007
     * @tc.desc Verify EL1 filesDir isolation and restored context; cache/create 32 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextConfigurationModel_007', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_6_', 32);
      const actual: FileProbe = await probeFile('ContextConfigurationModel6', 'cache', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTCONFIGURATIONMODEL_0008
     * @tc.name ContextConfigurationModel_008
     * @tc.desc Verify EL2 filesDir isolation and restored context; cache/create 1 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextConfigurationModel_008', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_7_', 1);
      const actual: FileProbe = await probeFile('ContextConfigurationModel7', 'cache', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTCONFIGURATIONMODEL_0009
     * @tc.name ContextConfigurationModel_009
     * @tc.desc Verify EL1 filesDir isolation and restored context; cache/create 2047 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextConfigurationModel_009', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_8_', 2047);
      const actual: FileProbe = await probeFile('ContextConfigurationModel8', 'cache', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTCONFIGURATIONMODEL_0010
     * @tc.name ContextConfigurationModel_010
     * @tc.desc Verify EL2 filesDir isolation and restored context; cache/create 128 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextConfigurationModel_010', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_9_', 128);
      const actual: FileProbe = await probeFile('ContextConfigurationModel9', 'cache', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTCONFIGURATIONMODEL_0011
     * @tc.name ContextConfigurationModel_011
     * @tc.desc Verify EL1 filesDir isolation and restored context; files/truncate 15 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextConfigurationModel_011', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_10_', 15);
      const actual: FileProbe = await probeFile('ContextConfigurationModel10', 'files', content, 'truncate');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTCONFIGURATIONMODEL_0012
     * @tc.name ContextConfigurationModel_012
     * @tc.desc Verify EL2 filesDir isolation and restored context; files/truncate 8191 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextConfigurationModel_012', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_11_', 8191);
      const actual: FileProbe = await probeFile('ContextConfigurationModel11', 'files', content, 'truncate');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTCONFIGURATIONMODEL_0013
     * @tc.name ContextConfigurationModel_013
     * @tc.desc Verify EL1 filesDir isolation and restored context; files/truncate 512 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextConfigurationModel_013', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_12_', 512);
      const actual: FileProbe = await probeFile('ContextConfigurationModel12', 'files', content, 'truncate');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTCONFIGURATIONMODEL_0014
     * @tc.name ContextConfigurationModel_014
     * @tc.desc Verify EL2 filesDir isolation and restored context; files/truncate 63 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextConfigurationModel_014', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_13_', 63);
      const actual: FileProbe = await probeFile('ContextConfigurationModel13', 'files', content, 'truncate');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTCONFIGURATIONMODEL_0015
     * @tc.name ContextConfigurationModel_015
     * @tc.desc Verify EL1 filesDir isolation and restored context; cache/truncate 2 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextConfigurationModel_015', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_14_', 2);
      const actual: FileProbe = await probeFile('ContextConfigurationModel14', 'cache', content, 'truncate');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTCONFIGURATIONMODEL_0016
     * @tc.name ContextConfigurationModel_016
     * @tc.desc Verify EL2 filesDir isolation and restored context; cache/truncate 2048 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextConfigurationModel_016', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_15_', 2048);
      const actual: FileProbe = await probeFile('ContextConfigurationModel15', 'cache', content, 'truncate');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTCONFIGURATIONMODEL_0017
     * @tc.name ContextConfigurationModel_017
     * @tc.desc Verify EL1 filesDir isolation and restored context; cache/truncate 255 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextConfigurationModel_017', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_16_', 255);
      const actual: FileProbe = await probeFile('ContextConfigurationModel16', 'cache', content, 'truncate');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTCONFIGURATIONMODEL_0018
     * @tc.name ContextConfigurationModel_018
     * @tc.desc Verify EL2 filesDir isolation and restored context; cache/truncate 16 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextConfigurationModel_018', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_17_', 16);
      const actual: FileProbe = await probeFile('ContextConfigurationModel17', 'cache', content, 'truncate');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTCONFIGURATIONMODEL_0019
     * @tc.name ContextConfigurationModel_019
     * @tc.desc Verify EL1 filesDir isolation and restored context; cache/truncate 8192 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextConfigurationModel_019', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_18_', 8192);
      const actual: FileProbe = await probeFile('ContextConfigurationModel18', 'cache', content, 'truncate');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTCONFIGURATIONMODEL_0020
     * @tc.name ContextConfigurationModel_020
     * @tc.desc Verify EL2 filesDir isolation and restored context; files/append 1023 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextConfigurationModel_020', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_19_', 1023);
      const actual: FileProbe = await probeFile('ContextConfigurationModel19', 'files', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTCONFIGURATIONMODEL_0021
     * @tc.name ContextConfigurationModel_021
     * @tc.desc Verify EL1 filesDir isolation and restored context; files/append 64 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextConfigurationModel_021', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_20_', 64);
      const actual: FileProbe = await probeFile('ContextConfigurationModel20', 'files', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTCONFIGURATIONMODEL_0022
     * @tc.name ContextConfigurationModel_022
     * @tc.desc Verify EL2 filesDir isolation and restored context; files/append 7 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextConfigurationModel_022', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_21_', 7);
      const actual: FileProbe = await probeFile('ContextConfigurationModel21', 'files', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTCONFIGURATIONMODEL_0023
     * @tc.name ContextConfigurationModel_023
     * @tc.desc Verify EL1 filesDir isolation and restored context; files/append 4095 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextConfigurationModel_023', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_22_', 4095);
      const actual: FileProbe = await probeFile('ContextConfigurationModel22', 'files', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
  });
}
