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
import { secondToTime } from '../../../../main/ets/common/utils/CommonUtils';

export default function registerValidationClock09(): void {
  describe('ValidationClock09', (): void => {
    it('ValidationClock09_001', 0, (): void => {
      const actual = secondToTime(356519.99);
      const expected = "99:01:59";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_002', 0, (): void => {
      const actual = secondToTime(360061);
      const expected = "100:01:01";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_003', 0, (): void => {
      const actual = secondToTime(89998.99);
      const expected = "24:59:58";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_004', 0, (): void => {
      const actual = secondToTime(87059);
      const expected = "24:10:59";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_005', 0, (): void => {
      const actual = secondToTime(360070.99);
      const expected = "100:01:10";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_006', 0, (): void => {
      const actual = secondToTime(4198.99);
      const expected = "01:09:58";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_007', 0, (): void => {
      const actual = secondToTime(32469);
      const expected = "09:01:09";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_008', 0, (): void => {
      const actual = secondToTime(36601.99);
      const expected = "10:10:01";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_009', 0, (): void => {
      const actual = secondToTime(34259);
      const expected = "09:30:59";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_010', 0, (): void => {
      const actual = secondToTime(34209);
      const expected = "09:30:09";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_011', 0, (): void => {
      const actual = secondToTime(34258);
      const expected = "09:30:58";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_012', 0, (): void => {
      const actual = secondToTime(32400);
      const expected = "09:00:00";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_013', 0, (): void => {
      const actual = secondToTime(69);
      const expected = "01:09";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_014', 0, (): void => {
      const actual = secondToTime(88210);
      const expected = "24:30:10";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_015', 0, (): void => {
      const actual = secondToTime(86349.99);
      const expected = "23:59:09";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_016', 0, (): void => {
      const actual = secondToTime(359999.99);
      const expected = "99:59:59";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_017', 0, (): void => {
      const actual = secondToTime(36058);
      const expected = "10:00:58";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_018', 0, (): void => {
      const actual = secondToTime(360609.99);
      const expected = "100:10:09";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_019', 0, (): void => {
      const actual = secondToTime(363540);
      const expected = "100:59:00";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_020', 0, (): void => {
      const actual = secondToTime(88209);
      const expected = "24:30:09";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_021', 0, (): void => {
      const actual = secondToTime(87001.99);
      const expected = "24:10:01";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_022', 0, (): void => {
      const actual = secondToTime(3718.99);
      const expected = "01:01:58";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_023', 0, (): void => {
      const actual = secondToTime(3599.99);
      const expected = "59:59";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_024', 0, (): void => {
      const actual = secondToTime(363550);
      const expected = "100:59:10";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_025', 0, (): void => {
      const actual = secondToTime(88201);
      const expected = "24:30:01";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_026', 0, (): void => {
      const actual = secondToTime(89889);
      const expected = "24:58:09";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_027', 0, (): void => {
      const actual = secondToTime(356469);
      const expected = "99:01:09";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_028', 0, (): void => {
      const actual = secondToTime(357059);
      const expected = "99:10:59";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_029', 0, (): void => {
      const actual = secondToTime(363538.99);
      const expected = "100:58:58";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_030', 0, (): void => {
      const actual = secondToTime(86289);
      const expected = "23:58:09";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_031', 0, (): void => {
      const actual = secondToTime(39481.99);
      const expected = "10:58:01";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_032', 0, (): void => {
      const actual = secondToTime(601);
      const expected = "10:01";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_033', 0, (): void => {
      const actual = secondToTime(36070);
      const expected = "10:01:10";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_034', 0, (): void => {
      const actual = secondToTime(35950.99);
      const expected = "09:59:10";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_035', 0, (): void => {
      const actual = secondToTime(34200.99);
      const expected = "09:30:00";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_036', 0, (): void => {
      const actual = secondToTime(39540.99);
      const expected = "10:59:00";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_037', 0, (): void => {
      const actual = secondToTime(58);
      const expected = "00:58";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_038', 0, (): void => {
      const actual = secondToTime(599.99);
      const expected = "09:59";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_039', 0, (): void => {
      const actual = secondToTime(356470.99);
      const expected = "99:01:10";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_040', 0, (): void => {
      const actual = secondToTime(37859.99);
      const expected = "10:30:59";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_041', 0, (): void => {
      const actual = secondToTime(32941);
      const expected = "09:09:01";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_042', 0, (): void => {
      const actual = secondToTime(39539.99);
      const expected = "10:58:59";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_043', 0, (): void => {
      const actual = secondToTime(36058.99);
      const expected = "10:00:58";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_044', 0, (): void => {
      const actual = secondToTime(39549);
      const expected = "10:59:09";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_045', 0, (): void => {
      const actual = secondToTime(35941);
      const expected = "09:59:01";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_046', 0, (): void => {
      const actual = secondToTime(39489);
      const expected = "10:58:09";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_047', 0, (): void => {
      const actual = secondToTime(609.99);
      const expected = "10:09";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_048', 0, (): void => {
      const actual = secondToTime(86409.99);
      const expected = "24:00:09";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_049', 0, (): void => {
      const actual = secondToTime(86289.99);
      const expected = "23:58:09";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_050', 0, (): void => {
      const actual = secondToTime(360659);
      const expected = "100:10:59";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_051', 0, (): void => {
      const actual = secondToTime(356459.99);
      const expected = "99:00:59";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_052', 0, (): void => {
      const actual = secondToTime(86349);
      const expected = "23:59:09";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_053', 0, (): void => {
      const actual = secondToTime(82870.99);
      const expected = "23:01:10";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_054', 0, (): void => {
      const actual = secondToTime(3540.99);
      const expected = "59:00";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_055', 0, (): void => {
      const actual = secondToTime(7089);
      const expected = "01:58:09";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_056', 0, (): void => {
      const actual = secondToTime(36600.99);
      const expected = "10:10:00";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_057', 0, (): void => {
      const actual = secondToTime(83459.99);
      const expected = "23:10:59";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_058', 0, (): void => {
      const actual = secondToTime(37809.99);
      const expected = "10:30:09";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_059', 0, (): void => {
      const actual = secondToTime(3610.99);
      const expected = "01:00:10";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_060', 0, (): void => {
      const actual = secondToTime(356461);
      const expected = "99:01:01";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_061', 0, (): void => {
      const actual = secondToTime(86518);
      const expected = "24:01:58";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_062', 0, (): void => {
      const actual = secondToTime(86410);
      const expected = "24:00:10";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_063', 0, (): void => {
      const actual = secondToTime(84658.99);
      const expected = "23:30:58";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_064', 0, (): void => {
      const actual = secondToTime(360119.99);
      const expected = "100:01:59";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_065', 0, (): void => {
      const actual = secondToTime(36540.99);
      const expected = "10:09:00";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_066', 0, (): void => {
      const actual = secondToTime(3659.99);
      const expected = "01:00:59";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_067', 0, (): void => {
      const actual = secondToTime(609);
      const expected = "10:09";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_068', 0, (): void => {
      const actual = secondToTime(39540);
      const expected = "10:59:00";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_069', 0, (): void => {
      const actual = secondToTime(36118.99);
      const expected = "10:01:58";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_070', 0, (): void => {
      const actual = secondToTime(37801.99);
      const expected = "10:30:01";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_071', 0, (): void => {
      const actual = secondToTime(4258);
      const expected = "01:10:58";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_072', 0, (): void => {
      const actual = secondToTime(363541);
      const expected = "100:59:01";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_073', 0, (): void => {
      const actual = secondToTime(32998.99);
      const expected = "09:09:58";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_074', 0, (): void => {
      const actual = secondToTime(36658.99);
      const expected = "10:10:58";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_075', 0, (): void => {
      const actual = secondToTime(36610);
      const expected = "10:10:10";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_076', 0, (): void => {
      const actual = secondToTime(3719.99);
      const expected = "01:01:59";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_077', 0, (): void => {
      const actual = secondToTime(32949.99);
      const expected = "09:09:09";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_078', 0, (): void => {
      const actual = secondToTime(82860);
      const expected = "23:01:00";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_079', 0, (): void => {
      const actual = secondToTime(32949);
      const expected = "09:09:09";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_080', 0, (): void => {
      const actual = secondToTime(32950.99);
      const expected = "09:09:10";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_081', 0, (): void => {
      const actual = secondToTime(35940.99);
      const expected = "09:59:00";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_082', 0, (): void => {
      const actual = secondToTime(359889.99);
      const expected = "99:58:09";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_083', 0, (): void => {
      const actual = secondToTime(58.99);
      const expected = "00:58";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_084', 0, (): void => {
      const actual = secondToTime(82809);
      const expected = "23:00:09";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_085', 0, (): void => {
      const actual = secondToTime(61.99);
      const expected = "01:01";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_086', 0, (): void => {
      const actual = secondToTime(7198.99);
      const expected = "01:59:58";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_087', 0, (): void => {
      const actual = secondToTime(7150.99);
      const expected = "01:59:10";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_088', 0, (): void => {
      const actual = secondToTime(32999.99);
      const expected = "09:09:59";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_089', 0, (): void => {
      const actual = secondToTime(36061.99);
      const expected = "10:01:01";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_090', 0, (): void => {
      const actual = secondToTime(610);
      const expected = "10:10";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_091', 0, (): void => {
      const actual = secondToTime(1800);
      const expected = "30:00";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_092', 0, (): void => {
      const actual = secondToTime(3540);
      const expected = "59:00";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_093', 0, (): void => {
      const actual = secondToTime(33009);
      const expected = "09:10:09";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_094', 0, (): void => {
      const actual = secondToTime(360610);
      const expected = "100:10:10";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_095', 0, (): void => {
      const actual = secondToTime(87009);
      const expected = "24:10:09";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_096', 0, (): void => {
      const actual = secondToTime(82810.99);
      const expected = "23:00:10";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_097', 0, (): void => {
      const actual = secondToTime(360058);
      const expected = "100:00:58";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_098', 0, (): void => {
      const actual = secondToTime(86290.99);
      const expected = "23:58:10";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_099', 0, (): void => {
      const actual = secondToTime(32519.99);
      const expected = "09:01:59";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_100', 0, (): void => {
      const actual = secondToTime(86399.99);
      const expected = "23:59:59";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_101', 0, (): void => {
      const actual = secondToTime(356410.99);
      const expected = "99:00:10";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_102', 0, (): void => {
      const actual = secondToTime(34259.99);
      const expected = "09:30:59";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_103', 0, (): void => {
      const actual = secondToTime(86470);
      const expected = "24:01:10";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_104', 0, (): void => {
      const actual = secondToTime(600);
      const expected = "10:00";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_105', 0, (): void => {
      const actual = secondToTime(86459.99);
      const expected = "24:00:59";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_106', 0, (): void => {
      const actual = secondToTime(359939);
      const expected = "99:58:59";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_107', 0, (): void => {
      const actual = secondToTime(35949.99);
      const expected = "09:59:09";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_108', 0, (): void => {
      const actual = secondToTime(5400.99);
      const expected = "01:30:00";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_109', 0, (): void => {
      const actual = secondToTime(359881);
      const expected = "99:58:01";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_110', 0, (): void => {
      const actual = secondToTime(60.99);
      const expected = "01:00";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_111', 0, (): void => {
      const actual = secondToTime(360001);
      const expected = "100:00:01";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_112', 0, (): void => {
      const actual = secondToTime(659.99);
      const expected = "10:59";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_113', 0, (): void => {
      const actual = secondToTime(86949.99);
      const expected = "24:09:09";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_114', 0, (): void => {
      const actual = secondToTime(360601);
      const expected = "100:10:01";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_115', 0, (): void => {
      const actual = secondToTime(361800);
      const expected = "100:30:00";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_116', 0, (): void => {
      const actual = secondToTime(89941);
      const expected = "24:59:01";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_117', 0, (): void => {
      const actual = secondToTime(86949);
      const expected = "24:09:09";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_118', 0, (): void => {
      const actual = secondToTime(7141);
      const expected = "01:59:01";
      expect(actual).assertEqual(expected);
    });

    it('ValidationClock09_119', 0, (): void => {
      const actual = secondToTime(88258.99);
      const expected = "24:30:58";
      expect(actual).assertEqual(expected);
    });

  });
}
