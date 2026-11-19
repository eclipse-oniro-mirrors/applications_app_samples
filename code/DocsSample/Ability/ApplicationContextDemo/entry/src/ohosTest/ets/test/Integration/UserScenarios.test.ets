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

export default function userScenariosTest(): void {
  describe('UserScenarios', () => {
    beforeAll((): void => {
      expect(requireContext().applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    afterAll((): void => {
      hilog.info(0xF811, 'ContextTests', 'UserScenarios completed');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_USERSCENARIOS_0001
     * @tc.name UserScenarios_001
     * @tc.desc Verify background/foreground retains Index after 0 clicks; cache/append 2048 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('UserScenarios_001', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_390_', 2048);
      const before: FileProbe = await probeFile('UserScenarios390_before', 'cache', content, 'append');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(0, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual(actual.initial);
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('UserScenarios390_after', 'cache', content, 'append');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_USERSCENARIOS_0002
     * @tc.name UserScenarios_002
     * @tc.desc Verify background/foreground retains Index after 1 clicks; files/create 255 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('UserScenarios_002', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_391_', 255);
      const before: FileProbe = await probeFile('UserScenarios391_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(1, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('UserScenarios391_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_USERSCENARIOS_0003
     * @tc.name UserScenarios_003
     * @tc.desc Verify background/foreground retains Index after 2 clicks; files/create 16 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('UserScenarios_003', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_392_', 16);
      const before: FileProbe = await probeFile('UserScenarios392_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(2, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('UserScenarios392_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_USERSCENARIOS_0004
     * @tc.name UserScenarios_004
     * @tc.desc Verify background/foreground retains Index after 3 clicks; files/create 8192 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('UserScenarios_004', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_393_', 8192);
      const before: FileProbe = await probeFile('UserScenarios393_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(3, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('UserScenarios393_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_USERSCENARIOS_0005
     * @tc.name UserScenarios_005
     * @tc.desc Verify background/foreground retains Index after 5 clicks; files/create 1023 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('UserScenarios_005', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_394_', 1023);
      const before: FileProbe = await probeFile('UserScenarios394_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(5, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('UserScenarios394_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_USERSCENARIOS_0006
     * @tc.name UserScenarios_006
     * @tc.desc Verify background/foreground retains Index after 8 clicks; files/create 64 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('UserScenarios_006', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_395_', 64);
      const before: FileProbe = await probeFile('UserScenarios395_before', 'files', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(8, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('UserScenarios395_after', 'files', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_USERSCENARIOS_0007
     * @tc.name UserScenarios_007
     * @tc.desc Verify background/foreground retains Index after 0 clicks; cache/create 7 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('UserScenarios_007', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_396_', 7);
      const before: FileProbe = await probeFile('UserScenarios396_before', 'cache', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(0, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual(actual.initial);
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('UserScenarios396_after', 'cache', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_USERSCENARIOS_0008
     * @tc.name UserScenarios_008
     * @tc.desc Verify background/foreground retains Index after 1 clicks; cache/create 4095 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('UserScenarios_008', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_397_', 4095);
      const before: FileProbe = await probeFile('UserScenarios397_before', 'cache', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(1, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('UserScenarios397_after', 'cache', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_USERSCENARIOS_0009
     * @tc.name UserScenarios_009
     * @tc.desc Verify background/foreground retains Index after 2 clicks; cache/create 256 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('UserScenarios_009', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_398_', 256);
      const before: FileProbe = await probeFile('UserScenarios398_before', 'cache', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(2, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('UserScenarios398_after', 'cache', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_USERSCENARIOS_0010
     * @tc.name UserScenarios_010
     * @tc.desc Verify background/foreground retains Index after 3 clicks; cache/create 31 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('UserScenarios_010', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_399_', 31);
      const before: FileProbe = await probeFile('UserScenarios399_before', 'cache', content, 'create');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(3, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('UserScenarios399_after', 'cache', content, 'create');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_USERSCENARIOS_0011
     * @tc.name UserScenarios_011
     * @tc.desc Verify background/foreground retains Index after 5 clicks; files/truncate 0 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('UserScenarios_011', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_400_', 0);
      const before: FileProbe = await probeFile('UserScenarios400_before', 'files', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(5, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('UserScenarios400_after', 'files', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_USERSCENARIOS_0012
     * @tc.name UserScenarios_012
     * @tc.desc Verify background/foreground retains Index after 8 clicks; files/truncate 1024 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('UserScenarios_012', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_401_', 1024);
      const before: FileProbe = await probeFile('UserScenarios401_before', 'files', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(8, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('UserScenarios401_after', 'files', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_USERSCENARIOS_0013
     * @tc.name UserScenarios_013
     * @tc.desc Verify background/foreground retains Index after 0 clicks; files/truncate 127 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('UserScenarios_013', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_402_', 127);
      const before: FileProbe = await probeFile('UserScenarios402_before', 'files', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(0, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual(actual.initial);
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('UserScenarios402_after', 'files', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_USERSCENARIOS_0014
     * @tc.name UserScenarios_014
     * @tc.desc Verify background/foreground retains Index after 1 clicks; files/truncate 8 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('UserScenarios_014', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_403_', 8);
      const before: FileProbe = await probeFile('UserScenarios403_before', 'files', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(1, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('UserScenarios403_after', 'files', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_USERSCENARIOS_0015
     * @tc.name UserScenarios_015
     * @tc.desc Verify background/foreground retains Index after 2 clicks; files/truncate 4096 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('UserScenarios_015', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_404_', 4096);
      const before: FileProbe = await probeFile('UserScenarios404_before', 'files', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(2, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('UserScenarios404_after', 'files', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_USERSCENARIOS_0016
     * @tc.name UserScenarios_016
     * @tc.desc Verify background/foreground retains Index after 3 clicks; cache/truncate 511 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('UserScenarios_016', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_405_', 511);
      const before: FileProbe = await probeFile('UserScenarios405_before', 'cache', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(3, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('UserScenarios405_after', 'cache', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_USERSCENARIOS_0017
     * @tc.name UserScenarios_017
     * @tc.desc Verify background/foreground retains Index after 5 clicks; cache/truncate 32 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('UserScenarios_017', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_406_', 32);
      const before: FileProbe = await probeFile('UserScenarios406_before', 'cache', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(5, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('UserScenarios406_after', 'cache', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_USERSCENARIOS_0018
     * @tc.name UserScenarios_018
     * @tc.desc Verify background/foreground retains Index after 8 clicks; cache/truncate 1 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('UserScenarios_018', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_407_', 1);
      const before: FileProbe = await probeFile('UserScenarios407_before', 'cache', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(8, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual('Welcome');
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('UserScenarios407_after', 'cache', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_USERSCENARIOS_0019
     * @tc.name UserScenarios_019
     * @tc.desc Verify background/foreground retains Index after 0 clicks; cache/truncate 2047 units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('UserScenarios_019', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const originalFiles: string = context.filesDir;
      const originalCache: string = context.cacheDir;
      const content: string = payload('lifecycle_408_', 2047);
      const before: FileProbe = await probeFile('UserScenarios408_before', 'cache', content, 'truncate');
      expect(before.bytes).assertEqual(byteLength(content));
      const actual: IndexProbe = await probeIndex(0, [], true);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.count).assertEqual(1);
      expect(actual.final).assertEqual(actual.initial);
      const restored: common.ApplicationContext = requireContext();
      expect(restored.filesDir).assertEqual(originalFiles);
      expect(restored.cacheDir).assertEqual(originalCache);
      const after: FileProbe = await probeFile('UserScenarios408_after', 'cache', content, 'truncate');
      expect(after.text).assertEqual(before.text);
      expect(after.size).assertEqual(before.size);
      expect(after.existsAfter).assertFalse();
    });
  });
}
