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

export default function abilityCompatibilityTest(): void {
  describe('AbilityCompatibility', () => {
    beforeAll((): void => {
      expect(requireContext().applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    afterAll((): void => {
      hilog.info(0xF811, 'ContextTests', 'AbilityCompatibility completed');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_ABILITYCOMPATIBILITY_0001
     * @tc.name AbilityCompatibility_001
     * @tc.desc Verify EL2 filesDir isolation and restored context; cache/truncate 1024 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('AbilityCompatibility_001', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_101_', 1024);
      const actual: FileProbe = await probeFile('AbilityCompatibility101', 'cache', content, 'truncate');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_ABILITYCOMPATIBILITY_0002
     * @tc.name AbilityCompatibility_002
     * @tc.desc Verify EL1 filesDir isolation and restored context; cache/truncate 127 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('AbilityCompatibility_002', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_102_', 127);
      const actual: FileProbe = await probeFile('AbilityCompatibility102', 'cache', content, 'truncate');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_ABILITYCOMPATIBILITY_0003
     * @tc.name AbilityCompatibility_003
     * @tc.desc Verify EL2 filesDir isolation and restored context; files/append 8 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('AbilityCompatibility_003', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_103_', 8);
      const actual: FileProbe = await probeFile('AbilityCompatibility103', 'files', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_ABILITYCOMPATIBILITY_0004
     * @tc.name AbilityCompatibility_004
     * @tc.desc Verify EL1 filesDir isolation and restored context; files/append 4096 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('AbilityCompatibility_004', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_104_', 4096);
      const actual: FileProbe = await probeFile('AbilityCompatibility104', 'files', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_ABILITYCOMPATIBILITY_0005
     * @tc.name AbilityCompatibility_005
     * @tc.desc Verify EL2 filesDir isolation and restored context; files/append 511 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('AbilityCompatibility_005', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_105_', 511);
      const actual: FileProbe = await probeFile('AbilityCompatibility105', 'files', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_ABILITYCOMPATIBILITY_0006
     * @tc.name AbilityCompatibility_006
     * @tc.desc Verify EL1 filesDir isolation and restored context; files/append 32 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('AbilityCompatibility_006', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_106_', 32);
      const actual: FileProbe = await probeFile('AbilityCompatibility106', 'files', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_ABILITYCOMPATIBILITY_0007
     * @tc.name AbilityCompatibility_007
     * @tc.desc Verify EL2 filesDir isolation and restored context; cache/append 1 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('AbilityCompatibility_007', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_107_', 1);
      const actual: FileProbe = await probeFile('AbilityCompatibility107', 'cache', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_ABILITYCOMPATIBILITY_0008
     * @tc.name AbilityCompatibility_008
     * @tc.desc Verify EL1 filesDir isolation and restored context; cache/append 2047 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('AbilityCompatibility_008', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_108_', 2047);
      const actual: FileProbe = await probeFile('AbilityCompatibility108', 'cache', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_ABILITYCOMPATIBILITY_0009
     * @tc.name AbilityCompatibility_009
     * @tc.desc Verify EL2 filesDir isolation and restored context; cache/append 128 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('AbilityCompatibility_009', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_109_', 128);
      const actual: FileProbe = await probeFile('AbilityCompatibility109', 'cache', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_ABILITYCOMPATIBILITY_0010
     * @tc.name AbilityCompatibility_010
     * @tc.desc Verify EL1 filesDir isolation and restored context; cache/append 15 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('AbilityCompatibility_010', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_110_', 15);
      const actual: FileProbe = await probeFile('AbilityCompatibility110', 'cache', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_ABILITYCOMPATIBILITY_0011
     * @tc.name AbilityCompatibility_011
     * @tc.desc Verify EL2 filesDir isolation and restored context; cache/append 8191 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('AbilityCompatibility_011', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_111_', 8191);
      const actual: FileProbe = await probeFile('AbilityCompatibility111', 'cache', content, 'append');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_ABILITYCOMPATIBILITY_0012
     * @tc.name AbilityCompatibility_012
     * @tc.desc Verify EL1 filesDir isolation and restored context; files/create 512 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('AbilityCompatibility_012', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_112_', 512);
      const actual: FileProbe = await probeFile('AbilityCompatibility112', 'files', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_ABILITYCOMPATIBILITY_0013
     * @tc.name AbilityCompatibility_013
     * @tc.desc Verify EL2 filesDir isolation and restored context; files/create 63 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('AbilityCompatibility_013', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_113_', 63);
      const actual: FileProbe = await probeFile('AbilityCompatibility113', 'files', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_ABILITYCOMPATIBILITY_0014
     * @tc.name AbilityCompatibility_014
     * @tc.desc Verify EL1 filesDir isolation and restored context; files/create 2 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('AbilityCompatibility_014', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_114_', 2);
      const actual: FileProbe = await probeFile('AbilityCompatibility114', 'files', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_ABILITYCOMPATIBILITY_0015
     * @tc.name AbilityCompatibility_015
     * @tc.desc Verify EL2 filesDir isolation and restored context; files/create 2048 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('AbilityCompatibility_015', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_115_', 2048);
      const actual: FileProbe = await probeFile('AbilityCompatibility115', 'files', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_ABILITYCOMPATIBILITY_0016
     * @tc.name AbilityCompatibility_016
     * @tc.desc Verify EL1 filesDir isolation and restored context; files/create 255 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('AbilityCompatibility_016', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_116_', 255);
      const actual: FileProbe = await probeFile('AbilityCompatibility116', 'files', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_ABILITYCOMPATIBILITY_0017
     * @tc.name AbilityCompatibility_017
     * @tc.desc Verify EL2 filesDir isolation and restored context; cache/create 16 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('AbilityCompatibility_017', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_117_', 16);
      const actual: FileProbe = await probeFile('AbilityCompatibility117', 'cache', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_ABILITYCOMPATIBILITY_0018
     * @tc.name AbilityCompatibility_018
     * @tc.desc Verify EL1 filesDir isolation and restored context; cache/create 8192 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('AbilityCompatibility_018', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_118_', 8192);
      const actual: FileProbe = await probeFile('AbilityCompatibility118', 'cache', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_ABILITYCOMPATIBILITY_0019
     * @tc.name AbilityCompatibility_019
     * @tc.desc Verify EL2 filesDir isolation and restored context; cache/create 1023 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('AbilityCompatibility_019', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_119_', 1023);
      const actual: FileProbe = await probeFile('AbilityCompatibility119', 'cache', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
  });
}
