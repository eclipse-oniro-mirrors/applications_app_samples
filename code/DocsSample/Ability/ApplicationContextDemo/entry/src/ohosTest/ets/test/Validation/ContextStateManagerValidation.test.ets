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

export default function contextStateManagerValidationTest(): void {
  describe('ContextStateManagerValidation', () => {
    beforeAll((): void => {
      expect(requireContext().applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    afterAll((): void => {
      hilog.info(0xF811, 'ContextTests', 'ContextStateManagerValidation completed');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSTATEMANAGERVALIDATION_0001
     * @tc.name ContextStateManagerValidation_001
     * @tc.desc Verify files append, UTF8 seed 中, repeated 127 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextStateManagerValidation_001', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('中', 127);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextStateManagerValidation327', 'files', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSTATEMANAGERVALIDATION_0002
     * @tc.name ContextStateManagerValidation_002
     * @tc.desc Verify files append, UTF8 seed \n, repeated 8 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextStateManagerValidation_002', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('\n', 8);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextStateManagerValidation328', 'files', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSTATEMANAGERVALIDATION_0003
     * @tc.name ContextStateManagerValidation_003
     * @tc.desc Verify files append, UTF8 seed space , repeated 4096 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextStateManagerValidation_003', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('space ', 4096);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextStateManagerValidation329', 'files', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSTATEMANAGERVALIDATION_0004
     * @tc.name ContextStateManagerValidation_004
     * @tc.desc Verify files append, UTF8 seed 0123456789, repeated 511 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextStateManagerValidation_004', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('0123456789', 511);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextStateManagerValidation330', 'files', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSTATEMANAGERVALIDATION_0005
     * @tc.name ContextStateManagerValidation_005
     * @tc.desc Verify cache append, UTF8 seed Z9, repeated 32 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextStateManagerValidation_005', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('Z9', 32);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextStateManagerValidation331', 'cache', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSTATEMANAGERVALIDATION_0006
     * @tc.name ContextStateManagerValidation_006
     * @tc.desc Verify cache append, UTF8 seed 😀, repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextStateManagerValidation_006', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('😀', 1);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextStateManagerValidation332', 'cache', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSTATEMANAGERVALIDATION_0007
     * @tc.name ContextStateManagerValidation_007
     * @tc.desc Verify cache append, UTF8 seed \n, repeated 2047 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextStateManagerValidation_007', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('\n', 2047);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextStateManagerValidation333', 'cache', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSTATEMANAGERVALIDATION_0008
     * @tc.name ContextStateManagerValidation_008
     * @tc.desc Verify cache append, UTF8 seed é, repeated 128 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextStateManagerValidation_008', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('é', 128);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextStateManagerValidation334', 'cache', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSTATEMANAGERVALIDATION_0009
     * @tc.name ContextStateManagerValidation_009
     * @tc.desc Verify files create, UTF8 seed a, repeated 15 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextStateManagerValidation_009', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('a', 15);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextStateManagerValidation335', 'files', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSTATEMANAGERVALIDATION_0010
     * @tc.name ContextStateManagerValidation_010
     * @tc.desc Verify files create, UTF8 seed Z9, repeated 8191 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextStateManagerValidation_010', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('Z9', 8191);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextStateManagerValidation336', 'files', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSTATEMANAGERVALIDATION_0011
     * @tc.name ContextStateManagerValidation_011
     * @tc.desc Verify files create, UTF8 seed 😀, repeated 512 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextStateManagerValidation_011', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('😀', 512);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextStateManagerValidation337', 'files', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSTATEMANAGERVALIDATION_0012
     * @tc.name ContextStateManagerValidation_012
     * @tc.desc Verify files create, UTF8 seed space , repeated 63 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextStateManagerValidation_012', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('space ', 63);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextStateManagerValidation338', 'files', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSTATEMANAGERVALIDATION_0013
     * @tc.name ContextStateManagerValidation_013
     * @tc.desc Verify files create, UTF8 seed 0123456789, repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextStateManagerValidation_013', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('0123456789', 2);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextStateManagerValidation339', 'files', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSTATEMANAGERVALIDATION_0014
     * @tc.name ContextStateManagerValidation_014
     * @tc.desc Verify cache create, UTF8 seed a, repeated 2048 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextStateManagerValidation_014', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('a', 2048);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextStateManagerValidation340', 'cache', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSTATEMANAGERVALIDATION_0015
     * @tc.name ContextStateManagerValidation_015
     * @tc.desc Verify cache create, UTF8 seed 中, repeated 255 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextStateManagerValidation_015', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('中', 255);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextStateManagerValidation341', 'cache', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSTATEMANAGERVALIDATION_0016
     * @tc.name ContextStateManagerValidation_016
     * @tc.desc Verify cache create, UTF8 seed \n, repeated 16 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextStateManagerValidation_016', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('\n', 16);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextStateManagerValidation342', 'cache', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSTATEMANAGERVALIDATION_0017
     * @tc.name ContextStateManagerValidation_017
     * @tc.desc Verify cache create, UTF8 seed space , repeated 8192 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextStateManagerValidation_017', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('space ', 8192);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextStateManagerValidation343', 'cache', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSTATEMANAGERVALIDATION_0018
     * @tc.name ContextStateManagerValidation_018
     * @tc.desc Verify cache create, UTF8 seed 0123456789, repeated 1023 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextStateManagerValidation_018', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('0123456789', 1023);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextStateManagerValidation344', 'cache', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSTATEMANAGERVALIDATION_0019
     * @tc.name ContextStateManagerValidation_019
     * @tc.desc Verify files truncate, UTF8 seed Z9, repeated 64 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextStateManagerValidation_019', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('Z9', 64);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextStateManagerValidation345', 'files', content, 'truncate');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSTATEMANAGERVALIDATION_0020
     * @tc.name ContextStateManagerValidation_020
     * @tc.desc Verify files truncate, UTF8 seed 😀, repeated 7 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextStateManagerValidation_020', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('😀', 7);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextStateManagerValidation346', 'files', content, 'truncate');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSTATEMANAGERVALIDATION_0021
     * @tc.name ContextStateManagerValidation_021
     * @tc.desc Verify files truncate, UTF8 seed \n, repeated 4095 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextStateManagerValidation_021', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('\n', 4095);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextStateManagerValidation347', 'files', content, 'truncate');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSTATEMANAGERVALIDATION_0022
     * @tc.name ContextStateManagerValidation_022
     * @tc.desc Verify files truncate, UTF8 seed é, repeated 256 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextStateManagerValidation_022', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('é', 256);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextStateManagerValidation348', 'files', content, 'truncate');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSTATEMANAGERVALIDATION_0023
     * @tc.name ContextStateManagerValidation_023
     * @tc.desc Verify cache truncate, UTF8 seed a, repeated 31 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextStateManagerValidation_023', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('a', 31);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextStateManagerValidation349', 'cache', content, 'truncate');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSTATEMANAGERVALIDATION_0024
     * @tc.name ContextStateManagerValidation_024
     * @tc.desc Verify cache truncate, UTF8 seed 😀, repeated 1024 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextStateManagerValidation_024', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('😀', 1024);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextStateManagerValidation351', 'cache', content, 'truncate');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTSTATEMANAGERVALIDATION_0025
     * @tc.name ContextStateManagerValidation_025
     * @tc.desc Verify cache truncate, UTF8 seed space , repeated 127 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextStateManagerValidation_025', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('space ', 127);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextStateManagerValidation352', 'cache', content, 'truncate');
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
  });
}
