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

export default function contextToastNotificationTest(): void {
  describe('ContextToastNotification', () => {
    beforeAll((): void => {
      expect(requireContext().applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    afterAll((): void => {
      hilog.info(0xF811, 'ContextTests', 'ContextToastNotification completed');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0001
     * @tc.name ContextToastNotification_001
     * @tc.desc Verify files append, UTF8 seed 😀, repeated 1023 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_001', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('😀', 1023);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification244', 'files', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0002
     * @tc.name ContextToastNotification_002
     * @tc.desc Verify files append, UTF8 seed space , repeated 64 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_002', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('space ', 64);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification245', 'files', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0003
     * @tc.name ContextToastNotification_003
     * @tc.desc Verify files append, UTF8 seed 0123456789, repeated 7 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_003', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('0123456789', 7);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification246', 'files', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0004
     * @tc.name ContextToastNotification_004
     * @tc.desc Verify cache append, UTF8 seed a, repeated 4095 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_004', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('a', 4095);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification247', 'cache', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0005
     * @tc.name ContextToastNotification_005
     * @tc.desc Verify cache append, UTF8 seed 中, repeated 256 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_005', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('中', 256);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification248', 'cache', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0006
     * @tc.name ContextToastNotification_006
     * @tc.desc Verify cache append, UTF8 seed \n, repeated 31 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_006', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('\n', 31);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification249', 'cache', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0007
     * @tc.name ContextToastNotification_007
     * @tc.desc Verify cache append, UTF8 seed 0123456789, repeated 1024 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_007', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('0123456789', 1024);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification251', 'cache', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0008
     * @tc.name ContextToastNotification_008
     * @tc.desc Verify files create, UTF8 seed Z9, repeated 127 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_008', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('Z9', 127);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification252', 'files', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0009
     * @tc.name ContextToastNotification_009
     * @tc.desc Verify files create, UTF8 seed 😀, repeated 8 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_009', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('😀', 8);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification253', 'files', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0010
     * @tc.name ContextToastNotification_010
     * @tc.desc Verify files create, UTF8 seed \n, repeated 4096 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_010', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('\n', 4096);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification254', 'files', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0011
     * @tc.name ContextToastNotification_011
     * @tc.desc Verify files create, UTF8 seed é, repeated 511 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_011', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('é', 511);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification255', 'files', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0012
     * @tc.name ContextToastNotification_012
     * @tc.desc Verify cache create, UTF8 seed a, repeated 32 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_012', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('a', 32);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification256', 'cache', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0013
     * @tc.name ContextToastNotification_013
     * @tc.desc Verify cache create, UTF8 seed 中, repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_013', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('中', 1);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification257', 'cache', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0014
     * @tc.name ContextToastNotification_014
     * @tc.desc Verify cache create, UTF8 seed 😀, repeated 2047 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_014', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('😀', 2047);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification258', 'cache', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0015
     * @tc.name ContextToastNotification_015
     * @tc.desc Verify cache create, UTF8 seed space , repeated 128 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_015', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('space ', 128);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification259', 'cache', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0016
     * @tc.name ContextToastNotification_016
     * @tc.desc Verify cache create, UTF8 seed 0123456789, repeated 15 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_016', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('0123456789', 15);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification260', 'cache', content, 'create');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0017
     * @tc.name ContextToastNotification_017
     * @tc.desc Verify files truncate, UTF8 seed a, repeated 8191 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_017', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('a', 8191);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification261', 'files', content, 'truncate');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0018
     * @tc.name ContextToastNotification_018
     * @tc.desc Verify files truncate, UTF8 seed 中, repeated 512 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_018', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('中', 512);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification262', 'files', content, 'truncate');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0019
     * @tc.name ContextToastNotification_019
     * @tc.desc Verify files truncate, UTF8 seed \n, repeated 63 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_019', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('\n', 63);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification263', 'files', content, 'truncate');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0020
     * @tc.name ContextToastNotification_020
     * @tc.desc Verify files truncate, UTF8 seed é, repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_020', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('é', 2);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification264', 'files', content, 'truncate');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0021
     * @tc.name ContextToastNotification_021
     * @tc.desc Verify files truncate, UTF8 seed 0123456789, repeated 2048 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_021', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('0123456789', 2048);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification265', 'files', content, 'truncate');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0022
     * @tc.name ContextToastNotification_022
     * @tc.desc Verify cache truncate, UTF8 seed Z9, repeated 255 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_022', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('Z9', 255);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification266', 'cache', content, 'truncate');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0023
     * @tc.name ContextToastNotification_023
     * @tc.desc Verify cache truncate, UTF8 seed 😀, repeated 16 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_023', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('😀', 16);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification267', 'cache', content, 'truncate');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0024
     * @tc.name ContextToastNotification_024
     * @tc.desc Verify cache truncate, UTF8 seed \n, repeated 8192 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_024', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('\n', 8192);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification268', 'cache', content, 'truncate');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0025
     * @tc.name ContextToastNotification_025
     * @tc.desc Verify cache truncate, UTF8 seed é, repeated 1023 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_025', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('é', 1023);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification269', 'cache', content, 'truncate');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0026
     * @tc.name ContextToastNotification_026
     * @tc.desc Verify files append, UTF8 seed a, repeated 64 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_026', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('a', 64);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification270', 'files', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0027
     * @tc.name ContextToastNotification_027
     * @tc.desc Verify files append, UTF8 seed 中, repeated 7 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_027', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('中', 7);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification271', 'files', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0028
     * @tc.name ContextToastNotification_028
     * @tc.desc Verify files append, UTF8 seed 😀, repeated 4095 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_028', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('😀', 4095);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification272', 'files', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0029
     * @tc.name ContextToastNotification_029
     * @tc.desc Verify files append, UTF8 seed space , repeated 256 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_029', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('space ', 256);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification273', 'files', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0030
     * @tc.name ContextToastNotification_030
     * @tc.desc Verify files append, UTF8 seed 0123456789, repeated 31 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_030', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('0123456789', 31);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification274', 'files', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0031
     * @tc.name ContextToastNotification_031
     * @tc.desc Verify cache append, UTF8 seed 中, repeated 1024 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_031', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('中', 1024);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification276', 'cache', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0032
     * @tc.name ContextToastNotification_032
     * @tc.desc Verify cache append, UTF8 seed \n, repeated 127 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_032', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('\n', 127);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification277', 'cache', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0033
     * @tc.name ContextToastNotification_033
     * @tc.desc Verify cache append, UTF8 seed é, repeated 8 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_033', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('é', 8);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification278', 'cache', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0034
     * @tc.name ContextToastNotification_034
     * @tc.desc Verify cache append, UTF8 seed 0123456789, repeated 4096 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_034', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('0123456789', 4096);
      const expected: string = "prefix:" + content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification279', 'cache', content, 'append');
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTTOASTNOTIFICATION_0035
     * @tc.name ContextToastNotification_035
     * @tc.desc Verify files create, UTF8 seed Z9, repeated 511 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextToastNotification_035', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const content: string = payload('Z9', 511);
      const expected: string = content;
      const started: number = Date.now();
      const actual: FileProbe = await probeFile('ContextToastNotification280', 'files', content, 'create');
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
  });
}
