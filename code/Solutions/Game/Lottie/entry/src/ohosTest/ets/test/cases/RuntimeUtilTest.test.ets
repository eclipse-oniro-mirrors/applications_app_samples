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

import { describe, it, expect } from '@ohos/hypium';
import util from '@ohos.util';
import buffer from '@ohos.buffer';
import Logger from '../../utils/Logger';
import { BUNDLE, SuiteTag } from '../common/TestConstant';

const TAG: string = SuiteTag.RUNTIME;

/**
 * Runtime data helpers that the sample can use when it prepares animation
 * payloads. UUID, text encoding and buffer conversion are pure in memory
 * operations, so the suite is independent of the UI and of the file system.
 */
export default function runtimeUtilTest(): void {
  describe('LottieRuntimeUtilTest', (): void => {
    /**
     * @tc.number SUB_SAMPLE_LOTTIE_RUNTIME_0100
     * @tc.name uuidLength001
     * @tc.desc Verify a generated UUID uses the 36 character textual form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'uuidLength_001', 0, async (): Promise<void> => {
      Logger.info(TAG, 'uuidLength_001 begin');
      const uuid: string = util.generateRandomUUID(false);
      const check01: number = uuid.length;
      Logger.info(TAG, 'uuidLength_001, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual(36);
      Logger.info(TAG, 'uuidLength_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_RUNTIME_0200
     * @tc.name uuidHyphens002
     * @tc.desc Verify a generated UUID contains the four grouping hyphens
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'uuidHyphens_002', 0, async (): Promise<void> => {
      Logger.info(TAG, 'uuidHyphens_002 begin');
      const uuid: string = util.generateRandomUUID(false);
      let hyphens: number = 0;
      for (let i: number = 0; i < uuid.length; i++) {
        if (uuid.charAt(i) === '-') {
          hyphens++;
        }
      }
      const check01: number = hyphens;
      Logger.info(TAG, 'uuidHyphens_002, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual(4);
      Logger.info(TAG, 'uuidHyphens_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_RUNTIME_0300
     * @tc.name uuidVersion003
     * @tc.desc Verify a generated UUID declares version 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'uuidVersion_003', 0, async (): Promise<void> => {
      Logger.info(TAG, 'uuidVersion_003 begin');
      const uuid: string = util.generateRandomUUID(false);
      const check01: string = uuid.charAt(14);
      Logger.info(TAG, 'uuidVersion_003, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual('4');
      Logger.info(TAG, 'uuidVersion_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_RUNTIME_0400
     * @tc.name uuidVariant004
     * @tc.desc Verify a generated UUID carries one of the RFC 4122 variant nibbles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'uuidVariant_004', 0, async (): Promise<void> => {
      Logger.info(TAG, 'uuidVariant_004 begin');
      const uuid: string = util.generateRandomUUID(false);
      const nibble: string = uuid.charAt(19).toLowerCase();
      const check01: boolean = '89ab'.indexOf(nibble) >= 0;
      Logger.info(TAG, 'uuidVariant_004, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'uuidVariant_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_RUNTIME_0500
     * @tc.name uuidUnique005
     * @tc.desc Verify two generated UUIDs are different
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'uuidUnique_005', 0, async (): Promise<void> => {
      Logger.info(TAG, 'uuidUnique_005 begin');
      const first: string = util.generateRandomUUID(false);
      const second: string = util.generateRandomUUID(false);
      const check01: boolean = first !== second;
      Logger.info(TAG, 'uuidUnique_005, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'uuidUnique_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_RUNTIME_0600
     * @tc.name encoderAsciiLength006
     * @tc.desc Verify ASCII text encodes to one byte per character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'encoderAsciiLength_006', 0, async (): Promise<void> => {
      Logger.info(TAG, 'encoderAsciiLength_006 begin');
      const encoder: util.TextEncoder = new util.TextEncoder();
      const bytes: Uint8Array = encoder.encodeInto('Lottie');
      const check01: number = bytes.length;
      Logger.info(TAG, 'encoderAsciiLength_006, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual(6);
      Logger.info(TAG, 'encoderAsciiLength_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_RUNTIME_0700
     * @tc.name encoderChineseLength007
     * @tc.desc Verify two Chinese characters encode to six UTF-8 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'encoderChineseLength_007', 0, async (): Promise<void> => {
      Logger.info(TAG, 'encoderChineseLength_007 begin');
      const encoder: util.TextEncoder = new util.TextEncoder();
      const bytes: Uint8Array = encoder.encodeInto('动画');
      const check01: number = bytes.length;
      Logger.info(TAG, 'encoderChineseLength_007, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual(6);
      Logger.info(TAG, 'encoderChineseLength_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_RUNTIME_0800
     * @tc.name decoderAsciiRoundTrip008
     * @tc.desc Verify ASCII text survives encode and decode unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'decoderAsciiRoundTrip_008', 0, async (): Promise<void> => {
      Logger.info(TAG, 'decoderAsciiRoundTrip_008 begin');
      const encoder: util.TextEncoder = new util.TextEncoder();
      const decoder: util.TextDecoder = util.TextDecoder.create('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('Lottie');
      const text: string = decoder.decodeWithStream(bytes);
      const check01: string = text;
      Logger.info(TAG, 'decoderAsciiRoundTrip_008, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual('Lottie');
      Logger.info(TAG, 'decoderAsciiRoundTrip_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_RUNTIME_0900
     * @tc.name decoderChineseRoundTrip009
     * @tc.desc Verify Chinese text survives encode and decode unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'decoderChineseRoundTrip_009', 0, async (): Promise<void> => {
      Logger.info(TAG, 'decoderChineseRoundTrip_009 begin');
      const encoder: util.TextEncoder = new util.TextEncoder();
      const decoder: util.TextDecoder = util.TextDecoder.create('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('动画');
      const text: string = decoder.decodeWithStream(bytes);
      const check01: string = text;
      Logger.info(TAG, 'decoderChineseRoundTrip_009, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual('动画');
      Logger.info(TAG, 'decoderChineseRoundTrip_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_RUNTIME_1000
     * @tc.name bufferAsciiLength010
     * @tc.desc Verify an ASCII buffer reports one byte per character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferAsciiLength_010', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferAsciiLength_010 begin');
      const data: buffer.Buffer = buffer.from('Lottie');
      const check01: number = data.length;
      Logger.info(TAG, 'bufferAsciiLength_010, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual(6);
      Logger.info(TAG, 'bufferAsciiLength_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_RUNTIME_1100
     * @tc.name bufferChineseLength011
     * @tc.desc Verify a Chinese buffer reports three UTF-8 bytes per character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferChineseLength_011', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferChineseLength_011 begin');
      const data: buffer.Buffer = buffer.from('动画');
      const check01: number = data.length;
      Logger.info(TAG, 'bufferChineseLength_011, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual(6);
      Logger.info(TAG, 'bufferChineseLength_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_RUNTIME_1200
     * @tc.name bufferRoundTrip012
     * @tc.desc Verify a buffer converts back to the original text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferRoundTrip_012', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferRoundTrip_012 begin');
      const data: buffer.Buffer = buffer.from('Lottie');
      const text: string = data.toString('utf-8');
      const check01: string = text;
      Logger.info(TAG, 'bufferRoundTrip_012, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual('Lottie');
      Logger.info(TAG, 'bufferRoundTrip_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_RUNTIME_1300
     * @tc.name bufferByteLengthAscii013
     * @tc.desc Verify byteLength reports the ASCII payload size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferByteLengthAscii_013', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferByteLengthAscii_013 begin');
      const check01: number = buffer.byteLength('Lottie');
      Logger.info(TAG, 'bufferByteLengthAscii_013, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual(6);
      Logger.info(TAG, 'bufferByteLengthAscii_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_RUNTIME_1400
     * @tc.name bufferByteLengthChinese014
     * @tc.desc Verify byteLength reports three bytes per Chinese character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferByteLengthChinese_014', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferByteLengthChinese_014 begin');
      const check01: number = buffer.byteLength('动画');
      Logger.info(TAG, 'bufferByteLengthChinese_014, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual(6);
      Logger.info(TAG, 'bufferByteLengthChinese_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_RUNTIME_1500
     * @tc.name bufferSliceToString015
     * @tc.desc Verify a byte range converts back to the matching substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferSliceToString_015', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferSliceToString_015 begin');
      const data: buffer.Buffer = buffer.from('Lottie');
      const text: string = data.toString('utf-8', 0, 3);
      const check01: string = text;
      Logger.info(TAG, 'bufferSliceToString_015, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual('Lot');
      Logger.info(TAG, 'bufferSliceToString_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_RUNTIME_1600
     * @tc.name bufferFromEncoded016
     * @tc.desc Verify a buffer can be built from encoder output and decoded back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferFromEncoded_016', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferFromEncoded_016 begin');
      const encoder: util.TextEncoder = new util.TextEncoder();
      const bytes: Uint8Array = encoder.encodeInto('Lottie');
      const data: buffer.Buffer = buffer.from(bytes);
      const text: string = data.toString('utf-8');
      const check01: number = data.length;
      Logger.info(TAG, 'bufferFromEncoded_016, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual(6);
      const check02: string = text;
      Logger.info(TAG, 'bufferFromEncoded_016, check02=' + JSON.stringify(check02));
      expect(check02).assertEqual('Lottie');
      Logger.info(TAG, 'bufferFromEncoded_016 end');
    });
  });
}
