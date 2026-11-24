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

export default function registerInteractionSeek12(): void {
  describe('InteractionSeek12', (): void => {
    it('InteractionSeek12_001', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(48600, 120000, 86400);
      const expected = 67500;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_002', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-11.4375, 120000, 61);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_003', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(38.125, 60000, 61);
      const expected = 37500;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_004', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-7.5, 1000, 60);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_005', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 60001, 2);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_006', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(7.9375, 6000, 127);
      const expected = 375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_007', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-10800, 3599999, 86400);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_008', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.5625, 3600001, 1);
      const expected = 2025000.5625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_009', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(3375, 9999, 3600);
      const expected = 9374.0625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_010', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 1001, 61);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_011', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(56.25, 9999, 60);
      const expected = 9374.0625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_012', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.25, 61000, 1);
      const expected = 15250;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_013', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(80.0625, 3599999, 61);
      const expected = 3599999;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_014', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(3.4375, 1377, 5);
      const expected = 946.6875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_015', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-1.25, 3600000, 10);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_016', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 86400000, 59);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_017', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(127, 1000, 127);
      const expected = 1000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_018', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 12999, 127);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_019', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(175.3125, 1377, 255);
      const expected = 946.6875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_020', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(2.1875, 30001, 5);
      const expected = 13125.4375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_021', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-0.125, 120000, 2);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_022', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(5, 1377, 5);
      const expected = 1377;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_023', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(4.375, 3600000, 5);
      const expected = 3150000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_024', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(29.5, 1001, 59);
      const expected = 500.5;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_025', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(156.25, 60001, 500);
      const expected = 18750.3125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_026', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.9375, 6000, 1);
      const expected = 5625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_027', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(55.5625, 9999, 127);
      const expected = 4374.5625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_028', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-0.375, 59999, 2);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_029', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(302.8125, 60001, 255);
      const expected = 60001;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_030', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(71.4375, 60001, 127);
      const expected = 33750.5625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_031', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(45, 60001, 60);
      const expected = 45000.75;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_032', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.5, 3599999, 2);
      const expected = 899999.75;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_033', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(93.75, 3599999, 500);
      const expected = 674999.8125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_034', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(5.625, 1000, 10);
      const expected = 562.5;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_035', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(61, 61000, 61);
      const expected = 61000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_036', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(76.25, 10000, 61);
      const expected = 10000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_037', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 6000, 1);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_038', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(156.25, 60000, 500);
      const expected = 18750;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_039', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(11.875, 9999, 10);
      const expected = 9999;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_040', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(63.75, 12999, 255);
      const expected = 3249.75;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_041', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-16200, 1000, 86400);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_042', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(62.6875, 60001, 59);
      const expected = 60001;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_043', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-16200, 3599999, 86400);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_044', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(33.1875, 86400000, 59);
      const expected = 48600000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_045', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(2, 1000, 2);
      const expected = 1000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_046', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(437.5, 30001, 500);
      const expected = 26250.875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_047', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(437.5, 60001, 500);
      const expected = 52500.875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_048', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(19.0625, 61000, 61);
      const expected = 19062.5;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_049', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(5, 9999, 5);
      const expected = 9999;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_050', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(250, 9999, 500);
      const expected = 4999.5;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_051', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(71.25, 60000, 60);
      const expected = 60000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_052', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.625, 30001, 5);
      const expected = 3750.125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_053', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(175.3125, 3599999, 255);
      const expected = 2474999.3125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_054', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(2.5, 1001, 2);
      const expected = 1001;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_055', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.375, 3599999, 2);
      const expected = 674999.8125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_056', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1.125, 1377, 2);
      const expected = 774.5625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_057', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(66.375, 61000, 59);
      const expected = 61000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_058', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(2.5, 3600000, 5);
      const expected = 1800000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_059', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(2.375, 3600001, 2);
      const expected = 3600001;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_060', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(127.5, 12999, 255);
      const expected = 6499.5;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_061', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(675, 6000, 3600);
      const expected = 1125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_062', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(3.4375, 12999, 5);
      const expected = 8936.8125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_063', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(7.9375, 1000, 127);
      const expected = 62.5;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_064', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-11.25, 61000, 60);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_065', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(119.0625, 59999, 127);
      const expected = 56249.0625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_066', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(71.25, 3600001, 60);
      const expected = 3600001;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_067', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-0.1875, 120000, 1);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_068', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(53.375, 10000, 61);
      const expected = 8750;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_069', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(11.0625, 9999, 59);
      const expected = 1874.8125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_070', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1.375, 30001, 2);
      const expected = 20625.6875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_071', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(12.5, 3599999, 10);
      const expected = 3599999;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_072', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(33.1875, 59999, 59);
      const expected = 33749.4375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_073', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(30, 10000, 60);
      const expected = 5000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_074', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(2.5, 3600000, 2);
      const expected = 3600000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_075', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(159.375, 3600001, 255);
      const expected = 2250000.625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_076', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(30, 1377, 60);
      const expected = 688.5;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_077', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-16200, 3600000, 86400);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_078', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(2.5, 1377, 5);
      const expected = 688.5;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_079', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(86400, 9999, 86400);
      const expected = 9999;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_080', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(31.25, 9999, 500);
      const expected = 624.9375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_081', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 59999, 60);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_082', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(4.375, 3600001, 10);
      const expected = 1575000.4375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_083', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(3.4375, 1001, 5);
      const expected = 688.1875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_084', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-3.75, 60000, 60);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_085', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(37800, 1000, 86400);
      const expected = 437.5;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_086', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(625, 30001, 500);
      const expected = 30001;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_087', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-7.5, 86400000, 60);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_088', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(312.5, 12999, 500);
      const expected = 8124.375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_089', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 61000, 127);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_090', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(11.0625, 3600001, 59);
      const expected = 675000.1875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_091', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.375, 120000, 1);
      const expected = 45000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_092', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-23.8125, 59999, 127);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_093', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(63.75, 9999, 60);
      const expected = 9999;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_094', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(18.4375, 86400000, 59);
      const expected = 27000000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_095', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(18.75, 61000, 60);
      const expected = 19062.5;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_096', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(60, 1000, 60);
      const expected = 1000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_097', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(134.9375, 9999, 127);
      const expected = 9999;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_098', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(45, 12999, 60);
      const expected = 9749.25;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_099', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(81000, 3600001, 86400);
      const expected = 3375000.9375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_100', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(5400, 12999, 86400);
      const expected = 812.4375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_101', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.9375, 3600000, 5);
      const expected = 675000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_102', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(3.75, 60000, 10);
      const expected = 22500;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_103', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.9375, 12999, 1);
      const expected = 12186.5625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_104', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(67.5, 60000, 60);
      const expected = 60000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_105', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0.25, 1377, 1);
      const expected = 344.25;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_106', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(7.5, 12999, 60);
      const expected = 1624.875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_107', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(3.125, 86400000, 10);
      const expected = 27000000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_108', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(63.75, 6000, 255);
      const expected = 1500;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_109', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(48.75, 3600001, 60);
      const expected = 2925000.8125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_110', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(18.4375, 6000, 59);
      const expected = 1875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_111', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1.25, 6000, 5);
      const expected = 1500;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_112', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(47.625, 61000, 127);
      const expected = 22875;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_113', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(207.1875, 3600001, 255);
      const expected = 2925000.8125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_114', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(111.125, 120000, 127);
      const expected = 105000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_115', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(75600, 3600000, 86400);
      const expected = 3150000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_116', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(48.75, 60001, 60);
      const expected = 48750.8125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_117', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(11.25, 9999, 60);
      const expected = 1874.8125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_118', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(39.6875, 1000, 127);
      const expected = 312.5;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_119', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(1.0625, 1377, 1);
      const expected = 1377;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_120', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(63.75, 3600001, 255);
      const expected = 900000.25;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_121', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(3.125, 30001, 10);
      const expected = 9375.3125;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_122', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(22.125, 9999, 59);
      const expected = 3749.625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_123', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(79.375, 30001, 127);
      const expected = 18750.625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_124', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(4.0625, 86400000, 5);
      const expected = 70200000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_125', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(406.25, 120000, 500);
      const expected = 97500;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_126', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(2.1875, 61000, 5);
      const expected = 26687.5;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_127', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(22.5, 12999, 60);
      const expected = 4874.625;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_128', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(11.25, 120000, 10);
      const expected = 120000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_129', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(44.25, 1001, 59);
      const expected = 750.75;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_130', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(81000, 61000, 86400);
      const expected = 57187.5;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('InteractionSeek12_131', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(2.8125, 6000, 5);
      const expected = 3375;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

  });
}
