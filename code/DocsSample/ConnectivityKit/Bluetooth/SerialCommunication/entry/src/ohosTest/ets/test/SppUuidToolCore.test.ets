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
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF814;
const TAG: string = 'SppUuidTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

const SPP_DEFAULT_UUID: string = '00001101-0000-1000-8000-00805f9b34fb';
const UUID_SEGMENT_LENGTHS: Array<number> = [8, 4, 4, 4, 12];

function isHexChar(ch: string): boolean {
  const lower: string = ch.toLowerCase();
  return (ch >= '0' && ch <= '9') || (lower >= 'a' && lower <= 'f');
}

function uuidSegments(value: string): Array<string> {
  return value.split('-');
}

function isValidBluetoothUuid(value: string): boolean {
  if (value.length !== 36) {
    return false;
  }
  const segments: Array<string> = uuidSegments(value);
  if (segments.length !== 5) {
    return false;
  }
  for (let i: number = 0; i < segments.length; i++) {
    if (segments[i].length !== UUID_SEGMENT_LENGTHS[i]) {
      return false;
    }
    for (let j: number = 0; j < segments[i].length; j++) {
      if (!isHexChar(segments[i].charAt(j))) {
        return false;
      }
    }
  }
  return true;
}

export default function sppUuidToolCoreTest(): void {
  describe('SppUuidToolCoreTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIAL_COMM_UUID_0201
     * @tc.name      testSppUuid0201
     * @tc.desc      Verify the sample default SPP uuid has canonical 36 character length.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppUuid0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppUuid0201 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual SPP_DEFAULT_UUID.length=${SPP_DEFAULT_UUID.length}`);
      expect(SPP_DEFAULT_UUID.length).assertEqual(36);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof SPP_DEFAULT_UUID=${typeof SPP_DEFAULT_UUID}`);
      expect(typeof SPP_DEFAULT_UUID).assertEqual('string');
      log('testSppUuid0201 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_UUID_0202
     * @tc.name      testSppUuid0202
     * @tc.desc      Verify the sample default uuid segments are eight four four four twelve.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppUuid0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppUuid0202 begin');
      const segments: Array<string> = uuidSegments(SPP_DEFAULT_UUID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual segments.length=${segments.length}, expected=5`);
      expect(segments.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual segments[0].length=${segments[0].length}, expected=8`);
      expect(segments[0].length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual segments[1].length=${segments[1].length}, expected=4`);
      expect(segments[1].length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual segments[2].length=${segments[2].length}, expected=4`);
      expect(segments[2].length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual segments[3].length=${segments[3].length}, expected=4`);
      expect(segments[3].length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual segments[4].length=${segments[4].length}, expected=12`);
      expect(segments[4].length).assertEqual(12);
      log('testSppUuid0202 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_UUID_0203
     * @tc.name      testSppUuid0203
     * @tc.desc      Verify the sample default uuid passes format validation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppUuid0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppUuid0203 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${isValidBluetoothUuid(SPP_DEFAULT_UUID)}`);
      expect(isValidBluetoothUuid(SPP_DEFAULT_UUID)).assertTrue();
      log('testSppUuid0203 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_UUID_0204
     * @tc.name      testSppUuid0204
     * @tc.desc      Verify the first uuid segment identifies the serial port profile service.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppUuid0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppUuid0204 begin');
      const segments: Array<string> = uuidSegments(SPP_DEFAULT_UUID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual segments[0]=${segments[0]}, expected='00001101'`);
      expect(segments[0]).assertEqual('00001101');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual segments[0].substring(4)=${segments[0].substring(4)}`);
      expect(segments[0].substring(4)).assertEqual('1101');
      log('testSppUuid0204 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_UUID_0205
     * @tc.name      testSppUuid0205
     * @tc.desc      Verify the second uuid segment is the bluetooth base value 0000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppUuid0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppUuid0205 begin');
      const segments: Array<string> = uuidSegments(SPP_DEFAULT_UUID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual segments[1]=${segments[1]}, expected='0000'`);
      expect(segments[1]).assertEqual('0000');
      log('testSppUuid0205 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_UUID_0206
     * @tc.name      testSppUuid0206
     * @tc.desc      Verify the third uuid segment is the base version value 1000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppUuid0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppUuid0206 begin');
      const segments: Array<string> = uuidSegments(SPP_DEFAULT_UUID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual segments[2]=${segments[2]}, expected='1000'`);
      expect(segments[2]).assertEqual('1000');
      log('testSppUuid0206 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_UUID_0207
     * @tc.name      testSppUuid0207
     * @tc.desc      Verify the fourth uuid segment is the base variant value 8000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppUuid0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppUuid0207 begin');
      const segments: Array<string> = uuidSegments(SPP_DEFAULT_UUID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual segments[3]=${segments[3]}, expected='8000'`);
      expect(segments[3]).assertEqual('8000');
      log('testSppUuid0207 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_UUID_0208
     * @tc.name      testSppUuid0208
     * @tc.desc      Verify the fifth uuid segment is the twelve hex base suffix.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppUuid0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppUuid0208 begin');
      const segments: Array<string> = uuidSegments(SPP_DEFAULT_UUID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual segments[4]=${segments[4]}, expected='00805f9b34fb'`);
      expect(segments[4]).assertEqual('00805f9b34fb');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual segments[4].length=${segments[4].length}, expected=12`);
      expect(segments[4].length).assertEqual(12);
      log('testSppUuid0208 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_UUID_0209
     * @tc.name      testSppUuid0209
     * @tc.desc      Verify the upper cased uuid variant passes format validation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppUuid0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppUuid0209 begin');
      const upper: string = SPP_DEFAULT_UUID.toUpperCase();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue isValidBluetoothUuid(upper)=${isValidBluetoothUuid(upper)}`);
      expect(isValidBluetoothUuid(upper)).assertTrue();
      log('testSppUuid0209 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_UUID_0210
     * @tc.name      testSppUuid0210
     * @tc.desc      Verify uuid comparison is case insensitive after normalisation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppUuid0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppUuid0210 begin');
      const upper: string = SPP_DEFAULT_UUID.toUpperCase();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual upper.toLowerCase()=${upper.toLowerCase()}`);
      expect(upper.toLowerCase()).assertEqual(SPP_DEFAULT_UUID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse upper === SPP_DEFAULT_UUID=${upper === SPP_DEFAULT_UUID}`);
      expect(upper === SPP_DEFAULT_UUID).assertFalse();
      log('testSppUuid0210 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_UUID_0211
     * @tc.name      testSppUuid0211
     * @tc.desc      Verify stripping hyphens from the uuid yields thirty two hex digits.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppUuid0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppUuid0211 begin');
      const compact: string = SPP_DEFAULT_UUID.split('-').join('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual compact.length=${compact.length}, expected=32`);
      expect(compact.length).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual compact.indexOf('-')=${compact.indexOf('-')}, expected=-1`);
      expect(compact.indexOf('-')).assertEqual(-1);
      log('testSppUuid0211 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_UUID_0212
     * @tc.name      testSppUuid0212
     * @tc.desc      Verify an empty string fails uuid format validation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppUuid0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppUuid0212 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse isValidBluetoothUuid('')=${isValidBluetoothUuid('')}`);
      expect(isValidBluetoothUuid('')).assertFalse();
      log('testSppUuid0212 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_UUID_0213
     * @tc.name      testSppUuid0213
     * @tc.desc      Verify a too short uuid fails format validation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppUuid0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppUuid0213 begin');
      const short: string = SPP_DEFAULT_UUID.substring(0, 35);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual short.length=${short.length}, expected=35`);
      expect(short.length).assertEqual(35);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse isValidBluetoothUuid(short)=${isValidBluetoothUuid(short)}`);
      expect(isValidBluetoothUuid(short)).assertFalse();
      log('testSppUuid0213 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_UUID_0214
     * @tc.name      testSppUuid0214
     * @tc.desc      Verify a too long uuid fails format validation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppUuid0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppUuid0214 begin');
      const long: string = SPP_DEFAULT_UUID + '0';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual long.length=${long.length}, expected=37`);
      expect(long.length).assertEqual(37);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse isValidBluetoothUuid(long)=${isValidBluetoothUuid(long)}`);
      expect(isValidBluetoothUuid(long)).assertFalse();
      log('testSppUuid0214 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_UUID_0215
     * @tc.name      testSppUuid0215
     * @tc.desc      Verify a misplaced hyphen fails uuid format validation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppUuid0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppUuid0215 begin');
      const misplaced: string = '0000110-10000-1000-8000-00805f9b34fb';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${isValidBluetoothUuid(misplaced)}`);
      expect(isValidBluetoothUuid(misplaced)).assertFalse();
      log('testSppUuid0215 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_UUID_0216
     * @tc.name      testSppUuid0216
     * @tc.desc      Verify a uuid without hyphens fails format validation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppUuid0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppUuid0216 begin');
      const compact: string = SPP_DEFAULT_UUID.split('-').join('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${isValidBluetoothUuid(compact)}`);
      expect(isValidBluetoothUuid(compact)).assertFalse();
      log('testSppUuid0216 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_UUID_0217
     * @tc.name      testSppUuid0217
     * @tc.desc      Verify a non hex letter g fails uuid format validation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppUuid0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppUuid0217 begin');
      const withG: string = '00001101-0000-1000-8000-00805f9b34fg';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse isValidBluetoothUuid(withG)=${isValidBluetoothUuid(withG)}`);
      expect(isValidBluetoothUuid(withG)).assertFalse();
      log('testSppUuid0217 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_UUID_0218
     * @tc.name      testSppUuid0218
     * @tc.desc      Verify a non hex letter z in the tail segment fails validation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppUuid0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppUuid0218 begin');
      const withZ: string = '00001101-0000-1000-8000-00805f9b34zb';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse isValidBluetoothUuid(withZ)=${isValidBluetoothUuid(withZ)}`);
      expect(isValidBluetoothUuid(withZ)).assertFalse();
      log('testSppUuid0218 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_UUID_0219
     * @tc.name      testSppUuid0219
     * @tc.desc      Verify an empty segment uuid fails format validation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppUuid0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppUuid0219 begin');
      const emptySeg: string = '00001101--1000-8000-00805f9b34fb';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${isValidBluetoothUuid(emptySeg)}`);
      expect(isValidBluetoothUuid(emptySeg)).assertFalse();
      log('testSppUuid0219 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_UUID_0220
     * @tc.name      testSppUuid0220
     * @tc.desc      Verify leading and trailing spaces fail strict uuid validation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppUuid0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppUuid0220 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${isValidBluetoothUuid(' ' + SPP_DEFAULT_UUID)}`);
      expect(isValidBluetoothUuid(' ' + SPP_DEFAULT_UUID)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${isValidBluetoothUuid(SPP_DEFAULT_UUID + ' ')}`);
      expect(isValidBluetoothUuid(SPP_DEFAULT_UUID + ' ')).assertFalse();
      log('testSppUuid0220 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_UUID_0221
     * @tc.name      testSppUuid0221
     * @tc.desc      Verify a trailing empty segment uuid fails format validation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppUuid0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppUuid0221 begin');
      const trailingHyphen: string = SPP_DEFAULT_UUID + '-';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual trailingHyphen.length=${trailingHyphen.length}, expected=37`);
      expect(trailingHyphen.length).assertEqual(37);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${isValidBluetoothUuid(trailingHyphen)}`);
      expect(isValidBluetoothUuid(trailingHyphen)).assertFalse();
      log('testSppUuid0221 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_UUID_0222
     * @tc.name      testSppUuid0222
     * @tc.desc      Verify the object push service uuid passes format validation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppUuid0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppUuid0222 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue isValidBluetoothUuid('00001105-0000-1000-8000-00805f9b34fb')`);
      expect(isValidBluetoothUuid('00001105-0000-1000-8000-00805f9b34fb')).assertTrue();
      log('testSppUuid0222 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_UUID_0223
     * @tc.name      testSppUuid0223
     * @tc.desc      Verify the file transfer service uuid passes format validation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppUuid0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppUuid0223 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue isValidBluetoothUuid('00001106-0000-1000-8000-00805f9b34fb')`);
      expect(isValidBluetoothUuid('00001106-0000-1000-8000-00805f9b34fb')).assertTrue();
      log('testSppUuid0223 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_UUID_0224
     * @tc.name      testSppUuid0224
     * @tc.desc      Verify the audio sink service uuid passes format validation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppUuid0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppUuid0224 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue isValidBluetoothUuid('0000110b-0000-1000-8000-00805f9b34fb')`);
      expect(isValidBluetoothUuid('0000110b-0000-1000-8000-00805f9b34fb')).assertTrue();
      log('testSppUuid0224 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_UUID_0225
     * @tc.name      testSppUuid0225
     * @tc.desc      Verify the handsfree unit service uuid passes format validation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppUuid0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppUuid0225 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue isValidBluetoothUuid('0000111f-0000-1000-8000-00805f9b34fb')`);
      expect(isValidBluetoothUuid('0000111f-0000-1000-8000-00805f9b34fb')).assertTrue();
      log('testSppUuid0225 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_UUID_0226
     * @tc.name      testSppUuid0226
     * @tc.desc      Verify the headset service uuid passes format validation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppUuid0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppUuid0226 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue isValidBluetoothUuid('00001112-0000-1000-8000-00805f9b34fb')`);
      expect(isValidBluetoothUuid('00001112-0000-1000-8000-00805f9b34fb')).assertTrue();
      log('testSppUuid0226 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_UUID_0227
     * @tc.name      testSppUuid0227
     * @tc.desc      Verify the all zero uuid passes pure format validation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppUuid0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppUuid0227 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue isValidBluetoothUuid('00000000-0000-0000-0000-000000000000')`);
      expect(isValidBluetoothUuid('00000000-0000-0000-0000-000000000000')).assertTrue();
      log('testSppUuid0227 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_UUID_0228
     * @tc.name      testSppUuid0228
     * @tc.desc      Verify the all f uuid passes pure format validation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppUuid0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppUuid0228 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue isValidBluetoothUuid('ffffffff-ffff-ffff-ffff-ffffffffffff')`);
      expect(isValidBluetoothUuid('ffffffff-ffff-ffff-ffff-ffffffffffff')).assertTrue();
      log('testSppUuid0228 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_UUID_0229
     * @tc.name      testSppUuid0229
     * @tc.desc      Verify the uuid validator always returns a boolean result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppUuid0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppUuid0229 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof isValidBluetoothUuid(SPP_DEFAULT_UUID)}`);
      expect(typeof isValidBluetoothUuid(SPP_DEFAULT_UUID)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof isValidBluetoothUuid('')}`);
      expect(typeof isValidBluetoothUuid('')).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof isValidBluetoothUuid('123')}`);
      expect(typeof isValidBluetoothUuid('123')).assertEqual('boolean');
      log('testSppUuid0229 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_UUID_0230
     * @tc.name      testSppUuid0230
     * @tc.desc      Verify mixed case hex digits in segments pass format validation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppUuid0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppUuid0230 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue isValidBluetoothUuid('0000AbCd-0000-1000-8000-00805F9B34FB')`);
      expect(isValidBluetoothUuid('0000AbCd-0000-1000-8000-00805F9B34FB')).assertTrue();
      log('testSppUuid0230 end');
    })
  })
}
