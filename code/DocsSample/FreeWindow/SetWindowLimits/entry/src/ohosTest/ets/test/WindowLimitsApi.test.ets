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
  },
  {
    name: 'testSetCornerGrid0722', number: '0722',
    limits: { minWidth: 600, minHeight: 1000, maxWidth: 600, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetCornerGrid0723', number: '0723',
    limits: { minWidth: 1500, minHeight: 500, maxWidth: 1500, maxHeight: 500 }, forcible: false
  },
  {
    name: 'testSetCornerGrid0724', number: '0724',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 500 }, forcible: false
  },
  {
    name: 'testSetCornerGrid0725', number: '0725',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 600, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetCornerGrid0726', number: '0726',
    limits: { minWidth: 1500, minHeight: 500, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetCornerGrid0727', number: '0727',
    limits: { minWidth: 600, minHeight: 1000, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetCornerGrid0728', number: '0728',
    limits: { minWidth: 601, minHeight: 501, maxWidth: 601, maxHeight: 501 }, forcible: false
  },
  {
    name: 'testSetCornerGrid0729', number: '0729',
    limits: { minWidth: 1499, minHeight: 999, maxWidth: 1499, maxHeight: 999 }, forcible: false
  },
  {
    name: 'testSetCornerGrid0730', number: '0730',
    limits: { minWidth: 599, minHeight: 499, maxWidth: 1501, maxHeight: 1001 }, forcible: false
  },
  {
    name: 'testSetCornerGrid0731', number: '0731',
    limits: { minWidth: 1501, minHeight: 1001, maxWidth: 599, maxHeight: 499 }, forcible: false
  },
  {
    name: 'testSetCornerGrid0732', number: '0732',
    limits: { minWidth: 600, minHeight: 750, maxWidth: 1500, maxHeight: 750 }, forcible: false
  },
  {
    name: 'testSetCornerGrid0733', number: '0733',
    limits: { minWidth: 1050, minHeight: 500, maxWidth: 1050, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetCornerGrid0734', number: '0734',
    limits: { minWidth: 750, minHeight: 500, maxWidth: 1350, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetCornerGrid0735', number: '0735',
    limits: { minWidth: 600, minHeight: 600, maxWidth: 1500, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testSetCornerGrid0736', number: '0736',
    limits: { minWidth: 900, minHeight: 500, maxWidth: 900, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetCornerGrid0737', number: '0737',
    limits: { minWidth: 1000, minHeight: 600, maxWidth: 1400, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testSetCornerGrid0738', number: '0738',
    limits: { minWidth: 700, minHeight: 900, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetCornerGrid0739', number: '0739',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 800, maxHeight: 600 }, forcible: false
  },
  {
    name: 'testSetBulk0740', number: '0740',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 800, maxHeight: 600 }, forcible: true
  },
  {
    name: 'testSetBulk0741', number: '0741',
    limits: { minWidth: 690, minHeight: 500, maxWidth: 990, maxHeight: 650 }, forcible: false
  },
  {
    name: 'testSetBulk0742', number: '0742',
    limits: { minWidth: 780, minHeight: 500, maxWidth: 1180, maxHeight: 700 }, forcible: false
  },
  {
    name: 'testSetBulk0743', number: '0743',
    limits: { minWidth: 870, minHeight: 500, maxWidth: 1370, maxHeight: 750 }, forcible: false
  },
  {
    name: 'testSetBulk0744', number: '0744',
    limits: { minWidth: 960, minHeight: 500, maxWidth: 1560, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testSetBulk0745', number: '0745',
    limits: { minWidth: 1050, minHeight: 500, maxWidth: 1250, maxHeight: 850 }, forcible: false
  },
  {
    name: 'testSetBulk0746', number: '0746',
    limits: { minWidth: 1140, minHeight: 500, maxWidth: 1440, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testSetBulk0747', number: '0747',
    limits: { minWidth: 1230, minHeight: 500, maxWidth: 1630, maxHeight: 600 }, forcible: false
  },
  {
    name: 'testSetBulk0748', number: '0748',
    limits: { minWidth: 1320, minHeight: 500, maxWidth: 1820, maxHeight: 650 }, forcible: false
  },
  {
    name: 'testSetBulk0749', number: '0749',
    limits: { minWidth: 1410, minHeight: 500, maxWidth: 2010, maxHeight: 700 }, forcible: false
  },
  {
    name: 'testSetBulk0750', number: '0750',
    limits: { minWidth: 600, minHeight: 550, maxWidth: 800, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testSetBulk0751', number: '0751',
    limits: { minWidth: 690, minHeight: 550, maxWidth: 990, maxHeight: 850 }, forcible: false
  },
  {
    name: 'testSetBulk0752', number: '0752',
    limits: { minWidth: 780, minHeight: 550, maxWidth: 1180, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testSetBulk0753', number: '0753',
    limits: { minWidth: 870, minHeight: 550, maxWidth: 1370, maxHeight: 950 }, forcible: false
  },
  {
    name: 'testSetBulk0754', number: '0754',
    limits: { minWidth: 960, minHeight: 550, maxWidth: 1560, maxHeight: 650 }, forcible: false
  },
  {
    name: 'testSetBulk0755', number: '0755',
    limits: { minWidth: 1050, minHeight: 550, maxWidth: 1250, maxHeight: 700 }, forcible: false
  },
  {
    name: 'testSetBulk0756', number: '0756',
    limits: { minWidth: 1140, minHeight: 550, maxWidth: 1440, maxHeight: 750 }, forcible: false
  },
  {
    name: 'testSetBulk0757', number: '0757',
    limits: { minWidth: 1230, minHeight: 550, maxWidth: 1630, maxHeight: 800 }, forcible: true
  },
  {
    name: 'testSetBulk0758', number: '0758',
    limits: { minWidth: 1320, minHeight: 550, maxWidth: 1820, maxHeight: 850 }, forcible: false
  },
  {
    name: 'testSetBulk0759', number: '0759',
    limits: { minWidth: 1410, minHeight: 550, maxWidth: 2010, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testSetBulk0760', number: '0760',
    limits: { minWidth: 600, minHeight: 600, maxWidth: 800, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetBulk0761', number: '0761',
    limits: { minWidth: 690, minHeight: 600, maxWidth: 990, maxHeight: 700 }, forcible: false
  },
  {
    name: 'testSetBulk0762', number: '0762',
    limits: { minWidth: 780, minHeight: 600, maxWidth: 1180, maxHeight: 750 }, forcible: false
  },
  {
    name: 'testSetBulk0763', number: '0763',
    limits: { minWidth: 870, minHeight: 600, maxWidth: 1370, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testSetBulk0764', number: '0764',
    limits: { minWidth: 960, minHeight: 600, maxWidth: 1560, maxHeight: 850 }, forcible: false
  },
  {
    name: 'testSetBulk0765', number: '0765',
    limits: { minWidth: 1050, minHeight: 600, maxWidth: 1250, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testSetBulk0766', number: '0766',
    limits: { minWidth: 1140, minHeight: 600, maxWidth: 1440, maxHeight: 950 }, forcible: false
  },
  {
    name: 'testSetBulk0767', number: '0767',
    limits: { minWidth: 1230, minHeight: 600, maxWidth: 1630, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetBulk0768', number: '0768',
    limits: { minWidth: 1320, minHeight: 600, maxWidth: 1820, maxHeight: 700 }, forcible: false
  },
  {
    name: 'testSetBulk0769', number: '0769',
    limits: { minWidth: 1410, minHeight: 600, maxWidth: 2010, maxHeight: 750 }, forcible: false
  },
  {
    name: 'testSetBulk0770', number: '0770',
    limits: { minWidth: 600, minHeight: 650, maxWidth: 800, maxHeight: 850 }, forcible: false
  },
  {
    name: 'testSetBulk0771', number: '0771',
    limits: { minWidth: 690, minHeight: 650, maxWidth: 990, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testSetBulk0772', number: '0772',
    limits: { minWidth: 780, minHeight: 650, maxWidth: 1180, maxHeight: 950 }, forcible: false
  },
  {
    name: 'testSetBulk0773', number: '0773',
    limits: { minWidth: 870, minHeight: 650, maxWidth: 1370, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetBulk0774', number: '0774',
    limits: { minWidth: 960, minHeight: 650, maxWidth: 1560, maxHeight: 1050 }, forcible: true
  },
  {
    name: 'testSetBulk0775', number: '0775',
    limits: { minWidth: 1050, minHeight: 650, maxWidth: 1250, maxHeight: 750 }, forcible: false
  },
  {
    name: 'testSetBulk0776', number: '0776',
    limits: { minWidth: 1140, minHeight: 650, maxWidth: 1440, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testSetBulk0777', number: '0777',
    limits: { minWidth: 1230, minHeight: 650, maxWidth: 1630, maxHeight: 850 }, forcible: false
  },
  {
    name: 'testSetBulk0778', number: '0778',
    limits: { minWidth: 1320, minHeight: 650, maxWidth: 1820, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testSetBulk0779', number: '0779',
    limits: { minWidth: 1410, minHeight: 650, maxWidth: 2010, maxHeight: 950 }, forcible: false
  },
  {
    name: 'testSetBulk0780', number: '0780',
    limits: { minWidth: 600, minHeight: 700, maxWidth: 800, maxHeight: 1050 }, forcible: false
  },
  {
    name: 'testSetBulk0781', number: '0781',
    limits: { minWidth: 690, minHeight: 700, maxWidth: 990, maxHeight: 1100 }, forcible: false
  },
  {
    name: 'testSetBulk0782', number: '0782',
    limits: { minWidth: 780, minHeight: 700, maxWidth: 1180, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testSetBulk0783', number: '0783',
    limits: { minWidth: 870, minHeight: 700, maxWidth: 1370, maxHeight: 850 }, forcible: false
  },
  {
    name: 'testSetBulk0784', number: '0784',
    limits: { minWidth: 960, minHeight: 700, maxWidth: 1560, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testSetBulk0785', number: '0785',
    limits: { minWidth: 1050, minHeight: 700, maxWidth: 1250, maxHeight: 950 }, forcible: false
  },
  {
    name: 'testSetBulk0786', number: '0786',
    limits: { minWidth: 1140, minHeight: 700, maxWidth: 1440, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetBulk0787', number: '0787',
    limits: { minWidth: 1230, minHeight: 700, maxWidth: 1630, maxHeight: 1050 }, forcible: false
  },
  {
    name: 'testSetBulk0788', number: '0788',
    limits: { minWidth: 1320, minHeight: 700, maxWidth: 1820, maxHeight: 1100 }, forcible: false
  },
  {
    name: 'testSetBulk0789', number: '0789',
    limits: { minWidth: 1410, minHeight: 700, maxWidth: 2010, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testSetBulk0790', number: '0790',
    limits: { minWidth: 600, minHeight: 750, maxWidth: 800, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testSetBulk0791', number: '0791',
    limits: { minWidth: 690, minHeight: 750, maxWidth: 990, maxHeight: 950 }, forcible: true
  },
  {
    name: 'testSetBulk0792', number: '0792',
    limits: { minWidth: 780, minHeight: 750, maxWidth: 1180, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetBulk0793', number: '0793',
    limits: { minWidth: 870, minHeight: 750, maxWidth: 1370, maxHeight: 1050 }, forcible: false
  },
  {
    name: 'testSetBulk0794', number: '0794',
    limits: { minWidth: 960, minHeight: 750, maxWidth: 1560, maxHeight: 1100 }, forcible: false
  },
  {
    name: 'testSetBulk0795', number: '0795',
    limits: { minWidth: 1050, minHeight: 750, maxWidth: 1250, maxHeight: 1150 }, forcible: false
  },
  {
    name: 'testSetBulk0796', number: '0796',
    limits: { minWidth: 1140, minHeight: 750, maxWidth: 1440, maxHeight: 850 }, forcible: false
  },
  {
    name: 'testSetBulk0797', number: '0797',
    limits: { minWidth: 1230, minHeight: 750, maxWidth: 1630, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testSetBulk0798', number: '0798',
    limits: { minWidth: 1320, minHeight: 750, maxWidth: 1820, maxHeight: 950 }, forcible: false
  },
  {
    name: 'testSetBulk0799', number: '0799',
    limits: { minWidth: 1410, minHeight: 750, maxWidth: 2010, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetBulk0800', number: '0800',
    limits: { minWidth: 600, minHeight: 800, maxWidth: 800, maxHeight: 1100 }, forcible: false
  },
  {
    name: 'testSetBulk0801', number: '0801',
    limits: { minWidth: 690, minHeight: 800, maxWidth: 990, maxHeight: 1150 }, forcible: false
  },
  {
    name: 'testSetBulk0802', number: '0802',
    limits: { minWidth: 780, minHeight: 800, maxWidth: 1180, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testSetBulk0803', number: '0803',
    limits: { minWidth: 870, minHeight: 800, maxWidth: 1370, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testSetBulk0804', number: '0804',
    limits: { minWidth: 960, minHeight: 800, maxWidth: 1560, maxHeight: 950 }, forcible: false
  },
  {
    name: 'testSetBulk0805', number: '0805',
    limits: { minWidth: 1050, minHeight: 800, maxWidth: 1250, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetBulk0806', number: '0806',
    limits: { minWidth: 1140, minHeight: 800, maxWidth: 1440, maxHeight: 1050 }, forcible: false
  },
  {
    name: 'testSetBulk0807', number: '0807',
    limits: { minWidth: 1230, minHeight: 800, maxWidth: 1630, maxHeight: 1100 }, forcible: false
  },
  {
    name: 'testSetBulk0808', number: '0808',
    limits: { minWidth: 1320, minHeight: 800, maxWidth: 1820, maxHeight: 1150 }, forcible: true
  },
  {
    name: 'testSetBulk0809', number: '0809',
    limits: { minWidth: 1410, minHeight: 800, maxWidth: 2010, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testSetBulk0810', number: '0810',
    limits: { minWidth: 600, minHeight: 850, maxWidth: 800, maxHeight: 950 }, forcible: false
  },
  {
    name: 'testSetBulk0811', number: '0811',
    limits: { minWidth: 690, minHeight: 850, maxWidth: 990, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetBulk0812', number: '0812',
    limits: { minWidth: 780, minHeight: 850, maxWidth: 1180, maxHeight: 1050 }, forcible: false
  },
  {
    name: 'testSetBulk0813', number: '0813',
    limits: { minWidth: 870, minHeight: 850, maxWidth: 1370, maxHeight: 1100 }, forcible: false
  },
  {
    name: 'testSetBulk0814', number: '0814',
    limits: { minWidth: 960, minHeight: 850, maxWidth: 1560, maxHeight: 1150 }, forcible: false
  },
  {
    name: 'testSetBulk0815', number: '0815',
    limits: { minWidth: 1050, minHeight: 850, maxWidth: 1250, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testSetBulk0816', number: '0816',
    limits: { minWidth: 1140, minHeight: 850, maxWidth: 1440, maxHeight: 1250 }, forcible: false
  },
  {
    name: 'testSetBulk0817', number: '0817',
    limits: { minWidth: 1230, minHeight: 850, maxWidth: 1630, maxHeight: 950 }, forcible: false
  },
  {
    name: 'testSetBulk0818', number: '0818',
    limits: { minWidth: 1320, minHeight: 850, maxWidth: 1820, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetBulk0819', number: '0819',
    limits: { minWidth: 1410, minHeight: 850, maxWidth: 2010, maxHeight: 1050 }, forcible: false
  },
  {
    name: 'testSetBulk0820', number: '0820',
    limits: { minWidth: 600, minHeight: 900, maxWidth: 800, maxHeight: 1150 }, forcible: false
  },
  {
    name: 'testSetBulk0821', number: '0821',
    limits: { minWidth: 690, minHeight: 900, maxWidth: 990, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testSetBulk0822', number: '0822',
    limits: { minWidth: 780, minHeight: 900, maxWidth: 1180, maxHeight: 1250 }, forcible: false
  },
  {
    name: 'testSetBulk0823', number: '0823',
    limits: { minWidth: 870, minHeight: 900, maxWidth: 1370, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testSetBulk0824', number: '0824',
    limits: { minWidth: 960, minHeight: 900, maxWidth: 1560, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testSetBulk0825', number: '0825',
    limits: { minWidth: 1050, minHeight: 900, maxWidth: 1250, maxHeight: 1050 }, forcible: true
  },
  {
    name: 'testSetBulk0826', number: '0826',
    limits: { minWidth: 1140, minHeight: 900, maxWidth: 1440, maxHeight: 1100 }, forcible: false
  },
  {
    name: 'testSetBulk0827', number: '0827',
    limits: { minWidth: 1230, minHeight: 900, maxWidth: 1630, maxHeight: 1150 }, forcible: false
  },
  {
    name: 'testSetBulk0828', number: '0828',
    limits: { minWidth: 1320, minHeight: 900, maxWidth: 1820, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testSetBulk0829', number: '0829',
    limits: { minWidth: 1410, minHeight: 900, maxWidth: 2010, maxHeight: 1250 }, forcible: false
  },
  {
    name: 'testSetBulk0830', number: '0830',
    limits: { minWidth: 600, minHeight: 950, maxWidth: 800, maxHeight: 1350 }, forcible: false
  },
  {
    name: 'testSetBulk0831', number: '0831',
    limits: { minWidth: 690, minHeight: 950, maxWidth: 990, maxHeight: 1050 }, forcible: false
  },
  {
    name: 'testSetBulk0832', number: '0832',
    limits: { minWidth: 780, minHeight: 950, maxWidth: 1180, maxHeight: 1100 }, forcible: false
  },
  {
    name: 'testSetBulk0833', number: '0833',
    limits: { minWidth: 870, minHeight: 950, maxWidth: 1370, maxHeight: 1150 }, forcible: false
  },
  {
    name: 'testSetBulk0834', number: '0834',
    limits: { minWidth: 960, minHeight: 950, maxWidth: 1560, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testSetBulk0835', number: '0835',
    limits: { minWidth: 1050, minHeight: 950, maxWidth: 1250, maxHeight: 1250 }, forcible: false
  },
  {
    name: 'testSetBulk0836', number: '0836',
    limits: { minWidth: 1140, minHeight: 950, maxWidth: 1440, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testSetBulk0837', number: '0837',
    limits: { minWidth: 1230, minHeight: 950, maxWidth: 1630, maxHeight: 1350 }, forcible: false
  },
  {
    name: 'testSetBulk0838', number: '0838',
    limits: { minWidth: 1320, minHeight: 950, maxWidth: 1820, maxHeight: 1050 }, forcible: false
  },
  {
    name: 'testSetBulk0839', number: '0839',
    limits: { minWidth: 1410, minHeight: 950, maxWidth: 2010, maxHeight: 1100 }, forcible: false
  }
];

let testWindow: window.Window | undefined = undefined;
let originalLimits: window.WindowLimits | undefined = undefined;
let limitsSupported: boolean = false;

function isUsableLimits(limits: window.WindowLimits | undefined): boolean {
  if (!limits) {
    return false;
  }
  const minWidth: number = limits.minWidth ?? 0;
  const minHeight: number = limits.minHeight ?? 0;
  const maxWidth: number = limits.maxWidth ?? 0;
  const maxHeight: number = limits.maxHeight ?? 0;
  return minWidth > 0 && minHeight > 0 && maxWidth >= minWidth && maxHeight >= minHeight;
}

async function applyLimits(limits: window.WindowLimits, forcible: boolean = false): Promise<SetLimitsResult> {
  if (!testWindow) {
    return { ok: false, code: -1 };
  }
  try {
    const finalLimits: window.WindowLimits = forcible
      ? await testWindow.setWindowLimits(limits, true)
      : await testWindow.setWindowLimits(limits);
    return { ok: true, code: 0, limits: finalLimits };
  } catch (error) {
    const err: BusinessError = error as BusinessError;
    hilog.info(LOG_DOMAIN, LOG_TAG, 'setWindowLimits failed code=%{public}d message=%{public}s',
      err.code, err.message);
    return { ok: false, code: err.code };
  }
}

function isAccepted(result: SetLimitsResult): boolean {
  return result.ok || UNSUPPORTED_CODES.includes(result.code);
}

export default function windowLimitsApiTest(): void {
  describe('SetWindowLimitsApiTest', () => {
    beforeAll(async () => {
      const storedWindow: window.Window | undefined = getTestWindow();
      if (storedWindow) {
        testWindow = storedWindow;
      } else {
        const context = getTestAbilityContext() ?? abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
        testWindow = await window.getLastWindow(context);
      }
      try {
        originalLimits = testWindow!.getWindowLimits();
        limitsSupported = true;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'window limits supported: %{public}s', JSON.stringify(originalLimits));
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        originalLimits = undefined;
        limitsSupported = false;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'getWindowLimits not supported, code=%{public}d', err.code);
      }
    });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0001
     * @tc.name      testGetWindowLimits0001
     * @tc.desc      Get the current window limits; accept the unsupported result on non-freeform devices.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testGetWindowLimits0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testGetWindowLimits0001 begin');
        expect(testWindow !== undefined).assertTrue();
        if (limitsSupported) {
          hilog.info(LOG_DOMAIN, LOG_TAG, 'limits=%{public}s', JSON.stringify(originalLimits));
          expect(isUsableLimits(originalLimits)).assertTrue();
        } else {
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'device does not support window limits');
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testGetWindowLimits0001 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0002
     * @tc.name      testSetAndGetLimits0002
     * @tc.desc      Set valid limits and verify the result can be read back when supported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSetAndGetLimits0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetAndGetLimits0002 begin');
        const limits: window.WindowLimits = { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 1000 };
        hilog.info(LOG_DOMAIN, LOG_TAG, 'request=%{public}s', JSON.stringify(limits));
        const result: SetLimitsResult = await applyLimits(limits);
        expect(isAccepted(result)).assertTrue();
        if (result.ok) {
          expect(isUsableLimits(result.limits)).assertTrue();
          if (limitsSupported) {
            const current: window.WindowLimits = testWindow!.getWindowLimits();
            hilog.info(LOG_DOMAIN, LOG_TAG, 'current=%{public}s', JSON.stringify(current));
            expect(isUsableLimits(current)).assertTrue();
          }
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetAndGetLimits0002 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0003
     * @tc.name      testSetLimitsRepeat0003
     * @tc.desc      Set the same limits twice and verify the result is stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetLimitsRepeat0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsRepeat0003 begin');
        const limits: window.WindowLimits = { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 1000 };
        const first: SetLimitsResult = await applyLimits(limits);
        const second: SetLimitsResult = await applyLimits(limits);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'first=%{public}s second=%{public}s',
          JSON.stringify(first), JSON.stringify(second));
        if (first.ok && second.ok) {
          expect(JSON.stringify(second.limits)).assertEqual(JSON.stringify(first.limits));
        } else {
          expect(isAccepted(second)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsRepeat0003 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0004
     * @tc.name      testSetLimitsForcible0004
     * @tc.desc      Set valid limits with the forcible flag.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetLimitsForcible0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsForcible0004 begin');
        const limits: window.WindowLimits = { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 1000 };
        hilog.info(LOG_DOMAIN, LOG_TAG, 'request=%{public}s', JSON.stringify(limits));
        const result: SetLimitsResult = await applyLimits(limits, true);
        expect(isAccepted(result)).assertTrue();
        if (result.ok) {
          expect(isUsableLimits(result.limits)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsForcible0004 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0005
     * @tc.name      testSetLimitsGrowth0005
     * @tc.desc      Increase the limits step by step and verify each step is accepted.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetLimitsGrowth0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsGrowth0005 begin');
        const steps: window.WindowLimits[] = [
          { minWidth: 700, minHeight: 600, maxWidth: 1200, maxHeight: 900 },
          { minWidth: 900, minHeight: 700, maxWidth: 1400, maxHeight: 950 },
          { minWidth: 1100, minHeight: 800, maxWidth: 1500, maxHeight: 1000 }
        ];
        for (let index: number = 0; index < steps.length; index++) {
          hilog.info(LOG_DOMAIN, LOG_TAG, 'step=%{public}d request=%{public}s', index, JSON.stringify(steps[index]));
          const result: SetLimitsResult = await applyLimits(steps[index]);
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsGrowth0005 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0006
     * @tc.name      testSetLimitsShrink0006
     * @tc.desc      Decrease the limits step by step and verify each step is accepted.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetLimitsShrink0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsShrink0006 begin');
        const steps: window.WindowLimits[] = [
          { minWidth: 1100, minHeight: 800, maxWidth: 1500, maxHeight: 1000 },
          { minWidth: 900, minHeight: 700, maxWidth: 1400, maxHeight: 950 },
          { minWidth: 700, minHeight: 600, maxWidth: 1200, maxHeight: 900 }
        ];
        for (let index: number = 0; index < steps.length; index++) {
          hilog.info(LOG_DOMAIN, LOG_TAG, 'step=%{public}d request=%{public}s', index, JSON.stringify(steps[index]));
          const result: SetLimitsResult = await applyLimits(steps[index]);
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsShrink0006 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0007
     * @tc.name      testSetLimitsAlternating0007
     * @tc.desc      Alternate valid and invalid limits and verify each request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetLimitsAlternating0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsAlternating0007 begin');
        const valid: window.WindowLimits = { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 1000 };
        const invalid: window.WindowLimits = { minWidth: -1, maxWidth: -2 };
        const first: SetLimitsResult = await applyLimits(valid);
        const second: SetLimitsResult = await applyLimits(invalid);
        const third: SetLimitsResult = await applyLimits(valid);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'first=%{public}s second=%{public}s third=%{public}s',
          JSON.stringify(first), JSON.stringify(second), JSON.stringify(third));
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
        expect(isAccepted(third)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsAlternating0007 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0008
     * @tc.name      testSetMaxOnlyAndGet0008
     * @tc.desc      Set only max limits and verify getWindowLimits when supported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetMaxOnlyAndGet0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetMaxOnlyAndGet0008 begin');
        const limits: window.WindowLimits = { maxWidth: 1500, maxHeight: 1000 };
        const result: SetLimitsResult = await applyLimits(limits);
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          const current: window.WindowLimits = testWindow!.getWindowLimits();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'current=%{public}s', JSON.stringify(current));
          expect(isUsableLimits(current)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetMaxOnlyAndGet0008 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0009
     * @tc.name      testSetLimitsEmptyObject0009
     * @tc.desc      Set an empty limits object and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSetLimitsEmptyObject0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsEmptyObject0009 begin');
        const limits: window.WindowLimits = {};
        const result: SetLimitsResult = await applyLimits(limits);
        expect(isAccepted(result)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsEmptyObject0009 end');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0091
     * @tc.name      testSetLimitsPresenceSubsets0091
     * @tc.desc      Set all fifteen non-empty combinations of limit fields and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetLimitsPresenceSubsets0091',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsPresenceSubsets0091 begin');
        const subsets: window.WindowLimits[] = [
          { minWidth: 600 }, { minHeight: 500 }, { maxWidth: 1500 }, { maxHeight: 1000 },
          { minWidth: 600, minHeight: 500 }, { minWidth: 600, maxWidth: 1500 },
          { minWidth: 600, maxHeight: 1000 }, { minHeight: 500, maxWidth: 1500 },
          { minHeight: 500, maxHeight: 1000 }, { maxWidth: 1500, maxHeight: 1000 },
          { minWidth: 600, minHeight: 500, maxWidth: 1500 },
          { minWidth: 600, minHeight: 500, maxHeight: 1000 },
          { minWidth: 600, maxWidth: 1500, maxHeight: 1000 },
          { minHeight: 500, maxWidth: 1500, maxHeight: 1000 },
          { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 1000 }
        ];
        for (let index: number = 0; index < subsets.length; index++) {
          const result: SetLimitsResult = await applyLimits(subsets[index]);
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsPresenceSubsets0091 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0092
     * @tc.name      testSetLimitsFullRamp0092
     * @tc.desc      Grow to the maximum and shrink back in five steps; verify every step is accepted.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetLimitsFullRamp0092',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsFullRamp0092 begin');
        const steps: window.WindowLimits[] = [
          { minWidth: 600, minHeight: 500, maxWidth: 900, maxHeight: 700 },
          { minWidth: 650, minHeight: 550, maxWidth: 1200, maxHeight: 850 },
          { minWidth: 700, minHeight: 600, maxWidth: 1500, maxHeight: 1000 },
          { minWidth: 650, minHeight: 550, maxWidth: 1200, maxHeight: 850 },
          { minWidth: 600, minHeight: 500, maxWidth: 900, maxHeight: 700 }
        ];
        for (let index: number = 0; index < steps.length; index++) {
          const result: SetLimitsResult = await applyLimits(steps[index]);
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsFullRamp0092 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0093
     * @tc.name      testSetLimitsRapidTen0093
     * @tc.desc      Set ten different limits rapidly and verify the last readback is usable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSetLimitsRapidTen0093',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsRapidTen0093 begin');
        for (let index: number = 0; index < 10; index++) {
          const result: SetLimitsResult = await applyLimits({ minWidth: 600 + index * 50, maxWidth: 1200 });
          expect(isAccepted(result)).assertTrue();
        }
        if (limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsRapidTen0093 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0094
     * @tc.name      testSetLimitsConcurrentTen0094
     * @tc.desc      Issue ten setWindowLimits requests concurrently and verify all are handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSetLimitsConcurrentTen0094',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsConcurrentTen0094 begin');
        const tasks: Promise<SetLimitsResult>[] = [];
        for (let index: number = 0; index < 10; index++) {
          tasks.push(applyLimits({ maxWidth: 900 + index * 60, maxHeight: 600 + index * 40 }));
        }
        const results: SetLimitsResult[] = await Promise.all(tasks);
        expect(results.length).assertEqual(10);
        for (let index: number = 0; index < results.length; index++) {
          expect(isAccepted(results[index])).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsConcurrentTen0094 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0095
     * @tc.name      testSetGetInterleavedTen0095
     * @tc.desc      Interleave set and get ten times and verify every readback is usable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSetGetInterleavedTen0095',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetGetInterleavedTen0095 begin');
        for (let index: number = 0; index < 10; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 500 + index * 30, maxHeight: 1000 });
          expect(isAccepted(result)).assertTrue();
          if (result.ok && limitsSupported) {
            expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
          }
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetGetInterleavedTen0095 end');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0072
     * @tc.name      testSetLimitsReadbackEquality0072
     * @tc.desc      Set valid limits and verify the accepted readback matches the request when supported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetLimitsReadbackEquality0072',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const limits: window.WindowLimits = { minWidth: 700, minHeight: 600, maxWidth: 1400, maxHeight: 900 };
        const result: SetLimitsResult = await applyLimits(limits);
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          const current: window.WindowLimits = testWindow!.getWindowLimits();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'request=%{public}s current=%{public}s',
            JSON.stringify(limits), JSON.stringify(current));
          expect(isUsableLimits(current)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsReadbackEquality0072 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0073
     * @tc.name      testSetLimitsSameTwice0073
     * @tc.desc      Set the same limits twice and verify the readback is identical when supported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetLimitsSameTwice0073',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const limits: window.WindowLimits = { minWidth: 650, minHeight: 550, maxWidth: 1350, maxHeight: 950 };
        const first: SetLimitsResult = await applyLimits(limits);
        const second: SetLimitsResult = await applyLimits(limits);
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
        if (first.ok && second.ok) {
          expect(JSON.stringify(second.limits)).assertEqual(JSON.stringify(first.limits));
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsSameTwice0073 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0074
     * @tc.name      testSetLimitsForcibleInvalidOnly0074
     * @tc.desc      Apply only invalid forcible limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSetLimitsForcibleInvalidOnly0074',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: -600, maxWidth: -1500 }, true);
        expect(isAccepted(result)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsForcibleInvalidOnly0074 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0075
     * @tc.name      testGetLimitsThreeTimes0075
     * @tc.desc      Call getWindowLimits three times and verify the results stay identical when supported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testGetLimitsThreeTimes0075',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        expect(testWindow !== undefined).assertTrue();
        if (limitsSupported) {
          const first: string = JSON.stringify(testWindow!.getWindowLimits());
          const second: string = JSON.stringify(testWindow!.getWindowLimits());
          const third: string = JSON.stringify(testWindow!.getWindowLimits());
          expect(second).assertEqual(first);
          expect(third).assertEqual(first);
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testGetLimitsThreeTimes0075 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0076
     * @tc.name      testSetEmptyAfterValid0076
     * @tc.desc      Set valid limits then an empty object and verify both requests are handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSetEmptyAfterValid0076',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const first: SetLimitsResult = await applyLimits({ minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 1000 });
        const second: SetLimitsResult = await applyLimits({});
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetEmptyAfterValid0076 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0077
     * @tc.name      testSetLimitsZeros0077
     * @tc.desc      Set all-zero limits and verify the request is handled before restoring.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSetLimitsZeros0077',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 0, minHeight: 0, maxWidth: 0, maxHeight: 0 });
        expect(isAccepted(result)).assertTrue();
        if (originalLimits !== undefined) {
          expect(isAccepted(await applyLimits(originalLimits as window.WindowLimits))).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsZeros0077 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0078
     * @tc.name      testSetLimitsMaxSafe0078
     * @tc.desc      Set MAX_SAFE_INTEGER limits and verify the request is handled before restoring.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSetLimitsMaxSafe0078',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const result: SetLimitsResult = await applyLimits({
          minWidth: 1, minHeight: 1, maxWidth: Number.MAX_SAFE_INTEGER, maxHeight: Number.MAX_SAFE_INTEGER
        });
        expect(isAccepted(result)).assertTrue();
        if (originalLimits !== undefined) {
          expect(isAccepted(await applyLimits(originalLimits as window.WindowLimits))).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsMaxSafe0078 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0079
     * @tc.name      testRestoreLoop0079
     * @tc.desc      Restore the original limits three times and verify each restore is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testRestoreLoop0079',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        expect(testWindow !== undefined).assertTrue();
        if (originalLimits !== undefined) {
          for (let index: number = 0; index < 3; index++) {
            const result: SetLimitsResult = await applyLimits(originalLimits as window.WindowLimits);
            expect(isAccepted(result)).assertTrue();
          }
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreLoop0079 end');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0096
     * @tc.name      testSetLimitsReadbackLoop0096
     * @tc.desc      Set five limits and verify a usable readback after every accepted request.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSetLimitsReadbackLoop0096',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        for (let index: number = 0; index < 5; index++) {
          const result: SetLimitsResult = await applyLimits({ minWidth: 600 + index * 100, maxWidth: 1500 });
          expect(isAccepted(result)).assertTrue();
          if (result.ok && limitsSupported) {
            expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
          }
        }
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0097
     * @tc.name      testSetLimitsForcibleZeros0097
     * @tc.desc      Apply forcible zero limits and verify the request is handled before restoring.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSetLimitsForcibleZeros0097',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const result: SetLimitsResult = await applyLimits(
          { minWidth: 0, minHeight: 0, maxWidth: 0, maxHeight: 0 }, true);
        expect(isAccepted(result)).assertTrue();
        if (originalLimits !== undefined) {
          expect(isAccepted(await applyLimits(originalLimits as window.WindowLimits))).assertTrue();
        }
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0098
     * @tc.name      testSetLimitsMaxBounds0098
     * @tc.desc      Set the configured maximum bounds and verify the result.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetLimitsMaxBounds0098',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ maxWidth: 1500, maxHeight: 1000 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok) {
          expect(isUsableLimits(result.limits)).assertTrue();
        }
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0099
     * @tc.name      testSetLimitsEqualBounds0099
     * @tc.desc      Set equal minimum and maximum bounds and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetLimitsEqualBounds0099',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits(
          { minWidth: 900, minHeight: 700, maxWidth: 900, maxHeight: 700 });
        expect(isAccepted(result)).assertTrue();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0100
     * @tc.name      testSetLimitsBackToBack0100
     * @tc.desc      Set limits back to back three times and verify each request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetLimitsBackToBack0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minWidth: 600, maxWidth: 1500 });
          expect(isAccepted(result)).assertTrue();
        }
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0101
     * @tc.name      testSetLimitsMaxHeightOnly0101
     * @tc.desc      Set only the maximum height and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetLimitsMaxHeightOnly0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ maxHeight: 1000 });
        expect(isAccepted(result)).assertTrue();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0102
     * @tc.name      testSetLimitsMinHeightOnly0102
     * @tc.desc      Set only the minimum height and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetLimitsMinHeightOnly0102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minHeight: 500 });
        expect(isAccepted(result)).assertTrue();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0103
     * @tc.name      testRestoreAfterSweeps0103
     * @tc.desc      Restore the original limits after several sweeps and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testRestoreAfterSweeps0103',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        expect(testWindow !== undefined).assertTrue();
        if (originalLimits !== undefined) {
          const result: SetLimitsResult = await applyLimits(originalLimits as window.WindowLimits);
          expect(isAccepted(result)).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0104
     * @tc.name      testSetLimitsCornerLoop0104
     * @tc.desc      Apply the four corners of the configured range and verify each request.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetLimitsCornerLoop0104',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const corners: window.WindowLimits[] = [
          { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 1000 },
          { minWidth: 600, minHeight: 1000, maxWidth: 600, maxHeight: 1000 },
          { minWidth: 1500, minHeight: 500, maxWidth: 1500, maxHeight: 500 },
          { minWidth: 900, minHeight: 750, maxWidth: 900, maxHeight: 750 }
        ];
        for (let index: number = 0; index < corners.length; index++) {
          const result: SetLimitsResult = await applyLimits(corners[index]);
          expect(isAccepted(result)).assertTrue();
        }
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0105
     * @tc.name      testSetLimitsCenterRange0105
     * @tc.desc      Apply a centered range and verify the result is usable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetLimitsCenterRange0105',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits(
          { minWidth: 800, minHeight: 600, maxWidth: 1300, maxHeight: 900 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok) {
          expect(isUsableLimits(result.limits)).assertTrue();
        }
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0106
     * @tc.name      testSetLimitsMinEqualsMax0106
     * @tc.desc      Apply equal bounds for both dimensions and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetLimitsMinEqualsMax0106',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits(
          { minWidth: 1000, minHeight: 800, maxWidth: 1000, maxHeight: 800 });
        expect(isAccepted(result)).assertTrue();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0107
     * @tc.name      testSetLimitsSweepWidths0107
     * @tc.desc      Sweep the width options four times and verify each request.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSetLimitsSweepWidths0107',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        for (let index: number = 0; index < 4; index++) {
          const result: SetLimitsResult = await applyLimits({ minWidth: 600 + index * 100, maxWidth: 1500 });
          expect(isAccepted(result)).assertTrue();
        }
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0108
     * @tc.name      testSetLimitsSweepHeights0108
     * @tc.desc      Sweep the height options four times and verify each request.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSetLimitsSweepHeights0108',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        for (let index: number = 0; index < 4; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 500 + index * 50, maxHeight: 1000 });
          expect(isAccepted(result)).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_900
     * @tc.name      testSetBulkCase900
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase900');
        const result: SetLimitsResult = await applyLimits({ minWidth: 600, maxWidth: 1400 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase900');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_901
     * @tc.name      testSetBulkCase901
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase901',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase901');
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 700, maxHeight: 1000 });
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase901');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_902
     * @tc.name      testSetBulkCase902
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase902',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase902');
        const first: SetLimitsResult = await applyLimits({ minWidth: 800, maxWidth: 1500 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 800, maxWidth: 1500 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase902');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_903
     * @tc.name      testSetBulkCase903
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase903',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase903');
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 1550 }),
          applyLimits({ maxWidth: 1600 }),
          applyLimits({ maxWidth: 1650 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase903');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_904
     * @tc.name      testSetBulkCase904
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase904',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase904');
        const result: SetLimitsResult = await applyLimits({ minWidth: 1000, maxWidth: 1400 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase904');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_905
     * @tc.name      testSetBulkCase905
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase905',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase905');
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 1100, maxHeight: 1000 });
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase905');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_906
     * @tc.name      testSetBulkCase906
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase906',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase906');
        const first: SetLimitsResult = await applyLimits({ minWidth: 1200, maxWidth: 1500 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 1200, maxWidth: 1500 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase906');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_907
     * @tc.name      testSetBulkCase907
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase907',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase907');
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 1550 }),
          applyLimits({ maxWidth: 1600 }),
          applyLimits({ maxWidth: 1650 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase907');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_908
     * @tc.name      testSetBulkCase908
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase908',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase908');
        const result: SetLimitsResult = await applyLimits({ minWidth: 600, maxWidth: 1400 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase908');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_909
     * @tc.name      testSetBulkCase909
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase909',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase909');
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 700, maxHeight: 1000 });
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase909');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_910
     * @tc.name      testSetBulkCase910
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase910',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase910');
        const first: SetLimitsResult = await applyLimits({ minWidth: 800, maxWidth: 1500 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 800, maxWidth: 1500 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase910');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_911
     * @tc.name      testSetBulkCase911
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase911',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase911');
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 1550 }),
          applyLimits({ maxWidth: 1600 }),
          applyLimits({ maxWidth: 1650 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase911');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_912
     * @tc.name      testSetBulkCase912
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase912',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase912');
        const result: SetLimitsResult = await applyLimits({ minWidth: 1000, maxWidth: 1400 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase912');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_913
     * @tc.name      testSetBulkCase913
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase913',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase913');
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 1100, maxHeight: 1000 });
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase913');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_914
     * @tc.name      testSetBulkCase914
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase914',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase914');
        const first: SetLimitsResult = await applyLimits({ minWidth: 1200, maxWidth: 1500 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 1200, maxWidth: 1500 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase914');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_915
     * @tc.name      testSetBulkCase915
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase915',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase915');
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 1550 }),
          applyLimits({ maxWidth: 1600 }),
          applyLimits({ maxWidth: 1650 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase915');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_916
     * @tc.name      testSetBulkCase916
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase916',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase916');
        const result: SetLimitsResult = await applyLimits({ minWidth: 600, maxWidth: 1400 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase916');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_917
     * @tc.name      testSetBulkCase917
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase917',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase917');
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 700, maxHeight: 1000 });
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase917');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_918
     * @tc.name      testSetBulkCase918
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase918',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase918');
        const first: SetLimitsResult = await applyLimits({ minWidth: 800, maxWidth: 1500 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 800, maxWidth: 1500 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase918');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_919
     * @tc.name      testSetBulkCase919
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase919',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase919');
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 1550 }),
          applyLimits({ maxWidth: 1600 }),
          applyLimits({ maxWidth: 1650 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase919');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_920
     * @tc.name      testSetBulkCase920
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase920',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase920');
        const result: SetLimitsResult = await applyLimits({ minWidth: 1000, maxWidth: 1400 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase920');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_921
     * @tc.name      testSetBulkCase921
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase921',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase921');
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 1100, maxHeight: 1000 });
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase921');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_922
     * @tc.name      testSetBulkCase922
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase922',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase922');
        const first: SetLimitsResult = await applyLimits({ minWidth: 1200, maxWidth: 1500 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 1200, maxWidth: 1500 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase922');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_923
     * @tc.name      testSetBulkCase923
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase923',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase923');
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 1550 }),
          applyLimits({ maxWidth: 1600 }),
          applyLimits({ maxWidth: 1650 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase923');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_924
     * @tc.name      testSetBulkCase924
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase924',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase924');
        const result: SetLimitsResult = await applyLimits({ minWidth: 600, maxWidth: 1400 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase924');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_925
     * @tc.name      testSetBulkCase925
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase925',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase925');
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 700, maxHeight: 1000 });
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase925');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_926
     * @tc.name      testSetBulkCase926
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase926',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase926');
        const first: SetLimitsResult = await applyLimits({ minWidth: 800, maxWidth: 1500 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 800, maxWidth: 1500 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase926');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_927
     * @tc.name      testSetBulkCase927
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase927',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase927');
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 1550 }),
          applyLimits({ maxWidth: 1600 }),
          applyLimits({ maxWidth: 1650 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase927');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_928
     * @tc.name      testSetBulkCase928
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase928',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase928');
        const result: SetLimitsResult = await applyLimits({ minWidth: 1000, maxWidth: 1400 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase928');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_929
     * @tc.name      testSetBulkCase929
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase929',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase929');
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 1100, maxHeight: 1000 });
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase929');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_930
     * @tc.name      testSetBulkCase930
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase930',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase930');
        const first: SetLimitsResult = await applyLimits({ minWidth: 1200, maxWidth: 1500 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 1200, maxWidth: 1500 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase930');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_931
     * @tc.name      testSetBulkCase931
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase931',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase931');
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 1550 }),
          applyLimits({ maxWidth: 1600 }),
          applyLimits({ maxWidth: 1650 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase931');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_932
     * @tc.name      testSetBulkCase932
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase932',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase932');
        const result: SetLimitsResult = await applyLimits({ minWidth: 600, maxWidth: 1400 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase932');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_933
     * @tc.name      testSetBulkCase933
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase933',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase933');
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 700, maxHeight: 1000 });
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase933');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_934
     * @tc.name      testSetBulkCase934
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase934',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase934');
        const first: SetLimitsResult = await applyLimits({ minWidth: 800, maxWidth: 1500 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 800, maxWidth: 1500 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase934');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_935
     * @tc.name      testSetBulkCase935
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase935',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase935');
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 1550 }),
          applyLimits({ maxWidth: 1600 }),
          applyLimits({ maxWidth: 1650 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase935');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_936
     * @tc.name      testSetBulkCase936
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase936',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase936');
        const result: SetLimitsResult = await applyLimits({ minWidth: 1000, maxWidth: 1400 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase936');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_937
     * @tc.name      testSetBulkCase937
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase937',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase937');
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 1100, maxHeight: 1000 });
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase937');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_938
     * @tc.name      testSetBulkCase938
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase938',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase938');
        const first: SetLimitsResult = await applyLimits({ minWidth: 1200, maxWidth: 1500 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 1200, maxWidth: 1500 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase938');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_939
     * @tc.name      testSetBulkCase939
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase939',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase939');
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 1550 }),
          applyLimits({ maxWidth: 1600 }),
          applyLimits({ maxWidth: 1650 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase939');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_940
     * @tc.name      testSetBulkCase940
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase940',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase940');
        const result: SetLimitsResult = await applyLimits({ minWidth: 600, maxWidth: 1400 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase940');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_941
     * @tc.name      testSetBulkCase941
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase941',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase941');
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 700, maxHeight: 1000 });
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase941');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_942
     * @tc.name      testSetBulkCase942
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase942',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase942');
        const first: SetLimitsResult = await applyLimits({ minWidth: 800, maxWidth: 1500 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 800, maxWidth: 1500 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase942');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_943
     * @tc.name      testSetBulkCase943
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase943',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase943');
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 1550 }),
          applyLimits({ maxWidth: 1600 }),
          applyLimits({ maxWidth: 1650 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase943');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_944
     * @tc.name      testSetBulkCase944
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase944',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase944');
        const result: SetLimitsResult = await applyLimits({ minWidth: 1000, maxWidth: 1400 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase944');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_945
     * @tc.name      testSetBulkCase945
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase945',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase945');
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 1100, maxHeight: 1000 });
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase945');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_946
     * @tc.name      testSetBulkCase946
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase946',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase946');
        const first: SetLimitsResult = await applyLimits({ minWidth: 1200, maxWidth: 1500 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 1200, maxWidth: 1500 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase946');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_947
     * @tc.name      testSetBulkCase947
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase947',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase947');
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 1550 }),
          applyLimits({ maxWidth: 1600 }),
          applyLimits({ maxWidth: 1650 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase947');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_948
     * @tc.name      testSetBulkCase948
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase948',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase948');
        const result: SetLimitsResult = await applyLimits({ minWidth: 600, maxWidth: 1400 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase948');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_949
     * @tc.name      testSetBulkCase949
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase949',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase949');
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 700, maxHeight: 1000 });
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase949');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_950
     * @tc.name      testSetBulkCase950
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase950',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase950');
        const first: SetLimitsResult = await applyLimits({ minWidth: 800, maxWidth: 1500 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 800, maxWidth: 1500 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase950');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_951
     * @tc.name      testSetBulkCase951
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase951',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase951');
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 1550 }),
          applyLimits({ maxWidth: 1600 }),
          applyLimits({ maxWidth: 1650 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase951');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_952
     * @tc.name      testSetBulkCase952
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase952',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase952');
        const result: SetLimitsResult = await applyLimits({ minWidth: 1000, maxWidth: 1400 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase952');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_953
     * @tc.name      testSetBulkCase953
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase953',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase953');
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 1100, maxHeight: 1000 });
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase953');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_954
     * @tc.name      testSetBulkCase954
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase954',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase954');
        const first: SetLimitsResult = await applyLimits({ minWidth: 1200, maxWidth: 1500 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 1200, maxWidth: 1500 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase954');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_955
     * @tc.name      testSetBulkCase955
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase955',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase955');
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 1550 }),
          applyLimits({ maxWidth: 1600 }),
          applyLimits({ maxWidth: 1650 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase955');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_956
     * @tc.name      testSetBulkCase956
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase956',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase956');
        const result: SetLimitsResult = await applyLimits({ minWidth: 600, maxWidth: 1400 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase956');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_957
     * @tc.name      testSetBulkCase957
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase957',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase957');
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 700, maxHeight: 1000 });
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase957');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_958
     * @tc.name      testSetBulkCase958
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase958',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase958');
        const first: SetLimitsResult = await applyLimits({ minWidth: 800, maxWidth: 1500 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 800, maxWidth: 1500 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase958');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_959
     * @tc.name      testSetBulkCase959
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase959',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase959');
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 1550 }),
          applyLimits({ maxWidth: 1600 }),
          applyLimits({ maxWidth: 1650 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase959');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_960
     * @tc.name      testSetBulkCase960
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase960',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase960');
        const result: SetLimitsResult = await applyLimits({ minWidth: 1000, maxWidth: 1400 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase960');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_961
     * @tc.name      testSetBulkCase961
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase961',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase961');
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 1100, maxHeight: 1000 });
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase961');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_962
     * @tc.name      testSetBulkCase962
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase962',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase962');
        const first: SetLimitsResult = await applyLimits({ minWidth: 1200, maxWidth: 1500 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 1200, maxWidth: 1500 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase962');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_963
     * @tc.name      testSetBulkCase963
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase963',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase963');
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 1550 }),
          applyLimits({ maxWidth: 1600 }),
          applyLimits({ maxWidth: 1650 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase963');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_964
     * @tc.name      testSetBulkCase964
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase964',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase964');
        const result: SetLimitsResult = await applyLimits({ minWidth: 600, maxWidth: 1400 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase964');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_965
     * @tc.name      testSetBulkCase965
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase965',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase965');
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 700, maxHeight: 1000 });
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase965');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_966
     * @tc.name      testSetBulkCase966
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase966',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase966');
        const first: SetLimitsResult = await applyLimits({ minWidth: 800, maxWidth: 1500 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 800, maxWidth: 1500 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase966');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_967
     * @tc.name      testSetBulkCase967
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase967',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase967');
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 1550 }),
          applyLimits({ maxWidth: 1600 }),
          applyLimits({ maxWidth: 1650 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase967');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_968
     * @tc.name      testSetBulkCase968
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase968',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase968');
        const result: SetLimitsResult = await applyLimits({ minWidth: 1000, maxWidth: 1400 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase968');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_969
     * @tc.name      testSetBulkCase969
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase969',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase969');
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 1100, maxHeight: 1000 });
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase969');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_970
     * @tc.name      testSetBulkCase970
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase970',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase970');
        const first: SetLimitsResult = await applyLimits({ minWidth: 1200, maxWidth: 1500 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 1200, maxWidth: 1500 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase970');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_971
     * @tc.name      testSetBulkCase971
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase971',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase971');
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 1550 }),
          applyLimits({ maxWidth: 1600 }),
          applyLimits({ maxWidth: 1650 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase971');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_972
     * @tc.name      testSetBulkCase972
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase972',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase972');
        const result: SetLimitsResult = await applyLimits({ minWidth: 600, maxWidth: 1400 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase972');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_973
     * @tc.name      testSetBulkCase973
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase973',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase973');
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 700, maxHeight: 1000 });
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase973');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_974
     * @tc.name      testSetBulkCase974
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase974',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase974');
        const first: SetLimitsResult = await applyLimits({ minWidth: 800, maxWidth: 1500 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 800, maxWidth: 1500 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase974');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_975
     * @tc.name      testSetBulkCase975
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase975',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase975');
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 1550 }),
          applyLimits({ maxWidth: 1600 }),
          applyLimits({ maxWidth: 1650 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase975');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_976
     * @tc.name      testSetBulkCase976
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase976',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase976');
        const result: SetLimitsResult = await applyLimits({ minWidth: 1000, maxWidth: 1400 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase976');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_977
     * @tc.name      testSetBulkCase977
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase977',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase977');
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 1100, maxHeight: 1000 });
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase977');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_978
     * @tc.name      testSetBulkCase978
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase978',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase978');
        const first: SetLimitsResult = await applyLimits({ minWidth: 1200, maxWidth: 1500 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 1200, maxWidth: 1500 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase978');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_979
     * @tc.name      testSetBulkCase979
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase979',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase979');
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 1550 }),
          applyLimits({ maxWidth: 1600 }),
          applyLimits({ maxWidth: 1650 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase979');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_980
     * @tc.name      testSetBulkCase980
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase980',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase980');
        const result: SetLimitsResult = await applyLimits({ minWidth: 600, maxWidth: 1400 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase980');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_981
     * @tc.name      testSetBulkCase981
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase981',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase981');
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 700, maxHeight: 1000 });
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase981');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_982
     * @tc.name      testSetBulkCase982
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase982',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase982');
        const first: SetLimitsResult = await applyLimits({ minWidth: 800, maxWidth: 1500 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 800, maxWidth: 1500 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase982');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_983
     * @tc.name      testSetBulkCase983
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase983',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase983');
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 1550 }),
          applyLimits({ maxWidth: 1600 }),
          applyLimits({ maxWidth: 1650 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase983');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_984
     * @tc.name      testSetBulkCase984
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase984',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase984');
        const result: SetLimitsResult = await applyLimits({ minWidth: 1000, maxWidth: 1400 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase984');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_985
     * @tc.name      testSetBulkCase985
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase985',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase985');
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 1100, maxHeight: 1000 });
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase985');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_986
     * @tc.name      testSetBulkCase986
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase986',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase986');
        const first: SetLimitsResult = await applyLimits({ minWidth: 1200, maxWidth: 1500 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 1200, maxWidth: 1500 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase986');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_987
     * @tc.name      testSetBulkCase987
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase987',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase987');
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 1550 }),
          applyLimits({ maxWidth: 1600 }),
          applyLimits({ maxWidth: 1650 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase987');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_988
     * @tc.name      testSetBulkCase988
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase988',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase988');
        const result: SetLimitsResult = await applyLimits({ minWidth: 600, maxWidth: 1400 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase988');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_989
     * @tc.name      testSetBulkCase989
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase989',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase989');
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 700, maxHeight: 1000 });
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase989');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_990
     * @tc.name      testSetBulkCase990
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase990',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase990');
        const first: SetLimitsResult = await applyLimits({ minWidth: 800, maxWidth: 1500 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 800, maxWidth: 1500 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase990');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_991
     * @tc.name      testSetBulkCase991
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase991',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase991');
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 1550 }),
          applyLimits({ maxWidth: 1600 }),
          applyLimits({ maxWidth: 1650 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase991');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_992
     * @tc.name      testSetBulkCase992
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase992',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase992');
        const result: SetLimitsResult = await applyLimits({ minWidth: 1000, maxWidth: 1400 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase992');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_993
     * @tc.name      testSetBulkCase993
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase993',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase993');
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 1100, maxHeight: 1000 });
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase993');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_994
     * @tc.name      testSetBulkCase994
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase994',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase994');
        const first: SetLimitsResult = await applyLimits({ minWidth: 1200, maxWidth: 1500 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 1200, maxWidth: 1500 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase994');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_995
     * @tc.name      testSetBulkCase995
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase995',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase995');
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 1550 }),
          applyLimits({ maxWidth: 1600 }),
          applyLimits({ maxWidth: 1650 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase995');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_996
     * @tc.name      testSetBulkCase996
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase996',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase996');
        const result: SetLimitsResult = await applyLimits({ minWidth: 600, maxWidth: 1400 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase996');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_997
     * @tc.name      testSetBulkCase997
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase997',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase997');
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 700, maxHeight: 1000 });
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase997');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_998
     * @tc.name      testSetBulkCase998
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase998',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase998');
        const first: SetLimitsResult = await applyLimits({ minWidth: 800, maxWidth: 1500 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 800, maxWidth: 1500 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase998');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_999
     * @tc.name      testSetBulkCase999
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetBulkCase999',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', 'testSetBulkCase999');
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 1550 }),
          applyLimits({ maxWidth: 1600 }),
          applyLimits({ maxWidth: 1650 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', 'testSetBulkCase999');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_1000
     * @tc.name      testSetLifeCycle1000
     * @tc.desc      Set limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testSetLifeCycle1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 600, maxWidth: 800 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_1001
     * @tc.name      testSetLifeCycle1001
     * @tc.desc      Apply an invalid then a valid limit and verify both.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testSetLifeCycle1001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const invalid: SetLimitsResult = await applyLimits({ minWidth: 800, maxWidth: 500 });
        const valid: SetLimitsResult = await applyLimits({ minWidth: 600, maxWidth: 700 });
        expect(isAccepted(invalid)).assertTrue();
        expect(isAccepted(valid)).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_1002
     * @tc.name      testSetLifeCycle1002
     * @tc.desc      Apply forcible limits and restore the original limits.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testSetLifeCycle1002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 600, minHeight: 500, maxWidth: 700, maxHeight: 600 }, true);
        expect(isAccepted(result)).assertTrue();
        if (originalLimits !== undefined) {
          expect(isAccepted(await applyLimits(originalLimits as window.WindowLimits))).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_1003
     * @tc.name      testSetLifeCycle1003
     * @tc.desc      Issue five concurrent requests and verify all are handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testSetLifeCycle1003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 700 }),
          applyLimits({ maxWidth: 750 }),
          applyLimits({ maxWidth: 800 }),
          applyLimits({ minWidth: 600 }),
          applyLimits({ minHeight: 500 })
        ]);
        expect(results.length).assertEqual(5);
        for (let index: number = 0; index < results.length; index++) {
          expect(isAccepted(results[index])).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_1004
     * @tc.name      testSetLifeCycle1004
     * @tc.desc      Set limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testSetLifeCycle1004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 650, maxWidth: 800 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_1005
     * @tc.name      testSetLifeCycle1005
     * @tc.desc      Apply an invalid then a valid limit and verify both.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testSetLifeCycle1005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const invalid: SetLimitsResult = await applyLimits({ minWidth: 800, maxWidth: 500 });
        const valid: SetLimitsResult = await applyLimits({ minWidth: 600, maxWidth: 700 });
        expect(isAccepted(invalid)).assertTrue();
        expect(isAccepted(valid)).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_1006
     * @tc.name      testSetLifeCycle1006
     * @tc.desc      Apply forcible limits and restore the original limits.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testSetLifeCycle1006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 600, minHeight: 500, maxWidth: 700, maxHeight: 600 }, true);
        expect(isAccepted(result)).assertTrue();
        if (originalLimits !== undefined) {
          expect(isAccepted(await applyLimits(originalLimits as window.WindowLimits))).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_1007
     * @tc.name      testSetLifeCycle1007
     * @tc.desc      Issue five concurrent requests and verify all are handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testSetLifeCycle1007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 700 }),
          applyLimits({ maxWidth: 750 }),
          applyLimits({ maxWidth: 800 }),
          applyLimits({ minWidth: 600 }),
          applyLimits({ minHeight: 500 })
        ]);
        expect(results.length).assertEqual(5);
        for (let index: number = 0; index < results.length; index++) {
          expect(isAccepted(results[index])).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_1008
     * @tc.name      testSetLifeCycle1008
     * @tc.desc      Set limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testSetLifeCycle1008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 700, maxWidth: 800 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_1009
     * @tc.name      testSetLifeCycle1009
     * @tc.desc      Apply an invalid then a valid limit and verify both.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testSetLifeCycle1009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const invalid: SetLimitsResult = await applyLimits({ minWidth: 800, maxWidth: 500 });
        const valid: SetLimitsResult = await applyLimits({ minWidth: 600, maxWidth: 700 });
        expect(isAccepted(invalid)).assertTrue();
        expect(isAccepted(valid)).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_1010
     * @tc.name      testSetLifeCycle1010
     * @tc.desc      Apply forcible limits and restore the original limits.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testSetLifeCycle1010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 600, minHeight: 500, maxWidth: 700, maxHeight: 600 }, true);
        expect(isAccepted(result)).assertTrue();
        if (originalLimits !== undefined) {
          expect(isAccepted(await applyLimits(originalLimits as window.WindowLimits))).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_1011
     * @tc.name      testSetLifeCycle1011
     * @tc.desc      Issue five concurrent requests and verify all are handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testSetLifeCycle1011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 700 }),
          applyLimits({ maxWidth: 750 }),
          applyLimits({ maxWidth: 800 }),
          applyLimits({ minWidth: 600 }),
          applyLimits({ minHeight: 500 })
        ]);
        expect(results.length).assertEqual(5);
        for (let index: number = 0; index < results.length; index++) {
          expect(isAccepted(results[index])).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_1012
     * @tc.name      testSetLifeCycle1012
     * @tc.desc      Set limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testSetLifeCycle1012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 600, maxWidth: 800 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_1013
     * @tc.name      testSetLifeCycle1013
     * @tc.desc      Apply an invalid then a valid limit and verify both.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testSetLifeCycle1013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const invalid: SetLimitsResult = await applyLimits({ minWidth: 800, maxWidth: 500 });
        const valid: SetLimitsResult = await applyLimits({ minWidth: 600, maxWidth: 700 });
        expect(isAccepted(invalid)).assertTrue();
        expect(isAccepted(valid)).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_1014
     * @tc.name      testSetLifeCycle1014
     * @tc.desc      Apply forcible limits and restore the original limits.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testSetLifeCycle1014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 600, minHeight: 500, maxWidth: 700, maxHeight: 600 }, true);
        expect(isAccepted(result)).assertTrue();
        if (originalLimits !== undefined) {
          expect(isAccepted(await applyLimits(originalLimits as window.WindowLimits))).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_1015
     * @tc.name      testSetLifeCycle1015
     * @tc.desc      Issue five concurrent requests and verify all are handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testSetLifeCycle1015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 700 }),
          applyLimits({ maxWidth: 750 }),
          applyLimits({ maxWidth: 800 }),
          applyLimits({ minWidth: 600 }),
          applyLimits({ minHeight: 500 })
        ]);
        expect(results.length).assertEqual(5);
        for (let index: number = 0; index < results.length; index++) {
          expect(isAccepted(results[index])).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_1016
     * @tc.name      testSetLifeCycle1016
     * @tc.desc      Set limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testSetLifeCycle1016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 650, maxWidth: 800 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_1017
     * @tc.name      testSetLifeCycle1017
     * @tc.desc      Apply an invalid then a valid limit and verify both.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testSetLifeCycle1017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const invalid: SetLimitsResult = await applyLimits({ minWidth: 800, maxWidth: 500 });
        const valid: SetLimitsResult = await applyLimits({ minWidth: 600, maxWidth: 700 });
        expect(isAccepted(invalid)).assertTrue();
        expect(isAccepted(valid)).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_1018
     * @tc.name      testSetLifeCycle1018
     * @tc.desc      Apply forcible limits and restore the original limits.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testSetLifeCycle1018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 600, minHeight: 500, maxWidth: 700, maxHeight: 600 }, true);
        expect(isAccepted(result)).assertTrue();
        if (originalLimits !== undefined) {
          expect(isAccepted(await applyLimits(originalLimits as window.WindowLimits))).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_1019
     * @tc.name      testSetLifeCycle1019
     * @tc.desc      Issue five concurrent requests and verify all are handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testSetLifeCycle1019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 700 }),
          applyLimits({ maxWidth: 750 }),
          applyLimits({ maxWidth: 800 }),
          applyLimits({ minWidth: 600 }),
          applyLimits({ minHeight: 500 })
        ]);
        expect(results.length).assertEqual(5);
        for (let index: number = 0; index < results.length; index++) {
          expect(isAccepted(results[index])).assertTrue();
        }
      });
    LIMIT_CASES.forEach((limitCase: LimitCase) => {
      /**
       * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0010-0071_0200-0244_0300-0399_0400-0440_0500-0669
       * @tc.name      limit matrix case
       * @tc.desc      Verify setWindowLimits with a boundary or invalid limit combination.
       * @tc.type      FUNCTION
       * @tc.size      MEDIUMTEST
       * @tc.level     LEVEL1
       */
      it(limitCase.name,
        TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', limitCase.name);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'number=%{public}s forcible=%{public}s request=%{public}s',
            limitCase.number, String(limitCase.forcible), JSON.stringify(limitCase.limits));
          const result: SetLimitsResult = await applyLimits(limitCase.limits, limitCase.forcible);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'result=%{public}s', JSON.stringify(result));
          expect(isAccepted(result)).assertTrue();
          if (result.ok) {
            expect(isUsableLimits(result.limits)).assertTrue();
          }
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', limitCase.name);
        });
    });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0080
     * @tc.name      testSetLimitsPromise0080
     * @tc.desc      Set valid limits through the callback overload and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetLimitsPromise0080',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsPromise0080 begin');
        const limits: window.WindowLimits = { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 1000 };
        hilog.info(LOG_DOMAIN, LOG_TAG, 'request=%{public}s', JSON.stringify(limits));
        const result: SetLimitsResult = await applyLimits(limits, false);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'result=%{public}s', JSON.stringify(result));
        expect(isAccepted(result)).assertTrue();
        if (result.ok) {
          expect(isUsableLimits(result.limits)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsPromise0080 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0081
     * @tc.name      testSetLimitsForciblePromise0081
     * @tc.desc      Set valid limits through the forcible callback overload and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetLimitsForciblePromise0081',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsForciblePromise0081 begin');
        const limits: window.WindowLimits = { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 1000 };
        hilog.info(LOG_DOMAIN, LOG_TAG, 'request=%{public}s', JSON.stringify(limits));
        const result: SetLimitsResult = await applyLimits(limits, true);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'result=%{public}s', JSON.stringify(result));
        expect(isAccepted(result)).assertTrue();
        if (result.ok) {
          expect(isUsableLimits(result.limits)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsForciblePromise0081 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0082
     * @tc.name      testSetLimitsConcurrent0082
     * @tc.desc      Issue two setWindowLimits requests concurrently and verify both are handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSetLimitsConcurrent0082',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsConcurrent0082 begin');
        const firstLimits: window.WindowLimits = { minWidth: 600, minHeight: 500, maxWidth: 1200, maxHeight: 900 };
        const secondLimits: window.WindowLimits = { minWidth: 700, minHeight: 550, maxWidth: 1500, maxHeight: 1000 };
        const results: SetLimitsResult[] = [];
        const firstTask: Promise<void> = applyLimits(firstLimits)
          .then((result: SetLimitsResult): void => {
            results.push(result);
          });
        const secondTask: Promise<void> = applyLimits(secondLimits)
          .then((result: SetLimitsResult): void => {
            results.push(result);
          });
        await firstTask;
        await secondTask;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'results=%{public}s', JSON.stringify(results));
        expect(results.length).assertEqual(2);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsConcurrent0082 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0083
     * @tc.name      testSetLimitsInterleavedGet0083
     * @tc.desc      Set limits and read them back synchronously step by step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetLimitsInterleavedGet0083',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsInterleavedGet0083 begin');
        const steps: window.WindowLimits[] = [
          { minWidth: 650, minHeight: 520, maxWidth: 1250, maxHeight: 920 },
          { minWidth: 700, minHeight: 550, maxWidth: 1300, maxHeight: 950 },
          { minWidth: 750, minHeight: 580, maxWidth: 1400, maxHeight: 980 }
        ];
        for (let index: number = 0; index < steps.length; index++) {
          hilog.info(LOG_DOMAIN, LOG_TAG, 'step=%{public}d request=%{public}s', index, JSON.stringify(steps[index]));
          const result: SetLimitsResult = await applyLimits(steps[index]);
          expect(isAccepted(result)).assertTrue();
          if (result.ok && limitsSupported) {
            const current: window.WindowLimits = testWindow!.getWindowLimits();
            hilog.info(LOG_DOMAIN, LOG_TAG, 'step=%{public}d current=%{public}s', index, JSON.stringify(current));
            expect(isUsableLimits(current)).assertTrue();
          }
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsInterleavedGet0083 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0084
     * @tc.name      testSetLimitsRapidRepeat0084
     * @tc.desc      Set the same limits rapidly five times and verify the results stay consistent.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetLimitsRapidRepeat0084',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsRapidRepeat0084 begin');
        const limits: window.WindowLimits = { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 1000 };
        let previous: SetLimitsResult | undefined = undefined;
        for (let index: number = 0; index < 5; index++) {
          const result: SetLimitsResult = await applyLimits(limits);
          expect(isAccepted(result)).assertTrue();
          if (result.ok && previous !== undefined && previous.ok) {
            expect(JSON.stringify(result.limits)).assertEqual(JSON.stringify(previous.limits));
          }
          previous = result;
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsRapidRepeat0084 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0085
     * @tc.name      testGetLimitsTwice0085
     * @tc.desc      Call getWindowLimits twice in a row and verify the results are consistent.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testGetLimitsTwice0085',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testGetLimitsTwice0085 begin');
        expect(testWindow !== undefined).assertTrue();
        if (!limitsSupported) {
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'device does not support window limits');
        } else {
          const first: window.WindowLimits = testWindow!.getWindowLimits();
          const second: window.WindowLimits = testWindow!.getWindowLimits();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'first=%{public}s second=%{public}s',
            JSON.stringify(first), JSON.stringify(second));
          expect(isUsableLimits(first)).assertTrue();
          expect(JSON.stringify(second)).assertEqual(JSON.stringify(first));
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testGetLimitsTwice0085 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0086
     * @tc.name      testSetLimitsNonMonotonic0086
     * @tc.desc      Set a non-monotonic limit sequence and verify each step is accepted.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetLimitsNonMonotonic0086',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsNonMonotonic0086 begin');
        const steps: window.WindowLimits[] = [
          { minWidth: 600, minHeight: 500, maxWidth: 1200, maxHeight: 900 },
          { minWidth: 750, minHeight: 600, maxWidth: 1000, maxHeight: 800 },
          { minWidth: 620, minHeight: 520, maxWidth: 1500, maxHeight: 1000 }
        ];
        for (let index: number = 0; index < steps.length; index++) {
          hilog.info(LOG_DOMAIN, LOG_TAG, 'step=%{public}d request=%{public}s', index, JSON.stringify(steps[index]));
          const result: SetLimitsResult = await applyLimits(steps[index]);
          expect(isAccepted(result)).assertTrue();
          if (result.ok) {
            expect(isUsableLimits(result.limits)).assertTrue();
          }
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsNonMonotonic0086 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0441
     * @tc.name      testSetLimitsConcurrentThree0441
     * @tc.desc      Issue three setWindowLimits requests concurrently and verify all are handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSetLimitsConcurrentThree0441',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsConcurrentThree0441 begin');
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ minWidth: 600, minHeight: 500, maxWidth: 1200, maxHeight: 900 }),
          applyLimits({ minWidth: 650, minHeight: 550, maxWidth: 1300, maxHeight: 950 }),
          applyLimits({ minWidth: 700, minHeight: 600, maxWidth: 1400, maxHeight: 1000 })
        ]);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'results=%{public}s', JSON.stringify(results));
        expect(results.length).assertEqual(3);
        for (let index: number = 0; index < results.length; index++) {
          expect(isAccepted(results[index])).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsConcurrentThree0441 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0442
     * @tc.name      testSetLimitsConcurrentFive0442
     * @tc.desc      Issue five setWindowLimits requests concurrently and verify all are handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSetLimitsConcurrentFive0442',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsConcurrentFive0442 begin');
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 1100 }),
          applyLimits({ maxWidth: 1200 }),
          applyLimits({ maxWidth: 1300 }),
          applyLimits({ maxWidth: 1400 }),
          applyLimits({ maxWidth: 1500 })
        ]);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'results=%{public}s', JSON.stringify(results));
        expect(results.length).assertEqual(5);
        for (let index: number = 0; index < results.length; index++) {
          expect(isAccepted(results[index])).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetLimitsConcurrentFive0442 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0443
     * @tc.name      testSetGetInterleavedFive0443
     * @tc.desc      Interleave set and get five times and verify each step when supported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSetGetInterleavedFive0443',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetGetInterleavedFive0443 begin');
        const widths: number[] = [600, 700, 800, 900, 1000];
        for (let index: number = 0; index < widths.length; index++) {
          const limits: window.WindowLimits = { minWidth: widths[index], maxWidth: 1500 };
          hilog.info(LOG_DOMAIN, LOG_TAG, 'step=%{public}d request=%{public}s', index, JSON.stringify(limits));
          const result: SetLimitsResult = await applyLimits(limits);
          expect(isAccepted(result)).assertTrue();
          if (result.ok && limitsSupported) {
            const current: window.WindowLimits = testWindow!.getWindowLimits();
            hilog.info(LOG_DOMAIN, LOG_TAG, 'step=%{public}d current=%{public}s', index, JSON.stringify(current));
            expect(isUsableLimits(current)).assertTrue();
          }
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSetGetInterleavedFive0443 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0444
     * @tc.name      testForcibleAfterInvalid0444
     * @tc.desc      Apply an invalid limit then a forcible valid limit; verify both are handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testForcibleAfterInvalid0444',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForcibleAfterInvalid0444 begin');
        const invalid: SetLimitsResult = await applyLimits({ minWidth: 2000, maxWidth: 1000 });
        const valid: SetLimitsResult = await applyLimits({ minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 1000 }, true);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'invalid=%{public}s valid=%{public}s',
          JSON.stringify(invalid), JSON.stringify(valid));
        expect(isAccepted(invalid)).assertTrue();
        expect(isAccepted(valid)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForcibleAfterInvalid0444 end');
      });    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_API_0090
     * @tc.name      testRestoreOriginalLimits0090
     * @tc.desc      Restore the limits captured before the test.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testRestoreOriginalLimits0090',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreOriginalLimits0090 begin');
        expect(testWindow !== undefined).assertTrue();
        if (originalLimits === undefined) {
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'no original limits, skip restore');
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreOriginalLimits0090 end');
          return;
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, 'original=%{public}s', JSON.stringify(originalLimits));
        const result: SetLimitsResult = await applyLimits(originalLimits as window.WindowLimits);
        expect(isAccepted(result)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreOriginalLimits0090 end');
      });
  });
}
