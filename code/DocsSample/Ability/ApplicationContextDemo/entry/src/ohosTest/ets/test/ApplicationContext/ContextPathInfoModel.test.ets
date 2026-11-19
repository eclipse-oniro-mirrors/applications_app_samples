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

export default function contextPathInfoModelTest(): void {
  describe('ContextPathInfoModel', () => {
    beforeAll((): void => {
      expect(requireContext().applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    afterAll((): void => {
      hilog.info(0xF811, 'ContextTests', 'ContextPathInfoModel completed');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0001
     * @tc.name ContextPathInfoModel_001
     * @tc.desc Verify resource module_desc survives files/create roundtrip repeated 0 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_001', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'module description';
      const before: string = context.resourceManager.getStringByNameSync('module_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 0);
      const actual: FileProbe = await probeFile('ContextPathInfoModel0', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0002
     * @tc.name ContextPathInfoModel_002
     * @tc.desc Verify resource EntryAbility_desc survives files/create roundtrip repeated 1024 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_002', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'description';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 1024);
      const actual: FileProbe = await probeFile('ContextPathInfoModel1', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0003
     * @tc.name ContextPathInfoModel_003
     * @tc.desc Verify resource EntryAbility_label survives files/create roundtrip repeated 127 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_003', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'label';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_label');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 127);
      const actual: FileProbe = await probeFile('ContextPathInfoModel2', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0004
     * @tc.name ContextPathInfoModel_004
     * @tc.desc Verify resource success_message survives files/create roundtrip repeated 8 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_004', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = '成功获取Context';
      const before: string = context.resourceManager.getStringByNameSync('success_message');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 8);
      const actual: FileProbe = await probeFile('ContextPathInfoModel3', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0005
     * @tc.name ContextPathInfoModel_005
     * @tc.desc Verify resource module_desc survives files/create roundtrip repeated 4096 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_005', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'module description';
      const before: string = context.resourceManager.getStringByNameSync('module_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 4096);
      const actual: FileProbe = await probeFile('ContextPathInfoModel4', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0006
     * @tc.name ContextPathInfoModel_006
     * @tc.desc Verify resource EntryAbility_desc survives cache/create roundtrip repeated 511 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_006', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'description';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 511);
      const actual: FileProbe = await probeFile('ContextPathInfoModel5', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0007
     * @tc.name ContextPathInfoModel_007
     * @tc.desc Verify resource EntryAbility_label survives cache/create roundtrip repeated 32 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_007', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'label';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_label');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 32);
      const actual: FileProbe = await probeFile('ContextPathInfoModel6', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0008
     * @tc.name ContextPathInfoModel_008
     * @tc.desc Verify resource success_message survives cache/create roundtrip repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_008', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = '成功获取Context';
      const before: string = context.resourceManager.getStringByNameSync('success_message');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 1);
      const actual: FileProbe = await probeFile('ContextPathInfoModel7', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0009
     * @tc.name ContextPathInfoModel_009
     * @tc.desc Verify resource module_desc survives cache/create roundtrip repeated 2047 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_009', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'module description';
      const before: string = context.resourceManager.getStringByNameSync('module_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 2047);
      const actual: FileProbe = await probeFile('ContextPathInfoModel8', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0010
     * @tc.name ContextPathInfoModel_010
     * @tc.desc Verify resource EntryAbility_desc survives cache/create roundtrip repeated 128 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_010', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'description';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 128);
      const actual: FileProbe = await probeFile('ContextPathInfoModel9', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0011
     * @tc.name ContextPathInfoModel_011
     * @tc.desc Verify resource EntryAbility_label survives files/truncate roundtrip repeated 15 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_011', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'label';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_label');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 15);
      const actual: FileProbe = await probeFile('ContextPathInfoModel10', 'files', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0012
     * @tc.name ContextPathInfoModel_012
     * @tc.desc Verify resource success_message survives files/truncate roundtrip repeated 8191 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_012', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = '成功获取Context';
      const before: string = context.resourceManager.getStringByNameSync('success_message');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 8191);
      const actual: FileProbe = await probeFile('ContextPathInfoModel11', 'files', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0013
     * @tc.name ContextPathInfoModel_013
     * @tc.desc Verify resource module_desc survives files/truncate roundtrip repeated 512 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_013', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'module description';
      const before: string = context.resourceManager.getStringByNameSync('module_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 512);
      const actual: FileProbe = await probeFile('ContextPathInfoModel12', 'files', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0014
     * @tc.name ContextPathInfoModel_014
     * @tc.desc Verify resource EntryAbility_desc survives files/truncate roundtrip repeated 63 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_014', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'description';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 63);
      const actual: FileProbe = await probeFile('ContextPathInfoModel13', 'files', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0015
     * @tc.name ContextPathInfoModel_015
     * @tc.desc Verify resource EntryAbility_label survives cache/truncate roundtrip repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_015', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'label';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_label');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 2);
      const actual: FileProbe = await probeFile('ContextPathInfoModel14', 'cache', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0016
     * @tc.name ContextPathInfoModel_016
     * @tc.desc Verify resource success_message survives cache/truncate roundtrip repeated 2048 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_016', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = '成功获取Context';
      const before: string = context.resourceManager.getStringByNameSync('success_message');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 2048);
      const actual: FileProbe = await probeFile('ContextPathInfoModel15', 'cache', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0017
     * @tc.name ContextPathInfoModel_017
     * @tc.desc Verify resource module_desc survives cache/truncate roundtrip repeated 255 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_017', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'module description';
      const before: string = context.resourceManager.getStringByNameSync('module_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 255);
      const actual: FileProbe = await probeFile('ContextPathInfoModel16', 'cache', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0018
     * @tc.name ContextPathInfoModel_018
     * @tc.desc Verify resource EntryAbility_desc survives cache/truncate roundtrip repeated 16 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_018', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'description';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 16);
      const actual: FileProbe = await probeFile('ContextPathInfoModel17', 'cache', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0019
     * @tc.name ContextPathInfoModel_019
     * @tc.desc Verify resource EntryAbility_label survives cache/truncate roundtrip repeated 8192 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_019', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'label';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_label');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 8192);
      const actual: FileProbe = await probeFile('ContextPathInfoModel18', 'cache', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0020
     * @tc.name ContextPathInfoModel_020
     * @tc.desc Verify resource success_message survives files/append roundtrip repeated 1023 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_020', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = '成功获取Context';
      const before: string = context.resourceManager.getStringByNameSync('success_message');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 1023);
      const actual: FileProbe = await probeFile('ContextPathInfoModel19', 'files', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0021
     * @tc.name ContextPathInfoModel_021
     * @tc.desc Verify resource module_desc survives files/append roundtrip repeated 64 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_021', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'module description';
      const before: string = context.resourceManager.getStringByNameSync('module_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 64);
      const actual: FileProbe = await probeFile('ContextPathInfoModel20', 'files', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0022
     * @tc.name ContextPathInfoModel_022
     * @tc.desc Verify resource EntryAbility_desc survives files/append roundtrip repeated 7 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_022', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'description';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 7);
      const actual: FileProbe = await probeFile('ContextPathInfoModel21', 'files', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0023
     * @tc.name ContextPathInfoModel_023
     * @tc.desc Verify resource EntryAbility_label survives files/append roundtrip repeated 4095 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_023', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'label';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_label');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 4095);
      const actual: FileProbe = await probeFile('ContextPathInfoModel22', 'files', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0024
     * @tc.name ContextPathInfoModel_024
     * @tc.desc Verify resource success_message survives files/append roundtrip repeated 256 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_024', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = '成功获取Context';
      const before: string = context.resourceManager.getStringByNameSync('success_message');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 256);
      const actual: FileProbe = await probeFile('ContextPathInfoModel23', 'files', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0025
     * @tc.name ContextPathInfoModel_025
     * @tc.desc Verify resource module_desc survives cache/append roundtrip repeated 31 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_025', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'module description';
      const before: string = context.resourceManager.getStringByNameSync('module_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 31);
      const actual: FileProbe = await probeFile('ContextPathInfoModel24', 'cache', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0026
     * @tc.name ContextPathInfoModel_026
     * @tc.desc Verify resource EntryAbility_desc survives cache/append roundtrip repeated 0 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_026', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'description';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 0);
      const actual: FileProbe = await probeFile('ContextPathInfoModel25', 'cache', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0027
     * @tc.name ContextPathInfoModel_027
     * @tc.desc Verify resource EntryAbility_label survives cache/append roundtrip repeated 1024 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_027', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'label';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_label');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 1024);
      const actual: FileProbe = await probeFile('ContextPathInfoModel26', 'cache', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0028
     * @tc.name ContextPathInfoModel_028
     * @tc.desc Verify resource success_message survives cache/append roundtrip repeated 127 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_028', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = '成功获取Context';
      const before: string = context.resourceManager.getStringByNameSync('success_message');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 127);
      const actual: FileProbe = await probeFile('ContextPathInfoModel27', 'cache', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0029
     * @tc.name ContextPathInfoModel_029
     * @tc.desc Verify resource module_desc survives files/create roundtrip repeated 8 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_029', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'module description';
      const before: string = context.resourceManager.getStringByNameSync('module_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 8);
      const actual: FileProbe = await probeFile('ContextPathInfoModel28', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0030
     * @tc.name ContextPathInfoModel_030
     * @tc.desc Verify resource EntryAbility_desc survives files/create roundtrip repeated 4096 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_030', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'description';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 4096);
      const actual: FileProbe = await probeFile('ContextPathInfoModel29', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0031
     * @tc.name ContextPathInfoModel_031
     * @tc.desc Verify resource EntryAbility_label survives files/create roundtrip repeated 511 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_031', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'label';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_label');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 511);
      const actual: FileProbe = await probeFile('ContextPathInfoModel30', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0032
     * @tc.name ContextPathInfoModel_032
     * @tc.desc Verify resource success_message survives files/create roundtrip repeated 32 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_032', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = '成功获取Context';
      const before: string = context.resourceManager.getStringByNameSync('success_message');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 32);
      const actual: FileProbe = await probeFile('ContextPathInfoModel31', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0033
     * @tc.name ContextPathInfoModel_033
     * @tc.desc Verify resource module_desc survives files/create roundtrip repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_033', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'module description';
      const before: string = context.resourceManager.getStringByNameSync('module_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 1);
      const actual: FileProbe = await probeFile('ContextPathInfoModel32', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0034
     * @tc.name ContextPathInfoModel_034
     * @tc.desc Verify resource EntryAbility_desc survives cache/create roundtrip repeated 2047 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_034', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'description';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 2047);
      const actual: FileProbe = await probeFile('ContextPathInfoModel33', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTPATHINFOMODEL_0035
     * @tc.name ContextPathInfoModel_035
     * @tc.desc Verify resource EntryAbility_label survives cache/create roundtrip repeated 128 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextPathInfoModel_035', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'label';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_label');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 128);
      const actual: FileProbe = await probeFile('ContextPathInfoModel34', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
  });
}
