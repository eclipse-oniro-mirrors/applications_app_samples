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

export default function registerPowerValidationSeek07(): void {
  describe('PowerValidationSeek07', (): void => {
    it('PowerValidationSeek07_001', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.875, 1377, 1);
      const expected = 1204.875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_002', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.5, 61000, 2);
      const expected = 15250;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_003', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(87.3125, 59999, 127);
      const expected = 41249.3125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_004', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(32400, 60000, 86400);
      const expected = 22500;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_005', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(2.375, 120000, 2);
      const expected = 120000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_006', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.6875, 60001, 1);
      const expected = 41250.6875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_007', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(437.5, 61000, 500);
      const expected = 53375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_008', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-7.9375, 12999, 127);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_009', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-93.75, 3600000, 500);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_010', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.3125, 12999, 1);
      const expected = 4062.1875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_011', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(51.625, 1000, 59);
      const expected = 875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_012', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-11.4375, 60001, 61);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_013', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(6.25, 120000, 5);
      const expected = 120000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_014', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-31.875, 1377, 255);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_015', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-10800, 6000, 86400);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_016', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(4725, 30001, 3600);
      const expected = 30001;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_017', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1, 3600000, 1);
      const expected = 3600000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_018', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(48600, 60000, 86400);
      const expected = 33750;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_019', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(47.9375, 60000, 59);
      const expected = 48750;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_020', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(32400, 1001, 86400);
      const expected = 375.375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_021', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(48.75, 61000, 60);
      const expected = 49562.5;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_022', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(6.25, 3600000, 5);
      const expected = 3600000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_023', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(22.875, 12999, 61);
      const expected = 4874.625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_024', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(562.5, 61000, 500);
      const expected = 61000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_025', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(593.75, 1000, 500);
      const expected = 1000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_026', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.5, 12999, 2);
      const expected = 3249.75;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_027', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(3.6875, 3600001, 59);
      const expected = 225000.0625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_028', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(39.6875, 1377, 127);
      const expected = 430.3125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_029', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(2.5, 60000, 10);
      const expected = 15000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_030', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(375, 3600000, 500);
      const expected = 2700000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_031', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(7.9375, 60001, 127);
      const expected = 3750.0625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_032', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(32400, 30001, 86400);
      const expected = 11250.375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_033', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(22.875, 60000, 61);
      const expected = 22500;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_034', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(187.5, 59999, 500);
      const expected = 22499.625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_035', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(375, 60001, 500);
      const expected = 45000.75;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_036', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(31.875, 9999, 255);
      const expected = 1249.875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_037', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(286.875, 6000, 255);
      const expected = 6000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_038', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(5, 1000, 10);
      const expected = 500;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_039', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-0.0625, 60001, 1);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_040', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1.25, 6000, 1);
      const expected = 6000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_041', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(7.9375, 3600001, 127);
      const expected = 225000.0625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_042', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(2475, 59999, 3600);
      const expected = 41249.3125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_043', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 30001, 2);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_044', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(47.8125, 3599999, 255);
      const expected = 674999.8125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_045', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1350, 9999, 3600);
      const expected = 3749.625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_046', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(8.125, 60000, 10);
      const expected = 48750;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_047', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(2475, 3599999, 3600);
      const expected = 2474999.3125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_048', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-0.25, 3600001, 2);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_049', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(8.75, 12999, 10);
      const expected = 11374.125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_050', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(95.625, 120000, 255);
      const expected = 45000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_051', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-11.4375, 12999, 61);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_052', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(7.375, 3599999, 59);
      const expected = 449999.875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_053', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(2.625, 30001, 2);
      const expected = 30001;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_054', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(2.1875, 1377, 5);
      const expected = 602.4375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_055', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-11.0625, 3599999, 59);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_056', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(675, 1001, 3600);
      const expected = 187.6875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_057', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(281.25, 12999, 500);
      const expected = 7311.9375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_058', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 59999, 61);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_059', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(7.5, 61000, 10);
      const expected = 45750;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_060', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(41.9375, 61000, 61);
      const expected = 41937.5;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_061', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1.5625, 30001, 5);
      const expected = 9375.3125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_062', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(143.4375, 30001, 255);
      const expected = 16875.5625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_063', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(207.1875, 60001, 255);
      const expected = 48750.8125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_064', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.6875, 3599999, 1);
      const expected = 2474999.3125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_065', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(33.1875, 1377, 59);
      const expected = 774.5625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_066', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-7.5, 1001, 60);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_067', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.5625, 9999, 1);
      const expected = 5624.4375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_068', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(91800, 6000, 86400);
      const expected = 6000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_069', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1.875, 30001, 2);
      const expected = 28125.9375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_070', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.375, 9999, 2);
      const expected = 1874.8125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_071', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(2925, 9999, 3600);
      const expected = 8124.1875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_072', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.625, 61000, 5);
      const expected = 7625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_073', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(13.125, 60001, 10);
      const expected = 60001;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_074', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(7.5, 9999, 10);
      const expected = 7499.25;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_075', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(57.1875, 86400000, 61);
      const expected = 81000000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_076', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(31.75, 86400000, 127);
      const expected = 21600000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_077', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.25, 12999, 1);
      const expected = 3249.75;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_078', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(156.25, 6000, 500);
      const expected = 1875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_079', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(31.875, 1000, 255);
      const expected = 125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_080', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(158.75, 61000, 127);
      const expected = 61000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_081', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-0.0625, 86400000, 1);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_082', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(8.75, 86400000, 10);
      const expected = 75600000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_083', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-7.375, 3600001, 59);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_084', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(3.75, 3600001, 60);
      const expected = 225000.0625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_085', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(70200, 120000, 86400);
      const expected = 97500;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_086', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(7.625, 60000, 61);
      const expected = 7500;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_087', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(10.625, 60001, 10);
      const expected = 60001;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_088', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(270.9375, 1377, 255);
      const expected = 1377;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_089', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(27000, 10000, 86400);
      const expected = 3125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_090', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(8.125, 1000, 10);
      const expected = 812.5;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_091', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.625, 3600001, 1);
      const expected = 2250000.625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_092', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(4275, 3600000, 3600);
      const expected = 3600000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_093', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(63.5, 1377, 127);
      const expected = 688.5;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_094', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(225, 60000, 3600);
      const expected = 3750;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_095', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(62.5, 1001, 500);
      const expected = 125.125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_096', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 86400000, 500);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_097', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(29.5, 61000, 59);
      const expected = 30500;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_098', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.25, 60000, 2);
      const expected = 7500;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_099', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(2.625, 3599999, 2);
      const expected = 3599999;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_100', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(4500, 3600000, 3600);
      const expected = 3600000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_101', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(125, 59999, 500);
      const expected = 14999.75;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_102', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.9375, 3600000, 1);
      const expected = 3375000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_103', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 9999, 3600);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_104', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(15.9375, 1377, 255);
      const expected = 86.0625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_105', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(2.8125, 1000, 5);
      const expected = 562.5;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_106', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(11.0625, 60001, 59);
      const expected = 11250.1875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_107', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 10000, 1);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_108', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(95.625, 1377, 255);
      const expected = 516.375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_109', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(103.1875, 3600000, 127);
      const expected = 2925000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_110', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(108000, 10000, 86400);
      const expected = 10000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_111', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(111.125, 1377, 127);
      const expected = 1204.875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_112', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(4725, 86400000, 3600);
      const expected = 86400000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_113', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(11.0625, 86400000, 59);
      const expected = 16200000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_114', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(13.125, 60000, 10);
      const expected = 60000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_115', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(103.1875, 120000, 127);
      const expected = 97500;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_116', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.4375, 3600000, 1);
      const expected = 1575000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_117', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-15.9375, 1001, 255);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_118', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(70200, 60000, 86400);
      const expected = 48750;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_119', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(593.75, 3600001, 500);
      const expected = 3600001;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_120', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(37800, 120000, 86400);
      const expected = 52500;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_121', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(2.5, 86400000, 2);
      const expected = 86400000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_122', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1.375, 86400000, 2);
      const expected = 59400000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_123', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(87.3125, 120000, 127);
      const expected = 82500;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('PowerValidationSeek07_124', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(47.625, 30001, 127);
      const expected = 11250.375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

  });
}
