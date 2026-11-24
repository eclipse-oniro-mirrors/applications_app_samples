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
import cryptoFramework from '@ohos.security.cryptoFramework';
import Logger from '../Logger';
import { BUNDLE, TAG } from '../common/TestConstant';
import { yieldToEventLoop } from '../common/TestYield';
/**
 * Random bytes produced through the crypto framework.
 * A draft file name or a temporary token needs bytes that nobody can predict,
 * so the generator must honour the requested length and never hand back a
 * constant payload. The cases pin the length and the variation between draws.
 */
function allZero(bytes: Uint8Array): boolean {
  let zeros: number = 0;
  for (let index: number = 0; index < bytes.length; index++) {
    if (bytes[index] === 0) {
      zeros += 1;
    }
  }
  return zeros === bytes.length;
}
function sameBytes(first: Uint8Array, second: Uint8Array): boolean {
  if (first.length !== second.length) {
    return false;
  }
  let mismatched: number = 0;
  for (let index: number = 0; index < first.length; index++) {
    if (first[index] !== second[index]) {
      mismatched += 1;
    }
  }
  return mismatched === 0;
}
export default function cryptoRandomTest() {
  describe('CryptoRandomTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_RANDOM_0100
     * @tc.name SixteenBytesRequested001
     * @tc.desc Verify the generator returns the requested number of bytes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SixteenBytesRequested_001', 0, (): void => {
      Logger.info(TAG, 'SixteenBytesRequested_001 begin');
      const random: cryptoFramework.Random = cryptoFramework.createRandom();
      const result: cryptoFramework.DataBlob = random.generateRandomSync(16);
      expect(result.data.length).assertEqual(16);
      Logger.info(TAG, 'SixteenBytesRequested_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_RANDOM_0200
     * @tc.name SingleByteRequested002
     * @tc.desc Verify a one byte request is honoured
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SingleByteRequested_002', 0, (): void => {
      Logger.info(TAG, 'SingleByteRequested_002 begin');
      const random: cryptoFramework.Random = cryptoFramework.createRandom();
      const result: cryptoFramework.DataBlob = random.generateRandomSync(1);
      expect(result.data.byteLength).assertEqual(1);
      Logger.info(TAG, 'SingleByteRequested_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_RANDOM_0300
     * @tc.name PayloadIsNotAllZero003
     * @tc.desc Verify a sixteen byte draw is not a constant zero payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PayloadIsNotAllZero_003', 0, (): void => {
      Logger.info(TAG, 'PayloadIsNotAllZero_003 begin');
      const random: cryptoFramework.Random = cryptoFramework.createRandom();
      const result: cryptoFramework.DataBlob = random.generateRandomSync(16);
      expect(allZero(result.data)).assertFalse();
      Logger.info(TAG, 'PayloadIsNotAllZero_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_RANDOM_0400
     * @tc.name TwoDrawsDiffer004
     * @tc.desc Verify two draws of the same length are not identical
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TwoDrawsDiffer_004', 0, (): void => {
      Logger.info(TAG, 'TwoDrawsDiffer_004 begin');
      const random: cryptoFramework.Random = cryptoFramework.createRandom();
      const first: cryptoFramework.DataBlob = random.generateRandomSync(16);
      const second: cryptoFramework.DataBlob = random.generateRandomSync(16);
      expect(sameBytes(first.data, second.data)).assertFalse();
      Logger.info(TAG, 'TwoDrawsDiffer_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_RANDOM_0500
     * @tc.name PayloadIsByteArray005
     * @tc.desc Verify the payload is a byte array whose length matches its capacity
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PayloadIsByteArray_005', 0, (): void => {
      Logger.info(TAG, 'PayloadIsByteArray_005 begin');
      const random: cryptoFramework.Random = cryptoFramework.createRandom();
      const result: cryptoFramework.DataBlob = random.generateRandomSync(8);
      expect(result.data.byteLength).assertEqual(result.data.length);
      Logger.info(TAG, 'PayloadIsByteArray_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_RANDOM_0600
     * @tc.name LongerRequestReturnsMore006
     * @tc.desc Verify a longer request returns a longer payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LongerRequestReturnsMore_006', 0, (): void => {
      Logger.info(TAG, 'LongerRequestReturnsMore_006 begin');
      const random: cryptoFramework.Random = cryptoFramework.createRandom();
      const small: cryptoFramework.DataBlob = random.generateRandomSync(8);
      const large: cryptoFramework.DataBlob = random.generateRandomSync(64);
      expect(large.data.length > small.data.length).assertTrue();
      Logger.info(TAG, 'LongerRequestReturnsMore_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_RANDOM_0700
     * @tc.name RepeatedLengthsAgree007
     * @tc.desc Verify repeated requests of one length keep that length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RepeatedLengthsAgree_007', 0, (): void => {
      Logger.info(TAG, 'RepeatedLengthsAgree_007 begin');
      const random: cryptoFramework.Random = cryptoFramework.createRandom();
      const first: cryptoFramework.DataBlob = random.generateRandomSync(32);
      const second: cryptoFramework.DataBlob = random.generateRandomSync(32);
      expect(second.data.length).assertEqual(first.data.length);
      Logger.info(TAG, 'RepeatedLengthsAgree_007 end');
    });
  });
}
