/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect } from '@ohos/hypium';
import { AVDataSource } from '../../../../main/ets/model/AVDataSource';
import { makeSources } from '../Shared/ModelFixture';

export default function registerPowerValidationSource01(): void {
  describe('PowerValidationSource01', (): void => {
    it('PowerValidationSource01_001', 0, (): void => {
      const input = makeSources(63, "🎬", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(63);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_002', 0, (): void => {
      const input = makeSources(2, "\t", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(2);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_003', 0, (): void => {
      const input = makeSources(7, "CaseSensitive", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(7);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_004', 0, (): void => {
      const input = makeSources(63, "a\"quote", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(63);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_005', 0, (): void => {
      const input = makeSources(256, "\n", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(256);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_006', 0, (): void => {
      const input = makeSources(3, "http://[::1]:5000/video", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(3);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_007', 0, (): void => {
      const input = makeSources(2, "file:///video/", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(2);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_008', 0, (): void => {
      const input = makeSources(5, " ", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(5);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_009', 0, (): void => {
      const input = makeSources(127, "", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(127);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_010', 0, (): void => {
      const input = makeSources(16, "trailing-space ", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(16);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_011', 0, (): void => {
      const input = makeSources(12, "", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(12);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_012', 0, (): void => {
      const input = makeSources(4, "https://example.test/v?q=a&token=", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(4);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_013', 0, (): void => {
      const input = makeSources(15, "\n", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(15);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_014', 0, (): void => {
      const input = makeSources(255, "clip:片段", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(255);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_015', 0, (): void => {
      const input = makeSources(32, "clip\u0000suffix", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(32);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_016', 0, (): void => {
      const input = makeSources(17, "https://example.test/v?part=", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(17);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_017', 0, (): void => {
      const input = makeSources(2, "a/b#fragment", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(2);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_018', 0, (): void => {
      const input = makeSources(15, "a\r\nb", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(15);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_019', 0, (): void => {
      const input = makeSources(12, "a\r\nb", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(12);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_020', 0, (): void => {
      const input = makeSources(256, "clip\\name", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(256);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_021', 0, (): void => {
      const input = makeSources(128, "item=", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(128);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_022', 0, (): void => {
      const input = makeSources(6, "clip\\name", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(6);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_023', 0, (): void => {
      const input = makeSources(8, "é", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(8);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_024', 0, (): void => {
      const input = makeSources(6, "🎬", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(6);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_025', 0, (): void => {
      const input = makeSources(33, "é", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(33);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_026', 0, (): void => {
      const input = makeSources(64, "http://example.test/video", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(64);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_027', 0, (): void => {
      const input = makeSources(16, "a\r\nb", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(16);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_028', 0, (): void => {
      const input = makeSources(65, "\n", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(65);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_029', 0, (): void => {
      const input = makeSources(65, "a\r\nb", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(65);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_030', 0, (): void => {
      const input = makeSources(129, "CaseSensitive", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(129);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_031', 0, (): void => {
      const input = makeSources(8, "a\"quote", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(8);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_032', 0, (): void => {
      const input = makeSources(17, " ", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(17);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_033', 0, (): void => {
      const input = makeSources(32, "item=", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(32);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_034', 0, (): void => {
      const input = makeSources(64, "a%20b", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(64);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_035', 0, (): void => {
      const input = makeSources(17, "trailing-space ", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(17);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_036', 0, (): void => {
      const input = makeSources(255, "a%20b", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(255);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_037', 0, (): void => {
      const input = makeSources(32, "long-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(32);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_038', 0, (): void => {
      const input = makeSources(6, "a;b", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(6);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_039', 0, (): void => {
      const input = makeSources(12, "\t", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(12);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_040', 0, (): void => {
      const input = makeSources(33, "https://example.test/v?part=", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(33);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_041', 0, (): void => {
      const input = makeSources(6, "\t", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(6);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_042', 0, (): void => {
      const input = makeSources(12, "000", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(12);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_043', 0, (): void => {
      const input = makeSources(4, "https://example.test/v?part=", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(4);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_044', 0, (): void => {
      const input = makeSources(255, "🎬", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(255);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_045', 0, (): void => {
      const input = makeSources(8, "\t", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(8);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_046', 0, (): void => {
      const input = makeSources(128, "000", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(128);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_047', 0, (): void => {
      const input = makeSources(15, "a\"quote", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(15);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_048', 0, (): void => {
      const input = makeSources(15, "https://example.test/v?q=a&token=", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(15);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_049', 0, (): void => {
      const input = makeSources(8, "", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(8);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_050', 0, (): void => {
      const input = makeSources(127, "http://example.test/video", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(127);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_051', 0, (): void => {
      const input = makeSources(17, "", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(17);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_052', 0, (): void => {
      const input = makeSources(2, "a\"quote", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(2);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_053', 0, (): void => {
      const input = makeSources(6, "", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(6);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_054', 0, (): void => {
      const input = makeSources(65, "a;b", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(65);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_055', 0, (): void => {
      const input = makeSources(129, " ", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(129);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_056', 0, (): void => {
      const input = makeSources(15, "a;b", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(15);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_057', 0, (): void => {
      const input = makeSources(32, "a\"quote", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(32);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_058', 0, (): void => {
      const input = makeSources(17, "a\"quote", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(17);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_059', 0, (): void => {
      const input = makeSources(16, "http://[::1]:5000/video", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(16);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_060', 0, (): void => {
      const input = makeSources(65, "clip:片段", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(65);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_061', 0, (): void => {
      const input = makeSources(6, "\t", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(6);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_062', 0, (): void => {
      const input = makeSources(129, "trailing-space ", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(129);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_063', 0, (): void => {
      const input = makeSources(2, "a%20b", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(2);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_064', 0, (): void => {
      const input = makeSources(5, "item=", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(5);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_065', 0, (): void => {
      const input = makeSources(65, "a\"quote", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(65);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_066', 0, (): void => {
      const input = makeSources(16, "clip:片段", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(16);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_067', 0, (): void => {
      const input = makeSources(31, "a\"quote", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(31);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_068', 0, (): void => {
      const input = makeSources(15, " ", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(15);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_069', 0, (): void => {
      const input = makeSources(8, "trailing-space ", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(8);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_070', 0, (): void => {
      const input = makeSources(7, "trailing-space ", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(7);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_071', 0, (): void => {
      const input = makeSources(12, "clip:片段", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(12);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_072', 0, (): void => {
      const input = makeSources(63, "https://example.test/v?part=", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(63);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_073', 0, (): void => {
      const input = makeSources(32, "https://example.test/v?q=a&token=", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(32);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_074', 0, (): void => {
      const input = makeSources(12, "clip\\name", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(12);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerValidationSource01_075', 0, (): void => {
      const input = makeSources(3, "\t", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(3);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

  });
}
