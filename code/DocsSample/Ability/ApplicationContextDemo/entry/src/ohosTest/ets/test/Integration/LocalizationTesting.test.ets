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

export default function localizationTestingTest(): void {
  describe('LocalizationTesting', () => {
    beforeAll((): void => {
      expect(requireContext().applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    afterAll((): void => {
      hilog.info(0xF811, 'ContextTests', 'LocalizationTesting completed');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_LOCALIZATIONTESTING_0001
     * @tc.name LocalizationTesting_001
     * @tc.desc Verify resource EntryAbility_label survives files/append roundtrip repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('LocalizationTesting_001', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('LocalizationTesting214', 'files', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_LOCALIZATIONTESTING_0002
     * @tc.name LocalizationTesting_002
     * @tc.desc Verify resource success_message survives files/append roundtrip repeated 2048 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('LocalizationTesting_002', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('LocalizationTesting215', 'files', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_LOCALIZATIONTESTING_0003
     * @tc.name LocalizationTesting_003
     * @tc.desc Verify resource module_desc survives files/append roundtrip repeated 255 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('LocalizationTesting_003', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('LocalizationTesting216', 'files', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_LOCALIZATIONTESTING_0004
     * @tc.name LocalizationTesting_004
     * @tc.desc Verify resource EntryAbility_desc survives files/append roundtrip repeated 16 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('LocalizationTesting_004', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('LocalizationTesting217', 'files', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_LOCALIZATIONTESTING_0005
     * @tc.name LocalizationTesting_005
     * @tc.desc Verify resource EntryAbility_label survives files/append roundtrip repeated 8192 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('LocalizationTesting_005', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('LocalizationTesting218', 'files', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_LOCALIZATIONTESTING_0006
     * @tc.name LocalizationTesting_006
     * @tc.desc Verify resource success_message survives cache/append roundtrip repeated 1023 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('LocalizationTesting_006', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('LocalizationTesting219', 'cache', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_LOCALIZATIONTESTING_0007
     * @tc.name LocalizationTesting_007
     * @tc.desc Verify resource module_desc survives cache/append roundtrip repeated 64 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('LocalizationTesting_007', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('LocalizationTesting220', 'cache', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_LOCALIZATIONTESTING_0008
     * @tc.name LocalizationTesting_008
     * @tc.desc Verify resource EntryAbility_desc survives cache/append roundtrip repeated 7 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('LocalizationTesting_008', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('LocalizationTesting221', 'cache', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_LOCALIZATIONTESTING_0009
     * @tc.name LocalizationTesting_009
     * @tc.desc Verify resource EntryAbility_label survives cache/append roundtrip repeated 4095 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('LocalizationTesting_009', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('LocalizationTesting222', 'cache', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_LOCALIZATIONTESTING_0010
     * @tc.name LocalizationTesting_010
     * @tc.desc Verify resource success_message survives cache/append roundtrip repeated 256 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('LocalizationTesting_010', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('LocalizationTesting223', 'cache', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_LOCALIZATIONTESTING_0011
     * @tc.name LocalizationTesting_011
     * @tc.desc Verify resource module_desc survives files/create roundtrip repeated 31 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('LocalizationTesting_011', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('LocalizationTesting224', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_LOCALIZATIONTESTING_0012
     * @tc.name LocalizationTesting_012
     * @tc.desc Verify resource EntryAbility_desc survives files/create roundtrip repeated 0 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('LocalizationTesting_012', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('LocalizationTesting225', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_LOCALIZATIONTESTING_0013
     * @tc.name LocalizationTesting_013
     * @tc.desc Verify resource EntryAbility_label survives files/create roundtrip repeated 1024 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('LocalizationTesting_013', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('LocalizationTesting226', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_LOCALIZATIONTESTING_0014
     * @tc.name LocalizationTesting_014
     * @tc.desc Verify resource success_message survives files/create roundtrip repeated 127 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('LocalizationTesting_014', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('LocalizationTesting227', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_LOCALIZATIONTESTING_0015
     * @tc.name LocalizationTesting_015
     * @tc.desc Verify resource module_desc survives cache/create roundtrip repeated 8 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('LocalizationTesting_015', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('LocalizationTesting228', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_LOCALIZATIONTESTING_0016
     * @tc.name LocalizationTesting_016
     * @tc.desc Verify resource EntryAbility_desc survives cache/create roundtrip repeated 4096 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('LocalizationTesting_016', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('LocalizationTesting229', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_LOCALIZATIONTESTING_0017
     * @tc.name LocalizationTesting_017
     * @tc.desc Verify resource EntryAbility_label survives cache/create roundtrip repeated 511 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('LocalizationTesting_017', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('LocalizationTesting230', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_LOCALIZATIONTESTING_0018
     * @tc.name LocalizationTesting_018
     * @tc.desc Verify resource success_message survives cache/create roundtrip repeated 32 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('LocalizationTesting_018', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('LocalizationTesting231', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_LOCALIZATIONTESTING_0019
     * @tc.name LocalizationTesting_019
     * @tc.desc Verify resource module_desc survives cache/create roundtrip repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('LocalizationTesting_019', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('LocalizationTesting232', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_LOCALIZATIONTESTING_0020
     * @tc.name LocalizationTesting_020
     * @tc.desc Verify resource EntryAbility_desc survives files/truncate roundtrip repeated 2047 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('LocalizationTesting_020', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('LocalizationTesting233', 'files', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_LOCALIZATIONTESTING_0021
     * @tc.name LocalizationTesting_021
     * @tc.desc Verify resource EntryAbility_label survives files/truncate roundtrip repeated 128 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('LocalizationTesting_021', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('LocalizationTesting234', 'files', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
  });
}
