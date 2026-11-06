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
import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import ArrayBufferUtil from '@ohos/nearbydevice/src/main/ets/util/ArrayBufferUtil';

export default function ArrayBufferUtilTest(): void {
  describe('ArrayBufferUtilTest', () => {
    beforeAll(() => {
      console.info('[Suite] ArrayBufferUtilTest start');
    });

    afterAll(() => {
      console.info('[Suite] ArrayBufferUtilTest end');
    });

    it('single_byte_0_parses_to_0', 0, () => {
      // 单字节 0x00（十进制 0）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '00';
      const withPrefix: string = '0x00';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        0
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        0
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        0
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x00'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '00'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        0
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x00'
      );
    });

    it('single_byte_1_parses_to_1', 0, () => {
      // 单字节 0x01（十进制 1）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '01';
      const withPrefix: string = '0x01';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        1
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x01'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '01'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x01'
      );
    });

    it('single_byte_2_parses_to_2', 0, () => {
      // 单字节 0x02（十进制 2）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '02';
      const withPrefix: string = '0x02';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        2
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        2
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        2
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x02'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '02'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        2
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x02'
      );
    });

    it('single_byte_3_parses_to_3', 0, () => {
      // 单字节 0x03（十进制 3）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '03';
      const withPrefix: string = '0x03';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        3
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        3
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        3
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x03'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '03'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        3
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x03'
      );
    });

    it('single_byte_4_parses_to_4', 0, () => {
      // 单字节 0x04（十进制 4）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '04';
      const withPrefix: string = '0x04';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        4
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        4
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        4
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x04'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '04'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        4
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x04'
      );
    });

    it('single_byte_5_parses_to_5', 0, () => {
      // 单字节 0x05（十进制 5）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '05';
      const withPrefix: string = '0x05';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        5
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        5
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        5
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x05'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '05'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        5
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x05'
      );
    });

    it('single_byte_6_parses_to_6', 0, () => {
      // 单字节 0x06（十进制 6）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '06';
      const withPrefix: string = '0x06';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        6
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        6
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        6
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x06'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '06'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        6
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x06'
      );
    });

    it('single_byte_7_parses_to_7', 0, () => {
      // 单字节 0x07（十进制 7）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '07';
      const withPrefix: string = '0x07';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        7
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        7
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        7
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x07'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '07'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        7
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x07'
      );
    });

    it('single_byte_8_parses_to_8', 0, () => {
      // 单字节 0x08（十进制 8）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '08';
      const withPrefix: string = '0x08';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        8
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        8
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        8
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x08'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '08'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        8
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x08'
      );
    });

    it('single_byte_9_parses_to_9', 0, () => {
      // 单字节 0x09（十进制 9）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '09';
      const withPrefix: string = '0x09';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        9
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        9
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        9
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x09'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '09'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        9
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x09'
      );
    });

    it('single_byte_10_parses_to_10', 0, () => {
      // 单字节 0x0a（十进制 10）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '0a';
      const withPrefix: string = '0x0a';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        10
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        10
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        10
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x0a'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '0a'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        10
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x0a'
      );
    });

    it('single_byte_11_parses_to_11', 0, () => {
      // 单字节 0x0b（十进制 11）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '0b';
      const withPrefix: string = '0x0b';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        11
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        11
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        11
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x0b'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '0b'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        11
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x0b'
      );
    });

    it('single_byte_12_parses_to_12', 0, () => {
      // 单字节 0x0c（十进制 12）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '0c';
      const withPrefix: string = '0x0c';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        12
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        12
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        12
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x0c'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '0c'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        12
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x0c'
      );
    });

    it('single_byte_13_parses_to_13', 0, () => {
      // 单字节 0x0d（十进制 13）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '0d';
      const withPrefix: string = '0x0d';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        13
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        13
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        13
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x0d'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '0d'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        13
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x0d'
      );
    });

    it('single_byte_14_parses_to_14', 0, () => {
      // 单字节 0x0e（十进制 14）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '0e';
      const withPrefix: string = '0x0e';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        14
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        14
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        14
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x0e'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '0e'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        14
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x0e'
      );
    });

    it('single_byte_15_parses_to_15', 0, () => {
      // 单字节 0x0f（十进制 15）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '0f';
      const withPrefix: string = '0x0f';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        15
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        15
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        15
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x0f'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '0f'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        15
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x0f'
      );
    });

    it('single_byte_16_parses_to_16', 0, () => {
      // 单字节 0x10（十进制 16）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '10';
      const withPrefix: string = '0x10';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        16
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        16
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        16
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x10'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '10'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        16
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x10'
      );
    });

    it('single_byte_17_parses_to_17', 0, () => {
      // 单字节 0x11（十进制 17）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '11';
      const withPrefix: string = '0x11';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        17
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        17
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        17
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x11'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '11'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        17
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x11'
      );
    });

    it('single_byte_18_parses_to_18', 0, () => {
      // 单字节 0x12（十进制 18）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '12';
      const withPrefix: string = '0x12';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        18
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        18
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        18
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x12'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '12'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        18
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x12'
      );
    });

    it('single_byte_19_parses_to_19', 0, () => {
      // 单字节 0x13（十进制 19）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '13';
      const withPrefix: string = '0x13';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        19
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        19
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        19
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x13'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '13'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        19
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x13'
      );
    });

    it('single_byte_20_parses_to_20', 0, () => {
      // 单字节 0x14（十进制 20）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '14';
      const withPrefix: string = '0x14';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        20
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        20
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        20
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x14'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '14'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        20
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x14'
      );
    });

    it('single_byte_21_parses_to_21', 0, () => {
      // 单字节 0x15（十进制 21）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '15';
      const withPrefix: string = '0x15';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        21
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        21
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        21
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x15'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '15'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        21
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x15'
      );
    });

    it('single_byte_22_parses_to_22', 0, () => {
      // 单字节 0x16（十进制 22）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '16';
      const withPrefix: string = '0x16';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        22
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        22
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        22
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x16'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '16'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        22
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x16'
      );
    });

    it('single_byte_23_parses_to_23', 0, () => {
      // 单字节 0x17（十进制 23）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '17';
      const withPrefix: string = '0x17';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        23
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        23
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        23
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x17'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '17'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        23
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x17'
      );
    });

    it('single_byte_24_parses_to_24', 0, () => {
      // 单字节 0x18（十进制 24）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '18';
      const withPrefix: string = '0x18';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        24
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        24
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        24
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x18'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '18'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        24
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x18'
      );
    });

    it('single_byte_25_parses_to_25', 0, () => {
      // 单字节 0x19（十进制 25）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '19';
      const withPrefix: string = '0x19';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        25
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        25
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        25
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x19'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '19'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        25
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x19'
      );
    });

    it('single_byte_26_parses_to_26', 0, () => {
      // 单字节 0x1a（十进制 26）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '1a';
      const withPrefix: string = '0x1a';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        26
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        26
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        26
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x1a'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '1a'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        26
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x1a'
      );
    });

    it('single_byte_27_parses_to_27', 0, () => {
      // 单字节 0x1b（十进制 27）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '1b';
      const withPrefix: string = '0x1b';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        27
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        27
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        27
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x1b'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '1b'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        27
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x1b'
      );
    });

    it('single_byte_28_parses_to_28', 0, () => {
      // 单字节 0x1c（十进制 28）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '1c';
      const withPrefix: string = '0x1c';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        28
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        28
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        28
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x1c'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '1c'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        28
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x1c'
      );
    });

    it('single_byte_29_parses_to_29', 0, () => {
      // 单字节 0x1d（十进制 29）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '1d';
      const withPrefix: string = '0x1d';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        29
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        29
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        29
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x1d'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '1d'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        29
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x1d'
      );
    });

    it('single_byte_30_parses_to_30', 0, () => {
      // 单字节 0x1e（十进制 30）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '1e';
      const withPrefix: string = '0x1e';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        30
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        30
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        30
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x1e'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '1e'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        30
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x1e'
      );
    });

    it('single_byte_31_parses_to_31', 0, () => {
      // 单字节 0x1f（十进制 31）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '1f';
      const withPrefix: string = '0x1f';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        31
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        31
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        31
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x1f'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '1f'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        31
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x1f'
      );
    });

    it('single_byte_32_parses_to_32', 0, () => {
      // 单字节 0x20（十进制 32）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '20';
      const withPrefix: string = '0x20';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        32
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        32
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        32
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x20'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '20'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        32
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x20'
      );
    });

    it('single_byte_33_parses_to_33', 0, () => {
      // 单字节 0x21（十进制 33）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '21';
      const withPrefix: string = '0x21';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        33
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        33
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        33
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x21'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '21'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        33
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x21'
      );
    });

    it('single_byte_34_parses_to_34', 0, () => {
      // 单字节 0x22（十进制 34）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '22';
      const withPrefix: string = '0x22';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        34
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        34
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        34
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x22'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '22'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        34
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x22'
      );
    });

    it('single_byte_35_parses_to_35', 0, () => {
      // 单字节 0x23（十进制 35）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '23';
      const withPrefix: string = '0x23';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        35
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        35
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        35
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x23'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '23'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        35
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x23'
      );
    });

    it('single_byte_36_parses_to_36', 0, () => {
      // 单字节 0x24（十进制 36）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '24';
      const withPrefix: string = '0x24';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        36
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        36
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        36
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x24'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '24'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        36
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x24'
      );
    });

    it('single_byte_37_parses_to_37', 0, () => {
      // 单字节 0x25（十进制 37）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '25';
      const withPrefix: string = '0x25';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        37
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        37
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        37
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x25'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '25'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        37
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x25'
      );
    });

    it('single_byte_38_parses_to_38', 0, () => {
      // 单字节 0x26（十进制 38）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '26';
      const withPrefix: string = '0x26';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        38
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        38
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        38
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x26'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '26'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        38
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x26'
      );
    });

    it('single_byte_39_parses_to_39', 0, () => {
      // 单字节 0x27（十进制 39）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '27';
      const withPrefix: string = '0x27';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        39
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        39
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        39
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x27'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '27'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        39
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x27'
      );
    });

    it('single_byte_40_parses_to_40', 0, () => {
      // 单字节 0x28（十进制 40）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '28';
      const withPrefix: string = '0x28';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        40
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        40
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        40
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x28'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '28'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        40
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x28'
      );
    });

    it('single_byte_41_parses_to_41', 0, () => {
      // 单字节 0x29（十进制 41）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '29';
      const withPrefix: string = '0x29';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        41
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        41
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        41
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x29'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '29'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        41
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x29'
      );
    });

    it('single_byte_42_parses_to_42', 0, () => {
      // 单字节 0x2a（十进制 42）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '2a';
      const withPrefix: string = '0x2a';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        42
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        42
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        42
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x2a'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '2a'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        42
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x2a'
      );
    });

    it('single_byte_43_parses_to_43', 0, () => {
      // 单字节 0x2b（十进制 43）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '2b';
      const withPrefix: string = '0x2b';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        43
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        43
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        43
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x2b'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '2b'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        43
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x2b'
      );
    });

    it('single_byte_44_parses_to_44', 0, () => {
      // 单字节 0x2c（十进制 44）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '2c';
      const withPrefix: string = '0x2c';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        44
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        44
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        44
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x2c'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '2c'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        44
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x2c'
      );
    });

    it('single_byte_45_parses_to_45', 0, () => {
      // 单字节 0x2d（十进制 45）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '2d';
      const withPrefix: string = '0x2d';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        45
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        45
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        45
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x2d'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '2d'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        45
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x2d'
      );
    });

    it('single_byte_46_parses_to_46', 0, () => {
      // 单字节 0x2e（十进制 46）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '2e';
      const withPrefix: string = '0x2e';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        46
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        46
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        46
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x2e'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '2e'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        46
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x2e'
      );
    });

    it('single_byte_47_parses_to_47', 0, () => {
      // 单字节 0x2f（十进制 47）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '2f';
      const withPrefix: string = '0x2f';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        47
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        47
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        47
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x2f'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '2f'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        47
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x2f'
      );
    });

    it('single_byte_48_parses_to_48', 0, () => {
      // 单字节 0x30（十进制 48）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '30';
      const withPrefix: string = '0x30';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        48
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        48
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        48
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x30'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '30'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        48
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x30'
      );
    });

    it('single_byte_49_parses_to_49', 0, () => {
      // 单字节 0x31（十进制 49）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '31';
      const withPrefix: string = '0x31';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        49
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        49
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        49
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x31'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '31'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        49
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x31'
      );
    });

    it('single_byte_50_parses_to_50', 0, () => {
      // 单字节 0x32（十进制 50）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '32';
      const withPrefix: string = '0x32';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        50
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        50
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        50
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x32'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '32'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        50
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x32'
      );
    });

    it('single_byte_51_parses_to_51', 0, () => {
      // 单字节 0x33（十进制 51）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '33';
      const withPrefix: string = '0x33';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        51
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        51
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        51
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x33'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '33'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        51
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x33'
      );
    });

    it('single_byte_52_parses_to_52', 0, () => {
      // 单字节 0x34（十进制 52）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '34';
      const withPrefix: string = '0x34';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        52
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        52
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        52
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x34'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '34'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        52
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x34'
      );
    });

    it('single_byte_53_parses_to_53', 0, () => {
      // 单字节 0x35（十进制 53）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '35';
      const withPrefix: string = '0x35';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        53
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        53
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        53
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x35'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '35'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        53
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x35'
      );
    });

    it('single_byte_54_parses_to_54', 0, () => {
      // 单字节 0x36（十进制 54）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '36';
      const withPrefix: string = '0x36';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        54
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        54
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        54
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x36'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '36'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        54
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x36'
      );
    });

    it('single_byte_55_parses_to_55', 0, () => {
      // 单字节 0x37（十进制 55）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '37';
      const withPrefix: string = '0x37';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        55
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        55
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        55
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x37'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '37'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        55
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x37'
      );
    });

    it('single_byte_56_parses_to_56', 0, () => {
      // 单字节 0x38（十进制 56）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '38';
      const withPrefix: string = '0x38';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        56
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        56
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        56
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x38'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '38'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        56
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x38'
      );
    });

    it('single_byte_57_parses_to_57', 0, () => {
      // 单字节 0x39（十进制 57）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '39';
      const withPrefix: string = '0x39';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(withPrefix);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(withPrefix);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        ArrayBufferUtil.isValidHexString(withPrefix)
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex(withPrefix)
      ).assertEqual(
        57
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        57
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
