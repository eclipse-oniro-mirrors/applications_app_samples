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

export default function contextDataSourceValidationTest(): void {
  describe('ContextDataSourceValidation', () => {
    beforeAll((): void => {
      expect(requireContext().applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    afterAll((): void => {
      hilog.info(0xF811, 'ContextTests', 'ContextDataSourceValidation completed');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0001
     * @tc.name ContextDataSourceValidation_001
     * @tc.desc Verify resource success_message survives cache/create roundtrip repeated 15 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_001', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = '成功获取Context';
      const before: string = context.resourceManager.getStringByNameSync('success_message');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 15);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation35', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0002
     * @tc.name ContextDataSourceValidation_002
     * @tc.desc Verify resource module_desc survives cache/create roundtrip repeated 8191 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_002', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'module description';
      const before: string = context.resourceManager.getStringByNameSync('module_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 8191);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation36', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0003
     * @tc.name ContextDataSourceValidation_003
     * @tc.desc Verify resource EntryAbility_desc survives cache/create roundtrip repeated 512 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_003', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'description';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 512);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation37', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0004
     * @tc.name ContextDataSourceValidation_004
     * @tc.desc Verify resource EntryAbility_label survives files/truncate roundtrip repeated 63 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_004', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'label';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_label');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 63);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation38', 'files', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0005
     * @tc.name ContextDataSourceValidation_005
     * @tc.desc Verify resource success_message survives files/truncate roundtrip repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_005', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = '成功获取Context';
      const before: string = context.resourceManager.getStringByNameSync('success_message');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 2);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation39', 'files', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0006
     * @tc.name ContextDataSourceValidation_006
     * @tc.desc Verify resource module_desc survives files/truncate roundtrip repeated 2048 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_006', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'module description';
      const before: string = context.resourceManager.getStringByNameSync('module_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 2048);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation40', 'files', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0007
     * @tc.name ContextDataSourceValidation_007
     * @tc.desc Verify resource EntryAbility_desc survives files/truncate roundtrip repeated 255 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_007', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'description';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 255);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation41', 'files', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0008
     * @tc.name ContextDataSourceValidation_008
     * @tc.desc Verify resource EntryAbility_label survives cache/truncate roundtrip repeated 16 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_008', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'label';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_label');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 16);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation42', 'cache', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0009
     * @tc.name ContextDataSourceValidation_009
     * @tc.desc Verify resource success_message survives cache/truncate roundtrip repeated 8192 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_009', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = '成功获取Context';
      const before: string = context.resourceManager.getStringByNameSync('success_message');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 8192);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation43', 'cache', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0010
     * @tc.name ContextDataSourceValidation_010
     * @tc.desc Verify resource module_desc survives cache/truncate roundtrip repeated 1023 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_010', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'module description';
      const before: string = context.resourceManager.getStringByNameSync('module_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 1023);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation44', 'cache', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0011
     * @tc.name ContextDataSourceValidation_011
     * @tc.desc Verify resource EntryAbility_desc survives cache/truncate roundtrip repeated 64 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_011', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'description';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 64);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation45', 'cache', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0012
     * @tc.name ContextDataSourceValidation_012
     * @tc.desc Verify resource EntryAbility_label survives cache/truncate roundtrip repeated 7 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_012', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'label';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_label');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 7);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation46', 'cache', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0013
     * @tc.name ContextDataSourceValidation_013
     * @tc.desc Verify resource success_message survives files/append roundtrip repeated 4095 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_013', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = '成功获取Context';
      const before: string = context.resourceManager.getStringByNameSync('success_message');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 4095);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation47', 'files', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0014
     * @tc.name ContextDataSourceValidation_014
     * @tc.desc Verify resource module_desc survives files/append roundtrip repeated 256 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_014', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'module description';
      const before: string = context.resourceManager.getStringByNameSync('module_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 256);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation48', 'files', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0015
     * @tc.name ContextDataSourceValidation_015
     * @tc.desc Verify resource EntryAbility_desc survives files/append roundtrip repeated 31 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_015', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'description';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 31);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation49', 'files', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0016
     * @tc.name ContextDataSourceValidation_016
     * @tc.desc Verify resource EntryAbility_label survives files/append roundtrip repeated 0 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_016', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'label';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_label');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 0);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation50', 'files', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0017
     * @tc.name ContextDataSourceValidation_017
     * @tc.desc Verify resource success_message survives files/append roundtrip repeated 1024 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_017', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = '成功获取Context';
      const before: string = context.resourceManager.getStringByNameSync('success_message');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 1024);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation51', 'files', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0018
     * @tc.name ContextDataSourceValidation_018
     * @tc.desc Verify resource module_desc survives cache/append roundtrip repeated 127 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_018', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'module description';
      const before: string = context.resourceManager.getStringByNameSync('module_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 127);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation52', 'cache', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0019
     * @tc.name ContextDataSourceValidation_019
     * @tc.desc Verify resource EntryAbility_desc survives cache/append roundtrip repeated 8 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_019', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'description';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 8);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation53', 'cache', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0020
     * @tc.name ContextDataSourceValidation_020
     * @tc.desc Verify resource EntryAbility_label survives cache/append roundtrip repeated 4096 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_020', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'label';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_label');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 4096);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation54', 'cache', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0021
     * @tc.name ContextDataSourceValidation_021
     * @tc.desc Verify resource success_message survives cache/append roundtrip repeated 511 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_021', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = '成功获取Context';
      const before: string = context.resourceManager.getStringByNameSync('success_message');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 511);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation55', 'cache', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0022
     * @tc.name ContextDataSourceValidation_022
     * @tc.desc Verify resource module_desc survives files/create roundtrip repeated 32 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_022', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'module description';
      const before: string = context.resourceManager.getStringByNameSync('module_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 32);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation56', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0023
     * @tc.name ContextDataSourceValidation_023
     * @tc.desc Verify resource EntryAbility_desc survives files/create roundtrip repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_023', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'description';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 1);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation57', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0024
     * @tc.name ContextDataSourceValidation_024
     * @tc.desc Verify resource EntryAbility_label survives files/create roundtrip repeated 2047 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_024', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'label';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_label');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 2047);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation58', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0025
     * @tc.name ContextDataSourceValidation_025
     * @tc.desc Verify resource success_message survives files/create roundtrip repeated 128 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_025', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = '成功获取Context';
      const before: string = context.resourceManager.getStringByNameSync('success_message');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 128);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation59', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0026
     * @tc.name ContextDataSourceValidation_026
     * @tc.desc Verify resource module_desc survives files/create roundtrip repeated 15 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_026', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'module description';
      const before: string = context.resourceManager.getStringByNameSync('module_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 15);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation60', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0027
     * @tc.name ContextDataSourceValidation_027
     * @tc.desc Verify resource EntryAbility_desc survives cache/create roundtrip repeated 8191 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_027', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'description';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 8191);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation61', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0028
     * @tc.name ContextDataSourceValidation_028
     * @tc.desc Verify resource EntryAbility_label survives cache/create roundtrip repeated 512 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_028', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'label';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_label');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 512);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation62', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0029
     * @tc.name ContextDataSourceValidation_029
     * @tc.desc Verify resource success_message survives cache/create roundtrip repeated 63 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_029', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = '成功获取Context';
      const before: string = context.resourceManager.getStringByNameSync('success_message');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 63);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation63', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0030
     * @tc.name ContextDataSourceValidation_030
     * @tc.desc Verify resource module_desc survives cache/create roundtrip repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_030', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'module description';
      const before: string = context.resourceManager.getStringByNameSync('module_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 2);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation64', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0031
     * @tc.name ContextDataSourceValidation_031
     * @tc.desc Verify resource EntryAbility_desc survives cache/create roundtrip repeated 2048 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_031', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'description';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 2048);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation65', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0032
     * @tc.name ContextDataSourceValidation_032
     * @tc.desc Verify resource EntryAbility_label survives files/truncate roundtrip repeated 255 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_032', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'label';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_label');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 255);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation66', 'files', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0033
     * @tc.name ContextDataSourceValidation_033
     * @tc.desc Verify resource success_message survives files/truncate roundtrip repeated 16 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_033', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = '成功获取Context';
      const before: string = context.resourceManager.getStringByNameSync('success_message');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 16);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation67', 'files', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0034
     * @tc.name ContextDataSourceValidation_034
     * @tc.desc Verify resource module_desc survives files/truncate roundtrip repeated 8192 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_034', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'module description';
      const before: string = context.resourceManager.getStringByNameSync('module_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 8192);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation68', 'files', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0035
     * @tc.name ContextDataSourceValidation_035
     * @tc.desc Verify resource EntryAbility_desc survives files/truncate roundtrip repeated 1023 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_035', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'description';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 1023);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation69', 'files', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0036
     * @tc.name ContextDataSourceValidation_036
     * @tc.desc Verify resource EntryAbility_label survives cache/truncate roundtrip repeated 64 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_036', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'label';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_label');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 64);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation70', 'cache', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0037
     * @tc.name ContextDataSourceValidation_037
     * @tc.desc Verify resource success_message survives cache/truncate roundtrip repeated 7 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_037', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = '成功获取Context';
      const before: string = context.resourceManager.getStringByNameSync('success_message');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 7);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation71', 'cache', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0038
     * @tc.name ContextDataSourceValidation_038
     * @tc.desc Verify resource module_desc survives cache/truncate roundtrip repeated 4095 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_038', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'module description';
      const before: string = context.resourceManager.getStringByNameSync('module_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 4095);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation72', 'cache', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0039
     * @tc.name ContextDataSourceValidation_039
     * @tc.desc Verify resource EntryAbility_desc survives cache/truncate roundtrip repeated 256 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_039', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'description';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 256);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation73', 'cache', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0040
     * @tc.name ContextDataSourceValidation_040
     * @tc.desc Verify resource EntryAbility_label survives cache/truncate roundtrip repeated 31 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_040', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'label';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_label');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 31);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation74', 'cache', content, 'truncate');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0041
     * @tc.name ContextDataSourceValidation_041
     * @tc.desc Verify resource success_message survives files/append roundtrip repeated 0 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_041', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = '成功获取Context';
      const before: string = context.resourceManager.getStringByNameSync('success_message');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 0);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation75', 'files', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0042
     * @tc.name ContextDataSourceValidation_042
     * @tc.desc Verify resource module_desc survives files/append roundtrip repeated 1024 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_042', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'module description';
      const before: string = context.resourceManager.getStringByNameSync('module_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 1024);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation76', 'files', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0043
     * @tc.name ContextDataSourceValidation_043
     * @tc.desc Verify resource EntryAbility_desc survives files/append roundtrip repeated 127 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_043', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'description';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_desc');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 127);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation77', 'files', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTDATASOURCEVALIDATION_0044
     * @tc.name ContextDataSourceValidation_044
     * @tc.desc Verify resource EntryAbility_label survives files/append roundtrip repeated 8 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextDataSourceValidation_044', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const expected: string = 'label';
      const before: string = context.resourceManager.getStringByNameSync('EntryAbility_label');
      expect(before).assertEqual(expected);
      const module: common.Context = await requireModule();
      expect(module.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
      const content: string = payload(expected, 8);
      const actual: FileProbe = await probeFile('ContextDataSourceValidation78', 'files', content, 'append');
      expect(actual.text).assertEqual('prefix:' + content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
  });
}
