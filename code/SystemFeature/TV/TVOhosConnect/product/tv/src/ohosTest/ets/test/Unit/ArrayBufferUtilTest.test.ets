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
