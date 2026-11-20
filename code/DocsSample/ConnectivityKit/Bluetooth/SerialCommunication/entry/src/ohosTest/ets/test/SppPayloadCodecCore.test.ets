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
import { beforeEach, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from './YieldToEventLoop';
import { util } from '@kit.ArkTS';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF814;
const TAG: string = 'SppCodecTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function encodeSample(input: string, capacity: number): Uint8Array {
  const buffer: Uint8Array = new Uint8Array(capacity);
  const encoder: util.TextEncoder = new util.TextEncoder();
  encoder.encodeIntoUint8Array(input, buffer);
  return buffer;
}

function decodeBytes(bytes: Uint8Array): string {
  const decoder: util.TextDecoder = util.TextDecoder.create('utf-8');
  return decoder.decodeToString(bytes);
}

export default function sppPayloadCodecCoreTest(): void {
  describe('SppPayloadCodecCoreTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIAL_COMM_CODEC_0001
     * @tc.name      testSppCodec0001
     * @tc.desc      Verify encoding the letter A writes the ASCII byte 0x41.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppCodec0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppCodec0001 begin');
      const target: Uint8Array = new Uint8Array(1);
      const encoder: util.TextEncoder = new util.TextEncoder();
      const result = encoder.encodeIntoUint8Array('A', target);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.read=${result.read}, expected=1`);
      expect(result.read).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.written=${result.written}, expected=1`);
      expect(result.written).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target[0]=${target[0]}, expected=0x41`);
      expect(target[0]).assertEqual(0x41);
      log('testSppCodec0001 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_CODEC_0002
     * @tc.name      testSppCodec0002
     * @tc.desc      Verify encoding hello produces the five expected ASCII bytes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppCodec0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppCodec0002 begin');
      const target: Uint8Array = new Uint8Array(5);
      const encoder: util.TextEncoder = new util.TextEncoder();
      const result = encoder.encodeIntoUint8Array('hello', target);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.read=${result.read}, expected=5`);
      expect(result.read).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.written=${result.written}, expected=5`);
      expect(result.written).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target[0]=${target[0]}, expected=104`);
      expect(target[0]).assertEqual(104);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target[1]=${target[1]}, expected=101`);
      expect(target[1]).assertEqual(101);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target[2]=${target[2]}, expected=108`);
      expect(target[2]).assertEqual(108);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target[3]=${target[3]}, expected=108`);
      expect(target[3]).assertEqual(108);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target[4]=${target[4]}, expected=111`);
      expect(target[4]).assertEqual(111);
      log('testSppCodec0002 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_CODEC_0003
     * @tc.name      testSppCodec0003
     * @tc.desc      Verify encoding an eight character mixed case sample string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppCodec0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppCodec0003 begin');
      const input: string = 'SPP demo';
      const target: Uint8Array = encodeSample(input, input.length);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.length=${target.length}, expected=8`);
      expect(target.length).assertEqual(8);
      const encoder: util.TextEncoder = new util.TextEncoder();
      const result = encoder.encodeIntoUint8Array(input, target);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.written=${result.written}, expected=8`);
      expect(result.written).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target[0]=${target[0]}, expected=83`);
      expect(target[0]).assertEqual(83);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target[3]=${target[3]}, expected=32`);
      expect(target[3]).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target[4]=${target[4]}, expected=100`);
      expect(target[4]).assertEqual(100);
      log('testSppCodec0003 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_CODEC_0004
     * @tc.name      testSppCodec0004
     * @tc.desc      Verify digit characters map to consecutive ASCII codes from 48 to 57.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppCodec0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppCodec0004 begin');
      const target: Uint8Array = encodeSample('0123456789', 10);
      for (let i: number = 0; i < 10; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target[i]=${target[i]}, expected=48 + i`);
        expect(target[i]).assertEqual(48 + i);
      }
      log('testSppCodec0004 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_CODEC_0005
     * @tc.name      testSppCodec0005
     * @tc.desc      Verify encoding an empty payload consumes and writes nothing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppCodec0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppCodec0005 begin');
      const target: Uint8Array = new Uint8Array(0);
      const encoder: util.TextEncoder = new util.TextEncoder();
      const result = encoder.encodeIntoUint8Array('', target);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.read=${result.read}, expected=0`);
      expect(result.read).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.written=${result.written}, expected=0`);
      expect(result.written).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.length=${target.length}, expected=0`);
      expect(target.length).assertEqual(0);
      log('testSppCodec0005 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_CODEC_0006
     * @tc.name      testSppCodec0006
     * @tc.desc      Verify the space character encodes to byte 0x20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppCodec0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppCodec0006 begin');
      const target: Uint8Array = encodeSample(' ', 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target[0]=${target[0]}, expected=0x20`);
      expect(target[0]).assertEqual(0x20);
      log('testSppCodec0006 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_CODEC_0007
     * @tc.name      testSppCodec0007
     * @tc.desc      Verify every printable ASCII character maps to its own code point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppCodec0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppCodec0007 begin');
      let printable: string = '';
      for (let code: number = 0x20; code <= 0x7E; code++) {
        printable += String.fromCharCode(code);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual printable.length=${printable.length}, expected=95`);
      expect(printable.length).assertEqual(95);
      const target: Uint8Array = encodeSample(printable, 95);
      for (let i: number = 0; i < 95; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target[i]=${target[i]}, expected=0x20 + i`);
        expect(target[i]).assertEqual(0x20 + i);
      }
      log('testSppCodec0007 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_CODEC_0008
     * @tc.name      testSppCodec0008
     * @tc.desc      Verify encoding a twelve character message with punctuation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppCodec0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppCodec0008 begin');
      const input: string = 'hello world!';
      const target: Uint8Array = encodeSample(input, 12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target[11]=${target[11]}, expected=33`);
      expect(target[11]).assertEqual(33);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target[5]=${target[5]}, expected=32`);
      expect(target[5]).assertEqual(32);
      log('testSppCodec0008 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_CODEC_0009
     * @tc.name      testSppCodec0009
     * @tc.desc      Verify the encode result read counter stays a number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppCodec0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppCodec0009 begin');
      const target: Uint8Array = new Uint8Array(4);
      const encoder: util.TextEncoder = new util.TextEncoder();
      const result = encoder.encodeIntoUint8Array('abcd', target);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof result.read=${typeof result.read}, expected='number'`);
      expect(typeof result.read).assertEqual('number');
      log('testSppCodec0009 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_CODEC_0010
     * @tc.name      testSppCodec0010
     * @tc.desc      Verify the encode result written counter stays a number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppCodec0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppCodec0010 begin');
      const target: Uint8Array = new Uint8Array(4);
      const encoder: util.TextEncoder = new util.TextEncoder();
      const result = encoder.encodeIntoUint8Array('abcd', target);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof result.written=${typeof result.written}`);
      expect(typeof result.written).assertEqual('number');
      log('testSppCodec0010 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_CODEC_0011
     * @tc.name      testSppCodec0011
     * @tc.desc      Verify the encode target behaves as an object with numeric length.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppCodec0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppCodec0011 begin');
      const target: Uint8Array = encodeSample('abc', 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof target=${typeof target}, expected='object'`);
      expect(typeof target).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof target.length=${typeof target.length}`);
      expect(typeof target.length).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.length=${target.length}, expected=3`);
      expect(target.length).assertEqual(3);
      log('testSppCodec0011 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_CODEC_0012
     * @tc.name      testSppCodec0012
     * @tc.desc      Verify an ascii round trip through encode and decode is stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppCodec0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppCodec0012 begin');
      const target: Uint8Array = encodeSample('abc', 3);
      const restored: string = decodeBytes(target);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual restored=${restored}, expected='abc'`);
      expect(restored).assertEqual('abc');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof restored=${typeof restored}, expected='string'`);
      expect(typeof restored).assertEqual('string');
      log('testSppCodec0012 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_CODEC_0013
     * @tc.name      testSppCodec0013
     * @tc.desc      Verify an uppercase message round trip through encode and decode.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppCodec0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppCodec0013 begin');
      const target: Uint8Array = encodeSample('SPP TEST 123', 12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual decodeBytes(target)=${decodeBytes(target)}`);
      expect(decodeBytes(target)).assertEqual('SPP TEST 123');
      log('testSppCodec0013 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_CODEC_0014
     * @tc.name      testSppCodec0014
     * @tc.desc      Verify an empty round trip decodes to an empty string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppCodec0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppCodec0014 begin');
      const target: Uint8Array = encodeSample('', 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual decodeBytes(target)=${decodeBytes(target)}, expected=''`);
      expect(decodeBytes(target)).assertEqual('');
      log('testSppCodec0014 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_CODEC_0015
     * @tc.name      testSppCodec0015
     * @tc.desc      Verify a long hyphenated identifier round trip through encode and decode.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppCodec0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppCodec0015 begin');
      const input: string = 'serial-communication-2025';
      const target: Uint8Array = encodeSample(input, 25);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual decodeBytes(target)=${decodeBytes(target)}, expected=input`);
      expect(decodeBytes(target)).assertEqual(input);
      log('testSppCodec0015 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_CODEC_0016
     * @tc.name      testSppCodec0016
     * @tc.desc      Verify ascii text exactly fills a buffer sized to the character count.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppCodec0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppCodec0016 begin');
      const input: string = 'sppwrite';
      const target: Uint8Array = new Uint8Array(input.length);
      const encoder: util.TextEncoder = new util.TextEncoder();
      const result = encoder.encodeIntoUint8Array(input, target);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.read=${result.read}, expected=8`);
      expect(result.read).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.written=${result.written}, expected=8`);
      expect(result.written).assertEqual(8);
      log('testSppCodec0016 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_CODEC_0017
     * @tc.name      testSppCodec0017
     * @tc.desc      Verify multibyte input never writes beyond a one byte capacity buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppCodec0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppCodec0017 begin');
      const target: Uint8Array = new Uint8Array(1);
      const encoder: util.TextEncoder = new util.TextEncoder();
      const result = encoder.encodeIntoUint8Array('中', target);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue result.written <= 1=${result.written <= 1}`);
      expect(result.written <= 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue result.read <= 1=${result.read <= 1}`);
      expect(result.read <= 1).assertTrue();
      log('testSppCodec0017 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_CODEC_0018
     * @tc.name      testSppCodec0018
     * @tc.desc      Verify multibyte input never writes beyond a two byte capacity buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppCodec0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppCodec0018 begin');
      const target: Uint8Array = new Uint8Array(2);
      const encoder: util.TextEncoder = new util.TextEncoder();
      const result = encoder.encodeIntoUint8Array('中文', target);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue result.written <= 2=${result.written <= 2}`);
      expect(result.written <= 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue result.read <= 2=${result.read <= 2}`);
      expect(result.read <= 2).assertTrue();
      log('testSppCodec0018 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_CODEC_0019
     * @tc.name      testSppCodec0019
     * @tc.desc      Verify surrogate pair input never writes beyond a two byte capacity buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppCodec0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppCodec0019 begin');
      const target: Uint8Array = new Uint8Array(2);
      const encoder: util.TextEncoder = new util.TextEncoder();
      const result = encoder.encodeIntoUint8Array('\u{1F600}', target);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue result.written <= 2=${result.written <= 2}`);
      expect(result.written <= 2).assertTrue();
      log('testSppCodec0019 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_CODEC_0020
     * @tc.name      testSppCodec0020
     * @tc.desc      Verify mixed ascii and multibyte input respects the capacity bound.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppCodec0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppCodec0020 begin');
      const target: Uint8Array = new Uint8Array(3);
      const encoder: util.TextEncoder = new util.TextEncoder();
      const result = encoder.encodeIntoUint8Array('a中b', target);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue result.written <= 3=${result.written <= 3}`);
      expect(result.written <= 3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue result.read <= 3=${result.read <= 3}`);
      expect(result.read <= 3).assertTrue();
      log('testSppCodec0020 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_CODEC_0021
     * @tc.name      testSppCodec0021
     * @tc.desc      Verify spare capacity stays zero filled after encoding a short string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppCodec0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppCodec0021 begin');
      const target: Uint8Array = new Uint8Array(100);
      const encoder: util.TextEncoder = new util.TextEncoder();
      const result = encoder.encodeIntoUint8Array('abc', target);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.read=${result.read}, expected=3`);
      expect(result.read).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.written=${result.written}, expected=3`);
      expect(result.written).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target[3]=${target[3]}, expected=0`);
      expect(target[3]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target[99]=${target[99]}, expected=0`);
      expect(target[99]).assertEqual(0);
      log('testSppCodec0021 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_CODEC_0022
     * @tc.name      testSppCodec0022
     * @tc.desc      Verify a zero capacity buffer writes nothing for non empty input.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppCodec0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppCodec0022 begin');
      const target: Uint8Array = new Uint8Array(0);
      const encoder: util.TextEncoder = new util.TextEncoder();
      const result = encoder.encodeIntoUint8Array('abc', target);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.written=${result.written}, expected=0`);
      expect(result.written).assertEqual(0);
      log('testSppCodec0022 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_CODEC_0023
     * @tc.name      testSppCodec0023
     * @tc.desc      Verify decoding an empty byte array yields an empty string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppCodec0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppCodec0023 begin');
      const bytes: Uint8Array = new Uint8Array(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual decodeBytes(bytes)=${decodeBytes(bytes)}, expected=''`);
      expect(decodeBytes(bytes)).assertEqual('');
      log('testSppCodec0023 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_CODEC_0024
     * @tc.name      testSppCodec0024
     * @tc.desc      Verify a hyphenated bluetooth label round trips through the decoder.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppCodec0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppCodec0024 begin');
      const target: Uint8Array = encodeSample('BT-SPP', 6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual decodeBytes(target)=${decodeBytes(target)}`);
      expect(decodeBytes(target)).assertEqual('BT-SPP');
      log('testSppCodec0024 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_CODEC_0025
     * @tc.name      testSppCodec0025
     * @tc.desc      Verify a version label round trips through the decoder.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppCodec0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppCodec0025 begin');
      const target: Uint8Array = encodeSample('serial comm v1', 14);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual decodeBytes(target)=${decodeBytes(target)}`);
      expect(decodeBytes(target)).assertEqual('serial comm v1');
      log('testSppCodec0025 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_CODEC_0026
     * @tc.name      testSppCodec0026
     * @tc.desc      Verify the read counter never exceeds the input code unit count.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppCodec0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppCodec0026 begin');
      const target: Uint8Array = new Uint8Array(20);
      const encoder: util.TextEncoder = new util.TextEncoder();
      const result = encoder.encodeIntoUint8Array('hello world', target);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue result.read <= 11=${result.read <= 11}`);
      expect(result.read <= 11).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue result.written <= 20=${result.written <= 20}`);
      expect(result.written <= 20).assertTrue();
      log('testSppCodec0026 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_CODEC_0027
     * @tc.name      testSppCodec0027
     * @tc.desc      Verify the written counter never exceeds the buffer capacity.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppCodec0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppCodec0027 begin');
      const target: Uint8Array = new Uint8Array(6);
      const encoder: util.TextEncoder = new util.TextEncoder();
      const result = encoder.encodeIntoUint8Array('abcdefgh', target);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue result.written <= 6=${result.written <= 6}`);
      expect(result.written <= 6).assertTrue();
      log('testSppCodec0027 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_CODEC_0028
     * @tc.name      testSppCodec0028
     * @tc.desc      Verify encoding the same text twice yields identical bytes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppCodec0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppCodec0028 begin');
      const first: Uint8Array = encodeSample('spp', 3);
      const second: Uint8Array = encodeSample('spp', 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first[0]=${first[0]}, expected=second[0]`);
      expect(first[0]).assertEqual(second[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first[1]=${first[1]}, expected=second[1]`);
      expect(first[1]).assertEqual(second[1]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first[2]=${first[2]}, expected=second[2]`);
      expect(first[2]).assertEqual(second[2]);
      log('testSppCodec0028 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_CODEC_0029
     * @tc.name      testSppCodec0029
     * @tc.desc      Verify different single letters encode to different bytes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppCodec0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppCodec0029 begin');
      const a: Uint8Array = encodeSample('a', 1);
      const b: Uint8Array = encodeSample('b', 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual a[0]=${a[0]}, expected=0x61`);
      expect(a[0]).assertEqual(0x61);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual b[0]=${b[0]}, expected=0x62`);
      expect(b[0]).assertEqual(0x62);
      log('testSppCodec0029 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_CODEC_0030
     * @tc.name      testSppCodec0030
     * @tc.desc      Verify letter case and digits produce distinct ascii bytes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppCodec0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppCodec0030 begin');
      const target: Uint8Array = encodeSample('aA1', 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target[0]=${target[0]}, expected=0x61`);
      expect(target[0]).assertEqual(0x61);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target[1]=${target[1]}, expected=0x41`);
      expect(target[1]).assertEqual(0x41);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target[2]=${target[2]}, expected=0x31`);
      expect(target[2]).assertEqual(0x31);
      log('testSppCodec0030 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_CODEC_0031
     * @tc.name      testSppCodec0031
     * @tc.desc      Verify the sample default uuid string encodes to 36 ascii bytes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppCodec0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppCodec0031 begin');
      const uuid: string = '00001101-0000-1000-8000-00805f9b34fb';
      const target: Uint8Array = new Uint8Array(uuid.length);
      const encoder: util.TextEncoder = new util.TextEncoder();
      const result = encoder.encodeIntoUint8Array(uuid, target);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.written=${result.written}, expected=36`);
      expect(result.written).assertEqual(36);
      for (let i: number = 0; i < 36; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue target[i] < 0x80=${target[i] < 0x80}`);
        expect(target[i] < 0x80).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target[8]=${target[8]}, expected=45`);
      expect(target[8]).assertEqual(45);
      log('testSppCodec0031 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_CODEC_0032
     * @tc.name      testSppCodec0032
     * @tc.desc      Verify the sample device id hint encodes to eighteen ascii bytes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppCodec0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppCodec0032 begin');
      const deviceId: string = '11:22:33:44:55::66';
      const target: Uint8Array = new Uint8Array(deviceId.length);
      const encoder: util.TextEncoder = new util.TextEncoder();
      const result = encoder.encodeIntoUint8Array(deviceId, target);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.written=${result.written}, expected=18`);
      expect(result.written).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target[0]=${target[0]}, expected=49`);
      expect(target[0]).assertEqual(49);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target[2]=${target[2]}, expected=58`);
      expect(target[2]).assertEqual(58);
      log('testSppCodec0032 end');
    })
  })
}
