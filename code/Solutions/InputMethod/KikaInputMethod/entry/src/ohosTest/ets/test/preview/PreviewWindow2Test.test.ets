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
const TAG: string = '[Sample_KikaInputMethodMore]';

export default function previewWindow2Test(): void {
  describe('PreviewWindow2Test', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW2_0001
     * @tc.name      testPreviewWindow_2001
     * @tc.desc      Verify the preview window after typing ahel into the x1 editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindow_2001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_2001 begin');
      const harness: PreviewHarness = await createPreviewHarness('x1');
      typeSequence(harness, 'ahel');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.previewCalls[0].end).assertEqual(6);
      expect(harness.client.buffer.length).assertEqual(14);
      expect(harness.client.buffer).assertEqual('x1ahello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_2001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW2_0002
     * @tc.name      testPreviewWindow_2002
     * @tc.desc      Verify the preview window after typing ahel into the #a editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindow_2002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_2002 begin');
      const harness: PreviewHarness = await createPreviewHarness('#a');
      typeSequence(harness, 'ahel');
      expect(harness.client.previewCalls.length).assertEqual(1);
      const expectedBuffer: string = '#aahello world';
      expect(harness.client.insertedTexts.join('|')).assertEqual('a|h|e|l');
      expect(harness.client.buffer.length).assertEqual(expectedBuffer.length);
      expect(harness.client.buffer).assertEqual(expectedBuffer);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_2002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW2_0003
     * @tc.name      testPreviewWindow_2003
     * @tc.desc      Verify the preview window after typing he into the empty editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindow_2003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_2003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'he');
      expect(harness.client.buffer.length).assertEqual(2);
      expect(harness.client.previewCalls.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_2003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW2_0004
     * @tc.name      testPreviewWindow_2004
     * @tc.desc      Verify that a mixed-case hEl trigger leaves the empty editor without a preview.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindow_2004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_2004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hEl');
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('hEl');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_2004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW2_0005
     * @tc.name      testPreviewWindow_2005
     * @tc.desc      Verify that an initial-capital Hel trigger leaves the empty editor without a preview.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindow_2005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_2005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const typed: string = 'Hel';
      typeSequence(harness, typed);
      const expectedBuffer: string = typed;
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.insertedTexts.join('')).assertEqual(expectedBuffer);
      expect(harness.client.buffer).assertEqual(expectedBuffer);
      expect(harness.client.buffer.length).assertEqual(expectedBuffer.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_2005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW2_0006
     * @tc.name      testPreviewWindow_2006
     * @tc.desc      Verify the preview window after typing e into the hello editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindow_2006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_2006 begin');
      const harness: PreviewHarness = await createPreviewHarness('hello');
      typeSequence(harness, 'e');
      const expectedRange: number[] = [0, 6];
      expect(harness.client.previewCalls.length).assertEqual(1);
      const range: number[] = [harness.client.previewCalls[0].start, harness.client.previewCalls[0].end];
      for (let i: number = 0; i < range.length; i++) {
        expect(range[i]).assertEqual(expectedRange[i]);
      }
      expect(harness.client.buffer.length).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_2006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW2_0007
     * @tc.name      testPreviewWindow_2007
     * @tc.desc      Verify the preview window after typing he into the hello editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindow_2007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_2007 begin');
      const harness: PreviewHarness = await createPreviewHarness('hello');
      typeSequence(harness, 'he');
      const expectedEnd: number = 6;
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].end).assertEqual(expectedEnd);
      expect(harness.client.buffer.charAt(11)).assertEqual('e');
      expect(harness.client.buffer).assertEqual('hello worlde');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_2007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW2_0008
     * @tc.name      testPreviewWindow_2008
     * @tc.desc      Verify the preview window after typing hel plus a trailing space into the hello editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindow_2008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_2008 begin');
      const harness: PreviewHarness = await createPreviewHarness('hello');
      typeSequence(harness, 'hel ');
      expect(harness.client.previewCalls.length).assertEqual(2);
      expect(harness.client.insertedTexts.join('')).assertEqual('hel ');
      expect(harness.client.buffer.length).assertEqual(22);
      expect(harness.client.buffer.endsWith('world ')).assertTrue();
      expect(harness.client.buffer).assertEqual('hello worlhello world ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_2008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW2_0009
     * @tc.name      testPreviewWindow_2009
     * @tc.desc      Verify the preview window after typing 123hel into the 123 editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindow_2009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_2009 begin');
      const initial: string = '123';
      const typed: string = '123hel';
      const harness: PreviewHarness = await createPreviewHarness(initial);
      typeSequence(harness, typed);
      const expectedStart: number = initial.length + typed.length - 3;
      const expectedEnd: number = initial.length + typed.length;
      const expectedLength: number = expectedStart + 'hello world'.length;
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(expectedStart);
      expect(harness.client.previewCalls[0].end).assertEqual(expectedEnd);
      expect(harness.client.buffer.length).assertEqual(expectedLength);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_2009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW2_0010
     * @tc.name      testPreviewWindow_2010
     * @tc.desc      Verify the preview window after typing helx into the empty editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindow_2010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_2010 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'helx');
      expect(harness.client.finishCount).assertEqual(0);
      const expectedEnd: number = 3;
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].end).assertEqual(expectedEnd);
      expect(harness.client.buffer.indexOf('x')).assertEqual(11);
      expect(harness.client.buffer).assertEqual('hello worldx');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_2010 end');
      await yieldToEventLoop();
    });

  });

}
