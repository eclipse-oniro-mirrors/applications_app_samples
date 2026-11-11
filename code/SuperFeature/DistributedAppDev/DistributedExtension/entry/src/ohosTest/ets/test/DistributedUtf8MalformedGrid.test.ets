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

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { decodeUtf8, utf8Length } from '../../../main/ets/model/TextCodec';

/** 按字节序列构造 ArrayBuffer：解码用例要能构造出合法与不合法两种输入 */
function bufferOf(values: number[]): ArrayBuffer {
  const buffer = new ArrayBuffer(values.length);
  const view = new Uint8Array(buffer);
  for (let i = 0; i < values.length; i++) {
    view[i] = values[i];
  }
  return buffer;
}

/**
 * 畸形与截断字节流网格：对端把数据截断、或被别的协议写过一段非法字节时，
 * decodeUtf8 的契约是「截断就停、非法首字节就跳过」，两种情况都不会抛异常。
 * 现有用例只覆盖了 5 组输入，这里按非法首字节、截断长度、代理对与越界码点铺开。
 */
export default function distributedUtf8MalformedGridTest() {
  describe('DistributedUtf8MalformedGridTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MALFORMED_0100
     * @tc.name testMalformed0001
     * @tc.desc Verify decoding skips or stops correctly when a lone two byte lead is truncated and yields nothing.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMalformed0001', 0, () => {
      expect(decodeUtf8(bufferOf([194]))).assertEqual('');
      expect(utf8Length(decodeUtf8(bufferOf([194])))).assertEqual(0);
      expect(bufferOf([194]).byteLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MALFORMED_0200
     * @tc.name testMalformed0002
     * @tc.desc Verify decoding skips or stops correctly when a truncated three byte lead drops both bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMalformed0002', 0, () => {
      expect(decodeUtf8(bufferOf([228,184]))).assertEqual('');
      expect(utf8Length(decodeUtf8(bufferOf([228,184])))).assertEqual(0);
      expect(bufferOf([228,184]).byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MALFORMED_0300
     * @tc.name testMalformed0003
     * @tc.desc Verify decoding skips or stops correctly when a three byte lead alone yields nothing.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMalformed0003', 0, () => {
      expect(decodeUtf8(bufferOf([228]))).assertEqual('');
      expect(utf8Length(decodeUtf8(bufferOf([228])))).assertEqual(0);
      expect(bufferOf([228]).byteLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MALFORMED_0400
     * @tc.name testMalformed0004
     * @tc.desc Verify decoding skips or stops correctly when a truncated four byte emoji tail is dropped whole.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMalformed0004', 0, () => {
      expect(decodeUtf8(bufferOf([240,159,152]))).assertEqual('');
      expect(utf8Length(decodeUtf8(bufferOf([240,159,152])))).assertEqual(0);
      expect(bufferOf([240,159,152]).byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MALFORMED_0500
     * @tc.name testMalformed0005
     * @tc.desc Verify decoding skips or stops correctly when a four byte lead alone yields nothing.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMalformed0005', 0, () => {
      expect(decodeUtf8(bufferOf([240]))).assertEqual('');
      expect(utf8Length(decodeUtf8(bufferOf([240])))).assertEqual(0);
      expect(bufferOf([240]).byteLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MALFORMED_0600
     * @tc.name testMalformed0006
     * @tc.desc Verify decoding skips or stops correctly when a bare continuation byte is skipped.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMalformed0006', 0, () => {
      expect(decodeUtf8(bufferOf([128]))).assertEqual('');
      expect(utf8Length(decodeUtf8(bufferOf([128])))).assertEqual(0);
      expect(bufferOf([128]).byteLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MALFORMED_0700
     * @tc.name testMalformed0007
     * @tc.desc Verify decoding skips or stops correctly when the last continuation byte is skipped as well.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMalformed0007', 0, () => {
      expect(decodeUtf8(bufferOf([191]))).assertEqual('');
      expect(utf8Length(decodeUtf8(bufferOf([191])))).assertEqual(0);
      expect(bufferOf([191]).byteLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MALFORMED_0800
     * @tc.name testMalformed0008
     * @tc.desc Verify decoding skips or stops correctly when a five byte lead is outside UTF-8 and skipped.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMalformed0008', 0, () => {
      expect(decodeUtf8(bufferOf([248]))).assertEqual('');
      expect(utf8Length(decodeUtf8(bufferOf([248])))).assertEqual(0);
      expect(bufferOf([248]).byteLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MALFORMED_0900
     * @tc.name testMalformed0009
     * @tc.desc Verify decoding skips or stops correctly when 0xFF is never a legal lead and is skipped.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMalformed0009', 0, () => {
      expect(decodeUtf8(bufferOf([255]))).assertEqual('');
      expect(utf8Length(decodeUtf8(bufferOf([255])))).assertEqual(0);
      expect(bufferOf([255]).byteLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MALFORMED_1000
     * @tc.name testMalformed0010
     * @tc.desc Verify decoding skips or stops correctly when an illegal lead does not stop the following ASCII.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMalformed0010', 0, () => {
      expect(decodeUtf8(bufferOf([254,65]))).assertEqual('A');
      expect(utf8Length(decodeUtf8(bufferOf([254,65])))).assertEqual(1);
      expect(bufferOf([254,65]).byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MALFORMED_1100
     * @tc.name testMalformed0011
     * @tc.desc Verify decoding skips or stops correctly when a stray continuation byte is skipped before ASCII.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMalformed0011', 0, () => {
      expect(decodeUtf8(bufferOf([128,65]))).assertEqual('A');
      expect(utf8Length(decodeUtf8(bufferOf([128,65])))).assertEqual(1);
      expect(bufferOf([128,65]).byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MALFORMED_1200
     * @tc.name testMalformed0012
     * @tc.desc Verify decoding skips or stops correctly when stray bytes between two ASCII letters are skipped.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMalformed0012', 0, () => {
      expect(decodeUtf8(bufferOf([65,128,66]))).assertEqual('AB');
      expect(utf8Length(decodeUtf8(bufferOf([65,128,66])))).assertEqual(2);
      expect(bufferOf([65,128,66]).byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MALFORMED_1300
     * @tc.name testMalformed0013
     * @tc.desc Verify decoding skips or stops correctly when a valid ASCII then a truncated lead stops decoding.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMalformed0013', 0, () => {
      expect(decodeUtf8(bufferOf([65,194]))).assertEqual('A');
      expect(utf8Length(decodeUtf8(bufferOf([65,194])))).assertEqual(1);
      expect(bufferOf([65,194]).byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MALFORMED_1400
     * @tc.name testMalformed0014
     * @tc.desc Verify decoding skips or stops correctly when an overlong NUL pair still decodes to U+0000.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMalformed0014', 0, () => {
      expect(decodeUtf8(bufferOf([192,128]))).assertEqual('\u0000');
      expect(utf8Length(decodeUtf8(bufferOf([192,128])))).assertEqual(1);
      expect(bufferOf([192,128]).byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MALFORMED_1500
     * @tc.name testMalformed0015
     * @tc.desc Verify decoding skips or stops correctly when an overlong slash still decodes to U+002F.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMalformed0015', 0, () => {
      expect(decodeUtf8(bufferOf([224,128,175]))).assertEqual('/');
      expect(utf8Length(decodeUtf8(bufferOf([224,128,175])))).assertEqual(1);
      expect(bufferOf([224,128,175]).byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MALFORMED_1600
     * @tc.name testMalformed0016
     * @tc.desc Verify decoding skips or stops correctly when a full four byte emoji decodes to U+1F600.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMalformed0016', 0, () => {
      expect(decodeUtf8(bufferOf([240,159,152,128]))).assertEqual('😀');
      expect(utf8Length(decodeUtf8(bufferOf([240,159,152,128])))).assertEqual(4);
      expect(bufferOf([240,159,152,128]).byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MALFORMED_1700
     * @tc.name testMalformed0017
     * @tc.desc Verify decoding skips or stops correctly when a surrogate half inside UTF-8 decodes to U+D800.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMalformed0017', 0, () => {
      expect(decodeUtf8(bufferOf([237,160,128]))).assertEqual('\uD800');
      expect(utf8Length(decodeUtf8(bufferOf([237,160,128])))).assertEqual(3);
      expect(bufferOf([237,160,128]).byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MALFORMED_1800
     * @tc.name testMalformed0018
     * @tc.desc Verify decoding skips or stops correctly when the replacement character decodes back to U+FFFD.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMalformed0018', 0, () => {
      expect(decodeUtf8(bufferOf([239,191,189]))).assertEqual('�');
      expect(utf8Length(decodeUtf8(bufferOf([239,191,189])))).assertEqual(3);
      expect(bufferOf([239,191,189]).byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MALFORMED_1900
     * @tc.name testMalformed0019
     * @tc.desc Verify decoding skips or stops correctly when the highest legal code point decodes to U+10FFFF.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMalformed0019', 0, () => {
      expect(decodeUtf8(bufferOf([244,143,191,191]))).assertEqual('􏿿');
      expect(utf8Length(decodeUtf8(bufferOf([244,143,191,191])))).assertEqual(4);
      expect(bufferOf([244,143,191,191]).byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MALFORMED_2000
     * @tc.name testMalformed0020
     * @tc.desc Verify decoding skips or stops correctly when control characters round trip without touching the tail.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMalformed0020', 0, () => {
      expect(decodeUtf8(bufferOf([1,127]))).assertEqual('\u0001\u007F');
      expect(utf8Length(decodeUtf8(bufferOf([1,127])))).assertEqual(2);
      expect(bufferOf([1,127]).byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MALFORMED_2100
     * @tc.name testMalformed0021
     * @tc.desc Verify decoding skips or stops correctly when a two byte copyright sign decodes to U+00A9.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMalformed0021', 0, () => {
      expect(decodeUtf8(bufferOf([194,169]))).assertEqual('©');
      expect(utf8Length(decodeUtf8(bufferOf([194,169])))).assertEqual(2);
      expect(bufferOf([194,169]).byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MALFORMED_2200
     * @tc.name testMalformed0022
     * @tc.desc Verify decoding skips or stops correctly when a three byte euro sign decodes to U+20AC.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMalformed0022', 0, () => {
      expect(decodeUtf8(bufferOf([226,130,172]))).assertEqual('€');
      expect(utf8Length(decodeUtf8(bufferOf([226,130,172])))).assertEqual(3);
      expect(bufferOf([226,130,172]).byteLength).assertEqual(3);
    });

  });
}
