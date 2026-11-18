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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  IrCodeCompiler,
  IrCode,
  IrCompileError,
  IrCompileResult,
  IrFrame,
  IrProtocol
} from 'ircore';
import { AppConstants } from 'common';

/**
 * IrCodeCompiler compile branch suite: pure logic checks only, no real IR transmission.
*/


/** Hilog domain reserved for the IR compiler logic tests. */
const DOMAIN: number = 0xF83D;
/** Prefix added to every case log so the logs can be filtered by suite. */
const SUITE_PREFIX: string = 'MeetingScene_IrCompiler_';
/** System per-frame pattern limit, mirrors AppConstants.MAX_PATTERN_LENGTH. */
const MAX_PATTERN_LENGTH: number = 1024;
/** Default carrier frequency in hertz, mirrors AppConstants.DEFAULT_FREQUENCY_HZ. */
const DEFAULT_FREQUENCY_HZ: number = 38000;
/** NEC frame length: 2 header values + 4 bytes * 16 values + 1 stop mark. */
const NEC_FRAME_LENGTH: number = 67;
/** NEC frame duration: 9000 + 4500 + 64 values of 560 with 32 long spaces + 560 stop mark. */
const NEC_FRAME_DURATION_US: number = 67980;
/** Sony SIRC 12-bit layout: 2 header values + 12 mark/space pairs. */
const SONY_12_FRAME_LENGTH: number = 26;
/** Sony SIRC 15-bit layout: 2 header values + 15 mark/space pairs. */
const SONY_15_FRAME_LENGTH: number = 32;
/** Sony SIRC 20-bit layout: 2 header values + 20 mark/space pairs. */
const SONY_20_FRAME_LENGTH: number = 42;
/** RC5 total duration: 14 bits * 2 half-bits * 889 microseconds. */
const RC5_DURATION_US: number = 24892;
/** One RC5 Manchester half-bit in microseconds. */
const RC5_HALF_BIT_US: number = 889;
/** Two merged half-bits of the same level, produced by consecutive equal Manchester levels. */
const RC5_FULL_BIT_US: number = 1778;
/** NEC AGC header mark in microseconds. */
const NEC_HEADER_MARK_US: number = 9000;
/** NEC header space in microseconds. */
const NEC_HEADER_SPACE_US: number = 4500;
/** NEC base unit: logical 0 mark and logical 0 space. */
const NEC_UNIT_US: number = 560;
/** NEC logical 1 space in microseconds. */
const NEC_ONE_SPACE_US: number = 1690;
/** Sony SIRC header mark in microseconds. */
const SONY_HEADER_MARK_US: number = 2400;
/** Sony SIRC header space and base unit in microseconds. */
const SONY_UNIT_US: number = 600;
/** Sony SIRC logical 1 mark in microseconds. */
const SONY_ONE_MARK_US: number = 1200;
/** Sony 15-bit payload 1234 has five 1 bits: 3000 + 5 * 1800 + 10 * 1200 microseconds. */
const SONY_15_ONES_DURATION_US: number = 24000;
/** Sony 20-bit payload 0 has no 1 bit: 3000 + 20 * 1200 microseconds. */
const SONY_20_ZERO_DURATION_US: number = 27000;
/** Native ECMAScript error type used by ArkTS for thrown Error objects. */
const ERROR_TYPE_NAME: string = 'Error';

/** Minimal error shape used to assert thrown errors without any type. */
interface CaughtError {
  name: string;
  message: string;
}

/** Builds one IrCode with explicit protocol, payload and repeat count. */
function makeCode(protocol: IrProtocol, payload: string, repeatCount: number): IrCode {
  const code: IrCode = new IrCode();
  code.protocol = protocol;
  code.payload = payload;
  code.repeatCount = repeatCount;
  return code;
}

/** Builds a RAW code with repeat count one. */
function makeRawCode(payload: string): IrCode {
  return makeCode(IrProtocol.RAW, payload, 1);
}

/** Builds a RAW payload of the given length with deterministic positive values. */
function buildRawPayload(length: number): string {
  const values: string[] = [];
  for (let i: number = 0; i < length; i++) {
    values.push(((i % 5) + 1) * 100 + '');
  }
  return values.join(' ');
}

/** Sums one frame pattern so duration assertions stay self-consistent. */
function sumPattern(pattern: number[]): number {
  let total: number = 0;
  for (let i: number = 0; i < pattern.length; i++) {
    total += pattern[i];
  }
  return total;
}

/** Reports whether the pattern contains at least one value that is not positive. */
function hasNonPositive(pattern: number[]): boolean {
  for (let i: number = 0; i < pattern.length; i++) {
    if (!(pattern[i] > 0)) {
      return true;
    }
  }
  return false;
}

/** Reports whether every frame index equals its position in the frame list. */
function framesAreIndexed(frames: IrFrame[]): boolean {
  for (let i: number = 0; i < frames.length; i++) {
    if (frames[i].index !== i) {
      return false;
    }
  }
  return true;
}

/** Reports whether any frame exceeds the system pattern length limit. */
function anyFrameTooLong(frames: IrFrame[]): boolean {
  for (let i: number = 0; i < frames.length; i++) {
    if (frames[i].pattern.length > MAX_PATTERN_LENGTH) {
      return true;
    }
  }
  return false;
}

/** Reports whether two patterns are element-wise identical. */
function patternsEqual(first: number[], second: number[]): boolean {
  if (first.length !== second.length) {
    return false;
  }
  for (let i: number = 0; i < first.length; i++) {
    if (first[i] !== second[i]) {
      return false;
    }
  }
  return true;
}

/** Counts how many times a value occurs in a pattern. */
function countValue(pattern: number[], value: number): number {
  let count: number = 0;
  for (let i: number = 0; i < pattern.length; i++) {
    if (pattern[i] === value) {
      count++;
    }
  }
  return count;
}

/** Reports whether every frame duration equals the sum of its own pattern. */
function durationsAreConsistent(frames: IrFrame[]): boolean {
  for (let i: number = 0; i < frames.length; i++) {
    if (frames[i].durationUs !== sumPattern(frames[i].pattern)) {
      return false;
    }
  }
  return true;
}

/** Reports whether all patterns in the list are element-wise identical. */
function allPatternsEqual(frames: IrFrame[]): boolean {
  for (let i: number = 1; i < frames.length; i++) {
    if (!patternsEqual(frames[0].pattern, frames[i].pattern)) {
      return false;
    }
  }
  return true;
}

/** Compiles and asserts the result failed with the expected error code. */
function expectFailure(protocol: IrProtocol, payload: string, error: IrCompileError,
  messagePart: string): IrCompileResult {
  const result: IrCompileResult = IrCodeCompiler.compile(makeCode(protocol, payload, 1));
  expect(result.ok).assertFalse();
  expect(result.error).assertEqual(error);
  expect(result.frames.length).assertEqual(0);
  expect(result.message.length > 0).assertTrue();
  expect(result.message.indexOf(messagePart) >= 0).assertTrue();
  return result;
}

