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

import { hiTraceMeter } from '@kit.PerformanceAnalysisKit';
import { AppConstants, AppLogger } from 'common';
import {
  IrCode,
  IrCompileError,
  IrCompileResult,
  IrFrame,
  IrProtocol
} from '../model/IrTypes';

const SCOPE: string = 'IrCodeCompiler';
// hiTraceMeter span names, one per protocol compile entry, for trace filtering.
const NEC_TRACE_NAME: string = 'MeetingScene.IrCompileNec';
const SONY_TRACE_NAME: string = 'MeetingScene.IrCompileSony';
const RC5_TRACE_NAME: string = 'MeetingScene.IrCompileRc5';
const RAW_TRACE_NAME: string = 'MeetingScene.IrCompileRaw';
// Independent hiTraceMeter task ids so each protocol span is separately attributable.
const NEC_TRACE_TASK_ID: number = 4201;
const SONY_TRACE_TASK_ID: number = 4202;
const RC5_TRACE_TASK_ID: number = 4203;
const RAW_TRACE_TASK_ID: number = 4204;

// Single-bit mask used by LSB-first and MSB-first bit tests across protocols.
const BIT_MASK_ONE: number = 1;

// NEC protocol timings in microseconds; the carrier is typically 38 kHz.
const NEC_HEADER_MARK_US: number = 9000; // AGC leading mark of every NEC frame.
const NEC_HEADER_SPACE_US: number = 4500; // Leading space right after the header mark.
const NEC_UNIT_US: number = 560; // Base bit unit: logical 0 mark width and logical 0 space.
const NEC_ONE_SPACE_US: number = 1690; // Logical 1 space, roughly three base units.
const NEC_BYTE_BITS: number = 8; // One NEC byte carries 8 bits, sent LSB first.
const NEC_BYTE_MASK: number = 0xFF; // Keeps the low byte when masking inverse values.
const NEC_WORD_MAX: number = 0xFFFF; // Upper bound of the accepted 16-bit byte+inverse value.

// Sony SIRC protocol timings in microseconds; the carrier is typically 40 kHz.
const SONY_HEADER_MARK_US: number = 2400; // Leading mark of every SIRC frame.
const SONY_HEADER_SPACE_US: number = 600; // Space right after the SIRC header mark.
const SONY_UNIT_US: number = 600; // Base unit: logical 0 mark and every inter-bit space.
const SONY_ONE_MARK_US: number = 1200; // Logical 1 mark, exactly two base units.
const SONY_MIN_BITS: number = 12; // Shortest SIRC frame layout.
const SONY_MID_BITS: number = 15; // Extended SIRC frame layout.
const SONY_MAX_BITS: number = 20; // Longest SIRC frame layout.

// Philips RC-5 protocol timings in microseconds; the carrier is typically 36 kHz.
const RC5_HALF_BIT_US: number = 889; // One Manchester half-bit of an RC-5 frame.
const RC5_ADDRESS_BITS: number = 5; // Width of the RC-5 address field.
const RC5_COMMAND_BITS: number = 6; // Width of the RC-5 command field.
const RC5_MAX_ADDRESS: number = 31; // Largest value of the 5-bit address field.
const RC5_MAX_COMMAND: number = 63; // Largest value of the 6-bit command field.
// RC-5 preamble bits: start bit 1, field bit 1, toggle bit fixed to 0 in this sample.
const RC5_PREAMBLE_BITS: number[] = [1, 1, 0];

// Minimum repeat count accepted for one code; zero or negative falls back to it.
const MIN_REPEAT_COUNT: number = 1;

/**
 * Compiles IR library payloads (NEC, SONY, RC5, RAW) into microsecond-level
 * waveform frames the system infrared emitter API can transmit.
 */
