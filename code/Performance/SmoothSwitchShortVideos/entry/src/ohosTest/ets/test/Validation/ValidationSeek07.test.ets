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
import { PlaybackPolicy } from '../../../../main/ets/model/PlaybackPolicy';

export default function registerValidationSeek07(): void {
  describe('ValidationSeek07', (): void => {
    it('ValidationSeek07_001', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(656.25, 60000, 500);
      const expected = 60000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_002', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(15.875, 60001, 127);
      const expected = 7500.125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_003', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(97200, 3599999, 86400);
      const expected = 3599999;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_004', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(4725, 10000, 3600);
      const expected = 10000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_005', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(6.25, 86400000, 5);
      const expected = 86400000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_006', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 9999, 1);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_007', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(103.1875, 9999, 127);
      const expected = 8124.1875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_008', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.125, 1377, 2);
      const expected = 86.0625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_009', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1.75, 61000, 2);
      const expected = 53375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_010', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(11.875, 1377, 10);
      const expected = 1377;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_011', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(111.125, 30001, 127);
      const expected = 26250.875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_012', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.8125, 6000, 1);
      const expected = 4875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_013', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(30.5, 86400000, 61);
      const expected = 43200000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_014', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-62.5, 59999, 500);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_015', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(375, 1000, 500);
      const expected = 750;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_016', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(223.125, 86400000, 255);
      const expected = 75600000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_017', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(2.5, 1001, 5);
      const expected = 500.5;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_018', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1.75, 59999, 2);
      const expected = 52499.125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_019', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(150.8125, 30001, 127);
      const expected = 30001;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_020', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(113400, 6000, 86400);
      const expected = 6000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_021', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1575, 1001, 3600);
      const expected = 437.9375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_022', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(52.5, 59999, 60);
      const expected = 52499.125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_023', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.25, 59999, 1);
      const expected = 14999.75;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_024', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(7.375, 59999, 59);
      const expected = 7499.875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_025', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 61000, 500);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_026', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(57.1875, 61000, 61);
      const expected = 57187.5;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_027', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 3600000, 500);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_028', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1.875, 6000, 10);
      const expected = 1125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_029', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(29.5, 1377, 59);
      const expected = 688.5;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_030', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(14.75, 10000, 59);
      const expected = 2500;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_031', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(4.375, 1000, 10);
      const expected = 437.5;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_032', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(77.4375, 6000, 59);
      const expected = 6000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_033', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(102600, 6000, 86400);
      const expected = 6000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_034', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(900, 3599999, 3600);
      const expected = 899999.75;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_035', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(2, 6000, 2);
      const expected = 6000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_036', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(3.75, 6000, 5);
      const expected = 4500;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_037', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 120000, 5);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_038', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(76.25, 1377, 61);
      const expected = 1377;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_039', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(531.25, 30001, 500);
      const expected = 30001;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_040', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(86400, 60001, 86400);
      const expected = 60001;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_041', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(14.75, 3600001, 59);
      const expected = 900000.25;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_042', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(5.3125, 59999, 5);
      const expected = 59999;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_043', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 60000, 1);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_044', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(142.875, 1001, 127);
      const expected = 1001;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_045', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-0.125, 59999, 1);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_046', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-0.125, 3600001, 2);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_047', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1.375, 3599999, 2);
      const expected = 2474999.3125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_048', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(76.25, 30001, 61);
      const expected = 30001;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_049', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(113400, 60001, 86400);
      const expected = 60001;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_050', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(11.25, 120000, 60);
      const expected = 22500;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_051', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(2250, 30001, 3600);
      const expected = 18750.625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_052', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.9375, 10000, 5);
      const expected = 1875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_053', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-0.3125, 1000, 5);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_054', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.625, 1001, 1);
      const expected = 625.625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_055', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(281.25, 61000, 500);
      const expected = 34312.5;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_056', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-3.6875, 1377, 59);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_057', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(2, 3600001, 2);
      const expected = 3600001;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_058', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1.1875, 1000, 1);
      const expected = 1000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_059', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-0.625, 9999, 10);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_060', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(34.3125, 3600001, 61);
      const expected = 2025000.5625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_061', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(223.125, 1000, 255);
      const expected = 875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_062', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(27000, 59999, 86400);
      const expected = 18749.6875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_063', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(26.25, 1001, 60);
      const expected = 437.9375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_064', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(500, 3600001, 500);
      const expected = 3600001;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_065', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(3.75, 86400000, 60);
      const expected = 5400000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_066', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.9375, 86400000, 5);
      const expected = 16200000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_067', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.9375, 120000, 1);
      const expected = 112500;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_068', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(10800, 12999, 86400);
      const expected = 1624.875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_069', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1.25, 120000, 5);
      const expected = 30000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_070', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 10000, 86400);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_071', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(3.6875, 12999, 59);
      const expected = 812.4375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_072', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1125, 61000, 3600);
      const expected = 19062.5;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_073', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1.5, 30001, 2);
      const expected = 22500.75;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_074', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.5625, 6000, 1);
      const expected = 3375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_075', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(51.625, 61000, 59);
      const expected = 53375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_076', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(21600, 86400000, 86400);
      const expected = 21600000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_077', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(13.125, 30001, 10);
      const expected = 30001;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_078', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(67.5, 3600000, 60);
      const expected = 3600000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_079', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(3.4375, 3600001, 5);
      const expected = 2475000.6875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_080', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(119.0625, 30001, 127);
      const expected = 28125.9375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_081', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-0.0625, 120000, 1);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_082', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-7.5, 3600000, 60);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_083', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(47.8125, 12999, 255);
      const expected = 2437.3125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_084', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(468.75, 59999, 500);
      const expected = 56249.0625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_085', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(30.5, 60001, 61);
      const expected = 30000.5;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_086', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(150.8125, 1377, 127);
      const expected = 1377;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_087', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(4.0625, 60001, 5);
      const expected = 48750.8125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_088', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1.3125, 12999, 1);
      const expected = 12999;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_089', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(4275, 86400000, 3600);
      const expected = 86400000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_090', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(4.6875, 1377, 5);
      const expected = 1290.9375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_091', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(5, 9999, 10);
      const expected = 4999.5;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_092', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(2.5, 60000, 2);
      const expected = 60000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_093', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(75600, 120000, 86400);
      const expected = 105000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_094', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(5.625, 3600001, 5);
      const expected = 3600001;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek07_095', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(53.375, 120000, 61);
      const expected = 105000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

  });
}
