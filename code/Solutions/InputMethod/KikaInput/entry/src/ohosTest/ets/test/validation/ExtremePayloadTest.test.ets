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
import { InputHandler } from '../../../../main/ets/model/KeyboardController';
import { ClientHarness, createClientHarness } from '../support/ClientHarness';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputExtremePayload]';

export default function extremePayloadTest(): void {
  describe('ExtremePayloadTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_EXTREME_PAYLOAD_0100
     * @tc.name      testExtremePayload_001
     * @tc.desc      Verify that a three-letter payload is one command followed by a three-unit deletion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremePayload_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremePayload_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().insertText('abc');
      InputHandler.getInstance().deleteBackward(3);
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.backwardLengths[0]).assertEqual(3);
      expect(harness.client.journal.join('|')).assertEqual('insert:abc|back:3');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremePayload_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EXTREME_PAYLOAD_0200
     * @tc.name      testExtremePayload_002
     * @tc.desc      Verify that a sixteen-character symbol payload keeps both boundary glyphs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremePayload_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremePayload_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().insertText('@#$%&-+()/*":;!?');
      expect(harness.client.insertedTexts[0].length).assertEqual(16);
      expect(harness.client.insertedTexts[0].charAt(0)).assertEqual('@');
      expect(harness.client.insertedTexts[0].charAt(15)).assertEqual('?');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremePayload_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EXTREME_PAYLOAD_0300
     * @tc.name      testExtremePayload_003
     * @tc.desc      Verify that a two-hundred-fifty-seven CJK payload keeps its unit count.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremePayload_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremePayload_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      let payload: string = '';
      for (let i = 0; i < 257; i++) {
        payload = payload + '中';
      }
      InputHandler.getInstance().insertText(payload);
      expect(harness.client.insertedTexts[0].length).assertEqual(257);
      expect(harness.client.insertedTexts[0].charCodeAt(0)).assertEqual(20013);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremePayload_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EXTREME_PAYLOAD_0400
     * @tc.name      testExtremePayload_004
     * @tc.desc      Verify that a one-thousand-twenty-three payload supports an equal deletion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremePayload_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremePayload_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      let payload: string = '';
      for (let i = 0; i < 1023; i++) {
        payload = payload + 'x';
      }
      InputHandler.getInstance().insertText(payload);
      InputHandler.getInstance().deleteBackward(1023);
      expect(harness.client.insertedTexts[0].length).assertEqual(1023);
      expect(harness.client.backwardLengths[0]).assertEqual(1023);
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremePayload_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EXTREME_PAYLOAD_0500
     * @tc.name      testExtremePayload_005
     * @tc.desc      Verify that a payload mixing letters and emoji keeps one insertion command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremePayload_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremePayload_005 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      let payload: string = '';
      for (let i = 0; i < 1000; i++) {
        payload = payload + 'a😀';
      }
      InputHandler.getInstance().insertText(payload);
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.insertedTexts[0].length).assertEqual(payload.length);
      expect(harness.client.insertedTexts[0].length).assertEqual(3000);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremePayload_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EXTREME_PAYLOAD_0600
     * @tc.name      testExtremePayload_006
     * @tc.desc      Verify that a lone low surrogate is forwarded as one code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremePayload_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremePayload_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const lone: string = String.fromCharCode(56832);
      InputHandler.getInstance().insertText(lone);
      const stored: string = harness.client.insertedTexts[0];
      const units: number[] = [stored.length, stored.charCodeAt(0), stored.charCodeAt(stored.length - 1)];
      expect(units.join(',')).assertEqual('1,56832,56832');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremePayload_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EXTREME_PAYLOAD_0700
     * @tc.name      testExtremePayload_007
     * @tc.desc      Verify that an embedded CRLF payload keeps its four code units.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremePayload_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremePayload_007 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().insertText('a\r\nb');
      expect(harness.client.insertedTexts[0].length).assertEqual(4);
      expect(harness.client.insertedTexts[0].indexOf('\r')).assertEqual(1);
      expect(harness.client.insertedTexts[0].indexOf('\n')).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremePayload_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EXTREME_PAYLOAD_0800
     * @tc.name      testExtremePayload_008
     * @tc.desc      Verify that an eight-thousand-unit alternating payload stays one command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testExtremePayload_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremePayload_008 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      let payload: string = '';
      for (let i = 0; i < 8193; i++) {
        payload = payload + (i % 2 === 0 ? 'A' : 'b');
      }
      InputHandler.getInstance().insertText(payload);
      expect(harness.client.insertedTexts[0].length).assertEqual(8193);
      expect(harness.client.insertedTexts[0].charAt(0)).assertEqual('A');
      expect(harness.client.insertedTexts[0].charAt(8192)).assertEqual('A');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremePayload_008 end');
      await yieldToEventLoop();
    });

  });
}