export class IrCodeCompiler {
  /**
   * Compiles a library entry into microsecond-level waveform frames. The frequency is not
   * carried by IrFrame; senders (KeyTester / IrSendQueue) read IrCode.frequencyHz.
   */
  static compile(code: IrCode): IrCompileResult {
    AppLogger.info(SCOPE, `compile enter: protocol=${code.protocol}, payloadLength=${code.payload.length}, repeatCount=${code.repeatCount}`);
    const payload: string = code.payload.trim();
    if (payload.length === 0) {
      return IrCodeCompiler.fail(IrCompileError.EMPTY_PAYLOAD, 'IR code payload is empty');
    }

    // Dispatch to the protocol-specific compile entry; RC6 has no implementation yet.
    let base: IrCompileResult = IrCodeCompiler.fail(
      IrCompileError.UNSUPPORTED_PROTOCOL, 'Unsupported IR protocol');
    switch (code.protocol) {
      case IrProtocol.RAW:
        base = IrCodeCompiler.compileRaw(payload);
        break;
      case IrProtocol.NEC:
        base = IrCodeCompiler.compileNec(payload);
        break;
      case IrProtocol.SONY:
        base = IrCodeCompiler.compileSony(payload);
        break;
      case IrProtocol.RC5:
        base = IrCodeCompiler.compileRc5(payload);
        break;
      case IrProtocol.RC6:
        base = IrCodeCompiler.fail(IrCompileError.UNSUPPORTED_PROTOCOL,
          'RC6 parameters are incomplete; RC6 compilation is not supported yet');
        break;
      default:
        break;
    }
    if (!base.ok) {
      return base;
    }
    // Enforce the system limit: one pattern must not exceed MAX_PATTERN_LENGTH values.
    for (let i: number = 0; i < base.frames.length; i++) {
      if (base.frames[i].pattern.length > AppConstants.MAX_PATTERN_LENGTH) {
        return IrCodeCompiler.fail(IrCompileError.TOO_LONG,
          `IR frame length exceeds ${AppConstants.MAX_PATTERN_LENGTH}`);
      }
    }

    // Non-positive repeat counts fall back to a single emission.
    const repeatCount: number = code.repeatCount > 0 ? code.repeatCount : MIN_REPEAT_COUNT;
    const result: IrCompileResult = IrCodeCompiler.repeatFrames(base.frames, repeatCount);
    AppLogger.info(SCOPE, `compile success: protocol=${code.protocol}, frames=${result.frames.length}, repeatCount=${repeatCount}`);
    return result;
  }

  /** Compiles a RAW payload of space separated microsecond values into frames. */
  private static compileRaw(payload: string): IrCompileResult {
    hiTraceMeter.startTrace(RAW_TRACE_NAME, RAW_TRACE_TASK_ID); // Open the MeetingScene.IrCompileRaw span for this compile.
    try {
      // Accept comma and semicolon separators by normalizing them to spaces.
      const tokens: string[] = payload.replace(/,/g, ' ').replace(/;/g, ' ').split(' ');
      const values: number[] = [];
      for (let i: number = 0; i < tokens.length; i++) {
        const token: string = tokens[i].trim();
        if (token.length === 0) {
          continue;
        }
        const value: number = Number(token);
        if (Number.isNaN(value) || !Number.isFinite(value) || value <= 0) {
          return IrCodeCompiler.fail(IrCompileError.INVALID_VALUE,
            `RAW IR code contains an invalid value: ${token}`);
        }
        values.push(value);
      }
      if (values.length === 0) {
        return IrCodeCompiler.fail(IrCompileError.EMPTY_PAYLOAD, 'RAW IR code has no valid values');
      }
      // Waveforms come in mark/space pairs; pad odd lengths by duplicating the last value.
      if (values.length % 2 !== 0) {
        values.push(values[values.length - 1]);
      }

      // Split long sequences into frames no longer than MAX_PATTERN_LENGTH values.
      const chunkSize: number = AppConstants.MAX_PATTERN_LENGTH;
      const frames: IrFrame[] = [];
      for (let start: number = 0; start < values.length; start += chunkSize) {
        const end: number = Math.min(start + chunkSize, values.length);
        frames.push(IrCodeCompiler.buildFrame(frames.length, values.slice(start, end)));
      }
      return IrCodeCompiler.ok(frames);
    } finally {
      hiTraceMeter.finishTrace(RAW_TRACE_NAME, RAW_TRACE_TASK_ID); // Close the span on every path, including early returns.
    }
  }

  /**
   * Compiles an NEC payload "address,command" into a 32-bit NEC frame:
   * header, 8-bit address, inverse address, 8-bit command, inverse command, stop mark.
   */
  private static compileNec(payload: string): IrCompileResult {
    hiTraceMeter.startTrace(NEC_TRACE_NAME, NEC_TRACE_TASK_ID); // Open the MeetingScene.IrCompileNec span for this compile.
    try {
      const pair: number[] | undefined = IrCodeCompiler.parsePair(payload);
      if (pair === undefined) {
        return IrCodeCompiler.fail(IrCompileError.INVALID_VALUE,
          'NEC payload must contain address and command');
      }
      const address: number | undefined = IrCodeCompiler.normalizeNecByte(pair[0]);
      const command: number | undefined = IrCodeCompiler.normalizeNecByte(pair[1]);
      if (address === undefined || command === undefined) {
        return IrCodeCompiler.fail(IrCompileError.INVALID_VALUE,
          'NEC address/command must be 8-bit values or 16-bit byte+inverse pairs');
      }

      // NEC frame layout: header mark/space, address, ~address, command, ~command, stop mark.
      const pattern: number[] = [NEC_HEADER_MARK_US, NEC_HEADER_SPACE_US];
      IrCodeCompiler.appendNecByte(pattern, address);
      IrCodeCompiler.appendNecByte(pattern, (~address) & NEC_BYTE_MASK); // NEC sends the inverted address for verification.
      IrCodeCompiler.appendNecByte(pattern, command);
      IrCodeCompiler.appendNecByte(pattern, (~command) & NEC_BYTE_MASK); // NEC sends the inverted command for verification.
      pattern.push(NEC_UNIT_US);

      return IrCodeCompiler.ok([IrCodeCompiler.buildFrame(0, pattern)]);
    } finally {
      hiTraceMeter.finishTrace(NEC_TRACE_NAME, NEC_TRACE_TASK_ID); // Close the span on every path, including early returns.
    }
  }

