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

const MODULE_MIN_WIDTH: number = 400;
const MODULE_MAX_WIDTH: number = 2560;
const MODULE_MIN_HEIGHT: number = 200;
const MODULE_MAX_HEIGHT: number = 1300;
const MODULE_MIN_RATIO: number = 0.5;
const MODULE_MAX_RATIO: number = 3.5;

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
    name: 'testModuleJsonLimitW0100', number: '0100',
    limits: { minWidth: 400, maxWidth: 2560 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0101', number: '0101',
    limits: { minWidth: 400, maxWidth: 2400 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0102', number: '0102',
    limits: { minWidth: 400, maxWidth: 2200 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0103', number: '0103',
    limits: { minWidth: 400, maxWidth: 2000 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0104', number: '0104',
    limits: { minWidth: 400, maxWidth: 1800 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0105', number: '0105',
    limits: { minWidth: 400, maxWidth: 1600 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0106', number: '0106',
    limits: { minWidth: 400, maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0107', number: '0107',
    limits: { minWidth: 400, maxWidth: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0108', number: '0108',
    limits: { minWidth: 400, maxWidth: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0109', number: '0109',
    limits: { minWidth: 400, maxWidth: 1000 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0110', number: '0110',
    limits: { minWidth: 500, maxWidth: 2560 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0111', number: '0111',
    limits: { minWidth: 500, maxWidth: 2400 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0112', number: '0112',
    limits: { minWidth: 500, maxWidth: 2200 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0113', number: '0113',
    limits: { minWidth: 500, maxWidth: 2000 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0114', number: '0114',
    limits: { minWidth: 500, maxWidth: 1800 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0115', number: '0115',
    limits: { minWidth: 500, maxWidth: 1600 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0116', number: '0116',
    limits: { minWidth: 500, maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0117', number: '0117',
    limits: { minWidth: 500, maxWidth: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0118', number: '0118',
    limits: { minWidth: 500, maxWidth: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0119', number: '0119',
    limits: { minWidth: 500, maxWidth: 1000 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0120', number: '0120',
    limits: { minWidth: 600, maxWidth: 2560 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0121', number: '0121',
    limits: { minWidth: 600, maxWidth: 2400 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0122', number: '0122',
    limits: { minWidth: 600, maxWidth: 2200 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0123', number: '0123',
    limits: { minWidth: 600, maxWidth: 2000 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0124', number: '0124',
    limits: { minWidth: 600, maxWidth: 1800 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0125', number: '0125',
    limits: { minWidth: 600, maxWidth: 1600 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0126', number: '0126',
    limits: { minWidth: 600, maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0127', number: '0127',
    limits: { minWidth: 600, maxWidth: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0128', number: '0128',
    limits: { minWidth: 600, maxWidth: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0129', number: '0129',
    limits: { minWidth: 600, maxWidth: 1000 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0130', number: '0130',
    limits: { minWidth: 700, maxWidth: 2560 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0131', number: '0131',
    limits: { minWidth: 700, maxWidth: 2400 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0132', number: '0132',
    limits: { minWidth: 700, maxWidth: 2200 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0133', number: '0133',
    limits: { minWidth: 700, maxWidth: 2000 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0134', number: '0134',
    limits: { minWidth: 700, maxWidth: 1800 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0135', number: '0135',
    limits: { minWidth: 700, maxWidth: 1600 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0136', number: '0136',
    limits: { minWidth: 700, maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0137', number: '0137',
    limits: { minWidth: 700, maxWidth: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0138', number: '0138',
    limits: { minWidth: 700, maxWidth: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0139', number: '0139',
    limits: { minWidth: 700, maxWidth: 1000 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0140', number: '0140',
    limits: { minWidth: 800, maxWidth: 2560 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0141', number: '0141',
    limits: { minWidth: 800, maxWidth: 2400 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0142', number: '0142',
    limits: { minWidth: 800, maxWidth: 2200 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0143', number: '0143',
    limits: { minWidth: 800, maxWidth: 2000 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0144', number: '0144',
    limits: { minWidth: 800, maxWidth: 1800 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0145', number: '0145',
    limits: { minWidth: 800, maxWidth: 1600 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0146', number: '0146',
    limits: { minWidth: 800, maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0147', number: '0147',
    limits: { minWidth: 800, maxWidth: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0148', number: '0148',
    limits: { minWidth: 800, maxWidth: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0149', number: '0149',
    limits: { minWidth: 800, maxWidth: 1000 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0150', number: '0150',
    limits: { minWidth: 900, maxWidth: 2560 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0151', number: '0151',
    limits: { minWidth: 900, maxWidth: 2400 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0152', number: '0152',
    limits: { minWidth: 900, maxWidth: 2200 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0153', number: '0153',
    limits: { minWidth: 900, maxWidth: 2000 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0154', number: '0154',
    limits: { minWidth: 900, maxWidth: 1800 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0155', number: '0155',
    limits: { minWidth: 900, maxWidth: 1600 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0156', number: '0156',
    limits: { minWidth: 900, maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0157', number: '0157',
    limits: { minWidth: 900, maxWidth: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0158', number: '0158',
    limits: { minWidth: 900, maxWidth: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0159', number: '0159',
    limits: { minWidth: 900, maxWidth: 1000 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0160', number: '0160',
    limits: { minWidth: 1000, maxWidth: 2560 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0161', number: '0161',
    limits: { minWidth: 1000, maxWidth: 2400 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0162', number: '0162',
    limits: { minWidth: 1000, maxWidth: 2200 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0163', number: '0163',
    limits: { minWidth: 1000, maxWidth: 2000 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0164', number: '0164',
    limits: { minWidth: 1000, maxWidth: 1800 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0165', number: '0165',
    limits: { minWidth: 1000, maxWidth: 1600 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0166', number: '0166',
    limits: { minWidth: 1000, maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0167', number: '0167',
    limits: { minWidth: 1000, maxWidth: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0168', number: '0168',
    limits: { minWidth: 1000, maxWidth: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0169', number: '0169',
    limits: { minWidth: 1000, maxWidth: 1000 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0170', number: '0170',
    limits: { minWidth: 1200, maxWidth: 2560 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0171', number: '0171',
    limits: { minWidth: 1200, maxWidth: 2400 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0172', number: '0172',
    limits: { minWidth: 1200, maxWidth: 2200 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0173', number: '0173',
    limits: { minWidth: 1200, maxWidth: 2000 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0174', number: '0174',
    limits: { minWidth: 1200, maxWidth: 1800 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0175', number: '0175',
    limits: { minWidth: 1200, maxWidth: 1600 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0176', number: '0176',
    limits: { minWidth: 1200, maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0177', number: '0177',
    limits: { minWidth: 1200, maxWidth: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0178', number: '0178',
    limits: { minWidth: 1200, maxWidth: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0179', number: '0179',
    limits: { minWidth: 1200, maxWidth: 1000 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0180', number: '0180',
    limits: { minWidth: 1500, maxWidth: 2560 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0181', number: '0181',
    limits: { minWidth: 1500, maxWidth: 2400 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0182', number: '0182',
    limits: { minWidth: 1500, maxWidth: 2200 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0183', number: '0183',
    limits: { minWidth: 1500, maxWidth: 2000 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0184', number: '0184',
    limits: { minWidth: 1500, maxWidth: 1800 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0185', number: '0185',
    limits: { minWidth: 1500, maxWidth: 1600 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0186', number: '0186',
    limits: { minWidth: 1500, maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0187', number: '0187',
    limits: { minWidth: 1500, maxWidth: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0188', number: '0188',
    limits: { minWidth: 1500, maxWidth: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0189', number: '0189',
    limits: { minWidth: 1500, maxWidth: 1000 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0190', number: '0190',
    limits: { minWidth: 2000, maxWidth: 2560 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0191', number: '0191',
    limits: { minWidth: 2000, maxWidth: 2400 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0192', number: '0192',
    limits: { minWidth: 2000, maxWidth: 2200 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0193', number: '0193',
    limits: { minWidth: 2000, maxWidth: 2000 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0194', number: '0194',
    limits: { minWidth: 2000, maxWidth: 1800 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0195', number: '0195',
    limits: { minWidth: 2000, maxWidth: 1600 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0196', number: '0196',
    limits: { minWidth: 2000, maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0197', number: '0197',
    limits: { minWidth: 2000, maxWidth: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0198', number: '0198',
    limits: { minWidth: 2000, maxWidth: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitW0199', number: '0199',
    limits: { minWidth: 2000, maxWidth: 1000 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0200', number: '0200',
    limits: { minHeight: 200, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0201', number: '0201',
    limits: { minHeight: 200, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0202', number: '0202',
    limits: { minHeight: 200, maxHeight: 1150 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0203', number: '0203',
    limits: { minHeight: 200, maxHeight: 1100 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0204', number: '0204',
    limits: { minHeight: 200, maxHeight: 1050 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0205', number: '0205',
    limits: { minHeight: 200, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0206', number: '0206',
    limits: { minHeight: 200, maxHeight: 950 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0207', number: '0207',
    limits: { minHeight: 200, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0208', number: '0208',
    limits: { minHeight: 200, maxHeight: 850 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0209', number: '0209',
    limits: { minHeight: 200, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0210', number: '0210',
    limits: { minHeight: 250, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0211', number: '0211',
    limits: { minHeight: 250, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0212', number: '0212',
    limits: { minHeight: 250, maxHeight: 1150 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0213', number: '0213',
    limits: { minHeight: 250, maxHeight: 1100 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0214', number: '0214',
    limits: { minHeight: 250, maxHeight: 1050 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0215', number: '0215',
    limits: { minHeight: 250, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0216', number: '0216',
    limits: { minHeight: 250, maxHeight: 950 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0217', number: '0217',
    limits: { minHeight: 250, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0218', number: '0218',
    limits: { minHeight: 250, maxHeight: 850 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0219', number: '0219',
    limits: { minHeight: 250, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0220', number: '0220',
    limits: { minHeight: 300, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0221', number: '0221',
    limits: { minHeight: 300, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0222', number: '0222',
    limits: { minHeight: 300, maxHeight: 1150 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0223', number: '0223',
    limits: { minHeight: 300, maxHeight: 1100 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0224', number: '0224',
    limits: { minHeight: 300, maxHeight: 1050 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0225', number: '0225',
    limits: { minHeight: 300, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0226', number: '0226',
    limits: { minHeight: 300, maxHeight: 950 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0227', number: '0227',
    limits: { minHeight: 300, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0228', number: '0228',
    limits: { minHeight: 300, maxHeight: 850 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0229', number: '0229',
    limits: { minHeight: 300, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0230', number: '0230',
    limits: { minHeight: 350, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0231', number: '0231',
    limits: { minHeight: 350, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0232', number: '0232',
    limits: { minHeight: 350, maxHeight: 1150 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0233', number: '0233',
    limits: { minHeight: 350, maxHeight: 1100 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0234', number: '0234',
    limits: { minHeight: 350, maxHeight: 1050 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0235', number: '0235',
    limits: { minHeight: 350, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0236', number: '0236',
    limits: { minHeight: 350, maxHeight: 950 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0237', number: '0237',
    limits: { minHeight: 350, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0238', number: '0238',
    limits: { minHeight: 350, maxHeight: 850 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0239', number: '0239',
    limits: { minHeight: 350, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0240', number: '0240',
    limits: { minHeight: 400, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0241', number: '0241',
    limits: { minHeight: 400, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0242', number: '0242',
    limits: { minHeight: 400, maxHeight: 1150 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0243', number: '0243',
    limits: { minHeight: 400, maxHeight: 1100 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0244', number: '0244',
    limits: { minHeight: 400, maxHeight: 1050 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0245', number: '0245',
    limits: { minHeight: 400, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0246', number: '0246',
    limits: { minHeight: 400, maxHeight: 950 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0247', number: '0247',
    limits: { minHeight: 400, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0248', number: '0248',
    limits: { minHeight: 400, maxHeight: 850 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0249', number: '0249',
    limits: { minHeight: 400, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0250', number: '0250',
    limits: { minHeight: 500, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0251', number: '0251',
    limits: { minHeight: 500, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0252', number: '0252',
    limits: { minHeight: 500, maxHeight: 1150 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0253', number: '0253',
    limits: { minHeight: 500, maxHeight: 1100 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0254', number: '0254',
    limits: { minHeight: 500, maxHeight: 1050 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0255', number: '0255',
    limits: { minHeight: 500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0256', number: '0256',
    limits: { minHeight: 500, maxHeight: 950 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0257', number: '0257',
    limits: { minHeight: 500, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0258', number: '0258',
    limits: { minHeight: 500, maxHeight: 850 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0259', number: '0259',
    limits: { minHeight: 500, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0260', number: '0260',
    limits: { minHeight: 600, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0261', number: '0261',
    limits: { minHeight: 600, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0262', number: '0262',
    limits: { minHeight: 600, maxHeight: 1150 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0263', number: '0263',
    limits: { minHeight: 600, maxHeight: 1100 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0264', number: '0264',
    limits: { minHeight: 600, maxHeight: 1050 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0265', number: '0265',
    limits: { minHeight: 600, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0266', number: '0266',
    limits: { minHeight: 600, maxHeight: 950 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0267', number: '0267',
    limits: { minHeight: 600, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0268', number: '0268',
    limits: { minHeight: 600, maxHeight: 850 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0269', number: '0269',
    limits: { minHeight: 600, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0270', number: '0270',
    limits: { minHeight: 700, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0271', number: '0271',
    limits: { minHeight: 700, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0272', number: '0272',
    limits: { minHeight: 700, maxHeight: 1150 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0273', number: '0273',
    limits: { minHeight: 700, maxHeight: 1100 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0274', number: '0274',
    limits: { minHeight: 700, maxHeight: 1050 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0275', number: '0275',
    limits: { minHeight: 700, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0276', number: '0276',
    limits: { minHeight: 700, maxHeight: 950 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0277', number: '0277',
    limits: { minHeight: 700, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0278', number: '0278',
    limits: { minHeight: 700, maxHeight: 850 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0279', number: '0279',
    limits: { minHeight: 700, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0280', number: '0280',
    limits: { minHeight: 800, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0281', number: '0281',
    limits: { minHeight: 800, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0282', number: '0282',
    limits: { minHeight: 800, maxHeight: 1150 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0283', number: '0283',
    limits: { minHeight: 800, maxHeight: 1100 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0284', number: '0284',
    limits: { minHeight: 800, maxHeight: 1050 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0285', number: '0285',
    limits: { minHeight: 800, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0286', number: '0286',
    limits: { minHeight: 800, maxHeight: 950 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0287', number: '0287',
    limits: { minHeight: 800, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0288', number: '0288',
    limits: { minHeight: 800, maxHeight: 850 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0289', number: '0289',
    limits: { minHeight: 800, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0290', number: '0290',
    limits: { minHeight: 900, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0291', number: '0291',
    limits: { minHeight: 900, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0292', number: '0292',
    limits: { minHeight: 900, maxHeight: 1150 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0293', number: '0293',
    limits: { minHeight: 900, maxHeight: 1100 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0294', number: '0294',
    limits: { minHeight: 900, maxHeight: 1050 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0295', number: '0295',
    limits: { minHeight: 900, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0296', number: '0296',
    limits: { minHeight: 900, maxHeight: 950 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0297', number: '0297',
    limits: { minHeight: 900, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0298', number: '0298',
    limits: { minHeight: 900, maxHeight: 850 }, forcible: false
  },
  {
    name: 'testModuleJsonLimitH0299', number: '0299',
    limits: { minHeight: 900, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testModuleJsonBvaW0300', number: '0300',
    limits: { minWidth: 399, maxWidth: 2559 }, forcible: false
  },
  {
    name: 'testModuleJsonBvaW0301', number: '0301',
    limits: { minWidth: 399, maxWidth: 2560 }, forcible: false
  },
  {
    name: 'testModuleJsonBvaW0302', number: '0302',
    limits: { minWidth: 399, maxWidth: 2561 }, forcible: false
  },
  {
    name: 'testModuleJsonBvaW0303', number: '0303',
    limits: { minWidth: 400, maxWidth: 2559 }, forcible: false
  },
  {
    name: 'testModuleJsonBvaW0304', number: '0304',
    limits: { minWidth: 400, maxWidth: 2560 }, forcible: false
  },
  {
    name: 'testModuleJsonBvaW0305', number: '0305',
    limits: { minWidth: 400, maxWidth: 2561 }, forcible: false
  },
  {
    name: 'testModuleJsonBvaW0306', number: '0306',
    limits: { minWidth: 401, maxWidth: 2559 }, forcible: false
  },
  {
    name: 'testModuleJsonBvaW0307', number: '0307',
    limits: { minWidth: 401, maxWidth: 2560 }, forcible: false
  },
  {
    name: 'testModuleJsonBvaW0308', number: '0308',
    limits: { minWidth: 401, maxWidth: 2561 }, forcible: false
  },
  {
    name: 'testModuleJsonBvaH0309', number: '0309',
    limits: { minHeight: 199, maxHeight: 1299 }, forcible: false
  },
  {
    name: 'testModuleJsonBvaH0310', number: '0310',
    limits: { minHeight: 199, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonBvaH0311', number: '0311',
    limits: { minHeight: 199, maxHeight: 1301 }, forcible: false
  },
  {
    name: 'testModuleJsonBvaH0312', number: '0312',
    limits: { minHeight: 200, maxHeight: 1299 }, forcible: false
  },
  {
    name: 'testModuleJsonBvaH0313', number: '0313',
    limits: { minHeight: 200, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonBvaH0314', number: '0314',
    limits: { minHeight: 200, maxHeight: 1301 }, forcible: false
  },
  {
    name: 'testModuleJsonBvaH0315', number: '0315',
    limits: { minHeight: 201, maxHeight: 1299 }, forcible: false
  },
  {
    name: 'testModuleJsonBvaH0316', number: '0316',
    limits: { minHeight: 201, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonBvaH0317', number: '0317',
    limits: { minHeight: 201, maxHeight: 1301 }, forcible: false
  },
  {
    name: 'testModuleJsonSpecial0320', number: '0320',
    limits: { maxWidth: 0, maxHeight: 0 }, forcible: false
  },
  {
    name: 'testModuleJsonSpecial0321', number: '0321',
    limits: { maxWidth: -1, maxHeight: -1 }, forcible: false
  },
  {
    name: 'testModuleJsonSpecial0322', number: '0322',
    limits: { maxWidth: 0.5, maxHeight: 0.5 }, forcible: false
  },
  {
    name: 'testModuleJsonSpecial0323', number: '0323',
    limits: { maxWidth: 1000000, maxHeight: 1000000 }, forcible: false
  },
  {
    name: 'testModuleJsonSpecial0324', number: '0324',
    limits: { maxWidth: 1000000000, maxHeight: 1000000000 }, forcible: false
  },
  {
    name: 'testModuleJsonSpecial0325', number: '0325',
    limits: { maxWidth: Number.MAX_SAFE_INTEGER, maxHeight: Number.MAX_SAFE_INTEGER }, forcible: false
  },
  {
    name: 'testModuleJsonSpecial0326', number: '0326',
    limits: { maxWidth: Number.POSITIVE_INFINITY, maxHeight: Number.POSITIVE_INFINITY }, forcible: false
  },
  {
    name: 'testModuleJsonSpecial0327', number: '0327',
    limits: { maxWidth: Number.NEGATIVE_INFINITY, maxHeight: Number.NEGATIVE_INFINITY }, forcible: false
  },
  {
    name: 'testModuleJsonSpecial0328', number: '0328',
    limits: { maxWidth: Number.NaN, maxHeight: Number.NaN }, forcible: false
  },
  {
    name: 'testModuleJsonSpecial0329', number: '0329',
    limits: { maxWidth: -0, maxHeight: -0 }, forcible: false
  },
  {
    name: 'testModuleJsonForcible0330', number: '0330',
    limits: { minWidth: 400, minHeight: 200, maxWidth: 2560, maxHeight: 1300 }, forcible: true
  },
  {
    name: 'testModuleJsonForcible0331', number: '0331',
    limits: { minWidth: 0, minHeight: 0, maxWidth: 0, maxHeight: 0 }, forcible: true
  },
  {
    name: 'testModuleJsonForcible0332', number: '0332',
    limits: { minWidth: 2000, minHeight: 2000, maxWidth: 1000, maxHeight: 1000 }, forcible: true
  },
  {
    name: 'testModuleJsonForcible0333', number: '0333',
    limits: { minWidth: -1, minHeight: -1, maxWidth: -1, maxHeight: -1 }, forcible: true
  },
  {
    name: 'testModuleJsonForcible0334', number: '0334',
    limits: { minWidth: 2560, minHeight: 200, maxWidth: 2560, maxHeight: 200 }, forcible: true
  },
  {
    name: 'testModuleJsonForcible0335', number: '0335',
    limits: { minWidth: 400, minHeight: 1300, maxWidth: 400, maxHeight: 1300 }, forcible: true
  },
  {
    name: 'testModuleJsonPresence0340', number: '0340',
    limits: { minWidth: 400 }, forcible: false
  },
  {
    name: 'testModuleJsonPresence0341', number: '0341',
    limits: { minHeight: 200 }, forcible: false
  },
  {
    name: 'testModuleJsonPresence0342', number: '0342',
    limits: { minWidth: 400, minHeight: 200 }, forcible: false
  },
  {
    name: 'testModuleJsonPresence0343', number: '0343',
    limits: { maxWidth: 2560 }, forcible: false
  },
  {
    name: 'testModuleJsonPresence0344', number: '0344',
    limits: { minWidth: 400, maxWidth: 2560 }, forcible: false
  },
  {
    name: 'testModuleJsonPresence0345', number: '0345',
    limits: { minHeight: 200, maxWidth: 2560 }, forcible: false
  },
  {
    name: 'testModuleJsonPresence0346', number: '0346',
    limits: { minWidth: 400, minHeight: 200, maxWidth: 2560 }, forcible: false
  },
  {
    name: 'testModuleJsonPresence0347', number: '0347',
    limits: { maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonPresence0348', number: '0348',
    limits: { minWidth: 400, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonPresence0349', number: '0349',
    limits: { minHeight: 200, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonPresence0350', number: '0350',
    limits: { minWidth: 400, minHeight: 200, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonPresence0351', number: '0351',
    limits: { maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonPresence0352', number: '0352',
    limits: { minWidth: 400, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonPresence0353', number: '0353',
    limits: { minHeight: 200, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonPresence0354', number: '0354',
    limits: { minWidth: 400, minHeight: 200, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioPair0355', number: '0355',
    limits: { minWidth: 400, minHeight: 200, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioPair0356', number: '0356',
    limits: { minWidth: 400, minHeight: 200, maxWidth: 1400, maxHeight: 400 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioPair0357', number: '0357',
    limits: { minWidth: 400, minHeight: 200, maxWidth: 2000, maxHeight: 600 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioPair0358', number: '0358',
    limits: { minWidth: 400, minHeight: 200, maxWidth: 2560, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioPair0359', number: '0359',
    limits: { minWidth: 500, minHeight: 300, maxWidth: 1500, maxHeight: 500 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioPair0360', number: '0360',
    limits: { minWidth: 600, minHeight: 400, maxWidth: 1800, maxHeight: 600 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioPair0361', number: '0361',
    limits: { minWidth: 700, minHeight: 500, maxWidth: 2100, maxHeight: 700 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioPair0362', number: '0362',
    limits: { minWidth: 800, minHeight: 600, maxWidth: 2400, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioPair0363', number: '0363',
    limits: { minWidth: 400, minHeight: 1000, maxWidth: 600, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioPair0364', number: '0364',
    limits: { minWidth: 500, minHeight: 1000, maxWidth: 700, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioPair0365', number: '0365',
    limits: { minWidth: 600, minHeight: 1000, maxWidth: 800, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioPair0366', number: '0366',
    limits: { minWidth: 700, minHeight: 1000, maxWidth: 900, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioPair0367', number: '0367',
    limits: { minWidth: 400, minHeight: 500, maxWidth: 800, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioPair0368', number: '0368',
    limits: { minWidth: 450, minHeight: 550, maxWidth: 900, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioPair0369', number: '0369',
    limits: { minWidth: 500, minHeight: 600, maxWidth: 1000, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioPair0370', number: '0370',
    limits: { minWidth: 550, minHeight: 650, maxWidth: 1100, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioPair0371', number: '0371',
    limits: { minWidth: 2560, minHeight: 200, maxWidth: 2560, maxHeight: 400 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioPair0372', number: '0372',
    limits: { minWidth: 400, minHeight: 1300, maxWidth: 500, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioPair0373', number: '0373',
    limits: { minWidth: 1200, minHeight: 400, maxWidth: 2400, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioPair0374', number: '0374',
    limits: { minWidth: 800, minHeight: 700, maxWidth: 1600, maxHeight: 1100 }, forcible: false
  },
  {
    name: 'testModuleJsonPrecision0375', number: '0375',
    limits: { maxWidth: 2560.5, maxHeight: 2560.5 }, forcible: false
  },
  {
    name: 'testModuleJsonPrecision0376', number: '0376',
    limits: { maxWidth: 2560.999, maxHeight: 2560.999 }, forcible: false
  },
  {
    name: 'testModuleJsonPrecision0377', number: '0377',
    limits: { maxWidth: 2559.5, maxHeight: 2559.5 }, forcible: false
  },
  {
    name: 'testModuleJsonPrecision0378', number: '0378',
    limits: { maxWidth: 0.1, maxHeight: 0.1 }, forcible: false
  },
  {
    name: 'testModuleJsonPrecision0379', number: '0379',
    limits: { maxWidth: 0.5, maxHeight: 0.5 }, forcible: false
  },
  {
    name: 'testModuleJsonPrecision0380', number: '0380',
    limits: { maxWidth: 0.999, maxHeight: 0.999 }, forcible: false
  },
  {
    name: 'testModuleJsonPrecision0381', number: '0381',
    limits: { maxWidth: 0.001, maxHeight: 0.001 }, forcible: false
  },
  {
    name: 'testModuleJsonPrecision0382', number: '0382',
    limits: { maxWidth: 0.000001, maxHeight: 0.000001 }, forcible: false
  },
  {
    name: 'testModuleJsonPrecision0383', number: '0383',
    limits: { maxWidth: 1280.25, maxHeight: 1280.25 }, forcible: false
  },
  {
    name: 'testModuleJsonPrecision0384', number: '0384',
    limits: { maxWidth: 2560.0001, maxHeight: 2560.0001 }, forcible: false
  },
  {
    name: 'testModuleJsonHuge0385', number: '0385',
    limits: { minWidth: 1000000000 }, forcible: false
  },
  {
    name: 'testModuleJsonHuge0386', number: '0386',
    limits: { minHeight: 1000000000 }, forcible: false
  },
  {
    name: 'testModuleJsonHuge0387', number: '0387',
    limits: { maxWidth: 1000000000 }, forcible: false
  },
  {
    name: 'testModuleJsonHuge0388', number: '0388',
    limits: { maxHeight: 1000000000 }, forcible: false
  },
  {
    name: 'testModuleJsonHuge0389', number: '0389',
    limits: { maxWidth: Number.MAX_SAFE_INTEGER }, forcible: false
  },
  {
    name: 'testModuleJsonHuge0390', number: '0390',
    limits: { maxHeight: Number.POSITIVE_INFINITY }, forcible: false
  },
  {
    name: 'testModuleJsonHuge0391', number: '0391',
    limits: { minWidth: Number.POSITIVE_INFINITY }, forcible: false
  },
  {
    name: 'testModuleJsonHuge0392', number: '0392',
    limits: { maxHeight: 1000000000000 }, forcible: false
  },
  {
    name: 'testModuleJsonInverted0393', number: '0393',
    limits: { minWidth: 2560, maxWidth: 400 }, forcible: false
  },
  {
    name: 'testModuleJsonInverted0394', number: '0394',
    limits: { minHeight: 1300, maxHeight: 200 }, forcible: false
  },
  {
    name: 'testModuleJsonInverted0395', number: '0395',
    limits: { minWidth: 2560, minHeight: 200, maxWidth: 400, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonInverted0396', number: '0396',
    limits: { minWidth: 2561, maxWidth: 400 }, forcible: false
  },
  {
    name: 'testModuleJsonInverted0397', number: '0397',
    limits: { minWidth: 2560, maxWidth: 399 }, forcible: false
  },
  {
    name: 'testModuleJsonInverted0398', number: '0398',
    limits: { minHeight: 1301, maxHeight: 200 }, forcible: false
  },
  {
    name: 'testModuleJsonInverted0399', number: '0399',
    limits: { minHeight: 1300, maxHeight: 199 }, forcible: false
  },
  {
    name: 'testModuleJsonMinBoundary0400', number: '0400',
    limits: { minWidth: 399, minHeight: 199, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonMinBoundary0401', number: '0401',
    limits: { minWidth: 399, minHeight: 200, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonMinBoundary0402', number: '0402',
    limits: { minWidth: 399, minHeight: 201, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonMinBoundary0403', number: '0403',
    limits: { minWidth: 400, minHeight: 199, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonMinBoundary0404', number: '0404',
    limits: { minWidth: 400, minHeight: 200, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonMinBoundary0405', number: '0405',
    limits: { minWidth: 400, minHeight: 201, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonMinBoundary0406', number: '0406',
    limits: { minWidth: 401, minHeight: 199, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonMinBoundary0407', number: '0407',
    limits: { minWidth: 401, minHeight: 200, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonMinBoundary0408', number: '0408',
    limits: { minWidth: 401, minHeight: 201, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonMaxBoundary0409', number: '0409',
    limits: { minWidth: 400, minHeight: 200, maxWidth: 2559, maxHeight: 1299 }, forcible: false
  },
  {
    name: 'testModuleJsonMaxBoundary0410', number: '0410',
    limits: { minWidth: 400, minHeight: 200, maxWidth: 2559, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonMaxBoundary0411', number: '0411',
    limits: { minWidth: 400, minHeight: 200, maxWidth: 2559, maxHeight: 1301 }, forcible: false
  },
  {
    name: 'testModuleJsonMaxBoundary0412', number: '0412',
    limits: { minWidth: 400, minHeight: 200, maxWidth: 2560, maxHeight: 1299 }, forcible: false
  },
  {
    name: 'testModuleJsonMaxBoundary0413', number: '0413',
    limits: { minWidth: 400, minHeight: 200, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonMaxBoundary0414', number: '0414',
    limits: { minWidth: 400, minHeight: 200, maxWidth: 2560, maxHeight: 1301 }, forcible: false
  },
  {
    name: 'testModuleJsonMaxBoundary0415', number: '0415',
    limits: { minWidth: 400, minHeight: 200, maxWidth: 2561, maxHeight: 1299 }, forcible: false
  },
  {
    name: 'testModuleJsonMaxBoundary0416', number: '0416',
    limits: { minWidth: 400, minHeight: 200, maxWidth: 2561, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonMaxBoundary0417', number: '0417',
    limits: { minWidth: 400, minHeight: 200, maxWidth: 2561, maxHeight: 1301 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioGrid0470', number: '0470',
    limits: { minWidth: 400, minHeight: 200, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioGrid0471', number: '0471',
    limits: { minWidth: 400, minHeight: 400, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioGrid0472', number: '0472',
    limits: { minWidth: 400, minHeight: 600, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioGrid0473', number: '0473',
    limits: { minWidth: 400, minHeight: 800, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioGrid0474', number: '0474',
    limits: { minWidth: 400, minHeight: 1000, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioGrid0475', number: '0475',
    limits: { minWidth: 400, minHeight: 1200, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioGrid0476', number: '0476',
    limits: { minWidth: 600, minHeight: 200, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioGrid0477', number: '0477',
    limits: { minWidth: 600, minHeight: 400, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioGrid0478', number: '0478',
    limits: { minWidth: 600, minHeight: 600, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioGrid0479', number: '0479',
    limits: { minWidth: 600, minHeight: 800, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioGrid0480', number: '0480',
    limits: { minWidth: 600, minHeight: 1000, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioGrid0481', number: '0481',
    limits: { minWidth: 600, minHeight: 1200, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioGrid0482', number: '0482',
    limits: { minWidth: 800, minHeight: 200, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioGrid0483', number: '0483',
    limits: { minWidth: 800, minHeight: 400, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioGrid0484', number: '0484',
    limits: { minWidth: 800, minHeight: 600, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioGrid0485', number: '0485',
    limits: { minWidth: 800, minHeight: 800, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioGrid0486', number: '0486',
    limits: { minWidth: 800, minHeight: 1000, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioGrid0487', number: '0487',
    limits: { minWidth: 800, minHeight: 1200, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioGrid0488', number: '0488',
    limits: { minWidth: 1000, minHeight: 200, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioGrid0489', number: '0489',
    limits: { minWidth: 1000, minHeight: 400, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioGrid0490', number: '0490',
    limits: { minWidth: 1000, minHeight: 600, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioGrid0491', number: '0491',
    limits: { minWidth: 1000, minHeight: 800, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioGrid0492', number: '0492',
    limits: { minWidth: 1000, minHeight: 1000, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioGrid0493', number: '0493',
    limits: { minWidth: 1000, minHeight: 1200, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioGrid0494', number: '0494',
    limits: { minWidth: 1200, minHeight: 200, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioGrid0495', number: '0495',
    limits: { minWidth: 1200, minHeight: 400, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioGrid0496', number: '0496',
    limits: { minWidth: 1200, minHeight: 600, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioGrid0497', number: '0497',
    limits: { minWidth: 1200, minHeight: 800, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioGrid0498', number: '0498',
    limits: { minWidth: 1200, minHeight: 1000, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonRatioGrid0499', number: '0499',
    limits: { minWidth: 1200, minHeight: 1200, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonMixedRatio0500', number: '0500',
    limits: { minWidth: 400, minHeight: 200, maxWidth: 900, maxHeight: 400 }, forcible: false
  },
  {
    name: 'testModuleJsonMixedRatio0501', number: '0501',
    limits: { minWidth: 500, minHeight: 200, maxWidth: 1100, maxHeight: 400 }, forcible: false
  },
  {
    name: 'testModuleJsonMixedRatio0502', number: '0502',
    limits: { minWidth: 600, minHeight: 300, maxWidth: 1300, maxHeight: 500 }, forcible: false
  },
  {
    name: 'testModuleJsonMixedRatio0503', number: '0503',
    limits: { minWidth: 700, minHeight: 300, maxWidth: 1500, maxHeight: 600 }, forcible: false
  },
  {
    name: 'testModuleJsonMixedRatio0504', number: '0504',
    limits: { minWidth: 800, minHeight: 400, maxWidth: 1700, maxHeight: 600 }, forcible: false
  },
  {
    name: 'testModuleJsonMixedRatio0505', number: '0505',
    limits: { minWidth: 900, minHeight: 400, maxWidth: 1900, maxHeight: 700 }, forcible: false
  },
  {
    name: 'testModuleJsonMixedRatio0506', number: '0506',
    limits: { minWidth: 1000, minHeight: 500, maxWidth: 2100, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testModuleJsonMixedRatio0507', number: '0507',
    limits: { minWidth: 1100, minHeight: 500, maxWidth: 2300, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testModuleJsonMixedRatio0508', number: '0508',
    limits: { minWidth: 1200, minHeight: 600, maxWidth: 2500, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testModuleJsonMixedRatio0509', number: '0509',
    limits: { minWidth: 1300, minHeight: 600, maxWidth: 2560, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testModuleJsonMixedRatio0510', number: '0510',
    limits: { minWidth: 1400, minHeight: 700, maxWidth: 2560, maxHeight: 1100 }, forcible: false
  },
  {
    name: 'testModuleJsonMixedRatio0511', number: '0511',
    limits: { minWidth: 1500, minHeight: 700, maxWidth: 2560, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonMixedRatio0512', number: '0512',
    limits: { minWidth: 1600, minHeight: 800, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonMixedRatio0513', number: '0513',
    limits: { minWidth: 1700, minHeight: 900, maxWidth: 2400, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonMixedRatio0514', number: '0514',
    limits: { minWidth: 1800, minHeight: 1000, maxWidth: 2200, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonMixedRatio0515', number: '0515',
    limits: { minWidth: 1900, minHeight: 1100, maxWidth: 2000, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonMixedRatio0516', number: '0516',
    limits: { minWidth: 400, minHeight: 400, maxWidth: 600, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonMixedRatio0517', number: '0517',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 800, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonMixedRatio0518', number: '0518',
    limits: { minWidth: 800, minHeight: 600, maxWidth: 1000, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonMixedRatio0519', number: '0519',
    limits: { minWidth: 1000, minHeight: 700, maxWidth: 1200, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonMixedRatio0520', number: '0520',
    limits: { minWidth: 400, minHeight: 800, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonMixedRatio0521', number: '0521',
    limits: { minWidth: 600, minHeight: 900, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonMixedRatio0522', number: '0522',
    limits: { minWidth: 800, minHeight: 1000, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonMixedRatio0523', number: '0523',
    limits: { minWidth: 1000, minHeight: 1100, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonMixedRatio0524', number: '0524',
    limits: { minWidth: 400, minHeight: 200, maxWidth: 400, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonMixedRatio0525', number: '0525',
    limits: { minWidth: 2560, minHeight: 200, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonMixedRatio0526', number: '0526',
    limits: { minWidth: 500, minHeight: 650, maxWidth: 2500, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonMixedRatio0527', number: '0527',
    limits: { minWidth: 700, minHeight: 750, maxWidth: 2300, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonMixedRatio0528', number: '0528',
    limits: { minWidth: 900, minHeight: 850, maxWidth: 2100, maxHeight: 1100 }, forcible: false
  },
  {
    name: 'testModuleJsonMixedRatio0529', number: '0529',
    limits: { minWidth: 1100, minHeight: 950, maxWidth: 1900, maxHeight: 1050 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction0530', number: '0530',
    limits: { minWidth: 400.5, minHeight: 200.5, maxWidth: 2560.5, maxHeight: 1300.5 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction0531', number: '0531',
    limits: { minWidth: 500.25, minHeight: 250.25, maxWidth: 2000.75, maxHeight: 1000.75 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction0532', number: '0532',
    limits: { minWidth: 600.1, minHeight: 300.1, maxWidth: 1800.1, maxHeight: 900.1 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction0533', number: '0533',
    limits: { minWidth: 700.9, minHeight: 400.9, maxWidth: 1600.9, maxHeight: 800.9 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction0534', number: '0534',
    limits: { minWidth: 800.5, minHeight: 500.5, maxWidth: 1400.5, maxHeight: 700.5 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction0535', number: '0535',
    limits: { minWidth: 900.75, minHeight: 600.75, maxWidth: 1200.75, maxHeight: 650.75 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction0536', number: '0536',
    limits: { minWidth: 1000.1, minHeight: 700.1, maxWidth: 1100.1, maxHeight: 600.1 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction0537', number: '0537',
    limits: { minWidth: 400.99, minHeight: 200.99, maxWidth: 2560.99, maxHeight: 1300.99 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction0538', number: '0538',
    limits: { minWidth: 1200.5, minHeight: 900.5, maxWidth: 2560.5, maxHeight: 1300.5 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction0539', number: '0539',
    limits: { minWidth: 1500.5, minHeight: 1000.5, maxWidth: 2560.5, maxHeight: 1300.5 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction0540', number: '0540',
    limits: { minWidth: 400, minHeight: 200, maxWidth: 2560.5, maxHeight: 1300.5 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction0541', number: '0541',
    limits: { minWidth: 400.5, minHeight: 200.5, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction0542', number: '0542',
    limits: { minWidth: 400, minHeight: 200.5, maxWidth: 2560, maxHeight: 1300.5 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction0543', number: '0543',
    limits: { minWidth: 400.5, minHeight: 200, maxWidth: 2560.5, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction0544', number: '0544',
    limits: { minWidth: 0.5, minHeight: 0.5, maxWidth: 1.5, maxHeight: 1.5 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction0545', number: '0545',
    limits: { minWidth: 2559.5, minHeight: 1299.5, maxWidth: 2560.5, maxHeight: 1300.5 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction0546', number: '0546',
    limits: { minWidth: 399.5, minHeight: 199.5, maxWidth: 2560.5, maxHeight: 1300.5 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction0547', number: '0547',
    limits: { minWidth: 400.5, minHeight: 200.5, maxWidth: 2561.5, maxHeight: 1301.5 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction0548', number: '0548',
    limits: { minWidth: 2560.999, minHeight: 1300.999, maxWidth: 2560.999, maxHeight: 1300.999 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction0549', number: '0549',
    limits: { minWidth: 400.001, minHeight: 200.001, maxWidth: 400.001, maxHeight: 200.001 }, forcible: false
  },
  {
    name: 'testModuleJsonEqualOrCorner0550', number: '0550',
    limits: { minWidth: 400, minHeight: 200, maxWidth: 400, maxHeight: 200 }, forcible: false
  },
  {
    name: 'testModuleJsonEqualOrCorner0551', number: '0551',
    limits: { minWidth: 2560, minHeight: 1300, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonEqualOrCorner0552', number: '0552',
    limits: { minWidth: 400, minHeight: 1300, maxWidth: 400, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonEqualOrCorner0553', number: '0553',
    limits: { minWidth: 2560, minHeight: 200, maxWidth: 2560, maxHeight: 200 }, forcible: false
  },
  {
    name: 'testModuleJsonEqualOrCorner0554', number: '0554',
    limits: { minWidth: 400, minHeight: 200, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonEqualOrCorner0555', number: '0555',
    limits: { minWidth: 2560, minHeight: 1300, maxWidth: 400, maxHeight: 200 }, forcible: false
  },
  {
    name: 'testModuleJsonEqualOrCorner0556', number: '0556',
    limits: { minWidth: 401, minHeight: 201, maxWidth: 401, maxHeight: 201 }, forcible: false
  },
  {
    name: 'testModuleJsonEqualOrCorner0557', number: '0557',
    limits: { minWidth: 2559, minHeight: 1299, maxWidth: 2559, maxHeight: 1299 }, forcible: false
  },
  {
    name: 'testModuleJsonEqualOrCorner0558', number: '0558',
    limits: { minWidth: 399, minHeight: 199, maxWidth: 399, maxHeight: 199 }, forcible: false
  },
  {
    name: 'testModuleJsonEqualOrCorner0559', number: '0559',
    limits: { minWidth: 2561, minHeight: 1301, maxWidth: 2561, maxHeight: 1301 }, forcible: false
  },
  {
    name: 'testModuleJsonEqualOrCorner0560', number: '0560',
    limits: { minWidth: 400, minHeight: 1300, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonEqualOrCorner0561', number: '0561',
    limits: { minWidth: 400, minHeight: 200, maxWidth: 400, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonEqualOrCorner0562', number: '0562',
    limits: { minWidth: 2560, minHeight: 200, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonEqualOrCorner0563', number: '0563',
    limits: { minWidth: 400, minHeight: 700, maxWidth: 2560, maxHeight: 700 }, forcible: false
  },
  {
    name: 'testModuleJsonEqualOrCorner0564', number: '0564',
    limits: { minWidth: 1200, minHeight: 200, maxWidth: 1200, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonShiftedGrid0565', number: '0565',
    limits: { minWidth: 450, maxWidth: 2500 }, forcible: false
  },
  {
    name: 'testModuleJsonShiftedGrid0566', number: '0566',
    limits: { minWidth: 450, maxWidth: 2300 }, forcible: false
  },
  {
    name: 'testModuleJsonShiftedGrid0567', number: '0567',
    limits: { minWidth: 450, maxWidth: 2100 }, forcible: false
  },
  {
    name: 'testModuleJsonShiftedGrid0568', number: '0568',
    limits: { minWidth: 450, maxWidth: 1900 }, forcible: false
  },
  {
    name: 'testModuleJsonShiftedGrid0569', number: '0569',
    limits: { minWidth: 450, maxWidth: 1700 }, forcible: false
  },
  {
    name: 'testModuleJsonShiftedGrid0570', number: '0570',
    limits: { minWidth: 650, maxWidth: 2500 }, forcible: false
  },
  {
    name: 'testModuleJsonShiftedGrid0571', number: '0571',
    limits: { minWidth: 650, maxWidth: 2300 }, forcible: false
  },
  {
    name: 'testModuleJsonShiftedGrid0572', number: '0572',
    limits: { minWidth: 650, maxWidth: 2100 }, forcible: false
  },
  {
    name: 'testModuleJsonShiftedGrid0573', number: '0573',
    limits: { minWidth: 650, maxWidth: 1900 }, forcible: false
  },
  {
    name: 'testModuleJsonShiftedGrid0574', number: '0574',
    limits: { minWidth: 650, maxWidth: 1700 }, forcible: false
  },
  {
    name: 'testModuleJsonShiftedGrid0575', number: '0575',
    limits: { minWidth: 850, maxWidth: 2500 }, forcible: false
  },
  {
    name: 'testModuleJsonShiftedGrid0576', number: '0576',
    limits: { minWidth: 850, maxWidth: 2300 }, forcible: false
  },
  {
    name: 'testModuleJsonShiftedGrid0577', number: '0577',
    limits: { minWidth: 850, maxWidth: 2100 }, forcible: false
  },
  {
    name: 'testModuleJsonShiftedGrid0578', number: '0578',
    limits: { minWidth: 850, maxWidth: 1900 }, forcible: false
  },
  {
    name: 'testModuleJsonShiftedGrid0579', number: '0579',
    limits: { minWidth: 850, maxWidth: 1700 }, forcible: false
  },
  {
    name: 'testModuleJsonShiftedGrid0580', number: '0580',
    limits: { minWidth: 1050, maxWidth: 2500 }, forcible: false
  },
  {
    name: 'testModuleJsonShiftedGrid0581', number: '0581',
    limits: { minWidth: 1050, maxWidth: 2300 }, forcible: false
  },
  {
    name: 'testModuleJsonShiftedGrid0582', number: '0582',
    limits: { minWidth: 1050, maxWidth: 2100 }, forcible: false
  },
  {
    name: 'testModuleJsonShiftedGrid0583', number: '0583',
    limits: { minWidth: 1050, maxWidth: 1900 }, forcible: false
  },
  {
    name: 'testModuleJsonShiftedGrid0584', number: '0584',
    limits: { minWidth: 1050, maxWidth: 1700 }, forcible: false
  },
  {
    name: 'testModuleJsonShiftedGrid0585', number: '0585',
    limits: { minWidth: 1250, maxWidth: 2500 }, forcible: false
  },
  {
    name: 'testModuleJsonShiftedGrid0586', number: '0586',
    limits: { minWidth: 1250, maxWidth: 2300 }, forcible: false
  },
  {
    name: 'testModuleJsonShiftedGrid0587', number: '0587',
    limits: { minWidth: 1250, maxWidth: 2100 }, forcible: false
  },
  {
    name: 'testModuleJsonShiftedGrid0588', number: '0588',
    limits: { minWidth: 1250, maxWidth: 1900 }, forcible: false
  },
  {
    name: 'testModuleJsonShiftedGrid0589', number: '0589',
    limits: { minWidth: 1250, maxWidth: 1700 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction20590', number: '0590',
    limits: { minWidth: 450.5, minHeight: 250.5, maxWidth: 2500.5, maxHeight: 1250.5 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction20591', number: '0591',
    limits: { minWidth: 650.5, minHeight: 350.5, maxWidth: 2350.5, maxHeight: 1200.5 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction20592', number: '0592',
    limits: { minWidth: 850.5, minHeight: 450.5, maxWidth: 2150.5, maxHeight: 1150.5 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction20593', number: '0593',
    limits: { minWidth: 1050.5, minHeight: 550.5, maxWidth: 1950.5, maxHeight: 1100.5 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction20594', number: '0594',
    limits: { minWidth: 1250.5, minHeight: 650.5, maxWidth: 1750.5, maxHeight: 1050.5 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction20595', number: '0595',
    limits: { minWidth: 500.25, minHeight: 300.25, maxWidth: 2000.25, maxHeight: 1000.25 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction20596', number: '0596',
    limits: { minWidth: 700.75, minHeight: 400.75, maxWidth: 1800.75, maxHeight: 900.75 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction20597', number: '0597',
    limits: { minWidth: 900.5, minHeight: 500.5, maxWidth: 2100.5, maxHeight: 1250.5 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction20598', number: '0598',
    limits: { minWidth: 1100.5, minHeight: 700.5, maxWidth: 2300.5, maxHeight: 1300.5 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction20599', number: '0599',
    limits: { minWidth: 1300.5, minHeight: 800.5, maxWidth: 2560.5, maxHeight: 1300.5 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction20600', number: '0600',
    limits: { minWidth: 400, minHeight: 200, maxWidth: 2560.5, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction20601', number: '0601',
    limits: { minWidth: 400.5, minHeight: 200.5, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction20602', number: '0602',
    limits: { minWidth: 1500.5, minHeight: 900.5, maxWidth: 2200.5, maxHeight: 1200.5 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction20603', number: '0603',
    limits: { minWidth: 1750.5, minHeight: 1000.5, maxWidth: 2450.5, maxHeight: 1250.5 }, forcible: false
  },
  {
    name: 'testModuleJsonFraction20604', number: '0604',
    limits: { minWidth: 1950.5, minHeight: 1100.5, maxWidth: 2550.5, maxHeight: 1300.5 }, forcible: false
  },
  {
    name: 'testModuleJsonCorner20605', number: '0605',
    limits: { minWidth: 450, minHeight: 250, maxWidth: 450, maxHeight: 250 }, forcible: false
  },
  {
    name: 'testModuleJsonCorner20606', number: '0606',
    limits: { minWidth: 2500, minHeight: 1250, maxWidth: 2500, maxHeight: 1250 }, forcible: false
  },
  {
    name: 'testModuleJsonCorner20607', number: '0607',
    limits: { minWidth: 450, minHeight: 1250, maxWidth: 450, maxHeight: 1250 }, forcible: false
  },
  {
    name: 'testModuleJsonCorner20608', number: '0608',
    limits: { minWidth: 2500, minHeight: 250, maxWidth: 2500, maxHeight: 250 }, forcible: false
  },
  {
    name: 'testModuleJsonCorner20609', number: '0609',
    limits: { minWidth: 450, minHeight: 250, maxWidth: 2500, maxHeight: 1250 }, forcible: false
  },
  {
    name: 'testModuleJsonCorner20610', number: '0610',
    limits: { minWidth: 2500, minHeight: 1250, maxWidth: 450, maxHeight: 250 }, forcible: false
  },
  {
    name: 'testModuleJsonCorner20611', number: '0611',
    limits: { minWidth: 500, minHeight: 300, maxWidth: 500, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonCorner20612', number: '0612',
    limits: { minWidth: 2560, minHeight: 300, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonCorner20613', number: '0613',
    limits: { minWidth: 700, minHeight: 200, maxWidth: 1700, maxHeight: 200 }, forcible: false
  },
  {
    name: 'testModuleJsonCorner20614', number: '0614',
    limits: { minWidth: 900, minHeight: 1300, maxWidth: 1900, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonCorner20615', number: '0615',
    limits: { minWidth: 1200, minHeight: 650, maxWidth: 1200, maxHeight: 650 }, forcible: false
  },
  {
    name: 'testModuleJsonMinWSweep0616', number: '0616',
    limits: { minWidth: 400 }, forcible: false
  },
  {
    name: 'testModuleJsonMinWSweep0617', number: '0617',
    limits: { minWidth: 401 }, forcible: false
  },
  {
    name: 'testModuleJsonMinWSweep0618', number: '0618',
    limits: { minWidth: 599 }, forcible: false
  },
  {
    name: 'testModuleJsonMinWSweep0619', number: '0619',
    limits: { minWidth: 600 }, forcible: false
  },
  {
    name: 'testModuleJsonMinWSweep0620', number: '0620',
    limits: { minWidth: 900 }, forcible: false
  },
