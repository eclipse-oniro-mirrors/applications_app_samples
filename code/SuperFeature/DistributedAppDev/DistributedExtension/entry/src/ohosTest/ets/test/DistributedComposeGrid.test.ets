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
import { clampPayload, decodeUtf8, encodeUtf8, toHexPreview, utf8Length } from '../../../main/ets/model/TextCodec';

/**
 * 组合链路网格：4 段文案 × 10 个字节上限，走完「按字节裁剪 → 编码 → 十六进制预览 → 解码回原文」四步。
 * 裁剪后的字节数不允许超过上限，预览超过 16 字节必须带省略号收尾。
 * 裁剪点落在代理对中间时会留下半个字符，这是实现的真实行为，预览与解码都要能如实反映它。
 */
export default function distributedComposeGridTest() {
  describe('DistributedComposeGridTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0001
     * @tc.name testCompose0001
     * @tc.desc Verify a long payload clamped to 0 bytes previews 0 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0001', 0, () => {
      const text: string = 'hello proxyChannel';
      const clamped: string = clampPayload(text, 0);
      expect(utf8Length(clamped) <= 0).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0002
     * @tc.name testCompose0002
     * @tc.desc Verify a long payload clamped to 1 bytes previews 2 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0002', 0, () => {
      const text: string = 'hello proxyChannel';
      const clamped: string = clampPayload(text, 1);
      expect(utf8Length(clamped) <= 1).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('68');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0003
     * @tc.name testCompose0003
     * @tc.desc Verify a long payload clamped to 4 bytes previews 11 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0003', 0, () => {
      const text: string = 'hello proxyChannel';
      const clamped: string = clampPayload(text, 4);
      expect(utf8Length(clamped) <= 4).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('68 65 6C 6C');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0004
     * @tc.name testCompose0004
     * @tc.desc Verify a long payload clamped to 8 bytes previews 23 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0004', 0, () => {
      const text: string = 'hello proxyChannel';
      const clamped: string = clampPayload(text, 8);
      expect(utf8Length(clamped) <= 8).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('68 65 6C 6C 6F 20 70 72');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0005
     * @tc.name testCompose0005
     * @tc.desc Verify a long payload clamped to 12 bytes previews 35 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0005', 0, () => {
      const text: string = 'hello proxyChannel';
      const clamped: string = clampPayload(text, 12);
      expect(utf8Length(clamped) <= 12).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('68 65 6C 6C 6F 20 70 72 6F 78 79 43');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0006
     * @tc.name testCompose0006
     * @tc.desc Verify a long payload clamped to 16 bytes previews 47 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0006', 0, () => {
      const text: string = 'hello proxyChannel';
      const clamped: string = clampPayload(text, 16);
      expect(utf8Length(clamped) <= 16).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('68 65 6C 6C 6F 20 70 72 6F 78 79 43 68 61 6E 6E');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0007
     * @tc.name testCompose0007
     * @tc.desc Verify a long payload clamped to 20 bytes previews 49 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0007', 0, () => {
      const text: string = 'hello proxyChannel';
      const clamped: string = clampPayload(text, 20);
      expect(utf8Length(clamped) <= 20).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('68 65 6C 6C 6F 20 70 72 6F 78 79 43 68 61 6E 6E …');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0008
     * @tc.name testCompose0008
     * @tc.desc Verify a long payload clamped to 24 bytes previews 49 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0008', 0, () => {
      const text: string = 'hello proxyChannel';
      const clamped: string = clampPayload(text, 24);
      expect(utf8Length(clamped) <= 24).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('68 65 6C 6C 6F 20 70 72 6F 78 79 43 68 61 6E 6E …');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0009
     * @tc.name testCompose0009
     * @tc.desc Verify a long payload clamped to 30 bytes previews 49 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0009', 0, () => {
      const text: string = 'hello proxyChannel';
      const clamped: string = clampPayload(text, 30);
      expect(utf8Length(clamped) <= 30).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('68 65 6C 6C 6F 20 70 72 6F 78 79 43 68 61 6E 6E …');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0010
     * @tc.name testCompose0010
     * @tc.desc Verify a long payload clamped to 40 bytes previews 49 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0010', 0, () => {
      const text: string = 'hello proxyChannel';
      const clamped: string = clampPayload(text, 40);
      expect(utf8Length(clamped) <= 40).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('68 65 6C 6C 6F 20 70 72 6F 78 79 43 68 61 6E 6E …');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0011
     * @tc.name testCompose0011
     * @tc.desc Verify 分布式扩展 clamped to 0 bytes previews 0 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0011', 0, () => {
      const text: string = '分布式扩展';
      const clamped: string = clampPayload(text, 0);
      expect(utf8Length(clamped) <= 0).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0012
     * @tc.name testCompose0012
     * @tc.desc Verify 分布式扩展 clamped to 1 bytes previews 0 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0012', 0, () => {
      const text: string = '分布式扩展';
      const clamped: string = clampPayload(text, 1);
      expect(utf8Length(clamped) <= 1).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0013
     * @tc.name testCompose0013
     * @tc.desc Verify 分布式扩展 clamped to 4 bytes previews 8 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0013', 0, () => {
      const text: string = '分布式扩展';
      const clamped: string = clampPayload(text, 4);
      expect(utf8Length(clamped) <= 4).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('E5 88 86');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0014
     * @tc.name testCompose0014
     * @tc.desc Verify 分布式扩展 clamped to 8 bytes previews 17 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0014', 0, () => {
      const text: string = '分布式扩展';
      const clamped: string = clampPayload(text, 8);
      expect(utf8Length(clamped) <= 8).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('E5 88 86 E5 B8 83');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0015
     * @tc.name testCompose0015
     * @tc.desc Verify 分布式扩展 clamped to 12 bytes previews 35 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0015', 0, () => {
      const text: string = '分布式扩展';
      const clamped: string = clampPayload(text, 12);
      expect(utf8Length(clamped) <= 12).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('E5 88 86 E5 B8 83 E5 BC 8F E6 89 A9');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0016
     * @tc.name testCompose0016
     * @tc.desc Verify 分布式扩展 clamped to 16 bytes previews 44 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0016', 0, () => {
      const text: string = '分布式扩展';
      const clamped: string = clampPayload(text, 16);
      expect(utf8Length(clamped) <= 16).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('E5 88 86 E5 B8 83 E5 BC 8F E6 89 A9 E5 B1 95');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0017
     * @tc.name testCompose0017
     * @tc.desc Verify 分布式扩展 clamped to 20 bytes previews 44 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0017', 0, () => {
      const text: string = '分布式扩展';
      const clamped: string = clampPayload(text, 20);
      expect(utf8Length(clamped) <= 20).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('E5 88 86 E5 B8 83 E5 BC 8F E6 89 A9 E5 B1 95');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0018
     * @tc.name testCompose0018
     * @tc.desc Verify 分布式扩展 clamped to 24 bytes previews 44 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0018', 0, () => {
      const text: string = '分布式扩展';
      const clamped: string = clampPayload(text, 24);
      expect(utf8Length(clamped) <= 24).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('E5 88 86 E5 B8 83 E5 BC 8F E6 89 A9 E5 B1 95');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0019
     * @tc.name testCompose0019
     * @tc.desc Verify 分布式扩展 clamped to 30 bytes previews 44 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0019', 0, () => {
      const text: string = '分布式扩展';
      const clamped: string = clampPayload(text, 30);
      expect(utf8Length(clamped) <= 30).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('E5 88 86 E5 B8 83 E5 BC 8F E6 89 A9 E5 B1 95');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0020
     * @tc.name testCompose0020
     * @tc.desc Verify 分布式扩展 clamped to 40 bytes previews 44 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0020', 0, () => {
      const text: string = '分布式扩展';
      const clamped: string = clampPayload(text, 40);
      expect(utf8Length(clamped) <= 40).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('E5 88 86 E5 B8 83 E5 BC 8F E6 89 A9 E5 B1 95');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0021
     * @tc.name testCompose0021
     * @tc.desc Verify a🐾b clamped to 0 bytes previews 0 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0021', 0, () => {
      const text: string = 'a🐾b';
      const clamped: string = clampPayload(text, 0);
      expect(utf8Length(clamped) <= 0).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0022
     * @tc.name testCompose0022
     * @tc.desc Verify a🐾b clamped to 1 bytes previews 2 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0022', 0, () => {
      const text: string = 'a🐾b';
      const clamped: string = clampPayload(text, 1);
      expect(utf8Length(clamped) <= 1).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('61');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0024
     * @tc.name testCompose0024
     * @tc.desc Verify a🐾b clamped to 8 bytes previews 17 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0024', 0, () => {
      const text: string = 'a🐾b';
      const clamped: string = clampPayload(text, 8);
      expect(utf8Length(clamped) <= 8).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('61 F0 9F 90 BE 62');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0025
     * @tc.name testCompose0025
     * @tc.desc Verify a🐾b clamped to 12 bytes previews 17 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0025', 0, () => {
      const text: string = 'a🐾b';
      const clamped: string = clampPayload(text, 12);
      expect(utf8Length(clamped) <= 12).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('61 F0 9F 90 BE 62');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0026
     * @tc.name testCompose0026
     * @tc.desc Verify a🐾b clamped to 16 bytes previews 17 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0026', 0, () => {
      const text: string = 'a🐾b';
      const clamped: string = clampPayload(text, 16);
      expect(utf8Length(clamped) <= 16).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('61 F0 9F 90 BE 62');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0027
     * @tc.name testCompose0027
     * @tc.desc Verify a🐾b clamped to 20 bytes previews 17 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0027', 0, () => {
      const text: string = 'a🐾b';
      const clamped: string = clampPayload(text, 20);
      expect(utf8Length(clamped) <= 20).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('61 F0 9F 90 BE 62');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0028
     * @tc.name testCompose0028
     * @tc.desc Verify a🐾b clamped to 24 bytes previews 17 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0028', 0, () => {
      const text: string = 'a🐾b';
      const clamped: string = clampPayload(text, 24);
      expect(utf8Length(clamped) <= 24).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('61 F0 9F 90 BE 62');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0029
     * @tc.name testCompose0029
     * @tc.desc Verify a🐾b clamped to 30 bytes previews 17 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0029', 0, () => {
      const text: string = 'a🐾b';
      const clamped: string = clampPayload(text, 30);
      expect(utf8Length(clamped) <= 30).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('61 F0 9F 90 BE 62');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0030
     * @tc.name testCompose0030
     * @tc.desc Verify a🐾b clamped to 40 bytes previews 17 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0030', 0, () => {
      const text: string = 'a🐾b';
      const clamped: string = clampPayload(text, 40);
      expect(utf8Length(clamped) <= 40).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('61 F0 9F 90 BE 62');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0031
     * @tc.name testCompose0031
     * @tc.desc Verify a long payload clamped to 0 bytes previews 0 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0031', 0, () => {
      const text: string = '12:34:56:78:9A:BC';
      const clamped: string = clampPayload(text, 0);
      expect(utf8Length(clamped) <= 0).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0032
     * @tc.name testCompose0032
     * @tc.desc Verify a long payload clamped to 1 bytes previews 2 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0032', 0, () => {
      const text: string = '12:34:56:78:9A:BC';
      const clamped: string = clampPayload(text, 1);
      expect(utf8Length(clamped) <= 1).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('31');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0033
     * @tc.name testCompose0033
     * @tc.desc Verify a long payload clamped to 4 bytes previews 11 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0033', 0, () => {
      const text: string = '12:34:56:78:9A:BC';
      const clamped: string = clampPayload(text, 4);
      expect(utf8Length(clamped) <= 4).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('31 32 3A 33');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0034
     * @tc.name testCompose0034
     * @tc.desc Verify a long payload clamped to 8 bytes previews 23 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0034', 0, () => {
      const text: string = '12:34:56:78:9A:BC';
      const clamped: string = clampPayload(text, 8);
      expect(utf8Length(clamped) <= 8).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('31 32 3A 33 34 3A 35 36');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0035
     * @tc.name testCompose0035
     * @tc.desc Verify a long payload clamped to 12 bytes previews 35 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0035', 0, () => {
      const text: string = '12:34:56:78:9A:BC';
      const clamped: string = clampPayload(text, 12);
      expect(utf8Length(clamped) <= 12).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('31 32 3A 33 34 3A 35 36 3A 37 38 3A');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0036
     * @tc.name testCompose0036
     * @tc.desc Verify a long payload clamped to 16 bytes previews 47 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0036', 0, () => {
      const text: string = '12:34:56:78:9A:BC';
      const clamped: string = clampPayload(text, 16);
      expect(utf8Length(clamped) <= 16).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('31 32 3A 33 34 3A 35 36 3A 37 38 3A 39 41 3A 42');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0037
     * @tc.name testCompose0037
     * @tc.desc Verify a long payload clamped to 20 bytes previews 49 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0037', 0, () => {
      const text: string = '12:34:56:78:9A:BC';
      const clamped: string = clampPayload(text, 20);
      expect(utf8Length(clamped) <= 20).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('31 32 3A 33 34 3A 35 36 3A 37 38 3A 39 41 3A 42 …');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0038
     * @tc.name testCompose0038
     * @tc.desc Verify a long payload clamped to 24 bytes previews 49 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0038', 0, () => {
      const text: string = '12:34:56:78:9A:BC';
      const clamped: string = clampPayload(text, 24);
      expect(utf8Length(clamped) <= 24).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('31 32 3A 33 34 3A 35 36 3A 37 38 3A 39 41 3A 42 …');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0039
     * @tc.name testCompose0039
     * @tc.desc Verify a long payload clamped to 30 bytes previews 49 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0039', 0, () => {
      const text: string = '12:34:56:78:9A:BC';
      const clamped: string = clampPayload(text, 30);
      expect(utf8Length(clamped) <= 30).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('31 32 3A 33 34 3A 35 36 3A 37 38 3A 39 41 3A 42 …');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPOSE_0040
     * @tc.name testCompose0040
     * @tc.desc Verify a long payload clamped to 40 bytes previews 49 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompose0040', 0, () => {
      const text: string = '12:34:56:78:9A:BC';
      const clamped: string = clampPayload(text, 40);
      expect(utf8Length(clamped) <= 40).assertTrue();
      expect(toHexPreview(encodeUtf8(clamped), 16)).assertEqual('31 32 3A 33 34 3A 35 36 3A 37 38 3A 39 41 3A 42 …');
      expect(decodeUtf8(encodeUtf8(clamped))).assertEqual(clamped);
    });

  });
}
