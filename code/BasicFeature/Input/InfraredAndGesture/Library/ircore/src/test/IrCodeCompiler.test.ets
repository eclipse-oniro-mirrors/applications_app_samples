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

import { describe, expect, it } from '@ohos/hypium';
import { IrCode, IrCompileError, IrCompileResult, IrProtocol } from '../main/ets/model/IrTypes';
import { IrCodeCompiler } from '../main/ets/service/IrCodeCompiler';

function makeCode(protocol: IrProtocol, payload: string): IrCode {
  const code: IrCode = new IrCode();
  code.protocol = protocol;
  code.payload = payload;
  return code;
}

export default function irCodeCompilerTest() {
  describe('IrCodeCompiler', () => {
    it('raw_valid_pattern', 0, () => {
      const result: IrCompileResult = IrCodeCompiler.compile(
        makeCode(IrProtocol.RAW, '9000, 4500,560,560'));
      expect(result.ok).assertTrue();
      expect(result.frames.length).assertEqual(1);
      expect(result.frames[0].pattern.length).assertEqual(4);
      expect(result.frames[0].durationUs).assertEqual(14620);
    });

    it('raw_zero_is_invalid', 0, () => {
      const result: IrCompileResult = IrCodeCompiler.compile(
        makeCode(IrProtocol.RAW, '9000,0,560,560'));
      expect(result.ok).assertFalse();
      expect(result.error).assertEqual(IrCompileError.INVALID_VALUE);
    });

    it('raw_comma_and_space_separated', 0, () => {
      const result: IrCompileResult = IrCodeCompiler.compile(
        makeCode(IrProtocol.RAW, '9000 4500 560 560'));
      expect(result.ok).assertTrue();
      expect(result.frames[0].pattern.length).assertEqual(4);
    });

    it('nec_frame_within_limit', 0, () => {
      const result: IrCompileResult = IrCodeCompiler.compile(
        makeCode(IrProtocol.NEC, '0x04FB,0x08F7'));
      expect(result.ok).assertTrue();
      expect(result.frames.length).assertEqual(1);
      expect(result.frames[0].pattern.length).assertEqual(67);
      expect(result.frames[0].pattern.length <= 1024).assertTrue();
      expect(result.frames[0].pattern[0]).assertEqual(9000);
      expect(result.frames[0].pattern[1]).assertEqual(4500);
      expect(result.frames[0].pattern[66]).assertEqual(560);
    });

    it('nec_accepts_byte_inverse_word', 0, () => {
      const result: IrCompileResult = IrCodeCompiler.compile(
        makeCode(IrProtocol.NEC, '1275,2295'));
      expect(result.ok).assertTrue();
      expect(result.frames[0].pattern.length).assertEqual(67);
      expect(result.frames[0].pattern[0]).assertEqual(9000);
    });

    it('nec_repeat_count_duplicates_frames', 0, () => {
      const code: IrCode = makeCode(IrProtocol.NEC, '0x04FB,0x08F7');
      code.repeatCount = 2;
      const result: IrCompileResult = IrCodeCompiler.compile(code);
      expect(result.ok).assertTrue();
      expect(result.frames.length).assertEqual(2);
      expect(result.frames[0].pattern.length).assertEqual(67);
      expect(result.frames[1].pattern.length).assertEqual(67);
      expect(result.frames[1].index).assertEqual(1);
    });

    it('raw_long_payload_splits_frames', 0, () => {
      const values: string[] = [];
      for (let i = 0; i < 1200; i++) {
        values.push('100');
      }
      const result: IrCompileResult = IrCodeCompiler.compile(
        makeCode(IrProtocol.RAW, values.join(',')));
      expect(result.ok).assertTrue();
      expect(result.frames.length).assertEqual(2);
      expect(result.frames[0].pattern.length <= 1024).assertTrue();
      expect(result.frames[1].pattern.length <= 1024).assertTrue();
      expect(result.frames[0].pattern.length + result.frames[1].pattern.length)
        .assertEqual(1200);
      expect(result.frames[0].durationUs).assertEqual(102400);
    });

    it('empty_payload_rejected', 0, () => {
      const result: IrCompileResult = IrCodeCompiler.compile(
        makeCode(IrProtocol.RAW, '   '));
      expect(result.ok).assertFalse();
      expect(result.error).assertEqual(IrCompileError.EMPTY_PAYLOAD);
    });
  });
}