/** Compiles and asserts the result succeeded, returning the frame list. */
function expectSuccess(protocol: IrProtocol, payload: string): IrFrame[] {
  const result: IrCompileResult = IrCodeCompiler.compile(makeCode(protocol, payload, 1));
  expect(result.ok).assertTrue();
  expect(result.error).assertEqual(IrCompileError.NONE);
  expect(result.message).assertEqual('');
  expect(result.frames.length > 0).assertTrue();
  return result.frames;
}

/** Verifies the invariants every successful compile result must satisfy. */
function assertFrameInvariants(frames: IrFrame[]): void {
  expect(frames.length > 0).assertTrue();
  expect(framesAreIndexed(frames)).assertTrue();
  expect(anyFrameTooLong(frames)).assertFalse();
  expect(durationsAreConsistent(frames)).assertTrue();
  for (let i: number = 0; i < frames.length; i++) {
    expect(frames[i].pattern.length > 0).assertTrue();
    expect(hasNonPositive(frames[i].pattern)).assertFalse();
    expect(frames[i].durationUs > 0).assertTrue();
  }
}

/** Captures the message of an error thrown by the given action, empty when nothing is thrown. */
function captureThrowMessage(action: () => void): string {
  let message: string = '';
  try {
    action();
  } catch (error) {
    const caught: CaughtError = error as CaughtError;
    if (caught !== undefined && caught.message !== undefined) {
      message = caught.message;
    }
  }
  return message;
}

