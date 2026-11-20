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
const TAG: string = 'SppFrameTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

const FRAME_HEAD: number = 0xA5;
const FRAME_TAIL: number = 0x5A;
const MIN_FRAME_LENGTH: number = 4;

function frameChecksum(length: number, payload: Uint8Array): number {
  let sum: number = FRAME_HEAD + length;
  for (let i: number = 0; i < payload.length; i++) {
    sum += payload[i];
  }
  return sum & 0xFF;
}

function packFrame(payload: Uint8Array): Uint8Array {
  const frame: Uint8Array = new Uint8Array(payload.length + 4);
  frame[0] = FRAME_HEAD;
  frame[1] = payload.length;
  frame.set(payload, 2);
  frame[2 + payload.length] = frameChecksum(payload.length, payload);
  frame[3 + payload.length] = FRAME_TAIL;
  return frame;
}

class ParseResult {
  public ok: boolean = false;
  public payload: Uint8Array = new Uint8Array(0);
  public consumed: number = 0;
}

function parseFrame(buffer: Uint8Array): ParseResult {
  const result: ParseResult = new ParseResult();
  for (let start: number = 0; start < buffer.length; start++) {
    if (buffer[start] !== FRAME_HEAD) {
      continue;
    }
    if (start + MIN_FRAME_LENGTH > buffer.length) {
      return result;
    }
    const length: number = buffer[start + 1];
    const frameEnd: number = start + length + 4;
    if (frameEnd > buffer.length) {
      return result;
    }
    const payload: Uint8Array = buffer.slice(start + 2, start + 2 + length);
    if (buffer[frameEnd - 2] !== frameChecksum(length, payload)) {
      return result;
    }
    if (buffer[frameEnd - 1] !== FRAME_TAIL) {
      return result;
    }
    result.ok = true;
    result.payload = payload;
    result.consumed = frameEnd;
    return result;
  }
  return result;
}

