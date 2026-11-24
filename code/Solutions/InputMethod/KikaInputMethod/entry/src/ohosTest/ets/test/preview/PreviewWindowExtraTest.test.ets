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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import { yieldToEventLoop } from '../support/AsyncSupport';
import { createPreviewHarness, PreviewHarness, typeSequence } from '../support/PreviewHarness';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodPreviewExtra]';

export default function previewWindowExtraTest(): void {
  describe('PreviewWindowExtraTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_EXTRA_0001
     * @tc.name      testPreviewWindowExtraTest_001
     * @tc.desc      Verify the extra preview window after typing hhel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindowExtraTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowExtraTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hhel');
      const expectedStart: number = 1;
      const expectedEnd: number = 4;
      const expectedLength: number = 12;
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].end).assertEqual(expectedEnd);
      expect(harness.client.previewCalls[0].start).assertEqual(expectedStart);
      expect(harness.client.buffer.length).assertEqual(expectedLength);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowExtraTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_EXTRA_0002
     * @tc.name      testPreviewWindowExtraTest_002
     * @tc.desc      Verify the extra preview window after typing hehel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindowExtraTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowExtraTest_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hehel');
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.insertedTexts.length).assertEqual(5);
      expect(harness.client.buffer).assertEqual('hehello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowExtraTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_EXTRA_0003
     * @tc.name      testPreviewWindowExtraTest_003
     * @tc.desc      Verify the extra preview window after typing ahe.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindowExtraTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowExtraTest_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('a');
      typeSequence(harness, 'ahe');
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('aahe');
      expect(harness.client.insertedTexts.join('')).assertEqual('ahe');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowExtraTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_EXTRA_0004
     * @tc.name      testPreviewWindowExtraTest_004
     * @tc.desc      Verify the extra preview window after typing ahelx.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindowExtraTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowExtraTest_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('ab');
      const typed: string = 'ahelx';
      for (let i: number = 0; i < typed.length; i++) {
        typeSequence(harness, typed.charAt(i));
      }
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(3);
      expect(harness.client.previewCalls[0].end).assertEqual(6);
      expect(harness.client.buffer.length).assertEqual(15);
      expect(harness.client.buffer).assertEqual('abahello worldx');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowExtraTest_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_EXTRA_0005
     * @tc.name      testPreviewWindowExtraTest_005
     * @tc.desc      Verify the extra preview window after typing helx.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindowExtraTest_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowExtraTest_005 begin');
      const initial: string = 'hello';
      const harness: PreviewHarness = await createPreviewHarness(initial);
      typeSequence(harness, 'helx');
      const expectedBuffer: string = 'hello worl' + 'hello worldx';
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.insertedTexts.length).assertEqual(4);
      expect(harness.client.buffer.length).assertEqual(expectedBuffer.length);
      expect(harness.client.buffer).assertEqual(expectedBuffer);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowExtraTest_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_EXTRA_0006
     * @tc.name      testPreviewWindowExtraTest_006
     * @tc.desc      Verify the extra preview window after typing xhel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindowExtraTest_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowExtraTest_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('hello');
      typeSequence(harness, 'xhel');
      const expectedCalls: number = 2;
      expect(harness.client.previewCalls.length).assertEqual(expectedCalls);
      expect(harness.client.buffer).assertEqual('hello world' + 'hello world');
      expect(harness.client.insertedTexts.join('')).assertEqual('xhel');
      expect(harness.client.buffer.length).assertEqual(22);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowExtraTest_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_EXTRA_0007
     * @tc.name      testPreviewWindowExtraTest_007
     * @tc.desc      Verify the extra preview window after typing ahelx. Check 007.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindowExtraTest_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowExtraTest_007 begin');
      const harness: PreviewHarness = await createPreviewHarness('#a');
      typeSequence(harness, 'ahelx');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(3);
      expect(harness.client.previewCalls[0].end).assertEqual(6);
      expect(harness.client.buffer.length).assertEqual(15);
      expect(harness.client.buffer.charCodeAt(0)).assertEqual(35);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowExtraTest_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_EXTRA_0008
     * @tc.name      testPreviewWindowExtraTest_008
     * @tc.desc      Verify the extra preview window after typing ahel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindowExtraTest_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowExtraTest_008 begin');
      const initial: string = '123';
      const harness: PreviewHarness = await createPreviewHarness(initial);
      typeSequence(harness, 'ahel');
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.insertedTexts.join('')).assertEqual('ahel');
      expect(harness.client.buffer).assertEqual(initial + 'ahello world');
      expect(harness.client.buffer.length).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowExtraTest_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_EXTRA_0009
     * @tc.name      testPreviewWindowExtraTest_009
     * @tc.desc      Verify the extra preview window after typing xahel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindowExtraTest_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowExtraTest_009 begin');
      const harness: PreviewHarness = await createPreviewHarness('x1');
      typeSequence(harness, 'xahel');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer.length).assertEqual(15);
      expect(harness.client.buffer).assertEqual('x1x' + 'ahello world');
      expect(harness.client.insertedTexts.join('|')).assertEqual('x|a|h|e|l');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowExtraTest_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_EXTRA_0010
     * @tc.name      testPreviewWindowExtraTest_010
     * @tc.desc      Verify the extra preview window after typing helo.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindowExtraTest_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowExtraTest_010 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'helo');
      const expectedBuffer: string = 'hello worldo';
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(0);
      expect(harness.client.previewCalls[0].end).assertEqual(3);
      expect(harness.client.buffer.length).assertEqual(expectedBuffer.length);
      expect(harness.client.buffer).assertEqual(expectedBuffer);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowExtraTest_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_EXTRA_0011
     * @tc.name      testPreviewWindowExtraTest_011
     * @tc.desc      Verify the extra preview window after typing hel1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindowExtraTest_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowExtraTest_011 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel1');
      expect(harness.client.finishCount).assertEqual(0);
      const expectedBuffer: string = 'hello world1';
      expect(harness.client.insertedTexts.length).assertEqual(4);
      expect(harness.client.buffer.indexOf('1')).assertEqual(11);
      expect(harness.client.buffer).assertEqual(expectedBuffer);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowExtraTest_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_EXTRA_0012
     * @tc.name      testPreviewWindowExtraTest_012
     * @tc.desc      Verify the extra preview window after typing ll.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindowExtraTest_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowExtraTest_012 begin');
      const harness: PreviewHarness = await createPreviewHarness('he');
      typeSequence(harness, 'll');
      const expectedBuffer: string = 'hello worhello world';
      expect(harness.client.previewCalls.length).assertEqual(2);
      expect(harness.client.buffer).assertEqual(expectedBuffer);
      expect(harness.client.insertedTexts.join('')).assertEqual('ll');
      expect(harness.client.buffer.length).assertEqual(expectedBuffer.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowExtraTest_012 end');
      await yieldToEventLoop();
    });

  });

}