export default function irCompilerLogicExtraTest() {
  describe('IrCompilerLogicExtraTest', () => {

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0100
     * @tc.name      testIrCompiler0001
     * @tc.desc      Verify a comma separated RAW payload compiles identically to the space separated
     *               form, with a single frame whose length equals the input value count.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrCompiler0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testIrCompiler0001';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const commaFrames: IrFrame[] = expectSuccess(IrProtocol.RAW, '100,200,300,400');
      const spaceFrames: IrFrame[] = expectSuccess(IrProtocol.RAW, '100 200 300 400');
      expect(commaFrames.length).assertEqual(1);
      expect(spaceFrames.length).assertEqual(1);
      expect(commaFrames[0].pattern.length).assertEqual(4);
      expect(patternsEqual(commaFrames[0].pattern, spaceFrames[0].pattern)).assertTrue();
      expect(commaFrames[0].pattern[0]).assertEqual(100);
      expect(commaFrames[0].pattern[2]).assertEqual(300);
      expect(commaFrames[0].durationUs).assertEqual(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0101
     * @tc.name      testIrCompiler0002
     * @tc.desc      Verify semicolon separated RAW values are normalized like spaces, and runs of
     *               separators plus surrounding whitespace do not produce extra empty values.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCompiler0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCompiler0002';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const semicolonFrames: IrFrame[] = expectSuccess(IrProtocol.RAW, '100;200;300;400');
      expect(semicolonFrames[0].pattern.length).assertEqual(4);
      expect(semicolonFrames[0].durationUs).assertEqual(1000);
      const messyFrames: IrFrame[] = expectSuccess(IrProtocol.RAW, '  100 ,  200 ; 300   400  ');
      expect(messyFrames[0].pattern.length).assertEqual(4);
      expect(messyFrames[0].pattern[0]).assertEqual(100);
      expect(messyFrames[0].pattern[3]).assertEqual(400);
      expect(patternsEqual(semicolonFrames[0].pattern, messyFrames[0].pattern)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0102
     * @tc.name      testIrCompiler0003
     * @tc.desc      Verify an odd length RAW sequence is padded by duplicating its last value so the
     *               resulting pattern length becomes even and the final two values are equal.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCompiler0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCompiler0003';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const oneValue: IrFrame[] = expectSuccess(IrProtocol.RAW, '500');
      expect(oneValue[0].pattern.length).assertEqual(2);
      expect(oneValue[0].pattern[0]).assertEqual(500);
      expect(oneValue[0].pattern[1]).assertEqual(500);
      expect(oneValue[0].durationUs).assertEqual(1000);
      const fiveValues: IrFrame[] = expectSuccess(IrProtocol.RAW, '100 200 300 400 500');
      expect(fiveValues[0].pattern.length).assertEqual(6);
      expect(fiveValues[0].pattern[4]).assertEqual(500);
      expect(fiveValues[0].pattern[5]).assertEqual(500);
      expect(fiveValues[0].durationUs).assertEqual(2000);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0103
     * @tc.name      testIrCompiler0004
     * @tc.desc      Verify a RAW payload containing a zero value is rejected with INVALID_VALUE and
     *               the failure message quotes the offending token.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrCompiler0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testIrCompiler0004';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const result: IrCompileResult =
        expectFailure(IrProtocol.RAW, '9000 0 4500 560', IrCompileError.INVALID_VALUE, 'invalid value');
      expect(result.message.indexOf(': 0') >= 0).assertTrue();
      const leadingZero: IrCompileResult =
        expectFailure(IrProtocol.RAW, '0 100', IrCompileError.INVALID_VALUE, 'invalid value');
      expect(leadingZero.frames.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0104
     * @tc.name      testIrCompiler0005
     * @tc.desc      Verify negative RAW values are rejected with INVALID_VALUE and no frame is
     *               produced even when the remaining values are all valid.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCompiler0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCompiler0005';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const middle: IrCompileResult =
        expectFailure(IrProtocol.RAW, '9000 -4500 560 560', IrCompileError.INVALID_VALUE, 'invalid value');
      expect(middle.message.indexOf('-4500') >= 0).assertTrue();
      const trailing: IrCompileResult =
        expectFailure(IrProtocol.RAW, '9000 4500 -1', IrCompileError.INVALID_VALUE, 'invalid value');
      expect(trailing.ok).assertFalse();
      expect(trailing.frames.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0105
     * @tc.name      testIrCompiler0006
     * @tc.desc      Verify non numeric RAW tokens and NaN text are rejected with INVALID_VALUE and
     *               the message keeps the original token text for diagnosis.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCompiler0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCompiler0006';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const alpha: IrCompileResult =
        expectFailure(IrProtocol.RAW, 'abc 4500', IrCompileError.INVALID_VALUE, 'invalid value');
      expect(alpha.message.indexOf('abc') >= 0).assertTrue();
      const nanText: IrCompileResult =
        expectFailure(IrProtocol.RAW, 'NaN 4500', IrCompileError.INVALID_VALUE, 'invalid value');
      expect(nanText.message.indexOf('NaN') >= 0).assertTrue();
      const hexLike: IrCompileResult =
        expectFailure(IrProtocol.RAW, '12abc 4500', IrCompileError.INVALID_VALUE, 'invalid value');
      expect(hexLike.frames.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0106
     * @tc.name      testIrCompiler0007
     * @tc.desc      Verify Infinity text in a RAW payload is rejected with INVALID_VALUE because the
     *               value is not finite, and no partial frame survives the failure.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCompiler0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCompiler0007';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const infinite: IrCompileResult =
        expectFailure(IrProtocol.RAW, '100 Infinity', IrCompileError.INVALID_VALUE, 'invalid value');
      expect(infinite.message.indexOf('Infinity') >= 0).assertTrue();
      const negativeInfinite: IrCompileResult =
        expectFailure(IrProtocol.RAW, '-Infinity 100', IrCompileError.INVALID_VALUE, 'invalid value');
      expect(negativeInfinite.frames.length).assertEqual(0);
      expect(negativeInfinite.error !== IrCompileError.NONE).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0107
     * @tc.name      testIrCompiler0008
     * @tc.desc      Verify a RAW payload made only of separators yields EMPTY_PAYLOAD because no
     *               usable numeric value can be parsed.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCompiler0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCompiler0008';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const separatorsOnly: IrCompileResult =
        expectFailure(IrProtocol.RAW, ',,,, ;;; ', IrCompileError.EMPTY_PAYLOAD, 'no valid values');
      expect(separatorsOnly.frames.length).assertEqual(0);
      const blank: IrCompileResult =
        expectFailure(IrProtocol.RAW, '          ', IrCompileError.EMPTY_PAYLOAD, 'payload is empty');
      expect(blank.error).assertEqual(IrCompileError.EMPTY_PAYLOAD);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0108
     * @tc.name      testIrCompiler0009
     * @tc.desc      Verify exactly 1024 positive RAW values compile into one frame of that length
     *               without triggering the too-long guard.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrCompiler0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testIrCompiler0009';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(MAX_PATTERN_LENGTH).assertEqual(AppConstants.MAX_PATTERN_LENGTH);
      const frames: IrFrame[] = expectSuccess(IrProtocol.RAW, buildRawPayload(MAX_PATTERN_LENGTH));
      expect(frames.length).assertEqual(1);
      expect(frames[0].pattern.length).assertEqual(MAX_PATTERN_LENGTH);
      expect(anyFrameTooLong(frames)).assertFalse();
      // Index 1023 is the fourth element of the five value cycle, so 400.
      expect(frames[0].pattern[MAX_PATTERN_LENGTH - 1]).assertEqual(400);
      expect(frames[0].durationUs).assertEqual(sumPattern(frames[0].pattern));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0109
     * @tc.name      testIrCompiler0010
     * @tc.desc      Verify 1025 positive RAW values are padded to 1026 and split into two frames of
     *               1024 and 2 values, with consecutive frame indexes.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrCompiler0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testIrCompiler0010';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const frames: IrFrame[] = expectSuccess(IrProtocol.RAW, buildRawPayload(MAX_PATTERN_LENGTH + 1));
      expect(frames.length).assertEqual(2);
      expect(frames[0].pattern.length).assertEqual(MAX_PATTERN_LENGTH);
      expect(frames[1].pattern.length).assertEqual(2);
      expect(frames[0].index).assertEqual(0);
      expect(frames[1].index).assertEqual(1);
      expect(framesAreIndexed(frames)).assertTrue();
      expect(anyFrameTooLong(frames)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0110
     * @tc.name      testIrCompiler0011
     * @tc.desc      Verify an even 2048 value RAW payload splits into exactly two full frames of 1024 values
     *               whose first values are 100 and 500 and whose durations equal their own value sums.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCompiler0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCompiler0011';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const frames: IrFrame[] = expectSuccess(IrProtocol.RAW, buildRawPayload(MAX_PATTERN_LENGTH * 2));
      expect(frames.length).assertEqual(2);
      expect(frames[0].pattern.length).assertEqual(MAX_PATTERN_LENGTH);
      expect(frames[1].pattern.length).assertEqual(MAX_PATTERN_LENGTH);
      expect(frames[0].pattern[0]).assertEqual(100);
      // The second frame starts at index 1024, the fifth element of the cycle, so 500.
      expect(frames[1].pattern[0]).assertEqual(500);
      expect(frames[0].durationUs).assertEqual(sumPattern(frames[0].pattern));
      expect(frames[1].durationUs).assertEqual(sumPattern(frames[1].pattern));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0111
     * @tc.name      testIrCompiler0012
     * @tc.desc      Verify every compiled RAW pattern only contains positive durations and the frame
     *               duration equals the arithmetic sum of its pattern values.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCompiler0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCompiler0012';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const frames: IrFrame[] = expectSuccess(IrProtocol.RAW, '250 750 1250 1750 2250 2750');
      expect(frames.length).assertEqual(1);
      expect(hasNonPositive(frames[0].pattern)).assertFalse();
      expect(frames[0].pattern.length).assertEqual(6);
      expect(frames[0].durationUs).assertEqual(9000);
      expect(sumPattern(frames[0].pattern)).assertEqual(9000);
      expect(frames[0].pattern[0]).assertEqual(250);
      expect(frames[0].pattern[5]).assertEqual(2750);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0112
     * @tc.name      testIrCompiler0013
     * @tc.desc      Verify a standard NEC hexadecimal payload compiles into a 67 value frame with
     *               the documented header mark and space and a trailing stop mark.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrCompiler0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testIrCompiler0013';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const frames: IrFrame[] = expectSuccess(IrProtocol.NEC, '0x08,0xF7');
      expect(frames.length).assertEqual(1);
      expect(frames[0].pattern.length).assertEqual(NEC_FRAME_LENGTH);
      expect(frames[0].pattern[0]).assertEqual(NEC_HEADER_MARK_US);
      expect(frames[0].pattern[1]).assertEqual(NEC_HEADER_SPACE_US);
      expect(frames[0].pattern[NEC_FRAME_LENGTH - 1]).assertEqual(NEC_UNIT_US);
      expect(frames[0].durationUs).assertEqual(sumPattern(frames[0].pattern));
      expect(frames[0].durationUs > 60000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0113
     * @tc.name      testIrCompiler0014
     * @tc.desc      Verify the NEC address byte is emitted LSB first with a fixed mark and either a
     *               short or a long space depending on the bit value.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrCompiler0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testIrCompiler0014';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const frames: IrFrame[] = expectSuccess(IrProtocol.NEC, '0x01,0x00');
      const pattern: number[] = frames[0].pattern;
      expect(pattern[2]).assertEqual(NEC_UNIT_US);
      expect(pattern[3]).assertEqual(NEC_ONE_SPACE_US);
      expect(pattern[4]).assertEqual(NEC_UNIT_US);
      expect(pattern[5]).assertEqual(NEC_UNIT_US);
      expect(pattern[16]).assertEqual(NEC_UNIT_US);
      expect(pattern[17]).assertEqual(NEC_UNIT_US);
      expect(pattern[2 + 2 * 8]).assertEqual(NEC_UNIT_US);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0114
     * @tc.name      testIrCompiler0015
     * @tc.desc      Verify the NEC address and command are followed by their own bitwise inverse,
     *               so address 0x08 emits 0xF7 in the second byte slot.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCompiler0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCompiler0015';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const frames: IrFrame[] = expectSuccess(IrProtocol.NEC, '0x08,0x08');
      const pattern: number[] = frames[0].pattern;
      const addressOneCount: number = countValue(pattern.slice(2, 18), NEC_ONE_SPACE_US);
      const inverseOneCount: number = countValue(pattern.slice(18, 34), NEC_ONE_SPACE_US);
      expect(addressOneCount).assertEqual(1);
      expect(inverseOneCount).assertEqual(7);
      expect(addressOneCount + inverseOneCount).assertEqual(8);
      const commandOneCount: number = countValue(pattern.slice(34, 50), NEC_ONE_SPACE_US);
      const commandInverseCount: number = countValue(pattern.slice(50, 66), NEC_ONE_SPACE_US);
      expect(commandOneCount).assertEqual(1);
      expect(commandInverseCount).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0115
     * @tc.name      testIrCompiler0016
     * @tc.desc      Verify a 16-bit NEC value is interpreted as byte plus inverse and only the high
     *               byte is used, so 0x08F7 behaves like 0x08 and 0x0F00 behaves like 0x0F.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCompiler0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCompiler0016';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const wideFrames: IrFrame[] = expectSuccess(IrProtocol.NEC, '0x08F7,0x0F00');
      const byteFrames: IrFrame[] = expectSuccess(IrProtocol.NEC, '0x08,0x0F');
      expect(wideFrames[0].pattern.length).assertEqual(NEC_FRAME_LENGTH);
      expect(byteFrames[0].pattern.length).assertEqual(NEC_FRAME_LENGTH);
      expect(patternsEqual(wideFrames[0].pattern, byteFrames[0].pattern)).assertTrue();
      expect(wideFrames[0].durationUs).assertEqual(byteFrames[0].durationUs);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0116
     * @tc.name      testIrCompiler0017
     * @tc.desc      Verify NEC 8-bit boundary values 0 and 255 compile successfully, where address
     *               zero emits eight short spaces in the inverted byte.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCompiler0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCompiler0017';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const zeroAddress: IrFrame[] = expectSuccess(IrProtocol.NEC, '0,255');
      const pattern: number[] = zeroAddress[0].pattern;
      expect(pattern.length).assertEqual(NEC_FRAME_LENGTH);
      expect(countValue(pattern.slice(2, 18), NEC_ONE_SPACE_US)).assertEqual(0);
      expect(countValue(pattern.slice(18, 34), NEC_ONE_SPACE_US)).assertEqual(8);
      expect(countValue(pattern.slice(34, 50), NEC_ONE_SPACE_US)).assertEqual(8);
      expect(countValue(pattern.slice(50, 66), NEC_ONE_SPACE_US)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0117
     * @tc.name      testIrCompiler0018
     * @tc.desc      Verify NEC payloads with one value, three values, a semicolon separator or a non numeric
     *               address are rejected with INVALID_VALUE and the address/command message.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCompiler0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCompiler0018';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expectFailure(IrProtocol.NEC, '0x08', IrCompileError.INVALID_VALUE,
        'must contain address and command');
      expectFailure(IrProtocol.NEC, '0x08,0xF7,0x01', IrCompileError.INVALID_VALUE,
        'must contain address and command');
      expectFailure(IrProtocol.NEC, '0x08;0xF7', IrCompileError.INVALID_VALUE,
        'must contain address and command');
      expectFailure(IrProtocol.NEC, 'abc,0xF7', IrCompileError.INVALID_VALUE,
        'must contain address and command');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0118
     * @tc.name      testIrCompiler0019
     * @tc.desc      Verify NEC values beyond sixteen bits, negative values and non integer values are
     *               rejected with the byte range message, while '65535,65535' compiles into a 67 value frame.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCompiler0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCompiler0019';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expectFailure(IrProtocol.NEC, '65536,0', IrCompileError.INVALID_VALUE, '8-bit values');
      expectFailure(IrProtocol.NEC, '0,-1', IrCompileError.INVALID_VALUE, '8-bit values');
      expectFailure(IrProtocol.NEC, '1.5,0', IrCompileError.INVALID_VALUE, '8-bit values');
      const upperOk: IrFrame[] = expectSuccess(IrProtocol.NEC, '65535,65535');
      expect(upperOk[0].pattern.length).assertEqual(NEC_FRAME_LENGTH);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0119
     * @tc.name      testIrCompiler0020
     * @tc.desc      Verify a 15-bit SONY payload compiles into a 32 value frame where each data bit
     *               contributes a mark and a fixed space after the header pair.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrCompiler0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testIrCompiler0020';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const frames: IrFrame[] = expectSuccess(IrProtocol.SONY, '1234,15');
      expect(frames[0].pattern.length).assertEqual(SONY_15_FRAME_LENGTH);
      expect(frames[0].pattern[0]).assertEqual(SONY_HEADER_MARK_US);
      expect(frames[0].pattern[1]).assertEqual(SONY_UNIT_US);
      expect(countValue(frames[0].pattern, SONY_UNIT_US)).assertEqual(26);
      expect(countValue(frames[0].pattern, SONY_ONE_MARK_US)).assertEqual(5);
      expect(frames[0].durationUs).assertEqual(sumPattern(frames[0].pattern));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0120
     * @tc.name      testIrCompiler0021
     * @tc.desc      Verify SONY 12-bit and 20-bit frames have 26 and 42 values respectively and the
     *               shortest frame of data zero only contains one-mark count zero.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCompiler0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCompiler0021';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const twelve: IrFrame[] = expectSuccess(IrProtocol.SONY, '0,12');
      expect(twelve[0].pattern.length).assertEqual(SONY_12_FRAME_LENGTH);
      expect(countValue(twelve[0].pattern, SONY_ONE_MARK_US)).assertEqual(0);
      const twenty: IrFrame[] = expectSuccess(IrProtocol.SONY, '0,20');
      expect(twenty[0].pattern.length).assertEqual(SONY_20_FRAME_LENGTH);
      expect(countValue(twenty[0].pattern, SONY_ONE_MARK_US)).assertEqual(0);
      expect(twenty[0].durationUs > twelve[0].durationUs).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0121
     * @tc.name      testIrCompiler0022
     * @tc.desc      Verify SONY data is emitted LSB first: data value one produces a long mark at the
     *               first data bit and short marks for all remaining bits.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrCompiler0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testIrCompiler0022';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const frames: IrFrame[] = expectSuccess(IrProtocol.SONY, '1,12');
      const pattern: number[] = frames[0].pattern;
      expect(pattern[2]).assertEqual(SONY_ONE_MARK_US);
      expect(pattern[3]).assertEqual(SONY_UNIT_US);
      expect(pattern[4]).assertEqual(SONY_UNIT_US);
      expect(pattern[6]).assertEqual(SONY_UNIT_US);
      expect(countValue(pattern, SONY_ONE_MARK_US)).assertEqual(1);
      const highBit: IrFrame[] = expectSuccess(IrProtocol.SONY, '2048,12');
      expect(highBit[0].pattern[pattern.length - 2]).assertEqual(SONY_ONE_MARK_US);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0122
     * @tc.name      testIrCompiler0023
     * @tc.desc      Verify SONY bit counts other than 12, 15 and 20 are rejected with the explicit
     *               supported bit count message.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCompiler0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCompiler0023';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expectFailure(IrProtocol.SONY, '1,11', IrCompileError.INVALID_VALUE, '12, 15 or 20 bits');
      expectFailure(IrProtocol.SONY, '1,13', IrCompileError.INVALID_VALUE, '12, 15 or 20 bits');
      expectFailure(IrProtocol.SONY, '1,21', IrCompileError.INVALID_VALUE, '12, 15 or 20 bits');
      expectFailure(IrProtocol.SONY, '1,0', IrCompileError.INVALID_VALUE, '12, 15 or 20 bits');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0123
     * @tc.name      testIrCompiler0024
     * @tc.desc      Verify SONY data equal to the bit width upper bound, negative data and non
     *               integer data are rejected with the range message.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCompiler0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCompiler0024';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expectFailure(IrProtocol.SONY, '4096,12', IrCompileError.INVALID_VALUE, '12-bit range');
      expectFailure(IrProtocol.SONY, '32768,15', IrCompileError.INVALID_VALUE, '15-bit range');
      expectFailure(IrProtocol.SONY, '1048576,20', IrCompileError.INVALID_VALUE, '20-bit range');
      expectFailure(IrProtocol.SONY, '-1,12', IrCompileError.INVALID_VALUE, '12-bit range');
      expectFailure(IrProtocol.SONY, '2.5,12', IrCompileError.INVALID_VALUE, '12-bit range');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0124
     * @tc.name      testIrCompiler0025
     * @tc.desc      Verify SONY data at the highest value representable by each supported bit width
     *               compiles successfully with the expected frame length.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCompiler0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCompiler0025';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const twelve: IrFrame[] = expectSuccess(IrProtocol.SONY, '4095,12');
      expect(twelve[0].pattern.length).assertEqual(SONY_12_FRAME_LENGTH);
      expect(countValue(twelve[0].pattern, SONY_ONE_MARK_US)).assertEqual(12);
      const fifteen: IrFrame[] = expectSuccess(IrProtocol.SONY, '32767,15');
      expect(fifteen[0].pattern.length).assertEqual(SONY_15_FRAME_LENGTH);
      expect(countValue(fifteen[0].pattern, SONY_ONE_MARK_US)).assertEqual(15);
      const twenty: IrFrame[] = expectSuccess(IrProtocol.SONY, '1048575,20');
      expect(twenty[0].pattern.length).assertEqual(SONY_20_FRAME_LENGTH);
      expect(countValue(twenty[0].pattern, SONY_ONE_MARK_US)).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0125
     * @tc.name      testIrCompiler0026
     * @tc.desc      Verify SONY payloads with a wrong token count or non numeric text are rejected
     *               with the data and bits message.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCompiler0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCompiler0026';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expectFailure(IrProtocol.SONY, '12', IrCompileError.INVALID_VALUE, 'must contain data and bits');
      expectFailure(IrProtocol.SONY, '1,12,3', IrCompileError.INVALID_VALUE,
        'must contain data and bits');
      expectFailure(IrProtocol.SONY, 'abc,12', IrCompileError.INVALID_VALUE,
        'must contain data and bits');
      expectFailure(IrProtocol.SONY, '1,abc', IrCompileError.INVALID_VALUE,
        'must contain data and bits');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0126
     * @tc.name      testIrCompiler0027
     * @tc.desc      Verify the RC5 zero address and zero command frame starts with alternating half-bit marks
     *               for the preamble bits and totals the documented 24892 microseconds.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrCompiler0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testIrCompiler0027';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const frames: IrFrame[] = expectSuccess(IrProtocol.RC5, '0,0');
      const pattern: number[] = frames[0].pattern;
      // The preamble bits start with alternating half-bit marks of 889 microseconds.
      expect(pattern[0]).assertEqual(RC5_HALF_BIT_US);
      expect(pattern[1]).assertEqual(RC5_HALF_BIT_US);
      expect(frames[0].durationUs).assertEqual(RC5_DURATION_US);
      expect(sumPattern(pattern)).assertEqual(RC5_DURATION_US);
      expect(hasNonPositive(pattern)).assertFalse();
      expect(pattern.length >= 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0127
     * @tc.name      testIrCompiler0028
     * @tc.desc      Verify the RC5 Manchester encoding only uses multiples of the 889 microsecond
     *               half-bit and merges adjacent equal half-bits into longer runs.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCompiler0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCompiler0028';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const frames: IrFrame[] = expectSuccess(IrProtocol.RC5, '0,0');
      const pattern: number[] = frames[0].pattern;
      let allMultiples: boolean = true;
      for (let i: number = 0; i < pattern.length; i++) {
        if (pattern[i] % RC5_HALF_BIT_US !== 0) {
          allMultiples = false;
        }
      }
      expect(allMultiples).assertTrue();
      const fullBitCount: number = countValue(pattern, RC5_FULL_BIT_US);
      // Exactly one pair of adjacent zero half-bits merges into a 1778 run.
      expect(fullBitCount).assertEqual(1);
      expect(pattern.length < 28).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0128
     * @tc.name      testIrCompiler0029
     * @tc.desc      Verify RC5 address 31 and command 63 are accepted as upper bounds and keep the
     *               total duration of fourteen bits.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrCompiler0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testIrCompiler0029';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const frames: IrFrame[] = expectSuccess(IrProtocol.RC5, '31,63');
      expect(frames[0].durationUs).assertEqual(RC5_DURATION_US);
      expect(countValue(frames[0].pattern, RC5_FULL_BIT_US)).assertEqual(2);
      expect(frames[0].pattern.length > 0).assertTrue();
      expect(hasNonPositive(frames[0].pattern)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0129
     * @tc.name      testIrCompiler0030
     * @tc.desc      Verify RC5 addresses above 31 and commands above 63 are rejected with the
     *               address or command range message.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCompiler0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCompiler0030';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expectFailure(IrProtocol.RC5, '32,0', IrCompileError.INVALID_VALUE, 'address must be an integer');
      expectFailure(IrProtocol.RC5, '0,64', IrCompileError.INVALID_VALUE, 'command must be an integer');
      expectFailure(IrProtocol.RC5, '-1,0', IrCompileError.INVALID_VALUE, 'address must be an integer');
      expectFailure(IrProtocol.RC5, '0,-1', IrCompileError.INVALID_VALUE, 'command must be an integer');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0130
     * @tc.name      testIrCompiler0031
     * @tc.desc      Verify non integer RC5 values and payloads without exactly two values are
     *               rejected before any frame is built.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCompiler0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCompiler0031';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expectFailure(IrProtocol.RC5, '1.5,0', IrCompileError.INVALID_VALUE, 'address must be an integer');
      expectFailure(IrProtocol.RC5, '0,2.5', IrCompileError.INVALID_VALUE, 'command must be an integer');
      expectFailure(IrProtocol.RC5, '0', IrCompileError.INVALID_VALUE,
        'must contain address and command');
      expectFailure(IrProtocol.RC5, '0,1,2', IrCompileError.INVALID_VALUE,
        'must contain address and command');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0131
     * @tc.name      testIrCompiler0032
     * @tc.desc      Verify RC5 command 1 differs from command 0 by a structural change of the
     *               Manchester pattern while keeping the same total duration.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIrCompiler0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testIrCompiler0032';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const zeroFrames: IrFrame[] = expectSuccess(IrProtocol.RC5, '0,0');
      const oneFrames: IrFrame[] = expectSuccess(IrProtocol.RC5, '0,1');
      expect(patternsEqual(zeroFrames[0].pattern, oneFrames[0].pattern)).assertFalse();
      expect(zeroFrames[0].durationUs).assertEqual(RC5_DURATION_US);
      expect(oneFrames[0].durationUs).assertEqual(RC5_DURATION_US);
      expect(zeroFrames[0].pattern.length > 0).assertTrue();
      expect(oneFrames[0].pattern.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0132
     * @tc.name      testIrCompiler0033
     * @tc.desc      Verify an address change also changes the RC5 pattern, so address bits take part
     *               in the Manchester waveform.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIrCompiler0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testIrCompiler0033';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const first: IrFrame[] = expectSuccess(IrProtocol.RC5, '1,1');
      const second: IrFrame[] = expectSuccess(IrProtocol.RC5, '2,1');
      expect(patternsEqual(first[0].pattern, second[0].pattern)).assertFalse();
      expect(first[0].durationUs).assertEqual(second[0].durationUs);
      expect(first[0].durationUs).assertEqual(RC5_DURATION_US);
      expect(first[0].pattern.length).assertEqual(second[0].pattern.length);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0133
     * @tc.name      testIrCompiler0034
     * @tc.desc      Verify the unimplemented RC6 protocol is rejected with UNSUPPORTED_PROTOCOL and
     *               an explanatory message instead of producing frames.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCompiler0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCompiler0034';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const frames: IrCompileResult = expectFailure(IrProtocol.RC6, '0,0',
        IrCompileError.UNSUPPORTED_PROTOCOL, 'RC6 compilation is not supported yet');
      expect(frames.ok).assertFalse();
      const alternate: IrCompileResult = expectFailure(IrProtocol.RC6, '1,2,3,4',
        IrCompileError.UNSUPPORTED_PROTOCOL, 'not supported');
      expect(alternate.frames.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0134
     * @tc.name      testIrCompiler0035
     * @tc.desc      Verify an empty payload is rejected for every protocol before the protocol
     *               dispatch, with EMPTY_PAYLOAD and the empty payload message.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrCompiler0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testIrCompiler0035';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const protocols: IrProtocol[] = [
        IrProtocol.RAW, IrProtocol.NEC, IrProtocol.SONY, IrProtocol.RC5, IrProtocol.RC6
      ];
      for (let i: number = 0; i < protocols.length; i++) {
        const result: IrCompileResult = IrCodeCompiler.compile(makeCode(protocols[i], '   ', 1));
        expect(result.ok).assertFalse();
        expect(result.error).assertEqual(IrCompileError.EMPTY_PAYLOAD);
        expect(result.frames.length).assertEqual(0);
        expect(result.message.indexOf('payload is empty') >= 0).assertTrue();
      }
      expect(protocols.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0135
     * @tc.name      testIrCompiler0036
     * @tc.desc      Verify a RAW payload with leading and trailing whitespace is trimmed and compiles
     *               to the same waveform as the trimmed text.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCompiler0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCompiler0036';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const padded: IrFrame[] = expectSuccess(IrProtocol.RAW, '    9000 4500 560 560 560 1690   ');
      const plain: IrFrame[] = expectSuccess(IrProtocol.RAW, '9000 4500 560 560 560 1690');
      expect(patternsEqual(padded[0].pattern, plain[0].pattern)).assertTrue();
      expect(padded[0].pattern.length).assertEqual(6);
      expect(padded[0].pattern[0]).assertEqual(9000);
      expect(padded[0].durationUs).assertEqual(plain[0].durationUs);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0136
     * @tc.name      testIrCompiler0037
     * @tc.desc      Verify a repeat count of two duplicates every compiled frame in order while each
     *               repeated frame keeps an identical pattern and a fresh index.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrCompiler0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testIrCompiler0037';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const result: IrCompileResult =
        IrCodeCompiler.compile(makeCode(IrProtocol.RAW, '100 200 300 400', 2));
      expect(result.ok).assertTrue();
      expect(result.frames.length).assertEqual(2);
      expect(result.frames[0].index).assertEqual(0);
      expect(result.frames[1].index).assertEqual(1);
      expect(patternsEqual(result.frames[0].pattern, result.frames[1].pattern)).assertTrue();
      expect(result.frames[0].durationUs).assertEqual(result.frames[1].durationUs);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0137
     * @tc.name      testIrCompiler0038
     * @tc.desc      Verify repeated frames do not share the same pattern array instance, so mutating
     *               one frame pattern leaves the other frame untouched.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCompiler0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCompiler0038';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const result: IrCompileResult =
        IrCodeCompiler.compile(makeCode(IrProtocol.NEC, '0x08,0xF7', 3));
      expect(result.ok).assertTrue();
      expect(result.frames.length).assertEqual(3);
      const originalSecond: number = result.frames[1].pattern[0];
      result.frames[0].pattern[0] = 1;
      expect(result.frames[1].pattern[0]).assertEqual(originalSecond);
      expect(result.frames[2].pattern[0]).assertEqual(NEC_HEADER_MARK_US);
      expect(framesAreIndexed(result.frames)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0138
     * @tc.name      testIrCompiler0039
     * @tc.desc      Verify a zero or negative repeat count falls back to a single emission instead of
     *               producing an empty frame list.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCompiler0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCompiler0039';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const zeroRepeat: IrCompileResult =
        IrCodeCompiler.compile(makeCode(IrProtocol.RAW, '100 200', 0));
      expect(zeroRepeat.ok).assertTrue();
      expect(zeroRepeat.frames.length).assertEqual(1);
      const negativeRepeat: IrCompileResult =
        IrCodeCompiler.compile(makeCode(IrProtocol.RAW, '100 200', -5));
      expect(negativeRepeat.ok).assertTrue();
      expect(negativeRepeat.frames.length).assertEqual(1);
      expect(negativeRepeat.frames[0].pattern.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0139
     * @tc.name      testIrCompiler0040
     * @tc.desc      Verify the carrier frequency carried by the code does not influence the compiled
     *               waveform, because frames only store microsecond durations.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCompiler0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCompiler0040';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const defaultCarrier: IrCode = makeCode(IrProtocol.RAW, '9000 4500 560 1690', 1);
      defaultCarrier.frequencyHz = DEFAULT_FREQUENCY_HZ;
      const highCarrier: IrCode = makeCode(IrProtocol.RAW, '9000 4500 560 1690', 1);
      highCarrier.frequencyHz = 48000;
      const first: IrCompileResult = IrCodeCompiler.compile(defaultCarrier);
      const second: IrCompileResult = IrCodeCompiler.compile(highCarrier);
      expect(first.ok).assertTrue();
      expect(second.ok).assertTrue();
      expect(patternsEqual(first.frames[0].pattern, second.frames[0].pattern)).assertTrue();
      expect(first.frames[0].durationUs).assertEqual(second.frames[0].durationUs);
      expect(first.frames[0].durationUs).assertEqual(15750);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0140
     * @tc.name      testIrCompiler0041
     * @tc.desc      Verify a manifest failure result carries no frames, a non NONE error code and a
     *               non empty message, while a success result carries the opposite values.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrCompiler0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testIrCompiler0041';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const failed: IrCompileResult = IrCodeCompiler.compile(makeCode(IrProtocol.NEC, 'abc,def', 1));
      expect(failed.ok).assertFalse();
      expect(failed.frames.length).assertEqual(0);
      expect(failed.error).assertEqual(IrCompileError.INVALID_VALUE);
      expect(failed.message.length > 0).assertTrue();
      const ok: IrCompileResult = IrCodeCompiler.compile(makeCode(IrProtocol.NEC, '0x08,0xF7', 1));
      expect(ok.ok).assertTrue();
      expect(ok.frames.length > 0).assertTrue();
      expect(ok.error).assertEqual(IrCompileError.NONE);
      expect(ok.message).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0141
     * @tc.name      testIrCompiler0042
     * @tc.desc      Verify every successful protocol compile returns frames whose duration equals the
     *               sum of their pattern and whose index starts at zero.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCompiler0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCompiler0042';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const payloads: string[] = ['9000 4500', '0x08,0xF7', '1234,15', '1,1'];
      const protocols: IrProtocol[] = [
        IrProtocol.RAW, IrProtocol.NEC, IrProtocol.SONY, IrProtocol.RC5
      ];
      for (let i: number = 0; i < protocols.length; i++) {
        const frames: IrFrame[] = expectSuccess(protocols[i], payloads[i]);
        expect(frames[0].index).assertEqual(0);
        expect(frames[0].durationUs).assertEqual(sumPattern(frames[0].pattern));
        expect(frames[0].durationUs > 0).assertTrue();
        expect(hasNonPositive(frames[0].pattern)).assertFalse();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0142
     * @tc.name      testIrCompiler0043
     * @tc.desc      Verify the NEC payload accepts whitespace around the comma and lower case hex
     *               digits, producing the same frame as the canonical upper case form.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCompiler0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCompiler0043';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const canonical: IrFrame[] = expectSuccess(IrProtocol.NEC, '0x08,0xF7');
      const loose: IrFrame[] = expectSuccess(IrProtocol.NEC, '0x08 , 0xf7');
      expect(patternsEqual(canonical[0].pattern, loose[0].pattern)).assertTrue();
      expect(loose[0].pattern.length).assertEqual(NEC_FRAME_LENGTH);
      expect(loose[0].durationUs).assertEqual(canonical[0].durationUs);
      expect(loose[0].pattern[0]).assertEqual(NEC_HEADER_MARK_US);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0143
     * @tc.name      testIrCompiler0044
     * @tc.desc      Verify decimal NEC values are accepted the same way as hexadecimal ones, so 8 and
     *               247 generate the frame of 0x08 and 0xF7.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCompiler0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCompiler0044';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const hexFrames: IrFrame[] = expectSuccess(IrProtocol.NEC, '0x08,0xF7');
      const decFrames: IrFrame[] = expectSuccess(IrProtocol.NEC, '8,247');
      expect(patternsEqual(hexFrames[0].pattern, decFrames[0].pattern)).assertTrue();
      expect(decFrames[0].pattern.length).assertEqual(NEC_FRAME_LENGTH);
      expect(decFrames[0].durationUs).assertEqual(hexFrames[0].durationUs);
      expect(countValue(decFrames[0].pattern, NEC_ONE_SPACE_US) > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0144
     * @tc.name      testIrCompiler0045
     * @tc.desc      Verify a two step repeat of a split RAW payload keeps both chunk sizes per repeat
     *               round, giving four frames for two rounds of a two chunk waveform.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIrCompiler0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testIrCompiler0045';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const result: IrCompileResult =
        IrCodeCompiler.compile(makeCode(IrProtocol.RAW, buildRawPayload(MAX_PATTERN_LENGTH * 2), 2));
      expect(result.ok).assertTrue();
      expect(result.frames.length).assertEqual(4);
      expect(result.frames[0].pattern.length).assertEqual(MAX_PATTERN_LENGTH);
      expect(result.frames[1].pattern.length).assertEqual(MAX_PATTERN_LENGTH);
      expect(patternsEqual(result.frames[0].pattern, result.frames[2].pattern)).assertTrue();
      expect(patternsEqual(result.frames[1].pattern, result.frames[3].pattern)).assertTrue();
      expect(framesAreIndexed(result.frames)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0145
     * @tc.name      testIrCompiler0046
     * @tc.desc      Verify all supported protocols compile a non empty frame list from a valid
     *               payload, confirming that the protocol dispatch covers RAW, NEC, SONY and RC5.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrCompiler0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testIrCompiler0046';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(IrProtocol.NEC).assertEqual('NEC');
      expect(IrProtocol.RC5).assertEqual('RC5');
      expect(IrProtocol.SONY).assertEqual('SONY');
      expect(IrProtocol.RAW).assertEqual('RAW');
      const raw: IrCompileResult = IrCodeCompiler.compile(makeCode(IrProtocol.RAW, '100 200', 1));
      const nec: IrCompileResult = IrCodeCompiler.compile(makeCode(IrProtocol.NEC, '1,2', 1));
      const sony: IrCompileResult = IrCodeCompiler.compile(makeCode(IrProtocol.SONY, '1,12', 1));
      const rc5: IrCompileResult = IrCodeCompiler.compile(makeCode(IrProtocol.RC5, '1,1', 1));
      expect(raw.ok).assertTrue();
      expect(nec.ok).assertTrue();
      expect(sony.ok).assertTrue();
      expect(rc5.ok).assertTrue();
      expect(raw.frames[0].pattern.length).assertEqual(2);
      expect(nec.frames[0].pattern.length).assertEqual(NEC_FRAME_LENGTH);
      expect(sony.frames[0].pattern.length).assertEqual(SONY_12_FRAME_LENGTH);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0146
     * @tc.name      testIrCompiler0047
     * @tc.desc      Verify the RC5 payloads '0,0' and '31,63' both keep the fixed fourteen bit duration of
     *               24892 microseconds with a frame length between 2 and 28 values.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIrCompiler0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testIrCompiler0047';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const zeroFrame: IrFrame[] = expectSuccess(IrProtocol.RC5, '0,0');
      const fullFrame: IrFrame[] = expectSuccess(IrProtocol.RC5, '31,63');
      expect(zeroFrame[0].durationUs).assertEqual(RC5_DURATION_US);
      expect(fullFrame[0].durationUs).assertEqual(RC5_DURATION_US);
      expect(zeroFrame[0].pattern.length <= 28).assertTrue();
      expect(fullFrame[0].pattern.length <= 28).assertTrue();
      expect(fullFrame[0].pattern.length >= 2).assertTrue();
      expect(zeroFrame[0].pattern.length >= 2).assertTrue();
      expect(sumPattern(fullFrame[0].pattern)).assertEqual(RC5_DURATION_US);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0147
     * @tc.name      testIrCompiler0048
     * @tc.desc      Verify the SONY twenty bit frame keeps forty two pattern values for several data
     *               values, so the frame size depends only on the declared bit width.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIrCompiler0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testIrCompiler0048';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const zero: IrFrame[] = expectSuccess(IrProtocol.SONY, '0,20');
      const pattern: IrFrame[] = expectSuccess(IrProtocol.SONY, '699050,20');
      const max: IrFrame[] = expectSuccess(IrProtocol.SONY, '1048575,20');
      expect(zero[0].pattern.length).assertEqual(SONY_20_FRAME_LENGTH);
      expect(pattern[0].pattern.length).assertEqual(SONY_20_FRAME_LENGTH);
      expect(max[0].pattern.length).assertEqual(SONY_20_FRAME_LENGTH);
      expect(zero[0].pattern.length).assertEqual(42);
      expect(max[0].durationUs > zero[0].durationUs).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0148
     * @tc.name      testIrCompiler0049
     * @tc.desc      Verify the NEC stop mark is the final pattern value and that the header mark and
     *               header space always occupy the first two positions of the frame.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIrCompiler0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testIrCompiler0049';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const frames: IrFrame[] = expectSuccess(IrProtocol.NEC, '0x00,0x00');
      const pattern: number[] = frames[0].pattern;
      expect(pattern[0]).assertEqual(NEC_HEADER_MARK_US);
      expect(pattern[1]).assertEqual(NEC_HEADER_SPACE_US);
      expect(pattern[pattern.length - 1]).assertEqual(NEC_UNIT_US);
      expect(pattern.length).assertEqual(67);
      expect(countValue(pattern, NEC_HEADER_MARK_US)).assertEqual(1);
      expect(countValue(pattern, NEC_HEADER_SPACE_US)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0149
     * @tc.name      testIrCompiler0050
     * @tc.desc      Verify the compiler reports NONE error and an empty message on success while the
     *               failure paths report a non empty message and the NONE free error code.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCompiler0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCompiler0050';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const success: IrCompileResult = IrCodeCompiler.compile(makeCode(IrProtocol.RAW, '100 200', 1));
      expect(success.ok).assertTrue();
      expect(success.error).assertEqual(IrCompileError.NONE);
      expect(success.message).assertEqual('');
      const failures: IrCompileResult[] = [
        IrCodeCompiler.compile(makeCode(IrProtocol.RAW, '', 1)),
        IrCodeCompiler.compile(makeCode(IrProtocol.NEC, 'x,1', 1)),
        IrCodeCompiler.compile(makeCode(IrProtocol.RC6, '1,1', 1))
      ];
      for (let i: number = 0; i < failures.length; i++) {
        expect(failures[i].ok).assertFalse();
        expect(failures[i].error !== IrCompileError.NONE).assertTrue();
        expect(failures[i].message.length > 0).assertTrue();
        expect(failures[i].frames.length).assertEqual(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCOMPILER_0150
     * @tc.name      testIrCompiler0051
     * @tc.desc      Verify RAW values follow the Number parser: exponent text and hexadecimal text are
     *               accepted while trailing junk is rejected.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIrCompiler0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testIrCompiler0051';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const exponent: IrCompileResult = IrCodeCompiler.compile(makeRawCode('1e3 2e3'));
      expect(exponent.ok).assertTrue();
      expect(exponent.frames.length).assertEqual(1);
      expect(exponent.frames[0].pattern.length).assertEqual(2);
      expect(exponent.frames[0].pattern[0]).assertEqual(1000);
      expect(exponent.frames[0].pattern[1]).assertEqual(2000);
      expect(exponent.frames[0].durationUs).assertEqual(3000);
      const trailingJunk: IrCompileResult = IrCodeCompiler.compile(makeRawCode('100us 200'));
      expect(trailingJunk.ok).assertFalse();
      expect(trailingJunk.error).assertEqual(IrCompileError.INVALID_VALUE);
      expect(trailingJunk.frames.length).assertEqual(0);
      // Number() accepts 0x prefixed hex text and parses it into decimal values.
      const hexText: IrCompileResult = IrCodeCompiler.compile(makeRawCode('0x1F4 0x2BC'));
      expect(hexText.ok).assertTrue();
      expect(hexText.frames.length).assertEqual(1);
      expect(hexText.frames[0].pattern[0]).assertEqual(500);
      expect(hexText.frames[0].pattern[1]).assertEqual(700);
      expect(hexText.frames[0].durationUs).assertEqual(1200);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

  });
}
