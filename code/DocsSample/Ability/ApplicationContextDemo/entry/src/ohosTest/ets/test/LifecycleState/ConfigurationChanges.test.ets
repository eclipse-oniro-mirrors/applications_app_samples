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

export default function configurationChangesTest(): void {
  describe('ConfigurationChanges', () => {
    beforeAll((): void => {
      expect(requireContext().applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    afterAll((): void => {
      hilog.info(0xF811, 'ContextTests', 'ConfigurationChanges completed');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONCHANGES_0001
     * @tc.name ConfigurationChanges_001
     * @tc.desc Verify EL1 filesDir isolation and restored context; files/create 8191 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationChanges_001', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_86_', 8191);
      const actual: FileProbe = await probeFile('ConfigurationChanges86', 'files', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONCHANGES_0002
     * @tc.name ConfigurationChanges_002
     * @tc.desc Verify EL2 filesDir isolation and restored context; files/create 512 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationChanges_002', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_87_', 512);
      const actual: FileProbe = await probeFile('ConfigurationChanges87', 'files', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONCHANGES_0003
     * @tc.name ConfigurationChanges_003
     * @tc.desc Verify EL1 filesDir isolation and restored context; files/create 63 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationChanges_003', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_88_', 63);
      const actual: FileProbe = await probeFile('ConfigurationChanges88', 'files', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONCHANGES_0004
     * @tc.name ConfigurationChanges_004
     * @tc.desc Verify EL2 filesDir isolation and restored context; cache/create 2 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationChanges_004', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_89_', 2);
      const actual: FileProbe = await probeFile('ConfigurationChanges89', 'cache', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONCHANGES_0005
     * @tc.name ConfigurationChanges_005
     * @tc.desc Verify EL1 filesDir isolation and restored context; cache/create 2048 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationChanges_005', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_90_', 2048);
      const actual: FileProbe = await probeFile('ConfigurationChanges90', 'cache', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONCHANGES_0006
     * @tc.name ConfigurationChanges_006
     * @tc.desc Verify EL2 filesDir isolation and restored context; cache/create 255 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationChanges_006', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_91_', 255);
      const actual: FileProbe = await probeFile('ConfigurationChanges91', 'cache', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONCHANGES_0007
     * @tc.name ConfigurationChanges_007
     * @tc.desc Verify EL1 filesDir isolation and restored context; cache/create 16 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationChanges_007', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_92_', 16);
      const actual: FileProbe = await probeFile('ConfigurationChanges92', 'cache', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONCHANGES_0008
     * @tc.name ConfigurationChanges_008
     * @tc.desc Verify EL2 filesDir isolation and restored context; cache/create 8192 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationChanges_008', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_93_', 8192);
      const actual: FileProbe = await probeFile('ConfigurationChanges93', 'cache', content, 'create');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONCHANGES_0009
     * @tc.name ConfigurationChanges_009
     * @tc.desc Verify EL1 filesDir isolation and restored context; files/truncate 1023 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationChanges_009', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_94_', 1023);
      const actual: FileProbe = await probeFile('ConfigurationChanges94', 'files', content, 'truncate');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONCHANGES_0010
     * @tc.name ConfigurationChanges_010
     * @tc.desc Verify EL2 filesDir isolation and restored context; files/truncate 64 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationChanges_010', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL2;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el2/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_95_', 64);
      const actual: FileProbe = await probeFile('ConfigurationChanges95', 'files', content, 'truncate');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONFIGURATIONCHANGES_0011
     * @tc.name ConfigurationChanges_011
     * @tc.desc Verify EL1 filesDir isolation and restored context; files/truncate 7 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ConfigurationChanges_011', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalArea: contextConstant.AreaMode = context.area;
      const originalFiles: string = context.filesDir;
      const expectedArea: contextConstant.AreaMode = contextConstant.AreaMode.EL1;
      const path: string = switchArea(expectedArea);
      expect(path.indexOf('/el1/') >= 0).assertTrue();
      expect(context.area).assertEqual(originalArea);
      expect(context.filesDir).assertEqual(originalFiles);
      const module: common.Context = await requireModule();
      const content: string = payload('config_96_', 7);
      const actual: FileProbe = await probeFile('ConfigurationChanges96', 'files', content, 'truncate');
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.text).assertEqual(content);
      expect(actual.existsAfter).assertFalse();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
  });
}
