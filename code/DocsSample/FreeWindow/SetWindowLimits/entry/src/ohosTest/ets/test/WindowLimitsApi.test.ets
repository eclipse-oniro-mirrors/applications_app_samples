/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { getTestAbilityContext } from '../testability/AbilityContextStore';
import { getTestWindow } from '../testability/WindowStore';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
const UNSUPPORTED_CODES: number[] = [401, 801, 1300002, 1300003, 1300004];

interface SetLimitsResult {
  ok: boolean;
  code: number;
  limits?: window.WindowLimits;
}

interface LimitCase {
  name: string;
  number: string;
  limits: window.WindowLimits;
  forcible: boolean;
}

const LIMIT_CASES: LimitCase[] = [
  {
    name: 'testSetLimitsAllFields0010', number: '0010',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsMaxOnly0011', number: '0011',
    limits: { maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsMinOnly0012', number: '0012',
    limits: { minWidth: 600, minHeight: 500 }, forcible: false
  },
  {
    name: 'testSetLimitsMaxWidthOnly0013', number: '0013',
    limits: { maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testSetLimitsMaxHeightOnly0014', number: '0014',
    limits: { maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsMinWidthOnly0015', number: '0015',
    limits: { minWidth: 600 }, forcible: false
  },
  {
    name: 'testSetLimitsMinHeightOnly0016', number: '0016',
    limits: { minHeight: 500 }, forcible: false
  },
  {
    name: 'testSetLimitsEqualMinMax0017', number: '0017',
    limits: { minWidth: 800, minHeight: 800, maxWidth: 800, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testSetLimitsEqualWidth0018', number: '0018',
    limits: { minWidth: 800, minHeight: 500, maxWidth: 800, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsEqualHeight0019', number: '0019',
    limits: { minWidth: 600, minHeight: 800, maxWidth: 1500, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testSetLimitsHeadroomOne0020', number: '0020',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 601, maxHeight: 501 }, forcible: false
  },
  {
    name: 'testSetLimitsLargeHeadroom0021', number: '0021',
    limits: { minWidth: 1, minHeight: 1, maxWidth: 20000, maxHeight: 20000 }, forcible: false
  },
  {
    name: 'testSetLimitsSmallSize0022', number: '0022',
    limits: { minWidth: 1, minHeight: 1, maxWidth: 2, maxHeight: 2 }, forcible: false
  },
  {
    name: 'testSetLimitsFractional0023', number: '0023',
    limits: { minWidth: 600.5, minHeight: 500.5, maxWidth: 1500.5, maxHeight: 1000.5 }, forcible: false
  },
  {
    name: 'testSetLimitsHugeMax0024', number: '0024',
    limits: { maxWidth: 100000, maxHeight: 100000 }, forcible: false
  },
  {
    name: 'testSetLimitsHugeMin0025', number: '0025',
    limits: { minWidth: 100000, minHeight: 100000 }, forcible: false
  },
  {
    name: 'testSetLimitsSwapWidth0026', number: '0026',
    limits: { minWidth: 2000, maxWidth: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsSwapHeight0027', number: '0027',
    limits: { minHeight: 2000, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsSwapBoth0028', number: '0028',
    limits: { minWidth: 2000, minHeight: 2000, maxWidth: 1000, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsNegativeAll0029', number: '0029',
    limits: { minWidth: -1, minHeight: -1, maxWidth: -1, maxHeight: -1 }, forcible: false
  },
  {
    name: 'testSetLimitsNegativeMin0030', number: '0030',
    limits: { minWidth: -100, minHeight: -100 }, forcible: false
  },
  {
    name: 'testSetLimitsNegativeMax0031', number: '0031',
    limits: { maxWidth: -100, maxHeight: -100 }, forcible: false
  },
  {
    name: 'testSetLimitsZeroAll0032', number: '0032',
    limits: { minWidth: 0, minHeight: 0, maxWidth: 0, maxHeight: 0 }, forcible: false
  },
  {
    name: 'testSetLimitsZeroMin0033', number: '0033',
    limits: { minWidth: 0, minHeight: 0 }, forcible: false
  },
  {
    name: 'testSetLimitsEmpty0034', number: '0034',
    limits: {}, forcible: false
  },
  {
    name: 'testSetLimitsForcibleAll0035', number: '0035',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 1000 }, forcible: true
  },
  {
    name: 'testSetLimitsForcibleMax0036', number: '0036',
    limits: { maxWidth: 1500, maxHeight: 1000 }, forcible: true
  },
  {
    name: 'testSetLimitsForcibleInvalid0037', number: '0037',
    limits: { minWidth: 2000, maxWidth: 1000 }, forcible: true
  },
  {
    name: 'testSetLimitsNumberOfDigits0038', number: '0038',
    limits: { minWidth: 100, minHeight: 100, maxWidth: 120, maxHeight: 120 }, forcible: false
  },
  {
    name: 'testSetLimitsWideRange0039', number: '0039',
    limits: { minWidth: 100, minHeight: 100, maxWidth: 9000, maxHeight: 9000 }, forcible: false
  },
  {
    name: 'testSetLimitsMinWidthMaxHeight0040', number: '0040',
    limits: { minWidth: 600, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsMinHeightMaxWidth0041', number: '0041',
    limits: { minHeight: 500, maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthRange0042', number: '0042',
    limits: { minWidth: 600, maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightRange0043', number: '0043',
    limits: { minHeight: 500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsEqual9000044', number: '0044',
    limits: { minWidth: 900, minHeight: 900, maxWidth: 900, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testSetLimitsHeadroomTwo0045', number: '0045',
    limits: { minWidth: 800, minHeight: 800, maxWidth: 802, maxHeight: 802 }, forcible: false
  },
  {
    name: 'testSetLimitsHeadroomFive0046', number: '0046',
    limits: { minWidth: 800, minHeight: 800, maxWidth: 805, maxHeight: 805 }, forcible: false
  },
  {
    name: 'testSetLimitsAllOnes0047', number: '0047',
    limits: { minWidth: 1, minHeight: 1, maxWidth: 1, maxHeight: 1 }, forcible: false
  },
  {
    name: 'testSetLimitsAllHundred0048', number: '0048',
    limits: { minWidth: 100, minHeight: 100, maxWidth: 100, maxHeight: 100 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthOnlyRange0049', number: '0049',
    limits: { minWidth: 600, maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightOnlyRange0050', number: '0050',
    limits: { minHeight: 500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsNegativeMinWidth0051', number: '0051',
    limits: { minWidth: -1, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsNegativeMinHeight0052', number: '0052',
    limits: { minHeight: -1, maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testSetLimitsNegativeMaxWidth0053', number: '0053',
    limits: { minWidth: 100, maxWidth: -1 }, forcible: false
  },
  {
    name: 'testSetLimitsNegativeMaxHeight0054', number: '0054',
    limits: { minHeight: 100, maxHeight: -1 }, forcible: false
  },
  {
    name: 'testSetLimitsZeroMin0055', number: '0055',
    limits: { minWidth: 0, maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testSetLimitsZeroMax0056', number: '0056',
    limits: { minWidth: 600, maxWidth: 0 }, forcible: false
  },
  {
    name: 'testSetLimitsNegativeFraction0057', number: '0057',
    limits: { minWidth: -0.5, maxWidth: -0.1 }, forcible: false
  },
  {
    name: 'testSetLimitsHalfValue0058', number: '0058',
    limits: { minWidth: 0.5, minHeight: 0.5, maxWidth: 1.5, maxHeight: 1.5 }, forcible: false
  },
  {
    name: 'testSetLimitsHuge1e6_0059', number: '0059',
    limits: { maxWidth: 1000000, maxHeight: 1000000 }, forcible: false
  },
  {
    name: 'testSetLimitsHuge1e9_0060', number: '0060',
    limits: { maxWidth: 1000000000, maxHeight: 1000000000 }, forcible: false
  },
  {
    name: 'testSetLimitsMaxSafeInteger0061', number: '0061',
    limits: { maxWidth: Number.MAX_SAFE_INTEGER, maxHeight: Number.MAX_SAFE_INTEGER }, forcible: false
  },
  {
    name: 'testSetLimitsInfinityMax0062', number: '0062',
    limits: { maxWidth: Number.POSITIVE_INFINITY, maxHeight: Number.POSITIVE_INFINITY }, forcible: false
  },
  {
    name: 'testSetLimitsNaNMax0063', number: '0063',
    limits: { maxWidth: Number.NaN, maxHeight: Number.NaN }, forcible: false
  },
  {
    name: 'testSetLimitsInfinityMin0064', number: '0064',
    limits: { minWidth: Number.POSITIVE_INFINITY, minHeight: Number.POSITIVE_INFINITY }, forcible: false
  },
  {
    name: 'testSetLimitsSwapFraction0065', number: '0065',
    limits: { minWidth: 1000.5, maxWidth: 1000.4 }, forcible: false
  },
  {
    name: 'testSetLimitsMaxWidthOne0066', number: '0066',
    limits: { maxWidth: 1 }, forcible: false
  },
  {
    name: 'testSetLimitsMaxHeightOne0067', number: '0067',
    limits: { maxHeight: 1 }, forcible: false
  },
  {
    name: 'testSetLimitsMinWidthOne0068', number: '0068',
    limits: { minWidth: 1 }, forcible: false
  },
  {
    name: 'testSetLimitsMinHeightOne0069', number: '0069',
    limits: { minHeight: 1 }, forcible: false
  },
  {
    name: 'testSetLimitsForcibleHuge0070', number: '0070',
    limits: { maxWidth: 20000, maxHeight: 20000 }, forcible: true
  },
  {
    name: 'testSetLimitsForcibleNegative0071', number: '0071',
    limits: { minWidth: -1, maxWidth: -2 }, forcible: true
  },
  {
    name: 'testSetLimitsGrid0200', number: '0200',
    limits: { minWidth: 1, minHeight: 1, maxWidth: 800, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testSetLimitsGrid0201', number: '0201',
    limits: { minWidth: 1, minHeight: 1, maxWidth: 1000, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsGrid0202', number: '0202',
    limits: { minWidth: 1, minHeight: 1, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsGrid0203', number: '0203',
    limits: { minWidth: 1, minHeight: 1, maxWidth: 2000, maxHeight: 2000 }, forcible: false
  },
  {
    name: 'testSetLimitsGrid0204', number: '0204',
    limits: { minWidth: 1, minHeight: 1, maxWidth: 20000, maxHeight: 20000 }, forcible: false
  },
  {
    name: 'testSetLimitsGrid0205', number: '0205',
    limits: { minWidth: 100, minHeight: 100, maxWidth: 800, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testSetLimitsGrid0206', number: '0206',
    limits: { minWidth: 100, minHeight: 100, maxWidth: 1000, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsGrid0207', number: '0207',
    limits: { minWidth: 100, minHeight: 100, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsGrid0208', number: '0208',
    limits: { minWidth: 100, minHeight: 100, maxWidth: 2000, maxHeight: 2000 }, forcible: false
  },
  {
    name: 'testSetLimitsGrid0209', number: '0209',
    limits: { minWidth: 100, minHeight: 100, maxWidth: 20000, maxHeight: 20000 }, forcible: false
  },
  {
    name: 'testSetLimitsGrid0210', number: '0210',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 800, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testSetLimitsGrid0211', number: '0211',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 1000, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsGrid0212', number: '0212',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsGrid0213', number: '0213',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 2000, maxHeight: 2000 }, forcible: false
  },
  {
    name: 'testSetLimitsGrid0214', number: '0214',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 20000, maxHeight: 20000 }, forcible: false
  },
  {
    name: 'testSetLimitsGrid0215', number: '0215',
    limits: { minWidth: 800, minHeight: 800, maxWidth: 800, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testSetLimitsGrid0216', number: '0216',
    limits: { minWidth: 800, minHeight: 800, maxWidth: 1000, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsGrid0217', number: '0217',
    limits: { minWidth: 800, minHeight: 800, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsGrid0218', number: '0218',
    limits: { minWidth: 800, minHeight: 800, maxWidth: 2000, maxHeight: 2000 }, forcible: false
  },
  {
    name: 'testSetLimitsGrid0219', number: '0219',
    limits: { minWidth: 800, minHeight: 800, maxWidth: 20000, maxHeight: 20000 }, forcible: false
  },
  {
    name: 'testSetLimitsGrid0220', number: '0220',
    limits: { minWidth: 1000, minHeight: 1000, maxWidth: 800, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testSetLimitsGrid0221', number: '0221',
    limits: { minWidth: 1000, minHeight: 1000, maxWidth: 1000, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsGrid0222', number: '0222',
    limits: { minWidth: 1000, minHeight: 1000, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsGrid0223', number: '0223',
    limits: { minWidth: 1000, minHeight: 1000, maxWidth: 2000, maxHeight: 2000 }, forcible: false
  },
  {
    name: 'testSetLimitsGrid0224', number: '0224',
    limits: { minWidth: 1000, minHeight: 1000, maxWidth: 20000, maxHeight: 20000 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthGrid0225', number: '0225',
    limits: { minWidth: 1, maxWidth: 800 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthGrid0226', number: '0226',
    limits: { minWidth: 1, maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthGrid0227', number: '0227',
    limits: { minWidth: 100, maxWidth: 800 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthGrid0228', number: '0228',
    limits: { minWidth: 100, maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthGrid0229', number: '0229',
    limits: { minWidth: 600, maxWidth: 800 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthGrid0230', number: '0230',
    limits: { minWidth: 600, maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthGrid0231', number: '0231',
    limits: { minWidth: 800, maxWidth: 800 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthGrid0232', number: '0232',
    limits: { minWidth: 800, maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightGrid0233', number: '0233',
    limits: { minHeight: 1, maxHeight: 500 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightGrid0234', number: '0234',
    limits: { minHeight: 100, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightGrid0235', number: '0235',
    limits: { minHeight: 500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightGrid0236', number: '0236',
    limits: { minHeight: 600, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightGrid0237', number: '0237',
    limits: { minHeight: 800, maxHeight: 1500 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightGrid0238', number: '0238',
    limits: { minHeight: 500, maxHeight: 20000 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightGrid0239', number: '0239',
    limits: { minHeight: 1, maxHeight: 1 }, forcible: false
  },
  {
    name: 'testSetLimitsForcibleGrid0240', number: '0240',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 1000 }, forcible: true
  },
  {
    name: 'testSetLimitsForcibleGrid0241', number: '0241',
    limits: { maxWidth: 1200, maxHeight: 800 }, forcible: true
  },
  {
    name: 'testSetLimitsForcibleGrid0242', number: '0242',
    limits: { minWidth: 700, maxWidth: 700 }, forcible: true
  },
  {
    name: 'testSetLimitsForcibleGrid0243', number: '0243',
    limits: { minWidth: 2000, maxWidth: 1000 }, forcible: true
  },
  {
    name: 'testSetLimitsForcibleGrid0244', number: '0244',
    limits: { maxWidth: 20000, maxHeight: 20000 }, forcible: true
  },
  {
    name: 'testSetLimitsBigGrid0300', number: '0300',
    limits: { minWidth: 1, minHeight: 1, maxWidth: 600, maxHeight: 600 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0301', number: '0301',
    limits: { minWidth: 1, minHeight: 1, maxWidth: 800, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0302', number: '0302',
    limits: { minWidth: 1, minHeight: 1, maxWidth: 1000, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0303', number: '0303',
    limits: { minWidth: 1, minHeight: 1, maxWidth: 1200, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0304', number: '0304',
    limits: { minWidth: 1, minHeight: 1, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0305', number: '0305',
    limits: { minWidth: 1, minHeight: 1, maxWidth: 1600, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0306', number: '0306',
    limits: { minWidth: 1, minHeight: 1, maxWidth: 1800, maxHeight: 1400 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0307', number: '0307',
    limits: { minWidth: 1, minHeight: 1, maxWidth: 2000, maxHeight: 1600 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0308', number: '0308',
    limits: { minWidth: 1, minHeight: 1, maxWidth: 5000, maxHeight: 3000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0309', number: '0309',
    limits: { minWidth: 1, minHeight: 1, maxWidth: 20000, maxHeight: 20000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0310', number: '0310',
    limits: { minWidth: 100, minHeight: 100, maxWidth: 600, maxHeight: 600 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0311', number: '0311',
    limits: { minWidth: 100, minHeight: 100, maxWidth: 800, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0312', number: '0312',
    limits: { minWidth: 100, minHeight: 100, maxWidth: 1000, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0313', number: '0313',
    limits: { minWidth: 100, minHeight: 100, maxWidth: 1200, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0314', number: '0314',
    limits: { minWidth: 100, minHeight: 100, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0315', number: '0315',
    limits: { minWidth: 100, minHeight: 100, maxWidth: 1600, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0316', number: '0316',
    limits: { minWidth: 100, minHeight: 100, maxWidth: 1800, maxHeight: 1400 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0317', number: '0317',
    limits: { minWidth: 100, minHeight: 100, maxWidth: 2000, maxHeight: 1600 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0318', number: '0318',
    limits: { minWidth: 100, minHeight: 100, maxWidth: 5000, maxHeight: 3000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0319', number: '0319',
    limits: { minWidth: 100, minHeight: 100, maxWidth: 20000, maxHeight: 20000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0320', number: '0320',
    limits: { minWidth: 300, minHeight: 300, maxWidth: 600, maxHeight: 600 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0321', number: '0321',
    limits: { minWidth: 300, minHeight: 300, maxWidth: 800, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0322', number: '0322',
    limits: { minWidth: 300, minHeight: 300, maxWidth: 1000, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0323', number: '0323',
    limits: { minWidth: 300, minHeight: 300, maxWidth: 1200, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0324', number: '0324',
    limits: { minWidth: 300, minHeight: 300, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0325', number: '0325',
    limits: { minWidth: 300, minHeight: 300, maxWidth: 1600, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0326', number: '0326',
    limits: { minWidth: 300, minHeight: 300, maxWidth: 1800, maxHeight: 1400 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0327', number: '0327',
    limits: { minWidth: 300, minHeight: 300, maxWidth: 2000, maxHeight: 1600 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0328', number: '0328',
    limits: { minWidth: 300, minHeight: 300, maxWidth: 5000, maxHeight: 3000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0329', number: '0329',
    limits: { minWidth: 300, minHeight: 300, maxWidth: 20000, maxHeight: 20000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0330', number: '0330',
    limits: { minWidth: 500, minHeight: 500, maxWidth: 600, maxHeight: 600 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0331', number: '0331',
    limits: { minWidth: 500, minHeight: 500, maxWidth: 800, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0332', number: '0332',
    limits: { minWidth: 500, minHeight: 500, maxWidth: 1000, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0333', number: '0333',
    limits: { minWidth: 500, minHeight: 500, maxWidth: 1200, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0334', number: '0334',
    limits: { minWidth: 500, minHeight: 500, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0335', number: '0335',
    limits: { minWidth: 500, minHeight: 500, maxWidth: 1600, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0336', number: '0336',
    limits: { minWidth: 500, minHeight: 500, maxWidth: 1800, maxHeight: 1400 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0337', number: '0337',
    limits: { minWidth: 500, minHeight: 500, maxWidth: 2000, maxHeight: 1600 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0338', number: '0338',
    limits: { minWidth: 500, minHeight: 500, maxWidth: 5000, maxHeight: 3000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0339', number: '0339',
    limits: { minWidth: 500, minHeight: 500, maxWidth: 20000, maxHeight: 20000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0340', number: '0340',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 600, maxHeight: 600 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0341', number: '0341',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 800, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0342', number: '0342',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 1000, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0343', number: '0343',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 1200, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0344', number: '0344',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0345', number: '0345',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 1600, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0346', number: '0346',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 1800, maxHeight: 1400 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0347', number: '0347',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 2000, maxHeight: 1600 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0348', number: '0348',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 5000, maxHeight: 3000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0349', number: '0349',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 20000, maxHeight: 20000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0350', number: '0350',
    limits: { minWidth: 700, minHeight: 600, maxWidth: 600, maxHeight: 600 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0351', number: '0351',
    limits: { minWidth: 700, minHeight: 600, maxWidth: 800, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0352', number: '0352',
    limits: { minWidth: 700, minHeight: 600, maxWidth: 1000, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0353', number: '0353',
    limits: { minWidth: 700, minHeight: 600, maxWidth: 1200, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0354', number: '0354',
    limits: { minWidth: 700, minHeight: 600, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0355', number: '0355',
    limits: { minWidth: 700, minHeight: 600, maxWidth: 1600, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0356', number: '0356',
    limits: { minWidth: 700, minHeight: 600, maxWidth: 1800, maxHeight: 1400 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0357', number: '0357',
    limits: { minWidth: 700, minHeight: 600, maxWidth: 2000, maxHeight: 1600 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0358', number: '0358',
    limits: { minWidth: 700, minHeight: 600, maxWidth: 5000, maxHeight: 3000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0359', number: '0359',
    limits: { minWidth: 700, minHeight: 600, maxWidth: 20000, maxHeight: 20000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0360', number: '0360',
    limits: { minWidth: 800, minHeight: 700, maxWidth: 600, maxHeight: 600 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0361', number: '0361',
    limits: { minWidth: 800, minHeight: 700, maxWidth: 800, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0362', number: '0362',
    limits: { minWidth: 800, minHeight: 700, maxWidth: 1000, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0363', number: '0363',
    limits: { minWidth: 800, minHeight: 700, maxWidth: 1200, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0364', number: '0364',
    limits: { minWidth: 800, minHeight: 700, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0365', number: '0365',
    limits: { minWidth: 800, minHeight: 700, maxWidth: 1600, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0366', number: '0366',
    limits: { minWidth: 800, minHeight: 700, maxWidth: 1800, maxHeight: 1400 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0367', number: '0367',
    limits: { minWidth: 800, minHeight: 700, maxWidth: 2000, maxHeight: 1600 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0368', number: '0368',
    limits: { minWidth: 800, minHeight: 700, maxWidth: 5000, maxHeight: 3000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0369', number: '0369',
    limits: { minWidth: 800, minHeight: 700, maxWidth: 20000, maxHeight: 20000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0370', number: '0370',
    limits: { minWidth: 900, minHeight: 800, maxWidth: 600, maxHeight: 600 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0371', number: '0371',
    limits: { minWidth: 900, minHeight: 800, maxWidth: 800, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0372', number: '0372',
    limits: { minWidth: 900, minHeight: 800, maxWidth: 1000, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0373', number: '0373',
    limits: { minWidth: 900, minHeight: 800, maxWidth: 1200, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0374', number: '0374',
    limits: { minWidth: 900, minHeight: 800, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0375', number: '0375',
    limits: { minWidth: 900, minHeight: 800, maxWidth: 1600, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0376', number: '0376',
    limits: { minWidth: 900, minHeight: 800, maxWidth: 1800, maxHeight: 1400 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0377', number: '0377',
    limits: { minWidth: 900, minHeight: 800, maxWidth: 2000, maxHeight: 1600 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0378', number: '0378',
    limits: { minWidth: 900, minHeight: 800, maxWidth: 5000, maxHeight: 3000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0379', number: '0379',
    limits: { minWidth: 900, minHeight: 800, maxWidth: 20000, maxHeight: 20000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0380', number: '0380',
    limits: { minWidth: 1000, minHeight: 900, maxWidth: 600, maxHeight: 600 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0381', number: '0381',
    limits: { minWidth: 1000, minHeight: 900, maxWidth: 800, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0382', number: '0382',
    limits: { minWidth: 1000, minHeight: 900, maxWidth: 1000, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0383', number: '0383',
    limits: { minWidth: 1000, minHeight: 900, maxWidth: 1200, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0384', number: '0384',
    limits: { minWidth: 1000, minHeight: 900, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0385', number: '0385',
    limits: { minWidth: 1000, minHeight: 900, maxWidth: 1600, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0386', number: '0386',
    limits: { minWidth: 1000, minHeight: 900, maxWidth: 1800, maxHeight: 1400 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0387', number: '0387',
    limits: { minWidth: 1000, minHeight: 900, maxWidth: 2000, maxHeight: 1600 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0388', number: '0388',
    limits: { minWidth: 1000, minHeight: 900, maxWidth: 5000, maxHeight: 3000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0389', number: '0389',
    limits: { minWidth: 1000, minHeight: 900, maxWidth: 20000, maxHeight: 20000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0390', number: '0390',
    limits: { minWidth: 1200, minHeight: 1000, maxWidth: 600, maxHeight: 600 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0391', number: '0391',
    limits: { minWidth: 1200, minHeight: 1000, maxWidth: 800, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0392', number: '0392',
    limits: { minWidth: 1200, minHeight: 1000, maxWidth: 1000, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0393', number: '0393',
    limits: { minWidth: 1200, minHeight: 1000, maxWidth: 1200, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0394', number: '0394',
    limits: { minWidth: 1200, minHeight: 1000, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0395', number: '0395',
    limits: { minWidth: 1200, minHeight: 1000, maxWidth: 1600, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0396', number: '0396',
    limits: { minWidth: 1200, minHeight: 1000, maxWidth: 1800, maxHeight: 1400 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0397', number: '0397',
    limits: { minWidth: 1200, minHeight: 1000, maxWidth: 2000, maxHeight: 1600 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0398', number: '0398',
    limits: { minWidth: 1200, minHeight: 1000, maxWidth: 5000, maxHeight: 3000 }, forcible: false
  },
  {
    name: 'testSetLimitsBigGrid0399', number: '0399',
    limits: { minWidth: 1200, minHeight: 1000, maxWidth: 20000, maxHeight: 20000 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthBva0400', number: '0400',
    limits: { minWidth: 599, minHeight: 500, maxWidth: 1499, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthBva0401', number: '0401',
    limits: { minWidth: 599, minHeight: 500, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthBva0402', number: '0402',
    limits: { minWidth: 599, minHeight: 500, maxWidth: 1501, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthBva0403', number: '0403',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 1499, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthBva0404', number: '0404',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthBva0405', number: '0405',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 1501, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthBva0406', number: '0406',
    limits: { minWidth: 601, minHeight: 500, maxWidth: 1499, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthBva0407', number: '0407',
    limits: { minWidth: 601, minHeight: 500, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthBva0408', number: '0408',
    limits: { minWidth: 601, minHeight: 500, maxWidth: 1501, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightBva0409', number: '0409',
    limits: { minWidth: 600, minHeight: 499, maxWidth: 1500, maxHeight: 999 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightBva0410', number: '0410',
    limits: { minWidth: 600, minHeight: 499, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightBva0411', number: '0411',
    limits: { minWidth: 600, minHeight: 499, maxWidth: 1500, maxHeight: 1001 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightBva0412', number: '0412',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 999 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightBva0413', number: '0413',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightBva0414', number: '0414',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 1001 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightBva0415', number: '0415',
    limits: { minWidth: 600, minHeight: 501, maxWidth: 1500, maxHeight: 999 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightBva0416', number: '0416',
    limits: { minWidth: 600, minHeight: 501, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightBva0417', number: '0417',
    limits: { minWidth: 600, minHeight: 501, maxWidth: 1500, maxHeight: 1001 }, forcible: false
  },
  {
    name: 'testSetLimitsCornerBva0418', number: '0418',
    limits: { minWidth: 599, minHeight: 499, maxWidth: 1501, maxHeight: 1001 }, forcible: false
  },
  {
    name: 'testSetLimitsCornerBva0419', number: '0419',
    limits: { minWidth: 599, minHeight: 500, maxWidth: 1501, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsCornerBva0420', number: '0420',
    limits: { minWidth: 599, minHeight: 501, maxWidth: 1501, maxHeight: 999 }, forcible: false
  },
  {
    name: 'testSetLimitsCornerBva0421', number: '0421',
    limits: { minWidth: 600, minHeight: 499, maxWidth: 1500, maxHeight: 1001 }, forcible: false
  },
  {
    name: 'testSetLimitsCornerBva0422', number: '0422',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsCornerBva0423', number: '0423',
    limits: { minWidth: 600, minHeight: 501, maxWidth: 1500, maxHeight: 999 }, forcible: false
  },
  {
    name: 'testSetLimitsCornerBva0424', number: '0424',
    limits: { minWidth: 601, minHeight: 499, maxWidth: 1499, maxHeight: 1001 }, forcible: false
  },
  {
    name: 'testSetLimitsCornerBva0425', number: '0425',
    limits: { minWidth: 601, minHeight: 500, maxWidth: 1499, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsCornerBva0426', number: '0426',
    limits: { minWidth: 601, minHeight: 501, maxWidth: 1499, maxHeight: 999 }, forcible: false
  },
  {
    name: 'testSetLimitsTriple0427', number: '0427',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testSetLimitsTriple0428', number: '0428',
    limits: { minWidth: 600, minHeight: 500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsTriple0429', number: '0429',
    limits: { minWidth: 600, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsTriple0430', number: '0430',
    limits: { minHeight: 500, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsSpecial0431', number: '0431',
    limits: { minWidth: -0, maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testSetLimitsSpecial0432', number: '0432',
    limits: { maxWidth: Number.MIN_VALUE }, forcible: false
  },
  {
    name: 'testSetLimitsSpecial0433', number: '0433',
    limits: { maxWidth: Number.EPSILON }, forcible: false
  },
  {
    name: 'testSetLimitsSpecial0434', number: '0434',
    limits: { maxWidth: Number.MIN_SAFE_INTEGER }, forcible: false
  },
  {
    name: 'testSetLimitsSpecial0435', number: '0435',
    limits: { maxWidth: Number.MAX_VALUE }, forcible: false
  },
  {
    name: 'testSetLimitsSpecial0436', number: '0436',
    limits: { minWidth: Number.NEGATIVE_INFINITY }, forcible: false
  },
  {
    name: 'testSetLimitsForcibleBva0437', number: '0437',
    limits: { minWidth: 2000, maxWidth: 1000 }, forcible: true
  },
  {
    name: 'testSetLimitsForcibleBva0438', number: '0438',
    limits: { minWidth: -1, minHeight: -1 }, forcible: true
  },
  {
    name: 'testSetLimitsForcibleBva0439', number: '0439',
    limits: { minWidth: 0, maxWidth: 0 }, forcible: true
  },
  {
    name: 'testSetLimitsForcibleBva0440', number: '0440',
    limits: { maxWidth: Number.NaN, maxHeight: Number.NaN }, forcible: true
  },
  {
    name: 'testSetLimitsWidthEq0500', number: '0500',
    limits: { minWidth: 1, maxWidth: 600 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthEq0501', number: '0501',
    limits: { minWidth: 100, maxWidth: 600 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthEq0502', number: '0502',
    limits: { minWidth: 300, maxWidth: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthEq0503', number: '0503',
    limits: { minWidth: 599, maxWidth: 1200 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthEq0504', number: '0504',
    limits: { minWidth: 600, maxWidth: 1200 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthEq0505', number: '0505',
    limits: { minWidth: 601, maxWidth: 1200 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthEq0506', number: '0506',
    limits: { minWidth: 800, maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthEq0507', number: '0507',
    limits: { minWidth: 1200, maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthEq0508', number: '0508',
    limits: { minWidth: 1, maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthEq0509', number: '0509',
    limits: { minWidth: 600, maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthEq0510', number: '0510',
    limits: { minWidth: 601, maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthEq0511', number: '0511',
    limits: { minWidth: 800, maxWidth: 2000 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthEq0512', number: '0512',
    limits: { minWidth: 1, maxWidth: 20000 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthEq0513', number: '0513',
    limits: { minWidth: 600, maxWidth: 20000 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthEq0514', number: '0514',
    limits: { minWidth: 1200, maxWidth: 20000 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthEq0515', number: '0515',
    limits: { minWidth: 300, maxWidth: 600 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthEq0516', number: '0516',
    limits: { minWidth: 599, maxWidth: 600 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthEq0517', number: '0517',
    limits: { minWidth: 601, maxWidth: 800 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthEq0518', number: '0518',
    limits: { minWidth: 800, maxWidth: 800 }, forcible: false
  },
  {
    name: 'testSetLimitsWidthEq0519', number: '0519',
    limits: { minWidth: 1200, maxWidth: 1200 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightEq0520', number: '0520',
    limits: { minHeight: 1, maxHeight: 500 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightEq0521', number: '0521',
    limits: { minHeight: 100, maxHeight: 500 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightEq0522', number: '0522',
    limits: { minHeight: 300, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightEq0523', number: '0523',
    limits: { minHeight: 499, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightEq0524', number: '0524',
    limits: { minHeight: 500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightEq0525', number: '0525',
    limits: { minHeight: 501, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightEq0526', number: '0526',
    limits: { minHeight: 600, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightEq0527', number: '0527',
    limits: { minHeight: 800, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightEq0528', number: '0528',
    limits: { minHeight: 1, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightEq0529', number: '0529',
    limits: { minHeight: 500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightEq0530', number: '0530',
    limits: { minHeight: 501, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightEq0531', number: '0531',
    limits: { minHeight: 600, maxHeight: 1500 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightEq0532', number: '0532',
    limits: { minHeight: 1, maxHeight: 20000 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightEq0533', number: '0533',
    limits: { minHeight: 500, maxHeight: 20000 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightEq0534', number: '0534',
    limits: { minHeight: 1000, maxHeight: 20000 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightEq0535', number: '0535',
    limits: { minHeight: 300, maxHeight: 500 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightEq0536', number: '0536',
    limits: { minHeight: 499, maxHeight: 500 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightEq0537', number: '0537',
    limits: { minHeight: 501, maxHeight: 600 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightEq0538', number: '0538',
    limits: { minHeight: 600, maxHeight: 600 }, forcible: false
  },
  {
    name: 'testSetLimitsHeightEq0539', number: '0539',
    limits: { minHeight: 1000, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsAspect0540', number: '0540',
    limits: { minWidth: 1, minHeight: 1000, maxWidth: 1, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsAspect0541', number: '0541',
    limits: { minWidth: 1000, minHeight: 1, maxWidth: 1000, maxHeight: 1 }, forcible: false
  },
  {
    name: 'testSetLimitsAspect0542', number: '0542',
    limits: { minWidth: 1, minHeight: 1, maxWidth: 20000, maxHeight: 1 }, forcible: false
  },
  {
    name: 'testSetLimitsAspect0543', number: '0543',
    limits: { minWidth: 1, minHeight: 1, maxWidth: 1, maxHeight: 20000 }, forcible: false
  },
  {
    name: 'testSetLimitsAspect0544', number: '0544',
    limits: { minWidth: 599, minHeight: 500, maxWidth: 600, maxHeight: 501 }, forcible: false
  },
  {
    name: 'testSetLimitsAspect0545', number: '0545',
    limits: { minWidth: 1499, minHeight: 999, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsAspect0546', number: '0546',
    limits: { minWidth: 1, minHeight: 500, maxWidth: 1500, maxHeight: 500 }, forcible: false
  },
  {
    name: 'testSetLimitsAspect0547', number: '0547',
    limits: { minWidth: 600, minHeight: 1, maxWidth: 600, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsAspect0548', number: '0548',
    limits: { minWidth: 1, minHeight: 1, maxWidth: 1, maxHeight: 1 }, forcible: false
  },
  {
    name: 'testSetLimitsAspect0549', number: '0549',
    limits: { minWidth: 599, minHeight: 499, maxWidth: 601, maxHeight: 501 }, forcible: false
  },
  {
    name: 'testSetLimitsPrecision0550', number: '0550',
    limits: { maxWidth: 0.1, maxHeight: 0.1 }, forcible: false
  },
  {
    name: 'testSetLimitsPrecision0551', number: '0551',
    limits: { maxWidth: 0.333, maxHeight: 0.333 }, forcible: false
  },
  {
    name: 'testSetLimitsPrecision0552', number: '0552',
    limits: { maxWidth: 1e-10, maxHeight: 1e-10 }, forcible: false
  },
  {
    name: 'testSetLimitsPrecision0553', number: '0553',
    limits: { maxWidth: 1e10, maxHeight: 1e10 }, forcible: false
  },
  {
    name: 'testSetLimitsPrecision0554', number: '0554',
    limits: { maxWidth: 2147483648, maxHeight: 2147483648 }, forcible: false
  },
  {
    name: 'testSetLimitsPrecision0555', number: '0555',
    limits: { maxWidth: 4294967296, maxHeight: 4294967296 }, forcible: false
  },
  {
    name: 'testSetLimitsPrecision0556', number: '0556',
    limits: { maxWidth: 9007199254740992, maxHeight: 9007199254740992 }, forcible: false
  },
  {
    name: 'testSetLimitsPrecision0557', number: '0557',
    limits: { maxWidth: -2147483648, maxHeight: -2147483648 }, forcible: false
  },
  {
    name: 'testSetLimitsPrecision0558', number: '0558',
    limits: { maxWidth: -9007199254740992, maxHeight: -9007199254740992 }, forcible: false
  },
  {
    name: 'testSetLimitsPrecision0559', number: '0559',
    limits: { maxWidth: 9007199254740991, maxHeight: 9007199254740991 }, forcible: false
  },
  {
    name: 'testSetLimitsPresence0560', number: '0560',
    limits: { minWidth: 600 }, forcible: false
  },
  {
    name: 'testSetLimitsPresence0561', number: '0561',
    limits: { minHeight: 500 }, forcible: false
  },
  {
    name: 'testSetLimitsPresence0562', number: '0562',
    limits: { minWidth: 600, minHeight: 500 }, forcible: false
  },
  {
    name: 'testSetLimitsPresence0563', number: '0563',
    limits: { maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testSetLimitsPresence0564', number: '0564',
    limits: { minWidth: 600, maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testSetLimitsPresence0565', number: '0565',
    limits: { minHeight: 500, maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testSetLimitsPresence0566', number: '0566',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testSetLimitsPresence0567', number: '0567',
    limits: { maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsPresence0568', number: '0568',
    limits: { minWidth: 600, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsPresence0569', number: '0569',
    limits: { minHeight: 500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsPresence0570', number: '0570',
    limits: { minWidth: 600, minHeight: 500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsPresence0571', number: '0571',
    limits: { maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsPresence0572', number: '0572',
    limits: { minWidth: 600, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsPresence0573', number: '0573',
    limits: { minHeight: 500, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsPresence0574', number: '0574',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioPair0575', number: '0575',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioPair0576', number: '0576',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 900, maxHeight: 600 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioPair0577', number: '0577',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 1200, maxHeight: 600 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioPair0578', number: '0578',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 700 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioPair0579', number: '0579',
    limits: { minWidth: 700, minHeight: 500, maxWidth: 1050, maxHeight: 600 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioPair0580', number: '0580',
    limits: { minWidth: 700, minHeight: 500, maxWidth: 1200, maxHeight: 700 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioPair0581', number: '0581',
    limits: { minWidth: 800, minHeight: 500, maxWidth: 1200, maxHeight: 600 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioPair0582', number: '0582',
    limits: { minWidth: 800, minHeight: 500, maxWidth: 1400, maxHeight: 700 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioPair0583', number: '0583',
    limits: { minWidth: 900, minHeight: 600, maxWidth: 1500, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioPair0584', number: '0584',
    limits: { minWidth: 900, minHeight: 600, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioPair0585', number: '0585',
    limits: { minWidth: 600, minHeight: 900, maxWidth: 700, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioPair0586', number: '0586',
    limits: { minWidth: 650, minHeight: 900, maxWidth: 800, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioPair0587', number: '0587',
    limits: { minWidth: 700, minHeight: 900, maxWidth: 900, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioPair0588', number: '0588',
    limits: { minWidth: 600, minHeight: 700, maxWidth: 900, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioPair0589', number: '0589',
    limits: { minWidth: 600, minHeight: 800, maxWidth: 1000, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioPair0590', number: '0590',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 600, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioPair0591', number: '0591',
    limits: { minWidth: 750, minHeight: 500, maxWidth: 750, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioPair0592', number: '0592',
    limits: { minWidth: 1000, minHeight: 500, maxWidth: 1000, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioPair0593', number: '0593',
    limits: { minWidth: 900, minHeight: 500, maxWidth: 1200, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioPair0594', number: '0594',
    limits: { minWidth: 600, minHeight: 600, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsPrecision20595', number: '0595',
    limits: { maxWidth: 1500.5, maxHeight: 1500.5 }, forcible: false
  },
  {
    name: 'testSetLimitsPrecision20596', number: '0596',
    limits: { maxWidth: 1500.999, maxHeight: 1500.999 }, forcible: false
  },
  {
    name: 'testSetLimitsPrecision20597', number: '0597',
    limits: { maxWidth: 1499.5, maxHeight: 1499.5 }, forcible: false
  },
  {
    name: 'testSetLimitsPrecision20598', number: '0598',
    limits: { maxWidth: 0.1, maxHeight: 0.1 }, forcible: false
  },
  {
    name: 'testSetLimitsPrecision20599', number: '0599',
    limits: { maxWidth: 0.5, maxHeight: 0.5 }, forcible: false
  },
  {
    name: 'testSetLimitsPrecision20600', number: '0600',
    limits: { maxWidth: 0.999, maxHeight: 0.999 }, forcible: false
  },
  {
    name: 'testSetLimitsPrecision20601', number: '0601',
    limits: { maxWidth: 0.001, maxHeight: 0.001 }, forcible: false
  },
  {
    name: 'testSetLimitsPrecision20602', number: '0602',
    limits: { maxWidth: 0.000001, maxHeight: 0.000001 }, forcible: false
  },
  {
    name: 'testSetLimitsPrecision20603', number: '0603',
    limits: { maxWidth: 800.25, maxHeight: 800.25 }, forcible: false
  },
  {
    name: 'testSetLimitsPrecision20604', number: '0604',
    limits: { maxWidth: 1500.0001, maxHeight: 1500.0001 }, forcible: false
  },
  {
    name: 'testSetLimitsInverted0605', number: '0605',
    limits: { minWidth: 1500, maxWidth: 600 }, forcible: false
  },
  {
    name: 'testSetLimitsInverted0606', number: '0606',
    limits: { minHeight: 1000, maxHeight: 500 }, forcible: false
  },
  {
    name: 'testSetLimitsInvertedBoth0607', number: '0607',
    limits: { minWidth: 1500, minHeight: 1000, maxWidth: 600, maxHeight: 500 }, forcible: false
  },
  {
    name: 'testSetLimitsInverted0608', number: '0608',
    limits: { minWidth: 1501, maxWidth: 600 }, forcible: false
  },
  {
    name: 'testSetLimitsInverted0609', number: '0609',
    limits: { minWidth: 1500, maxWidth: 599 }, forcible: false
  },
  {
    name: 'testSetLimitsInverted0610', number: '0610',
    limits: { minHeight: 1000, maxHeight: 499 }, forcible: false
  },
  {
    name: 'testSetLimitsInverted0611', number: '0611',
    limits: { minHeight: 1001, maxHeight: 500 }, forcible: false
  },
  {
    name: 'testSetLimitsInverted0612', number: '0612',
    limits: { minWidth: 2000, maxWidth: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsInverted0613', number: '0613',
    limits: { minHeight: 2000, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsInverted0614', number: '0614',
    limits: { minWidth: 1000, maxWidth: 2000 }, forcible: false
  },
  {
    name: 'testSetLimitsOffsetW0620', number: '0620',
    limits: { minWidth: 598, maxWidth: 1498 }, forcible: false
  },
  {
    name: 'testSetLimitsOffsetW0621', number: '0621',
    limits: { minWidth: 598, maxWidth: 1499 }, forcible: false
  },
  {
    name: 'testSetLimitsOffsetW0622', number: '0622',
    limits: { minWidth: 598, maxWidth: 1501 }, forcible: false
  },
  {
    name: 'testSetLimitsOffsetW0623', number: '0623',
    limits: { minWidth: 598, maxWidth: 1502 }, forcible: false
  },
  {
    name: 'testSetLimitsOffsetW0624', number: '0624',
    limits: { minWidth: 599, maxWidth: 1498 }, forcible: false
  },
  {
    name: 'testSetLimitsOffsetW0625', number: '0625',
    limits: { minWidth: 599, maxWidth: 1499 }, forcible: false
  },
  {
    name: 'testSetLimitsOffsetW0626', number: '0626',
    limits: { minWidth: 599, maxWidth: 1501 }, forcible: false
  },
  {
    name: 'testSetLimitsOffsetW0627', number: '0627',
    limits: { minWidth: 599, maxWidth: 1502 }, forcible: false
  },
  {
    name: 'testSetLimitsOffsetW0628', number: '0628',
    limits: { minWidth: 601, maxWidth: 1498 }, forcible: false
  },
  {
    name: 'testSetLimitsOffsetW0629', number: '0629',
    limits: { minWidth: 601, maxWidth: 1499 }, forcible: false
  },
  {
    name: 'testSetLimitsOffsetW0630', number: '0630',
    limits: { minWidth: 601, maxWidth: 1501 }, forcible: false
  },
  {
    name: 'testSetLimitsOffsetW0631', number: '0631',
    limits: { minWidth: 601, maxWidth: 1502 }, forcible: false
  },
  {
    name: 'testSetLimitsOffsetW0632', number: '0632',
    limits: { minWidth: 602, maxWidth: 1498 }, forcible: false
  },
  {
    name: 'testSetLimitsOffsetW0633', number: '0633',
    limits: { minWidth: 602, maxWidth: 1499 }, forcible: false
  },
  {
    name: 'testSetLimitsOffsetW0634', number: '0634',
    limits: { minWidth: 602, maxWidth: 1501 }, forcible: false
  },
  {
    name: 'testSetLimitsOffsetW0635', number: '0635',
    limits: { minWidth: 602, maxWidth: 1502 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioOffset0636', number: '0636',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 500 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioOffset0637', number: '0637',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 600 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioOffset0638', number: '0638',
    limits: { minWidth: 600, minHeight: 600, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioOffset0639', number: '0639',
    limits: { minWidth: 600, minHeight: 700, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioOffset0640', number: '0640',
    limits: { minWidth: 700, minHeight: 500, maxWidth: 1300, maxHeight: 600 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioOffset0641', number: '0641',
    limits: { minWidth: 700, minHeight: 600, maxWidth: 1300, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioOffset0642', number: '0642',
    limits: { minWidth: 800, minHeight: 500, maxWidth: 1200, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioOffset0643', number: '0643',
    limits: { minWidth: 800, minHeight: 600, maxWidth: 1200, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioOffset0644', number: '0644',
    limits: { minWidth: 900, minHeight: 500, maxWidth: 1100, maxHeight: 700 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioOffset0645', number: '0645',
    limits: { minWidth: 900, minHeight: 700, maxWidth: 1100, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioOffset0646', number: '0646',
    limits: { minWidth: 600, minHeight: 900, maxWidth: 1500, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioOffset0647', number: '0647',
    limits: { minWidth: 700, minHeight: 900, maxWidth: 1400, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioOffset0648', number: '0648',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 700, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioOffset0649', number: '0649',
    limits: { minWidth: 700, minHeight: 500, maxWidth: 800, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioOffset0650', number: '0650',
    limits: { minWidth: 800, minHeight: 500, maxWidth: 900, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioOffset0651', number: '0651',
    limits: { minWidth: 900, minHeight: 500, maxWidth: 1000, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioOffset0652', number: '0652',
    limits: { minWidth: 1000, minHeight: 500, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioOffset0653', number: '0653',
    limits: { minWidth: 1100, minHeight: 500, maxWidth: 1400, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioOffset0654', number: '0654',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 1200, maxHeight: 700 }, forcible: false
  },
  {
    name: 'testSetLimitsRatioOffset0655', number: '0655',
    limits: { minWidth: 900, minHeight: 800, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsCornerOffset0656', number: '0656',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 600, maxHeight: 500 }, forcible: false
  },
  {
    name: 'testSetLimitsCornerOffset0657', number: '0657',
    limits: { minWidth: 1500, minHeight: 1000, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsCornerOffset0658', number: '0658',
    limits: { minWidth: 600, minHeight: 1000, maxWidth: 600, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsCornerOffset0659', number: '0659',
    limits: { minWidth: 1500, minHeight: 500, maxWidth: 1500, maxHeight: 500 }, forcible: false
  },
  {
    name: 'testSetLimitsCornerOffset0660', number: '0660',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 500 }, forcible: false
  },
  {
    name: 'testSetLimitsCornerOffset0661', number: '0661',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 600, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsCornerOffset0662', number: '0662',
    limits: { minWidth: 1500, minHeight: 500, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsCornerOffset0663', number: '0663',
    limits: { minWidth: 600, minHeight: 1000, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetLimitsCornerOffset0664', number: '0664',
    limits: { minWidth: 601, minHeight: 501, maxWidth: 601, maxHeight: 501 }, forcible: false
  },
  {
    name: 'testSetLimitsCornerOffset0665', number: '0665',
    limits: { minWidth: 1499, minHeight: 999, maxWidth: 1499, maxHeight: 999 }, forcible: false
  },
  {
    name: 'testSetLimitsCornerOffset0666', number: '0666',
    limits: { minWidth: 599, minHeight: 499, maxWidth: 599, maxHeight: 499 }, forcible: false
  },
  {
    name: 'testSetLimitsCornerOffset0667', number: '0667',
    limits: { minWidth: 1501, minHeight: 1001, maxWidth: 1501, maxHeight: 1001 }, forcible: false
  },
  {
    name: 'testSetLimitsCornerOffset0668', number: '0668',
    limits: { minWidth: 600, minHeight: 750, maxWidth: 1500, maxHeight: 750 }, forcible: false
  },
  {
    name: 'testSetLimitsCornerOffset0669', number: '0669',
    limits: { minWidth: 1050, minHeight: 500, maxWidth: 1050, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetMinWidthSweep0670', number: '0670',
    limits: { minWidth: 1 }, forcible: false
  },
  {
    name: 'testSetMinWidthSweep0671', number: '0671',
    limits: { minWidth: 100 }, forcible: false
  },
  {
    name: 'testSetMinWidthSweep0672', number: '0672',
    limits: { minWidth: 299 }, forcible: false
  },
  {
    name: 'testSetMinWidthSweep0673', number: '0673',
    limits: { minWidth: 301 }, forcible: false
  },
  {
    name: 'testSetMinWidthSweep0674', number: '0674',
    limits: { minWidth: 600 }, forcible: false
  },
  {
    name: 'testSetMinWidthSweep0675', number: '0675',
    limits: { minWidth: 601 }, forcible: false
  },
  {
    name: 'testSetMinWidthSweep0676', number: '0676',
    limits: { minWidth: 1200 }, forcible: false
  },
  {
    name: 'testSetMinWidthSweep0677', number: '0677',
    limits: { minWidth: 1499 }, forcible: false
  },
  {
    name: 'testSetMinWidthSweep0678', number: '0678',
    limits: { minWidth: 1500 }, forcible: false
  },
  {
    name: 'testSetMinWidthSweep0679', number: '0679',
    limits: { minWidth: 2000 }, forcible: false
  },
  {
    name: 'testSetMaxWidthSweep0680', number: '0680',
    limits: { maxWidth: 600 }, forcible: false
  },
  {
    name: 'testSetMaxWidthSweep0681', number: '0681',
    limits: { maxWidth: 601 }, forcible: false
  },
  {
    name: 'testSetMaxWidthSweep0682', number: '0682',
    limits: { maxWidth: 899 }, forcible: false
  },
  {
    name: 'testSetMaxWidthSweep0683', number: '0683',
    limits: { maxWidth: 901 }, forcible: false
  },
  {
    name: 'testSetMaxWidthSweep0684', number: '0684',
    limits: { maxWidth: 1000 }, forcible: false
  },
  {
    name: 'testSetMaxWidthSweep0685', number: '0685',
    limits: { maxWidth: 1499 }, forcible: false
  },
  {
    name: 'testSetMaxWidthSweep0686', number: '0686',
    limits: { maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testSetMaxWidthSweep0687', number: '0687',
    limits: { maxWidth: 1501 }, forcible: false
  },
  {
    name: 'testSetMaxWidthSweep0688', number: '0688',
    limits: { maxWidth: 2000 }, forcible: false
  },
  {
    name: 'testSetMaxWidthSweep0689', number: '0689',
    limits: { maxWidth: 20000 }, forcible: false
  },
  {
    name: 'testSetMinHeightSweep0690', number: '0690',
    limits: { minHeight: 1 }, forcible: false
  },
  {
    name: 'testSetMinHeightSweep0691', number: '0691',
    limits: { minHeight: 100 }, forcible: false
  },
  {
    name: 'testSetMinHeightSweep0692', number: '0692',
    limits: { minHeight: 249 }, forcible: false
  },
  {
    name: 'testSetMinHeightSweep0693', number: '0693',
    limits: { minHeight: 251 }, forcible: false
  },
  {
    name: 'testSetMinHeightSweep0694', number: '0694',
    limits: { minHeight: 500 }, forcible: false
  },
  {
    name: 'testSetMinHeightSweep0695', number: '0695',
    limits: { minHeight: 501 }, forcible: false
  },
  {
    name: 'testSetMinHeightSweep0696', number: '0696',
    limits: { minHeight: 800 }, forcible: false
  },
  {
    name: 'testSetMinHeightSweep0697', number: '0697',
    limits: { minHeight: 999 }, forcible: false
  },
  {
    name: 'testSetMinHeightSweep0698', number: '0698',
    limits: { minHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetMinHeightSweep0699', number: '0699',
    limits: { minHeight: 2000 }, forcible: false
  },
  {
    name: 'testSetMaxHeightSweep0700', number: '0700',
    limits: { maxHeight: 500 }, forcible: false
  },
  {
    name: 'testSetMaxHeightSweep0701', number: '0701',
    limits: { maxHeight: 501 }, forcible: false
  },
  {
    name: 'testSetMaxHeightSweep0702', number: '0702',
    limits: { maxHeight: 749 }, forcible: false
  },
  {
    name: 'testSetMaxHeightSweep0703', number: '0703',
    limits: { maxHeight: 751 }, forcible: false
  },
  {
    name: 'testSetMaxHeightSweep0704', number: '0704',
    limits: { maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetMaxHeightSweep0705', number: '0705',
    limits: { maxHeight: 1001 }, forcible: false
  },
  {
    name: 'testSetMaxHeightSweep0706', number: '0706',
    limits: { maxHeight: 1500 }, forcible: false
  },
  {
    name: 'testSetMaxHeightSweep0707', number: '0707',
    limits: { maxHeight: 2000 }, forcible: false
  },
  {
    name: 'testSetMaxHeightSweep0708', number: '0708',
    limits: { maxHeight: 10000 }, forcible: false
  },
  {
    name: 'testSetMaxHeightSweep0709', number: '0709',
    limits: { maxHeight: Number.MAX_SAFE_INTEGER }, forcible: false
  },
  {
    name: 'testSetTriple20710', number: '0710',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testSetTriple20711', number: '0711',
    limits: { minWidth: 600, minHeight: 1000, maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testSetTriple20712', number: '0712',
    limits: { minWidth: 1500, minHeight: 500, maxWidth: 1000 }, forcible: false
  },
  {
    name: 'testSetTriple20713', number: '0713',
    limits: { minWidth: 900, minHeight: 700, maxWidth: 1200 }, forcible: false
  },
  {
    name: 'testSetTriple20714', number: '0714',
    limits: { minWidth: 601, minHeight: 501, maxWidth: 1501 }, forcible: false
  },
  {
    name: 'testSetFloat20715', number: '0715',
    limits: { minWidth: 600.5, minHeight: 500.5, maxWidth: 1500.5, maxHeight: 1000.5 }, forcible: false
  },
  {
    name: 'testSetFloat20716', number: '0716',
    limits: { minWidth: 599.9, minHeight: 499.9, maxWidth: 1499.9, maxHeight: 999.9 }, forcible: false
  },
  {
    name: 'testSetFloat20717', number: '0717',
    limits: { minWidth: 800.25, minHeight: 600.25, maxWidth: 1400.25, maxHeight: 900.25 }, forcible: false
  },
  {
    name: 'testSetFloat20718', number: '0718',
    limits: { minWidth: 1499.75, minHeight: 999.75, maxWidth: 1500.25, maxHeight: 1000.25 }, forcible: false
  },
  {
    name: 'testSetFloat20719', number: '0719',
    limits: { minWidth: 0.5, minHeight: 0.5, maxWidth: 1.5, maxHeight: 1.5 }, forcible: false
  },
  {
    name: 'testSetCornerGrid0720', number: '0720',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 600, maxHeight: 500 }, forcible: false
  },
  {
    name: 'testSetCornerGrid0721', number: '0721',
    limits: { minWidth: 1500, minHeight: 1000, maxWidth: 1500, maxHeight: 1000 }, forcible: false
