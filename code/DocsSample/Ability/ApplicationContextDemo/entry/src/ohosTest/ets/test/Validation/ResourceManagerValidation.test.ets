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

export default function resourceManagerValidationTest(): void {
  describe('ResourceManagerValidation', () => {
    beforeAll((): void => {
      expect(requireContext().applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    afterAll((): void => {
      hilog.info(0xF811, 'ContextTests', 'ResourceManagerValidation completed');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_RESOURCEMANAGERVALIDATION_0001
     * @tc.name ResourceManagerValidation_001
     * @tc.desc Verify resource EntryAbility_desc survives files/create roundtrip repeated 1023 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ResourceManagerValidation_001', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ResourceManagerValidation169', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_RESOURCEMANAGERVALIDATION_0002
     * @tc.name ResourceManagerValidation_002
     * @tc.desc Verify resource EntryAbility_label survives files/create roundtrip repeated 64 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ResourceManagerValidation_002', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ResourceManagerValidation170', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_RESOURCEMANAGERVALIDATION_0003
     * @tc.name ResourceManagerValidation_003
     * @tc.desc Verify resource success_message survives files/create roundtrip repeated 7 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ResourceManagerValidation_003', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ResourceManagerValidation171', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_RESOURCEMANAGERVALIDATION_0004
     * @tc.name ResourceManagerValidation_004
     * @tc.desc Verify resource module_desc survives files/create roundtrip repeated 4095 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ResourceManagerValidation_004', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ResourceManagerValidation172', 'files', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_RESOURCEMANAGERVALIDATION_0005
     * @tc.name ResourceManagerValidation_005
     * @tc.desc Verify resource EntryAbility_desc survives cache/create roundtrip repeated 256 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ResourceManagerValidation_005', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ResourceManagerValidation173', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_desc')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_RESOURCEMANAGERVALIDATION_0006
     * @tc.name ResourceManagerValidation_006
     * @tc.desc Verify resource EntryAbility_label survives cache/create roundtrip repeated 31 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ResourceManagerValidation_006', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ResourceManagerValidation174', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_RESOURCEMANAGERVALIDATION_0007
     * @tc.name ResourceManagerValidation_007
     * @tc.desc Verify resource success_message survives cache/create roundtrip repeated 0 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ResourceManagerValidation_007', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ResourceManagerValidation175', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('success_message')).assertEqual(expected);
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_RESOURCEMANAGERVALIDATION_0008
     * @tc.name ResourceManagerValidation_008
     * @tc.desc Verify resource module_desc survives cache/create roundtrip repeated 1024 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ResourceManagerValidation_008', 0, async (): Promise<void> => {
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
      const actual: FileProbe = await probeFile('ResourceManagerValidation176', 'cache', content, 'create');
      expect(actual.text).assertEqual(content);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.existsAfter).assertFalse();
      expect(context.resourceManager.getStringByNameSync('module_desc')).assertEqual(expected);
    });
  });
}
