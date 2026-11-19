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

export default function comprehensiveRegressionTest(): void {
  describe('ComprehensiveRegression', () => {
    beforeAll((): void => {
      expect(requireContext().applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    afterAll((): void => {
      hilog.info(0xF811, 'ContextTests', 'ComprehensiveRegression completed');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMPREHENSIVEREGRESSION_0001
     * @tc.name ComprehensiveRegression_001
     * @tc.desc Verify files append, UTF8 seed 😀, repeated 16 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ComprehensiveRegression_001', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('😀', 16);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ComprehensiveRegression467', 'files', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_COMPREHENSIVEREGRESSION_0002
     * @tc.name ComprehensiveRegression_002
     * @tc.desc Verify files append, UTF8 seed \n, repeated 8192 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ComprehensiveRegression_002', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('\n', 8192);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ComprehensiveRegression468', 'files', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_COMPREHENSIVEREGRESSION_0003
     * @tc.name ComprehensiveRegression_003
     * @tc.desc Verify files append, UTF8 seed é, repeated 1023 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ComprehensiveRegression_003', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('é', 1023);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ComprehensiveRegression469', 'files', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_COMPREHENSIVEREGRESSION_0004
     * @tc.name ComprehensiveRegression_004
     * @tc.desc Verify cache append, UTF8 seed a, repeated 64 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ComprehensiveRegression_004', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('a', 64);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ComprehensiveRegression470', 'cache', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_COMPREHENSIVEREGRESSION_0005
     * @tc.name ComprehensiveRegression_005
     * @tc.desc Verify cache append, UTF8 seed 中, repeated 7 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ComprehensiveRegression_005', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('中', 7);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ComprehensiveRegression471', 'cache', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_COMPREHENSIVEREGRESSION_0006
     * @tc.name ComprehensiveRegression_006
     * @tc.desc Verify cache append, UTF8 seed 😀, repeated 4095 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ComprehensiveRegression_006', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('😀', 4095);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ComprehensiveRegression472', 'cache', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_COMPREHENSIVEREGRESSION_0007
     * @tc.name ComprehensiveRegression_007
     * @tc.desc Verify cache append, UTF8 seed space , repeated 256 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ComprehensiveRegression_007', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('space ', 256);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ComprehensiveRegression473', 'cache', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_COMPREHENSIVEREGRESSION_0008
     * @tc.name ComprehensiveRegression_008
     * @tc.desc Verify cache append, UTF8 seed 0123456789, repeated 31 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ComprehensiveRegression_008', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('0123456789', 31);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ComprehensiveRegression474', 'cache', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_COMPREHENSIVEREGRESSION_0009
     * @tc.name ComprehensiveRegression_009
     * @tc.desc Verify files create, UTF8 seed 中, repeated 1024 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ComprehensiveRegression_009', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('中', 1024);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ComprehensiveRegression476', 'files', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_COMPREHENSIVEREGRESSION_0010
     * @tc.name ComprehensiveRegression_010
     * @tc.desc Verify files create, UTF8 seed \n, repeated 127 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ComprehensiveRegression_010', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('\n', 127);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ComprehensiveRegression477', 'files', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_COMPREHENSIVEREGRESSION_0011
     * @tc.name ComprehensiveRegression_011
     * @tc.desc Verify files create, UTF8 seed é, repeated 8 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ComprehensiveRegression_011', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('é', 8);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ComprehensiveRegression478', 'files', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_COMPREHENSIVEREGRESSION_0012
     * @tc.name ComprehensiveRegression_012
     * @tc.desc Verify files create, UTF8 seed 0123456789, repeated 4096 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ComprehensiveRegression_012', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('0123456789', 4096);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ComprehensiveRegression479', 'files', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_COMPREHENSIVEREGRESSION_0013
     * @tc.name ComprehensiveRegression_013
     * @tc.desc Verify cache create, UTF8 seed Z9, repeated 511 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ComprehensiveRegression_013', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('Z9', 511);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ComprehensiveRegression480', 'cache', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_COMPREHENSIVEREGRESSION_0014
     * @tc.name ComprehensiveRegression_014
     * @tc.desc Verify cache create, UTF8 seed 😀, repeated 32 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ComprehensiveRegression_014', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('😀', 32);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ComprehensiveRegression481', 'cache', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_COMPREHENSIVEREGRESSION_0015
     * @tc.name ComprehensiveRegression_015
     * @tc.desc Verify cache create, UTF8 seed space , repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ComprehensiveRegression_015', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('space ', 1);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ComprehensiveRegression482', 'cache', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_COMPREHENSIVEREGRESSION_0016
     * @tc.name ComprehensiveRegression_016
     * @tc.desc Verify cache create, UTF8 seed é, repeated 2047 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ComprehensiveRegression_016', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('é', 2047);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ComprehensiveRegression483', 'cache', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_COMPREHENSIVEREGRESSION_0017
     * @tc.name ComprehensiveRegression_017
     * @tc.desc Verify files truncate, UTF8 seed a, repeated 128 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ComprehensiveRegression_017', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('a', 128);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ComprehensiveRegression484', 'files', content, 'truncate');
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
     * @tc.number SUB_APPLICATIONCONTEXT_COMPREHENSIVEREGRESSION_0018
     * @tc.name ComprehensiveRegression_018
     * @tc.desc Verify files truncate, UTF8 seed 中, repeated 15 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ComprehensiveRegression_018', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('中', 15);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ComprehensiveRegression485', 'files', content, 'truncate');
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
     * @tc.number SUB_APPLICATIONCONTEXT_COMPREHENSIVEREGRESSION_0019
     * @tc.name ComprehensiveRegression_019
     * @tc.desc Verify files truncate, UTF8 seed 😀, repeated 8191 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ComprehensiveRegression_019', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('😀', 8191);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ComprehensiveRegression486', 'files', content, 'truncate');
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
  });
}
