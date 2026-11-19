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

export default function contextSecurityTest(): void {
  describe('ContextSecurity', () => {
    beforeAll((): void => {
      expect(requireContext().applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    afterAll((): void => {
      hilog.info(0xF811, 'ContextTests', 'ContextSecurity completed');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSECURITY_0001
     * @tc.name ContextSecurity_001
     * @tc.desc Verify files append, UTF8 seed é, repeated 64 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextSecurity_001', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('é', 64);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextSecurity720', 'files', content, 'append');
      expect(actual.text).assertEqual(expected);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.size).assertEqual(byteLength(expected));
      expect(actual.existsBefore).assertFalse();
      expect(actual.existsAfter).assertFalse();
      expect(actual.removed).assertTrue();
      expect(actual.directory).assertEqual(context.filesDir);
      expect(actual.mode).assertEqual('append');
      expect(context.filesDir).assertEqual(original);
      expect(Date.now() >= started).assertTrue();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSECURITY_0002
     * @tc.name ContextSecurity_002
     * @tc.desc Verify cache append, UTF8 seed a, repeated 7 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextSecurity_002', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('a', 7);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextSecurity721', 'cache', content, 'append');
      expect(actual.text).assertEqual(expected);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.size).assertEqual(byteLength(expected));
      expect(actual.existsBefore).assertFalse();
      expect(actual.existsAfter).assertFalse();
      expect(actual.removed).assertTrue();
      expect(actual.directory).assertEqual(context.cacheDir);
      expect(actual.mode).assertEqual('append');
      expect(context.filesDir).assertEqual(original);
      expect(Date.now() >= started).assertTrue();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSECURITY_0003
     * @tc.name ContextSecurity_003
     * @tc.desc Verify cache append, UTF8 seed Z9, repeated 4095 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextSecurity_003', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('Z9', 4095);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextSecurity722', 'cache', content, 'append');
      expect(actual.text).assertEqual(expected);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.size).assertEqual(byteLength(expected));
      expect(actual.existsBefore).assertFalse();
      expect(actual.existsAfter).assertFalse();
      expect(actual.removed).assertTrue();
      expect(actual.directory).assertEqual(context.cacheDir);
      expect(actual.mode).assertEqual('append');
      expect(context.filesDir).assertEqual(original);
      expect(Date.now() >= started).assertTrue();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSECURITY_0004
     * @tc.name ContextSecurity_004
     * @tc.desc Verify cache append, UTF8 seed 😀, repeated 256 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextSecurity_004', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('😀', 256);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextSecurity723', 'cache', content, 'append');
      expect(actual.text).assertEqual(expected);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.size).assertEqual(byteLength(expected));
      expect(actual.existsBefore).assertFalse();
      expect(actual.existsAfter).assertFalse();
      expect(actual.removed).assertTrue();
      expect(actual.directory).assertEqual(context.cacheDir);
      expect(actual.mode).assertEqual('append');
      expect(context.filesDir).assertEqual(original);
      expect(Date.now() >= started).assertTrue();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSECURITY_0005
     * @tc.name ContextSecurity_005
     * @tc.desc Verify cache append, UTF8 seed space , repeated 31 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextSecurity_005', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('space ', 31);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextSecurity724', 'cache', content, 'append');
      expect(actual.text).assertEqual(expected);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.size).assertEqual(byteLength(expected));
      expect(actual.existsBefore).assertFalse();
      expect(actual.existsAfter).assertFalse();
      expect(actual.removed).assertTrue();
      expect(actual.directory).assertEqual(context.cacheDir);
      expect(actual.mode).assertEqual('append');
      expect(context.filesDir).assertEqual(original);
      expect(Date.now() >= started).assertTrue();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSECURITY_0006
     * @tc.name ContextSecurity_006
     * @tc.desc Verify files create, UTF8 seed a, repeated 1024 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextSecurity_006', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('a', 1024);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextSecurity726', 'files', content, 'create');
      expect(actual.text).assertEqual(expected);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.size).assertEqual(byteLength(expected));
      expect(actual.existsBefore).assertFalse();
      expect(actual.existsAfter).assertFalse();
      expect(actual.removed).assertTrue();
      expect(actual.directory).assertEqual(context.filesDir);
      expect(actual.mode).assertEqual('create');
      expect(context.filesDir).assertEqual(original);
      expect(Date.now() >= started).assertTrue();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSECURITY_0007
     * @tc.name ContextSecurity_007
     * @tc.desc Verify files create, UTF8 seed 中, repeated 127 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextSecurity_007', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('中', 127);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextSecurity727', 'files', content, 'create');
      expect(actual.text).assertEqual(expected);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.size).assertEqual(byteLength(expected));
      expect(actual.existsBefore).assertFalse();
      expect(actual.existsAfter).assertFalse();
      expect(actual.removed).assertTrue();
      expect(actual.directory).assertEqual(context.filesDir);
      expect(actual.mode).assertEqual('create');
      expect(context.filesDir).assertEqual(original);
      expect(Date.now() >= started).assertTrue();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSECURITY_0008
     * @tc.name ContextSecurity_008
     * @tc.desc Verify files create, UTF8 seed \n, repeated 8 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextSecurity_008', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('\n', 8);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextSecurity728', 'files', content, 'create');
      expect(actual.text).assertEqual(expected);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.size).assertEqual(byteLength(expected));
      expect(actual.existsBefore).assertFalse();
      expect(actual.existsAfter).assertFalse();
      expect(actual.removed).assertTrue();
      expect(actual.directory).assertEqual(context.filesDir);
      expect(actual.mode).assertEqual('create');
      expect(context.filesDir).assertEqual(original);
      expect(Date.now() >= started).assertTrue();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSECURITY_0009
     * @tc.name ContextSecurity_009
     * @tc.desc Verify files create, UTF8 seed space , repeated 4096 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextSecurity_009', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('space ', 4096);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextSecurity729', 'files', content, 'create');
      expect(actual.text).assertEqual(expected);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.size).assertEqual(byteLength(expected));
      expect(actual.existsBefore).assertFalse();
      expect(actual.existsAfter).assertFalse();
      expect(actual.removed).assertTrue();
      expect(actual.directory).assertEqual(context.filesDir);
      expect(actual.mode).assertEqual('create');
      expect(context.filesDir).assertEqual(original);
      expect(Date.now() >= started).assertTrue();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSECURITY_0010
     * @tc.name ContextSecurity_010
     * @tc.desc Verify files create, UTF8 seed 0123456789, repeated 511 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextSecurity_010', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('0123456789', 511);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextSecurity730', 'files', content, 'create');
      expect(actual.text).assertEqual(expected);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.size).assertEqual(byteLength(expected));
      expect(actual.existsBefore).assertFalse();
      expect(actual.existsAfter).assertFalse();
      expect(actual.removed).assertTrue();
      expect(actual.directory).assertEqual(context.filesDir);
      expect(actual.mode).assertEqual('create');
      expect(context.filesDir).assertEqual(original);
      expect(Date.now() >= started).assertTrue();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSECURITY_0011
     * @tc.name ContextSecurity_011
     * @tc.desc Verify cache create, UTF8 seed Z9, repeated 32 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextSecurity_011', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('Z9', 32);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextSecurity731', 'cache', content, 'create');
      expect(actual.text).assertEqual(expected);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.size).assertEqual(byteLength(expected));
      expect(actual.existsBefore).assertFalse();
      expect(actual.existsAfter).assertFalse();
      expect(actual.removed).assertTrue();
      expect(actual.directory).assertEqual(context.cacheDir);
      expect(actual.mode).assertEqual('create');
      expect(context.filesDir).assertEqual(original);
      expect(Date.now() >= started).assertTrue();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSECURITY_0012
     * @tc.name ContextSecurity_012
     * @tc.desc Verify cache create, UTF8 seed 😀, repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextSecurity_012', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('😀', 1);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextSecurity732', 'cache', content, 'create');
      expect(actual.text).assertEqual(expected);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.size).assertEqual(byteLength(expected));
      expect(actual.existsBefore).assertFalse();
      expect(actual.existsAfter).assertFalse();
      expect(actual.removed).assertTrue();
      expect(actual.directory).assertEqual(context.cacheDir);
      expect(actual.mode).assertEqual('create');
      expect(context.filesDir).assertEqual(original);
      expect(Date.now() >= started).assertTrue();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSECURITY_0013
     * @tc.name ContextSecurity_013
     * @tc.desc Verify cache create, UTF8 seed \n, repeated 2047 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextSecurity_013', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('\n', 2047);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextSecurity733', 'cache', content, 'create');
      expect(actual.text).assertEqual(expected);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.size).assertEqual(byteLength(expected));
      expect(actual.existsBefore).assertFalse();
      expect(actual.existsAfter).assertFalse();
      expect(actual.removed).assertTrue();
      expect(actual.directory).assertEqual(context.cacheDir);
      expect(actual.mode).assertEqual('create');
      expect(context.filesDir).assertEqual(original);
      expect(Date.now() >= started).assertTrue();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSECURITY_0014
     * @tc.name ContextSecurity_014
     * @tc.desc Verify cache create, UTF8 seed é, repeated 128 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextSecurity_014', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('é', 128);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextSecurity734', 'cache', content, 'create');
      expect(actual.text).assertEqual(expected);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.size).assertEqual(byteLength(expected));
      expect(actual.existsBefore).assertFalse();
      expect(actual.existsAfter).assertFalse();
      expect(actual.removed).assertTrue();
      expect(actual.directory).assertEqual(context.cacheDir);
      expect(actual.mode).assertEqual('create');
      expect(context.filesDir).assertEqual(original);
      expect(Date.now() >= started).assertTrue();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSECURITY_0015
     * @tc.name ContextSecurity_015
     * @tc.desc Verify files truncate, UTF8 seed a, repeated 15 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextSecurity_015', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('a', 15);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextSecurity735', 'files', content, 'truncate');
      expect(actual.text).assertEqual(expected);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.size).assertEqual(byteLength(expected));
      expect(actual.existsBefore).assertFalse();
      expect(actual.existsAfter).assertFalse();
      expect(actual.removed).assertTrue();
      expect(actual.directory).assertEqual(context.filesDir);
      expect(actual.mode).assertEqual('truncate');
      expect(context.filesDir).assertEqual(original);
      expect(Date.now() >= started).assertTrue();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSECURITY_0016
     * @tc.name ContextSecurity_016
     * @tc.desc Verify files truncate, UTF8 seed Z9, repeated 8191 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextSecurity_016', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('Z9', 8191);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextSecurity736', 'files', content, 'truncate');
      expect(actual.text).assertEqual(expected);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.size).assertEqual(byteLength(expected));
      expect(actual.existsBefore).assertFalse();
      expect(actual.existsAfter).assertFalse();
      expect(actual.removed).assertTrue();
      expect(actual.directory).assertEqual(context.filesDir);
      expect(actual.mode).assertEqual('truncate');
      expect(context.filesDir).assertEqual(original);
      expect(Date.now() >= started).assertTrue();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSECURITY_0017
     * @tc.name ContextSecurity_017
     * @tc.desc Verify files truncate, UTF8 seed 😀, repeated 512 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextSecurity_017', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('😀', 512);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextSecurity737', 'files', content, 'truncate');
      expect(actual.text).assertEqual(expected);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.size).assertEqual(byteLength(expected));
      expect(actual.existsBefore).assertFalse();
      expect(actual.existsAfter).assertFalse();
      expect(actual.removed).assertTrue();
      expect(actual.directory).assertEqual(context.filesDir);
      expect(actual.mode).assertEqual('truncate');
      expect(context.filesDir).assertEqual(original);
      expect(Date.now() >= started).assertTrue();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSECURITY_0018
     * @tc.name ContextSecurity_018
     * @tc.desc Verify files truncate, UTF8 seed space , repeated 63 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextSecurity_018', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('space ', 63);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextSecurity738', 'files', content, 'truncate');
      expect(actual.text).assertEqual(expected);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.size).assertEqual(byteLength(expected));
      expect(actual.existsBefore).assertFalse();
      expect(actual.existsAfter).assertFalse();
      expect(actual.removed).assertTrue();
      expect(actual.directory).assertEqual(context.filesDir);
      expect(actual.mode).assertEqual('truncate');
      expect(context.filesDir).assertEqual(original);
      expect(Date.now() >= started).assertTrue();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSECURITY_0019
     * @tc.name ContextSecurity_019
     * @tc.desc Verify files truncate, UTF8 seed 0123456789, repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextSecurity_019', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('0123456789', 2);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextSecurity739', 'files', content, 'truncate');
      expect(actual.text).assertEqual(expected);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.size).assertEqual(byteLength(expected));
      expect(actual.existsBefore).assertFalse();
      expect(actual.existsAfter).assertFalse();
      expect(actual.removed).assertTrue();
      expect(actual.directory).assertEqual(context.filesDir);
      expect(actual.mode).assertEqual('truncate');
      expect(context.filesDir).assertEqual(original);
      expect(Date.now() >= started).assertTrue();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSECURITY_0020
     * @tc.name ContextSecurity_020
     * @tc.desc Verify cache truncate, UTF8 seed a, repeated 2048 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextSecurity_020', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('a', 2048);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextSecurity740', 'cache', content, 'truncate');
      expect(actual.text).assertEqual(expected);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.size).assertEqual(byteLength(expected));
      expect(actual.existsBefore).assertFalse();
      expect(actual.existsAfter).assertFalse();
      expect(actual.removed).assertTrue();
      expect(actual.directory).assertEqual(context.cacheDir);
      expect(actual.mode).assertEqual('truncate');
      expect(context.filesDir).assertEqual(original);
      expect(Date.now() >= started).assertTrue();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSECURITY_0021
     * @tc.name ContextSecurity_021
     * @tc.desc Verify cache truncate, UTF8 seed 中, repeated 255 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextSecurity_021', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('中', 255);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextSecurity741', 'cache', content, 'truncate');
      expect(actual.text).assertEqual(expected);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.size).assertEqual(byteLength(expected));
      expect(actual.existsBefore).assertFalse();
      expect(actual.existsAfter).assertFalse();
      expect(actual.removed).assertTrue();
      expect(actual.directory).assertEqual(context.cacheDir);
      expect(actual.mode).assertEqual('truncate');
      expect(context.filesDir).assertEqual(original);
      expect(Date.now() >= started).assertTrue();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSECURITY_0022
     * @tc.name ContextSecurity_022
     * @tc.desc Verify cache truncate, UTF8 seed \n, repeated 16 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextSecurity_022', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('\n', 16);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextSecurity742', 'cache', content, 'truncate');
      expect(actual.text).assertEqual(expected);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.size).assertEqual(byteLength(expected));
      expect(actual.existsBefore).assertFalse();
      expect(actual.existsAfter).assertFalse();
      expect(actual.removed).assertTrue();
      expect(actual.directory).assertEqual(context.cacheDir);
      expect(actual.mode).assertEqual('truncate');
      expect(context.filesDir).assertEqual(original);
      expect(Date.now() >= started).assertTrue();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSECURITY_0023
     * @tc.name ContextSecurity_023
     * @tc.desc Verify cache truncate, UTF8 seed space , repeated 8192 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextSecurity_023', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('space ', 8192);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextSecurity743', 'cache', content, 'truncate');
      expect(actual.text).assertEqual(expected);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.size).assertEqual(byteLength(expected));
      expect(actual.existsBefore).assertFalse();
      expect(actual.existsAfter).assertFalse();
      expect(actual.removed).assertTrue();
      expect(actual.directory).assertEqual(context.cacheDir);
      expect(actual.mode).assertEqual('truncate');
      expect(context.filesDir).assertEqual(original);
      expect(Date.now() >= started).assertTrue();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSECURITY_0024
     * @tc.name ContextSecurity_024
     * @tc.desc Verify cache truncate, UTF8 seed 0123456789, repeated 1023 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextSecurity_024', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('0123456789', 1023);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextSecurity744', 'cache', content, 'truncate');
      expect(actual.text).assertEqual(expected);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.size).assertEqual(byteLength(expected));
      expect(actual.existsBefore).assertFalse();
      expect(actual.existsAfter).assertFalse();
      expect(actual.removed).assertTrue();
      expect(actual.directory).assertEqual(context.cacheDir);
      expect(actual.mode).assertEqual('truncate');
      expect(context.filesDir).assertEqual(original);
      expect(Date.now() >= started).assertTrue();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSECURITY_0025
     * @tc.name ContextSecurity_025
     * @tc.desc Verify files append, UTF8 seed Z9, repeated 64 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextSecurity_025', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('Z9', 64);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextSecurity745', 'files', content, 'append');
      expect(actual.text).assertEqual(expected);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.size).assertEqual(byteLength(expected));
      expect(actual.existsBefore).assertFalse();
      expect(actual.existsAfter).assertFalse();
      expect(actual.removed).assertTrue();
      expect(actual.directory).assertEqual(context.filesDir);
      expect(actual.mode).assertEqual('append');
      expect(context.filesDir).assertEqual(original);
      expect(Date.now() >= started).assertTrue();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSECURITY_0026
     * @tc.name ContextSecurity_026
     * @tc.desc Verify files append, UTF8 seed 😀, repeated 7 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextSecurity_026', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('😀', 7);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextSecurity746', 'files', content, 'append');
      expect(actual.text).assertEqual(expected);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.size).assertEqual(byteLength(expected));
      expect(actual.existsBefore).assertFalse();
      expect(actual.existsAfter).assertFalse();
      expect(actual.removed).assertTrue();
      expect(actual.directory).assertEqual(context.filesDir);
      expect(actual.mode).assertEqual('append');
      expect(context.filesDir).assertEqual(original);
      expect(Date.now() >= started).assertTrue();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSECURITY_0027
     * @tc.name ContextSecurity_027
     * @tc.desc Verify files append, UTF8 seed \n, repeated 4095 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextSecurity_027', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('\n', 4095);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextSecurity747', 'files', content, 'append');
      expect(actual.text).assertEqual(expected);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.size).assertEqual(byteLength(expected));
      expect(actual.existsBefore).assertFalse();
      expect(actual.existsAfter).assertFalse();
      expect(actual.removed).assertTrue();
      expect(actual.directory).assertEqual(context.filesDir);
      expect(actual.mode).assertEqual('append');
      expect(context.filesDir).assertEqual(original);
      expect(Date.now() >= started).assertTrue();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSECURITY_0028
     * @tc.name ContextSecurity_028
     * @tc.desc Verify files append, UTF8 seed é, repeated 256 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextSecurity_028', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('é', 256);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextSecurity748', 'files', content, 'append');
      expect(actual.text).assertEqual(expected);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.size).assertEqual(byteLength(expected));
      expect(actual.existsBefore).assertFalse();
      expect(actual.existsAfter).assertFalse();
      expect(actual.removed).assertTrue();
      expect(actual.directory).assertEqual(context.filesDir);
      expect(actual.mode).assertEqual('append');
      expect(context.filesDir).assertEqual(original);
      expect(Date.now() >= started).assertTrue();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSECURITY_0029
     * @tc.name ContextSecurity_029
     * @tc.desc Verify cache append, UTF8 seed a, repeated 31 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextSecurity_029', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('a', 31);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextSecurity749', 'cache', content, 'append');
      expect(actual.text).assertEqual(expected);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.size).assertEqual(byteLength(expected));
      expect(actual.existsBefore).assertFalse();
      expect(actual.existsAfter).assertFalse();
      expect(actual.removed).assertTrue();
      expect(actual.directory).assertEqual(context.cacheDir);
      expect(actual.mode).assertEqual('append');
      expect(context.filesDir).assertEqual(original);
      expect(Date.now() >= started).assertTrue();
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSECURITY_0030
     * @tc.name ContextSecurity_030
     * @tc.desc Verify cache append, UTF8 seed 😀, repeated 1024 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextSecurity_030', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('😀', 1024);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextSecurity751', 'cache', content, 'append');
      expect(actual.text).assertEqual(expected);
      expect(actual.bytes).assertEqual(byteLength(content));
      expect(actual.size).assertEqual(byteLength(expected));
      expect(actual.existsBefore).assertFalse();
      expect(actual.existsAfter).assertFalse();
      expect(actual.removed).assertTrue();
      expect(actual.directory).assertEqual(context.cacheDir);
      expect(actual.mode).assertEqual('append');
      expect(context.filesDir).assertEqual(original);
      expect(Date.now() >= started).assertTrue();
    });
  });
}
