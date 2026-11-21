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

export default function registerPerformanceStabilityProgress07(): void {
  describe('PerformanceStabilityProgress07', (): void => {
    it('PerformanceStabilityProgress07_001', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-3750, 60000, 61);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_002', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(0, 1377, 5);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_003', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1251.25, 1001, 500);
      const expected = 500;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_004', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1575000, 3600000, 2);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_005', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(41250, 60000, 2);
      const expected = 1;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_006', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-7500, 60000, 3600);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_007', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(67498.875, 59999, 60);
      const expected = 60;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_008', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(86400000, 86400000, 500);
      const expected = 500;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_009', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(516.375, 1377, 127);
      const expected = 47;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_010', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-16200000, 86400000, 2);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_011', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1125000.3125, 3600001, 255);
      const expected = 79;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_012', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(2250000, 3600000, 255);
      const expected = 159;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_013', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-1875.0625, 30001, 5);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_014', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(64800000, 86400000, 500);
      const expected = 375;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_015', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1574999.5625, 3599999, 59);
      const expected = 25;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_016', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-3750, 60000, 2);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_017', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(7499.875, 59999, 10);
      const expected = 1;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_018', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(2499.75, 9999, 127);
      const expected = 31;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_019', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1118.8125, 1377, 60);
      const expected = 48;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_020', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1204.875, 1377, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_021', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(15250, 61000, 2);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_022', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(41249.3125, 59999, 127);
      const expected = 87;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_023', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(22500, 60000, 86400);
      const expected = 32400;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_024', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(142500, 120000, 2);
      const expected = 2;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_025', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(41250.6875, 60001, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_026', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(53375, 61000, 500);
      const expected = 437;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_027', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-812.4375, 12999, 127);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_028', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-675000, 3600000, 500);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_029', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(4062.1875, 12999, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_030', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(875, 1000, 59);
      const expected = 51;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_031', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-11250.1875, 60001, 61);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_032', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(150000, 120000, 5);
      const expected = 5;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_033', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-172.125, 1377, 255);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_034', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-750, 6000, 86400);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_035', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(39376.3125, 30001, 3600);
      const expected = 3600;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_036', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(3600000, 3600000, 1);
      const expected = 1;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_037', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(33750, 60000, 86400);
      const expected = 48600;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_038', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(48750, 60000, 59);
      const expected = 47;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_039', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(375.375, 1001, 86400);
      const expected = 32400;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_040', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(49562.5, 61000, 60);
      const expected = 48;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_041', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(4500000, 3600000, 5);
      const expected = 5;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_042', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(4874.625, 12999, 61);
      const expected = 22;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_043', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(68625, 61000, 500);
      const expected = 500;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_044', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1187.5, 1000, 500);
      const expected = 500;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_045', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(3249.75, 12999, 2);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_046', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(225000.0625, 3600001, 59);
      const expected = 3;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_047', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(430.3125, 1377, 127);
      const expected = 39;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_048', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(15000, 60000, 10);
      const expected = 2;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_049', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(2700000, 3600000, 500);
      const expected = 375;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_050', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(3750.0625, 60001, 127);
      const expected = 7;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_051', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(11250.375, 30001, 86400);
      const expected = 32400;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_052', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(22500, 60000, 61);
      const expected = 22;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_053', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(22499.625, 59999, 500);
      const expected = 187;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_054', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(45000.75, 60001, 500);
      const expected = 375;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_055', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1249.875, 9999, 255);
      const expected = 31;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_056', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(6750, 6000, 255);
      const expected = 255;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_057', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(500, 1000, 10);
      const expected = 5;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_058', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-3750.0625, 60001, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_059', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(7500, 6000, 1);
      const expected = 1;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_060', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(225000.0625, 3600001, 127);
      const expected = 7;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_061', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(41249.3125, 59999, 3600);
      const expected = 2475;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_062', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(0, 30001, 2);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_063', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(674999.8125, 3599999, 255);
      const expected = 47;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_064', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(3749.625, 9999, 3600);
      const expected = 1350;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_065', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(48750, 60000, 10);
      const expected = 8;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_066', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(2474999.3125, 3599999, 3600);
      const expected = 2475;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_067', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-450000.125, 3600001, 2);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_068', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(11374.125, 12999, 10);
      const expected = 8;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_069', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(45000, 120000, 255);
      const expected = 95;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_070', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-2437.3125, 12999, 61);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_071', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(449999.875, 3599999, 59);
      const expected = 7;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_072', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(39376.3125, 30001, 2);
      const expected = 2;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_073', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(602.4375, 1377, 5);
      const expected = 2;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_074', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-674999.8125, 3599999, 59);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_075', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(187.6875, 1001, 3600);
      const expected = 675;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_076', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(7311.9375, 12999, 500);
      const expected = 281;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_077', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(0, 59999, 61);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_078', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(45750, 61000, 10);
      const expected = 7;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_079', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(41937.5, 61000, 61);
      const expected = 41;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_080', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(9375.3125, 30001, 5);
      const expected = 1;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_081', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(16875.5625, 30001, 255);
      const expected = 143;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_082', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(48750.8125, 60001, 255);
      const expected = 207;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_083', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(2474999.3125, 3599999, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_084', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(774.5625, 1377, 59);
      const expected = 33;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_085', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-125.125, 1001, 60);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_086', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(5624.4375, 9999, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_087', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(6375, 6000, 86400);
      const expected = 86400;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_088', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(28125.9375, 30001, 2);
      const expected = 1;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_089', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1874.8125, 9999, 2);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_090', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(8124.1875, 9999, 3600);
      const expected = 2925;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_091', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(7625, 61000, 5);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_092', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(78751.3125, 60001, 10);
      const expected = 10;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_093', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(7499.25, 9999, 10);
      const expected = 7;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_094', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(81000000, 86400000, 61);
      const expected = 57;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_095', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(21600000, 86400000, 127);
      const expected = 31;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_096', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(3249.75, 12999, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_097', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1875, 6000, 500);
      const expected = 156;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_098', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(125, 1000, 255);
      const expected = 31;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_099', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(76250, 61000, 127);
      const expected = 127;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_100', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-5400000, 86400000, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_101', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(75600000, 86400000, 10);
      const expected = 8;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_102', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-450000.125, 3600001, 59);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_103', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(225000.0625, 3600001, 60);
      const expected = 3;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_104', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(97500, 120000, 86400);
      const expected = 70200;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_105', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(7500, 60000, 61);
      const expected = 7;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_106', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(63751.0625, 60001, 10);
      const expected = 10;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_107', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1463.0625, 1377, 255);
      const expected = 255;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_108', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(3125, 10000, 86400);
      const expected = 27000;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_109', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(812.5, 1000, 10);
      const expected = 8;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_110', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(2250000.625, 3600001, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('PerformanceStabilityProgress07_111', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(4275000, 3600000, 3600);
      const expected = 3600;
      expect(actual).assertEqual(expected);
    });

  });
}
