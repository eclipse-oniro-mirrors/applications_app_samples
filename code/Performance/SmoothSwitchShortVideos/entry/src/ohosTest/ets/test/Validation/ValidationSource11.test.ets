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

export default function registerValidationSource11(): void {
  describe('ValidationSource11', (): void => {
    it('ValidationSource11_001', 0, (): void => {
      const input = makeSources(6, "CaseSensitive", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(6);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_002', 0, (): void => {
      const input = makeSources(64, "clip:片段", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(64);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_003', 0, (): void => {
      const input = makeSources(32, "file:///video/", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(32);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_004', 0, (): void => {
      const input = makeSources(1, "https://example.test/v?q=a&token=", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(1);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_005', 0, (): void => {
      const input = makeSources(128, "clip\u0000suffix", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(128);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_006', 0, (): void => {
      const input = makeSources(3, "clip+plus", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(3);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_007', 0, (): void => {
      const input = makeSources(8, "https://example.test/v?part=", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(8);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_008', 0, (): void => {
      const input = makeSources(128, " ", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(128);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_009', 0, (): void => {
      const input = makeSources(65, "clip+plus", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(65);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_010', 0, (): void => {
      const input = makeSources(64, "a\r\nb", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(64);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_011', 0, (): void => {
      const input = makeSources(3, "https://example.test/v?q=a&token=", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(3);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_012', 0, (): void => {
      const input = makeSources(256, "file:///video/", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(256);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_013', 0, (): void => {
      const input = makeSources(127, "a\r\nb", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(127);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_014', 0, (): void => {
      const input = makeSources(3, "a\"quote", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(3);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_015', 0, (): void => {
      const input = makeSources(4, "", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(4);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_016', 0, (): void => {
      const input = makeSources(15, "\n", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(15);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_017', 0, (): void => {
      const input = makeSources(64, "CaseSensitive", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(64);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_018', 0, (): void => {
      const input = makeSources(256, "a%20b", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(256);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_019', 0, (): void => {
      const input = makeSources(3, "a\r\nb", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(3);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_020', 0, (): void => {
      const input = makeSources(31, "é", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(31);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_021', 0, (): void => {
      const input = makeSources(31, "long-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(31);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_022', 0, (): void => {
      const input = makeSources(128, " ", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(128);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_023', 0, (): void => {
      const input = makeSources(256, "trailing-space ", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(256);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_024', 0, (): void => {
      const input = makeSources(16, "000", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(16);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_025', 0, (): void => {
      const input = makeSources(65, "a/b#fragment", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(65);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_026', 0, (): void => {
      const input = makeSources(256, "https://example.test/v?part=", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(256);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_027', 0, (): void => {
      const input = makeSources(17, " ", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(17);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_028', 0, (): void => {
      const input = makeSources(255, "a;b", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(255);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_029', 0, (): void => {
      const input = makeSources(17, "item=", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(17);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_030', 0, (): void => {
      const input = makeSources(4, "clip:片段", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(4);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_031', 0, (): void => {
      const input = makeSources(32, "\n", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(32);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_032', 0, (): void => {
      const input = makeSources(255, "clip:片段", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(255);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_033', 0, (): void => {
      const input = makeSources(8, "https://example.test/v?part=", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(8);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_034', 0, (): void => {
      const input = makeSources(2, "\t", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(2);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_035', 0, (): void => {
      const input = makeSources(5, "🎬", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(5);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_036', 0, (): void => {
      const input = makeSources(32, "", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(32);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_037', 0, (): void => {
      const input = makeSources(129, "http://example.test/video", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(129);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_038', 0, (): void => {
      const input = makeSources(65, "long-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(65);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_039', 0, (): void => {
      const input = makeSources(32, "CaseSensitive", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(32);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_040', 0, (): void => {
      const input = makeSources(4, "é", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(4);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_041', 0, (): void => {
      const input = makeSources(31, "é", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(31);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('ValidationSource11_042', 0, (): void => {
      const input = makeSources(2, "https://example.test/v?part=", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(2);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

  });
}
