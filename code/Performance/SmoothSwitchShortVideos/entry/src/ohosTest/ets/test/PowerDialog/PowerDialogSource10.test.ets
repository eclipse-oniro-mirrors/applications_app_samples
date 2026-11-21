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

export default function registerPowerDialogSource10(): void {
  describe('PowerDialogSource10', (): void => {
    it('PowerDialogSource10_001', 0, (): void => {
      const input = makeSources(63, "clip\\name", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(63);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_002', 0, (): void => {
      const input = makeSources(5, "🎬", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(5);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_003', 0, (): void => {
      const input = makeSources(8, "clip+plus", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(8);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_004', 0, (): void => {
      const input = makeSources(32, "trailing-space ", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(32);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_005', 0, (): void => {
      const input = makeSources(63, "file:///video/", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(63);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_006', 0, (): void => {
      const input = makeSources(31, "000", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(31);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_007', 0, (): void => {
      const input = makeSources(2, "000", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(2);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_008', 0, (): void => {
      const input = makeSources(255, "a\"quote", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(255);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_009', 0, (): void => {
      const input = makeSources(128, "a\r\nb", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(128);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_010', 0, (): void => {
      const input = makeSources(17, "https://example.test/v?q=a&token=", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(17);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_011', 0, (): void => {
      const input = makeSources(2, "http://example.test/video", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(2);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_012', 0, (): void => {
      const input = makeSources(12, "https://example.test/v?part=", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(12);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_013', 0, (): void => {
      const input = makeSources(127, "a\"quote", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(127);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_014', 0, (): void => {
      const input = makeSources(31, "http://[::1]:5000/video", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(31);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_015', 0, (): void => {
      const input = makeSources(7, "é", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(7);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_016', 0, (): void => {
      const input = makeSources(1, "\n", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(1);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_017', 0, (): void => {
      const input = makeSources(255, "clip+plus", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(255);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_018', 0, (): void => {
      const input = makeSources(4, "a/b#fragment", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(4);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_019', 0, (): void => {
      const input = makeSources(15, "\t", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(15);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_020', 0, (): void => {
      const input = makeSources(33, "a\"quote", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(33);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_021', 0, (): void => {
      const input = makeSources(5, "clip\u0000suffix", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(5);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_022', 0, (): void => {
      const input = makeSources(65, "\t", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(65);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_023', 0, (): void => {
      const input = makeSources(2, "", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(2);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_024', 0, (): void => {
      const input = makeSources(6, "http://example.test/video", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(6);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_025', 0, (): void => {
      const input = makeSources(32, "clip\\name", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(32);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_026', 0, (): void => {
      const input = makeSources(65, "a\"quote", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(65);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_027', 0, (): void => {
      const input = makeSources(8, "CaseSensitive", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(8);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_028', 0, (): void => {
      const input = makeSources(31, "é", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(31);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_029', 0, (): void => {
      const input = makeSources(15, "http://example.test/video", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(15);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_030', 0, (): void => {
      const input = makeSources(8, "clip\u0000suffix", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(8);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_031', 0, (): void => {
      const input = makeSources(3, "http://example.test/video", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(3);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_032', 0, (): void => {
      const input = makeSources(128, "http://[::1]:5000/video", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(128);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_033', 0, (): void => {
      const input = makeSources(5, "a\"quote", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(5);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_034', 0, (): void => {
      const input = makeSources(256, "long-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(256);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_035', 0, (): void => {
      const input = makeSources(31, "\n", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(31);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_036', 0, (): void => {
      const input = makeSources(12, "é", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(12);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_037', 0, (): void => {
      const input = makeSources(65, "", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(65);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_038', 0, (): void => {
      const input = makeSources(127, "clip:片段", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(127);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_039', 0, (): void => {
      const input = makeSources(7, "trailing-space ", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(7);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_040', 0, (): void => {
      const input = makeSources(12, "file:///video/", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(12);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_041', 0, (): void => {
      const input = makeSources(16, "a%20b", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(16);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_042', 0, (): void => {
      const input = makeSources(5, "", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(5);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_043', 0, (): void => {
      const input = makeSources(129, "é", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(129);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_044', 0, (): void => {
      const input = makeSources(255, "https://example.test/v?q=a&token=", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(255);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_045', 0, (): void => {
      const input = makeSources(255, "http://[::1]:5000/video", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(255);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_046', 0, (): void => {
      const input = makeSources(17, "clip\\name", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(17);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_047', 0, (): void => {
      const input = makeSources(8, "a;b", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(8);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_048', 0, (): void => {
      const input = makeSources(129, "a/b#fragment", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(129);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_049', 0, (): void => {
      const input = makeSources(128, "http://example.test/video", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(128);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_050', 0, (): void => {
      const input = makeSources(128, "é", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(128);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_051', 0, (): void => {
      const input = makeSources(8, "a%20b", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(8);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_052', 0, (): void => {
      const input = makeSources(256, "a\"quote", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(256);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_053', 0, (): void => {
      const input = makeSources(3, "long-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(3);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_054', 0, (): void => {
      const input = makeSources(8, "CaseSensitive", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(8);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_055', 0, (): void => {
      const input = makeSources(17, "http://example.test/video", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(17);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_056', 0, (): void => {
      const input = makeSources(63, "\n", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(63);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_057', 0, (): void => {
      const input = makeSources(4, "é", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(4);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_058', 0, (): void => {
      const input = makeSources(64, "clip\u0000suffix", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(64);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_059', 0, (): void => {
      const input = makeSources(129, "a\"quote", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(129);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_060', 0, (): void => {
      const input = makeSources(33, "clip+plus", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(33);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_061', 0, (): void => {
      const input = makeSources(12, "trailing-space ", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(12);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_062', 0, (): void => {
      const input = makeSources(15, "file:///video/", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(15);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_063', 0, (): void => {
      const input = makeSources(15, "a;b", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(15);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_064', 0, (): void => {
      const input = makeSources(4, "🎬", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(4);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_065', 0, (): void => {
      const input = makeSources(255, "clip\\name", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(255);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_066', 0, (): void => {
      const input = makeSources(129, "clip+plus", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(129);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_067', 0, (): void => {
      const input = makeSources(1, "a\"quote", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(1);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_068', 0, (): void => {
      const input = makeSources(12, "🎬", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(12);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_069', 0, (): void => {
      const input = makeSources(256, "item=", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(256);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_070', 0, (): void => {
      const input = makeSources(5, "é", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(5);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_071', 0, (): void => {
      const input = makeSources(4, "file:///video/", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(4);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_072', 0, (): void => {
      const input = makeSources(3, "http://example.test/video", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(3);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_073', 0, (): void => {
      const input = makeSources(17, "000", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(17);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_074', 0, (): void => {
      const input = makeSources(4, "🎬", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(4);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_075', 0, (): void => {
      const input = makeSources(16, "item=", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(16);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_076', 0, (): void => {
      const input = makeSources(6, "clip+plus", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(6);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_077', 0, (): void => {
      const input = makeSources(65, "clip+plus", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(65);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource10_078', 0, (): void => {
      const input = makeSources(17, "\n", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(17);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

  });
}