  /** Compiles a SONY payload "data,bits" into a 12/15/20-bit SIRC frame, LSB first. */
  private static compileSony(payload: string): IrCompileResult {
    hiTraceMeter.startTrace(SONY_TRACE_NAME, SONY_TRACE_TASK_ID); // Open the MeetingScene.IrCompileSony span for this compile.
    try {
      const pair: number[] | undefined = IrCodeCompiler.parsePair(payload);
      if (pair === undefined) {
        return IrCodeCompiler.fail(IrCompileError.INVALID_VALUE,
          'SONY payload must contain data and bits');
      }
      const data: number = pair[0];
      const bits: number = pair[1];
      if (bits !== SONY_MIN_BITS && bits !== SONY_MID_BITS && bits !== SONY_MAX_BITS) {
        return IrCodeCompiler.fail(IrCompileError.INVALID_VALUE,
          'SONY supports 12, 15 or 20 bits only');
      }
      // 2^bits is the largest value representable by the chosen frame layout.
      if (!Number.isInteger(data) || data < 0 || data >= Math.pow(2, bits)) {
        return IrCodeCompiler.fail(IrCompileError.INVALID_VALUE,
          `SONY data exceeds the ${bits}-bit range`);
      }

      // SIRC sends data LSB first as mark+space pairs after the header.
      const pattern: number[] = [SONY_HEADER_MARK_US, SONY_HEADER_SPACE_US];
      for (let bit: number = 0; bit < bits; bit++) {
        const one: boolean = ((data >> bit) & BIT_MASK_ONE) === 1;
        pattern.push(one ? SONY_ONE_MARK_US : SONY_UNIT_US);
        pattern.push(SONY_UNIT_US);
      }
      return IrCodeCompiler.ok([IrCodeCompiler.buildFrame(0, pattern)]);
    } finally {
      hiTraceMeter.finishTrace(SONY_TRACE_NAME, SONY_TRACE_TASK_ID); // Close the span on every path, including early returns.
    }
  }

  /** Compiles an RC5 payload "address,command" into a 14-bit Manchester encoded frame. */
  private static compileRc5(payload: string): IrCompileResult {
    hiTraceMeter.startTrace(RC5_TRACE_NAME, RC5_TRACE_TASK_ID); // Open the MeetingScene.IrCompileRc5 span for this compile.
    try {
      const pair: number[] | undefined = IrCodeCompiler.parsePair(payload);
      if (pair === undefined) {
        return IrCodeCompiler.fail(IrCompileError.INVALID_VALUE,
          'RC5 payload must contain address and command');
      }
      const address: number = pair[0];
      const command: number = pair[1];
      if (!Number.isInteger(address) || address < 0 || address > RC5_MAX_ADDRESS) {
        return IrCodeCompiler.fail(IrCompileError.INVALID_VALUE,
          `RC5 address must be an integer between 0 and ${RC5_MAX_ADDRESS}`);
      }
      if (!Number.isInteger(command) || command < 0 || command > RC5_MAX_COMMAND) {
        return IrCodeCompiler.fail(IrCompileError.INVALID_VALUE,
          `RC5 command must be an integer between 0 and ${RC5_MAX_COMMAND}`);
      }

      // 14 bits: start 1, field 1, toggle 0, 5-bit address, 6-bit command, MSB first.
      const bits: number[] = RC5_PREAMBLE_BITS.slice();
      for (let i: number = RC5_ADDRESS_BITS - 1; i >= 0; i--) {
        bits.push((address >> i) & BIT_MASK_ONE);
      }
      for (let i: number = RC5_COMMAND_BITS - 1; i >= 0; i--) {
        bits.push((command >> i) & BIT_MASK_ONE);
      }

      // Manchester encoding: high-then-low is 1, low-then-high is 0; merge adjacent half-bits.
      const levels: number[] = [];
      for (let i: number = 0; i < bits.length; i++) {
        if (bits[i] === 1) {
          levels.push(1);
          levels.push(0);
        } else {
          levels.push(0);
          levels.push(1);
        }
      }
      // Run-length encode the half-bit level sequence back into microsecond durations.
      const pattern: number[] = [];
      let cursor: number = 0;
      while (cursor < levels.length) {
        const level: number = levels[cursor];
        let runLength: number = 0;
        while (cursor < levels.length && levels[cursor] === level) {
          runLength++;
          cursor++;
        }
        pattern.push(runLength * RC5_HALF_BIT_US);
      }
      return IrCodeCompiler.ok([IrCodeCompiler.buildFrame(0, pattern)]);
    } finally {
      hiTraceMeter.finishTrace(RC5_TRACE_NAME, RC5_TRACE_TASK_ID); // Close the span on every path, including early returns.
    }
  }

