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

export default function registerPerformanceStabilitySource05(): void {
  describe('PerformanceStabilitySource05', (): void => {
    it('PerformanceStabilitySource05_001', 0, (): void => {
      const input = makeSources(129, "CaseSensitive", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(129);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_002', 0, (): void => {
      const input = makeSources(16, "\n", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(16);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_003', 0, (): void => {
      const input = makeSources(5, "clip+plus", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(5);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_004', 0, (): void => {
      const input = makeSources(2, "clip\u0000suffix", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(2);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_005', 0, (): void => {
      const input = makeSources(6, "long-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(6);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_006', 0, (): void => {
      const input = makeSources(63, "https://example.test/v?q=a&token=", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(63);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_007', 0, (): void => {
      const input = makeSources(256, "clip+plus", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(256);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_008', 0, (): void => {
      const input = makeSources(6, "000", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(6);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_009', 0, (): void => {
      const input = makeSources(33, "long-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(33);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_010', 0, (): void => {
      const input = makeSources(31, "", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(31);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_011', 0, (): void => {
      const input = makeSources(127, "https://example.test/v?part=", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(127);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_012', 0, (): void => {
      const input = makeSources(31, "a/b#fragment", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(31);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_013', 0, (): void => {
      const input = makeSources(128, "clip\u0000suffix", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(128);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_014', 0, (): void => {
      const input = makeSources(16, "a\"quote", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(16);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_015', 0, (): void => {
      const input = makeSources(3, "clip\\name", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(3);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_016', 0, (): void => {
      const input = makeSources(8, " ", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(8);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_017', 0, (): void => {
      const input = makeSources(12, "clip\u0000suffix", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(12);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_018', 0, (): void => {
      const input = makeSources(129, "a%20b", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(129);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_019', 0, (): void => {
      const input = makeSources(16, "\t", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(16);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_020', 0, (): void => {
      const input = makeSources(12, " ", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(12);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_021', 0, (): void => {
      const input = makeSources(3, "\n", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(3);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_022', 0, (): void => {
      const input = makeSources(127, "http://[::1]:5000/video", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(127);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_023', 0, (): void => {
      const input = makeSources(6, "a/b#fragment", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(6);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_024', 0, (): void => {
      const input = makeSources(63, "long-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(63);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_025', 0, (): void => {
      const input = makeSources(5, "file:///video/", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(5);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_026', 0, (): void => {
      const input = makeSources(64, "a/b#fragment", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(64);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_027', 0, (): void => {
      const input = makeSources(129, "🎬", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(129);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_028', 0, (): void => {
      const input = makeSources(16, "trailing-space ", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(16);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_029', 0, (): void => {
      const input = makeSources(16, "clip:片段", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(16);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_030', 0, (): void => {
      const input = makeSources(17, "https://example.test/v?part=", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(17);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_031', 0, (): void => {
      const input = makeSources(65, "CaseSensitive", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(65);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_032', 0, (): void => {
      const input = makeSources(255, "CaseSensitive", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(255);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_033', 0, (): void => {
      const input = makeSources(2, "é", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(2);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_034', 0, (): void => {
      const input = makeSources(12, "000", true);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(12);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_035', 0, (): void => {
      const input = makeSources(256, "é", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(256);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_036', 0, (): void => {
      const input = makeSources(5, "clip\\name", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(5);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_037', 0, (): void => {
      const input = makeSources(127, "long-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(127);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_038', 0, (): void => {
      const input = makeSources(33, "https://example.test/v?part=", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(33);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_039', 0, (): void => {
      const input = makeSources(2, " ", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(2);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_040', 0, (): void => {
      const input = makeSources(5, "a;b", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(5);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_041', 0, (): void => {
      const input = makeSources(127, " ", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(127);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_042', 0, (): void => {
      const input = makeSources(31, "http://example.test/video", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(31);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_043', 0, (): void => {
      const input = makeSources(12, "http://example.test/video", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(12);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_044', 0, (): void => {
      const input = makeSources(32, "\t", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(32);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_045', 0, (): void => {
      const input = makeSources(127, "clip+plus", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(127);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_046', 0, (): void => {
      const input = makeSources(31, "", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(31);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_047', 0, (): void => {
      const input = makeSources(129, "000", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(129);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

    it('PerformanceStabilitySource05_048', 0, (): void => {
      const input = makeSources(4, "http://example.test/video", false);
      const original = input.slice();
      const source = new AVDataSource(input);
      input.splice(0, input.length);
      expect(source.totalCount()).assertEqual(4);
      for (let index = 0; index < original.length; index++) {
        expect(source.getData(index)).assertEqual(original[index]);
      }
    });

  });
}
