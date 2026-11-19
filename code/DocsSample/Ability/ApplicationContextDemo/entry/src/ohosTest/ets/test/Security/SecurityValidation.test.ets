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

export default function securityValidationTest(): void {
  describe('SecurityValidation', () => {
    beforeAll((): void => {
      expect(requireContext().applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    afterAll((): void => {
      hilog.info(0xF811, 'ContextTests', 'SecurityValidation completed');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_SECURITYVALIDATION_0001
     * @tc.name SecurityValidation_001
     * @tc.desc Verify files append, UTF8 seed é, repeated 1024 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('SecurityValidation_001', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('é', 1024);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('SecurityValidation776', 'files', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_SECURITYVALIDATION_0002
     * @tc.name SecurityValidation_002
     * @tc.desc Verify cache append, UTF8 seed a, repeated 127 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('SecurityValidation_002', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('a', 127);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('SecurityValidation777', 'cache', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_SECURITYVALIDATION_0003
     * @tc.name SecurityValidation_003
     * @tc.desc Verify cache append, UTF8 seed 中, repeated 8 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('SecurityValidation_003', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('中', 8);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('SecurityValidation778', 'cache', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_SECURITYVALIDATION_0004
     * @tc.name SecurityValidation_004
     * @tc.desc Verify cache append, UTF8 seed 😀, repeated 4096 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('SecurityValidation_004', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('😀', 4096);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('SecurityValidation779', 'cache', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_SECURITYVALIDATION_0005
     * @tc.name SecurityValidation_005
     * @tc.desc Verify cache append, UTF8 seed space , repeated 511 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('SecurityValidation_005', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('space ', 511);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('SecurityValidation780', 'cache', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_SECURITYVALIDATION_0006
     * @tc.name SecurityValidation_006
     * @tc.desc Verify cache append, UTF8 seed 0123456789, repeated 32 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('SecurityValidation_006', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('0123456789', 32);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('SecurityValidation781', 'cache', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_SECURITYVALIDATION_0007
     * @tc.name SecurityValidation_007
     * @tc.desc Verify files create, UTF8 seed Z9, repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('SecurityValidation_007', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('Z9', 1);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('SecurityValidation782', 'files', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_SECURITYVALIDATION_0008
     * @tc.name SecurityValidation_008
     * @tc.desc Verify files create, UTF8 seed 中, repeated 2047 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('SecurityValidation_008', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('中', 2047);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('SecurityValidation783', 'files', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_SECURITYVALIDATION_0009
     * @tc.name SecurityValidation_009
     * @tc.desc Verify files create, UTF8 seed \n, repeated 128 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('SecurityValidation_009', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('\n', 128);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('SecurityValidation784', 'files', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_SECURITYVALIDATION_0010
     * @tc.name SecurityValidation_010
     * @tc.desc Verify files create, UTF8 seed é, repeated 15 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('SecurityValidation_010', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('é', 15);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('SecurityValidation785', 'files', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_SECURITYVALIDATION_0011
     * @tc.name SecurityValidation_011
     * @tc.desc Verify files create, UTF8 seed 0123456789, repeated 8191 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('SecurityValidation_011', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('0123456789', 8191);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('SecurityValidation786', 'files', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_SECURITYVALIDATION_0012
     * @tc.name SecurityValidation_012
     * @tc.desc Verify cache create, UTF8 seed Z9, repeated 512 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('SecurityValidation_012', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('Z9', 512);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('SecurityValidation787', 'cache', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_SECURITYVALIDATION_0013
     * @tc.name SecurityValidation_013
     * @tc.desc Verify cache create, UTF8 seed 😀, repeated 63 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('SecurityValidation_013', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('😀', 63);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('SecurityValidation788', 'cache', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_SECURITYVALIDATION_0014
     * @tc.name SecurityValidation_014
     * @tc.desc Verify cache create, UTF8 seed space , repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('SecurityValidation_014', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('space ', 2);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('SecurityValidation789', 'cache', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_SECURITYVALIDATION_0015
     * @tc.name SecurityValidation_015
     * @tc.desc Verify cache create, UTF8 seed é, repeated 2048 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('SecurityValidation_015', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('é', 2048);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('SecurityValidation790', 'cache', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_SECURITYVALIDATION_0016
     * @tc.name SecurityValidation_016
     * @tc.desc Verify files truncate, UTF8 seed a, repeated 255 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('SecurityValidation_016', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('a', 255);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('SecurityValidation791', 'files', content, 'truncate');
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
     * @tc.number SUB_APPLICATIONCONTEXT_SECURITYVALIDATION_0017
     * @tc.name SecurityValidation_017
     * @tc.desc Verify files truncate, UTF8 seed 中, repeated 16 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('SecurityValidation_017', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('中', 16);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('SecurityValidation792', 'files', content, 'truncate');
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
     * @tc.number SUB_APPLICATIONCONTEXT_SECURITYVALIDATION_0018
     * @tc.name SecurityValidation_018
     * @tc.desc Verify files truncate, UTF8 seed 😀, repeated 8192 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('SecurityValidation_018', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('😀', 8192);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('SecurityValidation793', 'files', content, 'truncate');
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
     * @tc.number SUB_APPLICATIONCONTEXT_SECURITYVALIDATION_0019
     * @tc.name SecurityValidation_019
     * @tc.desc Verify files truncate, UTF8 seed space , repeated 1023 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('SecurityValidation_019', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('space ', 1023);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('SecurityValidation794', 'files', content, 'truncate');
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
     * @tc.number SUB_APPLICATIONCONTEXT_SECURITYVALIDATION_0020
     * @tc.name SecurityValidation_020
     * @tc.desc Verify files truncate, UTF8 seed 0123456789, repeated 64 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('SecurityValidation_020', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('0123456789', 64);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('SecurityValidation795', 'files', content, 'truncate');
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
     * @tc.number SUB_APPLICATIONCONTEXT_SECURITYVALIDATION_0021
     * @tc.name SecurityValidation_021
     * @tc.desc Verify cache truncate, UTF8 seed Z9, repeated 7 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('SecurityValidation_021', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('Z9', 7);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('SecurityValidation796', 'cache', content, 'truncate');
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
     * @tc.number SUB_APPLICATIONCONTEXT_SECURITYVALIDATION_0022
     * @tc.name SecurityValidation_022
     * @tc.desc Verify cache truncate, UTF8 seed 中, repeated 4095 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('SecurityValidation_022', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('中', 4095);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('SecurityValidation797', 'cache', content, 'truncate');
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
     * @tc.number SUB_APPLICATIONCONTEXT_SECURITYVALIDATION_0023
     * @tc.name SecurityValidation_023
     * @tc.desc Verify cache truncate, UTF8 seed \n, repeated 256 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('SecurityValidation_023', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('\n', 256);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('SecurityValidation798', 'cache', content, 'truncate');
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
     * @tc.number SUB_APPLICATIONCONTEXT_SECURITYVALIDATION_0024
     * @tc.name SecurityValidation_024
     * @tc.desc Verify cache truncate, UTF8 seed é, repeated 31 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('SecurityValidation_024', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('é', 31);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('SecurityValidation799', 'cache', content, 'truncate');
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