  /** Appends one 8-bit value LSB first as mark+space pairs using NEC timings. */
  private static appendNecByte(pattern: number[], value: number): void {
    for (let bit: number = 0; bit < NEC_BYTE_BITS; bit++) {
      pattern.push(NEC_UNIT_US);
      pattern.push(((value >> bit) & BIT_MASK_ONE) === 1 ? NEC_ONE_SPACE_US : NEC_UNIT_US);
    }
  }

  /** Parses two values such as "0x1C,0x0C" or "1275,2295"; returns undefined on failure. */
  private static parsePair(payload: string): number[] | undefined {
    const tokens: string[] = payload.split(',');
    if (tokens.length !== 2) {
      return undefined;
    }
    const first: number = IrCodeCompiler.parseToken(tokens[0]);
    const second: number = IrCodeCompiler.parseToken(tokens[1]);
    if (Number.isNaN(first) || Number.isNaN(second)) {
      return undefined;
    }
    const pair: number[] = [first, second];
    return pair;
  }

  /** Parses one token as hex when prefixed with 0x, otherwise as a decimal number. */
  private static parseToken(token: string): number {
    const text: string = token.trim();
    if (text.length === 0) {
      return Number.NaN;
    }
    if (text.toLowerCase().startsWith('0x')) {
      return parseInt(text.substring(2), 16);
    }
    return Number(text);
  }

  /**
   * NEC accepts either an 8-bit value (0x08) or a 16-bit byte+inverse pair (0x08F7).
   * The latter uses the high byte as the value, e.g. 1275/0x04FB -> 0x04.
   */
  private static normalizeNecByte(value: number): number | undefined {
    if (!Number.isInteger(value) || value < 0 || value > NEC_WORD_MAX) {
      return undefined;
    }
    // A 16-bit value is interpreted as a byte+inverse pair; the high byte is the real value.
    if (value > NEC_BYTE_MASK) {
      return (value >> NEC_BYTE_BITS) & NEC_BYTE_MASK;
    }
    return value;
  }

  /** Wraps a pulse sequence into a frame and computes its total duration. */
  private static buildFrame(index: number, pattern: number[]): IrFrame {
    const frame: IrFrame = new IrFrame();
    frame.index = index;
    frame.pattern = pattern;
    let duration: number = 0;
    for (let i: number = 0; i < pattern.length; i++) {
      duration += pattern[i];
    }
    frame.durationUs = duration;
    return frame;
  }

  /** Repeats the compiled frames round by round with fresh pattern copies. */
  private static repeatFrames(base: IrFrame[], repeatCount: number): IrCompileResult {
    const frames: IrFrame[] = [];
    for (let round: number = 0; round < repeatCount; round++) {
      for (let i: number = 0; i < base.length; i++) {
        frames.push(IrCodeCompiler.buildFrame(frames.length, base[i].pattern.slice()));
      }
    }
    return IrCodeCompiler.ok(frames);
  }

  /** Builds a successful compile result. */
  private static ok(frames: IrFrame[]): IrCompileResult {
    const result: IrCompileResult = new IrCompileResult();
    result.ok = true;
    result.frames = frames;
    result.error = IrCompileError.NONE;
    result.message = '';
    return result;
  }

  /** Builds a failed compile result and logs a warning for diagnosis. */
  private static fail(error: IrCompileError, message: string): IrCompileResult {
    AppLogger.warn(SCOPE, `compile failed: error=${error}, message=${message}`);
    const result: IrCompileResult = new IrCompileResult();
    result.ok = false;
    result.frames = [];
    result.error = error;
    result.message = message;
    return result;
  }
}
