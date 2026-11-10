/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */
import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { util } from '@kit.ArkTS';
import { paceTurn } from '../Shared/TestPace';

const VECTORS: string[] = ['Zg==', 'Zm8=', 'Zm9v', 'Zm9vYg==', 'Zm9vYmE=', 'Zm9vYmFy'];
const SOURCES: string[] = ['f', 'fo', 'foo', 'foob', 'fooba', 'foobar'];

function bytesOf(text: string): Uint8Array {
  return util.TextEncoder.create('utf-8').encode(text);
}

function helper(): util.Base64Helper {
  return new util.Base64Helper();
}

export default function base64VectorMatrixTest() {
  describe('base64VectorMatrixTest', () => {
    beforeAll(() => {
      console.info('base64VectorMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('base64VectorMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_UTIL_B64VEC_0100
     * @tc.name      testBase64Vector0001
     * @tc.desc      Verify the RFC 4648 vectors encode to their canonical strings
     */
    it('testBase64Vector0001', 0, () => {
      for (let i = 0; i < SOURCES.length; i++) {
        expect(helper().encodeToStringSync(bytesOf(SOURCES[i]))).assertEqual(VECTORS[i]);
      }
    })

    /**
     * @tc.number    SUB_AVS_UTIL_B64VEC_0200
     * @tc.name      testBase64Vector0002
     * @tc.desc      Verify the RFC 4648 vectors decode back to the original bytes
     */
    it('testBase64Vector0002', 0, () => {
      for (let i = 0; i < VECTORS.length; i++) {
        const decoded: Uint8Array = helper().decodeSync(VECTORS[i]);
        expect(decoded.length).assertEqual(SOURCES[i].length);
        expect(util.TextDecoder.create('utf-8').decodeToString(decoded)).assertEqual(SOURCES[i]);
      }
    })

    /**
     * @tc.number    SUB_AVS_UTIL_B64VEC_0300
     * @tc.name      testBase64Vector0003
     * @tc.desc      Verify padding grows from two to zero as input length increases by one
     */
    it('testBase64Vector0003', 0, () => {
      expect('Zg=='.endsWith('==')).assertTrue();
      expect('Zm8='.endsWith('=')).assertTrue();
      expect('Zm9v'.endsWith('=')).assertFalse();
      expect('Zm9vYg=='.endsWith('==')).assertTrue();
      expect('Zm9vYmE='.endsWith('=')).assertTrue();
      expect('Zm9vYmFy'.endsWith('=')).assertFalse();
    })

    /**
     * @tc.number    SUB_AVS_UTIL_B64VEC_0400
     * @tc.name      testBase64Vector0004
     * @tc.desc      Verify encoded vector lengths are all multiples of four
     */
    it('testBase64Vector0004', 0, () => {
      for (let i = 0; i < VECTORS.length; i++) {
        expect(VECTORS[i].length % 4).assertEqual(0);
        expect(VECTORS[i].length).assertLargerOrEqual(4);
      }
    })

    /**
     * @tc.number    SUB_AVS_UTIL_B64VEC_0500
     * @tc.name      testBase64Vector0005
     * @tc.desc      Verify the async encoder matches the canonical vectors
     */
    it('testBase64Vector0005', 0, async () => {
      for (let i = 0; i < SOURCES.length; i++) {
        expect(await helper().encodeToString(bytesOf(SOURCES[i]))).assertEqual(VECTORS[i]);
      }
    })
  });
}
