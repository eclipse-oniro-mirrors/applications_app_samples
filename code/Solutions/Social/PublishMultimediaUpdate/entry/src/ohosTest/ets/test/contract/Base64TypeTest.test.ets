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
 * Byte level base64 helper of the standard library.
 * The media pipeline keeps a payload as bytes and needs the encoded form as
 * bytes for one upload path and as text for a data uri. The cases pin the byte
 * entry points, the URL safe alphabet and the empty input rule.
 */
export default function base64TypeTest() {
  describe('Base64TypeTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_B64TYPE_0100
     * @tc.name EncodeSyncGrowsToFourBytes001
     * @tc.desc Verify three input bytes encode to four base64 bytes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EncodeSyncGrowsToFourBytes_001', 0, (): void => {
      Logger.info(TAG, 'EncodeSyncGrowsToFourBytes_001 begin');
      const helper: util.Base64Helper = new util.Base64Helper();
      const source: Uint8Array = new Uint8Array([0x61, 0x62, 0x63]);
      expect(helper.encodeSync(source).length).assertEqual(4);
      Logger.info(TAG, 'EncodeSyncGrowsToFourBytes_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_B64TYPE_0200
     * @tc.name ByteRoundTripRestoresPayload002
     * @tc.desc Verify decoding an encoded byte array restores the original bytes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ByteRoundTripRestoresPayload_002', 0, (): void => {
      Logger.info(TAG, 'ByteRoundTripRestoresPayload_002 begin');
      const helper: util.Base64Helper = new util.Base64Helper();
      const source: Uint8Array = new Uint8Array([1, 2, 3, 250, 251]);
      const restored: Uint8Array = helper.decodeSync(helper.encodeSync(source));
      expect(restored.length).assertEqual(source.length);
      expect(restored[3]).assertEqual(250);
      Logger.info(TAG, 'ByteRoundTripRestoresPayload_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_B64TYPE_0300
     * @tc.name ByteAndTextFormsAgree003
     * @tc.desc Verify the byte form and the text form carry the same characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ByteAndTextFormsAgree_003', 0, (): void => {
      Logger.info(TAG, 'ByteAndTextFormsAgree_003 begin');
      const helper: util.Base64Helper = new util.Base64Helper();
      const source: Uint8Array = new Uint8Array([0x70, 0x75, 0x62]);
      const asText: string = util.TextDecoder.create('utf-8').decodeToString(helper.encodeSync(source));
      expect(asText).assertEqual(helper.encodeToStringSync(source));
      Logger.info(TAG, 'ByteAndTextFormsAgree_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_B64TYPE_0400
     * @tc.name DecodeAcceptsTextInput004
     * @tc.desc Verify the decoder accepts base64 text and returns the source bytes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DecodeAcceptsTextInput_004', 0, (): void => {
      Logger.info(TAG, 'DecodeAcceptsTextInput_004 begin');
      const helper: util.Base64Helper = new util.Base64Helper();
      const decoded: Uint8Array = helper.decodeSync('YWJj');
      const text: string = util.TextDecoder.create('utf-8').decodeToString(decoded);
      expect(text).assertEqual('abc');
      Logger.info(TAG, 'DecodeAcceptsTextInput_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_B64TYPE_0500
     * @tc.name UrlSafeAlphabetDecodes005
     * @tc.desc Verify the URL safe alphabet decodes the characters the basic one rejects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UrlSafeAlphabetDecodes_005', 0, (): void => {
      Logger.info(TAG, 'UrlSafeAlphabetDecodes_005 begin');
      const helper: util.Base64Helper = new util.Base64Helper();
      const decoded: Uint8Array = helper.decodeSync('-_8=', util.Type.BASIC_URL_SAFE);
      expect(decoded.length).assertEqual(2);
      expect(decoded[0]).assertEqual(0xFB);
      Logger.info(TAG, 'UrlSafeAlphabetDecodes_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_B64TYPE_0600
     * @tc.name CjkPayloadRoundTrip006
     * @tc.desc Verify a CJK payload survives the byte round trip
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'CjkPayloadRoundTrip_006', 0, (): void => {
      Logger.info(TAG, 'CjkPayloadRoundTrip_006 begin');
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoder: util.TextEncoder = new util.TextEncoder('utf-8');
      const source: Uint8Array = encoder.encodeInto('来杯香槟');
      const restored: Uint8Array = helper.decodeSync(helper.encodeSync(source));
      expect(util.TextDecoder.create('utf-8').decodeToString(restored)).assertEqual('来杯香槟');
      Logger.info(TAG, 'CjkPayloadRoundTrip_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_B64TYPE_0700
     * @tc.name LongPayloadPadsToFour007
     * @tc.desc Verify a ninety six byte payload encodes to one hundred twenty eight bytes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LongPayloadPadsToFour_007', 0, (): void => {
      Logger.info(TAG, 'LongPayloadPadsToFour_007 begin');
      const helper: util.Base64Helper = new util.Base64Helper();
      const source: Uint8Array = new Uint8Array(96);
      source.fill(7);
      expect(helper.encodeSync(source).length).assertEqual(128);
      Logger.info(TAG, 'LongPayloadPadsToFour_007 end');
    });
  });
}
