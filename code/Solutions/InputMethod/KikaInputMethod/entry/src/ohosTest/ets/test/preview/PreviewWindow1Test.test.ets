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
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodMore]';

export default function PreviewWindow1TestTest(): void {
  describe('PreviewWindow1Test', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_0001
     * @tc.name      testPreviewWindow_1001
     * @tc.desc      Verify that the lowercase hel trigger opens a preview window in the empty editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindow_1001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_1001 begin');
      // The trigger scans the committed prefix before the overwrite, so ranges are cursor-based.
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      expect(harness.client.buffer.length).assertEqual(11);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(0);
      expect(harness.client.previewCalls[0].end).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_1001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_0002
     * @tc.name      testPreviewWindow_1002
     * @tc.desc      Verify the preview window after typing ahel into the empty editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindow_1002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_1002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'ahel');
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('ahello world');
      expect(harness.client.previewCalls[0].end).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_1002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_0003
     * @tc.name      testPreviewWindow_1003
     * @tc.desc      Verify the preview window after typing #hel into the empty editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindow_1003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_1003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, '#hel');
      expect(harness.client.insertedTexts.join('')).assertEqual('#hel');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('#hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_1003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_0004
     * @tc.name      testPreviewWindow_1004
     * @tc.desc      Verify the preview window after typing hel into the a editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindow_1004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_1004 begin');
      const harness: PreviewHarness = await createPreviewHarness('a');
      const letters: string[] = ['h', 'e', 'l'];
      for (let i: number = 0; i < letters.length; i++) {
        InputHandler.getInstance().insertText(letters[i]);
      }
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(1);
      expect(harness.client.previewCalls[0].end).assertEqual(4);
      expect(harness.client.buffer.length).assertEqual(12);
      expect(harness.client.buffer).assertEqual('ahello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_1004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_0005
     * @tc.name      testPreviewWindow_1005
     * @tc.desc      Verify the preview window after typing hel into the ab editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindow_1005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_1005 begin');
      const initial: string = 'ab';
      const harness: PreviewHarness = await createPreviewHarness(initial);
      typeSequence(harness, 'hel');
      const expectedBuffer: string = initial + 'hello world';
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.buffer).assertEqual(expectedBuffer);
      expect(harness.client.previewCalls[0].end).assertEqual(initial.length + 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_1005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_0006
     * @tc.name      testPreviewWindow_1006
     * @tc.desc      Verify the preview window after typing l into the he editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindow_1006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_1006 begin');
      const harness: PreviewHarness = await createPreviewHarness('he');
      InputHandler.getInstance().insertText('l');
      const expectedBuffer: string = 'hello world';
      expect(harness.client.insertedTexts.join('')).assertEqual('l');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer.length).assertEqual(expectedBuffer.length);
      expect(harness.client.buffer).assertEqual(expectedBuffer);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_1006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_0007
     * @tc.name      testPreviewWindow_1007
     * @tc.desc      Verify the preview window after typing el into the h editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindow_1007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_1007 begin');
      const harness: PreviewHarness = await createPreviewHarness('h');
      typeSequence(harness, 'el');
      const expectedBuffer: string = 'hello world';
      const expectedStart: number = 0;
      const expectedEnd: number = 3;
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(expectedStart);
      expect(harness.client.previewCalls[0].end).assertEqual(expectedEnd);
      expect(harness.client.buffer.length).assertEqual(expectedBuffer.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_1007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_0008
     * @tc.name      testPreviewWindow_1008
     * @tc.desc      Verify the preview window after typing hel into the hello editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindow_1008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_1008 begin');
      const harness: PreviewHarness = await createPreviewHarness('hello');
      typeSequence(harness, 'hel');
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.previewCalls.length).assertEqual(2);
      expect(harness.client.buffer).assertEqual('hello worlhello world');
      expect(harness.client.previewCalls[0].end).assertEqual(6);
      expect(harness.client.previewCalls[1].end).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_1008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_0009
     * @tc.name      testPreviewWindow_1009
     * @tc.desc      Verify that a repeated lowercase helhel trigger overwrites the same preview window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindow_1009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_1009 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const chunks: string[] = ['hel', 'hel'];
      for (let i: number = 0; i < chunks.length; i++) {
        typeSequence(harness, chunks[i]);
      }
      expect(harness.client.previewCalls.length).assertEqual(2);
      expect(harness.client.insertedTexts.length).assertEqual(6);
      expect(harness.client.insertedTexts.join('')).assertEqual('helhel');
      expect(harness.client.buffer).assertEqual('hello worldhello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_1009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_0010
     * @tc.name      testPreviewWindow_1010
     * @tc.desc      Verify that an uppercase prefix before hel opens one preview window at offset three.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindow_1010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_1010 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'HELhel');
      expect(harness.client.previewCalls.length).assertEqual(1);
      const rangeText: string = harness.client.previewCalls[0].start.toString() + ':' + harness.client.previewCalls[0].end.toString();
      expect(rangeText).assertEqual('3:6');
      const expectedPrefix: string = 'HEL';
      const expectedLength: number = expectedPrefix.length + 'hello world'.length;
      expect(harness.client.buffer.length).assertEqual(expectedLength);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindow_1010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_RANGE_0001
     * @tc.name      testWindowRange_001
     * @tc.desc      Verify that a trigger inside an existing three-letter word starts at index one and overwrites three units.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWindowRange_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowRange_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('hel');
      InputHandler.getInstance().insertText('l');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(1);
      expect(harness.client.previewCalls[0].end).assertEqual(4);
      expect(harness.client.buffer).assertEqual('hhello world');
      expect(harness.client.buffer.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowRange_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_RANGE_0002
     * @tc.name      testWindowRange_002
     * @tc.desc      Verify that a trigger after a committed preview at index nine keeps the first nine characters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWindowRange_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowRange_002 begin');
      const initial: string = 'hello world';
      const harness: PreviewHarness = await createPreviewHarness(initial);
      InputHandler.getInstance().insertText('l');
      const expectedStart: number = initial.length - 2;
      const expectedEnd: number = initial.length + 1;
      const expectedBuffer: string = initial.substring(0, initial.length - 2) + 'hello world';
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(expectedStart);
      expect(harness.client.previewCalls[0].end).assertEqual(expectedEnd);
      expect(harness.client.buffer.length).assertEqual(expectedBuffer.length);
      expect(harness.client.buffer).assertEqual(expectedBuffer);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowRange_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_RANGE_0003
     * @tc.name      testWindowRange_003
     * @tc.desc      Verify that help followed by x is not a prefix of the preview text and opens no window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testWindowRange_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowRange_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('help');
      InputHandler.getInstance().insertText('x');
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('helpx');
      expect(harness.client.buffer.length).assertEqual(5);
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowRange_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_RANGE_0004
     * @tc.name      testWindowRange_004
     * @tc.desc      Verify that the later of two hel occurrences supplies the window start at index three.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testWindowRange_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const harness: PreviewHarness = await createPreviewHarness('helhel');
      InputHandler.getInstance().insertText('x');
      const call: number = harness.client.previewCalls.length;
      const start: number = harness.client.previewCalls[0].start;
      const end: number = harness.client.previewCalls[0].end;
      expect(call).assertEqual(1);
      expect(start + end).assertEqual(10);
      expect(end - start).assertEqual(4);
      expect(harness.client.buffer.endsWith('hello world')).assertTrue();
      expect(harness.client.buffer.indexOf('helhel')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowRange_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_RANGE_0005
     * @tc.name      testWindowRange_005
     * @tc.desc      Verify that a two-letter editor plus o then l yields a window from index one to four.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWindowRange_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowRange_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('he');
      InputHandler.getInstance().insertText('o');
      expect(harness.client.previewCalls.length).assertEqual(0);
      InputHandler.getInstance().insertText('l');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(1);
      expect(harness.client.previewCalls[0].end).assertEqual(4);
      expect(harness.client.buffer).assertEqual('hhello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowRange_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_RANGE_0006
     * @tc.name      testWindowRange_006
     * @tc.desc      Verify that a three-letter xel editor below the long-buffer threshold opens no window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWindowRange_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const harness: PreviewHarness = await createPreviewHarness('xe');
      InputHandler.getInstance().insertText('l');
      const calls: number = harness.client.previewCalls.length;
      const buffer: string = harness.client.buffer;
      expect(calls).assertEqual(0);
      expect(buffer.charAt(0)).assertEqual('x');
      expect(buffer.charAt(buffer.length - 1)).assertEqual('l');
      expect(buffer.length - 2).assertEqual(1);
      expect(harness.client.finishCount + calls).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowRange_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_RANGE_0007
     * @tc.name      testWindowRange_007
     * @tc.desc      Verify that a chained window repeats the same preview text with width three.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testWindowRange_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowRange_007 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().insertText('l');
      expect(harness.client.previewCalls.length).assertEqual(2);
      expect(harness.client.previewCalls[0].text).assertEqual('hello world');
      expect(harness.client.previewCalls[1].text).assertEqual('hello world');
      expect(harness.client.previewCalls[1].start).assertEqual(9);
      expect(harness.client.previewCalls[1].end).assertEqual(12);
      expect(harness.client.buffer.length).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowRange_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_RANGE_0008
     * @tc.name      testWindowRange_008
     * @tc.desc      Verify that a two-letter prefix keeps one committed window and appends the next letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testWindowRange_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowRange_008 begin');
      const harness: PreviewHarness = await createPreviewHarness('ab');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().insertText('l');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(2);
      expect(harness.client.buffer).assertEqual('abhello worldl');
      expect(harness.client.buffer.length).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowRange_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_RANGE_0009
     * @tc.name      testWindowRange_009
     * @tc.desc      Verify that a raw hel followed by x is rebuilt through the four-unit window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testWindowRange_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowRange_009 begin');
      const harness: PreviewHarness = await createPreviewHarness('hel');
      InputHandler.getInstance().insertText('x');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(0);
      expect(harness.client.previewCalls[0].end).assertEqual(4);
      expect(harness.client.buffer).assertEqual('hello world');
      expect(harness.client.getTextIndexAtCursorSync()).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowRange_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_BULK_0001
     * @tc.name      testBulkWindow_001
     * @tc.desc      Verify that a three-letter hel payload opens a one-unit window from index two.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testBulkWindow_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBulkWindow_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('hel');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(2);
      expect(harness.client.previewCalls[0].end).assertEqual(3);
      expect(harness.client.buffer).assertEqual('hehello world');
      expect(harness.client.buffer.length).assertEqual(13);
      expect(harness.client.insertedTexts.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBulkWindow_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_BULK_0002
     * @tc.name      testBulkWindow_002
     * @tc.desc      Verify that a four-letter helx payload overwrites only the final x with start three and end four.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testBulkWindow_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBulkWindow_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('helx');
      const expectedRange: number[] = [3, 4];
      expect(harness.client.previewCalls.length).assertEqual(1);
      const actualRange: number[] = [harness.client.previewCalls[0].start, harness.client.previewCalls[0].end];
      for (let i: number = 0; i < expectedRange.length; i++) {
        expect(actualRange[i]).assertEqual(expectedRange[i]);
      }
      const expectedBuffer: string = 'hel' + 'hello world';
      expect(harness.client.buffer.length).assertEqual(expectedBuffer.length);
      expect(harness.client.buffer).assertEqual(expectedBuffer);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBulkWindow_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_BULK_0003
     * @tc.name      testBulkWindow_003
     * @tc.desc      Verify that a prefixed xhel payload collapses the substring to one letter and opens no window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testBulkWindow_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBulkWindow_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('xhel');
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('xhel');
      expect(harness.client.buffer.length).assertEqual(4);
      expect(harness.client.getTextIndexAtCursorSync()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBulkWindow_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_BULK_0004
     * @tc.name      testBulkWindow_004
     * @tc.desc      Verify that a five-letter hello payload opens a one-unit window at index four.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testBulkWindow_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBulkWindow_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('hello');
      expect(harness.client.previewCalls.length).assertEqual(1);
      const rangeText: string = harness.client.previewCalls[0].start.toString() + '-' + harness.client.previewCalls[0].end.toString();
      expect(rangeText).assertEqual('4-5');
      const expectedBuffer: string = 'hellhello world';
      expect(harness.client.buffer).assertEqual(expectedBuffer);
      expect(harness.client.buffer.length).assertEqual(expectedBuffer.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBulkWindow_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_BULK_0005
     * @tc.name      testBulkWindow_005
     * @tc.desc      Verify that a two-letter he payload followed by a letter l opens the first-position window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBulkWindow_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBulkWindow_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const firstPayload: string = 'he';
      InputHandler.getInstance().insertText(firstPayload);
      const callsBeforeTrigger: number = harness.client.previewCalls.length;
      expect(callsBeforeTrigger).assertEqual(0);
      expect(harness.client.buffer).assertEqual(firstPayload);
      InputHandler.getInstance().insertText('l');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(0);
      expect(harness.client.previewCalls[0].end).assertEqual(3);
      expect(harness.client.buffer.length).assertEqual(11);
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBulkWindow_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_BULK_0006
     * @tc.name      testBulkWindow_006
     * @tc.desc      Verify that a hel payload in an a editor overwrites the fourth unit and keeps the ahe prefix.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testBulkWindow_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBulkWindow_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('a');
      InputHandler.getInstance().insertText('hel');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(3);
      expect(harness.client.previewCalls[0].end).assertEqual(4);
      expect(harness.client.buffer).assertEqual('ahehello world');
      expect(harness.client.buffer.length).assertEqual(14);
      expect(harness.client.insertedTexts.join('')).assertEqual('hel');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBulkWindow_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_BULK_0007
     * @tc.name      testBulkWindow_007
     * @tc.desc      Verify that one letter payload before three typed letters yields the window from index one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testBulkWindow_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBulkWindow_007 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('e');
      typeSequence(harness, 'hel');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(1);
      expect(harness.client.previewCalls[0].end).assertEqual(4);
      expect(harness.client.buffer).assertEqual('ehello world');
      expect(harness.client.insertedTexts.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBulkWindow_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_CURSOR_0001
     * @tc.name      testWindowCursor_001
     * @tc.desc      Verify that the cursor lands on the last preview character after a two-letter offset window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWindowCursor_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowCursor_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('ab');
      typeSequence(harness, 'hel');
      expect(harness.client.buffer).assertEqual('abhello world');
      expect(harness.client.getTextIndexAtCursorSync()).assertEqual(12);
      expect(harness.client.previewCalls[0].start).assertEqual(2);
      expect(harness.client.previewCalls[0].end).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowCursor_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_CURSOR_0002
     * @tc.name      testWindowCursor_002
     * @tc.desc      Verify that a rejected window leaves the cursor on the typed letter and the raw prefix.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWindowCursor_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowCursor_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      harness.client.failPreview = true;
      typeSequence(harness, 'hel');
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('hel');
      expect(harness.client.getTextIndexAtCursorSync()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowCursor_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_CURSOR_0003
     * @tc.name      testWindowCursor_003
     * @tc.desc      Verify that the second window of a hello editor ends at thirteen and leaves the cursor at twenty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testWindowCursor_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowCursor_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('hello');
      typeSequence(harness, 'hel');
      expect(harness.client.previewCalls.length).assertEqual(2);
      expect(harness.client.previewCalls[0].end).assertEqual(6);
      expect(harness.client.previewCalls[1].end).assertEqual(13);
      expect(harness.client.getTextIndexAtCursorSync()).assertEqual(20);
      expect(harness.client.buffer.length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowCursor_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_CURSOR_0004
     * @tc.name      testWindowCursor_004
     * @tc.desc      Verify that three non-trigger letters leave the cursor at two and open no window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWindowCursor_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowCursor_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'xyz');
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('xyz');
      expect(harness.client.getTextIndexAtCursorSync()).assertEqual(2);
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowCursor_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_FLAG_0001
     * @tc.name      testWindowFlag_001
     * @tc.desc      Verify that an unsupported editor receives the same three-unit window text and range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testWindowFlag_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowFlag_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0, 0, false);
      typeSequence(harness, 'hel');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].text).assertEqual('hello world');
      expect(harness.client.previewCalls[0].start).assertEqual(0);
      expect(harness.client.previewCalls[0].end).assertEqual(3);
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowFlag_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_FLAG_0002
     * @tc.name      testWindowFlag_002
     * @tc.desc      Verify that a pending attribute does not delay the two-letter offset window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testWindowFlag_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowFlag_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('ab', 0, 0, true, true);
      typeSequence(harness, 'hel');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(2);
      expect(harness.client.previewCalls[0].end).assertEqual(5);
      expect(harness.client.editorAttributeCount).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowFlag_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_FLAG_0003
     * @tc.name      testWindowFlag_003
     * @tc.desc      Verify that a rejected attach command does not suppress the first window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testWindowFlag_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowFlag_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0, 0, true, false, true);
      typeSequence(harness, 'hel');
      expect(harness.client.privateCommandCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].end).assertEqual(3);
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowFlag_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_FLAG_0004
     * @tc.name      testWindowFlag_004
     * @tc.desc      Verify that a rejected hide after a window counts once and leaves the window open.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testWindowFlag_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowFlag_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      harness.keyboard.failHide = true;
      typeSequence(harness, 'hel');
      InputHandler.getInstance().hideKeyboardSelf();
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowFlag_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_FLAG_0005
     * @tc.name      testWindowFlag_005
     * @tc.desc      Verify that clearing a preview fault lets the next letter rebuild the window over four units.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testWindowFlag_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowFlag_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      harness.client.failPreview = true;
      typeSequence(harness, 'hel');
      expect(harness.client.buffer).assertEqual('hel');
      harness.client.failPreview = false;
      InputHandler.getInstance().insertText('x');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(0);
      expect(harness.client.previewCalls[0].end).assertEqual(4);
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowFlag_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_FLAG_0006
     * @tc.name      testWindowFlag_006
     * @tc.desc      Verify that a negative enter type finishes an open window without clamping the sent type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testWindowFlag_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowFlag_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('', -3);
      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions[0]).assertEqual(-3);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.previewCalls[0].end).assertEqual(3);
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowFlag_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_FLAG_0007
     * @tc.name      testWindowFlag_007
     * @tc.desc      Verify that an unsupported editor commits its first window with the configured type ten.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testWindowFlag_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowFlag_007 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 10, 0, false);
      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions.join('|')).assertEqual('10');
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowFlag_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_FLAG_0008
     * @tc.name      testWindowFlag_008
     * @tc.desc      Verify that enter after two chained windows sends one type and one finish while keeping both texts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testWindowFlag_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowFlag_008 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 7);
      typeSequence(harness, 'hel');
      InputHandler.getInstance().insertText('l');
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.previewCalls.length).assertEqual(2);
      expect(harness.client.keyFunctions.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello worhello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowFlag_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_FLAG_0009
     * @tc.name      testWindowFlag_009
     * @tc.desc      Verify that enter before and after a trigger sends the type twice and finishes twice.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testWindowFlag_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowFlag_009 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 5);
      InputHandler.getInstance().sendKeyFunction();
      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions.join('|')).assertEqual('5|5');
      expect(harness.client.finishCount).assertEqual(2);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowFlag_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_SUPPRESS_0001
     * @tc.name      testWindowSuppress_001
     * @tc.desc      Verify that a near-complete hello worle prefix is not contained in the preview text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testWindowSuppress_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowSuppress_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('hello worle');
      InputHandler.getInstance().insertText('x');
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('hello worlex');
      expect(harness.client.buffer.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowSuppress_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_SUPPRESS_0002
     * @tc.name      testWindowSuppress_002
     * @tc.desc      Verify that a complete preview prefix followed by x does not reopen the same window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWindowSuppress_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowSuppress_002 begin');
      const initial: string = 'hello world';
      const harness: PreviewHarness = await createPreviewHarness(initial);
      InputHandler.getInstance().insertText('x');
      const expectedBuffer: string = initial + 'x';
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.insertedTexts.join('')).assertEqual('x');
      expect(harness.client.buffer.length).assertEqual(expectedBuffer.length);
      expect(harness.client.buffer).assertEqual(expectedBuffer);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowSuppress_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_SUPPRESS_0003
     * @tc.name      testWindowSuppress_003
     * @tc.desc      Verify that a three-letter hey sequence stays below the long-buffer branch and opens nothing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWindowSuppress_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowSuppress_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hey');
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('hey');
      expect(harness.client.buffer.length).assertEqual(3);
      expect(harness.client.getTextIndexAtCursorSync()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowSuppress_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOW1_SUPPRESS_0004
     * @tc.name      testWindowSuppress_004
     * @tc.desc      Verify that the reversed ehl sequence does not match the trigger and stays raw.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWindowSuppress_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowSuppress_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'ehl');
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('ehl');
      expect(harness.client.insertedTexts.join('')).assertEqual('ehl');
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowSuppress_004 end');
      await yieldToEventLoop();
    });

  });
}
