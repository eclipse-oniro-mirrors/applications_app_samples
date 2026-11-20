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
import { decodeUtf8, encodeUtf8, utf8Length } from '../../../main/ets/model/TextCodec';

/** 取字节序列，便于把期望值写成可读的十进制串 */
function bytesOf(buffer: ArrayBuffer): number[] {
  const view = new Uint8Array(buffer);
  const values: number[] = [];
  for (let i = 0; i < view.length; i++) {
    values.push(view[i]);
  }
  return values;
}

function bytesText(values: number[]): string {
  return values.join(',');
}

/**
 * 混排字符串网格：页面上真实出现的服务名、权限名、MAC、UUID、载荷，逐个核算字节数。
 * 这些字符串同时是 payload 上限判断的输入，字节数错一位就会在真机上触发 32390103 / 32390206。
 */
export default function distributedUtf8MixedGridTest() {
  describe('DistributedUtf8MixedGridTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MIXED_0100
     * @tc.name testMixed0001
     * @tc.desc Verify a four character CJK service name weighs 15 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMixed0001', 0, () => {
      const text: string = '分布式扩展';
      expect(utf8Length(text)).assertEqual(15);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(encodeUtf8(text).byteLength).assertEqual(15);
      expect(decodeUtf8(encodeUtf8(text)).length).assertEqual(5);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MIXED_0200
     * @tc.name testMixed0002
     * @tc.desc Verify a two character CJK page title weighs 12 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMixed0002', 0, () => {
      const text: string = '链路增强';
      expect(utf8Length(text)).assertEqual(12);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(encodeUtf8(text).byteLength).assertEqual(12);
      expect(decodeUtf8(encodeUtf8(text)).length).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MIXED_0300
     * @tc.name testMixed0003
     * @tc.desc Verify another two character CJK title weighs 12 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMixed0003', 0, () => {
      const text: string = '代理通道';
      expect(utf8Length(text)).assertEqual(12);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(encodeUtf8(text).byteLength).assertEqual(12);
      expect(decodeUtf8(encodeUtf8(text)).length).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MIXED_0400
     * @tc.name testMixed0004
     * @tc.desc Verify the default channel payload weighs 18 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMixed0004', 0, () => {
      const text: string = 'hello proxyChannel';
      expect(utf8Length(text)).assertEqual(18);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(encodeUtf8(text).byteLength).assertEqual(18);
      expect(decodeUtf8(encodeUtf8(text)).length).assertEqual(18);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MIXED_0500
     * @tc.name testMixed0005
     * @tc.desc Verify the default link payload weighs 17 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMixed0005', 0, () => {
      const text: string = 'hello linkEnhance';
      expect(utf8Length(text)).assertEqual(17);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(encodeUtf8(text).byteLength).assertEqual(17);
      expect(decodeUtf8(encodeUtf8(text)).length).assertEqual(17);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MIXED_0600
     * @tc.name testMixed0006
     * @tc.desc Verify ASCII wrapped around a CJK pair weighs 12 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMixed0006', 0, () => {
      const text: string = 'abc中文abc';
      expect(utf8Length(text)).assertEqual(12);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(encodeUtf8(text).byteLength).assertEqual(12);
      expect(decodeUtf8(encodeUtf8(text)).length).assertEqual(8);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MIXED_0700
     * @tc.name testMixed0007
     * @tc.desc Verify CJK around a four byte emoji weighs 16 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMixed0007', 0, () => {
      const text: string = '中文🐾中文';
      expect(utf8Length(text)).assertEqual(16);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(encodeUtf8(text).byteLength).assertEqual(16);
      expect(decodeUtf8(encodeUtf8(text)).length).assertEqual(6);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MIXED_0800
     * @tc.name testMixed0008
     * @tc.desc Verify a two byte sign between ASCII letters weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMixed0008', 0, () => {
      const text: string = 'a©b';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(encodeUtf8(text).byteLength).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text)).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MIXED_0900
     * @tc.name testMixed0009
     * @tc.desc Verify the default peer MAC weighs 17 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMixed0009', 0, () => {
      const text: string = '12:34:56:78:9A:BC';
      expect(utf8Length(text)).assertEqual(17);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(encodeUtf8(text).byteLength).assertEqual(17);
      expect(decodeUtf8(encodeUtf8(text)).length).assertEqual(17);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MIXED_1000
     * @tc.name testMixed0010
     * @tc.desc Verify the default peer UUID weighs 36 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMixed0010', 0, () => {
      const text: string = '0000ffff-0000-1000-8000-00805f9b34fb';
      expect(utf8Length(text)).assertEqual(36);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(encodeUtf8(text).byteLength).assertEqual(36);
      expect(decodeUtf8(encodeUtf8(text)).length).assertEqual(36);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MIXED_1100
     * @tc.name testMixed0011
     * @tc.desc Verify the default collaborate index weighs 14 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMixed0011', 0, () => {
      const text: string = 'sample-index-0';
      expect(utf8Length(text)).assertEqual(14);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(encodeUtf8(text).byteLength).assertEqual(14);
      expect(decodeUtf8(encodeUtf8(text)).length).assertEqual(14);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MIXED_1200
     * @tc.name testMixed0012
     * @tc.desc Verify the data sync permission name weighs 20 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMixed0012', 0, () => {
      const text: string = 'DISTRIBUTED_DATASYNC';
      expect(utf8Length(text)).assertEqual(20);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(encodeUtf8(text).byteLength).assertEqual(20);
      expect(decodeUtf8(encodeUtf8(text)).length).assertEqual(20);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MIXED_1300
     * @tc.name testMixed0013
     * @tc.desc Verify the bluetooth permission name weighs 32 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMixed0013', 0, () => {
      const text: string = 'ohos.permission.ACCESS_BLUETOOTH';
      expect(utf8Length(text)).assertEqual(32);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(encodeUtf8(text).byteLength).assertEqual(32);
      expect(decodeUtf8(encodeUtf8(text)).length).assertEqual(32);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MIXED_1400
     * @tc.name testMixed0014
     * @tc.desc Verify the syscap name weighs 50 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMixed0014', 0, () => {
      const text: string = 'SystemCapability.DistributedSched.AppCollaboration';
      expect(utf8Length(text)).assertEqual(50);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(encodeUtf8(text).byteLength).assertEqual(50);
      expect(decodeUtf8(encodeUtf8(text)).length).assertEqual(50);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MIXED_1500
     * @tc.name testMixed0015
     * @tc.desc Verify the module description path weighs 27 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMixed0015', 0, () => {
      const text: string = 'entry/src/main/module.json5';
      expect(utf8Length(text)).assertEqual(27);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(encodeUtf8(text).byteLength).assertEqual(27);
      expect(decodeUtf8(encodeUtf8(text)).length).assertEqual(27);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MIXED_1600
     * @tc.name testMixed0016
     * @tc.desc Verify a forty digit numeric payload weighs 40 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMixed0016', 0, () => {
      const text: string = '1234567890123456789012345678901234567890';
      expect(utf8Length(text)).assertEqual(40);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(encodeUtf8(text).byteLength).assertEqual(40);
      expect(decodeUtf8(encodeUtf8(text)).length).assertEqual(40);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MIXED_1700
     * @tc.name testMixed0017
     * @tc.desc Verify an ideographic space U+3000 weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMixed0017', 0, () => {
      const text: string = '　';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(encodeUtf8(text).byteLength).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text)).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_MIXED_1800
     * @tc.name testMixed0018
     * @tc.desc Verify the ideographic zero U+3007 weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMixed0018', 0, () => {
      const text: string = '〇';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(encodeUtf8(text).byteLength).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text)).length).assertEqual(1);
    });

  });
}
