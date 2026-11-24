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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import util from '@ohos.util';
import Logger from '../Logger';
import { BUNDLE, TAG } from '../common/TestConstant';
import { yieldToEventLoop } from '../common/TestYield';
/**
 * Error handling options of the text decoder.
 * Bytes from a file or a socket may be truncated in the middle of a character.
 * The page can either accept the replacement character or reject the payload,
 * which is exactly the fatal option this suite pins.
 */
export default function decoderOptionTest() {
  describe('DecoderOptionTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DECOPT_0100
     * @tc.name EncodingGetterUtf8Kebab001
     * @tc.desc Verify the utf-8 decoder reports its encoding name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EncodingGetterUtf8Kebab_001', 0, (): void => {
      Logger.info(TAG, 'EncodingGetterUtf8Kebab_001 begin');
      const decoder: util.TextDecoder = util.TextDecoder.create('utf-8');
      expect(decoder.encoding.toLowerCase()).assertEqual('utf-8');
      Logger.info(TAG, 'EncodingGetterUtf8Kebab_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DECOPT_0200
     * @tc.name EncodingGetterUtf16Family002
     * @tc.desc Verify the utf-16 decoder reports a utf-16 family name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EncodingGetterUtf16Family_002', 0, (): void => {
      Logger.info(TAG, 'EncodingGetterUtf16Family_002 begin');
      const decoder: util.TextDecoder = util.TextDecoder.create('utf-16le');
      expect(decoder.encoding.toLowerCase().indexOf('utf-16') !== -1).assertTrue();
      Logger.info(TAG, 'EncodingGetterUtf16Family_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DECOPT_0300
     * @tc.name FatalRejectsBrokenByte003
     * @tc.desc Verify a fatal decoder rejects an invalid utf-8 byte
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FatalRejectsBrokenByte_003', 0, (): void => {
      Logger.info(TAG, 'FatalRejectsBrokenByte_003 begin');
      const options: util.TextDecoderOptions = { fatal: true };
      const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', options);
      const invalid: Uint8Array = new Uint8Array([0xFF]);
      let rejected: boolean = false;
      try {
        decoder.decodeToString(invalid);
      }
      catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
      Logger.info(TAG, 'FatalRejectsBrokenByte_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DECOPT_0400
     * @tc.name TolerantReplacesBrokenByte004
     * @tc.desc Verify a tolerant decoder returns one replacement character
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TolerantReplacesBrokenByte_004', 0, (): void => {
      Logger.info(TAG, 'TolerantReplacesBrokenByte_004 begin');
      const options: util.TextDecoderOptions = { fatal: false };
      const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', options);
      const decoded: string = decoder.decodeToString(new Uint8Array([0xFF]));
      expect(decoded.length).assertEqual(1);
      Logger.info(TAG, 'TolerantReplacesBrokenByte_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DECOPT_0500
     * @tc.name EmptyInputEmptyText005
     * @tc.desc Verify decoding zero bytes yields an empty string
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyInputEmptyText_005', 0, (): void => {
      Logger.info(TAG, 'EmptyInputEmptyText_005 begin');
      const decoder: util.TextDecoder = util.TextDecoder.create('utf-8');
      expect(decoder.decodeToString(new Uint8Array(0))).assertEqual('');
      Logger.info(TAG, 'EmptyInputEmptyText_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DECOPT_0600
     * @tc.name EmojiPayloadRoundTrip006
     * @tc.desc Verify an emoji survives an encode and decode cycle with options
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmojiPayloadRoundTrip_006', 0, (): void => {
      Logger.info(TAG, 'EmojiPayloadRoundTrip_006 begin');
      const encoder: util.TextEncoder = new util.TextEncoder('utf-8');
      const options: util.TextDecoderOptions = { fatal: true, ignoreBOM: false };
      const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', options);
      const text: string = 'caption 😊';
      expect(decoder.decodeToString(encoder.encodeInto(text))).assertEqual(text);
      Logger.info(TAG, 'EmojiPayloadRoundTrip_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DECOPT_0700
     * @tc.name DecoderReuseIsStable007
     * @tc.desc Verify decoding the same bytes twice through one decoder is stable
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DecoderReuseIsStable_007', 0, (): void => {
      Logger.info(TAG, 'DecoderReuseIsStable_007 begin');
      const decoder: util.TextDecoder = util.TextDecoder.create('utf-8');
      const bytes: Uint8Array = new Uint8Array([0x70, 0x75, 0x62]);
      expect(decoder.decodeToString(bytes)).assertEqual(decoder.decodeToString(bytes));
      Logger.info(TAG, 'DecoderReuseIsStable_007 end');
    });
  });
}
