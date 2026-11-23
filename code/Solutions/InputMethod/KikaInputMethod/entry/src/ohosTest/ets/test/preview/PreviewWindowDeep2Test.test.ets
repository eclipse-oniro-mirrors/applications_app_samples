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
const TAG: string = '[Sample_KikaInputMethodMore2]';

export default function previewWindowDeep2Test(): void {
  describe('PreviewWindowDeep2Test', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP2_0001
     * @tc.name      testPreviewWindowDeep_2001
     * @tc.desc      Verify the extended preview window after typing e.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindowDeep_2001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_2001 begin');
      const harness: PreviewHarness = await createPreviewHarness('hello');
      typeSequence(harness, 'e');
      const expectedCalls: number = 1;
      expect(harness.client.previewCalls.length).assertEqual(expectedCalls);
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.buffer).assertEqual('hello world');
      expect(harness.client.buffer.length).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_2001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP2_0002
     * @tc.name      testPreviewWindowDeep_2002
     * @tc.desc      Verify the extended preview window after typing he. Check 200.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindowDeep_2002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_2002 begin');
      const harness: PreviewHarness = await createPreviewHarness('hello');
      typeSequence(harness, 'he');
      expect(harness.client.insertedTexts.join('')).assertEqual('he');
      expect(harness.client.previewCalls.length).assertEqual(1);
      const expectedBuffer: string = 'hello worlde';
      expect(harness.client.buffer).assertEqual(expectedBuffer);
      expect(harness.client.buffer.length).assertEqual(expectedBuffer.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_2002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP2_0003
     * @tc.name      testPreviewWindowDeep_2003
     * @tc.desc      Verify the extended preview window after typing x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindowDeep_2003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_2003 begin');
      const initial: string = 'hello';
      const harness: PreviewHarness = await createPreviewHarness(initial);
      typeSequence(harness, 'x');
      const expectedText: string = 'hello world';
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].text).assertEqual(expectedText);
      expect(harness.client.previewCalls[0].start).assertEqual(0);
      expect(harness.client.previewCalls[0].end).assertEqual(initial.length + 1);
      expect(harness.client.buffer.charCodeAt(0)).assertEqual(104);
      expect(harness.client.buffer).assertEqual(expectedText);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_2003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP2_0004
     * @tc.name      testPreviewWindowDeep_2004
     * @tc.desc      Verify the extended preview window and buffer growth for the lowercase hel trigger. Check 200.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindowDeep_2004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_2004 begin');
      const initial: string = '123';
      const harness: PreviewHarness = await createPreviewHarness(initial);
      typeSequence(harness, 'hel');
      const expectedBuffer: string = initial + 'hello world';
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.buffer.length).assertEqual(expectedBuffer.length);
      expect(harness.client.buffer).assertEqual(expectedBuffer);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_2004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP2_0005
     * @tc.name      testPreviewWindowDeep_2005
     * @tc.desc      Verify the extended preview window and buffer growth for the lowercase hel trigger. Check 200. (testPreviewWindowDeep2005).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindowDeep_2005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_2005 begin');
      const harness: PreviewHarness = await createPreviewHarness('#a');
      typeSequence(harness, 'hel');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.insertedTexts.join('')).assertEqual('hel');
      expect(harness.client.buffer.indexOf('hello world')).assertEqual(2);
      expect(harness.client.buffer).assertEqual('#ahello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_2005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP2_0006
     * @tc.name      testPreviewWindowDeep_2006
     * @tc.desc      Verify that an uppercase prefix yields one extended preview starting at offset three.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindowDeep_2006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_2006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const upperPrefix: string = 'HEL';
      typeSequence(harness, upperPrefix + 'hel');
      const expectedStart: number = upperPrefix.length;
      const expectedEnd: number = upperPrefix.length + 3;
      const expectedBuffer: string = upperPrefix + 'hello world';
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(expectedStart);
      expect(harness.client.previewCalls[0].end).assertEqual(expectedEnd);
      expect(harness.client.buffer.length).assertEqual(expectedBuffer.length);
      expect(harness.client.buffer).assertEqual(expectedBuffer);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_2006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP2_0007
     * @tc.name      testPreviewWindowDeep_2007
     * @tc.desc      Verify that a mixed-case first trigger still yields one extended preview at offset three.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindowDeep_2007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_2007 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hElhel');
      const expectedLength: number = 14;
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer.length).assertEqual(expectedLength);
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.buffer.charCodeAt(0)).assertEqual(104);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_2007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP2_0008
     * @tc.name      testPreviewWindowDeep_2008
     * @tc.desc      Verify the extended preview window after typing abc.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindowDeep_2008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_2008 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'abc');
      const expectedBuffer: string = 'abc';
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.insertedTexts.join('')).assertEqual(expectedBuffer);
      expect(harness.client.buffer).assertEqual(expectedBuffer);
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_2008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP2_0009
     * @tc.name      testPreviewWindowDeep_2009
     * @tc.desc      Verify the extended preview window after typing h.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindowDeep_2009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_2009 begin');
      const initial: string = 'x1';
      const harness: PreviewHarness = await createPreviewHarness(initial);
      typeSequence(harness, 'h');
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.insertedTexts.join('')).assertEqual('h');
      expect(harness.client.buffer.length).assertEqual(initial.length + 1);
      expect(harness.client.buffer).assertEqual(initial + 'h');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_2009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP2_0010
     * @tc.name      testPreviewWindowDeep_2010
     * @tc.desc      Verify the extended preview window after typing helhelhel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindowDeep_2010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_2010 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const chunk: string = 'hel';
      const rounds: number = 3;
      for (let i: number = 0; i < rounds; i++) {
        typeSequence(harness, chunk);
      }
      expect(harness.client.previewCalls.length).assertEqual(rounds);
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.buffer.length).assertEqual(rounds * 11);
      expect(harness.client.buffer).assertEqual('hello worldhello worldhello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_2010 end');
      await yieldToEventLoop();
    });

  });

}
