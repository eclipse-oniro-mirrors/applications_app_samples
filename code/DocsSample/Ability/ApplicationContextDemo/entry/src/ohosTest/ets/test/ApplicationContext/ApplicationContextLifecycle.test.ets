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

export default function applicationContextLifecycleTest(): void {
  describe('ApplicationContextLifecycle', () => {
    beforeAll((): void => {
      expect(requireContext().applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    afterAll((): void => {
      hilog.info(0xF811, 'ContextTests', 'ApplicationContextLifecycle completed');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTLIFECYCLE_0001
     * @tc.name ApplicationContextLifecycle_001
     * @tc.desc Verify background/foreground retains Index after 0 clicks; files/create 0 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextLifecycle_001', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_0_', 0);
      const before: FileProbe = await probeFile('ApplicationContextLifecycle0_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(0, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual(actual.initial);
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextLifecycle0_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTLIFECYCLE_0002
     * @tc.name ApplicationContextLifecycle_002
     * @tc.desc Verify background/foreground retains Index after 1 clicks; files/create 1024 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextLifecycle_002', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_1_', 1024);
      const before: FileProbe = await probeFile('ApplicationContextLifecycle1_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(1, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextLifecycle1_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTLIFECYCLE_0003
     * @tc.name ApplicationContextLifecycle_003
     * @tc.desc Verify background/foreground retains Index after 2 clicks; files/create 127 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextLifecycle_003', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_2_', 127);
      const before: FileProbe = await probeFile('ApplicationContextLifecycle2_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(2, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextLifecycle2_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTLIFECYCLE_0004
     * @tc.name ApplicationContextLifecycle_004
     * @tc.desc Verify background/foreground retains Index after 3 clicks; files/create 8 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextLifecycle_004', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_3_', 8);
      const before: FileProbe = await probeFile('ApplicationContextLifecycle3_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(3, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextLifecycle3_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTLIFECYCLE_0005
     * @tc.name ApplicationContextLifecycle_005
     * @tc.desc Verify background/foreground retains Index after 5 clicks; files/create 4096 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextLifecycle_005', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_4_', 4096);
      const before: FileProbe = await probeFile('ApplicationContextLifecycle4_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(5, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextLifecycle4_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTLIFECYCLE_0006
     * @tc.name ApplicationContextLifecycle_006
     * @tc.desc Verify background/foreground retains Index after 8 clicks; cache/create 511 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextLifecycle_006', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_5_', 511);
      const before: FileProbe = await probeFile('ApplicationContextLifecycle5_before', 'cache', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(8, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextLifecycle5_after', 'cache', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTLIFECYCLE_0007
     * @tc.name ApplicationContextLifecycle_007
     * @tc.desc Verify background/foreground retains Index after 0 clicks; cache/create 32 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextLifecycle_007', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_6_', 32);
      const before: FileProbe = await probeFile('ApplicationContextLifecycle6_before', 'cache', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(0, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual(actual.initial);
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextLifecycle6_after', 'cache', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTLIFECYCLE_0008
     * @tc.name ApplicationContextLifecycle_008
     * @tc.desc Verify background/foreground retains Index after 1 clicks; cache/create 1 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextLifecycle_008', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_7_', 1);
      const before: FileProbe = await probeFile('ApplicationContextLifecycle7_before', 'cache', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(1, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextLifecycle7_after', 'cache', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTLIFECYCLE_0009
     * @tc.name ApplicationContextLifecycle_009
     * @tc.desc Verify background/foreground retains Index after 2 clicks; cache/create 2047 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextLifecycle_009', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_8_', 2047);
      const before: FileProbe = await probeFile('ApplicationContextLifecycle8_before', 'cache', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(2, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextLifecycle8_after', 'cache', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTLIFECYCLE_0010
     * @tc.name ApplicationContextLifecycle_010
     * @tc.desc Verify background/foreground retains Index after 3 clicks; cache/create 128 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextLifecycle_010', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_9_', 128);
      const before: FileProbe = await probeFile('ApplicationContextLifecycle9_before', 'cache', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(3, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextLifecycle9_after', 'cache', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTLIFECYCLE_0011
     * @tc.name ApplicationContextLifecycle_011
     * @tc.desc Verify background/foreground retains Index after 5 clicks; files/truncate 15 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextLifecycle_011', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_10_', 15);
      const before: FileProbe = await probeFile('ApplicationContextLifecycle10_before', 'files', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(5, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextLifecycle10_after', 'files', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTLIFECYCLE_0012
     * @tc.name ApplicationContextLifecycle_012
     * @tc.desc Verify background/foreground retains Index after 8 clicks; files/truncate 8191 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextLifecycle_012', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_11_', 8191);
      const before: FileProbe = await probeFile('ApplicationContextLifecycle11_before', 'files', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(8, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextLifecycle11_after', 'files', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTLIFECYCLE_0013
     * @tc.name ApplicationContextLifecycle_013
     * @tc.desc Verify background/foreground retains Index after 0 clicks; files/truncate 512 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextLifecycle_013', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_12_', 512);
      const before: FileProbe = await probeFile('ApplicationContextLifecycle12_before', 'files', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(0, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual(actual.initial);
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextLifecycle12_after', 'files', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTLIFECYCLE_0014
     * @tc.name ApplicationContextLifecycle_014
     * @tc.desc Verify background/foreground retains Index after 1 clicks; files/truncate 63 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextLifecycle_014', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_13_', 63);
      const before: FileProbe = await probeFile('ApplicationContextLifecycle13_before', 'files', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(1, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextLifecycle13_after', 'files', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTLIFECYCLE_0015
     * @tc.name ApplicationContextLifecycle_015
     * @tc.desc Verify background/foreground retains Index after 2 clicks; cache/truncate 2 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextLifecycle_015', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_14_', 2);
      const before: FileProbe = await probeFile('ApplicationContextLifecycle14_before', 'cache', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(2, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextLifecycle14_after', 'cache', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTLIFECYCLE_0016
     * @tc.name ApplicationContextLifecycle_016
     * @tc.desc Verify background/foreground retains Index after 3 clicks; cache/truncate 2048 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextLifecycle_016', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_15_', 2048);
      const before: FileProbe = await probeFile('ApplicationContextLifecycle15_before', 'cache', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(3, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextLifecycle15_after', 'cache', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTLIFECYCLE_0017
     * @tc.name ApplicationContextLifecycle_017
     * @tc.desc Verify background/foreground retains Index after 5 clicks; cache/truncate 255 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextLifecycle_017', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_16_', 255);
      const before: FileProbe = await probeFile('ApplicationContextLifecycle16_before', 'cache', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(5, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextLifecycle16_after', 'cache', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTLIFECYCLE_0018
     * @tc.name ApplicationContextLifecycle_018
     * @tc.desc Verify background/foreground retains Index after 8 clicks; cache/truncate 16 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextLifecycle_018', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_17_', 16);
      const before: FileProbe = await probeFile('ApplicationContextLifecycle17_before', 'cache', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(8, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextLifecycle17_after', 'cache', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTLIFECYCLE_0019
     * @tc.name ApplicationContextLifecycle_019
     * @tc.desc Verify background/foreground retains Index after 0 clicks; cache/truncate 8192 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextLifecycle_019', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_18_', 8192);
      const before: FileProbe = await probeFile('ApplicationContextLifecycle18_before', 'cache', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(0, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual(actual.initial);
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextLifecycle18_after', 'cache', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTLIFECYCLE_0020
     * @tc.name ApplicationContextLifecycle_020
     * @tc.desc Verify background/foreground retains Index after 1 clicks; files/append 1023 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextLifecycle_020', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_19_', 1023);
      const before: FileProbe = await probeFile('ApplicationContextLifecycle19_before', 'files', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(1, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextLifecycle19_after', 'files', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTLIFECYCLE_0021
     * @tc.name ApplicationContextLifecycle_021
     * @tc.desc Verify background/foreground retains Index after 2 clicks; files/append 64 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextLifecycle_021', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_20_', 64);
      const before: FileProbe = await probeFile('ApplicationContextLifecycle20_before', 'files', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(2, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextLifecycle20_after', 'files', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTLIFECYCLE_0022
     * @tc.name ApplicationContextLifecycle_022
     * @tc.desc Verify background/foreground retains Index after 3 clicks; files/append 7 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextLifecycle_022', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_21_', 7);
      const before: FileProbe = await probeFile('ApplicationContextLifecycle21_before', 'files', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(3, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextLifecycle21_after', 'files', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTLIFECYCLE_0023
     * @tc.name ApplicationContextLifecycle_023
     * @tc.desc Verify background/foreground retains Index after 5 clicks; files/append 4095 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextLifecycle_023', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_22_', 4095);
      const before: FileProbe = await probeFile('ApplicationContextLifecycle22_before', 'files', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(5, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextLifecycle22_after', 'files', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTLIFECYCLE_0024
     * @tc.name ApplicationContextLifecycle_024
     * @tc.desc Verify background/foreground retains Index after 8 clicks; files/append 256 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextLifecycle_024', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_23_', 256);
      const before: FileProbe = await probeFile('ApplicationContextLifecycle23_before', 'files', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(8, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextLifecycle23_after', 'files', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTLIFECYCLE_0025
     * @tc.name ApplicationContextLifecycle_025
     * @tc.desc Verify background/foreground retains Index after 0 clicks; cache/append 31 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextLifecycle_025', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_24_', 31);
      const before: FileProbe = await probeFile('ApplicationContextLifecycle24_before', 'cache', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(0, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual(actual.initial);
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextLifecycle24_after', 'cache', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTLIFECYCLE_0026
     * @tc.name ApplicationContextLifecycle_026
     * @tc.desc Verify background/foreground retains Index after 1 clicks; cache/append 0 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextLifecycle_026', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_25_', 0);
      const before: FileProbe = await probeFile('ApplicationContextLifecycle25_before', 'cache', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(1, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextLifecycle25_after', 'cache', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTLIFECYCLE_0027
     * @tc.name ApplicationContextLifecycle_027
     * @tc.desc Verify background/foreground retains Index after 2 clicks; cache/append 1024 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextLifecycle_027', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_26_', 1024);
      const before: FileProbe = await probeFile('ApplicationContextLifecycle26_before', 'cache', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(2, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextLifecycle26_after', 'cache', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTLIFECYCLE_0028
     * @tc.name ApplicationContextLifecycle_028
     * @tc.desc Verify background/foreground retains Index after 3 clicks; cache/append 127 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextLifecycle_028', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_27_', 127);
      const before: FileProbe = await probeFile('ApplicationContextLifecycle27_before', 'cache', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(3, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextLifecycle27_after', 'cache', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTLIFECYCLE_0029
     * @tc.name ApplicationContextLifecycle_029
     * @tc.desc Verify background/foreground retains Index after 5 clicks; files/create 8 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextLifecycle_029', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_28_', 8);
      const before: FileProbe = await probeFile('ApplicationContextLifecycle28_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(5, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextLifecycle28_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTLIFECYCLE_0030
     * @tc.name ApplicationContextLifecycle_030
     * @tc.desc Verify background/foreground retains Index after 8 clicks; files/create 4096 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextLifecycle_030', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_29_', 4096);
      const before: FileProbe = await probeFile('ApplicationContextLifecycle29_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(8, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextLifecycle29_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTLIFECYCLE_0031
     * @tc.name ApplicationContextLifecycle_031
     * @tc.desc Verify background/foreground retains Index after 0 clicks; files/create 511 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextLifecycle_031', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_30_', 511);
      const before: FileProbe = await probeFile('ApplicationContextLifecycle30_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(0, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual(actual.initial);
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextLifecycle30_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
  });
}
