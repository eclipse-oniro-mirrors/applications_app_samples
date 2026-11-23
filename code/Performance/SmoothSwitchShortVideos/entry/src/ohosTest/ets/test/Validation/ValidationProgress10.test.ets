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

export default function registerValidationProgress10(): void {
  describe('ValidationProgress10', (): void => {
    it('ValidationProgress10_001', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(688.5, 1377, 127);
      const expected = 63;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_002', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(3750, 60000, 3600);
      const expected = 225;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_003', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(125.125, 1001, 500);
      const expected = 62;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_004', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(0, 86400000, 500);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_005', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(30500, 61000, 59);
      const expected = 29;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_006', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(7500, 60000, 2);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_007', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(4724998.6875, 3599999, 2);
      const expected = 2;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_008', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(4500000, 3600000, 3600);
      const expected = 3600;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_009', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(14999.75, 59999, 500);
      const expected = 125;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_010', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(3375000, 3600000, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_011', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(0, 9999, 3600);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_012', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(86.0625, 1377, 255);
      const expected = 15;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_013', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(562.5, 1000, 5);
      const expected = 2;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_014', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(11250.1875, 60001, 59);
      const expected = 11;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_015', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(0, 10000, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_016', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(516.375, 1377, 255);
      const expected = 95;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_017', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(2925000, 3600000, 127);
      const expected = 103;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_018', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(12500, 10000, 86400);
      const expected = 86400;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_019', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1204.875, 1377, 127);
      const expected = 111;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_020', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(113400000, 86400000, 3600);
      const expected = 3600;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_021', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(16200000, 86400000, 59);
      const expected = 11;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_022', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(78750, 60000, 10);
      const expected = 10;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_023', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(97500, 120000, 127);
      const expected = 103;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_024', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1575000, 3600000, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_025', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-62.5625, 1001, 255);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_026', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(48750, 60000, 86400);
      const expected = 70200;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_027', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(4275001.1875, 3600001, 500);
      const expected = 500;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_028', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(52500, 120000, 86400);
      const expected = 37800;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_029', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(108000000, 86400000, 2);
      const expected = 2;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_030', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(59400000, 86400000, 2);
      const expected = 1;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_031', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(82500, 120000, 127);
      const expected = 87;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_032', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(11250.375, 30001, 127);
      const expected = 47;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_033', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1290.9375, 1377, 127);
      const expected = 119;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_034', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(60000, 60000, 10);
      const expected = 10;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_035', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1350000, 3600000, 127);
      const expected = 47;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_036', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(3749.9375, 59999, 10);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_037', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(0, 61000, 255);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_038', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(875.875, 1001, 2);
      const expected = 1;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_039', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-11249.8125, 59999, 500);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_040', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(22500, 60000, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_041', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(750, 1000, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_042', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(38125, 61000, 10);
      const expected = 6;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_043', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(6250, 10000, 10);
      const expected = 6;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_044', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(4724998.6875, 3599999, 60);
      const expected = 60;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_045', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(6874.3125, 9999, 255);
      const expected = 175;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_046', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(750.75, 1001, 500);
      const expected = 375;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_047', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(30000.5, 60001, 500);
      const expected = 250;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_048', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1204.875, 1377, 60);
      const expected = 52;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_049', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(0, 1377, 500);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_050', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1721.25, 1377, 86400);
      const expected = 86400;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_051', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1549.125, 1377, 5);
      const expected = 5;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_052', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(41249.3125, 59999, 61);
      const expected = 41;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_053', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(22875, 61000, 10);
      const expected = 3;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_054', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1575000.4375, 3600001, 127);
      const expected = 55;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_055', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-11250, 60000, 10);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_056', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(38125, 61000, 2);
      const expected = 1;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_057', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(34312.5, 61000, 59);
      const expected = 33;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_058', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-258.1875, 1377, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_059', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1574999.5625, 3599999, 127);
      const expected = 55;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_060', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(45000.75, 60001, 59);
      const expected = 44;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_061', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(875, 1000, 86400);
      const expected = 75600;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_062', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(625.625, 1001, 60);
      const expected = 37;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_063', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(7499.25, 9999, 59);
      const expected = 44;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_064', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(8124.1875, 9999, 10);
      const expected = 8;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_065', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(120000, 120000, 255);
      const expected = 255;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_066', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-1875, 10000, 5);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_067', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(75000, 120000, 255);
      const expected = 159;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_068', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-16200000, 86400000, 59);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_069', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-7500.125, 60001, 500);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_070', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(3812.5, 61000, 5);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_071', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(11374.125, 12999, 3600);
      const expected = 3150;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_072', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(7500.25, 30001, 3600);
      const expected = 900;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_073', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(4725001.3125, 3600001, 61);
      const expected = 61;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_074', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(135000, 120000, 127);
      const expected = 127;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_075', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(15436.3125, 12999, 1);
      const expected = 1;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_076', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(2250, 6000, 3600);
      const expected = 1350;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_077', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-450000, 3600000, 86400);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_078', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(13125.4375, 30001, 500);
      const expected = 218;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_079', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(2475000, 3600000, 127);
      const expected = 87;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_080', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(625, 10000, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_081', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(11873.8125, 9999, 5);
      const expected = 5;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_082', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(45000, 60000, 500);
      const expected = 375;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_083', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(12999, 12999, 5);
      const expected = 5;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_084', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(225000, 3600000, 86400);
      const expected = 5400;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_085', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(3750.0625, 60001, 3600);
      const expected = 225;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_086', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(72437.5, 61000, 10);
      const expected = 10;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_087', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(0, 6000, 500);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_088', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(11250, 60000, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_089', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(675000.1875, 3600001, 60);
      const expected = 11;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_090', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-15000, 120000, 86400);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_091', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(250.25, 1001, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_092', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(3599999, 3599999, 1);
      const expected = 1;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_093', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(29999.5, 59999, 500);
      const expected = 250;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_094', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(45000, 60000, 59);
      const expected = 44;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_095', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(563.0625, 1001, 10);
      const expected = 5;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_096', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1062.5, 1000, 60);
      const expected = 60;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_097', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(0, 10000, 60);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_098', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(48750, 60000, 500);
      const expected = 406;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_099', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1874.8125, 9999, 10);
      const expected = 1;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_100', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(5400000, 86400000, 500);
      const expected = 31;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_101', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(75600000, 86400000, 2);
      const expected = 1;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_102', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-224999.9375, 3599999, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_103', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(34312.5, 61000, 127);
      const expected = 71;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_104', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(37500, 120000, 127);
      const expected = 39;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_105', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-5400000, 86400000, 10);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_106', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1000, 1000, 3600);
      const expected = 3600;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_107', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(224999.9375, 3599999, 500);
      const expected = 31;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_108', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-7499.875, 59999, 60);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_109', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(4875, 6000, 61);
      const expected = 49;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_110', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(688.1875, 1001, 127);
      const expected = 87;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_111', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(4050001.125, 3600001, 2);
      const expected = 2;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_112', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(11250, 60000, 60);
      const expected = 11;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_113', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(37500, 60000, 3600);
      const expected = 2250;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_114', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1875.0625, 30001, 60);
      const expected = 3;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_115', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(4724998.6875, 3599999, 255);
      const expected = 255;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_116', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(0, 86400000, 10);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_117', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(0, 61000, 10);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_118', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(41250, 60000, 59);
      const expected = 40;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_119', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(3374999.0625, 3599999, 3600);
      const expected = 3375;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_120', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(3600000, 3600000, 255);
      const expected = 255;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_121', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-2437.3125, 12999, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_122', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-1624.875, 12999, 61);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_123', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1125000.3125, 3600001, 10);
      const expected = 3;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_124', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(4875, 6000, 86400);
      const expected = 70200;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_125', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-7500, 60000, 255);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_126', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(2475000, 3600000, 5);
      const expected = 3;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_127', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-1875, 10000, 3600);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_128', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(4275000, 3600000, 500);
      const expected = 500;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_129', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(937.5, 1000, 500);
      const expected = 468;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_130', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(2700000.75, 3600001, 3600);
      const expected = 2700;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_131', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(78750, 60000, 500);
      const expected = 500;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_132', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(7500.125, 60001, 127);
      const expected = 15;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_133', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(4049998.875, 3599999, 86400);
      const expected = 86400;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_134', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(13125, 10000, 3600);
      const expected = 3600;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_135', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(108000000, 86400000, 5);
      const expected = 5;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_136', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(0, 9999, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_137', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(8124.1875, 9999, 127);
      const expected = 103;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_138', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(86.0625, 1377, 2);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_139', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(53375, 61000, 2);
      const expected = 1;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_140', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1635.1875, 1377, 10);
      const expected = 10;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_141', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(26250.875, 30001, 127);
      const expected = 111;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_142', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(4875, 6000, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_143', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(43200000, 86400000, 61);
      const expected = 30;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_144', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-7499.875, 59999, 500);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_145', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(750, 1000, 500);
      const expected = 375;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_146', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(75600000, 86400000, 255);
      const expected = 223;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_147', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(500.5, 1001, 5);
      const expected = 2;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_148', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(52499.125, 59999, 2);
      const expected = 1;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_149', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(35626.1875, 30001, 127);
      const expected = 127;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_150', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(7875, 6000, 86400);
      const expected = 86400;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_151', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(437.9375, 1001, 3600);
      const expected = 1575;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_152', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(52499.125, 59999, 60);
      const expected = 52;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_153', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(14999.75, 59999, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_154', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(7499.875, 59999, 59);
      const expected = 7;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_155', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(0, 61000, 500);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_156', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(57187.5, 61000, 61);
      const expected = 57;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_157', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(0, 3600000, 500);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_158', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1125, 6000, 10);
      const expected = 1;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_159', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(688.5, 1377, 59);
      const expected = 29;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_160', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(2500, 10000, 59);
      const expected = 14;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_161', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(437.5, 1000, 10);
      const expected = 4;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_162', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(7875, 6000, 59);
      const expected = 59;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_163', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(7125, 6000, 86400);
      const expected = 86400;
      expect(actual).assertEqual(expected);
    });

    it('ValidationProgress10_164', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(899999.75, 3599999, 3600);
      const expected = 900;
      expect(actual).assertEqual(expected);
    });

  });
}
