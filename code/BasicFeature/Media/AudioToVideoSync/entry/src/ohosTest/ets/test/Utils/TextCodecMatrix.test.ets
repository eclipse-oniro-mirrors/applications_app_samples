/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */
import { TestType, Size, Level } from '@ohos/hypium';
import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { util } from '@kit.ArkTS';
import { paceTurn } from '../Shared/TestPace';

function encode(text: string): Uint8Array {
  return util.TextEncoder.create('utf-8').encode(text);
}

function decode(bytes: Uint8Array): string {
  return util.TextDecoder.create('utf-8').decodeToString(bytes);
}

export default function textCodecMatrixTest() {
  describe('textCodecMatrixTest', () => {
    beforeAll(() => {
      console.info('textCodecMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('textCodecMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_UTIL_CODEC_0100
     * @tc.name      testTextCodec0001
     * @tc.desc      Verify ASCII text round-trips through UTF-8 encode and decode
     */
    it('testTextCodec0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const text: string = 'audio-video-sync';
      const bytes: Uint8Array = encode(text);
      expect(bytes.length).assertEqual(text.length);
      expect(decode(bytes)).assertEqual(text);
    })

    /**
     * @tc.number    SUB_AVS_UTIL_CODEC_0200
     * @tc.name      testTextCodec0002
     * @tc.desc      Verify four CJK characters occupy twelve UTF-8 bytes
     */
    it('testTextCodec0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const text: string = '音画同步';
      const bytes: Uint8Array = encode(text);
      expect(bytes.length).assertEqual(12);
      expect(decode(bytes)).assertEqual(text);
    })

    /**
     * @tc.number    SUB_AVS_UTIL_CODEC_0300
     * @tc.name      testTextCodec0003
     * @tc.desc      Verify an emoji occupies four UTF-8 bytes and round-trips
     */
    it('testTextCodec0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const text: string = '🎬';
      const bytes: Uint8Array = encode(text);
      expect(bytes.length).assertEqual(4);
      expect(decode(bytes)).assertEqual(text);
    })

    /**
     * @tc.number    SUB_AVS_UTIL_CODEC_0400
     * @tc.name      testTextCodec0004
     * @tc.desc      Verify an accented Latin payload keeps five UTF-8 bytes
     */
    it('testTextCodec0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const text: string = 'café';
      expect(encode(text).length).assertEqual(5);
      expect(decode(encode(text))).assertEqual(text);
    })

    /**
     * @tc.number    SUB_AVS_UTIL_CODEC_0500
     * @tc.name      testTextCodec0005
     * @tc.desc      Verify a long repeated ASCII payload round-trips with the exact length
     */
    it('testTextCodec0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let text: string = '';
      for (let i = 0; i < 1024; i++) {
        text += 'a';
      }
      const bytes: Uint8Array = encode(text);
      expect(bytes.length).assertEqual(1024);
      expect(decode(bytes).length).assertEqual(1024);
    })

    /**
     * @tc.number    SUB_AVS_UTIL_CODEC_0600
     * @tc.name      testTextCodec0006
     * @tc.desc      Verify the encoder reports the same byte length as the decoder input
     */
    it('testTextCodec0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const samples: string[] = ['a', 'abc', '中文', 'sync音画', '😀'];
      for (let i = 0; i < samples.length; i++) {
        const bytes: Uint8Array = encode(samples[i]);
        expect(bytes.length).assertLarger(0);
        expect(decode(bytes)).assertEqual(samples[i]);
      }
    })

    /**
     * @tc.number    SUB_AVS_UTIL_CODEC_0700
     * @tc.name      testTextCodec0007
     * @tc.desc      Verify the default decoder encoding matches the explicit UTF-8 decoder
     */
    it('testTextCodec0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bytes: Uint8Array = encode('默认编码');
      const explicit: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      const implicit: string = util.TextDecoder.create().decodeToString(bytes);
      expect(implicit).assertEqual(explicit);
      expect(implicit).assertEqual('默认编码');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_CODEC_0800
     * @tc.name      testTextCodec0008
     * @tc.desc      Verify the decoded text has the same code unit length as the source
     */
    it('testTextCodec0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const text: string = 'a音画😀';
      const restored: string = decode(encode(text));
      expect(restored.length).assertEqual(text.length);
      expect(restored.charAt(0)).assertEqual('a');
      expect(restored.startsWith('a音画')).assertTrue();
    })

    /**
     * @tc.number    SUB_AVS_UTIL_CODEC_0900
     * @tc.name      testTextCodec0009
     * @tc.desc      Verify repeated encode and decode cycles are idempotent
     */
    it('testTextCodec0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const text: string = 'repeat-codec';
      for (let i = 0; i < 10; i++) {
        expect(decode(encode(text))).assertEqual(text);
      }
    })

    /**
     * @tc.number    SUB_AVS_UTIL_CODEC_1000
     * @tc.name      testTextCodec0010
     * @tc.desc      Verify distinct scripts produce distinct byte sequences of the expected lengths
     */
    it('testTextCodec0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latin: Uint8Array = encode('abc');
      const cjk: Uint8Array = encode('中');
      const emoji: Uint8Array = encode('😀');
      expect(latin.length).assertEqual(3);
      expect(cjk.length).assertEqual(3);
      expect(emoji.length).assertEqual(4);
      expect(latin[0] === cjk[0]).assertFalse();
    })
  });
}
