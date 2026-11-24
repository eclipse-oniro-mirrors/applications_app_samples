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

export default function registerPowerDialogSeek09(): void {
  describe('PowerDialogSeek09', (): void => {
    it('PowerDialogSeek09_001', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1.25, 3600000, 5);
      const expected = 900000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_002', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(318.75, 3599999, 255);
      const expected = 3599999;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_003', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(10, 9999, 10);
      const expected = 9999;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_004', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(406.25, 1001, 500);
      const expected = 813.3125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_005', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 6000, 86400);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_006', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(15.25, 60001, 61);
      const expected = 15000.25;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_007', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(3.8125, 10000, 61);
      const expected = 625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_008', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 120000, 1);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_009', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.625, 120000, 10);
      const expected = 7500;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_010', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(21600, 3600000, 86400);
      const expected = 900000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_011', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.375, 10000, 2);
      const expected = 1875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_012', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.9375, 1001, 1);
      const expected = 938.4375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_013', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(66.375, 1377, 59);
      const expected = 1377;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_014', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(318.75, 30001, 255);
      const expected = 30001;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_015', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.625, 1377, 10);
      const expected = 86.0625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_016', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(72.4375, 12999, 61);
      const expected = 12999;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_017', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-23.8125, 3600000, 127);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_018', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(158.75, 3600000, 127);
      const expected = 3600000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_019', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(47.9375, 9999, 59);
      const expected = 8124.1875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_020', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(34.3125, 1001, 61);
      const expected = 563.0625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_021', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(61, 3600000, 61);
      const expected = 3600000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_022', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(68.625, 9999, 61);
      const expected = 9999;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_023', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-7.625, 60001, 61);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_024', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 86400000, 3600);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_025', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(302.8125, 86400000, 255);
      const expected = 86400000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_026', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(159.375, 59999, 255);
      const expected = 37499.375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_027', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(31.75, 12999, 127);
      const expected = 3249.75;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_028', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(62.5, 3599999, 500);
      const expected = 449999.875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_029', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(10.625, 120000, 10);
      const expected = 120000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_030', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 59999, 86400);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_031', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.3125, 9999, 1);
      const expected = 3124.6875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_032', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(3600, 120000, 3600);
      const expected = 120000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_033', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(302.8125, 10000, 255);
      const expected = 10000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_034', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(39.6875, 9999, 127);
      const expected = 3124.6875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_035', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(71.25, 60001, 60);
      const expected = 60001;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_036', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-11.4375, 3600001, 61);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_037', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(2700, 59999, 3600);
      const expected = 44999.25;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_038', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(73.75, 1001, 59);
      const expected = 1001;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_039', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(68.625, 30001, 61);
      const expected = 30001;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_040', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(3375, 60001, 3600);
      const expected = 56250.9375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_041', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(63.75, 60000, 255);
      const expected = 15000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_042', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 1001, 10);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_043', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(318.75, 1377, 255);
      const expected = 1377;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_044', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.8125, 3600001, 1);
      const expected = 2925000.8125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_045', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(26.6875, 60001, 61);
      const expected = 26250.4375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_046', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(97200, 9999, 86400);
      const expected = 9999;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_047', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.625, 10000, 5);
      const expected = 1250;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_048', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.125, 60001, 2);
      const expected = 3750.0625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_049', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 120000, 3600);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_050', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(134.9375, 86400000, 127);
      const expected = 86400000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_051', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(16200, 3599999, 86400);
      const expected = 674999.8125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_052', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1.125, 1001, 1);
      const expected = 1001;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_053', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1125, 120000, 3600);
      const expected = 37500;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_054', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.3125, 86400000, 1);
      const expected = 27000000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_055', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(3.75, 10000, 5);
      const expected = 7500;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_056', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(64.8125, 60001, 61);
      const expected = 60001;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_057', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(6.875, 1001, 10);
      const expected = 688.1875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_058', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(3.75, 3600000, 60);
      const expected = 225000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_059', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-675, 3599999, 3600);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_060', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1.25, 59999, 1);
      const expected = 59999;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_061', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(45.75, 3600000, 61);
      const expected = 2700000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_062', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 3600000, 5);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_063', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-1.875, 1000, 10);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_064', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-0.9375, 86400000, 5);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_065', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 12999, 255);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_066', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(3.75, 1377, 10);
      const expected = 516.375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_067', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-11.25, 3600001, 60);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_068', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(73.75, 6000, 59);
      const expected = 6000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_069', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(59, 86400000, 59);
      const expected = 86400000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_070', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-3.8125, 60000, 61);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_071', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 1377, 5);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_072', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(625, 1001, 500);
      const expected = 1001;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_073', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.875, 3600000, 2);
      const expected = 1575000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_074', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1.375, 60000, 2);
      const expected = 41250;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_075', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-450, 60000, 3600);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_076', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(67.5, 59999, 60);
      const expected = 59999;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_077', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(500, 86400000, 500);
      const expected = 86400000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_078', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(47.625, 1377, 127);
      const expected = 516.375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_079', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-0.375, 86400000, 2);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_080', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(79.6875, 3600001, 255);
      const expected = 1125000.3125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_081', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(159.375, 3600000, 255);
      const expected = 2250000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_082', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-0.3125, 30001, 5);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_083', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(375, 86400000, 500);
      const expected = 64800000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_084', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(25.8125, 3599999, 59);
      const expected = 1574999.5625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_085', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-0.125, 60000, 2);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_086', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1.25, 59999, 10);
      const expected = 7499.875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_087', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(31.75, 9999, 127);
      const expected = 2499.75;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerDialogSeek09_088', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(48.75, 1377, 60);
      const expected = 1118.8125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

  });
}
