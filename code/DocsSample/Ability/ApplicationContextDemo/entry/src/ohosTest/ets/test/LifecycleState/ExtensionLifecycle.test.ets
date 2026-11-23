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

export default function extensionLifecycleTest(): void {
  describe('ExtensionLifecycle', () => {
    beforeAll((): void => {
      expect(requireContext().applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    afterAll((): void => {
      hilog.info(0xF811, 'ContextTests', 'ExtensionLifecycle completed');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_EXTENSIONLIFECYCLE_0001
     * @tc.name ExtensionLifecycle_001
     * @tc.desc Verify background/foreground retains Index after 0 clicks; files/create 127 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ExtensionLifecycle_001', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_252_', 127);
      const before: FileProbe = await probeFile('ExtensionLifecycle252_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(0, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual(actual.initial);
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ExtensionLifecycle252_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_EXTENSIONLIFECYCLE_0002
     * @tc.name ExtensionLifecycle_002
     * @tc.desc Verify background/foreground retains Index after 1 clicks; files/create 8 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ExtensionLifecycle_002', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_253_', 8);
      const before: FileProbe = await probeFile('ExtensionLifecycle253_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(1, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ExtensionLifecycle253_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_EXTENSIONLIFECYCLE_0003
     * @tc.name ExtensionLifecycle_003
     * @tc.desc Verify background/foreground retains Index after 2 clicks; files/create 4096 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ExtensionLifecycle_003', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_254_', 4096);
      const before: FileProbe = await probeFile('ExtensionLifecycle254_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(2, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ExtensionLifecycle254_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_EXTENSIONLIFECYCLE_0004
     * @tc.name ExtensionLifecycle_004
     * @tc.desc Verify background/foreground retains Index after 3 clicks; files/create 511 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ExtensionLifecycle_004', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_255_', 511);
      const before: FileProbe = await probeFile('ExtensionLifecycle255_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(3, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ExtensionLifecycle255_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_EXTENSIONLIFECYCLE_0005
     * @tc.name ExtensionLifecycle_005
     * @tc.desc Verify background/foreground retains Index after 5 clicks; cache/create 32 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ExtensionLifecycle_005', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_256_', 32);
      const before: FileProbe = await probeFile('ExtensionLifecycle256_before', 'cache', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(5, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ExtensionLifecycle256_after', 'cache', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_EXTENSIONLIFECYCLE_0006
     * @tc.name ExtensionLifecycle_006
     * @tc.desc Verify background/foreground retains Index after 8 clicks; cache/create 1 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ExtensionLifecycle_006', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_257_', 1);
      const before: FileProbe = await probeFile('ExtensionLifecycle257_before', 'cache', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(8, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ExtensionLifecycle257_after', 'cache', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_EXTENSIONLIFECYCLE_0007
     * @tc.name ExtensionLifecycle_007
     * @tc.desc Verify background/foreground retains Index after 0 clicks; cache/create 2047 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ExtensionLifecycle_007', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_258_', 2047);
      const before: FileProbe = await probeFile('ExtensionLifecycle258_before', 'cache', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(0, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual(actual.initial);
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ExtensionLifecycle258_after', 'cache', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_EXTENSIONLIFECYCLE_0008
     * @tc.name ExtensionLifecycle_008
     * @tc.desc Verify background/foreground retains Index after 1 clicks; cache/create 128 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ExtensionLifecycle_008', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_259_', 128);
      const before: FileProbe = await probeFile('ExtensionLifecycle259_before', 'cache', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(1, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ExtensionLifecycle259_after', 'cache', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_EXTENSIONLIFECYCLE_0009
     * @tc.name ExtensionLifecycle_009
     * @tc.desc Verify background/foreground retains Index after 2 clicks; cache/create 15 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ExtensionLifecycle_009', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_260_', 15);
      const before: FileProbe = await probeFile('ExtensionLifecycle260_before', 'cache', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(2, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ExtensionLifecycle260_after', 'cache', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_EXTENSIONLIFECYCLE_0010
     * @tc.name ExtensionLifecycle_010
     * @tc.desc Verify background/foreground retains Index after 3 clicks; files/truncate 8191 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ExtensionLifecycle_010', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_261_', 8191);
      const before: FileProbe = await probeFile('ExtensionLifecycle261_before', 'files', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(3, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ExtensionLifecycle261_after', 'files', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
  });
}
