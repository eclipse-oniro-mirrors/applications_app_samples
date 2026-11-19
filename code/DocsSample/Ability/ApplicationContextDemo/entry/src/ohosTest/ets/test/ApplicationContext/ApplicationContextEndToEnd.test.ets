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

export default function applicationContextEndToEndTest(): void {
  describe('ApplicationContextEndToEnd', () => {
    beforeAll((): void => {
      expect(requireContext().applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    afterAll((): void => {
      hilog.info(0xF811, 'ContextTests', 'ApplicationContextEndToEnd completed');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0001
     * @tc.name ApplicationContextEndToEnd_001
     * @tc.desc Verify background/foreground retains Index after 2 clicks; cache/truncate 31 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_001', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_74_', 31);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd74_before', 'cache', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(2, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd74_after', 'cache', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0002
     * @tc.name ApplicationContextEndToEnd_002
     * @tc.desc Verify background/foreground retains Index after 3 clicks; files/append 0 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_002', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_75_', 0);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd75_before', 'files', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(3, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd75_after', 'files', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0003
     * @tc.name ApplicationContextEndToEnd_003
     * @tc.desc Verify background/foreground retains Index after 5 clicks; files/append 1024 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_003', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_76_', 1024);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd76_before', 'files', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(5, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd76_after', 'files', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0004
     * @tc.name ApplicationContextEndToEnd_004
     * @tc.desc Verify background/foreground retains Index after 8 clicks; files/append 127 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_004', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_77_', 127);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd77_before', 'files', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(8, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd77_after', 'files', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0005
     * @tc.name ApplicationContextEndToEnd_005
     * @tc.desc Verify background/foreground retains Index after 0 clicks; files/append 8 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_005', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_78_', 8);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd78_before', 'files', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(0, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual(actual.initial);
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd78_after', 'files', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0006
     * @tc.name ApplicationContextEndToEnd_006
     * @tc.desc Verify background/foreground retains Index after 1 clicks; files/append 4096 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_006', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_79_', 4096);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd79_before', 'files', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(1, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd79_after', 'files', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0007
     * @tc.name ApplicationContextEndToEnd_007
     * @tc.desc Verify background/foreground retains Index after 2 clicks; cache/append 511 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_007', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_80_', 511);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd80_before', 'cache', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(2, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd80_after', 'cache', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0008
     * @tc.name ApplicationContextEndToEnd_008
     * @tc.desc Verify background/foreground retains Index after 3 clicks; cache/append 32 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_008', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_81_', 32);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd81_before', 'cache', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(3, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd81_after', 'cache', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0009
     * @tc.name ApplicationContextEndToEnd_009
     * @tc.desc Verify background/foreground retains Index after 5 clicks; cache/append 1 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_009', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_82_', 1);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd82_before', 'cache', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(5, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd82_after', 'cache', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0010
     * @tc.name ApplicationContextEndToEnd_010
     * @tc.desc Verify background/foreground retains Index after 8 clicks; cache/append 2047 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_010', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_83_', 2047);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd83_before', 'cache', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(8, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd83_after', 'cache', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0011
     * @tc.name ApplicationContextEndToEnd_011
     * @tc.desc Verify background/foreground retains Index after 0 clicks; files/create 128 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_011', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_84_', 128);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd84_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(0, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual(actual.initial);
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd84_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0012
     * @tc.name ApplicationContextEndToEnd_012
     * @tc.desc Verify background/foreground retains Index after 1 clicks; files/create 15 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_012', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_85_', 15);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd85_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(1, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd85_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0013
     * @tc.name ApplicationContextEndToEnd_013
     * @tc.desc Verify background/foreground retains Index after 2 clicks; files/create 8191 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_013', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_86_', 8191);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd86_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(2, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd86_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0014
     * @tc.name ApplicationContextEndToEnd_014
     * @tc.desc Verify background/foreground retains Index after 3 clicks; files/create 512 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_014', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_87_', 512);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd87_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(3, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd87_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0015
     * @tc.name ApplicationContextEndToEnd_015
     * @tc.desc Verify background/foreground retains Index after 5 clicks; files/create 63 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_015', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_88_', 63);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd88_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(5, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd88_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0016
     * @tc.name ApplicationContextEndToEnd_016
     * @tc.desc Verify background/foreground retains Index after 8 clicks; cache/create 2 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_016', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_89_', 2);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd89_before', 'cache', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(8, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd89_after', 'cache', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0017
     * @tc.name ApplicationContextEndToEnd_017
     * @tc.desc Verify background/foreground retains Index after 0 clicks; cache/create 2048 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_017', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_90_', 2048);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd90_before', 'cache', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(0, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual(actual.initial);
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd90_after', 'cache', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0018
     * @tc.name ApplicationContextEndToEnd_018
     * @tc.desc Verify background/foreground retains Index after 1 clicks; cache/create 255 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_018', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_91_', 255);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd91_before', 'cache', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(1, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd91_after', 'cache', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0019
     * @tc.name ApplicationContextEndToEnd_019
     * @tc.desc Verify background/foreground retains Index after 2 clicks; cache/create 16 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_019', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_92_', 16);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd92_before', 'cache', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(2, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd92_after', 'cache', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0020
     * @tc.name ApplicationContextEndToEnd_020
     * @tc.desc Verify background/foreground retains Index after 3 clicks; cache/create 8192 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_020', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_93_', 8192);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd93_before', 'cache', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(3, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd93_after', 'cache', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0021
     * @tc.name ApplicationContextEndToEnd_021
     * @tc.desc Verify background/foreground retains Index after 5 clicks; files/truncate 1023 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_021', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_94_', 1023);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd94_before', 'files', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(5, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd94_after', 'files', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0022
     * @tc.name ApplicationContextEndToEnd_022
     * @tc.desc Verify background/foreground retains Index after 8 clicks; files/truncate 64 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_022', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_95_', 64);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd95_before', 'files', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(8, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd95_after', 'files', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0023
     * @tc.name ApplicationContextEndToEnd_023
     * @tc.desc Verify background/foreground retains Index after 0 clicks; files/truncate 7 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_023', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_96_', 7);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd96_before', 'files', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(0, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual(actual.initial);
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd96_after', 'files', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0024
     * @tc.name ApplicationContextEndToEnd_024
     * @tc.desc Verify background/foreground retains Index after 1 clicks; files/truncate 4095 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_024', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_97_', 4095);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd97_before', 'files', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(1, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd97_after', 'files', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0025
     * @tc.name ApplicationContextEndToEnd_025
     * @tc.desc Verify background/foreground retains Index after 2 clicks; cache/truncate 256 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_025', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_98_', 256);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd98_before', 'cache', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(2, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd98_after', 'cache', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0026
     * @tc.name ApplicationContextEndToEnd_026
     * @tc.desc Verify background/foreground retains Index after 3 clicks; cache/truncate 31 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_026', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_99_', 31);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd99_before', 'cache', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(3, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd99_after', 'cache', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0027
     * @tc.name ApplicationContextEndToEnd_027
     * @tc.desc Verify background/foreground retains Index after 5 clicks; cache/truncate 0 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_027', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_100_', 0);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd100_before', 'cache', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(5, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd100_after', 'cache', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0028
     * @tc.name ApplicationContextEndToEnd_028
     * @tc.desc Verify background/foreground retains Index after 8 clicks; cache/truncate 1024 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_028', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_101_', 1024);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd101_before', 'cache', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(8, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd101_after', 'cache', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0029
     * @tc.name ApplicationContextEndToEnd_029
     * @tc.desc Verify background/foreground retains Index after 0 clicks; cache/truncate 127 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_029', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_102_', 127);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd102_before', 'cache', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(0, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual(actual.initial);
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd102_after', 'cache', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0030
     * @tc.name ApplicationContextEndToEnd_030
     * @tc.desc Verify background/foreground retains Index after 1 clicks; files/append 8 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_030', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_103_', 8);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd103_before', 'files', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(1, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd103_after', 'files', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0031
     * @tc.name ApplicationContextEndToEnd_031
     * @tc.desc Verify background/foreground retains Index after 2 clicks; files/append 4096 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_031', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_104_', 4096);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd104_before', 'files', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(2, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd104_after', 'files', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0032
     * @tc.name ApplicationContextEndToEnd_032
     * @tc.desc Verify background/foreground retains Index after 3 clicks; files/append 511 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_032', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_105_', 511);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd105_before', 'files', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(3, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd105_after', 'files', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0033
     * @tc.name ApplicationContextEndToEnd_033
     * @tc.desc Verify background/foreground retains Index after 5 clicks; files/append 32 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_033', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_106_', 32);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd106_before', 'files', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(5, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd106_after', 'files', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0034
     * @tc.name ApplicationContextEndToEnd_034
     * @tc.desc Verify background/foreground retains Index after 8 clicks; cache/append 1 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_034', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_107_', 1);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd107_before', 'cache', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(8, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd107_after', 'cache', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0035
     * @tc.name ApplicationContextEndToEnd_035
     * @tc.desc Verify background/foreground retains Index after 0 clicks; cache/append 2047 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_035', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_108_', 2047);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd108_before', 'cache', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(0, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual(actual.initial);
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd108_after', 'cache', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0036
     * @tc.name ApplicationContextEndToEnd_036
     * @tc.desc Verify background/foreground retains Index after 1 clicks; cache/append 128 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_036', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_109_', 128);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd109_before', 'cache', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(1, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd109_after', 'cache', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0037
     * @tc.name ApplicationContextEndToEnd_037
     * @tc.desc Verify background/foreground retains Index after 2 clicks; cache/append 15 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_037', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_110_', 15);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd110_before', 'cache', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(2, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd110_after', 'cache', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0038
     * @tc.name ApplicationContextEndToEnd_038
     * @tc.desc Verify background/foreground retains Index after 3 clicks; cache/append 8191 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_038', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_111_', 8191);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd111_before', 'cache', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(3, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd111_after', 'cache', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0039
     * @tc.name ApplicationContextEndToEnd_039
     * @tc.desc Verify background/foreground retains Index after 5 clicks; files/create 512 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_039', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_112_', 512);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd112_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(5, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd112_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0040
     * @tc.name ApplicationContextEndToEnd_040
     * @tc.desc Verify background/foreground retains Index after 8 clicks; files/create 63 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_040', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_113_', 63);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd113_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(8, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd113_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0041
     * @tc.name ApplicationContextEndToEnd_041
     * @tc.desc Verify background/foreground retains Index after 0 clicks; files/create 2 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_041', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_114_', 2);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd114_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(0, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual(actual.initial);
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd114_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0042
     * @tc.name ApplicationContextEndToEnd_042
     * @tc.desc Verify background/foreground retains Index after 1 clicks; files/create 2048 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_042', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_115_', 2048);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd115_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(1, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd115_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0043
     * @tc.name ApplicationContextEndToEnd_043
     * @tc.desc Verify background/foreground retains Index after 2 clicks; files/create 255 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_043', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_116_', 255);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd116_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(2, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd116_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0044
     * @tc.name ApplicationContextEndToEnd_044
     * @tc.desc Verify background/foreground retains Index after 3 clicks; cache/create 16 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_044', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_117_', 16);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd117_before', 'cache', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(3, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd117_after', 'cache', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTENDTOEND_0045
     * @tc.name ApplicationContextEndToEnd_045
     * @tc.desc Verify background/foreground retains Index after 5 clicks; cache/create 8192 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextEndToEnd_045', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_118_', 8192);
      const before: FileProbe = await probeFile('ApplicationContextEndToEnd118_before', 'cache', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(5, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextEndToEnd118_after', 'cache', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
  });
}
