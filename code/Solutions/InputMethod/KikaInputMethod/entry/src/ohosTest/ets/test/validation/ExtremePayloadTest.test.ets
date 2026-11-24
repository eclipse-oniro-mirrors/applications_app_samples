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
import { PreviewHarness, createPreviewHarness } from '../support/PreviewHarness';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodExtremePayload]';

export default function extremePayloadTest(): void {
  describe('ExtremePayloadTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_PAYLOAD_0001
     * @tc.name      testExtremePayload_001
     * @tc.desc      Verify that a four-letter payload followed by a two-unit deletion keeps the buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremePayload_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremePayload_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('wxyz');
      InputHandler.getInstance().deleteBackward(2);
      expect(harness.client.buffer.length).assertEqual(4);
      expect(harness.client.backwardLengths[0]).assertEqual(2);
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremePayload_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_PAYLOAD_0002
     * @tc.name      testExtremePayload_002
     * @tc.desc      Verify that a eighteen-symbol payload keeps its first and last glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremePayload_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremePayload_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('@#$%&-+()/*":;!?ab');
      expect(harness.client.buffer.length).assertEqual(18);
      expect(harness.client.buffer.charAt(0)).assertEqual('@');
      expect(harness.client.buffer.charAt(17)).assertEqual('b');
      expect(harness.client.previewCalls.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremePayload_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_PAYLOAD_0003
     * @tc.name      testExtremePayload_003
     * @tc.desc      Verify that a three-hundred-eleven CJK payload keeps its unit count.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremePayload_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremePayload_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      let payload: string = '';
      let filled: number = 0;
      while (filled < 311) {
        payload = payload + '中';
        filled = filled + 1;
      }
      InputHandler.getInstance().insertText(payload);
      const glyphCount: number = harness.client.buffer.split('中').length - 1;
      expect(glyphCount).assertEqual(311);
      expect(harness.client.buffer.charCodeAt(0) + harness.client.buffer.charCodeAt(310)).assertEqual(40026);
      expect(harness.client.previewCalls.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremePayload_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_PAYLOAD_0004
     * @tc.name      testExtremePayload_004
     * @tc.desc      Verify that a two-thousand-forty-seven payload accepts a mid-size forward deletion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremePayload_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremePayload_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      let first: string = '';
      for (let i = 0; i < 1000; i++) {
        first = first + 'y';
      }
      let second: string = '';
      for (let i = 0; i < 1047; i++) {
        second = second + 'y';
      }
      InputHandler.getInstance().insertText(first);
      InputHandler.getInstance().insertText(second);
      InputHandler.getInstance().deleteForward(1024);
      expect(harness.client.insertedTexts.length).assertEqual(2);
      expect(harness.client.buffer.length).assertEqual(2047);
      expect(harness.client.buffer.substring(0, 3)).assertEqual('yyy');
      expect(harness.client.forwardLengths[0]).assertEqual(1024);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremePayload_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_PAYLOAD_0005
     * @tc.name      testExtremePayload_005
     * @tc.desc      Verify that seven hundred seventy-seven letter-emoji pairs occupy 2331 units.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremePayload_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremePayload_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      let payload: string = '';
      for (let i = 0; i < 777; i++) {
        payload = payload + 'b😀';
      }
      InputHandler.getInstance().insertText(payload);
      const pairs: number = harness.client.buffer.split('b').length - 1;
      expect(pairs).assertEqual(777);
      expect(harness.client.buffer.length - pairs * 2).assertEqual(777);
      expect(harness.client.buffer.indexOf('😀')).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremePayload_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_PAYLOAD_0006
     * @tc.name      testExtremePayload_006
     * @tc.desc      Verify that a lone high surrogate after an emoji keeps the pair boundary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremePayload_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremePayload_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('😀');
      InputHandler.getInstance().insertText(String.fromCharCode(55357));
      expect(harness.client.buffer.length).assertEqual(3);
      expect(harness.client.buffer.charCodeAt(0)).assertEqual(55357);
      expect(harness.client.buffer.charCodeAt(2)).assertEqual(55357);
      expect(harness.client.previewCalls.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremePayload_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_PAYLOAD_0007
     * @tc.name      testExtremePayload_007
     * @tc.desc      Verify that an embedded tab payload keeps its three code units.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremePayload_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremePayload_007 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('a\tb');
      const tab: string = String.fromCharCode(9);
      const visible: string = harness.client.buffer.split(tab).join('|');
      expect(visible).assertEqual('a|b');
      expect(harness.client.buffer.split(tab).length).assertEqual(2);
      expect(harness.client.buffer.substring(2)).assertEqual('b');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremePayload_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_PAYLOAD_0008
     * @tc.name      testExtremePayload_008
     * @tc.desc      Verify that a six-thousand-unit alternating payload ends with the even-position glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testExtremePayload_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremePayload_008 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      let payload: string = '';
      for (let i = 0; i < 6145; i++) {
        payload = payload + (i % 2 === 0 ? 'Z' : 'c');
      }
      InputHandler.getInstance().insertText(payload);
      expect(harness.client.buffer.length).assertEqual(6145);
      expect(harness.client.buffer.charAt(0)).assertEqual('Z');
      expect(harness.client.buffer.charAt(6144)).assertEqual('Z');
      expect(harness.client.insertedTexts.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremePayload_008 end');
      await yieldToEventLoop();
    });

  });
}
