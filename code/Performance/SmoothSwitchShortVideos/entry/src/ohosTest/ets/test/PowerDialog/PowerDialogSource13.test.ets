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

export default function registerPowerDialogSource13(): void {
  describe('PowerDialogSource13', (): void => {
    it('PowerDialogSource13_001', 0, (): void => {
      const input = makeSources(32, "trailing-space ", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(32);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_002', 0, (): void => {
      const input = makeSources(6, "clip:片段", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(6);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_003', 0, (): void => {
      const input = makeSources(255, "https://example.test/v?q=a&token=", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(255);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_004', 0, (): void => {
      const input = makeSources(3, "item=", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(3);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_005', 0, (): void => {
      const input = makeSources(63, "000", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(63);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_006', 0, (): void => {
      const input = makeSources(16, "é", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(16);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_007', 0, (): void => {
      const input = makeSources(256, "\n", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(256);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_008', 0, (): void => {
      const input = makeSources(5, "clip:片段", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(5);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_009', 0, (): void => {
      const input = makeSources(3, "a;b", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(3);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_010', 0, (): void => {
      const input = makeSources(7, "🎬", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(7);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_011', 0, (): void => {
      const input = makeSources(128, "clip:片段", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(128);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_012', 0, (): void => {
      const input = makeSources(3, "https://example.test/v?part=", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(3);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_013', 0, (): void => {
      const input = makeSources(65, "", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(65);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_014', 0, (): void => {
      const input = makeSources(16, "clip+plus", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(16);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_015', 0, (): void => {
      const input = makeSources(32, "\n", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(32);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_016', 0, (): void => {
      const input = makeSources(127, "é", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(127);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_017', 0, (): void => {
      const input = makeSources(4, "item=", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(4);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_018', 0, (): void => {
      const input = makeSources(129, "a;b", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(129);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_019', 0, (): void => {
      const input = makeSources(63, "a\r\nb", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(63);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_020', 0, (): void => {
      const input = makeSources(1, "é", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(1);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_021', 0, (): void => {
      const input = makeSources(129, " ", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(129);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_022', 0, (): void => {
      const input = makeSources(65, "clip\u0000suffix", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(65);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_023', 0, (): void => {
      const input = makeSources(33, "a/b#fragment", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(33);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_024', 0, (): void => {
      const input = makeSources(64, "000", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(64);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_025', 0, (): void => {
      const input = makeSources(12, "a\r\nb", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(12);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_026', 0, (): void => {
      const input = makeSources(63, "a;b", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(63);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_027', 0, (): void => {
      const input = makeSources(63, "é", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(63);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_028', 0, (): void => {
      const input = makeSources(16, " ", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(16);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_029', 0, (): void => {
      const input = makeSources(33, "item=", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(33);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_030', 0, (): void => {
      const input = makeSources(31, "clip:片段", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(31);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_031', 0, (): void => {
      const input = makeSources(5, "CaseSensitive", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(5);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_032', 0, (): void => {
      const input = makeSources(7, "clip\u0000suffix", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(7);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_033', 0, (): void => {
      const input = makeSources(127, "\t", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(127);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_034', 0, (): void => {
      const input = makeSources(31, "long-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(31);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_035', 0, (): void => {
      const input = makeSources(15, "trailing-space ", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(15);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_036', 0, (): void => {
      const input = makeSources(8, "é", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(8);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_037', 0, (): void => {
      const input = makeSources(5, "", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(5);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_038', 0, (): void => {
      const input = makeSources(255, "\n", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(255);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_039', 0, (): void => {
      const input = makeSources(12, "clip+plus", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(12);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_040', 0, (): void => {
      const input = makeSources(16, "a;b", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(16);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_041', 0, (): void => {
      const input = makeSources(3, "https://example.test/v?part=", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(3);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_042', 0, (): void => {
      const input = makeSources(4, "trailing-space ", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(4);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_043', 0, (): void => {
      const input = makeSources(31, "a/b#fragment", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(31);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_044', 0, (): void => {
      const input = makeSources(256, "https://example.test/v?q=a&token=", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(256);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_045', 0, (): void => {
      const input = makeSources(2, "file:///video/", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(2);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_046', 0, (): void => {
      const input = makeSources(4, "é", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(4);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_047', 0, (): void => {
      const input = makeSources(15, "file:///video/", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(15);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_048', 0, (): void => {
      const input = makeSources(33, "file:///video/", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(33);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_049', 0, (): void => {
      const input = makeSources(33, "000", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(33);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_050', 0, (): void => {
      const input = makeSources(31, "http://[::1]:5000/video", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(31);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_051', 0, (): void => {
      const input = makeSources(4, "a\"quote", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(4);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_052', 0, (): void => {
      const input = makeSources(8, "file:///video/", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(8);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_053', 0, (): void => {
      const input = makeSources(8, "clip:片段", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(8);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_054', 0, (): void => {
      const input = makeSources(64, "https://example.test/v?part=", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(64);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_055', 0, (): void => {
      const input = makeSources(6, "\n", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(6);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_056', 0, (): void => {
      const input = makeSources(33, "\t", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(33);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_057', 0, (): void => {
      const input = makeSources(63, "trailing-space ", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(63);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_058', 0, (): void => {
      const input = makeSources(5, "http://[::1]:5000/video", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(5);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_059', 0, (): void => {
      const input = makeSources(3, "🎬", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(3);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_060', 0, (): void => {
      const input = makeSources(5, "http://[::1]:5000/video", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(5);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_061', 0, (): void => {
      const input = makeSources(15, "clip\\name", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(15);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_062', 0, (): void => {
      const input = makeSources(256, "🎬", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(256);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_063', 0, (): void => {
      const input = makeSources(4, "000", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(4);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_064', 0, (): void => {
      const input = makeSources(255, "item=", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(255);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_065', 0, (): void => {
      const input = makeSources(4, "clip\u0000suffix", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(4);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_066', 0, (): void => {
      const input = makeSources(7, "clip\\name", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(7);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_067', 0, (): void => {
      const input = makeSources(256, "clip\u0000suffix", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(256);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_068', 0, (): void => {
      const input = makeSources(127, "https://example.test/v?q=a&token=", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(127);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_069', 0, (): void => {
      const input = makeSources(129, "\t", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(129);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_070', 0, (): void => {
      const input = makeSources(255, "é", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(255);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_071', 0, (): void => {
      const input = makeSources(129, "http://example.test/video", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(129);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_072', 0, (): void => {
      const input = makeSources(2, "clip+plus", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(2);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_073', 0, (): void => {
      const input = makeSources(12, "\t", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(12);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_074', 0, (): void => {
      const input = makeSources(256, "🎬", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(256);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_075', 0, (): void => {
      const input = makeSources(128, "https://example.test/v?q=a&token=", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(128);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_076', 0, (): void => {
      const input = makeSources(63, " ", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(63);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_077', 0, (): void => {
      const input = makeSources(65, "file:///video/", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(65);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_078', 0, (): void => {
      const input = makeSources(127, "trailing-space ", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(127);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_079', 0, (): void => {
      const input = makeSources(15, "", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(15);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_080', 0, (): void => {
      const input = makeSources(17, "https://example.test/v?q=a&token=", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(17);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_081', 0, (): void => {
      const input = makeSources(129, "\t", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(129);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_082', 0, (): void => {
      const input = makeSources(63, "item=", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(63);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_083', 0, (): void => {
      const input = makeSources(4, "long-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(4);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_084', 0, (): void => {
      const input = makeSources(31, "\t", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(31);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_085', 0, (): void => {
      const input = makeSources(5, "000", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(5);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PowerDialogSource13_086', 0, (): void => {
      const input = makeSources(7, "long-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(7);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

  });
}
