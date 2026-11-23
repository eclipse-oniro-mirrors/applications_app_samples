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

export default function applicationInfoVersionTest(): void {
  describe('ApplicationInfoVersion', () => {
    beforeAll((): void => {
      expect(requireContext().applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    afterAll((): void => {
      hilog.info(0xF811, 'ContextTests', 'ApplicationInfoVersion completed');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0001
     * @tc.name ApplicationInfoVersion_001
     * @tc.desc Verify resource success_message survives files/append roundtrip repeated 4096 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_001', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = '成功获取Context';
      const before: string = context.resourceManager.getStringByNameSync('success_message');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 4096);
      const actual: FileProbe = await probeFile('ApplicationInfoVersion79', 'files', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0002
     * @tc.name ApplicationInfoVersion_002
     * @tc.desc Verify resource module_desc survives cache/append roundtrip repeated 511 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_002', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'module description';
      const before: string = context.resourceManager.getStringByNameSync('module_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 511);
      const actual: FileProbe = await probeFile('ApplicationInfoVersion80', 'cache', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0003
     * @tc.name ApplicationInfoVersion_003
     * @tc.desc Verify resource EntryAbility_desc survives cache/append roundtrip repeated 32 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_003', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'description';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 32);
      const actual: FileProbe = await probeFile('ApplicationInfoVersion81', 'cache', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0004
     * @tc.name ApplicationInfoVersion_004
     * @tc.desc Verify resource EntryAbility_label survives cache/append roundtrip repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_004', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'label';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_label');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 1);
      const actual: FileProbe = await probeFile('ApplicationInfoVersion82', 'cache', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0005
     * @tc.name ApplicationInfoVersion_005
     * @tc.desc Verify resource success_message survives cache/append roundtrip repeated 2047 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_005', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = '成功获取Context';
      const before: string = context.resourceManager.getStringByNameSync('success_message');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 2047);
      const actual: FileProbe = await probeFile('ApplicationInfoVersion83', 'cache', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0006
     * @tc.name ApplicationInfoVersion_006
     * @tc.desc Verify resource module_desc survives files/create roundtrip repeated 128 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_006', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'module description';
      const before: string = context.resourceManager.getStringByNameSync('module_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 128);
      const actual: FileProbe = await probeFile('ApplicationInfoVersion84', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0007
     * @tc.name ApplicationInfoVersion_007
     * @tc.desc Verify resource EntryAbility_desc survives files/create roundtrip repeated 15 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_007', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'description';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 15);
      const actual: FileProbe = await probeFile('ApplicationInfoVersion85', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0008
     * @tc.name ApplicationInfoVersion_008
     * @tc.desc Verify resource EntryAbility_label survives files/create roundtrip repeated 8191 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_008', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'label';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_label');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 8191);
      const actual: FileProbe = await probeFile('ApplicationInfoVersion86', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0009
     * @tc.name ApplicationInfoVersion_009
     * @tc.desc Verify resource success_message survives files/create roundtrip repeated 512 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_009', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = '成功获取Context';
      const before: string = context.resourceManager.getStringByNameSync('success_message');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 512);
      const actual: FileProbe = await probeFile('ApplicationInfoVersion87', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0010
     * @tc.name ApplicationInfoVersion_010
     * @tc.desc Verify resource module_desc survives files/create roundtrip repeated 63 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_010', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'module description';
      const before: string = context.resourceManager.getStringByNameSync('module_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 63);
      const actual: FileProbe = await probeFile('ApplicationInfoVersion88', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0011
     * @tc.name ApplicationInfoVersion_011
     * @tc.desc Verify resource EntryAbility_desc survives cache/create roundtrip repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_011', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'description';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 2);
      const actual: FileProbe = await probeFile('ApplicationInfoVersion89', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0012
     * @tc.name ApplicationInfoVersion_012
     * @tc.desc Verify resource EntryAbility_label survives cache/create roundtrip repeated 2048 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_012', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'label';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_label');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 2048);
      const actual: FileProbe = await probeFile('ApplicationInfoVersion90', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0013
     * @tc.name ApplicationInfoVersion_013
     * @tc.desc Verify resource success_message survives cache/create roundtrip repeated 255 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_013', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = '成功获取Context';
      const before: string = context.resourceManager.getStringByNameSync('success_message');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 255);
      const actual: FileProbe = await probeFile('ApplicationInfoVersion91', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0014
     * @tc.name ApplicationInfoVersion_014
     * @tc.desc Verify resource module_desc survives cache/create roundtrip repeated 16 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_014', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'module description';
      const before: string = context.resourceManager.getStringByNameSync('module_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 16);
      const actual: FileProbe = await probeFile('ApplicationInfoVersion92', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0015
     * @tc.name ApplicationInfoVersion_015
     * @tc.desc Verify resource EntryAbility_desc survives cache/create roundtrip repeated 8192 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_015', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'description';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 8192);
      const actual: FileProbe = await probeFile('ApplicationInfoVersion93', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0016
     * @tc.name ApplicationInfoVersion_016
     * @tc.desc Verify resource EntryAbility_label survives files/truncate roundtrip repeated 1023 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_016', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'label';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_label');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 1023);
      const actual: FileProbe = await probeFile('ApplicationInfoVersion94', 'files', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0017
     * @tc.name ApplicationInfoVersion_017
     * @tc.desc Verify resource success_message survives files/truncate roundtrip repeated 64 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_017', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = '成功获取Context';
      const before: string = context.resourceManager.getStringByNameSync('success_message');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 64);
      const actual: FileProbe = await probeFile('ApplicationInfoVersion95', 'files', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0018
     * @tc.name ApplicationInfoVersion_018
     * @tc.desc Verify resource module_desc survives files/truncate roundtrip repeated 7 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_018', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'module description';
      const before: string = context.resourceManager.getStringByNameSync('module_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 7);
      const actual: FileProbe = await probeFile('ApplicationInfoVersion96', 'files', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0019
     * @tc.name ApplicationInfoVersion_019
     * @tc.desc Verify resource EntryAbility_desc survives files/truncate roundtrip repeated 4095 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_019', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'description';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 4095);
      const actual: FileProbe = await probeFile('ApplicationInfoVersion97', 'files', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0020
     * @tc.name ApplicationInfoVersion_020
     * @tc.desc Verify resource EntryAbility_label survives cache/truncate roundtrip repeated 256 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_020', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'label';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_label');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 256);
      const actual: FileProbe = await probeFile('ApplicationInfoVersion98', 'cache', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0021
     * @tc.name ApplicationInfoVersion_021
     * @tc.desc Verify resource success_message survives cache/truncate roundtrip repeated 31 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_021', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = '成功获取Context';
      const before: string = context.resourceManager.getStringByNameSync('success_message');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 31);
      const actual: FileProbe = await probeFile('ApplicationInfoVersion99', 'cache', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0022
     * @tc.name ApplicationInfoVersion_022
     * @tc.desc Verify resource module_desc survives cache/truncate roundtrip repeated 0 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_022', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ApplicationInfoVersion100', 'cache', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0023
     * @tc.name ApplicationInfoVersion_023
     * @tc.desc Verify resource EntryAbility_desc survives cache/truncate roundtrip repeated 1024 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_023', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ApplicationInfoVersion101', 'cache', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0024
     * @tc.name ApplicationInfoVersion_024
     * @tc.desc Verify resource EntryAbility_label survives cache/truncate roundtrip repeated 127 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_024', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ApplicationInfoVersion102', 'cache', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0025
     * @tc.name ApplicationInfoVersion_025
     * @tc.desc Verify resource success_message survives files/append roundtrip repeated 8 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_025', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ApplicationInfoVersion103', 'files', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0026
     * @tc.name ApplicationInfoVersion_026
     * @tc.desc Verify resource module_desc survives files/append roundtrip repeated 4096 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_026', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ApplicationInfoVersion104', 'files', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0027
     * @tc.name ApplicationInfoVersion_027
     * @tc.desc Verify resource EntryAbility_desc survives files/append roundtrip repeated 511 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_027', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ApplicationInfoVersion105', 'files', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0028
     * @tc.name ApplicationInfoVersion_028
     * @tc.desc Verify resource EntryAbility_label survives files/append roundtrip repeated 32 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_028', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ApplicationInfoVersion106', 'files', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0029
     * @tc.name ApplicationInfoVersion_029
     * @tc.desc Verify resource success_message survives cache/append roundtrip repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_029', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ApplicationInfoVersion107', 'cache', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0030
     * @tc.name ApplicationInfoVersion_030
     * @tc.desc Verify resource module_desc survives cache/append roundtrip repeated 2047 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_030', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ApplicationInfoVersion108', 'cache', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0031
     * @tc.name ApplicationInfoVersion_031
     * @tc.desc Verify resource EntryAbility_desc survives cache/append roundtrip repeated 128 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_031', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ApplicationInfoVersion109', 'cache', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0032
     * @tc.name ApplicationInfoVersion_032
     * @tc.desc Verify resource EntryAbility_label survives cache/append roundtrip repeated 15 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_032', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ApplicationInfoVersion110', 'cache', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0033
     * @tc.name ApplicationInfoVersion_033
     * @tc.desc Verify resource success_message survives cache/append roundtrip repeated 8191 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_033', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ApplicationInfoVersion111', 'cache', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0034
     * @tc.name ApplicationInfoVersion_034
     * @tc.desc Verify resource module_desc survives files/create roundtrip repeated 512 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_034', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ApplicationInfoVersion112', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0035
     * @tc.name ApplicationInfoVersion_035
     * @tc.desc Verify resource EntryAbility_desc survives files/create roundtrip repeated 63 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_035', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ApplicationInfoVersion113', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0036
     * @tc.name ApplicationInfoVersion_036
     * @tc.desc Verify resource EntryAbility_label survives files/create roundtrip repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_036', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ApplicationInfoVersion114', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0037
     * @tc.name ApplicationInfoVersion_037
     * @tc.desc Verify resource success_message survives files/create roundtrip repeated 2048 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_037', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ApplicationInfoVersion115', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0038
     * @tc.name ApplicationInfoVersion_038
     * @tc.desc Verify resource module_desc survives files/create roundtrip repeated 255 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_038', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ApplicationInfoVersion116', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0039
     * @tc.name ApplicationInfoVersion_039
     * @tc.desc Verify resource EntryAbility_desc survives cache/create roundtrip repeated 16 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_039', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ApplicationInfoVersion117', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0040
     * @tc.name ApplicationInfoVersion_040
     * @tc.desc Verify resource EntryAbility_label survives cache/create roundtrip repeated 8192 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_040', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ApplicationInfoVersion118', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0041
     * @tc.name ApplicationInfoVersion_041
     * @tc.desc Verify resource success_message survives cache/create roundtrip repeated 1023 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_041', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ApplicationInfoVersion119', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0042
     * @tc.name ApplicationInfoVersion_042
     * @tc.desc Verify resource module_desc survives cache/create roundtrip repeated 64 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_042', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ApplicationInfoVersion120', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0043
     * @tc.name ApplicationInfoVersion_043
     * @tc.desc Verify resource EntryAbility_desc survives files/truncate roundtrip repeated 7 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_043', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ApplicationInfoVersion121', 'files', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0044
     * @tc.name ApplicationInfoVersion_044
     * @tc.desc Verify resource EntryAbility_label survives files/truncate roundtrip repeated 4095 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_044', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ApplicationInfoVersion122', 'files', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0045
     * @tc.name ApplicationInfoVersion_045
     * @tc.desc Verify resource success_message survives files/truncate roundtrip repeated 256 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_045', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ApplicationInfoVersion123', 'files', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0046
     * @tc.name ApplicationInfoVersion_046
     * @tc.desc Verify resource module_desc survives files/truncate roundtrip repeated 31 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_046', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ApplicationInfoVersion124', 'files', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0047
     * @tc.name ApplicationInfoVersion_047
     * @tc.desc Verify resource EntryAbility_desc survives files/truncate roundtrip repeated 0 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_047', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ApplicationInfoVersion125', 'files', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0048
     * @tc.name ApplicationInfoVersion_048
     * @tc.desc Verify resource EntryAbility_label survives cache/truncate roundtrip repeated 1024 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_048', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ApplicationInfoVersion126', 'cache', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0049
     * @tc.name ApplicationInfoVersion_049
     * @tc.desc Verify resource success_message survives cache/truncate roundtrip repeated 127 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_049', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ApplicationInfoVersion127', 'cache', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0050
     * @tc.name ApplicationInfoVersion_050
     * @tc.desc Verify resource module_desc survives cache/truncate roundtrip repeated 8 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_050', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ApplicationInfoVersion128', 'cache', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONINFOVERSION_0051
     * @tc.name ApplicationInfoVersion_051
     * @tc.desc Verify resource EntryAbility_desc survives cache/truncate roundtrip repeated 4096 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationInfoVersion_051', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ApplicationInfoVersion129', 'cache', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
  });
}
