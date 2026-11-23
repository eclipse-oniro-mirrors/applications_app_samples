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

export default function registerValidationSeek02(): void {
  describe('ValidationSeek02', (): void => {
    it('ValidationSeek02_001', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(119.0625, 1377, 127);
      const expected = 1290.9375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_002', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(10, 60000, 10);
      const expected = 60000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_003', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(47.625, 3600000, 127);
      const expected = 1350000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_004', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.625, 59999, 10);
      const expected = 3749.9375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_005', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 61000, 255);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_006', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1.75, 1001, 2);
      const expected = 875.875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_007', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-93.75, 59999, 500);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_008', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.375, 60000, 1);
      const expected = 22500;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_009', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.75, 1000, 1);
      const expected = 750;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_010', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(6.25, 61000, 10);
      const expected = 38125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_011', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(6.25, 10000, 10);
      const expected = 6250;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_012', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(78.75, 3599999, 60);
      const expected = 3599999;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_013', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(175.3125, 9999, 255);
      const expected = 6874.3125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_014', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(375, 1001, 500);
      const expected = 750.75;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_015', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(250, 60001, 500);
      const expected = 30000.5;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_016', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(52.5, 1377, 60);
      const expected = 1204.875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_017', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 1377, 500);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_018', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(108000, 1377, 86400);
      const expected = 1377;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_019', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(5.625, 1377, 5);
      const expected = 1377;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_020', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(41.9375, 59999, 61);
      const expected = 41249.3125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_021', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(3.75, 61000, 10);
      const expected = 22875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_022', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(55.5625, 3600001, 127);
      const expected = 1575000.4375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_023', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-1.875, 60000, 10);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_024', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1.25, 61000, 2);
      const expected = 38125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_025', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(33.1875, 61000, 59);
      const expected = 34312.5;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_026', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-0.1875, 1377, 1);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_027', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(55.5625, 3599999, 127);
      const expected = 1574999.5625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_028', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(44.25, 60001, 59);
      const expected = 45000.75;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_029', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(75600, 1000, 86400);
      const expected = 875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_030', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(37.5, 1001, 60);
      const expected = 625.625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_031', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(44.25, 9999, 59);
      const expected = 7499.25;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_032', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(8.125, 9999, 10);
      const expected = 8124.1875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_033', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(255, 120000, 255);
      const expected = 120000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_034', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-0.9375, 10000, 5);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_035', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(159.375, 120000, 255);
      const expected = 75000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_036', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-11.0625, 86400000, 59);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_037', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-62.5, 60001, 500);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_038', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.3125, 61000, 5);
      const expected = 3812.5;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_039', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(3150, 12999, 3600);
      const expected = 11374.125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_040', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(900, 30001, 3600);
      const expected = 7500.25;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_041', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(80.0625, 3600001, 61);
      const expected = 3600001;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_042', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(142.875, 120000, 127);
      const expected = 120000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_043', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1.1875, 12999, 1);
      const expected = 12999;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_044', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1350, 6000, 3600);
      const expected = 2250;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_045', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-10800, 3600000, 86400);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_046', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(218.75, 30001, 500);
      const expected = 13125.4375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_047', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(87.3125, 3600000, 127);
      const expected = 2475000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_048', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.0625, 10000, 1);
      const expected = 625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_049', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(5.9375, 9999, 5);
      const expected = 9999;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_050', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(375, 60000, 500);
      const expected = 45000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_051', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(5, 12999, 5);
      const expected = 12999;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_052', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(5400, 3600000, 86400);
      const expected = 225000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_053', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(225, 60001, 3600);
      const expected = 3750.0625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_054', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(11.875, 61000, 10);
      const expected = 61000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_055', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 6000, 500);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_056', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.1875, 60000, 1);
      const expected = 11250;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_057', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(11.25, 3600001, 60);
      const expected = 675000.1875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_058', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-10800, 120000, 86400);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_059', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.25, 1001, 1);
      const expected = 250.25;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_060', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1, 3599999, 1);
      const expected = 3599999;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_061', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(250, 59999, 500);
      const expected = 29999.5;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_062', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(44.25, 60000, 59);
      const expected = 45000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_063', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(5.625, 1001, 10);
      const expected = 563.0625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_064', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(63.75, 1000, 60);
      const expected = 1000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_065', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 10000, 60);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_066', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(406.25, 60000, 500);
      const expected = 48750;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_067', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1.875, 9999, 10);
      const expected = 1874.8125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_068', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(31.25, 86400000, 500);
      const expected = 5400000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_069', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1.75, 86400000, 2);
      const expected = 75600000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_070', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-0.0625, 3599999, 1);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_071', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(71.4375, 61000, 127);
      const expected = 34312.5;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_072', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(39.6875, 120000, 127);
      const expected = 37500;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_073', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-0.625, 86400000, 10);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_074', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(3600, 1000, 3600);
      const expected = 1000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_075', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(31.25, 3599999, 500);
      const expected = 224999.9375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_076', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-7.5, 59999, 60);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_077', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(49.5625, 6000, 61);
      const expected = 4875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_078', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(87.3125, 1001, 127);
      const expected = 688.1875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_079', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(2.25, 3600001, 2);
      const expected = 3600001;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_080', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(11.25, 60000, 60);
      const expected = 11250;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_081', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(2250, 60000, 3600);
      const expected = 37500;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_082', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(3.75, 30001, 60);
      const expected = 1875.0625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_083', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(334.6875, 3599999, 255);
      const expected = 3599999;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_084', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 86400000, 10);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_085', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 61000, 10);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_086', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(40.5625, 60000, 59);
      const expected = 41250;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_087', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(3375, 3599999, 3600);
      const expected = 3374999.0625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_088', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(255, 3600000, 255);
      const expected = 3600000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_089', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-0.1875, 12999, 1);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_090', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-7.625, 12999, 61);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_091', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(3.125, 3600001, 10);
      const expected = 1125000.3125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_092', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(70200, 6000, 86400);
      const expected = 4875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_093', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-31.875, 60000, 255);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_094', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(3.4375, 3600000, 5);
      const expected = 2475000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_095', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-675, 10000, 3600);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_096', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(593.75, 3600000, 500);
      const expected = 3600000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_097', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(468.75, 1000, 500);
      const expected = 937.5;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('ValidationSeek02_098', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(2700, 3600001, 3600);
      const expected = 2700000.75;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

  });
}
