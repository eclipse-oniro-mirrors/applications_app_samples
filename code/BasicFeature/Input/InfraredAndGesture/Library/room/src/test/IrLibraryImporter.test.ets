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
import { IrCode, IrProtocol } from 'ircore';
import { IrLibraryImporter } from '../main/ets/service/IrLibraryImporter';

/** Returns true when parseProntoHex throws for the given HEX payload. */
function hasThrown(hex: string): boolean {
  try {
    IrLibraryImporter.parseProntoHex(hex);
    return false;
  } catch (error) {
    return true;
  }
}

/** Registers the unit test suite for IR code library import. */
export default function irLibraryImporterTest() {
  describe('IrLibraryImporter', () => {
    it('pronto_valid', 0, () => {
      const code: IrCode = IrLibraryImporter.parseProntoHex(
        '["0000","006D","0010","0002","0010","0010","0020","0010","0010","0020"]');
      expect(code.protocol).assertEqual(IrProtocol.RAW);
      expect(code.frequencyHz > 37000 && code.frequencyHz < 39000).assertTrue();
      expect(code.payload.length > 0).assertTrue();
      expect(code.id.length > 0).assertTrue();
    });

    it('pronto_valid_space_separated', 0, () => {
      const code: IrCode = IrLibraryImporter.parseProntoHex(
        '0000 006D 0010 0002 0010 0010 0020 0010 0010 0020');
      expect(code.protocol).assertEqual(IrProtocol.RAW);
      expect(code.frequencyHz > 0).assertTrue();
    });

    it('pronto_invalid_empty', 0, () => {
      expect(hasThrown('')).assertTrue();
      expect(hasThrown('   ')).assertTrue();
    });

    it('pronto_invalid_word', 0, () => {
      expect(hasThrown('["0000","00ZZ","0010","0002","0010","0010"]')).assertTrue();
      expect(hasThrown('["0000","006D","0010"]')).assertTrue();
      expect(hasThrown('["0000","006D","0010","0002","0010","0010","0020"]'))
        .assertTrue();
    });
  });
}
