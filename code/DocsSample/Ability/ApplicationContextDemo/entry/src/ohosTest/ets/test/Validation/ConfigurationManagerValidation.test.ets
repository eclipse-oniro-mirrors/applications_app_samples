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

export default function configurationManagerValidationTest(): void {
  describe('ConfigurationManagerValidation', () => {
    beforeAll((): void => {
      expect(requireContext().applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    afterAll((): void => {
      hilog.info(0xF811, 'ContextTests', 'ConfigurationManagerValidation completed');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0001
     * @tc.name ConfigurationManagerValidation_001
     * @tc.desc Verify EL2 filesDir isolation and restored context; files/append 256 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_001', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_23_', 256);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation23', 'files', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0002
     * @tc.name ConfigurationManagerValidation_002
     * @tc.desc Verify EL1 filesDir isolation and restored context; cache/append 31 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_002', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_24_', 31);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation24', 'cache', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0003
     * @tc.name ConfigurationManagerValidation_003
     * @tc.desc Verify EL2 filesDir isolation and restored context; cache/append 0 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_003', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_25_', 0);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation25', 'cache', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0004
     * @tc.name ConfigurationManagerValidation_004
     * @tc.desc Verify EL1 filesDir isolation and restored context; cache/append 1024 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_004', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_26_', 1024);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation26', 'cache', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0005
     * @tc.name ConfigurationManagerValidation_005
     * @tc.desc Verify EL2 filesDir isolation and restored context; cache/append 127 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_005', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_27_', 127);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation27', 'cache', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0006
     * @tc.name ConfigurationManagerValidation_006
     * @tc.desc Verify EL1 filesDir isolation and restored context; files/create 8 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_006', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_28_', 8);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation28', 'files', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0007
     * @tc.name ConfigurationManagerValidation_007
     * @tc.desc Verify EL2 filesDir isolation and restored context; files/create 4096 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_007', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_29_', 4096);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation29', 'files', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0008
     * @tc.name ConfigurationManagerValidation_008
     * @tc.desc Verify EL1 filesDir isolation and restored context; files/create 511 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_008', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_30_', 511);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation30', 'files', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0009
     * @tc.name ConfigurationManagerValidation_009
     * @tc.desc Verify EL2 filesDir isolation and restored context; files/create 32 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_009', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_31_', 32);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation31', 'files', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0010
     * @tc.name ConfigurationManagerValidation_010
     * @tc.desc Verify EL1 filesDir isolation and restored context; files/create 1 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_010', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_32_', 1);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation32', 'files', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0011
     * @tc.name ConfigurationManagerValidation_011
     * @tc.desc Verify EL2 filesDir isolation and restored context; cache/create 2047 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_011', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_33_', 2047);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation33', 'cache', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0012
     * @tc.name ConfigurationManagerValidation_012
     * @tc.desc Verify EL1 filesDir isolation and restored context; cache/create 128 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_012', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_34_', 128);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation34', 'cache', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0013
     * @tc.name ConfigurationManagerValidation_013
     * @tc.desc Verify EL2 filesDir isolation and restored context; cache/create 15 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_013', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_35_', 15);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation35', 'cache', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0014
     * @tc.name ConfigurationManagerValidation_014
     * @tc.desc Verify EL1 filesDir isolation and restored context; cache/create 8191 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_014', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_36_', 8191);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation36', 'cache', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0015
     * @tc.name ConfigurationManagerValidation_015
     * @tc.desc Verify EL2 filesDir isolation and restored context; cache/create 512 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_015', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_37_', 512);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation37', 'cache', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0016
     * @tc.name ConfigurationManagerValidation_016
     * @tc.desc Verify EL1 filesDir isolation and restored context; files/truncate 63 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_016', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_38_', 63);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation38', 'files', content, 'truncate');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0017
     * @tc.name ConfigurationManagerValidation_017
     * @tc.desc Verify EL2 filesDir isolation and restored context; files/truncate 2 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_017', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_39_', 2);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation39', 'files', content, 'truncate');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0018
     * @tc.name ConfigurationManagerValidation_018
     * @tc.desc Verify EL1 filesDir isolation and restored context; files/truncate 2048 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_018', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_40_', 2048);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation40', 'files', content, 'truncate');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0019
     * @tc.name ConfigurationManagerValidation_019
     * @tc.desc Verify EL2 filesDir isolation and restored context; files/truncate 255 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_019', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_41_', 255);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation41', 'files', content, 'truncate');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0020
     * @tc.name ConfigurationManagerValidation_020
     * @tc.desc Verify EL1 filesDir isolation and restored context; cache/truncate 16 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_020', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_42_', 16);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation42', 'cache', content, 'truncate');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0021
     * @tc.name ConfigurationManagerValidation_021
     * @tc.desc Verify EL2 filesDir isolation and restored context; cache/truncate 8192 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_021', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_43_', 8192);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation43', 'cache', content, 'truncate');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0022
     * @tc.name ConfigurationManagerValidation_022
     * @tc.desc Verify EL1 filesDir isolation and restored context; cache/truncate 1023 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_022', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_44_', 1023);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation44', 'cache', content, 'truncate');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0023
     * @tc.name ConfigurationManagerValidation_023
     * @tc.desc Verify EL2 filesDir isolation and restored context; cache/truncate 64 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_023', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_45_', 64);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation45', 'cache', content, 'truncate');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0024
     * @tc.name ConfigurationManagerValidation_024
     * @tc.desc Verify EL1 filesDir isolation and restored context; cache/truncate 7 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_024', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_46_', 7);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation46', 'cache', content, 'truncate');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0025
     * @tc.name ConfigurationManagerValidation_025
     * @tc.desc Verify EL2 filesDir isolation and restored context; files/append 4095 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_025', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_47_', 4095);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation47', 'files', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0026
     * @tc.name ConfigurationManagerValidation_026
     * @tc.desc Verify EL1 filesDir isolation and restored context; files/append 256 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_026', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_48_', 256);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation48', 'files', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0027
     * @tc.name ConfigurationManagerValidation_027
     * @tc.desc Verify EL2 filesDir isolation and restored context; files/append 31 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_027', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_49_', 31);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation49', 'files', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0028
     * @tc.name ConfigurationManagerValidation_028
     * @tc.desc Verify EL1 filesDir isolation and restored context; files/append 0 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_028', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_50_', 0);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation50', 'files', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0029
     * @tc.name ConfigurationManagerValidation_029
     * @tc.desc Verify EL2 filesDir isolation and restored context; files/append 1024 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_029', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_51_', 1024);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation51', 'files', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0030
     * @tc.name ConfigurationManagerValidation_030
     * @tc.desc Verify EL1 filesDir isolation and restored context; cache/append 127 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_030', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_52_', 127);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation52', 'cache', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0031
     * @tc.name ConfigurationManagerValidation_031
     * @tc.desc Verify EL2 filesDir isolation and restored context; cache/append 8 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_031', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_53_', 8);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation53', 'cache', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0032
     * @tc.name ConfigurationManagerValidation_032
     * @tc.desc Verify EL1 filesDir isolation and restored context; cache/append 4096 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_032', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_54_', 4096);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation54', 'cache', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0033
     * @tc.name ConfigurationManagerValidation_033
     * @tc.desc Verify EL2 filesDir isolation and restored context; cache/append 511 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_033', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_55_', 511);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation55', 'cache', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0034
     * @tc.name ConfigurationManagerValidation_034
     * @tc.desc Verify EL1 filesDir isolation and restored context; files/create 32 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_034', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_56_', 32);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation56', 'files', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0035
     * @tc.name ConfigurationManagerValidation_035
     * @tc.desc Verify EL2 filesDir isolation and restored context; files/create 1 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_035', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_57_', 1);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation57', 'files', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONMANAGERVALIDATION_0036
     * @tc.name ConfigurationManagerValidation_036
     * @tc.desc Verify EL1 filesDir isolation and restored context; files/create 2047 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationManagerValidation_036', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_58_', 2047);
      const actual: FileProbe = await probeFile('ConfigurationManagerValidation58', 'files', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
  });
}