export default function sppFrameAssemblerCoreTest(): void {
  describe('SppFrameAssemblerCoreTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIAL_COMM_FRAME_0301
     * @tc.name      testSppFrame0301
     * @tc.desc      Verify packing an empty payload produces a four byte frame.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppFrame0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppFrame0301 begin');
      const frame: Uint8Array = packFrame(new Uint8Array(0));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame.length=${frame.length}, expected=4`);
      expect(frame.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof frame.length=${typeof frame.length}`);
      expect(typeof frame.length).assertEqual('number');
      log('testSppFrame0301 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_FRAME_0302
     * @tc.name      testSppFrame0302
     * @tc.desc      Verify packing a two byte payload produces a six byte frame.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppFrame0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppFrame0302 begin');
      const frame: Uint8Array = packFrame(new Uint8Array([0x42, 0x54]));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame.length=${frame.length}, expected=6`);
      expect(frame.length).assertEqual(6);
      log('testSppFrame0302 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_FRAME_0303
     * @tc.name      testSppFrame0303
     * @tc.desc      Verify frame byte layout places head len checksum and tail correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppFrame0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppFrame0303 begin');
      const payload: Uint8Array = new Uint8Array([1, 2, 3]);
      const frame: Uint8Array = packFrame(payload);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame[0]=${frame[0]}, expected=FRAME_HEAD`);
      expect(frame[0]).assertEqual(FRAME_HEAD);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame[1]=${frame[1]}, expected=3`);
      expect(frame[1]).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame[5]=${frame[5]}, expected=frameChecksum(3, payload)`);
      expect(frame[5]).assertEqual(frameChecksum(3, payload));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame[6]=${frame[6]}, expected=FRAME_TAIL`);
      expect(frame[6]).assertEqual(FRAME_TAIL);
      log('testSppFrame0303 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_FRAME_0304
     * @tc.name      testSppFrame0304
     * @tc.desc      Verify the checksum of an empty payload equals the head byte.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppFrame0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppFrame0304 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frameChecksum(0, new Uint8Array(0)), expected=0xA5`);
      expect(frameChecksum(0, new Uint8Array(0))).assertEqual(0xA5);
      log('testSppFrame0304 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_FRAME_0305
     * @tc.name      testSppFrame0305
     * @tc.desc      Verify the checksum of a single byte payload.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppFrame0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppFrame0305 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frameChecksum(1, new Uint8Array([0x01])), expected=0xA7`);
      expect(frameChecksum(1, new Uint8Array([0x01]))).assertEqual(0xA7);
      log('testSppFrame0305 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_FRAME_0306
     * @tc.name      testSppFrame0306
     * @tc.desc      Verify the checksum accumulates every payload byte.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppFrame0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppFrame0306 begin');
      const payload: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const expected: number = (0xA5 + 4 + 100) & 0xFF;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frameChecksum(4, payload)=${frameChecksum(4, payload)}`);
      expect(frameChecksum(4, payload)).assertEqual(expected);
      log('testSppFrame0306 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_FRAME_0307
     * @tc.name      testSppFrame0307
     * @tc.desc      Verify the checksum wraps around for maximum byte values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppFrame0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppFrame0307 begin');
      const payload: Uint8Array = new Uint8Array(2);
      payload[0] = 0xFF;
      payload[1] = 0xFF;
      const expected: number = (0xA5 + 2 + 255 + 255) & 0xFF;
      const actual: number = frameChecksum(2, payload);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=expected`);
      expect(actual).assertEqual(expected);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual >= 0 && actual <= 255=${actual >= 0 && actual <= 255}`);
      expect(actual >= 0 && actual <= 255).assertTrue();
      log('testSppFrame0307 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_FRAME_0308
     * @tc.name      testSppFrame0308
     * @tc.desc      Verify pack and parse round trip for a two byte payload.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppFrame0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppFrame0308 begin');
      const frame: Uint8Array = packFrame(new Uint8Array([0x42, 0x54]));
      const result: ParseResult = parseFrame(frame);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue result.ok=${result.ok}`);
      expect(result.ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.payload.length=${result.payload.length}, expected=2`);
      expect(result.payload.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.payload[0]=${result.payload[0]}, expected=0x42`);
      expect(result.payload[0]).assertEqual(0x42);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.payload[1]=${result.payload[1]}, expected=0x54`);
      expect(result.payload[1]).assertEqual(0x54);
      log('testSppFrame0308 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_FRAME_0309
     * @tc.name      testSppFrame0309
     * @tc.desc      Verify pack and parse round trip for a five byte text payload.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppFrame0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppFrame0309 begin');
      const frame: Uint8Array = packFrame(new Uint8Array([104, 101, 108, 108, 111]));
      const result: ParseResult = parseFrame(frame);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue result.ok=${result.ok}`);
      expect(result.ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.payload.length=${result.payload.length}, expected=5`);
      expect(result.payload.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.payload[0]=${result.payload[0]}, expected=104`);
      expect(result.payload[0]).assertEqual(104);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.payload[4]=${result.payload[4]}, expected=111`);
      expect(result.payload[4]).assertEqual(111);
      log('testSppFrame0309 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_FRAME_0310
     * @tc.name      testSppFrame0310
     * @tc.desc      Verify round trip survives control bytes inside the payload.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppFrame0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppFrame0310 begin');
      const payload: Uint8Array = new Uint8Array([0x00, 0xFF, 0xA5, 0x5A]);
      const frame: Uint8Array = packFrame(payload);
      const result: ParseResult = parseFrame(frame);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue result.ok=${result.ok}`);
      expect(result.ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.payload.length=${result.payload.length}, expected=4`);
      expect(result.payload.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.payload[2]=${result.payload[2]}, expected=0xA5`);
      expect(result.payload[2]).assertEqual(0xA5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.payload[3]=${result.payload[3]}, expected=0x5A`);
      expect(result.payload[3]).assertEqual(0x5A);
      log('testSppFrame0310 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_FRAME_0311
     * @tc.name      testSppFrame0311
     * @tc.desc      Verify round trip for an empty payload keeps an empty result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppFrame0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppFrame0311 begin');
      const frame: Uint8Array = packFrame(new Uint8Array(0));
      const result: ParseResult = parseFrame(frame);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue result.ok=${result.ok}`);
      expect(result.ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.payload.length=${result.payload.length}, expected=0`);
      expect(result.payload.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.consumed=${result.consumed}, expected=4`);
      expect(result.consumed).assertEqual(4);
      log('testSppFrame0311 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_FRAME_0312
     * @tc.name      testSppFrame0312
     * @tc.desc      Verify a frame missing its tail byte fails to parse.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppFrame0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppFrame0312 begin');
      const frame: Uint8Array = packFrame(new Uint8Array([1, 2, 3]));
      const truncated: Uint8Array = frame.slice(0, frame.length - 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse parseFrame(truncated).ok=${parseFrame(truncated).ok}`);
      expect(parseFrame(truncated).ok).assertFalse();
      log('testSppFrame0312 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_FRAME_0313
     * @tc.name      testSppFrame0313
     * @tc.desc      Verify a frame missing its checksum byte fails to parse.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppFrame0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppFrame0313 begin');
      const frame: Uint8Array = packFrame(new Uint8Array([1, 2, 3]));
      const truncated: Uint8Array = frame.slice(0, frame.length - 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse parseFrame(truncated).ok=${parseFrame(truncated).ok}`);
      expect(parseFrame(truncated).ok).assertFalse();
      log('testSppFrame0313 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_FRAME_0314
     * @tc.name      testSppFrame0314
     * @tc.desc      Verify a lone head byte fails to parse as a frame.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppFrame0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppFrame0314 begin');
      const lone: Uint8Array = new Uint8Array([FRAME_HEAD]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse parseFrame(lone).ok=${parseFrame(lone).ok}`);
      expect(parseFrame(lone).ok).assertFalse();
      log('testSppFrame0314 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_FRAME_0315
     * @tc.name      testSppFrame0315
     * @tc.desc      Verify an empty input buffer fails to parse as a frame.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppFrame0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppFrame0315 begin');
      const empty: Uint8Array = new Uint8Array(0);
      const result: ParseResult = parseFrame(empty);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse result.ok=${result.ok}`);
      expect(result.ok).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.consumed=${result.consumed}, expected=0`);
      expect(result.consumed).assertEqual(0);
      log('testSppFrame0315 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_FRAME_0316
     * @tc.name      testSppFrame0316
     * @tc.desc      Verify leading noise bytes before the head are skipped on parse.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppFrame0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppFrame0316 begin');
      const frame: Uint8Array = packFrame(new Uint8Array([7, 7]));
      const noisy: Uint8Array = new Uint8Array(2 + frame.length);
      noisy[0] = 0x00;
      noisy[1] = 0x01;
      noisy.set(frame, 2);
      const result: ParseResult = parseFrame(noisy);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue result.ok=${result.ok}`);
      expect(result.ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.consumed=${result.consumed}`);
      expect(result.consumed).assertEqual(2 + frame.length);
      log('testSppFrame0316 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_FRAME_0317
     * @tc.name      testSppFrame0317
     * @tc.desc      Verify an inflated length field fails the parse length guard.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppFrame0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppFrame0317 begin');
      const frame: Uint8Array = packFrame(new Uint8Array([1, 2, 3]));
      frame[1] = 8;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse parseFrame(frame).ok=${parseFrame(frame).ok}`);
      expect(parseFrame(frame).ok).assertFalse();
      log('testSppFrame0317 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_FRAME_0318
     * @tc.name      testSppFrame0318
     * @tc.desc      Verify a corrupted checksum byte fails frame validation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppFrame0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppFrame0318 begin');
      const frame: Uint8Array = packFrame(new Uint8Array([1, 2, 3]));
      frame[5] = (frame[5] + 1) & 0xFF;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse parseFrame(frame).ok=${parseFrame(frame).ok}`);
      expect(parseFrame(frame).ok).assertFalse();
      log('testSppFrame0318 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_FRAME_0319
     * @tc.name      testSppFrame0319
     * @tc.desc      Verify a corrupted tail byte fails frame validation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppFrame0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppFrame0319 begin');
      const frame: Uint8Array = packFrame(new Uint8Array([1, 2, 3]));
      frame[6] = 0x5B;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse parseFrame(frame).ok=${parseFrame(frame).ok}`);
      expect(parseFrame(frame).ok).assertFalse();
      log('testSppFrame0319 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_FRAME_0320
     * @tc.name      testSppFrame0320
     * @tc.desc      Verify parsing two concatenated frames consumes only the first.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppFrame0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppFrame0320 begin');
      const first: Uint8Array = packFrame(new Uint8Array([1]));
      const second: Uint8Array = packFrame(new Uint8Array([2, 3]));
      const joined: Uint8Array = new Uint8Array(first.length + second.length);
      joined.set(first, 0);
      joined.set(second, first.length);
      const result: ParseResult = parseFrame(joined);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue result.ok=${result.ok}`);
      expect(result.ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.consumed=${result.consumed}, expected=first.length`);
      expect(result.consumed).assertEqual(first.length);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.payload[0]=${result.payload[0]}, expected=1`);
      expect(result.payload[0]).assertEqual(1);
      log('testSppFrame0320 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_FRAME_0321
     * @tc.name      testSppFrame0321
     * @tc.desc      Verify the second frame is parsed after advancing by consumed bytes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppFrame0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppFrame0321 begin');
      const first: Uint8Array = packFrame(new Uint8Array([1]));
      const second: Uint8Array = packFrame(new Uint8Array([2, 3]));
      const joined: Uint8Array = new Uint8Array(first.length + second.length);
      joined.set(first, 0);
      joined.set(second, first.length);
      const parsedFirst: ParseResult = parseFrame(joined);
      const rest: Uint8Array = joined.slice(parsedFirst.consumed);
      const parsedSecond: ParseResult = parseFrame(rest);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue parsedSecond.ok=${parsedSecond.ok}`);
      expect(parsedSecond.ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual parsedSecond.payload.length=${parsedSecond.payload.length}`);
      expect(parsedSecond.payload.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual parsedSecond.payload[1]=${parsedSecond.payload[1]}`);
      expect(parsedSecond.payload[1]).assertEqual(3);
      log('testSppFrame0321 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_FRAME_0322
     * @tc.name      testSppFrame0322
     * @tc.desc      Verify a payload containing the head byte still round trips.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppFrame0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppFrame0322 begin');
      const payload: Uint8Array = new Uint8Array([0xA5, 0xA5, 0xA5]);
      const frame: Uint8Array = packFrame(payload);
      const result: ParseResult = parseFrame(frame);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue result.ok=${result.ok}`);
      expect(result.ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.payload.length=${result.payload.length}, expected=3`);
      expect(result.payload.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.payload[0]=${result.payload[0]}, expected=0xA5`);
      expect(result.payload[0]).assertEqual(0xA5);
      log('testSppFrame0322 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_FRAME_0323
     * @tc.name      testSppFrame0323
     * @tc.desc      Verify a declared length beyond the buffer fails the guard.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppFrame0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppFrame0323 begin');
      const handMade: Uint8Array = new Uint8Array([FRAME_HEAD, 3, 0x00, FRAME_TAIL]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse parseFrame(handMade).ok=${parseFrame(handMade).ok}`);
      expect(parseFrame(handMade).ok).assertFalse();
      log('testSppFrame0323 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_FRAME_0324
     * @tc.name      testSppFrame0324
     * @tc.desc      Verify a maximum length payload of 255 bytes round trips.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppFrame0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppFrame0324 begin');
      const payload: Uint8Array = new Uint8Array(255);
      payload.fill(0x55);
      const frame: Uint8Array = packFrame(payload);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame.length=${frame.length}, expected=259`);
      expect(frame.length).assertEqual(259);
      const result: ParseResult = parseFrame(frame);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue result.ok=${result.ok}`);
      expect(result.ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.payload.length=${result.payload.length}, expected=255`);
      expect(result.payload.length).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.payload[254]=${result.payload[254]}, expected=0x55`);
      expect(result.payload[254]).assertEqual(0x55);
      log('testSppFrame0324 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_FRAME_0325
     * @tc.name      testSppFrame0325
     * @tc.desc      Verify parse result exposes boolean and number typed fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppFrame0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppFrame0325 begin');
      const result: ParseResult = parseFrame(packFrame(new Uint8Array([9])));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof result.ok=${typeof result.ok}, expected='boolean'`);
      expect(typeof result.ok).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof result.consumed=${typeof result.consumed}`);
      expect(typeof result.consumed).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof result.payload.length=${typeof result.payload.length}`);
      expect(typeof result.payload.length).assertEqual('number');
      log('testSppFrame0325 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_FRAME_0326
     * @tc.name      testSppFrame0326
     * @tc.desc      Verify consumed equals payload length plus the frame overhead.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppFrame0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppFrame0326 begin');
      const payload: Uint8Array = new Uint8Array([1, 2, 3, 4, 5, 6]);
      const result: ParseResult = parseFrame(packFrame(payload));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue result.ok=${result.ok}`);
      expect(result.ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.consumed=${result.consumed}`);
      expect(result.consumed).assertEqual(payload.length + 4);
      log('testSppFrame0326 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_FRAME_0327
     * @tc.name      testSppFrame0327
     * @tc.desc      Verify the minimum frame length constant is four bytes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppFrame0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppFrame0327 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual MIN_FRAME_LENGTH=${MIN_FRAME_LENGTH}, expected=4`);
      expect(MIN_FRAME_LENGTH).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof MIN_FRAME_LENGTH=${typeof MIN_FRAME_LENGTH}`);
      expect(typeof MIN_FRAME_LENGTH).assertEqual('number');
      log('testSppFrame0327 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_FRAME_0328
     * @tc.name      testSppFrame0328
     * @tc.desc      Verify a buffer without any head byte fails to parse.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppFrame0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppFrame0328 begin');
      const noise: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse parseFrame(noise).ok=${parseFrame(noise).ok}`);
      expect(parseFrame(noise).ok).assertFalse();
      log('testSppFrame0328 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_FRAME_0329
     * @tc.name      testSppFrame0329
     * @tc.desc      Verify frame total length formula holds across payload sizes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppFrame0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppFrame0329 begin');
      for (let n: number = 0; n <= 8; n++) {
        const frame: Uint8Array = packFrame(new Uint8Array(n));
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame.length=${frame.length}, expected=n + 4`);
        expect(frame.length).assertEqual(n + 4);
      }
      log('testSppFrame0329 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_FRAME_0330
     * @tc.name      testSppFrame0330
     * @tc.desc      Verify a serial text payload round trips byte for byte.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppFrame0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppFrame0330 begin');
      const text: string = 'serial';
      const payload: Uint8Array = new Uint8Array(text.length);
      for (let i: number = 0; i < text.length; i++) {
        payload[i] = text.charCodeAt(i);
      }
      const result: ParseResult = parseFrame(packFrame(payload));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue result.ok=${result.ok}`);
      expect(result.ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.payload.length=${result.payload.length}, expected=6`);
      expect(result.payload.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.payload[0]=${result.payload[0]}, expected=0x73`);
      expect(result.payload[0]).assertEqual(0x73);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.payload[5]=${result.payload[5]}, expected=0x6C`);
      expect(result.payload[5]).assertEqual(0x6C);
      log('testSppFrame0330 end');
    })
  })
}
