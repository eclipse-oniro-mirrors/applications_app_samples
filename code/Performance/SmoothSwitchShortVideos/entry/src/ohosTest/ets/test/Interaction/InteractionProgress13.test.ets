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

export default function registerInteractionProgress13(): void {
  describe('InteractionProgress13', (): void => {
    it('InteractionProgress13_001', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(19062.5, 61000, 60);
      const expected = 18;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_002', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1000, 1000, 60);
      const expected = 60;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_003', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(10623.9375, 9999, 127);
      const expected = 127;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_004', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(9749.25, 12999, 60);
      const expected = 45;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_005', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(3375000.9375, 3600001, 86400);
      const expected = 81000;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_006', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(812.4375, 12999, 86400);
      const expected = 5400;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_007', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(675000, 3600000, 5);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_008', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(22500, 60000, 10);
      const expected = 3;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_009', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(12186.5625, 12999, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_010', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(67500, 60000, 60);
      const expected = 60;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_011', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(344.25, 1377, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_012', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1624.875, 12999, 60);
      const expected = 7;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_013', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(27000000, 86400000, 10);
      const expected = 3;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_014', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1500, 6000, 255);
      const expected = 63;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_015', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(2925000.8125, 3600001, 60);
      const expected = 48;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_016', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1875, 6000, 59);
      const expected = 18;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_017', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1500, 6000, 5);
      const expected = 1;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_018', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(22875, 61000, 127);
      const expected = 47;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_019', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(2925000.8125, 3600001, 255);
      const expected = 207;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_020', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(105000, 120000, 127);
      const expected = 111;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_021', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(3150000, 3600000, 86400);
      const expected = 75600;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_022', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(48750.8125, 60001, 60);
      const expected = 48;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_023', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1874.8125, 9999, 60);
      const expected = 11;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_024', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(312.5, 1000, 127);
      const expected = 39;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_025', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1463.0625, 1377, 1);
      const expected = 1;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_026', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(900000.25, 3600001, 255);
      const expected = 63;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_027', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(9375.3125, 30001, 10);
      const expected = 3;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_028', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(3749.625, 9999, 59);
      const expected = 22;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_029', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(18750.625, 30001, 127);
      const expected = 79;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_030', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(70200000, 86400000, 5);
      const expected = 4;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_031', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(97500, 120000, 500);
      const expected = 406;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_032', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(26687.5, 61000, 5);
      const expected = 2;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_033', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(4874.625, 12999, 60);
      const expected = 22;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_034', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(135000, 120000, 10);
      const expected = 10;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_035', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(750.75, 1001, 59);
      const expected = 44;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_036', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(57187.5, 61000, 86400);
      const expected = 81000;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_037', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(3375, 6000, 5);
      const expected = 2;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_038', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(900000, 3600000, 5);
      const expected = 1;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_039', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(4499998.75, 3599999, 255);
      const expected = 255;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_040', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(9999, 9999, 10);
      const expected = 10;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_041', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(813.3125, 1001, 500);
      const expected = 406;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_042', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(0, 6000, 86400);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_043', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(15000.25, 60001, 61);
      const expected = 15;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_044', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(625, 10000, 61);
      const expected = 3;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_045', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(0, 120000, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_046', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(7500, 120000, 10);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_047', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(900000, 3600000, 86400);
      const expected = 21600;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_048', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1875, 10000, 2);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_049', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(938.4375, 1001, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_050', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1549.125, 1377, 59);
      const expected = 59;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_051', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(37501.25, 30001, 255);
      const expected = 255;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_052', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(86.0625, 1377, 10);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_053', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(15436.3125, 12999, 61);
      const expected = 61;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_054', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-675000, 3600000, 127);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_055', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(4500000, 3600000, 127);
      const expected = 127;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_056', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(8124.1875, 9999, 59);
      const expected = 47;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_057', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(563.0625, 1001, 61);
      const expected = 34;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_058', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(3600000, 3600000, 61);
      const expected = 61;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_059', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(11248.875, 9999, 61);
      const expected = 61;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_060', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-7500.125, 60001, 61);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_061', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(0, 86400000, 3600);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_062', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(102600000, 86400000, 255);
      const expected = 255;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_063', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(37499.375, 59999, 255);
      const expected = 159;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_064', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(3249.75, 12999, 127);
      const expected = 31;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_065', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(449999.875, 3599999, 500);
      const expected = 62;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_066', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(127500, 120000, 10);
      const expected = 10;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_067', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(0, 59999, 86400);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_068', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(3124.6875, 9999, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_069', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(120000, 120000, 3600);
      const expected = 3600;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_070', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(11875, 10000, 255);
      const expected = 255;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_071', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(3124.6875, 9999, 127);
      const expected = 39;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_072', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(71251.1875, 60001, 60);
      const expected = 60;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_073', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-675000.1875, 3600001, 61);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_074', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(44999.25, 59999, 3600);
      const expected = 2700;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_075', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1251.25, 1001, 59);
      const expected = 59;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_076', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(33751.125, 30001, 61);
      const expected = 61;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_077', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(56250.9375, 60001, 3600);
      const expected = 3375;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_078', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(15000, 60000, 255);
      const expected = 63;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_079', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(0, 1001, 10);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_080', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1721.25, 1377, 255);
      const expected = 255;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_081', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(2925000.8125, 3600001, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_082', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(26250.4375, 60001, 61);
      const expected = 26;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_083', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(11248.875, 9999, 86400);
      const expected = 86400;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_084', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1250, 10000, 5);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_085', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(3750.0625, 60001, 2);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_086', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(0, 120000, 3600);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_087', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(91800000, 86400000, 127);
      const expected = 127;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_088', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(674999.8125, 3599999, 86400);
      const expected = 16200;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_089', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1126.125, 1001, 1);
      const expected = 1;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_090', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(37500, 120000, 3600);
      const expected = 1125;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_091', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(27000000, 86400000, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_092', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(7500, 10000, 5);
      const expected = 3;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_093', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(63751.0625, 60001, 61);
      const expected = 61;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_094', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(688.1875, 1001, 10);
      const expected = 6;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_095', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(225000, 3600000, 60);
      const expected = 3;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_096', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-674999.8125, 3599999, 3600);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_097', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(74998.75, 59999, 1);
      const expected = 1;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_098', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(2700000, 3600000, 61);
      const expected = 45;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_099', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(0, 3600000, 5);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_100', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-187.5, 1000, 10);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_101', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-16200000, 86400000, 5);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_102', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(0, 12999, 255);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_103', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(516.375, 1377, 10);
      const expected = 3;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_104', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-675000.1875, 3600001, 60);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_105', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(7500, 6000, 59);
      const expected = 59;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress13_106', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(86400000, 86400000, 59);
      const expected = 59;
      expect(actual).assertEqual(expected);
    });

  });
}
