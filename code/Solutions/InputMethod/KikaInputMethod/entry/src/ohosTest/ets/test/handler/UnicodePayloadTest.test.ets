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
import { createPreviewHarness, PreviewHarness } from '../support/PreviewHarness';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodUnicodePayload]';

export default function unicodePayloadTest(): void {
  describe('UnicodePayloadTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_UNICODE_PAYLOAD_0001
     * @tc.name      testUnicodePayloadTest_001
     * @tc.desc      Verify that a NUL payload is forwarded as one code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testUnicodePayloadTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUnicodePayloadTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const payload: string = String.fromCharCode(0);
      InputHandler.getInstance().insertText(payload);
      expect(harness.client.insertedTexts[0].length).assertEqual(1);
      expect(harness.client.buffer.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUnicodePayloadTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_UNICODE_PAYLOAD_0002
     * @tc.name      testUnicodePayloadTest_002
     * @tc.desc      Verify that CRLF is preserved as two code units.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testUnicodePayloadTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUnicodePayloadTest_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('\r\n');
      expect(harness.client.insertedTexts[0].length).assertEqual(2);
      expect(harness.client.buffer.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUnicodePayloadTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_UNICODE_PAYLOAD_0003
     * @tc.name      testUnicodePayloadTest_003
     * @tc.desc      Verify that Arabic text keeps its code-unit count.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testUnicodePayloadTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUnicodePayloadTest_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('نص');
      expect(harness.client.insertedTexts[0].length).assertEqual(2);
      expect(harness.client.buffer).assertEqual('نص');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUnicodePayloadTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_UNICODE_PAYLOAD_0004
     * @tc.name      testUnicodePayloadTest_004
     * @tc.desc      Verify that a zero-width space survives as one invisible code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testUnicodePayloadTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUnicodePayloadTest_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText(String.fromCharCode(8203));
      expect(harness.client.insertedTexts[0].length).assertEqual(1);
      expect(harness.client.buffer.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUnicodePayloadTest_004 end');
      await yieldToEventLoop();
    });

  });

}
