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
  const buffer = new ArrayBuffer(values.length);
  const view = new Uint8Array(buffer);
  for (let i = 0; i < values.length; i++) {
    view[i] = values[i];
  }
  return buffer;
}

/**
 * 十六进制预览逐字节网格：0x00–0x20 与几个高位字节，核对补零与大写规则；
 * 另外覆盖 limit 小于、等于、大于长度的三种收尾形态（是否带省略号）。
 * 预览错一位在页面上是"看着像对的"，只有逐字节断言才能拦住。
 */
export default function distributedHexPreviewGridTest() {
  describe('DistributedHexPreviewGridTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_0100
     * @tc.name testHex0001
     * @tc.desc Verify the preview of single byte 0x0000 is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0001', 0, () => {
      expect(toHexPreview(bufferOf([0]), 1)).assertEqual('00');
      expect(toHexPreview(bufferOf([0]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([0]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_0200
     * @tc.name testHex0002
     * @tc.desc Verify the preview of single byte 0x0001 is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0002', 0, () => {
      expect(toHexPreview(bufferOf([1]), 1)).assertEqual('01');
      expect(toHexPreview(bufferOf([1]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([1]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_0300
     * @tc.name testHex0003
     * @tc.desc Verify the preview of single byte 0x0002 is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0003', 0, () => {
      expect(toHexPreview(bufferOf([2]), 1)).assertEqual('02');
      expect(toHexPreview(bufferOf([2]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([2]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_0400
     * @tc.name testHex0004
     * @tc.desc Verify the preview of single byte 0x0003 is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0004', 0, () => {
      expect(toHexPreview(bufferOf([3]), 1)).assertEqual('03');
      expect(toHexPreview(bufferOf([3]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([3]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_0500
     * @tc.name testHex0005
     * @tc.desc Verify the preview of single byte 0x0004 is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0005', 0, () => {
      expect(toHexPreview(bufferOf([4]), 1)).assertEqual('04');
      expect(toHexPreview(bufferOf([4]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([4]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_0600
     * @tc.name testHex0006
     * @tc.desc Verify the preview of single byte 0x0005 is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0006', 0, () => {
      expect(toHexPreview(bufferOf([5]), 1)).assertEqual('05');
      expect(toHexPreview(bufferOf([5]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([5]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_0700
     * @tc.name testHex0007
     * @tc.desc Verify the preview of single byte 0x0006 is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0007', 0, () => {
      expect(toHexPreview(bufferOf([6]), 1)).assertEqual('06');
      expect(toHexPreview(bufferOf([6]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([6]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_0800
     * @tc.name testHex0008
     * @tc.desc Verify the preview of single byte 0x0007 is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0008', 0, () => {
      expect(toHexPreview(bufferOf([7]), 1)).assertEqual('07');
      expect(toHexPreview(bufferOf([7]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([7]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_0900
     * @tc.name testHex0009
     * @tc.desc Verify the preview of single byte 0x0008 is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0009', 0, () => {
      expect(toHexPreview(bufferOf([8]), 1)).assertEqual('08');
      expect(toHexPreview(bufferOf([8]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([8]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_1000
     * @tc.name testHex0010
     * @tc.desc Verify the preview of single byte 0x0009 is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0010', 0, () => {
      expect(toHexPreview(bufferOf([9]), 1)).assertEqual('09');
      expect(toHexPreview(bufferOf([9]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([9]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_1100
     * @tc.name testHex0011
     * @tc.desc Verify the preview of single byte 0x000A is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0011', 0, () => {
      expect(toHexPreview(bufferOf([10]), 1)).assertEqual('0A');
      expect(toHexPreview(bufferOf([10]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([10]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_1200
     * @tc.name testHex0012
     * @tc.desc Verify the preview of single byte 0x000B is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0012', 0, () => {
      expect(toHexPreview(bufferOf([11]), 1)).assertEqual('0B');
      expect(toHexPreview(bufferOf([11]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([11]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_1300
     * @tc.name testHex0013
     * @tc.desc Verify the preview of single byte 0x000C is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0013', 0, () => {
      expect(toHexPreview(bufferOf([12]), 1)).assertEqual('0C');
      expect(toHexPreview(bufferOf([12]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([12]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_1400
     * @tc.name testHex0014
     * @tc.desc Verify the preview of single byte 0x000D is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0014', 0, () => {
      expect(toHexPreview(bufferOf([13]), 1)).assertEqual('0D');
      expect(toHexPreview(bufferOf([13]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([13]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_1500
     * @tc.name testHex0015
     * @tc.desc Verify the preview of single byte 0x000E is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0015', 0, () => {
      expect(toHexPreview(bufferOf([14]), 1)).assertEqual('0E');
      expect(toHexPreview(bufferOf([14]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([14]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_1600
     * @tc.name testHex0016
     * @tc.desc Verify the preview of single byte 0x000F is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0016', 0, () => {
      expect(toHexPreview(bufferOf([15]), 1)).assertEqual('0F');
      expect(toHexPreview(bufferOf([15]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([15]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_1700
     * @tc.name testHex0017
     * @tc.desc Verify the preview of single byte 0x0010 is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0017', 0, () => {
      expect(toHexPreview(bufferOf([16]), 1)).assertEqual('10');
      expect(toHexPreview(bufferOf([16]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([16]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_1800
     * @tc.name testHex0018
     * @tc.desc Verify the preview of single byte 0x0011 is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0018', 0, () => {
      expect(toHexPreview(bufferOf([17]), 1)).assertEqual('11');
      expect(toHexPreview(bufferOf([17]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([17]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_1900
     * @tc.name testHex0019
     * @tc.desc Verify the preview of single byte 0x0012 is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0019', 0, () => {
      expect(toHexPreview(bufferOf([18]), 1)).assertEqual('12');
      expect(toHexPreview(bufferOf([18]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([18]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_2000
     * @tc.name testHex0020
     * @tc.desc Verify the preview of single byte 0x0013 is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0020', 0, () => {
      expect(toHexPreview(bufferOf([19]), 1)).assertEqual('13');
      expect(toHexPreview(bufferOf([19]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([19]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_2100
     * @tc.name testHex0021
     * @tc.desc Verify the preview of single byte 0x0014 is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0021', 0, () => {
      expect(toHexPreview(bufferOf([20]), 1)).assertEqual('14');
      expect(toHexPreview(bufferOf([20]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([20]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_2200
     * @tc.name testHex0022
     * @tc.desc Verify the preview of single byte 0x0015 is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0022', 0, () => {
      expect(toHexPreview(bufferOf([21]), 1)).assertEqual('15');
      expect(toHexPreview(bufferOf([21]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([21]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_2300
     * @tc.name testHex0023
     * @tc.desc Verify the preview of single byte 0x0016 is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0023', 0, () => {
      expect(toHexPreview(bufferOf([22]), 1)).assertEqual('16');
      expect(toHexPreview(bufferOf([22]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([22]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_2400
     * @tc.name testHex0024
     * @tc.desc Verify the preview of single byte 0x0017 is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0024', 0, () => {
      expect(toHexPreview(bufferOf([23]), 1)).assertEqual('17');
      expect(toHexPreview(bufferOf([23]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([23]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_2500
     * @tc.name testHex0025
     * @tc.desc Verify the preview of single byte 0x0018 is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0025', 0, () => {
      expect(toHexPreview(bufferOf([24]), 1)).assertEqual('18');
      expect(toHexPreview(bufferOf([24]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([24]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_2600
     * @tc.name testHex0026
     * @tc.desc Verify the preview of single byte 0x0019 is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0026', 0, () => {
      expect(toHexPreview(bufferOf([25]), 1)).assertEqual('19');
      expect(toHexPreview(bufferOf([25]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([25]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_2700
     * @tc.name testHex0027
     * @tc.desc Verify the preview of single byte 0x001A is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0027', 0, () => {
      expect(toHexPreview(bufferOf([26]), 1)).assertEqual('1A');
      expect(toHexPreview(bufferOf([26]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([26]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_2800
     * @tc.name testHex0028
     * @tc.desc Verify the preview of single byte 0x001B is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0028', 0, () => {
      expect(toHexPreview(bufferOf([27]), 1)).assertEqual('1B');
      expect(toHexPreview(bufferOf([27]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([27]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_2900
     * @tc.name testHex0029
     * @tc.desc Verify the preview of single byte 0x001C is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0029', 0, () => {
      expect(toHexPreview(bufferOf([28]), 1)).assertEqual('1C');
      expect(toHexPreview(bufferOf([28]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([28]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_3000
     * @tc.name testHex0030
     * @tc.desc Verify the preview of single byte 0x001D is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0030', 0, () => {
      expect(toHexPreview(bufferOf([29]), 1)).assertEqual('1D');
      expect(toHexPreview(bufferOf([29]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([29]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_3100
     * @tc.name testHex0031
     * @tc.desc Verify the preview of single byte 0x001E is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0031', 0, () => {
      expect(toHexPreview(bufferOf([30]), 1)).assertEqual('1E');
      expect(toHexPreview(bufferOf([30]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([30]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_3200
     * @tc.name testHex0032
     * @tc.desc Verify the preview of single byte 0x001F is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0032', 0, () => {
      expect(toHexPreview(bufferOf([31]), 1)).assertEqual('1F');
      expect(toHexPreview(bufferOf([31]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([31]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_3300
     * @tc.name testHex0033
     * @tc.desc Verify the preview of single byte 0x0020 is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0033', 0, () => {
      expect(toHexPreview(bufferOf([32]), 1)).assertEqual('20');
      expect(toHexPreview(bufferOf([32]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([32]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_3400
     * @tc.name testHex0034
     * @tc.desc Verify the preview of single byte 0x007F is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0034', 0, () => {
      expect(toHexPreview(bufferOf([127]), 1)).assertEqual('7F');
      expect(toHexPreview(bufferOf([127]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([127]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_3500
     * @tc.name testHex0035
     * @tc.desc Verify the preview of single byte 0x0080 is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0035', 0, () => {
      expect(toHexPreview(bufferOf([128]), 1)).assertEqual('80');
      expect(toHexPreview(bufferOf([128]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([128]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_3600
     * @tc.name testHex0036
     * @tc.desc Verify the preview of single byte 0x00AB is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0036', 0, () => {
      expect(toHexPreview(bufferOf([171]), 1)).assertEqual('AB');
      expect(toHexPreview(bufferOf([171]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([171]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_3700
     * @tc.name testHex0037
     * @tc.desc Verify the preview of single byte 0x00FF is upper case and stays a single token.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0037', 0, () => {
      expect(toHexPreview(bufferOf([255]), 1)).assertEqual('FF');
      expect(toHexPreview(bufferOf([255]), 1).length).assertEqual(2);
      expect(toHexPreview(bufferOf([255]), 1).indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_3800
     * @tc.name testHex0038
     * @tc.desc Verify limiting a 3 byte payload to 2 keeps the preview shape.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0038', 0, () => {
      expect(toHexPreview(bufferOf([1,2,3]), 2)).assertEqual('01 02 …');
      expect(toHexPreview(bufferOf([1,2,3]), 2).length).assertEqual(7);
      expect(bufferOf([1,2,3]).byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_3900
     * @tc.name testHex0039
     * @tc.desc Verify limiting a 3 byte payload to 0 keeps the preview shape.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0039', 0, () => {
      expect(toHexPreview(bufferOf([1,2,3]), 0)).assertEqual(' …');
      expect(toHexPreview(bufferOf([1,2,3]), 0).length).assertEqual(2);
      expect(bufferOf([1,2,3]).byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_4000
     * @tc.name testHex0040
     * @tc.desc Verify limiting a 3 byte payload to 3 keeps the preview shape.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0040', 0, () => {
      expect(toHexPreview(bufferOf([255,16,171]), 3)).assertEqual('FF 10 AB');
      expect(toHexPreview(bufferOf([255,16,171]), 3).length).assertEqual(8);
      expect(bufferOf([255,16,171]).byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_4100
     * @tc.name testHex0041
     * @tc.desc Verify limiting a 3 byte payload to 4 keeps the preview shape.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0041', 0, () => {
      expect(toHexPreview(bufferOf([255,16,171]), 4)).assertEqual('FF 10 AB');
      expect(toHexPreview(bufferOf([255,16,171]), 4).length).assertEqual(8);
      expect(bufferOf([255,16,171]).byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_4200
     * @tc.name testHex0042
     * @tc.desc Verify limiting a 3 byte payload to 2 keeps the preview shape.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0042', 0, () => {
      expect(toHexPreview(bufferOf([0,15,16]), 2)).assertEqual('00 0F …');
      expect(toHexPreview(bufferOf([0,15,16]), 2).length).assertEqual(7);
      expect(bufferOf([0,15,16]).byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_HEX_4300
     * @tc.name testHex0043
     * @tc.desc Verify limiting a 4 byte payload to 1 keeps the preview shape.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHex0043', 0, () => {
      expect(toHexPreview(bufferOf([10,11,12,13]), 1)).assertEqual('0A …');
      expect(toHexPreview(bufferOf([10,11,12,13]), 1).length).assertEqual(4);
      expect(bufferOf([10,11,12,13]).byteLength).assertEqual(4);
    });

  });
}
