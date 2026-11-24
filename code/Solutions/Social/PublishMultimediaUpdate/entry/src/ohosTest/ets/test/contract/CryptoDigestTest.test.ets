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
import util from '@ohos.util';
import Logger from '../Logger';
import { BUNDLE, TAG } from '../common/TestConstant';
import { yieldToEventLoop } from '../common/TestYield';
/**
 * Message digests produced through the crypto framework.
 * A shared payload is identified by a digest before it is uploaded, so the
 * digest must be stable, sensitive to every byte and identical whether the
 * text is fed at once or in chunks. The cases pin those properties against
 * published vectors for the algorithms the page can select.
 */
function toHex(bytes: Uint8Array): string {
  let text: string = '';
  for (let index: number = 0; index < bytes.length; index++) {
    const part: string = bytes[index].toString(16);
    text += part.length === 1 ? '0' + part : part;
  }
  return text;
}
async function digestOf(text: string, algorithm: string): Promise<string> {
  const encoder: util.TextEncoder = new util.TextEncoder('utf-8');
  const md: cryptoFramework.Md = cryptoFramework.createMd(algorithm);
  const chunk: cryptoFramework.DataBlob = { data: encoder.encodeInto(text) };
  await md.update(chunk);
  const result: cryptoFramework.DataBlob = await md.digest();
  return toHex(result.data);
}
export default function cryptoDigestTest() {
  describe('CryptoDigestTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DIGEST_0100
     * @tc.name Sha256AbcVector001
     * @tc.desc Verify the sha256 digest of the reference payload matches the published vector
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Sha256AbcVector_001', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'Sha256AbcVector_001 begin');
      const digest: string = await digestOf('abc', 'SHA256');
      expect(digest).assertEqual('ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad');
      Logger.info(TAG, 'Sha256AbcVector_001 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DIGEST_0200
     * @tc.name Sha256HexLength002
     * @tc.desc Verify the framework renders a sha256 digest as sixty four hex characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Sha256HexLength_002', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'Sha256HexLength_002 begin');
      const digest: string = await digestOf('publish', 'SHA256');
      expect(digest.length).assertEqual(64);
      Logger.info(TAG, 'Sha256HexLength_002 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DIGEST_0300
     * @tc.name SamePayloadSameDigest003
     * @tc.desc Verify two digest runs over one payload agree
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SamePayloadSameDigest_003', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'SamePayloadSameDigest_003 begin');
      const first: string = await digestOf('same body', 'SHA256');
      const second: string = await digestOf('same body', 'SHA256');
      expect(second).assertEqual(first);
      Logger.info(TAG, 'SamePayloadSameDigest_003 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DIGEST_0400
     * @tc.name ChangedByteChangesDigest004
     * @tc.desc Verify a single changed character produces a different digest
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ChangedByteChangesDigest_004', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'ChangedByteChangesDigest_004 begin');
      const first: string = await digestOf('same body', 'SHA256');
      const second: string = await digestOf('same bodY', 'SHA256');
      expect(first !== second).assertTrue();
      Logger.info(TAG, 'ChangedByteChangesDigest_004 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DIGEST_0500
     * @tc.name ChunkedUpdateMatchesOneShot005
     * @tc.desc Verify feeding two chunks equals feeding the joined payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ChunkedUpdateMatchesOneShot_005', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'ChunkedUpdateMatchesOneShot_005 begin');
      const encoder: util.TextEncoder = new util.TextEncoder('utf-8');
      const md: cryptoFramework.Md = cryptoFramework.createMd('SHA256');
      const first: cryptoFramework.DataBlob = { data: encoder.encodeInto('ab') };
      const second: cryptoFramework.DataBlob = { data: encoder.encodeInto('c') };
      await md.update(first);
      await md.update(second);
      const result: cryptoFramework.DataBlob = await md.digest();
      const oneShot: string = await digestOf('abc', 'SHA256');
      expect(toHex(result.data)).assertEqual(oneShot);
      Logger.info(TAG, 'ChunkedUpdateMatchesOneShot_005 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DIGEST_0600
     * @tc.name Sha1AbcVector006
     * @tc.desc Verify the sha1 digest of the reference payload matches the published vector
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Sha1AbcVector_006', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'Sha1AbcVector_006 begin');
      const digest: string = await digestOf('abc', 'SHA1');
      expect(digest.length).assertEqual(40);
      expect(digest).assertEqual('a9993e364706816aba3e25717850c26c9cd0d' + '89d');
      Logger.info(TAG, 'Sha1AbcVector_006 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DIGEST_0700
     * @tc.name Sha512HexLength007
     * @tc.desc Verify a sha512 digest occupies sixty four bytes of hex text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Sha512HexLength_007', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'Sha512HexLength_007 begin');
      const digest: string = await digestOf('publish', 'SHA512');
      const hexOnly: RegExp = new RegExp('^[0-9a-f]{128}$');
      expect(hexOnly.test(digest)).assertTrue();
      Logger.info(TAG, 'Sha512HexLength_007 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DIGEST_0800
     * @tc.name DigestIsLowercaseHex008
     * @tc.desc Verify the rendered digest uses lowercase hex digits only
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DigestIsLowercaseHex_008', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'DigestIsLowercaseHex_008 begin');
      const digest: string = await digestOf('lowercase probe', 'SHA256');
      expect(digest).assertEqual(digest.toLowerCase());
      Logger.info(TAG, 'DigestIsLowercaseHex_008 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DIGEST_0900
     * @tc.name CjkPayloadIsDeterministic009
     * @tc.desc Verify a CJK payload digests to the same value on every run
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'CjkPayloadIsDeterministic_009', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'CjkPayloadIsDeterministic_009 begin');
      const first: string = await digestOf('来杯香槟', 'SHA256');
      const second: string = await digestOf('来杯香槟', 'SHA256');
      expect(second).assertEqual(first);
      expect(first.length).assertEqual(64);
      Logger.info(TAG, 'CjkPayloadIsDeterministic_009 end');
      done();
    });
  });
}
