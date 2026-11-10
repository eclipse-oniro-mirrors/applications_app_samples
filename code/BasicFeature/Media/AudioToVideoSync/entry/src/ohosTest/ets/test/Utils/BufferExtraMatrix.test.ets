/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */
import { TestType, Size, Level } from '@ohos/hypium';
import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { buffer } from '@kit.ArkTS';
import { paceTurn } from '../Shared/TestPace';

export default function bufferExtraMatrixTest() {
  describe('bufferExtraMatrixTest', () => {
    beforeAll(() => {
      console.info('bufferExtraMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('bufferExtraMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_UTIL_BUFFER_X_0100
     * @tc.name      testBufferExtra0001
     * @tc.desc      Verify a buffer created from an ArrayBuffer preserves its bytes
     */
    it('testBufferExtra0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: Uint8Array = new Uint8Array([65, 66]);
      const value: buffer.Buffer = buffer.from(source.buffer);
      expect(value.length).assertEqual(2);
      expect(value.toString()).assertEqual('AB');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_BUFFER_X_0200
     * @tc.name      testBufferExtra0002
     * @tc.desc      Verify base64 rendering of a buffer matches the canonical vector
     */
    it('testBufferExtra0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(buffer.from('abc').toString('base64')).assertEqual('YWJj');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_BUFFER_X_0300
     * @tc.name      testBufferExtra0003
     * @tc.desc      Verify byteLength of a buffer equals its length
     */
    it('testBufferExtra0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.from('音画');
      expect(value.length).assertEqual(6);
      expect(buffer.byteLength(value)).assertEqual(6);
    })

    /**
     * @tc.number    SUB_AVS_UTIL_BUFFER_X_0400
     * @tc.name      testBufferExtra0004
     * @tc.desc      Verify concat sums the lengths of all input buffers
     */
    it('testBufferExtra0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const joined: buffer.Buffer = buffer.concat([buffer.from('a'), buffer.from('bc'), buffer.from('def')]);
      expect(joined.length).assertEqual(6);
      expect(joined.toString()).assertEqual('abcdef');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_BUFFER_X_0500
     * @tc.name      testBufferExtra0005
     * @tc.desc      Verify a full subarray equals the original content and a zero-length slice is empty
     */
    it('testBufferExtra0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.from('abcd');
      expect(value.subarray(0, 4).toString()).assertEqual('abcd');
      expect(value.subarray(0, 0).length).assertEqual(0);
      expect(value.subarray(2, 4).toString()).assertEqual('cd');
    })
  });
}
