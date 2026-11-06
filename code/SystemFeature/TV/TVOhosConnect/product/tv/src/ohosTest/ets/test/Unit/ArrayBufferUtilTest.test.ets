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
      expect(
        bytes[0]
      ).assertEqual(
        57
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x39'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '39'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        57
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x39'
      );
    });

    it('single_byte_58_parses_to_58', 0, () => {
      // 单字节 0x3a（十进制 58）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '3a';
      const withPrefix: string = '0x3a';
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
        58
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        58
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        58
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x3a'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '3a'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        58
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x3a'
      );
    });

    it('single_byte_59_parses_to_59', 0, () => {
      // 单字节 0x3b（十进制 59）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '3b';
      const withPrefix: string = '0x3b';
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
        59
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        59
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        59
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x3b'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '3b'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        59
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x3b'
      );
    });

    it('single_byte_60_parses_to_60', 0, () => {
      // 单字节 0x3c（十进制 60）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '3c';
      const withPrefix: string = '0x3c';
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
        60
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        60
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        60
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x3c'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '3c'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        60
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x3c'
      );
    });

    it('single_byte_61_parses_to_61', 0, () => {
      // 单字节 0x3d（十进制 61）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '3d';
      const withPrefix: string = '0x3d';
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
        61
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        61
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        61
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x3d'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '3d'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        61
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x3d'
      );
    });

    it('single_byte_62_parses_to_62', 0, () => {
      // 单字节 0x3e（十进制 62）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '3e';
      const withPrefix: string = '0x3e';
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
        62
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        62
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        62
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x3e'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '3e'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        62
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x3e'
      );
    });

    it('single_byte_63_parses_to_63', 0, () => {
      // 单字节 0x3f（十进制 63）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '3f';
      const withPrefix: string = '0x3f';
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
        63
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        63
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        63
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x3f'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '3f'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        63
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x3f'
      );
    });

    it('single_byte_64_parses_to_64', 0, () => {
      // 单字节 0x40（十进制 64）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '40';
      const withPrefix: string = '0x40';
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
        64
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        64
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        64
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x40'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '40'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        64
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x40'
      );
    });

    it('single_byte_65_parses_to_65', 0, () => {
      // 单字节 0x41（十进制 65）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '41';
      const withPrefix: string = '0x41';
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
        65
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        65
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        65
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x41'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '41'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        65
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x41'
      );
    });

    it('single_byte_66_parses_to_66', 0, () => {
      // 单字节 0x42（十进制 66）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '42';
      const withPrefix: string = '0x42';
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
        66
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        66
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        66
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x42'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '42'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        66
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x42'
      );
    });

    it('single_byte_67_parses_to_67', 0, () => {
      // 单字节 0x43（十进制 67）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '43';
      const withPrefix: string = '0x43';
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
        67
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        67
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        67
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x43'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '43'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        67
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x43'
      );
    });

    it('single_byte_68_parses_to_68', 0, () => {
      // 单字节 0x44（十进制 68）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '44';
      const withPrefix: string = '0x44';
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
        68
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        68
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        68
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x44'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '44'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        68
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x44'
      );
    });

    it('single_byte_69_parses_to_69', 0, () => {
      // 单字节 0x45（十进制 69）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '45';
      const withPrefix: string = '0x45';
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
        69
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        69
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        69
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x45'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '45'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        69
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x45'
      );
    });

    it('single_byte_70_parses_to_70', 0, () => {
      // 单字节 0x46（十进制 70）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '46';
      const withPrefix: string = '0x46';
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
        70
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        70
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        70
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x46'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '46'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        70
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x46'
      );
    });

    it('single_byte_71_parses_to_71', 0, () => {
      // 单字节 0x47（十进制 71）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '47';
      const withPrefix: string = '0x47';
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
        71
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        71
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        71
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x47'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '47'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        71
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x47'
      );
    });

    it('single_byte_72_parses_to_72', 0, () => {
      // 单字节 0x48（十进制 72）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '48';
      const withPrefix: string = '0x48';
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
        72
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        72
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        72
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x48'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '48'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        72
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x48'
      );
    });

    it('single_byte_73_parses_to_73', 0, () => {
      // 单字节 0x49（十进制 73）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '49';
      const withPrefix: string = '0x49';
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
        73
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        73
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        73
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x49'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '49'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        73
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x49'
      );
    });

    it('single_byte_74_parses_to_74', 0, () => {
      // 单字节 0x4a（十进制 74）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '4a';
      const withPrefix: string = '0x4a';
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
        74
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        74
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        74
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x4a'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '4a'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        74
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x4a'
      );
    });

    it('single_byte_75_parses_to_75', 0, () => {
      // 单字节 0x4b（十进制 75）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '4b';
      const withPrefix: string = '0x4b';
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
        75
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        75
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        75
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x4b'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '4b'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        75
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x4b'
      );
    });

    it('single_byte_76_parses_to_76', 0, () => {
      // 单字节 0x4c（十进制 76）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '4c';
      const withPrefix: string = '0x4c';
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
        76
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        76
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        76
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x4c'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '4c'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        76
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x4c'
      );
    });

    it('single_byte_77_parses_to_77', 0, () => {
      // 单字节 0x4d（十进制 77）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '4d';
      const withPrefix: string = '0x4d';
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
        77
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        77
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        77
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x4d'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '4d'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        77
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x4d'
      );
    });

    it('single_byte_78_parses_to_78', 0, () => {
      // 单字节 0x4e（十进制 78）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '4e';
      const withPrefix: string = '0x4e';
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
        78
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        78
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        78
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x4e'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '4e'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        78
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x4e'
      );
    });

    it('single_byte_79_parses_to_79', 0, () => {
      // 单字节 0x4f（十进制 79）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '4f';
      const withPrefix: string = '0x4f';
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
        79
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        79
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        79
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x4f'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '4f'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        79
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x4f'
      );
    });

    it('single_byte_80_parses_to_80', 0, () => {
      // 单字节 0x50（十进制 80）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '50';
      const withPrefix: string = '0x50';
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
        80
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        80
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        80
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x50'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '50'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        80
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x50'
      );
    });

    it('single_byte_81_parses_to_81', 0, () => {
      // 单字节 0x51（十进制 81）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '51';
      const withPrefix: string = '0x51';
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
        81
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        81
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        81
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x51'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '51'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        81
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x51'
      );
    });

    it('single_byte_82_parses_to_82', 0, () => {
      // 单字节 0x52（十进制 82）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '52';
      const withPrefix: string = '0x52';
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
        82
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        82
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        82
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x52'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '52'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        82
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x52'
      );
    });

    it('single_byte_83_parses_to_83', 0, () => {
      // 单字节 0x53（十进制 83）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '53';
      const withPrefix: string = '0x53';
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
        83
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        83
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        83
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x53'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '53'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        83
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x53'
      );
    });

    it('single_byte_84_parses_to_84', 0, () => {
      // 单字节 0x54（十进制 84）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '54';
      const withPrefix: string = '0x54';
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
        84
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        84
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        84
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x54'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '54'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        84
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x54'
      );
    });

    it('single_byte_85_parses_to_85', 0, () => {
      // 单字节 0x55（十进制 85）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '55';
      const withPrefix: string = '0x55';
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
        85
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        85
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        85
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x55'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '55'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        85
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x55'
      );
    });

    it('single_byte_86_parses_to_86', 0, () => {
      // 单字节 0x56（十进制 86）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '56';
      const withPrefix: string = '0x56';
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
        86
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        86
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        86
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x56'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '56'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        86
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x56'
      );
    });

    it('single_byte_87_parses_to_87', 0, () => {
      // 单字节 0x57（十进制 87）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '57';
      const withPrefix: string = '0x57';
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
        87
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        87
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        87
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x57'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '57'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        87
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x57'
      );
    });

    it('single_byte_88_parses_to_88', 0, () => {
      // 单字节 0x58（十进制 88）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '58';
      const withPrefix: string = '0x58';
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
        88
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        88
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        88
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x58'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '58'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        88
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x58'
      );
    });

    it('single_byte_89_parses_to_89', 0, () => {
      // 单字节 0x59（十进制 89）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '59';
      const withPrefix: string = '0x59';
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
        89
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        89
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        89
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x59'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '59'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        89
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x59'
      );
    });

    it('single_byte_90_parses_to_90', 0, () => {
      // 单字节 0x5a（十进制 90）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '5a';
      const withPrefix: string = '0x5a';
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
        90
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        90
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        90
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x5a'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '5a'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        90
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x5a'
      );
    });

    it('single_byte_91_parses_to_91', 0, () => {
      // 单字节 0x5b（十进制 91）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '5b';
      const withPrefix: string = '0x5b';
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
        91
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        91
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        91
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x5b'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '5b'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        91
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x5b'
      );
    });

    it('single_byte_92_parses_to_92', 0, () => {
      // 单字节 0x5c（十进制 92）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '5c';
      const withPrefix: string = '0x5c';
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
        92
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        92
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        92
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x5c'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '5c'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        92
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x5c'
      );
    });

    it('single_byte_93_parses_to_93', 0, () => {
      // 单字节 0x5d（十进制 93）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '5d';
      const withPrefix: string = '0x5d';
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
        93
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        93
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        93
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x5d'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '5d'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        93
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x5d'
      );
    });

    it('single_byte_94_parses_to_94', 0, () => {
      // 单字节 0x5e（十进制 94）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '5e';
      const withPrefix: string = '0x5e';
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
        94
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        94
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        94
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x5e'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '5e'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        94
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x5e'
      );
    });

    it('single_byte_95_parses_to_95', 0, () => {
      // 单字节 0x5f（十进制 95）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '5f';
      const withPrefix: string = '0x5f';
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
        95
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        95
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        95
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x5f'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '5f'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        95
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x5f'
      );
    });

    it('single_byte_96_parses_to_96', 0, () => {
      // 单字节 0x60（十进制 96）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '60';
      const withPrefix: string = '0x60';
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
        96
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        96
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        96
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x60'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '60'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        96
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x60'
      );
    });

    it('single_byte_97_parses_to_97', 0, () => {
      // 单字节 0x61（十进制 97）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '61';
      const withPrefix: string = '0x61';
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
        97
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        97
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        97
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x61'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '61'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        97
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x61'
      );
    });

    it('single_byte_98_parses_to_98', 0, () => {
      // 单字节 0x62（十进制 98）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '62';
      const withPrefix: string = '0x62';
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
        98
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        98
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        98
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x62'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '62'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        98
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x62'
      );
    });

    it('single_byte_99_parses_to_99', 0, () => {
      // 单字节 0x63（十进制 99）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '63';
      const withPrefix: string = '0x63';
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
        99
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        99
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        99
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x63'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '63'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        99
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x63'
      );
    });

    it('single_byte_100_parses_to_100', 0, () => {
      // 单字节 0x64（十进制 100）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '64';
      const withPrefix: string = '0x64';
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
        100
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        100
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        100
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x64'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '64'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        100
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x64'
      );
    });

    it('single_byte_101_parses_to_101', 0, () => {
      // 单字节 0x65（十进制 101）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '65';
      const withPrefix: string = '0x65';
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
        101
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        101
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        101
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x65'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '65'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        101
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x65'
      );
    });

    it('single_byte_102_parses_to_102', 0, () => {
      // 单字节 0x66（十进制 102）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '66';
      const withPrefix: string = '0x66';
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
        102
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        102
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        102
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x66'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '66'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        102
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x66'
      );
    });

    it('single_byte_103_parses_to_103', 0, () => {
      // 单字节 0x67（十进制 103）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '67';
      const withPrefix: string = '0x67';
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
        103
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        103
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        103
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x67'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '67'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        103
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x67'
      );
    });

    it('single_byte_104_parses_to_104', 0, () => {
      // 单字节 0x68（十进制 104）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '68';
      const withPrefix: string = '0x68';
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
        104
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        104
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        104
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x68'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '68'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        104
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x68'
      );
    });

    it('single_byte_105_parses_to_105', 0, () => {
      // 单字节 0x69（十进制 105）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '69';
      const withPrefix: string = '0x69';
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
        105
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        105
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        105
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x69'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '69'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        105
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x69'
      );
    });

    it('single_byte_106_parses_to_106', 0, () => {
      // 单字节 0x6a（十进制 106）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '6a';
      const withPrefix: string = '0x6a';
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
        106
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        106
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        106
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x6a'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '6a'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        106
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x6a'
      );
    });

    it('single_byte_107_parses_to_107', 0, () => {
      // 单字节 0x6b（十进制 107）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '6b';
      const withPrefix: string = '0x6b';
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
        107
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        107
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        107
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x6b'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '6b'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        107
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x6b'
      );
    });

    it('single_byte_108_parses_to_108', 0, () => {
      // 单字节 0x6c（十进制 108）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '6c';
      const withPrefix: string = '0x6c';
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
        108
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        108
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        108
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x6c'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '6c'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        108
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x6c'
      );
    });

    it('single_byte_109_parses_to_109', 0, () => {
      // 单字节 0x6d（十进制 109）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '6d';
      const withPrefix: string = '0x6d';
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
        109
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        109
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        109
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x6d'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '6d'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        109
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x6d'
      );
    });

    it('single_byte_110_parses_to_110', 0, () => {
      // 单字节 0x6e（十进制 110）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '6e';
      const withPrefix: string = '0x6e';
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
        110
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        110
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        110
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x6e'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '6e'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        110
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x6e'
      );
    });

    it('single_byte_111_parses_to_111', 0, () => {
      // 单字节 0x6f（十进制 111）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '6f';
      const withPrefix: string = '0x6f';
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
        111
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        111
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        111
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x6f'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '6f'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        111
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x6f'
      );
    });

    it('single_byte_112_parses_to_112', 0, () => {
      // 单字节 0x70（十进制 112）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '70';
      const withPrefix: string = '0x70';
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
        112
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        112
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        112
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x70'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '70'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        112
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x70'
      );
    });

    it('single_byte_113_parses_to_113', 0, () => {
      // 单字节 0x71（十进制 113）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '71';
      const withPrefix: string = '0x71';
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
        113
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        113
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        113
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x71'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '71'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        113
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x71'
      );
    });

    it('single_byte_114_parses_to_114', 0, () => {
      // 单字节 0x72（十进制 114）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '72';
      const withPrefix: string = '0x72';
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
        114
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        114
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        114
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x72'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '72'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        114
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x72'
      );
    });

    it('single_byte_115_parses_to_115', 0, () => {
      // 单字节 0x73（十进制 115）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '73';
      const withPrefix: string = '0x73';
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
        115
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        115
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        115
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x73'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '73'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        115
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x73'
      );
    });

    it('single_byte_116_parses_to_116', 0, () => {
      // 单字节 0x74（十进制 116）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '74';
      const withPrefix: string = '0x74';
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
        116
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        116
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        116
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x74'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '74'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        116
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x74'
      );
    });

    it('single_byte_117_parses_to_117', 0, () => {
      // 单字节 0x75（十进制 117）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '75';
      const withPrefix: string = '0x75';
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
        117
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        117
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        117
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x75'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '75'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        117
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x75'
      );
    });

    it('single_byte_118_parses_to_118', 0, () => {
      // 单字节 0x76（十进制 118）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '76';
      const withPrefix: string = '0x76';
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
        118
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        118
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        118
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x76'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '76'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        118
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x76'
      );
    });

    it('single_byte_119_parses_to_119', 0, () => {
      // 单字节 0x77（十进制 119）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '77';
      const withPrefix: string = '0x77';
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
        119
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        119
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        119
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x77'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '77'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        119
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x77'
      );
    });

    it('single_byte_120_parses_to_120', 0, () => {
      // 单字节 0x78（十进制 120）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '78';
      const withPrefix: string = '0x78';
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
        120
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        120
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        120
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x78'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '78'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        120
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x78'
      );
    });

    it('single_byte_121_parses_to_121', 0, () => {
      // 单字节 0x79（十进制 121）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '79';
      const withPrefix: string = '0x79';
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
        121
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        121
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        121
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x79'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '79'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        121
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x79'
      );
    });

    it('single_byte_122_parses_to_122', 0, () => {
      // 单字节 0x7a（十进制 122）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '7a';
      const withPrefix: string = '0x7a';
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
        122
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        122
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        122
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x7a'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '7a'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        122
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x7a'
      );
    });

    it('single_byte_123_parses_to_123', 0, () => {
      // 单字节 0x7b（十进制 123）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '7b';
      const withPrefix: string = '0x7b';
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
        123
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        123
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        123
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x7b'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '7b'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        123
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x7b'
      );
    });

    it('single_byte_124_parses_to_124', 0, () => {
      // 单字节 0x7c（十进制 124）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '7c';
      const withPrefix: string = '0x7c';
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
        124
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        124
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        124
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x7c'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '7c'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        124
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x7c'
      );
    });

    it('single_byte_125_parses_to_125', 0, () => {
      // 单字节 0x7d（十进制 125）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '7d';
      const withPrefix: string = '0x7d';
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
        125
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        125
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        125
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x7d'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '7d'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        125
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x7d'
      );
    });

    it('single_byte_126_parses_to_126', 0, () => {
      // 单字节 0x7e（十进制 126）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '7e';
      const withPrefix: string = '0x7e';
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
        126
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        126
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        126
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x7e'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '7e'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        126
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x7e'
      );
    });

    it('single_byte_127_parses_to_127', 0, () => {
      // 单字节 0x7f（十进制 127）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '7f';
      const withPrefix: string = '0x7f';
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
        127
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        127
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        127
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x7f'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '7f'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        127
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x7f'
      );
    });

    it('single_byte_128_parses_to_128', 0, () => {
      // 单字节 0x80（十进制 128）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '80';
      const withPrefix: string = '0x80';
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
        128
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        128
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        128
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x80'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '80'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        128
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x80'
      );
    });

    it('single_byte_129_parses_to_129', 0, () => {
      // 单字节 0x81（十进制 129）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '81';
      const withPrefix: string = '0x81';
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
        129
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        129
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        129
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x81'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '81'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        129
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x81'
      );
    });

    it('single_byte_130_parses_to_130', 0, () => {
      // 单字节 0x82（十进制 130）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '82';
      const withPrefix: string = '0x82';
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
        130
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        130
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        130
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x82'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '82'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        130
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x82'
      );
    });

    it('single_byte_131_parses_to_131', 0, () => {
      // 单字节 0x83（十进制 131）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '83';
      const withPrefix: string = '0x83';
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
        131
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        131
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        131
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x83'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '83'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        131
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x83'
      );
    });

    it('single_byte_132_parses_to_132', 0, () => {
      // 单字节 0x84（十进制 132）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '84';
      const withPrefix: string = '0x84';
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
        132
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        132
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        132
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x84'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '84'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        132
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x84'
      );
    });

    it('single_byte_133_parses_to_133', 0, () => {
      // 单字节 0x85（十进制 133）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '85';
      const withPrefix: string = '0x85';
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
        133
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        133
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        133
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x85'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '85'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        133
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x85'
      );
    });

    it('single_byte_134_parses_to_134', 0, () => {
      // 单字节 0x86（十进制 134）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '86';
      const withPrefix: string = '0x86';
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
        134
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        134
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        134
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x86'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '86'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        134
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x86'
      );
    });

    it('single_byte_135_parses_to_135', 0, () => {
      // 单字节 0x87（十进制 135）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '87';
      const withPrefix: string = '0x87';
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
        135
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        135
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        135
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x87'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '87'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        135
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x87'
      );
    });

    it('single_byte_136_parses_to_136', 0, () => {
      // 单字节 0x88（十进制 136）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '88';
      const withPrefix: string = '0x88';
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
        136
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        136
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        136
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x88'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '88'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        136
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x88'
      );
    });

    it('single_byte_137_parses_to_137', 0, () => {
      // 单字节 0x89（十进制 137）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '89';
      const withPrefix: string = '0x89';
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
        137
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        137
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        137
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x89'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '89'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        137
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x89'
      );
    });

    it('single_byte_138_parses_to_138', 0, () => {
      // 单字节 0x8a（十进制 138）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '8a';
      const withPrefix: string = '0x8a';
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
        138
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        138
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        138
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x8a'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '8a'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        138
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x8a'
      );
    });

    it('single_byte_139_parses_to_139', 0, () => {
      // 单字节 0x8b（十进制 139）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '8b';
      const withPrefix: string = '0x8b';
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
        139
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        139
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        139
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x8b'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '8b'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        139
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x8b'
      );
    });

    it('single_byte_140_parses_to_140', 0, () => {
      // 单字节 0x8c（十进制 140）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '8c';
      const withPrefix: string = '0x8c';
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
        140
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        140
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        140
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x8c'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '8c'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        140
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x8c'
      );
    });

    it('single_byte_141_parses_to_141', 0, () => {
      // 单字节 0x8d（十进制 141）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '8d';
      const withPrefix: string = '0x8d';
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
        141
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        141
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        141
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x8d'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '8d'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        141
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x8d'
      );
    });

    it('single_byte_142_parses_to_142', 0, () => {
      // 单字节 0x8e（十进制 142）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '8e';
      const withPrefix: string = '0x8e';
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
        142
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        142
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        142
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x8e'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '8e'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        142
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x8e'
      );
    });

    it('single_byte_143_parses_to_143', 0, () => {
      // 单字节 0x8f（十进制 143）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '8f';
      const withPrefix: string = '0x8f';
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
        143
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        143
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        143
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x8f'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '8f'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        143
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x8f'
      );
    });

    it('single_byte_144_parses_to_144', 0, () => {
      // 单字节 0x90（十进制 144）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '90';
      const withPrefix: string = '0x90';
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
        144
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        144
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        144
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x90'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '90'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        144
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x90'
      );
    });

    it('single_byte_145_parses_to_145', 0, () => {
      // 单字节 0x91（十进制 145）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '91';
      const withPrefix: string = '0x91';
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
        145
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        145
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        145
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x91'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '91'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        145
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x91'
      );
    });

    it('single_byte_146_parses_to_146', 0, () => {
      // 单字节 0x92（十进制 146）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '92';
      const withPrefix: string = '0x92';
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
        146
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        146
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        146
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x92'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '92'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        146
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x92'
      );
    });

    it('single_byte_147_parses_to_147', 0, () => {
      // 单字节 0x93（十进制 147）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '93';
      const withPrefix: string = '0x93';
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
        147
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        147
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        147
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x93'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '93'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        147
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x93'
      );
    });

    it('single_byte_148_parses_to_148', 0, () => {
      // 单字节 0x94（十进制 148）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '94';
      const withPrefix: string = '0x94';
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
        148
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        148
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        148
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x94'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '94'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        148
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x94'
      );
    });

    it('single_byte_149_parses_to_149', 0, () => {
      // 单字节 0x95（十进制 149）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '95';
      const withPrefix: string = '0x95';
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
        149
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        149
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        149
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x95'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '95'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        149
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x95'
      );
    });

    it('single_byte_150_parses_to_150', 0, () => {
      // 单字节 0x96（十进制 150）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '96';
      const withPrefix: string = '0x96';
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
        150
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        150
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        150
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x96'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '96'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        150
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x96'
      );
    });

    it('single_byte_151_parses_to_151', 0, () => {
      // 单字节 0x97（十进制 151）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '97';
      const withPrefix: string = '0x97';
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
        151
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        151
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        151
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x97'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '97'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        151
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x97'
      );
    });

    it('single_byte_152_parses_to_152', 0, () => {
      // 单字节 0x98（十进制 152）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '98';
      const withPrefix: string = '0x98';
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
        152
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        152
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        152
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x98'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '98'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        152
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x98'
      );
    });

    it('single_byte_153_parses_to_153', 0, () => {
      // 单字节 0x99（十进制 153）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '99';
      const withPrefix: string = '0x99';
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
        153
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        153
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        153
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x99'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '99'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        153
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x99'
      );
    });

    it('single_byte_154_parses_to_154', 0, () => {
      // 单字节 0x9a（十进制 154）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '9a';
      const withPrefix: string = '0x9a';
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
        154
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        154
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        154
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x9a'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '9a'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        154
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x9a'
      );
    });

    it('single_byte_155_parses_to_155', 0, () => {
      // 单字节 0x9b（十进制 155）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '9b';
      const withPrefix: string = '0x9b';
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
        155
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        155
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        155
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x9b'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '9b'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        155
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x9b'
      );
    });

    it('single_byte_156_parses_to_156', 0, () => {
      // 单字节 0x9c（十进制 156）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '9c';
      const withPrefix: string = '0x9c';
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
        156
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        156
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        156
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x9c'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '9c'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        156
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x9c'
      );
    });

    it('single_byte_157_parses_to_157', 0, () => {
      // 单字节 0x9d（十进制 157）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '9d';
      const withPrefix: string = '0x9d';
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
        157
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        157
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        157
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x9d'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '9d'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        157
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x9d'
      );
    });

    it('single_byte_158_parses_to_158', 0, () => {
      // 单字节 0x9e（十进制 158）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '9e';
      const withPrefix: string = '0x9e';
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
        158
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        158
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        158
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x9e'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '9e'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        158
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x9e'
      );
    });

    it('single_byte_159_parses_to_159', 0, () => {
      // 单字节 0x9f（十进制 159）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = '9f';
      const withPrefix: string = '0x9f';
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
        159
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        159
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        159
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0x9f'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        '9f'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        159
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x9f'
      );
    });

    it('single_byte_160_parses_to_160', 0, () => {
      // 单字节 0xa0（十进制 160）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'a0';
      const withPrefix: string = '0xa0';
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
        160
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        160
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        160
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xa0'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'a0'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        160
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xa0'
      );
    });

    it('single_byte_161_parses_to_161', 0, () => {
      // 单字节 0xa1（十进制 161）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'a1';
      const withPrefix: string = '0xa1';
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
        161
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        161
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        161
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xa1'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'a1'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        161
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xa1'
      );
    });

    it('single_byte_162_parses_to_162', 0, () => {
      // 单字节 0xa2（十进制 162）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'a2';
      const withPrefix: string = '0xa2';
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
        162
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        162
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        162
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xa2'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'a2'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        162
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xa2'
      );
    });

    it('single_byte_163_parses_to_163', 0, () => {
      // 单字节 0xa3（十进制 163）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'a3';
      const withPrefix: string = '0xa3';
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
        163
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        163
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        163
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xa3'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'a3'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        163
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xa3'
      );
    });

    it('single_byte_164_parses_to_164', 0, () => {
      // 单字节 0xa4（十进制 164）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'a4';
      const withPrefix: string = '0xa4';
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
        164
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        164
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        164
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xa4'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'a4'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        164
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xa4'
      );
    });

    it('single_byte_165_parses_to_165', 0, () => {
      // 单字节 0xa5（十进制 165）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'a5';
      const withPrefix: string = '0xa5';
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
        165
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        165
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        165
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xa5'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'a5'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        165
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xa5'
      );
    });

    it('single_byte_166_parses_to_166', 0, () => {
      // 单字节 0xa6（十进制 166）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'a6';
      const withPrefix: string = '0xa6';
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
        166
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        166
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        166
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xa6'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'a6'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        166
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xa6'
      );
    });

    it('single_byte_167_parses_to_167', 0, () => {
      // 单字节 0xa7（十进制 167）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'a7';
      const withPrefix: string = '0xa7';
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
        167
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        167
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        167
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xa7'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'a7'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        167
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xa7'
      );
    });

    it('single_byte_168_parses_to_168', 0, () => {
      // 单字节 0xa8（十进制 168）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'a8';
      const withPrefix: string = '0xa8';
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
        168
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        168
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        168
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xa8'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'a8'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        168
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xa8'
      );
    });

    it('single_byte_169_parses_to_169', 0, () => {
      // 单字节 0xa9（十进制 169）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'a9';
      const withPrefix: string = '0xa9';
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
        169
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        169
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        169
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xa9'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'a9'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        169
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xa9'
      );
    });

    it('single_byte_170_parses_to_170', 0, () => {
      // 单字节 0xaa（十进制 170）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'aa';
      const withPrefix: string = '0xaa';
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
        170
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        170
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        170
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xaa'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'aa'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        170
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xaa'
      );
    });

    it('single_byte_171_parses_to_171', 0, () => {
      // 单字节 0xab（十进制 171）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'ab';
      const withPrefix: string = '0xab';
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
        171
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        171
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        171
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xab'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'ab'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        171
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xab'
      );
    });

    it('single_byte_172_parses_to_172', 0, () => {
      // 单字节 0xac（十进制 172）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'ac';
      const withPrefix: string = '0xac';
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
        172
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        172
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        172
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xac'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'ac'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        172
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xac'
      );
    });

    it('single_byte_173_parses_to_173', 0, () => {
      // 单字节 0xad（十进制 173）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'ad';
      const withPrefix: string = '0xad';
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
        173
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        173
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        173
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xad'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'ad'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        173
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xad'
      );
    });

    it('single_byte_174_parses_to_174', 0, () => {
      // 单字节 0xae（十进制 174）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'ae';
      const withPrefix: string = '0xae';
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
        174
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        174
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        174
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xae'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'ae'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        174
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xae'
      );
    });

    it('single_byte_175_parses_to_175', 0, () => {
      // 单字节 0xaf（十进制 175）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'af';
      const withPrefix: string = '0xaf';
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
        175
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        175
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        175
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xaf'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'af'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        175
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xaf'
      );
    });

    it('single_byte_176_parses_to_176', 0, () => {
      // 单字节 0xb0（十进制 176）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'b0';
      const withPrefix: string = '0xb0';
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
        176
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        176
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        176
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xb0'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'b0'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        176
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xb0'
      );
    });

    it('single_byte_177_parses_to_177', 0, () => {
      // 单字节 0xb1（十进制 177）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'b1';
      const withPrefix: string = '0xb1';
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
        177
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        177
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        177
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xb1'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'b1'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        177
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xb1'
      );
    });

    it('single_byte_178_parses_to_178', 0, () => {
      // 单字节 0xb2（十进制 178）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'b2';
      const withPrefix: string = '0xb2';
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
        178
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        178
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        178
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xb2'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'b2'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        178
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xb2'
      );
    });

    it('single_byte_179_parses_to_179', 0, () => {
      // 单字节 0xb3（十进制 179）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'b3';
      const withPrefix: string = '0xb3';
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
        179
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        179
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        179
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xb3'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'b3'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        179
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xb3'
      );
    });

    it('single_byte_180_parses_to_180', 0, () => {
      // 单字节 0xb4（十进制 180）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'b4';
      const withPrefix: string = '0xb4';
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
        180
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        180
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        180
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xb4'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'b4'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        180
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xb4'
      );
    });

    it('single_byte_181_parses_to_181', 0, () => {
      // 单字节 0xb5（十进制 181）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'b5';
      const withPrefix: string = '0xb5';
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
        181
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        181
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        181
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xb5'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'b5'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        181
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xb5'
      );
    });

    it('single_byte_182_parses_to_182', 0, () => {
      // 单字节 0xb6（十进制 182）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'b6';
      const withPrefix: string = '0xb6';
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
        182
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        182
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        182
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xb6'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'b6'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        182
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xb6'
      );
    });

    it('single_byte_183_parses_to_183', 0, () => {
      // 单字节 0xb7（十进制 183）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'b7';
      const withPrefix: string = '0xb7';
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
        183
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        183
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        183
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xb7'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'b7'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        183
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xb7'
      );
    });

    it('single_byte_184_parses_to_184', 0, () => {
      // 单字节 0xb8（十进制 184）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'b8';
      const withPrefix: string = '0xb8';
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
        184
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        184
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        184
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xb8'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'b8'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        184
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xb8'
      );
    });

    it('single_byte_185_parses_to_185', 0, () => {
      // 单字节 0xb9（十进制 185）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'b9';
      const withPrefix: string = '0xb9';
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
        185
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        185
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        185
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xb9'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'b9'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        185
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xb9'
      );
    });

    it('single_byte_186_parses_to_186', 0, () => {
      // 单字节 0xba（十进制 186）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'ba';
      const withPrefix: string = '0xba';
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
        186
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        186
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        186
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xba'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'ba'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        186
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xba'
      );
    });

    it('single_byte_187_parses_to_187', 0, () => {
      // 单字节 0xbb（十进制 187）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'bb';
      const withPrefix: string = '0xbb';
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
        187
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        187
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        187
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xbb'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'bb'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        187
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xbb'
      );
    });

    it('single_byte_188_parses_to_188', 0, () => {
      // 单字节 0xbc（十进制 188）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'bc';
      const withPrefix: string = '0xbc';
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
        188
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        188
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        188
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xbc'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'bc'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        188
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xbc'
      );
    });

    it('single_byte_189_parses_to_189', 0, () => {
      // 单字节 0xbd（十进制 189）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'bd';
      const withPrefix: string = '0xbd';
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
        189
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        189
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        189
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xbd'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'bd'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        189
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xbd'
      );
    });

    it('single_byte_190_parses_to_190', 0, () => {
      // 单字节 0xbe（十进制 190）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'be';
      const withPrefix: string = '0xbe';
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
        190
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        190
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        190
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xbe'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'be'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        190
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xbe'
      );
    });

    it('single_byte_191_parses_to_191', 0, () => {
      // 单字节 0xbf（十进制 191）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'bf';
      const withPrefix: string = '0xbf';
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
        191
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        191
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        191
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xbf'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'bf'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        191
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xbf'
      );
    });

    it('single_byte_192_parses_to_192', 0, () => {
      // 单字节 0xc0（十进制 192）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'c0';
      const withPrefix: string = '0xc0';
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
        192
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        192
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        192
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xc0'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'c0'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        192
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xc0'
      );
    });

    it('single_byte_193_parses_to_193', 0, () => {
      // 单字节 0xc1（十进制 193）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'c1';
      const withPrefix: string = '0xc1';
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
        193
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        193
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        193
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xc1'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'c1'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        193
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xc1'
      );
    });

    it('single_byte_194_parses_to_194', 0, () => {
      // 单字节 0xc2（十进制 194）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'c2';
      const withPrefix: string = '0xc2';
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
        194
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        194
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        194
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xc2'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'c2'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        194
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xc2'
      );
    });

    it('single_byte_195_parses_to_195', 0, () => {
      // 单字节 0xc3（十进制 195）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'c3';
      const withPrefix: string = '0xc3';
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
        195
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        195
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        195
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xc3'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'c3'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        195
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xc3'
      );
    });

    it('single_byte_196_parses_to_196', 0, () => {
      // 单字节 0xc4（十进制 196）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'c4';
      const withPrefix: string = '0xc4';
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
        196
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        196
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        196
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xc4'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'c4'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        196
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xc4'
      );
    });

    it('single_byte_197_parses_to_197', 0, () => {
      // 单字节 0xc5（十进制 197）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'c5';
      const withPrefix: string = '0xc5';
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
        197
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        197
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        197
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xc5'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'c5'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        197
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xc5'
      );
    });

    it('single_byte_198_parses_to_198', 0, () => {
      // 单字节 0xc6（十进制 198）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'c6';
      const withPrefix: string = '0xc6';
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
        198
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        198
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        198
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xc6'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'c6'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        198
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xc6'
      );
    });

    it('single_byte_199_parses_to_199', 0, () => {
      // 单字节 0xc7（十进制 199）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'c7';
      const withPrefix: string = '0xc7';
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
        199
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        199
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        199
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xc7'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'c7'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        199
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xc7'
      );
    });

    it('single_byte_200_parses_to_200', 0, () => {
      // 单字节 0xc8（十进制 200）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'c8';
      const withPrefix: string = '0xc8';
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
        200
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        200
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        200
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xc8'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'c8'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        200
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xc8'
      );
    });

    it('single_byte_201_parses_to_201', 0, () => {
      // 单字节 0xc9（十进制 201）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'c9';
      const withPrefix: string = '0xc9';
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
        201
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        201
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        201
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xc9'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'c9'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        201
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xc9'
      );
    });

    it('single_byte_202_parses_to_202', 0, () => {
      // 单字节 0xca（十进制 202）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'ca';
      const withPrefix: string = '0xca';
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
        202
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        202
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        202
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xca'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'ca'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        202
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xca'
      );
    });

    it('single_byte_203_parses_to_203', 0, () => {
      // 单字节 0xcb（十进制 203）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'cb';
      const withPrefix: string = '0xcb';
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
        203
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        203
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        203
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xcb'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'cb'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        203
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xcb'
      );
    });

    it('single_byte_204_parses_to_204', 0, () => {
      // 单字节 0xcc（十进制 204）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'cc';
      const withPrefix: string = '0xcc';
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
        204
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        204
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        204
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xcc'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'cc'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        204
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xcc'
      );
    });

    it('single_byte_205_parses_to_205', 0, () => {
      // 单字节 0xcd（十进制 205）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'cd';
      const withPrefix: string = '0xcd';
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
        205
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        205
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        205
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xcd'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'cd'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        205
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xcd'
      );
    });

    it('single_byte_206_parses_to_206', 0, () => {
      // 单字节 0xce（十进制 206）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'ce';
      const withPrefix: string = '0xce';
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
        206
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        206
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        206
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xce'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'ce'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        206
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xce'
      );
    });

    it('single_byte_207_parses_to_207', 0, () => {
      // 单字节 0xcf（十进制 207）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'cf';
      const withPrefix: string = '0xcf';
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
        207
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        207
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        207
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xcf'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'cf'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        207
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xcf'
      );
    });

    it('single_byte_208_parses_to_208', 0, () => {
      // 单字节 0xd0（十进制 208）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'd0';
      const withPrefix: string = '0xd0';
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
        208
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        208
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        208
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xd0'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'd0'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        208
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xd0'
      );
    });

    it('single_byte_209_parses_to_209', 0, () => {
      // 单字节 0xd1（十进制 209）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'd1';
      const withPrefix: string = '0xd1';
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
        209
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        209
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        209
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xd1'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'd1'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        209
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xd1'
      );
    });

    it('single_byte_210_parses_to_210', 0, () => {
      // 单字节 0xd2（十进制 210）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'd2';
      const withPrefix: string = '0xd2';
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
        210
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        210
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        210
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xd2'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'd2'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        210
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xd2'
      );
    });

    it('single_byte_211_parses_to_211', 0, () => {
      // 单字节 0xd3（十进制 211）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'd3';
      const withPrefix: string = '0xd3';
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
        211
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        211
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        211
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xd3'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'd3'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        211
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xd3'
      );
    });

    it('single_byte_212_parses_to_212', 0, () => {
      // 单字节 0xd4（十进制 212）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'd4';
      const withPrefix: string = '0xd4';
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
        212
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        212
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        212
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xd4'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'd4'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        212
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xd4'
      );
    });

    it('single_byte_213_parses_to_213', 0, () => {
      // 单字节 0xd5（十进制 213）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'd5';
      const withPrefix: string = '0xd5';
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
        213
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        213
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        213
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xd5'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'd5'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        213
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xd5'
      );
    });

    it('single_byte_214_parses_to_214', 0, () => {
      // 单字节 0xd6（十进制 214）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'd6';
      const withPrefix: string = '0xd6';
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
        214
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        214
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        214
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xd6'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'd6'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        214
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xd6'
      );
    });

    it('single_byte_215_parses_to_215', 0, () => {
      // 单字节 0xd7（十进制 215）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'd7';
      const withPrefix: string = '0xd7';
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
        215
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        215
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        215
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xd7'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'd7'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        215
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xd7'
      );
    });

    it('single_byte_216_parses_to_216', 0, () => {
      // 单字节 0xd8（十进制 216）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = (216).toString(16);
      const withPrefix: string = '0xd8';
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
        216
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        216
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        216
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xd8'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        hex
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        216
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xd8'
      );
    });

    it('single_byte_217_parses_to_217', 0, () => {
      // 单字节 0xd9（十进制 217）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'd9';
      const withPrefix: string = '0xd9';
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
        217
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        217
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        217
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xd9'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'd9'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        217
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xd9'
      );
    });

    it('single_byte_218_parses_to_218', 0, () => {
      // 单字节 0xda（十进制 218）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'da';
      const withPrefix: string = '0xda';
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
        218
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        218
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        218
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xda'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'da'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        218
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xda'
      );
    });

    it('single_byte_219_parses_to_219', 0, () => {
      // 单字节 0xdb（十进制 219）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'db';
      const withPrefix: string = '0xdb';
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
        219
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        219
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        219
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xdb'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'db'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        219
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xdb'
      );
    });

    it('single_byte_220_parses_to_220', 0, () => {
      // 单字节 0xdc（十进制 220）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'dc';
      const withPrefix: string = '0xdc';
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
        220
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        220
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        220
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xdc'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'dc'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        220
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xdc'
      );
    });

    it('single_byte_221_parses_to_221', 0, () => {
      // 单字节 0xdd（十进制 221）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'dd';
      const withPrefix: string = '0xdd';
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
        221
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        221
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        221
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xdd'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'dd'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        221
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xdd'
      );
    });

    it('single_byte_222_parses_to_222', 0, () => {
      // 单字节 0xde（十进制 222）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'de';
      const withPrefix: string = '0xde';
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
        222
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        222
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        222
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xde'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'de'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        222
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xde'
      );
    });

    it('single_byte_223_parses_to_223', 0, () => {
      // 单字节 0xdf（十进制 223）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'df';
      const withPrefix: string = '0xdf';
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
        223
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        223
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        223
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xdf'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'df'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        223
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xdf'
      );
    });

    it('single_byte_224_parses_to_224', 0, () => {
      // 单字节 0xe0（十进制 224）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'e0';
      const withPrefix: string = '0xe0';
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
        224
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        224
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        224
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xe0'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'e0'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        224
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xe0'
      );
    });

    it('single_byte_225_parses_to_225', 0, () => {
      // 单字节 0xe1（十进制 225）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'e1';
      const withPrefix: string = '0xe1';
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
        225
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        225
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        225
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xe1'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'e1'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        225
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xe1'
      );
    });

    it('single_byte_226_parses_to_226', 0, () => {
      // 单字节 0xe2（十进制 226）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'e2';
      const withPrefix: string = '0xe2';
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
        226
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        226
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        226
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xe2'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'e2'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        226
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xe2'
      );
    });

    it('single_byte_227_parses_to_227', 0, () => {
      // 单字节 0xe3（十进制 227）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'e3';
      const withPrefix: string = '0xe3';
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
        227
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        227
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        227
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xe3'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'e3'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        227
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xe3'
      );
    });

    it('single_byte_228_parses_to_228', 0, () => {
      // 单字节 0xe4（十进制 228）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'e4';
      const withPrefix: string = '0xe4';
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
        228
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        228
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        228
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xe4'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'e4'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        228
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xe4'
      );
    });

    it('single_byte_229_parses_to_229', 0, () => {
      // 单字节 0xe5（十进制 229）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'e5';
      const withPrefix: string = '0xe5';
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
        229
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        229
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        229
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xe5'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'e5'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        229
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xe5'
      );
    });

    it('single_byte_230_parses_to_230', 0, () => {
      // 单字节 0xe6（十进制 230）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'e6';
      const withPrefix: string = '0xe6';
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
        230
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        230
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        230
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xe6'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'e6'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        230
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xe6'
      );
    });

    it('single_byte_231_parses_to_231', 0, () => {
      // 单字节 0xe7（十进制 231）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'e7';
      const withPrefix: string = '0xe7';
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
        231
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        231
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        231
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xe7'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'e7'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        231
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xe7'
      );
    });

    it('single_byte_232_parses_to_232', 0, () => {
      // 单字节 0xe8（十进制 232）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'e8';
      const withPrefix: string = '0xe8';
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
        232
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        232
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        232
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xe8'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'e8'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        232
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xe8'
      );
    });

    it('single_byte_233_parses_to_233', 0, () => {
      // 单字节 0xe9（十进制 233）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'e9';
      const withPrefix: string = '0xe9';
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
        233
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        233
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        233
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xe9'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'e9'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        233
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xe9'
      );
    });

    it('single_byte_234_parses_to_234', 0, () => {
      // 单字节 0xea（十进制 234）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'ea';
      const withPrefix: string = '0xea';
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
        234
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        234
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        234
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xea'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'ea'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        234
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xea'
      );
    });

    it('single_byte_235_parses_to_235', 0, () => {
      // 单字节 0xeb（十进制 235）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'eb';
      const withPrefix: string = '0xeb';
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
        235
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        235
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        235
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xeb'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'eb'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        235
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xeb'
      );
    });

    it('single_byte_236_parses_to_236', 0, () => {
      // 单字节 0xec（十进制 236）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'ec';
      const withPrefix: string = '0xec';
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
        236
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        236
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        236
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xec'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'ec'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        236
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xec'
      );
    });

    it('single_byte_237_parses_to_237', 0, () => {
      // 单字节 0xed（十进制 237）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'ed';
      const withPrefix: string = '0xed';
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
        237
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        237
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        237
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xed'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'ed'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        237
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xed'
      );
    });

    it('single_byte_238_parses_to_238', 0, () => {
      // 单字节 0xee（十进制 238）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'ee';
      const withPrefix: string = '0xee';
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
        238
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        238
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        238
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xee'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'ee'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        238
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xee'
      );
    });

    it('single_byte_239_parses_to_239', 0, () => {
      // 单字节 0xef（十进制 239）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'ef';
      const withPrefix: string = '0xef';
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
        239
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        239
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        239
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xef'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'ef'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        239
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xef'
      );
    });

    it('single_byte_240_parses_to_240', 0, () => {
      // 单字节 0xf0（十进制 240）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'f0';
      const withPrefix: string = '0xf0';
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
        240
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        240
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        240
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xf0'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'f0'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        240
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xf0'
      );
    });

    it('single_byte_241_parses_to_241', 0, () => {
      // 单字节 0xf1（十进制 241）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'f1';
      const withPrefix: string = '0xf1';
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
        241
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        241
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        241
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xf1'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'f1'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        241
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xf1'
      );
    });

    it('single_byte_242_parses_to_242', 0, () => {
      // 单字节 0xf2（十进制 242）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'f2';
      const withPrefix: string = '0xf2';
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
        242
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        242
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        242
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xf2'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'f2'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        242
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xf2'
      );
    });

    it('single_byte_243_parses_to_243', 0, () => {
      // 单字节 0xf3（十进制 243）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'f3';
      const withPrefix: string = '0xf3';
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
        243
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        243
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        243
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xf3'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'f3'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        243
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xf3'
      );
    });

    it('single_byte_244_parses_to_244', 0, () => {
      // 单字节 0xf4（十进制 244）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'f4';
      const withPrefix: string = '0xf4';
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
        244
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        244
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        244
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xf4'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'f4'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        244
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xf4'
      );
    });

    it('single_byte_245_parses_to_245', 0, () => {
      // 单字节 0xf5（十进制 245）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'f5';
      const withPrefix: string = '0xf5';
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
        245
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        245
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        245
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xf5'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'f5'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        245
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xf5'
      );
    });

    it('single_byte_246_parses_to_246', 0, () => {
      // 单字节 0xf6（十进制 246）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'f6';
      const withPrefix: string = '0xf6';
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
        246
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        246
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        246
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xf6'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'f6'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        246
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xf6'
      );
    });

    it('single_byte_247_parses_to_247', 0, () => {
      // 单字节 0xf7（十进制 247）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'f7';
      const withPrefix: string = '0xf7';
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
        247
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        247
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        247
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xf7'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'f7'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        247
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xf7'
      );
    });

    it('single_byte_248_parses_to_248', 0, () => {
      // 单字节 0xf8（十进制 248）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'f8';
      const withPrefix: string = '0xf8';
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
        248
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        248
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        248
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xf8'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'f8'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        248
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xf8'
      );
    });

    it('single_byte_249_parses_to_249', 0, () => {
      // 单字节 0xf9（十进制 249）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'f9';
      const withPrefix: string = '0xf9';
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
        249
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        249
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        249
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xf9'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'f9'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        249
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xf9'
      );
    });

    it('single_byte_250_parses_to_250', 0, () => {
      // 单字节 0xfa（十进制 250）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'fa';
      const withPrefix: string = '0xfa';
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
        250
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        250
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        250
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xfa'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'fa'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        250
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xfa'
      );
    });

    it('single_byte_251_parses_to_251', 0, () => {
      // 单字节 0xfb（十进制 251）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'fb';
      const withPrefix: string = '0xfb';
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
        251
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        251
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        251
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xfb'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'fb'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        251
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xfb'
      );
    });

    it('single_byte_252_parses_to_252', 0, () => {
      // 单字节 0xfc（十进制 252）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'fc';
      const withPrefix: string = '0xfc';
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
        252
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        252
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        252
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xfc'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'fc'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        252
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xfc'
      );
    });

    it('single_byte_253_parses_to_253', 0, () => {
      // 单字节 0xfd（十进制 253）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'fd';
      const withPrefix: string = '0xfd';
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
        253
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        253
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        253
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xfd'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'fd'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        253
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xfd'
      );
    });

    it('single_byte_254_parses_to_254', 0, () => {
      // 单字节 0xfe（十进制 254）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'fe';
      const withPrefix: string = '0xfe';
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
        254
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        254
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        254
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xfe'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'fe'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        254
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xfe'
      );
    });

    it('single_byte_255_parses_to_255', 0, () => {
      // 单字节 0xff（十进制 255）的解析/格式化全链路
      // 覆盖 parseInt、formatHex、Buffer 往返三种实现
      const hex: string = 'ff';
      const withPrefix: string = '0xff';
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
        255
      );
      expect(
        ArrayBufferUtil.getIntFromHex(hex)
      ).assertEqual(
        255
      );
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      expect(
        bytes[0]
      ).assertEqual(
        255
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix).length
      ).assertEqual(
        1
      );
      expect(
        ArrayBufferUtil.getHexStrArr(withPrefix)[0]
      ).assertEqual(
        '0xff'
      );
      expect(
        ArrayBufferUtil.formatHex(hex.toUpperCase())
      ).assertEqual(
        'ff'
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        1
      );
      expect(
        new DataView(buffer).getUint8(0)
      ).assertEqual(
        255
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xff'
      );
    });

    it('multi_byte_vector_length_2', 0, () => {
      // 2 字节向量的长度、首字节、末字节与往返一致性
      // 同时验证奇数长度输入被左侧补 0 后的长度不变式
      const hex: string = '0512';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(hex);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(hex);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        bytes.length
      ).assertEqual(
        2
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        2
      );
      expect(
        bytes[0]
      ).assertEqual(
        5
      );
      expect(
        bytes[1]
      ).assertEqual(
        18
      );
      expect(
        ArrayBufferUtil.getHexStrArr(hex).length
      ).assertEqual(
        2
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x0512'
      );
      expect(
        ArrayBufferUtil.formatHex(hex)
      ).assertEqual(
        '0512'
      );
    });

    it('multi_byte_vector_length_3', 0, () => {
      // 3 字节向量的长度、首字节、末字节与往返一致性
      // 同时验证奇数长度输入被左侧补 0 后的长度不变式
      const hex: string = '2a3744';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(hex);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(hex);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        bytes.length
      ).assertEqual(
        3
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        3
      );
      expect(
        bytes[0]
      ).assertEqual(
        42
      );
      expect(
        bytes[2]
      ).assertEqual(
        68
      );
      expect(
        ArrayBufferUtil.getHexStrArr(hex).length
      ).assertEqual(
        3
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x2a3744'
      );
      expect(
        ArrayBufferUtil.formatHex(hex)
      ).assertEqual(
        '2a3744'
      );
    });

    it('multi_byte_vector_length_4', 0, () => {
      // 4 字节向量的长度、首字节、末字节与往返一致性
      // 同时验证奇数长度输入被左侧补 0 后的长度不变式
      const hex: string = '4f5c6976';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(hex);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(hex);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        bytes.length
      ).assertEqual(
        4
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        4
      );
      expect(
        bytes[0]
      ).assertEqual(
        79
      );
      expect(
        bytes[3]
      ).assertEqual(
        118
      );
      expect(
        ArrayBufferUtil.getHexStrArr(hex).length
      ).assertEqual(
        4
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x4f5c6976'
      );
      expect(
        ArrayBufferUtil.formatHex(hex)
      ).assertEqual(
        '4f5c6976'
      );
    });

    it('multi_byte_vector_length_5', 0, () => {
      // 5 字节向量的长度、首字节、末字节与往返一致性
      // 同时验证奇数长度输入被左侧补 0 后的长度不变式
      const hex: string = '74818e9ba8';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(hex);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(hex);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        bytes.length
      ).assertEqual(
        5
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        5
      );
      expect(
        bytes[0]
      ).assertEqual(
        116
      );
      expect(
        bytes[4]
      ).assertEqual(
        168
      );
      expect(
        ArrayBufferUtil.getHexStrArr(hex).length
      ).assertEqual(
        5
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x74818e9ba8'
      );
      expect(
        ArrayBufferUtil.formatHex(hex)
      ).assertEqual(
        '74818e9ba8'
      );
    });

    it('multi_byte_vector_length_6', 0, () => {
      // 6 字节向量的长度、首字节、末字节与往返一致性
      // 同时验证奇数长度输入被左侧补 0 后的长度不变式
      const hex: string = '99a6b3c0cdda';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(hex);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(hex);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        bytes.length
      ).assertEqual(
        6
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        6
      );
      expect(
        bytes[0]
      ).assertEqual(
        153
      );
      expect(
        bytes[5]
      ).assertEqual(
        218
      );
      expect(
        ArrayBufferUtil.getHexStrArr(hex).length
      ).assertEqual(
        6
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x99a6b3c0cdda'
      );
      expect(
        ArrayBufferUtil.formatHex(hex)
      ).assertEqual(
        '99a6b3c0cdda'
      );
    });

    it('multi_byte_vector_length_7', 0, () => {
      // 7 字节向量的长度、首字节、末字节与往返一致性
      // 同时验证奇数长度输入被左侧补 0 后的长度不变式
      const hex: string = 'becbd8e5f2ff0c';
      const bytes: Array<number> = ArrayBufferUtil.getHexArr(hex);
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr(hex);
      expect(
        ArrayBufferUtil.isValidHexString(hex)
      ).assertTrue();
      expect(
        bytes.length
      ).assertEqual(
        7
      );
      expect(
        buffer.byteLength
      ).assertEqual(
        7
      );
      expect(
        bytes[0]
      ).assertEqual(
        190
      );
      expect(
        bytes[6]
      ).assertEqual(
        12
      );
      expect(
        ArrayBufferUtil.getHexStrArr(hex).length
      ).assertEqual(
        7
      );
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xbecbd8e5f2ff0c'
      );
      expect(
        ArrayBufferUtil.formatHex(hex)
      ).assertEqual(
        'becbd8e5f2ff0c'
      );
