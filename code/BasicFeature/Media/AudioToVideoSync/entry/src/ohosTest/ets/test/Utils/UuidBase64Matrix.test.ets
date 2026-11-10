/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */
import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { util } from '@kit.ArkTS';
import { paceTurn } from '../Shared/TestPace';

const UUID_LENGTH: number = 36;
const BINARY_UUID_LENGTH: number = 16;
const HYPHEN_POSITIONS: number[] = [8, 13, 18, 23];
const UUID_PATTERN: RegExp = /^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/;

function bytesOf(text: string): Uint8Array {
  return util.TextEncoder.create('utf-8').encode(text);
}

function base64(): util.Base64Helper {
  return new util.Base64Helper();
}

export default function uuidBase64MatrixTest() {
  describe('uuidBase64MatrixTest', () => {
    beforeAll(() => {
      console.info('uuidBase64MatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('uuidBase64MatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_UTIL_UUID_0100
     * @tc.name      testUuid0001
     * @tc.desc      Verify a generated UUID has the canonical thirty-six character shape
     */
    it('testUuid0001', 0, () => {
      const value: string = util.generateRandomUUID(false);
      expect(value.length).assertEqual(UUID_LENGTH);
      for (let i = 0; i < HYPHEN_POSITIONS.length; i++) {
        expect(value.charAt(HYPHEN_POSITIONS[i])).assertEqual('-');
      }
    })

    /**
     * @tc.number    SUB_AVS_UTIL_UUID_0200
     * @tc.name      testUuid0002
     * @tc.desc      Verify the generated UUID is a version four RFC 4122 identifier
     */
    it('testUuid0002', 0, () => {
      const value: string = util.generateRandomUUID(false);
      expect(value.charAt(14)).assertEqual('4');
      expect('89ab'.indexOf(value.charAt(19).toLowerCase()) >= 0).assertTrue();
      expect(UUID_PATTERN.test(value)).assertTrue();
    })

    /**
     * @tc.number    SUB_AVS_UTIL_UUID_0300
     * @tc.name      testUuid0003
     * @tc.desc      Verify one hundred generated UUIDs are all unique
     */
    it('testUuid0003', 0, () => {
      const seen: Set<string> = new Set<string>();
      for (let i = 0; i < 100; i++) {
        seen.add(util.generateRandomUUID(false));
      }
      expect(seen.size).assertEqual(100);
    })

    /**
     * @tc.number    SUB_AVS_UTIL_UUID_0400
     * @tc.name      testUuid0004
     * @tc.desc      Verify the cached and uncached UUID generators both produce valid identifiers
     */
    it('testUuid0004', 0, () => {
      const cached: string = util.generateRandomUUID(true);
      const uncached: string = util.generateRandomUUID(false);
      expect(UUID_PATTERN.test(cached)).assertTrue();
      expect(UUID_PATTERN.test(uncached)).assertTrue();
      expect(cached === uncached).assertFalse();
    })

    /**
     * @tc.number    SUB_AVS_UTIL_UUID_0500
     * @tc.name      testUuid0005
     * @tc.desc      Verify a binary UUID contains exactly sixteen bytes
     */
    it('testUuid0005', 0, () => {
      const binary: Uint8Array = util.generateRandomBinaryUUID(false);
      expect(binary.length).assertEqual(BINARY_UUID_LENGTH);
      let nonZero: number = 0;
      for (let i = 0; i < binary.length; i++) {
        if (binary[i] !== 0) {
          nonZero++;
        }
      }
      expect(nonZero).assertLarger(0);
    })

    /**
     * @tc.number    SUB_AVS_UTIL_UUID_0600
     * @tc.name      testUuid0006
     * @tc.desc      Verify fifty binary UUIDs are all unique
     */
    it('testUuid0006', 0, () => {
      const seen: Set<string> = new Set<string>();
      for (let i = 0; i < 50; i++) {
        const binary: Uint8Array = util.generateRandomBinaryUUID(false);
        let key: string = '';
        for (let j = 0; j < binary.length; j++) {
          key += binary[j].toString(16);
        }
        seen.add(key);
      }
      expect(seen.size).assertEqual(50);
    })

    /**
     * @tc.number    SUB_AVS_UTIL_UUID_0700
     * @tc.name      testUuid0007
     * @tc.desc      Verify the binary UUID version nibble is four
     */
    it('testUuid0007', 0, () => {
      const binary: Uint8Array = util.generateRandomBinaryUUID(false);
      expect(binary[6] >= 64).assertTrue();
      expect(binary[6] <= 79).assertTrue();
      expect(binary[8] >= 128).assertTrue();
      expect(binary[8] <= 191).assertTrue();
    })

    /**
     * @tc.number    SUB_AVS_UTIL_BASE64_0100
     * @tc.name      testBase64_0001
     * @tc.desc      Verify encoding abc yields the canonical YWJj string
     */
    it('testBase64_0001', 0, () => {
      expect(base64().encodeToStringSync(bytesOf('abc'))).assertEqual('YWJj');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_BASE64_0200
     * @tc.name      testBase64_0002
     * @tc.desc      Verify decoding YWJj restores the three ASCII bytes
     */
    it('testBase64_0002', 0, () => {
      const decoded: Uint8Array = base64().decodeSync('YWJj');
      expect(decoded.length).assertEqual(3);
      expect(decoded[0]).assertEqual(97);
      expect(decoded[1]).assertEqual(98);
      expect(decoded[2]).assertEqual(99);
    })

    /**
     * @tc.number    SUB_AVS_UTIL_BASE64_0300
     * @tc.name      testBase64_0003
     * @tc.desc      Verify hello encodes to the canonical base64 string with padding
     */
    it('testBase64_0003', 0, () => {
      const encoded: string = base64().encodeToStringSync(bytesOf('hello'));
      expect(encoded).assertEqual('aGVsbG8=');
      expect(encoded.endsWith('=')).assertTrue();
    })

    /**
     * @tc.number    SUB_AVS_UTIL_BASE64_0400
     * @tc.name      testBase64_0004
     * @tc.desc      Verify base64 round-trips payloads of several sizes
     */
    it('testBase64_0004', 0, () => {
      const sizes: number[] = [1, 3, 16, 256];
      for (let i = 0; i < sizes.length; i++) {
        let text: string = '';
        for (let j = 0; j < sizes[i]; j++) {
          text += 'x';
        }
        const encoded: string = base64().encodeToStringSync(bytesOf(text));
        const decoded: Uint8Array = base64().decodeSync(encoded);
        expect(decoded.length).assertEqual(sizes[i]);
        expect(util.TextDecoder.create('utf-8').decodeToString(decoded)).assertEqual(text);
      }
    })

    /**
     * @tc.number    SUB_AVS_UTIL_BASE64_0500
     * @tc.name      testBase64_0005
     * @tc.desc      Verify the asynchronous base64 round-trip matches the synchronous one
     */
    it('testBase64_0005', 0, async () => {
      const helper: util.Base64Helper = base64();
      const text: string = 'async-encode';
      const encoded: string = await helper.encodeToString(bytesOf(text));
      expect(encoded).assertEqual(helper.encodeToStringSync(bytesOf(text)));
      const decoded: Uint8Array = await helper.decode(encoded);
      expect(util.TextDecoder.create('utf-8').decodeToString(decoded)).assertEqual(text);
    })

    /**
     * @tc.number    SUB_AVS_UTIL_BASE64_0600
     * @tc.name      testBase64_0006
     * @tc.desc      Verify binary boundary bytes survive a base64 round-trip
     */
    it('testBase64_0006', 0, () => {
      const source: Uint8Array = new Uint8Array([0, 1, 127, 128, 254, 255]);
      const encoded: string = base64().encodeToStringSync(source);
      const decoded: Uint8Array = base64().decodeSync(encoded);
      expect(decoded.length).assertEqual(source.length);
      for (let i = 0; i < source.length; i++) {
        expect(decoded[i]).assertEqual(source[i]);
      }
    })

    /**
     * @tc.number    SUB_AVS_UTIL_BASE64_0700
     * @tc.name      testBase64_0007
     * @tc.desc      Verify encoded output length is a multiple of four for the basic alphabet
     */
    it('testBase64_0007', 0, () => {
      const samples: string[] = ['a', 'ab', 'abc', 'abcd', 'abcde'];
      for (let i = 0; i < samples.length; i++) {
        const encoded: string = base64().encodeToStringSync(bytesOf(samples[i]));
        expect(encoded.length % 4).assertEqual(0);
      }
    })
  });
}
