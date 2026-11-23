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

export default function applicationContextErrorRecoveryTest(): void {
  describe('ApplicationContextErrorRecovery', () => {
    beforeAll((): void => {
      expect(requireContext().applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    afterAll((): void => {
      hilog.info(0xF811, 'ContextTests', 'ApplicationContextErrorRecovery completed');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0001
     * @tc.name ApplicationContextErrorRecovery_001
     * @tc.desc Verify background/foreground retains Index after 1 clicks; files/create 32 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_001', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_31_', 32);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery31_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(1, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery31_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0002
     * @tc.name ApplicationContextErrorRecovery_002
     * @tc.desc Verify background/foreground retains Index after 2 clicks; files/create 1 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_002', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_32_', 1);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery32_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(2, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery32_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0003
     * @tc.name ApplicationContextErrorRecovery_003
     * @tc.desc Verify background/foreground retains Index after 3 clicks; cache/create 2047 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_003', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_33_', 2047);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery33_before', 'cache', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(3, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery33_after', 'cache', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0004
     * @tc.name ApplicationContextErrorRecovery_004
     * @tc.desc Verify background/foreground retains Index after 5 clicks; cache/create 128 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_004', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_34_', 128);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery34_before', 'cache', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(5, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery34_after', 'cache', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0005
     * @tc.name ApplicationContextErrorRecovery_005
     * @tc.desc Verify background/foreground retains Index after 8 clicks; cache/create 15 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_005', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_35_', 15);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery35_before', 'cache', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(8, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery35_after', 'cache', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0006
     * @tc.name ApplicationContextErrorRecovery_006
     * @tc.desc Verify background/foreground retains Index after 0 clicks; cache/create 8191 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_006', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_36_', 8191);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery36_before', 'cache', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(0, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual(actual.initial);
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery36_after', 'cache', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0007
     * @tc.name ApplicationContextErrorRecovery_007
     * @tc.desc Verify background/foreground retains Index after 1 clicks; cache/create 512 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_007', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_37_', 512);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery37_before', 'cache', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(1, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery37_after', 'cache', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0008
     * @tc.name ApplicationContextErrorRecovery_008
     * @tc.desc Verify background/foreground retains Index after 2 clicks; files/truncate 63 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_008', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_38_', 63);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery38_before', 'files', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(2, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery38_after', 'files', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0009
     * @tc.name ApplicationContextErrorRecovery_009
     * @tc.desc Verify background/foreground retains Index after 3 clicks; files/truncate 2 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_009', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_39_', 2);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery39_before', 'files', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(3, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery39_after', 'files', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0010
     * @tc.name ApplicationContextErrorRecovery_010
     * @tc.desc Verify background/foreground retains Index after 5 clicks; files/truncate 2048 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_010', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_40_', 2048);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery40_before', 'files', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(5, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery40_after', 'files', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0011
     * @tc.name ApplicationContextErrorRecovery_011
     * @tc.desc Verify background/foreground retains Index after 8 clicks; files/truncate 255 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_011', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_41_', 255);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery41_before', 'files', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(8, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery41_after', 'files', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0012
     * @tc.name ApplicationContextErrorRecovery_012
     * @tc.desc Verify background/foreground retains Index after 0 clicks; cache/truncate 16 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_012', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_42_', 16);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery42_before', 'cache', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(0, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual(actual.initial);
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery42_after', 'cache', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0013
     * @tc.name ApplicationContextErrorRecovery_013
     * @tc.desc Verify background/foreground retains Index after 1 clicks; cache/truncate 8192 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_013', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_43_', 8192);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery43_before', 'cache', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(1, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery43_after', 'cache', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0014
     * @tc.name ApplicationContextErrorRecovery_014
     * @tc.desc Verify background/foreground retains Index after 2 clicks; cache/truncate 1023 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_014', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_44_', 1023);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery44_before', 'cache', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(2, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery44_after', 'cache', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0015
     * @tc.name ApplicationContextErrorRecovery_015
     * @tc.desc Verify background/foreground retains Index after 3 clicks; cache/truncate 64 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_015', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_45_', 64);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery45_before', 'cache', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(3, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery45_after', 'cache', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0016
     * @tc.name ApplicationContextErrorRecovery_016
     * @tc.desc Verify background/foreground retains Index after 5 clicks; cache/truncate 7 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_016', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_46_', 7);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery46_before', 'cache', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(5, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery46_after', 'cache', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0017
     * @tc.name ApplicationContextErrorRecovery_017
     * @tc.desc Verify background/foreground retains Index after 8 clicks; files/append 4095 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_017', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_47_', 4095);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery47_before', 'files', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(8, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery47_after', 'files', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0018
     * @tc.name ApplicationContextErrorRecovery_018
     * @tc.desc Verify background/foreground retains Index after 0 clicks; files/append 256 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_018', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_48_', 256);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery48_before', 'files', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(0, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual(actual.initial);
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery48_after', 'files', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0019
     * @tc.name ApplicationContextErrorRecovery_019
     * @tc.desc Verify background/foreground retains Index after 1 clicks; files/append 31 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_019', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_49_', 31);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery49_before', 'files', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(1, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery49_after', 'files', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0020
     * @tc.name ApplicationContextErrorRecovery_020
     * @tc.desc Verify background/foreground retains Index after 2 clicks; files/append 0 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_020', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_50_', 0);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery50_before', 'files', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(2, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery50_after', 'files', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0021
     * @tc.name ApplicationContextErrorRecovery_021
     * @tc.desc Verify background/foreground retains Index after 3 clicks; files/append 1024 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_021', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_51_', 1024);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery51_before', 'files', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(3, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery51_after', 'files', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0022
     * @tc.name ApplicationContextErrorRecovery_022
     * @tc.desc Verify background/foreground retains Index after 5 clicks; cache/append 127 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_022', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_52_', 127);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery52_before', 'cache', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(5, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery52_after', 'cache', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0023
     * @tc.name ApplicationContextErrorRecovery_023
     * @tc.desc Verify background/foreground retains Index after 8 clicks; cache/append 8 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_023', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_53_', 8);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery53_before', 'cache', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(8, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery53_after', 'cache', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0024
     * @tc.name ApplicationContextErrorRecovery_024
     * @tc.desc Verify background/foreground retains Index after 0 clicks; cache/append 4096 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_024', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_54_', 4096);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery54_before', 'cache', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(0, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual(actual.initial);
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery54_after', 'cache', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0025
     * @tc.name ApplicationContextErrorRecovery_025
     * @tc.desc Verify background/foreground retains Index after 1 clicks; cache/append 511 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_025', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_55_', 511);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery55_before', 'cache', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(1, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery55_after', 'cache', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0026
     * @tc.name ApplicationContextErrorRecovery_026
     * @tc.desc Verify background/foreground retains Index after 2 clicks; files/create 32 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_026', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_56_', 32);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery56_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(2, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery56_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0027
     * @tc.name ApplicationContextErrorRecovery_027
     * @tc.desc Verify background/foreground retains Index after 3 clicks; files/create 1 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_027', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_57_', 1);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery57_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(3, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery57_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0028
     * @tc.name ApplicationContextErrorRecovery_028
     * @tc.desc Verify background/foreground retains Index after 5 clicks; files/create 2047 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_028', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_58_', 2047);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery58_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(5, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery58_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0029
     * @tc.name ApplicationContextErrorRecovery_029
     * @tc.desc Verify background/foreground retains Index after 8 clicks; files/create 128 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_029', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_59_', 128);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery59_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(8, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery59_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0030
     * @tc.name ApplicationContextErrorRecovery_030
     * @tc.desc Verify background/foreground retains Index after 0 clicks; files/create 15 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_030', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_60_', 15);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery60_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(0, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual(actual.initial);
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery60_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0031
     * @tc.name ApplicationContextErrorRecovery_031
     * @tc.desc Verify background/foreground retains Index after 1 clicks; cache/create 8191 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_031', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_61_', 8191);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery61_before', 'cache', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(1, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery61_after', 'cache', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0032
     * @tc.name ApplicationContextErrorRecovery_032
     * @tc.desc Verify background/foreground retains Index after 2 clicks; cache/create 512 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_032', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_62_', 512);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery62_before', 'cache', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(2, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery62_after', 'cache', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0033
     * @tc.name ApplicationContextErrorRecovery_033
     * @tc.desc Verify background/foreground retains Index after 3 clicks; cache/create 63 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_033', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_63_', 63);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery63_before', 'cache', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(3, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery63_after', 'cache', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0034
     * @tc.name ApplicationContextErrorRecovery_034
     * @tc.desc Verify background/foreground retains Index after 5 clicks; cache/create 2 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_034', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_64_', 2);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery64_before', 'cache', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(5, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery64_after', 'cache', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0035
     * @tc.name ApplicationContextErrorRecovery_035
     * @tc.desc Verify background/foreground retains Index after 8 clicks; cache/create 2048 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_035', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_65_', 2048);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery65_before', 'cache', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(8, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery65_after', 'cache', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0036
     * @tc.name ApplicationContextErrorRecovery_036
     * @tc.desc Verify background/foreground retains Index after 0 clicks; files/truncate 255 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_036', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_66_', 255);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery66_before', 'files', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(0, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual(actual.initial);
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery66_after', 'files', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0037
     * @tc.name ApplicationContextErrorRecovery_037
     * @tc.desc Verify background/foreground retains Index after 1 clicks; files/truncate 16 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_037', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_67_', 16);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery67_before', 'files', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(1, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery67_after', 'files', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0038
     * @tc.name ApplicationContextErrorRecovery_038
     * @tc.desc Verify background/foreground retains Index after 2 clicks; files/truncate 8192 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_038', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_68_', 8192);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery68_before', 'files', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(2, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery68_after', 'files', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0039
     * @tc.name ApplicationContextErrorRecovery_039
     * @tc.desc Verify background/foreground retains Index after 3 clicks; files/truncate 1023 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_039', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_69_', 1023);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery69_before', 'files', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(3, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery69_after', 'files', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0040
     * @tc.name ApplicationContextErrorRecovery_040
     * @tc.desc Verify background/foreground retains Index after 5 clicks; cache/truncate 64 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_040', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_70_', 64);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery70_before', 'cache', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(5, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery70_after', 'cache', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0041
     * @tc.name ApplicationContextErrorRecovery_041
     * @tc.desc Verify background/foreground retains Index after 8 clicks; cache/truncate 7 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_041', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_71_', 7);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery71_before', 'cache', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(8, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery71_after', 'cache', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0042
     * @tc.name ApplicationContextErrorRecovery_042
     * @tc.desc Verify background/foreground retains Index after 0 clicks; cache/truncate 4095 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_042', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_72_', 4095);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery72_before', 'cache', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(0, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual(actual.initial);
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery72_after', 'cache', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_APPLICATIONCONTEXTERRORRECOVERY_0043
     * @tc.name ApplicationContextErrorRecovery_043
     * @tc.desc Verify background/foreground retains Index after 1 clicks; cache/truncate 256 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ApplicationContextErrorRecovery_043', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_73_', 256);
      const before: FileProbe = await probeFile('ApplicationContextErrorRecovery73_before', 'cache', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(1, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('ApplicationContextErrorRecovery73_after', 'cache', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
  });
}
