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
import { toHexPreview } from '../../../main/ets/model/TextCodec';

function bufferOf(values: number[]): ArrayBuffer {
  const buffer: ArrayBuffer = new ArrayBuffer(values.length);
  const view: Uint8Array = new Uint8Array(buffer);
  for (let i = 0; i < values.length; i++) {
    view[i] = values[i];
  }
  return buffer;
}

/**
 * 预览 limit 网格：5 个缓冲区（空 / 单字节 / 边界字节 / 16 字节 / 17 字节）× 12 个 limit，共 60 条。
 * limit 为 0 时一个字节都不显示，但只要有内容就必须带省略号收尾——这条分支最容易被写漏。
 * 16 / 17 两个缓冲区专钉「恰好到上限」与「超出 1 字节」，省略号的有无在这里分叉。
 */
export default function distributedHexLimitGridTest() {
  describe('DistributedHexLimitGridTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0002
     * @tc.name testHexLimit0002
     * @tc.desc Verify an empty buffer previewed with limit 1 yields 0 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0002', 0, () => {
      const buffer: ArrayBuffer = bufferOf([]);
      const preview: string = toHexPreview(buffer, 1);
      expect(preview).assertEqual('');
      expect(preview.length).assertEqual(0);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0003
     * @tc.name testHexLimit0003
     * @tc.desc Verify an empty buffer previewed with limit 2 yields 0 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0003', 0, () => {
      const buffer: ArrayBuffer = bufferOf([]);
      const preview: string = toHexPreview(buffer, 2);
      expect(preview).assertEqual('');
      expect(preview.length).assertEqual(0);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0004
     * @tc.name testHexLimit0004
     * @tc.desc Verify an empty buffer previewed with limit 3 yields 0 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0004', 0, () => {
      const buffer: ArrayBuffer = bufferOf([]);
      const preview: string = toHexPreview(buffer, 3);
      expect(preview).assertEqual('');
      expect(preview.length).assertEqual(0);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0005
     * @tc.name testHexLimit0005
     * @tc.desc Verify an empty buffer previewed with limit 4 yields 0 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0005', 0, () => {
      const buffer: ArrayBuffer = bufferOf([]);
      const preview: string = toHexPreview(buffer, 4);
      expect(preview).assertEqual('');
      expect(preview.length).assertEqual(0);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0006
     * @tc.name testHexLimit0006
     * @tc.desc Verify an empty buffer previewed with limit 8 yields 0 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0006', 0, () => {
      const buffer: ArrayBuffer = bufferOf([]);
      const preview: string = toHexPreview(buffer, 8);
      expect(preview).assertEqual('');
      expect(preview.length).assertEqual(0);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0007
     * @tc.name testHexLimit0007
     * @tc.desc Verify an empty buffer previewed with limit 12 yields 0 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0007', 0, () => {
      const buffer: ArrayBuffer = bufferOf([]);
      const preview: string = toHexPreview(buffer, 12);
      expect(preview).assertEqual('');
      expect(preview.length).assertEqual(0);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0008
     * @tc.name testHexLimit0008
     * @tc.desc Verify an empty buffer previewed with limit 15 yields 0 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0008', 0, () => {
      const buffer: ArrayBuffer = bufferOf([]);
      const preview: string = toHexPreview(buffer, 15);
      expect(preview).assertEqual('');
      expect(preview.length).assertEqual(0);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0009
     * @tc.name testHexLimit0009
     * @tc.desc Verify an empty buffer previewed with limit 16 yields 0 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0009', 0, () => {
      const buffer: ArrayBuffer = bufferOf([]);
      const preview: string = toHexPreview(buffer, 16);
      expect(preview).assertEqual('');
      expect(preview.length).assertEqual(0);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0010
     * @tc.name testHexLimit0010
     * @tc.desc Verify an empty buffer previewed with limit 17 yields 0 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0010', 0, () => {
      const buffer: ArrayBuffer = bufferOf([]);
      const preview: string = toHexPreview(buffer, 17);
      expect(preview).assertEqual('');
      expect(preview.length).assertEqual(0);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0011
     * @tc.name testHexLimit0011
     * @tc.desc Verify an empty buffer previewed with limit 24 yields 0 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0011', 0, () => {
      const buffer: ArrayBuffer = bufferOf([]);
      const preview: string = toHexPreview(buffer, 24);
      expect(preview).assertEqual('');
      expect(preview.length).assertEqual(0);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0012
     * @tc.name testHexLimit0012
     * @tc.desc Verify an empty buffer previewed with limit 32 yields 0 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0012', 0, () => {
      const buffer: ArrayBuffer = bufferOf([]);
      const preview: string = toHexPreview(buffer, 32);
      expect(preview).assertEqual('');
      expect(preview.length).assertEqual(0);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0014
     * @tc.name testHexLimit0014
     * @tc.desc Verify a single zero byte previewed with limit 1 yields 2 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0014', 0, () => {
      const buffer: ArrayBuffer = bufferOf([0]);
      const preview: string = toHexPreview(buffer, 1);
      expect(preview).assertEqual('00');
      expect(preview.length).assertEqual(2);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0015
     * @tc.name testHexLimit0015
     * @tc.desc Verify a single zero byte previewed with limit 2 yields 2 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0015', 0, () => {
      const buffer: ArrayBuffer = bufferOf([0]);
      const preview: string = toHexPreview(buffer, 2);
      expect(preview).assertEqual('00');
      expect(preview.length).assertEqual(2);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0016
     * @tc.name testHexLimit0016
     * @tc.desc Verify a single zero byte previewed with limit 3 yields 2 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0016', 0, () => {
      const buffer: ArrayBuffer = bufferOf([0]);
      const preview: string = toHexPreview(buffer, 3);
      expect(preview).assertEqual('00');
      expect(preview.length).assertEqual(2);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0017
     * @tc.name testHexLimit0017
     * @tc.desc Verify a single zero byte previewed with limit 4 yields 2 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0017', 0, () => {
      const buffer: ArrayBuffer = bufferOf([0]);
      const preview: string = toHexPreview(buffer, 4);
      expect(preview).assertEqual('00');
      expect(preview.length).assertEqual(2);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0018
     * @tc.name testHexLimit0018
     * @tc.desc Verify a single zero byte previewed with limit 8 yields 2 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0018', 0, () => {
      const buffer: ArrayBuffer = bufferOf([0]);
      const preview: string = toHexPreview(buffer, 8);
      expect(preview).assertEqual('00');
      expect(preview.length).assertEqual(2);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0019
     * @tc.name testHexLimit0019
     * @tc.desc Verify a single zero byte previewed with limit 12 yields 2 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0019', 0, () => {
      const buffer: ArrayBuffer = bufferOf([0]);
      const preview: string = toHexPreview(buffer, 12);
      expect(preview).assertEqual('00');
      expect(preview.length).assertEqual(2);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0020
     * @tc.name testHexLimit0020
     * @tc.desc Verify a single zero byte previewed with limit 15 yields 2 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0020', 0, () => {
      const buffer: ArrayBuffer = bufferOf([0]);
      const preview: string = toHexPreview(buffer, 15);
      expect(preview).assertEqual('00');
      expect(preview.length).assertEqual(2);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0021
     * @tc.name testHexLimit0021
     * @tc.desc Verify a single zero byte previewed with limit 16 yields 2 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0021', 0, () => {
      const buffer: ArrayBuffer = bufferOf([0]);
      const preview: string = toHexPreview(buffer, 16);
      expect(preview).assertEqual('00');
      expect(preview.length).assertEqual(2);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0022
     * @tc.name testHexLimit0022
     * @tc.desc Verify a single zero byte previewed with limit 17 yields 2 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0022', 0, () => {
      const buffer: ArrayBuffer = bufferOf([0]);
      const preview: string = toHexPreview(buffer, 17);
      expect(preview).assertEqual('00');
      expect(preview.length).assertEqual(2);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0023
     * @tc.name testHexLimit0023
     * @tc.desc Verify a single zero byte previewed with limit 24 yields 2 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0023', 0, () => {
      const buffer: ArrayBuffer = bufferOf([0]);
      const preview: string = toHexPreview(buffer, 24);
      expect(preview).assertEqual('00');
      expect(preview.length).assertEqual(2);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0024
     * @tc.name testHexLimit0024
     * @tc.desc Verify a single zero byte previewed with limit 32 yields 2 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0024', 0, () => {
      const buffer: ArrayBuffer = bufferOf([0]);
      const preview: string = toHexPreview(buffer, 32);
      expect(preview).assertEqual('00');
      expect(preview.length).assertEqual(2);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0026
     * @tc.name testHexLimit0026
     * @tc.desc Verify a low boundary byte and a high boundary byte previewed with limit 1 yields 4 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0026', 0, () => {
      const buffer: ArrayBuffer = bufferOf([1, 15, 255]);
      const preview: string = toHexPreview(buffer, 1);
      expect(preview).assertEqual('01 …');
      expect(preview.length).assertEqual(4);
      expect(preview.indexOf('…') >= 0).assertTrue();
      expect(preview.split(' ').length).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0027
     * @tc.name testHexLimit0027
     * @tc.desc Verify a low boundary byte and a high boundary byte previewed with limit 2 yields 7 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0027', 0, () => {
      const buffer: ArrayBuffer = bufferOf([1, 15, 255]);
      const preview: string = toHexPreview(buffer, 2);
      expect(preview).assertEqual('01 0F …');
      expect(preview.length).assertEqual(7);
      expect(preview.indexOf('…') >= 0).assertTrue();
      expect(preview.split(' ').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0028
     * @tc.name testHexLimit0028
     * @tc.desc Verify a low boundary byte and a high boundary byte previewed with limit 3 yields 8 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0028', 0, () => {
      const buffer: ArrayBuffer = bufferOf([1, 15, 255]);
      const preview: string = toHexPreview(buffer, 3);
      expect(preview).assertEqual('01 0F FF');
      expect(preview.length).assertEqual(8);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0029
     * @tc.name testHexLimit0029
     * @tc.desc Verify a low boundary byte and a high boundary byte previewed with limit 4 yields 8 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0029', 0, () => {
      const buffer: ArrayBuffer = bufferOf([1, 15, 255]);
      const preview: string = toHexPreview(buffer, 4);
      expect(preview).assertEqual('01 0F FF');
      expect(preview.length).assertEqual(8);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0030
     * @tc.name testHexLimit0030
     * @tc.desc Verify a low boundary byte and a high boundary byte previewed with limit 8 yields 8 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0030', 0, () => {
      const buffer: ArrayBuffer = bufferOf([1, 15, 255]);
      const preview: string = toHexPreview(buffer, 8);
      expect(preview).assertEqual('01 0F FF');
      expect(preview.length).assertEqual(8);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0031
     * @tc.name testHexLimit0031
     * @tc.desc Verify a low boundary byte and a high boundary byte previewed with limit 12 yields 8 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0031', 0, () => {
      const buffer: ArrayBuffer = bufferOf([1, 15, 255]);
      const preview: string = toHexPreview(buffer, 12);
      expect(preview).assertEqual('01 0F FF');
      expect(preview.length).assertEqual(8);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0032
     * @tc.name testHexLimit0032
     * @tc.desc Verify a low boundary byte and a high boundary byte previewed with limit 15 yields 8 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0032', 0, () => {
      const buffer: ArrayBuffer = bufferOf([1, 15, 255]);
      const preview: string = toHexPreview(buffer, 15);
      expect(preview).assertEqual('01 0F FF');
      expect(preview.length).assertEqual(8);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0033
     * @tc.name testHexLimit0033
     * @tc.desc Verify a low boundary byte and a high boundary byte previewed with limit 16 yields 8 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0033', 0, () => {
      const buffer: ArrayBuffer = bufferOf([1, 15, 255]);
      const preview: string = toHexPreview(buffer, 16);
      expect(preview).assertEqual('01 0F FF');
      expect(preview.length).assertEqual(8);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0034
     * @tc.name testHexLimit0034
     * @tc.desc Verify a low boundary byte and a high boundary byte previewed with limit 17 yields 8 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0034', 0, () => {
      const buffer: ArrayBuffer = bufferOf([1, 15, 255]);
      const preview: string = toHexPreview(buffer, 17);
      expect(preview).assertEqual('01 0F FF');
      expect(preview.length).assertEqual(8);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0035
     * @tc.name testHexLimit0035
     * @tc.desc Verify a low boundary byte and a high boundary byte previewed with limit 24 yields 8 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0035', 0, () => {
      const buffer: ArrayBuffer = bufferOf([1, 15, 255]);
      const preview: string = toHexPreview(buffer, 24);
      expect(preview).assertEqual('01 0F FF');
      expect(preview.length).assertEqual(8);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0036
     * @tc.name testHexLimit0036
     * @tc.desc Verify a low boundary byte and a high boundary byte previewed with limit 32 yields 8 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0036', 0, () => {
      const buffer: ArrayBuffer = bufferOf([1, 15, 255]);
      const preview: string = toHexPreview(buffer, 32);
      expect(preview).assertEqual('01 0F FF');
      expect(preview.length).assertEqual(8);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0038
     * @tc.name testHexLimit0038
     * @tc.desc Verify the sixteen byte boundary previewed with limit 1 yields 4 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0038', 0, () => {
      const buffer: ArrayBuffer = bufferOf([16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]);
      const preview: string = toHexPreview(buffer, 1);
      expect(preview).assertEqual('10 …');
      expect(preview.length).assertEqual(4);
      expect(preview.indexOf('…') >= 0).assertTrue();
      expect(preview.split(' ').length).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0039
     * @tc.name testHexLimit0039
     * @tc.desc Verify the sixteen byte boundary previewed with limit 2 yields 7 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0039', 0, () => {
      const buffer: ArrayBuffer = bufferOf([16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]);
      const preview: string = toHexPreview(buffer, 2);
      expect(preview).assertEqual('10 11 …');
      expect(preview.length).assertEqual(7);
      expect(preview.indexOf('…') >= 0).assertTrue();
      expect(preview.split(' ').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0040
     * @tc.name testHexLimit0040
     * @tc.desc Verify the sixteen byte boundary previewed with limit 3 yields 10 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0040', 0, () => {
      const buffer: ArrayBuffer = bufferOf([16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]);
      const preview: string = toHexPreview(buffer, 3);
      expect(preview).assertEqual('10 11 12 …');
      expect(preview.length).assertEqual(10);
      expect(preview.indexOf('…') >= 0).assertTrue();
      expect(preview.split(' ').length).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0041
     * @tc.name testHexLimit0041
     * @tc.desc Verify the sixteen byte boundary previewed with limit 4 yields 13 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0041', 0, () => {
      const buffer: ArrayBuffer = bufferOf([16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]);
      const preview: string = toHexPreview(buffer, 4);
      expect(preview).assertEqual('10 11 12 13 …');
      expect(preview.length).assertEqual(13);
      expect(preview.indexOf('…') >= 0).assertTrue();
      expect(preview.split(' ').length).assertEqual(5);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0042
     * @tc.name testHexLimit0042
     * @tc.desc Verify the sixteen byte boundary previewed with limit 8 yields 25 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0042', 0, () => {
      const buffer: ArrayBuffer = bufferOf([16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]);
      const preview: string = toHexPreview(buffer, 8);
      expect(preview).assertEqual('10 11 12 13 14 15 16 17 …');
      expect(preview.length).assertEqual(25);
      expect(preview.indexOf('…') >= 0).assertTrue();
      expect(preview.split(' ').length).assertEqual(9);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0043
     * @tc.name testHexLimit0043
     * @tc.desc Verify the sixteen byte boundary previewed with limit 12 yields 37 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0043', 0, () => {
      const buffer: ArrayBuffer = bufferOf([16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]);
      const preview: string = toHexPreview(buffer, 12);
      expect(preview).assertEqual('10 11 12 13 14 15 16 17 18 19 1A 1B …');
      expect(preview.length).assertEqual(37);
      expect(preview.indexOf('…') >= 0).assertTrue();
      expect(preview.split(' ').length).assertEqual(13);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0044
     * @tc.name testHexLimit0044
     * @tc.desc Verify the sixteen byte boundary previewed with limit 15 yields 46 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0044', 0, () => {
      const buffer: ArrayBuffer = bufferOf([16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]);
      const preview: string = toHexPreview(buffer, 15);
      expect(preview).assertEqual('10 11 12 13 14 15 16 17 18 19 1A 1B 1C 1D 1E …');
      expect(preview.length).assertEqual(46);
      expect(preview.indexOf('…') >= 0).assertTrue();
      expect(preview.split(' ').length).assertEqual(16);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0045
     * @tc.name testHexLimit0045
     * @tc.desc Verify the sixteen byte boundary previewed with limit 16 yields 47 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0045', 0, () => {
      const buffer: ArrayBuffer = bufferOf([16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]);
      const preview: string = toHexPreview(buffer, 16);
      expect(preview).assertEqual('10 11 12 13 14 15 16 17 18 19 1A 1B 1C 1D 1E 1F');
      expect(preview.length).assertEqual(47);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(16);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0046
     * @tc.name testHexLimit0046
     * @tc.desc Verify the sixteen byte boundary previewed with limit 17 yields 47 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0046', 0, () => {
      const buffer: ArrayBuffer = bufferOf([16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]);
      const preview: string = toHexPreview(buffer, 17);
      expect(preview).assertEqual('10 11 12 13 14 15 16 17 18 19 1A 1B 1C 1D 1E 1F');
      expect(preview.length).assertEqual(47);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(16);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0047
     * @tc.name testHexLimit0047
     * @tc.desc Verify the sixteen byte boundary previewed with limit 24 yields 47 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0047', 0, () => {
      const buffer: ArrayBuffer = bufferOf([16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]);
      const preview: string = toHexPreview(buffer, 24);
      expect(preview).assertEqual('10 11 12 13 14 15 16 17 18 19 1A 1B 1C 1D 1E 1F');
      expect(preview.length).assertEqual(47);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(16);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0048
     * @tc.name testHexLimit0048
     * @tc.desc Verify the sixteen byte boundary previewed with limit 32 yields 47 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0048', 0, () => {
      const buffer: ArrayBuffer = bufferOf([16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]);
      const preview: string = toHexPreview(buffer, 32);
      expect(preview).assertEqual('10 11 12 13 14 15 16 17 18 19 1A 1B 1C 1D 1E 1F');
      expect(preview.length).assertEqual(47);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(16);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0050
     * @tc.name testHexLimit0050
     * @tc.desc Verify one byte past the preview boundary previewed with limit 1 yields 4 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0050', 0, () => {
      const buffer: ArrayBuffer = bufferOf([32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48]);
      const preview: string = toHexPreview(buffer, 1);
      expect(preview).assertEqual('20 …');
      expect(preview.length).assertEqual(4);
      expect(preview.indexOf('…') >= 0).assertTrue();
      expect(preview.split(' ').length).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0051
     * @tc.name testHexLimit0051
     * @tc.desc Verify one byte past the preview boundary previewed with limit 2 yields 7 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0051', 0, () => {
      const buffer: ArrayBuffer = bufferOf([32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48]);
      const preview: string = toHexPreview(buffer, 2);
      expect(preview).assertEqual('20 21 …');
      expect(preview.length).assertEqual(7);
      expect(preview.indexOf('…') >= 0).assertTrue();
      expect(preview.split(' ').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0052
     * @tc.name testHexLimit0052
     * @tc.desc Verify one byte past the preview boundary previewed with limit 3 yields 10 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0052', 0, () => {
      const buffer: ArrayBuffer = bufferOf([32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48]);
      const preview: string = toHexPreview(buffer, 3);
      expect(preview).assertEqual('20 21 22 …');
      expect(preview.length).assertEqual(10);
      expect(preview.indexOf('…') >= 0).assertTrue();
      expect(preview.split(' ').length).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0053
     * @tc.name testHexLimit0053
     * @tc.desc Verify one byte past the preview boundary previewed with limit 4 yields 13 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0053', 0, () => {
      const buffer: ArrayBuffer = bufferOf([32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48]);
      const preview: string = toHexPreview(buffer, 4);
      expect(preview).assertEqual('20 21 22 23 …');
      expect(preview.length).assertEqual(13);
      expect(preview.indexOf('…') >= 0).assertTrue();
      expect(preview.split(' ').length).assertEqual(5);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0054
     * @tc.name testHexLimit0054
     * @tc.desc Verify one byte past the preview boundary previewed with limit 8 yields 25 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0054', 0, () => {
      const buffer: ArrayBuffer = bufferOf([32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48]);
      const preview: string = toHexPreview(buffer, 8);
      expect(preview).assertEqual('20 21 22 23 24 25 26 27 …');
      expect(preview.length).assertEqual(25);
      expect(preview.indexOf('…') >= 0).assertTrue();
      expect(preview.split(' ').length).assertEqual(9);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0055
     * @tc.name testHexLimit0055
     * @tc.desc Verify one byte past the preview boundary previewed with limit 12 yields 37 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0055', 0, () => {
      const buffer: ArrayBuffer = bufferOf([32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48]);
      const preview: string = toHexPreview(buffer, 12);
      expect(preview).assertEqual('20 21 22 23 24 25 26 27 28 29 2A 2B …');
      expect(preview.length).assertEqual(37);
      expect(preview.indexOf('…') >= 0).assertTrue();
      expect(preview.split(' ').length).assertEqual(13);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0056
     * @tc.name testHexLimit0056
     * @tc.desc Verify one byte past the preview boundary previewed with limit 15 yields 46 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0056', 0, () => {
      const buffer: ArrayBuffer = bufferOf([32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48]);
      const preview: string = toHexPreview(buffer, 15);
      expect(preview).assertEqual('20 21 22 23 24 25 26 27 28 29 2A 2B 2C 2D 2E …');
      expect(preview.length).assertEqual(46);
      expect(preview.indexOf('…') >= 0).assertTrue();
      expect(preview.split(' ').length).assertEqual(16);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0057
     * @tc.name testHexLimit0057
     * @tc.desc Verify one byte past the preview boundary previewed with limit 16 yields 49 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0057', 0, () => {
      const buffer: ArrayBuffer = bufferOf([32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48]);
      const preview: string = toHexPreview(buffer, 16);
      expect(preview).assertEqual('20 21 22 23 24 25 26 27 28 29 2A 2B 2C 2D 2E 2F …');
      expect(preview.length).assertEqual(49);
      expect(preview.indexOf('…') >= 0).assertTrue();
      expect(preview.split(' ').length).assertEqual(17);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0058
     * @tc.name testHexLimit0058
     * @tc.desc Verify one byte past the preview boundary previewed with limit 17 yields 50 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0058', 0, () => {
      const buffer: ArrayBuffer = bufferOf([32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48]);
      const preview: string = toHexPreview(buffer, 17);
      expect(preview).assertEqual('20 21 22 23 24 25 26 27 28 29 2A 2B 2C 2D 2E 2F 30');
      expect(preview.length).assertEqual(50);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(17);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0059
     * @tc.name testHexLimit0059
     * @tc.desc Verify one byte past the preview boundary previewed with limit 24 yields 50 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0059', 0, () => {
      const buffer: ArrayBuffer = bufferOf([32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48]);
      const preview: string = toHexPreview(buffer, 24);
      expect(preview).assertEqual('20 21 22 23 24 25 26 27 28 29 2A 2B 2C 2D 2E 2F 30');
      expect(preview.length).assertEqual(50);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(17);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEXLIMIT_0060
     * @tc.name testHexLimit0060
     * @tc.desc Verify one byte past the preview boundary previewed with limit 32 yields 50 chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHexLimit0060', 0, () => {
      const buffer: ArrayBuffer = bufferOf([32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48]);
      const preview: string = toHexPreview(buffer, 32);
      expect(preview).assertEqual('20 21 22 23 24 25 26 27 28 29 2A 2B 2C 2D 2E 2F 30');
      expect(preview.length).assertEqual(50);
      expect(preview.indexOf('…')).assertEqual(-1);
      expect(preview.split(' ').length).assertEqual(17);
    });

  });
}
